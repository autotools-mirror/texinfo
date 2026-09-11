/* Copyright 2010-2026 Free Software Foundation, Inc.

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

/* functions in this file correspond to Texinfo::Convert::Converter */

#include <config.h>

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stddef.h>
#include <inttypes.h>
#include <sys/types.h>
#include <unitypes.h>
#include <unistr.h>
#include <unictype.h>
#include <errno.h>
/* mkdir stat */
#include <sys/stat.h>

#include "text.h"
#include "command_ids.h"
#include "element_types.h"
#include "tree_types.h"
#include "option_types.h"
#include "options_data.h"
#include "document_types.h"
#include "converter_types.h"
#include "global_commands_types.h"
/* for HTML_CONVERTER_STATE */
#include "html_converter_state.h"
#include "options_defaults.h"
#include "converters_options.h"
/* fatal isascii_alnum isascii_alpha */
#include "base_utils.h"
#include "tree.h"
#include "extra.h"
/* for ACCENTS_STACK find_innermost_accent_contents
   fatal xasprintf texinfo_input_file_basename ... */
#include "utils.h"
#include "customization_options.h"
#include "errors.h"
#include "builtin_commands.h"
#include "targets.h"
/* also for cmd_text data */
#include "convert_to_text.h"
/* for error message for debugging */
/* convert_to_texinfo */
#include "convert_to_texinfo.h"
#include "node_name_normalization.h"
/* expand_today free_tree_added_elements... */
#include "convert_utils.h"
/* for NAMED_STRING_ELEMENT_LIST new_named_string_element_list ... */
#include "translations.h"
#include "manipulate_tree.h"
#include "unicode.h"
#include "manipulate_indices.h"
#include "output_unit.h"
#include "document.h"
#include "api_to_perl.h"
#include "html_converter_api.h"
#include "plaintexinfo_converter_api.h"
#include "convert_to_plaintext.h"
#include "convert_to_info.h"
#include "rawtext_converter_api.h"
#include "convert_indices.h"
#include "converter.h"

/* Information about a converter implemented in C. */
typedef struct CONVERTER_FORMAT_DATA {
    const char *default_format;
    /* Class name of a Perl object through which this converter can be
       selected from Perl code, mainly for the creation of a new converter
       structure.  Relevant for Perl embedding C code. */
    const char *perl_converter_class;
    /* initialization of the converter library data independent of
       customization */
    void (* format_setup) (enum converter_format format);
    /* replaces the whole default converter initialization sequence
       (in Perl corresponds to a converter redefining the converter method) */
    void (* converter_converter) (CONVERTER *self,
                            const CONVERTER_INITIALIZATION_INFO *conf);
    /* next two are called from the default converter_converter
       implementation, if converter_converter is NULL */
    /* usually setup default customization options for the converter */
    CONVERTER_INITIALIZATION_INFO *
       (* converter_defaults) (enum converter_format format,
                               const CONVERTER_INITIALIZATION_INFO *conf);
    /* initialization of converter after getting customization options */
    void (* converter_initialize) (CONVERTER *self);
    /* convert a full document tree to an output file */
    TEXT (* converter_output) (CONVERTER *converter, DOCUMENT *document);
    /* convert a full document tree to a string without headers nor footers */
    TEXT (* converter_convert) (CONVERTER *converter, DOCUMENT *document);
    /* currently unused, could be modified when it become used, but it would
       probably be better to stick to that API to be consistent with Perl */
    /* expected to be called for conversions of sub trees */
    TEXT (* converter_convert_tree) (CONVERTER *converter,
                                       const ELEMENT *tree);
    void (* converter_release_output_units) (CONVERTER *self);
    void (* converter_free) (CONVERTER *self);
    /* overriding cdt_tree in HTML */
    ELEMENT * (*cdt_tree) (const char *string, CONVERTER *self,
                             NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                             const char *translation_context);
    /* overriding of element_cdt_tree in HTML */
    ELEMENT * (*element_cdt_tree) (const char *string, const ELEMENT *element,
                             CONVERTER *self,
                             NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                             const char *translation_context);
} CONVERTER_FORMAT_DATA;

/* table used to dispatch format specific functions.
   Same purpose as inherited methods in Texinfo::Convert::Converter */
/* Should be kept in sync with enum converter_format
   and TXI_CONVERSION_FORMAT_NR */
/* plaintext and info are first such that the index can also simply
   be used for their specific dispatch table index */
static CONVERTER_FORMAT_DATA converter_format_data[] = {
  {"plaintext", "Texinfo::Convert::Plaintext", &plaintext_format_setup, 0,
   &plaintext_converter_defaults,
   &plaintext_converter_initialize, &plaintext_output, &plaintext_convert,
   &plaintext_convert_tree, 0, &plaintext_free_converter, 0, 0},
  /* TODO having plaintext_format_setup here could lead to being called twice */
  {"info", "Texinfo::Convert::Info", &plaintext_format_setup, 0,
   &info_converter_defaults,
   &plaintext_converter_initialize, &info_output, &plaintext_convert,
   &plaintext_convert_tree, 0, &plaintext_free_converter, 0, 0},
  {"html", "Texinfo::Convert::HTML", &html_format_setup, 0,
   &html_converter_defaults,
   &html_converter_initialize, &html_output, &html_convert,
   &html_convert_tree, 0, &html_free_converter,
   &html_cdt_tree, &html_element_cdt_tree},
  {"rawtext", "Texinfo::Convert::Text", 0, &rawtext_converter,
   0, 0, &rawtext_output,
   &rawtext_convert, &rawtext_convert_tree, 0, 0, 0, 0},
  {"plaintexinfo", "Texinfo::Convert::PlainTexinfo", 0, 0,
   &plaintexinfo_converter_defaults, 0, &plaintexinfo_output,
   &plaintexinfo_convert, &plaintexinfo_convert_tree, 0, 0, 0, 0},
};

/* associate lower case no brace accent command to the upper case
   corresponding commands */
enum command_id no_brace_command_accent_upper_case[][2] = {
  {CM_aa, CM_AA},
  {CM_ae, CM_AE},
  {CM_dh, CM_DH},
  {CM_l, CM_L},
  {CM_o, CM_O},
  {CM_oe, CM_OE},
  {CM_th, CM_TH},
  {0, 0},
};

/* can be used in converters */
enum command_id default_upper_case_commands[] = {
  CM_sc, 0,
};

/* In sync with Convert/Converter.pm %xml_accent_entities and
   %xml_accent_text_with_entities */
COMMAND_ACCENT_ENTITY_INFO xml_accent_text_entities[] = {
  {CM_DOUBLE_QUOTE,  {"uml",   "aeiouyAEIOU"}},
  {CM_TILDE,         {"tilde", "nNaoAO"}},
  {CM_CIRCUMFLEX,    {"circ",  "aeiouAEIOU"}},
  {CM_BACKQUOTE,     {"grave", "aeiouAEIOU"}},
  {CM_APOSTROPHE,    {"acute", "aeiouyAEIOUY"}},
  {CM_COMMA,         {"cedil", "cC"}},
  {CM_ringaccent,    {"ring",  "aA"}},
  {CM_ogonek,        {"ogon",  0}},
  {CM_dotless,       {"nodot", "i"}},
  {CM_dotaccent,     {"dot", 0}},
  {CM_EQUALS,        {"macr", 0}},
  {CM_u,             {"breve", 0}},
  {CM_v,             {"caron", 0}},
  {CM_H,             {"dblac", 0}},
  {0,                {0,       0}}
};

static CONVERTER **converter_list;
static size_t converter_number;
static size_t converter_space;

const char *xml_text_entity_no_arg_commands_formatting[BUILTIN_CMD_NUMBER];

/* Needs to be called before initialization of HTML converter. */

void
setup_converter_generic (void)
{
  int i;
  /* conversion specific information */

  for (i = 0; i < BUILTIN_CMD_NUMBER; i++)
    {
      if (xml_text_entity_no_arg_commands[i])
        xml_text_entity_no_arg_commands_formatting[i]
          = xml_text_entity_no_arg_commands[i];
      else if (nobrace_symbol_text[i])
        xml_text_entity_no_arg_commands_formatting[i] = nobrace_symbol_text[i];
      else if (text_brace_no_arg_commands[i])
        xml_text_entity_no_arg_commands_formatting[i]
          = text_brace_no_arg_commands[i];
    }

  /* For translation in document string. */
  if (0)
    {
      /* TRANSLATORS: expansion of @error{} as Texinfo code */
      (void) gdt_noop("error@arrow{}");
    }
}



enum converter_format
find_format_name_converter_format (const char *format)
{
  int i;

  for (i = 0; i < TXI_CONVERSION_FORMAT_NR; i++)
    if (!strcmp (converter_format_data[i].default_format, format))
      return i;

  return COF_none;
}

enum converter_format
find_perl_converter_class_converter_format (const char *class_name)
{
  int i;

  if (class_name)
    {
      for (i = 0; i < TXI_CONVERSION_FORMAT_NR; i++)
        if (!strcmp (converter_format_data[i].perl_converter_class, class_name))
          return i;
    }

  return COF_none;
}

const char *
converter_format_name (enum converter_format format)
{
  if (format == COF_unknown)
    return "unknown";
  else if (format == COF_none)
    return "generic";
  else
    return converter_format_data[format].default_format;
}

const char *
converter_format_perl_class_name (enum converter_format format)
{
  if (format == COF_unknown)
    return "unknown";
  else if (format == COF_none)
    return "generic";
  else
    return converter_format_data[format].perl_converter_class;
}

/* Initialize converter data (independent of customization) */
/* Corresponds to code run directly in the module namespace when doing
   use/require $module in Perl */
void
setup_converter_format (enum converter_format converter_format)
{
  /* initialization of the library for the generic converter */
  setup_converter_generic ();

  if (converter_format != COF_none)
    {
      /* initialization of the library for a specific output format */
      if (converter_format_data[converter_format].format_setup)
        {
          void (* init_format_setup) (enum converter_format format)
            = converter_format_data[converter_format].format_setup;
          init_format_setup (converter_format);
        }
    }
}

CONVERTER *
retrieve_converter (size_t converter_descriptor)
{
  if (converter_descriptor <= converter_number
      && converter_list[converter_descriptor -1] != 0)
    return converter_list[converter_descriptor -1];
  return 0;
}

static void
set_generic_converter_options (OPTIONS *options)
{
  set_converter_cmdline_options_defaults (options);
  set_converter_customization_options_defaults (options);
  set_unique_at_command_options_defaults (options);
  set_multiple_at_command_options_defaults (options);
  set_converter_common_regular_options_defaults (options);
}

/* to do as in Perl, if IF_SET_IN_LIST, only set options that have
   OF_set_in_list set.  Otherwise set all the options.
   The case with IF_SET_IN_LIST set corresponds to the converter,
   where only user-defined command options are set, the other case
   corresponds to the HTML converter case, where all the options are
   set. */
/* NOTE the values set here are actually used only if set in
   command_init, which is the only function that use these values,
   so it could also have been possible to set the values only if
   set.  However, it is better to do as in Perl to avoid surprises.
 */
void
set_commands_options_value (COMMAND_OPTION_VALUE *commands_init_conf,
                            OPTION **sorted_options, int if_set_in_list)
{
  size_t i;

  for (i = 0; i < TXI_COMMAND_OPTIONS_NR; i++)
    {
      const COMMAND_OPTION_NUMBER_CMD *option_nr_cmd
        = &txi_options_command_map[i];
      const OPTION *option = sorted_options[option_nr_cmd->option_number -1];

      if (if_set_in_list && !(option->flags & OF_set_in_list))
        continue;

      if (option->type == GOT_integer)
        {
          commands_init_conf[option_nr_cmd->cmd].type = option->type;
          commands_init_conf[option_nr_cmd->cmd].v.value
            = option->o.integer;
        }
      else if (option->type == GOT_char)
        {
          commands_init_conf[option_nr_cmd->cmd].type = option->type;
          free (commands_init_conf[option_nr_cmd->cmd].v.string);

          if (option->o.string)
            {
              commands_init_conf[option_nr_cmd->cmd].v.string
                = strdup (option->o.string);
            }
          else
            commands_init_conf[option_nr_cmd->cmd].v.string = 0;
        }
      commands_init_conf[option_nr_cmd->cmd].set = 1;
    }
}

/* initialize the converter */
/* corresponds to setting %all_converters_defaults in Perl */
static void
init_generic_converter (CONVERTER *self)
{
  self->conf = new_options ();
  self->sorted_options = new_sorted_options (self->conf);

  set_generic_converter_options (self->conf);

  self->expanded_formats = new_expanded_formats ();

  /* set 'translated_commands'  => {'error' => 'error@arrow{}',}, */

  add_translated_command (&self->translated_commands, CM_error,
                          "error@arrow{}");
}

/* Allocate a converter without any initialization such as to leave
   open the choice of functions used to setup the converter */
/* descriptor starts at 1, 0 is not found or an error */
size_t
new_converter (enum converter_format format)
{
  size_t converter_index;
  int slot_found = 0;
  size_t i;
  CONVERTER *converter;

  for (i = 0; i < converter_number; i++)
    {
      if (converter_list[i] == 0)
        {
          slot_found = 1;
          converter_index = i;
        }
    }
  if (!slot_found)
    {
      if (converter_number == converter_space)
        {
          converter_list = realloc (converter_list,
                              (converter_space += 5) * sizeof (CONVERTER *));
          if (!converter_list)
            fatal ("realloc failed");
        }
      converter_index = converter_number;
      converter_number++;
    }
  converter = (CONVERTER *) malloc (sizeof (CONVERTER));
  memset (converter, 0, sizeof (CONVERTER));

  converter->format = format;

  converter_list[converter_index] = converter;
  converter->converter_descriptor = converter_index +1;

  /*
  fprintf (stderr, "REGISTER CONVERTER %zu %d %p %p\n", converter_index +1,
                                   format, converter, converter->document);
   */
  return converter_index +1;
}

/* apply initialization information from one source */
void
apply_converter_info (CONVERTER *converter,
         const CONVERTER_INITIALIZATION_INFO *init_info, int set_configured)
{
  copy_options_list_set_configured (converter->conf,
                                    converter->sorted_options,
                                    &init_info->conf, set_configured);

  if (init_info->translated_commands.number)
    {
      clear_translated_commands (&converter->translated_commands);
      copy_translated_commands (&converter->translated_commands,
                                &init_info->translated_commands);
    }

  copy_deprecated_dirs (&converter->deprecated_config_directories,
                        &init_info->deprecated_config_directories);
}

/* apply format_defaults and user_conf initialization information.
   Corresponds to Perl _generic_converter_init.
 */
void
set_converter_init_information (CONVERTER *converter,
                       const CONVERTER_INITIALIZATION_INFO *format_defaults,
                       const CONVERTER_INITIALIZATION_INFO *user_conf)
{
  init_generic_converter (converter);

  if (format_defaults)
    {
      apply_converter_info (converter, format_defaults, 0);

      /* Note that it is important to use format_defaults and not
         converter similar data even though the options values are
         copied to the converter, because the flags are not copied, and
         are needed for set_commands_options_value with third argument
         set */
      set_commands_options_value (converter->commands_init_conf,
                                  format_defaults->conf.sorted_options, 1);
    }

  if (user_conf)
    {
      apply_converter_info (converter, user_conf, 1);

      set_commands_options_value (converter->commands_init_conf,
                                  user_conf->conf.sorted_options, 1);
    }

  set_expanded_formats_from_options (converter->expanded_formats,
                                     converter->conf);

  if (converter->conf->documentlanguage.o.string)
    {
      converter->current_lang_translations
       = set_translations_documentlanguage (&converters_translation_cache,
                         converter->conf->documentlanguage.o.string, 0,
                            TXI_CONVERT_STRINGS_NR);
    }
  if (converter->conf->documentscript.o.string)
    {
      converter->current_lang_translations
       = set_translations_documentscript (&converters_translation_cache,
                         converter->conf->documentscript.o.string,
                            converter->current_lang_translations,
                            TXI_CONVERT_STRINGS_NR);
    }

  /*
  fprintf (stderr, "C|CONVERTER Fill conf: %d; %s, %s\n",
                   converter->converter_descriptor,
                   converter->conf->TEXINFO_OUTPUT_FORMAT.o.string);
   */
}

void
clear_converter_initialization_info (CONVERTER_INITIALIZATION_INFO *init_info)
{
  clear_translated_commands (&init_info->translated_commands);

  clear_options_list (&init_info->conf);

  clear_deprecated_dirs_list (&init_info->deprecated_config_directories);

  clear_strings_list (&init_info->non_valid_customization);
}

void
destroy_converter_initialization_info (CONVERTER_INITIALIZATION_INFO *init_info)
{
  free_translated_commands (&init_info->translated_commands);

  free_options_list (&init_info->conf);

  free_deprecated_dirs_list (&init_info->deprecated_config_directories);

  free_strings_list (&init_info->non_valid_customization);
  free (init_info);
}

/* not used */
void
copy_converter_initialization_info (CONVERTER_INITIALIZATION_INFO *dst_info,
                               const CONVERTER_INITIALIZATION_INFO *src_info)
{
  copy_strings (&dst_info->non_valid_customization,
                &src_info->non_valid_customization);

  copy_options_list (&dst_info->conf, &src_info->conf);

  if (src_info->translated_commands.number)
    {
      clear_translated_commands (&dst_info->translated_commands);
      copy_translated_commands (&dst_info->translated_commands,
                                &src_info->translated_commands);
    }
}

/* corresponds to Perl $converter->converter_defaults() or
   Texinfo::Convert:XXXX->converter_defaults() */
CONVERTER_INITIALIZATION_INFO *
converter_defaults (enum converter_format converter_format,
                    const CONVERTER_INITIALIZATION_INFO *user_conf)
{
  if (converter_format != COF_none)
    {
      if (converter_format_data[converter_format].converter_defaults)
        {
          CONVERTER_INITIALIZATION_INFO *
            (* format_converter_defaults) (enum converter_format format,
                             const CONVERTER_INITIALIZATION_INFO *conf)
            = converter_format_data[converter_format].converter_defaults;
          return format_converter_defaults (converter_format, user_conf);
        }
      else
        { /* Texinfo::Convert::Converter implementation */
          CONVERTER_INITIALIZATION_INFO *format_defaults
           = new_converter_initialization_info ();

          add_converter_defaults_regular_options_defaults
                                               (&format_defaults->conf);
          return format_defaults;
        }
    }
  return 0;
}

/* Next four functions are not called from Perl as the Perl equivalent
   functions are already called (and possibly overriden).  Inheritance
   in Perl is replaced by dispatching using a table here.

   converter_initialize cannot be overriden fully in HTML as long as Perl
   code is needed to setup customization in Perl.  Therefore, there is
   no prospect of overriding converter_initialize for now, and therefore
   of overridding converter_converter.  Those functions are only meant
   for pure C.
 */
/* corresponds to Perl $converter->converter_initialize() Converter */
/* default is to do nothing */
void
converter_initialize (CONVERTER *converter)
{
  if (converter->format != COF_none
      && converter_format_data[converter->format].converter_initialize)
    {
      void (* format_converter_initialize) (CONVERTER *self)
        = converter_format_data[converter->format].converter_initialize;
      format_converter_initialize (converter);
    }
}

/* Texinfo::Convert::XXXX->converter($conf) in Perl */
/* only called from C, not from Perl */
CONVERTER *
converter_converter (enum converter_format format,
                     const CONVERTER_INITIALIZATION_INFO *user_conf)
{
  size_t converter_descriptor = new_converter (format);
  CONVERTER *converter = retrieve_converter (converter_descriptor);

  if (converter->format != COF_none
      && converter_format_data[converter->format].converter_converter)
    {/* corresponds, in Perl, to a converter not inheriting
        Texinfo::Convert::Converter, such as the Text converter to rawtext */
      void (* format_converter_converter) (CONVERTER *self,
                         const CONVERTER_INITIALIZATION_INFO *user_conf)
        = converter_format_data[converter->format].converter_converter;
      format_converter_converter (converter, user_conf);
    }
  else
    {
      CONVERTER_INITIALIZATION_INFO *format_defaults;

      format_defaults = converter_defaults (converter->format, user_conf);

      set_converter_init_information (converter, format_defaults, user_conf);

      destroy_converter_initialization_info (format_defaults);

      converter_initialize (converter);
    }
  return converter;
}

TEXT
converter_output (CONVERTER *self, DOCUMENT *document)
{
  enum converter_format converter_format = self->format;

  if (converter_format != COF_none
      && converter_format_data[converter_format].converter_output)
    {
      TEXT result;
      TEXT (* format_converter_output) (CONVERTER *self,
                                          DOCUMENT *document)
        = converter_format_data[converter_format].converter_output;
      result = format_converter_output (self, document);
      return result;
    }
  TEXT t;
  text_init (&t);
  return t;
}

TEXT
converter_convert (CONVERTER *self, DOCUMENT *document)
{
  enum converter_format converter_format = self->format;

  if (converter_format != COF_none
      && converter_format_data[converter_format].converter_convert)
    {
      TEXT result;
      TEXT (* format_converter_convert) (CONVERTER *self,
                                          DOCUMENT *document)
        = converter_format_data[converter_format].converter_convert;
      result = format_converter_convert (self, document);
      return result;
    }
  TEXT t;
  text_init (&t);
  return t;
}

static void
destroy_converter_index_sorting (CONVERTER *converter)
{
  if (converter->indices_sort_strings)
    {
      destroy_index_entries_sort_strings (converter->indices_sort_strings);
      converter->indices_sort_strings = 0;
    }

  if (converter->sorted_indices_by_index)
    {
      destroy_sorted_indices_by_index (converter->sorted_indices_by_index);
      converter->sorted_indices_by_index = 0;
    }

  if (converter->sorted_indices_by_letter)
    {
      destroy_sorted_indices_by_letter (converter->sorted_indices_by_letter);
      converter->sorted_indices_by_letter = 0;
    }
}

void
converter_set_document (CONVERTER *converter, DOCUMENT *document)
{
   /*
  if (document)
    {
      fprintf (stderr, "C|CONVERTER %d: Document %d\n",
           converter->converter_descriptor, document->descriptor);
    }
    */

  /*
    If there is already an associated document, reset information linked
    to the document.

    We do not call destroy_converter_output_units because it should be the
    caller responsibility to decide when the output units should be
    destroyed.

    The output units will be freed if the document is destroyed anyway.
   */
  if (converter->document)
    {
      int i;
      for (i = 0; i < OUDT_external_nodes_units+1; i++)
        /* FIXME do that only if converter->html_converter, or
           put in the generic converter or move to HTML specific code?
           For some reason this
           does not trigger a segmentation fault.  Because this is
           not often called as it requires reusing a converter?
         */
        converter->html_converter->output_units_descriptors[i] = 0;
      converter->document = 0;
    }

  destroy_converter_index_sorting (converter);

  if (document)
    {
      converter->document = document;

      set_output_encoding (converter->conf, converter->document);
    }

  if (converter->convert_text_options)
    /* should only happen if a converter is reused */
    destroy_text_options (converter->convert_text_options);

  converter->convert_text_options
    = copy_converter_options_for_convert_text (converter);
}

/* default implementation used in converter_output_tree */
void
converter_conversion_initialization (CONVERTER *converter, DOCUMENT *document)
{
  converter_set_document (converter, document);
}

/* output fo $fh if defined, otherwise return the text. */
/* NOTE TEXT should not be modified (by iconv), but it cannot be marked
   as const if the iconv call does not have a const in prototype */
/* if the TEXT contains NUL, TEXT_LEN should be specified */
void
write_or_return (const ENCODING_CONVERSION *conversion,
                 const char *encoded_out_filepath,
                 FILE *file_fh, TEXT *result, char *text,
                 size_t text_len)
{
  if (file_fh)
    {
      char *result;
      size_t res_len;
      size_t write_len;

      if (text_len == 0)
        text_len = strlen (text);

      if (conversion)
        {
          /* cast to remove the const, for the prototype */
          TEXT conv_result = encode_with_iconv (conversion->iconv,
                                      text, text_len, 0, ieh_error, 0);
          result = conv_result.text;
          res_len = conv_result.end;
        }
      else
        {
          result = text;
          res_len = text_len;
        }
      write_len = fwrite (result, sizeof (char),
                          res_len, file_fh);
      if (conversion)
        free (result);
      if (write_len != res_len)
        { /* register error message instead? */
          fprintf (stderr,
                   "ERROR: write to %s failed (%zu/%zu)\n",
                   encoded_out_filepath, write_len, res_len);
        }
    }
  else
    {
      if (text_len == 0)
        text_append (result, text);
      else
        text_append_n (result, text, text_len);
    }
}

TEXT
converter_output_tree (CONVERTER *converter, DOCUMENT *document,
    void * (* conversion_initialization)
                   (CONVERTER *converter, DOCUMENT *document),
    char * (* conversion_output_begin)
                   (CONVERTER *converter,
                    const char *output_file, const char *output_filename),
    char * (* conversion_output_end) (CONVERTER *converter),
    void * (* conversion_finalization) (CONVERTER *converter))
{
  int status = 1;
  ELEMENT *root = document->tree;
  int i;
  char *paths[5];
  char *dir_encoding;
  const char *output_file;
  const char *destination_directory;
  const char *output_filename;
  FILE *file_fh = 0;
  char *encoded_destination_directory;
  int succeeded;
  const ENCODING_CONVERSION *conversion = 0;
  TEXT result;
  char *encoded_out_filepath = 0;
  TEXT tree_result;

  TEXT (* format_convert_tree) (CONVERTER *converter,
                                 const ELEMENT *tree)
    = converter_format_data[converter->format].converter_convert_tree;

  if (conversion_initialization)
    {
      conversion_initialization (converter, document);
    }
  else
    converter_conversion_initialization (converter, document);

  determine_files_and_directory (converter,
                    converter->conf->TEXINFO_OUTPUT_FORMAT.o.string, paths);

  output_file = paths[0];
  destination_directory = paths[1];
  output_filename = paths[2];

  /* cast to remove const since the argument cannot
     be const even though the string is not modified */
  encoded_destination_directory
             = converter_encoded_output_file_name (converter->conf,
                                            &converter->document->global_info,
                                           (char *)destination_directory,
                                                       &dir_encoding, 0);
  free (dir_encoding);

  succeeded = create_destination_directory (converter,
                                     encoded_destination_directory,
                                           destination_directory);

  free (encoded_destination_directory);

  if (!succeeded)
    {
      if (conversion_finalization)
        conversion_finalization (converter);
      status = 0;
      goto finalization;
    }

  if (strlen (output_file))
    {
      char *path_encoding;
      int overwritten_file;
      char *open_error_message;

      encoded_out_filepath
          = converter_encoded_output_file_name (converter->conf,
                                       &converter->document->global_info,
                                  (char *)output_file, &path_encoding, 0);
      /* overwritten_file being set cannot happen */
      file_fh = output_files_open_out (&converter->output_files_information,
                                   encoded_out_filepath, &open_error_message,
                                   &overwritten_file, 0);
      free (path_encoding);

      if (!file_fh)
        {
          message_list_document_error (&converter->error_messages,
                             converter->conf, 0,
                             "could not open %s for writing: %s",
                             output_file, open_error_message);
          free (open_error_message);
          free (encoded_out_filepath);

          if (conversion_finalization)
            conversion_finalization (converter);
          status = 0;
          goto finalization;
        }
    }

  text_init (&result);
  text_append (&result, "");

  if (file_fh)
    {
      if (converter->conf->OUTPUT_ENCODING_NAME.o.string
          && strcmp (converter->conf->OUTPUT_ENCODING_NAME.o.string, "utf-8"))
        {
          conversion
             = get_encoding_conversion (
                           converter->conf->OUTPUT_ENCODING_NAME.o.string,
                                              &output_conversions);
        }
    }

  if (conversion_output_begin)
    {
      char *output_beginning = conversion_output_begin (converter,
                                                        output_file,
                                                        output_filename);
      if (output_beginning)
        {
          write_or_return (conversion, encoded_out_filepath,
                           file_fh, &result, output_beginning, 0);
          free (output_beginning);
        }
    }
  tree_result = format_convert_tree (converter, root);
  if (tree_result.text)
    {
      write_or_return (conversion, encoded_out_filepath,
                       file_fh, &result, tree_result.text, tree_result.end);
      free (tree_result.text);
    }

  if (conversion_output_end)
    {
      char *output_end = conversion_output_end (converter);
      if (output_end)
        {
          write_or_return (conversion, encoded_out_filepath,
                           file_fh, &result, output_end, 0);
          free (output_end);
        }
    }

  /* Do not close STDOUT now such that the file descriptor is not reused
     by open, which uses the lowest-numbered file descriptor not open,
     for another filehandle.  Closing STDOUT is handled by the caller. */
  if (file_fh && !strcmp (output_file, "-"))
    {
       output_files_register_closed
                         (&converter->output_files_information,
                          encoded_out_filepath);
      if (fclose (file_fh))
        {
          message_list_document_error (
             &converter->error_messages, converter->conf, 0,
             "error on closing %s: %s",
             output_file, strerror (errno));
        }
    }

  if (encoded_out_filepath)
    free (encoded_out_filepath);

  if (conversion_finalization)
    conversion_finalization (converter);

 finalization:

  for (i = 0; i < 5; i++)
    {
      free (paths[i]);
    }

  if (!status)
    text_destroy (&result);

  return result;
}



ELEMENT *
cdt_tree (const char *string, CONVERTER *self,
          NAMED_STRING_ELEMENT_LIST *replaced_substrings,
          const char *translation_context)
{
  int debug_level;

  if (self->format != COF_none
      && converter_format_data[self->format].cdt_tree)
    {
      ELEMENT * (*cdt_tree_fn) (const char *string, CONVERTER *self,
                             NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                             const char *translation_context)
        = converter_format_data[self->format].cdt_tree;

       return (*cdt_tree_fn) (string, self, replaced_substrings,
                              translation_context);
    }

  debug_level = self->conf->DEBUG.o.integer;

  return gdt_tree (string, self->document, self->current_lang_translations,
                   replaced_substrings, translation_context,
                   debug_level, 0);
}


ELEMENT *
element_cdt_tree (const char *string, const ELEMENT *element,
                  CONVERTER *self,
                  NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                  const char *translation_context)
{
  const LANG_TRANSLATION *lang_translation;
  const OPTIONS *options;
  int debug_level = 0;

  if (self->format != COF_none
      && converter_format_data[self->format].element_cdt_tree)
    {
      ELEMENT * (*element_cdt_tree_fn) (const char *string, const ELEMENT *element,
                             CONVERTER *self,
                             NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                             const char *translation_context)
            = converter_format_data[self->format].element_cdt_tree;
      return (*element_cdt_tree_fn) (string, element, self,
                                     replaced_substrings,
                                     translation_context);
    }

  lang_translation
    = new_element_language_translation (&converters_translation_cache,
                                        element, TXI_CONVERT_STRINGS_NR);
  options = self->conf;
  if (options && options->DEBUG.o.integer >= 0)
    debug_level = options->DEBUG.o.integer;

  return gdt_tree (string, self->document, lang_translation,
                   replaced_substrings, translation_context,
                   debug_level, 0);
}




/* RESULT should be a char * array of dimension 5 */
/* results to be freed by the caller */
void
determine_files_and_directory (CONVERTER *self, const char *output_format,
                               char **result)
{
  char *input_basename = 0;
  char *input_basefile;
  GLOBAL_INFO *document_info = 0;
  GLOBAL_COMMANDS *global_commands = 0;
  const char *setfilename = 0;
  const char *setfilename_for_outfile = 0;
  char *input_basename_for_outfile;
  /* the document path, in general the outfile without
     extension and can be set from setfilename if outfile is not set */
  char *document_path;
  char *output_file;
  const char *output_filepath;
  char *document_name_and_directory[2];
  char *output_filename_and_directory[2];
  char *document_name;
  char *output_filename;
  char *destination_directory;

  if (self->document)
    {
      document_info = &self->document->global_info;
      global_commands = &self->document->global_commands;
    }

  if (document_info && document_info->input_file_name)
    {
    /* 'input_file_name' is not decoded, as it is derived from input
       file which is not decoded either.  We want to return only
       decoded (utf-8) character strings such that they can easily be mixed
       with other character strings, so we decode here. */
      const char *encoding = self->conf->COMMAND_LINE_ENCODING.o.string;

      if (encoding)
        {
          int status;
          input_basefile = decode_string (document_info->input_file_name,
                                          encoding, &status, 0);
        }
      else
        input_basefile = strdup (document_info->input_file_name);
    }
  else /* This could happen if called on a piece of texinfo */
    input_basefile = strdup ("");

  if (!strcmp (input_basefile, "-"))
    input_basename = strdup ("stdin");
  else
    {
      input_basename = texinfo_input_file_basename (input_basefile);
    }

  if (self->conf->setfilename.o.string)
    setfilename = self->conf->setfilename.o.string;
  else if (global_commands && global_commands->setfilename)
    {
      enum command_id cmd;
      setfilename
        = informative_command_value (global_commands->setfilename, &cmd);
    }

  /* PREFIX overrides both setfilename and the input file base name */
  if (self->conf->PREFIX.o.string)
    {
      setfilename_for_outfile = 0;
      free (input_basename);
      input_basename_for_outfile = strdup (self->conf->PREFIX.o.string);
    }
  else
    {
      input_basename_for_outfile = input_basename;
      setfilename_for_outfile = setfilename;
    }

  /* determine output file and output file name */
  if (!self->conf->OUTFILE.o.string)
    {
      if (setfilename_for_outfile)
        {
          document_path = remove_extension (setfilename_for_outfile);

          if (self->conf->USE_SETFILENAME_EXTENSION.o.integer <= 0)
            {
              if (self->conf->EXTENSION.o.string
                  && strlen (self->conf->EXTENSION.o.string))
                {
                  xasprintf (&output_file, "%s.%s", document_path,
                             self->conf->EXTENSION.o.string);
                }
              else
                output_file = strdup (document_path);
            }
          else
            output_file = strdup (setfilename_for_outfile);
        }
      else if (strlen (input_basename_for_outfile))
        {
          document_path = strdup (input_basename_for_outfile);
          if (self->conf->EXTENSION.o.string
              && strlen (self->conf->EXTENSION.o.string))
            {
              xasprintf (&output_file, "%s.%s", input_basename_for_outfile,
                         self->conf->EXTENSION.o.string);
            }
          else
            output_file = strdup (input_basename_for_outfile);
        }
      else
        {
          output_file = strdup ("");
          document_path = strdup ("");
        }
      if (self->conf->SUBDIR.o.string && strlen (output_file))
        {
          char *new_output_file;
          char *dir = file_separator_canonpath (self->conf->SUBDIR.o.string);
          xasprintf (&new_output_file, "%s/%s", dir, output_file);
          free (dir);
          free (output_file);
          output_file = new_output_file;
        }
    }
  else
    {
      document_path = remove_extension (self->conf->OUTFILE.o.string);
      output_file = strdup (self->conf->OUTFILE.o.string);
    }

  free (input_basename_for_outfile);

  /* the output file path, output_filepath is in general the same as
     the outfile but can be set from setfilename if outfile is not set. */
  if (!strlen (output_file) && setfilename_for_outfile)
    {
    /* in this case one wants to get the result in a string and there
       is a setfilename.  The setfilename is used to get something.
       This happens in the test suite. */

      output_filepath = setfilename_for_outfile;
      free (document_path);
      document_path = remove_extension (setfilename_for_outfile);
    }
  else
    output_filepath = output_file;

  /* $document_name is the name of the document, which is the output
     file basename, $output_filename, without extension. */

  parse_file_path (document_path, document_name_and_directory);
  free (document_path);
  document_name = document_name_and_directory[0];
  free (document_name_and_directory[1]);
  parse_file_path (output_filepath, output_filename_and_directory);
  output_filename = output_filename_and_directory[0];
  free (output_filename_and_directory[1]);

  if (self->conf->SPLIT.o.string && strlen (self->conf->SPLIT.o.string))
    {
      if (self->conf->OUTFILE.o.string)
        destination_directory = strdup (self->conf->OUTFILE.o.string);
      else if (self->conf->SUBDIR.o.string)
        destination_directory = strdup (self->conf->SUBDIR.o.string);
      else
        {
          if (output_format && strlen (output_format))
            xasprintf (&destination_directory, "%s_%s", document_name,
                                               output_format);
          else
            destination_directory = strdup (document_name);
        }
    }
  else
    {
      char *output_file_filename_and_directory[2];
     /* the filename is not used, but $output_filename should be
        the same as long as $output_file is the same as $output_filepath
        which is the case except if $output_file is ''. */
      parse_file_path (output_file, output_file_filename_and_directory);
      destination_directory = output_file_filename_and_directory[1];
      /* Perl returns . or ./ if there is no directory */
      if (!destination_directory)
        destination_directory = strdup (".");
      free (output_file_filename_and_directory[0]);
    }

  if (strlen (destination_directory))
    {
      char *new_destination_directory
        = file_separator_canonpath (destination_directory);
      free (destination_directory);
      destination_directory = new_destination_directory;
    }

  result[0] = output_file;
  result[1] = destination_directory;
  result[2] = output_filename;
  result[3] = document_name;
  result[4] = input_basefile;
}

int
create_destination_directory (CONVERTER *self,
                              const char *destination_directory_path,
                              const char *destination_directory_name)
{
  if (destination_directory_path)
    {
      struct stat finfo;

      if (stat (destination_directory_path, &finfo) != 0
          || !S_ISDIR (finfo.st_mode))
        {
          int status = mkdir (destination_directory_path, S_IRWXU
                             | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH);
          if (status)
            {
              message_list_document_error (&self->error_messages,
                                           self->conf, 0,
                                  "could not create directory `%s': %s",
                            destination_directory_name, strerror (errno));
              return 0;
            }
        }
    }
  return 1;
}



static const enum command_id conf_for_documentlanguage[]
                          = {CM_documentlanguage, CM_documentscript, 0};

const char *
current_bcp47_locale (CONVERTER *self)
{
  if (!self->current_lang_translations)
    return "";
  else
    return self->current_lang_translations->info->bcp47_locale;
}

void
set_converter_preamble_language_commands (CONVERTER *self)
{
  if (self->document)
    {
  /* in general not needed as the values have not been reset when called
     but it is clearer to mark that intent. */
      set_global_document_commands (self, CL_before,
                                    conf_for_documentlanguage);

      self->current_lang_translations =
       set_preamble_language_commands (
                &self->document->global_info.preamble_lang_cmd,
                &converters_translation_cache,
                self->conf->documentlanguage.o.string,
                self->conf->documentscript.o.string,
                TXI_CONVERT_STRINGS_NR);
    }
}



ELEMENT *
converter_expand_today (CONVERTER *converter)
{
  int test = converter->conf->TEST.o.integer;
  CONVERTER_CDT_TREE converter_cdt_tree = {converter, &cdt_tree};

  return expand_today (test, converter->current_lang_translations,
                       converter->conf->DEBUG.o.integer,
                       &converter_cdt_tree);
}

ELEMENT *
converter_translated_command_tree (CONVERTER *self, enum command_id cmd)
{
  CONVERTER_CDT_TREE converter_cdt_tree = {self, &cdt_tree};
  return translated_command_tree (&self->translated_commands, cmd,
                                  self->current_lang_translations,
                                  self->conf->DEBUG.o.integer,
                                  &converter_cdt_tree);
}

static const enum command_id fulltitle_cmds[] =
 {CM_settitle, CM_title, CM_shorttitlepage, 0};

/* return could be const, as in general the tree should not be modified,
   however in the caller, the variable can also be generated and needs to
   be destroed, so no const */
ELEMENT *
converter_get_fulltitle_tree (CONVERTER *self)
{
  ELEMENT *fulltitle_tree = 0;
  int i;

  if (!self->document)
    return 0;

  for (i = 0; fulltitle_cmds[i]; i++)
    {
      enum command_id cmd = fulltitle_cmds[i];
      const ELEMENT *command
        = get_cmd_global_uniq_command (&self->document->global_commands, cmd);
      if (command && !empty_spaces_argument (command->e.c->contents.list[0]))
        {
          fulltitle_tree = command->e.c->contents.list[0];
          break;
        }
    }

  if (!fulltitle_tree
      && self->document->global_commands.top)
    {
      /* arguments_line type element */
      const ELEMENT *arguments_line
       = self->document->global_commands.top->e.c->contents.list[0];
      ELEMENT *line_arg = arguments_line->e.c->contents.list[0];

      if (!empty_spaces_argument (line_arg))
        fulltitle_tree = line_arg;
    }

  if (!fulltitle_tree
      && self->document->global_commands.titlefont.number > 0
      && self->document->global_commands.titlefont.list[0]
                                           ->e.c->contents.number > 0
      && !empty_spaces_argument (
           self->document->global_commands.titlefont.list[0]
                  ->e.c->contents.list[0]))
    {
      fulltitle_tree = self->document->global_commands.titlefont.list[0];
    }

  return fulltitle_tree;
}



/* OF_configured is taken into account in option_set_conf */
static void
copy_command_option_value_option (OPTION *option,
                                  const COMMAND_OPTION_VALUE *cmd_option_value)
{
  if (cmd_option_value->type == GOT_integer)
    option_set_conf (option, cmd_option_value->v.value, 0);
  else
    option_set_conf (option, -1, cmd_option_value->v.string);
}

/* freed by caller.  Information in structure refers to other data, so
   should not be freed */
static COMMAND_OPTION_VALUE *
command_init (enum command_id cmd, COMMAND_OPTION_VALUE *commands_init_conf)
{
  COMMAND_OPTION_VALUE *result = 0;
  const OPTION *default_option;
  /* always true currently, as it always comes from a converter and is
     part of the converter */
  if (commands_init_conf)
    {
      const COMMAND_OPTION_VALUE *cmd_init_conf = &commands_init_conf[cmd];
       /*
      if (cmd_init_conf->type == GOT_integer && cmd_init_conf->v.value >= 0
          || cmd_init_conf->type == GOT_char && cmd_init_conf->v.string)
        */
      if (cmd_init_conf->set)
        {
          result = (COMMAND_OPTION_VALUE *)
                          malloc (sizeof (COMMAND_OPTION_VALUE));
          memcpy (result, &commands_init_conf[cmd],
                  sizeof (COMMAND_OPTION_VALUE));
          return result;
        }
    }
  default_option = get_converter_command_option (txi_base_sorted_options, cmd);
  if (default_option)
    {
      result = (COMMAND_OPTION_VALUE *)
                          malloc (sizeof (COMMAND_OPTION_VALUE));
      result->type = default_option->type;
      if (default_option->type == GOT_integer)
        result->v.value = default_option->o.integer;
      else
        result->v.string = default_option->o.string;
    }
  return result;
}

void
set_global_document_commands (CONVERTER *converter,
                              const enum command_location location,
                              const enum command_id *cmd_list)
{
  if (location == CL_before)
    {
      int i;
      for (i = 0; cmd_list[i] > 0; i++)
        {
          enum command_id cmd = cmd_list[i];
          COMMAND_OPTION_VALUE *option_value = command_init (cmd,
                                               converter->commands_init_conf);
          if (option_value)
            {
              OPTION *option_ref
               = get_converter_command_option (converter->sorted_options, cmd);
              copy_command_option_value_option (option_ref, option_value);
              free (option_value);
            }
        }
    }
  else
    {
      int i;
      for (i = 0; cmd_list[i] > 0; i++)
        {
          const ELEMENT *element = 0;
          enum command_id cmd = cmd_list[i];
          if (converter->conf->DEBUG.o.integer > 0)
            {
              fprintf (stderr, "C|SET_global(%s) %s\n",
                       command_location_names[location],
                       command_data[cmd].cmdname);
            }
          if (converter->document)
            {
              element
                = set_global_document_command (
                                     &converter->document->global_commands,
                                         converter->sorted_options,
                                         cmd, location);
            }
          if (!element)
            {
              COMMAND_OPTION_VALUE *option_value = command_init (cmd,
                                       converter->commands_init_conf);
              if (option_value)
                {
                  OPTION *option_ref
                    = get_converter_command_option (converter->sorted_options,
                                                    cmd);
                  copy_command_option_value_option (option_ref, option_value);
                  free (option_value);
                }
            }
        }
    }
}



void
id_to_filename (CONVERTER *self, char **id_ref)
{
  if (self->conf->BASEFILENAME_LENGTH.o.integer < 0)
    return;
  char *id = *id_ref;
  if (strlen (id) > (size_t) self->conf->BASEFILENAME_LENGTH.o.integer)
    {
      id[self->conf->BASEFILENAME_LENGTH.o.integer] = '\0';
    }
}

TARGET_FILENAME *
normalized_sectioning_command_filename (CONVERTER *self, const ELEMENT *command)
{
  TARGET_FILENAME *result = new_target_filename ();
  TEXT filename;
  char *normalized_file_name;
  char *normalized_name;
  const ELEMENT *label_element;

  if (command_data[command->e.c->cmd].flags & CF_root)
    /* for root level sectioning commands, the first element is the
       arguments_line element, it contains the label element */
    label_element = command->e.c->contents.list[0]->e.c->contents.list[0];
  else
    /* @*heading commands */
    label_element = command->e.c->contents.list[0];

  if (self->conf->TRANSLITERATE_FILE_NAMES.o.integer > 0)
    {
      normalized_name
        = normalize_transliterate_texinfo_contents (label_element);
    }
  else
    {
      normalized_name
        = convert_contents_to_identifier (label_element);
    }

  normalized_file_name = strdup (normalized_name);
  id_to_filename (self, &normalized_file_name);

  text_init (&filename);
  text_append (&filename, normalized_file_name);
  if (self->conf->EXTENSION.o.string && strlen (self->conf->EXTENSION.o.string))
    {
      text_append (&filename, ".");
      text_append (&filename, self->conf->EXTENSION.o.string);
    }

  free (normalized_file_name);

  result->filename = filename.text;
  result->target = normalized_name;

  return result;
}

char *
node_information_filename (CONVERTER *self, const char *normalized,
                           const ELEMENT *label_element)
{
  char *filename;

  if (normalized)
    {
      if (self->conf->TRANSLITERATE_FILE_NAMES.o.integer > 0)
        {
          filename = normalize_transliterate_texinfo_contents (label_element);
        }
      else
        filename = strdup (normalized);
    }
  else if (label_element)
    {
      filename = convert_contents_to_node_identifier (label_element);
    }
  else
    filename = strdup ("");

  id_to_filename (self, &filename);
  return filename;
}



TEXT
converter_txt_image_text (CONVERTER *self, const ELEMENT *element,
                          const char *basefile, int *width_out)
{
  char *input_file_encoding;
  char *txt_file;
  char *image_text_file;
  char *file_name;
  int use_inc_dir;

  xasprintf (&image_text_file, "%s.txt", basefile);

  file_name = converter_encoded_input_file_name (self->conf,
                    &self->document->global_info,
                    image_text_file, 0, &input_file_encoding,
                    &element->e.c->source_info);
  free (input_file_encoding);

  txt_file = locate_include_file (file_name,
                                self->conf->INCLUDE_DIRECTORIES.o.strlist,
                                &use_inc_dir);
  free (file_name);

  if (txt_file)
    {
      FILE *filehandle = fopen (txt_file, "r");
      if (filehandle)
        {
          ssize_t status;
          char *line = 0;
          size_t n = 1;
          TEXT result;
          int max_width = 0;

          text_init (&result);
          text_append (&result, "");

          while (1)
            {
              status = getline (&line, &n, filehandle);
              if (status != -1)
                {
                  size_t len = strlen (line);
                  int width = width_multibyte (line, len);
                  if (width > max_width)
                    max_width = width;
                  text_append_n (&result, line, len);
                  free (line);
                  line = 0;
                }
              else
                break;
            }
          free (line);

          if (fclose (filehandle) == EOF)
            {
              message_list_command_warn (&self->error_messages,
                        (self->conf && self->conf->DEBUG.o.integer > 0),
                         element, 0,
                         "error on closing image text file %s: %s",
                         image_text_file, strerror (errno));
            }
          *width_out = max_width;

          free (image_text_file);
          free (txt_file);

          return result;
        }
      else
        {
          message_list_command_warn (&self->error_messages,
                        (self->conf && self->conf->DEBUG.o.integer > 0),
                         element, 0,
                         "@image file `%s' unreadable: %s",
                         image_text_file, strerror (errno));
        }

      free (txt_file);
    }

  free (image_text_file);

  *width_out = -1;
  TEXT result;
  text_init (&result);
  return result;
}

ELEMENT *
float_type_number (CONVERTER *self, const ELEMENT *float_e)
{
  ELEMENT *tree = 0;
  ELEMENT *type_element = 0;
  NAMED_STRING_ELEMENT_LIST *replaced_substrings
     = new_named_string_element_list ();
  const char *float_type = lookup_extra_string (float_e, AI_key_float_type);
  const char *float_number = lookup_extra_string (float_e, AI_key_float_number);

  if (float_type && strlen (float_type))
    /* first content of arguments_line type element */
    type_element = float_e->e.c->contents.list[0]->e.c->contents.list[0];

  if (float_number)
    {
      ELEMENT *e_number = new_text_element (ET_normal_text);
      text_append (e_number->e.text, float_number);
      add_element_to_named_string_element_list (replaced_substrings,
                                     "float_number", e_number);
    }

  if (type_element)
    {
      ELEMENT *type_element_copy = copy_element_tree (type_element, 0);
      add_element_to_named_string_element_list (replaced_substrings,
                                     "float_type", type_element_copy);
      if (float_number)
        tree = cdt_tree ("{float_type} {float_number}", self,
                         replaced_substrings, 0);
      else
        tree = cdt_tree ("{float_type}", self, replaced_substrings, 0);
    }
  else if (float_number)
    tree = cdt_tree ("{float_number}", self, replaced_substrings, 0);

  destroy_named_string_element_list (replaced_substrings);

  return tree;
}

FLOAT_CAPTION_PREPENDED_ELEMENT *
float_name_caption (CONVERTER *self, const ELEMENT *float_e)
{
  const ELEMENT *caption_element;
  ELEMENT *prepended = 0;
  ELEMENT *type_element = 0;
  FLOAT_CAPTION_PREPENDED_ELEMENT *result = (FLOAT_CAPTION_PREPENDED_ELEMENT *)
    malloc (sizeof (FLOAT_CAPTION_PREPENDED_ELEMENT));
  NAMED_STRING_ELEMENT_LIST *replaced_substrings
     = new_named_string_element_list ();

  const char *float_type = lookup_extra_string (float_e, AI_key_float_type);
  const char *float_number = lookup_extra_string (float_e, AI_key_float_number);

  const ELEMENT *caption_shortcaption[2];

  find_float_caption_shortcaption(float_e, caption_shortcaption);
  caption_element = caption_shortcaption[0];
  if (!caption_element)
    caption_element = caption_shortcaption[1];

  if (float_type && strlen (float_type))
    /* first content of arguments_line type element */
    type_element = float_e->e.c->contents.list[0]->e.c->contents.list[0];

  if (float_number)
    {
      ELEMENT *e_number = new_text_element (ET_normal_text);
      text_append (e_number->e.text, float_number);
      add_element_to_named_string_element_list (replaced_substrings,
                                     "float_number", e_number);
    }

  if (type_element)
    {
      ELEMENT *type_element_copy = copy_element_tree (type_element, 0);
      add_element_to_named_string_element_list (replaced_substrings,
                                     "float_type", type_element_copy);
      if (caption_element)
        {
          if (float_number)
            /* TRANSLATORS: added before caption */
            prepended = cdt_tree ("{float_type} {float_number}: ",
                                  self, replaced_substrings, 0);
          else
            /* TRANSLATORS: added before caption, no float label */
            prepended = cdt_tree ("{float_type}: ", self,
                                  replaced_substrings, 0);
        }
      else
        {
          if (float_number)
            prepended = cdt_tree ("{float_type} {float_number}",
                                  self, replaced_substrings, 0);
          else
            prepended = cdt_tree ("{float_type}", self,
                                  replaced_substrings, 0);
        }
    }
  else if (float_number)
    {
      if (caption_element)
      /* TRANSLATORS: added before caption, no float type */
        prepended = cdt_tree ("{float_number}: ", self,
                              replaced_substrings, 0);
      else
        prepended = cdt_tree ("{float_number}", self,
                              replaced_substrings, 0);
    }

  result->caption = caption_element;
  result->prepended = prepended;

  destroy_named_string_element_list (replaced_substrings);

  return result;
}



char *
convert_accents (CONVERTER *self, const ELEMENT *accent,
 TEXT (*convert_tree)(CONVERTER *self, const ELEMENT *tree),
 char *(*format_accent)(CONVERTER *self, const char *text, const ELEMENT *element,
                        int index_in_stack, const CONST_ELEMENT_LIST *stack,
                        int set_case),
  int output_encoded_characters,
  int set_case)
{
  ACCENTS_STACK *accent_stack = find_innermost_accent_contents (accent);
  const CONST_ELEMENT_LIST *stack;
  char *arg_text;
  char *result;
  int i;

  if (accent_stack->argument)
    {
      TEXT arg_result = (*convert_tree) (self, accent_stack->argument);
      arg_text = arg_result.text;
    }
  else
    arg_text = strdup ("");

  if (output_encoded_characters)
    {
      char *encoded = encoded_accents (self, arg_text, &accent_stack->stack,
                                 self->conf->OUTPUT_ENCODING_NAME.o.string,
                                 format_accent, set_case);
      if (encoded)
        {
          free (arg_text);
          destroy_accent_stack (accent_stack);
          return encoded;
        }
    }

  stack = &accent_stack->stack;
  result = arg_text;
  for (i = stack->number - 1; i >= 0; i--)
    {
      const ELEMENT *accent_command = stack->list[i];
      char *formatted_accent = (*format_accent) (self, result, accent_command,
                                                 i, stack, set_case);
      free (result);
      result = formatted_accent;
    }
  destroy_accent_stack (accent_stack);
  return result;
}

static char *
lang_info_sorting_locale (const DOCUMENT_LANG_INFO *lang_info)
{
  TEXT t_lang_sorting;

  text_init (&t_lang_sorting);

  text_append (&t_lang_sorting, lang_info->lang);
  if (lang_info->script)
    {
      text_append_n (&t_lang_sorting, "_", 1);
      text_append (&t_lang_sorting, lang_info->script);
    }

  return t_lang_sorting.text;
}

static const INDICES_SORT_STRINGS *
converter_indices_sort_strings (CONVERTER *converter)
{
  if (!converter->indices_sort_strings)
    {
      int debug_level = 0;
      const MERGED_INDICES *merged_indices
         = document_merged_indices (converter->document);

      if (converter->conf && converter->conf->DEBUG.o.integer > 0)
        debug_level = converter->conf->DEBUG.o.integer;

      converter->indices_sort_strings
       = setup_index_entries_sort_strings (&converter->error_messages,
                        merged_indices, &converter->document->indices_info,
                        0, 0, debug_level, converter,
                        &wrap_converter_index_content_element);

      /* document->modified_information |= F_DOCM_indices_sort_strings; */
    }
  return converter->indices_sort_strings;
}

INDEX_SORTED_BY_INDEX *
get_converter_indices_sorted_by_index (CONVERTER *self, char **language)
{
  *language = 0;
  if (self->document)
    {
      COLLATION_INDICES_SORTED_BY_INDEX *collation_sorted_indices;
      char *input_lang_sorting_locale = 0;
      const char *lang_sorting_locale = 0;

      if (!self->sorted_indices_by_index)
        self->sorted_indices_by_index
          = new_base_collations_sorted_indices_by_index ();

      if (self->conf->USE_UNICODE_COLLATION.o.integer >= 0)
        {
          if (self->conf->COLLATION_LANGUAGE.o.string)
            input_lang_sorting_locale
              = strdup (self->conf->COLLATION_LANGUAGE.o.string);
          else if (self->conf->DOCUMENTLANGUAGE_COLLATION.o.integer > 0
                   && self->current_lang_translations)
            input_lang_sorting_locale = lang_info_sorting_locale
                              (self->current_lang_translations->info);
        }

      collation_sorted_indices
        = get_collation_sorted_indices_by_index (
                           self->sorted_indices_by_index,
                           self->conf->USE_UNICODE_COLLATION.o.integer,
                           input_lang_sorting_locale,
                           self->conf->XS_STRXFRM_COLLATION_LOCALE.o.string,
                           &lang_sorting_locale);

      if (!collation_sorted_indices->sorted_indices)
        {
          const INDICES_SORT_STRINGS *indices_sort_strings
                 = converter_indices_sort_strings (self);

          collation_sorted_indices->sorted_indices
            = sort_indices_by_index (indices_sort_strings,
                           &self->error_messages, self->conf,
                           self->conf->USE_UNICODE_COLLATION.o.integer,
                           lang_sorting_locale,
                           self->conf->XS_STRXFRM_COLLATION_LOCALE.o.string);
        }

      /* input_lang_sorting_locale can not be freed before, as
         lang_sorting_locale may point to that memory location. */
      if (input_lang_sorting_locale)
        free (input_lang_sorting_locale);

      if (collation_sorted_indices->type != ctn_locale_collation)
        *language = collation_sorted_indices->language;

      return collation_sorted_indices->sorted_indices;
    }
  return 0;
}

/* LANGUAGE output value need not to be freed by the caller */
INDEX_SORTED_BY_LETTER *
get_converter_indices_sorted_by_letter (CONVERTER *self, char **language)
{
  *language = 0;
  if (self->document)
    {
      COLLATION_INDICES_SORTED_BY_LETTER *collation_sorted_indices;
      char *input_lang_sorting_locale = 0;
      const char *lang_sorting_locale;

      if (!self->sorted_indices_by_letter)
        {
          self->sorted_indices_by_letter
            = new_base_collations_sorted_indices_by_letter ();
        }

      if (self->conf->USE_UNICODE_COLLATION.o.integer >= 0)
        {
          if (self->conf->COLLATION_LANGUAGE.o.string)
            input_lang_sorting_locale
              = strdup (self->conf->COLLATION_LANGUAGE.o.string);
          else if (self->conf->DOCUMENTLANGUAGE_COLLATION.o.integer > 0
                   && self->current_lang_translations)
            input_lang_sorting_locale = lang_info_sorting_locale (
                              self->current_lang_translations->info);
        }

      collation_sorted_indices
       = get_collation_sorted_indices_by_letter (
                               self->sorted_indices_by_letter,
                               self->conf->USE_UNICODE_COLLATION.o.integer,
                               input_lang_sorting_locale,
                               self->conf->XS_STRXFRM_COLLATION_LOCALE.o.string,
                               &lang_sorting_locale);

      if (!collation_sorted_indices->sorted_indices)
        {
          const INDICES_SORT_STRINGS *indices_sort_strings
             = converter_indices_sort_strings (self);

          collation_sorted_indices->sorted_indices
            = sort_indices_by_letter (indices_sort_strings,
                            &self->error_messages, self->conf,
                            self->conf->USE_UNICODE_COLLATION.o.integer,
                            lang_sorting_locale,
                            self->conf->XS_STRXFRM_COLLATION_LOCALE.o.string);
        }

      /* input_lang_sorting_locale can not be freed before, as
         lang_sorting_locale may point to that memory location. */
      if (input_lang_sorting_locale)
        free (input_lang_sorting_locale);

      if (collation_sorted_indices->type != ctn_locale_collation)
        *language = collation_sorted_indices->language;
      return collation_sorted_indices->sorted_indices;
    }
  return 0;
}

/* for tests */
char *
print_converter_indices_sort_strings (CONVERTER *self)
{
  char *language;
  const INDICES_SORT_STRINGS *indices_sort_strings
               = converter_indices_sort_strings (self);

  const INDEX_SORTED_BY_INDEX *sorted_index_entries
    = get_converter_indices_sorted_by_index (self, &language);

  return print_indices_sort_strings (sorted_index_entries,
                                     indices_sort_strings,
                                     self->document);
}
/* to be freed by caller */
char *
top_node_filename (const CONVERTER *self, const char *document_name)
{
  TEXT top_node_filename;

  if (self->conf->TOP_FILE.o.string && strlen (self->conf->TOP_FILE.o.string))
    {
      return strdup (self->conf->TOP_FILE.o.string);
    }

  if (document_name)
    {
      text_init (&top_node_filename);
      text_append (&top_node_filename, document_name);
      if (self->conf->EXTENSION.o.string
          && strlen (self->conf->EXTENSION.o.string))
        {
          text_append (&top_node_filename, ".");
          text_append (&top_node_filename, self->conf->EXTENSION.o.string);
        }
      return top_node_filename.text;
    }
  return 0;
}



static size_t
find_output_unit_file (const CONVERTER *self, const char *filename, int *status)
{
  const FILE_NAME_PATH_COUNTER_LIST *output_unit_files
    = &self->output_unit_files;
  size_t i;
  *status = 0;

  for (i = 0; i < output_unit_files->number; i++)
    {
      if (!strcmp (output_unit_files->list[i].normalized_filename, filename))
        {
          *status = 1;
          return i;
        }
    }
  return 0;
}

static size_t
add_output_units_file (CONVERTER *self, const char *filename,
                       const char *normalized_filename)
{
  size_t file_index;
  FILE_NAME_PATH_COUNTER *new_output_unit_file;
  FILE_NAME_PATH_COUNTER_LIST *output_unit_files
    = &self->output_unit_files;

  if (output_unit_files->number == output_unit_files->space)
    {
      output_unit_files->list = realloc (output_unit_files->list,
         (output_unit_files->space += 5) * sizeof (FILE_NAME_PATH_COUNTER));
      if (!output_unit_files->list)
        fatal ("realloc failed");
    }

  file_index = output_unit_files->number;
  new_output_unit_file = &output_unit_files->list[file_index];
  memset (new_output_unit_file, 0, sizeof (FILE_NAME_PATH_COUNTER));
  new_output_unit_file->filename = strdup (filename);
  if (normalized_filename)
    new_output_unit_file->normalized_filename = strdup (normalized_filename);
  else
    new_output_unit_file->normalized_filename = strdup (filename);

  output_unit_files->number++;

  return file_index;
}

/*
  If CASE_INSENSITIVE_FILENAMES is set, reuse the first
  filename with the same name insensitive to the case.
 */
size_t
register_normalize_case_filename (CONVERTER *self, const char *filename)
{
  size_t output_unit_file_idx;
  if (self->conf->CASE_INSENSITIVE_FILENAMES.o.integer > 0)
    {
      char *lc_filename = to_upper_or_lower_multibyte (filename, -1);
      int status;
      output_unit_file_idx = find_output_unit_file (self, lc_filename, &status);
      if (status)
        {
          if (self->conf->DEBUG.o.integer > 0)
            {
              FILE_NAME_PATH_COUNTER *output_unit_file
                = &self->output_unit_files.list[output_unit_file_idx];
              fprintf (stderr, "C|Reusing case-insensitive %s for %s\n",
                       output_unit_file->filename, filename);
              /*
              fprintf (stderr, "C|Reusing case-insensitive %s(%zu) for %s\n",
                       output_unit_file->filename, output_unit_file_idx,
                       filename);
               */
            }
          free (lc_filename);
        }
      else
        {
          output_unit_file_idx = add_output_units_file (self, filename,
                                                        lc_filename);
          free (lc_filename);
        }
    }
  else
    {
      int status;
      output_unit_file_idx = find_output_unit_file (self, filename, &status);
      if (status)
        {
          if (self->conf->DEBUG.o.integer > 0)
            {
              FILE_NAME_PATH_COUNTER *output_unit_file
                = &self->output_unit_files.list[output_unit_file_idx];
              fprintf (stderr, "C|Reusing %s for %s\n",
                       output_unit_file->filename, filename);
              /*
              fprintf (stderr, "C|Reusing %s(%zu) for %s\n",
                       output_unit_file->filename, output_unit_file_idx,
                       filename);
               */
            }
        }
      else
        output_unit_file_idx = add_output_units_file (self, filename, 0);
    }
  return output_unit_file_idx;
}

size_t
set_output_unit_file (CONVERTER *self, OUTPUT_UNIT *output_unit,
                      const char *filename, int set_counter)
{
  size_t output_unit_file_idx
     = register_normalize_case_filename (self, filename);
  FILE_NAME_PATH_COUNTER *output_unit_file
    = &self->output_unit_files.list[output_unit_file_idx];
  if (set_counter)
    output_unit_file->counter++;
  free (output_unit->unit_filename);
  output_unit->unit_filename = strdup (output_unit_file->filename);
  return output_unit_file_idx;
}

void
set_file_path (CONVERTER *self, const char *filename, const char *filepath,
               const char *destination_directory)
{
  size_t output_unit_file_idx
      = register_normalize_case_filename (self, filename);
  FILE_NAME_PATH_COUNTER *output_unit_file
    = &self->output_unit_files.list[output_unit_file_idx];
  char *filepath_str;

  if (!filepath)
    if (destination_directory && strlen (destination_directory))
      {
        xasprintf (&filepath_str, "%s/%s", destination_directory,
                                  output_unit_file->filename);
      }
    else
      filepath_str = strdup (output_unit_file->filename);
  else
    filepath_str = strdup (filepath);

  if (output_unit_file->filepath)
    {
      if (!strcmp (output_unit_file->filepath, filepath_str))
        {
          if (self->conf->DEBUG.o.integer > 0)
            fprintf (stderr, "C|set_file_path: filepath set: %s\n",
                             filepath_str);
          free (filepath_str);
        }
      else
        {
          if (self->conf->DEBUG.o.integer > 0)
            fprintf (stderr, "C|set_file_path: filepath reset: %s, %s\n",
                             output_unit_file->filepath, filepath_str);
          free (output_unit_file->filepath);
          output_unit_file->filepath = filepath_str;
        }
    }
  else
    output_unit_file->filepath = filepath_str;
}

static void
free_output_unit_files_file (FILE_NAME_PATH_COUNTER_LIST *output_unit_files)
{
  size_t i;
  for (i = 0; i < output_unit_files->number; i++)
    {
      FILE_NAME_PATH_COUNTER *output_unit_file = &output_unit_files->list[i];
      free (output_unit_file->filename);
      free (output_unit_file->normalized_filename);
      free (output_unit_file->filepath);
      if (output_unit_file->body.space)
        free (output_unit_file->body.text);
    }
}

void
clear_output_unit_files (FILE_NAME_PATH_COUNTER_LIST *output_unit_files)
{
  free_output_unit_files_file (output_unit_files);
  output_unit_files->number = 0;
}

void
free_output_unit_files (FILE_NAME_PATH_COUNTER_LIST *output_unit_files)
{
  free_output_unit_files_file (output_unit_files);
  free (output_unit_files->list);
}

/* Called in plaintext converter.  The HTML converter defines its
   own version.
   set file counters.
 */

void
set_output_units_files (CONVERTER *self,
                        const OUTPUT_UNIT_LIST *output_units,
                        const char *output_file,
                        const char *destination_directory,
                        const char *output_filename,
                        const char *document_name)
{
  size_t i;
  const char *extension = 0;
  char **unit_file_name_paths;

  /* same as calling initialize_output_units_files in Perl */
  clear_output_unit_files (&self->output_unit_files);

  unit_file_name_paths = (char **)
   malloc (output_units->number * sizeof (char *));
  memset (unit_file_name_paths, 0,
          output_units->number * sizeof (char *));

  if (self->conf->EXTENSION.o.string
      && strlen (self->conf->EXTENSION.o.string))
    extension = self->conf->EXTENSION.o.string;

  self->output_unit_file_indices = (size_t *)
    realloc (self->output_unit_file_indices,
             output_units->number * sizeof (size_t));

  if (!self->conf->SPLIT.o.string || !strlen (self->conf->SPLIT.o.string))
    {
      set_file_path (self, output_filename, output_file, 0);
      for (i = 0; i < output_units->number; i++)
        {
          OUTPUT_UNIT *output_unit = output_units->list[i];
          size_t output_unit_file_idx
            = set_output_unit_file (self, output_unit, output_filename, 1);
          self->output_unit_file_indices[i] = output_unit_file_idx;
        }
    }
  else
    {
      char *top_node_filename_str;
      OUTPUT_UNIT *top_node_output_unit = 0;
      const ELEMENT *top_node = 0;
      const ELEMENT *top_target_element;
      size_t file_nr = 0;
      size_t i;
      size_t top_output_unit_file_idx;
      size_t file_output_unit_file_idx;

      if (identifiers_target_number (&self->document->identifiers_target))
        {
          top_target_element
            = find_identifier_target (&self->document->identifiers_target,
                                      "Top");
          if (top_target_element && top_target_element->e.c->cmd == CM_node)
            top_node = top_target_element;
        }

      top_node_filename_str = top_node_filename (self, document_name);

      /* first determine the top node file name. */
      if (top_node && top_node_filename_str)
        {
          top_node_output_unit = top_node->e.c->associated_unit;
          set_file_path (self, top_node_filename_str, 0,
                         destination_directory);
          top_output_unit_file_idx
            = set_output_unit_file (self, top_node_output_unit,
                                    top_node_filename_str, 1);
        }

      TEXT file_name_text;
      text_init (&file_name_text);

      for (i = 0; i < output_units->number; i++)
        {
          OUTPUT_UNIT *output_unit = output_units->list[i];
          OUTPUT_UNIT *file_output_unit;
          size_t output_unit_file_idx;
          /* For Top node. */
          if (top_node_output_unit && top_node_output_unit == output_unit)
            {
              self->output_unit_file_indices[i] = top_output_unit_file_idx;
              continue;
            }

          file_output_unit = output_unit->first_in_page;

          if (!file_output_unit->unit_filename)
            {
              size_t j;
              for (j = 0; j < file_output_unit->unit_contents.number; j++)
                {
                  const ELEMENT *root_command
                     = file_output_unit->unit_contents.list[j];
                  if (root_command->e.c->cmd == CM_node)
                    {
                      const ELEMENT *node_target = 0;
                      const char *normalized
                           = lookup_extra_string (root_command,
                                                  AI_key_identifier);
                      if (normalized)
                        node_target
                         = find_identifier_target (
                                  &self->document->identifiers_target,
                                  normalized);
                   /* double node are not normalized, they are handled here */
                      if (!node_target)
                        text_append (&file_name_text, "unknown_node");
                      else
                        {
                          const ELEMENT *arguments_line
                            = root_command->e.c->contents.list[0];
                          char *node_filename
                            = node_information_filename (self, normalized,
                          /* node label is the first arguments_line content,
                             the first argument on the line */
                                      arguments_line->e.c->contents.list[0]);

                          text_append (&file_name_text, node_filename);
                          free (node_filename);
                        }


                      if (extension)
                        {
                          text_append (&file_name_text, ".");
                          text_append (&file_name_text, extension);
                        }

                      set_file_path (self, file_name_text.text, 0,
                                     destination_directory);
                      file_output_unit_file_idx
                       = set_output_unit_file (self, file_output_unit,
                                               file_name_text.text, 1);

                      text_reset (&file_name_text);

                      break;
                    }
                }
              if (!file_output_unit->unit_filename)
                {
                  /* use section to do the file name if there is no node */
                  const SECTION_RELATIONS *command
                    = file_output_unit->unit_section;
                  if (command)
                    {
                      if (command->element->e.c->cmd == CM_top && !top_node
                          && top_node_filename_str)
                        {
                          set_file_path (self, top_node_filename_str, 0,
                                         destination_directory);
                          file_output_unit_file_idx
                           = set_output_unit_file (self, file_output_unit,
                                                   top_node_filename_str, 1);
                        }
                      else
                        {
                          char *filename;
                          TARGET_FILENAME *target_filename
                            = normalized_sectioning_command_filename (self,
                                                           command->element);

                          free (target_filename->target);
                          filename = target_filename->filename;

                          free (target_filename);

                          set_file_path (self, filename, 0,
                                         destination_directory);
                          file_output_unit_file_idx
                           = set_output_unit_file (self, file_output_unit,
                                                   filename, 1);
                          free (filename);
                        }
                    }
                  else
                   {
                      /* when everything else has failed */
                      if (file_nr == 0 && !top_node
                          && top_node_filename_str)
                        {
                          set_file_path (self, top_node_filename_str, 0,
                                         destination_directory);
                          file_output_unit_file_idx
                           = set_output_unit_file (self, file_output_unit,
                                                   top_node_filename_str, 1);
                        }
                      else
                        {
                          text_printf (&file_name_text, "%s_%zu",
                                       document_name, file_nr);
                          if (extension)
                            {
                              text_append (&file_name_text, ".");
                              text_append (&file_name_text, extension);
                            }
                          set_file_path (self, file_name_text.text, 0,
                                         destination_directory);
                          file_output_unit_file_idx
                           = set_output_unit_file (self, file_output_unit,
                                                   file_name_text.text, 1);

                          text_reset (&file_name_text);

                        }
                      file_nr++;
                    }
                }
            }

          if (output_unit != file_output_unit)
            output_unit_file_idx
                = set_output_unit_file (self, output_unit,
                                  file_output_unit->unit_filename, 1);
          else
            output_unit_file_idx = file_output_unit_file_idx;

          self->output_unit_file_indices[i] = output_unit_file_idx;
        }
      free (file_name_text.text);
      free (top_node_filename_str);
    }

  if (self->conf->DEBUG.o.integer > 0)
    {
      for (i = 0; i < output_units->number; i++)
        {
          const OUTPUT_UNIT *output_unit = output_units->list[i];
          size_t output_unit_file_idx
            = self->output_unit_file_indices[i];
          FILE_NAME_PATH_COUNTER *output_unit_file
            = &self->output_unit_files.list[output_unit_file_idx];
          char *output_unit_text = output_unit_texi (output_unit);
          fprintf (stderr, "C|Page %s: %s(%d)\n", output_unit_text,
                 output_unit->unit_filename, output_unit_file->counter);
          free (output_unit_text);
        }
    }
  free (unit_file_name_paths);
}



static void
destroy_converter_output_units (CONVERTER *self)
{
  int i;
  int check_counts = (self->conf->TEST.o.integer > 1);
  ERROR_MESSAGE_LIST *error_messages = 0;
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  if (check_counts)
    error_messages = set_check_element_interpreter_refcount ();
  /* FIXME move to generic converter or move code to HTML specific function? */
  if (self_html)
    {
      for (i = 0; i < OUDT_external_nodes_units+1; i++)
        {
          if (self_html->output_units_descriptors[i])
            {
              OUTPUT_UNIT_LIST *output_unit_list
                = retrieve_output_units (self->document,
                           self_html->output_units_descriptors[i]);
              if (output_unit_list)
                free_output_unit_list (output_unit_list);
              self_html->output_units_descriptors[i] = 0;
            }
        }
    }
  if (check_counts)
    {
      if (error_messages->number)
        merge_error_messages_lists (&self->error_messages, error_messages);
      unset_check_element_interpreter_refcount ();
    }
}

static void
reset_tree_to_build (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  if (self_html)
    {
      if (self_html->tree_to_build.number > 0)
        {
          fprintf (stderr, "BUG: tree_to_build: %zu\n",
                           self_html->tree_to_build.number);
          if (self->conf->DEBUG.o.integer > 0)
            {
              size_t i;
              for (i = 0; i < self_html->tree_to_build.number; i++)
                {
                  ELEMENT *element = self_html->tree_to_build.list[i];
              /* in most cases, the trees have been destroyed, so this
                 will often segfault */
                  fprintf (stderr, " %zu: '%s'\n", i,
                                   convert_to_texinfo (element));
                }
            }
        }
      self_html->tree_to_build.number = 0;
    }
}

void
converter_remove_output_units (CONVERTER *self)
{
  enum converter_format converter_format = self->format;

  if (converter_format != COF_none
      && converter_format_data[converter_format].converter_release_output_units)
    {
      void (* format_converter_release_output_units) (CONVERTER *self)
       = converter_format_data[converter_format].converter_release_output_units;
      format_converter_release_output_units (self);
    }

  destroy_converter_output_units (self);

  /* HTML specific, but good to be here.
     If there is still tree to build at this point, this means
     will almost certainty that there is something wrong, as
     it is likely that the associated trees have been destroyed
     and having the output units is a sign that conversion data
     should have been reset or could be reset at any time.
   */
  reset_tree_to_build (self);
}

void
free_generic_converter (CONVERTER *self)
{
  size_t i;

  if (self->error_messages.number)
    {
      const char *converter_name;
      if (self->format >= 0)
        converter_name = converter_format_data[self->format].default_format;
      else
        converter_name = "generic";

      fprintf (stderr, "BUG: %zu ignored messages in %s converter\n",
                       self->error_messages.number, converter_name);
      for (i = 0; i < self->error_messages.number; i++)
        {
          const ERROR_MESSAGE *error_message = &self->error_messages.list[i];
          fprintf (stderr, " %zu: %s", i, error_message->error_line);
        }
    }

  free_translated_commands (&self->translated_commands);

  free_deprecated_dirs_list (&self->deprecated_config_directories);

  free (self->expanded_formats);

  for (i = 0; i < TXI_COMMAND_OPTIONS_NR; i++)
    {
      const COMMAND_OPTION_NUMBER_CMD *option_nr_cmd
        = &txi_options_command_map[i];
      const OPTION *option
        = self->sorted_options[option_nr_cmd->option_number -1];
      if (option->type == GOT_char)
        {
          free (self->commands_init_conf[option_nr_cmd->cmd].v.string);
        }
    }

  if (self->sorted_options)
    {
      size_t i;
      for (i = 0; i < TXI_OPTIONS_NR; i++)
        free_option (self->sorted_options[i]);

      free (self->sorted_options);
      free (self->conf);
    }

  free (self->sorted_index_names.list);

  destroy_converter_index_sorting (self);

  if (self->convert_index_text_options)
    destroy_text_options (self->convert_index_text_options);

  free_output_files_information (&self->output_files_information);
  free_output_unit_files (&self->output_unit_files);
  free (self->output_unit_file_indices);

  if (self->convert_text_options)
    destroy_text_options (self->convert_text_options);

  wipe_error_message_list (&self->error_messages);

  free_strings_list (&self->small_strings);

  if (self->sv)
    {
      unregister_perl_data (self->sv);
      if (0)
        {
  /* if an embedded Perl interpreter is used, the reference held by the
     C code is the last (and only) reference, but when XS modules are used,
     in general, there are converter hash reference variables, in all the
     functions down to the main program.

     This can be used for debugging, but no generic check can be done.
   */
          void *hv = get_sv_hv (self->sv);
          int sv_refcount = get_refcount (self->sv);
          int hv_refcount = get_refcount (hv);
          if (sv_refcount != 0 || hv_refcount != 0)
            {
              fprintf (stderr,
                       "DEBUG Converter refcounts (%p<-%p): sv: %d hv: %d\n",
                       hv, self->sv, sv_refcount, hv_refcount);
            }
        }
    }
}

void
free_converter (CONVERTER *self)
{
  enum converter_format converter_format = self->format;

  if (converter_format != COF_none
      && converter_format_data[converter_format].converter_free)
    {
      void (* format_converter_free) (CONVERTER *self)
        = converter_format_data[converter_format].converter_free;
      format_converter_free (self);
    }

  free_generic_converter (self);
}

void
destroy_converter (CONVERTER *converter)
{
  size_t converter_descriptor = converter->converter_descriptor;

  free_converter (converter);

  if (converter_descriptor)
    converter_list[converter_descriptor-1] = 0;

  free (converter);
}



void
initialize_cmd_list (COMMAND_ID_LIST *cmd_list, size_t size, size_t number)
{
  cmd_list->list = (enum command_id *) malloc
    (size * sizeof (enum command_id));
  cmd_list->number = number;
  if (number)
    {
      memset (cmd_list->list, 0, number * sizeof (enum command_id));
    }
}



/* XML conversion functions */

void
xml_format_text_with_numeric_entities (const char *text, TEXT *result)
{
  const char *p;

  p = text;
  while (*p)
    {
      int before_sep_nr = strcspn (p, "-'`");
      if (before_sep_nr)
        {
          text_append_n (result, p, before_sep_nr);
          p += before_sep_nr;
        }
      if (!*p)
        break;
      switch (*p)
        {
        OTXI_NUMERIC_ENTITY_TEXT_CASES(p)
        }
    }
}


void
xml_protect_text (const char *text, TEXT *result)
{
  const char *p;

  p = text;

  while (*p)
    {
      int before_sep_nr = strcspn (p, "<>&\"");
      if (before_sep_nr)
        {
          text_append_n (result, p, before_sep_nr);
          p += before_sep_nr;
        }
      if (!*p)
        break;
      switch (*p)
        {
        OTXI_PROTECT_XML_CASES(p);
        /* should never happen */
        default:
         p++;
        }
    }
}

static char *
next_for_tieaccent (const char *text, const char **next)
{
  const char *p;
  if (!strlen (text))
    {
      return 0;
    }
  if (text[0] == '&')
    {
      if (strlen (text) > 3 && isascii_alnum (*(text+1)))
        {
          p = text +2;
          while (*p)
            {
              if (*p == ';')
                {
                  p++;
                  *next = p;
                  return strndup (text, p - text);
                }
              else if (isascii_alnum (*p))
                {
                  p++;
                }
              else
                break;
            }
        }
      return 0;
    }
  else
    {
      uint8_t *encoded_u8 = utf8_from_string (text);
      ucs4_t first_char;
      u8_next (&first_char, encoded_u8);
      free (encoded_u8);
      if (uc_is_general_category (first_char, UC_CATEGORY_L)
          /* ASCII digits */
          || (first_char >= 0x0030 && first_char <= 0x0039))
        {
          char *first_char_text;
          uint8_t first_char_u8[7];
          int first_char_len = u8_uctomb (first_char_u8, first_char, 6);
          if (first_char_len < 0)
            fatal ("u8_uctomb returns negative value");
          first_char_u8[first_char_len] = 0;
          first_char_text = string_from_utf8 (first_char_u8);
          p = text + strlen (first_char_text);
          *next = p;
          return first_char_text;
        }
      return 0;
    }
}

typedef struct UNICODE_ACCENT_LETTER {
    enum command_id cmd;
    char *letter;
    char *numerical_entity;
} UNICODE_ACCENT_LETTER;

/* only those that are not obtained through diacritic + normalization */
static UNICODE_ACCENT_LETTER unicode_accented_letters[] = {
{CM_dotless, "i", "305"},
{CM_dotless, "j", "567"},
{0, 0, 0}
};

char *
xml_numeric_entity_accent (enum command_id cmd, const char *text)
{
  char *result;

  if (unicode_diacritics[cmd].text)
    {
      if (cmd != CM_tieaccent)
        {
          if (strlen (text) == 1 && isascii_alpha (*text))
            {
              char *accented_char;
              char *normalized_char;
              uint8_t *encoded_u8;
              ucs4_t first_char;
              const uint8_t *next;

              xasprintf (&accented_char, "%s%s", text,
                         unicode_diacritics[cmd].text);
              normalized_char = normalize_NFC (accented_char);
              encoded_u8 = utf8_from_string (normalized_char);
              next = u8_next (&first_char, encoded_u8);
              if (next)
                {
                  ucs4_t other_char;
                  const uint8_t *after = u8_next (&other_char, next);
                  next = after;
                }
              free (encoded_u8);
              free (accented_char);
              free (normalized_char);
              if (!next)
                {
                  char *entity;
              /* hex entity
                 xasprintf (&entity, "&#%04lX;", first_char); */
        /* seems to be the way for portable uint32_t unsigned integer format */
                  xasprintf (&entity, "&#%" PRIu32 ";", first_char);
                  return entity;
                }
            }
          xasprintf (&result, "%s&#%s;", text, unicode_diacritics[cmd].codepoint);
          return result;
        }
      else
        {
          char *result;
          const char *p = 0;
          const char *remaining = 0;
          char *first = next_for_tieaccent (text, &p);
          char *second;
          if (!first)
            goto invalid;
          second = next_for_tieaccent (p, &remaining);
          if (second)
            {
              xasprintf (&result, "%s&#%s;%s%s", first,
                         unicode_diacritics[cmd].codepoint, second, remaining);
              free (first);
              free (second);
              return result;
            }
          else
            free (first);

         invalid:
          xasprintf (&result, "%s&#%s;", text,
                     unicode_diacritics[cmd].codepoint);
          return result;
        }
    }
  else if (strlen (text) == 1 && isascii_alpha (*text))
    {
      int i;
      for (i = 0; unicode_accented_letters[i].cmd; i++)
        {
          UNICODE_ACCENT_LETTER *letter = &unicode_accented_letters[i];
          if (cmd == letter->cmd && ! strcmp (text, letter->letter))
            {
              xasprintf (&result, "&#%s;", letter->numerical_entity);
              return result;
            }
        }
    }

  return 0;
}

/* return to be freed by the caller */
char *
xml_comment (CONVERTER *converter, const char *text)
{
  const char *p = text;

  TEXT result;

  text_init (&result);
  text_append_n (&result, "<!--", 4);
  while (*p)
    {
      const char *q = strchr (p, '-');
      if (q)
        {
          if (q - p)
            text_append_n (&result, p, q +1 - p);
          p = q + 1;
          p += strspn (p, "-");
        }
      else
        {
          text_append (&result, p);
          break;
        }
    }
  if (result.end > 0 && result.text[result.end - 1] == '\n')
    {
      result.end--;
    }
  text_append_n (&result, " -->\n", 5);
  return result.text;
}

