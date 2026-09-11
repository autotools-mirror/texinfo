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

/* corresponding to Texinfo::Convert::Utils */

#include <config.h>

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <time.h>
/* for time_t, ssize_t */
#include <sys/types.h>

#include "text.h"
#include "command_ids.h"
#include "element_types.h"
#include "tree_types.h"
#include "options_data.h"
#include "option_types.h"
#include "types_data.h"
#include "builtin_commands.h"
#include "tree.h"
#include "extra.h"
#include "errors.h"
#include "debug.h"
/* ACCENTS_STACK ENCODING_CONVERSION encode_string locate_include_file ... */
#include "utils.h"
#include "manipulate_tree.h"
#include "translations.h"
#include "convert_to_texinfo.h"
#include "convert_utils.h"

char *convert_utils_month_name[12] = {
  gdt_noop("January"), gdt_noop("February"), gdt_noop("March"),
  gdt_noop("April"), gdt_noop("May"), gdt_noop("June"), gdt_noop("July"),
  gdt_noop("August"), gdt_noop("September"), gdt_noop("October"),
  gdt_noop("November"), gdt_noop("December")
};

static const ELEMENT *default_bullet_command;
static const ELEMENT *default_asis_command;

void
setup_convert_utils (void)
{
  default_bullet_command = new_command_element (ET_brace_command,
                                                CM_bullet);
  default_asis_command = new_command_element (ET_brace_command, CM_asis);
}

/* in Texinfo::Common */
static const char *
element_associated_processing_encoding (const ELEMENT *element)
{
  const char *input_encoding = lookup_extra_string (element,
                                              AI_key_input_encoding_name);
  return input_encoding;
}



/* Handle TREE_ADDED_ELEMENTS, for Texinfo tree elements added
   in converters that need a place to store the elements for the duration
   of their use.  Memory handling is determined by the "status" given
   when initializing the tree added elements structure.
 */

TREE_ADDED_ELEMENTS *
new_tree_added_elements (enum tree_added_elements_status status)
{
  TREE_ADDED_ELEMENTS *new
    = (TREE_ADDED_ELEMENTS *) malloc (sizeof (TREE_ADDED_ELEMENTS));
  memset (new, 0, sizeof (TREE_ADDED_ELEMENTS));
  new->status = status;
  return new;
}

ELEMENT *
new_element_added (TREE_ADDED_ELEMENTS *added_elements, enum element_type type)
{
  ELEMENT *new = new_element (type);
  add_to_element_list (&added_elements->added, new);
  return new;
}

ELEMENT *
new_command_element_added (TREE_ADDED_ELEMENTS *added_elements,
                           enum element_type type,
                           enum command_id cmd)
{
  ELEMENT *new = new_command_element (type, cmd);
  add_to_element_list (&added_elements->added, new);
  return new;
}

ELEMENT *
new_text_element_added (TREE_ADDED_ELEMENTS *added_elements,
                        enum element_type type)
{
  ELEMENT *new = new_text_element (type);
  add_to_element_list (&added_elements->added, new);
  return new;
}

void
clear_tree_added_elements (TREE_ADDED_ELEMENTS *tree_elements)
{
  /*
   HTML targets have all associated tree added elements structures that can be
   left as 0, in particular with tree_added_status_none if nothing refers to
   them, and are always cleared in the end.  So it is normal to have cleared
   tree added elements with status none, but they also should not have any
   added elements.
   */
   /*
  if (tree_elements->status == tree_added_status_none)
    {
      fprintf (stderr, "CTAE: %p no status (%zu)\n", tree_elements, tree_elements->added.number);
    }
   */

  if (tree_elements->status == tree_added_status_new_tree)
    destroy_element_and_children (tree_elements->tree);
  else if (tree_elements->status == tree_added_status_elements_added)
    {
      size_t i;
      for (i = 0; i < tree_elements->added.number; i++)
        {
          ELEMENT *added_e = tree_elements->added.list[i];
          destroy_element (added_e);
        }
      tree_elements->added.number = 0;
    }
  tree_elements->tree = 0;
  tree_elements->status = 0;
}

void
free_tree_added_elements (TREE_ADDED_ELEMENTS *tree_elements)
{
  clear_tree_added_elements (tree_elements);
  free (tree_elements->added.list);
  tree_elements->added.list = 0;
  tree_elements->added.space = 0;
}

void
destroy_tree_added_elements (TREE_ADDED_ELEMENTS *tree_elements)
{
  free_tree_added_elements (tree_elements);
  free (tree_elements);
}



static DOCUMENT_INFO *
new_document_info (void)
{
  DOCUMENT_INFO *result = (DOCUMENT_INFO *) malloc (sizeof (DOCUMENT_INFO));
  memset (result, 0, sizeof (DOCUMENT_INFO));
  return result;
}

void
destroy_document_info (DOCUMENT_INFO *document_info)
{
  free (document_info->title.list);
  free (document_info->author.list);
  free (document_info->subtitle.list);
  free (document_info);
}

DOCUMENT_INFO *
get_document_documentinfo (DOCUMENT *document)
{
  DOCUMENT_INFO *result = 0;

  if (document->global_commands.documentinfo)
    {
      size_t i;
      const ELEMENT *documentinfo = document->global_commands.documentinfo;

      for (i = 1; i < documentinfo->e.c->contents.number; i++)
        {
          ELEMENT *content = documentinfo->e.c->contents.list[i];
          if (!(type_data[content->type].flags & TF_text))
            {
              if (content->e.c->cmd == CM_title)
                {
                  if (!result)
                    result = new_document_info ();
                  add_to_element_list (&result->title, content);
                }
              else if (content->e.c->cmd == CM_subtitle)
                {
                  if (!result)
                    result = new_document_info ();
                  add_to_element_list (&result->subtitle, content);
                }
              if (content->e.c->cmd == CM_author)
                {
                  if (!result)
                    result = new_document_info ();
                  add_to_element_list (&result->author, content);
                }
            }
        }
    }
  return result;
}

DOCUMENT_INFO *
get_titlepage_publication_info (DOCUMENT *document)
{
  DOCUMENT_INFO *result = get_document_documentinfo (document);

  if (document->global_commands.copying)
    {
      if (!result)
        result = new_document_info ();
      result->copying = document->global_commands.copying;
    }
  if (document->global_commands.publication)
    {
      if (!result)
        result = new_document_info ();
      result->publication = document->global_commands.publication;
    }
  return result;
}



static void
comma_index_subentries_tree_internal (const ELEMENT *current,
                                      const char *separator,
                                      ELEMENT_LIST *result)
{
  size_t i;
  const ELEMENT *line_arg = current->e.c->contents.list[0];

  for (i = 0; i < line_arg->e.c->contents.number; i++)
    {
      ELEMENT *content = line_arg->e.c->contents.list[i];
      if (!(type_data[content->type].flags & TF_text)
          && content->e.c->cmd == CM_subentry)
        {
          ELEMENT *e_separator = new_text_element (ET_other_text);
          text_append (e_separator->e.text, separator);
          add_to_element_list (result, e_separator);
          comma_index_subentries_tree_internal (content, separator, result);
        }
      else
        add_to_element_list (result, content);
    }
}

ELEMENT_LIST *
comma_index_subentries_tree (const ELEMENT *current,
                             char *separator)
{
  size_t i;
  ELEMENT_LIST *result = new_list ();
  const ELEMENT *line_arg = current->e.c->contents.list[0];
  char *subentry_separator = separator;
  if (!separator)
    subentry_separator = ", ";

  for (i = 0; i < line_arg->e.c->contents.number; i++)
    {
      const ELEMENT *content = line_arg->e.c->contents.list[i];
      if (!(type_data[content->type].flags & TF_text)
          && content->e.c->cmd == CM_subentry)
        {
          ELEMENT *e_separator = new_text_element (ET_other_text);
          text_append (e_separator->e.text, subentry_separator);
          add_to_element_list (result, e_separator);
          comma_index_subentries_tree_internal (content,
                                                subentry_separator, result);
        }
    }

  if (result->number > 0)
    return result;
  else
    {
      destroy_list (result);
      return 0;
    }
}

void
free_comma_index_subentries_tree (ELEMENT_LIST *element_list)
{
  /* destroy separator elements */
  size_t i;
  for (i = 0; i < element_list->number; i++)
    {
      ELEMENT *content = element_list->list[i];
      if (content->type == ET_other_text)
        destroy_element (content);
    }
  destroy_list (element_list);
}

ELEMENT *
expand_today (int test, const LANG_TRANSLATION *lang_translation,
              int debug, CONVERTER_CDT_TREE *converter_cdt_tree)
{
  time_t tloc;
  struct tm *time_tm;
  int year;
  char *source_date_epoch;
  ELEMENT *result;

  if (test > 0)
    {
      result = new_text_element (ET_normal_text);
      text_append (result->e.text, "a sunny day");
      return result;
    }

  /* See https://reproducible-builds.org/specs/source-date-epoch/ */
  source_date_epoch = getenv ("SOURCE_DATE_EPOCH");

  if (source_date_epoch)
    {
   /* This assumes that the SOURCE_DATE_EPOCH environment variable will contain
      a correct, positive integer in the time_t range */
      tloc = (time_t)strtoll (source_date_epoch, NULL, 10);
      time_tm = gmtime (&tloc);
    }
  else
    {
      tloc = time (NULL);
      time_tm = localtime (&tloc);
    }

  year = time_tm->tm_year + 1900;

  if (converter_cdt_tree || lang_translation)
    {
      NAMED_STRING_ELEMENT_LIST *substrings;
      ELEMENT *month_tree;
      ELEMENT *day_element;
      ELEMENT *year_element;

      day_element = new_text_element (ET_normal_text);
      year_element = new_text_element (ET_normal_text);
      text_printf (day_element->e.text, "%d", time_tm->tm_mday);
      text_printf (year_element->e.text, "%d", year);

      if (converter_cdt_tree)
        {
          month_tree
            = converter_cdt_tree->cdt_tree_fn (
                       convert_utils_month_name[time_tm->tm_mon],
                       converter_cdt_tree->converter, 0, 0);
        }
      else
        {
          month_tree = gdt_tree (convert_utils_month_name[time_tm->tm_mon],
                                 0, lang_translation, 0, 0, debug, 0);
        }
      substrings = new_named_string_element_list ();
      add_element_to_named_string_element_list (substrings,
                                                "month", month_tree);
      add_element_to_named_string_element_list (substrings,
                                                "day", day_element);
      add_element_to_named_string_element_list (substrings,
                                                "year", year_element);

      if (converter_cdt_tree)
        {
          result
            = converter_cdt_tree->cdt_tree_fn ("{month} {day}, {year}",
                                     converter_cdt_tree->converter,
                                     substrings, 0);
        }
      else
        {
          result = gdt_tree ("{month} {day}, {year}", 0, lang_translation,
                             substrings, 0, debug, 0);
        }
      destroy_named_string_element_list (substrings);
    }
  else
    {
      result = new_text_element (ET_normal_text);
      text_printf (result->e.text, "%s %d, %d",
                   convert_utils_month_name[time_tm->tm_mon],
                   time_tm->tm_mday, year);
    }
  return result;
}

/* free TEXT if not reused */
TEXT
add_heading_number (const ELEMENT *current, TEXT text,
                    int numbered, const LANG_TRANSLATION *lang_translation,
                    int debug_level)
{
  char *number = 0;
  if (numbered != 0)
    number = lookup_extra_string (current, AI_key_section_heading_number);

  if (lang_translation)
    {
      if (number)
        {
          TEXT numbered_heading;
          text_init (&numbered_heading);
          NAMED_STRING_ELEMENT_LIST *substrings
                                       = new_named_string_element_list ();
          add_string_to_named_string_element_list (substrings,
                                                  "number", number);
          add_string_to_named_string_element_list (substrings,
                                             "section_title", text.text);
          if (current->e.c->cmd == CM_appendix)
            {
              int status;
              int section_level
                    = lookup_extra_integer (current, AI_key_section_level,
                                            &status);
              if (section_level == 1)
                {
                  numbered_heading
                   = gdt_string ("Appendix {number} {section_title}",
                                 lang_translation, substrings, 0,
                                 debug_level, 0);
                }
            }
          if (!numbered_heading.text)
            numbered_heading
              = gdt_string ("{number} {section_title}",
                            lang_translation, substrings, 0,
                            debug_level, 0);

          destroy_named_string_element_list (substrings);
          free (text.text);
          return numbered_heading;
        }
      else
        return text;
    }
  else
    {
      TEXT result;
      text_init (&result);

      if (current->e.c->cmd == CM_appendix)
        {
          int status;
          int section_level = lookup_extra_integer (current,
                                                    AI_key_section_level,
                                                    &status);
          if (section_level == 1)
            text_append (&result, "Appendix ");
        }
      if (number)
        {
          text_append (&result, number);
          text_append (&result, " ");
        }
      text_append_n (&result, text.text, text.end);
      free (text.text);
      return result;
    }
}

/*
  Reverse the decoding of the file name from the input encoding.
  FILE_NAME_ENCODING is used to return the encoding.
  The caller should free the return value and FILE_NAME_ENCODING.
*/
char *
encoded_input_file_name (const char *in_input_file_name_encoding,
                         int doc_encoding_for_input_file_name,
                         const char *locale_encoding,
                         const GLOBAL_INFO *global_information,
                         char *file_name, const char *input_file_encoding,
                         char **file_name_encoding,
                         const SOURCE_INFO *source_info)
{
  char *result;
  const char *encoding = input_file_name_encoding (in_input_file_name_encoding,
                     doc_encoding_for_input_file_name, locale_encoding,
                              global_information, input_file_encoding);
  int status;

  result = encode_string (file_name, encoding, &status,
                          source_info, ieh_error, 0);

  if (status)
    *file_name_encoding = strdup (encoding);
   else
    *file_name_encoding = 0;
  return result;
}

char *
converter_encoded_input_file_name (const OPTIONS *options,
                          const GLOBAL_INFO *global_information,
                          char *file_name, const char *input_file_encoding,
                          char **file_name_encoding,
                          const SOURCE_INFO *source_info)
{

  const char *input_file_name_encoding = 0;
  int doc_encoding_for_input_file_name = -1;
  const char *locale_encoding = 0;

  if (options)
    {
      input_file_name_encoding
        = options->INPUT_FILE_NAME_ENCODING.o.string;
      doc_encoding_for_input_file_name
        = options->DOC_ENCODING_FOR_INPUT_FILE_NAME.o.integer;
      locale_encoding = options->LOCALE_ENCODING.o.string;
    }

  return encoded_input_file_name (input_file_name_encoding,
                            doc_encoding_for_input_file_name,
                             locale_encoding, global_information,
                             file_name, input_file_encoding, file_name_encoding,
                             source_info);
}
/* NOTE it would have been better to have FILE_NAME const, but iconv
   argument may not be const, so no const here either */
char *
encoded_output_file_name (const char *output_file_name_encoding,
                          int doc_encoding_for_output_file_name,
                          const char *locale_encoding,
                          const GLOBAL_INFO *global_information,
                          char *file_name, char **file_name_encoding,
                          const SOURCE_INFO *source_info)
{
  char *result;
  const char *encoding = 0;
  int status;

  if (output_file_name_encoding)
    encoding = output_file_name_encoding;
  else if (doc_encoding_for_output_file_name != 0)
    {
      if (global_information && global_information->input_encoding_name)
        encoding = global_information->input_encoding_name;
    }
  else if (locale_encoding)
    encoding = locale_encoding;

  result = encode_string (file_name, encoding, &status, source_info,
                          ieh_error, 0);

  if (status)
    *file_name_encoding = strdup (encoding);
   else
    *file_name_encoding = 0;
  return result;
}

char *
converter_encoded_output_file_name (const OPTIONS *options,
                          const GLOBAL_INFO *global_information,
                          char *file_name, char **file_name_encoding,
                          const SOURCE_INFO *source_info)
{

  const char *output_file_name_encoding = 0;
  int doc_encoding_for_output_file_name = -1;
  const char *locale_encoding = 0;

  if (options)
    {
      output_file_name_encoding
        = options->OUTPUT_FILE_NAME_ENCODING.o.string;
      doc_encoding_for_output_file_name
        = options->DOC_ENCODING_FOR_OUTPUT_FILE_NAME.o.integer;
      locale_encoding = options->LOCALE_ENCODING.o.string;
    }

  return encoded_output_file_name (output_file_name_encoding,
                            doc_encoding_for_output_file_name,
                             locale_encoding, global_information,
                             file_name, file_name_encoding,
                             source_info);
}

ELEMENT *
expand_verbatiminclude (const ELEMENT *current,
                        const STRING_LIST *include_directories,
                        ERROR_MESSAGE_LIST *error_messages,
                        const char *input_file_name_encoding,
                        int doc_encoding_for_input_file_name,
                        const char *locale_encoding,
                        const GLOBAL_INFO *global_information, int debug)
{
  ELEMENT *verbatiminclude = 0;
  char *file_name_encoding;
  char *file_name_text = lookup_extra_string (current, AI_key_text_arg);
  char *file_name;
  char *file;
  const char *input_encoding;
  int warn;
  int use_inc_dir;

  if (!file_name_text)
    return 0;

  warn = (debug > 0);
  input_encoding = element_associated_processing_encoding (current);

  file_name = encoded_input_file_name (input_file_name_encoding,
                     doc_encoding_for_input_file_name, locale_encoding,
                                       global_information,
                                       file_name_text, input_encoding,
                                       &file_name_encoding,
                                       &current->e.c->source_info);

  file = locate_include_file (file_name, include_directories, &use_inc_dir);

  if (file)
    {
      FILE *stream = 0;
      const ENCODING_CONVERSION *conversion;

      stream = fopen (file, "r");
      if (!stream)
        {
          if (error_messages)
            {
              int status;
              char *decoded_file;
              if (file_name_encoding)
                decoded_file = decode_string (file, file_name_encoding,
                                         &status, &current->e.c->source_info);
              else
                decoded_file = file;
              message_list_command_error (error_messages, warn, current,
                                          "could not read %s: %s",
                                          decoded_file, strerror (errno));
              if (file_name_encoding)
                free (decoded_file);
            }
        }
      else
        {
          conversion
           = get_encoding_conversion (input_encoding, &input_conversions);
          verbatiminclude = new_command_element (ET_block_command, CM_verbatim);
          while (1)
            {
              size_t n;
              char *line = 0;
              size_t line_len;
              ELEMENT *raw;
              ssize_t status = getline (&line, &n, stream);
              if (status == -1)
                {
                  free (line);
                  break;
                }

              line_len = strlen (line);

              raw = new_text_element (ET_raw);
              if (conversion)
                {
                  TEXT text = encode_with_iconv (conversion->iconv, line,
                                              line_len,
                                              &current->e.c->source_info,
                                              ieh_error, 0);
                  text_append_n (raw->e.text, text.text, text.end);
                  free (text.text);
                }
              else
                text_append_n (raw->e.text, line, line_len);
              free (line);
              add_to_contents_as_array (verbatiminclude, raw);
            }
          if (fclose (stream) == EOF)
            {
              if (error_messages)
                {
                  int status;
                  char *decoded_file;
                  if (file_name_encoding)
                    decoded_file = decode_string (file, file_name_encoding,
                                                  &status,
                                                  &current->e.c->source_info);
                  else
                    decoded_file = file;
                  message_list_command_error (error_messages, warn, current,
                             "error on closing @verbatiminclude file %s: %s",
                                 decoded_file, strerror (errno));
                  if (file_name_encoding)
                    free (decoded_file);
                }
            }
        }
      free (file);
    }
  else if (error_messages)
    {
      message_list_command_error (error_messages, warn, current,
                                  "@%s: could not find %s",
                                  builtin_command_name (current->e.c->cmd),
                                  file_name_text);
    }
  free (file_name);
  free (file_name_encoding);
  return verbatiminclude;
}

ELEMENT *
converter_expand_verbatiminclude (const ELEMENT *current,
                                  ERROR_MESSAGE_LIST *error_messages,
                                  const OPTIONS *options,
                                  const GLOBAL_INFO *global_information)
{
  const char *input_file_name_encoding = 0;
  int doc_encoding_for_input_file_name = -1;
  const char *locale_encoding = 0;
  const STRING_LIST *include_directories = 0;
  int debug = 0;

  if (options)
    {
      input_file_name_encoding
        = options->INPUT_FILE_NAME_ENCODING.o.string;
      doc_encoding_for_input_file_name
        = options->DOC_ENCODING_FOR_INPUT_FILE_NAME.o.integer;
      locale_encoding = options->LOCALE_ENCODING.o.string;

      include_directories = options->INCLUDE_DIRECTORIES.o.strlist;

      debug = options->DEBUG.o.integer;
    }

  return expand_verbatiminclude (current, include_directories,
            error_messages, input_file_name_encoding,
            doc_encoding_for_input_file_name, locale_encoding,
            global_information, debug);
}

/* ELEMENT should be a @def*x or a @def*line line commands or the
   def_line type appearing right in the other @def commands. */
PARSED_DEF *
definition_arguments_content (const ELEMENT *element)
{
  PARSED_DEF *result = malloc (sizeof (PARSED_DEF));
  memset (result, 0, sizeof (PARSED_DEF));
  size_t i;

  const ELEMENT *def_line_args = element->e.c->contents.list[0];

  if (def_line_args->e.c->contents.number > 0)
    {
      for (i = 0; i < def_line_args->e.c->contents.number; i++)
        {
          ELEMENT *arg = def_line_args->e.c->contents.list[i];
          if (arg->type == ET_def_class)
            result->class = arg;
          else if (arg->type == ET_def_category)
            result->category = arg;
          else if (arg->type == ET_def_type)
            result->type = arg;
          else if (arg->type == ET_def_name)
            result->name = arg;
          else if (arg->type == ET_def_arg || arg->type == ET_def_typearg
                   || arg->type == ET_delimiter)
            {
              i--;
              break;
            }
        }
      if (i < def_line_args->e.c->contents.number - 1)
        {
          ELEMENT *args = new_element (ET_NONE);
          insert_slice_into_contents (args, 0, def_line_args, i + 1,
                                 def_line_args->e.c->contents.number);
          result->args = args;
        }
    }
  return result;
}

void
destroy_parsed_def (PARSED_DEF *parsed_def)
{
  if (parsed_def->args)
    destroy_element (parsed_def->args);
  free (parsed_def);
}

/* ELEMENT should be a @def*x or a @def*line line commands or the
   def_line type appearing right in the other @def commands.
   the CONVERTER_CDT_TREE argument allows to use the HTML converter
   specific translation function.
   If it is not specified, LANG_TRANSLATION is used for translations
   information.
   If not set, translation is based on information in the element.
 */
ELEMENT *
definition_category_tree (const ELEMENT *element,
                          const LANG_TRANSLATION *lang_translation,
                          int debug, CONVERTER_CDT_TREE *converter_cdt_tree)
{
  ELEMENT *result = 0;
  ELEMENT *arg_category = 0;
  ELEMENT *arg_class = 0;
  ELEMENT *class_copy;
  const char *def_cmdname;
  enum command_id def_command;
  size_t i;

  const ELEMENT *def_line_args = element->e.c->contents.list[0];

  for (i = 0; i < def_line_args->e.c->contents.number; i++)
    {
      ELEMENT *arg = def_line_args->e.c->contents.list[i];
      if (arg->type == ET_def_class)
        arg_class = arg;
      else if (arg->type == ET_def_category)
        arg_category = arg;
      else if (arg->type == ET_def_arg || arg->type == ET_def_typearg
               || arg->type == ET_delimiter)
        break;
    }

  if (!arg_class)
    {
      if (arg_category)
        {
          ELEMENT *category_copy = copy_element_tree (arg_category, 0);
          return category_copy;
        }
      else
       return 0;
    }

  class_copy = copy_element_tree (arg_class, 0);

  def_cmdname = lookup_extra_string (element, AI_key_def_command);
  def_command = lookup_builtin_command (def_cmdname);

  if (command_data[def_command].flags & CF_def_class_method)
    {
      ELEMENT *category_copy = copy_element_tree (arg_category, 0);
      NAMED_STRING_ELEMENT_LIST *substrings
                                   = new_named_string_element_list ();
      add_element_to_named_string_element_list (substrings,
                                                "category", category_copy);
      add_element_to_named_string_element_list (substrings,
                                                "class", class_copy);
      if (converter_cdt_tree)
        {
          result
            = converter_cdt_tree->cdt_tree_fn ("{category} on @code{{class}}",
                                               converter_cdt_tree->converter,
                                               substrings, 0);
        }
      else if (lang_translation)
        {
    /*
     TRANSLATORS: association of a method or operation category with a class
     in descriptions of object-oriented programming methods or operations. */
          result = gdt_tree ("{category} on @code{{class}}", 0,
                             lang_translation, substrings, 0, debug, 0);
        }
      else
        {
          const LANG_TRANSLATION *lang_translation
           = new_element_language_translation (&converters_translation_cache,
                                            element, TXI_CONVERT_STRINGS_NR);

          result = gdt_tree ("{category} on @code{{class}}", 0,
                             lang_translation, substrings, 0, debug, 0);
        }
      destroy_named_string_element_list (substrings);
    }
  else if (command_data[def_command].flags & CF_def_class_variable)
    {
      ELEMENT *category_copy = copy_element_tree (arg_category, 0);
      NAMED_STRING_ELEMENT_LIST *substrings
                                   = new_named_string_element_list ();
      add_element_to_named_string_element_list (substrings,
                                                "category", category_copy);
      add_element_to_named_string_element_list (substrings,
                                                "class", class_copy);

      if (converter_cdt_tree)
        {
          result
            = converter_cdt_tree->cdt_tree_fn ("{category} of @code{{class}}",
                                               converter_cdt_tree->converter,
                                               substrings, 0);
        }
      else if (lang_translation)
        {
    /*
      TRANSLATORS: association of a variable or instance variable with
      a class in descriptions of object-oriented programming variables
      or instance variable. */
          result = gdt_tree ("{category} of @code{{class}}", 0,
                             lang_translation, substrings, 0, debug, 0);
        }
      else
        {
          const LANG_TRANSLATION *lang_translation
           = new_element_language_translation (&converters_translation_cache,
                                            element, TXI_CONVERT_STRINGS_NR);

          result = gdt_tree ("{category} of @code{{class}}", 0,
                             lang_translation, substrings, 0, debug, 0);
        }
      destroy_named_string_element_list (substrings);
    }
  return result;
}

/* ELEMENT should not be a text element */
static void
get_comment_or_end_line (const ELEMENT *element, COMMENT_OR_END_LINE *result)
{
  const ELEMENT *comment = 0;
  const ELEMENT *last_arg = 0;
  const ELEMENT *last_content = 0;

  if (element)
    last_arg = element->e.c->contents.list[
                        element->e.c->contents.number -1];

  if (last_arg && !(type_data[last_arg->type].flags & TF_text)
      && last_arg->e.c->contents.number > 0)
    {
      last_content = last_arg->e.c->contents.list[
                         last_arg->e.c->contents.number -1];
      if (!(type_data[last_content->type].flags & TF_text)
          && (last_content->e.c->cmd == CM_comment
              || last_content->e.c->cmd == CM_c))
        comment = last_content;
    }

  if (comment)
    {
      result->comment = comment;
      result->end_line = 0;
      return;
    }
  result->comment = 0;

  if (last_arg)
    {
      const ELEMENT *spaces_after_argument = 0;

      if (last_content
          && type_data[last_content->type].flags & TF_text)
        {
          spaces_after_argument = last_content;
        }
      if (spaces_after_argument)
        {
          if (strchr (spaces_after_argument->e.text->text, '\n'))
            result->end_line = "\n";
          else
            result->end_line = "";
        }
      else
        result->end_line = "";
    }
  else
    result->end_line = "";
}

/* Texinfo::Convert::Converter comment_or_end_line */
COMMENT_OR_END_LINE *
comment_or_end_line (const ELEMENT *element)
{
  COMMENT_OR_END_LINE *result = (COMMENT_OR_END_LINE *) malloc
    (sizeof (COMMENT_OR_END_LINE));

  get_comment_or_end_line (element, result);

  return result;
}

/* Unused */
/* similar to comment_or_end_line, but additionaly gather the argument
   to abstract whether there is an argument_line or not */
/* No equivalent in Perl */
ARGUMENT_COMMENT_END_LINE *
argument_comment_end_line (const ELEMENT *element)
{
  ARGUMENT_COMMENT_END_LINE *result = (ARGUMENT_COMMENT_END_LINE *) malloc
    (sizeof (ARGUMENT_COMMENT_END_LINE));
  const ELEMENT *end_line_element = 0;

  if (element->e.c->contents.number)
    {
      if (element->e.c->contents.list[0]->type == ET_arguments_line)
        {
          const ELEMENT *arguments_line = element->e.c->contents.list[0];
          result->argument = arguments_line->e.c->contents.list[0];
          end_line_element = arguments_line;
        }
      else
        {
          result->argument = element->e.c->contents.list[0];
          end_line_element = element;
        }
    }
  else
    result->argument = 0;

  get_comment_or_end_line (end_line_element, &result->comment_end_line);

  return result;
}

const ELEMENT *
itemize_line_prepended_element (const ELEMENT *block_line_arg)
{
  const ELEMENT *arg = block_line_argument_command (block_line_arg);

  if (arg)
    return arg;
  else if (empty_spaces_argument (block_line_arg))
    return default_bullet_command;
  else
    return block_line_arg;
}

/* in Texinfo::Common */
const ELEMENT *
item_itemize_prepended (const ELEMENT *element)
{
  const ELEMENT *itemize = element->e.c->parent;
  const ELEMENT *arguments_line = itemize->e.c->contents.list[0];
  return itemize_line_prepended_element (
                      arguments_line->e.c->contents.list[0]);
}

const ELEMENT *
item_line_block_line_argument_command (const ELEMENT *block_line_arg)
{
  const ELEMENT *arg = block_line_argument_command (block_line_arg);

  if (arg)
    {
      enum command_id data_cmd = element_builtin_data_cmd (arg);
      if (command_data[data_cmd].data == BRACE_noarg)
        arg = 0;
    }

  return arg;
}

const ELEMENT *
block_item_line_command (const ELEMENT *block_line_arg)
{
  const ELEMENT *arg = item_line_block_line_argument_command (block_line_arg);

  /* if no command_as_argument given, default to @asis for @table. */
  if (!arg)
    arg = default_asis_command;
  return arg;
}

/* SELF is not used */
TREE_ADDED_ELEMENTS *
table_item_content_tree (CONVERTER *self, const ELEMENT *element)
{
  const ELEMENT *table_command;
  const ELEMENT *arguments_line;
  const ELEMENT *block_line_arg;
  const ELEMENT *command_as_argument;

  /* not in a @*table item/itemx.  Exemple in test with @itemx in @itemize
     in @table */
  if (element->e.c->parent->type != ET_table_term)
    return 0;

  table_command = element->e.c->parent->e.c->parent->e.c->parent;

  /* arguments_line type element */
  arguments_line = table_command->e.c->contents.list[0];
  block_line_arg = arguments_line->e.c->contents.list[0];

  command_as_argument = block_item_line_command (block_line_arg);

  if (command_as_argument)
    {
      TREE_ADDED_ELEMENTS *tree
        = new_tree_added_elements (tree_added_status_elements_added);
      int command_as_argument_kbd_code;
      ELEMENT *command;
      ELEMENT *arg;
      enum command_id cmd = element_builtin_cmd (command_as_argument);
      enum command_id data_cmd
            = element_builtin_data_cmd (command_as_argument);

      command
        = new_command_element_added (tree, command_as_argument->type, cmd);
      tree->tree = command;

      command->e.c->source_info = element->e.c->source_info;
      command_as_argument_kbd_code
        = (table_command->flags & EF_command_as_argument_kbd_code);
      if (command_as_argument_kbd_code > 0)
        command->flags |= EF_code;

      if (command_as_argument->type == ET_definfoenclose_command)
        {
          const char *begin = lookup_extra_string (command_as_argument,
                                                   AI_key_begin);
          const char *end = lookup_extra_string (command_as_argument,
                                                 AI_key_end);
          const char *command_name
            = command_as_argument->e.c->string_info[sit_command_name];

          if (begin)
            add_extra_string_dup (command, AI_key_begin, begin);
          if (end)
            add_extra_string_dup (command, AI_key_end, end);
          if (command_name)
            command->e.c->string_info[sit_command_name] = strdup (command_name);
        }
      if (command_data[data_cmd].data == BRACE_context)
        {
    /* This corresponds to a bogus @*table line with command line @footnote
       or @math.  We do not really care about the formatting of the result
       but we want to avoid debug messages, so we setup expected trees
       for those @-commands. */
          arg = new_element_added (tree, ET_brace_command_context);
          if (cmd == CM_math)
            {
              add_to_contents_as_array (arg, element->e.c->contents.list[0]);
            }
          else
            {
              ELEMENT *paragraph = new_element_added (tree, ET_paragraph);
              add_to_contents_as_array (paragraph,
                                        element->e.c->contents.list[0]);
              add_to_contents_as_array (arg, paragraph);
            }
        }
      else if (command_data[data_cmd].data == BRACE_arguments)
        {
          arg = new_element_added (tree, ET_brace_arg);
          add_to_contents_as_array (arg, element->e.c->contents.list[0]);
        }
      else
        {
          arg = new_element_added (tree, ET_brace_container);
          add_to_contents_as_array (arg, element->e.c->contents.list[0]);
        }
      add_to_contents_as_array (command, arg);
      return tree;
    }
  return 0;
}

static void
find_element_authors_internal (const ELEMENT *element,
                      CONST_ELEMENT_LIST *quotation_authors)
{
  size_t i;
  enum command_id cmd;

  if (type_data[element->type].flags & TF_text)
    return;

  cmd = element_builtin_data_cmd (element);

  if (cmd == CM_author)
    {
      add_to_const_element_list (quotation_authors, element);
      return;
    }

  if (cmd == CM_quotation
      || cmd == CM_smallquotation
      || cmd == CM_titlepage
      || cmd == CM_menu
      || (command_data[cmd].flags & CF_brace
          && command_data[cmd].data == BRACE_context)
      || command_data[cmd].flags & CF_line)
    return;

  if (element->type == ET_arguments_line)
    return;

  for (i =0; i < element->e.c->contents.number; i++)
    find_element_authors_internal (element->e.c->contents.list[i],
                                   quotation_authors);
}

void
find_element_authors (const ELEMENT *element,
                      CONST_ELEMENT_LIST *quotation_authors)
{
  size_t i;

  for (i =0; i < element->e.c->contents.number; i++)
    find_element_authors_internal (element->e.c->contents.list[i],
                                   quotation_authors);
}

/* called from generic converter and conversion to raw text converter */
ELEMENT *
translated_command_tree (TRANSLATED_COMMAND_LIST *translated_commands,
                         enum command_id cmd,
                         const LANG_TRANSLATION *lang_translation,
                         int debug, CONVERTER_CDT_TREE *converter_cdt_tree)
{
  size_t i;
  for (i = 0; i < translated_commands->number; i++)
    {
      const TRANSLATED_COMMAND *translated_command
        = &translated_commands->list[i];
      if (translated_command->cmd == cmd
          && translated_command->translation)
        {
          ELEMENT *result;
          if (converter_cdt_tree)
            result = converter_cdt_tree->cdt_tree_fn (
                                  translated_command->translation,
                                  converter_cdt_tree->converter, 0, 0);
          else
            result = gdt_tree (translated_command->translation,
                               0, lang_translation, 0, 0, debug, 0);
          return result;
        }
    }
  return 0;
}

/*
  API to open, set encoding and register files.
*/

/* in Texinfo::Convert::Utils (also used by main program) */

/* in contrast with perl, we do not handle conversion to output encoding
   in output_files_open_out, but in the caller program */

void
register_unclosed_file (OUTPUT_FILES_INFORMATION *self, const char *file_path,
                        FILE *stream, void *io)
{
  FILE_STREAM *file_stream = 0;
  size_t file_stream_index;
  if (self->unclosed_files.number)
    {
      int slot_found = 0;
      size_t i;
      for (i = 0; i < self->unclosed_files.number; i++)
        {
          file_stream = &self->unclosed_files.list[i];
          if (file_stream->file_path)
            {
              fprintf (stderr, "RUF:%zu: %s\n", i, file_stream->file_path);
              if (!strcmp (file_path, file_stream->file_path))
                {
                  fprintf (stderr, "BUG: RUF: already open %zu: %s\n",
                           i, file_path);
                  file_stream->stream = stream;
                  return;
                }
            }
          else if (!slot_found)
            {
              slot_found = 1;
              file_stream_index = i;
              file_stream = &self->unclosed_files.list[file_stream_index];
            }
        }
    }

  if (!file_stream)
    file_stream = allocate_file_stream (self, file_path);

  file_stream->stream = stream;
  file_stream->io = io;

  return;
}

/*
 FILE_PATH is the file path, it should be a binary string.
 If BINARY is set, set binary mode.
 Returns
  - as return value, the opened filehandle, or 0 if opening failed,
  - in *error_message, the errno message or 0 if opening succeeded.
  - in *overwritten_file, 1 if the FILE_PATH was already opened,
    which means overwriting.
*/
FILE *
output_files_open_out (OUTPUT_FILES_INFORMATION *self, const char *file_path,
                       char **error_message, int *overwritten_file, int binary)
{
  FILE *stream_handle;
  *error_message = 0;
  *overwritten_file = 0;
  if (!strcmp (file_path, "-"))
    {
      register_unclosed_file (self, file_path, stdout, 0);
      return stdout;
    }

  if (find_string (&self->opened_files, file_path))
    *overwritten_file = 1;

  if (binary)
    stream_handle = fopen (file_path, "wb");
  else
    stream_handle = fopen (file_path, "w");
  if (!stream_handle)
    {
      *error_message = strdup (strerror (errno));
      return 0;
    }
  else
    {
      register_unclosed_file (self, file_path, stream_handle, 0);
      if (!(*overwritten_file))
        add_string (&self->opened_files, file_path);
    }
  return stream_handle;
}

void
output_files_register_closed (OUTPUT_FILES_INFORMATION *self,
                              const char *file_path)
{
  size_t unclosed_files_nr = self->unclosed_files.number;
  if (unclosed_files_nr)
    {
      size_t j;
      for (j = unclosed_files_nr; j > 0; j--)
        {
          FILE_STREAM *file_stream = &self->unclosed_files.list[j -1];
          if (file_stream->file_path)
            {
              if (!strcmp (file_path, file_stream->file_path))
                {
                  free (file_stream->file_path);
                  file_stream->file_path = 0;
                  if (j == unclosed_files_nr)
                    {
                      self->unclosed_files.number--;
                    }
                  return;
                }
            }
          else
            fprintf (stderr, "REMARK: no unclosed file at %zu\n", j);
        }
    }
  fprintf (stderr, "BUG: %s not opened\n", file_path);
}

/* NOTE nothing is done with 'unclosed_files', assuming that the renamed
   file was already closed (as is the case for the caller of this function).
   Also the call to rename could be done in this function if there are more
   callers, which would also be more consistent with output_files_open_out. */
void
output_files_rename_opened (OUTPUT_FILES_INFORMATION *self,
                            const char *file_path,
                            const char *new_file_path)
{
  size_t number = find_string (&self->opened_files, file_path);
  if (number)
    remove_from_strings_list (&self->opened_files, number -1);

  if (!find_string (&self->opened_files, new_file_path))
    add_string (&self->opened_files, new_file_path);
}

/* Unused */
const ELEMENT *
find_root_command_next_heading_command (const ELEMENT *root,
                                  const EXPANDED_FORMAT *formats,
                                  int do_not_ignore_contents,
                                  int do_not_ignore_index_entries)
{
  size_t i;

  if (root->e.c->contents.number <= 0)
    return 0;

  for (i = 0; i < root->e.c->contents.number; i++)
    {
      const ELEMENT *content = root->e.c->contents.list[i];
      enum command_id data_cmd;

      if (type_data[content->type].flags & TF_text)
        {
         /* do not happen and should not happen, as normal text should never
           be in top level root command contents, only empty_line,
           spaces_after_close_brace... that only contain whitespace_chars */
          if (content->type == ET_normal_text && content->e.text->end > 0)
            {
              const char *text = content->e.text->text;
              fprintf (stderr,
                       "BUG: in top level unexpected normal_text: '%s'\n",
                       text);
            /* only whitespace characters */
              if (text[strspn (text, whitespace_chars)] == '\0')
                continue;
              else
                return 0;
            }
          else
            continue;
        }

      data_cmd = element_builtin_data_cmd (content);

      if (data_cmd)
        {
          unsigned long flags = command_data[data_cmd].flags;
          unsigned long other_flags
               = command_data[data_cmd].other_flags;
          if (flags & CF_sectioning_heading)
            return content;
          if (content->type == ET_index_entry_command)
            {
              if (do_not_ignore_index_entries)
                return  0;
              else
                continue;
            }
          if (flags & CF_line)
            {
              if (other_flags & CF_formatted_line
                  || other_flags & CF_formattable_line
                  || (do_not_ignore_contents
                      && (content->e.c->cmd == CM_contents
                          || content->e.c->cmd == CM_shortcontents
                          || content->e.c->cmd == CM_summarycontents)))
                return 0;
              else
                continue;
            }
          else if (flags & CF_nobrace)
            {
              if (other_flags & CF_formatted_nobrace)
                return 0;
              else
                continue;
            }
          else if (flags & CF_block)
            {
              if (other_flags & CF_non_formatted_block
               || command_data[data_cmd].data == BLOCK_region
                /* ignored conditional */
               || command_data[data_cmd].data == BLOCK_conditional
               || (command_data[data_cmd].data == BLOCK_format_raw
                   && !format_expanded_p
                             (formats, element_command_name (content))))
                continue;
              else
                return 0;
            }
          else
            { /* brace commands */
              if (other_flags & CF_non_formatted_brace)
                continue;
              else
                return 0;
            }
        }
      if (content->type == ET_paragraph)
        return 0;
    }
  return 0;
}

