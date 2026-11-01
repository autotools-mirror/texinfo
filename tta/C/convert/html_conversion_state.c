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

/* Set and get the conversion state information */

#include <config.h>

#include <stdlib.h>
#include <string.h>

#include "text.h"
#include "command_ids.h"
#include "element_types.h"
#include "converter_types.h"
#include "html_converter_types.h"
#include "html_prepare_converter.h"
#include "list_macros.h"
/* fatal */
#include "base_utils.h"
#include "command_stack.h"
#include "builtin_commands.h"
/* new_string_list add_string */
#include "utils.h"
#include "api_to_perl.h"
#include "html_conversion_state.h"

/* enum css_info_type */
static const char *css_info_type_names[] =
{
  "element_classes", "imports", "rules"
};


static void
push_html_formatting_context (HTML_FORMATTING_CONTEXT_STACK *stack,
                              char *context_name)
{
  if (stack->number >= stack->space)
    {
      stack->list
        = realloc (stack->list,
                   (stack->space += 5) * sizeof (HTML_FORMATTING_CONTEXT));
    }

  memset (&stack->list[stack->number], 0, sizeof (HTML_FORMATTING_CONTEXT));

  stack->list[stack->number].context_name = strdup (context_name);

  stack->number++;
}

static void
pop_html_formatting_context (HTML_FORMATTING_CONTEXT_STACK *stack)
{
  if (stack->number == 0)
    fatal ("HTML formatting context stack empty");

  free (stack->list[stack->number - 1].context_name);
  stack->number--;
}

void
html_new_document_context (CONVERTER *self,
        const char *context_name, unsigned long context_type,
        const char *document_global_context,
        enum command_id block_command)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  HTML_DOCUMENT_CONTEXT_STACK *stack = &self_html->html_document_context;
  HTML_DOCUMENT_CONTEXT *doc_context;

  if (stack->number >= stack->space)
    {
      stack->list
        = realloc (stack->list,
                   (stack->space += 5) * sizeof (HTML_DOCUMENT_CONTEXT));
    }

  doc_context = &stack->list[stack->number];
  memset (doc_context, 0, sizeof (HTML_DOCUMENT_CONTEXT));

  if (context_name)
    doc_context->context = strdup (context_name);
  add_(integer) (&doc_context->preformatted_context, 0);
  push_command_or_type (&doc_context->composition_context, 0, 0);
  push_html_formatting_context (&doc_context->formatting_context,
                                "_format");

  if (document_global_context)
    doc_context->document_global_context = strdup (document_global_context);

  if (document_global_context)
    {
      self_html->document_global_context_counter++;
    }

  if (context_type & CTXF_code)
    add_(integer) (&doc_context->monospace, 1);
  else
    add_(integer) (&doc_context->monospace, 0);

  if (block_command)
    add_(command) (&doc_context->block_commands, block_command);

  stack->number++;

  if (context_type & CTXF_string)
    html_set_string_context (self);
}

void
html_pop_document_context (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  HTML_DOCUMENT_CONTEXT_STACK *stack = &self_html->html_document_context;
  HTML_DOCUMENT_CONTEXT *document_ctx;

  if (stack->number == 0)
    fatal ("HTML document context stack empty for pop");

  document_ctx = &stack->list[stack->number -1];

  free (document_ctx->context);
  free (document_ctx->document_global_context);
  free (document_ctx->monospace.list);
  free (document_ctx->preformatted_context.list);
  free (document_ctx->composition_context.list);
  free (document_ctx->preformatted_classes.list);
  if (document_ctx->block_commands.number > 0)
    pop_(command) (&document_ctx->block_commands);
  free (document_ctx->block_commands.list);
  pop_html_formatting_context (&document_ctx->formatting_context);
  free (document_ctx->formatting_context.list);

  if (document_ctx->document_global_context)
    {
      self_html->document_global_context_counter--;
    }

  stack->number--;
}

int
html_open_command_update_context (CONVERTER *self, enum command_id data_cmd)
{
  int convert_to_latex = 0;
  int preformatted = 0;

  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  HTML_FORMATTING_CONTEXT *top_formating_ctx;

  if ((command_data[data_cmd].flags & CF_brace
       && (command_data[data_cmd].data == BRACE_context
           || command_data[data_cmd].flags & CF_math))
      || data_cmd == CM_printindex)
    {
      html_new_document_context (self,
                   command_data[data_cmd].cmdname, 0, 0, 0);

    }
  top_document_ctx = html_top_document_context (self);

  if (html_commands_data[data_cmd].flags & HF_format_context)
    {
      char *context_str;
      xasprintf (&context_str, "@%s",
                 command_data[data_cmd].cmdname);
      push_html_formatting_context (
                 &top_document_ctx->formatting_context,
                 context_str);
      free (context_str);
    }

  top_formating_ctx
    = html_top_formatting_context (&top_document_ctx->formatting_context);

  if (command_data[data_cmd].flags & CF_block)
    {
      add_(command) (&top_document_ctx->block_commands, data_cmd);
    }

  if (html_commands_data[data_cmd].flags & HF_pre_class)
    {
      push_command_or_type (&top_document_ctx->preformatted_classes,
                            html_commands_data[data_cmd].pre_class_cmd, 0);
      if (command_data[data_cmd].flags & CF_preformatted)
        {
          preformatted = 1;
          top_document_ctx->inside_preformatted++;
        }
      else if (command_data[data_cmd].data == BLOCK_menu
               && top_document_ctx->inside_preformatted)
        preformatted = 1;
    }

  if (html_commands_data[data_cmd].flags & HF_composition_context)
    {
      push_command_or_type (&top_document_ctx->composition_context,
                            data_cmd, 0);
      add_(integer) (&top_document_ctx->preformatted_context,
                                preformatted);
    }

  if (html_commands_data[data_cmd].flags & HF_format_raw)
    {
      top_document_ctx->raw_ctx++;
    }
  else if (data_cmd == CM_verbatim)
    {
      top_document_ctx->verbatim_ctx++;
    }

  if (command_data[data_cmd].other_flags & CF_brace_code
      || command_data[data_cmd].other_flags & CF_preformatted_code)
    {
      add_(integer) (&top_document_ctx->monospace, 1);
    }
  else if (command_data[data_cmd].flags & CF_brace
           && command_data[data_cmd].data == BRACE_style_no_code)
    {
      add_(integer) (&top_document_ctx->monospace, 0);
    }
  else if (self->upper_case[data_cmd])
    {
      top_formating_ctx->upper_case_ctx++;
    }
  else if (command_data[data_cmd].flags & CF_math)
    {
      top_document_ctx->math_ctx++;
      if (self->conf->CONVERT_TO_LATEX_IN_MATH.o.integer > 0)
        convert_to_latex = 1;
    }
  if (data_cmd == CM_verb)
    {
      top_formating_ctx->space_protected++;
    }
  else if (data_cmd == CM_w)
    {
      top_formating_ctx->no_break++;
    }
  return convert_to_latex;
}

void
html_convert_command_update_context (CONVERTER *self, enum command_id data_cmd)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  HTML_FORMATTING_CONTEXT *top_formating_ctx;

  top_document_ctx = html_top_document_context (self);

  top_formating_ctx
    = html_top_formatting_context (&top_document_ctx->formatting_context);

  if (html_commands_data[data_cmd].flags & HF_composition_context)
    {
      pop_command_or_type (&top_document_ctx->composition_context);
      pop_(integer) (&top_document_ctx->preformatted_context);
    }

  if (html_commands_data[data_cmd].flags & HF_pre_class)
    {
      pop_command_or_type (&top_document_ctx->preformatted_classes);
      if (command_data[data_cmd].flags & CF_preformatted)
        top_document_ctx->inside_preformatted--;
    }

  if (data_cmd == CM_verb)
    {
      top_formating_ctx->space_protected--;
    }
  else if (data_cmd == CM_w)
    {
      top_formating_ctx->no_break--;
    }

  if (command_data[data_cmd].other_flags & CF_preformatted_code
      || (command_data[data_cmd].flags & CF_brace
          && command_data[data_cmd].data == BRACE_style_no_code)
      || command_data[data_cmd].other_flags & CF_brace_code)
    {
      pop_(integer) (&top_document_ctx->monospace);
    }
  else if (self->upper_case[data_cmd])
    {
      top_formating_ctx->upper_case_ctx--;
    }
  else if (command_data[data_cmd].flags & CF_math)
    {
      top_document_ctx->math_ctx--;
    }

  if (html_commands_data[data_cmd].flags & HF_format_raw)
    {
      top_document_ctx->raw_ctx--;
    }
  else if (data_cmd == CM_verbatim)
    {
      top_document_ctx->verbatim_ctx--;
    }

  if (command_data[data_cmd].flags & CF_block)
    {
      pop_(command) (&top_document_ctx->block_commands);
    }

  if (html_commands_data[data_cmd].flags & HF_format_context)
    {
      pop_html_formatting_context (
                 &top_document_ctx->formatting_context);
    }

  if ((command_data[data_cmd].flags & CF_brace
       && (command_data[data_cmd].data == BRACE_context
           || command_data[data_cmd].flags & CF_math))
      || data_cmd == CM_printindex)
    {
      html_pop_document_context (self);
    }
}

void
html_open_type_update_context (CONVERTER *self, enum element_type type)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  HTML_DOCUMENT_CONTEXT *top_document_ctx = html_top_document_context (self);
  HTML_FORMATTING_CONTEXT *top_formating_ctx
    = html_top_formatting_context (&top_document_ctx->formatting_context);

  if (type == ET_paragraph)
    {
      top_formating_ctx->paragraph_number++;
    }
  else if (type == ET_preformatted || type == ET_rawpreformatted)
    {
      top_formating_ctx->preformatted_number++;
    }
  else if (self_html->pre_class_types[type])
    {
      push_command_or_type (&top_document_ctx->preformatted_classes, 0, type);
      push_command_or_type (&top_document_ctx->composition_context,
                            0, type);
      add_(integer) (&top_document_ctx->preformatted_context, 1);
    }

  if (self_html->code_types[type])
    {
      add_(integer) (&top_document_ctx->monospace, 1);
    }
}

void
html_convert_type_update_context (CONVERTER *self, enum element_type type)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  HTML_DOCUMENT_CONTEXT *top_document_ctx = html_top_document_context (self);

  if (self_html->code_types[type])
    {
      pop_(integer) (&top_document_ctx->monospace);
    }

  if (self_html->pre_class_types[type])
    {
      pop_command_or_type (&top_document_ctx->preformatted_classes);
      pop_command_or_type (&top_document_ctx->composition_context);
      pop_(integer) (&top_document_ctx->preformatted_context);
    }
}

size_t
count_elements_in_file_number (const CONVERTER *self,
                 enum count_elements_in_filename_type type,
                 size_t file_number)
{
  size_t i = file_number - 1;
  const FILE_NAME_PATH_COUNTER *file_counter
            = &self->output_unit_files.list[i];

  if (type == CEFT_total)
    return file_counter->elements_in_file_count;
  else if (type == CEFT_remaining)
    return file_counter->counter;
  else /* if (type == CEFT_current) */
    return file_counter->elements_in_file_count - file_counter->counter +1;
}

/* called from Perl */
size_t
html_count_elements_in_filename (const CONVERTER *self,
                 enum count_elements_in_filename_type type,
                 const char *filename)
{
  size_t page_number = find_name_number (&self->page_name_number,
                                         filename);

  if (!page_number)
    return 0;

  return count_elements_in_file_number (self, type, page_number);
}


int
html_in_code (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  return *top_(integer) (&top_document_ctx->monospace);
}

int
html_in_math (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  return top_document_ctx->math_ctx;
}

int
html_in_preformatted_context (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  return *top_(integer) (&top_document_ctx->preformatted_context);
}

int
html_inside_preformatted (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  return top_document_ctx->inside_preformatted;
}

int
html_in_non_breakable_space (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  HTML_FORMATTING_CONTEXT *top_formating_ctx;
  top_document_ctx = html_top_document_context (self);
  top_formating_ctx
    = html_top_formatting_context (&top_document_ctx->formatting_context);
  return top_formating_ctx->no_break;
}

int
html_in_raw (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  return top_document_ctx->raw_ctx;
}

int
html_in_space_protected (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  HTML_FORMATTING_CONTEXT *top_formating_ctx;
  top_document_ctx = html_top_document_context (self);
  top_formating_ctx
    = html_top_formatting_context (&top_document_ctx->formatting_context);
  return top_formating_ctx->space_protected;
}

int
html_in_string (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  return top_document_ctx->string_ctx;
}

int
html_in_upper_case (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  HTML_FORMATTING_CONTEXT *top_formating_ctx;
  top_document_ctx = html_top_document_context (self);
  top_formating_ctx
    = html_top_formatting_context (&top_document_ctx->formatting_context);
  return top_formating_ctx->upper_case_ctx;
}

int
html_in_verbatim (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  return top_document_ctx->verbatim_ctx;
}

int
html_paragraph_number (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  HTML_FORMATTING_CONTEXT *top_formating_ctx;
  top_document_ctx = html_top_document_context (self);
  top_formating_ctx
    = html_top_formatting_context (&top_document_ctx->formatting_context);
  return top_formating_ctx->paragraph_number;
}

int
html_preformatted_number (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  HTML_FORMATTING_CONTEXT *top_formating_ctx;
  top_document_ctx = html_top_document_context (self);
  top_formating_ctx
    = html_top_formatting_context (&top_document_ctx->formatting_context);
  return top_formating_ctx->preformatted_number;
}

enum command_id
html_top_block_command (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  if (top_document_ctx->block_commands.number <= 0)
    return 0;
  return *top_(command) (&top_document_ctx->block_commands);
}

const COMMAND_OR_TYPE_STACK *
html_preformatted_classes_stack (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  return &top_document_ctx->preformatted_classes;
}

enum command_id
html_in_align (const CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  COMMAND_OR_TYPE *context;
  top_document_ctx = html_top_document_context (self);
  context = top_command_or_type (&top_document_ctx->composition_context);
  if (context->variety == CTV_type_command)
    {
      enum command_id cmd = context->ct.cmd;
      if (html_commands_data[cmd].flags & HF_HTML_align)
        return cmd;
    }
  return 0;
}

void
html_set_code_context (CONVERTER *self, int code)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  add_(integer) (&top_document_ctx->monospace, code);
}

void
html_pop_code_context (CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  pop_(integer) (&top_document_ctx->monospace);
}

void
html_set_string_context (CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  top_document_ctx->string_ctx++;
}

void
html_unset_string_context (CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  top_document_ctx->string_ctx--;
}

void
html_set_raw_context (CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  top_document_ctx->raw_ctx++;
}

void
html_unset_raw_context (CONVERTER *self)
{
  HTML_DOCUMENT_CONTEXT *top_document_ctx;
  top_document_ctx = html_top_document_context (self);
  top_document_ctx->raw_ctx--;
}

const char *
html_multi_expanded_region (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  if (self_html->multiple_pass.number > 0)
    return *top_(string) (&self_html->multiple_pass);

  return 0;
}

void
html_set_multiple_conversions (CONVERTER *self, const char *multiple_pass)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  push_string_stack_string (&self_html->multiple_pass, multiple_pass);
}

void
html_unset_multiple_conversions (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  pop_string_stack (&self_html->multiple_pass);
}

size_t
html_in_multiple_conversions (const CONVERTER *self)
{
  const HTML_CONVERTER_STATE *self_html = self->html_converter;
  return self_html->multiple_pass.number;
}

void
html_register_footnote (CONVERTER *self, const ELEMENT *command,
     const char *footid, const char *docid, int number_in_doc,
     const char *footnote_location_filename, const char *multi_expanded_region)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  HTML_PENDING_FOOTNOTE_STACK *stack;
  HTML_PENDING_FOOTNOTE *pending_footnote;

  if (self_html->shared_conversion_state.in_skipped_node_top == 1)
    return;

  stack = &self_html->pending_footnotes;

  if (stack->number >= stack->space)
    {
      stack->list
        = realloc (stack->list,
                   (stack->space += 5) * sizeof (HTML_PENDING_FOOTNOTE *));
    }
  pending_footnote = (HTML_PENDING_FOOTNOTE *)
                      malloc (sizeof (HTML_PENDING_FOOTNOTE));
  stack->list[stack->number] = pending_footnote;
  stack->number++;

  pending_footnote->command = command;
  pending_footnote->footid = strdup (footid);
  pending_footnote->docid = strdup (docid);
  pending_footnote->number_in_doc = number_in_doc;
  pending_footnote->footnote_location_filename
       = strdup (footnote_location_filename);

  if (multi_expanded_region)
    pending_footnote->multi_expanded_region = strdup (multi_expanded_region);
  else
    pending_footnote->multi_expanded_region = 0;
}

void
html_free_pending_footnote (HTML_PENDING_FOOTNOTE *pending_footnote)
{
  free (pending_footnote->multi_expanded_region);
  free (pending_footnote->footid);
  free (pending_footnote->docid);
  free (pending_footnote->footnote_location_filename);
  free (pending_footnote);
}

void
html_clear_pending_footnotes (HTML_PENDING_FOOTNOTE_STACK *stack)
{
  size_t i;
  for (i = 0; i < stack->number; i++)
    {
      html_free_pending_footnote (stack->list[i]);
    }
  stack->number = 0;
}

void
html_register_pending_formatted_inline_content (CONVERTER *self,
                             const char *category, const char *inline_content)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  HTML_INLINE_CONTENT *pending_content;
  HTML_INLINE_CONTENT_STACK *stack;

  if (!inline_content)
    return;

  stack = &self_html->pending_inline_content;
  if (stack->number >= stack->space)
    {
      stack->list
        = realloc (stack->list,
                   (stack->space += 5) * sizeof (HTML_INLINE_CONTENT));
    }
  pending_content = &stack->list[stack->number];

  pending_content->category = strdup (category);
  pending_content->string = strdup (inline_content);

  stack->number++;
}

/* cancel only the first pending content for the category */
char *
html_cancel_pending_formatted_inline_content (CONVERTER *self,
                                              const char *category)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  HTML_INLINE_CONTENT_STACK *stack = &self_html->pending_inline_content;
  if (stack->number)
    {
      size_t current_position = stack->number;
      size_t current_idx;
      while (current_position > 0)
        {
          current_idx = current_position - 1;
          if (!strcmp (stack->list[current_idx].category, category))
            {
              char *inline_content = stack->list[current_idx].string;
              free (stack->list[current_idx].category);
              if (current_position < stack->number)
                {
                  memmove (&stack->list[current_idx],
                           &stack->list[current_idx+1],
                           sizeof (HTML_INLINE_CONTENT)
                               * (stack->number - (current_idx +1)));
                }
              stack->number--;
              return inline_content;
            }
        }
    }
  return 0;
}

char *
html_get_pending_formatted_inline_content (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  HTML_INLINE_CONTENT_STACK *stack = &self_html->pending_inline_content;
  if (stack->number)
    {
      TEXT result;
      size_t i;
      text_init (&result);
      for (i = 0; i < stack->number; i++)
        {
          text_append (&result, stack->list[i].string);
          free (stack->list[i].string);
          free (stack->list[i].category);
        }
      stack->number = 0;
      return result.text;
    }
  else
    return strdup ("");
}

static size_t
get_associated_inline_content_number (
     const HTML_ASSOCIATED_INLINE_CONTENT_LIST *associated_content_list,
     const ELEMENT *element, const void *hv)
{
  size_t i;
  for (i = 0; i < associated_content_list->number; i++)
    {
      const HTML_ASSOCIATED_INLINE_CONTENT *element_associated_content
        = &associated_content_list->list[i];
      if ((element && (element_associated_content->element == element
                       || (element->sv
                && element_associated_content->hv == get_sv_hv (element->sv))))
          || (hv && (element_associated_content->hv == hv
                     || (element_associated_content->element
               && get_sv_hv (element_associated_content->element->sv) == hv))))
        {
          return i +1;
        }
    }
  return 0;
}

/* API to associate inline content to an element, typically
   paragraph or preformatted.  Allows to associate the pending
   content to the first inline element. */
/* hv is used when called from Perl, element is used when called from C */
void
html_associate_pending_formatted_inline_content (CONVERTER *self,
                                            const ELEMENT *element,
                                            const void *hv,
                                            const char *inline_content)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  HTML_ASSOCIATED_INLINE_CONTENT_LIST *associated_content_list
    = &self_html->associated_inline_content;
  HTML_ASSOCIATED_INLINE_CONTENT *element_associated_content = 0;
  size_t number = get_associated_inline_content_number (associated_content_list,
                                                                   element, hv);
  if (number > 0)
    element_associated_content = &associated_content_list->list[number -1];

  if (!element_associated_content)
    {
      size_t i;
      int empty_slot = 0;

      for (i = 0; i < associated_content_list->number; i++)
        {
          if (associated_content_list->list[i].inline_content.space == 0)
            {
              empty_slot = 1;
              number = i +1;
            }
        }

      if (!empty_slot)
        {
          if (associated_content_list->number >= associated_content_list->space)
            {
              associated_content_list->list
                = realloc (associated_content_list->list,
                   (associated_content_list->space += 5)
                              * sizeof (HTML_ASSOCIATED_INLINE_CONTENT));
            }
          associated_content_list->number++;
          number = associated_content_list->number;
        }
      element_associated_content
        = &associated_content_list->list[number -1];
      element_associated_content->element = element;
      element_associated_content->hv = hv;
      text_init (&element_associated_content->inline_content);
      /*
      fprintf (stderr, "NNN (%zu)\n", associated_content_list->number);
       */
    }
  text_append (&element_associated_content->inline_content, inline_content);
   /*
  if (element)
    fprintf (stderr, "RRR-EE %p -> %p %zu\n", element, get_sv_hv (element->sv), number);
  if (sv)
    fprintf (stderr, "RRR-PP %p %zu\n", hv, number);
    */
}

/* hv is used when called from Perl, element is used when called from C */
char *
html_get_associated_formatted_inline_content (CONVERTER *self,
                                              const ELEMENT *element,
                                              const void *hv)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  HTML_ASSOCIATED_INLINE_CONTENT_LIST *associated_content_list
    = &self_html->associated_inline_content;
  HTML_ASSOCIATED_INLINE_CONTENT *element_associated_content = 0;
  size_t number = get_associated_inline_content_number (associated_content_list,
                                                                   element, hv);
  /*
  if (element)
    fprintf (stderr, "GGG-EE %p -> %p %zu (%zu)\n", element, element->hv, number, associated_content_list->number);
  if (hv)
    fprintf (stderr, "GGG-PP %p %zu (%zu)\n", hv, number, associated_content_list->number);
   */
  if (number > 0)
    element_associated_content = &associated_content_list->list[number -1];

  if (element_associated_content)
    {
      char *result = element_associated_content->inline_content.text;
      if (number == associated_content_list->number)
        associated_content_list->number--;
      else
        memset (element_associated_content, 0,
                sizeof (HTML_ASSOCIATED_INLINE_CONTENT));
      return result;
    }
  return strdup ("");
}

FILE_INFO_KEY_PAIR *
add_associated_file_info_integer (FILE_ASSOCIATED_INFO *a,
                                  const char *key, int value)
{
  size_t i;
  for (i = 0; i < a->info_number; i++)
    {
      if (!strcmp (a->info[i].key, key))
        break;
    }
  if (i == a->info_number)
    {
      if (a->info_number == a->info_space)
        {
          a->info = realloc (a->info,
                         (a->info_space += 5) * sizeof (FILE_INFO_KEY_PAIR));
          if (!a->info)
            fatal ("realloc failed");
        }
      a->info_number++;

      a->info[i].key = key;
    }

  a->info[i].integer = value;

  return &a->info[i];
}

/* API to register an information to a file and get it.  To be able to
   set an information during conversion and get it back during headers
   and footers conversion */

void
html_register_file_information (CONVERTER *self, const char *key,
                                int value)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  FILE_ASSOCIATED_INFO *associated_info
    = &self_html->html_files_information.list[self_html->current_filename.file_number];
  add_associated_file_info_integer (associated_info, key, value);
}

const FILE_INFO_KEY_PAIR *
lookup_associated_file_info (const FILE_ASSOCIATED_INFO *a,
                             const char *key)
{
  size_t i;
  for (i = 0; i < a->info_number; i++)
    {
      if (!strcmp (a->info[i].key, key))
        return &a->info[i];
    }
  return 0;
}

int
html_get_file_information (const CONVERTER *self, const char *key,
                           const char *filename, int *status)
{
  const HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t page_number;
  const FILE_ASSOCIATED_INFO *associated_info;
  const FILE_INFO_KEY_PAIR *k;

  *status = 0;
  if (filename)
    {
      page_number = find_name_number (&self->page_name_number,
                                      filename);
      if (!page_number)
        {
          *status = -1;
          return 0;
        }
    }
  else
    page_number = self_html->current_filename.file_number;

  associated_info = &self_html->html_files_information.list[page_number];
  k = lookup_associated_file_info (associated_info, key);
  if (!k)
    {
      *status = -2;
      return 0;
    }

  return k->integer;
}

void
html_register_opened_section_level (CONVERTER *self, size_t file_number,
                                    int level, const char *close_string)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  STRING_LIST *file_pending_closes
    = &self_html->pending_closes.list[file_number -1];

  while ((int) file_pending_closes->number < level)
    {
      push_string_stack_string (file_pending_closes, "");
    }
  push_string_stack_string (file_pending_closes, close_string);
}

/* called from Perl */
void
html_register_opened_filename_section_level (CONVERTER *self,
                                    const char *filename,
                                    int level, const char *close_string)
{
  size_t page_number = find_name_number (&self->page_name_number,
                                         filename);

  if (!page_number)
    return;

  html_register_opened_section_level (self, page_number, level, close_string);
}

STRING_LIST *
html_close_registered_sections_level (CONVERTER *self, size_t file_number,
                                      int level)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  STRING_LIST *file_pending_closes
    = &self_html->pending_closes.list[file_number -1];
  STRING_LIST *closed_elements = new_string_list ();

  while ((int) file_pending_closes->number > level)
    {
      const char *close_string = *top_(string) (file_pending_closes);
      if (strlen (close_string))
        {
          add_string (closed_elements, close_string);
        }
      pop_string_stack (file_pending_closes);
    }

  return closed_elements;
}

/* called from Perl */
STRING_LIST *
html_close_registered_filename_sections_level (CONVERTER *self,
                                      const char *filename, int level)
{
  size_t page_number = find_name_number (&self->page_name_number,
                                         filename);

  if (!page_number)
    return 0;

  return html_close_registered_sections_level (self, page_number, level);
}

EXPLAINED_COMMAND_TYPE *
find_explained_command_string (
                      const EXPLAINED_COMMAND_TYPE_LIST *type_explanations,
                               const enum command_id cmd, const char *type)
{
  size_t i;
  for (i = 0; i < type_explanations->number; i++)
    {
      EXPLAINED_COMMAND_TYPE *type_explanation = &type_explanations->list[i];
      if (type_explanation->cmd == cmd
          && !strcmp (type_explanation->type, type))
        return type_explanation;
    }
  return 0;
}

void
register_explained_command_string (
               EXPLAINED_COMMAND_TYPE_LIST *type_explanations,
                    const enum command_id cmd,
                    const char *type, const char *explanation)
{
  EXPLAINED_COMMAND_TYPE *type_explanation
    = find_explained_command_string (type_explanations, cmd, type);
  if (!type_explanation)
    {
      if (type_explanations->number == type_explanations->space)
        {
          type_explanations->list
           = realloc (type_explanations->list,
            sizeof (EXPLAINED_COMMAND_TYPE) * (type_explanations->space += 5));
        }
      type_explanation = &type_explanations->list[type_explanations->number];
      type_explanation->cmd = cmd;
      type_explanation->type = strdup (type);

      type_explanation = &type_explanations->list[type_explanations->number];
      type_explanations->number++;
    }
  else
    free (type_explanation->explanation);

  type_explanation->explanation = strdup (explanation);
}

/* to be freed by caller */
static char *
source_info_id (const SOURCE_INFO *source_info)
{
  TEXT result;

  text_init (&result);
  if (source_info->file_name)
    text_append (&result, source_info->file_name);
  text_append_n (&result, "-", 1);
  if (source_info->macro)
    text_append (&result, source_info->macro);
  text_append_n (&result, "-", 1);
  text_printf (&result, "%d", source_info->line_nr);
  return result.text;
}

size_t
html_check_htmlxref_already_warned (CONVERTER *self, const char *manual_name,
                                    const SOURCE_INFO *source_info)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  STRING_LIST *htmlxref_warned_list
    = &self_html->check_htmlxref_already_warned;
  char *node_manual_key;
  char *info_id;
  size_t entry_nr;

  if (source_info)
    info_id = source_info_id (source_info);
  else
    info_id = strdup ("UNDEF");

  xasprintf (&node_manual_key, "%s-%s", info_id, manual_name);
  free (info_id);

  entry_nr = find_string (htmlxref_warned_list, node_manual_key);

  if (entry_nr)
    {
      free (node_manual_key);
      return entry_nr;
    }

  add_string (htmlxref_warned_list, node_manual_key);
  free (node_manual_key);

  return 0;
}

static int
compare_global_units_direction_name (const void *a, const void *b)
{
  const SPECIAL_UNIT_DIRECTION *gudn_a = (const SPECIAL_UNIT_DIRECTION *) a;
  const SPECIAL_UNIT_DIRECTION *gudn_b = (const SPECIAL_UNIT_DIRECTION *) b;

  return strcmp (gudn_a->direction, gudn_b->direction);
}

/* Used from Perl through an XS override, in similar C codes the
   direction indices are used instead of the direction names */
const OUTPUT_UNIT *
html_find_direction_name_global_unit (const CONVERTER *self,
                                      const char *direction_name)
{
  const HTML_CONVERTER_STATE *self_html = self->html_converter;
  SPECIAL_UNIT_DIRECTION *result = 0;
  static SPECIAL_UNIT_DIRECTION searched_direction;

  searched_direction.direction = direction_name;
  result = (SPECIAL_UNIT_DIRECTION *) bsearch (&searched_direction,
                self_html->global_units_direction_names.list,
                self_html->global_units_direction_names.number,
                sizeof (SPECIAL_UNIT_DIRECTION),
                compare_global_units_direction_name);
  if (!result)
    return 0;
  return result->output_unit;
}



enum css_info_type
html_get_css_info_spec (const char *spec)
{
  int i;
  enum css_info_type type = CI_css_info_element_classes;
  for (i = 0; i < CI_css_info_rules +1; i++)
    {
      if (!strcmp (css_info_type_names[i], spec))
        {
          type = i;
          break;
        }
    }
  return type;
}

void
html_css_add_info (CONVERTER *self, enum css_info_type type,
                   const char *css_info)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  if (type == CI_css_info_rules)
    add_string (&self_html->css_rule_lines, css_info);
  else if (type == CI_css_info_imports)
    add_string (&self_html->css_import_lines, css_info);
}

const STRING_LIST *
html_css_get_info (CONVERTER *self, enum css_info_type type)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  if (type == CI_css_info_rules)
    return &self_html->css_rule_lines;
  else if (type == CI_css_info_imports)
    return &self_html->css_import_lines;
  else
    {
      clear_strings_list (&self_html->css_element_class_list);
      if (self_html->css_element_class_styles.number > 0)
        {
          size_t i;

          for (i = 0; i < self_html->css_element_class_styles.number; i++)
            {
              const CSS_SELECTOR_STYLE *selector_style
                = &self_html->css_element_class_styles.list[i];
              add_string (&self_html->css_element_class_list,
                          selector_style->selector);
            }
        }
      return &self_html->css_element_class_list;
    }
}

static int
compare_selector_style (const void *a, const void *b)
{
  const CSS_SELECTOR_STYLE *css_a = (const CSS_SELECTOR_STYLE *) a;
  const CSS_SELECTOR_STYLE *css_b = (const CSS_SELECTOR_STYLE *) b;

  /* have NULL selector sort last, such that it is easy
     to "remove" the selector style by decreasing the number of
     elements in list after it has been put last */
  if (css_a->selector && css_b->selector)
    return strcmp (css_a->selector, css_b->selector);
  else if (!css_a->selector && !css_b->selector)
    return 0;
  else if (!css_a->selector)
    return 1;
  else /* if (!css_b->selector) */
    return -1;
}

void
sort_css_element_class_styles (
       CSS_SELECTOR_STYLE_LIST *css_element_class_styles)
{
  qsort (css_element_class_styles->list,
         css_element_class_styles->number,
         sizeof (CSS_SELECTOR_STYLE), compare_selector_style);
}

/* can be modified if called by html_css_set_selector_style */
CSS_SELECTOR_STYLE *
find_css_selector_style
     (const CSS_SELECTOR_STYLE_LIST *css_element_class_styles,
                                           const char *selector)
{
  CSS_SELECTOR_STYLE *result = 0;
  static CSS_SELECTOR_STYLE searched_selector;
  /* remove const with a cast, it is more efficient than duplicating */
  searched_selector.selector = (char *) selector;

  result = (CSS_SELECTOR_STYLE *) bsearch (&searched_selector,
                css_element_class_styles->list,
                css_element_class_styles->number, sizeof (CSS_SELECTOR_STYLE),
                compare_selector_style);

  return result;
}

void
html_css_set_selector_style (CSS_SELECTOR_STYLE_LIST *css_element_class_styles,
                             const char *css_info,
                             const char *css_style)
{
  /* should probably never happen */
  if (!css_info)
    return;

  CSS_SELECTOR_STYLE *selector_style
   = find_css_selector_style (css_element_class_styles, css_info);

  if (selector_style)
    {
      free (selector_style->style);
      if (css_style)
        selector_style->style = strdup (css_style);
      else
        {
          /* Remove the selector.  This is done by setting the selector
             to NULL, sorting, which sorts that selector last, and
             decreasing the number of selector styles in the list to remove
             the last one */
          free (selector_style->selector);
          selector_style->selector = 0;
          sort_css_element_class_styles (css_element_class_styles);
          css_element_class_styles->number--;
        }
    }
  else if (css_style)
    {
      CSS_SELECTOR_STYLE_LIST *elt_class_styles
        = css_element_class_styles;
      if (elt_class_styles->space <= elt_class_styles->number)
        {
          elt_class_styles->list = realloc (elt_class_styles->list,
             (elt_class_styles->space += 10) * sizeof (CSS_SELECTOR_STYLE));
        }

      selector_style
        = &elt_class_styles->list[elt_class_styles->number];
      selector_style->selector = strdup (css_info);
      selector_style->style = strdup (css_style);

      elt_class_styles->number++;

      sort_css_element_class_styles (css_element_class_styles);
    }
}

const char *
html_css_get_selector_style (CONVERTER *self, const char *css_info)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  const CSS_SELECTOR_STYLE *selector_style
   = find_css_selector_style (&self_html->css_element_class_styles, css_info);

  if (selector_style)
    return selector_style->style;

  return 0;
}

int
compare_strings (const void *a, const void *b)
{
  const char **str_a = (const char **) a;
  const char **str_b = (const char **) b;

  return strcmp (*str_a, *str_b);
}

/* return list to be freed by caller */
STRING_LIST *
html_get_css_elements_classes (CONVERTER *self, const char *filename)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t j;
  size_t page_number;
  STRING_LIST *result;
  const char **selectors;
  size_t selector_nr = 0;

  if (self_html->page_css.number <= 0)
    return 0;

  const CSS_LIST *global_context_css_list = &self_html->page_css.list[0];

  if (filename)
    {
      page_number = find_name_number (&self->page_name_number,
                                      filename);
      if (!page_number)
        {
          if (self_html->page_css.number > 1)
            {
              const CSS_LIST *last_css_page
               = &self_html->page_css.list[self_html->page_css.number -1];
              if (last_css_page->page_name
                  && !strcmp (filename, last_css_page->page_name))
                {
                  page_number = self_html->page_css.number -1;
                }
             }
          if (!page_number)
            {
             /* this happens legitimately in case of an output file not
                associated to an output unit and not having registered
                any CSS selector.  Also the formatting of the node or
                similar command is in general done in global context
                so no file is added */
              /* This debug message is C specific
              if (self->conf->DEBUG.o.integer > 0)
                {
                  fprintf (stderr, "C|css: REMARK: %s: get_css no page found\n",
                                    filename);
                }
               */
            }
        }
      if (page_number)
        {
          const STRING_LIST *css_list;
          css_list = &self_html->page_css.list[page_number].selectors;
          if (css_list->number)
            {
              /* +1 for 'span:hover a.copiable-link' */
              size_t space
               = css_list->number + global_context_css_list->selectors.number +1;
              selectors = (const char **) malloc (sizeof (char *) * space);
              memcpy (selectors, css_list->list,
                      css_list->number * sizeof (char *));
              selector_nr = css_list->number;
            }
        }
    }

  if (selector_nr <= 0)
    {
      if (global_context_css_list->selectors.number)
        {
          const STRING_LIST *global_selectors
             = &global_context_css_list->selectors;
          /* +1 for 'span:hover a.copiable-link' */
          size_t space = global_selectors->number +1;
          selectors = (const char **) malloc (sizeof (char *) * space);
          memcpy (selectors, global_selectors->list,
                  global_selectors->number * sizeof (char *));
          selector_nr = global_selectors->number;
        }
      else
        return 0;
    }
  else if (global_context_css_list->selectors.number)
    {
      size_t i;
      size_t file_selector_nr = selector_nr;
      const STRING_LIST *global_selectors
             = &global_context_css_list->selectors;
      /* add global context selectors if not already present */
      for (i = 0; i < global_selectors->number; i++)
        {
          size_t j;
          const char *global_selector = global_selectors->list[i];
          int found = 0;
          for (j = 0; j < file_selector_nr; j++)
            {
              if (!strcmp (global_selector, selectors[j]))
                {
                  found = 1;
                  break;
                }
            }
          if (!found)
            {
              selectors[selector_nr] = global_selector;
              selector_nr++;
            }
        }
    }

  for (j = 0; j < selector_nr; j++)
    {
      if (!strcmp ("a.copiable-link", selectors[j]))
        {
          selectors[selector_nr] = "span:hover a.copiable-link";
          selector_nr++;
          break;
        }
    }

  qsort (selectors, selector_nr, sizeof (char *), compare_strings);

  result = new_string_list ();
  for (j = 0; j < selector_nr; j++)
    add_string (result, selectors[j]);

  free (selectors);

  return result;
}

