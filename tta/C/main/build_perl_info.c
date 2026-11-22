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

/* NOTE we store in AV lists indexed as size_t.  AV max size seems to be
   the max of SSize_t, if it is < SIZE_MAX there could theoretically be
   overflows.  However, Perl documentation says sizeof(SSize_t) == sizeof(Size_t)
   and "Size_t ... is usually size_t".  In addition these are very big numbers.
   In Perl documentation there is no description of a constant that would
   give the max of SSize_t.

   We build index numbers, document, output units and converter descriptors
   indexed as size_t to Perl SV using newSViv ((IV)descriptor).  There
   could theoretically be and overflow of IV if PERL_QUAD_MAX < SIZE_MAX.
   (PERL_QUAD_MAX is the max size of IV in Perl).  On an Intel 64 bit
   GNU Linux, PERL_QUAD_MAX is half of SIZE_MAX.  However those are
   big numbers, while the Texinfo command numbers are quite small and other
   descriptor numbers should be very small so this should not be an issue
   in practice.

   We also get IV and cast to size_t when getting info from Perl, like
   descriptor = (size_t) SvIV (descriptor_sv).  In that case there is no
   reason to overflow.
 */

/* for intptr_t */
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <stddef.h>

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "command_ids.h"
#include "element_types.h"
#include "types_data.h"
#include "source_mark_types.h"
#include "text.h"
#include "tree_types.h"
#include "global_commands_types.h"
#include "option_types.h"
/* for GLOBAL_INFO ERROR_MESSAGE CL_* RUD_type* ERROR_MESSAGE_LIST */
#include "document_types.h"
/* CONVERTER sv_string_type CONVERTER_INITIALIZATION_INFO
   enum sv_string_type */
#include "converter_types.h"
/* HTML_CONVERTER_STATE */
#include "html_converter_state.h"
/* non_perl_* */
#include "xs_utils.h"
/* fatal */
#include "base_utils.h"
/* for associated_info_table add_to_element_list */
#include "tree.h"
/* for element_command_name */
#include "builtin_commands.h"
/* for c_hashmap_iterator_next_value */
#include "hashmap.h"
/* for xasprintf get_encoding_conversion output_conversions
   direction_names expanded_formats_number output_unit_type_names
   informative_command_value get_global_document_command
   direction_unit_direction_name */
#include "utils.h"
/* find_option_string */
#include "customization_options.h"
/* for debugging */
#include "debug.h"
#include "convert_to_texinfo.h"
#include "document.h"
#include "output_unit.h"
/* for TEXT_OPTIONS */
#include "convert_to_text.h"
/* also button_function_type_string */
#include "get_perl_info.h"
#include "build_perl_info.h"

  /* NOTE This file includes the Perl headers, therefore we get the Perl
     redefinitions of functions, in particular for functions related to
     memory allocation, such as 'free' or 'malloc'.  In other files, the
     C library or Gnulib redefinition of those functions are used.  It is
     wrong to mix functions from Perl and C library plus Gnulib.  If memory
     is allocated with C library malloc, and then freed with Perl defined
     free (or vice versa), then an error can occur like "Free to wrong pool".
    https://lists.gnu.org/archive/html/bug-texinfo/2016-01/msg00016.html
   */

   /* Functions defined in files with C library plus Gnulib definition should
      therefore be used to allocate or free to match with the functions
      used to free or allocate in other files using C library plus Gnulib
      definitions.

      To be sure to use non Perl defined functions, constructors and wrappers
      must be used, from xs_utils.h:
       non_perl_free, non_perl_malloc, non_perl_realloc, non_perl_strdup,
       non_perl_strndup, non_perl_xvasprintf.

      This is often needed, when memory is allocated or free'd in
      'pure' C code (code that does not include Perl headers), as it is
      safer to assume that C library or Gnulib function definitions are
      always used in 'pure' C code.

      To be sure to use Perl defined functions in files that include
      both Gnulib and Perl headers, wrappers can be used, from
      build_perl_info.h:
       perl_only_free, perl_only_strdup, perl_only_strndup, perl_only_malloc.

      In November 2024, no file is compiled with both Perl and Gnulib
      headers as it lead to many errors on MS-Windows, therefore most of
      the perl_only_* wrappers are currently unused.  perl_only_strndup
      is used for portability because strndup does not exist in mingw
      and we can't use Gnulib strndup with Perl headers.

    */

/* wrappers to be sure to use Perl defined functions */
/* NB this function does not appear to be used currently. */
void
perl_only_free (void *ptr)
{
  dTHX;
  free (ptr);
}

/* NB this function does not appear to be used currently. */
void *
perl_only_malloc (size_t size)
{
  dTHX;
  return malloc (size);
}

/* Implement as we are not sure that Perl will define a version of this
   function. */
/* NB this function does not appear to be used currently. */
char *
perl_only_strdup (const char *s)
{
  size_t len = strlen (s);
  char *ret = perl_only_malloc (len+1);
  memcpy (ret, s, len+1);
  return ret;
}

/* Implement as we are not sure that Perl will define a version of this
   function.

   Used for portability for platforms that do not have strndup in the
   C library (mingw for instance).
 */
char *
perl_only_strndup (const char *s, size_t n)
{
  size_t len = strlen (s);
  if (len > n)
    len = n;

  char *ret = perl_only_malloc (len+1);
  memcpy (ret, s, len);
  ret[len] = '\0';
  return ret;
}



/* build generic C data to Perl used in tree and elsewhere */

AV *
build_string_list (const STRING_LIST *strings_list, enum sv_string_type type)
{
  AV *av;
  size_t i;

  dTHX;

  av = newAV ();

  for (i = 0; i < strings_list->number; i++)
    {
      const char *value = strings_list->list[i];
      if (!value)
        av_push (av, newSV (0));
      else if (type == svt_char)
        av_push (av, newSVpv_utf8 (value, 0));
      else
        av_push (av, newSVpv_byte (value, 0));
    }
  return av;
}

/* currently unused */
AV *
build_elements_list (const CONST_ELEMENT_LIST *list)
{
  AV *list_av;
  SV *sv;
  size_t i;

  dTHX;

  list_av = newAV ();

  av_unshift (list_av, list->number);

  for (i = 0; i < list->number; i++)
    {
      sv = newSVsv ((SV *) list->list[i]->sv);
      av_store (list_av, i, sv);
    }

  return list_av;
}



/* Build Texinfo tree data and Texinfo tree to Perl */

static HV *
new_element_perl_data (ELEMENT *e)
{
  HV *element_hv;
  HV *hv_stash;
  SV *element_sv;

  dTHX;

  /* this reference should be retained in C code, which means that each time
     a reference is transferred it should be duplicated (or aliased) */
  element_hv = newHV ();
  hv_stash = gv_stashpv ("Texinfo::TreeElement", GV_ADD);
  element_sv = newRV_noinc ((SV *) element_hv);
  sv_bless (element_sv, hv_stash);

  e->sv = element_sv;

  return element_hv;
}

void element_to_perl_hash (ELEMENT *e, int avoid_recursion);

/* Return reference to Perl array built from e.  If any of
   the elements in E don't have 'sv' set, set it to an empty
   hash table, or create it if there is no parent element, indicating the
   element is not in the tree.
   Note that not having 'sv' set should be rare (actually never happen),
   as the contents children are processed before the extra
   information where build_perl_array is called.
 */
static AV *
build_perl_array (const ELEMENT_LIST *e_l, int avoid_recursion)
{
  AV *av;
  size_t i;

  dTHX;

  av = newAV ();

  for (i = 0; i < e_l->number; i++)
    {
      ELEMENT *element = e_l->list[i];
      if (!element->sv)
        {
          if (type_data[element->type].flags & TF_text
              || element->e.c->parent)
            {
              new_element_perl_data (element);
            }
          else
            {
              /* NOTE should not be possible, all the elements in
                 extra_contents should be in-tree.  Checked in 2023.
               */
              static TEXT message;
              char *debug_str = print_element_debug (element, 1);
              text_init (&message);
              text_printf (&message,
                "BUG: build_perl_array oot %d: %s\n", i, debug_str);
              non_perl_free (debug_str);
              fprintf (stderr, "%s", message.text);
              non_perl_free (message.text);
              /* Out-of-tree element */
              /* WARNING: This is possibly recursive. */
              element_to_perl_hash (element, avoid_recursion);
            }
        }
      av_store (av, (SSize_t) i, newSVsv ((SV *) element->sv));
    }
  return av;
}

static SV *
build_perl_const_element_array (const CONST_ELEMENT_LIST *e_l, int avoid_recursion)
{
  SV *sv;
  AV *av;
  size_t i;

  dTHX;

  av = newAV ();
  sv = newRV_noinc ((SV *) av);

  for (i = 0; i < e_l->number; i++)
    {
      if (!e_l->list[i]->sv)
        {
          ELEMENT *f = (ELEMENT *)e_l->list[i];
          if (type_data[f->type].flags & TF_text || f->e.c->parent)
            {
              new_element_perl_data (f);
            }
          else
            {
              /* NOTE should not be possible, all the elements in
                 extra_contents should be in-tree.  Checked in 2023.
               */
              static TEXT message;
              char *debug_str = print_element_debug (f, 1);
              text_init (&message);
              text_printf (&message,
                "BUG: build_perl_const_element_array oot %d: %s\n", i, debug_str);
              non_perl_free (debug_str);
              fprintf (stderr, "%s", message.text);
              non_perl_free (message.text);
              /* Out-of-tree element */
              /* WARNING: This is possibly recursive. */
              element_to_perl_hash (f, avoid_recursion);
            }
        }
      av_store (av, (SSize_t) i, newSVsv ((SV *) e_l->list[i]->sv));
    }
  return sv;
}

static int hashes_ready = 0;
static U32 HSH_parent = 0;
static U32 HSH_type = 0;
static U32 HSH_cmdname = 0;
static U32 HSH_contents = 0;
static U32 HSH_text = 0;
static U32 HSH_inserted_text = 0;
static U32 HSH_extra = 0;
static U32 HSH_info = 0;
static U32 HSH_source_info = 0;
static U32 HSH_file_name = 0;
static U32 HSH_line_nr = 0;
static U32 HSH_macro = 0;

/* contents appears in other parts of the tree */
static void
build_perl_container (ELEMENT *e, int avoid_recursion)
{
  HV *element_hv;
  AV *contents_av;

  dTHX;

  if (!e->sv)
    {
      element_hv = new_element_perl_data (e);
    }
  else
    {
      element_hv = (HV *) SvRV ((SV *) e->sv);
      hv_clear (element_hv);
    }

  contents_av = build_perl_array (&e->e.c->contents, avoid_recursion);

  hv_store (element_hv, "contents", strlen ("contents"),
            newRV_noinc ((SV *) contents_av), HSH_contents);
}

static SV *
build_perl_directions (const ELEMENT * const *e_l, int avoid_recursion)
{
  SV *sv;
  HV *hv;
  size_t d;

  dTHX;

  hv = newHV ();
  sv = newRV_noinc ((SV *) hv);

  for (d = 0; d < directions_length; d++)
    {
      if (e_l[d])
        {
          const char *key = direction_names[d];
          const ELEMENT *e = e_l[d];
          if (!e->sv)
            {
              /* recast to a non const element, as we need to modify it */
              ELEMENT *f = (ELEMENT *)e;
              if (type_data[e->type].flags & TF_text || e->e.c->parent)
                {
                  new_element_perl_data (f);
                }
              else
                {
                  /* NOTE This should not happen, all the elements are in-tree.
                   */
                  static TEXT message;
                  char *debug_str = print_element_debug (e, 1);
                  text_init (&message);
                  text_printf (&message,
                    "BUG: build_perl_directions oot %s: %s\n", key, debug_str);
                  non_perl_free (debug_str);
                  fprintf (stderr, "%s", message.text);
                  non_perl_free (message.text);
                  /* Out-of-tree element */
                  /* WARNING: This is possibly recursive. */
                  element_to_perl_hash (f, avoid_recursion);
                }
            }
          hv_store (hv, key, strlen (key), newSVsv ((SV *) e->sv), 0);
        }
    }
  return sv;
}

AV *
build_integer_list (const INTEGER_LIST *integer_list)
{
  AV *av;
  size_t i;

  dTHX;

  av = newAV ();

  for (i = 0; i < integer_list->number; i++)
    {
      int value = integer_list->list[i];
      av_push (av, newSViv (value));
    }
  return av;
}

SV *
build_extra_index_entry (const INDEX_ENTRY_LOCATION *entry_loc)
{
  AV *av;
  SV *sv;

  dTHX;

  av = newAV ();

  av_unshift (av, 2);

  sv = newSVpv_utf8 (entry_loc->index_name,
                     strlen (entry_loc->index_name));
  av_store (av, 0, sv);
  sv = newSViv ((IV) entry_loc->number);
  av_store (av, 1, sv);
  return newRV_noinc ((SV *) av);
}

/* The SV returned holds one reference in addition to the reference kept in C
   for object that have a reference kept in C */
SV *
build_key_pair_info (const KEY_PAIR *k, int avoid_recursion)
{
  enum ai_key_name key;
  enum extra_type k_type;

  dTHX;

  key = k->key;
  k_type = associated_info_table[key].type;
  switch (k_type)
    {
    case extra_element:
      {
      /* For references to other parts of the tree, create the hash so
         we can point to it. */
      /* Note that this does not happen much, as the contents
         are often processed before the extra information. */
      const ELEMENT *f = k->k.const_element;
      if (!f->sv)
        {
      /* need to cast to remove const to add the Perl object reference */
          ELEMENT *e = (ELEMENT *)f;
          new_element_perl_data (e);
        }

      return newSVsv ((SV *)f->sv);
      break;
      }
    case extra_element_oot:
      {
      /*
         Can be used for complex subtrees or special
         out of tree elements, but must always be associated to only one
         element and must not refer to the tree through contents.
       */
          /* f->sv should not already exist the first time the tree
             is built, but can already exist if the tree is rebuilt
      if (f->sv)
        {
          static TEXT message;
          char *debug_str = print_element_debug (e, 1);
          text_init (&message);
          text_printf (&message,
                "element_to_perl_hash oot %s double in %s %p\n",
                       key, debug_str, f->sv);
          non_perl_free (debug_str);
          fatal (message.text);
          fprintf (stderr, message.text);
        }
           */
      ELEMENT *f = k->k.element;
      if (!f->sv || !avoid_recursion)
        element_to_perl_hash (f, avoid_recursion);

      return newSVsv ((SV *)f->sv);
      break;
      }
    case extra_container:
      {
      ELEMENT *f = k->k.element;
      build_perl_container (f, avoid_recursion);

      return newSVsv ((SV *)f->sv);
      break;
      }
    case extra_contents:
      {
      const CONST_ELEMENT_LIST *l = k->k.const_list;
      if (l && l->number)
        return build_perl_const_element_array (l, avoid_recursion);
      break;
      }
    case extra_directions:
      {
      return build_perl_directions (k->k.directions, avoid_recursion);
      break;
      }
    case extra_string:
      { /* A simple string. */
      return newSVpv_utf8 (k->k.string, 0);
      break;
      }
    case extra_integer:
      { /* A simple integer. */
      return newSViv (k->k.integer);
      break;
      }
    case extra_string_list:
      {
      AV *av = build_string_list (k->k.strings_list, svt_char);
      return newRV_noinc ((SV *)av);
      break;
      }
    case extra_integer_list:
      {
      AV *av = build_integer_list (k->k.integers_list);
      return newRV_noinc ((SV *)av);
      break;
      }
    case extra_index_entry:
      {
      return build_extra_index_entry (k->k.index_entry);
      break;
      }
    default:
      fatal ("build_key_pair_info: unknown extra type");
      break;
    }
  return 0;
}

static int
build_associated_info (HV *extra, const ASSOCIATED_INFO *a,
                       int avoid_recursion)
{
  int nr_info = 0;

  dTHX;

  if (a->info_number > 0)
    {
      size_t i;

      for (i = 0; i < a->info_number; i++)
        {
          const KEY_PAIR *k = &a->info[i];
          enum ai_key_name key = k->key;
          enum extra_type k_type = associated_info_table[key].type;
          const char *key_name;
          SV *sv;

          if (k_type == extra_none)
            continue;

          key_name = associated_info_table[key].name;

          nr_info++;

          sv = build_key_pair_info (k, avoid_recursion);
           /*
          if (sv && SvROK((SV*) sv))
            fprintf (stderr, "EXTRA %s %p %d\n", key_name, (HV *)SvRV ((SV *) sv), SvREFCNT ((SV *) (HV *)SvRV ((SV *) sv)));
            */
          if (sv)
            hv_store (extra, key_name, strlen (key_name), sv, 0);
        }
    }
  return nr_info;
}

static void
store_extra_additional_info (const ELEMENT *e, const ASSOCIATED_INFO *a,
                             int avoid_recursion, HV **extra_hv)
{
  HV *hv;
  int nr_info;

  dTHX;

  if (*extra_hv == 0)
    hv = newHV ();
  else
    hv = *extra_hv;

  nr_info = build_associated_info (hv, a, avoid_recursion);

  if (*extra_hv == 0)
    {
      if (nr_info > 0)
        {
          HV *element_hv = (HV *) SvRV ((SV*) e->sv);
          *extra_hv = hv;
          hv_store (element_hv, "extra", strlen ("extra"),
                    newRV_noinc ((SV *)hv), 0);
        }
      else
      /* release the hash reference, nothing was store inside */
        SvREFCNT_dec (hv);
    }
}

static void
store_source_mark_list (const ELEMENT *e)
{
  dTHX;

  if (e->source_mark_list)
    {
      AV *av;
      SV *sv;
      size_t i;
      HV *element_hv = (HV *) SvRV ((SV*) e->sv);

      if (e->source_mark_list->number == 0)
        {
          fprintf (stderr, "BUG: store_source_mark_list: 0 source marks but "
                           "source_mark_list\n");
          return;
        }

      av = newAV ();
      sv = newRV_noinc ((SV *) av);
      hv_store (element_hv, "source_marks", strlen ("source_marks"), sv, 0);

      for (i = 0; i < e->source_mark_list->number; i++)
        {
          HV *source_mark;
          SV *sv;
          const SOURCE_MARK *s_mark = e->source_mark_list->list[i];
          IV source_mark_position;
          IV source_mark_counter;
          source_mark = newHV ();
#define STORE(key, value) hv_store (source_mark, key, strlen (key), value, 0)
           /* A simple integer.  The intptr_t cast here prevents
              a warning on MinGW ("cast from pointer to integer of
              different size"). */
          source_mark_counter = (IV) (intptr_t) s_mark->counter;
          STORE("counter", newSViv (source_mark_counter));
          if (s_mark->position > 0)
            {
              source_mark_position = (IV) (intptr_t) s_mark->position;
              STORE("position", newSViv (source_mark_position));
            }
          if (s_mark->element)
            {
              ELEMENT *s_m_e = s_mark->element;
              /* should only be referred to in one source mark */
              /* but can be reused when tree is rebuilt
              if (e->sv)
                fatal ("element_to_perl_hash source mark elt twice");
               */
              element_to_perl_hash (s_m_e, 0);
              STORE("element", newSVsv ((SV *)s_m_e->sv));
            }
          if (s_mark->line)
            {
              SV *sv = newSVpv_utf8 (s_mark->line, 0);
              STORE("line", sv);
            }

#define SAVE_S_M_STATUS(X) \
           case SM_status_ ## X: \
           sv = newSVpv_utf8 (#X, 0);\
           STORE("status", sv); \
           break;

          switch (s_mark->status)
            {
              SAVE_S_M_STATUS (start)
              SAVE_S_M_STATUS (end)

              /* for SM_status_none */
              default:
                break;
            }

          switch (s_mark->type)
            {
#define sm_type(X) \
              case SM_type_ ## X: \
              sv = newSVpv_utf8 (#X, 0);\
              STORE("sourcemark_type", sv); \
              break;

            SM_TYPES_LIST
#undef sm_type

              /* for SM_type_none */
              default:
                break;
            }

          av_push (av, newRV_noinc ((SV *)source_mark));
#undef STORE
        }
    }
}


static void
store_extra_flag (ELEMENT *e, const char *key, HV **extra_hv)
{
  dTHX;

  if (*extra_hv == 0)
    {
      HV *element_hv = (HV *) SvRV ((SV*) e->sv);
      *extra_hv = (HV *) newHV ();
      hv_store (element_hv, "extra", strlen ("extra"),
                newRV_noinc ((SV *)*extra_hv), HSH_extra);
    }
  hv_store (*extra_hv, key, strlen (key), newSViv (1), 0);
}

void
pass_source_info_hash (const SOURCE_INFO *source_info, HV *hv)
{
#define STORE(key, sv, hsh) hv_store (hv, key, strlen (key), sv, hsh)
  dTHX;

  if (source_info->file_name)
    {
      STORE("file_name", newSVpv (source_info->file_name, 0),
            HSH_file_name);
    }

  if (source_info->line_nr)
    {
      STORE("line_nr", newSViv (source_info->line_nr), HSH_line_nr);
    }

  if (source_info->macro)
    {
      STORE("macro", newSVpv_utf8 (source_info->macro, 0), HSH_macro);
    }
}

static void
build_base_element (ELEMENT *e, HV *hv)
{
  SV *sv;
  const char *cmdname;

  dTHX;

  if (type_data[e->type].flags & TF_text)
    {
      sv = newSVpv (type_data[e->type].name, 0);
      STORE("type", sv, HSH_type);

      sv = newSVpv_utf8 (e->e.text->text, e->e.text->end);
      STORE("text", sv, HSH_text);

      if (e->flags & EF_inserted)
        STORE("inserted_text", newSViv (1), HSH_inserted_text);

      return;
    }

  /* non-text elements */

  if (e->type
      && !(type_data[e->type].flags & TF_c_only))
    {
      sv = newSVpv (type_data[e->type].name, 0);
      STORE("type", sv, HSH_type);
    }

  cmdname = element_command_name (e);
  if (cmdname)
    {
      /* Note we could optimize the call to newSVpv here and
         elsewhere by passing an appropriate second argument. */
      sv = newSVpv (cmdname, 0);
      STORE("cmdname", sv, HSH_cmdname);
    }
#undef STORE
}

void
build_new_base_element (ELEMENT *element)
{
  dTHX;

  if (!element->sv)
    {
      HV *element_hv = new_element_perl_data (element);
      build_base_element (element, element_hv);
    }
}

/* Set E->sv and 'hv' on E's descendants.  e->parent->sv is assumed
   to already exist. */
/* If AVOID_RECURSION is set, recurse in children elements only if
   hv is not set */
void
element_to_perl_hash (ELEMENT *e, int avoid_recursion)
{
  SV *sv;
  HV *extra_hv = 0;
  HV *element_hv;

  dTHX;

   /*
  fprintf (stderr, "ETPH %p %s\n", e, print_element_debug (e, 0));
    */
  /* e->sv may already exist if there was an extra value elsewhere
     referring to e (if there are references to in-tree elements in extra,
     which may not be the case), or if the tree is rebuilt. */
  if (!e->sv)
    {
      element_hv = new_element_perl_data (e);
    }
  else
    {
      /* reset for the case the element already exists, it is simpler than
         resetting every unset fields */
      element_hv = (HV *) SvRV ((SV *) e->sv);
      hv_clear (element_hv);
    }

  if (!hashes_ready)
    {
      hashes_ready = 1;
      PERL_HASH(HSH_parent, "parent", strlen ("parent"));
      PERL_HASH(HSH_type, "type", strlen ("type"));
      PERL_HASH(HSH_cmdname, "cmdname", strlen ("cmdname"));
      PERL_HASH(HSH_contents, "contents", strlen ("contents"));
      PERL_HASH(HSH_text, "text", strlen ("text"));
      PERL_HASH(HSH_inserted_text, "inserted_text", strlen ("inserted_text"));
      PERL_HASH(HSH_extra, "extra", strlen ("extra"));
      PERL_HASH(HSH_info, "info", strlen ("info"));
      PERL_HASH(HSH_source_info, "source_info", strlen ("source_info"));

      PERL_HASH(HSH_file_name, "file_name", strlen ("file_name"));
      PERL_HASH(HSH_line_nr, "line_nr", strlen ("line_nr"));
      PERL_HASH(HSH_macro, "macro", strlen ("macro"));
    }

  build_base_element (e, element_hv);

  store_source_mark_list (e);

  if (type_data[e->type].flags & TF_text)
    return;

  if (e->e.c->parent)
    {
      if (!e->e.c->parent->sv)
        {
          static TEXT message;
          char *debug_str = print_element_debug (e, 1);
          char *element_texi = convert_to_texinfo (e);
          text_init (&message);
          text_printf (&message, "parent %p sv not set in %s '%s'\n",
                            e->e.c->parent, debug_str, element_texi);
          free (element_texi);
          fatal (message.text);
          non_perl_free (debug_str);
        }
      /* copy the SV instead of simply reusing it, otherwise the changes
         to the corresponding reference in Perl will affect all the
         references.  See:
       https://lists.gnu.org/archive/html/bug-texinfo/2025-06/msg00018.html
       */
      sv = newSVsv ((SV *) e->e.c->parent->sv);
      hv_store (element_hv, "parent", strlen ("parent"), sv, HSH_parent);
    }

#define store_flag(flag) \
  if (e->flags & EF_##flag) \
    store_extra_flag (e, #flag, &extra_hv); \

  /* node */
  store_flag(isindex)
  store_flag(added)
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
  /* ET_def_category */
  store_flag(inserted)

#undef store_flag

  if (e->e.c->contents.number > 0)
    {
      AV *av;
      size_t i;

      av = newAV ();
      sv = newRV_noinc ((SV *) av);
      av_unshift (av, e->e.c->contents.number);

      hv_store (element_hv, "contents", strlen ("contents"), sv, HSH_contents);
      for (i = 0; i < e->e.c->contents.number; i++)
        {
          ELEMENT *child = e->e.c->contents.list[i];
          if (!child->sv || !avoid_recursion)
            element_to_perl_hash (child, avoid_recursion);
          av_store (av, i, newSVsv ((SV *) child->sv));
        }
    }

  store_extra_additional_info (e, &e->e.c->extra_info,
                               avoid_recursion, &extra_hv);

  if (e->e.c->associated_unit)
    {
      /* output_unit_to_perl_hash uses the unit_contents elements hv,
         so we may want to setup the tree hv before building the output
         units.  In that case, the output unit hv is not ready, so here
         we do not error out if the hv is not set.
          */
      if (e->e.c->associated_unit->hv)
        {
          hv_store (element_hv, "associated_unit", strlen ("associated_unit"),
                    newRV_inc ((SV *) e->e.c->associated_unit->hv), 0);
        }
    }

  if (e->e.c->source_info.line_nr)
    {
      const SOURCE_INFO *source_info = &e->e.c->source_info;
      HV *hv = newHV ();
      pass_source_info_hash (source_info, hv);
      hv_store (element_hv, "source_info", strlen ("source_info"),
                newRV_noinc ((SV *)hv), HSH_source_info);
    }
}

SV *
build_texinfo_tree (ELEMENT *root, int avoid_recursion)
{
  /* should not happen because caller should make sure to call with a tree */
  if (! root)
    return 0;
  /*
  fprintf (stderr, "BTT ------------------------------------------------\n");
   */
  if (!root->sv || !avoid_recursion)
    element_to_perl_hash (root, avoid_recursion);
  return root->sv;
}

void
build_tree_to_build (ELEMENT_LIST *tree_to_build)
{
  if (tree_to_build->number > 0)
    {
      size_t i;
      for (i = 0; i < tree_to_build->number; i++)
        {
          build_texinfo_tree (tree_to_build->list[i], 1);
        }
      tree_to_build->number = 0;
    }
}



/* languages and translations */

HV *
build_lang_info (const DOCUMENT_LANG_INFO *lang_info)
{
  HV *lang_info_hv;

  dTHX;

#define STORE(key,sv) hv_store (lang_info_hv, #key, strlen(#key), sv, 0);
  lang_info_hv = newHV ();
  if (lang_info->lang)
    STORE(lang, newSVpv (lang_info->lang, 0));
  if (lang_info->region)
    STORE(region, newSVpv (lang_info->region, 0));
  if (lang_info->script)
    STORE(script, newSVpv (lang_info->script, 0));
  if (lang_info->variants.number > 0)
    {
      AV *variants_av = build_string_list (&lang_info->variants, svt_byte);
      SV *sv = newRV_noinc ((SV *) variants_av);
      STORE(variants, sv);
    }
  STORE(bcp47_locale, newSVpv (lang_info->bcp47_locale, 0));
#undef STORE

  return lang_info_hv;
}



/* build nodes, sections... relations */

#define STORE_RELS_INFO_ELEMENT(keyname) \
       if (relations->keyname) \
        { \
          sv = newSVsv ((SV *) relations->keyname->sv); \
          hv_store (relations_hv, #keyname, \
                    strlen (#keyname), sv, 0); \
        }

#define STORE_RELS_INFO_SECTION_RELATIONS(keyname) \
       if (relations->keyname) \
        { \
          if (!relations->keyname->hv) \
            { \
              SECTION_RELATIONS *section = (SECTION_RELATIONS *) \
                relations->keyname; \
              section->hv = newHV (); \
            } \
          sv = newRV_inc ((SV *) relations->keyname->hv); \
          hv_store (relations_hv, #keyname, \
                    strlen (#keyname), sv, 0); \
        }

#define STORE_RELS_INFO_NODE_RELATIONS(keyname) \
       if (relations->keyname) \
        { \
          if (!relations->keyname->hv) \
            { \
              NODE_RELATIONS *node = (NODE_RELATIONS *) \
                relations->keyname; \
              node->hv = newHV (); \
            } \
          sv = newRV_inc ((SV *) relations->keyname->hv); \
          hv_store (relations_hv, #keyname, \
                    strlen (#keyname), sv, 0); \
        }

static void
build_node_relations (NODE_RELATIONS *relations)
{
  HV *relations_hv;
  SV *sv;

  dTHX;

  if (!relations->hv)
    {
      relations->hv = newHV ();
    }

  relations_hv = relations->hv;

  sv = newSVsv ((SV *) relations->element->sv);
  hv_store (relations_hv, "element", strlen ("element"), sv, 0);
  STORE_RELS_INFO_SECTION_RELATIONS(associated_section)
  STORE_RELS_INFO_ELEMENT(associated_title_command)
  STORE_RELS_INFO_SECTION_RELATIONS(node_preceding_part)
  if (relations->menus)
    {
      sv = build_perl_const_element_array (relations->menus, 0);
      hv_store (relations_hv, "menus", strlen ("menus"), sv, 0);
    }
  if (relations->node_descriptions)
    {
      sv = build_perl_const_element_array (relations->node_descriptions, 0);
      hv_store (relations_hv, "node_descriptions",
                strlen ("node_descriptions"), sv, 0);
    }
  if (relations->node_long_descriptions)
    {
      sv = build_perl_const_element_array (relations->node_long_descriptions, 0);
      hv_store (relations_hv, "node_long_descriptions",
                strlen ("node_long_descriptions"), sv, 0);
    }
  if (relations->node_directions)
    {
      sv = build_perl_directions (relations->node_directions, 0);
      hv_store (relations_hv, "node_directions",
                strlen ("node_directions"), sv, 0);
    }
}

AV *
build_node_relations_list (const NODE_RELATIONS_LIST *list)
{
  AV *list_av;
  size_t i;

  dTHX;

  list_av = newAV ();

  av_unshift (list_av, list->number);

  for (i = 0; i < list->number; i++)
    {
      NODE_RELATIONS *relations = list->list[i];
      build_node_relations (relations);
      /* In case the HV was just created, keep the reference created by
         newHV instead of transferring it to the list_av, considering
         that it is associated to the C code */
      av_store (list_av, i, newRV_inc ((SV *) relations->hv));
    }

  return list_av;
}

static HV *
build_perl_section_directions (const SECTION_RELATIONS * const *s_d)
{
  HV *hv;
  size_t d;

  dTHX;

  hv = newHV ();

  for (d = 0; d < directions_length; d++)
    {
      if (s_d[d])
        {
          const char *key = direction_names[d];

          if (!s_d[d]->hv)
            {
              /* cast to modify */
              SECTION_RELATIONS *relations = (SECTION_RELATIONS *)s_d[d];
              relations->hv = newHV ();
            }
          hv_store (hv, key, strlen (key),
            newRV_inc ((SV *) s_d[d]->hv), 0);
        }
    }
  return hv;
}

static AV *
build_perl_section_relations_array (const SECTION_RELATIONS_LIST *list)
{
  AV *av;
  size_t i;

  dTHX;

  av = newAV ();

  for (i = 0; i < list->number; i++)
    {
      SECTION_RELATIONS *relations = list->list[i];
      if (!relations->hv)
        relations->hv = newHV ();
      av_store (av, (SSize_t) i, newRV_inc ((SV *) relations->hv));
    }
  return av;
}

static void
build_section_relations (SECTION_RELATIONS *relations)
{
  HV *relations_hv;
  HV *hv;
  SV *sv;

  dTHX;

  if (!relations->hv)
    {
      relations->hv = newHV ();
    }

  relations_hv = relations->hv;

  sv = newSVsv ((SV *) relations->element->sv);
  hv_store (relations_hv, "element", strlen ("element"), sv, 0);
  STORE_RELS_INFO_NODE_RELATIONS(associated_node)
  STORE_RELS_INFO_NODE_RELATIONS(associated_anchor_command)
  STORE_RELS_INFO_SECTION_RELATIONS(associated_part)
  STORE_RELS_INFO_SECTION_RELATIONS(part_associated_section)
  STORE_RELS_INFO_NODE_RELATIONS(part_following_node)
  if (relations->section_directions)
    {
      hv = build_perl_section_directions (relations->section_directions);
      hv_store (relations_hv, "section_directions",
                strlen ("section_directions"), newRV_noinc ((SV *) hv), 0);
    }
  if (relations->toplevel_directions)
    {
      hv = build_perl_section_directions (relations->toplevel_directions);
      hv_store (relations_hv, "toplevel_directions",
                strlen ("toplevel_directions"), newRV_noinc ((SV *) hv), 0);
    }
  if (relations->section_children)
    {
      AV *av = build_perl_section_relations_array (relations->section_children);
      hv_store (relations_hv, "section_children",
                strlen ("section_children"), newRV_noinc ((SV *) av), 0);
    }
}

AV *
build_section_relations_list (const SECTION_RELATIONS_LIST *list)
{
  AV *list_av;
  size_t i;

  dTHX;

  list_av = newAV ();

  av_unshift (list_av, list->number);

  for (i = 0; i < list->number; i++)
    {
      SECTION_RELATIONS *relations = list->list[i];
      build_section_relations (relations);
      /* In case the HV was just created, keep the reference created by
         newHV instead of transferring it to the list_av, considering
         that it is associated to the C code */
      av_store (list_av, i, newRV_inc ((SV *) relations->hv));
    }

  return list_av;
}

AV *
build_heading_relations_list (const HEADING_RELATIONS_LIST *list)
{
  AV *list_av;
  SV *sv;
  size_t i;

  dTHX;

  list_av = newAV ();

  av_unshift (list_av, list->number);

  for (i = 0; i < list->number; i++)
    {
      HEADING_RELATIONS *relations = list->list[i];
      HV *relations_hv;
      if (!relations->hv)
        relations->hv = newHV ();
      relations_hv = relations->hv;

      sv = newSVsv ((SV *) relations->element->sv);
      hv_store (relations_hv, "element", strlen ("element"), sv, 0);
      STORE_RELS_INFO_NODE_RELATIONS(associated_anchor_command)
      av_store (list_av, i, newRV_inc ((SV *) relations_hv));
    }

  return list_av;
}

#undef STORE_RELS_INFO_ELEMENT



/* build error messages data to Perl, for Parser, Document and Converters */

/* build perl already 'formatted' message, same as the output of
   Texinfo::Report::format*message */
static SV *
convert_error (const ERROR_MESSAGE e)
{
  HV *hv;
  SV *msg;
  SV *err_line;

  dTHX;

  hv = newHV ();

  msg = newSVpv_utf8 (e.message, 0);
  err_line = newSVpv_utf8 (e.error_line, 0);

  hv_store (hv, "text", strlen ("text"), msg, 0);
  hv_store (hv, "error_line", strlen ("error_line"), err_line, 0);
  hv_store (hv, "type", strlen ("type"),
              (e.type == MSG_error || e.type == MSG_document_error)
                                  ? newSVpv ("error", strlen ("error"))
                                  : newSVpv ("warning", strlen ("warning")),
            0);

  if (e.continuation)
    hv_store (hv, "continuation", strlen ("continuation"),
              newSViv (e.continuation), 0);

  if (e.type != MSG_document_error && e.type != MSG_document_warning)
    pass_source_info_hash (&e.source_info, hv);

  return newRV_noinc ((SV *) hv);
}

/* Errors */
/* ERROR_MESSAGES_LIST passed must be non-NULL
 */
void
pass_errors (const ERROR_MESSAGE_LIST *error_list, AV *av)
{
  size_t i;

  dTHX;

  for (i = 0; i < error_list->number; i++)
    {
      SV *sv = convert_error (error_list->list[i]);
      av_push (av, sv);
    }
}

/* If KEY is NULL, "error_messages" is used.
   Get the object_sv HV hash value associated to KEY if it exists, and if it
   does not, create an array associated to KEY.
   Return a reference to the array.
   if ERROR_MESSAGES is set, add the error messages to the array before
   returning its reference.
 */
SV *
pass_errors_to_hv (const ERROR_MESSAGE_LIST *error_messages, SV *object_sv,
                   const char *key)
{
  HV *object_hv;
  SV **error_messages_sv;
  AV *report_av;
  const char *error_messages_key = "error_messages";

  dTHX;

  if (key)
     error_messages_key = key;

  object_hv = (HV *) SvRV (object_sv);

  error_messages_sv = hv_fetch (object_hv, error_messages_key,
                                strlen (error_messages_key), 0);
  /* An 'error_messages' is systematically added to document at
     initialization, so the condition should always be true for a Document
     object_hv.
     For a Parser, however, it is only added when needed, so it should
     need to be created here.
   */
  if (error_messages_sv)
    report_av = (AV *) SvRV (*error_messages_sv);
  else
    {
      report_av = newAV ();
      hv_store (object_hv, error_messages_key, strlen (error_messages_key),
                newRV_noinc ((SV *) report_av), 0);
    }

  if (error_messages)
    pass_errors (error_messages, report_av);
  return newRV_inc ((SV *) report_av);
}



/* Build data registered in Texinfo Document to Perl and Document */

/* Return array of target elements.  build_texinfo_tree must
   be called first. */
static AV *
build_target_elements_list (const LABEL_LIST *labels_list)
{
  AV *target_array;
  SV *sv;
  size_t i;

  dTHX;

  target_array = newAV ();
  av_unshift (target_array, labels_list->number);

  for (i = 0; i < labels_list->number; i++)
    {
      sv = newSVsv (labels_list->list[i].element->sv);
      av_store (target_array, i, sv);
    }

  return target_array;
}

static HV *
build_identifiers_target (const struct C_HASHMAP *identifiers_target)
{
  HV* hv;

  dTHX;

  hv = newHV ();

  if (identifiers_target)
    {
      struct BUCKET_ARENA_ITERATOR *hash_iterator = 0;
      const char *key;
      const ELEMENT *element;

      while (1)
        {
          element = c_hashmap_iterator_next_value (identifiers_target,
                                                   &hash_iterator, &key);
          if (!key)
            break;
          SV *sv = newSVsv (element->sv);
          hv_store (hv, key, strlen (key), sv, 0);
        }
    }
  return hv;
}

static AV *
build_internal_xref_list (const ELEMENT_LIST *internal_xref_list)
{
  AV *list_av;
  SV *sv;
  size_t i;

  dTHX;

  list_av = newAV ();
  av_unshift (list_av, internal_xref_list->number);

  for (i = 0; i < internal_xref_list->number; i++)
    {
      sv = newSVsv (internal_xref_list->list[i]->sv);
      av_store (list_av, i, sv);
    }

  return list_av;
}

/* Return hash for list of @float's that appeared in the file. */
static HV *
build_listoffloats_list (LISTOFFLOATS_TYPE_LIST *listoffloats)
{
  HV *float_hash;
  SV *sv;
  size_t i;

  dTHX;

  float_hash = newHV ();

  for (i = 0; i < listoffloats->number; i++)
    {
      size_t j;
      LISTOFFLOATS_TYPE *listoffloat = &listoffloats->list[i];
      FLOAT_INFORMATION_LIST *float_list = &listoffloat->float_list;
      SV *float_type = newSVpv_utf8 (listoffloat->type, 0);
      AV *av = newAV ();
      hv_store_ent (float_hash, float_type,
                    newRV_noinc ((SV *)av), 0);
      for (j = 0; j < float_list->number; j++)
        {
          const FLOAT_INFORMATION *float_info = &float_list->list[j];
          const ELEMENT *float_elt = float_info->float_element;
          const SECTION_RELATIONS *float_section = float_info->float_section;
          AV *float_section_av = newAV ();
          sv = newSVsv ((SV *)float_elt->sv);
          av_push (float_section_av, sv);
          if (float_section)
            {
              if (!float_section->hv)
                fatal ("Need to build sections first");
              sv = newRV_inc ((SV *)float_section->hv);
              av_push (float_section_av, sv);
            }
          else
            av_push (float_section_av, newSV (0));
          av_push (av, newRV_noinc ((SV *) float_section_av));
        }
    }
  return float_hash;
}

#define STORE2(key, value) hv_store (entry_hv, key, strlen (key), value, 0)
HV *
build_index_entry (const INDEX_ENTRY *index_entry)
{
  HV *entry_hv;

  dTHX;

  entry_hv = newHV ();

  STORE2("index_name", newSVpv_utf8 (index_entry->index_name, 0));
  STORE2("entry_element",
         newSVsv ((SV *)index_entry->entry_element->sv));
  if (index_entry->entry_associated_element)
    STORE2("entry_associated_element",
           newSVsv ((SV *)index_entry->entry_associated_element->sv));
  /* NOTE theoretical IV overflow if PERL_QUAD_MAX < SIZE_MAX */
  STORE2("entry_number", newSViv ((IV) index_entry->number));

  return entry_hv;
}
#undef STORE2

/* returns a hash for a single entry in $self->{'index_names'}, containing
   information about a single index. */
HV *
build_single_index_data (const INDEX *index)
{
#define STORE(key, value) hv_store (hv, key, strlen (key), value, 0)

  HV *hv;
  AV *entries;
  size_t j;

  dTHX;

  hv = newHV ();

  STORE("name", newSVpv_utf8 (index->name, 0));
  STORE("in_code", index->in_code ? newSViv (1) : newSViv (0));

  if (index->merged_in)
    STORE("merged_in", newSVpv_utf8 (index->merged_in->name, 0));

  if (index->entries_number > 0)
    {
      entries = newAV ();
      av_unshift (entries, index->entries_number);
      STORE("index_entries", newRV_noinc ((SV *) entries));

      for (j = 0; j < index->entries_number; j++)
        {
          HV *entry_hv = build_index_entry (&index->index_entries[j]);

          av_store (entries, j, newRV_noinc ((SV *)entry_hv));
        }
    }
  return hv;
}

/* build information from index, selecting only the information useful
   when looking at the index to complement the information available
   with an index entry */
HV *
build_single_index_info (const INDEX *index)
{
  HV *hv;

  dTHX;

  hv = newHV ();

  STORE("name", newSVpv_utf8 (index->name, 0));
  STORE("in_code", index->in_code ? newSViv (1) : newSViv (0));

  if (index->merged_in)
    STORE("merged_in", newSVpv_utf8 (index->merged_in->name, 0));

  return hv;
}

#undef STORE

/* Return object to be used as $self->{'index_names'} in the perl code.
   build_texinfo_tree must be called before this so all the 'hv' fields
   are set on the elements in the tree. */
static HV *
build_index_data (const INDEX_LIST *indices_info)
{
  size_t i;
  HV *hv;

  dTHX;

  hv = newHV ();

  for (i = 0; i < indices_info->number; i++)
    {
      const INDEX *idx = indices_info->list[i];
      HV *hv2 = build_single_index_data (idx);
      hv_store (hv, idx->name, strlen (idx->name),
                newRV_noinc ((SV *)hv2), 0);
    }

  return hv;
}

/* ALTIMP Texinfo/ParserNonXS.pm get_parser_info */
void
pass_global_info (HV *hv, const GLOBAL_INFO *global_info_ref,
                  const GLOBAL_COMMANDS *global_commands_ref)
{
  const GLOBAL_INFO global_info = *global_info_ref;
  const GLOBAL_COMMANDS global_commands = *global_commands_ref;
  size_t i;

  dTHX;

  if (global_info.input_encoding_name)
    hv_store (hv, "input_encoding_name", strlen ("input_encoding_name"),
              newSVpv (global_info.input_encoding_name, 0), 0);
  if (global_info.input_file_name)
    hv_store (hv, "input_file_name", strlen ("input_file_name"),
              newSVpv (global_info.input_file_name, 0), 0);
  if (global_info.input_directory)
    hv_store (hv, "input_directory", strlen ("input_directory"),
              newSVpv (global_info.input_directory, 0), 0);

  if (global_info.included_files.number)
    {
      AV *av = build_string_list (&global_info.included_files, svt_byte);
      hv_store (hv, "included_files", strlen ("included_files"),
                newRV_noinc ((SV *) av), 0);
    }

  for (i = 0; i < global_info.other_info.info_number; i++)
    {
      const KEY_STRING_PAIR *k = &global_info.other_info.info[i];
      hv_store (hv, k->key, strlen (k->key), newSVpv_utf8 (k->string, 0), 0);
    }

  /* duplicate information with global_commands to avoid needing to use
     global_commands and build tree elements in other codes, for
     information useful for structuring and transformation codes */
  if (global_commands.novalidate)
    hv_store (hv, "novalidate", strlen ("novalidate"),
              newSViv (1), 0);

  if (global_commands.setfilename)
    {
      enum command_id cmd;
      const char *setfilename_text
        = informative_command_value (global_commands.setfilename, &cmd);
      if (setfilename_text)
        hv_store (hv, "setfilename", strlen ("setfilename"),
                  newSVpv_utf8 (setfilename_text, 0), 0);
    }

  if (global_info.preamble_lang_cmd.number > 0)
    {
      AV *preamble_lang_av = newAV ();
      for (i = 0; i < global_info.preamble_lang_cmd.number; i++)
        {
          const PREAMBLE_LANG_CMD *preamble_lang_cmd
            = &global_info.preamble_lang_cmd.list[i];
          AV *preamble_lang_cmd_av = newAV ();
          av_push (preamble_lang_av,
                   newRV_noinc ((SV *) preamble_lang_cmd_av));
          const char *cmdname = builtin_command_name (preamble_lang_cmd->cmd);
          av_push (preamble_lang_cmd_av, newSVpv (cmdname, 0));
          if (preamble_lang_cmd->cmd == CM_documentlanguagevariant)
            {
              AV *av = build_string_list (
                  preamble_lang_cmd->plc.lang_variants, svt_byte);
              av_push (preamble_lang_cmd_av, newRV_noinc ((SV *) av));
            }
          else
            {
              av_push (preamble_lang_cmd_av, newSVpv (
                         preamble_lang_cmd->plc.lang_string, 0));
            }
        }
      hv_store (hv, "preamble_lang_cmd",
                strlen ("preamble_lang_cmd"),
                newRV_noinc ((SV *) preamble_lang_av), 0);
    }
}

/* Return object to be used as 'commands_info', which holds references
   to tree elements. */
static HV *
build_global_commands (const GLOBAL_COMMANDS *global_commands_ref)
{
  HV *hv;
  AV *av;
  size_t i;
  const GLOBAL_COMMANDS global_commands = *global_commands_ref;

  dTHX;

  hv = newHV ();

  /* These should be unique elements. */

#define GLOBAL_UNIQUE_CASE(cmd) \
  if (global_commands.cmd && global_commands.cmd->sv) \
    { \
      hv_store (hv, #cmd, strlen (#cmd), \
                newSVsv ((SV *) global_commands.cmd->sv), 0); \
    }

  GLOBAL_UNIQUE_CASE(setfilename);

#include "main/global_unique_commands_case.c"

#undef GLOBAL_UNIQUE_CASE

  /* list of direntry and dircategory */
  if (global_commands.dircategory_direntry.number > 0)
    {
      AV *av = newAV ();
      hv_store (hv, "dircategory_direntry", strlen ("dircategory_direntry"),
                newRV_noinc ((SV *) av), 0);
      for (i = 0; i < global_commands.dircategory_direntry.number; i++)
        {
          const ELEMENT *e = global_commands.dircategory_direntry.list[i];
          if (e->sv)
            av_push (av, newSVsv ((SV *) e->sv));
        }
    }

  if (global_commands.language_commands.number > 0)
    {
      AV *av = newAV ();
      hv_store (hv, "language_commands", strlen ("language_commands"),
                newRV_noinc ((SV *) av), 0);
      for (i = 0; i < global_commands.language_commands.number; i++)
        {
          const ELEMENT *e = global_commands.language_commands.list[i];
          if (e->sv)
            av_push (av, newSVsv ((SV *) e->sv));
        }
    }

  /* The following are arrays of elements. */

  if (global_commands.footnotes.number > 0)
    {
      av = newAV ();
      hv_store (hv, "footnote", strlen ("footnote"),
                newRV_noinc ((SV *) av), 0);
      for (i = 0; i < global_commands.footnotes.number; i++)
        {
          const ELEMENT *e = global_commands.footnotes.list[i];
          if (e->sv)
            av_push (av, newSVsv ((SV *) e->sv));
        }
    }

  /* float is a type, it does not work there, use floats instead */
  if (global_commands.floats.number > 0)
    {
      av = newAV ();
      hv_store (hv, "float", strlen ("float"),
                newRV_noinc ((SV *) av), 0);
      for (i = 0; i < global_commands.floats.number; i++)
        {
          const ELEMENT *e = global_commands.floats.list[i];
          if (e->sv)
            av_push (av, newSVsv ((SV *) e->sv));
        }
    }

#define GLOBAL_CASE(cmd) \
  if (global_commands.cmd.number > 0)                              \
    {                                                                   \
      av = newAV ();                                                    \
      hv_store (hv, #cmd, strlen (#cmd),                                \
                newRV_noinc ((SV *) av), 0);                              \
      for (i = 0; i < global_commands.cmd.number; i++)             \
        {                                                               \
          const ELEMENT *e = global_commands.cmd.list[i];            \
          if (e->sv)                                                    \
            av_push (av, newSVsv ((SV *) e->sv));                     \
        }                                                               \
    }

#include "global_multi_commands_case.c"

#undef GLOBAL_CASE


  return hv;
}

/* build a minimal document, without tree/global commands/indices, only
   with the document descriptor information, errors and information that do
   not refer directly to tree elements */
SV *
build_minimal_document (DOCUMENT *document)
{
  HV *hv_stash;
  HV *hv;
  SV *sv;
  HV *hv_info;
  AV *messages_list_av;

  dTHX;

  /* We do not attempt to reuse a pre-existing C document hv, as
     build_minimal_document is only called on documents that were just
     created and do not already have associated hv */
  /* There is a bug message below if there is already a C document hv */
  /* Reference held by the C code released at document destruction */
  hv = newHV ();

  if (document->tree)
    {
      HV *hv_tree = newHV ();
      HV *hv_stash = gv_stashpv ("Texinfo::TreeElement", GV_ADD);
      /* at this point there is no reference retained in C as the reference
         on Perl object is not already stored in C element structure data */
      SV *tree_sv = newRV_noinc ((SV *) hv_tree);
      sv_bless (tree_sv, hv_stash);

      hv_store (hv, "tree", strlen ("tree"), tree_sv, 0);

      hv_store (hv_tree, "tree_document_descriptor",
                strlen ("tree_document_descriptor"),
                newSViv (document->descriptor), 0);
    }

  hv_info = newHV ();
  pass_global_info (hv_info, &document->global_info,
                             &document->global_commands);

  hv_store (hv, "global_info", strlen ("global_info"),
            newRV_noinc ((SV *) hv_info), 0);

  document->modified_information &= ~F_DOCM_global_info;

  hv_store (hv, "document_descriptor", strlen ("document_descriptor"),
            newSViv (document->descriptor), 0);

  /* New error messages list for document to be used after parsing, for
     structuring and tree modifications */
  messages_list_av = newAV ();
  hv_store (hv, "error_messages", strlen ("error_messages"),
            newRV_noinc ((SV *) messages_list_av), 0);

  if (!document->hv)
    {
      document->hv = (void *) hv;
      /* a new reference returned to keep the reference held in C */
      SvREFCNT_inc ((SV *) hv);
    }
  else
    {
      fprintf (stderr,
       "BUG: build_minimal_document: %zu: already %p and new %p document hv\n",
               document->descriptor, document->hv, hv);
    }

  hv_stash = gv_stashpv ("Texinfo::Document", GV_ADD);
  sv = newRV_noinc ((SV *) hv);
  sv_bless (sv, hv_stash);
  return sv;
}

static HV *
build_sectioning_root (SECTIONING_ROOT *sectioning_root)
{
  HV *hv = 0;
  AV *av;

  dTHX;

  hv = newHV ();

  av = build_perl_section_relations_array (
                            &sectioning_root->section_children);
  hv_store (hv, "section_children", strlen ("section_children"),
            newRV_noinc ((SV *) av), 0);

  hv_store (hv, "section_root_level", strlen ("section_root_level"),
            newSViv (sectioning_root->section_root_level), 0);
  return hv;
}

static void
fill_document_hv (HV *hv, DOCUMENT *document)
{
  SV *sv_tree = 0;
  HV *hv_info;
  HV *hv_commands_info;
  HV *hv_index_names;
  HV *hv_listoffloats_list;
  AV *av_internal_xref;
  HV *hv_identifiers_target;
  AV *av_labels_list;
  AV *av_nodes_list = 0;
  AV *av_sections_list = 0;
  AV *av_headings_list = 0;
  HV *hv_sectioning_root = 0;

  dTHX;

  if (document->tree)
    sv_tree = build_texinfo_tree (document->tree, 0);

  hv_info = newHV ();
  pass_global_info (hv_info, &document->global_info,
                             &document->global_commands);

  hv_commands_info = build_global_commands (&document->global_commands);

  hv_index_names = build_index_data (&document->indices_info);

  hv_listoffloats_list
         = build_listoffloats_list (&document->listoffloats);

  av_internal_xref = build_internal_xref_list (&document->internal_references);

  hv_identifiers_target
   = build_identifiers_target (&document->identifiers_target);

  av_labels_list = build_target_elements_list (&document->labels_list);

  av_nodes_list = build_node_relations_list (&document->nodes_list);

  av_sections_list = build_section_relations_list (&document->sections_list);

  av_headings_list = build_heading_relations_list (&document->headings_list);

  if (document->sectioning_root)
    hv_sectioning_root = build_sectioning_root (document->sectioning_root);

#define STORE(key, value) hv_store (hv, key, strlen (key), newRV_noinc ((SV *) value), 0)

  /* must be kept in sync with Texinfo::Document register keys */
  if (sv_tree)
    hv_store (hv, "tree", strlen ("tree"), newSVsv ((SV *) sv_tree), 0);
  document->modified_information &= ~F_DOCM_tree;
  STORE("indices", hv_index_names);
  document->modified_information &= ~F_DOCM_index_names;
  STORE("listoffloats_list", hv_listoffloats_list);
  document->modified_information &= ~F_DOCM_floats;
  STORE("internal_references", av_internal_xref);
  document->modified_information &= ~F_DOCM_internal_references;
  STORE("commands_info", hv_commands_info);
  document->modified_information &= ~F_DOCM_global_commands;
  STORE("global_info", hv_info);
  document->modified_information &= ~F_DOCM_global_info;
  STORE("identifiers_target", hv_identifiers_target);
  document->modified_information &= ~F_DOCM_identifiers_target;
  STORE("labels_list", av_labels_list);
  document->modified_information &= ~F_DOCM_labels_list;

  STORE("nodes_list", av_nodes_list);
  document->modified_information &= ~F_DOCM_nodes_list;

  STORE("sections_list", av_sections_list);
  document->modified_information &= ~F_DOCM_sections_list;

  if (hv_sectioning_root)
    {
      STORE("sectioning_root", hv_sectioning_root);
      document->modified_information &= ~F_DOCM_sectioning_root;
    }

  STORE("headings_list", av_headings_list);
  document->modified_information &= ~F_DOCM_headings_list;
#undef STORE
}

/* Return a Texinfo::Document perl object corresponding to the
   C document structure corresponding to DOCUMENT.
   If NO_STORE is set, destroy the C document.
 */
SV *
build_document (DOCUMENT *document, int no_store)
{
  HV *hv;
  SV *sv;
  HV *hv_stash;

  dTHX;

  if (document->hv)
    hv = document->hv;
  else
    {
      /* we go there through parse_string called with no_store set as is
         the case in Translations.pm */
      /* reference retained in C, unless the document is not stored */
      hv = newHV ();

      /* error messages list for document to be used after parsing, for
         structuring and tree modifications */
      AV *messages_list_av = newAV ();
      hv_store (hv, "error_messages", strlen ("error_messages"),
                newRV_noinc ((SV *) messages_list_av), 0);
    }

  fill_document_hv (hv, document);

  if (no_store)
    {
      if (document->hv)
   /* This situation happens if a document is built first through
      parsing Texinfo file or string (as a minimal document) and
      afterwards build_tree is called with no_store set to 1.  This
      makes sure that the tree is not associated to C anymore, such
      that modifications in Perl are not forgotten when a tree
      unmodified is returned from C.  Pod-Simple-Texinfo is an example
      where this happens.
    */
      /* take ownership of a document reference before having it
         released by destroy_document, to avoid going through 0 and
         also to have a reference to release to the caller.
       */
        SvREFCNT_inc ((SV *) hv);

      destroy_document (document);
    }
  else
    {
      hv_store (hv, "document_descriptor", strlen ("document_descriptor"),
                newSViv (document->descriptor), 0);

      if (document->tree && document->tree->sv)
        {
          HV *hv_tree = (HV *) SvRV ((SV *) document->tree->sv);
          hv_store (hv_tree, "tree_document_descriptor",
                    strlen ("tree_document_descriptor"),
                    newSViv (document->descriptor), 0);
        }

      if (!document->hv)
       /* This situation cannot happen with the current code.  Indeed,
          the parse_texi* functions lead either to a minimal document
          being built, with an hv set, or to a Perl only tree, with
          no_store set (in parse_string only) */
        document->hv = (void *) hv;

      /* a new reference returned to keep the reference held in C */
      SvREFCNT_inc ((SV *) hv);
    }

  hv_stash = gv_stashpv ("Texinfo::Document", GV_ADD);
  sv = newRV_noinc ((SV *) hv);
  sv_bless (sv, hv_stash);
  return sv;
}

void
store_document_texinfo_tree (DOCUMENT *document)
{
  dTHX;

  if (document->modified_information & F_DOCM_tree
      && document->tree)
    {
      const char *key = "tree";
      SV *result_sv = build_texinfo_tree (document->tree, 0);
      HV *result_hv = (HV *) SvRV (result_sv);
      hv_store (result_hv, "tree_document_descriptor",
                strlen ("tree_document_descriptor"),
                newSViv (document->descriptor), 0);
      hv_store (document->hv, key, strlen (key), newSVsv (result_sv), 0);
      document->modified_information &= ~F_DOCM_tree;
    }
  /* systematically rebuild, as section relations
     can be accessed from the tree.  Done in this function,
     as it is supposed to be called before an access to modified
     tree and sectioning structure.
   */
  /* Also store, such that next call that get cached values
     get the right information */
  if (document->modified_information & F_DOCM_sections_list)
    {
      const char *key = "sections_list";
      AV *av_list
        = build_section_relations_list (&document->sections_list);
      hv_store (document->hv, key, strlen (key),
                newRV_noinc ((SV *) av_list), 0);

      document->modified_information &= ~F_DOCM_sections_list;
    }

  if (document->modified_information & F_DOCM_nodes_list)
    {
      const char *key = "nodes_list";
      AV *av_list
        = build_node_relations_list (&document->nodes_list);
      hv_store (document->hv, key, strlen (key),
                newRV_noinc ((SV *) av_list), 0);

      document->modified_information &= ~F_DOCM_nodes_list;
    }

  if (document->modified_information & F_DOCM_headings_list)
    {
      const char *key = "headings_list";
      AV *av_list
        = build_heading_relations_list (&document->headings_list);
      hv_store (document->hv, key, strlen (key),
                newRV_noinc ((SV *) av_list), 0);

      document->modified_information &= ~F_DOCM_headings_list;
    }
}

/* Build Output unit and output units lists to Perl*/

static void
output_unit_to_perl_hash (OUTPUT_UNIT *output_unit)
{
  int i;
  SV *sv;
  HV *directions_hv;

  dTHX;

  /* output_unit->hv may already exist because of directions or if there was a
     first_in_page referring to output_unit, or because the output units
     list is being rebuilt */
  if (!output_unit->hv)
    /* the reference created by newHV is considered to be retained by the
       C code and is released when the output unit is destroyed in C */
    output_unit->hv = newHV ();
  else
    hv_clear (output_unit->hv);

#define STORE(key) hv_store (output_unit->hv, key, strlen (key), sv, 0)
  sv = newSVpv (output_unit_type_names[output_unit->unit_type], 0);
  STORE("unit_type");

  if (output_unit->unit_type == OU_special_unit)
    {
      ELEMENT *command = output_unit->uc.special_unit_command;
      if (!command->sv)
        {
          SV *unit_sv;
          HV *element_hv;

          /* a virtual out of tree element, add it to perl */
          element_to_perl_hash (command, 0);
          element_hv = (HV *) SvRV ((SV *) command->sv);

          unit_sv = newRV_inc ((SV *) output_unit->hv);
          hv_store (element_hv, "associated_unit",
                    strlen ("associated_unit"), unit_sv, 0);
        }
      sv = newSVsv ((SV *) command->sv);
      STORE("unit_command");
    }
  else
    {
      const ELEMENT *command = output_unit->uc.unit_command;

      if (command)
        {
          if (!command->sv)
            {
              char *msg;
              char *output_unit_text = output_unit_texi (output_unit);
              xasprintf (&msg, "Missing output unit unit_command sv: %s",
                         output_unit_text);
              non_perl_free (output_unit_text);
              fatal (msg);
              non_perl_free (msg);
            }

          sv = newSVsv ((SV *) command->sv);
          STORE("unit_command");
        }
      if (output_unit->unit_section)
        {
          sv = newRV_inc ((SV *) output_unit->unit_section->hv);
          STORE("unit_section");
        }
      if (output_unit->unit_node)
        {
          sv = newRV_inc ((SV *) output_unit->unit_node->hv);
          STORE("unit_node");
        }
   /* there is nothing else of use for external_node_unit, exit now */
      if (output_unit->unit_type == OU_external_node_unit)
        return;
    }

  /* NOTE theoretical IV overflow if PERL_QUAD_MAX < SIZE_MAX */
  sv = newSViv ((IV) output_unit->index);
  STORE("unit_index");

  /* setup an hash reference in any case */
  directions_hv = newHV ();
  sv = newRV_noinc ((SV *) directions_hv);
  STORE("directions");

  for (i = 0; i < RUD_type_FirstInFileNodeBack+1; i++)
    {
      if (output_unit->directions[i])
        {
          const char *direction_name = relative_unit_direction_name[i];
          /* remove const in case hv needs to be added */
          OUTPUT_UNIT *direction_unit
               = (OUTPUT_UNIT *) output_unit->directions[i];
          SV *unit_sv;
          if (!direction_unit->hv)
            {
  /* If it is known in advance that Perl data needs to be rebuilt, the Perl
     references should exist for all the output units because they are
     setup and built to Perl if needed in _prepare_conversion_units,
     while directions are setup afterwards in _prepare_units_directions_files.
     external_node_target are not set in _prepare_conversion_units, but
     are set before rebuilding the other output units in
     _prepare_units_directions_files XS code.

     However, if the output units are built late because they are built
     to Perl from a user function, the output units were never built
     to Perl and there are already directions that will point to output
     units not already built to Perl, so it is not an error.

              char *msg;
              xasprintf (&msg, "BUG: %s: no output unit Perl ref: %s",
                                   direction_name,
                                   output_unit_texi (direction_unit));
              fatal (msg);
              non_perl_free (msg);
   */
              direction_unit->hv = newHV ();
            }
          unit_sv = newRV_inc ((SV *) direction_unit->hv);
          hv_store (directions_hv, direction_name, strlen (direction_name),
                    unit_sv, 0);
        }
    }

  if (output_unit->associated_document_unit)
    {
      sv = newRV_inc ((SV *) output_unit->associated_document_unit->hv);
      STORE("associated_document_unit");
    }

  if (output_unit->unit_filename)
    {
      sv = newSVpv_utf8 (output_unit->unit_filename,
                         strlen (output_unit->unit_filename));
      STORE("unit_filename");
    }

  if (output_unit->unit_contents.number)
    {
      AV *av;
      size_t i;

      av = newAV ();
      sv = newRV_noinc ((SV *) av);
      STORE("unit_contents");

      for (i = 0; i < output_unit->unit_contents.number; i++)
        {
          const ELEMENT *element = output_unit->unit_contents.list[i];
          SV *element_sv;
          SV *unit_sv;

          if (!element->sv)
            fatal ("Missing output unit unit_contents element sv");

          element_sv = newSVsv ((SV *) element->sv);

          av_push (av, element_sv);

          if (element->e.c->associated_unit == output_unit)
            {
              HV *element_hv = (HV *) SvRV ((SV *) element_sv);
              unit_sv = newRV_inc ((SV *) output_unit->hv);
              /* set the tree element associated_unit */
              hv_store (element_hv, "associated_unit",
                        strlen ("associated_unit"),
                        unit_sv, 0);
            }
        }
    }

  if (output_unit->tree_unit_directions[0]
      || output_unit->tree_unit_directions[1])
    {
      size_t i;
      size_t directions_nr = sizeof (output_unit->tree_unit_directions)
                           / sizeof (output_unit->tree_unit_directions[0]);
      HV *hv_tree_unit_directions = newHV ();
      sv = newRV_noinc ((SV *) hv_tree_unit_directions);
      STORE("tree_unit_directions");

      for (i = 0; i < directions_nr; i++)
        {
          OUTPUT_UNIT *target = output_unit->tree_unit_directions[i];
          if (target)
            {
              if (!target->hv)
                target->hv = newHV ();
              sv = newRV_inc ((SV *) target->hv);
              hv_store (hv_tree_unit_directions, direction_names[i],
                        strlen (direction_names[i]), sv, 0);
            }
        }
    }

  if (output_unit->first_in_page)
    {
      OUTPUT_UNIT *target = output_unit->first_in_page;
      if (!target->hv)
        target->hv = newHV ();
      sv = newRV_inc ((SV *) target->hv);
      STORE("first_in_page");
    }

  if (output_unit->special_unit_variety)
    {
      sv = newSVpv_utf8 (output_unit->special_unit_variety,
                         strlen (output_unit->special_unit_variety));
      STORE("special_unit_variety");
    }
#undef STORE
}

/* build output unit hashes but do not put output units hashes in
   an array.  Useful for external_nodes_units, which are to be
   built to Perl, but have no array in Perl, they are only referred to
   in directions. */
static void
output_units_list_to_perl_hash (const DOCUMENT *document,
                                size_t output_units_descriptor)
{
  const OUTPUT_UNIT_LIST *output_units;
  size_t i;

  output_units = retrieve_output_units (document, output_units_descriptor);

  if (!output_units || !output_units->number)
    return;

  for (i = 0; i < output_units->number; i++)
    {
      OUTPUT_UNIT *output_unit = output_units->list[i];
      output_unit_to_perl_hash (output_unit);
    }
}

static int
fill_output_units_descriptor_av (const DOCUMENT *document,
                                 AV *av_output_units,
                                 size_t output_units_descriptor)
{
  const OUTPUT_UNIT_LIST *output_units;
  size_t i;

  dTHX;

  output_units = retrieve_output_units (document, output_units_descriptor);

  if (!output_units || !output_units->number)
    return 0;

  for (i = 0; i < output_units->number; i++)
    {
      SV *sv;
      OUTPUT_UNIT *output_unit = output_units->list[i];
      output_unit_to_perl_hash (output_unit);
      /* keep the reference owned by the C code */
      sv = newRV_inc ((SV *) output_unit->hv);
      av_push (av_output_units, sv);
    }

  /* store in the first perl output unit of the list */
  /* NOTE theoretical IV overflow if PERL_QUAD_MAX < SIZE_MAX */
  hv_store (output_units->list[0]->hv, "output_units_descriptor",
            strlen ("output_units_descriptor"),
            newSViv ((IV)output_units_descriptor), 0);
  hv_store (output_units->list[0]->hv, "output_units_document_descriptor",
            strlen ("output_units_document_descriptor"),
            newSViv ((IV)document->descriptor), 0);
  return 1;
}

SV *
build_output_units_list (const DOCUMENT *document,
                         size_t output_units_descriptor)
{
  AV *av_output_units;

  dTHX;

  av_output_units = newAV ();

  if (fill_output_units_descriptor_av (document, av_output_units,
                                       output_units_descriptor))
    return newRV_noinc ((SV *) av_output_units);

  av_undef (av_output_units);
  return newSV (0);
}

/* Can be called to rebuild output units when the converter is available.
 */
void
store_output_units_texinfo_tree (CONVERTER *converter, SV *converter_sv)
{
  dTHX;

  if (converter->document)
    {
      /* Used to access output_units_descriptors. */
      HTML_CONVERTER_STATE *self_html = converter->html_converter;

 /* need to setup the Perl tree before rebuilding the output units as
    they refer to Perl root command elements */
      store_document_texinfo_tree (converter->document);

      if (converter->document->modified_information & F_DOCM_output_units)
        {
          HV *converter_hv = (HV *) SvRV (converter_sv);
          SV **document_units_sv;

      /* build external_nodes_units before rebuilding the other
         output units as the external_nodes_units may have never been built,
         while other units could have already been built without directions
         information.
       */
          output_units_list_to_perl_hash (converter->document,
            self_html->output_units_descriptors[OUDT_external_nodes_units]);

          /* reuse "document_units" array if set */
          document_units_sv
           = hv_fetch (converter_hv, "document_units",
                               strlen ("document_units"), 0);

          if (document_units_sv && SvOK (*document_units_sv))
            {
              AV *av_output_units = (AV *) SvRV (*document_units_sv);
              size_t output_units_descriptor
                 = self_html->output_units_descriptors[OUDT_units];

              av_clear (av_output_units);
              if (!fill_output_units_descriptor_av (converter->document,
                                                   av_output_units,
                                              output_units_descriptor))
                {
      /* the output_units_descriptor is not found.  If there is
         something to rebuild, this should mean that there is an output
         units list in C, therefore we output an error here.  It could
         be redundant with errors output earlier in calling code, but it
         is better to have more debug messages.
       */
                  fprintf (stderr,
                     "BUG: store_output_units_texinfo_tree: output units"
                     " descriptor not found: %zu\n", output_units_descriptor);
                }
            }
          else
            {
              SV *output_units_sv
                = build_output_units_list (converter->document,
                   self_html->output_units_descriptors[OUDT_units]);
              hv_store (converter_hv, "document_units",
                        strlen ("document_units"),
                        output_units_sv, 0);
            }

          output_units_list_to_perl_hash (converter->document,
                      self_html->output_units_descriptors[OUDT_special_units]);
          output_units_list_to_perl_hash (converter->document,
            self_html->output_units_descriptors[OUDT_associated_special_units]);

          converter->document->modified_information &= ~F_DOCM_output_units;
        }
    }
}

/* Can be called to (re)build the tree and rebuild output units when the
   converter is not known or when there is only a Document.
   Output units are kept in the document, but are setup and destroyed by
   converters.  If converters accessed concurently documents, there may
   be trouble here (and in other codes too).
 */
void
store_document_tree_output_units (DOCUMENT *document)
{
  dTHX;

  if (document)
    {
      /* need to setup the Perl tree before rebuilding the output units as
         they refer to Perl root command elements */
      store_document_texinfo_tree (document);

      /* we hope that there are not two output units lists referring to the
         tree... */
      if (document->modified_information & F_DOCM_output_units)
        {
          const OUTPUT_UNIT_LISTS *output_units_lists
            = &document->output_units_lists;
          size_t i;

          if (output_units_lists->number > OUDT_external_nodes_units+1)
            fprintf (stderr, "WARNING: %zu output units built to Perl\n",
                     output_units_lists->number);

          for (i = 0; i < output_units_lists->number; i++)
            {
              output_units_list_to_perl_hash (document, i+1);
            }

          document->modified_information &= ~F_DOCM_output_units;
        }
    }
}

/* Get a reference to the document tree.  Either built from C data if the
   document could be found and if HANDLER_ONLY is not set, else from
   a Perl document, if possible the one associated with C data, otherwise
   DOCUMENT_IN.
   If the C document data was not stored, the tree will only be
   in DOCUMENT_IN. */
SV *
document_tree (SV *document_in, int handler_only)
{
  DOCUMENT *document;
  SV **sv_reference = 0;

  dTHX;

  document = get_sv_document_document (document_in, 0);

  if (document)
    {
      if (document->tree)
        {
          if (!handler_only)
            {
              store_document_tree_output_units (document);
            }
          else
            {
              const char *document_key = "tree_document_descriptor";
              HV *element_hv;
              SV **element_document_descriptor_sv;

              build_new_base_element (document->tree);

          /* in that case, we do not reuse the "tree" reference
             in document->hv.  We therefore need to readd anything
             relevant, in practice only "tree_document_descriptor" */

              element_hv = (HV *) SvRV ((SV *) document->tree->sv);

              element_document_descriptor_sv
               = hv_fetch (element_hv, document_key, strlen (document_key), 0);

              if (!element_document_descriptor_sv)
                {
                  hv_store (element_hv, document_key, strlen (document_key),
                            newSViv (document->descriptor), 0);
                }
              /* the element_document_descriptor_sv may already exist if
                 $document->tree(1) is called twice, which should probably
                 never be particularly useful, but is not frowned upon either.
                 In 2026 it never happened in the tests.
               */
              else
                {
                  size_t stored_document_descriptor
                    = (size_t) SvIV (*element_document_descriptor_sv);
                  if (stored_document_descriptor != document->descriptor)
                    fatal ("Handle only tree inconsistent document descriptor");
                  /* to check that it never happens
                  fatal ("tree_document_descriptor already existing");
                   */
                }
            }
          return newSVsv (document->tree->sv);
        }

  /* No C tree.
     Prefer the tree of the Perl document associated to the C data */
      sv_reference = hv_fetch (document->hv, "tree", strlen ("tree"), 0);
    }

  if (!sv_reference)
    {
      HV *document_hv = (HV *) SvRV (document_in);
      sv_reference = hv_fetch (document_hv, "tree", strlen ("tree"), 0);
    }

  if (sv_reference && SvOK (*sv_reference))
    return newSVsv (*sv_reference);

  return newSV (0);
}

/* Build Texinfo Document registered data to Perl */

/* Note that the built Perl data is cached in the same place where pure Perl
   code looks for.  The Perl data is returned if nothing changed in C.  It
   means that after the first build to Perl, pure Perl code can change the
   Perl data and get the modified Perl data back even if XS is used, without
   XS/C code noticing any change.  In that case the C data will drift away
   from the Perl data, which could lead to subtle bugs.
 */

/* there are 2 differences between BUILD_PERL_DOCUMENT_ITEM and
   BUILD_PERL_DOCUMENT_LIST: in BUILD_PERL_DOCUMENT_LIST no check on existing
   document->fieldname and the address of document->fieldname is passed,
   not document->fieldname directly.
 */

#define BUILD_PERL_DOCUMENT_ITEM(funcname,fieldname,keyname,flagname,buildname,HVAV) \
SV * \
funcname (SV *document_in) \
{ \
  DOCUMENT *document; \
\
  dTHX;\
\
  document = get_sv_document_document (document_in, #funcname); \
\
  if (document) \
    {\
      const char *key = keyname; \
      if (document->fieldname) \
        { \
          store_document_tree_output_units (document);\
          if (document->modified_information & flagname)\
            {\
              HVAV *result_av_hv = buildname (document->fieldname);\
              SV *result_sv = newRV_noinc ((SV *) result_av_hv);\
              hv_store (document->hv, key, strlen (key), result_sv, 0);\
              document->modified_information &= ~flagname;\
              return newSVsv (result_sv); \
            }\
        }\
\
      SV **sv_reference = hv_fetch (document->hv, key, strlen (key), 0);\
      if (sv_reference && SvOK (*sv_reference))\
        return newSVsv (*sv_reference);\
   }\
\
  return newSV (0);\
}

/*
BUILD_PERL_DOCUMENT_ITEM(funcname,fieldname,keyname,flagname,buildname,HVAV)
 */


BUILD_PERL_DOCUMENT_ITEM(document_sectioning_root,sectioning_root,"sectioning_root",F_DOCM_sectioning_root,build_sectioning_root,HV)


#undef BUILD_PERL_DOCUMENT_ITEM

#define BUILD_PERL_DOCUMENT_LIST(funcname,fieldname,keyname,flagname,buildname,HVAV) \
SV * \
funcname (SV *document_in) \
{ \
  DOCUMENT *document; \
\
  dTHX;\
\
  document = get_sv_document_document (document_in, #funcname); \
\
  if (document)\
    {\
      const char *key = keyname; \
      store_document_tree_output_units (document);\
      if (document->modified_information & flagname)\
        {\
          HVAV *result_av_hv = buildname (&document->fieldname);\
          SV *result_sv = newRV_noinc ((SV *) result_av_hv);\
          hv_store (document->hv, key, strlen (key), result_sv, 0);\
          document->modified_information &= ~flagname;\
          return newSVsv (result_sv);\
        }\
\
      SV **sv_reference = hv_fetch (document->hv, key, strlen (key), 0);\
      if (sv_reference && SvOK (*sv_reference))\
        return newSVsv (*sv_reference);\
    }\
\
  return newSV (0);\
}

/*
BUILD_PERL_DOCUMENT_LIST(funcname,fieldname,keyname,flagname,buildname,HVAV)
*/

BUILD_PERL_DOCUMENT_LIST(document_nodes_list,nodes_list,"nodes_list",F_DOCM_nodes_list,build_node_relations_list,AV)

BUILD_PERL_DOCUMENT_LIST(document_sections_list,sections_list,"sections_list",F_DOCM_sections_list,build_section_relations_list,AV)

BUILD_PERL_DOCUMENT_LIST(document_headings_list,headings_list,"headings_list",F_DOCM_headings_list,build_heading_relations_list,AV)

BUILD_PERL_DOCUMENT_LIST(document_floats_information,listoffloats,"listoffloats_list",F_DOCM_floats,build_listoffloats_list,HV)

BUILD_PERL_DOCUMENT_LIST(document_internal_references_information,internal_references,"internal_references",F_DOCM_internal_references,build_internal_xref_list,AV)

BUILD_PERL_DOCUMENT_LIST(document_labels_list,labels_list,"labels_list",F_DOCM_labels_list,build_target_elements_list,AV)

BUILD_PERL_DOCUMENT_LIST(document_indices_information,indices_info,"indices",F_DOCM_index_names,build_index_data,HV)

BUILD_PERL_DOCUMENT_LIST(document_labels_information,identifiers_target,"identifiers_target",F_DOCM_identifiers_target,build_identifiers_target,HV)

BUILD_PERL_DOCUMENT_LIST(document_global_commands_information,global_commands,"commands_info",F_DOCM_global_commands,build_global_commands,HV)

#undef BUILD_PERL_DOCUMENT_LIST

SV *
document_global_information (SV *document_in)
{
  DOCUMENT *document;

  dTHX;

  document = get_sv_document_document (document_in,
                                       "document_global_information");
  if (document)
    {
      const char *key = "global_info";

      if (document->modified_information & F_DOCM_global_info)
        {
          /* Reuse the Perl hash associated to document if found */
          HV *hv;
          SV **global_info_sv
            = hv_fetch (document->hv, key, strlen (key), 0);

          if (global_info_sv && SvOK (*global_info_sv))
            hv = (HV *) SvRV (*global_info_sv);
          else
            {
              hv = newHV ();
              hv_store (document->hv, key, strlen (key),
                        newRV_noinc ((SV *) hv), 0);
            }

          pass_global_info (hv, &document->global_info,
                            &document->global_commands);
          document->modified_information &= ~F_DOCM_global_info;
          return newRV_inc ((SV *) hv);
        }

      SV **sv_reference = hv_fetch (document->hv, key, strlen (key), 0);
      if (sv_reference && SvOK (*sv_reference))
        return newSVsv (*sv_reference);
    }

  return newSV (0);
}



/* Build indices information for Perl */

/* finds index name and entry number index entry SV in Perl data */
static SV *
find_idx_name_entry_number_sv (HV *indices_information_hv,
                               const char* index_name, int entry_number,
                               const char *message)
{
  SV **index_info_sv;
  SV *index_entry_sv = 0;

  dTHX;

  index_info_sv = hv_fetch (indices_information_hv, index_name,
                            strlen (index_name), 0);
  if (!index_info_sv)
    {
      fprintf (stderr, "%s index %s not found\n", message, index_name);
    }
  else
    {
      HV *index_info_hv = (HV *) SvRV (*index_info_sv);
      SV **index_info_index_entries_sv = hv_fetch (index_info_hv,
             "index_entries", strlen ("index_entries"), 0);

      if (!index_info_index_entries_sv)
        {
          fprintf (stderr, "%s index %s 'index_entries' not found\n",
                           message, index_name);
        }
      else
        {
          AV *index_info_entries_av
              = (AV *) SvRV (*index_info_index_entries_sv);

          SV **index_entry_info_sv = av_fetch (index_info_entries_av,
                                             entry_number -1, 0);

          if (!index_entry_info_sv)
            {
              fprintf (stderr, "%s: %d in %s not found\n", message,
                       entry_number, index_name);
            }
          else
            index_entry_sv = *index_entry_info_sv;
        }
    }
  return index_entry_sv;
}

/* Currently unused */
HV *
build_indices_sort_strings (const INDICES_SORT_STRINGS *indices_sort_strings,
                            HV *indices_information_hv)
{
  HV *indices_sort_strings_hv;
  size_t i;

  dTHX;

  if (!indices_sort_strings)
    return 0;

  indices_sort_strings_hv = newHV ();

  for (i = 0; i < indices_sort_strings->number; i++)
    {
      const INDEX_SORT_STRINGS *index_sort_strings
         = &indices_sort_strings->indices[i];
      const char *index_name = index_sort_strings->index->name;

      if (index_sort_strings->entries_number > 0)
        {
          size_t j;
          AV *sort_string_entries_av = newAV ();

          hv_store (indices_sort_strings_hv, index_name, strlen (index_name),
                    newRV_noinc ((SV *)sort_string_entries_av), 0);

          for (j = 0; j < index_sort_strings->entries_number; j++)
            {
              const INDEX_ENTRY_SORT_STRING *index_entry_sort_string
                = &index_sort_strings->sort_string_entries[j];
              const INDEX_ENTRY *entry = index_entry_sort_string->entry;
              const char *entry_index_name = entry->index_name;
              int entry_number = entry->number;
              char *message;
              SV *index_entry_sv;
              HV *index_entry_sort_string_hv;
              AV *sort_string_subentries_av;
              size_t k;

              if (index_entry_sort_string->subentries_number <= 0)
                {
                  fprintf (stderr, "BUG: build_indices_sort_strings:"
                   " %s: entry %zu: no subentries", index_name, j);
                  continue;
                }

              xasprintf (&message, "BUG: build_indices_sort_strings:"
                                   " %s: entry %zu", index_name, j);
              index_entry_sv
                = find_idx_name_entry_number_sv (indices_information_hv,
                                                 entry_index_name, entry_number,
                                                 message);
              non_perl_free (message);

              /* probably not possible, unless there is a bug */
              if (!index_entry_sv)
                continue;

              index_entry_sort_string_hv = newHV ();
              av_push (sort_string_entries_av,
                       newRV_noinc ((SV *) index_entry_sort_string_hv));

              hv_store (index_entry_sort_string_hv, "index_name",
                        strlen ("index_name"),
                        newSVpv_utf8 (entry->index_name, 0), 0);
              hv_store (index_entry_sort_string_hv, "number",
                        strlen ("number"), newSViv (entry->number), 0);

              hv_store (index_entry_sort_string_hv, "entry",
                        strlen ("entry"), newSVsv (index_entry_sv), 0);

              sort_string_subentries_av = newAV ();
              hv_store (index_entry_sort_string_hv, "sort_strings",
                        strlen ("sort_strings"),
                        newRV_noinc ((SV *) sort_string_subentries_av), 0);

              for (k = 0; k < index_entry_sort_string->subentries_number; k++)
                {
                  const INDEX_SUBENTRY_SORT_STRING *subentry_sort_string
                    = &index_entry_sort_string->sort_string_subentries[k];
                  HV *subentry_sort_string_hv = newHV ();

                  av_push (sort_string_subentries_av,
                           newRV_noinc ((SV *) subentry_sort_string_hv));

                  hv_store (subentry_sort_string_hv, "sort_string",
                            strlen ("sort_string"),
                     newSVpv_utf8 (subentry_sort_string->sort_string, 0), 0);
                  hv_store (subentry_sort_string_hv, "alpha",
                            strlen ("alpha"),
                            newSViv (subentry_sort_string->alpha), 0);
                }
            }
        }
    }
  return indices_sort_strings_hv;
}

HV *
build_sorted_indices_by_index (
                      const INDEX_SORTED_BY_INDEX *index_entries_by_index,
                      HV *indices_information_hv)
{
  HV *indices_hv;
  const INDEX_SORTED_BY_INDEX *idx;

  dTHX;

  if (!index_entries_by_index)
    return 0;

  indices_hv = newHV ();

  for (idx = index_entries_by_index; idx->name; idx++)
    {
      AV *entries_av = newAV ();
      size_t j;

      hv_store (indices_hv, idx->name, strlen (idx->name),
                newRV_noinc ((SV *)entries_av), 0);

      for (j = 0; j < idx->entries_number; j++)
        {
          const INDEX_ENTRY *entry = idx->entries[j];
          const char *index_name = entry->index_name;
          int entry_number = entry->number;
          char *message;
          SV *index_entry_sv;

          xasprintf (&message, "BUG: build_sorted_indices_by_index:"
                               " %s: entry %zu", idx->name, j);
          index_entry_sv
            = find_idx_name_entry_number_sv (indices_information_hv,
                                             index_name, entry_number,
                                             message);
          non_perl_free (message);

          if (index_entry_sv)
            {
              av_push (entries_av, newSVsv (index_entry_sv));
            }
        }
    }
  return indices_hv;
}

HV *
build_sorted_indices_by_letter (
                      const INDEX_SORTED_BY_LETTER *index_entries_by_letter,
                      HV *indices_information_hv)
{
  HV *indices_hv;
  const INDEX_SORTED_BY_LETTER *idx;

  dTHX;

  if (!index_entries_by_letter)
    return 0;

  indices_hv = newHV ();

  for (idx = index_entries_by_letter; idx->name; idx++)
    {
      AV *sorted_letters_av;
      size_t i;

      if (idx->letter_number <= 0)
        continue;

      sorted_letters_av = newAV ();

      hv_store (indices_hv, idx->name, strlen (idx->name),
                newRV_noinc ((SV *)sorted_letters_av), 0);

      for (i = 0; i < idx->letter_number; i++)
        {
          size_t j;
          HV *letter_hv = newHV ();
          AV *entries_av = newAV ();
          const LETTER_INDEX_ENTRIES *letter = &idx->letter_entries[i];

          hv_store (letter_hv, "letter", strlen ("letter"),
                    newSVpv_utf8 (letter->letter, 0), 0);

          hv_store (letter_hv, "entries", strlen ("entries"),
                    newRV_noinc ((SV *)entries_av), 0);

          av_push (sorted_letters_av, newRV_noinc ((SV *)letter_hv));

          for (j = 0; j < letter->entries_number; j++)
            {
              const INDEX_ENTRY *entry = letter->entries[j];
              const char *index_name = entry->index_name;
              int entry_number = entry->number;
              char *message;
              SV *index_entry_sv;
              xasprintf (&message, "BUG: build_sorted_indices_by_letter:"
                                   " %s: %s: entry %zu", idx->name,
                                   letter->letter, j);
              index_entry_sv
                = find_idx_name_entry_number_sv (indices_information_hv,
                                                 index_name, entry_number,
                                                 message);
              non_perl_free (message);

              if (index_entry_sv)
                {
                  av_push (entries_av, newSVsv (index_entry_sv));
                }
            }
        }
    }
  return indices_hv;
}



/* a fake output units list that only holds a descriptor allowing
   to retrieve the C data */
SV *
setup_output_units_handler (const DOCUMENT *document,
                            size_t output_units_descriptor)
{
  AV *av_output_units;
  HV *dummy_output_unit;
  SV *sv;
  const OUTPUT_UNIT_LIST *output_units;

  dTHX;

  output_units = retrieve_output_units (document, output_units_descriptor);

  if (!output_units || !output_units->number)
    return newSV (0);

  av_output_units = newAV ();

  dummy_output_unit = newHV ();

  hv_store (dummy_output_unit, "output_units_descriptor",
            strlen ("output_units_descriptor"),
            newSViv (output_units_descriptor), 0);
  hv_store (dummy_output_unit, "output_units_document_descriptor",
            strlen ("output_units_document_descriptor"),
            newSViv ((IV)document->descriptor), 0);

  sv = newRV_noinc ((SV *) dummy_output_unit);
  av_push (av_output_units, sv);

  return newRV_noinc ((SV *) av_output_units);
}



static HV *
build_expanded_formats (const EXPANDED_FORMAT *expanded_formats)
{
  size_t i;
  HV *expanded_hv;

  dTHX;

  expanded_hv = newHV ();
  for (i = 0; i < expanded_formats_number (); i++)
    {
      if (expanded_formats[i].expandedp)
        {
          const char *format = expanded_formats[i].format;
          hv_store (expanded_hv, format, strlen (format),
                    newSViv (1), 0);
        }
    }
  return expanded_hv;
}

static HV *
build_translated_commands (const TRANSLATED_COMMAND_LIST *translated_commands)
{
  size_t i;
  HV *translated_hv;

  dTHX;

  translated_hv = newHV ();
  for (i = 0; i < translated_commands->number; i++)
    {
      enum command_id cmd = translated_commands->list[i].cmd;
      const char *translation = translated_commands->list[i].translation;
      const char *command_name = builtin_command_name (cmd);
      hv_store (translated_hv, command_name, strlen (command_name),
                newSVpv_utf8 (translation, 0), 0);
    }
  return translated_hv;
}

SV *
build_convert_text_options (TEXT_OPTIONS *text_options)
{
  HV *text_options_hv;
  HV *expanded_formats_hv;
  HV *translated_commands_hv;

  dTHX;

  text_options_hv = newHV ();

#define STORE(key, sv) hv_store (text_options_hv, key, strlen (key), sv, 0)

  if (text_options->ASCII_GLYPH)
    STORE("ASCII_GLYPH", newSViv (1));

  if (text_options->DEBUG)
    STORE("DEBUG", newSViv (1));

  if (text_options->DOC_ENCODING_FOR_INPUT_FILE_NAME)
    STORE("DOC_ENCODING_FOR_INPUT_FILE_NAME", newSViv (1));

  if (text_options->NUMBER_SECTIONS)
    STORE("NUMBER_SECTIONS", newSViv (1));

  if (text_options->TEST)
    STORE("TEST", newSViv (1));

  if (text_options->sort_string)
    STORE("sort_string", newSViv (1));

  if (text_options->encoding)
    STORE("enabled_encoding", newSVpv_utf8 (text_options->encoding, 0));

  if (text_options->set_case)
    STORE("set_case", newSViv (text_options->set_case));

  if (text_options->code_state)
    STORE("_code_state", newSViv (text_options->code_state));

  if (text_options->INPUT_FILE_NAME_ENCODING)
    STORE("INPUT_FILE_NAME_ENCODING",
           newSVpv_utf8 (text_options->INPUT_FILE_NAME_ENCODING, 0));

  if (text_options->LOCALE_ENCODING)
    STORE("LOCALE_ENCODING",
           newSVpv_utf8 (text_options->LOCALE_ENCODING, 0));

  if (text_options->COMMAND_LINE_ENCODING)
    STORE("COMMAND_LINE_ENCODING",
           newSVpv_utf8 (text_options->COMMAND_LINE_ENCODING, 0));

  expanded_formats_hv = build_expanded_formats (text_options->expanded_formats);
  STORE("expanded_formats", newRV_noinc ((SV *)expanded_formats_hv));

  if (text_options->include_directories.number > 0)
    {
      AV *av = build_string_list (&text_options->include_directories, svt_byte);
      STORE("INCLUDE_DIRECTORIES", newRV_noinc ((SV *) av));
    }

  translated_commands_hv
    = build_translated_commands (&text_options->translated_commands);
  STORE("translated_commands", newRV_noinc ((SV *) translated_commands_hv));

  if (text_options->converter && text_options->converter->sv)
    {
      STORE("converter", newSVsv (text_options->converter->sv));
    }
#undef STORE

  return newRV_noinc ((SV *)text_options_hv);
}

void
pass_document_sv_to_converter_sv (SV *converter_sv, SV *document_in)
{
  HV *converter_hv;

  dTHX;

  converter_hv = (HV *)SvRV (converter_sv);

  if (document_in && SvOK (document_in))
    {
      hv_store (converter_hv, "document", strlen ("document"),
                newSVsv (document_in), 0);
    }

  hv_delete (converter_hv, "sorted_indices_by_letter",
             strlen ("sorted_indices_by_letter"), G_DISCARD);
  hv_delete (converter_hv, "sorted_indices_by_index",
             strlen ("sorted_indices_by_index"), G_DISCARD);
  hv_delete (converter_hv, "index_entries_sort_strings",
             strlen ("index_entries_sort_strings"), G_DISCARD);
}

void
pass_converter_text_options (const CONVERTER *converter, SV *converter_sv)
{
  HV *converter_hv;

  dTHX;

  converter_hv = (HV *)SvRV (converter_sv);

  if (converter && converter->convert_text_options)
    {
      SV *text_options_sv
       = build_convert_text_options (converter->convert_text_options);
      hv_store (converter_hv,
                "convert_text_options", strlen("convert_text_options"),
                text_options_sv, 0);
    }
}



/* build customization options to Perl */

/* build a Perl button data from pure C button structure.
   This is a partial implementation.
   This function can only be called for default buttons for now, so we do
   not need to handle other types of buttons, which are either not
   interesting to handle, or need Perl info */
static SV *
html_build_button (const CONVERTER *converter, BUTTON_SPECIFICATION *button,
                   int *user_function_number)
{
  dTHX;

  *user_function_number = 0;

  switch (button->type)
    {
      const char *direction_name;
      case BST_direction:
        if (button->b.direction < 0)
          direction_name = button->direction_string;
        else
          direction_name
            = direction_unit_direction_name (button->b.direction,
                                             converter);
        if (!direction_name)
          {
            char *msg;
            xasprintf (&msg, "No name for button direction %d",
                       button->b.direction);
            fatal (msg);
            non_perl_free (msg);
          }
        return newSVpv_utf8 (direction_name, 0);
        break;

      case BST_direction_info:
        {
          BUTTON_SPECIFICATION_INFO *button_spec = button->b.button_info;
          AV *button_spec_info_av;

          if (button_spec->direction < 0)
            direction_name = button->direction_string;
          else
            direction_name
              = direction_unit_direction_name (button_spec->direction,
                                               converter);
          if (!direction_name)
            {
              char *msg;
              xasprintf (&msg, "No name for array button direction %d",
                              button_spec->direction);
              fatal (msg);
              non_perl_free (msg);
            }

          if (button_spec->type == BIT_function)
            {
              /* contains a leading :: */
              const char *sub_name = html_button_function_type_string[
                                      button_spec->bi.button_function.type];
              if (sub_name)
                {
                  char *sub_full_name;
                  CV *button_function_cv;

                  xasprintf (&sub_full_name, "Texinfo::Convert::HTML%s",
                             sub_name);
                  button_function_cv = get_cv (sub_full_name, 0);
                  if (!button_function_cv)
                    fprintf (stderr, "BUG: %s: not found\n", sub_full_name);

                  non_perl_free (sub_full_name);

                  button_spec_info_av = newAV ();
                  av_push (button_spec_info_av,
                           newSVpv_utf8 (direction_name, 0));
              /* This is needed as tested.  This probably means that get_cv
                 do not increase the refcount, so it is ok to do it here */
                  av_push (button_spec_info_av,
                           newRV_inc ((SV *) button_function_cv));
                  return newRV_noinc ((SV *) button_spec_info_av);
                }
            }
        }
        break;

      default:
        break;
    }
  return newSV (0);
}

void
html_build_buttons_specification (CONVERTER *converter,
                                  BUTTON_SPECIFICATION_LIST *buttons)
{
  AV *buttons_av;
  size_t i;

  dTHX;

  /* we retain this reference in C, which should be removed when
     the converter is destroyed, by creating one when returning
     a reference on the AV */
  buttons_av = newAV ();

  buttons->av = buttons_av;
  HTML_CONVERTER_STATE *self_html = converter
                                    ? converter->html_converter : NULL;

  for (i = 0; i < buttons->number; i++)
    {
      int user_function_number;
      BUTTON_SPECIFICATION *button = &buttons->list[i];

      SV *button_sv = html_build_button (converter, button,
                                         &user_function_number);
      buttons->BIT_user_function_number += user_function_number;

      if (self_html)
        self_html->external_references_number += user_function_number;

      button->sv = button_sv;

      /* retain a reference in C */
      av_push (buttons_av, newSVsv (button_sv));
    }
}

SV *
html_build_direction_icons (const DIRECTION_ICON_LIST *direction_icons)
{
  HV *icons_hv;
  size_t i;

  dTHX;

  if (!direction_icons)
    return newSV (0);

  icons_hv = newHV ();

  for (i = 0; i < direction_icons->number; i++)
    {
      DIRECTION_ICON *icon = &direction_icons->icons_list[i];
      if (icon->direction_name)
        {
          SV *name_sv;
          SV *direction_name_sv = newSVpv_utf8 (icon->direction_name, 0);
          if (icon->name)
            name_sv = newSVpv_utf8 (icon->name, 0);
          else
            name_sv = newSV (0);
          hv_store_ent (icons_hv, direction_name_sv, name_sv, 0);
        }
    }

  return newRV_noinc ((SV *)icons_hv);
}

SV *
build_sv_option (const OPTION *option, CONVERTER *converter)
{
  dTHX;

  switch (option->type)
    {
      case GOT_integer:
      case GOT_boolean:
        if (option->o.integer == -1)
          return newSV (0);
        return newSViv (option->o.integer);
        break;

      case GOT_char:
        if (!option->o.string)
          return newSV (0);
        return newSVpv_utf8 (option->o.string, 0);
        break;

      case GOT_bytes:
        if (!option->o.string)
          return newSV (0);
        return newSVpv_byte (option->o.string, 0);
        break;

      case GOT_bytes_string_list:
        return newRV_noinc ((SV *) build_string_list(option->o.strlist,
                            svt_byte));
        break;

      case GOT_file_string_list:
        return newRV_noinc ((SV *) build_string_list(option->o.strlist,
                            svt_dir));
        break;

      case GOT_char_string_list:
        return newRV_noinc ((SV *) build_string_list(option->o.strlist,
                            svt_char));
        break;

      case GOT_buttons:
        if (option->o.buttons)
          {
            if (!option->o.buttons->av)
              html_build_buttons_specification (converter, option->o.buttons);
            /* add an additional reference to retain one in C */
            return newRV_inc ((SV *) option->o.buttons->av);
          }
        break;

      case GOT_icons:
        return html_build_direction_icons (option->o.icons);
        break;

      default:
        break;
    }
  return newSV (0);
}

/* not much used, as in general the options are only stored in C and
   accessed through the API and built when accessed through a converter.
   This is only used when there is no converter, when a function is called with
   a class name only and returns an option hash */
SV *
build_sv_options_from_options_list (const OPTIONS_LIST *options_list)
{
  size_t i;
  HV *options_hv;

  dTHX;

  options_hv = newHV ();

  for (i = 0; i < options_list->number; i++)
    {
      size_t index = options_list->list[i] -1;
      const OPTION *option = options_list->sorted_options[index];
      const char *key = option->name;
      SV *option_sv = build_sv_option (option, 0);

      /* we store all values as they appear, the later overriding earlier
         values, and do not treat undef nor C option configured field
         especially */
      hv_store (options_hv, key, strlen (key), option_sv, 0);
    }

  return newRV_noinc ((SV *)options_hv);
}



/* pass generic converter information to Perl */

static HV *
build_deprecated_directories (
           const DEPRECATED_DIRS_LIST *deprecated_directories)
{
  size_t i;
  HV *deprecated_directories_hv;

  dTHX;

  deprecated_directories_hv = newHV ();
  for (i = 0; i < deprecated_directories->number; i++)
    {
      const char *reference_dir
        = deprecated_directories->list[i].reference_dir;
      const char *obsolete_dir
        = deprecated_directories->list[i].obsolete_dir;
      SV *reference_dir_sv = newSVpv_utf8 (reference_dir, 0);
      SV *obsolete_dir_sv = newSVpv_utf8 (obsolete_dir, 0);
      hv_store_ent (deprecated_directories_hv, obsolete_dir_sv,
                    reference_dir_sv, 0);
    }
  return deprecated_directories_hv;
}

/* Build a converter info hash reference based on CONF */
SV *
build_sv_converter_info_from_converter_initialization_info (
                             const CONVERTER_INITIALIZATION_INFO *conf)
{
  SV *result;
  HV *deprecated_directories_hv;
  HV *translated_commands_hv;
  HV *result_hv;

  dTHX;

  result = build_sv_options_from_options_list (&conf->conf);

  result_hv = (HV *) SvRV (result);
#define STORE(key, sv) hv_store (result_hv, key, strlen (key), sv, 0);
  translated_commands_hv
    = build_translated_commands (&conf->translated_commands);
  STORE("translated_commands", newRV_noinc ((SV *) translated_commands_hv));

  deprecated_directories_hv
    = build_deprecated_directories (&conf->deprecated_config_directories);
  STORE("deprecated_config_directories",
        newRV_noinc ((SV *) deprecated_directories_hv));
#undef STORE

  return result;
}

void
pass_generic_converter_to_converter_sv (SV *converter_sv,
                                        const CONVERTER *converter)
{
  HV *converter_hv;
  HV *expanded_formats_hv;
  HV *translated_commands_hv;
  HV *deprecated_directories_hv;
  HV *output_files_hv;
  HV *unclosed_files_hv;
  HV *opened_files_hv;

  dTHX;

  converter_hv = (HV *)SvRV (converter_sv);

#define STORE(key, sv) hv_store (converter_hv, key, strlen (key), sv, 0);
  /* $converter->{'output_files'}
        = Texinfo::Convert::Utils::output_files_initialize(); */
  output_files_hv = newHV ();
  STORE("output_files", newRV_noinc ((SV *) output_files_hv));

  unclosed_files_hv = newHV ();
  opened_files_hv = newHV ();
  hv_store (output_files_hv, "unclosed_files", strlen ("unclosed_files"),
            newRV_noinc ((SV *) unclosed_files_hv), 0);
  hv_store (output_files_hv, "opened_files",
            strlen ("opened_files"),
            newRV_noinc ((SV *) opened_files_hv), 0);

  expanded_formats_hv
    = build_expanded_formats (converter->expanded_formats);
  STORE("expanded_formats", newRV_noinc ((SV *) expanded_formats_hv));

  translated_commands_hv
    = build_translated_commands (&converter->translated_commands);
  STORE("translated_commands", newRV_noinc ((SV *) translated_commands_hv));

  deprecated_directories_hv
    = build_deprecated_directories (&converter->deprecated_config_directories);
  STORE("deprecated_config_directories",
        newRV_noinc ((SV *) deprecated_directories_hv));

  /* store converter_descriptor in perl converter */
  /* NOTE unlikely IV overflow if PERL_QUAD_MAX < SIZE_MAX */
  STORE("converter_descriptor", newSViv ((IV)converter->converter_descriptor));

#undef STORE
}



/* API to access output file names associated with output units */

static HV *
build_filenames (const FILE_NAME_PATH_COUNTER_LIST *output_unit_files)
{
  size_t i;
  HV *hv;

  dTHX;

  hv = newHV ();

  if (output_unit_files)
    {
      for (i = 0; i < output_unit_files->number; i++)
        {
          const FILE_NAME_PATH_COUNTER *output_unit_file
            = &output_unit_files->list[i];
          const char *normalized_filename
             = output_unit_file->normalized_filename;
          SV *normalized_filename_sv = newSVpv_utf8 (normalized_filename, 0);

          hv_store_ent (hv, normalized_filename_sv,
                    newSVpv_utf8 (output_unit_file->filename, 0), 0);
        }
    }

  return hv;
}

static HV *
build_file_counters (const FILE_NAME_PATH_COUNTER_LIST *output_unit_files)
{
  size_t i;
  HV *hv;

  dTHX;

  hv = newHV ();

  if (output_unit_files)
    {
      for (i = 0; i < output_unit_files->number; i++)
        {
          const FILE_NAME_PATH_COUNTER *output_unit_file
            = &output_unit_files->list[i];
          const char *filename = output_unit_file->filename;
          SV *filename_sv = newSVpv_utf8 (filename, 0);

          hv_store_ent (hv, filename_sv, newSViv (output_unit_file->counter), 0);
        }
    }

  return hv;
}

HV *
build_out_filepaths (const FILE_NAME_PATH_COUNTER_LIST *output_unit_files)
{
  size_t i;
  HV *hv;

  dTHX;

  hv = newHV ();

  if (output_unit_files)
    {
      for (i = 0; i < output_unit_files->number; i++)
        {
          const FILE_NAME_PATH_COUNTER *output_unit_file
            = &output_unit_files->list[i];
          const char *filename = output_unit_file->filename;
          SV *filename_sv = newSVpv_utf8 (filename, 0);

          hv_store_ent (hv, filename_sv,
                        newSVpv_utf8 (output_unit_file->filepath, 0), 0);
        }
    }

  return hv;
}

/* currently unused */
/* Not needed because all the information is already in overriden functions,
   setup in _prepare_units_directions_files (calling _html_set_pages_files)
   and _node_redirections, and accessed through _html_convert_output
   and count_elements_in_filename. */
void
pass_output_unit_files (SV *converter_sv,
                        const FILE_NAME_PATH_COUNTER_LIST *output_unit_files)
{
  HV *filenames_hv;
  HV *file_counters_hv;
  HV *out_filepaths_hv;

  dTHX;

  HV *converter_hv = (HV *) SvRV (converter_sv);

  filenames_hv = build_filenames (output_unit_files);
  file_counters_hv = build_file_counters (output_unit_files);
  out_filepaths_hv = build_out_filepaths (output_unit_files);

#define STORE(key) \
  hv_store (converter_hv, #key, strlen (#key), newRV_noinc ((SV *) key##_hv), 0);
  STORE(filenames);
  STORE(file_counters);
  STORE(out_filepaths);
#undef STORE
}



/* Texinfo::Convert::Utils output_files_information API */
static void
build_output_files_unclosed_files (HV *hv,
                 const OUTPUT_FILES_INFORMATION *output_files_information)
{
  SV **unclosed_files_sv;
  HV *unclosed_files_hv;

  const FILE_STREAM_LIST *unclosed_files;
  size_t i;

  dTHX;

  unclosed_files_sv = hv_fetch (hv, "unclosed_files",
                                strlen ("unclosed_files"), 0);

  if (!unclosed_files_sv)
    {
      unclosed_files_hv = newHV ();
      hv_store (hv, "unclosed_files", strlen ("unclosed_files"),
                newRV_noinc ((SV *) unclosed_files_hv), 0);
    }
  else
    {
      unclosed_files_hv = (HV *)SvRV (*unclosed_files_sv);
    }

  unclosed_files = &output_files_information->unclosed_files;
  if (unclosed_files->number > 0)
    {
      for (i = 0; i < unclosed_files->number; i++)
        {
          const FILE_STREAM *file_stream = &unclosed_files->list[i];
          const char *file_path = file_stream->file_path;
      /* It is not possible to associate the unclosed stream to a SV.
         It is possible to obtain a PerlIO from a FILE, as described in
           https://perldoc.perl.org/perlapio
         with
           PerlIO *   PerlIO_importFILE  (FILE *stdio, const char *mode)
         However, it is not possible to create an IO * SV from the PerlIO
         or associate to an already existing IO *. An IO * SV is created by
           IO *  newIO()
         and it is possible to get the associated PerlIO, with
           PerlIO *IoOFP(IO *io);
         but not to set it.

         However, it is possible to pass a stream through the XS
         interface.  Therefore here, the unclosed file name is registered,
         the stream can then be passed to Perl through a call of
         the XS interface
         Texinfo::Convert::ConvertConverterXS::XS_get_unclosed_stream.

         Register that there is an unclosed file from XS by associating
         with undef; if from Perl, it would be associated with a file handle */
          SV *file_path_sv = newSVpv_byte (file_path, 0);
          hv_store_ent (unclosed_files_hv, file_path_sv, newSV (0), 0);
        }
    }
}

/* input hv should be an output_files hv, in general setup by
 $converter->{'output_files'} = Texinfo::Convert::Utils::output_files_initialize(); */
static void
build_output_files_opened_files (HV *hv,
                    const OUTPUT_FILES_INFORMATION *output_files_information)
{
  SV **opened_files_sv;
  HV *opened_files_hv;

  const STRING_LIST *opened_files;
  size_t i;

  dTHX;

  opened_files_sv = hv_fetch (hv, "opened_files", strlen ("opened_files"), 0);

  if (!opened_files_sv)
    {
      opened_files_hv = newHV ();
      hv_store (hv, "opened_files", strlen ("opened_files"),
                newRV_noinc ((SV *) opened_files_hv), 0);
    }
  else
    {
      opened_files_hv = (HV *)SvRV (*opened_files_sv);
    }

  opened_files = &output_files_information->opened_files;
  if (opened_files->number > 0)
    {
      for (i = 0; i < opened_files->number; i++)
        {
          const char *file_path = opened_files->list[i];
          SV *file_path_sv = newSVpv_byte (file_path, 0);
          hv_store_ent (opened_files_hv, file_path_sv, newSViv (1), 0);
        }
    }
}

void
build_output_files_information (SV *converter_sv,
                   const OUTPUT_FILES_INFORMATION *output_files_information)
{
  HV *hv;
  SV **output_files_sv;
  HV *output_files_hv;

  dTHX;

  hv = (HV *) SvRV (converter_sv);

  output_files_sv = hv_fetch (hv, "output_files",
                                strlen ("output_files"), 0);

  if (!output_files_sv)
    {
      output_files_hv = newHV ();
      hv_store (hv, "output_files", strlen ("output_files"),
                newRV_noinc ((SV *) output_files_hv), 0);
    }
  else
    {
      output_files_hv = (HV *)SvRV (*output_files_sv);
    }

  build_output_files_opened_files (output_files_hv,
                                   output_files_information);
  build_output_files_unclosed_files (output_files_hv,
                                     output_files_information);
}


static const char *latex_math_options[] = {
  "DEBUG", "OUTPUT_CHARACTERS", "OUTPUT_ENCODING_NAME", "TEST", 0
};

HV *
latex_build_options_for_convert_to_latex_math (CONVERTER *converter)
{
  HV *options_latex_math_hv;
  int i;

  dTHX;

  options_latex_math_hv = newHV ();

  for (i = 0; latex_math_options[i]; i++)
    {
      const char *option_name = latex_math_options[i];
      const OPTION *option = find_option_string (converter->sorted_options,
                                                 option_name);
      /* no testing if option is NULL, we know that latex_math_options exist */
      SV *option_sv = build_sv_option (option, converter);
      if (SvOK (option_sv))
        {
          hv_store (options_latex_math_hv, option_name,
                    strlen (option_name), option_sv, 0);
        }
    }

  return options_latex_math_hv;
}

