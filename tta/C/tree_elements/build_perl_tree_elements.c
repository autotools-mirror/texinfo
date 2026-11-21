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

/* Not built, only used as an example for future codes */

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
#include "types_data.h"
#include "tree_types.h"
#include "document_types.h"
/* for associated_info_table find_associated_info_key
   add_to_element_list */
#include "tree.h"
/* for lookup_extra */
#include "extra.h"
/* for debugging */
#include "debug.h"
/* build_key_pair_info */
#include "build_perl_info.h"


/* return the handle if the element is registered by the call,
   not if it was already registered */
size_t
register_sv_element_handle_in_sv (ELEMENT *element, SV *element_sv,
                                  DOCUMENT *document)
{
  HV *element_hv;
  SV **element_document_descriptor_sv;
  SV **handle_sv;
  const char *document_key = "element_document_descriptor";
  const char *handle_key = "_handle";

  dTHX;

  element_hv = (HV *) SvRV (element_sv);

  element_document_descriptor_sv
    = hv_fetch (element_hv, document_key, strlen (document_key), 0);

  if (!element_document_descriptor_sv)
    {
      hv_store (element_hv, document_key, strlen (document_key),
                newSViv (document->descriptor), 0);
    }

  handle_sv = hv_fetch (element_hv, handle_key, strlen(handle_key), 0);
  if (!handle_sv)
    {
      add_to_element_list (&document->element_handles, element);
      hv_store (element_hv, handle_key, strlen(handle_key),
                newSViv (document->element_handles.number), 0);
      return document->element_handles.number;
    }
  return 0;
}

size_t
register_element_handle_in_sv (ELEMENT *element, DOCUMENT *document)
{
  size_t number;

  dTHX;

  build_new_base_element (element);

  number = register_sv_element_handle_in_sv (element, element->sv, document);

  return number;
}

/* In this function, elements handles only are registered, with
   register_element_handle_in_sv */
SV *
build_element_attribute (const ELEMENT *element, const char *attribute,
                         DOCUMENT *document)
{
  enum ai_key_name key;

  dTHX;

  key = find_associated_info_key (attribute);

  if (key)
    {
      enum extra_type k_type = associated_info_table[key].type;

      switch (k_type)
        {
        case extra_string:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            return newSVpv_utf8 (k->k.string, 0);
          break;
          }
        case extra_integer:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            return newSViv (k->k.integer);
          break;
          }
        case extra_flag:
          {
          if (element->flags & associated_info_table[key].data)
            return newSViv (1);
          break;
          }
        case extra_misc_args:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            {
              AV *av = build_string_list (k->k.strings_list, svt_char);
              return newRV_noinc ((SV *)av);
            }
          break;
          }
        case extra_index_entry:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            return build_extra_index_entry (k->k.index_entry);
          break;
          }
        case extra_element_oot:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            {
              ELEMENT *oot_element = k->k.element;
              register_element_handle_in_sv (oot_element, document);
              return newSVsv ((SV *)oot_element->sv);
            }
          break;
          }
        default:
          {
          const KEY_PAIR *k = lookup_extra (element, key);
          if (k)
            return build_key_pair_info (k, 0);
          break;
          }
        }
    }

  return 0;
}

