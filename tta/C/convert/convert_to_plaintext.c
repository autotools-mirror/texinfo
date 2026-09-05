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

/* In sync with Texinfo::Convert::Plaintext.  Very little written yet. */

#include <config.h>

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include <ctype.h>
/* for uintptr_t */
#include <stdint.h>
#include <uchar.h>
/* for PRIuPTR */
#include <inttypes.h>
#include <strings.h>

#include "unistr.h"
#include "unictype.h"

#include "list_macros.h"
#include "text.h"
#include "command_ids.h"
#include "element_types.h"
#include "tree_types.h"
#include "document_types.h"
#include "converter_types.h"
#include "plaintext_converter_state.h"
#include "types_data.h"
#include "option_types.h"
#include "base_utils.h"
#include "hashmap.h"
#include "tree.h"
/* for lookup_extra* */
#include "extra.h"
#include "builtin_commands.h"
#include "errors.h"
#include "debug.h"
/* for format_expanded_p */
#include "utils.h"
/* for add_(command) ... */
#include "command_stack.h"
#include "manipulate_tree.h"
#include "translations.h"
#include "targets.h"
#include "customization_options.h"
#include "output_unit.h"
#include "unicode.h"
/* for converter_encoded_output_file_name item_itemize_prepended */
#include "convert_utils.h"
#include "convert_to_texinfo.h"
#include "converters_options.h"
#include "convert_to_text.h"
#include "structuring.h"
#include "plaintext_paragraph.h"
/* for write_or_return top_node_filename determine_files_and_directory
   create_destination_directory ... */
#include "converter.h"
#include "convert_indices.h"
#include "convert_to_info.h"
#include "convert_to_plaintext.h"

static enum converter_format setup_for_format = COF_none;

static const enum command_id informative_global_commands[]
             = {CM_paragraphindent, CM_firstparagraphindent,
                CM_exampleindent,
  CM_frenchspacing, CM_footnotestyle, CM_documentlanguage, CM_documentscript,
  CM_deftypefnnewline, 0};

static const enum command_id contents_commands[]
             = {CM_contents, CM_shortcontents, CM_summarycontents, 0};

static COMMAND_ID_LIST format_raw_cmd;

/* Only used in this file */
struct style_map {
  enum command_id cmd;
  const char *pre;
  const char *post;
};

static struct style_map style_map[] =
{
  {CM_strong, "*", "*"},
  {CM_emph, "_", "_"},
  {CM_key, "<", ">"},
  {CM_sub, "_{", "}"},
  {CM_sup, "^{", "}"},
};

struct item_indent_format_length {
  enum command_id cmd;
  int indent_format_length;
};

static struct item_indent_format_length item_indent_format_length[] = {
  {CM_enumerate, 2},
  {CM_itemize, 3},
  {CM_table, 0},
  {CM_vtable, 0},
  {CM_ftable, 0},
  {CM_NONE, -1},
};

static int default_indent_length = 5;

static PLAINTEXT_COMMAND_STRUCT plaintext_commands_data[BUILTIN_CMD_NUMBER];

/* dispatch of formatting functions that are either for plaintext or
   Info output.  The table is below, after the functions definitions */
typedef struct PLAINTEXT_FORMAT_FUNCTIONS {
    void (* format_anchor) (CONVERTER *self, const ELEMENT *anchor);
    void (* format_contents) (CONVERTER *self,
                               SECTIONING_ROOT *sectioning_root,
                               enum command_id contents_or_shortcontents_cmd);
    void (* format_error_outside_of_any_node) (CONVERTER *self,
                                               const ELEMENT *element);
    TEXT (* format_image) (CONVERTER *self, const char *image_file,
                   const TEXT *text, const TEXT *alt,
                   int dpi, int depth, int *lines_count);
    int (* format_image_element) (CONVERTER *self, const ELEMENT *element);
    void (* format_node) (CONVERTER *self, const ELEMENT *element,
                          const NODE_RELATIONS *node_relations);
    void (* format_printindex) (CONVERTER *self, const ELEMENT *element);
    void (* format_ref) (CONVERTER *self, enum command_id cmd,
                         const ELEMENT *element);
    TEXT (* quote_image) (CONVERTER *self, const TEXT *image_text);
} PLAINTEXT_FORMAT_FUNCTIONS;

def_list_fns(COUNT_CONTEXT_STACK, count_context, COUNT_CONTEXT, 2);
def_stack_fns(COUNT_CONTEXT_STACK, count_context, COUNT_CONTEXT);

def_list_fns(TARGET_LOCATION_LIST, target_location, TARGET_LOCATION, 5);

def_list_fns(INDEX_ENTRY_LINE_COUNT_LIST, index_entry_location, int *, 5);

char *
debug_print_pending (const PENDING_TEXT_LIST *pending_texts)
{
  size_t i;
  TEXT t;

  text_init (&t);

  for (i = 0; i < pending_texts->number; i++)
    {
      const PENDING_TEXT *pending_text = &pending_texts->list[i];
      text_append_n (&t, pending_text->text.text, pending_text->text.end);
      if (pending_text->type == PLT_anchor)
        {
          char *texi = target_element_to_texi_label (pending_text->l.anchor);
          text_append_n (&t, "[", 1);
          text_append (&t, texi);
          text_append_n (&t, "]", 1);
          free (texi);
        }
      else if (pending_text->type == PLT_quoted_image)
        {
          text_append_n (&t, "{", 1);
          text_append_n (&t, pending_text->l.image_string.text,
                             pending_text->l.image_string.end);
          text_append_n (&t, "}", 1);
        }
      if (i < pending_texts->number -1)
        text_append_n (&t, "|", 1);
    }
  return t.text;
}

void
clear_pending_text_list (PENDING_TEXT_LIST *pending_texts)
{
  size_t i;
  for (i = 0; i < pending_texts->number; i++)
    {
      PENDING_TEXT *pending_text = &pending_texts->list[i];
      text_reset (&pending_text->text);
      if (pending_text->type == PLT_anchor)
        {
          char *texi = target_element_to_texi_label (pending_text->l.anchor);
          fprintf (stderr, "clear_pending_text_list: %zu: anchor [%s]\n",
                   i, texi);
          free (texi);
          pending_text->l.anchor = 0;
        }
      else if (pending_text->type == PLT_quoted_image)
        {
          fprintf (stderr, "clear_pending_text_list: %zu: image {%s}\n",
                           i, pending_text->l.image_string.text);
          text_destroy (&pending_text->l.image_string);
        }
      pending_text->type = PLT_text;
    }
  pending_texts->number = 0;
}

/* Nothing is deallocated here.  The data is reset either before popping
   or right after, but the memory is kept and reused.
   The memory is free'ed when freeing the converter.
 */
void
pop_count_context (COUNT_CONTEXT_STACK *stack)
{
  if (stack->number == 0)
    fatal ("count context stack empty");

  stack->number--;
}

def_alloc_fns(PENDING_TEXT_LIST, pending_text, PENDING_TEXT, 5);

static PENDING_TEXT *
add_top_pending_text (PENDING_TEXT_LIST *pending_texts, enum conv_type type)
{
  PENDING_TEXT *pending_text = add_init_(pending_text) (pending_texts);

  text_append (&pending_text->text, "");
  pending_text->type = type;

  return pending_text;
}

def_alloc_fns(COUNT_CONTEXT_STACK, count_context, COUNT_CONTEXT, 2);

static void
push_count_context (COUNT_CONTEXT_STACK *stack)
{
  COUNT_CONTEXT *pushed_context = add_init_(count_context) (stack);

  pushed_context->lines = 0;
  add_top_pending_text (&pushed_context->pending_text, PLT_text);
}




def_list_fns(FORMAT_CONTEXT_STACK, format_context, FORMAT_CONTEXT, 1);
def_stack_fns(FORMAT_CONTEXT_STACK, format_context, FORMAT_CONTEXT);

def_list_fns(FORMATTER_STACK, formatter, FORMATTER, 1);
def_stack_fns(FORMATTER_STACK, formatter, FORMATTER);

def_list_fns(DOCUMENT_CONTEXT_STACK, document_context, DOCUMENT_CONTEXT, 1);
def_stack_fns(DOCUMENT_CONTEXT_STACK, document_context, DOCUMENT_CONTEXT);

def_list_fns(TEXT_CONTEXT_STACK, text_element_context, TEXT_CONTEXT, 1);
def_stack_fns(TEXT_CONTEXT_STACK, text_element_context, TEXT_CONTEXT);

def_list_fns(FONT_TYPE_STACK, font_type, FONT_TYPE, 2);
def_stack_fns(FONT_TYPE_STACK, font_type, FONT_TYPE);

def_list_fns(UPPER_CASE_STACK, upper_case, UPPER_CASE, 2);
def_stack_fns(UPPER_CASE_STACK, upper_case, UPPER_CASE);

def_list_fns(QUOTATION_AUTHORS_LIST, quotations_authors, CONST_ELEMENT_LIST, 1);
def_stack_fns(QUOTATION_AUTHORS_LIST, quotations_authors, CONST_ELEMENT_LIST);

def_list_fns(PENDING_TEXT_LIST, pending_text, PENDING_TEXT, 5);
def_stack_fns(PENDING_TEXT_LIST, pending_text, PENDING_TEXT);

static void
fill_formatter (FORMATTER *formatter, CONVERTER *self, enum formatter_type type,
               int indent_length, int indent_length_next)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  TEXT_CONTEXT *text_element_context
    = top_(text_element_context) (&self_plaintext->text_element_context);
  formatter->container.paragraph = para_new ();
  enum command_id context_cmd = *top_(command) (&self_plaintext->context);
  int frenchspacing = 0;

  /* TODO this is not true, there is some debugging output in the C code.
  # There is no corresponding debugging output in the C code.
  if (self->conf->DEBUG.o.integer > 1)
    para_set_conf_debug (1);
  */

  if (indent_length != -1)
    {
      para_set_conf_indent_length (indent_length);
    }
  else
    {
      FORMAT_CONTEXT *top_format_context
        = top_(format_context) (&self_plaintext->format_context);
      para_set_conf_indent_length (top_format_context->context_indent_len);
    }
  if (indent_length_next != -1)
    para_set_conf_indent_length_next (indent_length_next);

  if (self->conf->frenchspacing.o.string
      && !strcmp (self->conf->frenchspacing.o.string, "on"))
    {
      frenchspacing = 1;
      para_set_conf_frenchspacing (1);
    }
  else if (type == formatter_unfilled)
   para_set_conf_frenchspacing (1);

  para_set_conf_counter (text_element_context->counter);

  switch (type)
    {
    case formatter_paragraph:
      para_set_conf_max (text_element_context->max);
      if (plaintext_commands_data[context_cmd].flags & PF_flush)
        {
          para_set_conf_keep_end_lines (1);
          para_set_conf_ignore_columns (1);
        }
      /* nothing to change/set */
      break;
    case formatter_line:
      para_set_conf_max (10000001);
      para_set_conf_keep_end_lines (1);
      para_set_conf_no_final_newline (1);
      para_set_conf_add_final_space (1);
      break;
    case formatter_unfilled:
      para_set_conf_unfilled (1);
      para_set_conf_max (10000000);
      para_set_conf_keep_end_lines (1);
      para_set_conf_no_final_newline (1);
      para_set_conf_ignore_columns (1);
      break;
    default:
      fatal ("unknown container type\n");
    }

  add_(integer) (&formatter->frenchspacing_stack, frenchspacing);

  formatter->font_type_stack = (FONT_TYPE_STACK *)
                    malloc (sizeof (FONT_TYPE_STACK));
  memset (formatter->font_type_stack, 0, sizeof (FONT_TYPE_STACK));
  FONT_TYPE font_type = { 0 };
  add_(font_type) (formatter->font_type_stack, font_type);

  formatter->upper_case_stack = (UPPER_CASE_STACK *)
                    malloc (sizeof (UPPER_CASE_STACK));
  memset (formatter->upper_case_stack, 0, sizeof (UPPER_CASE_STACK));
  UPPER_CASE upper_case = { 0 };
  add_(upper_case) (formatter->upper_case_stack, upper_case);

  if (type == formatter_unfilled)
    {
      size_t j;
      for (j = self_plaintext->context.number; j > 0; j--)
        {
          enum command_id context_cmd = self_plaintext->context.list[j-1];
          if (plaintext_commands_data[context_cmd].flags & PF_menu)
            break;
          else if (command_data[context_cmd].other_flags
                                                & CF_preformatted_code
                   || plaintext_commands_data[context_cmd].flags
                                                    & PF_format_raw
                   || command_data[context_cmd].flags & CF_math)
            {
              FONT_TYPE *top_font_type
                        = top_(font_type) (formatter->font_type_stack);
              top_font_type->monospace = 1;
              if (command_data[context_cmd].other_flags
                                                & CF_preformatted_code
                  || command_data[context_cmd].flags & CF_math)
                {
                  top_font_type->code_command = 1;
                }
              break;
            }
        }
    }
}

FORMATTER
new_formatter (CONVERTER *self, enum formatter_type type,
               int indent_length, int indent_length_next)
{
  FORMATTER formatter = { 0 };
  fill_formatter (&formatter, self, type, indent_length, indent_length_next);
  return formatter;
}

void
push_formatter (CONVERTER *self, const FORMATTER *formatter)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  FORMATTER_STACK *stack = &self_plaintext->formatters;

  add_(formatter) (stack, *formatter);
  para_set_state (top_(formatter) (stack)->container.paragraph);
}

void
push_top_formatter (CONVERTER *self, enum command_id cmd)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;

  /* top_format 'cmdname' is '_top_format' in Perl.  Use 0 in C. */
  FORMAT_CONTEXT top_format = { 0 };
  DOCUMENT_CONTEXT document_context = { 0 };
  TEXT_CONTEXT text_element_context = { 0 };
  text_element_context.max = self->conf->FILLCOLUMN.o.integer;

  add_(command) (&self_plaintext->context, cmd);

  add_(format_context) (&self_plaintext->format_context, top_format);

  add_(text_element_context) (&self_plaintext->text_element_context,
                              text_element_context);

  add_(document_context) (&self_plaintext->document_context,
                          document_context);

 /* This is not really meant to be used, as contents should open
    their own formatters, however it happens that there is some text
    outside any content that needs to be formatted, as @sp for example. */
  FORMATTER top_formatter = new_formatter (self, formatter_line, -1, -1);
  push_formatter (self, &top_formatter);
}

static void
release_stacks_of_top_formatter (FORMATTER_STACK *stack)
{
  FORMATTER *top_formatter = top_(formatter) (stack);
  free (top_formatter->frenchspacing_stack.list);
  free (top_formatter->font_type_stack->list);
  free (top_formatter->font_type_stack);
  free (top_formatter->upper_case_stack->list);
  free (top_formatter->upper_case_stack);
}

/* in most of the cases, the formatter is not reused.
   For node names, the formatter is reused, so destroy stacks only
   if REUSE_FORMATER is 0.
 */
void
pop_formatter (CONVERTER *self, int reuse_formatter)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  FORMATTER_STACK *stack = &self_plaintext->formatters;

  if (!reuse_formatter)
    release_stacks_of_top_formatter (stack);

  pop_(formatter) (stack);

  para_set_state (top_(formatter) (stack)->container.paragraph);
}

static enum command_id
pop_context (COMMAND_STACK *stack)
{
  enum command_id popped_cmd = *top_(command) (stack);
  pop_(command) (stack);
  return popped_cmd;
}

void
pop_document_context (DOCUMENT_CONTEXT_STACK *stack)
{
  DOCUMENT_CONTEXT *top_document_context = top_(document_context) (stack);
  free (top_document_context->quotations_authors.list);
  pop_(document_context) (stack);
}

enum command_id
pop_top_formatter (CONVERTER *self)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  enum command_id popped_cmd = pop_context (&self_plaintext->context);

  pop_(format_context) (&self_plaintext->format_context);
  para_destroy ();

  if (popped_cmd == CM_NONE)
    {
      /* should be removing the last format, do not set the paragraph */
      release_stacks_of_top_formatter (&self_plaintext->formatters);

      pop_(formatter) (&self_plaintext->formatters);
    }
  else
    pop_formatter (self, 0);

  pop_document_context (&self_plaintext->document_context);

  pop_(text_element_context) (&self_plaintext->text_element_context);

  return popped_cmd;
}



/* used to pass to info converter */
const enum command_id *
plaintext_get_informative_global_commands (void)
{
  return informative_global_commands;
}

/* Can be used to sort structures whose first field is an
   enum command_id. */
int
compare_cmd_id_fn (const void *a, const void *b)
{
  const enum command_id *cmd1 = a;
  const enum command_id *cmd2 = b;

  return (*cmd1 - *cmd2) - (*cmd2 - *cmd1);
}

/* set information that is independent of customization, only called once */
/* if called from XS, can be called twice, once when loading Info, once
   when loading Plaintext */
void
plaintext_format_setup (enum converter_format format)
{
  int i;
  int format_raw_cmd_nr = 0;

  /* record for which format it was setup, to calling twice and to
     abort if called twice for the same format */
  if (setup_for_format == COF_none)
    setup_for_format = format;
  else
    {
      if (setup_for_format == format)
        {
          char *msg;
          xasprintf (&msg, "plaintext_format_setup called twice"
                           "for: %d %s\n",
                           format, converter_format_name (format));
          bug (msg);
          free (msg);
        }
      return;
    }

  static enum command_id ignored_brace_commands[] = {
      CM_caption, CM_shortcaption, CM_hyphenation, CM_sortas, CM_errormsg,
      CM_seeentry, CM_seealso, 0};

  static enum command_id ignored_block_commands[] = {
      CM_ignore, CM_macro, CM_rmacro, CM_linemacro, CM_copying,
      CM_documentdescription, CM_documentinfo, CM_publication, CM_titlepage,
      CM_titlepage, CM_direntry, CM_nodedescriptionblock, 0};

  static enum command_id non_formatted_line_command[] = {
    CM_page, CM_need, CM_vskip, CM_title, CM_subtitle, CM_title,
    CM_maketitle, 0};

  static enum command_id indented_commands[] = {
    CM_quotation, CM_smallquotation, CM_indentedblock, CM_smallindentedblock,
    CM_defblock, 0};

  static enum command_id format_context_commands[] = {
    CM_verbatim, CM_flushleft, CM_flushright, CM_multitable, CM_float, 0};

  static enum command_id punctuation_no_arg_commands[] = {
    CM_enddots, CM_exclamdown, CM_questiondown, 0};

  static enum command_id flush_commands[] = {
    CM_flushleft, CM_flushright, 0};

  static enum command_id advance_paragraph_count_commands[] = {
    CM_center, CM_verbatim, CM_listoffloats, 0};

  static enum command_id no_punctuation_munging_commands[] = {
    CM_cite, CM_dmn, 0};

  for (i = 0; ignored_brace_commands[i]; i++)
    plaintext_commands_data[ignored_brace_commands[i]].flags |= PF_ignored;

  for (i = 0; ignored_block_commands[i]; i++)
    plaintext_commands_data[ignored_block_commands[i]].flags |= PF_ignored;

  for (i = 0; punctuation_no_arg_commands[i]; i++)
    plaintext_commands_data[punctuation_no_arg_commands[i]].flags
                                               |= PF_punctuation_no_arg;

  for (i = 0; flush_commands[i]; i++)
    plaintext_commands_data[flush_commands[i]].flags |= PF_flush;

  for (i = 0; advance_paragraph_count_commands[i]; i++)
    plaintext_commands_data[advance_paragraph_count_commands[i]].flags
                                           |= PF_advance_paragraph_count;

  for (i = 0; no_punctuation_munging_commands[i]; i++)
    plaintext_commands_data[no_punctuation_munging_commands[i]].flags
                                           |= PF_no_punctuation_munging;

  /* count commands in some categories and set categories */
  for (i = 1; i < BUILTIN_CMD_NUMBER; i++)
    {
      plaintext_commands_data[i].indent_format_length = -1;
      if (command_data[i].flags & CF_nobrace)
        {
          if (command_data[i].other_flags & CF_formatted_nobrace)
            {}
          else
            plaintext_commands_data[i].flags |= PF_ignored;
        }
      else if (command_data[i].flags & CF_line)
        {
          if (command_data[i].other_flags & CF_formattable_line
              || command_data[i].other_flags & CF_formatted_line
              || command_data[i].flags & CF_def
              || command_data[i].flags & CF_index_entry_command)
            {}
          else
            plaintext_commands_data[i].flags |= PF_ignored;
        }
      else if (command_data[i].flags & CF_brace)
        {
          if (command_data[i].other_flags & CF_brace_code)
            plaintext_commands_data[i].flags |= PF_no_punctuation_munging;
        }
      else if (command_data[i].flags & CF_block)
        {
          if (command_data[i].data == BLOCK_menu)
            {
              plaintext_commands_data[i].flags |= PF_menu;
              plaintext_commands_data[i].flags |= PF_preformatted_context;
              plaintext_commands_data[i].flags |= PF_format_context;
            }
          else if (command_data[i].data != BLOCK_raw)
            {
              plaintext_commands_data[i].flags |= PF_advance_paragraph_count;

              if (command_data[i].data == BLOCK_format_raw)
                {
                  plaintext_commands_data[i].flags |= PF_format_raw;
                  plaintext_commands_data[i].flags |= PF_preformatted_context;
                  format_raw_cmd_nr++;
                }
              else if (command_data[i].flags & CF_math)
                {
                  plaintext_commands_data[i].flags |= PF_preformatted_context;
                  plaintext_commands_data[i].flags |= PF_format_context;
                }
              else if (command_data[i].flags & CF_def)
                {
                  plaintext_commands_data[i].flags |= PF_indented;
                  plaintext_commands_data[i].flags |= PF_format_context;
                }
              else if (command_data[i].flags & CF_preformatted)
                {
                  plaintext_commands_data[i].flags |= PF_preformatted_context;
                  if (i != CM_format && i != CM_smallformat)
                    {
                      plaintext_commands_data[i].flags |= PF_example_indented;
                      plaintext_commands_data[i].flags |= PF_indented;
                      plaintext_commands_data[i].flags |= PF_format_context;
                    }
                }
            }
        }
    }

  for (i = 0; indented_commands[i]; i++)
    {
      enum command_id cmd = indented_commands[i];
      plaintext_commands_data[cmd].flags |= PF_indented;
      plaintext_commands_data[cmd].flags |= PF_format_context;
    }

  for (i = 0; format_context_commands[i]; i++)
    plaintext_commands_data[format_context_commands[i]].flags
           |= PF_format_context;

  plaintext_commands_data[CM_verbatim].flags |= PF_preformatted_context;

  for (i = 0; item_indent_format_length[i].cmd != CM_NONE; i++)
    {
      enum command_id cmd = item_indent_format_length[i].cmd;
      plaintext_commands_data[cmd].flags |= PF_indented;
      plaintext_commands_data[cmd].flags |= PF_format_context;
      plaintext_commands_data[cmd].indent_format_length
        = item_indent_format_length[i].indent_format_length;
    }

  /* ignored formatted/formattable line commands */
  for (i = 0; non_formatted_line_command[i]; i++)
    plaintext_commands_data[non_formatted_line_command[i]].flags |= PF_ignored;

  /* not ignored line commands */
  for (i = 0; informative_global_commands[i]; i++)
    {
      enum command_id cmd = informative_global_commands[i];
      plaintext_commands_data[cmd].flags &= ~PF_ignored;
      plaintext_commands_data[cmd].flags |= PF_informative;
    }

  for (i = 0; contents_commands[i]; i++)
    plaintext_commands_data[contents_commands[i]].flags &= ~PF_ignored;

  plaintext_commands_data[CM_documentlanguagevariant].flags &= ~PF_ignored;

 /* group and raggedright do more than not advancing para, they should also
    be transparent with respect to paragraph number counting. */
  static enum command_id not_advancing_para[] = {
   CM_group, CM_raggedright, CM_titlepage, CM_copying,
   CM_documentdescription, CM_documentinfo, CM_publication, CM_float, 0};

  for (i = 0; not_advancing_para[i]; i++)
    plaintext_commands_data[not_advancing_para[i]].flags
                                     &= ~PF_advance_paragraph_count;

  initialize_cmd_list (&format_raw_cmd, format_raw_cmd_nr, 0);

  for (i = 0; i < BUILTIN_CMD_NUMBER; i++)
    {
      if (plaintext_commands_data[i].flags & PF_format_raw)
        {
          format_raw_cmd.list[format_raw_cmd.number] = i;
          format_raw_cmd.number++;
        }
    }

  static enum command_id asis_commands[] = {
    CM_asis, CM_w, CM_b, CM_i, CM_t, CM_r, CM_slanted, CM_sansserif,
    CM_verb, CM_clicksequence, CM_headitemfont, CM_dmn, 0
  };

  for (i = 0; (asis_commands[i]); i++)
    plaintext_commands_data[asis_commands[i]].flags |= PF_asis;

  static enum command_id quoted_commands[] = {
    CM_cite, CM_code, CM_command, CM_env, CM_file,
    CM_indicateurl, CM_kbd, CM_option, CM_samp, 0
  };

  for (i = 0; (quoted_commands[i]); i++)
    {
      enum command_id cmd = quoted_commands[i];
      plaintext_commands_data[cmd].flags |= PF_quoted;
      if (command_data[cmd].other_flags & CF_brace_code)
        plaintext_commands_data[cmd].flags |= PF_non_quoted_when_nested;
    }

  /* always quoted even when nested */
  plaintext_commands_data[CM_samp].flags &= ~PF_non_quoted_when_nested;
  plaintext_commands_data[CM_indicateurl].flags &= ~PF_non_quoted_when_nested;

  /*
  Commands producing styles that are output in node names and index entries.
   */
  static enum command_id index_style_commands[] = {
   CM_strong, CM_emph, CM_sub, CM_sup, CM_key, 0};

  for (i = 0; index_style_commands[i]; i++)
    plaintext_commands_data[index_style_commands[i]].flags
                                                   |= PF_index_style;

  /* Sort style_map by command. */
  int n = sizeof(style_map) / sizeof(style_map[0]);
  qsort (style_map, n, sizeof(style_map[0]), &compare_cmd_id_fn);

  for (i = 0; i < n; i++)
    plaintext_commands_data[style_map[i].cmd].flags |= PF_style_map;
}

void
plaintext_setup_output_encoding (CONVERTER *self)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;

  if (self->conf->OUTPUT_ENCODING_NAME.o.string
      && strcmp (self->conf->OUTPUT_ENCODING_NAME.o.string, "utf-8")
      && strcmp (self->conf->OUTPUT_ENCODING_NAME.o.string, "ascii"))
    {
      self_plaintext->encoding_object
           = get_encoding_conversion (
                            self->conf->OUTPUT_ENCODING_NAME.o.string,
                                            &output_conversions);
    }
}

void
plaintext_conversion_initialization (CONVERTER *self, DOCUMENT *document)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;

  converter_set_document (self, document);

  if (document->indices_info.number > 0)
    {
      converter_sort_index_names (self);

      if (self->sorted_index_names.number > 0)
        {
          size_t i;

          self_plaintext->index_entry_conversion_info = (INDEX_ENTRY_INFO **)
            malloc (sizeof (INDEX_ENTRY_INFO *)
                                    * self->sorted_index_names.number);

          for (i = 0; i < self->sorted_index_names.number; i++)
            {
              self_plaintext->index_entry_conversion_info[i]
               = (INDEX_ENTRY_INFO *) malloc (sizeof (INDEX_ENTRY_INFO)
                    * self->sorted_index_names.list[i]->entries_number);
              memset (self_plaintext->index_entry_conversion_info[i], 0,
                      sizeof (INDEX_ENTRY_INFO)
                        * self->sorted_index_names.list[i]->entries_number);
            }
        }
    }

  self_plaintext->node_names_cache
    = realloc (self_plaintext->node_names_cache,
               document->nodes_list.number * sizeof (STRING_WITH_WIDTH));
  memset (self_plaintext->node_names_cache, 0,
          document->nodes_list.number * sizeof (STRING_WITH_WIDTH));

  self_plaintext->encoding_object = 0;

  /* it is an error to have index entries outside of nodes, so there
     is no point optimizing the size of the hash */
  init_c_hashmap (&self_plaintext->index_entries_no_node, 10);

  init_c_hashmap (&self_plaintext->index_entry_node_colon,
                  document->nodes_list.number);

  init_c_hashmap (&self_plaintext->seen_node_descriptions,
                  document->nodes_list.number);

  init_c_hashmap (&self_plaintext->seenmenus,
                  document->nodes_list.number);

  set_global_document_commands (self, CL_before, informative_global_commands);
  set_global_document_commands (self, CL_before, contents_commands);

  /* No need for disabling encoding in output_files, since in C conversion
     is not setup there */

  self_plaintext->open_quote = "'";
  self_plaintext->close_quote = "'";
  self_plaintext->open_double_quote = "\"";
  self_plaintext->close_double_quote = "\"";

  if (self->conf->ENABLE_ENCODING.o.integer > 0
      && self->conf->OUTPUT_ENCODING_NAME.o.string)
    {
      free (self_plaintext->enabled_encoding);
      self_plaintext->enabled_encoding
         = strdup (self->conf->OUTPUT_ENCODING_NAME.o.string);
      if (!strcmp (self_plaintext->enabled_encoding, "utf-8"))
        {
          self_plaintext->to_utf8 = 1;
          /* UTF-8 left single quotation mark */
          self_plaintext->open_quote = "\xE2\x80\x98";
          /* UTF-8 right single quotation mark */
          self_plaintext->close_quote = "\xE2\x80\x99";
          /* UTF-8 left double quotation mark */
          self_plaintext->open_double_quote = "\xe2\x80\x9c";
          /* UTF-8 right double quotation mark */
          self_plaintext->close_double_quote = "\xe2\x80\x9d";
        }
    }

  if (self->conf->OPEN_QUOTE_SYMBOL.o.string)
    self_plaintext->open_quote = self->conf->OPEN_QUOTE_SYMBOL.o.string;

  if (self->conf->CLOSE_QUOTE_SYMBOL.o.string)
    self_plaintext->close_quote = self->conf->CLOSE_QUOTE_SYMBOL.o.string;

  if (self->conf->OPEN_DOUBLE_QUOTE_SYMBOL.o.string)
    self_plaintext->open_double_quote
       = self->conf->OPEN_DOUBLE_QUOTE_SYMBOL.o.string;

  if (self->conf->CLOSE_DOUBLE_QUOTE_SYMBOL.o.string)
    self_plaintext->close_double_quote
       = self->conf->CLOSE_DOUBLE_QUOTE_SYMBOL.o.string;

  /* initialize context stacks */

  push_count_context (&self_plaintext->count_context);

  /* _Root_context in Perl, in C use CM_NONE */
  push_top_formatter (self, CM_NONE);
}

void
plaintext_conversion_finalization (CONVERTER *self)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  size_t i;

  for (i = 0; i < self->document->nodes_list.number; i++)
    free (self_plaintext->node_names_cache[i].string);

  pop_top_formatter (self);

  if (self_plaintext->count_context.number != 1)
    {
      fprintf (stderr, "Remaining count_context at finalization (%zu)\n",
                       self_plaintext->count_context.number);
    }

  pop_count_context (&self_plaintext->count_context);

  clear_c_hashmap (&self_plaintext->index_entries_no_node);
  clear_c_hashmap (&self_plaintext->index_entry_node_colon);
  clear_c_hashmap (&self_plaintext->seen_node_descriptions);
  clear_c_hashmap (&self_plaintext->seenmenus);

  if (self_plaintext->outside_of_any_node_text.text)
    {
      text_destroy (&self_plaintext->outside_of_any_node_text);
      self_plaintext->outside_of_any_node_text_width = 0;
    }
  self_plaintext->current_node = 0;

  if (self_plaintext->text_before_first_node.text)
    text_destroy (&self_plaintext->text_before_first_node);

  if (self->sorted_index_names.number > 0)
    {
      for (i = 0; i < self->sorted_index_names.number; i++)
        free (self_plaintext->index_entry_conversion_info[i]);
      free (self_plaintext->index_entry_conversion_info);
    }
  self_plaintext->index_entry_conversion_info = 0;

  for (i = 0; i < self_plaintext->added_element.number; i++)
    destroy_element_and_children (self_plaintext->added_element.list[i]);
  self_plaintext->added_element.number = 0;

  if (self_plaintext->target_locations)
    {
      free (self_plaintext->target_locations->list);
      free (self_plaintext->target_locations);
      self_plaintext->target_locations = 0;
    }

  if (self_plaintext->element_images)
    {
      MATH_ELEMENT_IMAGE_LIST *images_lists[]
       = {&self_plaintext->element_images->math_images,
          &self_plaintext->element_images->displaymath_images, 0};
      int i;
      for (i = 0; images_lists[i]; i++)
        {
          MATH_ELEMENT_IMAGE_LIST *image_list = images_lists[i];
          if (image_list->number)
            {
              size_t j;
              for (j = 0; j < image_list->number; j++)
                free (image_list->list[j].filename);
            }
          free (image_list->list);
        }
      free (self_plaintext->element_images);
      self_plaintext->element_images = 0;
    }
}

/* Also set in plaintext_paragraph.c */
/* ignored after end sentence character to determine if
   at the end of a sentence */
#define after_punctuation_characters "\"')]"
/* characters triggering an end of sentence */
#define end_sentence_characters ".?!"

static char *
protect_sentence_ends (const char *text)
{
  TEXT t;
  text_init (&t);

  const char *p = text;

  while (*p)
    {
      const char *q = strpbrk (p, end_sentence_characters);
      if (q)
        {
          const char *l = q;
          l++;
          if (*l)
            {
              l += strspn (l, after_punctuation_characters);
              if (*l)
                {
                  if (strchr (whitespace_chars, *l))
                    l++;
                  else
                    {
                      text_append_n (&t, p, l-p);
                      p = l;
                      continue;
                    }
                }
            }
          if (q > text)
            {
   /* now check that character before punctuation is not upper-case */
              int len = 0;
              const char *r = q;
              /* Back one UTF-8 code point */
              do
                {
                  r--;
                  len++;
                }
              while ((*r & 0xC0) == 0x80 && r > text);

              char32_t wc;
              u8_mbtouc (&wc, (uint8_t *) r, len);
              if (uc_is_upper (wc))
                {
                  text_append_n (&t, p, l-p);
                  p = l;
                  continue;
                }
            }
          /* add up to the punctuation */
          text_append_n (&t, p, q-p);
          text_append_n (&t, "\x08", 1);
       /* add after_punctuation_characters/space text, if any */
          text_append_n (&t, q, l-q);
          p = l;
        }
      else
        {
          text_append (&t, p);
          break;
        }
    }
  /* Also insert a control character at end of string, to protect a full stop
     that may follow later */
  if (t.end > 0)
    {
      p = t.text + t.end;
      while (p > t.text && strchr (after_punctuation_characters, *(p-1)))
        p--;
      if (p == t.text)
        return t.text;
      if (!strchr (whitespace_chars, *(p-1)))
        {
          int len = 0;
          /* Back one UTF-8 code point */
          do
            {
              p--;
              len++;
            }
          while ((*p & 0xC0) == 0x80 && p > t.text);
          char32_t wc;
          u8_mbtouc (&wc, (uint8_t *) p, len);
          if (!uc_is_upper (wc))
            {
              text_append_n (&t, "\x08", 1);
            }
        }
    }
  return t.text;
}

static void
add_lines_count (CONVERTER *self, int lines_count)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
    = top_(count_context) (&self_plaintext->count_context);

  count_context->lines += lines_count;
}

void
plaintext_add_quoted_image (CONVERTER *self, TEXT *image_string,
                            TEXT *image_quoted, TEXT *trailing_text)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
      = top_(count_context) (&self_plaintext->count_context);
  PENDING_TEXT_LIST *pending = &count_context->pending_text;
  PENDING_TEXT *pending_image = add_top_pending_text (pending,
                                                      PLT_quoted_image);
  pending_image->l.image_string = *image_string;
  text_append_n (&pending_image->text,
                 image_quoted->text, image_quoted->end);
  free (image_quoted->text);
  PENDING_TEXT *trailing = add_top_pending_text (pending, PLT_text);
  if (trailing_text)
    {
      text_append_n (&trailing->text, trailing_text->text,
                                      trailing_text->end);
      free (trailing_text->text);
    }
}

void
stream_output_n (CONVERTER *self, const char *text, size_t n)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
    = top_(count_context) (&self_plaintext->count_context);
  PENDING_TEXT *pending_text
    = top_(pending_text) (&count_context->pending_text);

  text_append_n (&pending_text->text, text, n);
}

void
stream_output (CONVERTER *self, const char *text)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
    = top_(count_context) (&self_plaintext->count_context);
  PENDING_TEXT *pending_text
    = top_(pending_text) (&count_context->pending_text);

  text_append (&pending_text->text, text);
  /*
  fprintf (stderr, "STREAM '%s' => '%s'\n", text,
              debug_print_pending (&count_context->pending_text));
   */
}

static void
stream_output_count_nl (CONVERTER *self, const TEXT text)
{
  int count;
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
    = top_(count_context) (&self_plaintext->count_context);

  count = para_end_line_count ();
  count_context->lines += count;

  if (text.text)
    stream_output_n (self, text.text, text.end);
}

void
stream_output_add_text (CONVERTER *self, const char *text, size_t len)
{
  const TEXT result = para_add_text (text, len);

  stream_output_count_nl (self, result);
}

/* Pass $TEXT to add_next and output the resulting text.  Used for
   concision in calling code. */
void
stream_output_add_next (CONVERTER *self, const char *text, size_t len)
{
  const TEXT result = para_add_next (text, len, 0);

  stream_output_count_nl (self, result);
}

static void
stream_encode (CONVERTER *self, PENDING_TEXT_LIST *pending_texts, TEXT *result)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  size_t i;

  for (i = 0; i < pending_texts->number; i++)
    {
      PENDING_TEXT *pending_text = &pending_texts->list[i];
      if (!self_plaintext->encoding_object)
        {
          text_append_n (result, pending_text->text.text,
                         pending_text->text.end);
          if (self_plaintext->target_locations)
            self_plaintext->bytes += pending_text->text.end;
        }
      else
        {
          TEXT converted_text
            = encode_with_iconv (self_plaintext->encoding_object->iconv,
                                 pending_text->text.text,
                                 pending_text->text.end,
                                 0, ieh_error, 0);
          text_append_n (result, converted_text.text, converted_text.end);
          if (self_plaintext->target_locations)
            self_plaintext->bytes += converted_text.end;
          free (converted_text.text);
        }
      text_reset (&pending_text->text);
      if (pending_text->type == PLT_quoted_image)
        {
          text_destroy (&pending_text->l.image_string);
        }
      else if (self_plaintext->target_locations
               && pending_text->type == PLT_anchor)
        {
          TARGET_LOCATION target_location;
          target_location.target_element = pending_text->l.anchor;
          target_location.bytes = self_plaintext->bytes;

          add_(target_location) (self_plaintext->target_locations,
                                 target_location);
          pending_text->l.anchor = 0;
        }
      pending_text->type = PLT_text;
    }
}

void
stream_final_result (CONVERTER *self, TEXT *result)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
    = top_(count_context) (&self_plaintext->count_context);

  stream_encode (self, &count_context->pending_text, result);
  count_context->pending_text.number = 1;
}

/* insert $ELEMENT in output text. */
void
plaintext_add_target_location (CONVERTER *self, const ELEMENT *element)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
    = top_(count_context) (&self_plaintext->count_context);
  PENDING_TEXT *top_pending_text
    = top_(pending_text) (&count_context->pending_text);
  if (top_pending_text->type == PLT_text)
    {
      top_pending_text->type = PLT_anchor;
      top_pending_text->l.anchor = element;
    }
  else
    {
      PENDING_TEXT *pending_anchor
        = add_top_pending_text (&count_context->pending_text, PLT_anchor);
      pending_anchor->l.anchor = element;
    }

  add_top_pending_text (&count_context->pending_text, PLT_text);
}

int
plaintext_convert_line (CONVERTER *self, const ELEMENT *converted,
                        int indent_length, int indent_length_next,
                        int suppress_styles, int no_added_eol)
{
  FORMATTER formatter = new_formatter(self, formatter_line, indent_length,
                                      indent_length_next);
  if (suppress_styles >= 0)
    formatter.suppress_styles = suppress_styles;
  if (no_added_eol >= 0)
    formatter.no_added_eol = no_added_eol;

  int width;

  push_formatter (self, &formatter);
  convert_to_plaintext_internal (self, converted);
  const TEXT end_line = para_end ();
  width = para_counter ();
  if (end_line.text)
    stream_output_n (self, end_line.text, end_line.end);
  para_destroy ();
  pop_formatter (self, 0);
  return width;
}

/* convert with a line formatter in a new context.
   Leave the result of the conversion in the new context (on the top
   of the stack) and return a pointer to it in OUTPUT.
   The caller is supposed to use the result of the conversion and
   reset the texts soon after the return of the call.
 */
void
plaintext_convert_line_new_context (CONVERTER *self,
                          const ELEMENT *converted,
                          int indent_length, int indent_length_next,
                          int suppress_styles, int no_added_eol,
                          LINE_WIDTH_PENDING_TEXT *output)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  push_count_context (&self_plaintext->count_context);

  output->width = plaintext_convert_line (self, converted, indent_length,
                          indent_length_next, suppress_styles, no_added_eol);

  COUNT_CONTEXT *count_context
    = top_(count_context) (&self_plaintext->count_context);
  /* beware that the pointer will be invalidated by a realloc, so it should
     be used before the count context stack can grow.  This is not an
     issue in practice as the pending text are used/released right after
     the call to the function.
   */
  output->pending_text = &count_context->pending_text;
  pop_count_context (&self_plaintext->count_context);
}

static void
update_locations_counts (CONVERTER *self, COUNT_CONTEXT *parent_counts,
                         COUNT_CONTEXT *counts)
{
  int lines = parent_counts->lines;
  size_t i;

  for (i = 0; i < counts->index_entry_locations.number; i++)
    {
      int *location = counts->index_entry_locations.list[i];
      *location += lines;

      add_(index_entry_location) (
            &parent_counts->index_entry_locations, location);
    }
  counts->index_entry_locations.number = 0;
}

/* Called at the beginning of a line.  Add a blank line if the output does
   not already end in one. */
void
add_newline_if_needed (CONVERTER *self)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
        = top_(count_context) (&self_plaintext->count_context);
  PENDING_TEXT_LIST *pending_texts = &count_context->pending_text;

   /*
  if (pending_texts->number == 0)
    fatal ("add_newline_if_needed: no pending text");
   */

  int nl_to_find = 2;
  size_t nr;
  size_t end_idx = 0;
  for (nr = pending_texts->number; nr > 0; nr--)
    {
      PENDING_TEXT *pending_text = &pending_texts->list[nr -1];
      TEXT *pending = &pending_text->text;
      end_idx = pending->end;
      while (nl_to_find && end_idx > 0)
        {
          if (pending->text[end_idx -1] == '\n')
            {
              nl_to_find--;
              end_idx--;
            }
          else
            break;
        }
      if (end_idx > 0)
        break;
    }
  if (nl_to_find > 0 && end_idx > 0)
    {
      stream_output_n (self, "\n", 1);
      add_lines_count (self, 1);
    }
}

static void
ensure_end_of_line (CONVERTER *self)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
        = top_(count_context) (&self_plaintext->count_context);
  PENDING_TEXT_LIST *pending_texts = &count_context->pending_text;

   /*
  if (pending_texts->number == 0)
    fatal ("ensure_end_of_line: no pending text");
   */

  int with_location = 0;
  size_t nr;
  for (nr = pending_texts->number; nr > 0; nr--)
    {
      PENDING_TEXT *pending_text = &pending_texts->list[nr -1];
      TEXT *t_pending = &pending_text->text;

      if (pending_text->type != PLT_text)
        with_location = 1;

      if (t_pending->end == 0)
        continue;
      if (t_pending->text[t_pending->end -1] != '\n')
        {
          TEXT_CONTEXT *text_element_context
            = top_(text_element_context) (
                      &self_plaintext->text_element_context);
          if (!with_location)
            text_append_n (t_pending, "\n", 1);
          else
            {
   /* add new pending text to keep the anchor/image before the end of line */
              PENDING_TEXT *new_nl
                = add_top_pending_text (pending_texts, PLT_text);
              text_append_n (&new_nl->text, "\n", 1);
            }
          add_lines_count (self, 1);
          text_element_context->counter = 0;
        }
      return;
    }
}

/* Anchors are silently ignored */
TEXT
pending_to_text (PENDING_TEXT_LIST *pending_texts)
{
  size_t i;
  TEXT t;

  text_init (&t);

  for (i = 0; i < pending_texts->number; i++)
    {
      PENDING_TEXT *pending_text = &pending_texts->list[i];
      text_append_n (&t, pending_text->text.text, pending_text->text.end);

      text_reset (&pending_text->text);
      if (pending_text->type == PLT_anchor)
        {
          pending_text->l.anchor = 0;
        }
      else if (pending_text->type == PLT_quoted_image)
        {
          text_destroy (&pending_text->l.image_string);
        }
      pending_text->type = PLT_text;
    }
  pending_texts->number = 0;
  return t;
}

/* Anchors are silently ignored */
static TEXT
stream_to_text (CONVERTER *self)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
        = top_(count_context) (&self_plaintext->count_context);

  return pending_to_text (&count_context->pending_text);
}

/* Return anchors in ANCHORS_OUT. */
/* Images are ignored. */
static TEXT
stream_to_text_anchor (CONVERTER *self, CONST_ELEMENT_LIST *anchors_out)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
        = top_(count_context) (&self_plaintext->count_context);
  PENDING_TEXT_LIST *pending_texts = &count_context->pending_text;

  size_t i;
  TEXT t;

  text_init (&t);

  for (i = 0; i < pending_texts->number; i++)
    {
      PENDING_TEXT *pending_text = &pending_texts->list[i];
      text_append_n (&t, pending_text->text.text, pending_text->text.end);

      text_reset (&pending_text->text);
      if (pending_text->type == PLT_anchor)
        {
          add_(const_element) (anchors_out, pending_text->l.anchor);
          pending_text->l.anchor = 0;
        }
      else if (pending_text->type == PLT_quoted_image)
        {
          text_destroy (&pending_text->l.image_string);
        }
      pending_text->type = PLT_text;
    }
  return t;
}

static FORMATTER *node_names_formatter;

static void
plaintext_convert_node_name (CONVERTER *self, const ELEMENT *element,
                             STRING_WITH_WIDTH *string_result)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  const ELEMENT *label_element = get_label_element (element);
  ELEMENT *node_text;
  TEXT result;

  if (!label_element)
    {
      /* external node */
      label_element = lookup_extra_container (element, AI_key_node_content);
    }

  node_text = new_element (ET__code);
  /* cast to drop const */
  add_to_contents_as_array (node_text, (ELEMENT *)label_element);

  if (!node_names_formatter)
    {
      node_names_formatter = (FORMATTER *) malloc (sizeof (FORMATTER));
      memset (node_names_formatter, 0, sizeof (FORMATTER));
      fill_formatter (node_names_formatter, self, formatter_line, 0, -1);
      node_names_formatter->suppress_styles = 1;
      node_names_formatter->no_added_eol = 1;
    }

  push_count_context (&self_plaintext->count_context);
  push_formatter (self, node_names_formatter);

  convert_to_plaintext_internal (self, node_text);
  const TEXT pending_word = para_add_pending_word (0);
  stream_output_n (self, pending_word.text, pending_word.end);
  result = stream_to_text (self);
  normalize_top_node_name_text (&result);
  string_result->width = para_counter ();

  para_end_line ();
  destroy_element (node_text);

  pop_count_context (&self_plaintext->count_context);
  pop_formatter (self, 1);

  string_result->string = result.text;
  string_result->len = result.end;
}

/* NOTE do caching for nodes in nodes_list only, for two reasons.
   First, it is easier, as nodes have the node_number which allows
   for an easy setup of an array for indexing, other elements would
   need something else, maybe an hash for integers based on pointers.
   Second, other elements are unlikely to be needed many times
   in formatting as cached names.
 */
void
plaintext_node_name (CONVERTER *self, const ELEMENT *element,
                     STRING_WITH_WIDTH *string_result)
{
  if (element->e.c->cmd == CM_node)
    {
      int status;
      size_t node_number = lookup_extra_integer (element,
                                        AI_key_node_number, &status);
      if (status == 0)
        {
          PLAINTEXT_CONVERTER_STATE *self_plaintext
              = self->plaintext_converter;
          const STRING_WITH_WIDTH *node_name
            = &self_plaintext->node_names_cache[node_number -1];

          if (!node_name->string)
            {
              STRING_WITH_WIDTH *new_node_name
                = &self_plaintext->node_names_cache[node_number -1];
              plaintext_convert_node_name (self, element,
                                           new_node_name);
            }

          /* allow NUL in string */
          string_result->string = malloc ((node_name->len +1) * sizeof (char));
          memcpy (string_result->string, node_name->string,
                  (node_name->len +1) * sizeof (char));
          string_result->width = node_name->width;
          string_result->len = node_name->len;
          return;
        }
    }
  plaintext_convert_node_name (self, element, string_result);
}

/* the advantage of using that function is that we know that nodes only
   are processed and the $label_element can be obtained more simply
   than when the node is setup by a call to node_name(). */
void
plaintext_cache_node_names (CONVERTER *self, NODE_RELATIONS_LIST *nodes_list)
{
  size_t i;
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  ELEMENT *node_text = new_element (ET__code);

  if (!node_names_formatter)
    {
      node_names_formatter = (FORMATTER *) malloc (sizeof (FORMATTER));
      memset (node_names_formatter, 0, sizeof (FORMATTER));
      fill_formatter (node_names_formatter, self, formatter_line, 0, -1);
      node_names_formatter->suppress_styles = 1;
      node_names_formatter->no_added_eol = 1;
    }

  push_formatter (self, node_names_formatter);

  for (i = 0; i < self->document->nodes_list.number; i++)
    {
      TEXT result;

      STRING_WITH_WIDTH *node_name = &self_plaintext->node_names_cache[i];

      const ELEMENT *node = self->document->nodes_list.list[i]->element;
      const ELEMENT *label_element = node->e.c->contents.list[0]
                                                 ->e.c->contents.list[0];

      /* cast to drop const */
      add_to_contents_as_array (node_text, (ELEMENT *)label_element);

      push_count_context (&self_plaintext->count_context);

      convert_to_plaintext_internal (self, node_text);
      const TEXT pending_word = para_add_pending_word (0);
      stream_output_n (self, pending_word.text, pending_word.end);
      result = stream_to_text (self);
      normalize_top_node_name_text (&result);
      node_name->width = para_counter ();
      node_name->string = result.text;
      node_name->len = result.end;

      /* reset counters */
      para_end_line ();

      pop_count_context (&self_plaintext->count_context);

      pop_element_from_contents (node_text);
    }
  pop_formatter (self, 1);

  destroy_element (node_text);
}

static void
open_code (FORMATTER *formatter)
{
  FONT_TYPE *top_font_type = top_(font_type) (formatter->font_type_stack);

  if (!top_font_type->monospace)
    {
      FONT_TYPE font_type = { 0 };
      font_type.monospace = 1;
      add_(font_type) (formatter->font_type_stack, font_type);
    }
  else
    top_font_type->monospace++;

  add_(integer) (&formatter->frenchspacing_stack, 1);
  para_set_conf_frenchspacing (1);
}

static void
close_code (FORMATTER *formatter)
{
  FONT_TYPE *top_font_type = top_(font_type) (formatter->font_type_stack);

  top_font_type->monospace--;
  if (top_font_type->monospace == 0)
    pop_(font_type) (formatter->font_type_stack);

  pop_(integer) (&formatter->frenchspacing_stack);
  para_set_conf_frenchspacing (*(top_(integer)
                                 (&formatter->frenchspacing_stack)));
}

static PLAINTEXT_FORMAT_FUNCTIONS plaintext_functions[];

def_list_fns(PENDING_FOOTNOTE_LIST, pending_footnote, PENDING_FOOTNOTE, 3);
def_stack_fns(PENDING_FOOTNOTE_LIST, pending_footnote, PENDING_FOOTNOTE);

static int footnote_indent = 3;
#define NO_NUMBER_FOOTNOTE_SYMBOL "*"

void
plaintext_process_footnotes (CONVERTER *self, const OUTPUT_UNIT *output_unit)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  /* may not be used */
  FORMATTER formatter = new_formatter (self, formatter_line, -1, -1);

  push_formatter (self, &formatter);

  if (self_plaintext->pending_footnotes.number > 0)
    {
      ELEMENT *label_element = 0;
      const ELEMENT *node_element;
      const char *identifier;
      ELEMENT *footnotes_node = 0;
      size_t i;

      if (output_unit && output_unit->uc.unit_command)
        {
          node_element = output_unit->uc.unit_command;

          if (node_element->e.c->cmd == CM_node)
            {
              identifier
                = lookup_extra_string (node_element, AI_key_identifier);
              if (identifier)
                {
                  const ELEMENT *arguments_line
                    = node_element->e.c->contents.list[0];
                  label_element = arguments_line->e.c->contents.list[0];
                }
            }
        }

      add_newline_if_needed (self);

      if (!self->conf->footnotestyle.o.string
          || strcmp (self->conf->footnotestyle.o.string, "separate")
        /* no node label happens only in very special cases, such as
           a @footnote in @copying and @insertcopying (and USE_NODES=0?) */
          || !label_element)
        {
          stream_output (self, "   ---------- Footnotes ----------\n\n");
          add_lines_count (self, 2);
        }
      else
        {
          ELEMENT *footnotes_node_arg = new_element (ET_line_arg);
          ELEMENT *footnotes_suffix = new_element (ET_other_text);
          footnotes_node
            = new_command_element (ET_line_command, CM_node);
          ELEMENT *footnote_arguments_line
            = new_element (ET_arguments_line);
          ELEMENT *label_element_copy = copy_contents (label_element, 0,
                                                       ET_NONE);
          char *footnote_node_id;
          NODE_RELATIONS footnotes_node_relations = { 0 };

          text_append_n (footnotes_suffix->e.text, "-Footnotes", 10);
          xasprintf (&footnote_node_id, "%s-Footnotes", identifier);

          add_to_element_contents (footnotes_node_arg, label_element_copy);
          add_element_to_element_contents (footnotes_node_arg,
                                           footnotes_suffix);
          add_element_to_element_contents (footnote_arguments_line,
                                           footnotes_node_arg);
          add_element_to_element_contents (footnotes_node,
                                           footnote_arguments_line);
          footnotes_node->flags |= EF_is_target;
          add_extra_string (footnotes_node, AI_key_identifier,
                            footnote_node_id);

          footnotes_node_relations.element = footnotes_node;
          footnotes_node_relations.node_directions = new_directions ();
          footnotes_node_relations.node_directions[D_up] = node_element;

          plaintext_functions[self->format].format_node (self, footnotes_node,
                                                   &footnotes_node_relations);

          free (footnotes_node_relations.node_directions);

          self_plaintext->current_node = footnotes_node;
          add_(element) (&self_plaintext->added_element, footnotes_node);
        }

      for (i = 0; i < self_plaintext->pending_footnotes.number; i++)
        {
          enum command_id old_context_cmd;
          const PENDING_FOOTNOTE *footnote_info
            = &self_plaintext->pending_footnotes.list[i];
          int j;

     /* If nested within another footnote and footnotestyle is separate,
        the element here will be the parent element and not the footnote
        element, while the pxref will point to the name with the
        footnote node taken into account.  Not really problematic as
        nested footnotes are not right. */

          if (label_element && self_plaintext->target_locations)
            {
              char *footnote_anchor_id;

              ELEMENT *footnote_anchor_arg = new_element (ET_brace_arg);
              ELEMENT *footnote_anchor = new_command_element (ET_brace_command,
                                                              CM_anchor);
              ELEMENT *label_element_copy = copy_contents (label_element, 0,
                                                           ET_NONE);
              ELEMENT *footnote_anchor_postfix_e
                = new_text_element (ET_other_text);
              text_printf (footnote_anchor_postfix_e->e.text, "-Footnote-%d",
                           footnote_info->number);

              add_to_element_contents (footnote_anchor_arg, label_element_copy);
              add_element_to_element_contents (footnote_anchor_arg,
                                               footnote_anchor_postfix_e);

              xasprintf (&footnote_anchor_id, "%s%s", identifier,
                         footnote_anchor_postfix_e->e.text->text);

              footnote_anchor->flags |= EF_is_target;
              add_extra_string (footnote_anchor, AI_key_identifier,
                                footnote_anchor_id);
              add_to_element_contents (footnote_anchor, footnote_anchor_arg);

              plaintext_add_target_location (self, footnote_anchor);
              add_(element) (&self_plaintext->added_element, footnote_anchor);
            }

          push_top_formatter (self, CM_footnote);


          TEXT_CONTEXT *text_element_context
            = top_(text_element_context) (
                               &self_plaintext->text_element_context);
          for (j = 0; j < footnote_indent; j++)
            {
              stream_output_n (self, " ", 1);
            }
          text_element_context->counter += footnote_indent;

          if (self->conf->NUMBER_FOOTNOTES.o.integer > 0)
            {
              char *formatted_footnote_number_str;
              xasprintf (&formatted_footnote_number_str, "(%d) ",
                         footnote_info->number);

              stream_output (self, formatted_footnote_number_str);
              text_element_context->counter
                 += strlen (formatted_footnote_number_str);
              free (formatted_footnote_number_str);
            }
          else
            {
              stream_output (self, "(" NO_NUMBER_FOOTNOTE_SYMBOL ") ");
              text_element_context->counter += 4;
            }

          if (footnote_info->element->e.c->contents.number > 0)
            convert_to_plaintext_internal (self,
                        footnote_info->element->e.c->contents.list[0]);

          add_newline_if_needed (self);

          if (footnote_info->added)
            destroy_tree_added_elements (footnote_info->added);

          old_context_cmd = pop_top_formatter (self);
          if (old_context_cmd != CM_footnote)
            abort ();
        }
      self_plaintext->pending_footnotes.number = 0;
    }

  self_plaintext->footnote_index = 0;

  const TEXT end_result = para_end ();
  stream_output_count_nl (self, end_result);

  para_destroy ();
  pop_formatter (self, 0);
}

/* move SOURCE to the end of DST_PENDING_TEXT, exchanging the pending texts
   to keep the allocated memory */
static void
merge_pending_texts (PENDING_TEXT_LIST *dst_pending_texts,
                     PENDING_TEXT_LIST *source)
{
  size_t i;
  for (i = 0; i < source->number; i++)
    {
      /* swap source and destination, in case destination has some
         unused allocated memory */
      PENDING_TEXT *top_pending_text
        = add_top_pending_text (dst_pending_texts, PLT_text);
      PENDING_TEXT tmp = *top_pending_text;
      *top_pending_text = source->list[i];
       /*
      fprintf (stderr, "SWAP %p <- %p\n", top_pending_text, &source->list[i]);
        */
      source->list[i] = tmp;
    }
  source->number = 0;
}

static void
merge_pending_with_parent (CONVERTER *self,
                           PENDING_TEXT_LIST *pending_texts)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
    = top_(count_context) (&self_plaintext->count_context);
  PENDING_TEXT_LIST *parent_pending_texts = &count_context->pending_text;

  merge_pending_texts (parent_pending_texts, pending_texts);
}

static unsigned int IMAGE_WIDTH = 3;

static size_t
pending_texts_width (const PENDING_TEXT_LIST *pending_texts)
{
  size_t i;
  size_t width = 0;

  for (i = 0; i < pending_texts->number; i++)
    {
      PENDING_TEXT *pending_text = &pending_texts->list[i];
      if (pending_text->type == PLT_quoted_image)
        width += IMAGE_WIDTH;
      else
        width += width_multibyte (pending_text->text.text,
                                  pending_text->text.end);
    }
  return width;
}

static int
pending_text_has_anchor (const PENDING_TEXT_LIST *pending_texts)
{
  size_t i;
  for (i = 0; i < pending_texts->number; i++)
    {
      PENDING_TEXT *pending_text = &pending_texts->list[i];
      if (pending_text->type == PLT_anchor)
        return 1;
    }
  return 0;
}

enum align_directions {
   AD_right,
   AD_center,
   AD_left, /* unused */
};

static int
compute_spaces_align_line (int line_width, int max_column,
                           enum align_directions direction)
{
  int prepended_spaces;
  if (line_width > max_column)
    prepended_spaces = 0;
  else if (direction == AD_center)
    prepended_spaces = (max_column -1 - line_width) / 2;
  else
    prepended_spaces = max_column -1 - line_width;

  return prepended_spaces;
}

decl_list_fns(PENDING_TEXT_LIST_LINES, pending_text_line, PENDING_TEXT_LIST);
def_list_fns(PENDING_TEXT_LIST_LINES, pending_text_line, PENDING_TEXT_LIST, 3);

/* replace dst_pending_text by src_pending_text, releasing the memory in
   dst and zeroing src_pending_text such that it is clear that it
   does not hold anything anymore */
static void
replace_pending_text (PENDING_TEXT *dst_pending_text,
                      PENDING_TEXT *src_pending_text)
{
  TEXT *dst_t = &dst_pending_text->text;
  /* debugging, verify that nothing is replaced */
  if (dst_pending_text->type == PLT_anchor)
    {
      char *texi = target_element_to_texi_label (dst_pending_text->l.anchor);
      fprintf (stderr, "BUG: replace_pending_text: got an anchor [%s]\n", texi);
      free (texi);
    }
  else if (dst_pending_text->type == PLT_quoted_image)
    {
      fprintf (stderr, "BUG: replace_pending_text: got an image {%s}\n",
                       dst_pending_text->l.image_string.text);
      text_destroy (&dst_pending_text->l.image_string);
    }
  if (dst_pending_text->type != PLT_quoted_image && dst_t->end > 0)
    fprintf (stderr, "BUG: replace_pending_text: got text '%s'\n",
             dst_t->text);
  /* end debugging */

  text_destroy (dst_t);
  *dst_pending_text = *src_pending_text;
  memset (src_pending_text, 0, sizeof (PENDING_TEXT));
}

/* move SOURCE to DST_PENDING_TEXTS end, releasing memory of destination
 */
static void
move_pending_texts (PENDING_TEXT_LIST *dst_pending_texts,
                    PENDING_TEXT_LIST *source)
{
  size_t i;
  for (i = 0; i < source->number; i++)
    {
      PENDING_TEXT *top_pending_text
        = add_top_pending_text (dst_pending_texts, PLT_text);
      replace_pending_text (top_pending_text, &source->list[i]);
    }
  source->number = 0;
}

/* while collecting, the input pending texts are reset */
/* embedded NUL are allowed */
static void
collect_pending_texts_lines (PENDING_TEXT_LIST_LINES *pending_text_lines,
                             PENDING_TEXT_LIST *pending_texts)
{
  size_t i;
  PENDING_TEXT_LIST current_line = { 0 };
  for (i = 0; i < pending_texts->number; i++)
    {
      PENDING_TEXT *pending_text = &pending_texts->list[i];
      TEXT *t = &pending_text->text;

      if (pending_text->type == PLT_quoted_image
          || pending_text->type == PLT_protected_text)
        {
          add_(pending_text) (&current_line, *pending_text);
          if (t->text[t->end -1] == '\n')
            {
              add_(pending_text_line) (pending_text_lines,
                                       current_line);
              memset (&current_line, 0, sizeof (PENDING_TEXT_LIST));
            }
          if (pending_text->type == PLT_quoted_image)
            memset (&pending_text->l.image_string, 0, sizeof (TEXT));
          pending_text->type = PLT_text;
          memset (t, 0, sizeof (TEXT));
          continue;
        }
      else if (t->end == 0)
        {
          if (pending_text->type == PLT_anchor)
            {
              add_(pending_text) (&current_line, *pending_text);
              pending_text->l.anchor = 0;
              pending_text->type = PLT_text;
              memset (t, 0, sizeof (TEXT));
            }
          continue;
        }

      PENDING_TEXT *last_pending = 0;
      const char *p = t->text;
      int remaining = t->end;
      while (remaining > 0)
        {
          PENDING_TEXT line_pending_text = { 0 };
          text_init (&line_pending_text.text);

          const char *q = memchr (p, '\n', remaining);
          if (!q)
            text_append_n (&line_pending_text.text, p, remaining);
          else
            {
              text_append_n (&line_pending_text.text, p, q - p);
              remaining -= q - p +1;
              p = q+1;
            }
          add_(pending_text) (&current_line, line_pending_text);
          last_pending = top_(pending_text) (&current_line);
          if (q)
            {
              add_(pending_text_line) (pending_text_lines,
                                       current_line);
              memset (&current_line, 0, sizeof (PENDING_TEXT_LIST));
            }
          else
            break;
        }
      last_pending->type = pending_text->type;
      if (pending_text->type == PLT_anchor)
        {
          last_pending->l.anchor = pending_text->l.anchor;
          pending_text->l.anchor = 0;
          pending_text->type = PLT_text;
        }
      text_reset (t);
    }
  if (current_line.number > 0)
    {
      add_(pending_text_line) (pending_text_lines, current_line);
    }
  pending_texts->number = 0;
}

static void
free_pending_texts (PENDING_TEXT_LIST *pending_texts, const char *msg)
{
  size_t j;
  for (j = 0; j < pending_texts->number; j++)
    {
      PENDING_TEXT *pending_text = &pending_texts->list[j];
      TEXT *t = &pending_text->text;
      /* debugging */
      if (pending_text->type == PLT_anchor)
        {
          char *texi = target_element_to_texi_label (pending_text->l.anchor);
          fprintf (stderr, "FREE ALOSE: %s %zu [%s]\n", msg, j, texi);
          free (texi);
        }
      else if (pending_text->type == PLT_quoted_image)
        {
          fprintf (stderr, "FREE ILOSE: %s %zu {%s}\n", msg, j,
                  pending_text->l.image_string.text);
          free (pending_text->l.image_string.text);
        }
      if (pending_text->type != PLT_quoted_image)
        {
          if (t->end > 0)
            {
              fprintf (stderr, "FREE LOSE T %s %zu '%s'\n", msg, j, t->text);
              free (t->text);
            }
          else if (t->text)
            {
              fprintf (stderr, "FREE LOSE T RESET %s %zu\n", msg, j);
              free (t->text);
            }
        }
      /* end debugging */
    }
}

static void
clear_pending_text_lines (PENDING_TEXT_LIST_LINES *pending_text_lines)
{
  size_t i;
  for (i = 0; i < pending_text_lines->number; i++)
    {
      PENDING_TEXT_LIST *line = &pending_text_lines->list[i];
      char *line_msg;
      xasprintf (&line_msg, "%zu", i);
      free_pending_texts (line, line_msg);
      free (line_msg);
      free (line->list);
    }
  pending_text_lines->number = 0;
}

static void
free_pending_text_lines (PENDING_TEXT_LIST_LINES *pending_text_lines)
{
  clear_pending_text_lines (pending_text_lines);
  free (pending_text_lines->list);
}

static void
align_lines (CONVERTER *self, int max_column, enum align_directions direction,
             PENDING_TEXT_LIST *pending_texts)
{
  size_t i;
  PENDING_TEXT_LIST_LINES pending_text_lines;
  memset (&pending_text_lines, 0, sizeof (PENDING_TEXT_LIST_LINES));
  collect_pending_texts_lines (&pending_text_lines, pending_texts);

  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *top_count_context
           = top_(count_context) (&self_plaintext->count_context);
  PENDING_TEXT_LIST *result = &top_count_context->pending_text;

  int line_index = 0;
  for (i = 0; i < pending_text_lines.number; i++)
    {
      size_t j;
      PENDING_TEXT_LIST *line = &pending_text_lines.list[i];

      for (j = 0; j < line->number; j++)
        {
          PENDING_TEXT *pending_text = &line->list[j];

          if (pending_text->type == PLT_protected_text)
            break;

          TEXT *t = &pending_text->text;
          size_t leading_spaces
             = strspn (t->text, whitespace_chars);
          if (leading_spaces < t->end)
            {
              size_t remaining = t->end - leading_spaces;
              TEXT tmp;
              text_init (&tmp);
              text_append_n (&tmp, t->text + leading_spaces,
                             remaining);
              text_destroy (t);
              pending_text->text = tmp;
              break;
            }
          else if (leading_spaces > 0)
            text_reset (t);
        }
      for (j = line->number; j > 0; j--)
        {
          PENDING_TEXT *pending_text = &line->list[j -1];
          TEXT *t = &pending_text->text;

          if (pending_text->type == PLT_protected_text)
            {
              if (t->end > 0 && t->text[t->end -1] == '\n')
                {
                  t->text[t->end -1] = '\0';
                  t->end--;
                }
              break;
            }

          if (t->end > 0)
            {
              size_t l;
              for (l = t->end; l > 0; l--)
                {
                  if (t->text[l-1] != '\0'
                      && strchr (whitespace_chars,
                                 t->text[l-1]))
                    {
                      t->text[l-1] = '\0';
                      t->end--;
                    }
                  else
                    break;
                }
              if (t->end > 0)
                break;
            }
        }

      size_t line_width = pending_texts_width (line);
      int has_anchor = 0;
      if (line_width == 0)
        has_anchor = pending_text_has_anchor (line);

      if (line_width > 0 || has_anchor)
        {
          int prepended_spaces = compute_spaces_align_line (line_width,
                                             max_column, direction);
          if (prepended_spaces > 0)
            {
              int l;
              for (l = 0; l < prepended_spaces; l++)
                stream_output_n (self, " ", 1);
            }
          move_pending_texts (result, line);
          if (result->list[result->number -1].type != PLT_text)
            {
     /* add an empty text if the last pending is not regular text such
        that an anchor does not have its location modified and image
        text is not modified either */
              add_top_pending_text (result, PLT_text);
            }
        }
      else
        {/* release the empty texts memory */
          size_t i;
          for (i = 0; i < line->number; i++)
            text_destroy (&line->list[i].text);
        }

   /* do not add an end of line for the last line, leave it to the caller.
      For @center it is more consistent because the end of line is in an
      ignored text element.
      For flushright, it means that it is possible to ignore a fully
      empty @flushright (although this is not really important).
    */
      if ((size_t)line_index < pending_text_lines.number -1)
        stream_output_n (self, "\n", 1);

      line_index++;
    }
  free_pending_text_lines (&pending_text_lines);
}

static void
align_environment (CONVERTER *self, int max,
                   enum align_directions direction)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;

  COUNT_CONTEXT *count_context
        = top_(count_context) (&self_plaintext->count_context);
  COUNT_CONTEXT *parent_count_context
        = &self_plaintext->count_context.list[
             self_plaintext->count_context.number -2];

  update_locations_counts (self, parent_count_context, count_context);

  pop_count_context (&self_plaintext->count_context);

  align_lines (self, max, direction, &count_context->pending_text);
  parent_count_context->lines += count_context->lines;
}

static void
section_element_heading (CONVERTER *self, const ELEMENT *section_element,
                         ELEMENT *heading_element, int numbered,
                         LINE_WIDTH_PENDING_TEXT *section_text)
{
  const char *section_number
   = lookup_extra_string (section_element, AI_key_section_heading_number);
  int numbered_section = (section_number && numbered);
  int status;
  int section_level = lookup_extra_integer (section_element,
                                       AI_key_section_level, &status);
  ELEMENT *heading_e = new_element (ET__frenchspacing);
  ELEMENT *section_title_tree;

  if (numbered_section)
    {
      NAMED_STRING_ELEMENT_LIST *replaced_substrings
        = new_named_string_element_list ();
      ELEMENT *e_number = new_text_element (ET_normal_text);
      add_to_contents_as_array (heading_e, heading_element);

      add_element_to_named_string_element_list (
                          replaced_substrings, "section_title",
                          heading_e);
      text_append (e_number->e.text, section_number);
      add_element_to_named_string_element_list (
                          replaced_substrings, "number", e_number);

      if (section_element->e.c->cmd == CM_appendix && section_level == 1)
          section_title_tree
              = cdt_tree ("Appendix {number} {section_title}",
                                  self, replaced_substrings, 0);
      else
        section_title_tree = cdt_tree ("{number} {section_title}",
                                         self, replaced_substrings, 0);

      destroy_named_string_element_list (replaced_substrings);
    }
  else
   {
     section_title_tree = heading_e;
     add_to_contents_as_array (section_title_tree, heading_element);
   }

  plaintext_convert_line_new_context (self, section_title_tree,
                                                  -1, -1, -1, -1,
                                                  section_text);
  if (numbered_section)
    {
      /* remove heading_element, which is in the original tree */
      pop_element_from_contents (heading_e);
      destroy_element_and_children (section_title_tree);
    }
  else
    destroy_element (section_title_tree);
}

void
plaintext_format_contents (CONVERTER *self, SECTIONING_ROOT *sectioning_root,
                           enum command_id contents_or_shortcontents_cmd)
{
  int is_contents = (contents_or_shortcontents_cmd == CM_contents);
  const SECTION_RELATIONS_LIST *root_children;
  int status;
  int root_level;
  size_t i;
  int lines_count = 0;

  if (!sectioning_root)
    return;

  root_children = &sectioning_root->section_children;
  root_level = lookup_extra_integer (root_children->list[0]->element,
                                     AI_key_section_level,
                                     &status);

  for (i = 0; i < root_children->number; i++)
    {
      const ELEMENT *top_section = root_children->list[i]->element;
      int section_level
        = lookup_extra_integer (top_section, AI_key_section_level, &status);
      if (section_level < root_level)
        root_level = section_level;
    }

 /* This is done like that because the tree may not be well formed if
    there is a @part after a @chapter for example. */
  for (i = 0; i < root_children->number; i++)
    {
      const SECTION_RELATIONS *top_relations = root_children->list[i];
      const SECTION_RELATIONS *section_relations = top_relations;
      while (section_relations)
        {
          const ELEMENT *section = section_relations->element;
          const ELEMENT *arguments_line = section->e.c->contents.list[0];
          ELEMENT *line_arg = arguments_line->e.c->contents.list[0];
          int status;
          int section_level = lookup_extra_integer (section,
                                       AI_key_section_level, &status);
          LINE_WIDTH_PENDING_TEXT section_text;

          int repeat_count = 2 * (section_level - (root_level+1));
          if (repeat_count > 0)
            {
              int j;
              for (j = 0; j < repeat_count; j++)
                stream_output_n (self, " ", 1);
            }

          section_element_heading (self, section, line_arg,
                            self->conf->NUMBER_SECTIONS.o.integer != 0,
                            &section_text);

          /* this function is only called for plaintext, anchors are not
             collected in plaintext, therefore there cannot be anchors
             in pending text. */
          TEXT text = pending_to_text (section_text.pending_text);
          stream_output_n (self, text.text, text.end);
          if (text.text[text.end -1] != '\n')
            stream_output_n (self, "\n", 1);
          lines_count++;
          free (text.text);

          if (section_relations->section_children
              && section_relations->section_children->number > 0
              && (is_contents || section_level < root_level+1))
            section_relations = section_relations->section_children->list[0];
          else if (section_relations->section_directions
                   && section_relations->section_directions[D_next])
            {
              if (section_relations == top_relations)
                break;

              section_relations
                = section_relations->section_directions[D_next];
            }
          else
            {
              if (section_relations == top_relations)
                break;

              while (section_relations->section_directions
                     && section_relations->section_directions[D_up])
                {
                  section_relations
                    = section_relations->section_directions[D_up];

                  if (section_relations == top_relations)
                    {
                      section_relations = NULL;
                      break;
                    }

                  if (section_relations->section_directions
                      && section_relations->section_directions[D_next])
                    {
                      section_relations
                        = section_relations->section_directions[D_next];
                      break;
                    }
                }
            }
        }
    }
  add_lines_count (self, lines_count);
}

static void
menu (CONVERTER *self, const ELEMENT *menu_command)
{
  if (menu_command->e.c->cmd == CM_menu)
    {
      PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
      stream_output_n (self, "* Menu:\n\n", 9);
      add_lines_count (self, 2);

      if (self_plaintext->current_node)
        {
          const char *identifier
           = lookup_extra_string (self_plaintext->current_node,
                                  AI_key_identifier);
          c_hashmap_register (&self_plaintext->seenmenus,
                              identifier, 0);
        }
    }
}

static int index_length_to_node = 41;

static const char *node_quote = "\x7f";

void
plaintext_process_printindex (CONVERTER *self,
                              const ELEMENT *printindex, int in_info)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  const STRING_LIST *misc_args;
  const char *index_name;
  INDEX_SORTED_BY_INDEX *sorted_indexes;
  char *language;
  const INDEX_SORTED_BY_INDEX *idx;
  const INDEX_SORTED_BY_INDEX *index_sorted = 0;
  size_t i;
  int max_index_line_nr_string_length = 0;
  char *line_nr_with_max_format;
  /* number of index entries that refer to something else than an index entry
     in a node.  Corresponding with @seeentry or @seealso */
  size_t reference_entries_nr = 0;
  size_t other_entries_nr = 0;
  FORMATTER formatter = { 0 };
  TEXT entry_line;
  TEXT line_part;
  C_HASHMAP *entry_counts;
  int fillcolumn = self->conf->FILLCOLUMN.o.integer;

  /* misc_args is not set with NO_INDEX set */
  misc_args = lookup_extra_string_list (printindex, AI_key_misc_args);
  if (misc_args && misc_args->number > 0)
    index_name = misc_args->list[0];
  else
    return;

  /* not sure that it can happen */
  if (!self->document)
    return;

  sorted_indexes = get_converter_indices_sorted_by_index (self, &language);

  if (!sorted_indexes)
    return;

  for (idx = sorted_indexes; idx->name; idx++)
    {
      if (!strcmp (idx->name, index_name))
        {
          index_sorted = idx;
          break;
        }
    }
  /* no entries should not be possible, as only indices with entries are
     left in sorted index names array */
  if (!index_sorted || !index_sorted->entries_number)
    return;

  /* NOTE could cache entry_index_nr index_entry_info->number in an
     array per sorted index entry to reuse in the second loop instead
     of calling index_number_index_by_name and lookup_extra_index_entry
     again.  Not sure that it is worth it.
   */

  for (i = 0; i < index_sorted->entries_number; i++)
    {
      INDEX_ENTRY_INFO *entry_info;
      const INDEX_ENTRY *index_entry = index_sorted->entries[i];
      const ELEMENT *main_entry_element = index_entry->entry_element;
      const ELEMENT *node = 0;
      char *line_nr_string;
      int index_line_nr_string_length;
      size_t entry_index_nr;
      const INDEX_ENTRY_LOCATION *index_entry_info;

      const ELEMENT *seealso;
      const ELEMENT *seeentry = index_entry_referred_entry (main_entry_element,
                                                            CM_seeentry);
      int line_nr = 0;

      if (seeentry)
        {
          reference_entries_nr++;
          continue;
        }

      seealso = index_entry_referred_entry (main_entry_element, CM_seealso);
      if (seealso)
        {
          reference_entries_nr++;
          continue;
        }

      entry_index_nr
       = index_number_index_by_name (&self->sorted_index_names,
                                    index_entry->index_name);
      index_entry_info
        = lookup_extra_index_entry (main_entry_element, AI_key_index_entry);
      entry_info = &self_plaintext->index_entry_conversion_info
         [entry_index_nr -1][index_entry_info->number -1];

      if (entry_info->location)
        {
          line_nr = *entry_info->location;
          entry_info->ignored = 0;
        }
      else
       {
      /* ignore index entries in special regions that haven't been seen */
          const char *element_region
            = lookup_extra_string (main_entry_element, AI_key_element_region);
          if (element_region)
            {
              entry_info->ignored = 1;
              continue;
            }
        }

    /* priority given to the location determined dynamically as the
       index entry may be in footnote. */
      if (entry_info->node)
        node = entry_info->node;
      else
        {
          const char *element_node
            = lookup_extra_string (main_entry_element, AI_key_element_node);
          if (element_node)
            {
              C_HASHMAP *identifiers_target = &self->document->identifiers_target;
              node = find_identifier_target (identifiers_target, element_node);
              entry_info->node = node;
            }
        }

      if (!node)
        line_nr = 0;
      else if (in_info)
        {
          if (line_nr == 0)
            line_nr = 4;
          else if (line_nr < 3)
            line_nr = 3;
        }
      xasprintf (&line_nr_string, "%d", line_nr);
      index_line_nr_string_length
         = width_multibyte (line_nr_string, strlen (line_nr_string));
      free (line_nr_string);
      if (max_index_line_nr_string_length < index_line_nr_string_length)
        max_index_line_nr_string_length = index_line_nr_string_length;
      entry_info->line_nr = line_nr;
      other_entries_nr++;
    }

  if (other_entries_nr + reference_entries_nr == 0)
    return;

  add_newline_if_needed (self);

  if (in_info)
    {
      stream_output_n (self, "\x00\x08[index\x00\x08]\n", 12);
      add_lines_count (self, 1);
    }

  stream_output_n (self, "* Menu:\n\n", 9);
  add_lines_count (self, 2);

  /* this is used to count entries that are the same */
  entry_counts = new_c_hashmap (index_sorted->entries_number);

  /* Use the same line formatter for all the index entries.  This is
     slightly faster than making a new one for each entry. */
  fill_formatter (&formatter, self, formatter_line, 0, -1);
  formatter.suppress_styles = 1;
  formatter.no_added_eol = 1;
  push_formatter (self, &formatter);

  text_init (&entry_line);
  text_init (&line_part);

  xasprintf (&line_nr_with_max_format, "%%%dd",
             max_index_line_nr_string_length);

  for (i = 0; i < index_sorted->entries_number; i++)
    {
      const INDEX_ENTRY *index_entry = index_sorted->entries[i];
      const ELEMENT *main_entry_element = index_entry->entry_element;
      ELEMENT *entry_content_element;
      ELEMENT *entry_tree_element;
      ELEMENT_LIST *subentries_tree;
      size_t entry_index_nr;
      const INDEX *entry_index;
      int in_code;
      const ELEMENT *seeentry;
      const ELEMENT *referred_entry = 0;
      TEXT entry_text;
      int found;
      uintptr_t entry_text_count;
      int line_width = 0;
      const ELEMENT *node;
      int line_part_width;
      int spaces_nr;
      int j;
      const INDEX_ENTRY_LOCATION *index_entry_info;
      INDEX_ENTRY_INFO *entry_info;

      entry_index_nr
       = index_number_index_by_name (&self->sorted_index_names,
                                    index_entry->index_name);
      index_entry_info
        = lookup_extra_index_entry (main_entry_element, AI_key_index_entry);
      entry_info = &self_plaintext->index_entry_conversion_info
         [entry_index_nr -1][index_entry_info->number -1];

      if (entry_info->ignored)
        continue;

      entry_content_element
        = converter_index_content_element (main_entry_element, self, 0);

      subentries_tree = comma_index_subentries_tree (main_entry_element, 0);

      entry_index = self->sorted_index_names.list[entry_index_nr-1];
      in_code = entry_index->in_code;

      if (in_code)
        entry_tree_element = new_element (ET__code);
      else
        entry_tree_element = new_element (ET__frenchspacing);

      add_to_contents_as_array (entry_tree_element, entry_content_element);

      if (subentries_tree)
        {
          insert_list_slice_into_contents (entry_tree_element,
                               entry_tree_element->e.c->contents.number,
                               subentries_tree, 0,
                               subentries_tree->number);
        }

      /* Convert entry text in a new context in order to capture result. */
      push_count_context (&self_plaintext->count_context);
      convert_to_plaintext_internal (self, entry_tree_element);
      const TEXT end_result = para_end ();
      stream_output_count_nl (self, end_result);
      entry_text = stream_to_text (self);
      pop_count_context (&self_plaintext->count_context);

      if (entry_text.text[strspn (entry_text.text, whitespace_chars)] == '\0')
        goto finalize_entry;

      seeentry = index_entry_referred_entry (main_entry_element, CM_seeentry);
      if (seeentry)
        referred_entry = seeentry;
      else
        referred_entry
          = index_entry_referred_entry (main_entry_element, CM_seealso);

      if (referred_entry)
        {
          ELEMENT *referred_tree;
          ELEMENT *reference_tree;
          NAMED_STRING_ELEMENT_LIST *substrings
             = new_named_string_element_list ();

          ELEMENT *referred_copy
           = copy_element_tree (referred_entry->e.c->contents.list[0], 0);

          if (in_code)
            referred_tree = new_element (ET__code);
          else
            referred_tree = new_element (ET_NONE);

          add_to_contents_as_array (referred_tree, referred_copy);

     /* indent with the same width as '* ', but do not use * such that the
       info readers never find a cross reference for @seeentry or @seealso */
          stream_output_n (self, "  ", 2);
          line_width += 2;

          if (seeentry)
            {
              ELEMENT *entry_tree_copy
                = copy_element_tree (entry_tree_element, 0);
              add_element_to_named_string_element_list (substrings,
                                                "main_index_entry",
                                                entry_tree_copy);
              add_element_to_named_string_element_list (substrings,
                                              "seeentry", referred_tree);
              reference_tree
                = cdt_tree ("{main_index_entry}, See@: {seeentry}", self,
                            substrings, 0);
            }
          else
            {
              add_element_to_named_string_element_list (substrings,
                                          "see_also_entry", referred_tree);
              stream_output_n (self, entry_text.text, entry_text.end);
              stream_output_n (self, ": ", 2);
              line_width += width_multibyte (entry_text.text,
                                             entry_text.end) +2;
              if (line_width < index_length_to_node)
                {
                  int j;
                  for (j = 0; j < index_length_to_node - line_width; j++)
                    stream_output_n (self, " ", 1);
                }
              reference_tree = cdt_tree ("See also {see_also_entry}",
                                        self, substrings, 0);
            }

          convert_to_plaintext_internal (self, reference_tree);
          const TEXT end_result = para_end ();
          stream_output_count_nl (self, end_result);
          stream_output_n (self, ".\n", 2);
          add_lines_count (self, 1);

          destroy_named_string_element_list (substrings);
          destroy_element_and_children (reference_tree);
          goto finalize_entry;
        }

  /* No need for protection, the Info readers should find the last : on
     the line.  : in the node following the index entry node should be
     protected, however, as done below, such that : in the node are not
     mistaken as being part of the index entry. */

      if (self->conf->INDEX_SPECIAL_CHARS_WARNING.o.integer > 0
          && !self_plaintext->silent)
        {
          const char *check_chars = ":";

          const char *p = strpbrk (entry_text.text, check_chars);

          if (p)
            {
              char *texinfo_string = convert_to_texinfo (entry_tree_element);
              const char *command_name
                = element_command_name (main_entry_element);
              if (!command_name)
                {
                  command_name
                    = lookup_extra_string (main_entry_element,
                                          AI_key_original_def_cmdname);
                }

              message_list_command_warn (&self->error_messages,
                            (self->conf && self->conf->DEBUG.o.integer > 0),
                           main_entry_element, 0,
                    "Index entry in @%s with : produces invalid Info: %s",
                          command_name, texinfo_string);
              free (texinfo_string);
            }
        }

      text_append_n (&entry_line, "* ", 2);
      text_append_n (&entry_line, entry_text.text, entry_text.end);
      entry_text_count
         = (uintptr_t)c_hashmap_value (entry_counts, entry_text.text, &found);
      if (found)
        {
          entry_text_count++;
          c_hashmap_set_value (entry_counts,
                           entry_text.text, (const void *)entry_text_count);
          text_printf (&entry_line, " <%" PRIuPTR ">", entry_text_count);
        }
      else
        {
          entry_text_count = 0;
          c_hashmap_register (entry_counts,
                           entry_text.text, (const void *)entry_text_count);
        }

      text_append_n (&entry_line, ": ", 2);
      stream_output_n (self, entry_line.text, entry_line.end);

      line_width = width_multibyte (entry_line.text, entry_line.end);
      text_reset (&entry_line);

      if (line_width < index_length_to_node)
        {
          int j;
          for (j = 0; j < index_length_to_node - line_width; j++)
            stream_output_n (self, " ", 1);
          line_width = index_length_to_node;
        }

      node = entry_info->node;

      if (!node)
        {
          /* cache the transformation to text and byte counting, as
             it is likely that there is more than one such entry */
          if (!self_plaintext->outside_of_any_node_text.text)
            {
              ELEMENT *tree = cdt_tree ("(outside of any node)",
                                        self, 0 ,0);
              LINE_WIDTH_PENDING_TEXT outside_node_text;
              plaintext_convert_line_new_context (self, tree,
                                                  -1, -1, -1, -1,
                                             &outside_node_text);

              self_plaintext->outside_of_any_node_text
                 = pending_to_text (outside_node_text.pending_text);
              self_plaintext->outside_of_any_node_text_width
                 = outside_node_text.width;

              destroy_element_and_children (tree);
            }
          stream_output_n (self, self_plaintext->outside_of_any_node_text.text,
                           self_plaintext->outside_of_any_node_text.end);
          line_width += self_plaintext->outside_of_any_node_text_width;
    /* TODO when outside of sectioning commands this message was already
       done by the Parser.
       Warn, only once. */
          if (!self_plaintext->silent)
            {
              char *entry_unique_string;

              xasprintf (&entry_unique_string, "%s-%d",
                         index_entry->index_name, index_entry->number);

              if (! is_c_hashmap_registered (
                            &self_plaintext->index_entries_no_node,
                                       entry_unique_string))
                {
                  message_list_command_warn (&self->error_messages,
                            (self->conf && self->conf->DEBUG.o.integer > 0),
                           main_entry_element, 0,
                     "entry for index `%s' outside of any node",
                       index_entry->index_name);

                  c_hashmap_register (&self_plaintext->index_entries_no_node,
                                      entry_unique_string, 0);
                }
              free (entry_unique_string);
            }
        }
      else
        {
          STRING_WITH_WIDTH node_name;
          const char *p;
          int quoting_required = 0;
          int warn_special_char = (!self_plaintext->silent
                  && self->conf->INFO_SPECIAL_CHARS_WARNING.o.integer > 0);

          plaintext_node_name (self, node, &node_name);

          if (warn_special_char
              || self->conf->INFO_SPECIAL_CHARS_QUOTE.o.integer > 0)
            {
     /* protect characters that need to be protected in menu node entry
        after menu entry name and also :, as the Info readers
        should consider text up to : to be part of the index entry. */
              p = node_name.string;
              char warned_char[3];
              while (*p)
                {
                  /* protect ,\t: and . followed by whitespace_chars */
                  const char *q = strpbrk (p, ",\t:.");
                  if (!q)
                    break;
                  if (*q == '.')
                    {
                      if (! *(q+1))
                        break;
                      if (!strchr (whitespace_chars, *(q+1)))
                        {
                          p = q+1;
                          continue;
                        }
                      warned_char[1] = *(q+1);
                      warned_char[2] = '\0';
                    }
                  else
                    warned_char[1] = '\0';
                  warned_char[0] = *q;

                  if (warn_special_char)
                    {
                      if (! is_c_hashmap_registered (
                            &self_plaintext->index_entry_node_colon,
                                       node_name.string))
                        {
                          message_list_command_warn (&self->error_messages,
                            (self->conf && self->conf->DEBUG.o.integer > 0),
                           node, 0,
                  "node name with index entries should not contain `%s'",
                           warned_char);

                          c_hashmap_register (
                                 &self_plaintext->index_entry_node_colon,
                                          node_name.string, 0);
                        }
                    }

                  if (self->conf->INFO_SPECIAL_CHARS_QUOTE.o.integer > 0)
                    quoting_required = 1;

                  break;
                }
            }

          if (quoting_required)
            stream_output_n (self, node_quote, 1);
          stream_output_n (self, node_name.string, node_name.len);
          line_width += node_name.width;
          if (quoting_required)
            stream_output_n (self, node_quote, 1);

          free (node_name.string);
        }

      stream_output_n (self, ".", 1);
      line_width++;

      text_append_n (&line_part, "(line ", 6);
      /* line_nr_with_max_format is "%" max_index_line_nr_string_length "d" */
      text_printf (&line_part, line_nr_with_max_format, entry_info->line_nr);
      text_append_n (&line_part, ")", 1);

      line_part_width = width_multibyte (line_part.text, line_part.end);

      if (line_width + line_part_width +1 > fillcolumn)
        {
          stream_output_n (self, "\n", 1);
          add_lines_count (self, 1);
          spaces_nr = fillcolumn - line_part_width;
        }
      else
        spaces_nr = fillcolumn - line_part_width - line_width;

      for (j = 0; j < spaces_nr; j++)
        stream_output_n (self, " ", 1);

      stream_output_n (self, line_part.text, line_part.end);

      text_reset (&line_part);

      stream_output_n (self, "\n", 1);
      add_lines_count (self, 1);

     finalize_entry:
      free (entry_text.text);
      if (subentries_tree)
        free_comma_index_subentries_tree (subentries_tree);
      destroy_element (entry_tree_element);
      destroy_element_and_children (entry_content_element);
    }

  para_destroy ();
  pop_formatter (self, 0);

  stream_output_n (self, "\n", 1);
  add_lines_count (self, 1);

  clear_c_hashmap (entry_counts);
  free (entry_counts);

  free (entry_line.text);
  free (line_part.text);

  free (line_nr_with_max_format);
}

void
plaintext_format_printindex (CONVERTER *self, const ELEMENT *printindex)
{
  plaintext_process_printindex (self, printindex, 0);
}

void
plaintext_format_ref (CONVERTER *self, enum command_id cmd,
                      const ELEMENT *element)
{
  const size_t max_xref_args = 5;
  const ELEMENT *args[max_xref_args];
  const ELEMENT *arg_node;
  const ELEMENT *label_element = 0;
  const ELEMENT *target_element = 0;
  ELEMENT *float_type_number_element = 0;
  ELEMENT *file_code_element = 0;
  ELEMENT *file_stop_upper_case_element = 0;
  ELEMENT *node_code_element = 0;
  ELEMENT *node_stop_upper_case_element = 0;
  ELEMENT *node_suppress_styles_element = 0;
  /* next elements are temporarily modified during copy, so cannot be
     const, but they are conceptually const */
  ELEMENT *file = 0;
  ELEMENT *node = 0;
  ELEMENT *book = 0;
  ELEMENT *name = 0;
  size_t i;
  NAMED_STRING_ELEMENT_LIST *substrings;
  ELEMENT *tree;

  /* no args may happen with bogus @-commands without argument, maybe only
     at the end of a document */

  if (!element->e.c->contents.number)
    return;
  else if (element->e.c->contents.number > max_xref_args)
    fatal ("xref command with too many arguments");

  memset (args, 0, max_xref_args * sizeof (const ELEMENT *));

  for (i = 0; i < element->e.c->contents.number; i++)
    {
      const ELEMENT *arg = element->e.c->contents.list[i];
      if (!empty_spaces_argument (arg))
        args[i] = arg;
    }

  arg_node = element->e.c->contents.list[0];

  /* normalize node name, to get a ref with the right formatting
     NOTE as a consequence, the line numbers appearing in case of errors
     correspond to the node lines numbers, and not the @ref. */
  /* exclude external nodes (in case internal refs get normalized) */
  if (!args[3] && !args[4])
    {
      const char *normalized
       = lookup_extra_string (arg_node, AI_key_normalized);
      const ELEMENT *manual_content = lookup_extra_container (arg_node,
                                                      AI_key_manual_content);
      if (normalized && !manual_content)
        {
          target_element = find_identifier_target (
                                  &self->document->identifiers_target,
                                  normalized);
          if (target_element)
            label_element = get_label_element (target_element);
        }
    }
  if (!label_element)
    /* may still be NULL if node argument is empty */
    label_element = args[0];

  /* if it a reference to a float with a label, $args[1] is
     set to '$type $number' or '$number' if there is no type. */
  if (!args[1] && target_element && target_element->e.c->cmd == CM_float)
    {
      float_type_number_element = float_type_number (self, target_element);
      args[1] = float_type_number_element;
    }

  if (cmd == CM_inforef && args[2])
    {
      args[3] = args[2];
      args[2] = 0;
    }

  if (args[1])
    name = (ELEMENT *) args[1];
  else if (args[2])
    name = (ELEMENT *) args[2];

  if (args[3])
    {
      file_code_element = new_element (ET__code);
      /* cast to drop const */
      add_to_contents_as_array (file_code_element, (ELEMENT *)args[3]);
      file_stop_upper_case_element = new_element (ET__stop_upper_case);
      add_to_element_contents (file_stop_upper_case_element,
                               file_code_element);
      file = file_stop_upper_case_element;
    }
  else if (args[4])
    book = (ELEMENT *) args[4];

  if (label_element)
    {
      node_suppress_styles_element = new_element (ET__suppress_styles);
      /* cast to drop const */
      add_to_contents_as_array (node_suppress_styles_element,
                                (ELEMENT *)label_element);
      node_code_element = new_element (ET__code);
      add_to_element_contents (node_code_element, node_suppress_styles_element);
      node_stop_upper_case_element = new_element (ET__stop_upper_case);
      add_to_element_contents (node_stop_upper_case_element,
                               node_code_element);
      node = node_stop_upper_case_element;
    }

  substrings = new_named_string_element_list ();

  if (node)
    {
      add_element_to_named_string_element_list (substrings,
                                                "node", node);
      if (file)
        {
          ELEMENT *file_copy = copy_element_tree (file, 0);
          add_element_to_named_string_element_list (substrings,
                                                    "file", file_copy);
          if (name)
            {
              ELEMENT *name_copy = copy_element_tree (name, 0);
              add_element_to_named_string_element_list (substrings,
                                                     "name", name_copy);
              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See {name}: ({file}){node}", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see {name}: ({file}){node}", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("{name}: ({file}){node}", self,
                                 substrings, 0);
            }
          else
            {
              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See ({file}){node}", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see ({file}){node}", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("({file}){node}", self,
                                 substrings, 0);
            }
       }
     else if (book)
       {
          ELEMENT *book_copy = copy_element_tree (book, 0);
          add_element_to_named_string_element_list (substrings,
                                               "book", book_copy);
          if (name)
            {
              ELEMENT *name_copy = copy_element_tree (name, 0);
              add_element_to_named_string_element_list (substrings,
                                                     "name", name_copy);
              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See {name}: {node} in @cite{{book}}", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see {name}: {node} in @cite{{book}}", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("{name}: {node} in @cite{{book}}", self,
                                 substrings, 0);
            }
          else
            {
              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See {node} in @cite{{book}}", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see {node} in @cite{{book}}", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("{node} in @cite{{book}}", self,
                                 substrings, 0);
            }
       }
     else
       {
          if (name)
            {
              ELEMENT *name_copy = copy_element_tree (name, 0);
              add_element_to_named_string_element_list (substrings,
                                                     "name", name_copy);
              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See {name}: {node}", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see {name}: {node}", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("{name}: {node}", self,
                                 substrings, 0);
            }
          else
            {
              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See {node}", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see {node}", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("{node}", self,
                                 substrings, 0);
            }
        }
    }
   else
    {
      if (file)
        {
          ELEMENT *file_copy = copy_element_tree (file, 0);
          add_element_to_named_string_element_list (substrings,
                                                    "file", file_copy);
          if (name)
            {
              ELEMENT *name_copy = copy_element_tree (name, 0);
              add_element_to_named_string_element_list (substrings,
                                                     "name", name_copy);
              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See {name}({file})", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see {name}({file})", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("{name}({file})", self,
                                 substrings, 0);
            }
          else
            {
              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See ({file})", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see ({file})", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("({file})", self,
                                 substrings, 0);
            }
       }
     else if (book)
       {
          ELEMENT *book_copy = copy_element_tree (book, 0);
          add_element_to_named_string_element_list (substrings,
                                               "book", book_copy);
          if (name)
            {
              ELEMENT *name_copy = copy_element_tree (name, 0);
              add_element_to_named_string_element_list (substrings,
                                                     "name", name_copy);
              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See {name} in @cite{{book}}", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see {name} in @cite{{book}}", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("{name} in @cite{{book}}", self,
                                 substrings, 0);
            }
          else
            {
              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See @cite{{book}}", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see @cite{{book}}", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("@cite{{book}}", self,
                                 substrings, 0);
            }
       }
     else
       {
          if (name)
            {
              ELEMENT *name_copy = copy_element_tree (name, 0);
              add_element_to_named_string_element_list (substrings,
                                                     "name", name_copy);
              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See {name}", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see {name}", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("{name}", self,
                                 substrings, 0);
            }
          else
            {
              ELEMENT *top_text = new_text_element (ET_other_text);
              text_append_n (top_text->e.text, "Top", 3);
              add_element_to_named_string_element_list (substrings,
                                                        "node", top_text);

              if (cmd == CM_xref || cmd == CM_inforef)
                tree = cdt_tree ("See {node}", self,
                                 substrings, 0);
              else if (cmd == CM_pxref)
                tree = cdt_tree ("see {node}", self,
                                 substrings, 0);
              else
                tree = cdt_tree ("{node}", self,
                                 substrings, 0);
            }
        }
    }

  destroy_named_string_element_list (substrings);

  convert_to_plaintext_internal (self, tree);

  /* remove label_element, which is in the tree */
  if (node)
    pop_element_from_contents (node_suppress_styles_element);

  /* this destroys the elements added for node formatting */
  destroy_element_and_children (tree);

  if (file_code_element)
    {
      destroy_element (file_code_element);
      destroy_element (file_stop_upper_case_element);
    }

  if (float_type_number_element)
    destroy_element_and_children (float_type_number_element);
}

void
plaintext_format_node (CONVERTER *self, const ELEMENT *node,
                       const NODE_RELATIONS *node_relations)
{
}

void
plaintext_format_error_outside_of_any_node (CONVERTER *self,
                                            const ELEMENT *element)
{
}

static void
plaintext_format_anchor (CONVERTER *self, const ELEMENT *anchor)
{
}

int
plaintext_stream_image_formatted_text (CONVERTER *self, const ELEMENT *element,
                                       const char *basefile, TEXT text)
{
  int lines_count = 0;
  if (text.text)
    {
      PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
      COUNT_CONTEXT *count_context
        = top_(count_context) (&self_plaintext->count_context);
      PENDING_TEXT_LIST *pending = &count_context->pending_text;
      const char *p = text.text;
      size_t len = text.end;
      /* split lines and add them to pending texts as protexted text */
      while (len > 0)
        {
          PENDING_TEXT *pending_text
            = add_top_pending_text (pending, PLT_protected_text);
          TEXT *t = &pending_text->text;
          const char *q = memchr (p, '\n', len);
          if (q)
            len -= q - p +1;

          /* last line */
          if (!q)
            { /* last line without new line */
              text_append_n (t, p, len);
              break;
            }
          else if (len == 0)
            { /* last line, do not keep the new line character */
              text_append_n (t, p, q - p);
              break;
            }
          else
            {
              lines_count++;
              text_append_n (t, p, q - p +1);
              p = q +1;
            }
        }
      add_top_pending_text (pending, PLT_text);
      return lines_count;
    }

  TEXT result;
  text_init (&result);

  text_append_n (&result, "[", 1);
  if (element->e.c->contents.number >= 4
      && !empty_spaces_argument (element->e.c->contents.list[3]))
    {
      TEXT alt = convert_to_text_text (element->e.c->contents.list[3],
                                       self->convert_text_options);
      text_append_n (&result, alt.text, alt.end);
      free (alt.text);
    }
  else
    {
      PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
      if (!self_plaintext->silent)
        {
          message_list_command_warn (&self->error_messages,
                            (self->conf && self->conf->DEBUG.o.integer > 0),
                            element, 0,
                    "could not find @image file `%s.txt' nor alternate text",
                           basefile);
        }

      text_append (&result, basefile);
    }
  text_append_n (&result, "]", 1);

  const char *p = result.text;
  size_t len = result.end;
  while (len > 0)
    {
      const char *q = memchr (p, '\n', len);
      if (q)
        {
          lines_count++;
          len -= q - p +1;
          p = q +1;
        }
      else
        break;
    }

  stream_output_n (self, result.text, result.end);
  free (result.text);

  return lines_count;
}

int
plaintext_format_image_element (CONVERTER *self, const ELEMENT *element)
{
  if (element->e.c->contents.number > 0
      && !empty_spaces_argument (element->e.c->contents.list[0]))
    {
      char *basefile;
      TEXT text;
      int width = -1;
      int lines_count;

      self->convert_text_options->code_state++;
      basefile = convert_to_text (element->e.c->contents.list[0],
                                  self->convert_text_options);
      self->convert_text_options->code_state--;

      text = converter_txt_image_text (self, element, basefile, &width);

      lines_count
        = plaintext_stream_image_formatted_text (self, element, basefile,
                                                 text);
      free (text.text);
      free (basefile);

      return lines_count;
    }

  return 0;
}

/*
  should not be called, only the Info format counterpart should be called
  since it is not called by Plaintext format_image_element and is only
  called for INFO_MATH_IMAGES, which should do nothing in Plaintext.
 */
TEXT
plaintext_format_image (CONVERTER *self, const char *image_file,
                   const TEXT *text, const TEXT *alt,
                   int dpi, int depth, int *lines_count)
{
  TEXT result;
  text_init (&result);
  return result;
}

/* Should never be called, as called from a function only called for
   INFO_MATH_IMAGES */
TEXT
plaintext_quote_image (CONVERTER *self, const TEXT *image_text)
{
  TEXT result;
  text_init (&result);
  text_append_n (&result, image_text->text, image_text->end);
  return result;
}

/* format_* dispatch table between plaintext and info.  Should be in sync with
   enum converter_format */
static PLAINTEXT_FORMAT_FUNCTIONS plaintext_functions[] = {
  {
   &plaintext_format_anchor,
   &plaintext_format_contents,
   &plaintext_format_error_outside_of_any_node,
   &plaintext_format_image,
   &plaintext_format_image_element,
   &plaintext_format_node,
   &plaintext_format_printindex,
   &plaintext_format_ref,
   &plaintext_quote_image,
  },
  {
   &info_format_anchor,
   &info_format_contents,
   &info_format_error_outside_of_any_node,
   &info_format_image,
   &info_format_image_element,
   &info_format_node,
   &info_format_printindex,
   &info_format_ref,
   &info_quote_image,
  }
};

/* NOTE only called for Info for INFO_MATH_IMAGES, never in plaintext. */
int
plaintext_insert_image (CONVERTER *self, const char *image_file,
                        const TEXT image_text, int dpi, int depth)
{
  TEXT result_text;
  text_init (&result_text);
  text_append_n (&result_text, image_text.text, image_text.end);
  int line_count;
  TEXT formatted_image;
  TEXT quoted_image;

  if (result_text.end > 0 && result_text.text[result_text.end -1] == '\n')
    {
      result_text.text[result_text.end -1] = '\0';
      result_text.end--;
    }

  formatted_image
    = plaintext_functions[self->format].format_image (self, image_file,
                                   &result_text, 0, dpi, depth, &line_count);
  free (result_text.text);

  quoted_image = plaintext_functions[self->format].quote_image (self,
                                                        &formatted_image);

  plaintext_add_quoted_image (self, &formatted_image, &quoted_image, 0);

  return line_count;
}

static int
pending_is_spaces (const PENDING_TEXT_LIST *pending_texts)
{
  size_t i;

  for (i = 0; i < pending_texts->number; i++)
    {
      const PENDING_TEXT *pending_text = &pending_texts->list[i];
      if (strspn (pending_text->text.text, whitespace_chars)
                                             != pending_text->text.end)
        return 0;
    }
  return 1;
}

static int
pending_is_empty (const PENDING_TEXT_LIST *pending_texts)
{
  size_t i;

  for (i = 0; i < pending_texts->number; i++)
    {
      const PENDING_TEXT *pending_text = &pending_texts->list[i];
      if (pending_text->text.end != 0)
        return 0;
    }
  return 1;
}

static const char * const underline_symbol[] = {"*", "*", "=", "-", "."};

static int
text_heading (CONVERTER *self, const ELEMENT *current,
              const ELEMENT *heading_element, int numbered,
              int indented_len, int no_last_new_line)
{
  LINE_WIDTH_PENDING_TEXT section_text;
  int section_level_status;
  int sec_level
    = lookup_extra_integer (current, AI_key_section_level,
                            &section_level_status);
  int k;
  int columns;

  /* cast to drop const */
  section_element_heading (self, current, (ELEMENT *)heading_element, numbered,
                           &section_text);

  if (pending_is_spaces (section_text.pending_text))
    {
      /* clear as it is not used anywhere and won't be cleared otherwise */
      clear_pending_text_list (section_text.pending_text);
      return 0;
    }

  merge_pending_with_parent (self, section_text.pending_text);

  stream_output_n (self, "\n", 1);

  columns = section_text.width;

  if (indented_len > 0)
    {
      for (k = 0; k < indented_len; k++)
        stream_output_n (self, " ", 1);
    }
  else
    indented_len = 0;

  if (section_level_status < 0)
    sec_level = section_level (current);

  const char *underline_char = underline_symbol[sec_level];

  for (k = 0; k < columns - indented_len; k++)
    stream_output_n (self, underline_char, 1);

  if (!no_last_new_line)
    stream_output_n (self, "\n", 1);

  return 1;
}

static char *
get_form_feeds (const char *form_feeds)
{
  const char *p = form_feeds;
  int len;

  p += strcspn (p, "\f");
  if (!*p)
    return 0;

  len = strlen (p);

  while (len >= 0)
    {
      if (*(p + len - 1) != '\f')
        len--;
      else
        return strndup (p, len);
    }
  return 0;
}

static void
convert_def_line (CONVERTER *self, const ELEMENT *element)
{
  PARSED_DEF *parsed_def = definition_arguments_content (element);

  if (parsed_def->category || parsed_def->class
      || parsed_def->type || parsed_def->name)
    {
      PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
      NAMED_STRING_ELEMENT_LIST *substrings
                                 = new_named_string_element_list ();
      ELEMENT *tree = 0;
      ELEMENT *formatted_arguments = 0;
      ELEMENT *formatted_name;
      enum command_id base_cmd = 0;
      enum command_id def_cmd;
      int omit_def_name_space = (element->flags & EF_omit_def_name_space);
      FORMAT_CONTEXT *top_format_context
          = top_(format_context) (&self_plaintext->format_context);

      int indent_len
         = self_plaintext->format_context.list[
             self_plaintext->format_context.number -2].context_indent_len;
      int next_indent_len = top_format_context->context_indent_len
                          + default_indent_length;

      /* parent is defblock */
      if (element->e.c->cmd == CM_defline || element->e.c->cmd == CM_deftypeline)
        def_cmd = element->e.c->cmd;
      else
      /* the parent is the def both for def* def_line and def*x */
        {
          if (element->e.c->parent)
            def_cmd = element->e.c->parent->e.c->cmd;
          else
            {
              /* If the tree is a copy, there is no parent, for instance in
                 user-defined translations with @def* commands, which would
                 be quite unusual, but is tested in tests.
                 NOTE this situation is very unlikely to happen in
                 Info/plaintext.
               */
              const char *def_command
                = lookup_extra_string (element, AI_key_def_command);
              def_cmd = lookup_builtin_command (def_command);
            }
        }

      if (command_data[def_cmd].flags & CF_def_alias)
        {
          int i;
          for (i = 0; def_aliases[i].alias ; i++)
            {
              if (def_aliases[i].alias == def_cmd)
                {
                  base_cmd = def_aliases[i].command;
                  break;
                }
            }
        }
      else
        base_cmd = def_cmd;


      if (parsed_def->name)
        {
          formatted_name = new_element (ET__code);
          ELEMENT *name_copy = copy_element_tree (parsed_def->name, 0);
          add_to_element_contents (formatted_name, name_copy);
        }
      else
        formatted_name = new_text_element (ET_other_text);

      if (parsed_def->args)
        {
          ELEMENT *arguments_copy = copy_element_tree (parsed_def->args, 0);
          formatted_arguments = new_element (ET__code);
          add_to_element_contents (formatted_arguments, arguments_copy);
        }

      ELEMENT *category_copy = copy_element_tree (parsed_def->category, 0);
      add_element_to_named_string_element_list (substrings, "category",
                                                category_copy);
      add_element_to_named_string_element_list (substrings, "name",
                                                formatted_name);
      if (base_cmd == CM_defline
          || base_cmd == CM_deffn
          || base_cmd == CM_defvr
          || base_cmd == CM_deftp
          || ((base_cmd == CM_deftypefn
               || base_cmd == CM_deftypevr)
               && !parsed_def->type))
        {
          if (parsed_def->args)
            {
              add_element_to_named_string_element_list (substrings,
                                        "arguments", formatted_arguments);
              if (omit_def_name_space)
                tree = cdt_tree ("@tie{}--- {category}: {name}{arguments}",
                                 self, substrings, 0);
              else
                tree = cdt_tree ("@tie{}--- {category}: {name} {arguments}",
                                 self, substrings, 0);
            }
          else
            tree = cdt_tree ("@tie{}--- {category}: {name}",
                             self, substrings, 0);
        }
      else if (base_cmd == CM_deftypeline
               || base_cmd == CM_deftypefn
               || base_cmd == CM_deftypevr)
        {
          ELEMENT *type_copy = copy_element_tree (parsed_def->type, 0);
          ELEMENT *formatted_type = new_element (ET__code);
          add_to_element_contents (formatted_type, type_copy);
          add_element_to_named_string_element_list (substrings, "type",
                                                    formatted_type);

          if (parsed_def->args)
            {
              add_element_to_named_string_element_list (substrings,
                                        "arguments", formatted_arguments);
              if (self->conf->deftypefnnewline.o.string
                  && !strcmp (self->conf->deftypefnnewline.o.string, "on")
                  && base_cmd == CM_deftypefn)
                {
                  if (omit_def_name_space)
                    tree
             = cdt_tree ("@tie{}--- {category}:@*{type}@*{name}{arguments}",
                                 self, substrings, 0);
                  else
                    tree
              = cdt_tree ("@tie{}--- {category}:@*{type}@*{name} {arguments}",
                                 self, substrings, 0);
                }
              else
                {
                  if (omit_def_name_space)
                    tree
             = cdt_tree ("@tie{}--- {category}: {type} {name}{arguments}",
                                 self, substrings, 0);
                  else
                    tree
              = cdt_tree ("@tie{}--- {category}: {type} {name} {arguments}",
                                 self, substrings, 0);
                }
            }
          else
            {
              if (self->conf->deftypefnnewline.o.string
                  && !strcmp (self->conf->deftypefnnewline.o.string, "on")
                  && base_cmd == CM_deftypefn)
                tree = cdt_tree ("@tie{}--- {category}:@*{type}@*{name}",
                                  self, substrings, 0);
              else
                tree = cdt_tree ("@tie{}--- {category}: {type} {name}",
                                  self, substrings, 0);
            }
        }
      else if (base_cmd == CM_defcv
               || (base_cmd == CM_deftypecv
                   && !parsed_def->type))
        {
          ELEMENT *class_copy = copy_element_tree (parsed_def->class, 0);
          ELEMENT *formatted_class = new_element (ET__code);
          add_to_element_contents (formatted_class, class_copy);
          add_element_to_named_string_element_list (substrings, "class",
                                                    formatted_class);
          if (parsed_def->args)
            {
              add_element_to_named_string_element_list (substrings,
                                        "arguments", formatted_arguments);
              if (omit_def_name_space)
                tree
          = cdt_tree ("@tie{}--- {category} of {class}: {name}{arguments}",
                                 self, substrings, 0);
              else
                tree
          = cdt_tree ("@tie{}--- {category} of {class}: {name} {arguments}",
                                 self, substrings, 0);
            }
          else
            tree = cdt_tree ("@tie{}--- {category} of {class}: {name}",
                             self, substrings, 0);
        }
      else if (base_cmd == CM_defop
               || (base_cmd == CM_deftypeop
                   && !parsed_def->type))
        {
          ELEMENT *class_copy = copy_element_tree (parsed_def->class, 0);
          ELEMENT *formatted_class = new_element (ET__code);
          add_to_element_contents (formatted_class, class_copy);
          add_element_to_named_string_element_list (substrings, "class",
                                                    formatted_class);
          if (parsed_def->args)
            {
              add_element_to_named_string_element_list (substrings,
                                        "arguments", formatted_arguments);
              if (omit_def_name_space)
                tree
          = cdt_tree ("@tie{}--- {category} on {class}: {name}{arguments}",
                                 self, substrings, 0);
              else
                tree
          = cdt_tree ("@tie{}--- {category} on {class}: {name} {arguments}",
                                 self, substrings, 0);
            }
          else
            tree = cdt_tree ("@tie{}--- {category} on {class}: {name}",
                             self, substrings, 0);
        }
      else if (base_cmd == CM_deftypeop)
        {
          ELEMENT *class_copy = copy_element_tree (parsed_def->class, 0);
          ELEMENT *formatted_class = new_element (ET__code);
          add_to_element_contents (formatted_class, class_copy);
          add_element_to_named_string_element_list (substrings, "class",
                                                    formatted_class);
          ELEMENT *type_copy = copy_element_tree (parsed_def->type, 0);
          ELEMENT *formatted_type = new_element (ET__code);
          add_to_element_contents (formatted_type, type_copy);
          add_element_to_named_string_element_list (substrings, "type",
                                                    formatted_type);
          if (parsed_def->args)
            {
              add_element_to_named_string_element_list (substrings,
                                        "arguments", formatted_arguments);
              if (self->conf->deftypefnnewline.o.string
                  && !strcmp (self->conf->deftypefnnewline.o.string, "on"))
                {
                  if (omit_def_name_space)
                    tree = cdt_tree (
              "@tie{}--- {category} on {class}:@*{type}@*{name}{arguments}",
                                 self, substrings, 0);
                  else
                    tree = cdt_tree (
              "@tie{}--- {category} on {class}:@*{type}@*{name} {arguments}",
                                 self, substrings, 0);
                }
              else
                {
                  if (omit_def_name_space)
                    tree = cdt_tree (
              "@tie{}--- {category} on {class}: {type} {name}{arguments}",
                                 self, substrings, 0);
                  else
                    tree = cdt_tree (
              "@tie{}--- {category} on {class}: {type} {name} {arguments}",
                                 self, substrings, 0);
                }
            }
          else
            {
              if (self->conf->deftypefnnewline.o.string
                  && !strcmp (self->conf->deftypefnnewline.o.string, "on"))
                tree = cdt_tree (
                   "@tie{}--- {category} on {class}:@*{type}@*{name}",
                                 self, substrings, 0);
              else
                tree = cdt_tree (
                   "@tie{}--- {category} on {class}: {type} {name}",
                                 self, substrings, 0);
            }
        }
      else if (base_cmd == CM_deftypecv)
        {
          ELEMENT *class_copy = copy_element_tree (parsed_def->class, 0);
          ELEMENT *formatted_class = new_element (ET__code);
          add_to_element_contents (formatted_class, class_copy);
          add_element_to_named_string_element_list (substrings, "class",
                                                    formatted_class);
          ELEMENT *type_copy = copy_element_tree (parsed_def->type, 0);
          ELEMENT *formatted_type = new_element (ET__code);
          add_to_element_contents (formatted_type, type_copy);
          add_element_to_named_string_element_list (substrings, "type",
                                                    formatted_type);
          if (parsed_def->args)
            {
              add_element_to_named_string_element_list (substrings,
                                        "arguments", formatted_arguments);
              if (omit_def_name_space)
                tree = cdt_tree (
              "@tie{}--- {category} of {class}: {type} {name}{arguments}",
                                 self, substrings, 0);
              else
                tree = cdt_tree (
              "@tie{}--- {category} of {class}: {type} {name} {arguments}",
                                 self, substrings, 0);
            }
          else
            tree = cdt_tree (
              "@tie{}--- {category} of {class}: {type} {name}",
                                 self, substrings, 0);
        }

      destroy_named_string_element_list (substrings);

      FORMATTER def_paragraph
        = new_formatter (self, formatter_paragraph, indent_len,
                         next_indent_len);
      def_paragraph.suppress_styles = 1;
      push_formatter (self, &def_paragraph);

      convert_to_plaintext_internal (self, tree);

      destroy_element_and_children (tree);

      const TEXT result = para_end ();
      stream_output_count_nl (self, result);

      para_destroy ();
      pop_formatter (self, 0);

      TEXT_CONTEXT *text_element_context
       = top_(text_element_context) (&self_plaintext->text_element_context);
      text_element_context->counter = 0;
    }

  destroy_parsed_def (parsed_def);
}

static int listoffloat_entry_length = 41;
/* computed as 32/72, rounded up */
static double description_align_column_factor = 0.45;

/* ALTIMP: _convert in Texinfo:Convert::Plaintext */
void
convert_to_plaintext_internal (CONVERTER *self, const ELEMENT *element)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  enum element_type type = element->type;
  const INDEX_ENTRY_LOCATION *index_entry_info;

  /*
  char *element_details = element_print_details ((ELEMENT *)element, 0, 0);
  fprintf (stderr, "CTPI %s\n", element_details);
  free (element_details);
   */

  if (type_data[type].flags & TF_text)
    {
      if (type == ET_empty_line || type == ET_after_menu_description_line)
        {
          enum command_id context_cmd
             = *top_(command) (&self_plaintext->context);
          TEXT_CONTEXT *text_element_context
            = top_(text_element_context) (
                               &self_plaintext->text_element_context);
          text_element_context->counter = 0;

          if (strchr (element->e.text->text, '\f'))
            {
              char *result = get_form_feeds (element->e.text->text);
              if (result)
                {
                  stream_output (self, result);
                  free (result);
                }
            }

          if (plaintext_commands_data[context_cmd].flags
                                            & PF_preformatted_context)
            stream_output_add_text (self, "\n", 1);
          else
            add_newline_if_needed (self);
          return;
        }
      /* %ignorable_space_types in Plaintext.pm */
      else if (type == ET_ignorable_spaces_after_command
               || type == ET_spaces_at_end
               /* not ignored as menu manual formatting is kept as is */
               /* || type == ET_space_at_end_menu_node */
               || type == ET_spaces_after_close_brace
               || type == ET_spaces_before_argument
               || type == ET_spaces_after_argument)
        {
          if (type == ET_spaces_after_close_brace
              && strchr (element->e.text->text, '\f'))
            {
              char *result = get_form_feeds (element->e.text->text);
              if (result)
                {
                  stream_output (self, result);
                  free (result);
                }
            }
          return;
        }

      /* In Perl !$formatter->{'_top_formatter'} */
      if (self_plaintext->formatters.number > 1)
        {
          if (type == ET_raw)
            stream_output_add_next (self, element->e.text->text,
                                    element->e.text->end);
          else
            {
       /* Convert ``, '', `, ', ---, -- in $COMMAND->{'text'} to their
          output, possibly coverting to upper case as well. */
              char *text = element->e.text->text;
              FORMATTER *formatter
                    = top_(formatter) (&self_plaintext->formatters);
              FONT_TYPE *font_type
                    = top_(font_type) (formatter->font_type_stack);
              UPPER_CASE *upper_case
                    = top_(upper_case) (formatter->upper_case_stack);

              if (upper_case->upper_case)
                {
                  char *tmp_text = protect_sentence_ends (text);
                  text = to_upper_or_lower_multibyte (tmp_text, 1);
                  free (tmp_text);
                }

              if (!font_type->monospace)
                {
                  const char *p = text;
                  static TEXT t;
                  TEXT *result = &t;
                  text_reset (result);
                  if (self->conf->ASCII_DASHES_AND_QUOTES.o.integer < 1)
                    {
                      while (*p)
                        {
                          int before_sep_nr = strcspn (p, "-`'");
                          if (before_sep_nr)
                            {
                               text_append_n (result, p, before_sep_nr);
                               p += before_sep_nr;
                            }
                          if (!*p)
                            break;
                          switch (*p)
                            {
                              OTXI_UNICODE_TEXT_CASES(p)
                            }
                        }
                    }
                  else
                    {
                      while (*p)
                        {
                          int before_sep_nr = strcspn (p, "-`'");
                          if (before_sep_nr)
                            {
                               text_append_n (result, p, before_sep_nr);
                               p += before_sep_nr;
                            }
                          if (!*p)
                            break;
                          switch (*p)
                            {
                              case '-':
                                if (*(p+1) && !memcmp (p, "---", 3))
                                  {
                                    text_append_n (result, "--", 2);
                                    p += 3;
                                  }
                                else if (!memcmp (p, "--", 2))
                                  {
                                    text_append_n (result, "-", 1);
                                    p += 2;
                                  }
                                else
                                  {
                                    text_append_n (result, "-", 1);
                                    p++;
                                  }
                                break;
                              case '`':
                                if (!memcmp (p, "``", 2))
                                  {
                                    text_append_n (result, "\"", 1);
                                    p += 2;
                                  }
                                else
                                  {
                                    text_append_n (result, "'", 1);
                                    p++;
                                  }
                                break;
                              case '\'':
                                if (!memcmp (p, "''", 2))
                                  {
                                    text_append_n (result, "\"", 1);
                                    p += 2;
                                  }
                                else
                                  {
                                    text_append_n (result, "'", 1);
                                    p++;
                                  }
                            }
                        }
                    }
                  stream_output_add_text (self, t.text, t.end);
                }
              else
                stream_output_add_text (self, text, strlen (text));

              if (upper_case->upper_case)
                free (text);
            }
        }
      else if (type == ET_spaces_before_paragraph)
        {
          int paragraphindent = self->conf->paragraphindent.o.integer;
          if (paragraphindent == -2) /* asis */
            stream_output_n (self, element->e.text->text,
                             element->e.text->end);
        }
      else
        {
          const char *text = element->e.text->text;
          if (type != ET_normal_text)
            fprintf (stderr, "unexpected text element type: %s\n",
                             type_data[type].name);
          if (text[strspn (text, whitespace_chars)] == '\0')
            {
              stream_output_add_text (self, text, element->e.text->end);
            }
          else
            fprintf (stderr, "ignored text not empty `%s'\n", text);
        }

      return;
    }

  /* %ignored_types in Plaintext.pm */
  if (type == ET_postamble_after_end
      || type == ET_preamble_before_beginning
      || type == ET_preamble_before_setfilename
      || type == ET_arguments_line)
    return;

  /* check for ignored command */
  /* enum command_id cmd = element->e.c->cmd; */
  enum command_id cmd = element_builtin_cmd (element);
  /* or, to have @item in line commands as item_LINE
  enum command_id cmd = element_builtin_data_cmd (element);
   */

  if (cmd != CM_NONE)
    {
      if (self_plaintext->commands_data[cmd].flags & PF_ignored)
        return;

      const COMMAND *cmd_data = &command_data[cmd];

      if (cmd_data->flags & CF_brace
          && cmd_data->data == BRACE_inline
          && cmd != CM_inlinefmtifelse)
        {
          if (command_other_flags (element) & CF_inline_format)
            {
              const char *format
                = lookup_extra_string (element, AI_key_format);
              if (!format
                  || !format_expanded_p (self->expanded_formats, format))
                return;
            }
          else
            {
              int status;
              int expand_index
               = lookup_extra_integer (element, AI_key_expand_index, &status);

              if (!expand_index)
                return;
            }
        }
    }

  index_entry_info
    = lookup_extra_index_entry (element, AI_key_index_entry);
  if (index_entry_info && !self_plaintext->multiple_pass
      && !self_plaintext->in_copying_header)
    {
      size_t entry_index_nr
       = index_number_index_by_name (&self->sorted_index_names,
                                     index_entry_info->index_name);

      INDEX_ENTRY_INFO *entry_info
         = &self_plaintext->index_entry_conversion_info
           [entry_index_nr -1][index_entry_info->number -1];

      COUNT_CONTEXT *count_context
        = top_(count_context) (&self_plaintext->count_context);
      int *line_location = (int *) malloc (sizeof (int));
      *line_location = count_context->lines;

      add_(index_entry_location) (&count_context->index_entry_locations,
                                  line_location);
      entry_info->location = line_location;

   /* this covers the special case for index entry not associated with a
      node but seen.  This will be an index entry in @copying,
      in @insertcopying.
      This also covers the case of an index entry in a node added by a
      @footnote with footnotestyle separate. */
      if (self_plaintext->current_node)
        entry_info->node = self_plaintext->current_node;
    }

  if (type == ET_index_entry_command)
    return;

  int cell = 0;
  const FORMATTER *preformatted = NULL;
  if (cmd != CM_NONE)
    {
      const COMMAND *cmd_data = &command_data[cmd];
      if (cmd_data->flags & CF_brace
          && cmd_data->data == BRACE_accent)
        {
          char *accented_text;
          int sc = 0;
          FORMATTER *formatter
               = top_(formatter) (&self_plaintext->formatters);
          UPPER_CASE *upper_case
               = top_(upper_case) (formatter->upper_case_stack);

          if (upper_case->upper_case)
            sc = 1;

          accented_text = text_accents (element,
                                        self_plaintext->enabled_encoding, sc);
          stream_output_add_text (self, accented_text, strlen (accented_text));

          if (upper_case->upper_case)
            {
              FONT_TYPE *font_type
                     = top_(font_type) (formatter->font_type_stack);

              char *accented_text_original
                 = text_accents (element,
                                 self_plaintext->enabled_encoding, 0);

              if (strcmp (accented_text_original, ""))
                {
                  if (font_type->monospace || upper_case->var)
                    para_allow_end_sentence ();
                  else
                    {
                      if (isascii (accented_text_original[0]))
                        {
                          if (islower (accented_text_original[0]))
                            para_allow_end_sentence ();
                        }
                      else
                        {
                          int char_len = 1;
                          while ((accented_text_original[char_len] & 0xC0)
                                                                     == 0x80)
                            char_len++;
                          char32_t wc;
                          u8_mbtouc (&wc, (uint8_t *) accented_text_original,
                                     char_len);
                          if (!uc_is_upper (wc))
                            para_allow_end_sentence ();
                        }
                    }
                }
              free (accented_text_original);
            }

     /* in case the text added ends with punctuation.
        If the text is empty (likely because of an error) previous
        punctuation will be cancelled, we don't want that. */
          if (strcmp (accented_text, ""))
            para_remove_end_sentence ();

          free (accented_text);

          return;
        }
      else if (type == ET_definfoenclose_command)
        {
          const char *begin = lookup_extra_string (element, AI_key_begin);
          const char *end = lookup_extra_string (element, AI_key_end);
          const TEXT added_begin = para_add_next (begin, strlen (begin), 1);
          stream_output_count_nl (self, added_begin);
          if (element->e.c->contents.number > 0)
            convert_to_plaintext_internal (self,
                                           element->e.c->contents.list[0]);
          const TEXT added_end = para_add_next (end, strlen (end), 1);
          stream_output_count_nl (self, added_end);

          return;
        }
      else if (cmd_data->flags & CF_brace)
        {
          if ((plaintext_commands_data[cmd].flags
               & (PF_style_map | PF_asis | PF_quoted))
              || cmd == CM_dfn /* %double_quoted_commands in Perl */)
            {
              FORMATTER *formatter
                    = top_(formatter) (&self_plaintext->formatters);
              FONT_TYPE *font_type
                    = top_(font_type) (formatter->font_type_stack);

              if (cmd_data->other_flags & CF_brace_code)
                {
                  if (!font_type->monospace)
                    {
                      FONT_TYPE font_type = { 0 };
                      font_type.monospace = 1;
                      add_(font_type) (formatter->font_type_stack, font_type);
                    }
                  else
                    font_type->monospace++;
                }
              else if (cmd_data->data == BRACE_style_no_code)
                {
                  if (font_type->monospace)
                    {
                      FONT_TYPE font_type = { 0 };
                      font_type.normal = 1;
                      add_(font_type) (formatter->font_type_stack, font_type);
                    }
                  else if (font_type->normal)
                    font_type->normal++;
                }
              if (plaintext_commands_data[cmd].flags
                                       & PF_no_punctuation_munging)
                {
                  add_(integer) (&formatter->frenchspacing_stack, 1);
                  para_set_conf_frenchspacing (1);
                }

              if (cmd == CM_w)
                {
                  formatter->w++;
                  if (formatter->w == 1)
                    para_set_space_protection (1);
                }

              const char *text_before = NULL, *text_after = NULL;
              font_type = top_(font_type) (formatter->font_type_stack);
              if ((plaintext_commands_data[cmd].flags
                           & PF_non_quoted_when_nested)
                  && font_type->code_command)
                {}
              else if (formatter->suppress_styles
                       && !(plaintext_commands_data[cmd].flags
                                                   & PF_index_style))
                {}
              else if (plaintext_commands_data[cmd].flags & PF_style_map)
                {
                  /* Look up in style map by linear search.
                     Binary search would also be possible, although the
                     array is not very big. */
                  int n = sizeof(style_map) / sizeof(style_map[0]);
                  int i;
                  for (i = 0; i < n; i++)
                    {
                      if (style_map[i].cmd == cmd)
                        break;
                    }
                  if (i < n)
                    {
                      text_before = style_map[i].pre;
                      text_after = style_map[i].post;
                    }
                  else
                    { /* bug */
                    }
                }
              else if (plaintext_commands_data[cmd].flags & PF_quoted)
                {
                  text_before = self_plaintext->open_quote;
                  text_after = self_plaintext->close_quote;
                }
              else if (cmd == CM_dfn)
                {
                  text_before = self_plaintext->open_double_quote;
                  text_after = self_plaintext->close_double_quote;
                }
              else if (plaintext_commands_data[cmd].flags & PF_asis)
                {}
              else
                { /* bug */
                }

     /* do this after determining $text_before/$text_after such that it
        doesn't impact the current command, but only commands nested within
      */
              if (plaintext_commands_data[cmd].flags
                                      & PF_non_quoted_when_nested)
                {
                  font_type->code_command++;
                }

              if (text_before)
                {
                  const TEXT added = para_add_next (text_before,
                                            strlen (text_before), 1);
                  stream_output_count_nl (self, added);
                }

              if (element->e.c->contents.number != 0)
                {
                  const ELEMENT *brace_container
                            = element->e.c->contents.list[0];
                  convert_to_plaintext_internal (self, brace_container);

                  if (cmd == CM_strong
                      && brace_container->e.c->contents.number > 0
                      && self_plaintext->warn_strong_note
                      && !self_plaintext->silent)
                    {
                      const ELEMENT *strong_arg
                        = brace_container->e.c->contents.list[0];
                      if (type_data[strong_arg->type].flags & TF_text
                          && strong_arg->e.text->end >= 5
                          && !strncasecmp (strong_arg->e.text->text, "Note", 4)
                          && strchr (whitespace_chars,
                                 *(strong_arg->e.text->text +4)))
                        {
                          message_list_command_warn (&self->error_messages,
                              (self->conf && self->conf->DEBUG.o.integer > 0),
                               element, 0,
    "@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that");
                        }
                    }
                }

              /* reset after conversion, in case it was reallocated */
              formatter = top_(formatter) (&self_plaintext->formatters);
              if (text_after)
                {
                  const TEXT added = para_add_next (text_after,
                                     strlen (text_after), 1);
                  stream_output_count_nl (self, added);
                }

              if (cmd == CM_w)
                {
                  formatter->w--;
                  if (formatter->w == 0)
                    para_set_space_protection (0);
                }

              font_type = top_(font_type) (formatter->font_type_stack);

              if (cmd_data->other_flags & CF_brace_code)
                {
                  font_type->monospace--;
                  para_allow_end_sentence ();
                  if (!font_type->monospace)
                    pop_(font_type) (formatter->font_type_stack);
                }
              else if (cmd_data->data == BRACE_style_no_code)
                {
                  if (font_type->normal)
                    {
                      font_type->normal--;
                      if (!font_type->normal)
                        pop_(font_type) (formatter->font_type_stack);
                    }
                }

              if (plaintext_commands_data[cmd].flags
                           & PF_non_quoted_when_nested)
                font_type->code_command--;

              if (plaintext_commands_data[cmd].flags
                                       & PF_no_punctuation_munging)
                {
                  pop_(integer) (&formatter->frenchspacing_stack);

                  para_set_conf_frenchspacing (*(top_(integer)
                                 (&formatter->frenchspacing_stack)));
                }
              return;
            }
          else if (cmd == CM_var || cmd == CM_sc)
            {/* upper_case_commands */
              FORMATTER *formatter
                    = top_(formatter) (&self_plaintext->formatters);
              UPPER_CASE *upper_case
                    = top_(upper_case) (formatter->upper_case_stack);

              upper_case->upper_case++;
              if (cmd == CM_var)
                {
                  upper_case->var++;
                  add_(integer) (&formatter->frenchspacing_stack, 1);
                  para_set_conf_frenchspacing (1);
                }

              if (element->e.c->contents.number != 0)
                convert_to_plaintext_internal (self,
                                               element->e.c->contents.list[0]);
              formatter
                    = top_(formatter) (&self_plaintext->formatters);
              upper_case
                    = top_(upper_case) (formatter->upper_case_stack);
              upper_case->upper_case--;
              if (cmd == CM_var)
                {
                  pop_(integer) (&formatter->frenchspacing_stack);

                  para_set_conf_frenchspacing (*(top_(integer)
                                 (&formatter->frenchspacing_stack)));
                  upper_case->var--;
                 /* Allow a following full stop to terminate a sentence. */
                  para_allow_end_sentence ();
                }
              return;
            }
          else if (cmd == CM_link)
            {
              if (element->e.c->contents.number > 0)
                {
                  const ELEMENT *text_arg;
         /* Use arg 2 if present, otherwise use arg 1.  Do not produce
            functional link in Info/plaintext output. */
                  if (element->e.c->contents.number >= 2
                      && !empty_spaces_argument (
                                      element->e.c->contents.list[1]))
                    text_arg = element->e.c->contents.list[1];
                  else if (!empty_spaces_argument (
                                      element->e.c->contents.list[0]))
                    text_arg = element->e.c->contents.list[0];

                  if (text_arg)
                    convert_to_plaintext_internal (self, text_arg);
                }
              return;
            }
          else if (cmd_data->flags & CF_ref)
            {
              plaintext_functions[self->format].format_ref (self, cmd, element);
              return;
            }
          else if (cmd == CM_image)
            {
              const TEXT pending_word = para_add_pending_word (1);
              stream_output_count_nl (self, pending_word);

              /* add an empty word so that following spaces aren't lost */
              para_add_next ("", 0, 0);
              int lines_count
                = plaintext_functions[self->format].format_image_element (self,
                                                                      element);

       /* We do not how much horizontal space @image will take:
            * In plain text output or standalone Info, the replacement
              text will be used
            * In Emacs Info, the image file may be displayed.
          So if an @image is used inside a paragraph, we cannot break
          the line in a place that will always work.
          Here we just add a small number to the line counter as a compromise.
          (However, multi-line replacement texts are unlikely to look good if
          used inside a paragraph.) */
              para_add_to_counter (IMAGE_WIDTH);
              add_lines_count (self, lines_count);
              return;
            }
          else if (cmd == CM_today)
            {
              ELEMENT *today_element = converter_expand_today (self);
              convert_to_plaintext_internal (self, today_element);
              destroy_element_and_children (today_element);
              return;
            }
          else if (cmd_data->data == BRACE_noarg)
            {
              ELEMENT *translated_tree
                = converter_translated_command_tree (self, cmd);
              if (translated_tree)
                {
                  convert_to_plaintext_internal (self, translated_tree);
                  destroy_element_and_children (translated_tree);
                }
              else
                {
                  FORMATTER *formatter
                    = top_(formatter) (&self_plaintext->formatters);
                  UPPER_CASE *upper_case
                    = top_(upper_case) (formatter->upper_case_stack);
                  char *text;
                  int text_need_free = 0;

                  if (cmd == CM_dots || cmd == CM_enddots)
                    text = "...";
                  else
                    {
           /* Note that we set set_case to 0 irrespective of upper case
              context, as we want the call to _protect_sentence_ends
              to be on a text not already upper cased */
                      text = text_brace_no_arg_command (element,
                                   self_plaintext->enabled_encoding,
                             (self->conf->ASCII_GLYPH.o.integer > 0), 0, 0);
                      text_need_free = 1;
                    }

                  if (plaintext_commands_data[cmd].flags & PF_punctuation_no_arg)
                    {
                      stream_output_add_next (self, text, strlen (text));
                      para_add_end_sentence ();
                    }
                  else if (cmd == CM_tie)
                    stream_output_add_next (self, text, strlen (text));
                  else
                    {
                      if (command_other_flags (element) & CF_letter_no_arg
                          && upper_case->upper_case)
                        {
           /* @AA{} should suppress an end sentence, @aa{} shouldn't.  This
              is the case whether we are in @sc or not. */
                          char *tmp_text = protect_sentence_ends (text);
                          if (text_need_free)
                            free (text);
                          text = to_upper_or_lower_multibyte (tmp_text, 1);
                          free (tmp_text);
                          text_need_free = 1;
                        }
                      stream_output_add_text (self, text, strlen (text));

      /* This is to have @TeX{}, for example, not to prevent end sentences. */
                      if (!(command_other_flags (element) & CF_letter_no_arg))
                        para_allow_end_sentence ();

                      if (cmd == CM_dots)
                        para_remove_end_sentence ();
                    }

                  if (text_need_free)
                    free (text);

                  FONT_TYPE *font_type
                    = top_(font_type) (formatter->font_type_stack);

                  if (upper_case->var
                      || font_type->monospace)
                    para_allow_end_sentence ();
                }

              return;
            }
          else if (cmd == CM_email)
            {
              if (element->e.c->contents.number > 0)
                {
       /* next elements are temporarily modified during copy, so cannot be
          const, but they are conceptually const */
                  ELEMENT *name = 0;
                  ELEMENT *email = 0;

                  ELEMENT *email_tree;

                  if (element->e.c->contents.number >= 2
                   && !empty_spaces_argument (element->e.c->contents.list[1]))
                    name = element->e.c->contents.list[1];
                  if (!empty_spaces_argument (element->e.c->contents.list[0]))
                    email = element->e.c->contents.list[0];

                  if (email)
                    {
                      NAMED_STRING_ELEMENT_LIST *substrings
                                 = new_named_string_element_list ();
                      ELEMENT *email_copy = copy_element_tree (email, 0);
                      add_element_to_named_string_element_list (substrings,
                                                         "email", email_copy);

                      if (name)
                        {
                           ELEMENT *name_copy = copy_element_tree (name, 0);
                           add_element_to_named_string_element_list (substrings,
                                                            "name", name_copy);
                           email_tree = cdt_tree ("{name} @url{{email}}", self,
                                                  substrings, 0);
                        }
                      else
                        {
                          email_tree = cdt_tree ("@url{{email}}", self,
                                                 substrings, 0);
                        }
                      convert_to_plaintext_internal (self, email_tree);

                      destroy_element_and_children (email_tree);

                      destroy_named_string_element_list (substrings);
                    }
                  else if (name)
                    convert_to_plaintext_internal (self, name);
                }
              return;
            }
          else if (cmd == CM_uref || cmd == CM_url)
            {
              if (element->e.c->contents.number > 0)
                {
                  if (element->e.c->contents.number == 3
                   && !empty_spaces_argument (element->e.c->contents.list[2]))
                    {
                      ELEMENT *inserted = new_element (ET__stop_upper_case);
                      add_to_contents_as_array (inserted,
                                                element->e.c->contents.list[2]);
                      convert_to_plaintext_internal (self, inserted);
                      destroy_element (inserted);
                    }
                  else if (!empty_spaces_argument (
                                           element->e.c->contents.list[0]))
                    {
                      ELEMENT *inserted;
                      NAMED_STRING_ELEMENT_LIST *substrings
                                 = new_named_string_element_list ();

                     /* no mangling of --- and similar in url. */
                      ELEMENT *url = new_element (ET__stop_upper_case);
                      ELEMENT *url_code = new_element (ET__code);
                      add_to_element_contents (url, url_code);
                      ELEMENT *url_arg_copy
                        = copy_element_tree (element->e.c->contents.list[0], 0);
                      add_to_element_contents (url_code, url_arg_copy);

                      add_element_to_named_string_element_list (substrings,
                                                                "url", url);

                      if (element->e.c->contents.number == 2
                          && !empty_spaces_argument (
                                               element->e.c->contents.list[1]))
                        {
                          ELEMENT *text_copy
                            = copy_element_tree (
                                         element->e.c->contents.list[1], 0);
                          add_element_to_named_string_element_list (substrings,
                                                            "text", text_copy);
                          inserted = cdt_tree ("{text} ({url})", self,
                                                substrings, 0);
                        }
                      else
                        {
                          inserted = cdt_tree ("@t{<{url}>}", self,
                                               substrings, 0);
                        }
                      convert_to_plaintext_internal (self, inserted);
                      destroy_element_and_children (inserted);
                      destroy_named_string_element_list (substrings);
                    }
                  else if (element->e.c->contents.number == 2
                          && !empty_spaces_argument (
                                            element->e.c->contents.list[1]))
                    {
                      convert_to_plaintext_internal (self,
                                          element->e.c->contents.list[1]);
                    }
                }
              return;
            }
          else if (cmd == CM_footnote)
            {
              if (!self_plaintext->multiple_pass)
                self_plaintext->footnote_index++;

              if (!self_plaintext->in_copying_header)
                plaintext_functions[self->format]
                  .format_error_outside_of_any_node (self, element);

              if (!self_plaintext->multiple_pass)
                {
                  PENDING_FOOTNOTE footnote_and_number = {
                         element, self_plaintext->footnote_index, 0
                  };
                  add_(pending_footnote) (&self_plaintext->pending_footnotes,
                                          footnote_and_number);
                }

              if (self->conf->NUMBER_FOOTNOTES.o.integer > 0)
                {
                  char *formatted_footnote_number_str;
                  xasprintf (&formatted_footnote_number_str, "(%d)",
                             self_plaintext->footnote_index);
                  const TEXT added = para_add_next (formatted_footnote_number_str,
                                   strlen (formatted_footnote_number_str), 1);
                  stream_output_count_nl (self, added);
                  free (formatted_footnote_number_str);
                }
              else
                {
                  const TEXT added
                     = para_add_next ("(" NO_NUMBER_FOOTNOTE_SYMBOL ")", 3, 1);
                  stream_output_count_nl (self, added);
                }


              if (self->conf->footnotestyle.o.string
                  && !strcmp (self->conf->footnotestyle.o.string, "separate")
                  && self_plaintext->current_node)
                {
                  /* arguments_line type element */
                  const ELEMENT *arguments_line
                    = self_plaintext->current_node->e.c->contents.list[0];
                  ELEMENT *line_arg = arguments_line->e.c->contents.list[0];

                  ELEMENT *footnote_ref = new_element (ET_NONE);
                  ELEMENT *open_parenthese = new_text_element (ET_other_text);
                  text_append_n (open_parenthese->e.text, " (", 2);
                  ELEMENT *close_parenthese = new_text_element (ET_other_text);
                  text_append_n (close_parenthese->e.text, ")", 1);
                  ELEMENT *footnote_pxref
                                 = new_command_element (ET_brace_command,
                                                        CM_pxref);
                  ELEMENT *footnote_brace_arg = new_element (ET_brace_arg);
                  ELEMENT *footnote_name = new_text_element (ET_other_text);
                  text_printf (footnote_name->e.text, "-Footnote-%d",
                               self_plaintext->footnote_index);

                  add_element_to_element_contents (footnote_ref,
                                                   open_parenthese);
                  add_to_element_contents (footnote_ref, footnote_pxref);
                  add_element_to_element_contents (footnote_ref,
                                                   close_parenthese);
                  add_to_element_contents (footnote_pxref, footnote_brace_arg);
                  add_to_contents_as_array (footnote_brace_arg, line_arg);
                  add_element_to_element_contents (footnote_brace_arg,
                                                   footnote_name);

                  convert_to_plaintext_internal (self, footnote_ref);

                  destroy_element (footnote_name);
                  destroy_element (footnote_brace_arg);
                  destroy_element (footnote_pxref);
                  destroy_element (open_parenthese);
                  destroy_element (close_parenthese);
                  destroy_element (footnote_ref);
                }
              return;
            }
          else if (cmd == CM_anchor || cmd == CM_namedanchor)
            {
              const TEXT pending_word = para_add_pending_word (0);
              stream_output_count_nl (self, pending_word);
              plaintext_functions[self->format].format_anchor (self, element);
              return;
            }
          else if (command_data[cmd].other_flags & CF_explained)
            {
              if (element->e.c->contents.number > 0
                  && !empty_spaces_argument (element->e.c->contents.list[0]))
                {
                  ELEMENT *abbr_frenchspacing = 0;
                  if (cmd == CM_abbr)
                    /* in abbr spaces never end a sentence. */
                    abbr_frenchspacing = new_element (ET__frenchspacing);
                  if (element->e.c->contents.number >= 2
                      && !empty_spaces_argument (element->e.c->contents.list[1]))
                    {
                      ELEMENT *inserted;
                      NAMED_STRING_ELEMENT_LIST *substrings
                                 = new_named_string_element_list ();

                      ELEMENT *explanation_copy
                        = copy_element_tree (element->e.c->contents.list[1], 0);
                      ELEMENT *first_arg_copy
                        = copy_element_tree (element->e.c->contents.list[0], 0);
                      if (abbr_frenchspacing)
                        {
                          add_to_element_contents (abbr_frenchspacing,
                                                   first_arg_copy);
                          add_element_to_named_string_element_list (substrings,
                                          "abbr_or_acronym", abbr_frenchspacing);
                        }
                      else
                        add_element_to_named_string_element_list (substrings,
                                          "abbr_or_acronym", first_arg_copy);

                      add_element_to_named_string_element_list (substrings,
                                            "explanation", explanation_copy);
                      inserted = cdt_tree ("{abbr_or_acronym} ({explanation})",
                                           self, substrings, 0);

                      convert_to_plaintext_internal (self, inserted);
                      destroy_element_and_children (inserted);
                      destroy_named_string_element_list (substrings);
                    }
                  else
                    {
                      if (abbr_frenchspacing)
                        {
                          add_to_contents_as_array (abbr_frenchspacing,
                                         element->e.c->contents.list[0]);

                          convert_to_plaintext_internal (self,
                                                         abbr_frenchspacing);
                          destroy_element (abbr_frenchspacing);
                        }
                      else
                        convert_to_plaintext_internal (self,
                                             element->e.c->contents.list[0]);

           /* We want to permit an end of sentence, but not force it
              as @. does. */
                      para_allow_end_sentence ();
                    }
                }
              return;
            }
          else if (cmd_data->data == BRACE_inline)
            {
              unsigned int arg_index = 1;
              if (cmd == CM_inlinefmtifelse)
                {
                  const char *format
                    = lookup_extra_string (element, AI_key_format);
                  if (!format
                      || !format_expanded_p (self->expanded_formats, format))
                    arg_index = 2;
                }

              if (element->e.c->contents.number > arg_index
                  && element->e.c->contents.list[arg_index]
                              ->e.c->contents.number > 0)
                {
                  if (cmd == CM_inlineraw)
                    {
                      ELEMENT *inline_stop_upper
                        = new_element (ET__stop_upper_case);
                      ELEMENT *inline_code
                        = new_element (ET__code);
                      add_to_element_contents (inline_stop_upper, inline_code);
                      add_to_contents_as_array (inline_code,
                                 element->e.c->contents.list[arg_index]);

                      convert_to_plaintext_internal (self,
                                                     inline_stop_upper);
                      destroy_element (inline_code);
                      destroy_element (inline_stop_upper);
                    }
                  else
                    convert_to_plaintext_internal (self,
                                  element->e.c->contents.list[arg_index]);
                }
              return;
            }
          else if (cmd_data->flags & CF_math)
            {
              MATH_ELEMENT_IMAGE *element_image = 0;
              add_(command) (&self_plaintext->context, cmd);
              enum command_id popped_cmd;

              if (self_plaintext->element_images)
                {
                  element_image
                 = &self_plaintext->element_images->math_images.list[
                          self_plaintext->element_images->math_index];
                  if (element_image->element != element)
                    {
                      char *msg;
                      xasprintf (&msg, "BUG: %zu: out of sync math element"
                                       " image and tree\n");
                      bug (msg);
                      free (msg);
                    }

                  self_plaintext->element_images->math_index++;
                  if (element_image->filename)
                    {
                      /* flush before @math, including spaces */
                      const TEXT pending_word = para_add_pending_word (1);
                      stream_output_count_nl (self, pending_word);
           /* TODO same as @image code.  Does not seems to have any effect,
              leading spaces in @math are lost anyway (which is not important).
              add an empty word so that following spaces aren't lost */
                      para_add_next ("", 0, 0);

           /* math rendered as an image, push a count to capture content */
                      push_count_context (&self_plaintext->count_context);
                    }
                }

              if (element->e.c->contents.number > 0)
                {
                  ELEMENT *math_frenchspacing_element
                    = new_element (ET__frenchspacing);
                  ELEMENT *math_code_element = new_element (ET__code);

                  add_to_contents_as_array (math_code_element,
                                            element->e.c->contents.list[0]);
                  add_to_element_contents (math_frenchspacing_element,
                                           math_code_element);

                  convert_to_plaintext_internal (self,
                                                math_frenchspacing_element);

                  destroy_element (math_code_element);
                  destroy_element (math_frenchspacing_element);
               }

              if (element_image && element_image->filename)
                {
                  TEXT math_text;
                   /* flush @math, including spaces */
                  const TEXT pending_word = para_add_pending_word (1);
                  stream_output_count_nl (self, pending_word);
                  static CONST_ELEMENT_LIST anchors;

                  math_text = stream_to_text_anchor (self, &anchors);

                  pop_count_context (&self_plaintext->count_context);

                  /* readd anchors in front of the image */
                  if (anchors.number)
                    {
                      size_t i;
                      for (i = 0; i < anchors.number; i++)
                        plaintext_add_target_location (self, anchors.list[i]);
                      anchors.number = 0;
                    }

                  int line_count
                     = plaintext_insert_image (self, element_image->filename,
                             math_text,
                             element_image->dpi, element_image->depth);
                  free (math_text.text);
                  add_lines_count (self, line_count);
                }
              popped_cmd = pop_context (&self_plaintext->context);
              if (popped_cmd != cmd)
                abort ();
              return;
            }
          else if (cmd == CM_titlefont)
            {
              if (!empty_spaces_argument (element))
                {
                  FORMAT_CONTEXT *top_format_context
                   = top_(format_context) (&self_plaintext->format_context);
                  ELEMENT *titlefont_with_level
                    = new_command_element (ET_brace_command, CM_titlefont);
                  add_extra_integer (titlefont_with_level,
                                     AI_key_section_level, 0);

                  text_heading (self, titlefont_with_level,
                                element->e.c->contents.list[0],
                                self->conf->NUMBER_SECTIONS.o.integer,
                                top_format_context->context_indent_len, 1);
                  add_lines_count (self, 1);
                  destroy_element (titlefont_with_level);
                }
              return;
            }
          else if (cmd == CM_U)
            {
              if (element->e.c->contents.number > 0)
                {
                  int surplus_arg;
                  const TEXT *arg_text
                    = simple_arg_text (element->e.c->contents.list[0],
                                       &surplus_arg);
                  if (arg_text && strcmp (arg_text->text, ""))
                    {
                      int conversion_done = 0;
                      if (self_plaintext->to_utf8)
                        {
                          unsigned long int val;
                          int ret;

                          ret = sscanf (arg_text->text, "%lx", &val);
                          if (ret != 1)
                            {
                              if (self->conf->DEBUG.o.integer > 0)
                                fprintf (stderr,
                                         "C|conversion hex sscanf failed %s",
                                         arg_text->text);
                            }
                          else if (val < 0x10FFFF)
                            {
                              uint8_t result_u8[7];
                              int len = u8_uctomb (result_u8, (ucs4_t) val, 6);
                              if (len < 0)
                                fatal ("u8_uctomb returns negative value");
                              result_u8[len] = 0;
                              char *result = string_from_utf8 (result_u8);
                              stream_output_add_text (self, result, len);
                              free (result);
                              conversion_done = 1;
                            }
                        }

                      if (!conversion_done)
                        {
                          stream_output_add_text (self, "U+", 2);
                          stream_output_add_text (self, arg_text->text,
                                                  arg_text->end);
                        }
                    }
                }
              return;
            }
          else if (cmd == CM_value)
            {
              ELEMENT *expansion;
              ELEMENT *value_arg_copy
                = copy_element_tree (element->e.c->contents.list[0], 0);
              NAMED_STRING_ELEMENT_LIST *substrings
                                 = new_named_string_element_list ();
              add_element_to_named_string_element_list (substrings,
                                            "value", value_arg_copy);
              expansion = cdt_tree ("@{No value for `{value}'@}",
                                           self, substrings, 0);

              /* In Perl $formatter->{'_top_formatter'} */
              if (self_plaintext->formatters.number == 1)
                {
                  ELEMENT *value_paragraph = new_element (ET_paragraph);
                  add_to_element_contents (value_paragraph, expansion);

                  convert_to_plaintext_internal (self, value_paragraph);
                  destroy_element_and_children (value_paragraph);
                }
              else
                {
                  convert_to_plaintext_internal (self, expansion);
                  destroy_element_and_children (expansion);
                }
              destroy_named_string_element_list (substrings);

              return;
            }
        }
      else if (nobrace_symbol_text[cmd])
        {
          if (cmd == CM_COLON)
            para_remove_end_sentence ();
          else if (cmd == CM_ASTERISK)
            {
              FORMATTER *formatter
                = top_(formatter) (&self_plaintext->formatters);
              const TEXT pending_word = para_add_pending_word (0);

              stream_output_count_nl (self, pending_word);

       /* added eol in some line oriented constructs, such as @node, menu
          entry and therefore index entry would lead to end of line on
          node pointers line, in tag table, or on menu, all being invalid. */
              if (formatter->no_added_eol)
                stream_output_add_text (self, " ", 1);
              else
                {
                  const TEXT end_line = para_end_line ();
                  stream_output_count_nl (self, end_line);
                }
            }
          else if (cmd == CM_FULL_STOP || cmd == CM_QUESTION_MARK
                       || cmd == CM_EXCLAMATION_MARK)
            {
              stream_output_add_next (self, nobrace_symbol_text[cmd],
                                      strlen (nobrace_symbol_text[cmd]));
              para_add_end_sentence ();
            }
          else if (cmd == CM_SPACE || cmd == CM_NEWLINE || cmd == CM_TAB)
            stream_output_add_next (self, nobrace_symbol_text[cmd],
                                    strlen (nobrace_symbol_text[cmd]));
          else
            stream_output_add_text (self, nobrace_symbol_text[cmd],
                                    strlen (nobrace_symbol_text[cmd]));

          return;
        }
      else if (cmd_data->flags & CF_block)
        {
          if (cmd_data->data == BLOCK_menu)
            {
              const char *format_menu = self->conf->FORMAT_MENU.o.string;
              if (!format_menu || !*format_menu
                  || !strcmp (format_menu, "nomenu"))
                return;
            }
          /* includes @verbatim raw block_commands and block_math_commands */
          if (plaintext_commands_data[cmd].flags & PF_preformatted_context
              || cmd == CM_float)
            {
              if (plaintext_commands_data[cmd].flags & PF_format_raw)
                {
                  const TEXT pending_word = para_add_pending_word (1);
                  stream_output_count_nl (self, pending_word);
                }
              add_(command) (&self_plaintext->context, cmd);
            }
          else if (plaintext_commands_data[cmd].flags & PF_flush)
            add_(command) (&self_plaintext->context, cmd);

          if (plaintext_commands_data[cmd].flags & PF_format_context)
            {
              FORMAT_CONTEXT *top_format_context
                = top_(format_context) (&self_plaintext->format_context);
              FORMAT_CONTEXT format_context = { 0 };
              format_context.cmd = cmd;
              format_context.context_indent_len
                  = top_format_context->context_indent_len;

              if (plaintext_commands_data[cmd].flags & PF_indented)
                {
                  int indent_len;
                  if (plaintext_commands_data[cmd].flags & PF_example_indented)
                    {
                      const char *indent_len_str
                         = self->conf->exampleindent.o.string;
                      if (!indent_len_str)
                        indent_len = default_indent_length;
                      else if (!strcmp ("asis", indent_len_str))
                        indent_len = 0;
                      else
                        {
                          indent_len = atoi (indent_len_str);
                          if (indent_len < 0)
                            indent_len = 0;
                        }
                    }
                  else
                    indent_len = default_indent_length;

                  format_context.context_indent_len += indent_len;
                }
              add_(format_context) (&self_plaintext->format_context,
                                    format_context);

        /*
          open a preformatted container, if the command opening the
          preformatted context is not a classical preformatted
          command (ie if it is menu or verbatim, and not example or
          similar)
         */
              if (plaintext_commands_data[cmd].flags & PF_preformatted_context
                  && !(cmd_data->flags & CF_preformatted)
                  && !(plaintext_commands_data[cmd].flags & PF_format_raw))
                {
                  FORMATTER new_preformatted
                    = new_formatter (self, formatter_unfilled, -1, -1);
                  preformatted = &new_preformatted;

                  push_formatter (self, preformatted);
          /* displaymath rendered as an image, push a count to capture
             formatted content
           */
                  if (cmd_data->flags & CF_math
                      && self_plaintext->element_images)
                    {
                      MATH_ELEMENT_IMAGE *element_image
                = &self_plaintext->element_images->displaymath_images.list[
                          self_plaintext->element_images->displaymath_index];
                      if (element_image->element != element)
                        {
                          char *msg;
                          xasprintf (&msg, "BUG: %zu: out of sync displaymath"
                                           " element image and tree\n");
                          bug (msg);
                          free (msg);
                        }

                      if (element_image->filename)
                        {
          /* displaymath rendered as an image, push a count to capture
             formatted content */
                          push_count_context (&self_plaintext->count_context);
                        }
                    }
                }
            }

          if (cmd == CM_quotation || cmd == CM_smallquotation)
            {
              DOCUMENT_CONTEXT *document_context
                = top_(document_context) (&self_plaintext->document_context);
              CONST_ELEMENT_LIST quotation_authors = { 0 };
              add_(quotations_authors) (&document_context->quotations_authors,
                                        quotation_authors);

              const ELEMENT *arguments_line = element->e.c->contents.list[0];
              ELEMENT *block_line_arg = arguments_line->e.c->contents.list[0];
              if (!empty_spaces_argument (block_line_arg))
                {
                  ELEMENT *prepended;
                  NAMED_STRING_ELEMENT_LIST *replaced_substrings
                    = new_named_string_element_list ();
                  ELEMENT *quotation_arg_copy
                               = copy_element_tree (block_line_arg, 0);
                  int width;

                  add_element_to_named_string_element_list (
                                   replaced_substrings, "quotation_arg",
                                   quotation_arg_copy);

                  prepended
                      = cdt_tree ("@b{{quotation_arg}:} ",
                                  self, replaced_substrings, 0);
                  prepended->type = ET__frenchspacing;

                  width = plaintext_convert_line (self, prepended, -1, -1,
                                                  0, 0);

                  TEXT_CONTEXT *text_element_context
                    = top_(text_element_context) (
                                    &self_plaintext->text_element_context);
                  text_element_context->counter += width;

                  destroy_element_and_children (prepended);
                  destroy_named_string_element_list (replaced_substrings);
                }
            }
          else if (plaintext_commands_data[cmd].flags & PF_menu)
            menu (self, element);
          else if (cmd == CM_multitable)
            {
              DOCUMENT_CONTEXT *top_document_context
                = top_(document_context) (&self_plaintext->document_context);
              size_t i;
              FORMAT_CONTEXT *top_format_context
                = top_(format_context) (&self_plaintext->format_context);
              TEXT_CONTEXT *text_element_context
              = top_(text_element_context) (
                                 &self_plaintext->text_element_context);
              const ELEMENT *columnfractions
                  = multitable_columnfractions (element);
              int columns_size_nr = 0;
              if (columnfractions)
                {
                  int max = text_element_context->max;
                  const STRING_LIST *cf_misc_args
                    = lookup_extra_string_list (columnfractions,
                                                AI_key_misc_args);
                  columns_size_nr = cf_misc_args->number;
                  top_format_context->columns_size
                    = (int *) malloc (columns_size_nr * sizeof (int));
                  for (i = 0; i < cf_misc_args->number; i++)
                    {
                      const char *fraction_str = cf_misc_args->list[i];
                      double fraction = strtod (fraction_str, NULL);
                      int column_size = ((fraction * max) + 0.5);
                      top_format_context->columns_size[i] = column_size;
                    }
                }
              else
                {/* arguments_line type element */
                  const ELEMENT *arguments_line
                    = element->e.c->contents.list[0];
                  const ELEMENT *block_line_arg
                    = arguments_line->e.c->contents.list[0];
                  if (block_line_arg->e.c->contents.number)
                    {
                      columns_size_nr = 0;
                      top_format_context->columns_size
                        = (int *) malloc (
                             (block_line_arg->e.c->contents.number +0)
                                                           * sizeof (int));
                      for (i = 0; i < block_line_arg->e.c->contents.number;
                           i++)
                        {
                          const ELEMENT *content
                            = block_line_arg->e.c->contents.list[i];
                          if (content->type == ET_bracketed_arg)
                            {
                              int column_size = 0;
                              if (content->e.c->contents.number)
                                {
                                  LINE_WIDTH_PENDING_TEXT prototype;
                                  plaintext_convert_line_new_context (self,
                                                content, 0, -1, -1, -1,
                                                  &prototype);
                                  column_size = prototype.width;
                                  clear_pending_text_list (
                                                   prototype.pending_text);
                                }
                              top_format_context->columns_size[columns_size_nr]
                                = column_size +2;
                              columns_size_nr += 1;
                            }
                        }
                    }
                }
              top_format_context->columns_size_nr = columns_size_nr;
              top_format_context->row_cell_lines = (PENDING_TEXT_LIST_LINES *)
                 malloc (columns_size_nr * sizeof (PENDING_TEXT_LIST_LINES));
              memset (top_format_context->row_cell_lines, 0,
                      columns_size_nr * sizeof (PENDING_TEXT_LIST_LINES));
              top_document_context->in_multitable++;
            }
          else if (cmd == CM_float)
            {
              const ELEMENT *argument_line = element->e.c->contents.list[0];
              add_newline_if_needed (self);
              if (argument_line->e.c->contents.number >= 2
          && argument_line->e.c->contents.list[0]->e.c->contents.number)
                plaintext_functions[self->format].format_anchor (self, element);
            }
          else if (cmd == CM_cartouche)
            {
              /* arguments_line type element */
              const ELEMENT *argument_line = element->e.c->contents.list[0];
              ELEMENT *block_line_arg
                = argument_line->e.c->contents.list[0];
              if (!empty_spaces_argument (block_line_arg))
                {
                  NAMED_STRING_ELEMENT_LIST *replaced_substrings
                    = new_named_string_element_list ();
                  ELEMENT *arg_copy = copy_element_tree (block_line_arg, 0);

                  add_element_to_named_string_element_list (
                                   replaced_substrings, "cartouche_arg",
                                   arg_copy);

                  ELEMENT *prepended
                      = cdt_tree ("@center @b{{cartouche_arg}}",
                                  self, replaced_substrings, 0);
                  prepended->type = ET__frenchspacing;

                  /* Do not consider the title to be like a paragraph */
                  FORMAT_CONTEXT *top_format_context
                    = top_(format_context) (&self_plaintext->format_context);
                  int previous_paragraph_count
                    = top_format_context->paragraph_count;

         /* TODO it would be logical to use convert_line here, and it would
            allow to cover translations that do not use @center, but we
            cannot use convert_line here in case there is indentation:
            @center in $prepended already adds an end of line as part
            of its formatting. When the formatter end() is called in
            convert_line we are at the beginning of the line and trailing
            spaces (although there are no space pending) are added because
            'add_final_space' is set in line formatter leads to spurious
            spaces added for indentation at the beginning of the line.
          */
                  convert_to_plaintext_internal (self, prepended);

          /* This is not actually useful since @center already does it,
             but it is logical. */
                  ensure_end_of_line (self);

                  top_format_context
                    = top_(format_context) (&self_plaintext->format_context);
                  top_format_context->paragraph_count
                    = previous_paragraph_count;

                  destroy_element_and_children (prepended);
                  destroy_named_string_element_list (replaced_substrings);
                }
            }
        }
      else if (cmd == CM_node)
        {
          self_plaintext->current_node = element;
          plaintext_functions[self->format].format_node (self, element, 0);
          FORMAT_CONTEXT *top_format_context
            = top_(format_context) (&self_plaintext->format_context);
          top_format_context->paragraph_count = 0;
        }
      else if (cmd_data->flags & CF_sectioning_heading)
        {
          const ELEMENT *heading_element = 0;
          const ELEMENT *line_arg;
          /* use settitle for empty @top
             ignore @part */
          if (cmd_data->flags & CF_root)
            {
              /* arguments_line type element */
              const ELEMENT *arguments_line = element->e.c->contents.list[0];
              line_arg = arguments_line->e.c->contents.list[0];
            }
          else
            line_arg = element->e.c->contents.list[0];

          if (cmd != CM_part && !empty_spaces_argument (line_arg))
            heading_element = line_arg;
          else if (cmd == CM_top)
            {
              const ELEMENT *settitle
                = self->document->global_commands.settitle;
              if (settitle && !empty_spaces_argument (
                                     settitle->e.c->contents.list[0]))
                {
                  heading_element = settitle->e.c->contents.list[0];
                }
            }

          if (heading_element)
            {
              add_newline_if_needed (self);
       /* @* leads to an end of line, underlying appears on the line below
          over one line */
              FORMAT_CONTEXT *top_format_context
                = top_(format_context) (&self_plaintext->format_context);
              int not_empty
                = text_heading (self, element, heading_element,
                                self->conf->NUMBER_SECTIONS.o.integer,
                                top_format_context->context_indent_len, 0);

              if (not_empty)
                {
                  add_lines_count (self, 2);
                  add_newline_if_needed (self);
                }
            }
          FORMAT_CONTEXT *top_format_context
            = top_(format_context) (&self_plaintext->format_context);
          top_format_context->paragraph_count = 0;

          if (!(cmd_data->flags & CF_root))
            return;
        }
      else if ((cmd == CM_item || cmd == CM_itemx)
               && element->e.c->contents.number > 0
               && element->e.c->contents.list[0]->type == ET_line_arg)
        {
          if (!empty_spaces_argument (element->e.c->contents.list[0]))
            {
              TREE_ADDED_ELEMENTS *table_item_tree
                = table_item_content_tree (self, element);
              if (!table_item_tree)
                {
         /* Right now, this can only happen with @itemx in @itemize
            or @enumerate in @*table, which is erroneous */
                  return;
                }
              else
                {
                  int indent_len = self_plaintext->format_context.list[
              self_plaintext->format_context.number -2].context_indent_len;
                  ELEMENT *frenchspacing_element
                    = new_element (ET__frenchspacing);
                  add_to_contents_as_array (frenchspacing_element,
                                            table_item_tree->tree);

                  plaintext_convert_line (self, frenchspacing_element,
                                          indent_len, -1, 0, 0);
                  ensure_end_of_line (self);
                  destroy_element (frenchspacing_element);
                  /* if the added command is a footnote, it has been
                     registered in pending footnotes and will be converted
                     later on, so we keep the added trees with the footnote
                     instead of destroying then now */
                  if (table_item_tree->tree->e.c->cmd == CM_footnote)
                    {
                      PENDING_FOOTNOTE *footnote_and_number
                        = top_(pending_footnote) (
                            &self_plaintext->pending_footnotes);
                      footnote_and_number->added = table_item_tree;
                    }
                  else
                    destroy_tree_added_elements (table_item_tree);
                }
            }
          return;
        }
      else if (cmd == CM_item && element->e.c->parent
               && command_data[element->e.c->parent->e.c->cmd].flags & CF_block
               && command_data[element->e.c->parent->e.c->cmd].data
                                                       == BLOCK_item_container)
        {
          FORMAT_CONTEXT *top_format_context
            = top_(format_context) (&self_plaintext->format_context);
          TEXT_CONTEXT *text_element_context
          = top_(text_element_context) (&self_plaintext->text_element_context);
          enum command_id parent_cmd = element->e.c->parent->e.c->cmd;
          FORMATTER formatter;

          top_format_context->paragraph_count = 0;

          int indent_len
            = self_plaintext->format_context.list[
                 self_plaintext->format_context.number -2].context_indent_len
              + plaintext_commands_data[element->e.c->parent->e.c->cmd]
                                        .indent_format_length;
          formatter = new_formatter (self, formatter_line, indent_len, -1);
          push_formatter (self, &formatter);

          if (parent_cmd == CM_enumerate)
            {
              char *item_representation
                = enumerate_item_representation (element);
              stream_output_add_next (self, item_representation,
                                      strlen (item_representation));
              stream_output_add_next (self, ". ", 2);
              free (item_representation);
            }
          else
            {
              ELEMENT *space_element = new_text_element (ET_other_text);
              text_append_n (space_element->e.text, " ", 1);
              const ELEMENT *prepended_element
                = item_itemize_prepended (element);
              convert_to_plaintext_internal (self, prepended_element);
              convert_to_plaintext_internal (self, space_element);
              destroy_element (space_element);
            }
          const TEXT result = para_end ();
          stream_output_count_nl (self, result);
          text_element_context->counter += para_counter ();
          para_destroy ();
          pop_formatter (self, 0);
        }
      else if (cmd == CM_headitem || cmd == CM_item || cmd == CM_tab)
        {
          int status;
          int cell_width;
          FORMAT_CONTEXT *top_format
            = top_(format_context) (&self_plaintext->format_context);
          FORMAT_CONTEXT format_context = { 0 };
          TEXT_CONTEXT text_element_context = { 0 };
          int cell_nr
            = lookup_extra_integer (element,
                                    AI_key_cell_number, &status);
          if (cell_nr > top_format->columns_size_nr)
            cell_width = 2;
          else
            cell_width = top_format->columns_size[cell_nr -1];
          if (cmd != CM_tab)
            top_format->item_command = cmd;

          format_context.cmd = cmd;
          add_(format_context) (&self_plaintext->format_context,
                                format_context);
          text_element_context.max = cell_width - 2;
          add_(text_element_context) (&self_plaintext->text_element_context,
                                      text_element_context);
          push_count_context (&self_plaintext->count_context);
          cell = 1;
        }
      else if (cmd_data->flags & CF_def)
        {
          convert_def_line (self, element);
          return;
        }
      else if (cmd == CM_center)
        {
          push_count_context (&self_plaintext->count_context);

          ELEMENT *line_arg = element->e.c->contents.list[0];
          if (line_arg->e.c->contents.number)
            {
              ELEMENT *formatted_center = new_element (ET__frenchspacing);
              add_to_contents_as_array (formatted_center, line_arg);
              plaintext_convert_line (self, formatted_center, 0, -1, 0, 0);
              destroy_element (formatted_center);
            }

          COUNT_CONTEXT *top_count_context
           = top_(count_context) (&self_plaintext->count_context);
          if (! pending_is_empty (&top_count_context->pending_text))
            {
              TEXT_CONTEXT *text_element_context
                = top_(text_element_context) (
                         &self_plaintext->text_element_context);
              align_environment (self, text_element_context->max,
                                 AD_center);
              ensure_end_of_line (self);
            }
          else
            {
     /* it has to be done here, as it is done in _align_environment above */
              pop_count_context (&self_plaintext->count_context);
              /* in case there is no text but anchor, merge */
              merge_pending_with_parent (self,
                                         &top_count_context->pending_text);
            }

          FORMAT_CONTEXT *top_format
            = top_(format_context) (&self_plaintext->format_context);
          top_format->paragraph_count++;
          return;
        }
      else if (cmd == CM_exdent)
        {
          const ELEMENT *exdent_line_arg = element->e.c->contents.list[0];
          if (!empty_spaces_argument (exdent_line_arg))
            {
              enum command_id context_cmd
                 = *top_(command) (&self_plaintext->context);
              int indent = self_plaintext->format_context.list[
                self_plaintext->format_context.number -2].context_indent_len;
              if (plaintext_commands_data[context_cmd].flags
                                              & PF_preformatted_context)
                {
                  FORMATTER new_preformatted
                    = new_formatter (self, formatter_unfilled, indent, -1);

                  FONT_TYPE *font_type
                    = top_(font_type) (new_preformatted.font_type_stack);
                  font_type->monospace = 1;

                  push_formatter (self, &new_preformatted);
                  convert_to_plaintext_internal (self, exdent_line_arg);
                  const TEXT result = para_end ();
                  stream_output_count_nl (self, result);
                  para_destroy ();
                  pop_formatter (self, 0);
                }
              else
                {
                  plaintext_convert_line (self, exdent_line_arg, indent,
                                          -1, 0, 0);
                }
            }
          ensure_end_of_line (self);
          return;
        }
      else if (cmd == CM_verbatiminclude)
        {
          ELEMENT *verbatim_include_verbatim
            = converter_expand_verbatiminclude (element,
                              &self->error_messages, self->conf,
                              &self->document->global_info);
          if (verbatim_include_verbatim)
            {
              convert_to_plaintext_internal (self, verbatim_include_verbatim);
              destroy_element_and_children (verbatim_include_verbatim);
            }
          return;
        }
      else if (cmd == CM_insertcopying)
        {
          const ELEMENT *copying = self->document->global_commands.copying;
          if (copying)
            {
              ELEMENT *copying_content = new_element (ET_NONE);
              insert_slice_into_contents (copying_content,
                               copying_content->e.c->contents.number,
                               copying, 1, copying->e.c->contents.number);

              convert_to_plaintext_internal (self, copying_content);
              destroy_element (copying_content);
            }
          return;
        }
      else if (cmd == CM_printindex)
        {
          plaintext_functions[self->format].format_printindex (self, element);
          return;
        }
      else if (cmd == CM_listoffloats)
        {
          int lines_count = 0;
          size_t i;
          const char *listoffloats_name;
          const LISTOFFLOATS_TYPE_LIST *listoffloats
             = &self->document->listoffloats;

          if (!listoffloats->number)
            return;

          listoffloats_name = lookup_extra_string (element, AI_key_float_type);
          for (i = 0; i < listoffloats->number; i++)
            {
              const LISTOFFLOATS_TYPE *float_types = &listoffloats->list[i];
              if (!strcmp (float_types->type, listoffloats_name))
                {
                  size_t j;

                  if (float_types->float_list.number <= 0)
                    return;

                  add_newline_if_needed (self);
                  stream_output_n (self, "* Menu:\n\n", 9);
                  lines_count += 2;

                  for (j = 0; j < float_types->float_list.number; j++)
                    {
                      const FLOAT_INFORMATION *float_info
                        = &float_types->float_list.list[j];
                      const ELEMENT *float_elt = float_info->float_element;
                      const ELEMENT *argument_line
                        = float_elt->e.c->contents.list[0];
                      ELEMENT *float_entry;
                      ELEMENT *float_type_formatted;
                      const ELEMENT *caption_shortcaption[2];
                      const ELEMENT *caption_element;

                      if (argument_line->e.c->contents.number < 2
                          || empty_spaces_argument (
                                argument_line->e.c->contents.list[1]))
                        continue;

                      float_entry = float_type_number (self, float_elt);
                      if (!float_entry)
                        continue;

                      FORMATTER new_paragraph
                         = new_formatter (self, formatter_paragraph,
                                          0, listoffloat_entry_length);
                      push_formatter (self, &new_paragraph);

         /* Output in format "* $float_entry_text: $float_label_text.". */
                      stream_output_add_next (self, "* ", 2);

                      float_entry->type = ET__frenchspacing;
                      convert_to_plaintext_internal (self, float_entry);
                      destroy_element_and_children (float_entry);

                      stream_output_add_next (self, ": ", 2);

                      float_type_formatted = new_element (ET__code);
                      add_to_contents_as_array (float_type_formatted,
                                 argument_line->e.c->contents.list[1]);

                      convert_to_plaintext_internal (self,
                                                     float_type_formatted);
                      destroy_element (float_type_formatted);

                      stream_output_add_next (self, ".", 1);

                      const TEXT pending_word = para_add_pending_word (0);
                      stream_output_count_nl (self, pending_word);

          /* NB we trust that only $container was used to format text
             inside the call to convert_line so that all output text is
             counted. */
                      int line_width = para_counter ();
                      if (line_width > listoffloat_entry_length)
                        {
                          const TEXT end_line = para_end_line ();
                          stream_output_count_nl (self, end_line);
                        }
                      else
                        {
                          int k;
                          int space_nr = listoffloat_entry_length - line_width;
                          for (k = 0; k < space_nr; k++)
                            stream_output_add_next (self, " ", 1);
                        }

                      find_float_caption_shortcaption (float_elt,
                                                       caption_shortcaption);
                      caption_element = caption_shortcaption[1];
                      if (!caption_element)
                        caption_element = caption_shortcaption[0];

                      if (caption_element
                          && caption_element->e.c->contents.number > 0
                          && !empty_spaces_argument (
                                caption_element->e.c->contents.list[0]))
                        {
                          size_t j;
                          const ELEMENT *caption_arg
                            = caption_element->e.c->contents.list[0];
                          add_(command) (&self_plaintext->context, cmd);
                          self_plaintext->multiple_pass = 1;

           /* we do not want to start a new paragraph formatter so
              we iterate over the contents of a paragraph rather than
              converting the paragraph itself. */
                          for (j = 0; j < caption_arg->e.c->contents.number;
                               j++)
                            {
                              const ELEMENT *content
                                = caption_arg->e.c->contents.list[j];

                              if (content->type == ET_paragraph
                                  && content->e.c->contents.number)
                                {
                                  size_t l;
                                  for (l = 0;
                                       l < content->e.c->contents.number; l++)
                                    {
                                      const ELEMENT *subelement
                                         = content->e.c->contents.list[l];
                                      convert_to_plaintext_internal (self,
                                                                 subelement);
                                    }
                                  break;
                                }
                              else if (content->type
                                           != ET_spaces_before_argument)
                                {
                                  convert_to_plaintext_internal (self,
                                                                 content);
                                  break;
                                }
                            }

                          self_plaintext->multiple_pass = 0;
                          pop_context (&self_plaintext->context);
                        }
                      /* flush and add newline */
                      const TEXT result = para_end ();
                      stream_output_count_nl (self, result);

                      para_destroy ();
                      pop_formatter (self, 0);
                    }
                  stream_output_n (self, "\n", 1);
                  lines_count++;

                  break;
                }
            }

          FORMAT_CONTEXT *top_format
            = top_(format_context) (&self_plaintext->format_context);
          top_format->paragraph_count++;

          add_lines_count (self, lines_count);

          return;
        }
      else if (cmd == CM_sp)
        {
          int i;
          TEXT_CONTEXT *text_element_context
          = top_(text_element_context) (&self_plaintext->text_element_context);
          int sp_nr = 1;
          const STRING_LIST *misc_args
             = lookup_extra_string_list (element, AI_key_misc_args);

          const TEXT pending_word = para_add_pending_word (0);
          stream_output_count_nl (self, pending_word);

          if (misc_args && misc_args->number > 0)
            sp_nr = strtol (misc_args->list[0], NULL, 10);

          for (i = 0; i < sp_nr; i++)
            {
              const TEXT end_line = para_end_line ();
              stream_output_count_nl (self, end_line);
            }

          text_element_context->counter = 0;
          return;
        }
      else if (cmd == CM_contents
               || cmd == CM_shortcontents || cmd == CM_summarycontents)
        {
          if (self->document->sections_list.number > 0)
            {
              plaintext_functions[self->format].format_contents (self,
                                     self->document->sectioning_root, cmd);
              return;
            }
        }
      else if (cmd == CM_author)
        {
          DOCUMENT_CONTEXT *top_document_context
            = top_(document_context) (&self_plaintext->document_context);

          if (top_document_context->quotations_authors.number > 0)
            {
              CONST_ELEMENT_LIST *top_quotations_authors
                = top_(quotations_authors) (
                                 &top_document_context->quotations_authors);
              add_(const_element) (top_quotations_authors, element);
            }
          return;
        }

   /* all the @-commands that have an information for the formatting, like
      @paragraphindent, @frenchspacing... */
      else if (self_plaintext->commands_data[cmd].flags & PF_informative)
        {
          set_informative_command_value (self->sorted_options, element);

          if (cmd == CM_documentlanguage)
            {
              self->current_lang_translations =
                 set_translations_documentlanguage (
                              &converters_translation_cache,
                              self->conf->documentlanguage.o.string,
                              self->current_lang_translations,
                              TXI_CONVERT_STRINGS_NR);
            }
          else if (cmd == CM_documentscript)
            {
              self->current_lang_translations =
                 set_translations_documentscript (
                              &converters_translation_cache,
                              self->conf->documentscript.o.string,
                              self->current_lang_translations,
                              TXI_CONVERT_STRINGS_NR);
            }
          return;
        }
      else if (cmd == CM_documentlanguagevariant)
        {/* special case, array argument */
          STRING_LIST *language_variants
            = documentlanguagevariant_variants (element);
          self->current_lang_translations =
               set_translations_documentlanguagevariant (
                              &converters_translation_cache,
                              language_variants,
                              self->current_lang_translations,
                              TXI_CONVERT_STRINGS_NR);

          destroy_strings_list (language_variants);
          return;
        }
      else
        { /* unknown command */
          char *unknown_cmd_str;
          xasprintf (&unknown_cmd_str, "!!!!!!!!! Unhandled %s !!!!!!!!!\n",
                     element_command_name (element));
          stream_output (self, unknown_cmd_str);
          free (unknown_cmd_str);
          add_lines_count (self, 1);
        }
    }

  if (type != ET_NONE)
    {
      if (type == ET_paragraph)
        {
          TEXT_CONTEXT *text_element_context
          = top_(text_element_context) (&self_plaintext->text_element_context);
          int paragraphindent = self->conf->paragraphindent.o.integer;
          enum command_id context_cmd
             = *top_(command) (&self_plaintext->context);
          FORMAT_CONTEXT *top_format
            = top_(format_context) (&self_plaintext->format_context);

          int para_indent_size = -1;
          int para_indent_next = -1;
          if (top_format->cmd == CM_NONE /* '_top_format' in Perl */
              && paragraphindent >= 0
              && (element->flags & EF_indent
                  || (!(element->flags & EF_noindent)
                      && (top_format->paragraph_count
                          || (self->conf->firstparagraphindent.o.string
         && !strcmp (self->conf->firstparagraphindent.o.string, "insert")))
                      && text_element_context->counter == 0)))
            {
              para_indent_size = paragraphindent;
              para_indent_next = 0;
            }

          top_format->paragraph_count++;

          FORMATTER new_paragraph
            = new_formatter (self, formatter_paragraph,
                             para_indent_size, para_indent_next);

          push_formatter (self, &new_paragraph);

          if (context_cmd == CM_flushright)
            {
              push_count_context (&self_plaintext->count_context);
            }
        }
      else if (type == ET_preformatted || type == ET_rawpreformatted)
        {
          enum command_id context_cmd
             = *top_(command) (&self_plaintext->context);
     /* if in a description reuse the main menu unfilled, to keep things
        simpler and avoid having to do a separate count. */
          if (type == ET_rawpreformatted
              || !element->e.c->parent
              || element->e.c->parent->type != ET_menu_entry_description)
            {
              FORMATTER new_preformatted
                = new_formatter (self, formatter_unfilled, -1, -1);
              preformatted = &new_preformatted;
              push_formatter (self, preformatted);

              if (context_cmd == CM_flushright)
                {
                  push_count_context (&self_plaintext->count_context);
                }
            }
        }
      else if (type == ET_def_line)
        {
          convert_def_line (self, element);
          return;
        }
      else if (type == ET_menu_entry)
        {
          int entry_name_seen = 0;
          const ELEMENT *menu_entry_node;
          size_t i;
          int warn_special_char
            = (self->conf->INFO_SPECIAL_CHARS_WARNING.o.integer > 0
               && !self_plaintext->silent);

          for (i = 0; i < element->e.c->contents.number; i++)
            {
              const ELEMENT *content = element->e.c->contents.list[i];
              if (content->type == ET_menu_entry_leading_text)
                stream_output_add_next (self, content->e.text->text,
                                        content->e.text->end);
              else if (content->type == ET_menu_entry_node)
                {
                  ELEMENT *entry_node = new_element (ET__code);
                  /* Flush output so not to include in node text. */
                  const TEXT pending_word = para_add_pending_word (1);
                  stream_output_count_nl (self, pending_word);
                  TEXT node_text;
                  int node_quoting_required = 0;

                  menu_entry_node = content;

                  FORMATTER *formatter
                    = top_(formatter) (&self_plaintext->formatters);
                  formatter->suppress_styles = 1;
                  formatter->no_added_eol = 1;

                  push_count_context (&self_plaintext->count_context);

                  add_to_contents_as_array (entry_node, (ELEMENT *)content);
                  convert_to_plaintext_internal (self, entry_node);

                  destroy_element (entry_node);

                  const TEXT n_pending_word = para_add_pending_word (1);
                  stream_output_count_nl (self, n_pending_word);

                  node_text = stream_to_text (self);
                  pop_count_context (&self_plaintext->count_context);

                  formatter
                    = top_(formatter) (&self_plaintext->formatters);
                  formatter->suppress_styles = 0;
                  formatter->no_added_eol = 0;

                  if (warn_special_char
                      || self->conf->INFO_SPECIAL_CHARS_QUOTE.o.integer > 0)
                    {
                      const char *check_chars;
                      const char *p;

                      if (entry_name_seen)
                        check_chars = ",\t.";
                      else
                        check_chars = ":";

                      p = strpbrk (node_text.text, check_chars);

                      if (p && (*p != '.' || *(p+1) == ' '))
                        {
                          if (warn_special_char)
                            {
                              char shown_char[3] = {*p, '\0', '\0'};
                              if (*p == '.')
                                shown_char[1] = *(p+1);

                              message_list_command_warn (&self->error_messages,
                               (self->conf && self->conf->DEBUG.o.integer > 0),
                               element, 0,
                             "menu entry node name should not contain `%s'",
                               shown_char);
                            }
                          if (self->conf->INFO_SPECIAL_CHARS_QUOTE.o.integer > 0)
                            node_quoting_required = 1;
                        }
                    }
                  if (node_quoting_required)
                    stream_output_n (self, node_quote, 1);
                  stream_output_n (self, node_text.text, node_text.end);
                  if (node_quoting_required)
                    stream_output_n (self, node_quote, 1);

                  free (node_text.text);
                }
              else if (content->type == ET_menu_entry_name)
                {/* Flush output so not to include in name text */
                  const TEXT pending_word = para_add_pending_word (1);
                  stream_output_count_nl (self, pending_word);
                  TEXT entry_name;
                  int name_quoting_required = 0;

                  FORMATTER *formatter
                    = top_(formatter) (&self_plaintext->formatters);
                  formatter->no_added_eol = 1;

                  push_count_context (&self_plaintext->count_context);

                  convert_to_plaintext_internal (self, content);

                  const TEXT n_pending_word = para_add_pending_word (1);
                  stream_output_count_nl (self, n_pending_word);

                  entry_name = stream_to_text (self);
                  pop_count_context (&self_plaintext->count_context);

                  formatter
                    = top_(formatter) (&self_plaintext->formatters);
                  formatter->no_added_eol = 0;

                  entry_name_seen = 1;

                  if (warn_special_char
                      || self->conf->INFO_SPECIAL_CHARS_QUOTE.o.integer > 0)
                    {
                      const char *p;

                      p = strpbrk (entry_name.text, ":");

                      if (p)
                        {
                          if (warn_special_char)
                            {
                              message_list_command_warn (&self->error_messages,
                               (self->conf && self->conf->DEBUG.o.integer > 0),
                               element, 0,
                             "menu entry name should not contain `:'");
                            }
                          if (self->conf->INFO_SPECIAL_CHARS_QUOTE.o.integer > 0)
                            name_quoting_required = 1;
                        }
                    }
                  if (name_quoting_required)
                    stream_output_n (self, node_quote, 1);
                  stream_output_n (self, entry_name.text, entry_name.end);
                  if (name_quoting_required)
                    stream_output_n (self, node_quote, 1);

                  free (entry_name.text);
                }
              /* empty description */
              else if (content->type == ET_menu_entry_description
                       && (content->e.c->contents.number == 0
                           || (content->e.c->contents.number == 1
                               &&
            (content->e.c->contents.list[0]->e.c->contents.number == 0
             || (content->e.c->contents.list[0]->e.c->contents.number == 1
                 && type_data[
   content->e.c->contents.list[0]->e.c->contents.list[0]->type].flags & TF_text
                 &&
       content->e.c->contents.list[0]->e.c->contents.list[0]->e.text->text[
  strspn (content->e.c->contents.list[0]->e.c->contents.list[0]->e.text->text,
          whitespace_chars)] == '\0')))))
                {
                  const ELEMENT *node_description = 0;
                  int long_description = 0;
                  const char *normalized;
                  if (menu_entry_node)
                   {
                     normalized
                      = lookup_extra_string (menu_entry_node,
                                             AI_key_normalized);
                     if (normalized)
                       {
                         const ELEMENT *node_element
                           = find_identifier_target (
                                  &self->document->identifiers_target,
                                  normalized);
                         if (node_element
                             && node_element->e.c->cmd == CM_node)
                           {
                             const NODE_RELATIONS_LIST *nodes_list
                               = &self->document->nodes_list;
                             int status;
                             size_t node_number
                               = lookup_extra_integer (node_element,
                                  AI_key_node_number, &status);
                             if (status == 0)
                               {
                                 const NODE_RELATIONS *node_relations
                                   = nodes_list->list[node_number -1];
                                 if (node_relations->node_description)
                                   node_description
                                     = node_relations->node_description;
                                 else if (node_relations->node_long_description)
                                   {
                                     node_description
                                      = node_relations->node_long_description;
                                     long_description = 1;
                                   }
                               }
                           }
                       }
                    }
                  if (node_description)
                    {
                      int description_align_column;
                      int description_indent_length;
                      uintptr_t seen_description_nr = 0;
                      if (
            self->conf->AUTO_MENU_DESCRIPTION_ALIGN_COLUMN.o.integer >= 0)
                        description_align_column
                 = self->conf->AUTO_MENU_DESCRIPTION_ALIGN_COLUMN.o.integer;
                      else
                        {
                          TEXT_CONTEXT *text_element_context
                             = top_(text_element_context)
                                    (&self_plaintext->text_element_context);
                          description_align_column
                            = (int) (text_element_context->max
                                  * description_align_column_factor);
                        }
                      description_indent_length = description_align_column-1;

                      if (! is_c_hashmap_registered (
                            &self_plaintext->seen_node_descriptions,
                                         normalized))
                        {
                          c_hashmap_register (
                                 &self_plaintext->seen_node_descriptions,
                                         normalized, 0);
                        }
                      else
                        {
                          int found;
                          seen_description_nr = (uintptr_t) c_hashmap_value (
                             &self_plaintext->seen_node_descriptions,
                             normalized, &found);
                        }
                      seen_description_nr++;
                      c_hashmap_set_value (
                             &self_plaintext->seen_node_descriptions,
                             normalized, (const void *)seen_description_nr);

                      /* flush the current unfilled container */
                      const TEXT pending_word = para_add_pending_word (1);
                      stream_output_count_nl (self, pending_word);

                      int text_count = para_counter ();

                      if (text_count >= description_indent_length)
                        {
                          const TEXT result = para_add_text ("  ", 2);
                          stream_output_count_nl (self, result);

                          const TEXT pending_word = para_add_pending_word (1);
                          stream_output_count_nl (self, pending_word);
                          text_count += 2;
                        }


                      TEXT_CONTEXT *top_text_element_context
                        = top_(text_element_context)
                                 (&self_plaintext->text_element_context);
                      TEXT_CONTEXT text_element_context = { text_count, 0 };

                      if (self->conf->AUTO_MENU_MAX_WIDTH.o.integer >= 0)
                        text_element_context.max
                          = self->conf->AUTO_MENU_MAX_WIDTH.o.integer;
                      else
                        { /* e.g. 72 -> 79 */
                          text_element_context.max
                            = (int) (top_text_element_context->max * 1.1);
                        }
                      add_(text_element_context) (
                              &self_plaintext->text_element_context,
                              text_element_context);

      /* avoid messages if formatting the node description more than once */
                      if (seen_description_nr > 1)
                        self_plaintext->silent++;


                      if (!long_description)
                        {
                 /* push a paragraph container to format the description. */
                          FORMATTER description_para
                            = new_formatter (self, formatter_paragraph,
                                             description_indent_length, -1);
                          push_formatter (self, &description_para);
                          convert_to_plaintext_internal (self,
                                    node_description->e.c->contents.list[0]);
                          const TEXT result = para_end ();
                          stream_output_count_nl (self, result);
                          para_destroy ();
                          pop_formatter (self, 0);
                        }
                      else
                        {
                          FORMAT_CONTEXT format_context = { 0 };
                          format_context.cmd = node_description->e.c->cmd;
                          format_context.context_indent_len
                                       = description_indent_length;
                          format_context.paragraph_count = 0;

                          add_(format_context) (&self_plaintext->format_context,
                                        format_context);

                          ELEMENT *formatted_elt = new_element (ET_NONE);
                          insert_slice_into_contents (formatted_elt,
                               formatted_elt->e.c->contents.number,
                               node_description, 1,
                               node_description->e.c->contents.number);

                          convert_to_plaintext_internal (self, formatted_elt);
                          destroy_element (formatted_elt);

                          pop_(format_context)
                                 (&self_plaintext->format_context);
                        }

                      pop_(text_element_context)
                             (&self_plaintext->text_element_context);
                      if (seen_description_nr > 1)
                        self_plaintext->silent--;
                    }
                  else
                    convert_to_plaintext_internal (self, content);
                }
              else
                convert_to_plaintext_internal (self, content);
            }

  /* If we are nested inside an @example, a 'menu_entry_description' may not
     have been processed yet, and we need to output any pending spaces
     before 'end_line' throws them away.  The argument to 'add_pending_word'
     does this. */
          if (element->e.c->parent
              && element->e.c->parent->type == ET_preformatted)
            {
              const TEXT pending_word = para_add_pending_word (1);
              stream_output_count_nl (self, pending_word);
            }
          else
            {
              const TEXT pending_word = para_add_pending_word (0);
              stream_output_count_nl (self, pending_word);
              para_end_line ();
              ensure_end_of_line (self);
            }
          return;
        }
      else if (type == ET__frenchspacing)
        {
          FORMATTER *formatter
                = top_(formatter) (&self_plaintext->formatters);
          add_(integer) (&formatter->frenchspacing_stack, 1);
          para_set_conf_frenchspacing (1);
        }
      else if (type == ET__code)
        {
          FORMATTER *formatter
                = top_(formatter) (&self_plaintext->formatters);
          open_code (formatter);
        }
      else if (type == ET__stop_upper_case)
        {
          FORMATTER *formatter
                = top_(formatter) (&self_plaintext->formatters);
          UPPER_CASE upper_case = { 0 };
          add_(upper_case) (formatter->upper_case_stack, upper_case);
        }
      else if (type == ET__suppress_styles)
        {
          FORMATTER *formatter
                = top_(formatter) (&self_plaintext->formatters);
          formatter->suppress_styles = 1;
        }
      else if (type == ET_untranslated_def_line_arg)
        {
          const char *category_text
            = element->e.c->contents.list[0]->e.text->text;
          const char *translation_context
            = lookup_extra_string (element, AI_key_translation_context);

          ELEMENT *tree = cdt_tree (category_text, self, 0,
                                    translation_context);

          convert_to_plaintext_internal (self, tree);

          destroy_element_and_children (tree);

          return;
        }
    }

  /* Convert any contents */
  size_t i;
  for (i = 0; i < element->e.c->contents.number; i++)
    {
      const ELEMENT *content = element->e.c->contents.list[i];
      convert_to_plaintext_internal (self, content);

       /*
      COUNT_CONTEXT *count_context
           = top_(count_context) (&self_plaintext->count_context);
      char *element_debug = print_element_debug (content, 1);
      char *pending = debug_print_pending (&count_context->pending_text);
      fprintf (stderr, "CONVERTED %zu %s '%s'\n", i, element_debug, pending);
      free (element_debug);
      free (pending);
        */
    }

  /* Now closing.  First, close types. */
  if (type != ET_NONE)
    {
      if (type == ET__frenchspacing)
        {
          FORMATTER *formatter
                = top_(formatter) (&self_plaintext->formatters);
          pop_(integer) (&formatter->frenchspacing_stack);

          para_set_conf_frenchspacing (*(top_(integer)
                                 (&formatter->frenchspacing_stack)));
        }
      else if (type == ET__code)
        {
          FORMATTER *formatter
                = top_(formatter) (&self_plaintext->formatters);
          close_code (formatter);
        }
      else if (type == ET__stop_upper_case)
        {
          FORMATTER *formatter
                = top_(formatter) (&self_plaintext->formatters);
          pop_(upper_case) (formatter->upper_case_stack);
        }
      else if (type == ET__suppress_styles)
        {
          FORMATTER *formatter
                = top_(formatter) (&self_plaintext->formatters);
          formatter->suppress_styles = 0;
        }
      else if (type == ET_row)
        {
          COUNT_CONTEXT *count_context
           = top_(count_context) (&self_plaintext->count_context);
          int i;
          FORMAT_CONTEXT *top_format
            = top_(format_context) (&self_plaintext->format_context);
          /* used to register the index entry locations and pass them
             to the parent, not for conversion */
          int max_cell_nr = top_format->cell_idx;
     /* beginning of cell in character width based on column sizes given
        in the specification of the table. */
          int *cell_beginnings = (int *) malloc (max_cell_nr * sizeof (int));
     /* array of lines in each cell, with pending text gathered with the
        max limit on line length per column, for each cell. */
          PENDING_TEXT_LIST_LINES *cell_lines = top_format->row_cell_lines;
          int cell_beginning = 0;
     /* number maximum of line for the cells in this row */
          int max_lines = 0;
          int indent_len = top_format->context_indent_len;
          PENDING_TEXT_LIST *result = &count_context->pending_text;

          for (i = 0; i < max_cell_nr; i++)
            {
              cell_beginnings[i] = cell_beginning;
              int cell_width;
              int cell_idx = i;
              if (cell_idx < top_format->columns_size_nr)
                cell_width = top_format->columns_size[i];
              else
                cell_width = 2;
              cell_beginning += cell_width + 1;

              int cell_lines_nr = cell_lines[i].number;
              if (cell_lines_nr > max_lines)
                max_lines = cell_lines_nr;
            }

          /* In the following loop, we do not use stream_output for added
             spaces and newlines because we never know if there is
             a trailing anchor at the end of the previous cell or line */
          int line_idx;
          for (line_idx = 0; line_idx < max_lines; line_idx++)
            {
              int k;
              int line_width = indent_len;
              int cell_idx;
              int indent_done = 0;
              if (indent_len == 0)
                indent_done = 1;
              /*
               determine the last cell index in the line, to fill spaces in
               cells preceding that cell on the line */
              int last_cell = 0;
              for (cell_idx = 0; cell_idx < max_cell_nr; cell_idx++)
                {
                  if (cell_lines[cell_idx].number >= (unsigned int)line_idx +1)
                     last_cell = cell_idx+1;
                }

              for (cell_idx = 0; cell_idx < last_cell; cell_idx++)
                {
                  if (cell_lines[cell_idx].number >= (unsigned int)line_idx +1)
                    {
                      PENDING_TEXT_LIST *cell_line
                        = &cell_lines[cell_idx].list[line_idx];
                      size_t j;
                      for (j = cell_line->number; j > 0; j--)
                        {
                          PENDING_TEXT *pending_text = &cell_line->list[j -1];
                          TEXT *t = &pending_text->text;
                          if (t->end > 0)
                            {
                              if (t->text[t->end -1] == '\n')
                                {
                                  t->text[t->end -1] = '\0';
                                  t->end--;
                                }
                              break;
                            }
                        }

                      for (j = 0; j < cell_line->number; j++)
                        {
                          PENDING_TEXT *pending_text = &cell_line->list[j];
                          TEXT *t = &pending_text->text;
                          if (t->end > 0 || pending_text->type != PLT_text)
                            {
                              if (!indent_done)
                                {
                                  if (indent_len > 0)
                                    {
                                      PENDING_TEXT *spaces
                                      = add_top_pending_text (result, PLT_text);
                                      for (k = 0; k < indent_len; k++)
                                        text_append_n (&spaces->text, " ", 1);
                                      indent_done = 1;
                                    }
                                }
                            }
                          if (pending_text->type == PLT_quoted_image)
                            line_width += IMAGE_WIDTH;
                          else
                            line_width += width_multibyte (t->text, t->end);
                          PENDING_TEXT *dst_pending_text
                            = add_top_pending_text (result, PLT_text);
                          replace_pending_text (dst_pending_text, pending_text);
                        }
                    }
                  if (cell_idx+1 < last_cell)
                    {
                      if (line_width < indent_len
                                    + cell_beginnings[cell_idx+1])
                        {
                          int spaces_nr;
                          if (!indent_done)
                            {
                              PENDING_TEXT *spaces
                                 = add_top_pending_text (result, PLT_text);
                              for (k = 0; k < indent_len; k++)
                                text_append_n (&spaces->text, " ", 1);
                              indent_done = 1;
                            }
                          spaces_nr = indent_len
                                         + cell_beginnings[cell_idx+1]
                                         - line_width;
                          if (spaces_nr > 0)
                            {
                              PENDING_TEXT *spaces
                                 = add_top_pending_text (result, PLT_text);
                              for (k = 0; k < spaces_nr; k++)
                                text_append_n (&spaces->text, " ", 1);
                            }
                          line_width += spaces_nr;
                        }
                    }
                }
              PENDING_TEXT *new_nl = add_top_pending_text (result, PLT_text);
              text_append_n (&new_nl->text, "\n", 1);
            }
          free (cell_beginnings);

          if (top_format->item_command == CM_headitem)
            {
              int k;
        /* at this point cell_beginning is at the beginning of
           the cell following the end of the table -> full width */
              for (k = 0; k < indent_len; k++)
                stream_output_n (self, " ", 1);
              for (k = 0; k < cell_beginning; k++)
                stream_output_n (self, "-", 1);
              stream_output_n (self, "\n", 1);
              max_lines++;
            }

          count_context->lines += max_lines;

          top_format->cell_idx = 0;
          for (i = 0; i < max_cell_nr; i++)
            clear_pending_text_lines (&cell_lines[i]);
        }
      else if (type == ET_before_node_section)
        {
          TEXT result;
          TEXT text;
          text_init (&text);
          text_init (&result);

          ensure_end_of_line (self);
          COUNT_CONTEXT *count_context
            = top_(count_context) (&self_plaintext->count_context);
          PENDING_TEXT_LIST *pending_texts = &count_context->pending_text;
          /* here we copy without releasing, as we want to have the pending
             texts be processed as usual in the following of the code */
          for (i = 0; i < pending_texts->number; i++)
            {
              PENDING_TEXT *pending_text = &pending_texts->list[i];
              TEXT *t = &pending_text->text;
              text_append_n (&text, t->text, t->end);
            }

          if (self_plaintext->encoding_object)
            {
              TEXT converted_text
               = encode_with_iconv (self_plaintext->encoding_object->iconv,
                                              text.text, text.end,
                                              0, ieh_error, 0);
              self_plaintext->text_before_first_node = converted_text;
              free (text.text);
            }
          else
            self_plaintext->text_before_first_node = text;

          return;
        }
    }

  /* Close paragraphs and preformatted. */
  if (type == ET_paragraph)
    {
      TEXT_CONTEXT *text_element_context
        = top_(text_element_context) (&self_plaintext->text_element_context);
      const TEXT result = para_end ();
      stream_output_count_nl (self, result);
      enum command_id context_cmd = *top_(command) (&self_plaintext->context);

      if (context_cmd == CM_flushright)
        {
          align_environment (self, text_element_context->max, AD_right);
          ensure_end_of_line (self);
        }

      text_element_context->counter = 0;
      para_destroy ();
      pop_formatter (self, 0);
    }
 /* may have been opened for a block commands, @menu, raw output
    format, @verbatim..., or for (raw)preformatted type */
  else if (preformatted)
    {
      TEXT_CONTEXT *text_element_context
        = top_(text_element_context) (&self_plaintext->text_element_context);
      const TEXT end_line = para_end ();
      enum command_id context_cmd = *top_(command) (&self_plaintext->context);

      stream_output_count_nl (self, end_line);

      ensure_end_of_line (self);

      if (context_cmd == CM_flushright)
        {
          align_environment (self, text_element_context->max, AD_right);
          ensure_end_of_line (self);
        }
      else if (context_cmd == CM_displaymath
               && self_plaintext->element_images)
        {
          MATH_ELEMENT_IMAGE *element_image
           = &self_plaintext->element_images->displaymath_images.list[
                self_plaintext->element_images->displaymath_index];
          if (element_image->element != element)
            {
              char *msg;
              xasprintf (&msg, "BUG: %zu: out of sync close displaymath"
                                           " element image and tree\n");
              bug (msg);
              free (msg);
            }

          if (element_image->filename)
            {
              static CONST_ELEMENT_LIST anchors;
              TEXT math_text = stream_to_text_anchor (self, &anchors);

              pop_count_context (&self_plaintext->count_context);

              /* readd anchors in front of the image */
              if (anchors.number)
                {
                  size_t i;
                  for (i = 0; i < anchors.number; i++)
                    plaintext_add_target_location (self, anchors.list[i]);
                  anchors.number = 0;
                }

     /* NB we don't output the below-baseline depth for @displaymath as
        it does not need to be aligned with surrounding text. */
              int line_count
                 = plaintext_insert_image (self, element_image->filename,
                             math_text,
                             element_image->dpi, 0);

              add_lines_count (self, line_count);
              ensure_end_of_line (self);
              free (math_text.text);
            }

          self_plaintext->element_images->displaymath_index++;
        }

      para_destroy ();
      pop_formatter (self, 0);

    /* We assume that, upon closing the preformatted we are at the
       beginning of a line. */
      text_element_context->counter = 0;
    }

  /* Close commands */
  if (cmd != CM_NONE)
    {
      if (cmd == CM_float)
        {
          const ELEMENT *caption_shortcaption[2];
          find_float_caption_shortcaption (element, caption_shortcaption);
          const ELEMENT *caption = caption_shortcaption[0];
          const ELEMENT *shortcaption = caption_shortcaption[1];

          const char *float_type
            = lookup_extra_string (element, AI_key_float_type);
          const char *float_number
            = lookup_extra_string (element, AI_key_float_number);

          if (float_type || float_number || caption || shortcaption)
            {
              FLOAT_CAPTION_PREPENDED_ELEMENT *caption_prepended
                = float_name_caption (self, element);
              const ELEMENT *caption_element = caption_prepended->caption;
              ELEMENT *prepended = caption_prepended->prepended;

              add_newline_if_needed (self);

              free (caption_prepended);

              if (prepended)
                {
                  prepended->type = ET__frenchspacing;
       /* there is no specific need for a line formatter, but there is
          a need for a formatter */
                  int width = plaintext_convert_line (self, prepended,
                                                       -1, -1, 0, 0);

                  TEXT_CONTEXT *text_element_context
                    = top_(text_element_context) (
                                  &self_plaintext->text_element_context);
                  text_element_context->counter += width;

                  destroy_element_and_children (prepended);
                }
              if (caption_element)
                {
                  FORMAT_CONTEXT *top_format_context
                   = top_(format_context) (&self_plaintext->format_context);
                  top_format_context->paragraph_count = 0;
        /* no argument can only happen with bogus command without braces */
                  if (caption_element->e.c->contents.number)
                    convert_to_plaintext_internal (self,
                                   caption_element->e.c->contents.list[0]);
                }
            }
        }
      else if (cmd == CM_quotation || cmd == CM_smallquotation)
        {
          DOCUMENT_CONTEXT *document_context
           = top_(document_context) (&self_plaintext->document_context);
          CONST_ELEMENT_LIST *authors = top_(quotations_authors) (
            &document_context->quotations_authors);
          size_t i;

          for (i = 0; i < authors->number; i++)
            {
              const ELEMENT *author = authors->list[i];
              ELEMENT *line_arg = author->e.c->contents.list[0];
              if (line_arg->e.c->contents.number)
                {
                  NAMED_STRING_ELEMENT_LIST *replaced_substrings
                    = new_named_string_element_list ();
                  ELEMENT *author_copy = copy_element_tree (line_arg, 0);

                  add_element_to_named_string_element_list (
                                   replaced_substrings, "author",
                                   author_copy);

                  ELEMENT *author_tree
                      = cdt_tree ("@center --- @emph{{author}}",
                                  self, replaced_substrings, 0);

                  convert_to_plaintext_internal (self, author_tree);

                  destroy_element_and_children (author_tree);
                  destroy_named_string_element_list (replaced_substrings);
                }
            }
          free (authors->list);

          pop_(quotations_authors) (&document_context->quotations_authors);
        }
      else if (cmd == CM_multitable)
        {
          int i;
          DOCUMENT_CONTEXT *top_document_context
            = top_(document_context) (&self_plaintext->document_context);
          top_document_context->in_multitable--;

          FORMAT_CONTEXT *top_format
            = top_(format_context) (&self_plaintext->format_context);
          free (top_format->columns_size);
          PENDING_TEXT_LIST_LINES *cell_lines = top_format->row_cell_lines;
          for (i = 0; i < top_format->columns_size_nr; i++)
            free (cell_lines[i].list);
          free (cell_lines);
        }
      else if (command_data[cmd].flags & CF_root
               && command_data[cmd].flags & CF_sectioning_heading
               && cmd != CM_part
               && self_plaintext->current_node)
        {
          const ELEMENT *node = self_plaintext->current_node;
          /* add menu if missing */
          const ELEMENT *arguments_line = node->e.c->contents.list[0];
          int automatic_directions
            = (arguments_line->e.c->contents.number <= 1);
          int status;
          size_t node_number = lookup_extra_integer (node,
                                        AI_key_node_number, &status);
          const char *identifier
                = lookup_extra_string (node, AI_key_identifier);
          if (node_number && automatic_directions
              && ! is_c_hashmap_registered (&self_plaintext->seenmenus,
                                            identifier))
            {
              const NODE_RELATIONS_LIST *nodes_list
                    = &self->document->nodes_list;
              const NODE_RELATIONS *node_relations
                 = nodes_list->list[node_number -1];

              ELEMENT *menu_node
                = new_complete_menu_master_menu (&self->error_messages,
                                      self->conf,
                                      self->current_lang_translations,
                                      &self->document->identifiers_target,
                                      nodes_list, node_relations, 0);

              c_hashmap_register (&self_plaintext->seenmenus,
                                  identifier, 0);
              if (menu_node)
                {
                  convert_to_plaintext_internal (self, menu_node);
                  add_newline_if_needed (self);

                  destroy_element_and_children (menu_node);
                }
            }

        }

      /* close the contexts and register the cells */
      if (plaintext_commands_data[cmd].flags & PF_preformatted_context
          || cmd == CM_float)
        {
          enum command_id popped_cmd
            = pop_context (&self_plaintext->context);

          if (popped_cmd != CM_float
              && !(plaintext_commands_data[popped_cmd].flags
                                        & PF_preformatted_context))
            {
              char *msg;
              xasprintf (&msg, "Not a preformatted context (%d): %s",
                         popped_cmd, builtin_command_name (popped_cmd));
              bug (msg);
              free (msg);
            }
        }
      else if (plaintext_commands_data[cmd].flags & PF_flush)
        {
          enum command_id popped_cmd
            = pop_context (&self_plaintext->context);
          if (!(plaintext_commands_data[popped_cmd].flags & PF_flush))
            abort ();
        }

      if (plaintext_commands_data[cmd].flags & PF_format_context)
        pop_(format_context) (&self_plaintext->format_context);
      else if (cell)
        {
          COUNT_CONTEXT *count_context
            = top_(count_context) (&self_plaintext->count_context);
          COUNT_CONTEXT *parent_count_context
            = &self_plaintext->count_context.list[
               self_plaintext->count_context.number -2];
          pop_(format_context) (&self_plaintext->format_context);
          FORMAT_CONTEXT *top_format
            = top_(format_context) (&self_plaintext->format_context);

          PENDING_TEXT_LIST_LINES *cell_lines = top_format->row_cell_lines;
          collect_pending_texts_lines (&cell_lines[top_format->cell_idx],
                                       &count_context->pending_text);

          top_format->cell_idx++;

          update_locations_counts (self, parent_count_context, count_context);

          pop_count_context (&self_plaintext->count_context);
          pop_(text_element_context) (&self_plaintext->text_element_context);
        }

      if (self_plaintext->commands_data[cmd].flags
                                      & PF_advance_paragraph_count)
        {
          FORMAT_CONTEXT *top_format_context
            = top_(format_context) (&self_plaintext->format_context);
          top_format_context->paragraph_count++;
        }
    }

  return;
}

void
plaintext_free_converter (CONVERTER *self)
{
  size_t i;
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;

  /* happens if created from XS */
  if (!self_plaintext)
    return;

  free (self_plaintext->enabled_encoding);
  free (self_plaintext->output_filename);

  free (self_plaintext->pending_footnotes.list);

  if (self_plaintext->count_context.number > 0)
    {
      fprintf (stderr,
               "plaintext_free_converter: remaining count contexts: %zu\n",
               self_plaintext->count_context.number);
      abort ();
    }

  for (i = 0; i < self_plaintext->count_context.space; i++)
    {
      size_t j;
      COUNT_CONTEXT *ctxt = &self_plaintext->count_context.list[i];
      PENDING_TEXT_LIST *pending_texts = &ctxt->pending_text;
      for (j = 0; j < pending_texts->space; j++)
        {
          PENDING_TEXT *pending_text = &pending_texts->list[j];
          TEXT *t = &pending_text->text;
          /* debugging */
          if (pending_text->type == PLT_anchor)
            {
              char *texi = target_element_to_texi_label (pending_text->l.anchor);
              fprintf (stderr, "ANOT RESET: %zu %zu [%s]\n", i, j, texi);
              free (texi);
            }
          else if (pending_text->type == PLT_quoted_image)
            {
              fprintf (stderr, "INOT RESET: %zu %zu {%s}\n", i, j,
                                       pending_text->l.image_string.text);
              free (pending_text->l.image_string.text);
            }
          else if (t->end > 0)
            fprintf (stderr, "TNOT RESET: %zu %zu '%s'\n", i, j, t->text);
          /* end debugging */
          free (t->text);
        }
      free (pending_texts->list);

      /* this should only happen for the main document count context
         (bottom) as locations inside should have been transferred */
      for (j = 0; j < ctxt->index_entry_locations.number; j++)
        free (ctxt->index_entry_locations.list[j]);
      free (ctxt->index_entry_locations.list);
    }
  free (self_plaintext->count_context.list);

  free (self_plaintext->formatters.list);
  free (self_plaintext->format_context.list);
  free (self_plaintext->context.list);
  free (self_plaintext->document_context.list);
  free (self_plaintext->text_element_context.list);

  free (self_plaintext->node_names_cache);
  free (self_plaintext->added_element.list);

  free (self_plaintext);
  self->plaintext_converter = 0;
}

void
plaintext_converter_initialize (CONVERTER *self)
{
  size_t i;
  PLAINTEXT_CONVERTER_STATE *self_plaintext = (PLAINTEXT_CONVERTER_STATE *)
                                malloc (sizeof (PLAINTEXT_CONVERTER_STATE));
  self->plaintext_converter = self_plaintext;

  memset (self_plaintext, 0, sizeof (*self_plaintext));

  if (self->format == COF_info)
    self_plaintext->warn_strong_note = 1;

  memcpy (self_plaintext->commands_data, plaintext_commands_data,
          BUILTIN_CMD_NUMBER * sizeof (PLAINTEXT_COMMAND_STRUCT));

  for (i = 0; i < format_raw_cmd.number; i++)
    {
      enum command_id cmd = format_raw_cmd.list[i];
      const char *format = builtin_command_name (cmd);
      if (!format_expanded_p (self->expanded_formats, format))
        self_plaintext->commands_data[cmd].flags |= PF_ignored;
    }

  if (self->conf->ASCII_PUNCTUATION.o.integer > 0)
    {
      option_set_conf (&self->conf->ASCII_DASHES_AND_QUOTES, 1, 0);
      option_set_conf (&self->conf->ASCII_GLYPH, 1, 0);
      option_set_conf (&self->conf->OPEN_QUOTE_SYMBOL, 0, "'");
      option_set_conf (&self->conf->CLOSE_QUOTE_SYMBOL, 0, "'");
      option_set_conf (&self->conf->OPEN_DOUBLE_QUOTE_SYMBOL, 0, "\"");
      option_set_conf (&self->conf->CLOSE_DOUBLE_QUOTE_SYMBOL, 0, "\"");
    }

  if (self->conf->ASCII_DASHES_AND_QUOTES.o.integer == -1)
    option_force_conf (&self->conf->ASCII_DASHES_AND_QUOTES, 0, 0);

  if (self->conf->FILLCOLUMN.o.integer == -1)
    {
      int fillcolumn_default = txi_base_options.FILLCOLUMN.o.integer;
      option_force_conf (&self->conf->FILLCOLUMN,
                         fillcolumn_default, 0);
    }

  if (self->conf->INFO_SPECIAL_CHARS_QUOTE.o.integer > 0)
    {
      if (self->conf->INFO_SPECIAL_CHARS_WARNING.o.integer == -1)
        option_set_conf (&self->conf->INFO_SPECIAL_CHARS_WARNING, 0, 0);
    }
  else
    {
      if (self->conf->INFO_SPECIAL_CHARS_WARNING.o.integer == -1)
        option_set_conf (&self->conf->INFO_SPECIAL_CHARS_WARNING, 1, 0);
    }

  if (self->conf->INFO_SPECIAL_CHARS_WARNING.o.integer == -1)
    option_force_conf (&self->conf->INFO_SPECIAL_CHARS_WARNING, 0, 0);
}

CONVERTER_INITIALIZATION_INFO *
plaintext_converter_defaults (enum converter_format format,
                                 const CONVERTER_INITIALIZATION_INFO *conf)
{
  CONVERTER_INITIALIZATION_INFO *format_defaults
    = new_converter_initialization_info ();

  add_plaintext_regular_options_defaults (&format_defaults->conf);

  return format_defaults;
}

static void
adjust_final_locations (CONVERTER *self)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *count_context
    = top_(count_context) (&self_plaintext->count_context);

  if (count_context->index_entry_locations.number > 0)
    {
      size_t i = count_context->index_entry_locations.number -1;
      int final_lines = count_context->lines;
      while (1)
        {
          int *index_entry_location
            = count_context->index_entry_locations.list[i];
          if (*index_entry_location == final_lines)
            {
              (*index_entry_location)--;
              if (i == 0)
                break;
              i--;
            }
          else
            break;
        }
    }
}

void
plaintext_convert_output_unit (CONVERTER *self, const OUTPUT_UNIT *output_unit)
{
  if (output_unit->unit_contents.number > 0)
    {
      size_t content_idx;
      for (content_idx = 0; content_idx < output_unit->unit_contents.number;
           content_idx++)
        {
          const ELEMENT *content = output_unit->unit_contents.list[content_idx];
          convert_to_plaintext_internal (self, content);
        }
    }

  plaintext_process_footnotes (self, output_unit);

  adjust_final_locations (self);
}

TEXT
plaintext_output (CONVERTER *self, DOCUMENT *document)
{
  size_t i;
  int status = 1;
  char *paths[5];
  char *dir_encoding;
  const char *output_file;
  const char *destination_directory;
  const char *output_filename;
  const char *document_name;
  FILE *file_fh = 0;
  char *encoded_destination_directory;
  int succeeded;
  TEXT result;
  OUTPUT_UNIT_LIST output_units;
  const NODE_RELATIONS_LIST *nodes_list;
  TEXT output_unit_result;

  plaintext_conversion_initialization (self, document);

  if (self->conf->OUTFILE.o.string
      && self->conf->SPLIT.o.string && strcmp (self->conf->SPLIT.o.string, ""))
    {
      int i;
      int need_unsplit = 0;
      const char *outfile = self->conf->OUTFILE.o.string;
      if (!strlen(outfile) || !strcmp (outfile, "-"))
        need_unsplit = 1;
      else
        {
          for (i = 0; null_device_names[i]; i++)
            {
              if (!strcmp (null_device_names[i], outfile))
                {
                  need_unsplit = 1;
                  break;
                }
            }
        }
      if (need_unsplit)
        {
          message_list_document_warn (&self->error_messages, self->conf,
                        0, "%s: output incompatible with split",
                        outfile);

          option_force_conf (&self->conf->SPLIT, 0, "");
        }
    }

  if (self->conf->SPLIT.o.string
      && strcmp (self->conf->SPLIT.o.string, ""))
    option_set_conf (&self->conf->NODE_FILES, 1, 0);

  text_init (&result);
  text_append (&result, "");

  determine_files_and_directory (self,
                    self->conf->TEXINFO_OUTPUT_FORMAT.o.string, paths);

  output_file = paths[0];
  destination_directory = paths[1];
  output_filename = paths[2];
  document_name = paths[3];

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

  if (!succeeded)
    {
      status = 0;
      goto finalization;
    }

  memset (&output_units, 0, sizeof (OUTPUT_UNIT_LIST));

  if (self->conf->USE_NODES.o.integer > 0)
    split_by_node (document, &output_units);
  else
    split_by_section (document, &output_units);

  nodes_list = &self->document->nodes_list;
 /* Do not call _cache_node_names as only the node names used in index
    formatting are needed, therefore we may generate names that are
    not used if we call the function.

  plaintext_cache_node_names (self, nodes_list);
  */

  split_pages (&output_units, nodes_list, self->conf->SPLIT.o.string);

  /* determine file names associated with the different pages */
  if (strcmp (output_file, ""))
    {
      set_output_units_files (self, &output_units, output_file,
                              destination_directory, output_filename,
                              document_name);
      plaintext_setup_output_encoding (self);
    }

  /* Now do the output */

  if (!output_units.list[0]->unit_filename)
    {
      char *outfile_name = 0;
      char *encoded_outfile_name = 0;
      /* no page */
      if (strcmp (output_file, ""))
        {
          char *path_encoding;
          int overwritten_file;
          char *open_error_message;

          if (self->conf->SPLIT.o.string
              && strcmp (self->conf->SPLIT.o.string, ""))
            {
              TEXT outfile_name_text;
              text_init (&outfile_name_text);
              char *top_node_filename_str
                = top_node_filename (self, document_name);
              if (destination_directory && strcmp (destination_directory, ""))
                {
                  text_append (&outfile_name_text, destination_directory);
                  text_append_n (&outfile_name_text, "/", 1);
                }
              text_append (&outfile_name_text, top_node_filename_str);
              free (top_node_filename_str);
              outfile_name = outfile_name_text.text;
            }
          else
            outfile_name = strdup (output_file);

          if (self->conf->DEBUG.o.integer > 0)
            fprintf (stderr, "DO No pages, output in %s\n", outfile_name);

          encoded_outfile_name
            = converter_encoded_output_file_name (self->conf,
                                       &self->document->global_info,
                                  (char *)outfile_name, &path_encoding, 0);

          /* overwritten_file being set cannot happen */
          file_fh = output_files_open_out (&self->output_files_information,
                                   encoded_outfile_name, &open_error_message,
                                   &overwritten_file, 0);
          free (path_encoding);

          if (!file_fh)
            {
              message_list_document_error (&self->error_messages,
                             self->conf, 0,
                             "could not open %s for writing: %s",
                             outfile_name, open_error_message);
              free (open_error_message);
              free (encoded_outfile_name);
              free (outfile_name);

              status = 0;
              goto finalization;
            }
        }
      else if (self->conf->DEBUG.o.integer > 0)
        fprintf (stderr, "DO No pages, string output\n");

      for (i = 0; i < output_units.number; i++)
        {
          text_reset (&output_unit_result);
          OUTPUT_UNIT *output_unit = output_units.list[i];
          plaintext_convert_output_unit (self, output_unit);
          stream_final_result (self, &output_unit_result);
          write_or_return (0, encoded_outfile_name,
                           file_fh, &result, output_unit_result.text,
                           output_unit_result.end);
        }
  /* Do not close STDOUT now such that the file descriptor is not reused
     by open, which uses the lowest-numbered file descriptor not open,
     for another filehandle.  Closing STDOUT is handled by the caller. */
      if (file_fh && !strcmp (outfile_name, "-"))
        {
          output_files_register_closed
                         (&self->output_files_information,
                          encoded_outfile_name);
          if (fclose (file_fh))
            {
               message_list_document_error (
                 &self->error_messages, self->conf, 0,
                 "error on closing %s: %s",
                 outfile_name, strerror (errno));
            }
        }

      free (output_unit_result.text);
      free (encoded_outfile_name);
      free (outfile_name);
    }
  else
    { /* output with pages */
      if (self->conf->DEBUG.o.integer > 0)
        fprintf (stderr, "DO Elements with filenames\n");

      for (i = 0; i < output_units.number; i++)
        {
          OUTPUT_UNIT *output_unit = output_units.list[i];
          size_t file_index
            = self->output_unit_file_indices[output_unit->index];
          FILE_NAME_PATH_COUNTER *unit_file
            = &self->output_unit_files.list[file_index];

          plaintext_convert_output_unit (self, output_unit);

          unit_file->counter--;

          if (!unit_file->first_unit)
            {
              unit_file->first_unit = output_unit;
              text_init (&unit_file->body);
            }

          stream_final_result (self, &unit_file->body);

          /* TODO in Perl, file is opened when first encountered
             not when counter is 0.  Probably best to align Perl
             with this code */
          if (unit_file->counter == 0)
            {
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
              FILE *file_fh
                 = output_files_open_out (&self->output_files_information,
                               encoded_out_filepath, &open_error_message,
                               &overwritten_file, 0);
              free (path_encoding);
              if (!file_fh)
                {
                  message_list_document_error (
                             &self->error_messages, self->conf, 0,
                             "could not open %s for writing: %s",
                             out_filepath, open_error_message);
                  free (open_error_message);
                  free (encoded_out_filepath);
                  status = 0;
                  goto finalization;
                }

              if (unit_file->body.end)
                {
                  size_t write_len;
                  TEXT *text = &unit_file->body;
                  size_t res_len = text->end;

                  write_len = fwrite (text->text, sizeof (char),
                                      res_len, file_fh);
                  if (write_len != res_len)
                    { /* register error message instead? */
                      fprintf (stderr, "ERROR: write to %s failed (%zu/%zu)\n",
                               encoded_out_filepath, write_len, res_len);
                      free (encoded_out_filepath);
                      status = 0;
                      goto finalization;
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
                      message_list_document_error (&self->error_messages,
                             self->conf, 0,
                             "error on closing %s: %s",
                             out_filepath, strerror (errno));
                      free (encoded_out_filepath);
                      status = 0;
                      goto finalization;
                    }
                }
              free (encoded_out_filepath);
            }
        }
    }


 finalization:

  free_output_unit_list (&output_units);

  plaintext_conversion_finalization (self);

  for (i = 0; i < 5; i++)
    {
      free (paths[i]);
    }

  if (!status)
    text_destroy (&result);

  return result;
}

/* ALTIMP: Texinfo:Convert::Plaintext::convert */
/* never called from C, called from XS for t/?*.t tests */
TEXT
plaintext_convert (CONVERTER *self, DOCUMENT *document)
{
  OUTPUT_UNIT_LIST output_units;
  size_t i;
  TEXT result;

  plaintext_conversion_initialization (self, document);

  memset (&output_units, 0, sizeof (OUTPUT_UNIT_LIST));

  split_by_node (document, &output_units);

  text_init (&result);
  text_append (&result, "");
  for (i = 0; i < output_units.number; i++)
    {
      const OUTPUT_UNIT *output_unit = output_units.list[i];
      plaintext_convert_output_unit (self, output_unit);
      stream_final_result (self, &result);
    }

  free_output_unit_list (&output_units);

  plaintext_conversion_finalization (self);

  return result;
}

/* Never called */
/* Return value to be freed by caller. */
TEXT
plaintext_convert_tree (CONVERTER *self, const ELEMENT *tree)
{
  PLAINTEXT_CONVERTER_STATE *self_plaintext = self->plaintext_converter;
  COUNT_CONTEXT *parent_counts
    = top_(count_context) (&self_plaintext->count_context);
  COUNT_CONTEXT *counts;
  PENDING_TEXT_LIST pending_texts;
  TEXT result;

  push_count_context (&self_plaintext->count_context);

  convert_to_plaintext_internal (self, tree);

  counts = top_(count_context) (&self_plaintext->count_context);
  pending_texts = counts->pending_text;
  memset (&counts->pending_text, 0, sizeof (PENDING_TEXT_LIST));

  update_locations_counts (self, parent_counts, counts);

  pop_count_context (&self_plaintext->count_context);

  merge_pending_texts (&parent_counts->pending_text, &pending_texts);

  stream_final_result (self, &result);

  return result;
}
