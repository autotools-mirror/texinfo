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

#include <config.h>

#include <stdlib.h>
#include <string.h>

#include "types_data.h"
#include "tree_types.h"
#include "document_types.h"
#include "converter_types.h"
#include "tree.h"
#include "extra.h"
#include "builtin_commands.h"
/* whitespace_chars */
#include "utils.h"
#include "translations.h"
#include "manipulate_tree.h"
#include "manipulate_indices.h"
#include "converter.h"
#include "convert_indices.h"

ELEMENT *
converter_index_content_element (const ELEMENT *element,
                                 CONVERTER *converter,
                                 int prefer_reference_element)
{
  enum command_id def_command;
  ELEMENT *class_copy;
  ELEMENT *name_copy;
  NAMED_STRING_ELEMENT_LIST *substrings;

  ELEMENT *index_element
    = get_index_content_info_element (element, prefer_reference_element,
                                      &def_command, &name_copy, &class_copy);

  if (index_element || !class_copy)
    return index_element;

  substrings = new_named_string_element_list ();
  add_element_to_named_string_element_list (substrings,
                                            "name", name_copy);
  add_element_to_named_string_element_list (substrings,
                                            "class", class_copy);

  if (command_data[def_command].flags & CF_def_class_method)
    {
      index_element = element_cdt_tree ("{name} on {class}",
                                        element, converter,
                                        substrings, 0);
    }
  else if (command_data[def_command].flags & CF_def_class_variable)
    {
      index_element = element_cdt_tree ("{name} of {class}",
                                        element, converter,
                                        substrings, 0);
    }

  destroy_named_string_element_list (substrings);

  /* prefer a type-less container rather than 'root_line' returned by gdt */
  index_element->type = ET_generic_container;

  return index_element;
}

/* wrapper called as function reference, to have a common prototype */
ELEMENT *
wrap_converter_index_content_element (const ELEMENT *element,
                               int prefer_reference_element,
                               DOCUMENT *document, int debug_level,
                               CONVERTER *converter)
{
  return converter_index_content_element (element, converter,
                                          prefer_reference_element);
}



/* representation of index entries letter */

static INDEX_ENTRY_TEXT_OR_COMMAND *
new_index_entry_text_or_command (const char *text, ELEMENT *command)
{
  INDEX_ENTRY_TEXT_OR_COMMAND *result = (INDEX_ENTRY_TEXT_OR_COMMAND *)
     malloc (sizeof (INDEX_ENTRY_TEXT_OR_COMMAND));

  if (text)
    result->text = strdup (text);
  else
    result->text = 0;
  result->command = command;

  return result;
}

/* Return the first non empty text or textual @-command.
   To be freed by caller.
   NOTE quotes and dash are not handled especially and it is not known
   if the text was in code or not. */
static INDEX_ENTRY_TEXT_OR_COMMAND *
idx_leading_text_or_command (ELEMENT *tree, const char *ignore_chars)
{
  size_t i;

  if (tree->e.c->contents.number <= 0)
    return new_index_entry_text_or_command (0, 0);

  for (i = 0; i < tree->e.c->contents.number; i++)
    {
      ELEMENT *content = tree->e.c->contents.list[i];

      if (type_data[content->type].flags & TF_text)
        {
          if (content->e.text->end > 0
              && content->e.text->text[strspn
                           (content->e.text->text, whitespace_chars)] != '\0')
            {
              char *p = content->e.text->text;
              p += strspn (p, whitespace_chars);
              if (ignore_chars)
                {
                  char *text = strip_index_ignore_chars (p, ignore_chars);
                  INDEX_ENTRY_TEXT_OR_COMMAND *result = 0;

                  if (text[strspn (text, whitespace_chars)] != '\0')
                    result = new_index_entry_text_or_command (text, 0);

                  free (text);

                  if (result)
                    return result;
                  else
                    continue;
                }
              else
                return new_index_entry_text_or_command (p, 0);
            }
          else
            continue;
        }

      if (content->e.c->cmd)
        {
          enum command_id data_cmd = element_builtin_data_cmd (content);

          if (command_data[data_cmd].other_flags & CF_formatted_nobrace)
            {
              if (ignore_chars && data_cmd == CM_AT_SIGN
                  && strchr (ignore_chars, '@'))
                continue;
              ELEMENT *copy = copy_element_tree (content, 0);
              return new_index_entry_text_or_command (0, copy);
            }
          else
            {
              if (command_data[data_cmd].flags & CF_brace)
                {
                  int brace_command_type = command_data[data_cmd].data;

                  if ((command_data[data_cmd].other_flags
                       & CF_non_formatted_brace)
                      || data_cmd == CM_footnote
                      || data_cmd == CM_dmn
                      || data_cmd == CM_value
                      || (command_data[data_cmd].other_flags
                          & CF_in_index))
                    continue;
                  else if (brace_command_type == BRACE_accent
                           || brace_command_type == BRACE_noarg
                           || data_cmd == CM_U)
                    {
                      ELEMENT *copy = copy_element_tree (content, 0);
                      return new_index_entry_text_or_command (0, copy);
                    }
                  else if (brace_command_type != BRACE_inline)
                    {
                      if (content->e.c->contents.number > 0)
                        {
                          return idx_leading_text_or_command (
                                               content->e.c->contents.list[0],
                                                              ignore_chars);
                        }
                    }
                  else
                    {
                      int status;
                      int expand_index
                       = lookup_extra_integer (content, AI_key_expand_index,
                                               &status);
                      if (expand_index > 0)
                        return idx_leading_text_or_command (
                                   content->e.c->contents.list[expand_index],
                                                            ignore_chars);
                    }
                }
              else if ((command_data[data_cmd].other_flags
                        & CF_formatted_line)
                       && data_cmd != CM_page)
                {
                   return idx_leading_text_or_command (
                                           content->e.c->contents.list[0],
                                                              ignore_chars);
                }
            }
        }
      else if (content->e.c->contents.number > 0)
        return idx_leading_text_or_command (content, ignore_chars);
    }
  return new_index_entry_text_or_command (0, 0);
}

/* Return the leading text or textual command that could be used
   for sorting.
   To be freed by caller.
*/
INDEX_ENTRY_TEXT_OR_COMMAND *
index_entry_first_letter_text_or_command (const INDEX_ENTRY *index_entry,
                                          CONVERTER *converter)
{
  ELEMENT *index_entry_element = index_entry->entry_element;
  char *sortas = lookup_extra_string (index_entry_element, AI_key_sortas);

  INDEX_ENTRY_TEXT_OR_COMMAND *result;

  if (sortas)
    {
      return new_index_entry_text_or_command (sortas, 0);
    }
  else
    {
      ELEMENT *entry_tree_element
         = converter_index_content_element (index_entry_element, converter, 0);
      char *index_ignore_chars = lookup_extra_string (index_entry_element,
                                                  AI_key_index_ignore_chars);
      ELEMENT *parsed_element;

      if (entry_tree_element->e.c->contents.number <= 0)
        {
          parsed_element = new_element (ET_generic_container);
          add_to_contents_as_array (parsed_element, index_entry_element);
        }
      else
        parsed_element = entry_tree_element;

      result = idx_leading_text_or_command (parsed_element, index_ignore_chars);

      destroy_element_and_children (parsed_element);

      return result;
    }
}



/* sort indices by name and remove empty indices */
void
converter_sort_index_names (CONVERTER *self)
{
  if (self->document && self->document->indices_info.number)
    {
      size_t i;
      size_t j;
      INDEX_LIST *indices_info = &self->document->indices_info;
      size_t index_nr = indices_info->number;
      size_t non_empty_index_nr = 0;
      size_t idx_non_empty = 0;

      const INDEX **sorted_index_names = sort_index_names (indices_info);

      for (i = 0; i < index_nr; i++)
        {
          INDEX *idx = indices_info->list[i];
          if (idx->entries_number > 0)
            non_empty_index_nr++;
        }

      /* store only non empty indices in sorted_index_names */
      self->sorted_index_names.number = non_empty_index_nr;
      /* resize if needed */
      if (self->sorted_index_names.number > self->sorted_index_names.space)
        {
          self->sorted_index_names.space = self->sorted_index_names.number;
          self->sorted_index_names.list = (const INDEX **)
             realloc (self->sorted_index_names.list,
                      self->sorted_index_names.space * sizeof (INDEX *));
        }
      for (j = 0; j < index_nr; j++)
        {
          if (sorted_index_names[j]->entries_number > 0)
            {
              self->sorted_index_names.list[idx_non_empty]
                  = sorted_index_names[j];
              idx_non_empty++;
            }
        }
      free (sorted_index_names);
    }
  else
    self->sorted_index_names.number = 0;
}
