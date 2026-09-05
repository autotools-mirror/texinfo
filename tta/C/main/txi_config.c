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
   along with this program.  If not, see <https://www.gnu.org/licenses/>. */

/* Interface similar to the Perl Texinfo::Config module for code
   related to customization options setting */

/* not used in code called from Perl texi2any, to be used from C code
   and for the Texinfo::Config XS functions that are overriden when
   interpreter is embedded */

#include <config.h>

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stddef.h>
#include <stdarg.h>
#ifdef ENABLE_NLS
#include <libintl.h>
#endif
/* for pgettext and to have a definition of gettext in case ENABLE_NLS
   is not set */
#include "gettext.h"

#include "options_data.h"
#include "option_types.h"
#include "text.h"
#include "tree_types.h"
/* fatal */
#include "base_utils.h"
/* xasprintf decode_string encode_string */
#include "utils.h"
#include "customization_options.h"

static OPTIONS_LIST *program_options;
static OPTIONS_LIST *cmdline_options;
static OPTIONS_LIST init_files_options;
static char * const *program_file;

/* to be called from the main program.  This allows to share
   the options lists among the main program and this file */

OPTIONS_LIST *
GNUT_initialize_customization (char * const *real_command_name,
                               OPTIONS_LIST *main_options_defaults,
                               OPTIONS_LIST *main_cmdline_options)
{
  program_options = main_options_defaults;
  cmdline_options = main_cmdline_options;

  initialize_options_list (&init_files_options);

  /*
  char *program_options_str = show_options_list_options_set (program_options);
  fprintf (stderr, "options_defaults: %s\n", program_options_str);
  free (program_options_str);
   */

  program_file = real_command_name;

  return &init_files_options;
}

OPTION *
GNUT_get_conf (size_t number)
{
  if (option_number_in_option_list (cmdline_options, number))
    return cmdline_options->sorted_options[number -1];

  if (option_number_in_option_list (&init_files_options, number))
    return init_files_options.sorted_options[number -1];

  if (option_number_in_option_list (program_options, number))
    return program_options->sorted_options[number -1];

  return 0;
}

char *
GNUT_decode_input (char *text)
{
  OPTION *option
    = GNUT_get_conf (program_options->options->COMMAND_LINE_ENCODING.number);
  if (option && option->o.string)
    {
      int status;
      char *result = decode_string (text, option->o.string, &status, 0);
      return result;
    }
  else
    return strdup (text);
}

char *
GNUT_encode_message (char *text)
{
  OPTION *option
    = GNUT_get_conf (program_options->options->MESSAGE_ENCODING.number);
  if (option && option->o.string)
    {
      int status;
      char *result = encode_string (text, option->o.string,
                                    &status, 0, ieh_mark, 0);
      return result;
    }
  else
    return strdup (text);
}

void
txi_config_document_warn (const char *format, ...)
{
  char *message;
  char *encoded_message;
  char *formatted_message;
  OPTION *option
    = GNUT_get_conf (program_options->options->NO_WARN.number);

  if (option && option->o.integer > 0)
    return;

  va_list v;

  va_start (v, format);

#ifdef ENABLE_NLS
  xvasprintf (&message, gettext (format), v);
#else
  xvasprintf (&message, format, v);
#endif
  if (!message) fatal ("vasprintf failed");

  va_end (v);

#ifdef ENABLE_NLS
  xasprintf (&formatted_message,
          pgettext ("program name: warning: warning_message",
                    "%s: warning: %s"), *program_file, message);
#else
  xasprintf (&formatted_message, "%s: warning: %s",
                              *program_file, message);
#endif
  if (!formatted_message) fatal ("asprintf failed");
  free (message);

  encoded_message = GNUT_encode_message (formatted_message);
  free (formatted_message);

  if (encoded_message)
    {
      fprintf (stderr, "%s\n", encoded_message);
      free (encoded_message);
    }
}

/* The caller should have already converted a char option string to UTF-8 */
static void
set_option_value (OPTIONS_LIST *options_list, size_t number,
                  const char *value)
{
  OPTION *option = options_list->sorted_options[number -1];

  if (option->type == GOT_integer)
    {
      char *endptr;
      long long_value = strtol (value, &endptr, 10);
      int int_value = (int) long_value;
      if (endptr != value)
        {
          if (int_value >= 0
              || (int_value == -2
                  && option->number == txi_base_options.paragraphindent.number))
            option_set_conf (option, int_value, 0);
        }
      else
        {
        /* warn?  No such check in Perl */
        /* Consider that the option is set if the string is not empty, similar
           to Perl.
           Not exactly the same as comparison won't fail in C, while
           it will fail in Perl and trigger a warning. */
           if (!strcmp (value, ""))
             option_set_conf (option, 0, 0);
           else
             option_set_conf (option, 1, 0);
        }
    }
  else if (option->type == GOT_char
           || option->type == GOT_bytes)
    {
      char *option_value;
      if (!value)
        option_value = strdup ("");
      else
        option_value = strdup (value);
      option_set_conf (option, 0, option_value);
      free (option_value);
    }
  options_list_add_option_number (options_list, number);
}

/* add default based, for instance, on the format. */
int
GNUT_set_customization_default (size_t number, const char *value)
{
  if (option_number_in_option_list (cmdline_options, number)
      || option_number_in_option_list (&init_files_options, number))
    return 0;

  set_option_value (program_options, number, value);
  return 1;
}

void
GNUT_set_from_cmdline (OPTIONS_LIST *options_list, size_t number,
                       const char *value)
{
  if (!strcmp (value, "undef"))
    {
      OPTION *option = options_list->sorted_options[number -1];
      clear_option (option);
      options_list_add_option_number (options_list, option->number);
    }
  else
    set_option_value (options_list, number, value);
}

OPTION *
texinfo_get_conf_by_name (const char *var)
{
  OPTION *option = find_option_string (init_files_options.sorted_options,
                                       var);

  if (option)
    return GNUT_get_conf (option->number);

  return 0;
}

OPTION *
texinfo_find_command_line_option_name (const char *option_name)
{
  OPTION *option = find_option_string (cmdline_options->sorted_options,
                                       option_name);
  return option;
}

/* In Perl the values may be mapped, here we just ignore */
static int
warn_obsolete_options (const char *option_name)
{
  if (!strcmp (option_name, "L2H"))
    {
      txi_config_document_warn ("obsolete option: %s", option_name);
      return 1;
    }
  return 0;
}

OPTION *
texinfo_find_init_file_option_name (const char *option_name)
{
  OPTION *option;

  if (warn_obsolete_options (option_name))
    return 0;

  option = find_option_string (init_files_options.sorted_options,
                               option_name);

  if (!option)
    txi_config_document_warn ("%s: unknown variable %s",
                         "texinfo_set_from_init_file", option_name);

  return option;
}

void
texinfo_command_line_option_add_option_number (size_t number)
{
  options_list_add_option_number (&init_files_options, number);
}

int
GNUT_set_from_init_file (const char *option_name, const char *value)
{
  OPTION *option;

  if (warn_obsolete_options (option_name))
    return 0;

  option = find_option_string (init_files_options.sorted_options,
                               option_name);

  if (!option)
    {
      txi_config_document_warn("%s: unknown variable %s",
                               "texinfo_set_from_init_file",
                               option_name);
      return 0;
    }

  if (option_number_in_option_list (cmdline_options, option->number))
    return 0;

  set_option_value (&init_files_options, option->number, value);
  return 1;
}

int
txi_config_add_to_option_list (OPTION *option, const char *value,
                               int prepend)
{
  STRING_LIST *str_list;
  size_t idx_option;

  if (option->type != GOT_bytes_string_list
      && option->type != GOT_file_string_list
      && option->type != GOT_char_string_list)
    return 0;

  str_list = option->o.strlist;

  if (prepend)
    {
    /* accept duplicates in that case, as prepending should in general
       be used to override by being first */
      static STRING_LIST tmp_strlist;
      add_string (&tmp_strlist, value);
      copy_strings (&tmp_strlist, str_list);
      clear_strings_list (str_list);
      merge_strings (str_list, &tmp_strlist);
      tmp_strlist.number = 0;
    }
  else
    {
      idx_option = find_string (str_list, value);

      if (!idx_option)
        add_string (str_list, value);
    }
  return 1;
}

int
txi_config_remove_from_option_list (const OPTION *option, const char *value)
{
  STRING_LIST *str_list;
  size_t idx_option;

  if (option->type != GOT_bytes_string_list
      && option->type != GOT_file_string_list
      && option->type != GOT_char_string_list)
    return 0;

  str_list = option->o.strlist;
  idx_option = find_string (str_list, value);

  if (idx_option)
    remove_from_strings_list (str_list, idx_option -1);
  return 1;
}

static char *init_file_format;

void
texinfo_set_format_from_init_file (const char *init_file_format_in)
{
  free (init_file_format);
  init_file_format = strdup (init_file_format_in);
}

char *
GNUT_get_format_from_init_file (void)
{
  if (init_file_format)
    return strdup (init_file_format);
  else
    return 0;
}
