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

/* In sync with Texinfo::Transformations and manipulate tree as indicated */

#include <config.h>

#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "unistr.h"

#include "text.h"
#include "command_ids.h"
#include "element_types.h"
#include "tree_types.h"
#include "document_types.h"
#include "types_data.h"
#include "option_types.h"
#include "options_data.h"
/* fatal */
#include "base_utils.h"
#include "hashmap.h"
#include "tree.h"
#include "extra.h"
#include "structure_list.h"
#include "translations.h"
#include "builtin_commands.h"
#include "errors.h"
#include "debug.h"
/* indices_info_index_by_name section_level whitespace_chars
   parse_line_directive lookup_index_entry ... */
#include "utils.h"
/* for copy_contents normalized_menu_entry_internal_node modify_tree */
#include "manipulate_tree.h"
#include "parser_api.h"
#include "set_parser_conf.h"
#include "document.h"
#include "convert_to_texinfo.h"
#include "targets.h"
#include "unicode.h"
#include "node_name_normalization.h"
#include "structuring.h"
#include "transformations.h"


/* Add raise/lowersections to be back at the normal level from
   the SECTION level.  The raise/lowersections are added at the
   end of PARENT.
   If MODIFIER is set to -1, add raise/lowersections to go from
   the normal level to the SECTION level.
 */
static void
correct_level (const ELEMENT *section, ELEMENT *parent, int modifier)
{
  int status;
  int section_modifier = lookup_extra_integer (section, AI_key_level_modifier,
                                               &status);
  if (status >= 0)
    {
      int level_to_remove;
      enum command_id cmd;
      int remaining_level;

      level_to_remove = section_modifier * modifier;
      if (level_to_remove < 0)
        cmd = CM_raisesections;
      else
        cmd = CM_lowersections;

      remaining_level = abs (level_to_remove);
      while (remaining_level > 0)
        {
          ELEMENT *element = new_command_element (cmd);
          ELEMENT *line_args = new_element (ET_line_arg);
          ELEMENT *spaces_before = new_element (ET_spaces_before_argument);

          add_to_element_contents (parent, element);
          text_append (spaces_before->e.text, "\n");
          add_to_element_contents (element, line_args);
          add_to_contents_as_array (line_args, spaces_before);
          remaining_level--;
        }
    }
}

/* COMMAND_HEADING_TEXI Texinfo code is used for the heading of the
   sectioning command used to fill a gap in sectioning if set.
 */
void
fill_gaps_in_sectioning_in_document (DOCUMENT *document,
                                     const char *commands_heading_texi)
{
  size_t nr_current_section = 0;
  size_t nr_next_section = 0;
  size_t idx = 0;
  size_t idx_current_section, idx_next_section;
  ELEMENT *root = document->tree;
  ELEMENT *commands_heading_content = 0;
  /* index in sections_list */
  size_t section_idx = 0;

  if (commands_heading_texi)
    {
      reset_parser (0);
      parser_conf_set_NO_INDEX (1);
      parser_conf_set_NO_USER_COMMANDS (1);
      DOCUMENT *heading_document = parse_string (commands_heading_texi, 1);
      commands_heading_content
        = unregister_document_merge_with_document (heading_document,
                                                   document);
      tree_remove_parents (commands_heading_content);
    }

  /* This loop initializes the index of the first and next section
     in the tree root element contents list */
  while (idx < root->e.c->contents.number)
    {
      const ELEMENT *content = root->e.c->contents.list[idx];
      enum command_id data_cmd = element_builtin_data_cmd (content);
      unsigned long flags = command_data[data_cmd].flags;

      if (!data_cmd || data_cmd == CM_node || !(CF_root & flags))
        {
        }
      else if (nr_current_section == 0)
        nr_current_section = idx +1;
      else if (nr_next_section == 0)
        {
          nr_next_section = idx +1;
          break;
        }
      idx++;
    }

  if (nr_current_section == 0)
    return;

  if (nr_next_section == 0)
    return;

  idx_current_section = nr_current_section -1;
  idx_next_section = nr_next_section -1;

  while (1)
    {
      ELEMENT *current_section = root->e.c->contents.list[idx_current_section];
      ELEMENT *next_section = root->e.c->contents.list[idx_next_section];
      int current_section_level = section_level (current_section);
      int next_section_level = section_level (next_section);

      if (next_section_level - current_section_level > 1)
        {
          ELEMENT_LIST *new_sections = new_list ();
 /* to handle the case of a section having its level raised or lowered,
    we go back to the "normal" level with a correct_level call before
    inserting the @-commands that outputs @raisesections or @lowersections
    @-commands
    After having done the insertion, another call to correct_level with
    a modifier argument outputs complementary @raisesections or @lowersections
    to come back to the level corresponding to the current section level */
          correct_level (next_section, current_section, 1);
          while (next_section_level - current_section_level > 1)
            {
              ELEMENT *line_content;
              ELEMENT *new_section;
              ELEMENT *spaces_before_argument
                 = new_text_element (ET_spaces_before_argument);
              ELEMENT *line_arg = new_element (ET_line_arg);
              ELEMENT *arguments_line = new_element (ET_arguments_line);
              ELEMENT *spaces_after_argument
                = new_text_element (ET_spaces_after_argument);
              ELEMENT *empty_line = new_text_element (ET_empty_line);

              current_section_level++;
              new_section = new_command_element (
          level_to_structuring_command[CM_unnumbered][current_section_level]);

              text_append (spaces_before_argument->e.text, " ");
              text_append (spaces_after_argument->e.text, "\n");

              add_to_element_contents (new_section, arguments_line);

              add_to_element_contents (arguments_line, line_arg);

              add_to_contents_as_array (line_arg, spaces_before_argument);

              if (commands_heading_content)
                {
                  line_content
                    = copy_contents (commands_heading_content, 0,
                                     ET_generic_container);
                }
              else
                {
                  ELEMENT *asis_command = new_command_element (CM_asis);
                  ELEMENT *brace_container
                    = new_element (ET_brace_container);
                  add_to_element_contents (asis_command, brace_container);
                  line_content = asis_command;
                }
              add_to_element_contents (line_arg, line_content);
              add_to_contents_as_array (line_arg, spaces_after_argument);

              text_append (empty_line->e.text, "\n");
              add_to_contents_as_array (new_section, empty_line);

              insert_section_into_section_relations_list (
                                                 &document->sections_list,
                                                 new_section, section_idx +1);
              section_idx++;
              add_extra_integer (new_section, AI_key_section_number,
                                 section_idx +1);

              add_to_element_list (new_sections, new_section);
              new_section->e.c->parent = root;
            }
          insert_list_slice_into_contents (root, idx_current_section+1,
                                          new_sections, 0,
                                          new_sections->number);
          idx_next_section += new_sections->number;
          correct_level (next_section,
                         new_sections->list[new_sections->number -1], -1);
          destroy_list (new_sections);

          document->modified_information |= F_DOCM_tree | F_DOCM_sections_list;
        }
      idx_current_section = idx_next_section;
      section_idx++;
      add_extra_integer (next_section, AI_key_section_number, section_idx +1);

      /* find the new next section index */
      idx_next_section = idx_current_section +1;
      while (idx_next_section < root->e.c->contents.number)
        {
          const ELEMENT *content = root->e.c->contents.list[idx_next_section];
          enum command_id data_cmd = element_builtin_data_cmd (content);
          unsigned long flags = command_data[data_cmd].flags;

          if (data_cmd && data_cmd != CM_node && (CF_root & flags))
            break;
          idx_next_section++;
        }
      if (idx_next_section >= root->e.c->contents.number)
        break;
    }

  if (commands_heading_content)
    destroy_element_and_children (commands_heading_content);
}

/* ALTIMP Texinfo/ManipulateTreeNonXS.pm */
static void
relate_index_entries_to_table_items_in (ELEMENT *table,
                                        DOCUMENT *document)
{
  size_t i;
  const INDEX_LIST *indices_info;

  if (table->e.c->contents.number <= 0)
    return;

  indices_info = &document->indices_info;

  for (i = 0; i < table->e.c->contents.number; i++)
    {
      ELEMENT *table_entry = table->e.c->contents.list[i];
      ELEMENT *term;
      ELEMENT *definition;
      ELEMENT *item = 0;

      if (table_entry->type != ET_table_entry
          || table_entry->e.c->contents.number <= 0)
        continue;

      term = table_entry->e.c->contents.list[0];

      /*
       Move any index entries from the start of a 'table_definition' to
       the 'table_term'.
       */

      if (table_entry->e.c->contents.number > 1
          && table_entry->e.c->contents.list[1]->type == ET_table_definition)
        {
          size_t nr_index_entry_command = 0;
          size_t j;
          definition = table_entry->e.c->contents.list[1];

          for (j = 0; j < definition->e.c->contents.number; j++)
            {
              ELEMENT *child = definition->e.c->contents.list[j];
              if (child->type == ET_index_entry_command)
                {
                  child->e.c->parent = term;
                  nr_index_entry_command++;
                }
              else
                break;
            }
          if (nr_index_entry_command > 0)
            {
              insert_slice_into_contents (term, 0, definition, 0,
                                          nr_index_entry_command);
              remove_slice_from_contents (definition, 0,
                                          nr_index_entry_command);
              document->modified_information |= F_DOCM_tree;
            }
        }
      if (term->type == ET_table_term)
        {
          INDEX_ENTRY_AND_INDEX *entry_idx_info = 0;
          size_t j;
         /*
         Relate the first index_entry_command in the 'table_term' to
         the term itself.
          */
          for (j = 0; j < term->e.c->contents.number; j++)
            {
              /* see gather_previous_item, CM_item a term can only contain
                 leading index entries that were left out of the
                 preceding table_entry, or from the beginning of the table
                 and the @item command line
               */
              ELEMENT *content = term->e.c->contents.list[j];
              if (content->type == ET_index_entry_command)
                {
                  if (!entry_idx_info)
                    {
                      INDEX_ENTRY_AND_INDEX *idx_info;
                      const INDEX_ENTRY_LOCATION *index_entry_info
                        = lookup_extra_index_entry (content,
                                                    AI_key_index_entry);
                      idx_info = lookup_index_entry (index_entry_info,
                                                     indices_info);
                      if (idx_info->index_entry)
                        entry_idx_info = idx_info;
                      else
                        free (idx_info);
                   }
                }
              /* the command in the tree is CM_item, not CM_item_LINE */
              else if (content->e.c->cmd == CM_item)
                {
                  if (!item)
                    item = content;
                }
              if (item && entry_idx_info)
                {
                  INDEX_ENTRY_LOCATION *index_entry;
                 /*
                  This is better than overwriting 'entry_element', which
                  holds important information.
                  */
                  entry_idx_info->index_entry->entry_associated_element = item;
                  document->modified_information |= F_DOCM_tree
                                                    | F_DOCM_index_names;
               /* also add a reference from element to index entry in index */
                  index_entry = (INDEX_ENTRY_LOCATION *)
                     malloc (sizeof (INDEX_ENTRY_LOCATION));
                  index_entry->index_name
                     = strdup (entry_idx_info->index->name);
                  index_entry->number = entry_idx_info->entry_number;
                  add_extra_index_entry (item, AI_key_associated_index_entry,
                                         index_entry);
                  free (entry_idx_info);
                  break;
                }
            }
        }
    }
}

/* ALTIMP Texinfo/ManipulateTreeNonXS.pm */
static ELEMENT_LIST *
relate_index_entries_to_table_items_internal (const char *type,
                                              ELEMENT *current,
                                              void *argument)
{
  if (!(type_data[current->type].flags & TF_text)
      && current->e.c->cmd == CM_table)
    {
      DOCUMENT *document = (DOCUMENT *)argument;
      relate_index_entries_to_table_items_in (current, document);
    }
  return 0;
}

/* ALTIMP Texinfo/ManipulateTreeNonXS.pm */
void
relate_index_entries_to_table_items_in_document (DOCUMENT *document)
{
  modify_tree (document->tree, &relate_index_entries_to_table_items_internal,
               document);
}

/* ALTIMP Texinfo/ManipulateTreeNonXS.pm */
/* in itemize or enumerate */
static void
move_selected_element_index_entries_after_items (ELEMENT *current,
                                                 DOCUMENT *document)
{
  ELEMENT *previous = 0;
  size_t i;

  for (i = 0; i < current->e.c->contents.number; i++)
    {
      /* item can only be before_item, @item, or @end */
      ELEMENT *item = current->e.c->contents.list[i];
      if (previous && item->e.c->cmd && item->e.c->cmd == CM_item
          && previous->e.c->contents.number > 0)
        {
          ELEMENT *previous_ending_container;
          ELEMENT *prev_last_child = last_contents_child (previous);
          size_t last_entry_nr = 0;
          size_t j;
          size_t contents_nr;

          if (prev_last_child->type == ET_paragraph
              || prev_last_child->type == ET_preformatted)
            previous_ending_container = prev_last_child;
          else
            previous_ending_container = previous;

          contents_nr = previous_ending_container->e.c->contents.number;
          for (j = contents_nr; j > 0; j--)
            {
              ELEMENT *content
                = previous_ending_container->e.c->contents.list[j-1];
              if (content->type == ET_index_entry_command)
                last_entry_nr = j;
              else if (!(!(type_data[content->type].flags & TF_text)
                         && (content->e.c->cmd == CM_comment
                             || content->e.c->cmd == CM_c)))
                break;
            }

          if (last_entry_nr > 0)
            {
              size_t insertion_idx = 0;
              size_t last_entry_idx = last_entry_nr -1;
              size_t k;
              ELEMENT *item_container;

              if (item->e.c->contents.number
                  && item->e.c->contents.list[0]->type == ET_preformatted)
                item_container = item->e.c->contents.list[0];
              else
                item_container = item;

              for (k = last_entry_idx; k < contents_nr; k++)
     /* can only be index_entry_command or comment as gathered just above */
                previous_ending_container->e.c->contents.list[k]->e.c->parent
                  = item_container;

              if (item_container->e.c->contents.number
                  && item_container->e.c->contents.list[0]->type
                          == ET_ignorable_spaces_after_command)
                {
                  TEXT *t = item_container->e.c->contents.list[0]->e.text;
                  /*
                   insert after leading spaces, and add an end of line if there
                   is none
                   */
                  insertion_idx = 1;

                  if (t->text[t->end -1] != '\n')
                    {
                      text_append (t, "\n");
                    }
                }
              insert_slice_into_contents (item_container, insertion_idx,
                                          previous_ending_container,
                                          last_entry_idx, contents_nr);
              remove_slice_from_contents (previous_ending_container,
                                          last_entry_idx, contents_nr);
              document->modified_information |= F_DOCM_tree;
            }
        }
      previous = item;
    }
}

/* ALTIMP Texinfo/ManipulateTreeNonXS.pm */
static ELEMENT_LIST *
move_index_entries_after_items_internal (const char *type,
                                         ELEMENT *current,
                                         void *argument)
{
  if (!(type_data[current->type].flags & TF_text)
      && (current->e.c->cmd == CM_enumerate
          || current->e.c->cmd == CM_itemize))
    {
      DOCUMENT *document = (DOCUMENT *)argument;
      move_selected_element_index_entries_after_items (current, document);
    }
  return 0;
}

/* ALTIMP Texinfo/ManipulateTreeNonXS.pm */
void
move_index_entries_after_items_in_document (DOCUMENT *document)
{
  modify_tree (document->tree, &move_index_entries_after_items_internal,
               document);
}

void
reference_to_arg_in_document (DOCUMENT *document)
{
  reference_to_arg_in_tree (document->tree, document);
}

void
prepend_new_menu_in_node_section (NODE_RELATIONS *node_relations,
                                  ELEMENT *section,
                                  ELEMENT *current_menu)
{
  ELEMENT *empty_line = new_text_element (ET_empty_line);
  if (!node_relations->menus)
    node_relations->menus = new_const_element_list ();

  add_to_element_contents (section, current_menu);
  text_append (empty_line->e.text, "\n");
  add_to_contents_as_array (section, empty_line);

  add_to_const_element_list (node_relations->menus, current_menu);
}

typedef struct EXISTING_ENTRY {
    const char *normalized;
    ELEMENT *menu;
    ELEMENT *entry;
} EXISTING_ENTRY;

static void
complete_node_menu (NODE_RELATIONS *node_relations,
                    int use_sections)
{
  CONST_NODE_RELATIONS_LIST *node_childs
    = get_node_node_childs_from_sectioning (node_relations);

  if (node_childs->number)
    {
      size_t existing_entries_nr = 0;
      size_t existing_entries_space = 5;
      EXISTING_ENTRY *existing_entries = 0;

      ELEMENT_LIST *pending = new_list ();
      ELEMENT *current_menu = 0;

      size_t i;
      const CONST_ELEMENT_LIST *menus = node_relations->menus;

      if (menus)
        {
          existing_entries
           = malloc (existing_entries_space * sizeof (EXISTING_ENTRY));

          for (i = 0; i < menus->number; i++)
            {
              const ELEMENT *menu = menus->list[i];
              size_t j;
              for (j = 0; j < menu->e.c->contents.number; j++)
                {
                  ELEMENT *entry = menu->e.c->contents.list[j];
                  if (entry->type == ET_menu_entry)
                    {
                      const char *normalized_entry_node
                        = normalized_menu_entry_internal_node (entry);
                      if (normalized_entry_node)
                        {
                          if (existing_entries_nr == existing_entries_space)
                            {
                              existing_entries_space += 5;
                              existing_entries = realloc (existing_entries,
                           existing_entries_space * sizeof (EXISTING_ENTRY));
                            }
                          existing_entries[existing_entries_nr].normalized
                            = normalized_entry_node;
                        /* cast to remove the const, as the menu is to be modified */
                          existing_entries[existing_entries_nr].menu = (ELEMENT *)menu;
                          existing_entries[existing_entries_nr].entry = entry;
                          existing_entries_nr++;
                        }
                    }
                }
            }
        }

      for (i = 0; i < node_childs->number; i++)
        {
          const NODE_RELATIONS *node_entry_relations = node_childs->list[i];
          const ELEMENT *node_entry = node_entry_relations->element;
          const char *normalized = lookup_extra_string (node_entry,
                                                        AI_key_identifier);
          if (normalized)
            {
              size_t j;
              ELEMENT *entry = 0;

              for (j = 0; j < existing_entries_nr; j++)
                {
                  if (!strcmp (existing_entries[j].normalized, normalized))
                    {
                      current_menu = existing_entries[j].menu;
                      entry = existing_entries[j].entry;
                      break;
                    }
                }
              if (entry)
                {
                  if (pending->number)
                    {
                      size_t k;
                      for (j = 0; j < current_menu->e.c->contents.number; j++)
                      if (current_menu->e.c->contents.list[j] == entry)
                        break;
                      insert_list_slice_into_contents (current_menu, j,
                                                       pending, 0,
                                                       pending->number);
                      for (k = 0; k < pending->number; k++)
                        pending->list[k]->e.c->parent = current_menu;

                      pending->number = 0;
                    }
                }
              else
                {
                  entry = new_node_menu_entry (node_entry_relations,
                                               use_sections);
             /*
              not set entry should mean an empty node.  We do not warn as
              we try, in general, to be silent in the transformations.
              */
                  if (entry)
                    add_to_element_list (pending, entry);
                }
            }
        }

      if (pending->number)
        {
          size_t j;
          if (!current_menu)
            {
  /* cast to remove const, as the section is modified, with the new menu
     inserted */
              ELEMENT *section
                = (ELEMENT *)node_relations->associated_section->element;
              current_menu = new_command_element (CM_menu);
              insert_list_slice_into_contents (current_menu, 0,
                                               pending, 0,
                                               pending->number);
              current_menu->e.c->parent = section;
              new_block_command (current_menu);
              prepend_new_menu_in_node_section (node_relations, section,
                                                current_menu);
            }
          else
            {
              int offset_at_end = 0;
              const ELEMENT *last_menu_content
                = last_contents_child (current_menu);

              if (!(type_data[last_menu_content->type].flags & TF_text)
                  && last_menu_content->e.c->cmd == CM_end)
                offset_at_end = -1;
              insert_list_slice_into_contents (current_menu,
                                current_menu->e.c->contents.number + offset_at_end,
                                        pending, 0, pending->number);
            }
          for (j = 0; j < pending->number; j++)
            pending->list[j]->e.c->parent = current_menu;

        }

      destroy_list (pending);

      free (existing_entries);
    }
  free (node_childs->list);
  free (node_childs);
}

static NODE_RELATIONS_LIST *
get_non_automatic_nodes_with_sections (const DOCUMENT *document)
{

  NODE_RELATIONS_LIST *non_automatic_nodes = new_node_relations_list ();
  const NODE_RELATIONS_LIST *nodes_list = &document->nodes_list;
  size_t i;

  for (i = 0; i < nodes_list->number; i++)
    {
      NODE_RELATIONS *node_relations = nodes_list->list[i];
      ELEMENT *node_element = node_relations->element;
      if (node_element->e.c->contents.list[0]->e.c->contents.number <= 1
          && node_relations->associated_section)
        {
          add_to_node_relations_list (non_automatic_nodes, node_relations);
        }
    }
  return non_automatic_nodes;
}

/* This should be called after structuring.c sectioning_structure */
void
complete_tree_nodes_menus_in_document (DOCUMENT *document, int use_sections)
{
  NODE_RELATIONS_LIST *non_automatic_nodes
     = get_non_automatic_nodes_with_sections (document);
  size_t i;

  for (i = 0; i < non_automatic_nodes->number; i++)
    {
      NODE_RELATIONS *node_relations = non_automatic_nodes->list[i];
      complete_node_menu (node_relations, use_sections);
      document->modified_information |= F_DOCM_tree | F_DOCM_nodes_list;
    }
  free (non_automatic_nodes->list);
  free (non_automatic_nodes);
}

/* used for tree transformation only */
void
complete_tree_nodes_missing_menu (DOCUMENT *document, int use_sections)
{
  const OPTIONS *options = document->options;
  NODE_RELATIONS_LIST *non_automatic_nodes
     = get_non_automatic_nodes_with_sections (document);
  const LANG_TRANSLATION *lang_translation = 0;
  int debug_level = 0;

  if (options)
    {
      /* document options hold the options set at the command-line
         or in init files set by set_document_options */
      lang_translation = set_preamble_language_commands (
                    &document->global_info.preamble_lang_cmd,
                    &converters_translation_cache,
                    options->documentlanguage.o.string,
                    options->documentscript.o.string,
                    TXI_CONVERT_STRINGS_NR);

      debug_level = options->DEBUG.o.integer;
    }
  size_t i;
  for (i = 0; i < non_automatic_nodes->number; i++)
    {
      NODE_RELATIONS *node_relations = non_automatic_nodes->list[i];
      const CONST_ELEMENT_LIST *menus = node_relations->menus;
      if (!(menus && menus->number > 0))
        {
          const ELEMENT *section
            = node_relations->associated_section->element;
          ELEMENT *current_menu = new_complete_node_menu (node_relations,
                                                 document, lang_translation,
                                                 debug_level, use_sections, 0);
          if (current_menu)
            {
              prepend_new_menu_in_node_section (node_relations,
      /* cast to remove const, as the section is modified, with the new menu
         inserted */
                                                (ELEMENT *)section,
                                                current_menu);
              document->modified_information |= F_DOCM_tree
                                                | F_DOCM_nodes_list;
            }
        }
    }
  free (non_automatic_nodes->list);
  free (non_automatic_nodes);
}

/* used for tree transformation only */
int
regenerate_master_menu (DOCUMENT *document, int use_sections)
{
  const C_HASHMAP *identifiers_target = &document->identifiers_target;
  const NODE_RELATIONS_LIST *nodes_list = &document->nodes_list;

  const ELEMENT *top_node = find_identifier_target (identifiers_target, "Top");
  const CONST_ELEMENT_LIST *menus;
  ELEMENT *new_detailmenu_e;
  ELEMENT *last_menu;
  const ELEMENT *last_content;
  size_t i;
  size_t index;
  const LANG_TRANSLATION *lang_translation = 0;

  if (top_node && (top_node->e.c->cmd == CM_node))
    {
      int status;
      size_t top_node_number
        = lookup_extra_integer (top_node, AI_key_node_number, &status);
      const NODE_RELATIONS *top_node_relations
        = nodes_list->list[top_node_number -1];
      menus = top_node_relations->menus;
      if (!menus || (menus->number <= 0))
        return 0;
    }
  else
    return 0;

  if (document->options)
    lang_translation = set_preamble_language_commands (
                    &document->global_info.preamble_lang_cmd,
                    &converters_translation_cache,
                    document->options->documentlanguage.o.string,
                    document->options->documentscript.o.string,
                    TXI_CONVERT_STRINGS_NR);

  new_detailmenu_e = new_detailmenu (&document->error_messages,
                                    document->options,
                                    lang_translation, identifiers_target,
                                    nodes_list,
                                    menus, use_sections, 0);

  /* no need for a master menu */
  if (!new_detailmenu_e)
    return 0;

  document->modified_information |= F_DOCM_tree;

  for (i = 0; i < menus->number; i++)
    {
      size_t current_idx;
      /* cast to remove const to be able to replace the detailmenu */
      ELEMENT *menu = (ELEMENT *)menus->list[i];
      for (current_idx = 0; current_idx < menu->e.c->contents.number;
           current_idx++)
        {
          /* entry should be one of the menu specific containers, a
             @detailmenu or @end */
          const ELEMENT *entry = menu->e.c->contents.list[current_idx];
          if (entry->e.c->cmd == CM_detailmenu)
            {
              size_t j;
              ELEMENT *removed = remove_from_contents (menu, current_idx);
              /* also replace in global commands */
              replace_remove_list_element (
                                   &document->global_commands.detailmenu,
                                   removed, new_detailmenu_e);
              /* remove internal refs of removed entries */
              for (j = 0; j < removed->e.c->contents.number; j++)
                {
                  const ELEMENT *content = removed->e.c->contents.list[j];
                  if (content->type == ET_menu_entry)
                    {
                      size_t k;
                      for (k = 0; k < content->e.c->contents.number; k++)
                        {
                          const ELEMENT *entry_content
                                  = content->e.c->contents.list[k];
                          if (entry_content->type == ET_menu_entry_node)
                            {
                              const ELEMENT *removed_internal_ref =
                                replace_remove_list_element (
                                        &document->internal_references,
                                                        entry_content, 0);
                              if (removed_internal_ref)
                                document->modified_information
                                            |= F_DOCM_internal_references;
                              else
                                {
                                  char *removed_internal_texi
                                     = convert_to_texinfo (entry_content);
                                  fprintf (stderr,
                                    "BUG: %s: not found in internal refs\n",
                                      removed_internal_texi);
                                  free (removed_internal_texi);
                                }
                            }
                        }
                    }
                }
              destroy_element_and_children (removed);
              insert_into_contents (menu, new_detailmenu_e, current_idx);
              return 1;
            }
        }
    }

  /* cast to remove const, as the detailmenu will be inserted in this menu */
  last_menu = (ELEMENT *)menus->list[menus->number -1];
  index = last_menu->e.c->contents.number;
  last_content = last_contents_child (last_menu);
  /* In a regular setting the last content is @end, but here we also
     allow for a missing @end, including for an empty @menu.  In that
     case last_content could be one of the menu specific containers */
  if (last_content && last_content->e.c->cmd == CM_end)
    index--;

  new_detailmenu_e->e.c->parent = last_menu;

  if (index)
    {
      const ELEMENT *last_element = last_menu->e.c->contents.list[index-1];
      ELEMENT *preformatted = 0;
      if (last_element->type == ET_menu_comment
          && last_element->e.c->contents.number > 0)
        {
          ELEMENT *last_menu_comment_elt = last_contents_child (last_element);
          if (last_menu_comment_elt->type == ET_preformatted)
            preformatted = last_menu_comment_elt;
        }

      if (preformatted)
        {
          ELEMENT *empty_line = new_text_element (ET_empty_line);
          text_append (empty_line->e.text, "\n");
          add_to_contents_as_array (preformatted, empty_line);
        }
      else if (last_element->type == ET_menu_entry)
        {
        /*
        there is a last menu entry, add a menu comment containing an empty line
        after it
         */
          ELEMENT *after_line
              = new_text_element (ET_after_menu_description_line);
          ELEMENT *menu_comment = new_element (ET_menu_comment);
          insert_into_contents (last_menu, menu_comment, index);
          index++;
          preformatted = new_element (ET_preformatted);
          add_to_element_contents (menu_comment, preformatted);
          text_append (after_line->e.text, "\n");
          add_to_contents_as_array (preformatted, after_line);
        }
    }
  /* insert master menu */
  insert_into_contents (last_menu, new_detailmenu_e, index);
  add_to_element_list (&document->global_commands.detailmenu,
                       new_detailmenu_e);
  return 1;
}

ELEMENT_LIST *
protect_hashchar_at_line_beginning_internal (const char *type,
                                             ELEMENT *parent,
                                             void *argument)
{
  size_t i;
  size_t parent_contents_nr;

  if (type_data[parent->type].flags & TF_text
      || parent->e.c->contents.number == 0)
    return 0;

  parent_contents_nr = parent->e.c->contents.number;
  for (i = 0; i < parent_contents_nr; i++)
    {
      ELEMENT *current = parent->e.c->contents.list[i];
      if ((current->type == ET_normal_text || current->type == ET_raw)
           && current->e.text->end > 0)
        {
          char *filename;
          int line_no = 0;
          int status = 0;
          filename = parse_line_directive (current->e.text->text, &status, &line_no);

          if (status)
            {
              if (filename)
                free (filename);

              int do_protect = 0;
              if (i == 0
                  || (i == 1
                      && (parent->e.c->contents.list[0]->type
                                                      == ET_arguments_line
                          || parent->e.c->contents.list[0]->type
                                                == ET_spaces_before_argument)))
                do_protect = 1;
              else
                {
                  ELEMENT *previous = parent->e.c->contents.list[i-1];
                  if (type_data[previous->type].flags & TF_text
                      && previous->e.text->end > 0)
                    {
                      int end = previous->e.text->end;
                      if (previous->e.text->text[end -1] == '\n')
                        do_protect = 1;
                    }
                }
              if (do_protect)
                {
              /* do not actually protect in raw block command, but warn */
                  if (current->type == ET_raw)
                    {
                      ELEMENT *parent_for_warn = parent;
                      while (parent_for_warn)
                        {
                          if (parent_for_warn->e.c->cmd
                              && parent_for_warn->e.c->source_info.line_nr)
                            {
                              DOCUMENT *document = (DOCUMENT *) argument;
                              const OPTIONS *options = document->options;

                              message_list_command_warn (
                                &document->error_messages,
                                (options && options->DEBUG.o.integer > 0),
                                parent_for_warn, 0,
                                "could not protect hash character in @%s",
                              builtin_command_name (parent_for_warn->e.c->cmd));
                              break;
                            }
                          parent_for_warn = parent_for_warn->e.c->parent;
                        }
                    }
                  else
                    {
                      char *current_text = strdup (current->e.text->text);
                      char *p = current_text;
                      size_t leading_spaces_nr;
                      ELEMENT *leading_spaces
                           = new_text_element (ET_normal_text);
                      ELEMENT *hashchar = new_command_element (CM_hashchar);
                      ELEMENT *arg = new_element (ET_brace_container);
                      /* count UTF-8 encoded Unicode characters for
                         source marks locations */
                      uint8_t *u8_text = 0;
                      size_t current_position;
                      const uint8_t *u8_p;
                      size_t u8_len;
                      SOURCE_MARK_LIST *source_mark_list;

                      if (current->source_mark_list)
                        {
                          source_mark_list = current->source_mark_list;
                          current->source_mark_list = 0;

                          u8_text = utf8_from_string (p);
                          u8_p = u8_text;

                          current_position = 0;
                        }

                      /* NOTE not exactly the perl code, but use similar
                         code as line directive parsing so should be ok */

                      leading_spaces_nr = strspn (p, " \t");
                      if (leading_spaces_nr)
                        {
                          p += leading_spaces_nr;
                          *p = '\0'; /* as a side note, it replaces the # */
                          text_append (leading_spaces->e.text, current_text);
                        }

                      if (u8_text)
                        {
                          u8_len = u8_mbsnlen (u8_p, leading_spaces_nr);
                          u8_p += u8_len;

                          current_position
                            = relocate_source_marks (source_mark_list,
                                                     leading_spaces,
                                                 current_position, u8_len);
                        }

                      if (leading_spaces_nr
                          || leading_spaces->source_mark_list)
                        {
                          insert_into_contents_as_array (parent,
                                                         leading_spaces, i);
                          parent_contents_nr++;
                          i++;
                        }
                      else
                        destroy_element (leading_spaces);

                      /* advance past # */
                      p++;

                      hashchar->e.c->parent = parent;
                      add_to_element_contents (hashchar, arg);

                      insert_into_contents (parent, hashchar, i);
                      parent_contents_nr++;
                      i++;

                      if (u8_text)
                        {
                          u8_len = u8_mbsnlen (u8_p, 1);
                          u8_p += u8_len;

                          current_position
                            = relocate_source_marks (source_mark_list,
                                                     hashchar,
                                                 current_position, u8_len);
                        }

                      text_reset (current->e.text);
                      text_append (current->e.text, p);
                      free (current_text);

                      if (u8_text)
                        {
                          /* relocate all the remaining source marks */
                          u8_len = u8_mbsnlen (u8_p, u8_strlen (u8_p));
                          u8_p += u8_len;

                          current_position
                            = relocate_source_marks (source_mark_list,
                                      current, current_position, u8_len);

                          free (source_mark_list->list);
                          free (source_mark_list);
                          free (u8_text);
                        }
                    }
                }
            }
        }
    }
  return 0;
}

/* NOTE in perl there is a customization_information, but here we use the
   document both for error registration and customization */
ELEMENT *
protect_hashchar_at_line_beginning (ELEMENT *tree, DOCUMENT *document)
{
  return modify_tree (tree, &protect_hashchar_at_line_beginning_internal,
                      (void *) document);
}

void
protect_hashchar_at_line_beginning_in_document (DOCUMENT *document)
{
  protect_hashchar_at_line_beginning (document->tree, document);
  document->modified_information |= F_DOCM_tree;
}

ELEMENT_LIST *
protect_first_parenthesis_in_targets_internal (const char *type,
                                               ELEMENT *current,
                                               void *argument)
{
  ELEMENT *element_label;
  if (type_data[current->type].flags & TF_text)
    return 0;

  element_label = get_label_element (current);
  if (element_label)
    protect_first_parenthesis (element_label);
  return 0;
}

void
protect_first_parenthesis_in_targets (ELEMENT *tree)
{
  modify_tree (tree, &protect_first_parenthesis_in_targets_internal, 0);
}

void
protect_first_parenthesis_in_targets_in_document (DOCUMENT *document)
{
  protect_first_parenthesis_in_targets (document->tree);
  document->modified_information |= F_DOCM_tree;
}

/* ALTIMP in texi2any.pl */
/* call all the structuring/transformations typically done for a document.
   FLAGS select the structure/transformations called.  If FORMAT_MENU is set
   the structure functions related to menus are called.
   No implementation in Perl as a function, as the modules are loaded on
   demand, which makes it impossible to implement as a function.

   Only called from C.
*/
void
complete_transform_document (DOCUMENT *document, unsigned long flags,
                             int format_menu, int auto_section_node,
                             int warn_duplicate_section_target,
                             const char *commands_heading_texi)
{
  int use_sections = (flags & STTF_complete_menus_use_sections);

  if (flags & STTF_fill_gaps_in_sectioning)
    fill_gaps_in_sectioning_in_document (document,
                                         commands_heading_texi);

  if (flags & STTF_relate_index_entries_to_table_items)
    relate_index_entries_to_table_items_in_document (document);

  if (flags & STTF_move_index_entries_after_items)
    move_index_entries_after_items_in_document (document);

  sectioning_structure (document);

  if (auto_section_node > 0)
    insert_nodes_for_sectioning_commands (document,
                                          warn_duplicate_section_target);

  if (flags & STTF_warn_multiple_node_descriptions)
    warn_multiple_node_descriptions (document);

  sectioning_targets (document, warn_duplicate_section_target);

  associate_internal_references (document);

  if (!(flags & STTF_no_warn_non_empty_parts))
    warn_non_empty_parts (document);

  if (flags & STTF_complete_tree_nodes_menus)
    complete_tree_nodes_menus_in_document (document, use_sections);

  if (flags & STTF_complete_tree_nodes_missing_menu)
    complete_tree_nodes_missing_menu (document, use_sections);

  if (flags & STTF_regenerate_master_menu)
    regenerate_master_menu (document, use_sections);

  if (flags & STTF_nodes_tree)
    {
      construct_nodes_tree (document);

      if (format_menu)
        {
          check_node_tree_menu_structure (document);
          complete_node_tree_with_menus (document);
          check_nodes_are_referenced (document);
        }
    }

  if (flags & STTF_floats)
    number_floats (document);
}

