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

/* corresponds to Texinfo::Structuring code related to output units and
   used in converters */

#include <config.h>

#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <inttypes.h>

#include "text.h"
#include "command_ids.h"
#include "element_types.h"
#include "tree_types.h"
#include "document_types.h"
#include "list_macros.h"
/* for fatal */
#include "base_utils.h"
#include "tree.h"
#include "builtin_commands.h"
#include "extra.h"
#include "command_stack.h"
/* for xasprintf */
#include "utils.h"
#include "debug.h"
#include "errors.h"
#include "targets.h"
#include "manipulate_tree.h"
#include "convert_to_texinfo.h"
#include "api_to_perl.h"
#include "output_unit.h"

const char *relative_unit_direction_name[] = {
  #define rud_type(name) #name,
   RUD_DIRECTIONS_TYPES_LIST
   RUD_FILE_DIRECTIONS_TYPES
  #undef rud_type
  #define rud_type(name) "FirstInFile" #name,
   RUD_DIRECTIONS_TYPES_LIST
  #undef rud_type
};


OUTPUT_UNIT_LIST *
retrieve_output_units (const DOCUMENT *document, size_t output_units_descriptor)
{
  const OUTPUT_UNIT_LISTS *output_units_lists = &document->output_units_lists;

  /* the list can still be uninitialized and .list be 0 */
  if (output_units_descriptor > 0
      && output_units_descriptor <= output_units_lists->number)
    return &output_units_lists->output_units_lists[output_units_descriptor -1];
  return 0;
}

static void
reallocate_output_unit_list (OUTPUT_UNIT_LIST *list)
{
  if (list->number >= list->space)
    {
      list->space += 10;
      list->list = realloc (list->list, list->space * sizeof (OUTPUT_UNIT *));
      if (!list->list)
        fatal ("realloc failed");
    }
}

/* descriptor starts at 1, 0 is an error */
size_t
new_output_units_descriptor (DOCUMENT *document)
{
  size_t output_units_index;
  int slot_found = 0;
  size_t i;
  OUTPUT_UNIT_LISTS *output_units_lists = &document->output_units_lists;

  for (i = 0; i < output_units_lists->number; i++)
    {
      if (output_units_lists->output_units_lists[i].list == 0)
        {
          slot_found = 1;
          output_units_index = i;
        }
    }
  if (!slot_found)
    {
      if (output_units_lists->number == output_units_lists->space)
        {
          output_units_lists->output_units_lists
              = realloc (output_units_lists->output_units_lists,
                  (output_units_lists->space += 1) * sizeof (OUTPUT_UNIT_LIST));
          if (!output_units_lists->output_units_lists)
            fatal ("realloc failed");
        }
      output_units_index = output_units_lists->number;
      output_units_lists->number++;
    }

  memset (&output_units_lists->output_units_lists[output_units_index],
          0, sizeof (OUTPUT_UNIT_LIST));

  /* immediately allocate, even if the list will remain empty, such
     that the slot is reserved */
  reallocate_output_unit_list
       (&output_units_lists->output_units_lists[output_units_index]);

  /*
  fprintf (stderr, "Register output units (%d): %d\n", slot_found,
                                                       output_units_index);
   */

  return output_units_index +1;
}

OUTPUT_UNIT *
new_output_unit (enum output_unit_type unit_type)
{
  OUTPUT_UNIT *output_unit = (OUTPUT_UNIT *) malloc (sizeof (OUTPUT_UNIT));
  memset (output_unit, 0, sizeof (OUTPUT_UNIT));
  output_unit->unit_type = unit_type;
  return output_unit;
}

void
add_to_output_unit_list (OUTPUT_UNIT_LIST *list, OUTPUT_UNIT *output_unit)
{
  reallocate_output_unit_list (list);
  list->list[list->number] = output_unit;
  output_unit->index = list->number;
  list->number++;
}

void
split_by_node (DOCUMENT *document, OUTPUT_UNIT_LIST *output_units)
{
  const ELEMENT *root = document->tree;
  OUTPUT_UNIT *current = new_output_unit (OU_unit);
  ELEMENT_LIST *pending_parts = new_list ();
  size_t i;

  add_to_output_unit_list (output_units, current);

  if (root->e.c->contents.number > 0)
    document->modified_information |= F_DOCM_tree;

  for (i = 0; i < root->e.c->contents.number; i++)
    {
      ELEMENT *content = root->e.c->contents.list[i];
      enum command_id data_cmd = element_builtin_data_cmd (content);

      if (data_cmd == CM_part)
        {
          add_to_element_list (pending_parts, content);
          continue;
        }
      if (data_cmd == CM_node)
        {
          const char *normalized
            = lookup_extra_string (content, AI_key_identifier);

          if (normalized)
            {
              int status;
              size_t node_number
                = lookup_extra_integer (content,
                                        AI_key_node_number, &status);

              const NODE_RELATIONS *node_relations
                = document->nodes_list.list[node_number -1];

              if (!current->uc.unit_command)
                current->uc.unit_command = content;
              else
                {
                  OUTPUT_UNIT *last
                    = output_units->list[output_units->number -1];
                  current = new_output_unit (OU_unit);
                  current->uc.unit_command = content;
                  current->tree_unit_directions[D_prev] = last;
                  last->tree_unit_directions[D_next] = current;
                  add_to_output_unit_list (output_units, current);
                }
              current->unit_node = node_relations;
              if (node_relations->associated_section)
                current->unit_section = node_relations->associated_section;
            }
        }
      if (pending_parts->number > 0)
        {
          size_t j;
          for (j = 0; j < pending_parts->number; j++)
            {
              ELEMENT *part = pending_parts->list[j];
              add_to_element_list (&current->unit_contents, part);
              part->e.c->associated_unit = current;
            }
          pending_parts->number = 0;
        }
      add_to_element_list (&current->unit_contents, content);
      content->e.c->associated_unit = current;
    }

  if (pending_parts->number > 0)
    {
      size_t j;
      for (j = 0; j < pending_parts->number; j++)
        {
          ELEMENT *part = pending_parts->list[j];
          add_to_element_list (&current->unit_contents, part);
          part->e.c->associated_unit = current;
        }
      pending_parts->number = 0;
    }

  destroy_list (pending_parts);
}

/* in addition to splitting, register the output_units list */
size_t
register_split_by_node (DOCUMENT *document)
{
  size_t output_units_descriptor = new_output_units_descriptor (document);
  OUTPUT_UNIT_LIST *output_units
    = retrieve_output_units (document, output_units_descriptor);
  split_by_node (document, output_units);
  return output_units_descriptor;
}

void
split_by_section (DOCUMENT *document, OUTPUT_UNIT_LIST *output_units)
{
  const ELEMENT *root = document->tree;
  OUTPUT_UNIT *current = new_output_unit (OU_unit);
  size_t i;

  if (root->e.c->contents.number > 0)
    document->modified_information |= F_DOCM_tree;

  add_to_output_unit_list (output_units, current);

  for (i = 0; i < root->e.c->contents.number; i++)
    {
      int status;

      ELEMENT *content = root->e.c->contents.list[i];
      enum command_id data_cmd = element_builtin_data_cmd (content);
      unsigned long flags = command_data[data_cmd].flags;
      const NODE_RELATIONS *node_relations = 0;
      const SECTION_RELATIONS *new_section_relations = 0;

      if (data_cmd == CM_node)
        {
          size_t node_number
                = lookup_extra_integer (content,
                                        AI_key_node_number, &status);
          if (node_number)
            {
              node_relations
                = document->nodes_list.list[node_number -1];

              if (node_relations->associated_section)
                new_section_relations = node_relations->associated_section;
            }
        }
      else if (flags & CF_root)
        {
          size_t section_number
            = lookup_extra_integer (content,
                                    AI_key_section_number, &status);
          const SECTION_RELATIONS *section_relations
            = document->sections_list.list[section_number -1];

          if (data_cmd == CM_part)
            {
              if (section_relations->part_associated_section)
                new_section_relations
                  = section_relations->part_associated_section;
            }
          if (!new_section_relations)
            new_section_relations = section_relations;

          if (new_section_relations->associated_node)
            node_relations = new_section_relations->associated_node;
        }
      if (new_section_relations)
        {
          if (!current->uc.unit_command)
            {
              current->uc.unit_command = new_section_relations->element;
              current->unit_section = new_section_relations;
              if (node_relations)
                current->unit_node = node_relations;
            }
          else if (new_section_relations != current->unit_section)
            {
              OUTPUT_UNIT *last = output_units->list[output_units->number -1];
              current = new_output_unit (OU_unit);
              current->uc.unit_command = new_section_relations->element;
              current->unit_section = new_section_relations;
              if (node_relations)
                current->unit_node = node_relations;
              current->tree_unit_directions[D_prev] = last;
              last->tree_unit_directions[D_next] = current;
              add_to_output_unit_list (output_units, current);
            }
        }

      add_to_element_list (&current->unit_contents, content);
      content->e.c->associated_unit = current;
    }
}

/* in addition to splitting, register the output_units list */
size_t
register_split_by_section (DOCUMENT *document)
{
  size_t output_units_descriptor = new_output_units_descriptor (document);
  OUTPUT_UNIT_LIST *output_units
    = retrieve_output_units (document, output_units_descriptor);
  split_by_section (document, output_units);
  return output_units_descriptor;
}

int
unsplit (DOCUMENT *document)
{
  const ELEMENT *root = document->tree;
  int unsplit_needed = 0;
  size_t i;

  if (root->e.c->contents.number <= 0)
    return 0;

  for (i = 0; i < root->e.c->contents.number; i++)
    {
      ELEMENT *content = root->e.c->contents.list[i];
      if (content->e.c->associated_unit)
        {
          content->e.c->associated_unit = 0;
          unsplit_needed = 1;
        }
    }

  if (unsplit_needed)
    document->modified_information |= F_DOCM_tree;

  return unsplit_needed;
}

void
destroy_output_unit (OUTPUT_UNIT *output_unit)
{
  /* need to destroy elements associated with special output units
     as they are not in the document Texinfo tree */
  if (output_unit->special_unit_variety)
    destroy_element (output_unit->uc.special_unit_command);
  else if (output_unit->unit_contents.number)
    {
      size_t i;
      for (i = 0; i < output_unit->unit_contents.number; i++)
        {
          ELEMENT *element = output_unit->unit_contents.list[i];
          if (element->e.c->associated_unit
              && element->e.c->associated_unit == output_unit)
            element->e.c->associated_unit = 0;
        }
    }
  free (output_unit->unit_contents.list);
  free (output_unit->unit_filename);
  if (output_unit->hv)
    {
      ERROR_MESSAGE_LIST *error_messages = 0;
      unregister_perl_data (output_unit->hv);

      error_messages = get_check_element_interpreter_refcount ();
      if (error_messages)
        {
       /* for debugging */
  /* For this check to be silent, the output units should have gone
     through codes, release_output_units_list in Perl or similar in Perl C,
     that removes the directions and other keys that lead to cycles,
     and also through codes that remove other references to output units,
     typically when releasing conversion data.  This is only done if
     TEST > 1 in the main program, but set_check_element_interpreter_refcount,
     and therefore this code is also only called in that case.
   */
          int hv_refcount = get_refcount (output_unit->hv);
            /*
          if (1)
             */
          if (hv_refcount != 0)
            {
              const char *msg = "DEBUG Output unit refcounts %p: %d\n";
              fprintf (stderr, msg,
                       output_unit->hv, hv_refcount);
              message_list_document_warn_no_xlate (error_messages, 0, 0, msg,
                       output_unit->hv, hv_refcount);
            }
        }
    }
  free (output_unit);
}

void
free_output_unit_list (OUTPUT_UNIT_LIST *output_units_list)
{
  size_t i;

  for (i = 0; i < output_units_list->number; i++)
    {
      destroy_output_unit (output_units_list->list[i]);
    }
  free (output_units_list->list);
  memset (output_units_list, 0, sizeof (OUTPUT_UNIT_LIST));
}

void
free_output_units_lists (OUTPUT_UNIT_LISTS *output_units_lists)
{
  size_t i;

  for (i = 0; i < output_units_lists->number; i++)
    {
      OUTPUT_UNIT_LIST *output_units_list
         = &output_units_lists->output_units_lists[i];
      free_output_unit_list (output_units_list);
    }
  free (output_units_lists->output_units_lists);
  memset (output_units_lists, 0, sizeof (OUTPUT_UNIT_LISTS));
}


typedef struct LEVEL_SPLIT_STRING {
    int level;
    char *split;
} LEVEL_SPLIT_STRING;

static LEVEL_SPLIT_STRING split_level_table[3] = {
 {-1, "node"},
 {1, "chapter"},
 {2, "section"}
};

/*
 Associate top-level units with pages according to the splitting
 specification.  Set 'first_in_page' on each unit to the unit
 that is the first in the output page.
 */
void
split_pages (OUTPUT_UNIT_LIST *output_units,
             const NODE_RELATIONS_LIST *nodes_list, const char *split)
{
  int split_level = -2;
  int i;
  size_t j;
  OUTPUT_UNIT *current_first_in_page = 0;

  if (!output_units || !output_units->number)
    return;

  if (!split || !strlen (split))
    {
      for (j = 0; j < output_units->number; j++)
        {
          OUTPUT_UNIT *output_unit = output_units->list[j];
          output_unit->first_in_page = output_units->list[0];
        }
      return;
    }

  for (i = 0; i < 3; i++)
    {
      if (!strcmp (split, split_level_table[i].split))
        {
          split_level = split_level_table[i].level;
          break;
        }
    }
  if (split_level == -2)
    {
      fprintf (stderr, "Unknown split specification: %s\n", split);
      split_level = -1; /* split by node */
    }

  for (j = 0; j < output_units->number; j++)
    {
      OUTPUT_UNIT *output_unit = output_units->list[j];
      int level = -3;
      if (output_unit->unit_section)
        {
          int status;
          level = lookup_extra_integer (output_unit->unit_section->element,
                                        AI_key_section_level, &status);
          if (status < 0)
            level = -3;
        }
      if ((split_level == -1) || (level != -3 && split_level >= level)
          || !current_first_in_page)
        current_first_in_page = output_unit;

      output_unit->first_in_page = current_first_in_page;
    }
}

/* return to be freed by the caller */
char *
output_unit_texi (const OUTPUT_UNIT *output_unit)
{
  const ELEMENT *unit_command;

  if (!output_unit)
    return strdup ("UNDEF OUTPUT UNIT");

  if (output_unit->unit_type == OU_external_node_unit)
    {
      char *result;
      char *reference_texi
       = convert_contents_to_texinfo (output_unit->uc.unit_command);
      xasprintf (&result, "_EXT_NODE: %s", reference_texi);
      free (reference_texi);
      return result;
    }
  else if (output_unit->unit_type == OU_special_unit)
    {
      char *result;
      xasprintf (&result, "_SPECIAL_UNIT: %s",
                          output_unit->special_unit_variety);
      return result;
    }

  unit_command = output_unit->uc.unit_command;
  if (!unit_command)
    {
    /* happens when there are only nodes and sections are used as elements */
      char *result;
      xasprintf (&result, "No associated command (type %s)",
                 output_unit_type_names[output_unit->unit_type]);
      return result;
    }

  return root_heading_command_to_texinfo (unit_command);
}

static OUTPUT_UNIT *
label_target_unit_element (const ELEMENT *label,
                           OUTPUT_UNIT_LIST *external_node_target_units)
{
  const INTEGER_LIST *manual_content
    = lookup_extra_integer_list (label, AI_key_manual_content);
  if (manual_content)
    {
  /* setup an output_unit for consistency with regular output units */
      OUTPUT_UNIT *external_node_unit
        = new_output_unit (OU_external_node_unit);
      external_node_unit->uc.unit_command = label;
      add_to_output_unit_list (external_node_target_units,
                               external_node_unit);
      return external_node_unit;
    }
  else if (label->e.c->cmd == CM_node)
    return label->e.c->associated_unit;
  else
 /* case of a @float or an @*anchor, no target element defined at this stage */
    return 0;
}

/* Used for debugging and possibly in test suite, but not generally
   useful. Not documented in pod section as it should not, in
   general, be used. */
char *
print_output_unit_directions (const OUTPUT_UNIT *output_unit)
{
  TEXT result;
  int i;
  int with_direction = 0;
  char *output_unit_text = output_unit_texi (output_unit);

  text_init (&result);
  text_printf (&result, "output unit: %s\n", output_unit_text);
  free (output_unit_text);

  for (i = 0; i < RUD_type_FirstInFileNodeBack+1; i++)
    {
      const OUTPUT_UNIT *direction = output_unit->directions[i];
      if (direction)
        {
          char *direction_text = output_unit_texi (direction);
          text_printf (&result, "  %s: %s\n", relative_unit_direction_name[i],
                       direction_text);
          free (direction_text);
          with_direction++;
        }
    }
  if (!with_direction)
    text_append (&result, "  NO DIRECTION\n");

  return result.text;
}


static enum relative_unit_direction_type node_unit_directions[]
                       = {RUD_type_NodeNext,
                          RUD_type_NodePrev,
                          RUD_type_NodeUp};

static enum relative_unit_direction_type section_unit_directions[]
                       = {RUD_type_Next,
                          RUD_type_Prev,
                          RUD_type_Up};

/* Do output units directions (like in texi2html) and store them
   in 'directions'.
   The directions are only created if pointing to other output units.
 */
void
units_directions (const C_HASHMAP *identifiers_target,
                  const NODE_RELATIONS_LIST *nodes_list,
                  OUTPUT_UNIT_LIST *output_units,
                  OUTPUT_UNIT_LIST *external_node_target_units,
                  int print_debug)
{
  size_t i;
  CONST_ELEMENT_LIST up_list;
  const ELEMENT *top_node = 0;
  const ELEMENT *top_target_element;

  if (!output_units || !output_units->number)
    return;

  memset (&up_list, 0, sizeof (CONST_ELEMENT_LIST));

  top_target_element = find_identifier_target (identifiers_target, "Top");
  if (top_target_element && top_target_element->e.c->cmd == CM_node)
    top_node = top_target_element;

  for (i = 0; i < output_units->number; i++)
    {
      OUTPUT_UNIT *output_unit = output_units->list[i];
      const OUTPUT_UNIT **directions = output_unit->directions;
      const ELEMENT * const *node_directions;

      directions[RUD_type_This] = output_unit;
      if (output_unit->tree_unit_directions[D_next]
          && output_unit->tree_unit_directions[D_next]->unit_type == OU_unit)
        directions[RUD_type_Forward]
          = output_unit->tree_unit_directions[D_next];
      if (output_unit->tree_unit_directions[D_prev]
          && output_unit->tree_unit_directions[D_prev]->unit_type == OU_unit)
        directions[RUD_type_Back]
          = output_unit->tree_unit_directions[D_prev];

      if (output_unit->unit_node)
        {
          const NODE_RELATIONS *node_relations = output_unit->unit_node;
          const ELEMENT *node = node_relations->element;
          const ELEMENT *menu_child
           = first_menu_node (node_relations, identifiers_target);
          enum directions d;
          node_directions = node_relations->node_directions;
          if (node_directions)
            {
              for (d = 0; d < directions_length; d++)
                {
                  const ELEMENT *node_direction = node_directions[d];
                  if (node_direction)
                    directions[node_unit_directions[d]]
                      = label_target_unit_element (node_direction,
                                                   external_node_target_units);
                }
            }
     /*  Now do NodeForward which is something like the following node. */
          if (menu_child)
            {
              directions[RUD_type_NodeForward]
                = label_target_unit_element (menu_child,
                                             external_node_target_units);
            }
          else
            {
              const ELEMENT *argument = node->e.c->contents.list[0];
              int automatic_directions = (argument->e.c->contents.number <= 1);
              const SECTION_RELATIONS_LIST *section_children = 0;
              if (node_relations->associated_section)
                {
                  const SECTION_RELATIONS *associated_relations
                    = node_relations->associated_section;
                  section_children = associated_relations->section_children;
                }

              if (automatic_directions
                  && section_children && section_children->number > 0)
                {
                  directions[RUD_type_NodeForward]
                   = section_children->list[0]->element->e.c->associated_unit;
                }
              else if (node_directions
                       && node_directions[D_next])
               directions[RUD_type_NodeForward]
                 = label_target_unit_element (
                         node_directions[D_next],
                         external_node_target_units);
              else if (node_directions && node_directions[D_up])
                {
                  const ELEMENT *up = node_directions[D_up];
                  add_(const_element) (&up_list, node);
                  while (1)
                    {
                      size_t i;
                      int status;
                      size_t up_node_number;
                      const NODE_RELATIONS *up_node_relations = 0;

                      int in_up = 0;
                      for (i = 0; i < up_list.number; i++)
                        if (up == up_list.list[i])
                          {
                            in_up = 1;
                            break;
                          }
                      if (in_up || (top_node && top_node == up))
                        break;

                      if (up->e.c->cmd == CM_node)
                        {
                          up_node_number
                            = lookup_extra_integer (up,
                                           AI_key_node_number, &status);

                          up_node_relations
                            = nodes_list->list[up_node_number -1];
                      }
                      if (up_node_relations
                          && up_node_relations->node_directions
                          && up_node_relations->node_directions[D_next])
                        {
                           directions[RUD_type_NodeForward]
                             = label_target_unit_element (
                                up_node_relations->node_directions[D_next],
                                   external_node_target_units);
                           break;
                        }
                      add_(const_element) (&up_list, up);
                      if (up_node_relations
                          && up_node_relations->node_directions
                          && up_node_relations->node_directions[D_up])
                        up = up_node_relations->node_directions[D_up];
                      else
                        break;
                    }
                  up_list.number = 0;
                }
            }
          if (directions[RUD_type_NodeForward]
              && directions[RUD_type_NodeForward]->unit_type == OU_unit
              && !directions[RUD_type_NodeForward]
                              ->directions[RUD_type_NodeBack])
            {
             /* to modify the NodeForward element direction, we remove
                the const by casting */
              OUTPUT_UNIT *forward_unit
                = (OUTPUT_UNIT *)directions[RUD_type_NodeForward];
              forward_unit->directions[RUD_type_NodeBack] = output_unit;
            }
        }
      if (! output_unit->unit_section)
        {
  /* If there is no associated section, find the previous element section.
     Use the FastForward of this element.
     Use it as FastBack if the section is top level, or use the FastBack. */
          OUTPUT_UNIT *section_output_unit = 0;
          OUTPUT_UNIT *current_unit = output_unit;
          while (current_unit->tree_unit_directions[D_prev])
            {
              current_unit = current_unit->tree_unit_directions[D_prev];
              if (current_unit->unit_section)
                {
                  section_output_unit = current_unit;
                  break;
                }
            }
          if (section_output_unit)
            {
              const ELEMENT *section = current_unit->unit_section->element;
              int section_level;
              int status;

              if (section_output_unit->directions[RUD_type_FastForward])
                directions[RUD_type_FastForward]
                 = section_output_unit->directions[RUD_type_FastForward];
              section_level = lookup_extra_integer (section,
                                         AI_key_section_level, &status);
              /* status should always be ok */
              if (status >= 0 && section_level <= 1)
                directions[RUD_type_FastBack] = section_output_unit;
              else if (section_output_unit->directions[RUD_type_FastBack])
                directions[RUD_type_FastBack]
                  = section_output_unit->directions[RUD_type_FastBack];
            }
        }
      else
        {
          int status;

          const SECTION_RELATIONS *section_relations
            = output_unit->unit_section;
          const ELEMENT *section = section_relations->element;

          enum directions d;
          const SECTION_RELATIONS * const *section_directions
                        = section_relations->section_directions;

          const SECTION_RELATIONS_LIST *up_section_children;
          int up_section_level;
          const SECTION_RELATIONS *up_relations
            = section_relations;
          const ELEMENT *up = section;

          if (section_directions)
            {
              for (d = 0; d < directions_length; d++)
                {
            /* in most cases $section_directions
                       ->{$direction->[1]}
                              ->{'associated_unit'} is defined
              but it may not be the case for the up of @top.
              The section may be its own up in cases like
               @part part
               @chapter chapter
             in that cas the direction is not set up */
                  if (section_directions[d]
                      && section_directions[d]->element->e.c->associated_unit
                      && (!section->e.c->associated_unit
                          || section->e.c->associated_unit
                     != section_directions[d]->element->e.c->associated_unit))
                  directions[section_unit_directions[d]]
                    = section_directions[d]->element->e.c->associated_unit;
                }
            }

     /* fastforward is the next element on same level than the upper parent
        element. */
          while (1)
            {
              up_section_level
                = lookup_extra_integer (up, AI_key_section_level, &status);

              if (status >= 0 && up_section_level > 1
                  && up_relations->section_directions
                  && up_relations->section_directions[D_up])
                {
                  up_relations = up_relations->section_directions[D_up];
                  up = up_relations->element;
                }
              else
                break;
            }

          up_section_children = up_relations->section_children;
          if (status >= 0 && up_section_level < 1
              && up->e.c->cmd == CM_top && up_section_children
              && up_section_children->number > 0)
            {
              directions[RUD_type_FastForward]
                = up_section_children->list[0]->element->e.c->associated_unit;
            }
          else
            {
              if (up_relations->toplevel_directions
                  && up_relations->toplevel_directions[D_next])
                directions[RUD_type_FastForward]
                  = up_relations->toplevel_directions[D_next]
                                ->element->e.c->associated_unit;
              else
                {
                  if (up_relations->section_directions
                      && up_relations->section_directions[D_next])
                    directions[RUD_type_FastForward]
                      = up_relations->section_directions[D_next]
                                     ->element->e.c->associated_unit;
                }
            }

         /* if the element isn't at the highest level, fastback is the
            highest parent element */
          if (up && up != section && up->e.c->associated_unit)
            directions[RUD_type_FastBack] = up->e.c->associated_unit;
          else
            {
              int status;
              int section_level
                = lookup_extra_integer (section, AI_key_section_level, &status);

              if (status >= 0 && section_level <= 1
                  && directions[RUD_type_FastForward])
                {
                 /* the element is a top level element, we adjust the next
                    toplevel element fastback */
                 /* to modify the FastForward element direction, we remove
                    the const by casting */
                  OUTPUT_UNIT *fastf_unit
                     = (OUTPUT_UNIT *)directions[RUD_type_FastForward];
                  fastf_unit->directions[RUD_type_FastBack] = output_unit;
                }
            }
        }
    }
  free (up_list.list);
  if (print_debug > 0)
    {
      size_t i;
      for (i = 0; i < output_units->number; i++)
        {
          const OUTPUT_UNIT *output_unit = output_units->list[i];
          char *element_directions
                            = print_output_unit_directions (output_unit);
          fprintf (stderr, "Directions: %s\n", element_directions);
          free (element_directions);
        }
    }
}

void
units_file_directions (OUTPUT_UNIT_LIST *output_units)
{
  size_t i;
  char *current_filename = 0;
  OUTPUT_UNIT *first_unit_in_file = 0;

  if (!output_units || !output_units->number)
    return;

  for (i = 0; i < output_units->number; i++)
    {
      OUTPUT_UNIT *output_unit = output_units->list[i];

      if (output_unit->unit_filename)
        {
          char *filename = output_unit->unit_filename;
          OUTPUT_UNIT *current_output_unit = output_unit;

          if (!current_filename || strcmp (filename, current_filename))
            {
              first_unit_in_file = output_unit;
              current_filename = filename;
            }

          while (1)
            {
              if (current_output_unit->tree_unit_directions[D_prev])
                {
                  current_output_unit
                   = current_output_unit->tree_unit_directions[D_prev];
                  if (current_output_unit->unit_filename)
                    {
                      if (strcmp (current_output_unit->unit_filename, filename))
                        {
                          output_unit->directions[RUD_type_PrevFile]
                            = current_output_unit;
                          break;
                        }
                    }
                  else
                    break;
                }
              else
                break;
            }
          current_output_unit = output_unit;
          while (1)
            {
              if (current_output_unit->tree_unit_directions[D_next])
                {
                  current_output_unit
                   = current_output_unit->tree_unit_directions[D_next];
                  if (current_output_unit->unit_filename)
                    {
                      if (strcmp (current_output_unit->unit_filename, filename))
                        {
                          output_unit->directions[RUD_type_NextFile]
                            = current_output_unit;
                          break;
                        }
                    }
                  else
                    break;
                }
              else
                break;

            }
        }
     /* set the directions of the first elements in file, to
        be used in footers for example */
      if (first_unit_in_file)
        {
          memcpy (&output_unit->directions[RUD_type_FirstInFileThis],
                  &first_unit_in_file->directions[RUD_type_This],
                  (RUD_type_NodeBack - RUD_type_This +1) * sizeof (OUTPUT_UNIT *));
        }
    }
}



/* called for tests.  (From Perl only as tests are in Perl) */
void
do_units_directions_pages (DOCUMENT *document,
                           enum units_split_type units_split,
                           const char *split_pages_string, int debug)
{
  size_t output_units_descriptor = 0;
  OUTPUT_UNIT_LIST *output_units = 0;

  if (units_split == UST_node)
    output_units_descriptor = register_split_by_node (document);
  else if (units_split == UST_section)
    output_units_descriptor = register_split_by_section (document);

  if (output_units_descriptor)
    {
      OUTPUT_UNIT_LIST *external_node_target_units;
      size_t external_nodes_units_descriptor
        = new_output_units_descriptor (document);

      /* Note that we may overwrite previous descriptors.  Since this code
         is only used from tests and called once per test max, this should
         not be an issue */
      document->output_units_descriptors[OUDT_units] = output_units_descriptor;
      document->output_units_descriptors[OUDT_external_nodes_units]
       = external_nodes_units_descriptor;

      output_units = retrieve_output_units (document, output_units_descriptor);
      external_node_target_units = retrieve_output_units (document,
                                           external_nodes_units_descriptor);

      units_directions (&document->identifiers_target,
                        &document->nodes_list,
                        output_units,
                        external_node_target_units, debug);

      if (split_pages_string)
        split_pages (output_units, &document->nodes_list, split_pages_string);
    }
}



static char *
output_unit_name_string (const OUTPUT_UNIT *output_unit)
{
  char *output_unit_name;
  if (output_unit->unit_type == OU_unit)
    xasprintf (&output_unit_name, "[U%zu]", output_unit->index);
  else if (output_unit->unit_type == OU_external_node_unit)
    output_unit_name
     = convert_contents_to_texinfo (output_unit->uc.unit_command);
  else if (output_unit->unit_type == OU_special_unit)
    xasprintf (&output_unit_name, "[S:%s]",
               output_unit->special_unit_variety);
  else /* should never happen */
    output_unit_name = strdup ("");
  return output_unit_name;
}

static void
add_ou_direction (STRING_LIST *ou_directions,
                  const OUTPUT_UNIT *output_unit,
                  const char *direction_name)
{
  if (output_unit)
    {
      char *direction_text = output_unit_name_string (output_unit);
      char *ou_direction_text;
      xasprintf (&ou_direction_text, "%s->%s",
                 direction_name, direction_text);
      free (direction_text);
      add_string (ou_directions, ou_direction_text);
      free (ou_direction_text);
    }
}

/* can be called for debugging */
char *
print_output_unit (const OUTPUT_UNIT *output_unit, int use_filename)
{
  TEXT result;

  text_init (&result);

  text_append (&result, output_unit_type_names[output_unit->unit_type]);
  if (output_unit->special_unit_variety)
    text_printf (&result, "-%s", output_unit->special_unit_variety);

  if (output_unit->unit_contents.number > 0)
    text_printf (&result, "{C%zu}", output_unit->unit_contents.number);

  if (output_unit->unit_type != OU_special_unit
      && output_unit->uc.unit_command)
    {
      char *additional_info = 0;
      char *root_command_texi
        = root_command_element_string (output_unit->uc.unit_command);

      /* determine the kind of command by comparing with
         unit node or unit section.  Also show the texinfo code
         of the node or section relations not associated to unit_command.
       */
      if (output_unit->unit_node)
        {
          if (output_unit->unit_node->element
                 == output_unit->uc.unit_command)
            {
              text_append_n (&result, "{N:", 3);
              if (root_command_texi)
                text_append (&result, root_command_texi);
            }
          else
            {
              char *node_texi
                = root_command_element_string (
                                output_unit->unit_node->element);
              if (node_texi)
                {
                  xasprintf (&additional_info, "{n:%s}", node_texi);
                  free (node_texi);
                }
              else
                xasprintf (&additional_info, "{n:}");
            }
        }

      if (output_unit->unit_section)
        {
          const ELEMENT *section_element = output_unit->unit_section->element;
          if (section_element == output_unit->uc.unit_command)
            {
              text_append_n (&result, "{S:@", 4);
              text_append (&result, element_command_name (section_element));
              if (root_command_texi)
                {
                  text_append_n (&result, " ", 1);
                  text_append (&result, root_command_texi);
                }
            }
          else
            {
              char *section_texi
                = root_command_element_string (section_element);
              if (section_texi)
                {
                  xasprintf (&additional_info, "{s:@%s %s}",
                             element_command_name (section_element),
                             section_texi);
                  free (section_texi);
                }
              else
                xasprintf (&additional_info, "{s:}");
            }
        }
      text_append_n (&result, "}", 1);
      if (additional_info)
        {
          text_append (&result, additional_info);
          free (additional_info);
        }
      free (root_command_texi);
    }

  if (output_unit->unit_filename)
    {
      text_append_n (&result, " ", 1);
      if (use_filename)
        {
          char *file_name_and_directory[2];
          parse_file_path (output_unit->unit_filename,
                           file_name_and_directory);

          text_append (&result, file_name_and_directory[0]);

          free (file_name_and_directory[0]);
          free (file_name_and_directory[1]);
        }
      else
        text_append (&result, output_unit->unit_filename);
    }
  text_append_n (&result, "\n", 1);

  return result.text;
}

/* If numbering elements is needed, the caller should have prepared the
   Texinfo tree elements for detailed printing by calling functions
   to number elements.  The argument CURRENT_NR should be the numbering
   function return value.
 */
static uintptr_t
print_output_units_details (OUTPUT_UNIT_LIST *output_units,
                         uintptr_t current_nr, TEXT *result,
                         const char *fname_encoding, int use_filename)
{
  TEXT directions_text;
  /* those not in the directions field */
  STRING_LIST ou_directions;
  size_t i;

  text_init (&directions_text);

  memset (&ou_directions, 0, sizeof (STRING_LIST));

  for (i = 0; i < output_units->number; i++)
    {
      size_t j;
      OUTPUT_UNIT *output_unit = output_units->list[i];
      char *output_unit_str = print_output_unit (output_unit, use_filename);

      text_printf (result, "U%zu %s", output_unit->index, output_unit_str);
      free (output_unit_str);

      if (output_unit->tree_unit_directions[D_prev]
          || output_unit->tree_unit_directions[D_next])
        {
          size_t directions_nr = sizeof (output_unit->tree_unit_directions)
                           / sizeof (output_unit->tree_unit_directions[0]);
          for (j = 0; j < directions_nr; j++)
            {
              const OUTPUT_UNIT *direction
                = output_unit->tree_unit_directions[j];
              add_ou_direction (&ou_directions, direction,
                                direction_names[j]);
            }
        }

      if (output_unit->first_in_page)
        {
          add_ou_direction (&ou_directions, output_unit->first_in_page,
                            "page");
        }

      if (output_unit->associated_document_unit)
        {
          add_ou_direction (&ou_directions,
                            output_unit->associated_document_unit, "doc unit");
        }

      if (ou_directions.number)
        {
          char *joined_string = join_strings_list (&ou_directions, 0);
          text_printf (result, "unit_directions:D[%s]\n",
                       joined_string);
          free (joined_string);
        }
      clear_strings_list (&ou_directions);

      for (j = 0; j < RUD_type_FirstInFileNodeBack+1; j++)
        {
          const OUTPUT_UNIT *direction = output_unit->directions[j];
          if (direction)
            {
              char *direction_text = output_unit_name_string (direction);
              text_printf (&directions_text, "%s: %s\n",
                           relative_unit_direction_name[j],
                           direction_text);
              free (direction_text);
            }
        }
      if (directions_text.end > 0)
        {
          text_append (result, "UNIT_DIRECTIONS\n");
          text_append (result, directions_text.text);
          text_reset (&directions_text);
        }

      if (output_unit->unit_contents.number)
        {
          for (j = 0; j < output_unit->unit_contents.number; j++)
            {
              ELEMENT *element = output_unit->unit_contents.list[j];
              current_nr = print_tree_details (element, 1, 0, current_nr,
                                                  result, fname_encoding,
                                                  use_filename, 0);
            }
        }
    }

  free_strings_list (&ou_directions);
  free (directions_text.text);

  return current_nr;
}

/* for debugging */
char *
output_units_print_details (OUTPUT_UNIT_LIST *output_units,
                            const char *fname_encoding, int use_filename)
{
  TEXT result;
  uintptr_t current_nr = 0;

  text_init (&result);
  text_append (&result, "");

  print_output_units_details (output_units, current_nr, &result,
                              fname_encoding, use_filename);

  return result.text;
}

char *
print_output_units_tree_details (OUTPUT_UNIT_LIST *output_units, ELEMENT *tree,
                                 const char *fname_encoding, int use_filename)
{
  uintptr_t current_nr = 0;

  TEXT result;

  text_init (&result);
  text_append (&result, "");

 /*
  current_nr = set_element_tree_numbers (tree, 0);
  */

  current_nr = print_output_units_details (output_units,
                        current_nr, &result, fname_encoding, use_filename);

 /*
  remove_element_tree_numbers (tree);
  */

  return result.text;
}
