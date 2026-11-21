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
#include <string.h>
#include <stdio.h>
#include <stddef.h>

#include "source_mark_types.h"
#include "text.h"
#include "tree_types.h"
#include "document_types.h"
#include "types_data.h"
/* for fatal */
#include "base_utils.h"
/* for destroy_strings_list */
#include "utils.h"
/* for debug
 */
#include "debug.h"
#include "errors.h"
#include "api_to_perl.h"
#include "tree.h"

/* to be kept in sync with enum elt_info_type */
const char *elt_info_names[] = {
};

const ASSOCIATED_INFO_DATA associated_info_table[] = {
  #define ai_key(name, type, data) \
 {AI_key_ ## name, extra_##type, #name, data}, \

   AI_KEYS_LIST
  #undef ai_key
};

static ELEMENT *alloc_element (void)
{
  ELEMENT *e;
  e = (ELEMENT *) malloc (sizeof (ELEMENT));
  memset (e, 0, sizeof (ELEMENT));
  return e;
}

ELEMENT *
new_element (enum element_type type)
{
  ELEMENT *e;

  /* alloc_element zeroes *e.  We assume null pointers have bit
     representation of all zeroes. */
  e = alloc_element ();
  e->type = type;

  e->e.c = (CONTAINER *) malloc (sizeof (CONTAINER));
  memset (e->e.c, 0, sizeof (CONTAINER));

  if (type_data[type].elt_info_number > 0)
    {
      e->elt_info = (ELEMENT **)
        malloc (sizeof (ELEMENT *) * type_data[type].elt_info_number);
      memset (e->elt_info, 0,
         sizeof (ELEMENT *) * type_data[type].elt_info_number);
    }

  return e;
}

ELEMENT *
new_command_element (enum element_type type, enum command_id cmd)
{
  ELEMENT *e = new_element (type);
  int string_info_nr = 1;

  e->e.c->cmd = cmd;

  if (type_data[type].flags & TF_with_command)
    string_info_nr = 2;

  e->e.c->string_info = (char **) malloc (string_info_nr * sizeof (char *));
  memset (e->e.c->string_info, 0, string_info_nr * sizeof (char *));

  return e;
}

ELEMENT *
new_text_element (enum element_type type)
{
  ELEMENT *e;
  e = alloc_element ();
  e->type = type;

  e->e.text = (TEXT *) malloc (sizeof (TEXT));
  text_init (e->e.text);
  text_append (e->e.text, "");

  return e;
}

ELEMENT_LIST *
new_list (void)
{
  ELEMENT_LIST *list = (ELEMENT_LIST *) malloc (sizeof (ELEMENT_LIST));
  memset (list, 0, sizeof (ELEMENT_LIST));
  return list;
}

void
destroy_list (ELEMENT_LIST *list)
{
  free (list->list);
  free (list);
}

CONST_ELEMENT_LIST *
new_const_element_list (void)
{
  CONST_ELEMENT_LIST *list
    = (CONST_ELEMENT_LIST *) malloc (sizeof (CONST_ELEMENT_LIST));
  memset (list, 0, sizeof (CONST_ELEMENT_LIST));
  return list;
}

void
destroy_const_element_list (CONST_ELEMENT_LIST *list)
{
  free (list->list);
  free (list);
}

void
destroy_key_pair_value (KEY_PAIR *k_pair)
{
  switch (associated_info_table[k_pair->key].type)
    {
    case extra_string:
      free (k_pair->k.string);
      break;
    case extra_element_oot:
      destroy_element_and_children (k_pair->k.element);
      break;
    case extra_contents:
      destroy_const_element_list (k_pair->k.const_list);
      break;
    case extra_directions:
      free (k_pair->k.directions);
      break;
    case extra_container:
      if (k_pair->k.element)
        destroy_element (k_pair->k.element);
      break;
    case extra_string_list:
      destroy_strings_list (k_pair->k.strings_list);
      break;
    case extra_integer_list:
      free (k_pair->k.integers_list->list);
      free (k_pair->k.integers_list);
      break;
    case extra_index_entry:
      free (k_pair->k.index_entry->index_name);
      free (k_pair->k.index_entry);
      break;
    default:
      break;
    }
}

void
destroy_associated_info (ASSOCIATED_INFO *a)
{
  size_t i;

  for (i = 0; i < a->info_number; i++)
    {
      KEY_PAIR *k_pair = &a->info[i];
      destroy_key_pair_value (k_pair);
    }
  free (a->info);
}

void
destroy_source_mark (SOURCE_MARK *source_mark)
{
  if (source_mark->element)
    destroy_element_and_children (source_mark->element);
  if (source_mark->line)
    free (source_mark->line);
  free (source_mark);
}

void
destroy_source_mark_list (SOURCE_MARK_LIST *source_mark_list)
{
  size_t i;
  for (i = 0; i < source_mark_list->number; i++)
    destroy_source_mark (source_mark_list->list[i]);

  free (source_mark_list->list);
  free (source_mark_list);
}

/* does not free the source marks themselves */
void
free_element_source_mark_list (ELEMENT *e)
{
  free (e->source_mark_list->list);
  free (e->source_mark_list);
  e->source_mark_list = 0;
}

void
destroy_element_empty_source_mark_list (ELEMENT *e)
{
  if (e->source_mark_list && e->source_mark_list->number <= 0)
    free_element_source_mark_list (e);
}

/* NOTE if the tree elements are registered in document, the element is not
   nullified in the document->element_handles, nor are the Perl hash _handle and
   element_document_descriptor keys removed in this function.  Most likely a
   function should be added to do that before calling
   destroy_element, when/if dynamic removal of elements is possible.

   Since there are no elements registered in document in any code, this is not
   an issue.
 */
void
destroy_element (ELEMENT *e)
{
  /* remove the reference of the association with the C tree */
  if (e->sv)
    {
      ERROR_MESSAGE_LIST *error_messages = 0;
      /* this also removes one reference for the associated hv */
      unregister_perl_data (e->sv);

  /* For this check to be silent, the tree elements should have
     had all references released.  This is not enough to have codes
     that remove cycles in tree elements run, the codes that remove
     references should also run.  For the references held by output units,
     this is done when cycles in output units are removed.  For the other
     references, the Document destruction code should be called with
     reference to tree elements removal, which should be done if TEST > 1.

     Normally, the code setting the indicator is setup such that
     get_check_element_interpreter_refcount () should return
     true also if TEST > 1.
       */
      error_messages = get_check_element_interpreter_refcount ();
      if (error_messages)
        {
          void *hv = get_sv_hv (e->sv);
          int sv_refcount = get_refcount (e->sv);
          int hv_refcount = get_refcount (hv);

           /*
          if (1)
            */
          if (sv_refcount != 0 || hv_refcount != 0)
            {
              char *e_dbg_txt = print_element_debug (e, 0);
              const char *msg
                = "C Element refcount (%d, %d) for HV %p, SV %p; %s\n";
              fprintf (stderr, msg, sv_refcount, hv_refcount, hv, e->sv,
                       e_dbg_txt);
              message_list_document_warn_no_xlate (error_messages, 0, 0, msg,
                        sv_refcount, hv_refcount, hv, e->sv, e_dbg_txt);
            }
         /*
          fprintf (stderr, " DSV %p (sv:%d hv:%d) %s\n", hv,
                  sv_refcount, hv_refcount, print_element_debug (e, 0));
          */
        }

      e->sv = 0;
    }

  if (e->source_mark_list)
    destroy_source_mark_list (e->source_mark_list);

  if (type_data[e->type].flags & TF_text)
    {
      free (e->e.text->text);
      free (e->e.text);
    }
  else
    {
      int i;
      int string_info_nr = 0;
  /* Note the pointers in the list are not themselves freed. */
      free (e->e.c->contents.list);

      destroy_associated_info (&e->e.c->extra_info);

      for (i = 0; i < type_data[e->type].elt_info_number; i++)
        if (e->elt_info[i])
          destroy_element_and_children (e->elt_info[i]);
      free (e->elt_info);

      if (type_data[e->type].flags & TF_with_command)
        string_info_nr = 2;
      else if (e->e.c->cmd != CM_NONE)
        string_info_nr = 1;

      for (i = 0; i < string_info_nr; i++)
        free (e->e.c->string_info[i]);
      free (e->e.c->string_info);

      free (e->e.c);
    }

  free (e);
}

/* Recursively destroy this element and all data in its descendants. */
void
destroy_element_and_children (ELEMENT *e)
{
  size_t i;

  if (! (type_data[e->type].flags & TF_text))
    {
      for (i = 0; i < e->e.c->contents.number; i++)
        destroy_element_and_children (e->e.c->contents.list[i]);
      /* would be needed if a code accessed the contents in destroy_element
      e->e.c->contents.number = 0;
       */
    }

  destroy_element (e);
}

/* Make sure there is space for at least one more element. */
static void
reallocate_list (ELEMENT_LIST *list)
{
  if (list->number + 1 >= list->space)
    {
      list->space += 10;
      list->list = realloc (list->list, list->space * sizeof (ELEMENT *));
      if (!list->list)
        fatal ("realloc failed");
    }
}

/* Make sure there is space for at least N more elements. */
static void
reallocate_list_for (size_t n, ELEMENT_LIST *list)
{
  if (list->number + n >= list->space)
    {
      list->space += n + 1;
      list->list = realloc (list->list, list->space * sizeof (ELEMENT *));
      if (!list->list)
        fatal ("realloc failed");
    }
}

/* Make sure there is space for at least N more elements. */
static void
reallocate_const_element_list_for (size_t n, CONST_ELEMENT_LIST *list)
{
  if (list->number + n >= list->space)
    {
      list->space += n + 1;
      list->list = realloc (list->list, list->space * sizeof (const ELEMENT *));
      if (!list->list)
        fatal ("realloc failed");
    }
}

def_list_fns(CONST_ELEMENT_LIST, const_element, const ELEMENT *, 10);
def_list_fns(ELEMENT_LIST, element, ELEMENT *, 10);

/* should not be used for text elements */
void
add_to_element_contents (ELEMENT *parent, ELEMENT *e)
{
  ELEMENT_LIST *list = &parent->e.c->contents;
  add_(element) (list, e);
  e->e.c->parent = parent;
}

/* For text elements that do not have parent set or special purpose
   function for when we are only using PARENT as an
   array, and we don't want to overwrite or set E->e.c->parent. */
void
add_to_contents_as_array (ELEMENT *parent, ELEMENT *e)
{
  ELEMENT_LIST *list = &parent->e.c->contents;
  add_(element) (list, e);
}

/* to be used when it is not known whether the element is a text
   element, which has no parent set, or another element with parent */
void
add_element_to_element_contents (ELEMENT *parent, ELEMENT *e)
{
  ELEMENT_LIST *list = &parent->e.c->contents;
  add_(element) (list, e);

  if (!(type_data[e->type].flags & TF_text))
    e->e.c->parent = parent;
}

/* Add the element E into the LIST at index WHERE. */
void
insert_into_element_list (ELEMENT_LIST *list, ELEMENT *e, size_t where)
{
  reallocate_list (list);

  if (where > list->number)
    fatal ("elements list index out of bounds");

  memmove (&list->list[where + 1], &list->list[where],
           (list->number - where) * sizeof (ELEMENT *));
  list->list[where] = e;
  list->number++;
}

/* Add the element E into the contents of PARENT at index WHERE. */
void
insert_into_contents (ELEMENT *parent, ELEMENT *e, size_t where)
{
  ELEMENT_LIST *list = &parent->e.c->contents;
  insert_into_element_list (list, e, where);
  e->e.c->parent = parent;
}

/* do not set parent, mainly for text elements */
void
insert_into_contents_as_array (ELEMENT *parent, ELEMENT *e, size_t where)
{
  ELEMENT_LIST *list = &parent->e.c->contents;
  insert_into_element_list (list, e, where);
}

/* Insert elements to TO at position WHERE from FROM from START inclusive
   to END exclusive. */
void
insert_list_slice_into_list (ELEMENT_LIST *to, size_t where,
                             const ELEMENT_LIST *from, size_t start, size_t end)
{
  /* NOTE there could be theoretically an overflow if
     list->number + num > SIZE_MAX.  The numbers are big, this is unlikely
     to happen */
  size_t num = end - start;
  reallocate_list_for (num, to);

  memmove (&to->list[where + num],
           &to->list[where],
           (to->number - where) * sizeof (ELEMENT *));
  memmove (&to->list[where],
           &from->list[start],
           num * sizeof (ELEMENT *));

  to->number += num;
}

/* Insert elements to TO at position WHERE from FROM from START inclusive
   to END exclusive. */
void
insert_list_slice_into_const_list (CONST_ELEMENT_LIST *to, size_t where,
                             const ELEMENT_LIST *from, size_t start, size_t end)
{
  /* NOTE there could be theoretically an overflow if
     list->number + num > SIZE_MAX.  The numbers are big, this is unlikely
     to happen */
  size_t num = end - start;
  reallocate_const_element_list_for (num, to);

  memmove (&to->list[where + num],
           &to->list[where],
           (to->number - where) * sizeof (const ELEMENT *));
  memmove (&to->list[where],
           &from->list[start],
           num * sizeof (ELEMENT *));

  to->number += num;
}

/* Insert elements to the contents of TO at position WHERE from FROM contents
   from START inclusive to END exclusive.  Do not set the parent fields. */
void
insert_slice_into_contents (ELEMENT *to, size_t where, const ELEMENT *from,
                            size_t start, size_t end)
{
  insert_list_slice_into_list (&to->e.c->contents, where,
                               &from->e.c->contents, start, end);
}

/* Insert elements to the contents of TO at position WHERE from FROM
   from START inclusive to END exclusive. */
void
insert_list_slice_into_contents (ELEMENT *to, size_t where,
                                 const ELEMENT_LIST *from,
                                 size_t start, size_t end)
{
  insert_list_slice_into_list (&to->e.c->contents, where, from, start, end);
}

/* ensure that there are n slots, and void them */
/* Unused */
void
list_set_empty_contents (ELEMENT_LIST *e_list, size_t n)
{
  size_t i;
  if (n <= 0)
    return;

  if (e_list->number < n)
    {
      reallocate_list_for (n - e_list->number, e_list);
      e_list->number = n;
    }
  for (i = 0; i < n; i++)
    e_list->list[i] = 0;
}

ELEMENT *
remove_from_element_list (ELEMENT_LIST *list, size_t where)
{
  ELEMENT *removed;

  if (where > list->number -1)
    fatal ("element list index out of bounds");

  removed = list->list[where];
  if (where < list->number - 1)
    memmove (&list->list[where], &list->list[where + 1],
             (list->number - (where+1)) * sizeof (ELEMENT *));
  list->number--;
  return removed;
}

const ELEMENT *
remove_from_const_element_list (CONST_ELEMENT_LIST *list, size_t where)
{
  const ELEMENT *removed;

  if (where > list->number -1)
    fatal ("element list index out of bounds");

  removed = list->list[where];
  if (where < list->number - 1)
    memmove (&list->list[where], &list->list[where + 1],
             (list->number - (where+1)) * sizeof (ELEMENT *));
  list->number--;
  return removed;
}

ELEMENT *
remove_from_contents (ELEMENT *parent, size_t where)
{
  ELEMENT_LIST *list = &parent->e.c->contents;
  return remove_from_element_list (list, where);
}

void
add_element_if_not_in_list (ELEMENT_LIST *list, ELEMENT *e)
{
  size_t i;
  for (i = 0; i < list->number; i++)
    {
      if (list->list[i] == e)
        {
          return;
        }
    }
  add_(element) (list, e);
}

/* Remove elements from START inclusive to END exclusive.  Do not
   free any of them. */
void
remove_slice_from_contents (ELEMENT *parent, size_t start, size_t end)
{
  memmove (&parent->e.c->contents.list[start],
           &parent->e.c->contents.list[end],
           (parent->e.c->contents.number - end) * sizeof (ELEMENT *));

  parent->e.c->contents.number -= (end - start);
}


ELEMENT *
pop_element_from_contents (ELEMENT *parent)
{
  ELEMENT_LIST *list = &parent->e.c->contents;
  ELEMENT *popped_element = list->list[list->number -1];

  list->number--;

  return popped_element;
}

ELEMENT *
last_contents_child (const ELEMENT *current)
{
  if (current->e.c->contents.number == 0)
    return 0;

  return current->e.c->contents.list[current->e.c->contents.number - 1];
}

/* Remove or replace first REMOVED from LIST */
const ELEMENT *
replace_remove_list_element (ELEMENT_LIST *list, const ELEMENT *removed,
                             ELEMENT *added)
{
  size_t i;

  if (!list || !list->number)
    return 0;

  for (i = 0; i < list->number; i++)
    {
      if (list->list[i] == removed)
        {
          if (added)
            {
              list->list[i] = added;
              return removed;
            }
          else
            return remove_from_element_list (list, i);
        }
    }
  return 0;
}

const ELEMENT **
new_directions (void)
{
  const ELEMENT **result = (const ELEMENT **)  malloc ((D_up + 1)
                                             * sizeof (const ELEMENT *));
  memset (result, 0, (D_up + 1) * sizeof (const ELEMENT *));
  return result;
}


typedef struct ASSOCIATED_INFO_KEY_INDEX {
    enum ai_key_name key;
    const char *name;
} ASSOCIATED_INFO_KEY_INDEX;

#define ASSOCIATED_INFO_KEYS_NR (sizeof (associated_info_table) / sizeof (ASSOCIATED_INFO_DATA))

static ASSOCIATED_INFO_KEY_INDEX ai_key_name_index[ASSOCIATED_INFO_KEYS_NR];

static int
compare_associated_info_key_index (const void *a, const void *b)
{
  const ASSOCIATED_INFO_KEY_INDEX *aika = (ASSOCIATED_INFO_KEY_INDEX *) a;
  const ASSOCIATED_INFO_KEY_INDEX *aikb = (ASSOCIATED_INFO_KEY_INDEX *) b;

  return strcmp (aika->name, aikb->name);
}

enum ai_key_name
find_associated_info_key (const char *attribute)
{
  ASSOCIATED_INFO_KEY_INDEX *result;
  static ASSOCIATED_INFO_KEY_INDEX searched_key;
  searched_key.name = attribute;

  result = (ASSOCIATED_INFO_KEY_INDEX *)
    bsearch (&searched_key, ai_key_name_index, ASSOCIATED_INFO_KEYS_NR,
             sizeof (ASSOCIATED_INFO_KEY_INDEX),
             compare_associated_info_key_index);

  if (result)
    return result->key;
  else
    return 0;
}

/* initialization of library */
void
setup_ai_key_name_index (void)
{
  size_t i;

  for (i = 0; i < ASSOCIATED_INFO_KEYS_NR; i++)
    {
      ai_key_name_index[i].key = i;
      ai_key_name_index[i].name = associated_info_table[i].name;
    }

  qsort (ai_key_name_index, ASSOCIATED_INFO_KEYS_NR,
         sizeof (ASSOCIATED_INFO_KEY_INDEX),
         compare_associated_info_key_index);
}

#undef ASSOCIATED_INFO_KEYS_NR
