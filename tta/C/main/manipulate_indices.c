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
#include <stdio.h>
#include <stdint.h>
/* for locale_t */
#include <locale.h>
#include <ctype.h>
#include <unitypes.h>
#include "unictype.h"
#include "unistr.h"

#include "text.h"
#include "command_ids.h"
#include "element_types.h"
#include "tree_types.h"
#include "document_types.h"
#include "converter_types.h"
#include "base_utils.h"
#include "tree.h"
#include "extra.h"
#include "builtin_commands.h"
/* whitespace_chars ultimate_index indices_info_index_by_name
   to_upper_or_lower_multibyte */
#include "utils.h"
#include "translations.h"
#include "manipulate_tree.h"
#include "errors.h"
#include "debug.h"
#include "convert_to_text.h"
#include "convert_to_texinfo.h"
#include "call_perl_function.h"
#include "api_to_perl.h"
#include "unicode-collation/collation_key.h"
#include "unicode.h"
#include "manipulate_indices.h"

/* corresponding perl code in Texinfo::Indices */

MERGED_INDICES *
merge_indices (INDEX_LIST *indices_information)
{
  size_t merged_indices_space = 4;
  size_t merged_indices_number = 0;
  size_t i;
  const INDEX **sorted_index_names;

  if (!indices_information->number)
    return 0;

  MERGED_INDEX *merged_indices_list
    = (MERGED_INDEX *) malloc (sizeof (MERGED_INDEX) * merged_indices_space);

  MERGED_INDICES *merged_indices
    = (MERGED_INDICES *) malloc (sizeof (MERGED_INDICES));

  /* sort for reproducible error or debug messages if there are
     messages with translations */
  sorted_index_names = sort_index_names(indices_information);

  for (i = 0; i < indices_information->number; i++)
    {
      const INDEX *idx = sorted_index_names[i];
      if (idx->index_entries && idx->entries_number)
        {
          size_t j;
          const INDEX *ultimate_idx;
          char *in_idx_name;
          MERGED_INDEX *merged_idx = 0;

          if (idx->merged_in)
            ultimate_idx = ultimate_index_const (idx);
          else
            ultimate_idx = idx;

          in_idx_name = ultimate_idx->name;

          for (j = 0; j < merged_indices_number; j++)
            {
              if (!strcmp (merged_indices_list[j].name, in_idx_name))
                {
                  merged_idx = &merged_indices_list[j];
                  break;
                }
            }
          if (!merged_idx)
            /* main index (possibly idx) not already setup, do it */
            {
              if (merged_indices_number == merged_indices_space)
                {
                  merged_indices_space += 5;
                  merged_indices_list
                   = realloc (merged_indices_list, merged_indices_space
                                                * sizeof (MERGED_INDEX));
                }
              merged_idx = &merged_indices_list[merged_indices_number];
              merged_idx->name = in_idx_name;
              merged_idx->entries_number = ultimate_idx->entries_number;
              merged_idx->index_entries
                = malloc (sizeof (INDEX_ENTRY) * merged_idx->entries_number);
              memcpy (merged_idx->index_entries, ultimate_idx->index_entries,
                        ultimate_idx->entries_number * sizeof (INDEX_ENTRY));
              merged_indices_number++;
            }

          if (idx->merged_in)
            {
              merged_idx->index_entries = realloc (merged_idx->index_entries,
                       (idx->entries_number + merged_idx->entries_number) *
                         sizeof (INDEX_ENTRY));
              memcpy (merged_idx->index_entries + merged_idx->entries_number,
                      idx->index_entries,
                            idx->entries_number * sizeof (INDEX_ENTRY));
              merged_idx->entries_number += idx->entries_number;
            }
        }
    }
  /* set to the final size, including a trailing MERGED_INDEX filled with 0 */
  merged_indices_list = realloc (merged_indices_list,
                            (merged_indices_number +1) * sizeof (MERGED_INDEX));
  memset (&merged_indices_list[merged_indices_number], 0,
          sizeof (MERGED_INDEX));

  merged_indices->indices = merged_indices_list;
  merged_indices->number = merged_indices_number;

  free (sorted_index_names);

  return merged_indices;
}

void
destroy_merged_indices (MERGED_INDICES *merged_indices)
{
  size_t i;

  for (i = 0; i < merged_indices->number; i++)
    {
      free (merged_indices->indices[i].index_entries);
    }
  free (merged_indices->indices);
  free (merged_indices);
}



/* getting index content element */

static void
remove_def_types (ELEMENT *element)
{
  element->type = ET_NONE;

  if (element->e.c->contents.number
      && element->e.c->contents.list[0]->type == ET_bracketed_arg)
    element->e.c->contents.list[0]->type = ET_brace_arg;
}

static void
unexpected_def_name_class_message (enum command_id def_command)
{
  char *msg;
        /* set index_entry to a value to avoid a compiler warning
           on uninitialized value.  Incorrect for the code below, but
            we do not care as fatal is called. */
  xasprintf (&msg, "BUG: unexpected def command with name "
                   "and class: %s",
             builtin_command_name (def_command));
  fatal (msg);
  free (msg);
}

/* return index content element if there is no need for translation,
   otherwise return information for translation in DEF_COMMAND_OUT,
   NAME_COPY_OUT and CLASS_COPY_OUT.
 */
ELEMENT *
get_index_content_info_element (const ELEMENT *element,
                                int prefer_reference_element,
                                enum command_id *def_command_out,
                                ELEMENT **name_copy_out,
                                ELEMENT **class_copy_out)
{
  ELEMENT *name = 0;
  ELEMENT *class = 0;
  const char *def_cmdname = lookup_extra_string (element, AI_key_def_command);
  ELEMENT *def_l_e;

  /* Not strictly needed here, but could be helpful to debug */
  *name_copy_out = 0;
  *class_copy_out = 0;

  if (!def_cmdname)
    {
      ELEMENT *element_copy
        = copy_element_tree (element->e.c->contents.list[0], 0);
      return element_copy;
    }

  def_l_e = element->e.c->contents.list[0];
  if (def_l_e->e.c->contents.number > 0)
    {
      size_t ic;
      for (ic = 0; ic < def_l_e->e.c->contents.number; ic++)
        {
          ELEMENT *arg = def_l_e->e.c->contents.list[ic];
          if (arg->type == ET_def_name)
            name = arg;
          else if (arg->type == ET_def_class)
            class = arg;
          else if (arg->type == ET_def_arg
                   || arg->type == ET_def_typearg
                   || arg->type == ET_delimiter)
            break;
        }
    }

  if (name)
    {
      enum command_id def_command
        = lookup_builtin_command (def_cmdname);
      ELEMENT *name_copy = copy_element_tree (name, 0);
      remove_def_types (name_copy);
      if (!(command_data[def_command].flags & CF_def_class_method)
          && !(command_data[def_command].flags
                                       & CF_def_class_variable))
        {
          return name_copy;
        }
      else
        {
          ELEMENT *class_copy = copy_element_tree (class, 0);
          remove_def_types (class_copy);

          if (prefer_reference_element)
            {
              ELEMENT *text_element = new_text_element (ET_normal_text);
              /* container without type */
              ELEMENT *index_entry_normalized = new_element (ET_NONE);

              if (command_data[def_command].flags
                                             & CF_def_class_method)
                text_append (text_element->e.text, " on ");
              else if (command_data[def_command].flags
                                            & CF_def_class_variable)
                text_append (text_element->e.text, " of ");
           /* should not be possible, still considered for more robust code */
              else
                unexpected_def_name_class_message (def_command);

              add_to_contents_as_array (index_entry_normalized, name_copy);
              add_to_contents_as_array (index_entry_normalized, text_element);
              add_to_contents_as_array (index_entry_normalized, class_copy);
              return index_entry_normalized;
            }
          else
            {
              *name_copy_out = name_copy;
              *class_copy_out = class_copy;
              *def_command_out = def_command;
              return 0;
            }
        }
    }
  /*
  *name_copy_out = 0;
  *class_copy_out = 0;
   */
  *def_command_out = CM_NONE;
  return 0;
}

/* The DOCUMENT argument is only used for memory management, to gather
   small strings from translated strings trees.  Also it should not be
   useful, and could have been set to NULL, as this function is only called
   with the default translations, which do not include any @-command
   requiring small strings. It is better to keep it, though to avoid
   surprises, for instance if the translations used through this function
   could be customized.
 */
ELEMENT *
element_index_content_element (const ELEMENT *element,
                               int prefer_reference_element,
                               DOCUMENT *document, int debug_level)
{
  enum command_id def_command;
  ELEMENT *class_copy;
  ELEMENT *name_copy;
  NAMED_STRING_ELEMENT_LIST *substrings;
  const LANG_TRANSLATION *element_lang_translations;

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

  element_lang_translations
    = new_element_language_translation (&converters_translation_cache,
                                        element, TXI_CONVERT_STRINGS_NR);

  if (command_data[def_command].flags & CF_def_class_method)
    {
      index_element = gdt_tree ("{name} on {class}",
                document, element_lang_translations,
                substrings, 0, debug_level, 0);
    }
  else if (command_data[def_command].flags & CF_def_class_variable)
    {
      index_element = gdt_tree ("{name} of {class}",
                document, element_lang_translations,
                substrings, 0, debug_level, 0);
    }
  /* should not be possible, still considered for more robust code */
  else
    unexpected_def_name_class_message (def_command);

  destroy_named_string_element_list (substrings);

  /* prefer a type-less container rather than 'root_line' returned by gdt */
  index_element->type = ET_NONE;

  return index_element;
}

/* wrapper called as function reference, to have a common prototype */
static ELEMENT *
wrap_element_index_content_element (const ELEMENT *element,
                               int prefer_reference_element,
                               DOCUMENT *document, int debug_level,
                               CONVERTER *converter)
{
  return element_index_content_element (element, prefer_reference_element,
                                        document, debug_level);
}



/* indices entries sorting */

char *
strip_index_ignore_chars (const char *string, const char *index_ignore_chars)
{
  TEXT result_text;
  const char *p = string;
  text_init (&result_text);
  /* in particular to be consistent with convert_to_text, which returned
     variable is never NUL */
  text_append (&result_text, "");

  while (*p)
    {
      int n = strspn (p, index_ignore_chars);
      if (n)
        {
          p += n;
        }
      if (*p)
        {
          /* store a character */
          int char_len = 1;
          while ((p[char_len] & 0xC0) == 0x80)
            char_len++;
          text_append_n (&result_text, p, char_len);
          p += char_len;
        }
    }
  return result_text.text;
}

/* the index_content_element_fn function is passed to be
   able to use another function when called from converters and, at
   the same time, do not depend on the libtexinfo-converter library. */
char *
index_entry_element_sort_string (const INDEX_ENTRY *main_entry,
                                 const ELEMENT *index_entry_element,
                                 TEXT_OPTIONS *options, int in_code,
                                 int prefer_reference_element,
                                 DOCUMENT *document, int debug_level,
                                 CONVERTER *converter,
      ELEMENT * (* index_content_element_fn) (
                                   const ELEMENT *index_entry_element,
                                   int prefer_reference_element,
                                   DOCUMENT *document, int debug_level,
                                   CONVERTER *converter)
                                )
{
  char *sort_string;
  const char *index_ignore_chars;
  ELEMENT *entry_tree_element;

  if (!index_entry_element)
    {
      fatal ("index_entry_element_sort_string: NULL element");
    }

  if (index_content_element_fn == 0)
    index_content_element_fn
      = &wrap_element_index_content_element;

  char *sortas = lookup_extra_string (index_entry_element, AI_key_sortas);
  if (sortas)
    return strdup (sortas);

  entry_tree_element = (* index_content_element_fn) (index_entry_element,
                                          prefer_reference_element,
                                          document, debug_level,
                                          converter);

  if (in_code)
    options->code_state++;
  sort_string = convert_to_text (entry_tree_element, options);

  destroy_element_and_children (entry_tree_element);

  if (in_code)
    options->code_state--;

  index_ignore_chars = lookup_extra_string (main_entry->entry_element,
                                            AI_key_index_ignore_chars);
  if (index_ignore_chars)
    {
      char *sort_string_text = strip_index_ignore_chars (sort_string,
                                                     index_ignore_chars);
      free (sort_string);
      sort_string = sort_string_text;
    }

  return sort_string;
}

void
destroy_index_entries_sort_strings (INDICES_SORT_STRINGS *indices_sort_strings)
{
  if (indices_sort_strings && indices_sort_strings->number)
    {
      size_t i;
      for (i = 0; i < indices_sort_strings->number; i++)
        {
          INDEX_SORT_STRINGS *index_sort_strings
            = &indices_sort_strings->indices[i];
          if (index_sort_strings->entries_number > 0)
            {
              size_t j;
              for (j = 0; j < index_sort_strings->entries_number; j++)
                {
                  INDEX_ENTRY_SORT_STRING *entry_sort_string
                    = &index_sort_strings->sort_string_entries[j];
                  if (entry_sort_string->subentries_number > 0)
                    {
                      size_t k;
                      for (k = 0; k < entry_sort_string->subentries_number;
                           k++)
                        {
                          free (entry_sort_string->sort_string_subentries[k]
                                             .sort_string);
                        }
                      free (entry_sort_string->sort_string_subentries);
                    }
                }
            }
          free (index_sort_strings->sort_string_entries);
        }
      free (indices_sort_strings->indices);
    }
  free (indices_sort_strings);
}

/* the index_content_element_fn function is passed to be
   able to use another function when called from converters and at
   the same time, do not depend on the libtexinfo-converter library.

   There are two cases:
    * called from converter, the common case, both CONVERTER and
      INDEX_CONTENT_ELEMENT_FN are set, the function ignores
      DEBUG_LEVEL and DOCUMENT (which is NULL in that
      case).  In that case (for HTML), the translations may be
      user-defined.
    * called otherwise, from tests or SWIG.  CONVERTER and
      INDEX_ENTRY_ELEMENT_SORT_STRING_FN are not set, DOCUMENT is set,
      element_index_content_element is used, which uses DOCUMENT,
      although it is only to hold small strings from translations,
      and there should be none, the translations cannot be user-defined,
      DOCUMENT could also have been NULL.
 */
INDICES_SORT_STRINGS *
setup_index_entries_sort_strings (ERROR_MESSAGE_LIST *error_messages,
                    const MERGED_INDICES *merged_indices,
                    INDEX_LIST *indices_information,
                    int prefer_reference_element,
                    DOCUMENT *document, int debug_level,
                    CONVERTER *converter,
      ELEMENT * (* index_content_element_fn) (
                                 const ELEMENT *index_entry_element,
                                 int prefer_reference_element,
                                 DOCUMENT *document, int debug_level,
                                 CONVERTER *converter)
                    )
{
  size_t i;
  TEXT_OPTIONS *convert_text_options;
  CONST_ELEMENT_LIST subentries_list;

  if (merged_indices->number <= 0)
    return 0;

  memset (&subentries_list, 0, sizeof (CONST_ELEMENT_LIST));

  /* convert index entries to sort string using unicode when possible
     independently of input and output encodings */
  convert_text_options = new_text_options ();
  convert_text_options->encoding = strdup ("utf-8");

  INDICES_SORT_STRINGS *indices_sort_strings
    = (INDICES_SORT_STRINGS *) malloc (sizeof (INDICES_SORT_STRINGS));

  indices_sort_strings->number = merged_indices->number;
  indices_sort_strings->indices = (INDEX_SORT_STRINGS *)
    malloc (merged_indices->number * sizeof (INDEX_SORT_STRINGS));
  memset (indices_sort_strings->indices, 0,
          merged_indices->number * sizeof (INDEX_SORT_STRINGS));

  for (i = 0; i < merged_indices->number; i++)
    {
      MERGED_INDEX *index = &merged_indices->indices[i];
      INDEX_SORT_STRINGS *index_sort_strings
        = &indices_sort_strings->indices[i];
      if (index->entries_number > 0)
        {
          size_t j;
          /* keep track of number of non empty index entries number */
          size_t nr = 0;

          index_sort_strings->index = index;
          index_sort_strings->sort_string_entries = (INDEX_ENTRY_SORT_STRING *)
            malloc (index->entries_number * sizeof (INDEX_ENTRY_SORT_STRING));

          for (j = 0; j < index->entries_number; j++)
            {
              size_t l;
              int non_empty_index_subentries = 0;
              char *sort_string;
              INDEX_SUBENTRY_SORT_STRING *subentry_sort_string;
              INDEX_ENTRY *index_entry = &index->index_entries[j];
              INDEX_ENTRY_SORT_STRING entry_sort_string;

              ELEMENT *main_entry_element = index_entry->entry_element;

              INDEX *entry_index
                = indices_info_index_by_name (indices_information,
                                              index_entry->index_name);

              sort_string
                = index_entry_element_sort_string (index_entry,
                                     main_entry_element, convert_text_options,
                                     entry_index->in_code,
                                     prefer_reference_element, document,
                                     debug_level, converter,
                                     index_content_element_fn);

              entry_sort_string.entry = index_entry;
              entry_sort_string.subentries_number = 1;
              entry_sort_string.sort_string_subentries
                = (INDEX_SUBENTRY_SORT_STRING *)
                   malloc (sizeof (INDEX_SUBENTRY_SORT_STRING));

              subentry_sort_string
                = &entry_sort_string.sort_string_subentries[0];

              if (sort_string[strspn
                   (sort_string, whitespace_chars)] == '\0')
                {
                  const char *entry_cmdname;

                  subentry_sort_string->sort_string = strdup ("");
                  free (sort_string);

                  entry_cmdname = element_command_name (main_entry_element);
                  if (!entry_cmdname)
                    {
                      entry_cmdname = lookup_extra_string (main_entry_element,
                                                  AI_key_original_def_cmdname);
                    }

                  message_list_command_warn (error_messages, debug_level,
                                             main_entry_element, 0,
                                      "empty index key in @%s", entry_cmdname);
                }
              else
                {
                  subentry_sort_string->sort_string = sort_string;
                  non_empty_index_subentries++;
                }

              collect_subentries (main_entry_element, &subentries_list);
              for (l = 0; l < subentries_list.number; l++)
                {
                  const ELEMENT *subentry = subentries_list.list[l];
                  INDEX_SUBENTRY_SORT_STRING *subentry_sort_string;

                  entry_sort_string.subentries_number++;

                  entry_sort_string.sort_string_subentries
                   = (INDEX_SUBENTRY_SORT_STRING *)
                    realloc (entry_sort_string.sort_string_subentries,
                        sizeof (INDEX_SUBENTRY_SORT_STRING)
                           * entry_sort_string.subentries_number);
                  if (!entry_sort_string.sort_string_subentries)
                    fatal ("realloc failed");

                  subentry_sort_string
                   = &entry_sort_string.sort_string_subentries[
                          entry_sort_string.subentries_number -1];

                  sort_string
                    = index_entry_element_sort_string (index_entry,
                                     subentry, convert_text_options,
                                     entry_index->in_code, 0, document,
                                     debug_level, converter,
                                     index_content_element_fn);

                  if (sort_string[strspn
                     (sort_string, whitespace_chars)] == '\0')
                    {
                      const char *entry_cmdname;

                      subentry_sort_string->sort_string = strdup ("");
                      free (sort_string);

                      entry_cmdname = element_command_name (main_entry_element);
                      if (!entry_cmdname)
                        {
                          entry_cmdname
                             = lookup_extra_string (main_entry_element,
                                                 AI_key_original_def_cmdname);
                        }

                      message_list_command_warn (error_messages, debug_level,
                                             main_entry_element, 0,
                               "empty index sub entry %zu key in @%s",
                               entry_sort_string.subentries_number -1,
                                entry_cmdname);
                    }
                  else
                    {
                      subentry_sort_string->sort_string = sort_string;
                      non_empty_index_subentries++;
                    }
                }
              subentries_list.number = 0;
              if (non_empty_index_subentries > 0)
                {
                  size_t k;
                  nr++;

                  for (k = 0; k < entry_sort_string.subentries_number; k++)
                    {
                      ucs4_t next_char;
                      INDEX_SUBENTRY_SORT_STRING *subentry_sort_string
                        = &entry_sort_string.sort_string_subentries[k];
                      int new_len = u8_strmbtouc (&next_char,
                               (uint8_t *) subentry_sort_string->sort_string);
                      if (new_len > 0
                          && uc_is_property (next_char, UC_PROPERTY_ALPHABETIC))
                        subentry_sort_string->alpha = 1;
                      else
                        subentry_sort_string->alpha = 0;
                    }

                  memcpy (&index_sort_strings->sort_string_entries[nr-1],
                          &entry_sort_string,
                          sizeof (INDEX_ENTRY_SORT_STRING));
                }
              else
                {
                  size_t k;
                  for (k = 0; k < entry_sort_string.subentries_number; k++)
                    {
                      free (entry_sort_string.sort_string_subentries[k]
                              .sort_string);
                    }
                  free (entry_sort_string.sort_string_subentries);
                }
            }
          index_sort_strings->entries_number = nr;
        }
    }

  destroy_text_options (convert_text_options);

  free (subentries_list.list);

  return indices_sort_strings;
}

typedef struct INDEX_COLLATOR {
    enum collation_type_name type;
    union {
  #ifdef HAVE_NEWLOCALE
      locale_t locale;
  #endif
    } coll;
} INDEX_COLLATOR;

static BYTES_STRING *
get_sort_key (const INDEX_COLLATOR *collator, const char *sort_string)
{
  BYTES_STRING *sort_key;

  switch (collator->type)
    {
      case ctn_no_unicode:
        sort_key = (BYTES_STRING *) malloc (sizeof (BYTES_STRING));
        sort_key->len = strlen (sort_string);
        sort_key->bytes = (unsigned char *)
           malloc (sizeof (unsigned char) * sort_key->len);
        memcpy (sort_key->bytes, (unsigned char *) sort_string,
                sort_key->len);
        break;
      #ifdef HAVE_STRXFRM_L
      case ctn_locale_collation:
        {
          size_t check_len;
          char *char_sort_key;
          sort_key = (BYTES_STRING *) malloc (sizeof (BYTES_STRING));
          sort_key->len = strxfrm_l (0, sort_string, 0, collator->coll.locale);
          char_sort_key = (char *) malloc (sizeof (char) * sort_key->len);
          /* there is uninitialized memory without the next line.  Somewhat
             unclear why it is needed, strxfrm_l could have done it. */
          memset (char_sort_key, 0, sizeof (char) * sort_key->len);
          check_len = strxfrm_l (char_sort_key, sort_string, sort_key->len,
                                 collator->coll.locale);
          if (check_len != sort_key->len)
            fatal ("strxfrm_l returns a different length");
          sort_key->bytes = (unsigned char *)
                     malloc (sizeof (unsigned char) * sort_key->len);
          memcpy (sort_key->bytes, (unsigned char *) char_sort_key,
                  sort_key->len);
          free (char_sort_key);
        }
        break;
      #endif
  /* impossible to go here, collator->type is never set to ctn_language_collation
     Could do something here if there was native C linguistic tailoring.
      case ctn_language_collation:
        ......
   */
      case ctn_unicode:
      default:
        sort_key = (BYTES_STRING *) malloc (sizeof (BYTES_STRING));

        static Collation_choice collation;
        if (!collation)
          {
            collation = unicoll_default ();
            collation = unicoll_set_variable (collation,
                                              UNICOLL_VARIABLE_NONIGNORABLE);
          }

        sort_key->bytes = u8_make_collation_key (collation,
          sort_string, strlen (sort_string),
          NULL, &sort_key->len);

        break;
    }
  return sort_key;
}

static INDEX_COLLATOR *
setup_collator (int use_unicode_collation, const char *collation_language,
                const char *collation_locale,
                ERROR_MESSAGE_LIST *error_messages, OPTIONS *options)
{
  INDEX_COLLATOR *result = (INDEX_COLLATOR *) malloc (sizeof (INDEX_COLLATOR));
  memset (result, 0, sizeof (INDEX_COLLATOR));

  if (use_unicode_collation == 0)
    {
      result->type = ctn_no_unicode;
    }
  else
    {
      if (collation_language)
        {
 /* Could do something here if there was native C collation linguistic tailoring
          .....
          if (.....)
            result->type = ctn_language_collation;
  */
        }

      if (!result->type)
        {
          #ifdef HAVE_STRXFRM_L
          #ifdef HAVE_NEWLOCALE
          if (collation_locale)
            {
              result->coll.locale
                = newlocale (LC_COLLATE_MASK, collation_locale, 0);
              if (result->coll.locale)
                {
                  result->type = ctn_locale_collation;
                  return result;
                }
              else
                {
                  message_list_document_warn (error_messages, options, 0,
                             "collation locale not found: %s", collation_locale);
                }
            }
          #endif
          #endif

          result->type = ctn_unicode;
        }
    }
  return result;
}

/* Take textual index sort strings INDICES_SORT_STRINGS (by index)
   in input, setup and use a collator to produce sortable byte string
   sort keys that can be compared directly based on their value.
 */
static INDICES_SORTABLE_ENTRIES *
setup_sort_sortable_strings_collator (
                      const INDICES_SORT_STRINGS *indices_sort_strings,
                      ERROR_MESSAGE_LIST *error_messages,
                      OPTIONS *options,
                      int use_unicode_collation,
                      const char *collation_language,
                      const char *collation_locale,
                      INDEX_COLLATOR **collator)
{
  size_t i;
  INDICES_SORTABLE_ENTRIES *indices_sortable_entries;

  *collator = setup_collator (use_unicode_collation, collation_language,
                              collation_locale, error_messages, options);

  if (!indices_sort_strings || indices_sort_strings->number <= 0)
    return 0;

  indices_sortable_entries
    = (INDICES_SORTABLE_ENTRIES *) malloc (sizeof (INDICES_SORTABLE_ENTRIES));

  indices_sortable_entries->number = indices_sort_strings->number;
  indices_sortable_entries->indices = (INDEX_SORTABLE_ENTRIES *)
    malloc (indices_sort_strings->number * sizeof (INDEX_SORTABLE_ENTRIES));
  memset (indices_sortable_entries->indices, 0,
          indices_sort_strings->number * sizeof (INDEX_SORTABLE_ENTRIES));

  for (i = 0; i < indices_sort_strings->number; i++)
    {
      INDEX_SORT_STRINGS *index_sort_strings
         = &indices_sort_strings->indices[i];
      INDEX_SORTABLE_ENTRIES *sortable_index_entries
        = &indices_sortable_entries->indices[i];
      if (index_sort_strings->entries_number > 0)
        {
          size_t j;

          sortable_index_entries->index = index_sort_strings->index;
          sortable_index_entries->number = index_sort_strings->entries_number;
          sortable_index_entries->sortable_entries = (SORTABLE_INDEX_ENTRY *)
            malloc (index_sort_strings->entries_number
                    * sizeof (SORTABLE_INDEX_ENTRY));

          for (j = 0; j < index_sort_strings->entries_number; j++)
            {
              size_t k;
              INDEX_ENTRY_SORT_STRING *index_entry_sort_string
                = &index_sort_strings->sort_string_entries[j];

              SORTABLE_INDEX_ENTRY *sortable_entry
                = &sortable_index_entries->sortable_entries[j];

              sortable_entry->entry = index_entry_sort_string->entry;
              sortable_entry->subentries_number
                          = index_entry_sort_string->subentries_number;
              sortable_entry->sortable_subentries = (SORTABLE_INDEX_SUBENTRY *)
                malloc (index_entry_sort_string->subentries_number
                        * sizeof (SORTABLE_INDEX_SUBENTRY));

              for (k = 0; k < index_entry_sort_string->subentries_number; k++)
                {
                  SORTABLE_INDEX_SUBENTRY *sortable_subentry
                    = &sortable_entry->sortable_subentries[k];
                  INDEX_SUBENTRY_SORT_STRING *subenty_sort_string
                    = &index_entry_sort_string->sort_string_subentries[k];

                  sortable_subentry->sort_string
                    = strdup (subenty_sort_string->sort_string);
                  sortable_subentry->alpha = subenty_sort_string->alpha;
                  sortable_subentry->sort_key
                    = get_sort_key (*collator,
                                    subenty_sort_string->sort_string);
                }
            }
        }
    }

  return indices_sortable_entries;
}


/* for debugging purposes, printable representation of sort keys bytes */
/*
static
*/
char *
print_bytes (BYTES_STRING *bytes)
{
  size_t i;
  TEXT text;
  text_init (&text);
  text_append (&text, "");

  char *p = (char *)bytes->bytes;
  for (i = 0; i < bytes->len; i++)
    {
      char c = *p;
      if (((c & ~0x7f) == 0) && c != '\\' && isprint (c))
        text_append_n (&text, p, 1);
      else
        text_printf (&text, "\\%02X", c);
      p++;
    }
  return text.text;
}

typedef struct LETTER_SORTABLE_ENTRIES {
    char *letter;
    BYTES_STRING *letter_sort_key;
    size_t space;
    size_t number;
    SORTABLE_INDEX_ENTRY **sortable_entries;
} LETTER_SORTABLE_ENTRIES;

typedef struct INDEX_LETTERS_SORTABLE_ENTRIES {
    size_t letter_number;
    size_t space;
    LETTER_SORTABLE_ENTRIES *letter_entries;
} INDEX_LETTERS_SORTABLE_ENTRIES;

#define MIN_INT(a,b) (((a)<(b))?(a):(b))
static int
compare_byte_strings (BYTES_STRING *a, BYTES_STRING *b)
{
  size_t common_len = MIN_INT (a->len, b->len);
  int res = memcmp (a->bytes, b->bytes, common_len);
  if (res == 0)
    return (a->len > b->len) - (a->len < b->len);
  return res;
}

#undef MIN_INT

static int
compare_index_letter (const void *a, const void *b)
{
  const LETTER_SORTABLE_ENTRIES *lse_a = (const LETTER_SORTABLE_ENTRIES *) a;
  const LETTER_SORTABLE_ENTRIES *lse_b = (const LETTER_SORTABLE_ENTRIES *) b;

  return compare_byte_strings (lse_a->letter_sort_key, lse_b->letter_sort_key);
}

static int
compare_sortable_subentry_keys (const void *a, const void *b)
{
  const SORTABLE_INDEX_SUBENTRY *sis_a = (const SORTABLE_INDEX_SUBENTRY *) a;
  const SORTABLE_INDEX_SUBENTRY *sis_b = (const SORTABLE_INDEX_SUBENTRY *) b;

  if (sis_a->alpha == sis_b->alpha)
    return compare_byte_strings (sis_a->sort_key, sis_b->sort_key);

  return (sis_a->alpha > sis_b->alpha) - (sis_a->alpha < sis_b->alpha);
}

static int
compare_sortable_index_entry (const SORTABLE_INDEX_ENTRY *sie_a,
                              const SORTABLE_INDEX_ENTRY *sie_b)
{
  size_t i;
  int res;

  /* corresponds to the main entry and subentries */
  for (i = 0; i < sie_a->subentries_number; i++)
    {
      SORTABLE_INDEX_SUBENTRY *sub_key_a = &sie_a->sortable_subentries[i];
      SORTABLE_INDEX_SUBENTRY *sub_key_b = &sie_b->sortable_subentries[i];

      res = compare_sortable_subentry_keys (sub_key_a, sub_key_b);

      if (res != 0)
        return res;

      if (i + 1 >= sie_b->subentries_number)
        break;
    }
  res = (sie_a->subentries_number > sie_b->subentries_number)
           - (sie_a->subentries_number < sie_b->subentries_number);

  if (res != 0)
    return res;

  res = (sie_a->entry->number > sie_b->entry->number)
           - (sie_a->entry->number < sie_b->entry->number);

  if (res != 0)
    return res;

  /* This may happen if 2 indices are merged as the number is per
     index name. */

  return strcmp (sie_a->entry->index_name, sie_b->entry->index_name);
}

static int
compare_sortable_index_entry_refs (const void *a, const void *b)
{
  const SORTABLE_INDEX_ENTRY **psie_a = (const SORTABLE_INDEX_ENTRY **) a;
  const SORTABLE_INDEX_ENTRY **psie_b = (const SORTABLE_INDEX_ENTRY **) b;

  return compare_sortable_index_entry (*psie_a, *psie_b);
}

static int
compare_sortable_index_entry_wrapper (const void *a, const void *b)
{
  const SORTABLE_INDEX_ENTRY *sie_a = (const SORTABLE_INDEX_ENTRY *) a;
  const SORTABLE_INDEX_ENTRY *sie_b = (const SORTABLE_INDEX_ENTRY *) b;

  return compare_sortable_index_entry (sie_a, sie_b);
}

/* the entry is not destroyed here as it is transferred to the sorted indices */
static void
destroy_indices_sortable_entries (
             INDICES_SORTABLE_ENTRIES *indices_sortable_entries)
{
  if (indices_sortable_entries)
    {
      size_t i;
      for (i = 0; i < indices_sortable_entries->number; i++)
        {
          INDEX_SORTABLE_ENTRIES *sortable_index_entries
            = &indices_sortable_entries->indices[i];
          if (sortable_index_entries->number > 0)
            {
              size_t j;

              for (j = 0; j < sortable_index_entries->number; j++)
                {
                  size_t k;
                  SORTABLE_INDEX_ENTRY *sortable_entry
                    = &sortable_index_entries->sortable_entries[j];

                  for (k = 0; k < sortable_entry->subentries_number;
                       k++)
                    {
                      SORTABLE_INDEX_SUBENTRY *sortable_subentry
                        = &sortable_entry->sortable_subentries[k];
                      free (sortable_subentry->sort_key->bytes);
                      free (sortable_subentry->sort_key);
                      free (sortable_subentry->sort_string);
                    }
                  free (sortable_entry->sortable_subentries);
                }
              free (sortable_index_entries->sortable_entries);
            }
        }
      free (indices_sortable_entries->indices);
      free (indices_sortable_entries);
    }
}

static void
destroy_collator (INDEX_COLLATOR *collator)
{
  if (collator->type == ctn_locale_collation)
    {
  #ifdef HAVE_NEWLOCALE
      freelocale (collator->coll.locale);
  #endif
    }
  free (collator);
}

INDEX_SORTED_BY_INDEX *
sort_indices_by_index (const INDICES_SORT_STRINGS *indices_sort_strings,
                       ERROR_MESSAGE_LIST *error_messages,
                       OPTIONS *options,
                       int use_unicode_collation,
                       const char *collation_language,
                       const char *collation_locale)
{
  size_t i;
  size_t index_nr = 0;
  INDEX_COLLATOR *collator;

  INDICES_SORTABLE_ENTRIES *indices_sortable_entries
    = setup_sort_sortable_strings_collator (indices_sort_strings,
                                            error_messages, options,
                                    use_unicode_collation, collation_language,
                                    collation_locale, &collator);

  if (!indices_sortable_entries || indices_sortable_entries->number <= 0)
    {
      destroy_indices_sortable_entries (indices_sortable_entries);
      destroy_collator (collator);
      return 0;
    }

  INDEX_SORTED_BY_INDEX *sorted_index_entries
   = (INDEX_SORTED_BY_INDEX *) malloc
    ((indices_sortable_entries->number +1) * sizeof (INDEX_SORTED_BY_INDEX));

  for (i = 0; i < indices_sortable_entries->number; i++)
    {
      size_t k;
      INDEX_SORTABLE_ENTRIES *sortable_index_entries
        = &indices_sortable_entries->indices[i];
      INDEX_SORTED_BY_INDEX *index_sorted;

      if (sortable_index_entries->number <= 0)
        continue;

      index_sorted = &sorted_index_entries[index_nr];
      index_sorted->name = strdup (sortable_index_entries->index->name);
      index_sorted->entries_number = sortable_index_entries->number;

      /* directly sort the sortable entries */
      qsort (sortable_index_entries->sortable_entries,
             index_sorted->entries_number,
             sizeof (SORTABLE_INDEX_ENTRY),
             compare_sortable_index_entry_wrapper);

      index_sorted->entries = (INDEX_ENTRY **) malloc
         (sizeof (INDEX_ENTRY *) * index_sorted->entries_number);

      /* set index entries in the sorted order */
      for (k = 0; k < index_sorted->entries_number; k++)
        {
          index_sorted->entries[k]
            = sortable_index_entries->sortable_entries[k].entry;
        }

      index_nr++;
    }

  /* add a 0 at the end of the list */
  memset (&sorted_index_entries[index_nr], 0, sizeof (INDEX_SORTED_BY_INDEX));
  /* shrink the list if there are less sorted indices than sortable indices */
  if (index_nr < indices_sortable_entries->number)
    sorted_index_entries = realloc (sorted_index_entries,
                     (index_nr+1) * sizeof (INDEX_SORTED_BY_INDEX));

  destroy_collator (collator);
  destroy_indices_sortable_entries (indices_sortable_entries);

  return sorted_index_entries;
}

INDEX_SORTED_BY_LETTER *
sort_indices_by_letter (const INDICES_SORT_STRINGS *indices_sort_strings,
                        ERROR_MESSAGE_LIST *error_messages,
                        OPTIONS *options,
                        int use_unicode_collation,
                        const char *collation_language,
                        const char *collation_locale)
{
  size_t i;
  size_t index_nr = 0;
  static INDEX_LETTERS_SORTABLE_ENTRIES index_letters_sortable_entries;
  INDEX_COLLATOR *collator;

  INDICES_SORTABLE_ENTRIES *indices_sortable_entries
    = setup_sort_sortable_strings_collator (indices_sort_strings,
                                            error_messages, options,
                                    use_unicode_collation, collation_language,
                                    collation_locale, &collator);

  if (!indices_sortable_entries || indices_sortable_entries->number <= 0)
    {
      destroy_indices_sortable_entries (indices_sortable_entries);
      destroy_collator (collator);
      return 0;
    }

  INDEX_SORTED_BY_LETTER *sorted_index_entries
   = (INDEX_SORTED_BY_LETTER *) malloc
    ((indices_sortable_entries->number +1) * sizeof (INDEX_SORTED_BY_LETTER));

  for (i = 0; i < indices_sortable_entries->number; i++)
    {
      size_t j;
      INDEX_SORTABLE_ENTRIES *sortable_index_entries
        = &indices_sortable_entries->indices[i];
      INDEX_SORTED_BY_LETTER *index_sorted;

      if (sortable_index_entries->number <= 0)
        continue;

      index_sorted = &sorted_index_entries[index_nr];
      index_sorted->name = strdup (sortable_index_entries->index->name);

      for (j = 0; j < sortable_index_entries->number; j++)
        {
          int len = 0;
          SORTABLE_INDEX_ENTRY *sortable_entry
            = &sortable_index_entries->sortable_entries[j];
          char *sort_string
            = sortable_entry->sortable_subentries[0].sort_string;
          uint8_t *encoded_u8 = utf8_from_string (sort_string);
          uint8_t *current_u8 = encoded_u8;
          char *letter_string;
          char *upper_letter_string;
          char *norm_letter_string;
          TEXT letter_text;
          BYTES_STRING *letter_sort_key;
          int letter_added = 0;

          LETTER_SORTABLE_ENTRIES *letter_sortable_entries = 0;

          while (1)
            {
              ucs4_t next_char;
              int new_len = u8_strmbtouc (&next_char, current_u8);
              if (!new_len)
                break;

              len += new_len;
              /* UC_NON_SPACING_MARK is the same as UC_CATEGORY_Mn */
              if (uc_is_general_category (next_char, UC_NON_SPACING_MARK))
                {
                  current_u8 += new_len;
                }
              else
                {
                  break;
                }
            }
          free (encoded_u8);

          letter_string = strndup (sort_string, len);
          upper_letter_string = to_upper_or_lower_multibyte (letter_string, 1);
          free (letter_string);
          norm_letter_string = normalize_NFKD (upper_letter_string);
          free (upper_letter_string);
          encoded_u8 = utf8_from_string (norm_letter_string);
          free (norm_letter_string);
          current_u8 = encoded_u8;

          text_init (&letter_text);
          /* we want an empty string if the input string is empty */
          text_append (&letter_text, "");

          while (1)
            {
              ucs4_t next_char;
              int new_len = u8_strmbtouc (&next_char, current_u8);
              if (!new_len)
                break;

              if (!uc_is_general_category (next_char, UC_NON_SPACING_MARK))
                {
                  char *first_char_text;
                  uint8_t first_char_u8[7];
                  int first_char_len = u8_uctomb (first_char_u8, next_char, 6);
                  if (first_char_len < 0)
                    fatal ("u8_uctomb returns negative value");
                  first_char_u8[first_char_len] = 0;
                  first_char_text = string_from_utf8 (first_char_u8);
                  text_append (&letter_text, first_char_text);
                  free (first_char_text);
                }
              current_u8 += new_len;
            }
          free (encoded_u8);

          letter_sort_key = get_sort_key (collator, letter_text.text);

          if (index_letters_sortable_entries.letter_number > 0)
            {
              /* used to find an existing letter */
              static LETTER_SORTABLE_ENTRIES compared_letter_sortable;

              compared_letter_sortable.letter_sort_key = letter_sort_key;

              letter_sortable_entries = (LETTER_SORTABLE_ENTRIES *)
                bsearch (&compared_letter_sortable,
                     index_letters_sortable_entries.letter_entries,
                     index_letters_sortable_entries.letter_number,
                     sizeof (LETTER_SORTABLE_ENTRIES),
                     compare_index_letter);
            }

          if (!letter_sortable_entries)
            {
              if (index_letters_sortable_entries.letter_number
                   >= index_letters_sortable_entries.space)
                {
                  index_letters_sortable_entries.letter_entries
                    = realloc (index_letters_sortable_entries.letter_entries,
                          (index_letters_sortable_entries.space += 5)
                            * sizeof (LETTER_SORTABLE_ENTRIES));
                  if (!index_letters_sortable_entries.letter_entries)
                    fatal ("realloc failed");
                }
              letter_sortable_entries
                = &index_letters_sortable_entries.letter_entries[
                              index_letters_sortable_entries.letter_number];

              letter_sortable_entries->space = 0;
              letter_sortable_entries->number = 0;
              letter_sortable_entries->sortable_entries = 0;
              letter_sortable_entries->letter = letter_text.text;
              letter_sortable_entries->letter_sort_key = letter_sort_key;

              index_letters_sortable_entries.letter_number++;

              letter_added = 1;
            }
          else
            {
              free (letter_text.text);
              free (letter_sort_key->bytes);
              free (letter_sort_key);
            }

          /* now add the sortable entry to the letter sortable entries */
          if (letter_sortable_entries->number
                  >= letter_sortable_entries->space)
            {
              letter_sortable_entries->sortable_entries
               = realloc (letter_sortable_entries->sortable_entries,
                   (letter_sortable_entries->space += 5)
                            * sizeof (SORTABLE_INDEX_ENTRY));
                  if (!letter_sortable_entries->sortable_entries)
                    fatal ("realloc failed");
            }
          letter_sortable_entries->sortable_entries[
                        letter_sortable_entries->number] = sortable_entry;

          letter_sortable_entries->number++;
          /* sort after using letter_sortable_entries, as its address may be
             changed by the sort */
          if (index_letters_sortable_entries.letter_number > 1
              && letter_added)
            {
              /* re-sort letters with the new letter added */
              if (index_letters_sortable_entries.letter_number > 1)
                qsort (index_letters_sortable_entries.letter_entries,
                       index_letters_sortable_entries.letter_number,
                       sizeof (LETTER_SORTABLE_ENTRIES),
                       compare_index_letter);
            }
        }

      /* sort the index entries by letter */
      /* also reset for the next index */

      if (index_letters_sortable_entries.letter_number > 0)
        {
          index_sorted->letter_number
            = index_letters_sortable_entries.letter_number;
          index_sorted->letter_entries = (LETTER_INDEX_ENTRIES *) malloc
            (index_sorted->letter_number * sizeof (LETTER_INDEX_ENTRIES));

          for (j = 0; j < index_letters_sortable_entries.letter_number; j++)
            {
              size_t k;
              LETTER_SORTABLE_ENTRIES *letter_sortable_entries
               = &index_letters_sortable_entries.letter_entries[j];
              LETTER_INDEX_ENTRIES *letter_index_entries
               = &index_sorted->letter_entries[j];

              qsort (letter_sortable_entries->sortable_entries,
                   letter_sortable_entries->number,
                   sizeof (SORTABLE_INDEX_ENTRY *),
                   compare_sortable_index_entry_refs);

              letter_index_entries->letter = letter_sortable_entries->letter;
              letter_index_entries->entries = (INDEX_ENTRY **) malloc
                (letter_sortable_entries->number * sizeof (INDEX_ENTRY *));
              letter_index_entries->entries_number
                   = letter_sortable_entries->number;

              /* set index entries in the sorted order */
              for (k = 0; k < letter_sortable_entries->number; k++)
                {
                  letter_index_entries->entries[k]
                    = letter_sortable_entries->sortable_entries[k]->entry;
                }

              free (letter_sortable_entries->letter_sort_key->bytes);
              free (letter_sortable_entries->letter_sort_key);
              free (letter_sortable_entries->sortable_entries);
            }
          index_letters_sortable_entries.letter_number = 0;
        }
      index_nr++;
    }

  /* add a 0 at the end of the list */
  memset (&sorted_index_entries[index_nr], 0, sizeof (INDEX_SORTED_BY_LETTER));
  /* shrink the list if there are less sorted indices than sortable indices */
  if (index_nr < indices_sortable_entries->number)
    sorted_index_entries = realloc (sorted_index_entries,
                     (index_nr+1) * sizeof (INDEX_SORTED_BY_LETTER));

  destroy_collator (collator);
  destroy_indices_sortable_entries (indices_sortable_entries);

  return sorted_index_entries;
}

static COLLATION_INDICES_SORTED_BY_INDEX *
new_collation_sorted_indices_by_index (
            COLLATIONS_INDICES_SORTED_BY_INDEX *collations,
            enum collation_type_name type,
            const char *language)
{
  COLLATION_INDICES_SORTED_BY_INDEX *result = 0;
  if (collations->number <= collations->space)
    {
      collations->collation_sorted_indices
        = (COLLATION_INDICES_SORTED_BY_INDEX *) realloc
           (collations->collation_sorted_indices,
             (collations->space += 3)
                * sizeof (COLLATION_INDICES_SORTED_BY_INDEX));
      if (!collations->collation_sorted_indices)
        fatal ("realloc failed");
    }

  result = &collations->collation_sorted_indices[collations->number];
  memset (result, 0, sizeof (COLLATION_INDICES_SORTED_BY_INDEX));
  result->type = type;
  result->language = strdup (language);

  collations->number++;

  return result;
}

COLLATIONS_INDICES_SORTED_BY_INDEX *
new_base_collations_sorted_indices_by_index (void)
{
  COLLATIONS_INDICES_SORTED_BY_INDEX *collations
       = (COLLATIONS_INDICES_SORTED_BY_INDEX *)
           malloc (sizeof (COLLATIONS_INDICES_SORTED_BY_INDEX));
  memset (collations, 0,
              sizeof (COLLATIONS_INDICES_SORTED_BY_INDEX));

  /* order is important, to match enum */
  new_collation_sorted_indices_by_index (collations, ctn_unicode, "-");
  new_collation_sorted_indices_by_index (collations, ctn_no_unicode, "");

  return collations;
}

static COLLATION_INDICES_SORTED_BY_INDEX *
find_collation_sorted_indices_by_index (
            COLLATIONS_INDICES_SORTED_BY_INDEX *collations,
            enum collation_type_name type,
            const char *language)
{
  size_t i;
  for (i = 2; i < collations->number; i++)
    {
      COLLATION_INDICES_SORTED_BY_INDEX *collation_sorted_indices
        = &collations->collation_sorted_indices[i];
      if (collation_sorted_indices->type == type
          && !strcmp (collation_sorted_indices->language, language))
        return collation_sorted_indices;
    }
  return 0;
}

COLLATION_INDICES_SORTED_BY_INDEX *
get_collation_sorted_indices_by_index (
                              COLLATIONS_INDICES_SORTED_BY_INDEX *collations,
                                       int use_unicode_collation,
                                       const char *input_lang_sorting_locale,
                                       const char *collation_locale,
                                       const char **lang_sorting_locale_out)
{
  const char *lang_sorting_locale = 0;
  COLLATION_INDICES_SORTED_BY_INDEX *collation_sorted_indices = 0;

  if (use_unicode_collation == 0)
    collation_sorted_indices
      = &collations->collation_sorted_indices[ctn_no_unicode];
  /* use ctn_unicode collation for input_lang_sorting_locale until there is a
     native C possibility for collation linguistic tailoring */
  else if (/* !input_lang_sorting_locale && */ !collation_locale)
    collation_sorted_indices
      = &collations->collation_sorted_indices[ctn_unicode];
  else
    {
      enum collation_type_name type;

    /*
      if (input_lang_sorting_locale)
        {
          type = ctn_language_collation;
          lang_sorting_locale = input_lang_sorting_locale;
        }
      else
     */
        {
          type = ctn_locale_collation;
          lang_sorting_locale = collation_locale;
        }

      collation_sorted_indices
        = find_collation_sorted_indices_by_index (collations, type,
                                                 lang_sorting_locale);
      if (!collation_sorted_indices)
        collation_sorted_indices
          = new_collation_sorted_indices_by_index (collations,
                                                   type, lang_sorting_locale);
    }

  *lang_sorting_locale_out = lang_sorting_locale;
  return collation_sorted_indices;
}

static COLLATION_INDICES_SORTED_BY_LETTER *
new_collation_sorted_indices_by_letter (
            COLLATIONS_INDICES_SORTED_BY_LETTER *collations,
            enum collation_type_name type,
            const char *language)
{
  COLLATION_INDICES_SORTED_BY_LETTER *result = 0;
  if (collations->number <= collations->space)
    {
      collations->collation_sorted_indices
        = (COLLATION_INDICES_SORTED_BY_LETTER *) realloc
           (collations->collation_sorted_indices,
             (collations->space += 3)
                * sizeof (COLLATION_INDICES_SORTED_BY_LETTER));
      if (!collations->collation_sorted_indices)
        fatal ("realloc failed");
    }

  result = &collations->collation_sorted_indices[collations->number];
  memset (result, 0, sizeof (COLLATION_INDICES_SORTED_BY_LETTER));
  result->type = type;
  result->language = strdup (language);

  collations->number++;

  return result;
}

static COLLATION_INDICES_SORTED_BY_LETTER *
find_collation_sorted_indices_by_letter (
            COLLATIONS_INDICES_SORTED_BY_LETTER *collations,
            enum collation_type_name type,
            const char *language)
{
  size_t i;
  for (i = 2; i < collations->number; i++)
    {
      COLLATION_INDICES_SORTED_BY_LETTER *collation_sorted_indices
        = &collations->collation_sorted_indices[i];
      if (collation_sorted_indices->type == type
          && !strcmp (collation_sorted_indices->language, language))
        return collation_sorted_indices;
    }
  return 0;
}

COLLATIONS_INDICES_SORTED_BY_LETTER *
new_base_collations_sorted_indices_by_letter (void)
{
  COLLATIONS_INDICES_SORTED_BY_LETTER *collations
      = (COLLATIONS_INDICES_SORTED_BY_LETTER *)
           malloc (sizeof (COLLATIONS_INDICES_SORTED_BY_LETTER));
  memset (collations, 0,
              sizeof (COLLATIONS_INDICES_SORTED_BY_LETTER));

    /* order is important, to match enum */
  new_collation_sorted_indices_by_letter (collations, ctn_unicode, "-");
  new_collation_sorted_indices_by_letter (collations, ctn_no_unicode, "");

  return collations;
}

COLLATION_INDICES_SORTED_BY_LETTER *
get_collation_sorted_indices_by_letter (
                          COLLATIONS_INDICES_SORTED_BY_LETTER *collations,
                                       int use_unicode_collation,
                                       const char *input_lang_sorting_locale,
                                       const char *collation_locale,
                                       const char **lang_sorting_locale_out)
{
  const char *lang_sorting_locale = 0;
  COLLATION_INDICES_SORTED_BY_LETTER *collation_sorted_indices = 0;

  if (use_unicode_collation == 0)
    collation_sorted_indices
      = &collations->collation_sorted_indices[ctn_no_unicode];
  /* use ctn_unicode collation for input_lang_sorting_locale until there is a
     native C possibility for collation linguistic tailoring */
  else if (/* !input_lang_sorting_locale && */ !collation_locale)
    collation_sorted_indices
      = &collations->collation_sorted_indices[ctn_unicode];
  else
    {
      enum collation_type_name type;

    /*
      if (input_lang_sorting_locale)
        {
          type = ctn_language_collation;
          lang_sorting_locale = input_lang_sorting_locale;
        }
      else
     */
        {
          type = ctn_locale_collation;
          lang_sorting_locale = collation_locale;
        }

      collation_sorted_indices
        = find_collation_sorted_indices_by_letter (collations, type,
                                                   lang_sorting_locale);
      if (!collation_sorted_indices)
        collation_sorted_indices
          = new_collation_sorted_indices_by_letter (collations,
                                                    type, lang_sorting_locale);
    }

  *lang_sorting_locale_out = lang_sorting_locale;
  return collation_sorted_indices;
}

static void
destroy_indices_sorted_by_index (
         INDEX_SORTED_BY_INDEX *indices_entries_by_index)
{
  INDEX_SORTED_BY_INDEX *index;

  for (index = indices_entries_by_index; index->name; index++)
    {
      free (index->name);
      free (index->entries);
    }
  free (indices_entries_by_index);
}

void
destroy_sorted_indices_by_index (COLLATIONS_INDICES_SORTED_BY_INDEX *collations)
{
  if (collations)
    {
      if (collations->number > 0)
        {
          size_t i;
          for (i = 0; i < collations->number; i++)
            {
              COLLATION_INDICES_SORTED_BY_INDEX *collation_sorted_indices
                = &collations->collation_sorted_indices[i];
              free (collation_sorted_indices->language);
              if (collation_sorted_indices->sorted_indices)
                destroy_indices_sorted_by_index (
                                collation_sorted_indices->sorted_indices);
            }
        }
      free (collations->collation_sorted_indices);
      free (collations);
    }
}

static void
destroy_indices_sorted_by_letter (
         INDEX_SORTED_BY_LETTER *indices_entries_by_letter)
{
  INDEX_SORTED_BY_LETTER *index;

  for (index = indices_entries_by_letter; index->name; index++)
    {
      size_t i;
      free (index->name);
      for (i = 0; i < index->letter_number; i++)
        {
          LETTER_INDEX_ENTRIES *letter_entries = &index->letter_entries[i];
          free (letter_entries->letter);
          free (letter_entries->entries);
        }
      free (index->letter_entries);
    }
  free (indices_entries_by_letter);
}

void
destroy_sorted_indices_by_letter (COLLATIONS_INDICES_SORTED_BY_LETTER *collations)
{
  if (collations)
    {
      if (collations->number > 0)
        {
          size_t i;
          for (i = 0; i < collations->number; i++)
            {
              COLLATION_INDICES_SORTED_BY_LETTER *collation_sorted_indices
                 = &collations->collation_sorted_indices[i];
              free (collation_sorted_indices->language);
              if (collation_sorted_indices->sorted_indices)
                destroy_indices_sorted_by_letter (
                                collation_sorted_indices->sorted_indices);
            }
        }
      free (collations->collation_sorted_indices);
      free (collations);
    }
}



/* sorting and information on indices, but not on index entries */

static int
compare_index_name (const void *a, const void *b)
{
  const INDEX **idx_a = (const INDEX **) a;
  const INDEX **idx_b = (const INDEX **) b;

  return strcmp ((*idx_a)->name, (*idx_b)->name);
}

/* to be freed by caller */
const INDEX **
sort_index_names (INDEX_LIST *indices_info)
{
  const INDEX **sorted_index_names;
  size_t index_nr = indices_info->number;

  sorted_index_names = (const INDEX **) malloc (index_nr * sizeof (INDEX *));

  memcpy (sorted_index_names, indices_info->list, index_nr * sizeof (INDEX *));

  qsort (sorted_index_names, index_nr, sizeof (INDEX *), compare_index_name);

  return sorted_index_names;
}

/* return value to be freed by caller */
char *
print_indices_information (INDEX_LIST *indices_info)
{
  size_t i;
  const INDEX **sorted_index_names;
  TEXT result;

  if (!indices_info || indices_info->number == 0)
    return 0;

  text_init (&result);
  text_append (&result, "");

  sorted_index_names = sort_index_names(indices_info);

  for (i = 0; i < indices_info->number; i++)
    {
      const INDEX *idx = sorted_index_names[i];
      text_append (&result, idx->name);
      if (idx->in_code)
        text_append_n (&result, " C", 2);
      if (idx->merged_in)
        text_printf (&result, " ->%s", idx->merged_in->name);
      text_append_n (&result, "\n", 1);
    }

  free (sorted_index_names);

  return result.text;
}

/* structures and functions used to find sort strings based on the
   sorted index index entry, using the original index name and
   index entry position in the original index
 */
typedef struct INDEX_ENTRIES_SORT_STRINGS {
  const char *index_name;
  const INDEX_ENTRY_SORT_STRING **sort_strings;
} INDEX_ENTRIES_SORT_STRINGS;

typedef struct INDICES_ENTRIES_SORT_STRINGS {
  size_t space;
  size_t number;
  INDEX_ENTRIES_SORT_STRINGS *list;
} INDICES_ENTRIES_SORT_STRINGS;

/* if the INDEX_NAME is not already in MAP_IDX_SORT_STR, allocate a new
   slot, find INDEX_NAME in INDICES_INFO and allocate in the new slot
   an array with length the number of entries for INDEX_NAME found
   in INDICES_INFO */
static size_t
find_indices_entries_sort_strings_index (const INDEX_LIST *indices_info,
                         INDICES_ENTRIES_SORT_STRINGS *map_idx_sort_str,
                                   const char *index_name)
{
  size_t i;
  size_t result_index;
  INDEX_ENTRIES_SORT_STRINGS *idx_sort_str;
  INDEX *index_info = 0;

  for (i = 0; i < map_idx_sort_str->number; i++)
    {
      if (!strcmp (map_idx_sort_str->list[i].index_name, index_name))
        return i;
    }

  if (map_idx_sort_str->number >= map_idx_sort_str->space)
    {
      map_idx_sort_str->list = realloc (map_idx_sort_str->list,
                    (map_idx_sort_str->space += 1)
                           * sizeof (INDEX_ENTRIES_SORT_STRINGS));
      if (!map_idx_sort_str->list)
        fatal ("realloc failed");
    }

  result_index = map_idx_sort_str->number;
  idx_sort_str = &map_idx_sort_str->list[result_index];

  for (i = 0; i < indices_info->number; i++)
    {
      if (indices_info->list[i]->name == index_name)
        {
          index_info = indices_info->list[i];
          break;
        }
    }

  if (!index_info)
    {
      char *msg;
      xasprintf (&msg, "sort strings index not found: %s\n", index_name);
      fatal (msg);
      free (msg);
    }

  /* use this name as it is supposed to be long living (another one would
     have been ok, too) */
  idx_sort_str->index_name = index_info->name;

  idx_sort_str->sort_strings = (const INDEX_ENTRY_SORT_STRING **)
   malloc (index_info->entries_number
           * sizeof (const INDEX_ENTRY_SORT_STRING *));
  memset (idx_sort_str->sort_strings, 0, index_info->entries_number
                * sizeof (const INDEX_ENTRY_SORT_STRING *));

  map_idx_sort_str->number++;

  return result_index;
}

char *
print_indices_sort_strings (
      const INDEX_SORTED_BY_INDEX *sorted_index_entries,
      const INDICES_SORT_STRINGS *indices_sort_strings,
      const DOCUMENT *document)
{
  TEXT result;
  size_t i;
  /* associate index name to position of index in indices_sort_strings,
     sorted by index name through a function call */
  NAME_NUMBER_LIST indices_sort_strings_n_nr;
  /* associate index name to position of index in sorted_index_entries,
     sorted by index name because it is based on indices_sort_strings_n_nr */
  NAME_NUMBER_LIST sorted_index_entries_n_nr;
  INDICES_ENTRIES_SORT_STRINGS indices_entries_sort_string;

  if (!indices_sort_strings)
    return 0;

  memset (&indices_entries_sort_string,
          0, sizeof (INDICES_ENTRIES_SORT_STRINGS));


  /* 1. setup indices_sort_strings_n_nr */

  memset (&indices_sort_strings_n_nr, 0, sizeof (NAME_NUMBER_LIST));

  allocate_name_number_list (&indices_sort_strings_n_nr,
                             indices_sort_strings->number);

  for (i = 0; i < indices_sort_strings->number; i++)
    {
      NAME_NUMBER *index_name_number = &indices_sort_strings_n_nr.list[i];
      index_name_number->name = indices_sort_strings->indices[i].index->name;
      index_name_number->number = i;
    }

  sort_name_number_list (&indices_sort_strings_n_nr);


  /* 2. setup sorted_index_entries_n_nr */

  memset (&sorted_index_entries_n_nr, 0, sizeof (NAME_NUMBER_LIST));

  allocate_name_number_list (&sorted_index_entries_n_nr,
                             indices_sort_strings->number);

  /* use the sorting of indices_sort_strings and find the number,
     index +1 of the sorted index name with a linear search.  The number
     is used and not the index in order to use 0 to mean not found */
  for (i = 0; i < indices_sort_strings->number; i++)
    {
      size_t j;
      const char *index_name = indices_sort_strings_n_nr.list[i].name;
      NAME_NUMBER *index_name_number = &sorted_index_entries_n_nr.list[i];

      index_name_number->name = index_name;
      index_name_number->number = 0;

      for (j = 0; sorted_index_entries[j].name; j++)
        {
          if (! strcmp(sorted_index_entries[j].name,
                       index_name))
            {
              index_name_number->number = j+1;
              break;
            }
        }
    }


  /* 3. go through indexes sorted entries, associate index entries number
        in original index to sort strings and then print sort strings
        in result */

  text_init (&result);
  text_append (&result, "");

  for (i = 0; i < indices_sort_strings_n_nr.number; i++)
    {
      NAME_NUMBER *sorted_indices_number = &sorted_index_entries_n_nr.list[i];
      size_t sorted_index_nr = sorted_indices_number->number;
      const INDEX_SORTED_BY_INDEX *sorted_index;

      if (sorted_index_nr == 0)
        continue;

      sorted_index = &sorted_index_entries[sorted_index_nr -1];
      if (sorted_index->entries_number > 0)
        {
          size_t j;
          NAME_NUMBER *sort_string_number = &indices_sort_strings_n_nr.list[i];
          const INDEX_SORT_STRINGS *index_sort_strings
            = &indices_sort_strings->indices[sort_string_number->number];

          /* go through sort strings to associate to an entry number
             in index its sort string */
          /* done in Texinfo::Indices format_index_entries_sort_strings */
          for (j = 0; j < index_sort_strings->entries_number; j++)
            {
              INDEX_ENTRY_SORT_STRING *sort_string
                = &index_sort_strings->sort_string_entries[j];
              size_t index_idx
               = find_indices_entries_sort_strings_index (
                                            &document->indices_info,
                                            &indices_entries_sort_string,
                                            sort_string->entry->index_name);
              indices_entries_sort_string.list[index_idx]
                    .sort_strings[sort_string->entry->number -1]
                = sort_string;
            }

          text_printf (&result, "%s:\n", sorted_index->name);
          /* now go through sorted index entries to print the corresponding
             sort string */
          for (j = 0; j < sorted_index->entries_number; j++)
            {
              const INDEX_ENTRY *idx_entry = sorted_index->entries[j];
              const INDEX_ENTRY_SORT_STRING *sort_string = 0;
              size_t k;
              for (k = 0; k < indices_entries_sort_string.number; k++)
                {
                  if (!strcmp (indices_entries_sort_string.list[k].index_name,
                               idx_entry->index_name))
                    {
                      sort_string = indices_entries_sort_string.list[k]
                                       .sort_strings[idx_entry->number -1];
                      break;
                    }
                }
              if (!sort_string)
                {
                  char *msg;
                  xasprintf (&msg, "sort string not found: %s",
                                    idx_entry->index_name);
                  fatal (msg);
                  free (msg);
                }

              text_append_n (&result, " ", 1);
              /* following done in
                 Texinfo::Indices format_index_entries_sort_strings */
              text_append (&result,
                  sort_string->sort_string_subentries[0].sort_string);
              if (sort_string->subentries_number > 1)
                {
                  size_t n;
                  for (n = 1; n < sort_string->subentries_number; n++)
                    {
                      text_append_n (&result, ", ", 2);
                      text_append (&result,
                        sort_string->sort_string_subentries[n].sort_string);
                    }
                }
              text_append_n (&result, "\n", 1);
            }

           /* reset indices_entries_sort_string */
          for (j = 0; j < indices_entries_sort_string.number; j++)
            {
              free (indices_entries_sort_string.list[j].sort_strings);
              indices_entries_sort_string.list[j].index_name = 0;
            }
          indices_entries_sort_string.number = 0;
        }
    }

  free (indices_entries_sort_string.list);

  free_name_number_list (&sorted_index_entries_n_nr);
  free_name_number_list (&indices_sort_strings_n_nr);

  if (result.end == 0)
    {
      free (result.text);
      return 0;
    }

  return result.text;
}

