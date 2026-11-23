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

/* Not built, only used as an example */

#include <stdlib.h>

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include "text.h"
#include "tree_types.h"
#include "document_types.h"
#include "converter_types.h"
/* fatal */
#include "base_utils.h"
#include "tree.h"
/* find_element_type */
#include "builtin_commands.h"
/* add_string */
#include "utils.h"
#include "translations.h"
#include "get_perl_info.h"

/* for any element */
DOCUMENT *
get_sv_element_document (SV *element_in, const char *warn_string)
{
  dTHX;

  return get_document_or_warn (element_in, "element_document_descriptor",
                               warn_string);
}

ELEMENT *
get_sv_element_element (SV *element_sv, DOCUMENT *document)
{
  HV *element_hv;
  SV **handle_sv;
  const char *key = "_handle";

  dTHX;

  if (!document)
    return 0;

  element_hv = (HV *) SvRV (element_sv);

  handle_sv = hv_fetch (element_hv, key, strlen(key), 0);
  if (handle_sv)
    {
      ELEMENT *e = 0;
      size_t element_number = (size_t) SvIV (*handle_sv);
      /* could also be a function like retrieve_document_element */
      if (element_number <= document->element_handles.number)
        {
          e = document->element_handles.list[element_number -1];
        }
      return e;
    }
  return 0;
}

#define FETCH(key) key##_sv = hv_fetch (hv_in, #key, strlen (#key), 0);
/* TODO extra/info information not incorporated.  Could use
   convert/swig_interface.c set_element_attribute_* functions for that.
 */
ELEMENT *
new_element_from_sv (DOCUMENT *document, const SV *element_hash,
                     CONVERTER *converter)
{
  HV *hv_in;
  ELEMENT *e;
  SV **text_sv;
  SV **type_sv;
  SV **cmdname_sv;
  SV **contents_sv;
  SV **source_info_sv;
  const char *cmdname = 0;
  const char *type_name = 0;

  dTHX;

  hv_in = (HV *)SvRV (element_hash);

  FETCH(type);

  if (type_sv)
    type_name = SvPVutf8_nolen (*type_sv);

  FETCH(text);
  if (text_sv && SvOK (*text_sv))
    {
      enum element_type e_type = ET_NONE;
      if (type_name)
        e_type = find_element_type ((char *)type_name);
      if (e_type == ET_NONE)
        return 0;
      e = new_text_element (e_type);
      const char *text = SvPVutf8_nolen (*text_sv);
      text_append (e->e.text, text);
      return e;
    }

  FETCH(cmdname)
  if (cmdname_sv)
    cmdname = SvPVutf8_nolen (*cmdname_sv);

  e = new_element_from_names (type_name, cmdname, 0);

  if (!e)
    {
      fprintf (stderr, "unknown type %s command %s element\n",
                       type_name, cmdname);
      fatal ("error constructing element");
    }

  FETCH(contents)
  if (contents_sv)
    {
      SSize_t i;
      SSize_t contents_nr;
      AV *contents_av = (AV *) SvRV (*contents_sv);

      contents_nr = AvFILL (contents_av) +1;

      for (i = 0; i < contents_nr; i++)
        {
          SV **content_sv = av_fetch (contents_av, i, 0);
          if (content_sv)
            {
              ELEMENT *element = 0;
              DOCUMENT *document = get_sv_element_document (*content_sv, 0);
              if (document)
                element
                  = get_sv_element_element (*content_sv, document);
              else if (converter)
                /* TODO using find_element_from_sv may allow to
                   find the C elements in more situations, but it could
                   also hide bugs, as we would like not to need to
                   use find_element_from_sv and instead have a consistent
                   interface */
                /* discard const */
                element = (ELEMENT *)find_element_from_sv (converter, 0,
                                                           *content_sv, 0);
              if (element)
                add_element_to_element_contents (e, element);
              else
                fatal ("No C element");
            }
        }
    }

#define FETCHSOURCE(key) key##_sv = hv_fetch (source_info_hv, #key, strlen (#key), 0);
  FETCH(source_info);
  if (source_info_sv)
    {
      /* similar to get_source_info, but the memory is managed differently
         as here the information is directly added to the element */
      HV *source_info_hv = (HV *) SvRV (*source_info_sv);
      SV **macro_sv;
      SV **file_name_sv;
      SV **line_nr_sv;

      FETCHSOURCE(macro)

      if (macro_sv)
        {
          const char *macro = SvPVutf8_nolen (*macro_sv);
          e->e.c->source_info.macro
            = add_string (macro, document->small_strings);
        }

      FETCHSOURCE(file_name)

      if (file_name_sv && SvOK (*file_name_sv))
        {
          const char *file_name = SvPVbyte_nolen (*file_name_sv);
          e->e.c->source_info.file_name
            = add_string (file_name, document->small_strings);
        }

      FETCHSOURCE(line_nr)

      if (line_nr_sv)
        e->e.c->source_info.line_nr = SvIV (*line_nr_sv);
    }
#undef FETCHSOURCE

  return e;
}
#undef FETCH

NAMED_STRING_ELEMENT_LIST *
get_replaced_substrings (SV *replaced_substrings_sv)
{
  I32 hv_number;
  I32 i;
  HV *replaced_substrings_hv;
  NAMED_STRING_ELEMENT_LIST *replaced_substrings = 0;

  dTHX;

  replaced_substrings_hv = (HV *)SvRV (replaced_substrings_sv);
  hv_number = hv_iterinit (replaced_substrings_hv);
  if (hv_number > 0)
    {
      replaced_substrings = new_named_string_element_list ();
      for (i = 0; i < hv_number; i++)
        {
          ELEMENT *element = 0;
          char *key;
          I32 retlen;
          SV *element_sv = hv_iternextsv(replaced_substrings_hv,
                                         &key, &retlen);
          DOCUMENT *document = get_sv_tree_document (element_sv, 0);
          if (document && document->tree)
            element = document->tree;
          else
            {
              document = get_sv_element_document (element_sv, 0);
              if (document)
                element = get_sv_element_element (element_sv, document);
            }
          if (element)
            add_element_to_named_string_element_list (
                                      replaced_substrings, key, element);
          else
            {
              fprintf (stderr, "ERROR: translation substring not found: %s\n",
                       key);
              debug_print_element_sv (element_sv);
            }
        }
    }
  return replaced_substrings;
}

