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

/* includes config.h */
#include "system.h"

/* for uintptr_t */
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
/* for _O_BINARY */
#include <fcntl.h>

#include "text.h"
#include "element_types.h"
#include "tree_types.h"
#include "option_types.h"
#include "options_data.h"
#include "document_types.h"
#include "converter_types.h"
#include "html_converter_state.h"
#include "types_data.h"
#include "html_converter_types.h"
#include "list_macros.h"
/* fatal isascii_alpha */
#include "base_utils.h"
#include "tree.h"
#include "hashmap.h"
#include "builtin_commands.h"
#include "command_stack.h"
#include "errors.h"
/* xasprintf get_label_element output_conversions ENCODING_CONVERSION
   encode_with_iconv output_unit_type_names get_cmd_global_uniq_command
   */
#include "utils.h"
#include "extra.h"
#include "debug.h"
/* retrieve_output_units output_unit_texi */
#include "output_unit.h"
#include "convert_to_texinfo.h"
/* translate_string NAMED_STRING_ELEMENT_LIST
   set_translations_documentlanguage */
#include "translations.h"
/* convert_to_text */
#include "convert_to_text.h"
/* normalize_transliterate_texinfo_contents */
#include "node_name_normalization.h"
/* converter_encoded_output_file_name
   output_files_open_out
   output_files_register_closed
   clear_tree_added_elements
 */
#include "convert_utils.h"
/* call_latex_convert_to_latex_math */
#include "call_html_perl_function.h"
/* for unregister_document_merge_with_document */
#include "document.h"
#include "targets.h"
/* txi_paths_info create_destination_directory
   set_global_document_commands
   register_normalize_case_filename converter_translated_command_tree */
#include "converter.h"
#include "html_conversion_state.h"
#include "format_html.h"
#include "convert_html.h"
/* html_nr_string_directions ... */
#include "html_prepare_converter.h"
#include "html_conversion_api.h"

const char *html_conversion_context_type_names[] = {
  #define cctx_type(name) #name,
   HCC_CONTEXT_TYPES_LIST
  #undef cctx_type
};

const char *html_stage_handler_stage_type_names[] = {
  #define html_hsht_type(name) #name,
   HTML_STAGE_HANDLER_STAGE_TYPE
  #undef html_hsht_type
};



/* string translation and tree conversion */

char *
format_translate_message (CONVERTER *self,
                                  const char *message,
                                  const DOCUMENT_LANG_INFO *lang_info,
                                  const char *message_context)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  const FORMATTING_REFERENCE *formatting_reference
   = &self_html->current_formatting_references[FR_format_translate_message];

  return call_formatting_function_format_translate_message (self,
                                            formatting_reference,
                                    message, lang_info, message_context);
}

/* return string to be freed by the caller */
static char *
html_custom_translate_string (CONVERTER *self, const char *string,
                              const DOCUMENT_LANG_INFO *lang_info,
                              const char *translation_context)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  const FORMATTING_REFERENCE *formatting_reference
    = &self_html->current_formatting_references[FR_format_translate_message];

  /* there is no place where FRS_status_ignored could be set, but
     it does not hurt to consider it possible */
  if (formatting_reference->status
      && formatting_reference->status != FRS_status_ignored
      && formatting_reference->status != FRS_status_none
     /* this function may not be defined in Perl, thus this condition */
      && formatting_reference->sv_reference)
    {
      char *translated_string
       = format_translate_message (self, string, lang_info,
                                   translation_context);

      if (translated_string)
        return translated_string;
    }

  return 0;
}

static const DOCUMENT_LANG_INFO unknown_lang_info = {"", 0, 0, 0, {0, 0, 0}};

/* Same as translations.c cache_translate_string, but using the
   converter translations cache for user-defined translations */
TRANSLATION_TREE *
html_cache_translate_string (CONVERTER *self, const char *string,
                             const LANG_TRANSLATION *lang_translation,
                             const char *translation_context)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  int debug_level = 0;
  char *translated_string;
  const DOCUMENT_LANG_INFO *lang_info;

  if (self->conf && self->conf->DEBUG.o.integer >= 0)
    debug_level = self->conf->DEBUG.o.integer;

  if (lang_translation)
    lang_info = lang_translation->info;
  else
    lang_info = &unknown_lang_info;

  translated_string = html_custom_translate_string (self, string,
                                                    lang_info,
                                                    translation_context);
  if (translated_string)
    {
      const char *translation_context_str;
      LANG_TRANSLATION_TREE_LIST *translations;
      char *translated_context_string;
      TRANSLATION_TREE *result;
      const LANG_TRANSLATION *user_lang_transl;
      uintptr_t string_nr;
      int found;

      user_lang_transl = set_lang_info_copy_translation (
                                               &self_html->translation_cache,
                                               lang_info,
                                               TXI_CONVERT_STRINGS_NR);
      translations = user_lang_transl->translations;

      if (translation_context)
        translation_context_str = translation_context;
      else
        translation_context_str = "";

      xasprintf (&translated_context_string, "%s-%s",
                 string, translation_context_str);

      string_nr = (uintptr_t) c_hashmap_value (translations->hash,
                                       translated_context_string, &found);
      if (found)
        {
          free (translated_context_string);
          result = translations->list[string_nr -1];
          if (!strcmp (result->translation.text, translated_string))
            {
              free (translated_string);
              if (debug_level >= 2)
                {
                  fprintf (stderr, "C|UserCacheT [%s] hit '%s-%s' '%s'\n",
                           lang_info->bcp47_locale,
                           string, translation_context_str,
                           result->translation.text);
                }
              return result;
            }
          /* the translated string has changed, invalidate the cached tree
             and replace translated string */
          if (result->tree)
            {
              destroy_element_and_children (result->tree);
              result->tree = 0;
              if (debug_level >= 2)
                {
                  fprintf (stderr,
                "C|UserCacheT [%s] invalid tree '%s-%s' '%s' (old: %s)\n",
                           lang_info->bcp47_locale,
                           string, translation_context_str,
                           translated_string,
                           result->translation.text);
                }
            }
          else if (debug_level >= 2)
            {
              fprintf (stderr,
              "C|UserCacheT [%s] invalid translation '%s-%s' '%s' (old: %s)\n",
                           lang_info->bcp47_locale,
                           string, translation_context_str,
                           translated_string,
                           result->translation.text);
            }
          text_reset (&result->translation);
          text_append (&result->translation, translated_string);
          free (translated_string);
          return result;
        }
      else if (debug_level >= 2)
        {
          fprintf (stderr,
           "C|UserCacheT [%s] new '%s-%s' '%s'\n",
              lang_info->bcp47_locale, string,
              translation_context_str, translated_string);
        }

      result = add_translation_tree (translations, translated_context_string);
      text_append (&result->translation, translated_string);

      free (translated_context_string);
      free (translated_string);

      return result;
    }

  return cache_translate_string (string, lang_translation,
                                 translation_context, debug_level);
}

/* same as cdt_tree with html_cache_translate_string passed to gdt_tree */
ELEMENT *
html_cdt_tree (const char *string, CONVERTER *self,
               NAMED_STRING_ELEMENT_LIST *replaced_substrings,
               const char *translation_context)
{
  CONVERTER_CACHE_TRANSLATE html_translation_function = {self,
                                          &html_cache_translate_string};
  int debug_level = self->conf->DEBUG.o.integer;

  return gdt_tree (string, self->document, self->current_lang_translations,
                        replaced_substrings, translation_context,
                        debug_level, &html_translation_function);
}

TEXT
html_cdt_string (const char *string, CONVERTER *self,
                 NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                 const char *translation_context)
{
  CONVERTER_CACHE_TRANSLATE html_translation_function = {self,
                                          &html_cache_translate_string};
  int debug_level = self->conf->DEBUG.o.integer;

  return gdt_string (string, self->current_lang_translations,
                     replaced_substrings, translation_context, debug_level,
                     &html_translation_function);
}

ELEMENT *
html_pcdt_tree (const char *translation_context, const char *string,
                CONVERTER *self,
                NAMED_STRING_ELEMENT_LIST *replaced_substrings)
{
  return html_cdt_tree (string, self, replaced_substrings,
                        translation_context);
}

ELEMENT *
html_element_cdt_tree (const char *string, const ELEMENT *element,
                       CONVERTER *self,
                       NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                       const char *translation_context)
{
  const LANG_TRANSLATION *lang_translation
    = new_element_language_translation (&converters_translation_cache,
                                        element, TXI_CONVERT_STRINGS_NR);

  CONVERTER_CACHE_TRANSLATE html_translation_function = {self,
                                          &html_cache_translate_string};
  int debug_level = self->conf->DEBUG.o.integer;

  return gdt_tree (string, self->document, lang_translation,
                        replaced_substrings, translation_context,
                        debug_level, &html_translation_function);
}

void
add_tree_to_build (CONVERTER *self, ELEMENT *e)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  if (self_html->external_references_number > 0)
    add_to_element_list (&self_html->tree_to_build, e);
}

void
remove_tree_to_build (CONVERTER *self, ELEMENT *e)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  if (self_html->external_references_number > 0)
    replace_remove_list_element (&self_html->tree_to_build, e, 0);
}

void
html_translate_convert_tree_append (const char *string,
                     CONVERTER *self,
                     NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                     const char *translation_context,
                     TEXT *result, const char *explanation)
{
  ELEMENT *translation_tree = html_cdt_tree (string, self,
                           replaced_substrings, translation_context);

  add_tree_to_build (self, translation_tree);
  html_convert_tree_append (self, translation_tree, result, explanation);
  remove_tree_to_build (self, translation_tree);

  destroy_element_and_children (translation_tree);
}

/* EXPLANATION is used for debugging */
/* returned string to be freed by the caller */
TEXT
html_convert_tree_explanation (CONVERTER *self, const ELEMENT *tree,
                               const char *explanation)
{
  TEXT result;
  text_init (&result);

  html_convert_tree_append (self, tree, &result, explanation);

  return result;
}

/* follows the common API for converters */
/* returned string to be freed by the caller */
TEXT
html_convert_tree (CONVERTER *self, const ELEMENT *tree)
{
  return html_convert_tree_explanation (self, tree, 0);
}

/* Call convert_tree out of the main conversion flow.
 */
char *
html_convert_tree_new_formatting_context (CONVERTER *self, const ELEMENT *tree,
                                          const char *context_string,
                                          unsigned long context_type,
                                          const char *multiple_pass,
                                          const char *document_global_context,
                                          enum command_id block_cmd)
{
  const char *multiple_pass_str = "";
  TEXT result;
  char *explanation;
  char *context_string_str;

  html_new_document_context (self, context_string, context_type,
                             document_global_context, block_cmd);
  xasprintf (&context_string_str, "C(%s)", context_string);

  if (multiple_pass)
    {
      html_set_multiple_conversions (self, multiple_pass);
      multiple_pass_str = "|M";
    }

  if (self->conf->DEBUG.o.integer > 0)
    fprintf (stderr, "C|new_fmt_ctx %s%s\n", context_string_str,
                                              multiple_pass_str);

  xasprintf (&explanation, "new_fmt_ctx %s", context_string_str);
  result = html_convert_tree_explanation (self, tree, explanation);

  free (explanation);

  if (multiple_pass)
    html_unset_multiple_conversions (self);

  free (context_string_str);
  html_pop_document_context (self);

  return result.text;
}

/* NOTE these switches are not done in perl, so the only perl functions
   that can be called are perl functions that do not call formatting/conversion
   functions or the formatting/conversion functions for HTML will be used. */
char *
html_convert_css_string (CONVERTER *self, const ELEMENT *element,
                         const char *context_str)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  char *css_string_context_str;
  char *context_string_str;
  char *explanation;
  TEXT result;

  void (* saved_current_format_protect_text) (const char *text, TEXT *result);
  FORMATTING_REFERENCE *saved_formatting_references
     = self_html->current_formatting_references;
  COMMAND_CONVERSION_FUNCTION *saved_commands_conversion_function
     = self_html->current_commands_conversion_function;
  TYPE_CONVERSION_FUNCTION *saved_types_conversion_function
     = self_html->current_types_conversion_function;
  saved_current_format_protect_text = self_html->current_format_protect_text;

  self_html->current_formatting_references
    = &self_html->css_string_formatting_references[0];
  self_html->current_commands_conversion_function
    = &self_html->css_string_command_conversion_function[0];
  self_html->current_types_conversion_function
    = &self_html->css_string_type_conversion_function[0];
  self_html->current_format_protect_text
     = &html_default_css_string_format_protect_text;

  if (context_str)
    xasprintf (&css_string_context_str, "CSS string %s", context_str);
  else
    css_string_context_str = "CSS string ";

  xasprintf (&context_string_str, "C(%s)", css_string_context_str);
  xasprintf (&explanation, "new_fmt_ctx %s", context_string_str);

  html_new_document_context (self, css_string_context_str,
                             CTXF_string, 0, 0);

  result = html_convert_tree_explanation (self, element, explanation);

  html_pop_document_context (self);

  free (explanation);
  free (context_string_str);
  if (context_str)
    free (css_string_context_str);

  self_html->current_formatting_references = saved_formatting_references;
  self_html->current_commands_conversion_function
    = saved_commands_conversion_function;
  self_html->current_types_conversion_function = saved_types_conversion_function;
  self_html->current_format_protect_text = saved_current_format_protect_text;

  return result.text;
}



/* reset translated data and translate no args commands */

void
html_clear_direction_string_type (const CONVERTER *self,
                                  char ***type_directions_strings)
{
  int i;
  int nr_string_directions = html_nr_string_directions (self);
  int nr_dir_str_contexts = TDS_context_string + 1;

  for (i = 0; i < nr_string_directions; i++)
    {
      char **direction_strings = type_directions_strings[i];
      int j;
      /* NULL only happens for customized_directions_strings */
      if (direction_strings != NULL)
        {
          for (j = 0; j < nr_dir_str_contexts; j++)
            {
              free (direction_strings[j]);
              direction_strings[j] = 0;
            }
        }
    }
}

void
html_reset_translated_special_unit_info_tree (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  STRING_LIST *special_unit_varieties = &self_html->special_unit_varieties;
  int j;
  for (j = 0; translated_special_unit_info[j].tree_type != SUIT_type_none; j++)
    {
      size_t i;
      enum special_unit_info_tree tree_type
        = translated_special_unit_info[j].tree_type;
      for (i = 0; i < special_unit_varieties->number; i++)
        {
          if (self_html->translated_special_unit_info_tree[tree_type][i])
            {
              destroy_element_and_children (
                self_html->translated_special_unit_info_tree[tree_type][i]);
            }
          self_html->translated_special_unit_info_tree[tree_type][i] = 0;
        }
    }
}

static void
reset_unset_no_arg_commands_formatting_context (CONVERTER *self,
               enum command_id cmd, enum conversion_context reset_context,
               enum conversion_context ref_context, int translate)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  HTML_NO_ARG_COMMAND_FORMATTING *no_arg_formatting
    = &self_html->html_no_arg_command_conversion[cmd];
  HTML_NO_ARG_COMMAND_CONVERSION *conversion_contexts
    = no_arg_formatting->context_formatting;
  HTML_NO_ARG_COMMAND_CONVERSION *no_arg_command_context
    = &conversion_contexts[reset_context];

  if (ref_context >= 0 && no_arg_command_context->unset)
    {
      HTML_NO_ARG_COMMAND_CONVERSION *no_arg_ref
        = &conversion_contexts[ref_context];

      if (no_arg_ref->text)
        {
          free (no_arg_command_context->text);
          no_arg_command_context->text = strdup (no_arg_ref->text);
        }
      if (no_arg_ref->translated_converted)
        {
          free (no_arg_command_context->translated_converted);
          no_arg_command_context->translated_converted
            = strdup (no_arg_ref->translated_converted);
        }
    }

  if (translate
      && no_arg_formatting->translated_tree
      && !no_arg_command_context->translated_converted)
    {
      char *translation_result;
      char *explanation;
      char *context;
      ELEMENT *tree_built = 0;
      ELEMENT *translated_tree = no_arg_formatting->translated_tree;
      if (self_html->external_references_number > 0 && !translated_tree->sv)
        {
          add_to_element_list (&self_html->tree_to_build, translated_tree);
          tree_built = translated_tree;
        }
      xasprintf (&explanation, "Translated NO ARG @%s ctx %s",
                 command_data[cmd].cmdname,
                 html_conversion_context_type_names[reset_context]);
      xasprintf (&context, "Tr %s ctx %s",
                 command_data[cmd].cmdname,
                 html_conversion_context_type_names[reset_context]);
      if (reset_context == HCC_type_normal)
        {
          TEXT result
             = html_convert_tree_explanation (self, translated_tree,
                                              explanation);
          translation_result = result.text;
        }
      else if (reset_context == HCC_type_preformatted)
        {
          enum command_id preformatted_cmd = CM_example;
          /* there does not seems to be anything simpler... */
          html_new_document_context (self, context, 0, 0, 0);
          html_open_command_update_context (self, preformatted_cmd);
          TEXT result
              = html_convert_tree_explanation (self, translated_tree,
                                               explanation);
          translation_result = result.text;
          html_convert_command_update_context (self, preformatted_cmd);
          html_pop_document_context (self);
        }
      else if (reset_context == HCC_type_string)
        {
          html_new_document_context (self, context, CTXF_string, 0, 0);

          TEXT result
             = html_convert_tree_explanation (self, translated_tree,
                                              explanation);
          translation_result = result.text;
          html_pop_document_context (self);
        }
      else /* reset_context == HCC_type_css_string */
        {
          translation_result = html_convert_css_string (self, translated_tree,
                                                        context);
        }
      free (explanation);
      free (context);
      free (no_arg_command_context->text);
      no_arg_command_context->text = translation_result;
      if (tree_built)
        replace_remove_list_element (&self_html->tree_to_build, tree_built, 0);
    }
}

void
html_complete_no_arg_commands_formatting (CONVERTER *self, enum command_id cmd,
                                          int translate)
{
  reset_unset_no_arg_commands_formatting_context (self, cmd, HCC_type_normal,
                                                  -1, translate);
  reset_unset_no_arg_commands_formatting_context (self, cmd,
                                                  HCC_type_preformatted,
                                                  HCC_type_normal, translate);
  reset_unset_no_arg_commands_formatting_context (self, cmd, HCC_type_string,
                                                  HCC_type_preformatted, translate);
  reset_unset_no_arg_commands_formatting_context (self, cmd, HCC_type_css_string,
                                                  HCC_type_string, translate);
}

void
html_translate_names (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t j;
  const STRING_LIST *special_unit_varieties
    = &self_html->special_unit_varieties;

  if (self->conf->DEBUG.o.integer > 0)
    {
      const char *bcp47_locale = current_bcp47_locale (self);
      const char *output_encoding_name
        = self->conf->OUTPUT_ENCODING_NAME.o.string;
      if (!output_encoding_name)
        output_encoding_name = "UNDEF";
      fprintf (stderr, "\nC|TRANSLATE_NAMES encoding_name: %s"
               " bcp47_locale: %s\n", output_encoding_name, bcp47_locale);
    }

  /* reset strings such that they are translated when needed. */
  for (j = 0; j < TDS_TRANSLATED_MAX_NR; j++)
    {
      html_clear_direction_string_type (self,
                                        self_html->directions_strings[j]);
    }

  /* reset trees such that they are created based on Texinfo code string
     translation on-demand */
  html_reset_translated_special_unit_info_tree (self);

  /* delete the tree and formatted results for special elements
     such that they are redone with the new tree when needed. */
  for (j = 0; j < special_unit_varieties->number; j++)
    {
      const char *special_unit_variety = special_unit_varieties->list[j];
      int special_unit_direction_index
       = html_special_unit_variety_direction_index (self, special_unit_variety);
      if (special_unit_direction_index >= 0)
        {
          const OUTPUT_UNIT *special_unit
           = self_html->global_units_directions[special_unit_direction_index];
          if (special_unit)
            {
              const ELEMENT *command = special_unit->uc.special_unit_command;
              if (command)
                {
                  HTML_TARGET *target_info
                    = html_get_target (self, command);
                  if (target_info)
                    {
       /* the tree is a reference to special_unit_info_tree, so it should
          not be freed, but it needs to be reset to trigger the creation of the
          special_unit_info_tree tree when needed */
                      clear_tree_added_elements (&target_info->tree);
                      free (target_info->command_text[HTT_string]);
                      target_info->command_text[HTT_string] = 0;
                      free (target_info->command_text[HTT_text]);
                      target_info->command_text[HTT_text] = 0;
                      free (target_info->command_description[HTT_string]);
                      target_info->command_description[HTT_string] = 0;
                      free (target_info->command_description[HTT_text]);
                      target_info->command_description[HTT_text] = 0;
                    }
                }
            }
        }
    }

  /* self->no_arg_formatted_cmd_translated is used here to hold the translated
     commands, and the information is kept if it is also used to pass
     translated commands results to Perl */
    {
      COMMAND_ID_LIST *translated_cmds
        = &self_html->no_arg_formatted_cmd_translated;

      /* resetting translated_cmds is often done in build_html_translated_names
         when passing the translations to Perl.
         Need to do it here too if build_html_translated_names is never
         called */
      if (translated_cmds->number)
        {
          memset (translated_cmds->list, 0, translated_cmds->number
                * sizeof (enum command_id));
        }
      translated_cmds->number = 0;

      for (j = 0; j < no_arg_formatted_cmd.number; j++)
        {
          enum command_id cmd = no_arg_formatted_cmd.list[j];
          enum conversion_context cctx;
          int add_cmd = 0;
          HTML_NO_ARG_COMMAND_FORMATTING *no_arg_formatting
            = &self_html->html_no_arg_command_conversion[cmd];
          ELEMENT *translated_tree = 0;

          if (no_arg_formatting->translated_to_convert)
            {/* it is very unlikely to have small strings to add,
                but in case there are it should be ok */
              translated_tree =
                html_cdt_tree (no_arg_formatting->translated_to_convert,
                               self, 0, 0);
            }
          else
             /* generic Converter default translated commands */
             translated_tree
                        = converter_translated_command_tree (self, cmd);

          if (translated_tree)
            {
              add_cmd = 1;
              if (no_arg_formatting->translated_tree)
                destroy_element_and_children (
                          no_arg_formatting->translated_tree);

              no_arg_formatting->translated_tree = translated_tree;
            }

          for (cctx = 0; cctx < NO_ARG_COMMAND_CONTEXT_NR; cctx++)
            {
              HTML_NO_ARG_COMMAND_CONVERSION *format_spec
                = &no_arg_formatting->context_formatting[cctx];
              if (format_spec->translated_converted
                  && !format_spec->unset)
                {
                  TEXT translated
                   = html_cdt_string (format_spec->translated_converted, self,
                                      0, 0);
                  add_cmd = 1;
                  free (format_spec->text);
                  format_spec->text = translated.text;
                }
            }

          if (add_cmd)
            {
              translated_cmds->list[translated_cmds->number] = cmd;
              translated_cmds->number++;
            }
        }

      for (j = 0; j < translated_cmds->number; j++)
        {
          enum command_id cmd = translated_cmds->list[j];
          html_complete_no_arg_commands_formatting (self, cmd, 1);
        }

      /* not passed to Perl in that case, unset to avoid spurious error
         messages */
      if (self_html->external_references_number <= 0)
        {
          memset (translated_cmds->list, 0, translated_cmds->number
                * sizeof (enum command_id));
          translated_cmds->number = 0;
        }
    }

  if (self->conf->DEBUG.o.integer > 0)
    fprintf (stderr, "C|END TRANSLATE_NAMES\n\n");

  self_html->modified_state |= HMSF_translations;
}



/* last preparations of conversion.  At this point conversion of
   Texinfo tree is possible */

int
html_run_stage_handlers (CONVERTER *self,
                         enum html_stage_handler_stage_type stage)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t i;
  HTML_STAGE_HANDLER_INFO_LIST *stage_handlers
    = &self_html->html_stage_handlers[stage];

  if (stage_handlers->number > 0)
    {
      const char *stage_name = html_stage_handler_stage_type_names[stage];

      for (i = 0; i < stage_handlers->number; i++)
        {
          int call_status;
          HTML_STAGE_HANDLER_INFO *stage_handler
            = &stage_handlers->list[i];

          if (self->conf->DEBUG.o.integer > 0)
            fprintf (stderr, "C|RUN handler %zu: stage %s, priority %s\n",
                     i +1, stage_name, stage_handler->priority);

          if (stage_handler->sv)
            {
              int error_status = 0;
              call_status = call_stage_handler (self, stage_handler->sv,
                                                stage_name, &error_status);
              if (error_status == 1)
                {
                  message_list_document_error (&self->error_messages,
                                                   self->conf, 0,
                 "handler %d of stage %s priority %s: non-numeric status",
                              (int) i+1, stage_name, stage_handler->priority);
                  call_status = self->conf->HANDLER_FATAL_ERROR_LEVEL.o.integer
                                 +1;
                }

              if (call_status != 0)
                {
                  if (call_status < 0)
                    {
                      message_list_document_error (&self->error_messages,
                                                   self->conf, 0,
                              "handler %d of stage %s priority %s failed",
                              (int) i+1, stage_name, stage_handler->priority);
                    }
                  else
                    {
                   /* the handler is supposed to have output an error message
                      already if $status > 0 */
                      if (self->conf->DEBUG.o.integer > 0
                          || self->conf->VERBOSE.o.integer > 0)
                        {
                          fprintf (stderr,
                                   "FAIL handler %zu: stage %s, priority %s\n",
                                   i +1, stage_name, stage_handler->priority);
                        }
                    }
                  return call_status;
                }
            }
        }
    }
  return 0;
}

static const enum command_id simpletitle_cmds[] =
 {CM_settitle, CM_shorttitlepage, 0};

void
html_prepare_simpletitle (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  int i;
  for (i = 0; simpletitle_cmds[i]; i++)
    {
      enum command_id cmd = simpletitle_cmds[i];
      const ELEMENT *command
        = get_cmd_global_uniq_command (&self->document->global_commands, cmd);
      if (command  && command->e.c->contents.list[0]->e.c->contents.number > 0)
        {
          self_html->simpletitle_tree = command->e.c->contents.list[0];
          self_html->simpletitle_cmd = cmd;
          break;
        }
    }
}

void
html_free_direction_icons_array (CONVERTER *self, char ***direction_icons)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  if (*direction_icons)
    {
      size_t i;
      for (i = 0; self_html->main_units_direction_names[i]; i++)
        free ((*direction_icons)[i]);
      free (*direction_icons);
      *direction_icons = 0;
    }
}

static int
compare_direction_icon (const void *a, const void *b)
{
  const DIRECTION_ICON *dicon_a = (const DIRECTION_ICON *) a;
  const DIRECTION_ICON *dicon_b = (const DIRECTION_ICON *) b;

  return strcmp (dicon_a->direction_name, dicon_b->direction_name);
}

/* fill DIRECTION_ICON_NAMES array with icon file names according
   to the order in SELF main_units_direction_names directions names
   for DIRECTION_ICONS pairs of file name and direction name.
 */
static void
order_direction_icons_list (CONVERTER *self,
                            DIRECTION_ICON_LIST *direction_icons,
                            char ***direction_icon_names,
                            size_t icons_nr)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  html_free_direction_icons_array (self, direction_icon_names);

  /* there are always directions, so should always be true */
  if (icons_nr > 0)
    {
      DIRECTION_ICON searched;
      size_t i;

      *direction_icon_names = (char **) malloc (icons_nr * sizeof (char *));

      /* sort the icon, direction pairs according to their direction names to
         be able to find them fast based on the direction name */
      qsort (direction_icons->icons_list, direction_icons->number,
             sizeof (DIRECTION_ICON), compare_direction_icon);

      for (i = 0; self_html->main_units_direction_names[i]; i++)
        {
          const DIRECTION_ICON *icon;
          searched.direction_name
            = (char *)self_html->main_units_direction_names[i];

          icon = (const DIRECTION_ICON *) bsearch (&searched,
                direction_icons->icons_list, direction_icons->number,
                sizeof (DIRECTION_ICON), compare_direction_icon);
          if (icon && icon->name && strlen (icon->name))
            (*direction_icon_names)[i] = strdup (icon->name);
          else
            (*direction_icon_names)[i] = 0;
        }
    }
}

void
html_prepare_direction_icons (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  /* consistent with main_units_direction_names size */
  size_t icons_nr = self_html->special_unit_varieties.number
                       + NON_SPECIAL_DIRECTIONS_NR;

  if (self->conf->ICONS.o.integer > 0)
    {
      if (self->conf->ACTIVE_ICONS.o.icons->number > 0)
        order_direction_icons_list (self, self->conf->ACTIVE_ICONS.o.icons,
                &self_html->html_active_icons, icons_nr);

      if (self->conf->PASSIVE_ICONS.o.icons->number > 0)
        order_direction_icons_list (self, self->conf->PASSIVE_ICONS.o.icons,
                &self_html->html_passive_icons, icons_nr);
    }
}

void
html_prepare_title_titlepage (CONVERTER *self, const char *output_file,
                              const char *output_filename)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  const OUTPUT_UNIT_LIST *output_units = retrieve_output_units
    (self->document, self_html->output_units_descriptors[OUDT_units]);

  if (strlen (output_file))
    {
      self_html->current_filename.filename = output_units->list[0]->unit_filename;
      self_html->current_filename.file_number
        = self->output_unit_file_indices[0]+1;
    }
  else
    {
      self_html->current_filename.filename = output_filename;
      self_html->current_filename.file_number = 1;
    }

  self_html->title_titlepage = html_format_title_titlepage (self);
  memset (&self_html->current_filename, 0, sizeof (FILE_NUMBER_NAME));
}

int
html_prepare_converted_output_info (CONVERTER *self, const char *output_file,
                                    const char *output_filename)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  ELEMENT *fulltitle_tree = 0;
  char *html_title_string = 0;
  const char *default_bcp47_locale;
  const char *preamble_bcp47_locale;
  int init_handler_status;
  int handler_fatal_error_level
     = self->conf->HANDLER_FATAL_ERROR_LEVEL.o.integer;

  int structure_handler_status
    = html_run_stage_handlers (self, HSHT_type_structure);

  if (structure_handler_status < handler_fatal_error_level
      && structure_handler_status > -handler_fatal_error_level)
    {}
  else
    return 0;

  default_bcp47_locale = current_bcp47_locale (self);

  set_converter_preamble_language_commands (self);

  preamble_bcp47_locale = current_bcp47_locale (self);

  if (strcmp (default_bcp47_locale, preamble_bcp47_locale))
    html_translate_names (self);

  html_prepare_direction_icons (self);

  /*
   prepare title.  fulltitle uses more possibility than simpletitle for
   title, including @-commands found in @titlepage only.  Therefore
   simpletitle is more in line with what makeinfo in C did.
   */

  html_prepare_simpletitle (self);

  fulltitle_tree = converter_get_fulltitle_tree (self);

  if (fulltitle_tree)
    {
      self_html->title_tree = fulltitle_tree;

      html_title_string
          = html_convert_tree_new_formatting_context (self,
                                       fulltitle_tree, "title_string",
                                       CTXF_string, 0, 0, 0);
      if (html_title_string[strspn (html_title_string, whitespace_chars)]
           == '\0')
        {
          free (html_title_string);
          html_title_string = 0;
        }
    }

  if (!html_title_string)
    {
      ELEMENT *default_title = html_cdt_tree ("Untitled Document",
                                              self, 0, 0);
      SOURCE_INFO cmd_source_info;

      self_html->title_tree = default_title;

      add_tree_to_build (self, default_title);

      html_title_string
         = html_convert_tree_new_formatting_context (self,
                                       default_title, "title_string",
                                       CTXF_string, 0, 0, 0);

      remove_tree_to_build (self, default_title);
      self_html->added_title_tree = 1;

      if (self->document->global_info.input_file_name)
        {
          /* setup a source info with file only */
          memset (&cmd_source_info, 0, sizeof (SOURCE_INFO));
          cmd_source_info.file_name
           = self->document->global_info.input_file_name;
          message_list_line_error_ext (&self->error_messages,
                             (self->conf && self->conf->DEBUG.o.integer > 0),
                                  MSG_warning, 0, &cmd_source_info,
                      "must specify a title with a title command or @top");
        }
      else
        {
          message_list_document_warn (&self->error_messages, self->conf, 0,
                      "must specify a title with a title command or @top");
        }
    }

  self_html->title_string = html_title_string;

  /* copying comment */

  if (self->document->global_commands.copying)
    {
      char *copying_comment;
      ELEMENT *tmp = new_element (ET_NONE);

      tmp->e.c->contents = self->document->global_commands.copying->e.c->contents;

      copying_comment = convert_to_text (tmp, self->convert_text_options);

      tmp->e.c->contents.list = 0;
      destroy_element (tmp);

      if (copying_comment && strlen (copying_comment) > 0)
        {
          self_html->copying_comment = html_format_comment (self, copying_comment);
        }
      free (copying_comment);
    }

  /* documentdescription */
  if (self->conf->documentdescription.o.string)
    self_html->documentdescription_string
     = strdup (self->conf->documentdescription.o.string);
  else if (self->document->global_commands.documentdescription)
    {
      ELEMENT *tmp = new_element (ET_NONE);
      char *documentdescription_string;
      size_t documentdescription_string_len;

      tmp->e.c->contents
        = self->document->global_commands.documentdescription->e.c->contents;

      add_tree_to_build (self, tmp);

      documentdescription_string
            = html_convert_tree_new_formatting_context (self,
                                       tmp, "documentdescription",
                                       CTXF_string, 0, 0, 0);

      remove_tree_to_build (self, tmp);

      tmp->e.c->contents.list = 0;
      destroy_element (tmp);

      documentdescription_string_len = strlen (documentdescription_string);
      if (documentdescription_string_len > 0
          && documentdescription_string[documentdescription_string_len -1]
             == '\n')
        documentdescription_string[documentdescription_string_len -1] = '\0';

      self_html->documentdescription_string = documentdescription_string;
    }

  if (self->document->global_commands.documentinfo)
    {
      const ELEMENT *documentinfo
        = self->document->global_commands.documentinfo;
      if (documentinfo->e.c->contents.number > 0)
        {
          size_t i;
          TEXT t_info_metadata;

          text_init (&t_info_metadata);
          text_append (&t_info_metadata, "");

          for (i = 0; i < documentinfo->e.c->contents.number; i++)
            {
              const ELEMENT *element = documentinfo->e.c->contents.list[i];
              char *element_metadata_str;

              if (element->type == ET_arguments_line
                  || (! (type_data[element->type].flags & TF_text)
                      && ((command_other_flags (element) & CF_metadata)
   /* If EPUB is expanded, @html metadata is used for the EPUB specific
      metadata, not for each converted HTML file metadata included in the EPUB
      container.  This allows to have EPUB metadata even without a specific
      @epub raw format command. */
                           || (element->e.c->cmd == CM_html
                               && format_expanded_p (
                                        self->expanded_formats, "epub")))))
                continue;

              /* can be NULL in case the element is ignored, for example
                 @docbook */
              element_metadata_str
                = html_convert_tree_new_formatting_context (self,
                                       element, "documentinfo metadata",
                                       0, 0, 0, 0);
              if (element_metadata_str)
                {
                  text_append (&t_info_metadata, element_metadata_str);
                  free (element_metadata_str);
                }
            }

          if (t_info_metadata.text[strspn (t_info_metadata.text,
                                            whitespace_chars)] == '\0')
            free (t_info_metadata.text);
          else
            self_html->documentinfo_metadata = t_info_metadata.text;
        }
    }

  if (self->conf->DATE_IN_HEADER.o.integer > 0)
    {
      TEXT text;

      text_init (&text);
      html_default_format_date_in_header (self, &text);
      free (self_html->date_in_header);
      self_html->date_in_header = text.text;
    }

  init_handler_status = html_run_stage_handlers (self, HSHT_type_init);

  if (init_handler_status < handler_fatal_error_level
      && init_handler_status > -handler_fatal_error_level)
    {}
  else
    {
      return 0;
    }

  html_prepare_title_titlepage (self, output_file, output_filename);

  if (strcmp (default_bcp47_locale, preamble_bcp47_locale))
    {
      self->current_lang_translations
       = reset_lang_translation_from_customization (
                              &converters_translation_cache,
                              self->conf->documentlanguage.o.string,
                              self->conf->documentscript.o.string,
                              TXI_CONVERT_STRINGS_NR);

      html_translate_names (self);
    }

  /* reset in case the user changed customization variables in handlers */
  destroy_text_options (self->convert_text_options);
  self->convert_text_options
    = copy_converter_options_for_convert_text (self);

  return 1;
}



/* conversion */

void
destroy_args_formatted (HTML_ARGS_FORMATTED *args_formatted)
{
  if (args_formatted)
    {
      size_t i;
      for (i = 0; i < args_formatted->number; i++)
        {
          int j;
          HTML_ARG_FORMATTED *arg_formatted = &args_formatted->args[i];
          if (arg_formatted->arg_tree)
            {
              for (j = 0; j < AFT_type_raw+1; j++)
                free (arg_formatted->formatted[j]);
            }
        }
      free (args_formatted->args);
    }
  free (args_formatted);
}


#define ADD(x) text_append (result, x)

char *
debug_print_html_contexts (const CONVERTER *self)
{
  const HTML_CONVERTER_STATE *self_html = self->html_converter;

  size_t i;
  TEXT contexts_str;
  text_init (&contexts_str);
  text_append (&contexts_str, "[");
  const HTML_DOCUMENT_CONTEXT_STACK *document_context_stack
    = &self_html->html_document_context;
  const HTML_DOCUMENT_CONTEXT *top_document_ctx
    = html_top_document_context (self);
  const HTML_FORMATTING_CONTEXT_STACK *formatting_context_stack
    = &top_document_ctx->formatting_context;

  for (i = 0; i < document_context_stack->number; i++)
    {
      const HTML_DOCUMENT_CONTEXT *document_context
        = &document_context_stack->list[i];
      if (i != 0)
        text_append (&contexts_str, "|");
      if (document_context->context)
        text_append (&contexts_str, document_context->context);
      else
        text_append (&contexts_str, "UNDEF");
    }
  text_append (&contexts_str, "](");

  for (i = 0; i < formatting_context_stack->number; i++)
    {
      const HTML_FORMATTING_CONTEXT *formatting_context
       = &formatting_context_stack->list[i];
      if (i != 0)
        text_append (&contexts_str, "|");
      if (formatting_context->context_name)
        text_append (&contexts_str, formatting_context->context_name);
      else
        text_append (&contexts_str, "UNDEF");

    }
  text_append (&contexts_str, ")");
   /*
  text_append (&contexts_str, "{");
  for (i = 0; i < top_document_ctx->block_commands.number; i++)
    {
      enum command_id cmd = top_document_ctx->block_commands.list[i];
      if (i != 0)
        text_append (&contexts_str, "|");
      text_append (&contexts_str, builtin_command_name (cmd));
    }
  text_append (&contexts_str, "}");
    */
  return contexts_str.text;
}

/* EXPLANATION is used for debugging */
void
html_convert_tree_append (CONVERTER *self, const ELEMENT *element,
                          TEXT *result, const char *explanation)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  /* for debugging, for explanations */
  TEXT command_type;
  char *debug_str;
  const char *command_name = 0;
  enum command_id cmd = CM_NONE;

  text_init (&command_type);
  if (! (type_data[element->type].flags & TF_text))
    {
      cmd = element_builtin_cmd (element);
      command_name = element_command_name (element);
      if (command_name)
        text_printf (&command_type, "@%s ", command_name);
    }

  if (element->type && !(type_data[element->type].flags & TF_c_only))
    text_append (&command_type, type_data[element->type].name);

  if (self->conf->DEBUG.o.integer > 0)
    {
      char *contexts_str = debug_print_html_contexts (self);
      char *element_str = print_element_debug (element, 0);;
      const char *explanation_str = explanation;
      if (!explanation)
        explanation_str = "NO EXPLANATION";
      fprintf (stderr, "C|ELEMENT(%s) %s: %s\n", explanation_str,
                                               contexts_str, element_str);
      free (element_str);
      free (contexts_str);
    }

  /* Process text */

  if (type_data[element->type].flags & TF_text)
    {
      TEXT text_result;
      /* NOTE C only text types cannot be ignored here */
      if (self_html->current_types_conversion_function[element->type].status
                                                     == FRS_status_ignored)
        {
          if (self->conf->DEBUG.o.integer > 0)
            {
              fprintf (stderr, "C|IGNORE TEXT %s\n", command_type.text);
            }
          goto out;
        }

      text_init (&text_result);
      text_append (&text_result, "");

      /* already converted to html, keep it as is, assume it cannot be NULL */
      if (element->type == ET__converted)
        text_append_n (&text_result, element->e.text->text,
                       element->e.text->end);
      else
        {
          if (!self_html->current_types_conversion_function[ET_text].type_conversion)
            fatal ("ET_text conversion function NULL");

          (*(self_html->current_types_conversion_function[ET_text].type_conversion))
                    (self, ET_text, element, element->e.text->text,
                                                              &text_result);
        }

      if (self->conf->DEBUG.o.integer > 0)
        {
          fprintf (stderr, "C|DO TEXT => `%s'\n", text_result.text);
        }

      ADD(text_result.text);
      free (text_result.text);
      goto out;
    }

  /* ignored if ignored both as type and command */
  if ((element->type
       && (self_html->current_types_conversion_function[element->type].status
                                                     == FRS_status_ignored
         /* type unknown in Perl.  They cannot be customized as ignored
            but correspond to @-commands only.  We always consider them
            to be ignored as type, in the next condition it is checked
            if they are ignored as commands */
           || type_data[element->type].flags & TF_c_only))
       && (!cmd
           || self_html->current_commands_conversion_function[cmd].status
                                                     == FRS_status_ignored))
    {
      if (self->conf->DEBUG.o.integer > 0)
        {
          fprintf (stderr, "C|IGNORED %s\n", command_type.text);
        }
      goto out;
    }

  if (cmd
      && (element->type != ET_definfoenclose_command
          && element->type != ET_index_entry_command))
    {
      enum command_id data_cmd = element_builtin_data_cmd (element);
      /* C only debug message */
      /*
      if (self->conf->DEBUG.o.integer > 0)
        fprintf (stderr, "C|COMMAND: %s %s\n",
                 command_data[data_cmd].cmdname,
                 command_data[cmd].cmdname);
      */

      if (command_data[data_cmd].flags & CF_root)
        {
          self_html->current_root_command = element;
          self_html->modified_state |= HMSF_current_root;
        }

      if (self_html->current_commands_conversion_function[cmd].command_conversion)
        {
          TEXT content_formatted;
          HTML_ARGS_FORMATTED *args_formatted = 0;

          int convert_to_latex
               = html_open_command_update_context (self, data_cmd);

          if (self_html->command_open_function[cmd].command_open)
            {
              (*self_html->command_open_function[cmd].command_open)
                                (self, data_cmd, element, result);
            }

          text_init (&content_formatted);
          text_append (&content_formatted, "");

          if (element->e.c->contents.number > 0
              && (command_data[data_cmd].flags & CF_root
                  || command_data[data_cmd].flags & CF_block
                  || data_cmd == CM_tab || data_cmd == CM_headitem
                  || data_cmd == CM_item))
            {

              if (convert_to_latex)
                { /* displaymath */
                  ELEMENT *tmp = new_element (ET_NONE);
                  char *latex_content;

                  add_tree_to_build (self, tmp);
                  tmp->e.c->contents = element->e.c->contents;
                  latex_content = call_latex_convert_to_latex_math (self,
                                                                    tmp);
                  remove_tree_to_build (self, tmp);
                  tmp->e.c->contents.list = 0;
                  destroy_element (tmp);

                  if (latex_content)
                    {
                      text_append (&content_formatted, latex_content);
                      free (latex_content);
                    }
                }
              else
                {
                  size_t idx;
                  text_append (&content_formatted, "");
                  for (idx = 0; idx < element->e.c->contents.number; idx++)
                    {
                      const ELEMENT *content
                        = element->e.c->contents.list[idx];
                      char *explanation;
                      xasprintf (&explanation, "%s c[%zu]", command_type.text,
                                idx);
                      html_convert_tree_append (self, content,
                                                &content_formatted,
                                                explanation);
                      free (explanation);
                    }
                }
            }

          if ((command_data[data_cmd].flags & CF_brace
               /* could be 0 for brace commands without braces */
               && element->e.c->contents.number > 0)
              || (command_data[data_cmd].flags & CF_line
                  && command_data[data_cmd].data == LINE_line)
              || ((cmd == CM_item || cmd == CM_itemx)
                  && element->e.c->contents.number > 0
                  && element->e.c->contents.list[0]->type == ET_line_arg)
              || (cmd == CM_quotation || cmd == CM_smallquotation)
              || cmd == CM_float
              || cmd == CM_cartouche)
            {
              const ELEMENT_LIST *arguments_list;
              size_t arg_idx;

              if (element->e.c->contents.list[0]->type == ET_arguments_line)
                arguments_list
                    = &element->e.c->contents.list[0]->e.c->contents;
              else
                arguments_list = &element->e.c->contents;

              TEXT formatted_arg;

              text_init (&formatted_arg);

              args_formatted = (HTML_ARGS_FORMATTED *)
                                 malloc (sizeof (HTML_ARGS_FORMATTED));
              args_formatted->number = arguments_list->number;
              args_formatted->args = (HTML_ARG_FORMATTED *)
              malloc (args_formatted->number * sizeof (HTML_ARG_FORMATTED));
              memset (args_formatted->args, 0,
                      args_formatted->number * sizeof (HTML_ARG_FORMATTED));

              for (arg_idx = 0; arg_idx < arguments_list->number; arg_idx++)
                {
                  char *explanation;
                  unsigned long arg_flags = 0;
                  const ELEMENT *arg = arguments_list->list[arg_idx];
                  HTML_ARG_FORMATTED *arg_formatted
                     = &args_formatted->args[arg_idx];

                  if (empty_spaces_argument (arg))
                    {
                      continue;
                    }
                  /* NOTE that commands with F_AFT_none as only flag do not
                     have their flag reset to F_AFT_normal here, such that
                     their argument is not converter here */
                  if (arg_idx < MAX_COMMAND_ARGS_NR
                      /* could check html_command_args_flags[cmd].status,
                         but it is probably faster not to */
                      && html_command_args_flags[cmd].flags[arg_idx])
                    arg_flags = html_command_args_flags[cmd].flags[arg_idx];
                  else
                    arg_flags = F_AFT_normal;

                  arg_formatted->arg_tree = arg;

                  if (arg_flags & F_AFT_normal)
                    {
                      text_reset (&formatted_arg);
                      if (convert_to_latex)
                        {
                          char *latex_content
                            = call_latex_convert_to_latex_math (self,
                                                                arg);
                          if (latex_content)
                            {
                              text_append (&formatted_arg, latex_content);
                              free (latex_content);
                            }
                          else /* most probably only happens if
                                  call_latex_convert_to_latex_math fails
                                  in some way, otherwise an empty string
                                  should be returned */
                            text_append (&formatted_arg, "");
                        }
                      else
                        {
                          xasprintf (&explanation, "%s A[%zu]normal",
                                               command_type.text, arg_idx);
                          html_convert_tree_append (self, arg,
                                                    &formatted_arg,
                                                    explanation);
                          free (explanation);
                        }
                      arg_formatted->formatted[AFT_type_normal]
                        = strdup (formatted_arg.text);
                    }
                  if (arg_flags & F_AFT_monospace)
                    {
                      HTML_DOCUMENT_CONTEXT *top_document_ctx
                        = html_top_document_context (self);
                      text_reset (&formatted_arg);
                      xasprintf (&explanation, "%s A[%zu]monospace",
                                               command_type.text, arg_idx);
                      add_(integer) (&top_document_ctx->monospace, 1);

                      html_convert_tree_append (self, arg, &formatted_arg,
                                                explanation);
                      pop_(integer)
                          (&top_document_ctx->monospace);

                      free (explanation);
                      arg_formatted->formatted[AFT_type_monospace]
                       = strdup (formatted_arg.text);
                    }
                  if (arg_flags & F_AFT_string)
                    {
                      text_reset (&formatted_arg);
                      html_new_document_context (self, command_type.text,
                                                 CTXF_string, 0, 0);

                      xasprintf (&explanation, "%s A[%zu]string",
                                               command_type.text, arg_idx);
                      html_convert_tree_append (self, arg, &formatted_arg,
                                                explanation);

                      free (explanation);

                      html_pop_document_context (self);

                      arg_formatted->formatted[AFT_type_string]
                       = strdup (formatted_arg.text);
                    }
                  if (arg_flags & F_AFT_monospacestring)
                    {
                      text_reset (&formatted_arg);
                      html_new_document_context (self, command_type.text,
                                                 CTXF_string | CTXF_code,
                                                 0, 0);
                      xasprintf (&explanation, "%s A[%zu]monospacestring",
                                               command_type.text, arg_idx);
                      html_convert_tree_append (self, arg, &formatted_arg,
                                                explanation);

                      free (explanation);
                      html_pop_document_context (self);
                      arg_formatted->formatted[AFT_type_monospacestring]
                       = strdup (formatted_arg.text);
                    }
                  if (arg_flags & F_AFT_monospacetext)
                    {
                      char *text;

                      self->convert_text_options->code_state++;
                      text = convert_to_text (arg,
                                              self->convert_text_options);
                      self->convert_text_options->code_state--;

                      arg_formatted->formatted[AFT_type_monospacetext]
                        = text;
                    }
                  if (arg_flags & F_AFT_filenametext)
                    {
                      char *text;
                      self->convert_text_options->code_state++;
                      /* Always use encoded characters for file names */
                      text_set_options_encoding_if_not_ascii (self,
                                          self->convert_text_options);
                      text = convert_to_text (arg,
                                             self->convert_text_options);
                      text_reset_options_encoding
                                            (self->convert_text_options);
                      self->convert_text_options->code_state--;

                      arg_formatted->formatted[AFT_type_filenametext] = text;
                    }
                  if (arg_flags & F_AFT_url)
                    {
                      char *text;
                      self->convert_text_options->code_state++;
       /* set the encoding to UTF-8 to always have a string that is suitable
          for percent encoding. */
                      text_set_options_encoding (
                           self->convert_text_options, "utf-8");
                      text = convert_to_text (arg,
                                             self->convert_text_options);
                      text_reset_options_encoding
                                            (self->convert_text_options);
                      self->convert_text_options->code_state--;

                      arg_formatted->formatted[AFT_type_url] = text;
                    }
                  if (arg_flags & F_AFT_raw)
                    {
                      HTML_DOCUMENT_CONTEXT *top_document_ctx
                        = html_top_document_context (self);
                      text_reset (&formatted_arg);
                      top_document_ctx->raw_ctx++;
                      xasprintf (&explanation, "%s A[%zu]raw",
                                               command_type.text, arg_idx);
                      html_convert_tree_append (self, arg, &formatted_arg,
                                                explanation);

                      free (explanation);
                      top_document_ctx->raw_ctx--;
                      arg_formatted->formatted[AFT_type_raw]
                        = strdup (formatted_arg.text);
                    }
                }
              free (formatted_arg.text);
            }

          html_convert_command_update_context (self, data_cmd);

          if (element->e.c->cmd == CM_node)
            {
              self_html->current_node = element;
              self_html->modified_state |= HMSF_current_node;
            }

          /* args are formatted, now format the command itself */
          if (self_html->current_commands_conversion_function[cmd].command_conversion)
            {
       (*self_html->current_commands_conversion_function[cmd].command_conversion)
                   (self, cmd, element, args_formatted,
                    content_formatted.text, result);
            }
          else if (args_formatted)
            fprintf (stderr, "No command_conversion for %s\n",
                             command_name);
          if (args_formatted)
            destroy_args_formatted (args_formatted);

          if (cmd == CM_documentlanguage)
            {
              self->current_lang_translations =
                 set_translations_documentlanguage (
                              &converters_translation_cache,
                              self->conf->documentlanguage.o.string,
                              self->current_lang_translations,
                              TXI_CONVERT_STRINGS_NR);

              html_translate_names (self);
            }
          else if (cmd == CM_documentscript)
            {
              self->current_lang_translations =
                 set_translations_documentscript (
                              &converters_translation_cache,
                              self->conf->documentscript.o.string,
                              self->current_lang_translations,
                              TXI_CONVERT_STRINGS_NR);

              html_translate_names (self);
            }
          else if (cmd == CM_documentlanguagevariant)
            {
              STRING_LIST *language_variants
                = documentlanguagevariant_variants (element);
              self->current_lang_translations =
               set_translations_documentlanguagevariant (
                              &converters_translation_cache,
                              language_variants,
                              self->current_lang_translations,
                              TXI_CONVERT_STRINGS_NR);

              html_translate_names (self);
              destroy_strings_list (language_variants);
            }

          free (content_formatted.text);

          goto out;
        }
      else
        {
          if (self->conf->DEBUG.o.integer > 0
              || self->conf->VERBOSE.o.integer > 0)
            fprintf (stderr, "Command not converted: %s\n", command_name);
          if (command_data[data_cmd].flags & CF_root)
            {
              self_html->current_root_command = 0;
              self_html->modified_state |= HMSF_current_root;
            }
          goto out;
        }
    }
  else if (element->type)
    {
      enum element_type type = element->type;
      TEXT type_result;
      TEXT content_formatted;

      text_init (&type_result);
      text_append (&type_result, "");

      html_open_type_update_context (self, type);

      if (self_html->type_open_function[type].type_open)
        (*self_html->type_open_function[type].type_open)
               (self, type, element, &type_result);

      text_init (&content_formatted);

      if (type == ET_definfoenclose_command)
        {
          if (element->e.c->contents.number > 0)
            {
              html_convert_tree_append (self, element->e.c->contents.list[0],
                                        &content_formatted,
                                        "DEFINFOENCLOSE_ARG");
            }
        }
      else if (element->e.c->contents.number > 0
               && type != ET_untranslated_def_line_arg)
        {
          size_t content_idx;
          text_append (&content_formatted, "");
          for (content_idx = 0; content_idx < element->e.c->contents.number;
               content_idx++)
            {
              const ELEMENT *content = element->e.c->contents.list[content_idx];
              char *explanation;
              xasprintf (&explanation, "%s c[%zu]", command_type.text,
                        content_idx);
              html_convert_tree_append (self, content, &content_formatted,
                                        explanation);
              free (explanation);
            }
        }

      html_convert_type_update_context (self, type);

      if (self_html->current_types_conversion_function[type].type_conversion)
        {
          /* Normally there should not be c_only types here, since
             they should be associated with commands and we are in code
             called only if there is no command. */
          if (!self_html->current_types_conversion_function[type].type_conversion)
            {
              char *message;
              xasprintf (&message, "conversion for type %s is NULL",
                         type_data[type].name);
              fatal (message);
              free (message);
            }
          (*self_html->current_types_conversion_function[type].type_conversion)
               (self, type, element, content_formatted.text, &type_result);
        }
      else if (content_formatted.end > 0)
        {
          text_append (&type_result, content_formatted.text);
        }
      free (content_formatted.text);

      if (self->conf->DEBUG.o.integer > 0)
        {
          fprintf (stderr, "C|DO type (%s) => `%s'\n", type_data[type].name,
                           type_result.text);
        }
      ADD(type_result.text);
      free (type_result.text);

      goto out;
    }
  else if (element->e.c->contents.number > 0)
    {
      /* no type, no cmdname, but contents. */
      /* this happens inside accents, for section/node names, for @images. */
      TEXT content_formatted;

      text_init (&content_formatted);
      text_append (&content_formatted, "");

      size_t content_idx;
      for (content_idx = 0; content_idx < element->e.c->contents.number;
           content_idx++)
        {
          const ELEMENT *content = element->e.c->contents.list[content_idx];
          char *explanation;
          xasprintf (&explanation, " C[%zu]", content_idx);
          html_convert_tree_append (self, content, &content_formatted,
                                    explanation);
          free (explanation);
        }

      if (self->conf->DEBUG.o.integer > 0)
        fprintf (stderr, "C|UNNAMED HOLDER => `%s'\n", content_formatted.text);
      ADD(content_formatted.text);
      free (content_formatted.text);
      goto out;
    }
  else
    {
      if (self->conf->DEBUG.o.integer > 0)
        fprintf (stderr, "C|UNNAMED empty\n");
      if (self_html->current_types_conversion_function[0].type_conversion)
        {
          if (!self_html->current_types_conversion_function[0].type_conversion)
            fatal ("ET_NONE conversion function NULL");
          (*self_html->current_types_conversion_function[0].type_conversion)
                           (self, 0, element, "", result);
        }

      goto out;
    }
  debug_str = print_element_debug (element, 0);
  fprintf (stderr, "DEBUG: HERE!(%p:%s)\n", element, debug_str);
  free (debug_str);

 out:
  free (command_type.text);
}
#undef ADD

void
convert_output_unit (CONVERTER *self, const OUTPUT_UNIT *output_unit,
                     const char *explanation, TEXT *result)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  TEXT content_formatted;
  /* store this to be able to show only what was added in debug message */
  size_t input_result_end = result->end;
  enum output_unit_type unit_type = output_unit->unit_type;

  if (self_html->output_unit_conversion_function[unit_type].status
                                                 == FRS_status_ignored)
    {
      if (self->conf->DEBUG.o.integer > 0)
        {
          fprintf (stderr, "C|IGNORED OU %s\n",
                           output_unit_type_names[unit_type]);
        }
      return;
    }

  if (self->conf->DEBUG.o.integer > 0)
    {
      char *output_unit_txi = output_unit_texi (output_unit);
      fprintf (stderr, "C|UNIT(%s) -> ou: %s '%s'\n", explanation,
                  output_unit_type_names[unit_type],
                  output_unit_txi);
      free (output_unit_txi);
    }

  self_html->current_output_unit = output_unit;

  text_init (&content_formatted);
  text_append (&content_formatted, "");

  if (output_unit->unit_contents.number > 0)
    {
      size_t content_idx;
      for (content_idx = 0; content_idx < output_unit->unit_contents.number;
           content_idx++)
       {
         const ELEMENT *content = output_unit->unit_contents.list[content_idx];
         char *content_explanation;
         xasprintf (&content_explanation, "%s c[%zu]",
                    output_unit_type_names[unit_type], content_idx);
         html_convert_tree_append (self, content, &content_formatted,
                                   content_explanation);
         free (content_explanation);
       }
    }

  if (self_html->output_unit_conversion_function[unit_type].status)
    {
  (*(self_html->output_unit_conversion_function[unit_type].output_unit_conversion))
                             (self, unit_type, output_unit,
                              content_formatted.text, result);
    }
   else
    {
      text_append (result, content_formatted.text);
    }

  free (content_formatted.text);

  self_html->current_output_unit = 0;

  if (self->conf->DEBUG.o.integer > 0)
    fprintf (stderr, "C|DOUNIT (%s) => `%s'\n",
                     output_unit_type_names[unit_type],
                     result->text + input_result_end);
}

/* wrapper to avoid code repetition and use similar functions as in perl */
void
convert_convert_output_unit_internal (CONVERTER *self, TEXT *result,
                                      const OUTPUT_UNIT *output_unit,
                                      size_t unit_nr,
                                      const char *debug_str,
                                      const char *explanation_str)
{
  char *explanation;

  if (self->conf->DEBUG.o.integer > 0)
    fprintf (stderr, "\n%s %zu\n", debug_str, unit_nr);

  xasprintf (&explanation, "%s %zu", explanation_str, unit_nr);
  convert_output_unit (self, output_unit, explanation, result);
  free (explanation);
}

TEXT
html_convert_convert (CONVERTER *self, const ELEMENT *root)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  TEXT result;
  size_t unit_nr = 0;
  size_t i;

  const OUTPUT_UNIT_LIST *output_units = retrieve_output_units
    (self->document, self_html->output_units_descriptors[OUDT_units]);
  const OUTPUT_UNIT_LIST *special_units = retrieve_output_units
    (self->document, self_html->output_units_descriptors[OUDT_special_units]);

  text_init (&result);

  self_html->current_filename.filename = "";
  self_html->current_filename.file_number = 1;

  for (i = 0; i < output_units->number; i++)
    {
      const OUTPUT_UNIT *output_unit = output_units->list[i];
      convert_convert_output_unit_internal (self, &result, output_unit,
                            unit_nr, "C|UNIT", "convert unit");
      unit_nr++;
    }
  if (special_units && special_units->number)
    {
      for (i = 0; i < special_units->number; i++)
        {
          const OUTPUT_UNIT *special_unit = special_units->list[i];
          convert_convert_output_unit_internal (self, &result,
                    special_unit, unit_nr, "C|UNIT", "convert unit");
          unit_nr++;
        }
    }

  memset (&self_html->current_filename, 0, sizeof (FILE_NUMBER_NAME));

  return result;
}

int
convert_output_output_unit_internal (CONVERTER *self,
                                     const ENCODING_CONVERSION *conversion,
                                     TEXT *text,
                                     const OUTPUT_UNIT *output_unit,
                                     size_t unit_nr)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  FILE_NAME_PATH_COUNTER *unit_file = 0;
  size_t file_index;
  int empty_body = 0; /* set if body is empty and it is a special unit */
  char *output_unit_filename = output_unit->unit_filename;

  self_html->current_filename.filename = output_unit_filename;

  text_reset (text);
  text_append (text, "");

  if (output_unit->unit_type == OU_special_unit)
    {
      char *debug_str;
      const char *special_unit_variety = output_unit->special_unit_variety;

      file_index = self_html->special_unit_file_indices[output_unit->index];
      self_html->current_filename.file_number = file_index +1;
      unit_file = &self->output_unit_files.list[file_index];

      xasprintf (&debug_str, "C|UNIT SPECIAL %s", special_unit_variety);
      convert_convert_output_unit_internal (self, text,
                    output_unit, unit_nr, debug_str, "output s-unit");
      free (debug_str);

      if (!strcmp (text->text, ""))
        empty_body = 1;
    }
  else
    {
      file_index = self->output_unit_file_indices[output_unit->index];
      self_html->current_filename.file_number = file_index +1;
      unit_file = &self->output_unit_files.list[file_index];

      convert_convert_output_unit_internal (self, text, output_unit,
                                            unit_nr, "C|UNIT", "output unit");
    }

  unit_file->counter--;

      /* register the output but do not print anything. Printing
         only when file_counters reach 0, to be sure that all the
         elements have been converted before headers are done. */

  if (!empty_body)
    {
      if (!unit_file->first_unit)
        {
          unit_file->first_unit = output_unit;
          text_init (&unit_file->body);
        }
      text_append (&unit_file->body, text->text);
    }
  else
    {
      if (!unit_file->first_unit
          || unit_file->body.end == 0)
        {
          return 1;
        }
    }

  if (unit_file->counter == 0)
    {
      const OUTPUT_UNIT *file_output_unit = unit_file->first_unit;
      char *file_end;
      char *file_beginning;
      const char *out_filepath = unit_file->filepath;
      char *path_encoding;
      char *open_error_message;
      int overwritten_file;

  /* cast to remove const since the argument cannot
     be const even though the string is not modified */
      char *encoded_out_filepath
            = converter_encoded_output_file_name (self->conf,
                                           &self->document->global_info,
                                   (char *)out_filepath, &path_encoding, 0);
      /* overwritten_file being set cannot happen */
      FILE *file_fh = output_files_open_out (&self->output_files_information,
                               encoded_out_filepath, &open_error_message,
                               &overwritten_file, 0);
      free (path_encoding);
      if (!file_fh)
        {
          message_list_document_error (&self->error_messages, self->conf, 0,
                             "could not open %s for writing: %s",
                             out_filepath, open_error_message);
          free (open_error_message);
          free (encoded_out_filepath);
          return 0;
        }

      /* do end file first in case it requires some CSS */
      file_end = html_format_end_file (self, output_unit_filename,
                                       output_unit);
      file_beginning = html_format_begin_file (self, output_unit_filename,
                                               file_output_unit);
      text_reset (text);
      if (file_beginning)
        {
          text_append (text, file_beginning);
          free (file_beginning);
        }
      if (unit_file->body.end)
        {
          text_append (text, unit_file->body.text);
        }
      if (file_end)
        {
          text_append (text, file_end);
          free (file_end);
        }
      if (text->end)
        {
          char *result;
          size_t res_len;
          size_t write_len;

          if (conversion)
            {
              TEXT conv_result = encode_with_iconv (conversion->iconv,
                                          text->text, text->end,
                                          0, ieh_error, 0);
              result = conv_result.text;
              res_len = conv_result.end;
            }
          else
            {
              result = text->text;
              res_len = text->end;
            }
          write_len = fwrite (result, sizeof (char), res_len, file_fh);
          if (conversion)
            free (result);
          if (write_len != res_len)
            { /* register error message instead? */
              fprintf (stderr, "ERROR: write to %s failed (%zu/%zu)\n",
                       encoded_out_filepath, write_len, res_len);
              free (encoded_out_filepath);
              return 0;
            }
        }
      /* Do not close STDOUT now such that the file descriptor is not reused
         by open, which uses the lowest-numbered file descriptor not open,
         for another filehandle.  Closing STDOUT is handled by the caller. */
      if (strcmp (out_filepath, "-"))
        {
          output_files_register_closed (&self->output_files_information,
                                        encoded_out_filepath);
          if (fclose (file_fh))
            {
              message_list_document_error (&self->error_messages, self->conf, 0,
                             "error on closing %s: %s",
                             out_filepath, strerror (errno));
              free (encoded_out_filepath);
              return 0;
            }
        }
      free (encoded_out_filepath);
    }
  return 1;
}

TEXT
html_convert_output (CONVERTER *self, const ELEMENT *root,
                     const char *output_file, const char *destination_directory,
                     const char *output_filename, const char *document_name)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  int status = 1;
  TEXT result;
  TEXT text; /* reused for all the output units */

  const OUTPUT_UNIT_LIST *output_units = retrieve_output_units
    (self->document, self_html->output_units_descriptors[OUDT_units]);
  const OUTPUT_UNIT_LIST *special_units = retrieve_output_units
    (self->document, self_html->output_units_descriptors[OUDT_special_units]);
  char *encoded_destination_directory;
  char *dir_encoding;
  int succeeded;

  /* cast to remove const since the argument cannot
     be const even though the string is not modified */
  encoded_destination_directory
         = converter_encoded_output_file_name (self->conf,
                                            &self->document->global_info,
                                           (char *)destination_directory,
                                                       &dir_encoding, 0);
  free (dir_encoding);

  succeeded = create_destination_directory (self,
                                     encoded_destination_directory,
                                           destination_directory);

  free (encoded_destination_directory);

  text_init (&result);

  if (!succeeded)
    return result;

  text_init (&text);
  text_append (&result, "");

  if (!strlen (output_file))
    {
      char *file_end;
      char *file_beginning;
      size_t unit_nr = 0;
      size_t i;

      self_html->current_filename.filename = output_filename;
      self_html->current_filename.file_number = 1;

      text_append (&text, "");

      for (i = 0; i < output_units->number; i++)
        {
          const OUTPUT_UNIT *output_unit = output_units->list[i];
          convert_convert_output_unit_internal (self, &text, output_unit,
                         unit_nr, "C|UNIT NO-PAGE", "no-page output unit");
          unit_nr++;
        }
      if (special_units && special_units->number)
        {
          for (i = 0; i < special_units->number; i++)
            {
              const OUTPUT_UNIT *special_unit = special_units->list[i];
              convert_convert_output_unit_internal (self, &text,
                             special_unit, unit_nr, "C|UNIT NO-PAGE",
                             "no-page output unit");
              unit_nr++;
            }
        }

      /* do end file first, in case it needs some CSS */
      file_end = html_format_end_file (self, output_filename, 0);
      file_beginning = html_format_begin_file (self, output_filename, 0);
      if (file_beginning)
        {
          text_append (&result, file_beginning);
          free (file_beginning);
        }
      text_append (&result, text.text);
      if (file_end)
        {
          text_append (&result, file_end);
          free (file_end);
        }
    }
  else
    {
      size_t unit_nr = 0;
      size_t i;
      const ENCODING_CONVERSION *conversion = 0;

      if (self->conf->OUTPUT_ENCODING_NAME.o.string
          && strcmp (self->conf->OUTPUT_ENCODING_NAME.o.string, "utf-8"))
        {
          conversion
             = get_encoding_conversion (
                              self->conf->OUTPUT_ENCODING_NAME.o.string,
                                              &output_conversions);
        }

      if (self->conf->DEBUG.o.integer > 0)
        fprintf (stderr, "C|DO Units with filenames\n");

      for (i = 0; i < output_units->number; i++)
        {
          const OUTPUT_UNIT *output_unit = output_units->list[i];
          status = convert_output_output_unit_internal (self, conversion,
                                               &text, output_unit, unit_nr);
          if (!status)
            {
              /*
              fprintf (stderr, "   FAILED U(%d %d): %s\n", i, unit_nr,
                       output_unit_texi (output_unit));
               */
              goto out;
            }
          unit_nr++;
        }
      if (special_units && special_units->number)
        {
          for (i = 0; i < special_units->number; i++)
            {
              const OUTPUT_UNIT *special_unit = special_units->list[i];
              status = convert_output_output_unit_internal (self, conversion,
                                                &text, special_unit, unit_nr);
              if (!status)
                goto out;
              unit_nr++;
            }
        }
    }

 out:
  memset (&self_html->current_filename, 0, sizeof (FILE_NUMBER_NAME));
  free (text.text);

  if (!status)
    text_destroy (&result);

  return result;
}



static void
clear_type_explanations (EXPLAINED_COMMAND_TYPE_LIST *type_explanations)
{
  if (type_explanations->number > 0)
    {
      size_t i;
      for (i = 0; i < type_explanations->number; i++)
        {
          EXPLAINED_COMMAND_TYPE *type_explanation
            = &type_explanations->list[i];
          free (type_explanation->type);
          free (type_explanation->explanation);
        }
      type_explanations->number = 0;
    }
}

void
html_reset_shared_conversion_state (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t i;
  HTML_SHARED_CONVERSION_STATE *shared_conversion_state
    = &self_html->shared_conversion_state;

  clear_type_explanations (&shared_conversion_state->explained_commands);

  free (shared_conversion_state->footnote_id_numbers);
  shared_conversion_state->footnote_id_numbers = 0;

  free (shared_conversion_state->formatted_listoffloats_nr);
  shared_conversion_state->formatted_listoffloats_nr = 0;

  /* formatted_index_entries may not be initialized if there was an error
     early and prepare_conversion_units_targets was never called */
  if (self_html->shared_conversion_state.formatted_index_entries)
    {
      for (i = 0; i < self->sorted_index_names.number; i++)
        {
          free (self_html->shared_conversion_state.formatted_index_entries[i]);
        }
      free (self_html->shared_conversion_state.formatted_index_entries);
      self_html->shared_conversion_state.formatted_index_entries = 0;
    }

  /* cannot happen with default Perl code, but could happen with
     user-defined code */
  if (shared_conversion_state->elements_authors.number > 0)
    {
      fprintf (stderr,
              "BUG: shared_conversion_state->elements_authors.number: %zu\n",
               shared_conversion_state->elements_authors.number);
      for (i = 0; i < shared_conversion_state->elements_authors.number; i++)
        {
          destroy_element_reference_stack (
            shared_conversion_state->elements_authors.list[i]);
        }
      shared_conversion_state->elements_authors.number = 0;
    }

  shared_conversion_state->in_skipped_node_top = 0;
  shared_conversion_state->footnote_number = 0;
  shared_conversion_state->html_menu_entry_index = 0;
}

/* This function cleans up the conversion state that is relevant during
   conversion. */
void
html_conversion_finalization (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t i;
  for (i = 0; i < self_html->html_files_information.number; i++)
    {
      free (self_html->html_files_information.list[i].info);
    }
  free (self_html->html_files_information.list);
  self_html->html_files_information.list = 0;
  self_html->html_files_information.number = 0;

  html_reset_translated_special_unit_info_tree (self);

  html_reset_shared_conversion_state (self);

  /* should not be possible with default code, as
     close_registered_sections_level(..., 0)
     is called at the end of processing or at the end of each file.
     However, it could happen if the conversion functions are user
     defined.
   */
  for (i = 0; i < self_html->pending_closes.number; i++)
    {
      STRING_LIST *file_pending_closes = &self_html->pending_closes.list[i];
      if (file_pending_closes->number > 0)
        {
          FILE_NAME_PATH_COUNTER *file_counter
            = &self->output_unit_files.list[i];
          const char *page_name = file_counter->filename;

          message_list_document_warn (&self->error_messages, self->conf, 0,
             "%s: %zu registered opened sections not closed",
              page_name, file_pending_closes->number);
          clear_strings_list (file_pending_closes);
        }
    }

  if (self_html->pending_inline_content.number > 0)
    {
      char *inline_content = html_get_pending_formatted_inline_content (self);
      message_list_document_warn (&self->error_messages, self->conf, 0,
         "%zu registered inline contents: %s",
           self_html->pending_inline_content.number, inline_content);
      free (inline_content);
    }

  for (i = 0; i < self_html->associated_inline_content.number; i++)
    {
      HTML_ASSOCIATED_INLINE_CONTENT *associated_content
        = &self_html->associated_inline_content.list[i];
      if (associated_content->inline_content.space > 0)
        {
          char *inline_content = associated_content->inline_content.text;
          if (associated_content->element)
            {
              char *element_str
                = print_element_debug (associated_content->element, 0);
              message_list_document_warn (&self->error_messages, self->conf, 0,
                "left inline content associated to %s: '%s'", element_str,
                inline_content);
              free (element_str);
            }
          else if (associated_content->hv)
            {
              message_list_document_warn (&self->error_messages, self->conf, 0,
                "left inline content of %p: '%s'", associated_content->hv,
                inline_content);
            }
          else
            message_list_document_warn (&self->error_messages, self->conf, 0,
               "left inline content associated: '%s'", inline_content);
          free (associated_content->inline_content.text);
        }
    }
  self_html->associated_inline_content.number = 0;

  if (self_html->pending_footnotes.number > 0)
    {
      message_list_document_warn (&self->error_messages, self->conf, 0,
                                  "%zu pending footnotes",
                                  self_html->pending_footnotes.number);
      html_clear_pending_footnotes (&self_html->pending_footnotes);
    }

  html_pop_document_context (self);

  /* could change to 0 in releases? */
  if (1)
    {
      if (self_html->html_document_context.number > 0)
        fprintf (stderr, "BUG: document context top > 0: %zu\n",
                         self_html->html_document_context.number);
      if (self_html->document_global_context_counter)
        fprintf (stderr, "BUG: document_global_context_counter: %d\n",
                         self_html->document_global_context_counter);
      if (self_html->multiple_pass.number > 0)
        fprintf (stderr, "BUG: multiple_conversions: %zu\n",
                         self_html->multiple_pass.number);
    }
}

void
html_check_transfer_state_finalization (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  /* could change to 0 in releases? */
  if (1)
    {
      /* check that all the state changes have been transmitted */
      /*
      if (self_html->tree_to_build.number > 0)
        fprintf (stderr, "BUG: tree_to_build: %zu\n",
                         self_html->tree_to_build.number);
       */
      if (self_html->no_arg_formatted_cmd_translated.number)
        fprintf (stderr, "BUG: no_arg_formatted_cmd_translated: %zu\n",
                         self_html->no_arg_formatted_cmd_translated.number);
    }
}



/* code run after the conversion when called as output */

/* return 0 on success, -1 on write or close error, -2 if file_fh is 0,
   which should mean a failure to open */
/* It should be made sure by the caller that the closed FILE_FH cannot
   be STDOUT.  If it becomes possible, an argument to avoid closing the
   file descriptor should be added */
static int
file_error_or_write_close (CONVERTER *self, const char *out_filepath,
                           const char *encoded_out_filepath,
                           FILE *file_fh,
                           const ENCODING_CONVERSION *conversion,
                           char *page,
                           const char *open_error_message)
{
  if (!file_fh)
    {
      message_list_document_error (&self->error_messages,
                self->conf, 0,
                "could not open %s for writing: %s",
                 out_filepath, open_error_message);
      return -2;
    }
  else
    {
      char *result;
      size_t res_len;
      size_t write_len;
      size_t page_len = strlen (page);

      if (conversion)
        {
          TEXT conv_result = encode_with_iconv (conversion->iconv,
                                      page, page_len, 0, ieh_error, 0);
          result = conv_result.text;
          res_len = conv_result.end;
        }
      else
        {
          result = page;
          res_len = page_len;
        }
      write_len = fwrite (result, sizeof (char),
                          res_len, file_fh);
      if (conversion)
        free (result);
      if (write_len != res_len)
        { /* register error message instead? */
          fprintf (stderr,
                   "ERROR: write to %s failed (%zu/%zu)\n",
                   encoded_out_filepath, write_len, res_len);
          return -1;
        }
      output_files_register_closed
                         (&self->output_files_information,
                          encoded_out_filepath);
      if (fclose (file_fh))
        {
          message_list_document_error (
             &self->error_messages, self->conf, 0,
             "error on closing %s: %s",
             out_filepath, strerror (errno));
          return -1;
        }
    }
  return 0;
}

static void
do_jslicenses_file (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  const char *destination_directory = self_html->destination_directory;
  const char *setting = self->conf->JS_WEBLABELS.o.string;
  const char *path = self->conf->JS_WEBLABELS_FILE.o.string;
  char *formatted_jlicenses;
  int path_not_ok = 0;
  char *license_file;
  char *path_encoding;
  char *open_error_message;
  int overwritten_file;
  char *encoded_out_filepath;
  FILE *file_fh;
  const ENCODING_CONVERSION *conversion = 0;

  /* Possible settings:
    'generate' - create file at JS_WEBLABELS_FILE
    'reference' - reference file at JS_WEBLABELS_FILE but do not create it
    'omit' - do nothing */
  if (!setting || strcmp (setting, "generate") || !path || !strlen (path))
    return;

  if (file_name_is_absolute (path) || !strcmp (path, "-"))
    path_not_ok = 1;
  else
    {
      const char *p = path;
      while (isascii_alpha (*p))
        p++;
      if (*p == ':')
        path_not_ok = 1;
    }

  if (path_not_ok)
    {
      message_list_document_warn (&self->error_messages, self->conf, 0,
   "cannot use absolute path or URL `%s' for JS_WEBLABELS_FILE when generating web labels file",
                                  path);
      return;
    }

  formatted_jlicenses
    = html_default_format_jslicense_file (self, &self_html->jslicenses);

  if (destination_directory && strlen (destination_directory))
    xasprintf (&license_file, "%s/%s", destination_directory, path);
  else
    license_file = strdup (path);

  encoded_out_filepath
      = converter_encoded_output_file_name (self->conf,
                            &self->document->global_info, license_file,
                                                       &path_encoding, 0);
  file_fh = output_files_open_out (&self->output_files_information,
                               encoded_out_filepath, &open_error_message,
                               &overwritten_file, 0);
  free (path_encoding);
  if (overwritten_file)
    {
      message_list_document_warn (&self->error_messages, self->conf, 0,
                           "overwriting output file with js licences: %s",
                                  license_file);
    }

  if (file_fh)
    {
      if (self->conf->OUTPUT_ENCODING_NAME.o.string
          && strcmp (self->conf->OUTPUT_ENCODING_NAME.o.string, "utf-8"))
        {
          conversion
             = get_encoding_conversion (
                              self->conf->OUTPUT_ENCODING_NAME.o.string,
                                              &output_conversions);
        }
    }

  file_error_or_write_close (self, license_file,
                             encoded_out_filepath, file_fh,
                             conversion, formatted_jlicenses,
                             open_error_message);
  free (open_error_message);
  free (encoded_out_filepath);
  free (license_file);
  free (formatted_jlicenses);
}

static const char *js_files[4] = {"info.js", "modernizr.js", "info.css", 0};

void
html_do_js_files (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  const char *destination_directory = self_html->destination_directory;

  if (self->conf->INFO_JS_DIR.o.string)
    {
      const char *info_js_dir = self->conf->INFO_JS_DIR.o.string;
      char *jsdir;
      char *dir_encoding;
      int succeeded;
      char *encoded_jsdir;

      if (destination_directory && strlen (destination_directory))
        {
          xasprintf (&jsdir, "%s/%s", destination_directory, info_js_dir);
        }
      else
        jsdir = strdup (info_js_dir);

      encoded_jsdir = converter_encoded_output_file_name (self->conf,
                                            &self->document->global_info,
                                                jsdir, &dir_encoding, 0);

      free (dir_encoding);

      succeeded = create_destination_directory (self, encoded_jsdir, jsdir);

      if (succeeded)
        {
          int i;
          if (self->conf->TEST.o.integer <= 0)
            {
              /* txi_paths_info paths are byte strings */
              char *jssrcdir;
              if (!txi_paths_info.texinfo_uninstalled)
                {
                  xasprintf (&jssrcdir, "%s/%s",
                        txi_paths_info.p.installed.converter_datadir,
                             "js");
                }
              else
                {
                  if (txi_paths_info.p.uninstalled.t2a_srcdir)
                    xasprintf (&jssrcdir, "%s/../%s",
                               txi_paths_info.p.uninstalled.t2a_srcdir,
                               "js");
                  else
                    jssrcdir = strdup ("js");
                }
              for (i = 0; js_files[i]; i++)
                {
                  char *from, *to;
                  char *from_file_name, *to_file_name;

                  xasprintf (&from, "%s/%s", jssrcdir, js_files[i]);
                  xasprintf (&to, "%s/%s", encoded_jsdir, js_files[i]);

                  xasprintf (&to_file_name, "%s/%s", jsdir, js_files[i]);

                  const char *encoding
                    = self->conf->COMMAND_LINE_ENCODING.o.string;
                  if (encoding)
                    {
                      int status;
                      char *decoded_jssrcdir;
                      decoded_jssrcdir = decode_string (jssrcdir,
                                                    encoding, &status, 0);
                      xasprintf (&from_file_name,
                                 "%s/%s", decoded_jssrcdir, js_files[i]);
                      free (decoded_jssrcdir);
                    }
                  else
                    {
                      from_file_name = strdup (from);
                    }

                  copy_file_to (self, from, to, from_file_name, to_file_name);

                  free (to);
                  free (from);
                  free (to_file_name);
                  free (from_file_name);
                }
              free (jssrcdir);
            }
          else
            {
              /* create empty files for tests to keep results stable. */
              for (i = 0; js_files[i]; i++)
                {
                  char *to;
                  FILE *FH;

                  xasprintf (&to, "%s/%s", encoded_jsdir, js_files[i]);
                  FH = fopen (to, "w");
                  if (!FH)
                    {
                      char *to_file_name;
                      xasprintf (&to_file_name, "%s/%s", jsdir, js_files[i]);
                      message_list_document_error (&self->error_messages,
                                  self->conf, 0,
                                  "error on creating empty %s: %s",
                                  to_file_name, strerror (errno));
                      free (to_file_name);
                    }
                  else
                    {
                      if (fclose (FH) == EOF)
                        {
                          char *to_file_name;
                          xasprintf (&to_file_name, "%s/%s", jsdir, js_files[i]);
                          message_list_document_error (&self->error_messages,
                                  self->conf, 0,
                                  "error on closing empty %s: %s",
                                  to_file_name, strerror (errno));
                          free (to_file_name);
                        }
                    }
                  free (to);
                }
            }
        }
      free (encoded_jsdir);
      free (jsdir);
    }

  if (self_html->jslicenses.number > 0)
    do_jslicenses_file (self);
}

void
html_set_file_source_info (FILE_SOURCE_INFO *file_source_info,
                           const char *file_info_type,
                           const char *file_info_name,
                           const ELEMENT *file_info_element,
                           const char *filepath)
{
  file_source_info->type = file_info_type;
  file_source_info->name = file_info_name;
  file_source_info->element = file_info_element;
  if (filepath)
    file_source_info->path = strdup (filepath);
  else
    file_source_info->path = 0;
}

FILE_SOURCE_INFO *
html_add_to_files_source_info (FILE_SOURCE_INFO_LIST *files_source_info,
                              const char *filename,
                              const char *file_info_type,
                              const char *file_info_name,
                              const ELEMENT *file_info_element,
                              const char *filepath)
{
  FILE_SOURCE_INFO *new_file_source_info;
  if (files_source_info->number == files_source_info->space)
    {
      files_source_info->list = realloc (files_source_info->list,
               (files_source_info->space += 5) * sizeof (FILE_SOURCE_INFO));
      if (!files_source_info->list)
       fatal ("realloc failed");
    }

  new_file_source_info =
   &files_source_info->list[files_source_info->number];

  new_file_source_info->filename = strdup (filename);
  html_set_file_source_info (new_file_source_info, file_info_type,
                             file_info_name, file_info_element, filepath);

  files_source_info->number++;

  return new_file_source_info;
}

FILE_SOURCE_INFO *
html_find_file_source_info (FILE_SOURCE_INFO_LIST *files_source_info,
                            const char *filename)
{
  size_t i;
  for (i = 0; i < files_source_info->number; i++)
    {
      FILE_SOURCE_INFO *file_source_info = &files_source_info->list[i];
      if (!strcmp (file_source_info->filename, filename))
        return file_source_info;
    }
  return 0;
}

/* return string to be freed by the caller */
char *
html_prepare_node_redirection_page (CONVERTER *self, const ELEMENT *element,
                                    const char *filename)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  char *result;

  self_html->current_filename.filename = filename;
  self_html->current_filename.file_number = 0;

  result = html_format_node_redirection_page (self, element, filename);

  self_html->current_filename.filename = 0;

  return result;
}

int
html_node_redirections (CONVERTER *self,
            const char *output_file, const char *destination_directory)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  FILE_SOURCE_INFO_LIST *files_source_info = &self_html->files_source_info;
  int redirection_files_done = 0;
  if (identifiers_target_number (&self->document->identifiers_target)
      && self->conf->NODE_FILES.o.integer > 0
      && strlen (output_file) > 0)
    {
      const LABEL_LIST *label_targets = &self->document->labels_list;
      size_t i;
      const ENCODING_CONVERSION *conversion = 0;
      STRING_LIST redirection_files;
      const char *added_translit_extension = 0;
      int add_translit_redirection = 0;

      memset (&redirection_files, 0, sizeof (STRING_LIST));

      if (self->conf->TRANSLITERATE_FILE_NAMES.o.integer > 0)
        {
          add_translit_redirection = 1;
          added_translit_extension = "";
          if (self->conf->EXTENSION.o.string)
            added_translit_extension = self->conf->EXTENSION.o.string;
        }

      if (self->conf->OUTPUT_ENCODING_NAME.o.string
          && strcmp (self->conf->OUTPUT_ENCODING_NAME.o.string, "utf-8"))
        {
          conversion
             = get_encoding_conversion (
                     self->conf->OUTPUT_ENCODING_NAME.o.string,
                                              &output_conversions);
        }

      for (i = 0; i < label_targets->number; i++)
        {
          const FILE_NUMBER_NAME *target_filename;
          const ELEMENT *label_element;
          const ELEMENT *target_element;
          char *node_filename;
          LABEL *label = &label_targets->list[i];
          const char *normalized;
          char *node_redirection_filename;
          size_t file_idx;
          const FILE_NAME_PATH_COUNTER *output_unit_file;
          size_t j;

          if (!label->identifier || label->reference)
            continue;

          target_element = label->element;
          label_element = get_label_element (target_element);

          /* filename may not be defined in case of an @anchor or similar in
             @titlepage, and @titlepage is not used. */
          target_filename = html_command_filename (self, target_element);
          if (!target_filename || !target_filename->filename)
            continue;

     /* NOTE 'node_filename' is not used for Top, TOP_NODE_FILE_TARGET
        is.  The other manual must use the same convention to get it
        right.  We do not do 'node_filename' as a redirection file
        either. */
          normalized = lookup_extra_string (target_element, AI_key_identifier);
          if (normalized && !strcmp (normalized, "Top")
              && self->conf->TOP_NODE_FILE_TARGET.o.string)
            {
              node_filename = strdup (self->conf->TOP_NODE_FILE_TARGET.o.string);
            }
          else
            {
              TARGET_FILENAME *target_filename
                = html_standard_label_id_file (self, normalized, label_element,
                              self->conf->EXTERNAL_CROSSREF_EXTENSION.o.string,
            html_default_options->options->EXTENSION.o.string);
              free (target_filename->target);
              xasprintf (&node_filename, "%s.%s", target_filename->filename,
                                         target_filename->extension);
              free (target_filename->filename);
              free (target_filename);
            }

          file_idx = register_normalize_case_filename (self, node_filename);
          output_unit_file = &self->output_unit_files.list[file_idx];
          node_redirection_filename = output_unit_file->filename;

          if (strcmp (target_filename->filename, node_filename))
            {
              int redirection_filename_total_count
                = output_unit_file->elements_in_file_count;

              FILE_SOURCE_INFO *file_source_info
                 = html_find_file_source_info (files_source_info,
                                               node_redirection_filename);
              if (file_source_info
               /* first condition finds conflict with tree elements */
                  && (redirection_filename_total_count > 0
                      || !strcmp (file_source_info->type, "redirection")))
                {
                  const char *file_info_type = file_source_info->type;
                  char *label_texi
                    = convert_contents_to_texinfo (label_element);
                  message_list_command_warn (&self->error_messages,
                             (self->conf && self->conf->DEBUG.o.integer > 0),
                              target_element, 0,
                             "@%s `%s' file %s for redirection exists",
                               element_command_name (target_element),
                               label_texi, node_redirection_filename);
                  free (label_texi);

                  if (!strcmp (file_info_type, "special_file")
                      || !strcmp (file_info_type, "stand_in_file"))
                    {
                      const char *name = file_source_info->name;
                      if (!strcmp (name, "non_split"))
             /* This cannot actually happen, as the @anchor/@node/@float
                with potentially conflicting name will also be in the
                non-split output document and therefore does not need
                a redirection. */
                        message_list_document_warn (&self->error_messages,
                          self->conf, 1, "conflict with whole document file");
                      else if (!strcmp (name, "Top"))
                        message_list_document_warn (&self->error_messages,
                          self->conf, 1, "conflict with Top file");
                      else if (!strcmp (name, "user_defined"))
                        message_list_document_warn (&self->error_messages,
                          self->conf, 1, "conflict with user-defined file");
                      else if (!strcmp (name, "unknown_node"))
                        message_list_document_warn (&self->error_messages,
                          self->conf, 1, "conflict with unknown node file");
                      else if (!strcmp (name, "unknown"))
                        message_list_document_warn (&self->error_messages,
                            self->conf, 1,
                                "conflict with file without known source");
                    }
                  else if (!strcmp (file_info_type, "node"))
                    {
                      const ELEMENT *conflicting_node
                        = file_source_info->element;
                      const ELEMENT *label_element
                        = get_label_element (conflicting_node);
                      char *node_texi
                        = convert_contents_to_texinfo (label_element);
                      pmessage_list_command_warn (&self->error_messages,
                             (self->conf && self->conf->DEBUG.o.integer > 0),
                             conflicting_node, 1,
                "conflict of redirection file with file based on node name",
                             "conflict with @%s `%s' file",
                               element_command_name (conflicting_node),
                               node_texi);
                      free (node_texi);
                    }
                  else if (!strcmp (file_info_type, "redirection"))
                    {
                      const ELEMENT *conflicting_node
                        = file_source_info->element;
                      const ELEMENT *label_element
                        = get_label_element (conflicting_node);
                      char *node_texi
                        = convert_contents_to_texinfo (label_element);
                      message_list_command_warn (&self->error_messages,
                             (self->conf && self->conf->DEBUG.o.integer > 0),
                                        conflicting_node, 1,
                             "conflict with @%s `%s' redirection file",
                               element_command_name (conflicting_node),
                               node_texi);
                      free (node_texi);
                    }
                  else if (!strcmp (file_info_type, "section"))
                    {
                      const ELEMENT *conflicting_section
                        = file_source_info->element;
                      /* arguments_line type element */
                      const ELEMENT *arguments_line
                        = conflicting_section->e.c->contents.list[0];
                      const ELEMENT *line_arg
                        = arguments_line->e.c->contents.list[0];
                      char *section_texi
                        = convert_contents_to_texinfo (line_arg);
                     pmessage_list_command_warn (&self->error_messages,
                             (self->conf && self->conf->DEBUG.o.integer > 0),
                                    conflicting_section, 1,
           "conflict of redirection file with file based on section name",
                             "conflict with @%s `%s' file",
                             element_command_name (conflicting_section),
                             section_texi);
                      free (section_texi);
                    }
                  else if (!strcmp (file_info_type, "special_unit"))
                    {
                      const ELEMENT *unit_command
                        = file_source_info->element;
                      const OUTPUT_UNIT *special_unit
                        = unit_command->e.c->associated_unit;
                      message_list_document_warn (&self->error_messages,
                                    self->conf, 1,
                             "conflict with %s special element",
                             special_unit->special_unit_variety);
                    }
                }
              else
                {
                  add_string (&redirection_files, node_redirection_filename);
                }
            }

          if (add_translit_redirection && strcmp (normalized, "Top"))
            {
              /* based on converter.c node_information_filename */
              char *translit_filename;
              char *translit_basename
               = normalize_transliterate_texinfo_contents (label_element);

              id_to_filename (self, &translit_basename);

              if (strlen(added_translit_extension))
                xasprintf (&translit_filename, "%s.%s",
                           translit_basename, added_translit_extension);
              else
                translit_filename = strdup (translit_basename);
              free (translit_basename);

              if (strcmp (translit_filename, node_redirection_filename)
                  && strcmp (translit_filename, target_filename->filename))
                {
                  size_t file_idx
                   = register_normalize_case_filename (self, translit_filename);
                  const FILE_NAME_PATH_COUNTER *output_unit_file
                    = &self->output_unit_files.list[file_idx];
                  char *translit_redirection_filename
                    = output_unit_file->filename;
                  int redirection_filename_total_count
                    = output_unit_file->elements_in_file_count;

                  FILE_SOURCE_INFO *file_source_info
                     = html_find_file_source_info (files_source_info,
                                               translit_redirection_filename);
                  if (!(file_source_info
                   /* first condition finds conflict with tree elements */
                        && (redirection_filename_total_count > 0
                            || !strcmp (file_source_info->type,
                                        "redirection"))))
                    {
                      add_string (&redirection_files,
                                  translit_redirection_filename);
                    }
                }
              free (translit_filename);
            }

          call_file_id_setting_redirection_file_names (self, target_element,
                       target_filename->filename, node_redirection_filename,
                               &redirection_files);

          free (node_filename);

          for (j = 0; j < redirection_files.number; j++)
            {
              char *redirection_page;
              char *out_filepath;
              char *path_encoding;
              char *open_error_message;
              int overwritten_file;
              int status;
              char *redirection_filename = redirection_files.list[j];

              html_add_to_files_source_info (files_source_info,
                             redirection_filename, "redirection", 0,
                                                   target_element, 0);

              redirection_page
                = html_prepare_node_redirection_page (self, target_element,
                                                     redirection_filename);
              if (destination_directory && strlen (destination_directory))
                {
                  xasprintf (&out_filepath, "%s/%s", destination_directory,
                             redirection_filename);
                }
              else
                out_filepath = strdup (redirection_filename);

              char *encoded_out_filepath
                 = converter_encoded_output_file_name (self->conf,
                               &self->document->global_info, out_filepath,
                                                       &path_encoding, 0);
              /* overwritten_file being set cannot happen in the default
                 case, but could with redirection files set by the user */
              FILE *file_fh
                = output_files_open_out (&self->output_files_information,
                           encoded_out_filepath, &open_error_message,
                           &overwritten_file, 0);
              free (path_encoding);

              status
                = file_error_or_write_close (self, out_filepath,
                                     encoded_out_filepath, file_fh,
                                     conversion, redirection_page,
                                     open_error_message);

              free (encoded_out_filepath);
              free (out_filepath);
              free (redirection_page);
              free (open_error_message);

         /* NOTE failure to open a file does not stop the processing */
              if (status == -1)
                return -1;
              else if (status >= 0)
                redirection_files_done++;
            }
          clear_strings_list (&redirection_files);
        }
      free_strings_list (&redirection_files);
    }

  return redirection_files_done;
}

int
html_finish_output (CONVERTER *self, const char *output_file,
                    const char *destination_directory)
{
  int finish_handler_status;
  int handler_fatal_error_level
     = self->conf->HANDLER_FATAL_ERROR_LEVEL.o.integer;
  int node_redirections_status;

  html_do_js_files (self);

  finish_handler_status = html_run_stage_handlers (self, HSHT_type_finish);

  if (finish_handler_status < handler_fatal_error_level
      && finish_handler_status > -handler_fatal_error_level)
    {}
  else
    return 0;

  node_redirections_status = html_node_redirections (self, output_file,
                                                     destination_directory);
  if (node_redirections_status < 0)
    return 0;

  return 1;
}
