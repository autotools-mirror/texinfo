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
#include <string.h>
#include <stdlib.h>
#include <stdio.h>

#include "tree_types.h"
/* for new_list */
#include "tree.h"
/* for fatal */
#include "base_utils.h"
/* for directions_length */
#include "utils.h"
#include "debug.h"
#include "extra.h"

KEY_PAIR *
get_associated_info_key (ASSOCIATED_INFO *a, enum ai_key_name key)
{
  size_t i;
  for (i = 0; i < a->info_number; i++)
    {
      if (a->info[i].key == key)
        {
          destroy_key_pair_value (&a->info[i]);
          break;
        }
    }
  if (i == a->info_number)
    {
      if (a->info_number == a->info_space)
        {
          a->info = realloc (a->info,
                              (a->info_space += 5) * sizeof (KEY_PAIR));
          if (!a->info)
            fatal ("realloc failed");
        }
      a->info_number++;

      a->info[i].key = key;
    }

  return &a->info[i];
}

static int
check_key_type_or_abort (enum ai_key_name key, enum extra_type type,
                         const char *error_string)
{
  enum extra_type k_type = associated_info_table[key].type;

  if (k_type != type)
    {
      char *msg;
      xasprintf (&msg, "Bad type for %s: %s: %d", error_string,
                associated_info_table[key].name, k_type);
      fatal (msg);
      free (msg);
      return 0;
    }
  else
    return 1;
}

/* Add an extra key that is a reference to another element (for example,
   'associated_section' on a node command element. */
/* The extra element is marked as const because, as a general rule, an
   extra element should not be modified when accessed through
   lookup_extra_element as it refers to another part of the tree.
   In addition, tree elements should not be modified in converters.
   Having the element registered here as const and lookup_extra_element
   return const helps guarding against errors.

   However, during the structuring/tree transformation phase, an element
   obtained through lookup_extra_element could need to be modified (addition
   of menus, for example).  The element could also be modified when a
   reference to Perl is needed when building to Perl.  When the tree is
   copied, the source tree elements are temporarily modified.  For those
   cases, a cast should be (and is) used to remove the const.
 */
void
add_extra_element (ELEMENT *e, enum ai_key_name key, const ELEMENT *value)
{
  if (check_key_type_or_abort (key, extra_element, "add_extra_element"))
    {
      KEY_PAIR *k = get_associated_info_key (&e->e.c->extra_info, key);
      k->k.const_element = value;
    }
}

/* Add an extra key that is a reference to another element that is
   out-of-tree, i.e., not referenced anywhere in the tree.
*/
void
add_extra_element_oot (ELEMENT *e, enum ai_key_name key, ELEMENT *value)
{
  if (check_key_type_or_abort (key, extra_element_oot,
                               "add_extra_element_oot"))
    {
      KEY_PAIR *k = get_associated_info_key (&e->e.c->extra_info, key);
      k->k.element = value;
    }
}

/* Add an extra key that is a reference to elements elsewhere in the tree,
   in general in the contents array of another element (for example,
   'node_content' on a node direction element contents).
   Similar to extra_contents, but passed to Perl as an element with
   contents.
 */
void
add_extra_container (ELEMENT *e, enum ai_key_name key, ELEMENT *value)
{
  if (check_key_type_or_abort (key, extra_container, "add_extra_container"))
    {
      KEY_PAIR *k = get_associated_info_key (&e->e.c->extra_info, key);
      k->k.element = value;
    }
}

/* Add an extra key that is a reference to an array of other
   elements (for example, 'section_children').
   Check if it already exists, unless NO_LOOKUP is set
   if the caller knows that the array has not been set
   already.

   A list of const elements is used as the extra contents
   contain elements from elsewhere in the tree.  See the comment
   before add_extra_element for more on that subject and on casting
   the elements from the list to remove const if needed.
*/
CONST_ELEMENT_LIST *
add_extra_contents (ELEMENT *e, enum ai_key_name key, int no_lookup)
{
  if (check_key_type_or_abort (key, extra_contents, "add_extra_contents"))
    {
      CONST_ELEMENT_LIST *n_list;
      if (!no_lookup)
        {
          CONST_ELEMENT_LIST *e_list = lookup_extra_contents (e, key);
          if (e_list)
            return e_list;
        }

      n_list = new_const_element_list ();
      KEY_PAIR *k = get_associated_info_key (&e->e.c->extra_info, key);
      k->k.const_list = n_list;
      return n_list;
    }

  return 0;
}

/* Holds 3 elements corresponding to directions in enum directions.

  The elements are set const because directions are set after the tree is
  done and, as a rule, the elements should not be modified when accessed
  from directions.  When the element need to be modified, the const is removed
  with a cast.  This happens when associating to a reference on a Perl
  object when building the Perl tree, and when copying the tree, as the
  element is temporarily modified in that case.
*/
const ELEMENT **
add_extra_directions (ELEMENT *e, enum ai_key_name key)
{
  if (check_key_type_or_abort (key, extra_directions, "add_extra_directions"))
    {
      const ELEMENT **e_list = lookup_extra_directions (e, key);
      if (e_list)
        return e_list;
      else
        {
          const ELEMENT **n_list = new_directions ();
          KEY_PAIR *k = get_associated_info_key (&e->e.c->extra_info, key);
          k->k.directions = n_list;
          return n_list;
        }
    }

  return 0;
}

void
add_extra_string_list (ELEMENT *e, enum ai_key_name key, STRING_LIST *value)
{
  if (!value) return;

  if (check_key_type_or_abort (key, extra_string_list, "add_extra_string_list"))
    {
      KEY_PAIR *k = get_associated_info_key (&e->e.c->extra_info, key);
      k->k.strings_list = value;
    }
}

void
add_extra_index_entry (ELEMENT *e, enum ai_key_name key,
                       INDEX_ENTRY_LOCATION *value)
{
  if (!value) return;

  if (check_key_type_or_abort (key, extra_index_entry, "add_extra_index_entry"))
    {
      KEY_PAIR *k = get_associated_info_key (&e->e.c->extra_info, key);
      k->k.index_entry = value;
    }
}

void
add_extra_string (ELEMENT *e, enum ai_key_name key, char *value)
{
  if (check_key_type_or_abort (key, extra_string, "add_extra_string"))
    {
      KEY_PAIR *k = get_associated_info_key (&e->e.c->extra_info, key);
      k->k.string = value;
    }
}

void
add_extra_string_dup (ELEMENT *e, enum ai_key_name key, const char *value)
{
  if (check_key_type_or_abort (key, extra_string, "add_extra_string"))
    {
      KEY_PAIR *k = get_associated_info_key (&e->e.c->extra_info, key);
      k->k.string = strdup (value);
    }
}

void
add_extra_integer (ELEMENT *e, enum ai_key_name key, int value)
{
  if (check_key_type_or_abort (key, extra_integer, "add_extra_integer"))
    {
      KEY_PAIR *k = get_associated_info_key (&e->e.c->extra_info, key);
      k->k.integer = value;
    }
}

static KEY_PAIR *
lookup_associated_info (const ASSOCIATED_INFO *a, enum ai_key_name key)
{
  size_t i;
  for (i = 0; i < a->info_number; i++)
    {
      if (a->info[i].key == key)
        return &a->info[i];
    }
  return 0;
}

KEY_PAIR *
lookup_extra (const ELEMENT *e, enum ai_key_name key)
{
  return lookup_associated_info (&e->e.c->extra_info, key);
}

const ELEMENT *
lookup_extra_element (const ELEMENT *e, enum ai_key_name key)
{
  if (check_key_type_or_abort (key, extra_element, "lookup_extra_element"))
    {
      const KEY_PAIR *k = lookup_extra (e, key);
      if (k)
        return k->k.element;
    }
  return 0;
}

ELEMENT *
lookup_extra_element_oot (const ELEMENT *e, enum ai_key_name key)
{
  if (check_key_type_or_abort (key, extra_element_oot,
                               "lookup_extra_element_oot"))
    {
      const KEY_PAIR *k = lookup_extra (e, key);
      if (k)
        return k->k.element;
    }
  return 0;
}

ELEMENT *
lookup_extra_container (const ELEMENT *e, enum ai_key_name key)
{
  if (check_key_type_or_abort (key, extra_container, "lookup_extra_container"))
    {
      const KEY_PAIR *k = lookup_extra (e, key);
      if (k)
        return k->k.element;
    }
  return 0;
}

char *
lookup_extra_string (const ELEMENT *e, enum ai_key_name key)
{
  if (check_key_type_or_abort (key, extra_string, "lookup_extra_string"))
    {
      const KEY_PAIR *k = lookup_extra (e, key);
      if (k)
        return k->k.string;
    }
  return 0;
}

/* *ret is negative if not found or not an integer */
int
lookup_extra_integer (const ELEMENT *e, enum ai_key_name key, int *ret)
{
  if (check_key_type_or_abort (key, extra_integer, "lookup_extra_integer"))
    {
      const KEY_PAIR *k = lookup_extra (e, key);
      if (!k)
        {
          *ret = -1;
          return 0;
        }
      *ret = 0;
      return k->k.integer;
    }
  else
    *ret = -2;

  return 0;
}

CONST_ELEMENT_LIST *
lookup_extra_contents (const ELEMENT *e, enum ai_key_name key)
{
  if (check_key_type_or_abort (key, extra_contents, "lookup_extra_contents"))
    {
      const KEY_PAIR *k = lookup_extra (e, key);
      if (k)
        return k->k.const_list;
    }

  return 0;
}

const ELEMENT **
lookup_extra_directions (const ELEMENT *e, enum ai_key_name key)
{
  if (check_key_type_or_abort (key, extra_directions,
                               "lookup_extra_directions"))
    {
      const KEY_PAIR *k = lookup_extra (e, key);
      if (k)
        return k->k.directions;
    }
  return 0;
}

const STRING_LIST *
lookup_extra_string_list (const ELEMENT *e, enum ai_key_name key)
{
  if (check_key_type_or_abort (key, extra_string_list,
                               "lookup_extra_string_list"))
    {
      const KEY_PAIR *k = lookup_extra (e, key);
      if (k)
        return k->k.strings_list;
    }
  return 0;
}

const INDEX_ENTRY_LOCATION *
lookup_extra_index_entry (const ELEMENT *e, enum ai_key_name key)
{
  if (check_key_type_or_abort (key, extra_index_entry,
                               "lookup_extra_index_entry"))
    {
      const KEY_PAIR *k = lookup_extra (e, key);
      if (k)
        return k->k.index_entry;
    }
  return 0;
}

