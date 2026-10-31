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

#include <config.h>

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "element_types.h"
#include "tree_types.h"
#include "document_types.h"
#include "options_data.h"
#include "option_types.h"
/* new_element */
#include "tree.h"
#include "hashmap.h"
/* for wipe_values ... */
#include "utils.h"
/* reset_command_stack */
#include "command_stack.h"
#include "errors.h"
/* new_document */
#include "document.h"
/* for global_parser_conf */
#include "parser_conf.h"
/* for wipe_user_commands */
#include "commands.h"
#include "context_stack.h"
/* source_marks_reset_counters */
#include "source_marks.h"
/* set_input_encoding input_push_file... */
#include "input.h"
/* for wipe_macros store_value init_values */
#include "macro.h"
/* for reset_conf */
#include "set_parser_conf.h"
#include "parser.h"
/* for init_index_commands */
#include "indices.h"
#include "parser_api.h"

/* Differences with Perl: some variables are static initialized to 0,
   macro_expansion_nr or macro_block_stack related variables.
   sections_level_modifier is in document global info here.
 */
static DOCUMENT *
initialize_parsing (enum context root_ct)
{
  parsed_document = new_document ();

  if (!global_parser_conf->no_index)
    init_index_commands ();

  wipe_user_commands ();
  wipe_macros ();

  /* initialize from conf */
  init_values ();

  /* currently there is no change done to include directories,
     so global_parser_conf->include_directories could be used instead
     of parser_include_directories */
  clear_strings_list (&parser_include_directories);
  copy_strings (&parser_include_directories,
                &global_parser_conf->include_directories);

  clear_c_hashmap (&warned_deprecated_commands);
  init_c_hashmap (&warned_deprecated_commands, DEPRECATED_CMD_NUMBER);

  /* with the help of parser_conf_set_* calls, same as setting parser_state
     documentlanguage and documentscript from parser conf */
  free (global_documentlanguage);
  if (global_parser_conf->global_documentlanguage_fixed
      && global_parser_conf->documentlanguage)
    global_documentlanguage = strdup (global_parser_conf->documentlanguage);
  else
    global_documentlanguage = 0;

  free (global_documentscript);
  if (global_parser_conf->global_documentscript_fixed
      && global_parser_conf->documentscript)
    global_documentscript = strdup (global_parser_conf->documentscript);
  else
    global_documentscript = 0;

  /* initialize document state */
  global_kbdinputstyle = kbd_distinct;

  current_node = 0;
  current_section = 0;
  current_part = 0;
  source_marks_reset_counters ();

  parser_reset_encoding_list ();
  set_input_encoding ("utf-8");
  parser_float_records.number = 0;

  /* initialize parsing state */
  reset_context_stack ();
  push_context (root_ct, CM_NONE);
  reset_command_stack (&nesting_context.basic_inline_stack);
  reset_command_stack (&nesting_context.basic_inline_stack_on_line);
  reset_command_stack (&nesting_context.basic_inline_stack_block);
  reset_command_stack (&nesting_context.regions_stack);
  memset (&nesting_context, 0, sizeof (nesting_context));
  reset_parser_counters ();

  return parsed_document;
}

/* analogous to creating a new parser with the parser() method in Perl,
   except that the configuration is modified by following calls to
   parser_conf_set_* functions instead of being an argument to the parser
   method call.
 */
void
reset_parser (int local_debug_output)
{
  /* We cannot call debug () here, because the configuration of the previous
     parser invokation has not been reset already, and new configuration has
     not been read, so we need to pass the configuration information
     directly */
  /*
  debug ("C|!!!!!!!!!!!!!!!! RESETTING THE PARSER !!!!!!!!!!!!!!!!!!!!!");
  */
  if (local_debug_output)
    fprintf (stderr,
          "C|!!!!!!!!!!!!!!!! RESETTING THE PARSER !!!!!!!!!!!!!!!!!!!!!\n");

  reset_parser_conf ();
}

/* Determine directory path based on file name.
   Return a DOCUMENT_DESCRIPTOR that can be used to retrieve the
   tree and document obtained by parsing INPUT_FILE_PATH.
   STATUS is set to non zero if parsing could not proceed.
   It is always the responsibility of the caller to get the error
   messages and destroy the document. */
DOCUMENT *
parse_file (const char *input_file_path, int *status)
{
  DOCUMENT *document = initialize_parsing (ct_base);
  GLOBAL_INFO *global_info;
  char *input_file_name_and_directory[2];
  int input_error;

  parse_file_path (input_file_path, input_file_name_and_directory);

  global_info = &parsed_document->global_info;

  free (global_info->input_file_name);
  free (global_info->input_directory);
  global_info->input_file_name = input_file_name_and_directory[0];
  global_info->input_directory = input_file_name_and_directory[1];

  input_error = input_push_file (input_file_path);
  if (input_error)
    {
      char *decoded_file_path;
      if (global_parser_conf->command_line_encoding)
        {
          int status;
          /* cast as decode_string argument should not be modified but cannot be
             marked as const */
          decoded_file_path
            = decode_string ((char *)input_file_path,
                             global_parser_conf->command_line_encoding,
                             &status, 0);
        }
      else
        decoded_file_path = strdup (input_file_path);
      message_list_document_error (&parsed_document->parser_error_messages, 0,
                                   0, "could not open %s: %s",
                                   decoded_file_path, strerror (input_error));
      free (decoded_file_path);
      *status = 1;
      return document;
    }

  parse_texi_document ();

  *status = 0;
  return document;
}

/* STRING should be a UTF-8 buffer. */
DOCUMENT *
parse_text (const char *string, int line_nr)
{
  DOCUMENT *document = initialize_parsing (ct_base);

  input_push_text (strdup (string), line_nr, 0, 0);
  parse_texi_document ();
  return document;
}

/* Return the DOCUMENT obtained by parsing the Texinfo code in STRING.
   STRING should be a UTF-8 buffer. */
DOCUMENT *
parse_string (const char *string, int line_nr)
{
  ELEMENT *root_elt;
  DOCUMENT *document = initialize_parsing (ct_line);

  root_elt = new_element (ET_root_line);

  input_push_text (strdup (string), line_nr, 0, 0);
  parse_texi (root_elt);
  return document;
}

/* STRING should be a UTF-8 buffer. */
DOCUMENT *
parse_piece (const char *string, int line_nr)
{
  DOCUMENT *document = initialize_parsing (ct_base);
  ELEMENT *before_node_section;

  before_node_section = setup_document_root_and_before_node_section ();

  input_push_text (strdup (string), line_nr, 0, 0);
  parse_texi (before_node_section);
  return document;
}

void
parser_conf_reset_values (void)
{
  wipe_values (&global_parser_conf->values);
}

void
parser_conf_add_value (const char *name, const char *value)
{
  store_value_parsed_document (&global_parser_conf->values, name, value);
}

/* ALTIMP Texinfo/ParserXS.pm */
/* parser initialization, similar to calling Texinfo::Parser::parser in Perl.
   The implementation is different from Texinfo::ParserNonXS because here
   we need to convert options list to parser configuration function calls,
   as is done in ParserXS.pm with XS.  This is not needed in ParserNonXS.pm.
   The implementation is similar to ParserXS.pm on purpose.
   Also sets INCLUDE_DIRECTORIES minimally if not specified in options,
   FILE_PATH is only used in that case.

   Not called from Perl with XS, as ParserXS.pm already does the same
   job, called from C only.
 */
void
parser (const char *file_path, const VALUE_LIST *values,
        OPTIONS_LIST *options_list)
{
  char *input_file_name_and_directory[2];
  char *input_directory;
  size_t i;
  int debug = 0;
  int includes_set = 0;

  /* special case, we need to know if debug is set before calling
     reset_parser */
  if (options_list)
    {
      if (options_list->options->DEBUG.o.integer >= 0)
        debug = 1;
    }

  reset_parser (debug);

  parser_conf_set_DEBUG (debug);

  if (values)
    {
      parser_conf_reset_values ();
      for (i = 0; i < values->number; i++)
        {
          parser_conf_add_value (values->list[i].name,
                                 values->list[i].value);
        }
    }

  if (options_list)
    {
      for (i = 0; i < options_list->number; i++)
        {
          size_t index = options_list->list[i] -1;
          OPTION *option = options_list->sorted_options[index];
          if (!strcmp (option->name, "INCLUDE_DIRECTORIES"))
            {
              includes_set = 1;
              parser_conf_clear_INCLUDE_DIRECTORIES ();
              if (option->o.strlist)
                {
                  size_t j;
                  STRING_LIST *directories = option->o.strlist;
                  for (j = 0; j < directories->number; j++)
                    if (directories->list[j])
                      parser_conf_add_include_directory (directories->list[j]);
                }
            }
          else if (!strcmp (option->name, "EXPANDED_FORMATS"))
            {
              parser_conf_clear_expanded_formats ();
              if (option->o.strlist)
                {
                  size_t j;
                  STRING_LIST *expanded_formats = option->o.strlist;
                  for (j = 0; j < expanded_formats->number; j++)
                    if (expanded_formats->list[j])
                      parser_conf_add_expanded_format
                         (expanded_formats->list[j]);
                }
            }
          else if (!strcmp (option->name, "documentlanguage"))
            {
              if (option->o.string)
                parser_conf_set_documentlanguage (option->o.string);
            }
          else if (!strcmp (option->name, "documentscript"))
            {
              if (option->o.string)
                parser_conf_set_documentscript (option->o.string);
            }
          else if (!strcmp (option->name, "FORMAT_MENU"))
            {
              if (option->o.string
                  && (!strcmp (option->o.string, "menu")
                      || !strcmp (option->o.string, "menu_no_detailmenu")))
                parser_conf_set_show_menu (1);
              else
                parser_conf_set_show_menu (0);
            }
          else if (!strcmp (option->name,
                            "IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME"))
            parser_conf_set_IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME
                                                  (option->o.integer);
          else if (!strcmp (option->name, "CPP_LINE_DIRECTIVES"))
            parser_conf_set_CPP_LINE_DIRECTIVES ((option->o.integer > 0));
          else if (!strcmp (option->name, "MAX_MACRO_CALL_NESTING"))
            parser_conf_set_MAX_MACRO_CALL_NESTING (option->o.integer);
          else if (!strcmp (option->name, "NO_INDEX"))
            parser_conf_set_NO_INDEX ((option->o.integer > 0));
          else if (!strcmp (option->name, "NO_USER_COMMANDS"))
            parser_conf_set_NO_USER_COMMANDS ((option->o.integer > 0));
          else if (!strcmp (option->name, "DOC_ENCODING_FOR_INPUT_FILE_NAME"))
            parser_conf_set_DOC_ENCODING_FOR_INPUT_FILE_NAME
                                               ((option->o.integer > 0));
          else if (!strcmp (option->name, "INPUT_FILE_NAME_ENCODING"))
            {
              if (option->o.string)
                parser_conf_set_INPUT_FILE_NAME_ENCODING (option->o.string);
            }
          else if (!strcmp (option->name, "LOCALE_ENCODING"))
            {
              if (option->o.string)
                parser_conf_set_LOCALE_ENCODING (option->o.string);
            }
          else if (!strcmp (option->name, "COMMAND_LINE_ENCODING"))
            {
              if (option->o.string)
                parser_conf_set_COMMAND_LINE_ENCODING (option->o.string);
            }
          else if (!strcmp (option->name, "accept_internalvalue"))
            {
              /* called from gdt, no need to store the parser configuration */
              if (option->o.integer > 0)
                parser_conf_set_accept_internalvalue (1);
              /* $store_conf = 0; */
            }
          else if (strcmp (option->name, "DEBUG"))
            {
              fprintf (stderr, "ignoring parser configuration value \"%s\"\n",
                               option->name);
            }
        }
    }

  if (!includes_set)
    {
      if (file_path)
        {
          parse_file_path (file_path, input_file_name_and_directory);
          input_directory = input_file_name_and_directory[1];
          free (input_file_name_and_directory[0]);

          if (input_directory && strcmp (input_directory, "."))
            {
              parser_conf_clear_INCLUDE_DIRECTORIES ();
              parser_conf_add_include_directory (".");
              parser_conf_add_include_directory (input_directory);
            }
          free (input_directory);
        }
    }
}

