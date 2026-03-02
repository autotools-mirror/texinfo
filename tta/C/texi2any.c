/* texi2any.c -- conversion of Texinfo

   Copyright 2010-2026 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* ALTIMP ../perl/texi2any.pl */

/* includes config.h */
#include <system.h>

#include <stdlib.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>
#include <stdarg.h>
#include <sys/stat.h>
#include <errno.h>
/* from Gnulib codeset.m4 */
#ifdef HAVE_LANGINFO_CODESET
#include <langinfo.h>
#endif
#include <locale.h>
#ifdef ENABLE_NLS
#include <libintl.h>
#endif
/* for pgettext and to have a definition of gettext in case ENABLE_NLS
   is not set */
#include "gettext.h"
#include <getopt.h>
#ifdef _WIN32
/* for GetACP */
/* Set WIN32_LEAN_AND_MEAN for a more minimal set of includes to avoid
   clashing symbol names */
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#endif

#include "text.h"
#include "use_interpreter_types.h"
#include "option_types.h"
#include "document_types.h"
#include "converter_types.h"
/* read_var_len */
#include "base_utils.h"
/* for xvasprintf */
#include "text.h"
/* parse_file_path whitespace_chars xasprintf digit_chars encode_with_iconv
   wipe_values locate_file_in_dirs */
#include "utils.h"
#include "errors.h"
#include "customization_options.h"
#include "txi_config.h"
/* tree_print_details */
#include "manipulate_tree.h"
/* set_document_options */
#include "document.h"
#include "convert_to_texinfo.h"
/* needed because commands are used to determine expanded regions names */
#include "builtin_commands.h"
/* output_files_open_out output_files_register_closed */
#include "convert_utils.h"
/* destroy_converter_initialization_info new_converter_initialization_info
   encoded_output_file_name */
#include "converter.h"
/* for html_output_internal_links */
#include "html_converter_api.h"
#include "texinfo.h"

#define _(String) gettext (String)

/* similar definitions in info system.h */
#if O_BINARY
# ifdef __CYGWIN__
#  define PATH_SEP     ":"
# else  /* O_BINARY && !__CYGWIN__ */
#  define PATH_SEP     ";"
# endif /* O_BINARY && !__CYGWIN__ */
#else  /* not O_BINARY, i.e., Unix */
# define PATH_SEP      ":"
#endif /* not O_BINARY */

static const char *conf_file_name = "texi2any-config.pm";

typedef struct FORMAT_COMMAND_LINE_NAME {
    const char *command_line_name;
    const char *output_name;
} FORMAT_COMMAND_LINE_NAME;

static FORMAT_COMMAND_LINE_NAME format_command_line_names[] = {
 {"xml", "texinfoxml"},
 {NULL, NULL},
};

typedef struct FORMAT_REGION_NAME {
    const char *output_name;
    const char *region_name;
} FORMAT_REGION_NAME;

static FORMAT_REGION_NAME converter_format_expanded_region_name[] = {
  {"texinfoxml", "xml"},
  {NULL, NULL},
};

typedef struct FORMAT_SPECIFICATION {
    const char *name;
    unsigned long flags;
    const char *converted_format;
    /* Perl module name */
    const char *module;
    const char *init_file;
} FORMAT_SPECIFICATION;

static FORMAT_SPECIFICATION formats_table[] = {
  {"info", STTF_nodes_tree | STTF_floats
           | STTF_setup_index_entries_sort_strings,
   NULL, "Texinfo::Convert::Info", NULL},
  {"html", STTF_relate_index_entries_to_table_items
           | STTF_move_index_entries_after_items
           | STTF_no_warn_non_empty_parts
           | STTF_nodes_tree | STTF_floats | STTF_split
           | STTF_setup_index_entries_sort_strings
           | STTF_internal_links,
   NULL, "Texinfo::Convert::HTML", NULL},
  {"plaintext", STTF_nodes_tree | STTF_floats | STTF_split
                | STTF_setup_index_entries_sort_strings,
   NULL, "Texinfo::Convert::Plaintext", NULL},
  {"latex", STTF_floats | STTF_move_index_entries_after_items
            | STTF_no_warn_non_empty_parts,
   NULL, "Texinfo::Convert::LaTeX", NULL},
  {"docbook", STTF_move_index_entries_after_items
              | STTF_no_warn_non_empty_parts,
   NULL, "Texinfo::Convert::DocBook", NULL},
  {"epub3", 0, "html", NULL, "epub3.pm"},
  {"texinfoxml", STTF_nodes_tree,
   NULL, "Texinfo::Convert::TexinfoXML", NULL},
  {"pdf", STTF_texi2dvi_format, NULL, NULL, NULL},
  {"ps", STTF_texi2dvi_format, NULL, NULL, NULL},
  {"dvi", STTF_texi2dvi_format, NULL, NULL, NULL},
  {"dvipdf", STTF_texi2dvi_format, NULL, NULL, NULL},
  {"debugtree", STTF_split,
   NULL, "Texinfo::DebugTree", NULL},
  {"textcontent", 0, NULL, "Texinfo::Convert::TextContent", NULL},
  {"plaintexinfo", 0, NULL, NULL, NULL},
  {"rawtext", 0, NULL, NULL, NULL},
  {"parse", 0, NULL, NULL, NULL},
  {"structure", STTF_nodes_tree | STTF_floats | STTF_split, NULL, NULL, NULL},
  {NULL, 0, NULL, NULL, NULL}
};

static VALUE_LIST values;

/* options common to parser and converter */
static OPTIONS_LIST program_options;
static OPTIONS_LIST cmdline_options;
static OPTIONS_LIST *init_files_options;

static char *program_file;

static enum interpreter_use embedded_interpreter
   = txi_interpreter_use_no_interpreter;

/* texi2any */
static void
add_config_paths (const char *env_string, const char *subdir,
                  /* unused in Perl
                  const STRING_LIST *default_base_dirs,
                   */
                  const char *installation_dir,
                  const DEPRECATED_DIRS_LIST *overriding_dirs,
                  STRING_LIST *result_dirs,
                  DEPRECATED_DIRS_LIST *deprecated_dirs)
{
  static STRING_LIST xdg_result_dirs;
  size_t i;
  /*
   read the env directories to avoid setting the overriding_dirs
   as deprecated if they are explicitely specified in the environnement
   variable.
   */
  const char *env_value = getenv (env_string);
  if (env_value && strlen (env_value))
    {
      char *text = strdup (env_value);
      char *dir = strtok (text, PATH_SEP);

      while (dir)
        {
          if (strlen (dir))
            {
              add_include_directory (dir, &xdg_result_dirs);
            }
          dir = strtok (NULL, PATH_SEP);
        }
      free (text);
    }

  if (installation_dir)
    {
      char *install_result_dir;
      xasprintf (&install_result_dir, "%s/%s", installation_dir, subdir);
      add_string (install_result_dir, result_dirs);
      if (overriding_dirs)
        {
          DEPRECATED_DIR_INFO *deprecated_dir_info
            = find_deprecated_dir_info (overriding_dirs, installation_dir);

          if (deprecated_dir_info)
            {
              char *deprecated_result_dir;
              xasprintf (&deprecated_result_dir, "%s/%s",
                         deprecated_dir_info->obsolete_dir, subdir);
              if (!find_string (&xdg_result_dirs,
                                deprecated_dir_info->obsolete_dir))
                {
                  add_new_deprecated_dir_info (deprecated_dirs,
                                   deprecated_dir_info->obsolete_dir,
                                   deprecated_dir_info->reference_dir);
                  add_string (deprecated_result_dir, result_dirs);
                }
              free (deprecated_result_dir);
            }
        }
      free (install_result_dir);
    }

  for (i = 0; i < xdg_result_dirs.number; i++)
    {
      char *dir = xdg_result_dirs.list[i];
      if (!find_string (result_dirs, dir))
        {
          char *result_dir;
          xasprintf (&result_dir, "%s/%s", dir, subdir);
          add_string (result_dir, result_dirs);
          free (result_dir);
        }
      free (dir);
    }

  xdg_result_dirs.number = 0;
}

#define XDG_SYSCONFDIR SYSCONFDIR "/xdg"

static DEPRECATED_DIR_INFO overriding_sysconfdir_info[1] = {
  {XDG_SYSCONFDIR, SYSCONFDIR} };
static const DEPRECATED_DIRS_LIST overriding_sysconfdir_list = {
  1, 1, overriding_sysconfdir_info };

static STRING_LIST *
set_subdir_directories (const char *datadir, const char *subdir,
                        DEPRECATED_DIRS_LIST *deprecated_dirs)
{
  STRING_LIST *result = new_string_list ();
  STRING_LIST *config_dirs = new_string_list ();
  char *dir_string;
  char *xdg_config_home;

  xasprintf (&dir_string, ".%s", subdir);
  add_string (dir_string, result);
  free (dir_string);

  xdg_config_home = getenv ("XDG_CONFIG_HOME");
  if (xdg_config_home && strlen (xdg_config_home))
    {
      xasprintf (&dir_string, "%s/%s", xdg_config_home, subdir);
      add_string (dir_string, result);
      free (dir_string);
    }
  else
    {
      const char *home_dir = getenv ("HOME");
      if (home_dir)
        {
          char *deprecated_config_home;
          xasprintf (&dir_string, "%s/%s/%s", home_dir, ".config", subdir);
          xasprintf (&deprecated_config_home, "%s/.%s", home_dir, subdir);
          add_new_deprecated_dir_info (deprecated_dirs,
                                   deprecated_config_home, dir_string);
          add_string (dir_string, result);
          free (dir_string);
          add_string (deprecated_config_home, result);
          free (deprecated_config_home);
        }
    }

  add_config_paths ("XDG_CONFIG_DIRS", subdir, XDG_SYSCONFDIR,
                    &overriding_sysconfdir_list, config_dirs, deprecated_dirs);

  merge_strings (result, config_dirs);

  free (config_dirs->list);
  free (config_dirs);

  xasprintf (&dir_string, "%s/%s", datadir, subdir);
  add_string (dir_string, result);
  free (dir_string);

  return result;
}

static void
set_format (const char *format_name)
{
  size_t i;
  const char *new_output_format = 0;
  int format_found = 0;

  for (i = 0; format_command_line_names[i].command_line_name; i++)
    {
      if (!strcmp (format_command_line_names[i].command_line_name,
                   format_name))
        {
          new_output_format = format_command_line_names[i].output_name;
          break;
        }
    }

  if (!new_output_format)
    new_output_format = format_name;

  for (i = 0; formats_table[i].name; i++)
    {
      if (!strcmp (formats_table[i].name, new_output_format))
        {
          format_found = 1;
          break;
        }
    }
  if (!format_found)
    {
      txi_config_document_warn (
             "ignoring unrecognized TEXINFO_OUTPUT_FORMAT value `%s'",
                     format_name);
    }
  else
    GNUT_set_from_init_file ("TEXINFO_OUTPUT_FORMAT", new_output_format);
}

static void
get_cmdline_customization_option (OPTIONS_LIST *options_list,
                                  char *text)
{
  size_t identifier_len = read_var_len (text);
  if (identifier_len > 0)
    {
      char *option_name = strndup (text, identifier_len);
      OPTION *option = find_option_string (options_list->sorted_options,
                                           option_name);

      if (option)
        {
          char *p = text + identifier_len;
          p += strspn (p, whitespace_chars);
          if (*p == '=')
            {
              p++;
              p += strspn (p, whitespace_chars);
            }

          if (!strcmp (option_name, "TEXINFO_OUTPUT_FORMAT"))
            {
              char *option_value = GNUT_decode_input (p);
              set_format (option_value);
              free (option_value);
            }
          else
            {
              if (!strcasecmp (p, "undef"))
                {
                  clear_option (option);
                  options_list_add_option_number (options_list, option->number);
                }
              else
                {
                  char *option_value = p;
                  if (option->type == GOT_char)
                    option_value = GNUT_decode_input (p);

                  GNUT_set_from_cmdline (options_list, option->number,
                                         option_value);

                  if (option->type == GOT_char)
                    free (option_value);
                }
            }
        }
      else
        {
          /* in Perl obsolete options may get another error message */
          txi_config_document_warn ("unknown variable from command line: %s",
                         option_name);
        }
      free (option_name);
    }
}

static void
push_include_directory (STRING_LIST *include_dirs_list, char *text)
{
  char *dir = strtok (text, PATH_SEP);

  while (dir)
    {
      if (strlen (dir))
        {
          add_include_directory (dir, include_dirs_list);
        }
      dir = strtok (NULL, PATH_SEP);
    }
}

static void
set_expansion (OPTIONS_LIST *options_list, STRING_LIST *ignored_formats,
               const char *format_name)
{
  OPTION *option = &options_list->options->EXPANDED_FORMATS;
  size_t ignored_idx = find_string (ignored_formats, format_name);

  txi_config_add_to_option_list (option, format_name, 0);

  if (ignored_idx)
    remove_from_strings_list (ignored_formats, ignored_idx -1);
}

static void
unset_expansion (OPTIONS_LIST *options_list, STRING_LIST *ignored_formats,
                 const char *format_name)
{
  OPTION *option = &options_list->options->EXPANDED_FORMATS;
  size_t ignored_idx = find_string (ignored_formats, format_name);

  txi_config_remove_from_option_list (option, format_name);

  if (!ignored_idx)
    add_string (format_name, ignored_formats);
}

static void
format_expanded_formats (STRING_LIST *default_expanded_formats,
                         FORMAT_SPECIFICATION *format_specification,
                         STRING_LIST *texi2dvi_args, int *call_texi2dvi)
{
  const char *converter_format;
  const char *expanded_region = 0;
  size_t i;

  if (format_specification->flags & STTF_texi2dvi_format)
    {
      char *format_option;

      *call_texi2dvi = 1;
      xasprintf (&format_option, "--%s",
                 format_specification->name);
      add_string (format_option, texi2dvi_args);
      free (format_option);

      converter_format = "tex";
    }
  else if (format_specification->converted_format)
    converter_format = format_specification->converted_format;
  else
    converter_format = format_specification->name;

  for (i = 0; converter_format_expanded_region_name[i].output_name; i++)
    {
      if (!strcmp (converter_format,
                   converter_format_expanded_region_name[i].output_name))
        {
          expanded_region
            = converter_format_expanded_region_name[i].region_name;
          break;
        }
    }

  if (!expanded_region)
    expanded_region = converter_format;

  if (!strcmp (expanded_region, "plaintext"))
    {
      add_string (expanded_region, default_expanded_formats);
      add_string ("info", default_expanded_formats);
    }
  /* Texinfo::Common::texinfo_output_formats */
  else
    {
      const char *expanded_format = 0;
      if (!strcmp (expanded_region, "info"))
        expanded_format = expanded_region;
      else
        {
          enum command_id cmd = lookup_builtin_command (expanded_region);
          if (cmd && builtin_command_data[cmd].flags & CF_block
              && builtin_command_data[cmd].data == BLOCK_format_raw)
            expanded_format = expanded_region;
        }
      if (expanded_format)
        add_string (expanded_format, default_expanded_formats);
    }
}

static void
set_cmdline_format (const char *format_name)
{
  GNUT_set_from_cmdline (&cmdline_options,
                    cmdline_options.options->TEXINFO_OUTPUT_FORMAT.number,
                    format_name);
}

/* If the file overwriting becomes an error, should increase $ERROR_COUNT. */
static size_t
merge_opened_files (STRING_LIST *opened_files,
                    STRING_LIST *added_opened_files, size_t error_count)
{
  if (added_opened_files)
    {
      size_t i;
      for (i = 0; i < added_opened_files->number; i++)
        {
          char *opened_file = added_opened_files->list[i];
          if (find_string (opened_files, opened_file))
            txi_config_document_warn ("overwriting file: %s", opened_file);
          else
            add_string (opened_file, opened_files);
        }
    }

  return error_count;
}

static void
exit_if_errors (size_t error_count, STRING_LIST *opened_files)
{
  OPTION *error_limit_option
     = GNUT_get_conf (program_options.options->ERROR_LIMIT.number);
  OPTION *force_option
     = GNUT_get_conf (program_options.options->FORCE.number);
  int force = (force_option->o.integer > 0);
  /* implicit conversion */
  size_t error_limit = error_limit_option->o.integer;

  if (opened_files->number > 0 && error_count && !force)
    {
      size_t i;
      for (i = opened_files->number; i > 0 ; i--)
        {
          size_t index = i - 1;
          char *opened_file = strdup (opened_files->list[index]);
          unlink (opened_file);
          remove_from_strings_list (opened_files, index);
          free (opened_file);
        }
    }

  if ((error_count && !force) || error_count > error_limit)
    exit (EXIT_FAILURE);
}

static size_t
handle_errors (size_t additional_error_count, size_t error_count,
               STRING_LIST *opened_files)
{
  error_count += additional_error_count;
  exit_if_errors (error_count, opened_files);
  return error_count;
}

static size_t
handle_parser_errors (DOCUMENT *document, const char *set_message_encoding,
                      int no_warn, int test_mode_set, size_t error_count,
                      STRING_LIST *opened_files)
{
  size_t errors_nr
        = txi_output_parser_error_messages (document, set_message_encoding,
                                            no_warn, test_mode_set);
  return handle_errors (errors_nr, error_count, opened_files);
}

/* NOTE could also have used strtol */
static int
is_ascii_digit (const char *text)
{
  const char *p = text;
  size_t digits_nr = strspn (text, digit_chars);

  if (digits_nr)
    {
      p += digits_nr;
      if (!*p)
        return 1;
    }
  return 0;
}

/* warn and also clear deprecated_dirs_used */
static void
warn_deprecated_dirs (DEPRECATED_DIRS_LIST *deprecated_dirs_used)
{
  if (deprecated_dirs_used->number)
    {
      size_t i;
      for (i = 0; i < deprecated_dirs_used->number; i++)
        {
          char *dir_name, *replacement_dir;
          DEPRECATED_DIR_INFO *deprecated_dir_info
           = &deprecated_dirs_used->list[i];
          dir_name = GNUT_decode_input (deprecated_dir_info->obsolete_dir);
          replacement_dir
            = GNUT_decode_input (deprecated_dir_info->reference_dir);

          txi_config_document_warn (
                    "%s directory is deprecated. Use %s instead",
                         dir_name, replacement_dir);

          free (dir_name);
          free (replacement_dir);
          free (deprecated_dir_info->obsolete_dir);
          free (deprecated_dir_info->reference_dir);
        }
    }
  deprecated_dirs_used->number = 0;
}

int loaded_init_files_nr = 0;

static void
locate_and_load_init_file (const char *filename, STRING_LIST *directories,
                           DEPRECATED_DIRS_LIST *deprecated_dirs)
{
  static DEPRECATED_DIRS_LIST deprecated_dirs_used;

  char *file = locate_file_in_dirs (filename, directories, 0,
                                    deprecated_dirs, &deprecated_dirs_used);

  if (file)
    {
      int status = txi_load_init_file (file, embedded_interpreter);

      if (status)
        loaded_init_files_nr++;
      else
        {
          char *decoded_filename = GNUT_decode_input ((char *) filename);
          if (embedded_interpreter != txi_interpreter_use_embedded)
            fprintf (stderr, "WARNING: no interpreter, cannot load: %s\n",
                     filename);
          else
            fprintf (stderr, "ERROR: could not load: %s\n",
                     filename);
          free (decoded_filename);
        }
      free (file);
    }
  else
    {
      char *decoded_filename = GNUT_decode_input ((char *) filename);
      txi_config_document_warn ("could not read init file %s",
                                decoded_filename);

      free (decoded_filename);
    }

  if (deprecated_dirs)
    warn_deprecated_dirs (&deprecated_dirs_used);
}

static void
locate_and_load_extension_file (const char *filename, STRING_LIST *directories)
{
  char *file = locate_file_in_dirs (filename, directories, 0, 0, 0);

  if (file)
    {
      int status = txi_load_init_file (file, embedded_interpreter);

      if (status)
        loaded_init_files_nr++;
      else
        {
          char *decoded_filename = GNUT_decode_input ((char *) filename);
          if (embedded_interpreter != txi_interpreter_use_embedded)
            fprintf (stderr, "WARNING: no interpreter, cannot load: %s\n",
                     filename);
          else
            fprintf (stderr, "ERROR: could not load: %s\n",
                     filename);
          free (decoded_filename);
        }
      free (file);
    }
  else
    {
      char *decoded_filename = GNUT_decode_input ((char *) filename);
      txi_config_document_warn ("could not read extension file %s",
                                decoded_filename);

      free (decoded_filename);
      exit (EXIT_FAILURE);
    }
}

static void
write_to_file (char *output_text, FILE *file_fh,
               const char *encoded_file_name)
{
  size_t write_len;
  size_t res_len;
  const ENCODING_CONVERSION *conversion = 0;
  char *result_text = 0;
  OPTION *out_encoding_option
      = GNUT_get_conf (program_options.options->OUTPUT_ENCODING_NAME.number);
  if (out_encoding_option && out_encoding_option->o.string
      && strcmp (out_encoding_option->o.string, "utf-8"))
    {
      conversion
        = get_encoding_conversion (out_encoding_option->o.string,
                                   &output_conversions);
      if (conversion)
        result_text = encode_with_iconv (conversion->iconv,
                                         output_text, 0, ieh_error, 0);
    }

  if (!result_text)
    result_text = output_text;

  res_len = strlen (result_text);

  write_len = fwrite (result_text, sizeof (char),
                      res_len, file_fh);

  if (conversion)
    free (result_text);

  if (write_len != res_len)
    { /* register error message instead? */
       fprintf (stderr,
          "ERROR: write to %s failed (%zu/%zu)\n",
                encoded_file_name, write_len, res_len);
    }
}

typedef struct FORMAT_NAME {
    const char *format;
    const char *name;
} FORMAT_NAME;

static const FORMAT_NAME format_names[] = {
  {"info", "Info"},
  {"html", "HTML"},
  {"docbook", "DocBook"},
  {"epub3", "EPUB 3"},
  {"plaintext", "Plain Text"},
  {"texinfoxml", "Texinfo XML"},
  {NULL, NULL},
};

static const char *
name_of_format (const char *format)
{
  int i;

  for (i = 0; format_names[i].format; i++)
    {
      if (!strcmp (format, format_names[i].format))
        return format_names[i].name;
    }

  return format;
}

const char *input_file_suffixes[] = {
".txi",".texinfo",".texi",".txinfo", "", NULL
};

/* If non-zero, show help and exit */
static int print_help_p;

#define DOCUMENT_LANGUAGE_OPT 2
#define NO_SPLIT_OPT 3
#define SPLIT_OPT 4
#define FOOTNOTE_STYLE_OPT 5
#define IFDOCBOOK_OPT 6
#define NO_IFDOCBOOK_OPT 7
#define IFINFO_OPT 8
#define NO_IFINFO_OPT 9
#define IFHTML_OPT 10
#define NO_IFHTML_OPT 11
#define IFLATEX_OPT 12
#define NO_IFLATEX_OPT 13
#define IFPLAINTEXT_OPT 14
#define NO_IFPLAINTEXT_OPT 15
#define IFTEX_OPT 16
#define NO_IFTEX_OPT 17
#define IFXML_OPT 18
#define NO_IFXML_OPT 19
#define NO_WARN_OPT 20
#define _FORMAT_OPT 21
#define XML_OPT 22
#define INTERNAL_LINKS_OPT 23
#define NO_MIMICKING_OPT 24
#define XOPT_OPT 25
#define _SILENT_OPT 26
/* can add here */
#define TRACE_INCLUDES_OPT 33
#define NO_VERBOSE_OPT 34
#define HEADERS_OPT 35
#define NO_HEADERS_OPT 36
#define NUMBER_SECTIONS_OPT 37
#define NO_NUMBER_SECTIONS_OPT 38
#define ENABLE_ENCODING_OPT 39
#define DISABLE_ENCODING_OPT 40
#define NUMBER_FOOTNOTES_OPT 41
#define NO_NUMBER_FOOTNOTES_OPT 42
#define NODE_FILES_OPT 43
#define NO_NODE_FILES_OPT 44
#define TRANSLITERATE_FILE_NAMES_OPT 45
#define NO_TRANSLITERATE_FILE_NAMES_OPT 46
#define SPLIT_SIZE_OPT 47
#define DEBUG_OPT 48
#define NO_VALIDATE_OPT 49
#define CSS_INCLUDE_OPT 50
#define CSS_REF_OPT 51
#define CONF_DIR_OPT 52
#define INIT_FILE_OPT 53

#define IFFORMAT_TABLE(upcase, name) \
  {"if" #name, 0, 0, IF ## upcase ## _OPT}, \
  {"no-if" #name, 0, 0, NO_IF ## upcase ## _OPT},

static struct option long_options[] = {
  /* next not in texi2any */
  {"no-mimicking", 0, 0, NO_MIMICKING_OPT},

  {"conf-dir", required_argument, 0, CONF_DIR_OPT},
  {"css-include", required_argument, 0, CSS_INCLUDE_OPT},
  {"css-ref", required_argument, 0, CSS_REF_OPT},
  {"debug", required_argument, 0, DEBUG_OPT},
  {"disable-encoding", 0, 0, DISABLE_ENCODING_OPT},
  {"document-language", required_argument, 0, DOCUMENT_LANGUAGE_OPT},
  {"enable-encoding", 0, 0, ENABLE_ENCODING_OPT},
  {"error-limit", required_argument, 0, 'e'},
  {"fill-column", required_argument, 0, 'f'},
  {"footnote-style", required_argument, 0, FOOTNOTE_STYLE_OPT},
  {"force", 0, 0, 'F'},
  {"headers", 0, 0, HEADERS_OPT},
  {"no-headers", 0, 0, NO_HEADERS_OPT},
  {"help", 0, 0, 'h'},
  {"init-file", required_argument, 0, INIT_FILE_OPT},
  {"internal-links", required_argument, 0, INTERNAL_LINKS_OPT},
  {"macro-expand", required_argument, 0, 'E'},
  {"node-files", 0, 0, NODE_FILES_OPT},
  {"no-node-files", 0, 0, NO_NODE_FILES_OPT},
  {"number-footnotes", 0, 0, NUMBER_FOOTNOTES_OPT},
  {"no-number-footnotes", 0, 0, NO_NUMBER_FOOTNOTES_OPT},
  {"number-sections", 0, 0, NUMBER_SECTIONS_OPT},
  {"no-number-sections", 0, 0, NO_NUMBER_SECTIONS_OPT},
  {"paragraph-indent", required_argument, 0, 'p'},
  {"no-warn", 0, 0, NO_WARN_OPT},
  {"out", required_argument, 0, 'o'},
  {"output", required_argument, 0, 'o'},
  {"no-split", 0, 0, NO_SPLIT_OPT},
  {"split", required_argument, 0, SPLIT_OPT},
  {"set-customization-variable", required_argument, 0, 'c'},
  {"split-size", required_argument, 0, SPLIT_SIZE_OPT},
  {"trace-include", 0, 0, TRACE_INCLUDES_OPT},
  {"transliterate-file-names", 0, 0, TRANSLITERATE_FILE_NAMES_OPT},
  {"no-transliterate-file-names", 0, 0, NO_TRANSLITERATE_FILE_NAMES_OPT},
  {"no-validate", 0, 0, NO_VALIDATE_OPT},
  {"no-pointer-validate", 0, 0, NO_VALIDATE_OPT},
  {"verbose", 0, 0, 'v'},
  {"no-verbose", 0, 0, NO_VERBOSE_OPT},
  {"version", 0, 0, 'V'},
  {"Xopt", required_argument, 0, XOPT_OPT},
  {"silent", 0, 0, _SILENT_OPT},
  {"quiet", 0, 0, _SILENT_OPT},
  {"html", 0, 0, _FORMAT_OPT},
  {"plaintext", 0, 0, _FORMAT_OPT},
  {"latex", 0, 0, _FORMAT_OPT},
  {"info", 0, 0, _FORMAT_OPT},
  {"docbook", 0, 0, _FORMAT_OPT},
  {"epub3", 0, 0, _FORMAT_OPT},
  {"xml", 0, 0, XML_OPT},
  {"dvi", 0, 0, _FORMAT_OPT},
  {"dvipdf", 0, 0, _FORMAT_OPT},
  {"ps", 0, 0, _FORMAT_OPT},
  {"pdf", 0, 0, _FORMAT_OPT},
  IFFORMAT_TABLE(DOCBOOK, docbook)
  IFFORMAT_TABLE(INFO, info)
  IFFORMAT_TABLE(HTML, html)
  IFFORMAT_TABLE(LATEX, latex)
  IFFORMAT_TABLE(PLAINTEXT, plaintext)
  IFFORMAT_TABLE(TEX, tex)
  IFFORMAT_TABLE(XML, xml)
  {NULL, 0, NULL, 0}
};
#undef IFFORMAT_TABLE

void
check_integer_option (int option_character, int option_index,
                      const char *optarg)
{
  char *formatted_message;
  char *encoded_message;

  if (is_ascii_digit (optarg))
    return;

  if (option_index > 0) {
    xasprintf (&formatted_message,
        _("%s: value \"%s\" invalid for option %s (number expected)"),
          program_file, optarg, long_options[option_index].name);
  } else {
    xasprintf (&formatted_message,
        _("%s: value \"%s\" invalid for option %c (number expected)"),
          program_file, optarg, option_character);
  }

  encoded_message = GNUT_encode_message (formatted_message);
  free (formatted_message);
  fprintf (stderr, "%s\n", encoded_message);
  free (encoded_message);
  exit (EXIT_FAILURE);
}

static const char *possible_split[] = {
  "chapter", "section", "node", NULL
};

/* we use env in case a Perl interpreter is embedded in order to blindly
   follow the documentation in perlembed, which is not very explicit */
int
main (int argc, char *argv[], char *env[])
{
  int getopt_long_index;
  const char *langinfo_locale_encoding;
  char *locale_encoding = 0;
  char *console_output_encoding = 0;
  const char *input_file_arg;
  int status;
  char *program_file_name_and_directory[2];
  /*
  char *command_directory;
   */
  OPTIONS_LIST parser_options;
  OPTIONS_LIST convert_options;
  /* used except for the first file, to remove some options that are only
     relevant for the first file */
  OPTIONS_LIST non_first_file_cmdline_options;
  /* make sure that non_first_file_cmdline_options was initialized,
     even if a file was skipped */
  int non_first_file_cmdline_initialized = 0;
  size_t errors_count = 0;
  size_t errors_nr;
  STRING_LIST *texinfo_language_config_dirs;
  STRING_LIST ignored_formats;
  STRING_LIST default_expanded_formats;
  STRING_LIST prepend_dirs;
  STRING_LIST reversed_converter_config_dirs;
  STRING_LIST config_init_files;
  CONVERTER_INITIALIZATION_INFO *format_defaults;
  DEPRECATED_DIRS_LIST deprecated_directories;
  char *t2a_srcdir = 0;
  char *t2a_builddir = 0;
  char *datadir = 0;
  OPTION *html_math_option;
  OPTION *highlight_syntax_option;
  OPTION *test_option;
  OPTION *no_warn_option;
  OPTION *format_menu_option;
  OPTION *debug_option;
  OPTION *message_encoding_option;
  OPTION *sort_element_count_option;
  OPTION *tree_transformations_option;
  OPTION *split_option;
  OPTION *show_builtin_css_rules_option;
  int no_warn = 0;
  int test_mode_set = 0;
  int debug = 0;
  size_t i;
  STRING_LIST input_files;
  STRING_LIST opened_files;
  STRING_LIST prepended_include_directories;
  STRING_LIST conf_dirs;
  STRING_LIST converter_config_dirs;
  STRING_LIST converter_init_dirs;
  STRING_LIST *converter_config_dirs_array_ref;
  STRING_LIST internal_extension_dirs;
  STRING_LIST init_file_dirs;
  STRING_LIST texi2dvi_args;
  char *extensions_dir;
  char *texinfo_output_format_env;
  OPTION *output_format_option;
  OPTION *expanded_formats_option;
  const char *output_format;
  const char *converted_format;
  FORMAT_SPECIFICATION *format_specification = 0;
  int do_menu = 0;
  size_t format_menu_option_nr;
  char *conversion_format_menu_default = 0;
  int texinfo_uninstalled = 0;
  char *converter_datadir = 0;
  const char *curdir = ".";
  CONVERTER_INITIALIZATION_INFO *converter_init_info;
  const char *external_module = 0;
  const char *elt_count_external_module = "Texinfo::Convert::TextContent";
  int default_is_html = 1;
  char *init_file_format;
  const char *set_message_encoding = 0;
  const char *version_for_embedded_interpreter_check;
  int call_texi2dvi = 0;
  int Xopt_arg_nr = 0;
  char *texi2dvi = 0;
  unsigned long transformation_flags = 0;
  const char *txi_xs_external_conversion;
  const char *txi_xs_external_formatting;
  FILE_STREAM main_program_unclosed_stdout;
  DEPRECATED_DIRS_LIST deprecated_dirs_used;
  char *perl_embed_env;
  char *texinfo_dev_source_env;
  char *command_directory;
  char *program_basename;
  size_t file_index;
  int remove_references = 0;

  memset (&main_program_unclosed_stdout, 0, sizeof (FILE_STREAM));

  texinfo_dev_source_env = getenv ("TEXINFO_DEV_SOURCE");

  parse_file_path (argv[0], program_file_name_and_directory);
  program_basename = program_file_name_and_directory[0];
  command_directory = program_file_name_and_directory[1];

  program_file = strdup ("texi2any");

  if (texinfo_dev_source_env && strcmp (texinfo_dev_source_env, "0"))
    texinfo_uninstalled = 1;
  else
    {
      /* If the environment variable is not set, check if a built
         file exists in the directory above the directory containing the
         executable.  If so, we are running the uninstalled program.
         Note the uninstalled program is built as .libs/ctexi2any, and
         is always ran via the libtool wrapper script, using the
         absolute file name.
         See the GNU Coding Standards ("Finding Program Files") for
         for guidance on checking whether a program is uninstalled. */
      if (command_directory)
        {
          char *check_file;
          const char *updir_file = "libtexinfo.la";
          int status;
          struct stat finfo;

          xasprintf (&check_file, "%s/../%s", command_directory, updir_file);
          status = stat (check_file, &finfo);
          if (status == 0 && S_ISREG (finfo.st_mode))
            texinfo_uninstalled = 1;
          free (check_file);
        }
    }

#ifdef EMBED_PERL
  embedded_interpreter = txi_interpreter_use_embedded;
  default_is_html = 0;
#endif

  perl_embed_env = getenv ("TEXINFO_C_EMBED_PERL");
  if (perl_embed_env && !strcmp (perl_embed_env, "0"))
    embedded_interpreter = txi_interpreter_use_no_interpreter;

  /* this corresponds to the texi2any.pl BEGIN block and
     Texinfo::ModulePath::init call */
  if (texinfo_uninstalled)
    {
      t2a_srcdir = getenv ("t2a_srcdir");
      if (t2a_srcdir)
        t2a_srcdir = strdup (t2a_srcdir);
      else
        {
          /* similar to ModulePath.pm with updir 2 (or 3 for .libs) */
          if (command_directory)
            {/* within tta/C/.libs */
              xasprintf (&t2a_srcdir, "%s/../..",
                         command_directory);
            }
          else
            t2a_srcdir = strdup ("..");
        }

      t2a_builddir = getenv ("t2a_builddir");
      if (!t2a_builddir)
        /* this is correct for in-source builds only. */
        t2a_builddir = strdup (t2a_srcdir);
      else
        t2a_builddir = strdup (t2a_builddir);
    }
  else
    {
      const char *reference_perl_module_file = DATADIR "/" CONVERTER_CONFIG
                                                "Texinfo" "/" "Parser.pm";
      int status;
      struct stat finfo;

      status = stat (reference_perl_module_file, &finfo);
      if ((status != 0 || !S_ISREG (finfo.st_mode))
          && command_directory)
        {
          /* try to make package relocatable, will only work if
             standard relative paths are used */
          int status;
          struct stat finfo;
          char *relocatable_perl_module_file;

          xasprintf (&relocatable_perl_module_file,
                     "%s/../share/%s/Texinfo/Parser.pm", command_directory,
                     CONVERTER_CONFIG);

          status = stat (reference_perl_module_file, &finfo);
          if (status == 0 && S_ISREG (finfo.st_mode))
            xasprintf (&datadir, "%s/../share", command_directory);
        }
    }

  if (!datadir)
    datadir = strdup (DATADIR);

  xasprintf (&converter_datadir, "%s/" CONVERTER_CONFIG, datadir);

  free (command_directory);

  if (texinfo_uninstalled)
    xasprintf (&extensions_dir, "%s/perl/ext", t2a_srcdir);
  else
    xasprintf (&extensions_dir, "%s/ext", converter_datadir);

  memset (&internal_extension_dirs, 0, sizeof (STRING_LIST));

  add_string (extensions_dir, &internal_extension_dirs);


  if (texinfo_uninstalled)
    version_for_embedded_interpreter_check = PACKAGE_VERSION_CONFIG "+nc";
  else
    version_for_embedded_interpreter_check = PACKAGE_VERSION_CONFIG;

  /* load interpreter if needed and setup paths and defauts if not already
     done by the interpreter.
     Done early because options defaults are used in help
     and paths are needed to locate file used for interpreter embedding
     and setup by the interpreter */
  /* no converter_libdir argument because it is only needed when
     (re)using a Perl interpreter, which is never the case here */
  txi_setup_main_load_interpreter (embedded_interpreter,
                        texinfo_uninstalled, datadir,
                        converter_datadir, 0, t2a_builddir, t2a_srcdir, 0,
                        &argc, &argv, &env,
                        version_for_embedded_interpreter_check);

  free (t2a_builddir);
  free (t2a_srcdir);
  free (converter_datadir);

  /* the encoding used to decode command line arguments, and also for
     file names encoding */
  /* needs to be called after setlocale */
  /* from Gnulib codeset.m4 */
#ifdef HAVE_LANGINFO_CODESET
  langinfo_locale_encoding = nl_langinfo (CODESET);
  if (langinfo_locale_encoding)
    {
      locale_encoding = strdup (langinfo_locale_encoding);
      console_output_encoding = strdup (langinfo_locale_encoding);
    }
#endif

#ifdef _WIN32
  if (!locale_encoding)
    {
      UINT cp = GetACP ();
      UINT cp_output = GetConsoleOutputCP ();
      if (cp == CP_UTF8)
        locale_encoding = strdup ("UTF-8");
      else
        xasprintf (&locale_encoding, "cp%u", cp);

      if (cp_output == CP_UTF8)
        console_output_encoding = strdup ("UTF-8");
      else
        xasprintf (&console_output_encoding, "cp%u", cp);
    }
#endif

  /* Set initial configuration */
  /* program_options corresponds to main_program_set_options in texi2any */
  txi_set_base_default_options (&program_options, locale_encoding,
                                console_output_encoding, program_file);

  free (locale_encoding);
  free (console_output_encoding);

  /* NOTE this is not exactly the same as in Perl.  In Perl, when uninstalled,
     it is possible to be configured or not, and +nc is only postpended if
     not configured.  This code is always configured.  We still
     set to not configured if not installed, to correspond to texi2any.pl
     being called in the build directory */
  if (texinfo_uninstalled)
    {
      add_option_value (&program_options, "PACKAGE_AND_VERSION", 0,
                        PACKAGE_NAME_CONFIG " " PACKAGE_VERSION_CONFIG "+nc");
      add_option_value (&program_options, "PACKAGE_VERSION", 0,
                        PACKAGE_VERSION_CONFIG "+nc");
    }

  /* set default output format.  Is info in texi2any.pl */
  /* better than making it the default value independently of the
     implementation */
  if (default_is_html)
    add_option_value (&program_options, "TEXINFO_OUTPUT_FORMAT", 0, "html");
  else
    add_option_value (&program_options, "TEXINFO_OUTPUT_FORMAT", 0, "info");

#ifdef _WIN32
/*
 In Windows, a character in file name is encoded according to the current
 codepage, and converted to/from UTF-16 in the filesystem.  If a file name is
 not encoded in the current codepage, the file name will appear with erroneous
 characters when listing file names.  Also the encoding and decoding to
 UTF-16 may fail, especially when the codepage is 8bit while the file name
 is encoded in a multibyte encoding.
 We assume that in Windows the file names are reencoded in the current
 codepage encoding to avoid those issues.
 */
  add_option_value (&program_options, "DOC_ENCODING_FOR_INPUT_FILE_NAME",
                    0, 0);
#endif

  memset (&deprecated_directories, 0, sizeof (DEPRECATED_DIRS_LIST));

  texinfo_language_config_dirs
   = set_subdir_directories (datadir, "texinfo", &deprecated_directories);

  converter_config_dirs_array_ref
   = set_subdir_directories (datadir, CONVERTER_CONFIG,
                             &deprecated_directories);

  free (datadir);

  memset (&converter_config_dirs, 0, sizeof (STRING_LIST));
  add_string (curdir, &converter_config_dirs);
  copy_strings (&converter_config_dirs, converter_config_dirs_array_ref);

  destroy_strings_list (converter_config_dirs_array_ref);

  memset (&converter_init_dirs, 0, sizeof (STRING_LIST));
  copy_strings (&converter_init_dirs, &converter_config_dirs);

  for (i = 0; i < texinfo_language_config_dirs->number; i++)
    {
      char *init_dir;
      DEPRECATED_DIR_INFO *deprecated_dir_info;
      char *texinfo_config_dir = texinfo_language_config_dirs->list[i];

      xasprintf (&init_dir, "%s/init", texinfo_config_dir);
      add_string (init_dir, &converter_init_dirs);

      deprecated_dir_info = find_deprecated_dir_info (&deprecated_directories,
                                                      texinfo_config_dir);
      if (deprecated_dir_info)
        {
          char *reference_init_dir;
          xasprintf (&reference_init_dir, "%s/init",
                                           deprecated_dir_info->reference_dir);
          add_new_deprecated_dir_info (&deprecated_directories,
                                       init_dir, reference_init_dir);
          free (reference_init_dir);
        }
      free (init_dir);
    }
  add_string (extensions_dir, &converter_init_dirs);

  memset (&prepend_dirs, 0, sizeof (STRING_LIST));
  memset (&conf_dirs, 0, sizeof (STRING_LIST));

  memset (&input_files, 0, sizeof (STRING_LIST));

  initialize_options_list (&cmdline_options);

  store_value (&values, "txicommandconditionals", "1");

  /* always consider that command-line array options are set from
     the command-line */

  options_list_add_option_number (&cmdline_options,
                     cmdline_options.options->CSS_FILES.number);
  options_list_add_option_number (&cmdline_options,
                     cmdline_options.options->CSS_REFS.number);
  options_list_add_option_number (&cmdline_options,
                     cmdline_options.options->INCLUDE_DIRECTORIES.number);
  options_list_add_option_number (&cmdline_options,
               cmdline_options.options->TEXINFO_LANGUAGE_DIRECTORIES.number);
  options_list_add_option_number (&cmdline_options,
                     cmdline_options.options->EXPANDED_FORMATS.number);

  init_files_options =
    GNUT_initialize_customization (&program_file, &program_options,
                                   &cmdline_options);

  /*
  read initialization files.  Better to do that after
  Texinfo::Config::GNUT_initialize_customization() in case loaded
  files replace default options.
   */
  memset (&config_init_files, 0, sizeof (STRING_LIST));
  memset (&reversed_converter_config_dirs, 0, sizeof (STRING_LIST));
  memset (&deprecated_dirs_used, 0, sizeof (DEPRECATED_DIRS_LIST));

  if (converter_config_dirs.number > 0)
    {
      for (i = converter_config_dirs.number; i > 0; i--)
        {
          add_string (converter_config_dirs.list[i-1],
                      &reversed_converter_config_dirs);
        }
    }

  locate_file_in_dirs (conf_file_name, &reversed_converter_config_dirs,
                       &config_init_files,
                       &deprecated_directories, &deprecated_dirs_used);

  free_strings_list (&reversed_converter_config_dirs);

  for (i = 0; i < config_init_files.number; i++)
    {
      int status = txi_load_init_file (config_init_files.list[i],
                                       embedded_interpreter);
      if (status)
        loaded_init_files_nr++;
    }

  warn_deprecated_dirs (&deprecated_dirs_used);
  free_strings_list (&config_init_files);

  /* Parse command line */

  memset (&init_file_dirs, 0, sizeof (STRING_LIST));
  memset (&ignored_formats, 0, sizeof (STRING_LIST));
  memset (&texi2dvi_args, 0, sizeof (STRING_LIST));

  while (1)
    {
      int option_character;

      getopt_long_index = 0;

      option_character = getopt_long (argc, argv, "VhvFc:D:e:f:I:P:o:E:U:",
                                      long_options,
                                      &getopt_long_index);

      if (option_character == -1)
        break;

      switch (option_character)
        {
        case 0:
          /* option sets a flag, nothing to do */
          break;
        case _FORMAT_OPT:
          set_cmdline_format (long_options[getopt_long_index].name);
          break;
        case XML_OPT:
          set_cmdline_format ("texinfoxml");
          break;
        case NO_MIMICKING_OPT:
          free (program_file);
          program_file = strdup (program_basename);
          GNUT_set_from_cmdline (&program_options,
                         cmdline_options.options->PROGRAM.number,
                                 program_file);
          break;
        case 'c':
          get_cmdline_customization_option (&cmdline_options, optarg);
          break;
        case DOCUMENT_LANGUAGE_OPT:
          {
            const char *region_code;
            int lang_is_valid;
            int region_is_valid;
            char *lang;
            GNUT_set_from_cmdline (&cmdline_options,
                              cmdline_options.options->documentlanguage.number,
                              optarg);

            lang = analyze_documentlanguage_argument (optarg, &region_code,
                                        &lang_is_valid, &region_is_valid);
            if (!lang_is_valid)
              {
                txi_config_document_warn ("%s is not a valid language code",
                                         lang);
              }
            free (lang);
            if (!region_is_valid)
              {
                txi_config_document_warn ("%s is not a valid region code",
                                          region_code);
              }
          }
          break;
        case DEBUG_OPT:
          check_integer_option (option_character, getopt_long_index, optarg);
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->DEBUG.number,
                            optarg);
          add_string ("--debug", &texi2dvi_args);
          break;
        case 'e':
          check_integer_option (option_character, getopt_long_index, optarg);
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->ERROR_LIMIT.number,
                            optarg);
          break;
        case 'f':
          check_integer_option (option_character, getopt_long_index, optarg);
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->FILLCOLUMN.number,
                            optarg);
          break;
        case 'E':
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->MACRO_EXPAND.number,
                            optarg);
          break;
        case 'F':
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->FORCE.number, "1");
          break;
        case DISABLE_ENCODING_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->ENABLE_ENCODING.number,
                            "0");
          break;
        case ENABLE_ENCODING_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->ENABLE_ENCODING.number,
                            "1");
          break;
        case INTERNAL_LINKS_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->INTERNAL_LINKS.number,
                            optarg);
          break;
        case NODE_FILES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NODE_FILES.number,
                            "1");
          break;
        case NO_NODE_FILES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NODE_FILES.number,
                            "0");
          break;
        case NUMBER_FOOTNOTES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NUMBER_FOOTNOTES.number,
                            "1");
          break;
        case NO_NUMBER_FOOTNOTES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NUMBER_FOOTNOTES.number,
                            "0");
          break;
        case NUMBER_SECTIONS_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NUMBER_SECTIONS.number,
                            "1");
          break;
        case NO_NUMBER_SECTIONS_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NUMBER_SECTIONS.number,
                            "0");
          break;
        case SPLIT_SIZE_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->SPLIT_SIZE.number,
                            optarg);
          break;
        case TRACE_INCLUDES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->TRACE_INCLUDES.number,
                            "1");
          break;
        case TRANSLITERATE_FILE_NAMES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                     cmdline_options.options->TRANSLITERATE_FILE_NAMES.number,
                            "1");
          break;
        case NO_TRANSLITERATE_FILE_NAMES_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                     cmdline_options.options->TRANSLITERATE_FILE_NAMES.number,
                            "0");
          break;
        case NO_VALIDATE_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->novalidate.number, "1");
          break;
        case 'v':
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->VERBOSE.number, "1");
          add_string ("--verbose", &texi2dvi_args);
          break;
        case NO_VERBOSE_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->VERBOSE.number, "0");
          break;
        case NO_WARN_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->NO_WARN.number, "1");
          break;
        case NO_HEADERS_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->HEADERS.number, "0");
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->FORMAT_MENU.number,
                            "nomenu");
          {
            size_t option_nr
              = program_options.options->TEXINFO_OUTPUT_FORMAT.number;
            OPTION *output_format_option = GNUT_get_conf (option_nr);
            if (output_format_option && output_format_option->o.string
                && !strcmp (output_format_option->o.string, "info"))
              GNUT_set_customization_default (option_nr, "plaintext");
          }
          break;
        case HEADERS_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->HEADERS.number, "1");
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->FORMAT_MENU.number,
                            "set_format_menu_from_cmdline_header_option");
          break;
        case 'I':
          {
            OPTION *option = &cmdline_options.options->INCLUDE_DIRECTORIES;
            push_include_directory (option->o.strlist, optarg);
            add_string ("-I", &texi2dvi_args);
            add_string (optarg, &texi2dvi_args);
          }
          break;
        case 'P':
          push_include_directory (&prepend_dirs, optarg);
          break;
        case CONF_DIR_OPT:
          push_include_directory (&conf_dirs, optarg);
          break;
        case CSS_INCLUDE_OPT:
          {
            OPTION *option = &cmdline_options.options->CSS_FILES;
            add_string (optarg, option->o.strlist);
          }
          break;
        case CSS_REF_OPT:
          {
            OPTION *option = &cmdline_options.options->CSS_REFS;
            char *value = GNUT_decode_input ((char *) optarg);
            add_string (value, option->o.strlist);
            free (value);
          }
          break;
        case 'h':
          print_help_p = 1;
          break;
        case INIT_FILE_OPT:
          {
            test_option = GNUT_get_conf (program_options.options->TEST.number);
            if (test_option && test_option->o.integer > 0)
              test_mode_set = 1;

            if (test_mode_set)
              locate_and_load_init_file (optarg, &conf_dirs, 0);
            else
              {
                copy_strings (&init_file_dirs, &conf_dirs);
                copy_strings (&init_file_dirs, &converter_init_dirs);
                locate_and_load_init_file (optarg, &init_file_dirs,
                                           &deprecated_directories);
                clear_strings_list (&init_file_dirs);
              }
          }
          break;
        case XOPT_OPT:
          add_string (optarg, &texi2dvi_args);
          Xopt_arg_nr++;
          break;
        case _SILENT_OPT:
          {
            char *format_option;
            xasprintf (&format_option, "--%s",
                       long_options[getopt_long_index].name);
            add_string (format_option, &texi2dvi_args);
            free (format_option);
          }
          break;
        case 'D':
          {
            const char *p = optarg;
            size_t flag_len = strcspn (optarg, whitespace_chars);
            if (flag_len)
              {
                size_t spaces_len;
                const char *flag_value = 0;
                char *decoded_flag_value;
                char *flag = strndup (optarg, flag_len);
                char *decoded_flag = GNUT_decode_input (flag);
                char *texi2dvi_option;

                p += flag_len;
                spaces_len = strspn (p, whitespace_chars);
                if (spaces_len)
                  {
                    p += spaces_len;
                    if (*p)
                      {
                        flag_value = p;
                    /* actually const but constrained by prototypes */
                        decoded_flag_value
                          = GNUT_decode_input ((char *) flag_value);
                      }
                  }
                if (!flag_value)
                  {
                    flag_value = "1";
                    decoded_flag_value = strdup (flag_value);
                  }
                store_value (&values, decoded_flag, decoded_flag_value);
                free (decoded_flag);
                free (decoded_flag_value);

                xasprintf (&texi2dvi_option, "--command=@set %s %s",
                           flag, flag_value);
                add_string (texi2dvi_option, &texi2dvi_args);
                free (texi2dvi_option);

                free (flag);
              }
          }
          break;
        case 'U':
          {
            char *texi2dvi_option;
           /* actually const but constrained by prototypes */
            char *value = GNUT_decode_input ((char *) optarg);
            clear_value (&values, value);
            free (value);

            xasprintf (&texi2dvi_option, "--command=@clear %s", optarg);
            add_string (texi2dvi_option, &texi2dvi_args);
            free (texi2dvi_option);
          }
          break;
        case 'V':
          {
            char *encoded_message;
            char *message
             = CONVERTER_CONFIG " (GNU texinfo) " PACKAGE_VERSION_CONFIG "\n\n";
            char *formatted_message;

            encoded_message = GNUT_encode_message (message);
            printf ("%s", encoded_message);
            free (encoded_message);

            xasprintf (&formatted_message, _(
  "Copyright (C) %s Free Software Foundation, Inc.\n"
  "License GPLv3+: GNU GPL version 3 or later <https://gnu.org/licenses/gpl.html>\n"
  "This is free software: you are free to change and redistribute it.\n"
  "There is NO WARRANTY, to the extent permitted by law."),
                       "2024");
            encoded_message = GNUT_encode_message (formatted_message);
            free (formatted_message);
            printf ("%s\n", encoded_message);
            free (encoded_message);

            exit (EXIT_SUCCESS);
          }
          break;
        case FOOTNOTE_STYLE_OPT:
          {
            /* actually const but constrained by prototypes */
            char *value = GNUT_decode_input ((char *) optarg);
            if (!strcmp (value, "end") || !strcmp (value, "separate"))
              {
                GNUT_set_from_cmdline (&cmdline_options,
                          cmdline_options.options->footnotestyle.number,
                                  value);
              }
            else
              {
                char *formatted_message;
                char *encoded_message;

                xasprintf (&formatted_message,
        _("%s: --footnote-style arg must be `separate' or `end', not `%s'."),
                  program_file, value);
                encoded_message = GNUT_encode_message (formatted_message);
                free (formatted_message);
                fprintf (stderr, "%s\n", encoded_message);
                free (encoded_message);
                exit (EXIT_FAILURE);
              }
            free (value);
          }
          break;
        case 'p':
          {
            /* actually const but constrained by prototypes */
            char *value = GNUT_decode_input ((char *) optarg);
            if (!strcmp (value, "none") || !strcmp (value, "asis")
                || is_ascii_digit (value))
              {
                GNUT_set_from_cmdline (&cmdline_options,
                          cmdline_options.options->paragraphindent.number,
                                  value);
              }
            else
              {
                char *formatted_message;
                char *encoded_message;

                xasprintf (&formatted_message,
    _("%s:  --paragraph-indent arg must be numeric/`none'/`asis', not `%s'."),
                  program_file, value);
                encoded_message = GNUT_encode_message (formatted_message);
                free (formatted_message);
                fprintf (stderr, "%s\n", encoded_message);
                free (encoded_message);
                exit (EXIT_FAILURE);
              }
            free (value);
          }
          break;
        case 'o':
          {
            OPTION *option = &cmdline_options.options->OUTFILE;
            /* actually const but constrained by prototypes */
            char *decoded_string = GNUT_decode_input ((char *) optarg);
            if (strcmp (optarg, "-"))
              {
                size_t opt_len = strlen (optarg);
                struct stat finfo;

                if (optarg[opt_len -1] == '/'
                    || (stat (optarg, &finfo) == 0 && S_ISDIR (finfo.st_mode)))
                  {
                    GNUT_set_from_cmdline (&cmdline_options,
                                      option->number, "undef");
                    option = &cmdline_options.options->SUBDIR;
                  }
              }
            GNUT_set_from_cmdline (&cmdline_options,
                                   option->number, decoded_string);
            free (decoded_string);

            add_string ("-o", &texi2dvi_args);
            add_string (optarg, &texi2dvi_args);
          }
          break;
        case NO_SPLIT_OPT:
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->SPLIT.number, "");
          GNUT_set_from_cmdline (&cmdline_options,
                            cmdline_options.options->SPLIT_SIZE.number,
                            "undef");
          break;
        case SPLIT_OPT:
          {
            char *split = GNUT_decode_input (optarg);
            size_t i;
            for (i = 0; possible_split[i]; i++)
              if (!strcmp (possible_split[i], optarg))
                break;
            if (!possible_split[i])
              {
                txi_config_document_warn ("%s is not a valid split possibility",
                               split);
                free (split);
                split = strdup ("node");
              }
            GNUT_set_from_cmdline (&cmdline_options,
                              cmdline_options.options->SPLIT.number, split);
            free (split);
          }
          break;
#define IFFORMAT_CASE(upcase, name) \
        case IF ## upcase ## _OPT: \
          set_expansion (&cmdline_options, &ignored_formats, #name); \
          break; \
        case NO_IF ## upcase ## _OPT: \
          unset_expansion (&cmdline_options, &ignored_formats, #name); \
          break;
        IFFORMAT_CASE(DOCBOOK, docbook)
        IFFORMAT_CASE(INFO, info)
        IFFORMAT_CASE(HTML, html)
        IFFORMAT_CASE(LATEX, latex)
        IFFORMAT_CASE(PLAINTEXT, plaintext)
        IFFORMAT_CASE(TEX, tex)
        IFFORMAT_CASE(XML, xml)
#undef IFFORMAT_CASE
 /*
        case IFTEX_OPT:
          set_expansion (&cmdline_options, &ignored_formats, "tex");
          break;
        case NO_IFTEX_OPT:
          unset_expansion (&cmdline_options, &ignored_formats, "tex");
          break;
 */
          /*
        case '?':
          if (isprint (optopt))
            fprintf (stderr, "Unknown option `-%c'\n", optopt);
          else
            fprintf (stderr,
                     "Unknown option character `\\x%x'\n",
                     optopt);
          break;
           */
        case '?': /* unknown option or option with missing argument */
          exit (EXIT_FAILURE);
          break;
        default:
          fprintf (stderr,
                   "BUG: getopt_long unexpected option_character: %d '%c'\n",
                   option_character, (char) option_character);
          exit (EXIT_FAILURE);
        }
    }

  free_strings_list (&init_file_dirs);

  if (print_help_p)
    {
      char *encoded_message;
      char *endptr;
      const char *option_value;
      int paragraphindent_size;
      TEXT help_message;
      OPTION *error_limit_option
        = GNUT_get_conf (program_options.options->ERROR_LIMIT.number);

      text_init (&help_message);
      text_printf (&help_message,
                   _("Usage: %s [OPTION]... TEXINFO-FILE..."), program_file);
      text_append_n (&help_message, "\n\n", 2);
      /* no added translations, reuse translations with they already exist */
      if (default_is_html)
        text_append (&help_message,
        "Translate Texinfo source documentation to various other formats.");
      else
    /* lie on the name, but this is no such a big lie */
        text_append (&help_message,
   _("Translate Texinfo source documentation to various other formats, by default\n"
  "Info files suitable for reading online with Emacs or standalone GNU Info.\n\n"
  "This program is commonly installed as both `makeinfo' and `texi2any';\n"
  "the behavior is identical, and does not depend on the installed name."));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("General options:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
   _("      --document-language=STR locale to use in translating Texinfo keywords\n"
     "                                for the output document (default C)"));
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message,
        _("      --error-limit=NUM       quit after NUM errors (default %d)"),
        error_limit_option->o.integer);
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --force                 preserve output even if errors"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --help                  display this help and exit"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --no-validate           suppress node cross-reference validation"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --no-warn               suppress warnings (but not errors)"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --conf-dir=DIR          search also for initialization files in DIR"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --init-file=FILE        load FILE to modify the default behavior"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("  -c, --set-customization-variable VAR=VAL  set customization variable VAR\n"
          "                                to value VAL"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --trace-includes        print names of included files"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("  -v, --verbose               explain what is being done"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --version               display version information and exit"));
      text_append_n (&help_message, "\n\n", 2);

      if (default_is_html)
        text_append (&help_message, "Output format selection (default is to produce HTML):");
      else
        text_append (&help_message, _("Output format selection (default is to produce Info):"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --docbook               output Docbook XML"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --html                  output HTML"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --epub3                 output EPUB 3"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --latex                 output LaTeX"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --plaintext             output plain text rather than Info"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --xml                   output Texinfo XML"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _("      --dvi, --dvipdf, --ps, --pdf  call texi2dvi to generate given output,\n"
          "                                after checking validity of TEXINFO-FILE"));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("General output options:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "  -E, --macro-expand=FILE     output macro-expanded source to FILE,\n"
   "                                ignoring any @setfilename"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --no-headers            suppress node separators, Node: lines, and menus\n"
   "                                from Info output (thus producing plain text)\n"
   "                                or from HTML (thus producing shorter output).\n"
   "                                Also, if producing Info, write to\n"
   "                                standard output by default."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --no-split              suppress any splitting of the output;\n"
   "                                generate only one output file"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --[no-]number-sections  output chapter and sectioning numbers;\n"
   "                                default is on"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --[no-]number-footnotes  number footnotes sequentially; default is on"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "  -o, --output=DEST           output to DEST.\n"
   "                                With split output, create DEST as a directory\n"
   "                                and put the output files there.\n"
   "                                With non-split output, if DEST is already\n"
   "                                a directory or ends with a /,\n"
   "                                put the output file there.\n"
   "                                Otherwise, DEST names the output file."));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --disable-encoding      do not output accented and special characters\n"
   "                                in Info and plain text output based on document\n"
   "                                encoding"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --enable-encoding       override --disable-encoding (default)"));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Options for Info and plain text:"));
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
   "      --fill-column=NUM       break Info lines at NUM columns (default %d)"),
  txi_base_sorted_options[program_options.options->FILLCOLUMN.number -1]->o.integer);
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --footnote-style=STYLE  output footnotes in Info according to STYLE:\n"
   "                                `separate' to put them in their own node;\n"
   "                                `end' to put them at the end of the node, in\n"
   "                                which they are defined (this is the default)"));
      text_append_n (&help_message, "\n", 1);

      option_value
  = txi_base_sorted_options[program_options.options->paragraphindent.number -1]->o.string;
      paragraphindent_size = strtol (option_value, &endptr, 10);
      text_printf (&help_message, _(
   "      --paragraph-indent=VAL  indent Info paragraphs by VAL spaces (default %d).\n"
   "                                If VAL is `none', do not indent; if VAL is\n"
   "                                `asis', preserve existing indentation."),
                   paragraphindent_size);
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
   "      --split-size=NUM        split Info files at size NUM (default %d)"),
  txi_base_sorted_options[program_options.options->SPLIT_SIZE.number -1]->o.integer);
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Options for HTML:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --css-include=FILE      include FILE in HTML <style> output;\n"
   "                                read stdin if FILE is -"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --css-ref=URL           generate CSS reference to URL"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --internal-links=FILE   produce list of internal links in FILE"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --split=SPLIT           split at SPLIT, where SPLIT may be `chapter',\n"
   "                                `section' or `node'"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --transliterate-file-names  use file names in ASCII transliteration"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --node-files            produce redirection files for nodes and\n"
   "                                anchors; default is set only if split"));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Options for DVI/PS/PDF:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
   "      --Xopt=OPT              pass OPT to texi2dvi; can be repeated"));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Input file options:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -D VAR                       define the variable VAR, as with @set"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -D 'VAR VAL'                 define VAR to VAL (one shell argument)"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -I DIR                       append DIR to the @include search path"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -P DIR                       prepend DIR to the @include search path"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message,
        _(" -U VAR                       undefine the variable VAR, as with @clear"));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _(
"Conditional processing in input:"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
"      --ifdocbook       process @ifdocbook and @docbook"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
"      --ifhtml          process @ifhtml and @html"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
"      --ifinfo          process @ifinfo"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
"      --iflatex         process @iflatex and @latex"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
"      --ifplaintext     process @ifplaintext"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
"      --iftex           process @iftex and @tex"));
      text_append_n (&help_message, "\n", 1);
      text_append (&help_message, _(
"      --ifxml           process @ifxml and @xml"));
      text_append_n (&help_message, "\n", 1);

      text_append_n (&help_message, "\n", 1);

      text_append (&help_message, _(
"  By default, an --ifFORMAT setting is on only when the output format\n"
"  is FORMAT; for example, --ifhtml is on when outputting HTML.\n"
"  Also, when --ifFORMAT is on, @ifnotFORMAT text is not processed."));

      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _(
"  Each --ifFORMAT option may be prefixed with `--no-' to negate it;\n"
"  for example, --no-ifhtml means not to process @ifhtml or @html text,\n"
"  and to process @ifnothtml text."));
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Examples:"));
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
"  %s foo.texi                      write Info"), program_file);
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
"  %s --html foo.texi               write HTML"), program_file);
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
"  %s --xml foo.texi                write Texinfo XML"), program_file);
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
"  %s --docbook foo.texi            write Docbook XML"), program_file);
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
"  %s --plaintext foo.texi          write plain text to standard output"), program_file);
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
"  %s --pdf foo.texi                write PDF using texi2dvi"), program_file);
      text_append_n (&help_message, "\n\n", 2);

      text_printf (&help_message, _(
"  %s --html --no-headers foo.texi  write html without node lines, menus"), program_file);
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
"  %s --number-sections foo.texi    write Info with numbered sections"), program_file);
      text_append_n (&help_message, "\n", 1);
      text_printf (&help_message, _(
"  %s --no-split foo.texi           write one Info file however big"), program_file);
      text_append_n (&help_message, "\n\n", 2);

      text_append (&help_message, _("Email bug reports to bug-texinfo@gnu.org,\n"
  "general questions and discussion to help-texinfo@gnu.org.\n"
  "Texinfo home page: https://www.gnu.org/software/texinfo/"));
      text_append_n (&help_message, "\n", 1);

      encoded_message = GNUT_encode_message (help_message.text);
      free (help_message.text);
      printf ("%s", encoded_message);
      free (encoded_message);
      exit (EXIT_SUCCESS);
    }

  if (cmdline_options.options->TEXI2HTML.o.integer > 0)
    {
      set_format ("html");
      store_value (&values, "TEXI2HTML", "1");
    }

  if (embedded_interpreter != txi_interpreter_use_embedded)
    /* it is the best we have without an embedded interpreter */
    add_option_value (&program_options, "XS_STRXFRM_COLLATION_LOCALE", 0,
                      "en_US");

  html_math_option = GNUT_get_conf (program_options.options->HTML_MATH.number);
  if (html_math_option && html_math_option->o.string
      && !strcmp (html_math_option->o.string, "l2h"))
    locate_and_load_extension_file ("latex2html.pm", &internal_extension_dirs);

  if (html_math_option && html_math_option->o.string
      && !strcmp (html_math_option->o.string, "t4h"))
    locate_and_load_extension_file ("tex4ht.pm", &internal_extension_dirs);

  highlight_syntax_option
    = GNUT_get_conf (program_options.options->HIGHLIGHT_SYNTAX.number);
  if (highlight_syntax_option && highlight_syntax_option->o.string
      && strlen (highlight_syntax_option->o.string))
    locate_and_load_extension_file ("highlight_syntax.pm",
                                    &internal_extension_dirs);

  /* re-set in case it was set in init files */
  test_option = GNUT_get_conf (program_options.options->TEST.number);
  if (test_option && test_option->o.integer > 0)
    test_mode_set = 1;

  no_warn_option = GNUT_get_conf (program_options.options->NO_WARN.number);
  if (no_warn_option && no_warn_option->o.integer > 0)
    no_warn = 1;

  debug_option = GNUT_get_conf (program_options.options->DEBUG.number);
  if (debug_option && debug_option->o.integer > 0)
    debug = debug_option->o.integer;

  if (test_mode_set)
    {
      add_option_value (&program_options, "PACKAGE_VERSION", 0, "");
      add_option_value (&program_options, "PACKAGE", 0, "texinfo");
      add_option_value (&program_options, "PACKAGE_NAME", 0, "GNU Texinfo");
      add_option_value (&program_options, "PACKAGE_AND_VERSION", 0,
                                          "texinfo");
      add_option_value (&program_options, "PACKAGE_URL", 0,
                                     "https://www.gnu.org/software/texinfo/");
      add_option_value (&program_options, "PROGRAM", 0, "texi2any");

      free (program_file);
      program_file = strdup ("texi2any");
    }

  init_file_format = GNUT_get_format_from_init_file ();
  if (init_file_format)
    {
      set_format (init_file_format);
      free (init_file_format);
    }

  texinfo_output_format_env = getenv ("TEXINFO_OUTPUT_FORMAT");
  if (texinfo_output_format_env && strlen (texinfo_output_format_env))
    {
      char *format_name = GNUT_decode_input (texinfo_output_format_env);
      set_format (format_name);
      free (format_name);
    }

  output_format_option
    = GNUT_get_conf (program_options.options->TEXINFO_OUTPUT_FORMAT.number);
  output_format = output_format_option->o.string;

  if (!test_mode_set && txi_paths_info.texinfo_uninstalled
      && txi_paths_info.p.uninstalled.t2a_srcdir)
    {
      char *in_source_util_dir;
      xasprintf (&in_source_util_dir, "%s/../util",
                 txi_paths_info.p.uninstalled.t2a_srcdir);
      add_string (in_source_util_dir, texinfo_language_config_dirs);
      free (in_source_util_dir);
    }

  /* Setup output string translations (including Locales path). */
  txi_general_output_strings_setup (0);

  /* determine the format_specification now that the output format is known */
  for (i = 0; formats_table[i].name; i++)
    {
      if (!strcmp (formats_table[i].name, output_format))
        {
          format_specification = &formats_table[i];
          break;
        }
    }

  tree_transformations_option
    = GNUT_get_conf (program_options.options->TREE_TRANSFORMATIONS.number);
  if (tree_transformations_option && tree_transformations_option->o.string
      && strlen (tree_transformations_option->o.string))
    {
      char *text = strdup (tree_transformations_option->o.string);
      char *transformation = strtok (text, ",");

      while (transformation)
        {
          if (strlen (transformation))
            {
              unsigned long transfo_flag
                = txi_find_tree_transformation (transformation);
              if (transfo_flag)
                transformation_flags |= transfo_flag;
              else
                txi_config_document_warn ("unknown tree transformation %s",
                                          transformation);
            }
          transformation = strtok (NULL, ",");
        }
      free (text);
    }

  /* for a format setup with an init file */
  if (format_specification->init_file)
    locate_and_load_extension_file (format_specification->init_file,
                                    &internal_extension_dirs);

  if (format_specification->converted_format)
    {
      converted_format = format_specification->converted_format;
  /* reset the format_specification to the converted_format specification */
      for (i = 0; formats_table[i].name; i++)
        {
          if (!strcmp (formats_table[i].name, converted_format))
            {
              format_specification = &formats_table[i];
              break;
            }
        }
    }
  else
    converted_format = output_format;

  split_option = GNUT_get_conf (program_options.options->SPLIT.number);
  if (split_option && split_option->o.string
      && strlen (split_option->o.string)
      && !(format_specification->flags & STTF_split))
    {
      if (strcmp (converted_format, output_format))
        {
          txi_config_document_warn (
            "ignoring splitting for converted format %s (for %s)",
            name_of_format (converted_format), name_of_format (output_format));
        }
      else
        {
          txi_config_document_warn ("ignoring splitting for format %s",
                                    name_of_format (converted_format));
        }
      GNUT_set_from_cmdline (&cmdline_options,
                       program_options.options->SPLIT.number, "");
    }
  split_option = GNUT_get_conf (program_options.options->SPLIT.number);

  memset (&default_expanded_formats, 0, sizeof (STRING_LIST));
  format_expanded_formats (&default_expanded_formats, format_specification,
                           &texi2dvi_args, &call_texi2dvi);

  expanded_formats_option = &cmdline_options.options->EXPANDED_FORMATS;

  for (i = 0; i < ignored_formats.number; i++)
    {
      size_t ignored_fmt_nr
         = find_string (&default_expanded_formats, ignored_formats.list[i]);
      if (ignored_fmt_nr)
        remove_from_strings_list (&default_expanded_formats, ignored_fmt_nr-1);
    }
  for (i = 0; i < default_expanded_formats.number; i++)
    {
      txi_config_add_to_option_list (expanded_formats_option,
                                     default_expanded_formats.list[i], 0);
    }

  free_strings_list (&default_expanded_formats);

  if (call_texi2dvi)
    {
      OPTION *outfile_option
        = GNUT_get_conf (program_options.options->OUTFILE.number);
      if (outfile_option && outfile_option->o.string && argc - optind > 1)
        {
          char *formatted_message;
          char *encoded_message;

          xasprintf (&formatted_message,
    _("%s: when generating %s, only one input FILE may be specified with -o"),
                     program_file, name_of_format (output_format));
          encoded_message = GNUT_encode_message (formatted_message);
          free (formatted_message);
          fprintf (stderr, "%s\n", encoded_message);
          free (encoded_message);

          exit (EXIT_FAILURE);
        }
    }
  else if (Xopt_arg_nr)
    txi_config_document_warn ("%s", "--Xopt option without printed output");

  /* special case, show all the built in HTML CSS rules and exit */
  show_builtin_css_rules_option
    = GNUT_get_conf (program_options.options->SHOW_BUILTIN_CSS_RULES.number);
  if (show_builtin_css_rules_option
      && show_builtin_css_rules_option->o.integer > 0)
    {
      char *default_css_text;
      default_css_text = txi_builtin_default_css_text ();
      printf ("%s", default_css_text);
      free (default_css_text);
      exit (EXIT_SUCCESS);
    }

  /* NOTE there is an effect only if Perl converter is used */
  txi_xs_external_conversion = getenv ("TEXINFO_XS_EXTERNAL_CONVERSION");
  if (txi_xs_external_conversion && strlen (txi_xs_external_conversion)
      && strcmp (txi_xs_external_conversion, "0"))
    {
      GNUT_set_from_cmdline (&cmdline_options,
        program_options.options->XS_EXTERNAL_CONVERSION.number, "1");
    }

  txi_xs_external_formatting = getenv ("TEXINFO_XS_EXTERNAL_FORMATTING");
  if (txi_xs_external_formatting && strlen (txi_xs_external_formatting)
      && strcmp (txi_xs_external_formatting, "0"))
    GNUT_set_from_cmdline (&cmdline_options,
        program_options.options->XS_EXTERNAL_FORMATTING.number, "1");

  if (format_specification->module)
    {
      if (!strcmp (converted_format, "html"))
        {
          OPTION *xs_external_formatting_option
            = GNUT_get_conf (
                 program_options.options->XS_EXTERNAL_FORMATTING.number);
          OPTION *xs_external_conversion_option
            = GNUT_get_conf (
                 program_options.options->XS_EXTERNAL_CONVERSION.number);

          /* setup of need_latex to be kept in sync with setup of
             CONVERT_TO_LATEX_IN_MATH in html_initialize_output_state
             based on HTML_MATH */
          int need_latex = 0;
          OPTION *convert_to_latex_in_math_option
            = GNUT_get_conf (
              program_options.options->CONVERT_TO_LATEX_IN_MATH.number);

          if (!convert_to_latex_in_math_option
              || convert_to_latex_in_math_option->o.integer < 0)
            {
              OPTION *option_html_math
                = GNUT_get_conf (program_options.options->HTML_MATH.number);
              if (option_html_math && option_html_math->o.string)
                need_latex = 1;
            }

          /* to be kept in sync with build_html_perl_info.c
              html_pass_conversion_initialization */
          if (loaded_init_files_nr > 0 || need_latex
              || (xs_external_formatting_option
                  && xs_external_formatting_option->o.integer > 0)
              || (xs_external_conversion_option
                  && xs_external_conversion_option->o.integer > 0))
            external_module = format_specification->module;
        }
      else
        external_module = format_specification->module;

      if (external_module)
        {
          if (embedded_interpreter != txi_interpreter_use_embedded)
            {
              fprintf (stderr, "ERROR: no interpreter for %s\n",
                       external_module);
              exit (EXIT_FAILURE);
            }
          else if (debug)
            fprintf (stderr, "ctexi2any: loading module: %s\n", external_module);
        }
    }

  /* corresponds to eval "require $module"; in texi2any.pl */
  txi_converter_output_format_setup (converted_format, external_module);

  /*
  For now, FORMAT_MENU is the only variable that can be set from converter
  defaults for the main program structuring and for the parser.
   */
  /*
   $cmdline_options is passed to have command line settings, here
   in practice TEXI2HTML set, for conversion to HTML to select
   possibly different customization variable values.
   */
  format_defaults = txi_converter_format_defaults (converted_format,
                                                   external_module,
                                                   &cmdline_options);

  format_menu_option_nr = program_options.options->FORMAT_MENU.number;

  /* Converters may set format_defaults to NULL (Text converter) */
  if (format_defaults)
    {
      if (format_defaults->conf.options->FORMAT_MENU.o.string)
        conversion_format_menu_default
          = strdup (format_defaults->conf.options->FORMAT_MENU.o.string);
      if (conversion_format_menu_default != 0)
        {
          /*
          fprintf (stderr, "FORMAT_MENU %s\n", conversion_format_menu_default);
           */
          GNUT_set_customization_default (format_menu_option_nr,
                                     conversion_format_menu_default);
        }

      destroy_converter_initialization_info (format_defaults);
    }

  /* special case for FORMAT_MENU of delayed setting based in
     some case on converter */
  format_menu_option = GNUT_get_conf (format_menu_option_nr);
  if (format_menu_option && format_menu_option->o.string
      && !strcmp (format_menu_option->o.string,
                  "set_format_menu_from_cmdline_header_option"))
    {
      if (conversion_format_menu_default
          && strcmp (conversion_format_menu_default, "nomenu"))
        {
          GNUT_set_from_cmdline (&cmdline_options, format_menu_option_nr,
                            conversion_format_menu_default);
        }
      else
        GNUT_set_from_cmdline (&cmdline_options,
                               format_menu_option_nr, "menu");
    }

  free (conversion_format_menu_default);

  format_menu_option = GNUT_get_conf (format_menu_option_nr);
  if (!format_menu_option || !format_menu_option->o.string
                          || !strcmp (format_menu_option->o.string,
                                         "menu"))
    do_menu = 1;

  sort_element_count_option
    = GNUT_get_conf (program_options.options->SORT_ELEMENT_COUNT.number);

  initialize_options_list (&parser_options);
  /* Copy relevant customization variables into the parser options. */
  for (i = 0; i < TXI_OPTIONS_NR; i++)
    {
      OPTION *parser_option = parser_options.sorted_options[i];
      if (parser_option->flags & OF_parser_option)
        {
          /* note that INCLUDE_DIRECTORIES is reset before parsing
             to add prepended directories, current directory and manual
             directory */
          OPTION *option = GNUT_get_conf (parser_option->number);
          if (option)
            {
              options_list_add_option_number (&parser_options,
                                              parser_option->number);
              copy_option (parser_option, option);
            }
        }
    }

  message_encoding_option
    = GNUT_get_conf (program_options.options->MESSAGE_ENCODING.number);
  if (message_encoding_option && message_encoding_option->o.string)
    set_message_encoding = message_encoding_option->o.string;

  if (optind < argc)
    {
      int j;
      for (j = optind; j < argc; j++)
        add_string (argv[j], &input_files);
    }
  else if (!isatty (fileno (stdin)) && !call_texi2dvi)
    {
      add_string ("-", &input_files);
    }
  else
    {
      char *formatted_message;
      char *encoded_message;

      xasprintf (&formatted_message, _("%s: missing file argument."),
                 program_file);
      encoded_message = GNUT_encode_message (formatted_message);
      free (formatted_message);
      fprintf (stderr, "%s\n", encoded_message);
      free (encoded_message);

      xasprintf (&formatted_message,
                 _("Try `%s --help' for more information."),
                 program_file);
      encoded_message = GNUT_encode_message (formatted_message);
      free (formatted_message);
      fprintf (stderr, "%s\n", encoded_message);
      free (encoded_message);
      exit (EXIT_FAILURE);
    }

  if (test_option && test_option->o.integer > 1)
    remove_references = 1;

  initialize_options_list (&convert_options);

  memset (&opened_files, 0, sizeof (STRING_LIST));
  memset (&prepended_include_directories, 0, sizeof (STRING_LIST));
  converter_init_info = new_converter_initialization_info ();

  for (file_index = 0; file_index < input_files.number; file_index++)
    {
      DOCUMENT *document;
      CONVERTER *converter;
      char *result;
      char *input_file_name_and_directory[2];
      char *input_file_name;
      char *input_directory;
      char *canon_input_dir = 0;
      OPTION *trace_includes_option;
      OPTION *macro_expand_option;
      OPTION *dump_texi_option;
      OPTION *converter_include_dirs_option;
      OPTION *converter_texinfo_language_directories_option;
      OPTION *dump_tree_option;
      OPTION *input_file_name_encoding_option;
      OPTION *doc_encoding_for_input_file_name_option;
      OPTION *locale_encoding_option;
      OPTION *dump_structure_option;
      STRING_LIST *cmdline_include_dirs
        = cmdline_options.options->INCLUDE_DIRECTORIES.o.strlist;
      STRING_LIST *parser_include_dirs
        = parser_options.options->INCLUDE_DIRECTORIES.o.strlist;
      STRING_LIST *converter_include_dirs;
      STRING_LIST *converter_texinfo_language_config_dirs;
      char *input_file_path = 0;
      char *locale_encoding = 0;
      char *input_name_encoding_val = 0;
      size_t file_path_len;
      size_t j;
      OPTIONS_LIST *file_cmdline_options;

      input_file_arg = input_files.list[file_index];

      file_path_len = strlen (input_file_arg);
      if (file_path_len > strlen (".info")
          && !memcmp (input_file_arg + file_path_len -strlen (".info"),
                      ".info", strlen (".info")))
        {
          char *corrected;
          char *arg_basename;
          char *decoded_corrected;
          char *decoded_arg_basename;

          parse_file_path (input_file_arg, input_file_name_and_directory);
          arg_basename = input_file_name_and_directory[0];
          free (input_file_name_and_directory[1]);
          corrected = strdup (arg_basename);
          memcpy (corrected + strlen (corrected) -strlen (".info"), ".texi",
                  strlen (".texi"));

          decoded_corrected = GNUT_decode_input (corrected);
          decoded_arg_basename = GNUT_decode_input (arg_basename);

          txi_config_document_warn ("input file %s; did you mean %s?",
                                    decoded_arg_basename,
                                    decoded_corrected);
          free (corrected);
          free (arg_basename);
          free (decoded_arg_basename);
          free (decoded_corrected);
        }

     /* try to concatenate with different suffixes. The last suffix is ''
        such that the plain file name is checked. */
      for (j = 0; input_file_suffixes[j]; j++)
        {
          struct stat finfo;
          char *path_name;
          xasprintf (&path_name, "%s%s", input_file_arg,
                     input_file_suffixes[j]);
          if (stat (path_name, &finfo) == 0)
            {
              input_file_path = path_name;
              break;
            }
          else
            free (path_name);
        }

      /* in case no file was found, still set the file name */
      if (!input_file_path)
        input_file_path = strdup (input_file_arg);

      parse_file_path (input_file_path, input_file_name_and_directory);
      input_file_name = input_file_name_and_directory[0];
      input_directory = input_file_name_and_directory[1];

      if (prepend_dirs.number > 0)
        copy_strings (&prepended_include_directories, &prepend_dirs);

      add_string (curdir, &prepended_include_directories);

      if (input_directory)
        canon_input_dir = file_separator_canonpath (input_directory);

      if (canon_input_dir && strcmp (curdir, canon_input_dir))
        add_string (input_directory, &prepended_include_directories);

      /* tune for the input file include directory and prepend to
         INCLUDE_DIRECTORIES by merging prepended directories and command
         line include directories */
      clear_strings_list (parser_include_dirs);
      copy_strings (parser_include_dirs, &prepended_include_directories);
      copy_strings (parser_include_dirs, cmdline_include_dirs);

      /* Texinfo file parsing */
      /* initialize parser */
      txi_parser (input_file_path, &values, &parser_options);

      /* Texinfo document tree parsing */
      document = txi_parse_texi_file (input_file_path, &status);

      set_document_options (document, &program_options, &cmdline_options,
                            init_files_options);

      dump_tree_option
        = GNUT_get_conf (program_options.options->DUMP_TREE.number);
      input_file_name_encoding_option
        = GNUT_get_conf (
         program_options.options->INPUT_FILE_NAME_ENCODING.number);
      doc_encoding_for_input_file_name_option
        = GNUT_get_conf (
         program_options.options->DOC_ENCODING_FOR_INPUT_FILE_NAME.number);
      locale_encoding_option
        = GNUT_get_conf (program_options.options->LOCALE_ENCODING.number);

      if (locale_encoding_option)
        locale_encoding = locale_encoding_option->o.string;

      if (input_file_name_encoding_option)
        input_name_encoding_val = input_file_name_encoding_option->o.string;

      if (!status && ((dump_tree_option && dump_tree_option->o.string)
                      || debug >= 10))
        {
          const char *input_file_names_encoding
            = input_file_name_encoding (input_name_encoding_val,
               (!(doc_encoding_for_input_file_name_option
                  && doc_encoding_for_input_file_name_option->o.integer == 0)),
                    locale_encoding, &document->global_info, 0);
          char *debug_tree = tree_print_details (document->tree,
                               input_file_names_encoding, test_mode_set);
          const char *output_encoding = 0;
          OPTION *out_encoding_option
            = GNUT_get_conf (
                  program_options.options->OUTPUT_ENCODING_NAME.number);

          if (out_encoding_option && out_encoding_option->o.string
              && strcmp (out_encoding_option->o.string, "utf-8"))
            output_encoding = out_encoding_option->o.string;

          if (dump_tree_option && dump_tree_option->o.string
              && strcmp (dump_tree_option->o.string, "-")
              && strcmp (dump_tree_option->o.string, "1"))
            {
              const char *dump_tree = dump_tree_option->o.string;
              char *dump_tree_name
                = GNUT_decode_input ((char *) dump_tree);

              FILE *file_fh = fopen (dump_tree, "w");
              if (file_fh)
                {
                  if (output_encoding)
                    {
                      char *encoding_line;
                      xasprintf (&encoding_line, "OUTPUT_ENCODING: %s\n",
                                 output_encoding);
                      write_to_file (encoding_line, file_fh, dump_tree_name);
                      free (encoding_line);
                    }
                  write_to_file (debug_tree, file_fh, dump_tree_name);

                  if (fclose (file_fh))
                    {
                      txi_config_document_warn (
                               "error on closing tree dump file %s: %s",
                                 dump_tree_name, strerror (errno));
                    }
                }
              else
                txi_config_document_warn ("could not open %s for writing: %s",
                                          dump_tree_name, strerror (errno));

              free (dump_tree_name);
            }
          else
            {
              if (output_encoding)
                fprintf (stderr, "OUTPUT_ENCODING: %s\n", output_encoding);
              fprintf (stderr, "%s", debug_tree);
            }
          free (debug_tree);
        }

      if (status)
        {
          errors_count = handle_parser_errors (document, set_message_encoding,
                                               no_warn, test_mode_set,
                                               errors_count, &opened_files);
          goto next_input_file;
        }

      if (!strcmp (output_format, "parse"))
        {
          errors_count = handle_parser_errors (document, set_message_encoding,
                                               no_warn, test_mode_set,
                                               errors_count, &opened_files);
          goto next_input_file;
        }

      trace_includes_option
         = GNUT_get_conf (program_options.options->TRACE_INCLUDES.number);
      if (trace_includes_option && trace_includes_option->o.integer > 0)
        {
          errors_count = handle_parser_errors (document, set_message_encoding,
                                               no_warn, test_mode_set,
                                               errors_count, &opened_files);
          if (document->global_info.included_files.number)
            {
              for (i = 0; i < document->global_info.included_files.number;
                   i++)
                {
                  printf ("%s\n",
                          document->global_info.included_files.list[i]);
                }
            }
          goto next_input_file;
        }

      macro_expand_option
        = GNUT_get_conf (program_options.options->MACRO_EXPAND.number);
      if (macro_expand_option && macro_expand_option->o.string
          && file_index == 0)
        {
          const char *encoded_macro_expand_file_name
            = macro_expand_option->o.string;
          char *macro_expand_file_name
            = GNUT_decode_input ((char *) encoded_macro_expand_file_name);
          FILE *file_fh;
          OUTPUT_FILES_INFORMATION output_files_information;
          char *open_error_message;
          int overwritten_file;
          size_t error_macro_expand_file = 0;

          char *texinfo_text = convert_to_texinfo (document->tree);

          /* fprintf (stderr, "%s", texinfo_text); */

          memset (&output_files_information, 0,
                  sizeof (OUTPUT_FILES_INFORMATION));

          file_fh = output_files_open_out (&output_files_information,
                                           encoded_macro_expand_file_name,
                                           &open_error_message,
                                           &overwritten_file, 0);
          /* overwritten_file, set if the file has already been used
             in this files_information is not checked as this cannot happen.
           */

          if (file_fh)
            {
              write_to_file (texinfo_text, file_fh,
                             encoded_macro_expand_file_name);

              if (!strcmp (macro_expand_file_name, "-"))
                {
                  main_program_unclosed_stdout.stream = file_fh;
                  main_program_unclosed_stdout.file_path = "-";
                }
              else
                {
                  output_files_register_closed (&output_files_information,
                                                encoded_macro_expand_file_name);
                  if (fclose (file_fh))
                    {
                      txi_config_document_warn (
                               "error on closing macro expand file %s: %s",
                                 macro_expand_file_name, strerror (errno));
                      error_macro_expand_file = 1;
                    }
                }
            }
          else
            {
              txi_config_document_warn ("could not open %s for writing: %s",
                             macro_expand_file_name, open_error_message);
              error_macro_expand_file = 1;
            }

          error_macro_expand_file
            = merge_opened_files (&opened_files,
                                  &output_files_information.opened_files,
                                  error_macro_expand_file);

          if (error_macro_expand_file)
            {
              errors_count = handle_errors (error_macro_expand_file,
                                            errors_count, &opened_files);
            }
          free_output_files_information (&output_files_information);
          free (macro_expand_file_name);
          free (texinfo_text);
        }

      dump_texi_option
        = GNUT_get_conf (program_options.options->DUMP_TEXI.number);

      if ((dump_texi_option && dump_texi_option->o.integer > 0)
          || format_specification->flags & STTF_texi2dvi_format)
        {
          errors_count = handle_parser_errors (document, set_message_encoding,
                                               no_warn, test_mode_set,
                                               errors_count, &opened_files);
          goto next_input_file;
        }

      /* structure and transformations */
      /* do_menu corresponds to FORMAT_MENU undef or set to menu */
      txi_complete_document (document, format_specification->flags
                                       | transformation_flags, do_menu);

      merge_error_messages_lists (&document->parser_error_messages,
                                  &document->error_messages);

      errors_nr
        = txi_output_parser_error_messages (document, set_message_encoding,
                                            no_warn, test_mode_set);

      errors_count = handle_errors (errors_nr, errors_count, &opened_files);

      dump_structure_option
        = GNUT_get_conf (program_options.options->DUMP_STRUCTURE.number);

      if ((dump_structure_option && dump_structure_option->o.integer > 0)
          || debug >= 20)
        {
          const char *input_file_names_encoding
            = input_file_name_encoding (input_name_encoding_val,
               (!(doc_encoding_for_input_file_name_option
                  && doc_encoding_for_input_file_name_option->o.integer == 0)),
                    locale_encoding, &document->global_info, 0);
          char *debug_tree = tree_print_details (document->tree,
                               input_file_names_encoding, test_mode_set);
          const char *output_encoding = 0;
          OPTION *out_encoding_option
            = GNUT_get_conf (
                  program_options.options->OUTPUT_ENCODING_NAME.number);

          if (out_encoding_option && out_encoding_option->o.string
              && strcmp (out_encoding_option->o.string, "utf-8"))
            output_encoding = out_encoding_option->o.string;

          if (dump_structure_option && dump_structure_option->o.string
              && strcmp (dump_structure_option->o.string, "-"))
            {
              const char *dump_structure = dump_structure_option->o.string;
              char *dump_structure_name
                = GNUT_decode_input ((char *) dump_structure);

              FILE *file_fh = fopen (dump_structure, "w");
              if (file_fh)
                {
                  if (output_encoding)
                    {
                      char *encoding_line;
                      xasprintf (&encoding_line, "OUTPUT_ENCODING: %s\n",
                                 output_encoding);
                      write_to_file (encoding_line, file_fh,
                                     dump_structure_name);
                      free (encoding_line);
                    }
                  write_to_file (debug_tree, file_fh, dump_structure_name);

                  if (fclose (file_fh))
                    {
                      txi_config_document_warn (
                               "error on closing structure dump file %s: %s",
                                 dump_structure_name, strerror (errno));
                    }
                }
              else
                txi_config_document_warn ("could not open %s for writing: %s",
                                      dump_structure_name, strerror (errno));

              free (dump_structure_name);
            }
          else
            {
              if (output_encoding)
                fprintf (stderr, "OUTPUT_ENCODING: %s\n", output_encoding);
              fprintf (stderr, "%s", debug_tree);
            }
          free (debug_tree);
        }

      if (!strcmp (output_format, "structure"))
        goto next_input_file;

      if (file_index != 0)
        {
          if (!non_first_file_cmdline_initialized)
            {
              initialize_options_list (&non_first_file_cmdline_options);
              non_first_file_cmdline_initialized = 1;
            }
          copy_options_list (&non_first_file_cmdline_options,
                             &cmdline_options);
          options_list_remove_option_number (&non_first_file_cmdline_options,
                                 program_options.options->OUTFILE.number);
          options_list_remove_option_number (&non_first_file_cmdline_options,
                                 program_options.options->PREFIX.number);
          if (split_option && split_option->o.string
              && strlen (split_option->o.string))
            options_list_remove_option_number (
                                 &non_first_file_cmdline_options,
                                 program_options.options->SUBDIR.number);

          file_cmdline_options = &non_first_file_cmdline_options;
        }
      else
        file_cmdline_options = &cmdline_options;

      /* conversion initialization */
      copy_options_list (&convert_options, &program_options);
      copy_options_list (&convert_options, init_files_options);
      copy_options_list (&convert_options, file_cmdline_options);

      if (file_index != 0)
        clear_options_list (&non_first_file_cmdline_options);

      /* prepend to INCLUDE_DIRECTORIES by resetting include directories to
         merged prepended directories and command line include directories */
      converter_include_dirs_option
        = &convert_options.options->INCLUDE_DIRECTORIES;
      converter_include_dirs = converter_include_dirs_option->o.strlist;
      clear_strings_list (converter_include_dirs);
      copy_strings (converter_include_dirs, &prepended_include_directories);
      copy_strings (converter_include_dirs, cmdline_include_dirs);

      /* set TEXINFO_LANGUAGE_DIRECTORIES by prepending current directory
         and input directory to texinfo_language_config_dirs */
      converter_texinfo_language_directories_option
        = &convert_options.options->TEXINFO_LANGUAGE_DIRECTORIES;
      converter_texinfo_language_config_dirs
        = converter_texinfo_language_directories_option->o.strlist;
      clear_strings_list (converter_texinfo_language_config_dirs);

      add_string (curdir, converter_texinfo_language_config_dirs);
      if (canon_input_dir && strcmp (curdir, canon_input_dir))
        {
          add_string (input_directory,
                      converter_texinfo_language_config_dirs);
        }

      copy_strings (converter_texinfo_language_config_dirs,
                    texinfo_language_config_dirs);

      txi_converter_initialization_setup (converter_init_info,
                                          &deprecated_directories,
                                          &convert_options);

      converter = txi_converter_setup (external_module,
                                       converted_format,
                                       converter_init_info);

      /* conversion */
      /* If Perl output conversion is called, a minimal Perl document is
         built before calling the conversion */
      /* return value can be NULL in case of errors or an empty string, but
         not anything else as parse_file is used with a file */
      result = txi_converter_output (converter, document, external_module);

      free (result);
      clear_converter_initialization_info (converter_init_info);

      errors_count
        = merge_opened_files (&opened_files,
                     &converter->output_files_information.opened_files,
                              errors_count);

      errors_nr
        = txi_output_converter_error_messages (converter,
                                       set_message_encoding, no_warn,
                                       test_mode_set);

      errors_count = handle_errors (errors_nr, errors_count, &opened_files);

      if (converter->output_files_information.unclosed_files.number > 0)
        {
          FILE_STREAM_LIST *unclosed_files
            = &converter->output_files_information.unclosed_files;

          for (j = 0; j < unclosed_files->number; j++)
            {
              FILE_STREAM *file_stream = &unclosed_files->list[j];
               /*
              fprintf (stderr, "%zu: Unclosed file %p %p '%s' %p %p\n", j,
                unclosed_files, file_stream,
                file_stream->file_path, file_stream->stream, file_stream->io);
                */
              if (!strcmp (file_stream->file_path, "-"))
                /* we may be overwriting information on C file stream
                   but it is not an issue, as it is probably more
                   important to close the PerlIO, and it is not clear if it
                   is possible to close both.  Also using stdout for more than
                   one type of output should be considered as an error,
                   so it is not a big deal if there are no error messages
                   if stdout cannot be closed in that case.
                 */
                {
                  main_program_unclosed_stdout = *file_stream;
                  /* do not keep the original file path, as it is held by
                     the converter which is bound to be destroyed,
                     while main_program_unclosed_stdout data must survive
                     until the end of the program.
                   */
                  main_program_unclosed_stdout.file_path = "-";
                }
              else
                {
                  int close_error = txi_close_file_stream (program_file,
                                                           file_stream);

                  if (close_error)
                    errors_count = handle_errors (close_error,
                                               errors_count, &opened_files);
                }
            }
        }

    /* Reset now that we got the information.  Could be important if we reused
       the converter. */
      clear_output_files_information (&converter->output_files_information);

      if (format_specification->flags & STTF_internal_links
          && file_index == 0)
        {
          OPTION *internal_links_option
            = GNUT_get_conf (program_options.options->INTERNAL_LINKS.number);
          if (internal_links_option && internal_links_option->o.string)
            {
              char *internal_links_file_name;
              char *internal_links_text
               = html_output_internal_links (converter);
              FILE *file_fh;
              OUTPUT_FILES_INFORMATION output_files_information;
              char *open_error_message;
              int overwritten_file;
              char *encoded_internal_links_file_name
                = internal_links_option->o.string;
              int error_internal_links_file = 0;

              if (!internal_links_text)
                internal_links_text = strdup ("");

              internal_links_file_name
                 = GNUT_decode_input (encoded_internal_links_file_name);

              memset (&output_files_information, 0,
                      sizeof (OUTPUT_FILES_INFORMATION));

              file_fh = output_files_open_out (&output_files_information,
                                        encoded_internal_links_file_name,
                                               &open_error_message,
                                               &overwritten_file, 0);

          /* overwritten_file, set if the file has already been used
             in this files_information is not checked as this cannot happen.
           */

              if (file_fh)
                {
                  write_to_file (internal_links_text, file_fh,
                                 encoded_internal_links_file_name);

                  if (!strcmp (internal_links_file_name, "-"))
                    {
                      main_program_unclosed_stdout.stream = file_fh;
                      main_program_unclosed_stdout.file_path = "-";
                    }
                  else
                    {
                      output_files_register_closed (&output_files_information,
                                            encoded_internal_links_file_name);
                      if (fclose (file_fh))
                        {
                          txi_config_document_warn (
                               "error on closing internal links file %s: %s",
                               internal_links_file_name, strerror (errno));
                          error_internal_links_file = 1;
                        }
                    }
                }
              else
                {
                  txi_config_document_warn ("could not open %s for writing: %s",
                                 internal_links_file_name, open_error_message);
                  error_internal_links_file = 1;
                }

              error_internal_links_file
                = merge_opened_files (&opened_files,
                                  &output_files_information.opened_files,
                                  error_internal_links_file);

              if (error_internal_links_file)
                {
                  errors_count = handle_errors (error_internal_links_file,
                                                errors_count, &opened_files);
                }

              free_output_files_information (&output_files_information);
              free (internal_links_file_name);
              free (internal_links_text);
            }
        }

      if ((test_option && test_option->o.integer > 0)
          || file_index < input_files.number -1)
        {
          txi_converter_remove_output_units (converter, external_module);

          /* destroy converter */
          txi_destroy_converter (converter, external_module);
        }

      if (file_index == 0)
        {
          const char *sort_element_count_file_name = 0;
          if (sort_element_count_option && sort_element_count_option->o.string)
            {
              sort_element_count_file_name
                = sort_element_count_option->o.string;
            }

          /* The main work is done by txi_sort_element_counts, which in
             turn calls Perl code */
          if (sort_element_count_file_name
              && embedded_interpreter != txi_interpreter_use_embedded)
            {
              fprintf (stderr,
                       "ERROR: no interpreter for SORT_ELEMENT_COUNT\n");
              exit (EXIT_FAILURE);
            }

          if (sort_element_count_file_name)
            {
              char *sort_element_count_text;
              CONVERTER_TEXT_INFO *sort_element_count_info;
              OPTION *use_nodes_option
               = GNUT_get_conf (program_options.options->USE_NODES.number);
              int no_use_nodes = (use_nodes_option
                                  && use_nodes_option->o.integer == 0);
              int use_sections
                = (!(format_specification->flags & STTF_nodes_tree)
                   || no_use_nodes);

              OPTION *sort_element_count_words_option
                = GNUT_get_conf (
                    program_options.options->SORT_ELEMENT_COUNT_WORDS.number);
              OPTION *output_file_name_encoding_option
                = GNUT_get_conf (
                 program_options.options->OUTPUT_FILE_NAME_ENCODING.number);
              OPTION *doc_encoding_for_output_file_name_option
                = GNUT_get_conf (
               program_options.options->DOC_ENCODING_FOR_OUTPUT_FILE_NAME.number);

              FILE *file_fh;
              OUTPUT_FILES_INFORMATION output_files_information;
              char *open_error_message;
              int overwritten_file;
              char *path_encoding;
              char *encoded_sort_element_count_file_name;
              int error_element_count_file = 0;
              char *output_file_name_encoding = 0;

              /* set such that the code releasing the document is called from
                 Perl */
              if (!external_module)
                external_module = elt_count_external_module;

              /* reuse converter options list memory */
              clear_options_list (&convert_options);

              copy_options_list (&convert_options, &program_options);
              copy_options_list (&convert_options, init_files_options);
              copy_options_list (&convert_options, &cmdline_options);

          /* prepend to INCLUDE_DIRECTORIES by resetting include directories to
             merged prepended directories and command line include directories */
              converter_include_dirs_option
                = &convert_options.options->INCLUDE_DIRECTORIES;
              converter_include_dirs = converter_include_dirs_option->o.strlist;
              clear_strings_list (converter_include_dirs);
              copy_strings (converter_include_dirs, &prepended_include_directories);
              copy_strings (converter_include_dirs, cmdline_include_dirs);

              sort_element_count_info
               = txi_sort_element_counts (elt_count_external_module,
                     &convert_options, document,
                     use_sections, (sort_element_count_words_option
                         && sort_element_count_words_option->o.integer > 0));

              /* output resulting text in the sort_element_count_file_name */
              sort_element_count_text = sort_element_count_info->text;

              if (!sort_element_count_text)
                sort_element_count_text = strdup ("");

              if (output_file_name_encoding_option)
                output_file_name_encoding
                  = output_file_name_encoding_option->o.string;
              encoded_sort_element_count_file_name
                  = encoded_output_file_name (output_file_name_encoding,
         (!(doc_encoding_for_output_file_name_option
          && doc_encoding_for_output_file_name_option->o.integer == 0)),
                       locale_encoding, &document->global_info,
                     (char *)sort_element_count_file_name, &path_encoding, 0);
              free (path_encoding);

              memset (&output_files_information, 0,
                      sizeof (OUTPUT_FILES_INFORMATION));

              file_fh = output_files_open_out (&output_files_information,
                                        encoded_sort_element_count_file_name,
                                               &open_error_message,
                                               &overwritten_file, 0);

          /* overwritten_file, set if the file has already been used
             in this files_information is not checked as this cannot happen.
           */

              if (file_fh)
                {
                  write_to_file (sort_element_count_text, file_fh,
                                 encoded_sort_element_count_file_name);

                  if (!strcmp (sort_element_count_file_name, "-"))
                    {
                      output_files_register_closed (&output_files_information,
                                         encoded_sort_element_count_file_name);
                      if (fclose (file_fh))
                        {
                          txi_config_document_warn (
                               "error on closing internal links file %s: %s",
                               sort_element_count_file_name, strerror (errno));
                          error_element_count_file = 1;
                        }
                    }
                  else
                    {
                      main_program_unclosed_stdout.stream = file_fh;
                      main_program_unclosed_stdout.file_path = "-";
                    }
                }
              else
                {
                  txi_config_document_warn ("could not open %s for writing: %s",
                             sort_element_count_file_name, open_error_message);
                  error_element_count_file = 1;
                }
              free (encoded_sort_element_count_file_name);
              free (sort_element_count_text);

              txi_converter_remove_output_units (
                                   sort_element_count_info->converter,
                                   elt_count_external_module);
              /* destroy converter and sort_element_count_info */
              txi_destroy_converter (sort_element_count_info->converter,
                                     elt_count_external_module);
              free (sort_element_count_info);

              error_element_count_file
                = merge_opened_files (&opened_files,
                                  &output_files_information.opened_files,
                                  error_element_count_file);

              if (error_element_count_file)
                {
                  errors_count = handle_errors (error_element_count_file,
                                                errors_count, &opened_files);
                }

              free_output_files_information (&output_files_information);
            }
        }

    next_input_file:
      if ((test_option && test_option->o.integer > 0)
          || file_index < input_files.number -1)
        /* destroy document */
        txi_destroy_document (document, external_module, remove_references);

      free (input_directory);
      free (canon_input_dir);
      free (input_file_name);
      free (input_file_path);

      clear_strings_list (&prepended_include_directories);
      clear_options_list (&convert_options);
    }

  if (main_program_unclosed_stdout.file_path)
    {
      int close_error = txi_close_file_stream (program_file,
                                         &main_program_unclosed_stdout);
      if (close_error)
        errors_count = handle_errors (close_error, errors_count, &opened_files);
    }

  destroy_converter_initialization_info (converter_init_info);

  if (non_first_file_cmdline_initialized)
    free_options_list (&non_first_file_cmdline_options);

  free_strings_list (&prepended_include_directories);
  free_options_list (&convert_options);

  if (call_texi2dvi)
    {
      OPTION *texi2dvi_option
        = GNUT_get_conf (program_options.options->TEXI2DVI.number);

     /* For efficiency, reuse debug variable value for verbose too */
      OPTION *verbose_option
        = GNUT_get_conf (program_options.options->VERBOSE.number);
      if (verbose_option && verbose_option->o.integer > 0)
        debug = 1;

      if (!texi2dvi_option || !texi2dvi_option->o.string
          || !strlen (texi2dvi_option->o.string))
        {
          errors_count = handle_errors (1, errors_count, &opened_files);
        }
      else
        {
          STRING_LIST tmp_strings;

          memset (&tmp_strings, 0, sizeof (STRING_LIST));

          texi2dvi = strdup (texi2dvi_option->o.string);

          /* prepend texi2dvi to texi2dvi_args */
          copy_strings (&tmp_strings, &texi2dvi_args);
          clear_strings_list (&texi2dvi_args);
          add_string (texi2dvi, &texi2dvi_args);
          merge_strings (&texi2dvi_args, &tmp_strings);
          tmp_strings.number = 0;
          free_strings_list (&tmp_strings);

          merge_strings (&texi2dvi_args, &input_files);
          input_files.number = 0;
        }
    }

  free_strings_list (&input_files);

  free_options_list (&parser_options);

  free (program_basename);
  free (program_file);

  free_options_list (&cmdline_options);
  free_options_list (init_files_options);
  free_options_list (&program_options);

  free_strings_list (&conf_dirs);
  free_strings_list (&prepend_dirs);

  free_strings_list (&converter_init_dirs);
  free_strings_list (&converter_config_dirs);

  free_deprecated_dirs_list (&deprecated_dirs_used);
  free_deprecated_dirs_list (&deprecated_directories);

  destroy_strings_list (texinfo_language_config_dirs);
  wipe_values (&values);

  free_strings_list (&internal_extension_dirs);
  free (extensions_dir);

  txi_stop_interpreter (embedded_interpreter);

  free_strings_list (&opened_files);

  if (call_texi2dvi && texi2dvi)
    {
      char **argv;
      size_t i;

      if (debug)
        {
          char *texi2dvi_call = join_strings_list (&texi2dvi_args);
          fprintf (stderr, "EXEC %s\n", texi2dvi_call);
          free (texi2dvi_call);
        }
      argv = (char **) malloc ((texi2dvi_args.number +1) * sizeof (char *));
      for (i = 0; i < texi2dvi_args.number; i++)
        argv[i] = strdup (texi2dvi_args.list[i]);
      argv[texi2dvi_args.number] = NULL;

      free_strings_list (&texi2dvi_args);

      execvp (texi2dvi, argv);
    }

  free_strings_list (&texi2dvi_args);
}
