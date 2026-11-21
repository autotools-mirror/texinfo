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

/* abstractions useful to setup interfaces, in practice the SWIG interface
   in util/swig/texinfo.i.  The functions defined here should not be used
   in texi2any.c nor in Perl XS interfaces used in texi2any.  Functions
   directly useful should not be in this file, but, for example in tree.c
   or utils.c.  Therefore, if a function here become used in texi2any it
   should be moved elsewhere.

   All the functions defined here and in swig_* files should have a
   txi_ext_ prefix to avoid clashing with Texinfo C libraries names
   (including future names).
 */

#include <config.h>

#include <stddef.h>
#include <stdlib.h>
#include <string.h>

#include "element_types.h"
#include "types_data.h"
#include "source_mark_types.h"
#include "tree_types.h"
#include "document_types.h"
#include "swig_error_messages_types.h"
#include "text.h"
#include "tree.h"
#include "extra.h"
/* get_cmd_global_uniq_command lookup_index_entry */
#include "utils.h"
#include "builtin_commands.h"
#include "errors.h"
#include "document.h"
#include "convert_to_text.h"
#include "swig_element_data.h"
#include "swig_text_options.h"
#include "swig_interface.h"

#define cm_flag(name) \
int \
txi_ext_element_command_is_##name (ELEMENT *element) \
{ \
  enum command_id cmd; \
 \
  if (type_data[element->type].flags & TF_text) \
    return 0; \
  cmd = element_builtin_data_cmd (element); \
  return command_data[cmd].flags & CF_##name; \
}
  TXI_CM_FLAGS_LIST
#undef cm_flag

#define cm_oflag(name) \
int \
txi_ext_element_command_is_##name (ELEMENT *element) \
{ \
  enum command_id cmd; \
 \
  if (type_data[element->type].flags & TF_text) \
    return 0; \
  cmd = element_builtin_data_cmd (element); \
  return command_data[cmd].other_flags & CF_##name; \
}
  TXI_CM_OTHER_FLAGS_LIST
#undef cm_oflag

static const char *brace_command_data_type_name[] = {
#define tcc_cmd_category(type, cat, uppercat) #type,
   TXI_CMD_CATEGORY_BRACE
#undef tcc_cmd_category
};

static const char *nobrace_command_data_type_name[] = {
#define tcc_cmd_category(type, cat, uppercat) #type,
   TXI_CMD_CATEGORY_NOBRACE
#undef tcc_cmd_category
};

static const char *block_command_data_type_name[] = {
#define tcc_cmd_category(type, cat, uppercat) #type,
   TXI_CMD_CATEGORY_BLOCK
#undef tcc_cmd_category
};

static const char *line_command_data_type_name[] = {
#define tcc_cmd_category(type, cat, uppercat) #type,
   TXI_CMD_CATEGORY_LINE
#undef tcc_cmd_category
};

#define ty_flag(name)  \
int \
txi_ext_element_type_is_##name (ELEMENT *element) \
{ \
  return type_data[element->type].flags & TF_##name; \
}
  TXI_TY_FLAGS_LIST
#undef ty_flag


const char *
txi_ext_element_command_data_type (ELEMENT *element)
{
  if (type_data[element->type].flags & TF_text)
    return 0;
  enum command_id cmd = element_builtin_data_cmd (element);
  if (cmd)
    {
      int cmd_data_type = command_data[cmd].data;
      if (command_data[cmd].flags & CF_brace)
        return brace_command_data_type_name[cmd_data_type];
      else if (command_data[cmd].flags & CF_line)
        return line_command_data_type_name[cmd_data_type];
      else if (command_data[cmd].flags & CF_nobrace)
        return nobrace_command_data_type_name[cmd_data_type];
      else if (command_data[cmd].flags & CF_block)
        return block_command_data_type_name[cmd_data_type];
    }

  return 0;
}

const char *
txi_ext_element_type (ELEMENT *element)
{
  if (element->type)
    {
      if (type_data[element->type].flags & TF_text)
        {
          if (element->type != ET_normal_text)
            return type_data[element->type].name;
        }
      else if (!(type_data[element->type].flags & TF_c_only))
        return type_data[element->type].name;
    }
  return "";
}

const char *
txi_ext_element_text (ELEMENT *element)
{
  if (type_data[element->type].flags & TF_text)
    return element->e.text->text;

  return 0;
}

const char *
txi_ext_element_cmdname (ELEMENT *element)
{
  if (!(type_data[element->type].flags & TF_text))
    return element_command_name (element);

  return 0;
}

ELEMENT *
txi_ext_element_list_element_by_index (ELEMENT_LIST *element_list, int index)
{
  if (!element_list || element_list->number == 0)
    return 0;

  if (index < 0)
    index = (int) element_list->number + index;

  if (index < 0 || (size_t) index >= element_list->number)
    return 0;

  return element_list->list[index];
}

int
txi_ext_element_list_elements_number (ELEMENT_LIST *element_list)
{
  return element_list->number;
}

const ELEMENT *
txi_ext_const_element_list_element_by_index (CONST_ELEMENT_LIST *element_list,
                                     int index)
{
  if (!element_list || element_list->number == 0)
    return 0;

  if (index < 0)
    index = (int) element_list->number - index;

  if (index < 0 || (size_t) index >= element_list->number)
    return 0;

  return element_list->list[index];
}

int
txi_ext_const_element_list_elements_number (CONST_ELEMENT_LIST *element_list)
{
  return element_list->number;
}

char *
txi_ext_string_list_string_by_index (STRING_LIST *string_list, int index)
{
  if (!string_list || string_list->number == 0)
    return 0;

  if (index < 0)
    index = (int) string_list->number - index;

  if (index < 0 || (size_t) index >= string_list->number)
    return 0;

  return string_list->list[index];
}

int
txi_ext_string_list_strings_number (STRING_LIST *string_list)
{
  return string_list->number;
}

int
txi_ext_element_children_number (ELEMENT *element)
{
  if (type_data[element->type].flags & TF_text)
    return 0;

  return element->e.c->contents.number;
}

ELEMENT *
txi_ext_element_get_child (ELEMENT *element, int index)
{
  if (type_data[element->type].flags & TF_text)
    return 0;

  return txi_ext_element_list_element_by_index (&element->e.c->contents,
                                                index);
}

int
txi_ext_element_source_marks_number (ELEMENT *element)
{
  if (element->source_mark_list)
    return element->source_mark_list->number;

  return 0;
}

SOURCE_MARK *
txi_ext_element_get_source_mark (ELEMENT *element, int index)
{
  SOURCE_MARK_LIST *source_mark_list = element->source_mark_list;

  if (source_mark_list && source_mark_list->number == 0)
    return 0;

  if (index < 0)
    index = (int) source_mark_list->number - index;

  if (index < 0 || (size_t) index >= source_mark_list->number)
    return 0;

  return source_mark_list->list[index];
}

ELEMENT *
txi_ext_element_parent (ELEMENT *element)
{
  if (type_data[element->type].flags & TF_text)
    return 0;

  return element->e.c->parent;
}

SOURCE_INFO *
txi_ext_element_source_info (ELEMENT *element)
{
  if (type_data[element->type].flags & TF_text)
    return 0;

  return &element->e.c->source_info;
}

int
txi_ext_element_attribute_integer (const ELEMENT *element,
                                   const char *attribute,
                                   int *ret)
{
  enum ai_key_name key = find_associated_info_key (attribute);

  if (key)
    {
      enum extra_type k_type = associated_info_table[key].type;

      switch (k_type)
        {
        case extra_integer:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            {
              *ret = 0;
              return k->k.integer;
            }
          break;
          }
        case extra_flag:
          {
          if (element->flags & associated_info_table[key].data)
            {
              *ret = 0;
              return 1;
            }
          break;
          }
        default:
          break;
        }
    }
  *ret = -1;
  return 0;
}

const char *
txi_ext_element_attribute_string (const ELEMENT *element,
                                  const char *attribute)
{
  enum ai_key_name key = find_associated_info_key (attribute);

  if (key)
    {
      enum extra_type k_type = associated_info_table[key].type;

      switch (k_type)
        {
      case extra_string:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            return k->k.string;
          break;
          }
        case extra_string_info:
          {
          int idx = associated_info_table[key].data;
          switch (key)
            {
            case AI_key_alias_of:
              if ((element->e.c->cmd
                   || type_data[element->type].flags & TF_with_command)
                  && element->e.c->string_info[idx])
                return element->e.c->string_info[idx];
              break;
            default:
              break;
            }
          break;
          }
        default:
          break;
        }
    }

  return 0;
}

ELEMENT *
txi_ext_element_attribute_element (const ELEMENT *element,
                                   const char *attribute)
{
  enum ai_key_name key = find_associated_info_key (attribute);

  if (key)
    {
      enum extra_type k_type = associated_info_table[key].type;

      switch (k_type)
        {
        case extra_element_oot:
        case extra_container:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            return k->k.element;
          break;
          }
        case extra_element_info:
          {
          int idx = associated_info_table[key].data;
          if (idx < type_data[element->type].elt_info_number
              && element->elt_info[idx])
            {
              ELEMENT *info_element = element->elt_info[idx];
              return info_element;
            }
          break;
          }
        default:
          break;
        }
    }

  return 0;
}


INDEX_ENTRY *
txi_ext_element_index_entry (DOCUMENT *document, ELEMENT *element)
{
  const INDEX_ENTRY_LOCATION *index_entry_info
           = lookup_extra_index_entry (element,
                                       AI_key_index_entry);

  if (index_entry_info)
    {
      INDEX_ENTRY *result = 0;
      INDEX_ENTRY_AND_INDEX *idx_info
          = lookup_index_entry (index_entry_info,
                                &document->indices_info);
      if (idx_info->index_entry)
        result = idx_info->index_entry;

      free (idx_info);

      return result;
    }
  return 0;
}

INDEX *
txi_ext_index_entry_index_info (DOCUMENT *document, INDEX_ENTRY *index_entry)
{
  const char *entry_index_name = index_entry->index_name;
  return  indices_info_index_by_name (&document->indices_info,
                                      entry_index_name);
}

const STRING_LIST *
txi_ext_element_misc_args (ELEMENT *element)
{
  return lookup_extra_string_list (element, AI_key_misc_args);
}

const STRING_LIST *
txi_ext_element_formal_args (ELEMENT *element)
{
  return lookup_extra_string_list (element, AI_key_formal_args);
}


/* New element and element modification */

ELEMENT *
txi_ext_store_new_element (DOCUMENT *document, const char *type_name,
                           const char *command_name, int is_text_element)
{
  ELEMENT *e = new_element_from_names (type_name, command_name,
                                       is_text_element);

  if (e)
    add_to_element_list (&document->additional_elements, e);

  return e;
}

void
txi_ext_element_reset_text (ELEMENT *element)
{
  if (type_data[element->type].flags & TF_text)
    {
      text_reset (element->e.text);
      text_append (element->e.text, "");
    }
}

void
txi_ext_element_append_text (ELEMENT *element, const char *text)
{
  if (type_data[element->type].flags & TF_text)
    text_append (element->e.text, text);
}

int
txi_ext_set_element_attribute_integer (ELEMENT *element,
                               const char *attribute, int value)
{
  enum ai_key_name key = find_associated_info_key (attribute);

  if (key)
    {
      enum extra_type k_type = associated_info_table[key].type;

      switch (k_type)
        {
        case extra_integer:
          {
          add_extra_integer (element, key, value);
          return 1;
          break;
          }
        case extra_flag:
          {
          if (value == 1)
            element->flags |= associated_info_table[key].data;
          else if (value == 0)
            element->flags &= ~associated_info_table[key].data;
          return 1;
          break;
          }
        default:
          break;
        }
    }
  return 0;
}

int
txi_ext_set_element_attribute_string (ELEMENT *element, const char *attribute,
                                      const char *value)
{
  enum ai_key_name key = find_associated_info_key (attribute);

  if (key)
    {
      enum extra_type k_type = associated_info_table[key].type;

      switch (k_type)
        {
      case extra_string:
          {
          add_extra_string_dup (element, key, value);
          return 1;
          break;
          }
        case extra_string_info:
          {
          int idx = associated_info_table[key].data;
          switch (key)
            {
            case AI_key_alias_of:
              if (element->e.c->cmd
                  || type_data[element->type].flags & TF_with_command)
                {
                  free (element->e.c->string_info[idx]);
                  if (value)
                    element->e.c->string_info[idx] = strdup (value);
                  else
                    element->e.c->string_info[idx] = 0;
                  return 1;
                }
              break;
            default:
              break;
            }
          break;
          }
        default:
          break;
        }
    }

  return 0;
}

int
txi_ext_set_element_attribute_element (ELEMENT *element, const char *attribute,
                                       ELEMENT *value)
{
  enum ai_key_name key = find_associated_info_key (attribute);

  if (key)
    {
      enum extra_type k_type = associated_info_table[key].type;

      switch (k_type)
        {
        case extra_element_oot:
          {
          add_extra_element_oot (element, key, value);
          return 1;
          break;
          }
        case extra_container:
          {
          add_extra_container (element, key, value);
          return 1;
          break;
          }
        case extra_element_info:
          {
          int idx = associated_info_table[key].data;
          if (idx < type_data[element->type].elt_info_number)
            {
              free (element->elt_info[idx]);
              element->elt_info[idx] = value;
              return 1;
            }
          break;
          }
        default:
          break;
        }
    }

  return 0;
}

SECTION_RELATIONS *
txi_ext_section_relation_list_section_relation_by_index (
                SECTION_RELATIONS_LIST *section_relation_list, int index)
{
  if (!section_relation_list || section_relation_list->number == 0)
    return 0;

  if (index < 0)
    index = (int) section_relation_list->number - index;

  if (index < 0 || (size_t) index >= section_relation_list->number)
    return 0;

  return section_relation_list->list[index];
}

int txi_ext_section_relation_list_section_relations_number (
                           SECTION_RELATIONS_LIST *section_relation_list)
{
  return section_relation_list->number;
}

NODE_RELATIONS *
txi_ext_get_node_relations (ELEMENT *element, DOCUMENT *document)
{
  int status;
  int node_number;
  const NODE_RELATIONS_LIST *nodes_list = &document->nodes_list;

  if (type_data[element->type].flags & TF_text)
    return 0;

  if (element->e.c->cmd != CM_node)
    return 0;

  node_number = lookup_extra_integer (element, AI_key_node_number, &status);
  if (node_number > 0 && (size_t) node_number <= nodes_list->number)
    return nodes_list->list[node_number -1];

  return 0;
}

SECTION_RELATIONS *
txi_ext_get_section_relations (ELEMENT *element, DOCUMENT *document)
{
  int status;
  int section_number;
  const SECTION_RELATIONS_LIST *sections_list = &document->sections_list;

  if (type_data[element->type].flags & TF_text)
    return 0;

  enum command_id data_cmd = element_builtin_data_cmd (element);

  if (!(command_data[data_cmd].flags & CF_root))
    return 0;

  section_number
    = lookup_extra_integer (element, AI_key_section_number, &status);
  if (section_number > 0 && (size_t) section_number <= sections_list->number)
    return sections_list->list[section_number -1];

  return 0;
}

HEADING_RELATIONS *
txi_ext_get_heading_relations (ELEMENT *element, DOCUMENT *document)
{
  int status;
  int heading_number;
  const HEADING_RELATIONS_LIST *headings_list = &document->headings_list;

  if (type_data[element->type].flags & TF_text)
    return 0;

  if (!element->e.c->cmd)
    return 0;

  heading_number
    = lookup_extra_integer (element, AI_key_heading_number, &status);
  if (heading_number > 0 && (size_t) heading_number <= headings_list->number)
    return headings_list->list[heading_number -1];

  return 0;
}

static size_t
txi_ext_direction_name_number (const char *direction)
{
  size_t d;

  if (!direction)
    return 0;

  for (d = 0; d < directions_length; d++)
    {
      if (!strcmp (direction, direction_names[d]))
        return d +1;
    }
  return 0;
}

const ELEMENT *
txi_ext_node_relation_node_direction (NODE_RELATIONS *node,
                                      const char *direction)
{
  size_t d_number;

  if (!node->node_directions)
    return 0;

  d_number = txi_ext_direction_name_number (direction);

  if (!d_number)
    return 0;

  return node->node_directions[d_number -1];
}

const SECTION_RELATIONS *
txi_ext_section_relation_section_direction (SECTION_RELATIONS *section,
                                            const char *direction)
{
  size_t d_number;

  if (!section->section_directions)
    return 0;

  d_number = txi_ext_direction_name_number (direction);

  if (!d_number)
    return 0;

  return section->section_directions[d_number -1];
}

const SECTION_RELATIONS *
txi_ext_section_relation_toplevel_direction (SECTION_RELATIONS *section,
                                             const char *direction)
{
  size_t d_number;

  if (!section->toplevel_directions)
    return 0;

  d_number = txi_ext_direction_name_number (direction);

  if (!d_number)
    return 0;

  return section->toplevel_directions[d_number -1];
}

ELEMENT *
txi_ext_document_global_unique_command (DOCUMENT *document,
                                        const char *cmdname)
{
  ELEMENT *element = 0;
  enum command_id cmd = lookup_builtin_command (cmdname);
  if (cmd)
    {
      element = (ELEMENT *)get_cmd_global_uniq_command (
                              &document->global_commands, cmd);
    }

  return element;
}

const ELEMENT_LIST *
txi_ext_document_global_command_list (DOCUMENT *document,
                                      const char *cmdname)
{
  enum command_id cmd = lookup_builtin_command (cmdname);

  if (document && cmd)
    {
      const ELEMENT_LIST *command_list
        = get_cmd_global_multi_command (&document->global_commands, cmd);
      if (command_list && command_list->number)
        {
          return command_list;
        }
    }
  return 0;
}


INDEX_ENTRY *
txi_ext_sorted_index_entries_by_index (
               const INDEX_SORTED_BY_INDEX *index_sorted,
                               int index)
{
  if (!index_sorted || index_sorted->entries_number == 0)
    return 0;

  if (index < 0 || (size_t) index >= index_sorted->entries_number)
    return 0;

  return index_sorted->entries[index];
}

int
txi_ext_sorted_index_entries_number (const INDEX_SORTED_BY_INDEX *index_sorted)
{
  return index_sorted->entries_number;
}

/* function selecting one index by name after sorting the indices */
const INDEX_SORTED_BY_INDEX *
txi_ext_get_index_sorted_by_index (DOCUMENT *document, const char *index_name,
                                   int use_unicode_collation,
                                   const char *collation_language,
                                   const char *collation_locale)
{
  const INDEX_SORTED_BY_INDEX *idx;
  const INDEX_SORTED_BY_INDEX *index_sorted = 0;

  INDEX_SORTED_BY_INDEX *indices_sorted_by_index
    = document_sorted_indices_by_index (document, use_unicode_collation,
                               collation_language, collation_locale);

  if (!indices_sorted_by_index)
    return 0;

  for (idx = indices_sorted_by_index; idx->name; idx++)
    {
      if (!strcmp (idx->name, index_name))
        {
          index_sorted = idx;
          break;
        }
    }

  if (!index_sorted || !index_sorted->entries_number)
    return 0;

  return index_sorted;
}

FLOAT_INFORMATION *
txi_ext_float_list_float_by_index (FLOAT_INFORMATION_LIST *float_list,
                                   int index)
{
  if (!float_list || float_list->number == 0)
    return 0;

  if (index < 0)
    index = (int) float_list->number - index;

  if (index < 0 || (size_t) index >= float_list->number)
    return 0;

  return &float_list->list[index];
}

int
txi_ext_float_list_floats_number (FLOAT_INFORMATION_LIST *float_list)
{
  return float_list->number;
}

FLOAT_INFORMATION_LIST *
txi_ext_get_float_type_floats_information (DOCUMENT *document,
                                           const char *float_type)
{
  size_t i;
  const LISTOFFLOATS_TYPE_LIST *listoffloats = &document->listoffloats;

  if (!listoffloats->number)
    return 0;

  for (i = 0; i < listoffloats->number; i++)
    {
      LISTOFFLOATS_TYPE *float_types = &listoffloats->list[i];
      if (!strcmp (float_types->type, float_type))
        {
          if (float_types->float_list.number > 0)
            return &float_types->float_list;
          else
            return 0;
        }
    }
  return 0;
}

GLOBAL_INFO *
txi_ext_document_global_information (DOCUMENT *document)
{
  return &document->global_info;
}



TEXT_OPTIONS *
txi_ext_document_text_options (DOCUMENT *document)
{
  TEXT_OPTIONS *result;
  if (document->options)
    result = copy_options_for_convert_text (document->options,
                                            document);
  else
    result = new_text_options ();
  return result;
}

#define tico_option_name(name) \
void \
txi_ext_text_options_set_##name (TEXT_OPTIONS *text_options, int i) \
{ \
  text_options->name = i; \
}
 TEXT_INDICATOR_CONVERTER_OPTIONS
#undef tico_option_name

void
txi_ext_text_options_clear_expanded_formats (TEXT_OPTIONS *text_options)
{
  clear_expanded_formats (text_options->expanded_formats);
}

void
txi_ext_text_options_add_expanded_format (TEXT_OPTIONS *text_options,
                                          const char *format)
{
  add_expanded_format (text_options->expanded_formats, format);
}

void
txi_ext_text_options_set_encoding (TEXT_OPTIONS *text_options,
                                   const char *encoding)
{
  free (text_options->encoding);
  text_options->encoding = strdup (encoding);
}



size_t
txi_ext_output_parser_error_messages (DOCUMENT *document,
                                  const char *message_encoding,
                                  int no_warn, int use_filename)
{
  return output_error_messages (&document->parser_error_messages,
                                message_encoding, no_warn,
                                use_filename);
}

size_t
txi_ext_output_document_error_messages (DOCUMENT *document,
                                    const char *message_encoding,
                                    int no_warn, int use_filename)
{
  return output_error_messages (&document->error_messages, message_encoding,
                                no_warn, use_filename);
}

FORMATTED_ERROR_MESSAGE_LIST *
txi_ext_get_error_messages_list_messages (ERROR_MESSAGE_LIST *error_messages,
                                          const char *message_encoding,
                                          int no_warn, int use_filename,
                                          int *count)
{
  ENCODING_CONVERSION *conversion = 0;
  size_t error_nrs = count_errors (error_messages);
  FORMATTED_ERROR_MESSAGE_LIST *result = 0;
  size_t i;
  size_t error_messages_nr = error_messages->number;
  TEXT text;
  size_t msg_idx = 0;

  *count = (int)error_nrs;

  if (error_messages_nr == 0)
    return 0;

  if (message_encoding)
    conversion = get_encoding_conversion (message_encoding,
                                          &output_conversions);

  result = (FORMATTED_ERROR_MESSAGE_LIST *) malloc
                                   (sizeof (FORMATTED_ERROR_MESSAGE_LIST));
  result->list = (FORMATTED_ERROR_MESSAGE *)
      malloc (error_messages_nr * sizeof (FORMATTED_ERROR_MESSAGE));

  text_init (&text);

  for (i = 0; i < error_messages_nr; i++)
    {
      const ERROR_MESSAGE *error_msg = &error_messages->list[i];
      FORMATTED_ERROR_MESSAGE *result_msg;
      if (error_msg->type == MSG_warning && no_warn > 0)
        continue;

      result_msg = &result->list[msg_idx];

      result_msg->message = strdup (error_msg->message);
      if (error_msg->error_line)
        result_msg->error_line = strdup (error_msg->error_line);

      result_msg->source_info = error_msg->source_info;
      result_msg->continuation = error_msg->continuation;
      result_msg->type = error_msg->type;

      text_reset (&text);
      error_message_text (error_msg, use_filename, conversion, &text);
      result_msg->formatted = strdup (text.text);
      msg_idx++;
    }
  free (text.text);

  result->number = msg_idx;

  clear_error_message_list (error_messages);

  return result;
}

FORMATTED_ERROR_MESSAGE_LIST *
txi_ext_get_parser_error_messages (DOCUMENT *document,
                                  const char *message_encoding,
                                  int no_warn, int use_filename,
                                  int *count)
{
  return txi_ext_get_error_messages_list_messages (
                                           &document->parser_error_messages,
                                           message_encoding,
                                           no_warn, use_filename, count);
}

FORMATTED_ERROR_MESSAGE_LIST *
txi_ext_get_document_error_messages (DOCUMENT *document,
                                  const char *message_encoding,
                                  int no_warn, int use_filename,
                                  int *count)
{
  return txi_ext_get_error_messages_list_messages (&document->error_messages,
                                           message_encoding,
                                           no_warn, use_filename, count);
}

FORMATTED_ERROR_MESSAGE *
txi_ext_messages_list_message_by_index (
                        FORMATTED_ERROR_MESSAGE_LIST *messages_list, int index)
{
  if (!messages_list || messages_list->number == 0)
    return 0;

  if (index < 0 || (size_t) index >= messages_list->number)
    return 0;

  return &messages_list->list[index];
}

int
txi_ext_messages_list_messages_number (
                   FORMATTED_ERROR_MESSAGE_LIST *messages_list)
{
  if (messages_list)
    return messages_list->number;
  return 0;
}

void
txi_ext_destroy_error_messages_list (
                  FORMATTED_ERROR_MESSAGE_LIST *error_messages)
{
  size_t j;

  if (error_messages)
    {
      for (j = 0; j < error_messages->number; j++)
        {
          free (error_messages->list[j].message);
          free (error_messages->list[j].error_line);
          free (error_messages->list[j].formatted);
        }

      free (error_messages->list);
      free (error_messages);
    }
}
