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

/* In sync with Texinfo::Convert::Text */

#include <config.h>

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
/* for strcasecmp */
#include <strings.h>

#include "text.h"
#include "command_ids.h"
#include "element_types.h"
#include "tree_types.h"
#include "converter_types.h"
#include "options_data.h"
#include "option_types.h"
#include "types_data.h"
#include "tree.h"
#include "extra.h"
#include "builtin_commands.h"
/* for find_innermost_accent_contents ... */
#include "utils.h"
#include "unicode.h"
/* wipe_error_message_list */
#include "errors.h"
/* for PARSED_DEF add_heading_number
   translated_command_tree ... */
#include "convert_utils.h"
/*
#include "convert_to_texinfo.h"
*/
#include "debug.h"
/* for gdt_tree set_translations_documentlanguage */
#include "translations.h"
#include "convert_to_text.h"

TEXT_OPTIONS *
new_text_options (void)
{
  TEXT_OPTIONS *options = (TEXT_OPTIONS *) malloc (sizeof (TEXT_OPTIONS));
  memset (options, 0, sizeof (TEXT_OPTIONS));
  options->expanded_formats = new_expanded_formats ();
  options->NUMBER_SECTIONS = -1;
  options->DOC_ENCODING_FOR_INPUT_FILE_NAME = -1;
  memset (&options->include_directories, 0, sizeof (STRING_LIST));
  add_translated_command (&options->translated_commands, CM_error,
                          "error@arrow{}");
  return options;
}

void
destroy_text_options (TEXT_OPTIONS *text_options)
{
  free (text_options->encoding);
  free (text_options->expanded_formats);
  free (text_options->LOCALE_ENCODING);
  free (text_options->COMMAND_LINE_ENCODING);
  free (text_options->INPUT_FILE_NAME_ENCODING);
  free_strings_list (&text_options->include_directories);
  free_translated_commands (&text_options->translated_commands);
  if (text_options->error_messages.number)
    fprintf (stderr,
             "WARNING: destroy_text_options error messages ignored: %zu\n",
             text_options->error_messages.number);
  wipe_error_message_list (&text_options->error_messages);
  free (text_options);
}

#define TEXT_INDICATOR_CONVERTER_OPTIONS \
  tico_option_name(ASCII_GLYPH) \
  tico_option_name(DEBUG) \
  tico_option_name(DOC_ENCODING_FOR_INPUT_FILE_NAME) \
  tico_option_name(NUMBER_SECTIONS) \
  tico_option_name(TEST)

/* NOTE not tested in a situation with translations in text converter
   as it can only be tested with a carefully crafted code where a
   converter is associated to the text converter and called for a whole
   document as done in
    t/z_misc/convert_to_text.t
   And in this test file, the XS interface is used to setup the
   options used for conversion, not pure C and the XS interface uses
   global_information as in Perl.
 */
/* the string and strlist options need to be copied, in case they are
   deallocated if options are reset */
TEXT_OPTIONS *
copy_options_for_convert_text (OPTIONS *options, DOCUMENT *document)
{
  TEXT_OPTIONS *text_options = new_text_options ();
  int text_indicator_option;

  if (options->ENABLE_ENCODING.o.integer > 0
       && options->OUTPUT_ENCODING_NAME.o.string)
    {
      text_options->encoding = strdup (options->OUTPUT_ENCODING_NAME.o.string);
    }

  #define tico_option_name(name) \
  text_indicator_option = options->name.o.integer; \
  if (text_indicator_option > 0) { text_options->name = 1; } \
  else if (text_indicator_option >= 0) { text_options->name = 0; }
   TEXT_INDICATOR_CONVERTER_OPTIONS
  #undef tico_option_name

  set_expanded_formats_from_options (text_options->expanded_formats, options);

  copy_strings (&text_options->include_directories,
                options->INCLUDE_DIRECTORIES.o.strlist);

  if (options->COMMAND_LINE_ENCODING.o.string)
    text_options->COMMAND_LINE_ENCODING
      = strdup (options->COMMAND_LINE_ENCODING.o.string);

  /* The documentlanguage and documentscript options values
     are not fit for the call below if this is not called at the very
     beginning.  It is probably not a real issue, as the function are
     called early in converters and it is also documented for the other caller,
     setup_*index_entry_keys_formatting, that it should be called early.
   */
  if (document)
    {
      text_options->current_lang_translations
        = set_preamble_language_commands (
                &document->global_info.preamble_lang_cmd,
                &converters_translation_cache,
                options->documentlanguage.o.string,
                options->documentscript.o.string,
                TXI_CONVERT_STRINGS_NR);
    }


  if (options->INPUT_FILE_NAME_ENCODING.o.string)
    text_options->INPUT_FILE_NAME_ENCODING
      = strdup (options->INPUT_FILE_NAME_ENCODING.o.string);

  if (options->LOCALE_ENCODING.o.string)
    text_options->LOCALE_ENCODING
      = strdup (options->LOCALE_ENCODING.o.string);

  return text_options;
}

TEXT_OPTIONS *
copy_converter_options_for_convert_text (CONVERTER *self)
{
  TEXT_OPTIONS *text_options = copy_options_for_convert_text (self->conf,
                                                             self->document);
  copy_translated_commands (&text_options->translated_commands,
                            &self->translated_commands);

  text_options->converter = self;
  return text_options;
}

/* In Indices.pm */
static void
set_additional_index_entry_keys_options (OPTIONS *options,
                                         TEXT_OPTIONS *text_options)
{
  if (options->ENABLE_ENCODING.o.integer <= 0
      || !(options->OUTPUT_ENCODING_NAME.o.string
           && !strcasecmp (options->OUTPUT_ENCODING_NAME.o.string, "utf-8")))
    {
      text_options->sort_string = 1;
    }
}

/* there are two variants, to setup the text options used for index
   index entries formatting as text in case this is done with a
   converter or without. */
TEXT_OPTIONS *
setup_index_entry_keys_formatting (OPTIONS *options, DOCUMENT *document)
{
  TEXT_OPTIONS *text_options = copy_options_for_convert_text (options,
                                                              document);
  set_additional_index_entry_keys_options (options, text_options);
  return text_options;
}

TEXT_OPTIONS *
setup_converter_index_entry_keys_formatting (CONVERTER *self)
{
  TEXT_OPTIONS *text_options = copy_converter_options_for_convert_text (self);
  set_additional_index_entry_keys_options (self->conf, text_options);
  return text_options;
}


/* following functions to be used to modify TEXT_OPTIONS encoding */

void
text_set_options_encoding_if_not_ascii (CONVERTER *self,
                                        TEXT_OPTIONS *text_options)
{
  if (self->conf->OUTPUT_ENCODING_NAME.o.string
      && strcmp (self->conf->OUTPUT_ENCODING_NAME.o.string, "us-ascii"))
    {
      if (text_options->_saved_enabled_encoding)
        {
          fprintf (stderr,
            "BUG: if_not_ascii _saved_enabled_encoding set: %s / %s\n",
               text_options->_saved_enabled_encoding,
               self->conf->OUTPUT_ENCODING_NAME.o.string);
          text_options->_saved_enabled_encoding = 0;
        }

      text_options->_saved_enabled_encoding = text_options->encoding;
      text_options->encoding = self->conf->OUTPUT_ENCODING_NAME.o.string;
    }
}

/* the caller should ensure that encoding will remain allocated until
   the next call to text_reset_options_encoding */
void
text_set_options_encoding (TEXT_OPTIONS *text_options, char *encoding)
{
  if (text_options->_saved_enabled_encoding)
    {
      fprintf (stderr, "BUG: _saved_enabled_encoding set: %s / %s\n",
               text_options->_saved_enabled_encoding, encoding);
      text_options->_saved_enabled_encoding = 0;
    }
  text_options->_saved_enabled_encoding = text_options->encoding;
  text_options->encoding = encoding;
}

void
text_reset_options_encoding (TEXT_OPTIONS *text_options)
{
  text_options->encoding = text_options->_saved_enabled_encoding;
  text_options->_saved_enabled_encoding = 0;
}

/* the CONVERTER argument is not used, it is there solely to match the
   calling prototype in accent formatting commands */
static char *
ascii_accent (CONVERTER *self, const char *text,
              const ELEMENT *command, int index_in_stack,
              const CONST_ELEMENT_LIST *stack, int set_case)
{
  const enum command_id cmd = command->e.c->cmd;
  TEXT accent_text;

  text_init (&accent_text);

  if (cmd == CM_udotaccent)
    {
      text_append (&accent_text, ".");
      text_append (&accent_text, text);
    }
  else
    {
      text_append (&accent_text, text);
      if (cmd == CM_H)
        text_append (&accent_text, "''");
      else if (cmd == CM_dotaccent)
        text_append (&accent_text, ".");
      else if (cmd == CM_ringaccent)
        text_append (&accent_text, "*");
      else if (cmd == CM_tieaccent)
        text_append (&accent_text, "[");
      else if (cmd == CM_u)
        text_append (&accent_text, "(");
      else if (cmd == CM_ubaraccent)
        text_append (&accent_text, "_");
      else if (cmd == CM_v)
        text_append (&accent_text, "<");
      else if (cmd == CM_ogonek)
        text_append (&accent_text, ";");
      else if (cmd != CM_dotless)
        text_append (&accent_text, builtin_command_name (cmd));
    }
  return accent_text.text;
}

static char *
ascii_accents_internal (const char *text, const CONST_ELEMENT_LIST *stack,
                        int set_case)
{
  char *result;
  int i;

  if (set_case)
    result = to_upper_or_lower_multibyte (text, set_case);
  else
    result = strdup (text);

  for (i = stack->number - 1; i >= 0; i--)
    {
      const ELEMENT *accent_command = stack->list[i];
      char *formatted_accent = ascii_accent (0, result, accent_command, 0, 0,
                                             set_case);
      free (result);
      result = formatted_accent;
    }

  return result;
}

/* local restricted set of TEXT_OPTIONS relevant for accent formatting
   set from function arguments */
static TEXT_OPTIONS text_accents_options;

/* format an accent command and nested accents within as Text. */
char *
text_accents (const ELEMENT *accent, char *encoding, int set_case)
{
  ACCENTS_STACK *accent_stack = find_innermost_accent_contents (accent);
  char *arg_text;
  char *result;
  TEXT_OPTIONS *text_options = &text_accents_options;

  text_options->encoding = encoding;
  text_options->set_case = set_case;

  if (accent_stack->argument)
    arg_text = convert_to_text (accent_stack->argument, text_options);
  else
    arg_text = strdup ("");

  result = encoded_accents (0, arg_text, &accent_stack->stack, encoding,
                            ascii_accent, set_case);

  if (!result)
    result = ascii_accents_internal (arg_text, &accent_stack->stack, set_case);
  free (arg_text);
  destroy_accent_stack (accent_stack);
  return result;
}

/* result to be freed by caller */
char *
text_brace_no_arg_command (const ELEMENT *e, const char *encoding,
                           int ascii_glyph, int sort_string, int set_case)
{
  char *result = 0;
  enum command_id cmd = e->e.c->cmd;

  if (encoding
      && (!ascii_glyph
          || !(unicode_character_brace_no_arg_commands[cmd].is_extra > 0)))
    {
      const char *brace_no_arg_unicode
          = unicode_brace_no_arg_command (cmd, encoding);
      if (brace_no_arg_unicode)
        result = strdup (brace_no_arg_unicode);
    }

  if (!result)
    {
      if (sort_string
          && sort_brace_no_arg_commands[cmd]
          && strlen (sort_brace_no_arg_commands[cmd]))
        result = strdup (sort_brace_no_arg_commands[cmd]);
      else
        result = strdup (text_brace_no_arg_commands[cmd]);
    }

  if (set_case
      && (command_other_flags (e) & CF_letter_no_arg))
    {
      char *cased = to_upper_or_lower_multibyte (result, set_case);
      free (result);
      result = cased;
    }

  return result;
}

static const char *underline_symbol[5] = {"*", "*", "=", "-", "."};

/* Return the text of an underlined heading. */
/* return to be freed by caller */
static TEXT
text_heading (const ELEMENT *current, TEXT text,
              int numbered, const LANG_TRANSLATION *lang_translation,
              int debug_level)
{
  int i;
  TEXT result;
  int level;
  int status;
  int text_width;

  /* end of lines spaces are ignored in conversion.  However in
     rare cases, invalid nestings leave an end of line, so we chomp.
   */
  if (text.end > 0 && text.text[text.end - 1] == '\n')
    text.text[--text.end] = '\0';

  /* frees text if it does not reuse it */
  result = add_heading_number (current, text, numbered, lang_translation,
                               debug_level);

  if (strspn (result.text, whitespace_chars) == result.end)
    {
      text_reset (&result);
      text_append (&result, "");
      return result;
    }

  /* width of heading */
  text_width = width_multibyte (result.text, result.end);

  text_append (&result, "\n");

  level = lookup_extra_integer (current, AI_key_section_level, &status);
  /* could also be status < 0 */
  if (status != 0)
    level = section_level (current);

  for (i = 0; i < text_width; i++)
    text_append (&result, underline_symbol[level]);

  text_append (&result, "\n");

  return result;
}

static void
convert_to_text_internal (const ELEMENT *element, TEXT_OPTIONS *text_options,
                          TEXT *result);

static void
convert_def_line (const ELEMENT *element, TEXT_OPTIONS *text_options,
                  TEXT *result)
{
  PARSED_DEF *parsed_def = definition_arguments_content (element);
  ELEMENT *parsed_definition_category
     = definition_category_tree (element,
                                 text_options->current_lang_translations,
                                 text_options->DEBUG, 0);
  if (parsed_definition_category)
    {
      ELEMENT *converted_element = new_element (ET_NONE);
      ELEMENT *text_colon = new_text_element (ET_normal_text);
      ELEMENT *text_eol = new_text_element (ET_normal_text);
      ELEMENT *type_text_space = 0;
      ELEMENT *args_text_space = 0;
      add_to_contents_as_array (converted_element,
                                parsed_definition_category);
      text_append (text_colon->e.text, ": ");
      add_to_contents_as_array (converted_element, text_colon);
      if (parsed_def->type)
        {
          type_text_space = new_text_element (ET_normal_text);
          add_to_contents_as_array (converted_element, parsed_def->type);
          text_append (type_text_space->e.text, " ");
          add_to_contents_as_array (converted_element, type_text_space);
        }
      if (parsed_def->name)
        add_to_contents_as_array (converted_element, parsed_def->name);
      if (parsed_def->args)
        {
          args_text_space = new_text_element (ET_normal_text);
          text_append (args_text_space->e.text, " ");
          add_to_contents_as_array (converted_element, args_text_space);
          add_to_contents_as_array (converted_element, parsed_def->args);
        }
      text_append (text_eol->e.text, "\n");
      add_to_contents_as_array (converted_element, text_eol);

      text_options->code_state++;
      convert_to_text_internal (converted_element,
                                text_options, result);
      text_options->code_state--;

      destroy_element (converted_element);
      destroy_element (text_colon);
      destroy_element_and_children (parsed_definition_category);
      destroy_element (text_eol);
      if (type_text_space)
        {
          destroy_element (type_text_space);
        }
      if (args_text_space)
        {
          destroy_element (args_text_space);
        }
    }
  destroy_parsed_def (parsed_def);
}

#define ADD(x) text_append (result, x)

void
convert_to_text_internal (const ELEMENT *element, TEXT_OPTIONS *text_options,
                          TEXT *result)
{
  enum command_id data_cmd = 0;

  /*
  fprintf (stderr, "CTTI: %s '%.20s'\n", print_element_debug (element, 1),
           result->e.text);
   */


  if (type_data[element->type].flags & TF_text)
    {
      if (element->type == ET_ignorable_spaces_after_command
          || element->type == ET_spaces_at_end
          || element->type == ET_space_at_end_menu_node
          || element->type == ET_spaces_before_paragraph
          || element->type == ET_spaces_after_close_brace
          || element->type == ET_spaces_before_argument
          || element->type == ET_spaces_after_argument
          || element->type == ET_verb_delimiter
         )
        return;

      if (element->e.text->end <= 0)
        return;

      if (element->type == ET_raw
          || text_options->raw_state)
        ADD(element->e.text->text);
      else
        {
          const char *p;
          char *cased = 0;
          char *text;
          /* text type should always be set */

          if (text_options->set_case)
            {
              cased
                = to_upper_or_lower_multibyte (element->e.text->text,
                                               text_options->set_case);
              text = cased;
            }
          else
            {
              text = element->e.text->text;
            }

          if (text_options->code_state)
            ADD(text);
          else
            {
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
                  if ((strlen (p) > 1) && (!strncmp (p, "``", 2)
                                         || !strncmp (p, "''", 2)))
                    {
                      ADD("\"");
                      p += 2;
                    }
                  else if ((strlen (p) > 2) && !strncmp (p, "---", 3))
                    {
                      ADD("--");
                      p += 3;
                    }
                  else if ((strlen (p) > 1) && !strncmp (p, "--", 2))
                    {
                      ADD("-");
                      p += 2;
                    }
                  else
                    {
                      text_append_n (result, p, 1);
                      p++;
                    }
                }
            }

          if (cased)
            free (cased);
        }
      return;
    }

  /* in data_cmd, user-defined commands are mapped to internal commands
     with the right flags.  If an element can be a user-defined element,
     data_cmd need to be used for all access to arrays of command_id to
     avoid an index > max index of builtin command  */
  if (element->e.c->cmd)
      data_cmd = element_builtin_data_cmd (element);

     /* hyphenation anchor errormsg sortas caption shortcaption */
  if (command_data[data_cmd].other_flags & CF_non_formatted_brace
      || (command_data[data_cmd].flags & CF_block
          && (/* ignored_block_commands */
              /* titlepage copying documentdescription */
              command_data[data_cmd].data == BLOCK_region
              /* ignore nodedescriptionblock, @*macro */
              || command_data[data_cmd].other_flags
                                            & CF_non_formatted_block
              || (/* html tex xml docbook latex */
                  command_data[data_cmd].data == BLOCK_format_raw
                  && !format_expanded_p (text_options->expanded_formats,
                                    builtin_command_name (data_cmd)))))
       /* here ignore most of the line commands */
      || element->type == ET_index_entry_command
      || (command_data[data_cmd].flags & CF_line
          && !(command_data[data_cmd].other_flags
                                             & CF_formatted_line)
          && !(command_data[data_cmd].flags & CF_def)
          && !(data_cmd == CM_sp
               || data_cmd == CM_verbatiminclude))
      || data_cmd == CM_footnote
      || data_cmd == CM_seeentry
      || data_cmd == CM_seealso
      || element->type == ET_postamble_after_end
      || element->type == ET_preamble_before_beginning
      || element->type == ET_preamble_before_setfilename
      || element->type == ET_arguments_line)
    return;

  if (data_cmd
      && command_data[data_cmd].flags & CF_brace
      && command_data[data_cmd].data == BRACE_inline
      && data_cmd != CM_inlinefmtifelse)
    {
      if (command_data[data_cmd].other_flags & CF_inline_format)
        {
          char *format = lookup_extra_string (element, AI_key_format);
          if (!format
              || !format_expanded_p (text_options->expanded_formats, format))
            return;
        }
      else
        {
          int status;
          int expand_index = lookup_extra_integer (element, AI_key_expand_index,
                                                 &status);
          if (!expand_index)
            return;
        }
    }

  if (data_cmd)
    {
      if (nobrace_symbol_text[data_cmd])
        {
          ADD(nobrace_symbol_text[data_cmd]);
          return;
        }
      else if (data_cmd == CM_today)
        {
          if (text_options->sort_string
              && sort_brace_no_arg_commands[data_cmd])
            {
              ADD(sort_brace_no_arg_commands[data_cmd]);
            }
          else
            {
              ELEMENT *today_element
                = expand_today (text_options->TEST,
                                text_options->current_lang_translations,
                                text_options->DEBUG, 0);
              convert_to_text_internal (today_element,
                                        text_options, result);
              destroy_element_and_children (today_element);
            }
          return;
        }
      else if (text_brace_no_arg_commands[data_cmd])
        {
          char *brace_no_args_text;
          ELEMENT *tree
            = translated_command_tree (&text_options->translated_commands,
               data_cmd, text_options->current_lang_translations,
               text_options->DEBUG, 0);

          if (tree)
            {
              brace_no_args_text = convert_to_text (tree, text_options);
              destroy_element_and_children (tree);
            }
          else
            brace_no_args_text
              = text_brace_no_arg_command (element,
                    text_options->encoding, text_options->ASCII_GLYPH,
                    text_options->sort_string, text_options->set_case);

          ADD(brace_no_args_text);
          free (brace_no_args_text);
          return;
        }
      else if (command_data[data_cmd].flags & CF_brace
               && command_data[data_cmd].data == BRACE_accent)
        {
          char *text = text_accents (element, text_options->encoding,
                                     text_options->set_case);
          ADD(text);
          free (text);
          return;
        }
      else if (command_data[data_cmd].flags & CF_brace)
        {
          CONST_ELEMENT_LIST *args = get_non_empty_brace_args (element);
          if (args->number <= 0)
            {
              destroy_const_element_list (args);
              return;
            }

          if (data_cmd == CM_image)
            {
              if (args->list[0])
                {
                  text_options->code_state++;
                  convert_to_text_internal (args->list[0],
                                            text_options, result);
                  text_options->code_state--;
                }
            }
          else if (data_cmd == CM_email)
            {
              TEXT replacement;
              text_init (&replacement);
              if (args->number >= 2 && args->list[1])
                {
                  convert_to_text_internal (args->list[1],
                                            text_options, &replacement);
                }
              if (replacement.end > 0)
                {
                  ADD(replacement.text);
                  free (replacement.text);
                }
              else if (args->list[0])
                {
                  text_options->code_state++;
                  convert_to_text_internal (args->list[0],
                                            text_options, result);
                  text_options->code_state--;
                }
            }
          else if (data_cmd == CM_uref || data_cmd == CM_url)
            {
              TEXT replacement;
              text_init (&replacement);

              if (args->number >= 3 && args->list[2])
                {
                  convert_to_text_internal (args->list[2],
                                            text_options, &replacement);
                }
              if (replacement.end > 0)
                {
                  ADD(replacement.text);
                  free (replacement.text);
                }
              else
                {
                  if (args->list[0])
                    {
                      text_options->code_state++;
                      convert_to_text_internal (args->list[0],
                                                text_options, result);
                      text_options->code_state--;
                    }
                  if (args->number >= 2 && args->list[1])
                    {
                      TEXT text;
                      text_init (&text);
                      convert_to_text_internal (args->list[1],
                                                text_options, &text);
                      if (text.end > 0)
                        {
                          text_printf (result, " (%s)", text.text);
                          free (text.text);
                        }
                    }
                }
            }
          else if (command_data[data_cmd].other_flags & CF_explained)
            {
              if (args->list[0])
                convert_to_text_internal (args->list[0],
                                          text_options, result);
              if (args->number >= 2 && args->list[1])
                {
                  TEXT explanation;
                  text_init (&explanation);
                  convert_to_text_internal (args->list[1],
                                            text_options, &explanation);

                  if (explanation.end > 0)
                    {
                      text_printf (result, " (%s)", explanation.text);
                      free (explanation.text);
                    }
                }
            }
          else if (command_data[data_cmd].data == BRACE_inline)
            {
              size_t arg_index = 1;
              if (data_cmd == CM_inlineraw)
                text_options->raw_state++;

              if (data_cmd == CM_inlinefmtifelse)
                {
                  char *format = lookup_extra_string (element, AI_key_format);
                  if (!format
                      || !format_expanded_p (text_options->expanded_formats,
                                             format))
                    arg_index = 2;
                }

              if (args->number > arg_index && args->list[arg_index])
                convert_to_text_internal (args->list[arg_index],
                                          text_options, result);

              if (data_cmd == CM_inlineraw)
                text_options->raw_state--;
            }
          else if (data_cmd == CM_U)
            {
              if (args->list[0])
                {
                  int surplus_arg;
                  const TEXT *arg_text
                    = simple_arg_text (args->list[0],
                                       &surplus_arg);
                  if (arg_text && strcmp (arg_text->text, ""))
                    {
                      int conversion_done = 0;
                      if (text_options->encoding
                          && !strcasecmp (text_options->encoding, "utf-8"))
                        {
                          int len;
                          char *U_result
                                = hex_string_to_utf8_char (arg_text->text,
                                                 text_options->DEBUG, &len);

                          if (U_result)
                            {
                              text_append_n (result, U_result, len);
                              free (U_result);
                              conversion_done = 1;
                            }
                        }

                      if (!conversion_done)
                        {
                          text_append_n (result, "U+", 2);
                          text_append_n (result, arg_text->text, arg_text->end);
                        }
                    }
                }
            }
          else if (args->list[0])
            {
              int in_code = 0;
              if (data_cmd == CM_sc)
                text_options->set_case++;

              if (command_data[data_cmd].other_flags & CF_brace_code
                  || command_data[data_cmd].flags & CF_math)
                in_code = 1;

              if (in_code)
                text_options->code_state++;
              convert_to_text_internal (args->list[0],
                                        text_options, result);
              if (in_code)
                text_options->code_state--;

              if (data_cmd == CM_sc)
                text_options->set_case--;
            }
          destroy_const_element_list (args);
          return;
        }
      /* block commands */
      else if (data_cmd == CM_quotation
               || data_cmd == CM_smallquotation
               || data_cmd == CM_float
               || data_cmd == CM_cartouche)
        {
          size_t i;
          TEXT args_line;
          /* arguments_line type element */
          ELEMENT *arguments_line = element->e.c->contents.list[0];

          text_init (&args_line);
          for (i = 0; i < arguments_line->e.c->contents.number; i++)
            {
              const ELEMENT *block_line_arg
                    = arguments_line->e.c->contents.list[i];
              TEXT converted_arg;
              text_init (&converted_arg);
              convert_to_text_internal (block_line_arg, text_options,
                                        &converted_arg);
              if (converted_arg.end > 0)
                {
                  int spaces_nr
                    = strspn (converted_arg.text, whitespace_chars);
                  if (converted_arg.text[spaces_nr])
                    {
                      if (args_line.end > 0 && i > 0)
                        text_append (&args_line, ", ");
                      text_append (&args_line, converted_arg.text);
                    }
                  free (converted_arg.text);
                }
            }
          /* remain 0, args_line.space 0 if all args are empty */
          if (args_line.text)
            {
              size_t spaces_nr;
              if (args_line.end > 0
                  && args_line.text[args_line.end - 1] == '\n')
              args_line.text[--args_line.end] = '\0';

              spaces_nr = strspn (args_line.text, whitespace_chars);
              if (args_line.text[spaces_nr] != '\0')
                text_append (&args_line, "\n");
              ADD(args_line.text);
              free (args_line.text);
            }
        }
      else if (command_data[data_cmd].flags & CF_sectioning_heading)
        {
          const ELEMENT *line_arg;
          TEXT text;
          TEXT heading;

          text_init (&text);
          text_append (&text, "");

          if (command_data[data_cmd].flags & CF_root)
            {
              /* arguments_line type element */
              const ELEMENT *arguments_line = element->e.c->contents.list[0];
              line_arg = arguments_line->e.c->contents.list[0];
            }
          else
            /* @heading* command */
            line_arg = element->e.c->contents.list[0];

          convert_to_text_internal (line_arg, text_options, &text);
          heading
             = text_heading (element, text,
                             text_options->NUMBER_SECTIONS,
                             text_options->current_lang_translations,
                             text_options->DEBUG);
          ADD(heading.text);
          free (heading.text);
          if (!(command_data[data_cmd].flags & CF_root))
            return;
        }
      else if (command_data[data_cmd].other_flags & CF_formatted_line)
        {
          if (data_cmd != CM_node)
            {
              TEXT text;
              text_init (&text);
              text_append (&text, "");
              if (data_cmd != CM_page)
                convert_to_text_internal (element->e.c->contents.list[0],
                                          text_options, &text);
              if (!(text.end > 0 && text.text[text.end - 1] == '\n'))
                text_append (&text, "\n");
              ADD(text.text);
              free (text.text);
              return;
            }
        }
      else if (command_data[data_cmd].flags & CF_line)
        {
          if (command_data[data_cmd].flags & CF_def)
            {
              convert_def_line (element, text_options, result);
            }
          else if (data_cmd == CM_sp)
            {
              const STRING_LIST *misc_args
                 = lookup_extra_string_list (element, AI_key_misc_args);
              /* misc_args can be 0 with invalid args */
              if (misc_args && misc_args->number > 0)
                {
                  const char *sp_arg = misc_args->list[0];
                  int sp_nr = strtoul (sp_arg, NULL, 10);
                  int i;
                  if (sp_nr > 0)
                    for (i = 0; i < sp_nr; i++)
                      ADD("\n");
                }
            }
          else if (data_cmd == CM_verbatiminclude)
            {
              ELEMENT *verbatim_include_verbatim = 0;

              ERROR_MESSAGE_LIST *error_messages
                = &text_options->error_messages;
              const char *input_file_name_encoding
                = text_options->INPUT_FILE_NAME_ENCODING;
              int doc_encoding_for_input_file_name
                = text_options->DOC_ENCODING_FOR_INPUT_FILE_NAME;
              const char *locale_encoding = text_options->LOCALE_ENCODING;
              const STRING_LIST *include_directories
                = &text_options->include_directories;
              int debug = text_options->DEBUG;
              GLOBAL_INFO *global_information = 0;

              if (text_options->document) {
                global_information = &text_options->document->global_info;
              }

              verbatim_include_verbatim
                = expand_verbatiminclude (element, include_directories,
                         error_messages, input_file_name_encoding,
                         doc_encoding_for_input_file_name, locale_encoding,
                            global_information, debug);
              if (verbatim_include_verbatim)
                {
                  convert_to_text_internal (verbatim_include_verbatim,
                                            text_options, result);
                  destroy_element_and_children (verbatim_include_verbatim);
                }
            }
          return;
        }
      else if (element->e.c->cmd == CM_item
               && element->e.c->parent->e.c->cmd == CM_enumerate)
        {
          char *spec = enumerate_item_representation (element);
          ADD(spec);
          ADD(". ");
          free (spec);
        }
    }
  if (element->type == ET_def_line)
    {
      convert_def_line (element, text_options, result);
      return;
    }
   else if (element->type == ET_untranslated_def_line_arg)
    {
      ELEMENT *tree = 0;
      const char *category_text = element->e.c->contents.list[0]->e.text->text;
      const char *translation_context
        = lookup_extra_string (element, AI_key_translation_context);

      if (text_options->current_lang_translations)
        {
       /*
       the tree documentlanguage corresponds to the documentlanguage
       at the place of the tree, but a converter may want to use
       another documentlanguage, for instance the documentlanguage at
       the end of the preamble, so we let the caller set it.
        */
          tree = gdt_tree (category_text, 0,
                           text_options->current_lang_translations,
                           0, translation_context, text_options->DEBUG, 0);
        }
      else
        {
        /* if there is no current lang translations, we use the
           documentlanguage available in the tree. */

          const LANG_TRANSLATION *lang_translation
           = new_element_language_translation (&converters_translation_cache,
                                            element, TXI_CONVERT_STRINGS_NR);

          /* there is a possibility that some small strings are associated
             to the tree, and there is no document to get them.  However
             it is very unlikely to have small strings given that the
             converted tree should be very simple and is a string only,
             no macro, no file */
          tree = gdt_tree (category_text, 0, lang_translation,
                           0, translation_context, text_options->DEBUG, 0);
        }

      if (tree)
        {
          convert_to_text_internal (tree, text_options, result);
          destroy_element_and_children (tree);
        }
      return;
    }

  if (element->e.c->contents.number)
    {
      size_t i;
      int in_code = 0;
      int in_raw = 0;
      if ((data_cmd
           && (command_data[data_cmd].other_flags & CF_preformatted_code
               || command_data[data_cmd].flags & CF_math
               || (command_data[data_cmd].flags & CF_block
                   && command_data[data_cmd].data == BLOCK_raw)))
          || element->type == ET_menu_entry_node)
        in_code = 1;
      else if (data_cmd
               && command_data[data_cmd].flags & CF_block
               && command_data[data_cmd].data == BLOCK_format_raw)
        in_raw = 1;

      if (in_raw)
        text_options->raw_state++;
      if (in_code)
        text_options->code_state++;

      for (i = 0; i < element->e.c->contents.number; i++)
        {
          const ELEMENT *content = element->e.c->contents.list[i];
          convert_to_text_internal (content,
                                    text_options, result);
        }

      if (in_raw)
        text_options->raw_state--;
      if (in_code)
        text_options->code_state--;
    }
  if (element->type == ET_menu_entry
      && element->e.c->parent->type != ET_preformatted
      && element->e.c->parent->type != ET_rawpreformatted)
    {
      if (result->end == 0 || result->text[result->end - 1] != '\n')
        ADD("\n");
    }
}
#undef ADD

/* Return value to be freed by caller. */
TEXT
convert_to_text_text (const ELEMENT *root, TEXT_OPTIONS *text_options)
{
  TEXT result;

  text_init (&result);
  text_append (&result, "");

  convert_to_text_internal (root, text_options, &result);

  if (text_options->converter && text_options->error_messages.number)
    merge_error_messages_lists (&text_options->converter->error_messages,
                                &text_options->error_messages);

  return result;
}

/* Return value to be freed by caller. */
char *
convert_to_text (const ELEMENT *root, TEXT_OPTIONS *text_options)
{
  TEXT result = convert_to_text_text (root, text_options);
  return result.text;
}
