/* Copyright 2010-2025 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>. */

/* Corresponding Perl code is mainly in Texinfo::ManipulateTree */

#include <config.h>
#include <stddef.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <inttypes.h>
#include "unistr.h"

#include "source_mark_types.h"
#include "tree_types.h"
#include "command_ids.h"
#include "types_data.h"
#include "document_types.h"
#include "text.h"
/* fatal */
#include "base_utils.h"
#include "tree.h"
#include "extra.h"
#include "builtin_commands.h"
#include "debug.h"
#include "targets.h"
/* for directions_length new_string_list copy_strings count_multibyte
   whitespace_chars */
#include "utils.h"
/* for print_source_info_details */
#include "errors.h"
#include "convert_to_texinfo.h"
#include "unicode.h"
#include "manipulate_tree.h"

/* To do the copy, we do two pass.  First with copy_tree_internal, the tree is
   copied and a flag and reference to the copy is put in all the elements,
   taking care that each element is processed once only.
   Then, remove_element_copy_info goes through the tree again and remove
   the references to the copies.
 */

ELEMENT *
copy_tree_internal (ELEMENT* current, ELEMENT_LIST *other_trees);

void
copy_associated_info (ASSOCIATED_INFO *info, ASSOCIATED_INFO *new_info,
                      ELEMENT_LIST *other_trees)
{
  size_t i;

  for (i = 0; i < info->info_number; i++)
    {
      const KEY_PAIR *k_ref = &info->info[i];
      enum ai_key_name key = k_ref->key;
      enum extra_type k_type = associated_info_table[key].type;
      size_t j;

      switch (k_type)
        {
        case extra_element:
          {
            if (other_trees)
              {
                /* cast const off */
                ELEMENT *f = (ELEMENT *)k_ref->k.const_element;
                ELEMENT *copy = copy_tree_internal (f, other_trees);
                KEY_PAIR *k = get_associated_info_key (new_info, key);
                k->k.const_element = copy;
              }
          }
          break;
        case extra_element_oot:
          {
            ELEMENT *f = k_ref->k.element;
            ELEMENT *copy = copy_tree_internal (f, other_trees);
            KEY_PAIR *k = get_associated_info_key (new_info, key);
            k->k.element = copy;
          }
          break;
        case extra_contents:
          {
          if (other_trees)
            {
              KEY_PAIR *k = get_associated_info_key (new_info, key);
              CONST_ELEMENT_LIST *new_extra_contents
                = new_const_element_list ();
              k->k.const_list = new_extra_contents;
              for (j = 0; j < k_ref->k.const_list->number; j++)
                {
              /* cast to discard const, as the element needs to be modified
                 transiently for copy */
                  ELEMENT *e = (ELEMENT *)k_ref->k.const_list->list[j];
                  ELEMENT *copy = copy_tree_internal (e, other_trees);
                  add_to_const_element_list (new_extra_contents, copy);
                }
            }
          break;
          }
        case extra_directions:
          {
          if (other_trees)
            {
              KEY_PAIR *k = get_associated_info_key (new_info, key);
              const ELEMENT **new_d = new_directions ();
              k->k.directions = new_d;
              for (j = 0; j < directions_length; j++)
                {
                  /* cast const off */
                  ELEMENT *e = (ELEMENT *)k_ref->k.directions[j];
                  if (e)
                    {
                      const ELEMENT *copy
                        = copy_tree_internal (e, other_trees);
                      new_d[j] = copy;
                    }
                }
            }
          break;
          }
        case extra_container:
          { /* node_content and node_manual
               Keep them in the tree in any case as they are used in
               output and should be in the elements they refer to
             */
            ELEMENT *f = k_ref->k.element;
            KEY_PAIR *k = get_associated_info_key (new_info, key);
            ELEMENT *new_extra_element = new_element (ET_NONE);
            k->k.element = new_extra_element;
            for (j = 0; j < f->e.c->contents.number; j++)
              {
                ELEMENT *e = f->e.c->contents.list[j];
                ELEMENT *copy = copy_tree_internal (e, other_trees);
                add_to_contents_as_array (new_extra_element, copy);
              }
            break;
          }
        case extra_string:
          { /* A simple string. */
            char *value = k_ref->k.string;
            KEY_PAIR *k = get_associated_info_key (new_info, key);
            k->k.string = strdup (value);
            break;
          }
        case extra_integer:
          { /* A simple integer. */
            KEY_PAIR *k = get_associated_info_key (new_info, key);
            k->k.integer = k_ref->k.integer;
            break;
          }
        case extra_misc_args:
          {
          KEY_PAIR *k = get_associated_info_key (new_info, key);
          k->k.strings_list = new_string_list();
          copy_strings (k->k.strings_list, k_ref->k.strings_list);
          break;
          }
        case extra_index_entry:
          {
            KEY_PAIR *k = get_associated_info_key (new_info, key);
            k->k.index_entry = (INDEX_ENTRY_LOCATION *)
                             malloc (sizeof (INDEX_ENTRY_LOCATION));
            k->k.index_entry->index_name
              = strdup (k_ref->k.index_entry->index_name);
            k->k.index_entry->number = k_ref->k.index_entry->number;
            break;
          }
        case extra_none:
        case extra_flag:
        case extra_element_info:
        case extra_string_info:
          break;
        default:
          fatal ("copy_associated_info: unknown extra type");
          break;
        }
    }
}

ELEMENT *
copy_tree_internal (ELEMENT* current, ELEMENT_LIST *other_trees)
{
  ELEMENT *new;
  size_t i;
  int elt_info_nr = type_data[current->type].elt_info_number;

  if (current->flags & EF_copy)
    {
      return current->elt_info[elt_info_nr];
    }

  if (type_data[current->type].flags & TF_text)
    new = new_text_element (current->type);
  else if (current->e.c->cmd)
    new = new_command_element (current->type, current->e.c->cmd);
  else
    new = new_element (current->type);

  new->flags = current->flags;

  /* set that flag to mark that a copy of the element exists */
  current->flags |= EF_copy;

  /* point to the copy at the end of elt_info after the regular information */
  current->elt_info = (ELEMENT **) realloc (current->elt_info,
                               sizeof (ELEMENT *) * (elt_info_nr + 1));
  if (!current->elt_info)
    fatal ("realloc failed");

  current->elt_info[elt_info_nr] = new;

  /*
  fprintf (stderr, "CTNEW %p %s %p\n", current,
                                       print_element_debug (current, 1), new);
  */

  if (type_data[current->type].flags & TF_text)
    {
      text_append_n (new->e.text, current->e.text->text, current->e.text->end);
      return new;
    }

  /* the parent of new is set in add_to_element* */
  for (i = 0; i < current->e.c->contents.number; i++)
    {
      ELEMENT *added = copy_tree_internal (current->e.c->contents.list[i],
                                           other_trees);
      add_element_to_element_contents (new, added);
    }

  if (elt_info_nr > 0)
    {
      int j;
      for (j = 0; j < elt_info_nr; j++)
        if (current->elt_info[j])
          {
            ELEMENT *copy = copy_tree_internal (current->elt_info[j],
                                                other_trees);
            new->elt_info[j] = copy;
          }
    }

  if (current->e.c->string_info)
    {
      int j;
      int string_info_nr = 1;
      if (current->type == ET_definfoenclose_command
          || current->type == ET_index_entry_command
          || current->e.c->cmd == CM_verb)
        string_info_nr = 2;
      for (j = 0; j < string_info_nr; j++)
        if (current->e.c->string_info[j])
          new->e.c->string_info[j] = strdup (current->e.c->string_info[j]);
    }

  copy_associated_info (&current->e.c->extra_info, &new->e.c->extra_info,
                        other_trees);
  return new;
}

void
remove_element_copy_info (ELEMENT *current, ELEMENT_LIST *added_root_elements);

void
remove_associated_copy_info (ASSOCIATED_INFO *info,
                             ELEMENT_LIST *added_root_elements)
{
  size_t i;

  for (i = 0; i < info->info_number; i++)
    {
      const KEY_PAIR *k_ref = &info->info[i];
      enum extra_type k_type = associated_info_table[k_ref->key].type;

      size_t j;

      switch (k_type)
        {
        case extra_element:
          {
            /* cast to discard const, as the element needs to be modified
               transiently for copy */
            ELEMENT *f = (ELEMENT *)k_ref->k.element;
            remove_element_copy_info (f, added_root_elements);
            break;
          }
        case extra_element_oot:
          {
            ELEMENT *f = k_ref->k.element;
            remove_element_copy_info (f, added_root_elements);
            break;
          }
        case extra_contents:
          {
            for (j = 0; j < k_ref->k.const_list->number; j++)
              {
              /* cast to discard const, as the element needs to be modified
                 transiently for copy */
                ELEMENT *e = (ELEMENT *)k_ref->k.const_list->list[j];
                remove_element_copy_info (e, added_root_elements);
              }
            break;
          }
        case extra_directions:
          {
            for (j = 0; j < directions_length; j++)
              {
                /* cast const off */
                ELEMENT *e = (ELEMENT *) k_ref->k.directions[j];
                if (e)
                  {
                    remove_element_copy_info (e, added_root_elements);
                  }
              }
            break;
          }
        case extra_container:
          {
            const ELEMENT *f = k_ref->k.element;
            for (j = 0; j < f->e.c->contents.number; j++)
              {
                ELEMENT *e = f->e.c->contents.list[j];
                remove_element_copy_info (e, added_root_elements);
              }
            break;
          }
        default:
          break;
        }
    }
}

void
remove_element_copy_info (ELEMENT *current, ELEMENT_LIST *added_root_elements)
{
  size_t i;
  int elt_info_nr;
  ELEMENT *new_elt;

  if (! (current->flags & EF_copy))
    /* already done or extra element not copied */
    return;

  elt_info_nr = type_data[current->type].elt_info_number;
  new_elt = current->elt_info[elt_info_nr];
  if (!(type_data[new_elt->type].flags & TF_text) && !new_elt->e.c->parent)
    {
      if (added_root_elements)
        {
           /*
          fprintf (stderr, "CCADDED %p %s\n", new_elt,
                   print_element_debug (new_elt, 0));
            */
          add_to_element_list (added_root_elements, new_elt);
        }
     /*
      else
        {
          fprintf (stderr, "CCNOP %p %p %s\n", current, new_elt,
                           print_element_debug (current, 0));
           abort ();
         }
      */
    }

  /* mark as copied by unsetting the flag and deallocate pointer to the copy */
  current->flags &= ~EF_copy;
  if (elt_info_nr > 0)
    {
      current->elt_info = (ELEMENT **) realloc (current->elt_info,
                               sizeof (ELEMENT *) * elt_info_nr);
      if (!current->elt_info)
        fatal ("realloc failed");
    }
  else
    {
      free (current->elt_info);
      current->elt_info = 0;
    }

  if (! (type_data[current->type].flags & TF_text))
    {
      for (i = 0; i < current->e.c->contents.number; i++)
        remove_element_copy_info (current->e.c->contents.list[i],
                                  added_root_elements);

      if (type_data[current->type].elt_info_number > 0)
        {
          int j;
          for (j = 0; j < type_data[current->type].elt_info_number; j++)
            {
              if (current->elt_info[j])
                {
                  ELEMENT *f = current->elt_info[j];
                  remove_element_copy_info (f, added_root_elements);
                }
            }
        }
      remove_associated_copy_info (&current->e.c->extra_info,
                                   added_root_elements);
    }
}

/* TODO not to be done for now, without extra_type pointing outside used.

   The extra elements references can be out of the children of
   the copied tree if the copied tree is not a tree root.  In that case,
   destroying the copied tree won't destroy the extra elements copied
   that are not among the children of the copied element.
   ADDED_ROOT_ELEMENTS argument is supposed to help with this, but
   it does not allow to solve the issue as currently the added trees
   returned can still refer to other trees.
   The other_trees argument to copy_tree_internal intended use was
   to force a larger tree to be copied to handle that situation.
   However, other_trees is not used for that purpose for now, as
   it is passed but nothing is ever put in the list.  It is merely
   used as an indicator; if NULL, elements in extra information
   that could point outside of the tree are not copied.

   The current setup should work as long as the function is only
   called on complete trees when ADDED_ROOT_ELEMENTS is set and thus
   other_trees is set.  It is the caller responsibility to call
   copy_tree with ADDED_ROOT_ELEMENTS set only for complete
   self-contained trees.

   As a last note, extra_types that could point outside of the tree
   may appear in the tree only if there is extra information
   with this type.  Code could still be there for extra_types that
   cannot appear anywhere.  See AI_KEYS_LIST in tree_types.h for the list
   of possible extra information.  In 2025 there were none of those
   extra_types in extra information, which means that there is nothing to be
   actually improved here.  These extra_types could be used again in the
   future, however.
 */
ELEMENT *
copy_tree (ELEMENT *element, ELEMENT_LIST *added_root_elements)
{
  size_t i;
  ELEMENT_LIST *other_trees = 0;
  if (added_root_elements)
    {
      other_trees = new_list ();
    }

  ELEMENT *tree_copy = copy_tree_internal (element, other_trees);
  remove_element_copy_info (element, added_root_elements);

  /* remove the main tree copy from added_root_elements in case it
     was recorded there as an additional root element */
  if (added_root_elements)
    {
      for (i = added_root_elements->number; i > 0; i--)
        {
          if (added_root_elements->list[i-1] == tree_copy)
            remove_from_element_list (added_root_elements, i-1);
        }
    }

  if (other_trees)
    destroy_list (other_trees);

  return tree_copy;
}

ELEMENT *
copy_contents (const ELEMENT *element, ELEMENT_LIST *added_root_elements,
               enum element_type type)
{
  ELEMENT *tmp = new_element (type);
  ELEMENT *result;
  tmp->e.c->contents = element->e.c->contents;

  result = copy_tree (tmp, added_root_elements);

  tmp->e.c->contents.list = 0;
  destroy_element (tmp);

  return result;
}



/* This function is designed to create a new element passed in
   argument of add_extra_container to be registered as extra_container,
   with CONTAINER contents.  The new element (but not the contents) will
   be destroyed when the element it is registered in with
   add_extra_container is destroyed.
 */
ELEMENT *
copy_container_contents (const ELEMENT *container)
{
  ELEMENT *result;
  if (container->e.c->cmd)
    result = new_command_element (container->type, container->e.c->cmd);
  else
    result = new_element (container->type);

  insert_slice_into_contents (result, 0, container,
                              0, container->e.c->contents.number);
  return result;
}



void
tree_remove_parents (ELEMENT *element)
{
  size_t i;
  if (element->source_mark_list)
    {
      for (i = 0; i < element->source_mark_list->number; i++)
        {
          SOURCE_MARK *source_mark
             = element->source_mark_list->list[i];
          if (source_mark->element)
            tree_remove_parents (source_mark->element);
        }
    }

  if (type_data[element->type].flags & TF_text)
    return;

  element->e.c->parent = 0;

  if (type_data[element->type].elt_info_number > 0)
    {
      int j;
      for (j = 0; j < type_data[element->type].elt_info_number; j++)
        {
          if (element->elt_info[j])
            tree_remove_parents (element->elt_info[j]);
        }
    }

  if (element->e.c->contents.number > 0)
    {
      for (i = 0; i < element->e.c->contents.number; i++)
        tree_remove_parents (element->e.c->contents.list[i]);
    }

  for (i = 0; i < element->e.c->extra_info.info_number; i++)
    {
      const KEY_PAIR *k_ref = &element->e.c->extra_info.info[i];
      enum extra_type k_type = associated_info_table[k_ref->key].type;

      switch (k_type)
        {
        case extra_element_oot:
          {
            tree_remove_parents (k_ref->k.element);
            break;
          }
        default:
          break;
        }
    }
}



/* Source marks low level handling functionsa and relocate_source_marks */

void
add_source_mark (SOURCE_MARK *source_mark, ELEMENT *e)
{
  SOURCE_MARK_LIST *s_mark_list;

  if (!e->source_mark_list)
    {
      e->source_mark_list = (SOURCE_MARK_LIST *) malloc (sizeof (SOURCE_MARK_LIST));
      memset (e->source_mark_list, 0, sizeof (SOURCE_MARK_LIST));
    }

  s_mark_list = e->source_mark_list;

  if (s_mark_list->number == s_mark_list->space)
    {
      s_mark_list->space++;
      s_mark_list->list
          = realloc (s_mark_list->list,
                     s_mark_list->space * sizeof (SOURCE_MARK *));
      if (!s_mark_list->list)
        fatal ("realloc failed");
    }
  s_mark_list->list[s_mark_list->number] = source_mark;
  s_mark_list->number++;
}

static SOURCE_MARK *
remove_from_source_mark_list (SOURCE_MARK_LIST *list, size_t where)
{
  SOURCE_MARK *removed;

  if (where > list->number)
    fatal ("source marks list index out of bounds");

  removed = list->list[where];
  memmove (&list->list[where], &list->list[where + 1],
           (list->number - (where+1)) * sizeof (SOURCE_MARK *));
  list->number--;
  return removed;
}

/* In Texinfo::Common */
/* relocate SOURCE_MARK_LIST source marks with position between
   BEGIN_POSITION and BEGIN_POSITION + LEN to be relative to BEGIN_POSITION,
   and move to element NEW_E.
   Returns BEGIN_POSITION + LEN if there were source marks.

   Even if it is emptied, SOURCE_MARK_LIST is not freed.  If all the source
   marks are relocated and the element is destroyed, the SOURCE_MARK_LIST
   will be freed, otherwise it is up to the caller to call
   destroy_element_empty_source_mark_list on the element.
*/
size_t
relocate_source_marks (SOURCE_MARK_LIST *source_mark_list, ELEMENT *new_e,
                       size_t begin_position, size_t len)
{
  size_t i = 0;
  size_t j;
  size_t list_number;
  size_t *indices_to_remove;
  size_t end_position;

  if (!source_mark_list)
    return 0;

  list_number = source_mark_list->number;
  if (list_number <= 0)
    return 0;

  end_position = begin_position + len;

  indices_to_remove = malloc (sizeof (size_t) * list_number);
  memset (indices_to_remove, 0, sizeof (size_t) * list_number);

  while (i < list_number)
    {
      SOURCE_MARK *source_mark
         = source_mark_list->list[i];
      if ((begin_position == 0 && source_mark->position == 0)
          || (source_mark->position > begin_position
              && source_mark->position <= end_position))
        {
          indices_to_remove[i] = 1;
          if (type_data[new_e->type].flags & TF_text)
            {
              source_mark->position
                = source_mark->position - begin_position;
            }
          else
            {
         /*
         if the source mark is to be added to a command, it can only be right
         after the command.  The current use case is a symbol with a source
         mark after the symbol replaced by an @-command, so we are in
         the case of added_length = 1 and
         source_mark->position == end_position
         */
              if (source_mark->position - begin_position > 1)
                fprintf (stderr, "BUG? after command %zu way past %zu\n",
                                 source_mark->position, begin_position);
              source_mark->position = 0;
            }
          add_source_mark (source_mark, new_e);
        }
      i++;
      if (source_mark->position > end_position)
        break;
    }
  /* i is past the last index with a potential source mark to remove
     (to be ready for the next pass in the loop above).  So remove one */
  for (j = i - 1; ; j--)
    {
      if (indices_to_remove[j] == 1)
        remove_from_source_mark_list (source_mark_list, j);
      if (j == 0)
        break;
    }

  free (indices_to_remove);
  return end_position;
}



/* In Texinfo::Common */
/* NODE->e.c->contents is the Texinfo for the specification of a node.  This
   function sets two fields on the returned object:

     manual_content - Texinfo tree for a manual name extracted from the
                      node specification.
     node_content - Texinfo tree for the node name on its own

   Objects returned from this function are used as an 'extra' key in
   the element for elements linking to nodes (such as @*ref,
   menu_entry_node or node direction arguments).  In that case
   modify_node is set to 1 and the node contents are modified in-place to
   hold the same elements as the returned objects.

   This function is also used for elements that are targets of links (@node and
   @anchor first argument, float second argument) mainly to check that
   the syntax for an external node is not used.  In that case modify_node
   is set to 0 and the node is not modified, and added elements are
   collected in a third field of the returned object,
     out_of_tree_elements - elements collected in manual_content or
                            node_content and not in the node
 */

NODE_SPEC_EXTRA *
parse_node_manual (ELEMENT *node, int modify_node)
{
  NODE_SPEC_EXTRA *result;
  ELEMENT *node_content = 0;
  size_t idx = 0; /* index into node->e.c->contents */

  result = (NODE_SPEC_EXTRA *) malloc (sizeof (NODE_SPEC_EXTRA));
  result->manual_content = result->node_content = 0;
  /* if not modifying the tree, and there is a manual name, the elements
     added for the manual name and for the node content that are based
     on texts from tree elements are not anywhere in the tree.
     They are collected in result->out_of_tree_element to be freed later.
     These elements correspond to the text after the first manual name
     opening brace and text before and after the closing manual name brace */
  result->out_of_tree_elements = 0;

  /* If the content starts with a '(', try to get a manual name. */
  if (node->e.c->contents.number > 0
      && node->e.c->contents.list[0]->type == ET_normal_text
      && node->e.c->contents.list[0]->e.text->end > 0
      && node->e.c->contents.list[0]->e.text->text[0] == '(')
    {
      ELEMENT *manual, *first;
      ELEMENT *new_first = 0;
      ELEMENT *opening_brace = 0;
      char *opening_bracket, *closing_bracket;

      /* Handle nested parentheses in the manual name, for whatever reason. */
      int bracket_count = 1; /* Number of ( seen minus number of ) seen. */

      manual = new_element (ET_NONE);

      /* If the first contents element is "(" followed by more text, split
         the leading "(" into its own element. */
      first = node->e.c->contents.list[0];
      if (first->e.text->end > 1)
        {
          if (modify_node)
            {
              opening_brace = new_text_element (ET_normal_text);
              text_append_n (opening_brace->e.text, "(", 1);
            }
          new_first = new_text_element (ET_normal_text);
          text_append_n (new_first->e.text, first->e.text->text +1,
                         first->e.text->end -1);
        }
      else
        {
          /* first element is "(", keep it */
          idx++;
        }

      for (; idx < node->e.c->contents.number; idx++)
        {
          ELEMENT *e;
          char *p, *q;

          if (idx == 0)
            e = new_first;
          else
            e = node->e.c->contents.list[idx];

          if (e->type != ET_normal_text)
            {
              /* Put this element in the manual contents. */
              add_to_contents_as_array (manual, e);
              continue;
            }
          p = e->e.text->text;
          while (p < e->e.text->text + e->e.text->end
                 && bracket_count > 0)
            {
              opening_bracket = strchr (p, '(');
              closing_bracket = strchr (p, ')');
              if (!opening_bracket && !closing_bracket)
                {
                  break;
                }
              else if (opening_bracket && !closing_bracket)
                {
                  bracket_count++;
                  p = opening_bracket + 1;
                }
              else if (!opening_bracket && closing_bracket)
                {
                  bracket_count--;
                  p = closing_bracket + 1;
                }
              else if (opening_bracket < closing_bracket)
                {
                  bracket_count++;
                  p = opening_bracket + 1;
                }
              else if (opening_bracket > closing_bracket)
                {
                  bracket_count--;
                  p = closing_bracket + 1;
                }
            }

          if (bracket_count > 0)
            add_to_contents_as_array (manual, e);
          else /* end of filename component */
            {
              size_t current_position = 0;
              /* At this point, we are sure that there is a manual part,
                 so the pending removal/addition of elements at the beginning
                 of the manual can proceed (if modify_node). */
              /* Also, split the element in two, putting the part before the ")"
                 in the manual name, leaving the part afterwards for the
                 node name. */
              if (modify_node)
                {
                  if (opening_brace)
                    {
                      /* remove the original first element and prepend the
                         split "(" and text elements */
                      remove_from_contents (node, 0); /* remove first element */
                      insert_into_contents_as_array (node, new_first, 0);
                      insert_into_contents_as_array (node, opening_brace, 0);
                      idx++;
                      if (first->source_mark_list)
                        {
                          size_t current_position
                            = relocate_source_marks (first->source_mark_list,
                                                     opening_brace, 0,
                                   count_multibyte (opening_brace->e.text->text));
                          relocate_source_marks (first->source_mark_list,
                                                 new_first, current_position,
                                       count_multibyte (new_first->e.text->text));
                        }
                      destroy_element (first);
                    }
                  remove_from_contents (node, idx); /* Remove current element e
                                                       with closing brace from the tree. */
                }
              else
                {
                  /* collect elements out of tree */
                  result->out_of_tree_elements = calloc (3, sizeof (ELEMENT *));
                  if (new_first)
                    result->out_of_tree_elements[0] = new_first;
                }
              p--; /* point at ) */
              if (p > e->e.text->text)
                {
                  /* text before ), part of the manual name */
                  ELEMENT *last_manual_element
                                      = new_text_element (ET_normal_text);
                  text_append_n (last_manual_element->e.text, e->e.text->text,
                                 p - e->e.text->text);
                  add_to_contents_as_array (manual, last_manual_element);
                  if (modify_node)
                    {
                      insert_into_contents_as_array (node,
                                                   last_manual_element, idx++);
                      current_position
                        = relocate_source_marks (e->source_mark_list,
                                                 last_manual_element,
                                                 current_position,
                            count_multibyte (last_manual_element->e.text->text));
                    }
                  else
                    result->out_of_tree_elements[1] = last_manual_element;
                }

              if (modify_node)
                {
                  ELEMENT *closing_brace = new_text_element (ET_normal_text);
                  text_append_n (closing_brace->e.text, ")", 1);
                  insert_into_contents_as_array (node, closing_brace, idx++);
                  current_position
                    = relocate_source_marks (e->source_mark_list,
                                             closing_brace,
                                             current_position,
                        count_multibyte (closing_brace->e.text->text));
                }

              /* Skip ')' and any following whitespace.
                 Note that we don't manage to skip any multibyte
                 UTF-8 space characters here. */
              p++;
              q = p + strspn (p, whitespace_chars);
              if (q > p && modify_node)
                {
                  ELEMENT *spaces_element = new_text_element (ET_normal_text);
                  text_append_n (spaces_element->e.text, p, q - p);
                  insert_into_contents_as_array (node, spaces_element, idx++);
                  current_position
                    = relocate_source_marks (e->source_mark_list,
                                             spaces_element,
                                             current_position,
                        count_multibyte (spaces_element->e.text->text));
                }

              p = q;
              if (*p)
                {
                  /* text after ), part of the node name. */
                  ELEMENT *leading_node_content
                      = new_text_element (ET_normal_text);
                  text_append_n (leading_node_content->e.text, p,
                                 e->e.text->text + e->e.text->end - p);
                  /* start node_content */
                  node_content = new_element (ET_NONE);
                  add_to_contents_as_array (node_content, leading_node_content);
                  if (modify_node)
                    {
                      insert_into_contents_as_array (node,
                                                    leading_node_content, idx);
                      current_position
                        = relocate_source_marks (e->source_mark_list,
                                                 leading_node_content,
                                                 current_position,
                            count_multibyte (leading_node_content->e.text->text));
                    }
                  else
                    result->out_of_tree_elements[2] = leading_node_content;
                  idx++;
                }
              if (modify_node)
                destroy_element (e);
              break;
            }
        } /* for */

      if (bracket_count == 0)
        result->manual_content = manual;
      else /* Unbalanced parentheses, consider that there is no manual
              afterall.  So far the node has not been modified, so the
              only thing that needs to be done is to remove the manual
              element and the elements allocated for the beginning of
              the manual, and start over */
        {
          destroy_element (manual);
          if (new_first)
            destroy_element (new_first);
          if (opening_brace)
            destroy_element (opening_brace);
          idx = 0; /* Back to the start, and consider the whole thing
                      as a node name. */
        }
    }

  /* If anything left, it is part of the node name. */
  if (idx < node->e.c->contents.number)
    {
      if (!node_content)
        node_content = new_element (ET_NONE);
      insert_slice_into_contents (node_content,
                                  node_content->e.c->contents.number,
                                  node, idx, node->e.c->contents.number);
    }

  if (node_content)
    result->node_content = node_content;

  return result;
}



/* set_element_tree_numbers does nothing as there are no reference
   to tree elements in the tree extra information currently, consistently
   no command is selected, so this function has no effect.
  */
/* since it has no effect set to a noop and rename the function
   implementing the code that would have been useful otherwise */

uintptr_t
set_element_tree_numbers (ELEMENT *element, uintptr_t current_nr)
{
  return 0;
}

/* implementaiton to reuse if references to tree elements in the tree
   extra information is readded */
uintptr_t
unused_set_element_tree_numbers (ELEMENT *element, uintptr_t current_nr)
{
  size_t i;
  int elt_info_nr = type_data[element->type].elt_info_number;

  if (type_data[element->type].flags & TF_text)
    return current_nr;

  enum command_id data_cmd = element_builtin_data_cmd (element);

  /* no reference to other commands in tree for now.  The useless
     condition on data_cmd is there to silence compiler warnings */
  if (0 && data_cmd == CM_node)
     /*
      (data_cmd == CM_node
       || (builtin_command_data[data_cmd].flags & CF_sectioning_heading))
       */
    {

       /* Avoid clobbering elt_info_nr + 1 */
      if (element->flags & EF_copy || element->flags & EF_numbered)
        {
          char *debug_str = print_element_debug (element, 1);
          if (element->flags & EF_copy)
            fprintf (stderr, "WARNING: can't number, copy is set: %p '%s'\n",
                             element, debug_str);
          /* TODO not possible for now, but this has happened in tests in
             the past.  It may have been because of a bug
             where the element was numbered instead of the elt_info.
             If/when this code can be tested again, it should be checked
             if this bug is still there and if yes, it should be removed.
          else
            fprintf (stderr, "WARNING: already numbered: %p E%"
                                 PRIuPTR " '%s'\n", element,
                   (uintptr_t) element->elt_info[elt_info_nr], debug_str);
           */
          free (debug_str);
        }
      else
        {
      /* put number at the end of elt_info after the regular information */
          element->elt_info = (ELEMENT **) realloc (element->elt_info,
                                   sizeof (ELEMENT *) * (elt_info_nr + 1));

      /* set that flag to mark that a number is stored */
        element->flags |= EF_numbered;

        element->elt_info[elt_info_nr] = (ELEMENT *)current_nr;

        current_nr++;
      }
    }

  for (i = 0; i < element->e.c->contents.number; i++)
    current_nr
      = set_element_tree_numbers (element->e.c->contents.list[i], current_nr);

  return current_nr;
}

#define SOURCE_MARK_PREPEND ">"

static uintptr_t
print_source_marks (ELEMENT *element, int level, const char *prepended,
                    uintptr_t current_nr, TEXT *result,
                    const char *fname_encoding, int use_filename)
{
  char *s_mark_prepended;
  size_t i;
  int j;

  if (!element->source_mark_list || element->source_mark_list->number == 0)
    return current_nr;

  if (prepended)
    xasprintf (&s_mark_prepended, "%s%s", prepended,
               SOURCE_MARK_PREPEND);
  else
    s_mark_prepended = SOURCE_MARK_PREPEND;

  for (j = 0; j < level; j++)
    text_append_n (result, " ", 1);
  text_append (result, s_mark_prepended);
  text_append (result, "SOURCEMARKS\n");

  for (i = 0; i < element->source_mark_list->number; i++)
    {
      const SOURCE_MARK *s_mark = element->source_mark_list->list[i];

      for (j = 0; j < level; j++)
        text_append_n (result, " ", 1);
      text_append (result, s_mark_prepended);
      switch (s_mark->type)
        {
#define sm_type(X) \
          case SM_type_ ## X: \
            text_append (result, #X); \
          break;

        SM_TYPES_LIST
#undef sm_type

          /* for SM_type_none */
          default:
            break;
        }
      if (s_mark->status == SM_status_start)
        text_printf (result, "<start;%d>", s_mark->counter);
      else if (s_mark->status == SM_status_end)
        text_printf (result, "<end;%d>", s_mark->counter);
      else /* none */
        text_printf (result, "<%d>", s_mark->counter);
      if (s_mark->position)
        text_printf (result, "<p:%d>", s_mark->position);
      if (s_mark->line)
        {
          char *sm_line = debug_protect_eol (s_mark->line);
          text_printf (result, "{%s}", sm_line);
          free (sm_line);
        }
      text_append_n (result, "\n", 1);

      if (s_mark->element)
        {
          current_nr = print_tree_details (s_mark->element, level+1,
                        s_mark_prepended, current_nr, result,
                        fname_encoding, use_filename);
        }
    }

  if (prepended)
    free (s_mark_prepended);

  return current_nr;
}

#undef SOURCE_MARK_PREPEND

static uintptr_t
print_text_element (ELEMENT *element, int level, const char *prepended,
                    uintptr_t current_nr, TEXT *result,
                    const char *fname_encoding, int use_filename)
{
  const char *type = 0;
  char *element_text = debug_protect_eol (element->e.text->text);

  if (element->flags & EF_inserted)
    text_append_n (result, "(i)", 3);

  if (element->type != ET_normal_text)
    type = type_data[element->type].name;
  if (type)
    text_printf (result, "{%s:%s}\n", type, element_text);
  else
    text_printf (result, "{%s}\n", element_text);
  free (element_text);

  current_nr = print_source_marks (element, level, prepended,
                                   current_nr, result, fname_encoding,
                                   use_filename);

  return current_nr;
}

typedef struct ADDITIONAL_INFO_NAME_VAL {
    const char *name;
    char *value;
    int need_eol;
} ADDITIONAL_INFO_NAME_VAL;

typedef struct ADDITIONAL_INFO_NAME_VAL_LIST {
    size_t number;
    size_t space;
    ADDITIONAL_INFO_NAME_VAL *list;
} ADDITIONAL_INFO_NAME_VAL_LIST;

static void
add_info_name_value (ADDITIONAL_INFO_NAME_VAL_LIST *info_strings,
                           const char *name, const char *value, int need_eol)
{
  ADDITIONAL_INFO_NAME_VAL *name_value;
  if (info_strings->number + 1 >= info_strings->space)
    {
      info_strings->space += 5;
      info_strings->list = (ADDITIONAL_INFO_NAME_VAL *)
        realloc (info_strings->list, info_strings->space
                                     * sizeof (ADDITIONAL_INFO_NAME_VAL));
      if (!info_strings->list)
        fatal ("realloc failed");
    }

  name_value = &info_strings->list[info_strings->number];
  name_value->name = name;
  name_value->value = strdup (value);
  name_value->need_eol = need_eol;

  info_strings->number++;
}

static int
compare_name_value (const void *a, const void *b)
{
  const ADDITIONAL_INFO_NAME_VAL *anv_a = (const ADDITIONAL_INFO_NAME_VAL *) a;
  const ADDITIONAL_INFO_NAME_VAL *anv_b = (const ADDITIONAL_INFO_NAME_VAL *) b;

  return strcmp (anv_a->name, anv_b->name);
}

#define ADDITIONAL_INFO_PREPEND "|"

/* INFO_STRING is a list of key values (plus "need end of line" hint).
   The function sorts the list and append to RESULT taking into account
   LEVEL indentation level and PREPENDED text.
 */
static void
print_info_strings (ADDITIONAL_INFO_NAME_VAL_LIST *info_strings, int level,
                    const char *prepended, TEXT *result, const char *header)
{
  size_t i;
  int j;
  char *info_prepended;

  if (info_strings->number == 0)
    return;

  if (prepended)
    xasprintf (&info_prepended, "%s%s", prepended,
               ADDITIONAL_INFO_PREPEND);
  else
    info_prepended = ADDITIONAL_INFO_PREPEND;

  qsort (info_strings->list, info_strings->number,
         sizeof (ADDITIONAL_INFO_NAME_VAL), compare_name_value);

  for (j = 0; j < level; j++)
    text_append_n (result, " ", 1);
  text_append (result, info_prepended);
  text_append (result, header);
  text_append_n (result, "\n", 1);

  for (i = 0; i < info_strings->number; i++)
    {
      ADDITIONAL_INFO_NAME_VAL *name_value = &info_strings->list[i];

      for (j = 0; j < level; j++)
        text_append_n (result, " ", 1);
      text_append (result, info_prepended);
      text_append (result, name_value->name);
      text_append_n (result, ":", 1);
      if (name_value->need_eol)
        text_append_n (result, "\n", 1);
      text_append (result, name_value->value);
      if (!name_value->need_eol)
        text_append_n (result, "\n", 1);

      free (name_value->value);
    }

  free (info_strings->list);

  if (prepended)
    free (info_prepended);
}

static void
add_info_name_string_value (ADDITIONAL_INFO_NAME_VAL_LIST *info_strings,
                            const char *name, const char *value)
{
  char *string;
  if (!value)
    xasprintf (&string, "%s", " UNDEF");
  else
    xasprintf (&string, "{%s}", value);
  add_info_name_value (info_strings, name, string, 0);
  free (string);
}

static uintptr_t
print_element_add_prepend_info (ELEMENT *element, int level,
                                const char *prepended, uintptr_t current_nr,
                                TEXT *result, const char *fname_encoding,
                                int use_filename)
{
  char *info_prepended;
  if (prepended)
    xasprintf (&info_prepended, "%s%s", prepended,
               ADDITIONAL_INFO_PREPEND);
  else
    info_prepended = ADDITIONAL_INFO_PREPEND;

  current_nr = print_tree_details (element, level, info_prepended,
                          current_nr, result, fname_encoding, use_filename);

  if (prepended)
    free (info_prepended);

  return current_nr;
}


static uintptr_t
print_element_info (ELEMENT *element, int level,
                    const char *prepended, uintptr_t current_nr,
                    TEXT *result, const char *fname_encoding, int use_filename)
{
  int i;
  TEXT info_e_text;
  ADDITIONAL_INFO_NAME_VAL_LIST info_strings;
  const char *cmdname;

  memset (&info_strings, 0, sizeof (ADDITIONAL_INFO_NAME_VAL_LIST));

  if (element->flags & EF_inserted)
    add_info_name_string_value (&info_strings, "inserted", "1");

  text_init (&info_e_text);

  for (i = 0; i < type_data[element->type].elt_info_number; i++)
    {
      ELEMENT *info_element = element->elt_info[i];
      if (info_element)
        {
          text_append (&info_e_text, "");
          current_nr = set_element_tree_numbers (info_element, current_nr);

          current_nr = print_element_add_prepend_info (info_element,
                              level+1, prepended, current_nr, &info_e_text,
                              fname_encoding, use_filename);

          add_info_name_value (&info_strings, elt_info_names[i],
                               info_e_text.text, 1);
          text_reset (&info_e_text);
        }
    }
  free (info_e_text.text);

  cmdname = element_command_name (element);
  if (cmdname)
    {
      if (element->e.c->string_info[sit_alias_of])
        add_info_name_string_value (&info_strings, "alias_of",
                      element->e.c->string_info[sit_alias_of]);
      if (element->e.c->cmd == CM_verb
               && element->e.c->contents.number > 0
               && element->e.c->string_info[sit_delimiter])
        add_info_name_string_value (&info_strings, "delimiter",
                          element->e.c->string_info[sit_delimiter]);
    }

  print_info_strings (&info_strings, level, prepended, result, "INFO");

  return current_nr;
}

/* not called for now as there are no extra element, content, direction
 */
char *
element_number_or_error (const ELEMENT *element)
{
  char *result;
  if (element->flags & EF_numbered)
    {
      int elt_info_nr = type_data[element->type].elt_info_number;
      xasprintf (&result, "E%" PRIuPTR, element->elt_info[elt_info_nr]);
    }
  else
    {
      char *element_debug = print_element_debug (element, 0);
      xasprintf (&result, "MISSING: %s", element_debug);
      free (element_debug);
    }
  return result;
}

static char *
print_root_command (const ELEMENT *element)
{
  ELEMENT *argument_line = element->e.c->contents.list[0];
  if (argument_line->e.c->contents.number > 0)
    {
      ELEMENT *line_arg = argument_line->e.c->contents.list[0];
      if (line_arg->e.c->contents.number > 0)
        {
          char *root_command_texi
            = convert_contents_to_texinfo (line_arg);
          return root_command_texi;
        }
    }
  return 0;
}

char *
root_command_element_string (const ELEMENT *element)
{
  char *root_command_texi = print_root_command (element);

  if (element->e.c->cmd && element->e.c->cmd != CM_node)
    {
      char *section_heading_number
        = lookup_extra_string (element, AI_key_section_heading_number);

      if (section_heading_number && strlen (section_heading_number))
        {
          if (root_command_texi)
            {
              char *result;
              xasprintf (&result, "%s %s", section_heading_number,
                         root_command_texi);
              free (root_command_texi);
              return result;
            }
          return strdup (section_heading_number);
        }
    }
  return root_command_texi;
}

/* NOTE there are currently no extra element, content, direction
 */
static uintptr_t
print_element_extra (ELEMENT *element, int level,
                    const char *prepended, uintptr_t current_nr,
                    TEXT *result, const char *fname_encoding, int use_filename)
{
  size_t i;

  TEXT info_e_text;
  ADDITIONAL_INFO_NAME_VAL_LIST info_strings;
  ASSOCIATED_INFO *a = &element->e.c->extra_info;
  STRING_LIST elements_values_list;

  memset (&info_strings, 0, sizeof (ADDITIONAL_INFO_NAME_VAL_LIST));
  memset (&elements_values_list, 0, sizeof (STRING_LIST));

  text_init (&info_e_text);

  #define store_flag(flag) \
  if (element->flags & EF_##flag) \
    add_info_name_string_value (&info_strings, #flag, "1");

  /* node */
  store_flag(isindex)
  /* node, anchor, float */
  store_flag(is_target)
  /* def_line for block/line for @def*x */
  store_flag(omit_def_name_space)
  /* @def*x */
  store_flag(not_after_command)
  /* @*table */
  store_flag(command_as_argument_kbd_code)
  store_flag(invalid_syntax)
  /* kbd */
  store_flag(code)
  /* ET_paragraph */
  store_flag(indent)
  /* ET_paragraph */
  store_flag(noindent)

  for (i = 0; i < a->info_number; i++)
    {
      const KEY_PAIR *k_pair = &a->info[i];
      int need_eol = 0;
      int need_free = 1;
      int is_string = 0;
      char *value;
      switch (associated_info_table[k_pair->key].type)
        {
        case extra_string:
          value = k_pair->k.string;
          is_string = 1;
          need_free = 0;
          break;
        case extra_integer:
          xasprintf (&value, "%d", k_pair->k.integer);
          is_string = 1;
          break;
        case extra_element:
          {
            const ELEMENT *element = k_pair->k.const_element;
            char *element_value = element_number_or_error (element);
            xasprintf (&value, "[%s]", element_value);
            free (element_value);
            break;
          }
        case extra_element_oot:
          {
            TEXT info_e_text;
            text_init (&info_e_text);
            text_append (&info_e_text, "");
            current_nr
              = set_element_tree_numbers (k_pair->k.element, current_nr);
            current_nr
              = print_element_add_prepend_info (k_pair->k.element, level+1,
                                       prepended, current_nr, &info_e_text,
                                       fname_encoding, use_filename);
            value = info_e_text.text;
            need_eol = 1;
            break;
          }
        case extra_misc_args:
          {
            char *values_string = join_strings_list (k_pair->k.strings_list);
            xasprintf (&value, "A{%s}", values_string);
            free (values_string);
            break;
          }
        case extra_index_entry:
          {
            const INDEX_ENTRY_LOCATION *entry_loc = k_pair->k.index_entry;
            xasprintf (&value, "I{%s,%d}",
                       entry_loc->index_name, entry_loc->number);
            break;
          }
        case extra_container:
          { /* node_content and node_manual */
            /* Contains references to elements in tree, but these are
               text elements that we do not want to number, so instead we
               present the Texinfo code */
            char *container_value = convert_to_texinfo (k_pair->k.element);
            /* can contain end of line if it corresponds to a @ref first
               argument */
            value = debug_protect_eol (container_value);
            free (container_value);
            is_string = 1;
            break;
          }
        case extra_contents:
          {
            size_t j;
            const CONST_ELEMENT_LIST *l = k_pair->k.const_list;
            char *joined_values;
            for (j = 0; j < l->number; j++)
              {
                const ELEMENT *e = l->list[j];
                char *element_value = element_number_or_error (e);
                add_string (element_value, &elements_values_list);
                free (element_value);
              }
            joined_values = join_strings_list (&elements_values_list);
            clear_strings_list (&elements_values_list);
            xasprintf (&value, "EC[%s]", joined_values);
            free (joined_values);
            break;
          }
        case extra_directions:
          {
            size_t d;
            const ELEMENT * const *l = k_pair->k.directions;
            char *joined_values;

            for (d = 0; d < directions_length; d++)
              {
                if (l[d])
                  {
                    const char *d_key = direction_names[d];
                    const ELEMENT *e = l[d];
                    char *element_str = element_number_or_error (e);
                    char *direction_value;
                    xasprintf (&direction_value, "%s->%s", d_key, element_str);
                    free (element_str);
                    add_string (direction_value, &elements_values_list);
                    free (direction_value);
                  }
              }
            joined_values = join_strings_list (&elements_values_list);
            clear_strings_list (&elements_values_list);
            xasprintf (&value, "D[%s]", joined_values);
            free (joined_values);
            break;
          }
        case extra_none:
          continue;
          break;
        default:
          need_free = 0;
          value = "UNKNOWN";
          break;
        }

      if (!is_string)
        add_info_name_value (&info_strings,
                             associated_info_table[k_pair->key].name,
                             value, need_eol);
      else
        add_info_name_string_value (&info_strings,
                                    associated_info_table[k_pair->key].name,
                                    value);

      if (need_free)
        free (value);
    }
  free (elements_values_list.list);

  print_info_strings (&info_strings, level, prepended, result, "EXTRA");
  return current_nr;
}

#undef ADDITIONAL_INFO_PREPEND

/* a number is given in argument as out of tree elements may need to be
   numbered too */
uintptr_t
print_element_details (ELEMENT *element, int level, const char *prepended,
                              uintptr_t current_nr, TEXT *result,
                              const char *fname_encoding, int use_filename)
{
  int j;
  enum command_id data_cmd = 0;
  const char *cmdname;
  SOURCE_INFO *source_info;

  for (j = 0; j < level; j++)
    text_append_n (result, " ", 1);

  if (prepended)
    text_append (result, prepended);

  if (type_data[element->type].flags & TF_text)
    {
      current_nr = print_text_element (element, level, prepended,
                                       current_nr, result, fname_encoding,
                                       use_filename);
      return current_nr;
    }

  text_append_n (result, "*", 1);

  if (element->flags & EF_numbered)
    {
      int elt_info_nr = type_data[element->type].elt_info_number;
      text_printf (result, "%" PRIuPTR " ", element->elt_info[elt_info_nr]);
    }

  if (element->type
      && !(type_data[element->type].flags & TF_c_only))
    text_append (result, type_data[element->type].name);

  cmdname = debug_element_command_name (element);
  if (cmdname)
    text_printf (result, "@%s", debug_element_command_name (element));

  if (element->e.c->contents.number > 0)
    text_printf (result, " C%zu", element->e.c->contents.number);

  source_info = &element->e.c->source_info;

  if (source_info->file_name || source_info->line_nr || source_info->macro)
    {
       text_append_n (result, " ", 1);

       print_source_info_details (source_info, result, fname_encoding,
                                  use_filename);
    }

  if (element->e.c->cmd)
    data_cmd = element_builtin_data_cmd (element);

  if (data_cmd
      && builtin_command_data[data_cmd].flags & CF_root)
    {
      ELEMENT *argument_line = element->e.c->contents.list[0];
      if (argument_line->e.c->contents.number > 0)
        {
          ELEMENT *line_arg = argument_line->e.c->contents.list[0];
          if (line_arg->e.c->contents.number > 0)
            {
              char *root_command_texi
                = convert_contents_to_texinfo (line_arg);
              text_printf (result, " {%s}", root_command_texi);
              free (root_command_texi);
            }
        }
    }

  text_append_n (result, "\n", 1);

  current_nr = print_element_info (element, level, prepended,
                                   current_nr, result, fname_encoding,
                                   use_filename);

  current_nr = print_element_extra (element, level, prepended,
                                    current_nr, result, fname_encoding,
                                    use_filename);

  current_nr = print_source_marks (element, level, prepended,
                                   current_nr, result, fname_encoding,
                                   use_filename);
  return current_nr;
}

uintptr_t
print_tree_details (ELEMENT *element, int level, const char *prepended,
                              uintptr_t current_nr, TEXT *result,
                              const char *fname_encoding, int use_filename)
{
  current_nr = print_element_details (element, level, prepended,
                      current_nr, result, fname_encoding, use_filename);

  if (!(type_data[element->type].flags & TF_text))
    {
      size_t i;

      for (i = 0; i < element->e.c->contents.number; i++)
        current_nr
          = print_tree_details (element->e.c->contents.list[i], level +1,
                                prepended, current_nr, result,
                                fname_encoding, use_filename);
    }

  return current_nr;
}

void
remove_element_tree_numbers (ELEMENT *element)
{
  size_t i;
  ASSOCIATED_INFO *a;

  if (type_data[element->type].flags & TF_text)
    return;

  a = &element->e.c->extra_info;

  if (element->flags & EF_numbered)
    {
      int elt_info_nr = type_data[element->type].elt_info_number;

      if (elt_info_nr > 0)
        {
          element->elt_info = (ELEMENT **) realloc (element->elt_info,
                               sizeof (ELEMENT *) * elt_info_nr);
          if (!element->elt_info)
            fatal ("realloc failed");
        }
      else
        {
          free (element->elt_info);
          element->elt_info = 0;
        }

      element->flags &= ~EF_numbered;
    }

  for (i = 0; i < a->info_number; i++)
    {
      const KEY_PAIR *k_pair = &a->info[i];
      switch (associated_info_table[k_pair->key].type)
        {
        case extra_element_oot:
          remove_element_tree_numbers (k_pair->k.element);
          break;
        default:
          break;
        }
    }

  for (i = 0; i < element->e.c->contents.number; i++)
    remove_element_tree_numbers (element->e.c->contents.list[i]);
}

/* no reference to other elements in extra information currently
   (no extra element, content, direction), therefore no need for
   element numbers to refer to.
   The calls to set_element_tree_numbers and remove_element_tree_numbers
   are thus commented out.
 */
char *
tree_print_details (ELEMENT *tree, const char *fname_encoding,
                    int use_filename)
{
  TEXT result;
  uintptr_t current_nr = 0;

  text_init (&result);
  text_append (&result, "");

  /*
  current_nr = set_element_tree_numbers (tree, 0);
   */

  print_tree_details (tree, 0, 0, current_nr, &result, fname_encoding,
                         use_filename);

  /*
  remove_element_tree_numbers (tree);
   */

  return result.text;
}

/* for debugging */
char *
element_print_details (ELEMENT *element, const char *fname_encoding,
                       int use_filename)
{
  TEXT result;

  text_init (&result);
  text_append (&result, "");

  print_element_details (element, 0, 0, 0, &result, fname_encoding,
                         use_filename);

  return result.text;
}



/* the caller should make sure that the tree is not a text element */
/* TODO add recursion in elements_oot, or in modified elements?
   It is not clear whether this should be in modify_tree, or in &OPERATION.
 */
ELEMENT *
modify_tree (ELEMENT *tree,
             ELEMENT_LIST *(*operation)(const char *type, ELEMENT *element, void* argument),
             void *argument)
{
  if (tree->e.c->contents.number > 0)
    {
      size_t i;
      for (i = 0; i < tree->e.c->contents.number; i++)
        {
          ELEMENT *content = tree->e.c->contents.list[i];
          ELEMENT_LIST *new_contents;
          new_contents = (*operation) ("content", content, argument);
          if (new_contents)
            {
              /* *operation should take care of destroying removed element */
              remove_from_contents (tree, i);
              insert_list_slice_into_contents (tree, i,
                                              new_contents, 0,
                                              new_contents->number);
              i += new_contents->number -1;
              destroy_list (new_contents);
            }
          else if (! (type_data[content->type].flags & TF_text))
            modify_tree (content, operation, argument);
        }
    }
  /* this is probably unneeded, the call on each element of the
     tree just above allows to modify source marks already.

  if (tree->source_mark_list != 0)
    {
      size_t i;
      for (i = 0; i < tree->source_mark_list->number; i++)
        {
          if (tree->source_mark_list->list[i]->element)
            {
              ELEMENT_LIST *new_element;
              new_element = (*operation) ("source_mark",
                                     tree->source_mark_list->list[i]->element,
                                          argument);
              if (new_element)
                {
   */
               /* *operation should take care of destroying removed element */
  /*
                  tree->source_mark_list->list[i]->element
                      = new_element->list[0];
                  destroy_list (new_element);
                }
            }
        }
    }
   */
  return tree;
}

ELEMENT *
new_asis_command_with_text (const char *text, ELEMENT *parent,
                            enum element_type type)
{
  ELEMENT *new_command = new_command_element (ET_brace_command, CM_asis);
  ELEMENT *brace_container = new_element (ET_brace_container);
  ELEMENT *text_elt = new_text_element (type);
  if (parent)
    new_command->e.c->parent = parent;
  add_to_element_contents (new_command, brace_container);
  text_append (text_elt->e.text, text);
  add_to_contents_as_array (brace_container, text_elt);
  return new_command;
}

static ELEMENT_LIST *
protect_text (ELEMENT *current, const char *to_protect)
{
  /* we accept any non raw text as text to be protected, including whitespaces
     only text elements */
  if (type_data[current->type].flags & TF_text
      && current->e.text->end > 0 && !(current->type == ET_raw
                                    || current->type == ET_rawline_text)
      && strpbrk (current->e.text->text, to_protect))
    {
      ELEMENT_LIST *container = new_list ();
      char *p = current->e.text->text;
      /* count UTF-8 encoded Unicode characters for source marks locations */
      uint8_t *u8_text = 0;
      size_t current_position;
      const uint8_t *u8_p = 0;
      size_t u8_len;

      if (current->source_mark_list)
        {
          u8_text = utf8_from_string (p);
          u8_p = u8_text;

          current_position = 0;
        }

      while (*p)
        {
          size_t leading_nr = strcspn (p, to_protect);
          ELEMENT *text_elt = new_text_element (current->type);
          if (leading_nr)
            {
              text_append_n (text_elt->e.text, p, leading_nr);
              p += leading_nr;
            }
          /*
          Note that it includes for completeness the case of leading_nr == 0
          although it is unclear that source marks may happen in that case
          as they are rather associated to the previous element.
           */
          if (u8_text)
            {
              u8_len = u8_mbsnlen (u8_p, leading_nr);
              u8_p += u8_len;

              current_position
                = relocate_source_marks (current->source_mark_list,
                                        text_elt,
                                        current_position, u8_len);
            }

          if (leading_nr || text_elt->source_mark_list)
            add_to_element_list (container, text_elt);
          else
            destroy_element (text_elt);

          if (*p)
            {
              size_t to_protect_nr = strspn (p, to_protect);
              if (!strcmp (to_protect, ","))
                {
                  size_t i;
                  for (i = 0; i < to_protect_nr; i++)
                    {
                      ELEMENT *comma
                       = new_command_element (ET_brace_command,
                                              CM_comma);
                      ELEMENT *brace_container
                           = new_element (ET_brace_container);
                      add_to_element_contents (comma, brace_container);
                      add_to_element_list (container, comma);
                      if (u8_text)
                        {
                          u8_len = u8_mbsnlen (u8_p, 1);
                          u8_p += u8_len;

                        current_position
                          = relocate_source_marks (current->source_mark_list,
                                                   comma,
                                                   current_position, u8_len);
                        }
                    }
                  p += to_protect_nr;
                }
              else
                {
                  ELEMENT *new_command;
                  char saved = p[to_protect_nr];
                  p[to_protect_nr] = '\0';
                  new_command = new_asis_command_with_text (p, 0,
                                                            current->type);
                  add_to_element_list (container, new_command);
                  if (u8_text)
                    {
                      u8_len = u8_mbsnlen (u8_p, to_protect_nr);
                      u8_p += u8_len;

                      current_position
                       = relocate_source_marks (current->source_mark_list,
                    new_command->e.c->contents.list[0]->e.c->contents.list[0],
                                              current_position, u8_len);
                    }
                  p += to_protect_nr;
                  *p = saved;
                }
            }
        }
      free (u8_text);
      destroy_element (current);
      return container;
    }
  else
    return 0;
}

static ELEMENT_LIST *
protect_colon (const char *type, ELEMENT *current, void *argument)
{
  return protect_text (current, ":");
}

ELEMENT *
protect_colon_in_tree (ELEMENT *tree)
{
  return modify_tree (tree, &protect_colon, 0);
}

void
protect_colon_in_document (DOCUMENT *document)
{
  protect_colon_in_tree (document->tree);
  document->modified_information |= F_DOCM_tree;
}

static ELEMENT_LIST *
protect_comma (const char *type, ELEMENT *current, void *argument)
{
  return protect_text (current, ",");
}

ELEMENT *
protect_comma_in_tree (ELEMENT *tree)
{
  return modify_tree (tree, &protect_comma, 0);
}

void
protect_comma_in_document (DOCUMENT *document)
{
  protect_comma_in_tree (document->tree);
  document->modified_information |= F_DOCM_tree;
}

static ELEMENT_LIST *
protect_node_after_label (const char *type, ELEMENT *current, void *argument)
{
  return protect_text (current, ".\t,");
}

ELEMENT *
protect_node_after_label_in_tree (ELEMENT *tree)
{
  return modify_tree (tree, &protect_node_after_label, 0);
}

void
protect_node_after_label_in_document (DOCUMENT *document)
{
  protect_node_after_label_in_tree (document->tree);
  document->modified_information |= F_DOCM_tree;
}



const char *
normalized_menu_entry_internal_node (const ELEMENT *entry)
{
  size_t i;
  for (i = 0; i < entry->e.c->contents.number; i++)
    {
      const ELEMENT *content = entry->e.c->contents.list[i];
      if (content->type == ET_menu_entry_node)
        {
          if (!lookup_extra_container (content, AI_key_manual_content))
            {
              return lookup_extra_string (content, AI_key_normalized);
            }
          return 0;
        }
    }
  return 0;
}

ELEMENT *
normalized_entry_associated_internal_node (const ELEMENT *entry,
                                  const C_HASHMAP *identifiers_target)
{
  const char *normalized_entry_node = normalized_menu_entry_internal_node (entry);
  if (normalized_entry_node)
    {
      ELEMENT *node = find_identifier_target (identifiers_target,
                                              normalized_entry_node);
      return node;
    }
  return 0;
}

const ELEMENT *
first_menu_node (const NODE_RELATIONS *node_relations,
                 const C_HASHMAP *identifiers_target)
{
  const CONST_ELEMENT_LIST *menus = node_relations->menus;
  if (menus)
    {
      size_t i;
      for (i = 0; i < menus->number; i++)
        {
          const ELEMENT *menu = menus->list[i];
          size_t j;
          for (j = 0; j < menu->e.c->contents.number; j++)
            {
              const ELEMENT *menu_content = menu->e.c->contents.list[j];
              if (menu_content->type == ET_menu_entry)
                {
                  size_t k;
                  const ELEMENT *menu_node
                    = normalized_entry_associated_internal_node (menu_content,
                                                          identifiers_target);
                  /* an internal node */
                  if (menu_node)
                    return menu_node;

                  for (k = 0; menu_content->e.c->contents.number; k++)
                    {
                      const ELEMENT *content
                        = menu_content->e.c->contents.list[k];
                      if (content->type == ET_menu_entry_node)
                        {
                          const ELEMENT *manual_content
                           = lookup_extra_container (content,
                                                  AI_key_manual_content);
                          /* a reference to an external manual */
                          if (manual_content)
                            return content;
                          break;
                        }
                    }
                }
            }
        }
    }
  return 0;
}

