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

#include "text.h"
#include "element_types.h"
#include "source_mark_types.h"
#include "tree_types.h"
#include "global_commands_types.h"
#include "types_data.h"
#include "list_macros.h"
/* isascii_alnum fatal */
#include "base_utils.h"
#include "tree.h"
#include "extra.h"
#include "builtin_commands.h"
#include "hashmap.h"
/* for whitespace_chars, read_flag_len, item_line_parent
   parse_line_directive, count_multibyte */
#include "utils.h"
#include "command_stack.h"
/* for float_list_to_listoffloats_list */
#include "floats.h"
/* for relocate_source_marks */
#include "manipulate_tree.h"
/* for global_parser_conf */
#include "parser_conf.h"
#include "counter.h"
/* for nesting_context */
#include "context_stack.h"
#include "convert_to_texinfo.h"
#include "commands.h"
#include "debug_parser.h"
#include "errors_parser.h"
#include "source_marks.h"
#include "input.h"
/* for set_labels_identifiers_target */
#include "labels.h"
/* MACRO lookup_macro new_macro handle_macro fetch_value */
#include "macro.h"
/* for resolve_indices_merged_in */
#include "indices.h"
/* handle_other_command handle_line_command
   handle_block_command handle_brace_command */
#include "handle_commands.h"
#include "parser.h"



const char *linecommand_expansion_delimiters = " \t\v\f" "{}@";

DOCUMENT *parsed_document = 0;

FLOAT_RECORD_LIST parser_float_records;

C_HASHMAP warned_deprecated_commands;

/* Check if the contents of S2 appear at S1). */
int
looking_at (const char *s1, const char *s2)
{
  return !strncmp (s1, s2, strlen (s2));
}

/* Look for a sequence of alphanumeric characters or hyphens, where the
   first isn't a hyphen.  This is the format of (non-single-character) Texinfo
   commands, but is also used elsewhere.  Return value to be freed by caller.
   *PTR is advanced past the read name.  Return 0 if name is invalid. */
char *
read_command_name (const char **ptr)
{
  const char *p = *ptr, *q;
  char *ret = 0;

  q = p;
  if (!isascii_alnum (*q))
    return 0; /* Invalid. */

  while (isascii_alnum (*q) || *q == '-' || *q == '_')
    q++;
  ret = strndup (p, q - p);
  p = q;

  *ptr = p;
  return ret;
}

/* look for a command name.  Return value to be freed by caller.
   *PTR is advanced past the read name. *SINGLE_CHAR is set to 1
   if the command is a single character command.
   Return 0 if name is invalid or the empty string */
char *
parse_command_name (const char **ptr, int *single_char)
{
  const char *p = *ptr;
  char *ret = 0;
  *single_char = 0;

  if (*p
      /* List of single character Texinfo commands. */
      && strchr ("([\"'~@&}{,.!?"
                 " \f\n\r\t"
                 "*-^`=:|/\\",
                 *p))
    {
      char single_char_str[2];
      single_char_str[0] = *p++;
      single_char_str[1] = '\0';
      ret = strdup (single_char_str);
      *single_char = 1;
      *ptr = p;
    }
  else
    {
      ret = read_command_name (ptr);
    }
  return ret;
}

/* the pointer returned is past @c/@comment, whether there is indeed
   a comment or not.  If there is a comment, *has_comment is set to 1 */
const char *
read_comment (const char *line, int *has_comment)
{
  const char *p = line;
  int len = strlen (line);

  *has_comment = 0;

  if (len >= 2 && memcmp (p, "@c", 2) == 0)
    {
      p += 2;
      if (len >= 8 && memcmp (p, "omment", 6) == 0)
        p += 6;

      /* TeX control sequence name ends at an escape character or
         whitespace. */
      if (*p && *p != '@' && !strchr (whitespace_chars, *p))
        return p; /* @c or @comment not terminated. */
    }
  else
    return p; /* Trailing characters on line. */
  *has_comment = 1;
  return p;
}

/* Return 1 if the element expansion is all whitespace */
int
check_space_element (ELEMENT *e)
{
  if (type_data[e->type].flags & TF_text)
    {
      if (e->e.text->end == 0
          || !*(e->e.text->text
                      + strspn (e->e.text->text, whitespace_chars)))
        return 1;
      else
        return 0;
    }
  else if (!(
          e->e.c->cmd == CM_SPACE
        || e->e.c->cmd == CM_TAB
        || e->e.c->cmd == CM_NEWLINE
        || e->e.c->cmd == CM_c
        || e->e.c->cmd == CM_comment
        || e->e.c->cmd == CM_COLON
     ))
    {
      return 0;
    }
  return 1;
}


/*
   Convert the contents of E to plain text.  Suitable for specifying a file
   name containing an at sign or braces, but no other commands nor element
   types.  Set *SUPERFLUOUS_ARG if the E contains other commands or element
   types. */
char *
text_contents_to_plain_text (ELEMENT *e, int *superfluous_arg)
{
#define ADD(x,n) text_append_n (&result, x, n)
  TEXT result;
  size_t i;

  text_init (&result);
  text_append (&result, "");
  for (i = 0; i < e->e.c->contents.number; i++)
    {
      const ELEMENT *e1 = e->e.c->contents.list[i];
      if (type_data[e1->type].flags & TF_text)
        {
          if (e1->type == ET_spaces_before_argument
              || e1->type == ET_spaces_after_argument)
            continue;
          if (e1->e.text->end > 0)
            ADD(e1->e.text->text, e1->e.text->end);
        }
      else if (e1->e.c->cmd == CM_AT_SIGN
               || e1->e.c->cmd == CM_atchar)
        ADD("@", 1);
      else if (e1->e.c->cmd == CM_OPEN_BRACE
               || e1->e.c->cmd == CM_lbracechar)
        ADD("{", 1);
      else if (e1->e.c->cmd == CM_CLOSE_BRACE
               || e1->e.c->cmd == CM_rbracechar)
        ADD("}", 1);
      else if (e1->e.c->cmd == CM_comment
               || e1->e.c->cmd == CM_c)
       {}
      else
        *superfluous_arg = 1;
    }
  return result.text;
}
#undef ADD


/* Current node, section and part. */

NODE_RELATIONS *current_node = 0;
const SECTION_RELATIONS *current_section = 0;
SECTION_RELATIONS *current_part = 0;


/* Conditional stack. */

CONDITIONAL_ITEM_STACK conditional_stack;

def_list_fns(CONDITIONAL_ITEM_STACK, conditional_stack, CONDITIONAL_ITEM, 5);
def_stack_fns(CONDITIONAL_ITEM_STACK, conditional_stack, CONDITIONAL_ITEM);

void
push_conditional_stack (enum command_id cond, SOURCE_MARK *source_mark)
{
  CONDITIONAL_ITEM conditional = {cond, source_mark};
  add_(conditional_stack) (&conditional_stack, conditional);
}

CONDITIONAL_ITEM *
pop_conditional_stack (void)
{
  CONDITIONAL_ITEM *result = top_(conditional_stack) (&conditional_stack);
  pop_(conditional_stack) (&conditional_stack);
  return result;
}


/* Raw block commands stack nested in a first raw block command. */

static COMMAND_STACK macro_block_stack;


/* Counters */
COUNTER count_remaining_args;
COUNTER count_items;
COUNTER count_cells;

void
reset_parser_counters (void)
{
  counter_reset (&count_remaining_args, "count_remaining_args");
  counter_reset (&count_items, "count_items");
  counter_reset (&count_cells, "count_cells");
}


char *global_documentlanguage = 0;
char *global_documentscript = 0;

enum kbd_enum global_kbdinputstyle = kbd_distinct;

/* Record the information from a command of global effect.  Use the CMD_IN
   for the command id if given, otherwise use the current element command id.
 */
int
register_global_command (ELEMENT *current, enum command_id cmd_in)
{
  enum command_id cmd;
  GLOBAL_COMMANDS *global_commands = &parsed_document->global_commands;
  if (cmd_in != CM_NONE)
    cmd = cmd_in;
  else
    cmd = current->e.c->cmd;

  if (cmd == CM_summarycontents)
    cmd = CM_shortcontents;

  if (parsed_command_data(cmd).flags & CF_global)
    {
      if (!current->e.c->source_info.line_nr)
        current->e.c->source_info = current_source_info;
      switch (cmd)
        {
#define GLOBAL_CASE(cmx) \
        case CM_##cmx:   \
          add_to_element_list (&global_commands->cmx, current); \
          add_extra_integer (current, AI_key_global_command_number, \
                             global_commands->cmx.number); \
          break

        case CM_footnote:
          add_to_element_list (&global_commands->footnotes, current);
          add_extra_integer (current, AI_key_global_command_number,
                             global_commands->footnotes.number);
          break;

        case CM_float:
          add_to_element_list (&global_commands->floats, current);
          add_extra_integer (current, AI_key_global_command_number,
                             global_commands->floats.number);
          break;

#include "global_multi_commands_case.c"

#undef GLOBAL_CASE
        default:
          /* do nothing; just silence -Wswitch about lots of un-covered cases */
          break;
        }

      return 1;
    }
  else if ((parsed_command_data(cmd).flags & CF_global_unique))
    {
      ELEMENT **where = 0;

      if (!current->e.c->source_info.line_nr)
        current->e.c->source_info = current_source_info;
      switch (cmd)
        {
        case CM_setfilename:
          /* Check if we are inside an @include, and if so, do nothing. */
          if (top_file_index () > 0)
            break;
          where = &global_commands->setfilename;
          break;

#define GLOBAL_UNIQUE_CASE(cmd) \
        case CM_##cmd: \
          where = &global_commands->cmd; \
          break

#include "global_unique_commands_case.c"

#undef GLOBAL_UNIQUE_CASE
        default:
          /* do nothing; just silence -Wswitch about lots of un-covered cases */
          break;
        }
      if (where)
        {
          if (*where)
            {
              if (current->e.c->cmd != cmd)
                line_warn ("multiple %s (@%s)", command_name(cmd),
                           command_name(current->e.c->cmd));
              else
                line_warn ("multiple @%s", command_name(cmd));
            }
          else
            *where = current;
        }
      return 1;
    }

  return 0;
}

/* setup a Texinfo tree with document_root as root and before_node_section
   as first content.  Used for the trees, except for those obtained by
   parse_string. */
ELEMENT *
setup_document_root_and_before_node_section (void)
{
  ELEMENT *before_node_section = new_element (ET_before_node_section);
  ELEMENT *document_root = new_element (ET_document_root);
  add_to_element_contents (document_root, before_node_section);
  return before_node_section;
}

/* Put everything before @setfilename in a special type and separate
   a preamble for informative commands */
static void
rearrange_tree_beginning (ELEMENT *before_node_section,
                          DOCUMENT *document)
{
  ELEMENT *informational_preamble;
  size_t first_idx;

  /* Put everything before @setfilename in a special type.  This allows to
     ignore everything before @setfilename. */
  if (document->global_commands.setfilename
      && before_node_section->e.c->contents.number > 0)
    {
      /* setfilename index, also size of the new element (if found) */
      size_t i = 0;
      for (; i < before_node_section->e.c->contents.number; i++)
        {
          const ELEMENT *content = before_node_section->e.c->contents.list[i];
          if (!(type_data[content->type].flags & TF_text)
              && content->e.c->cmd == CM_setfilename)
            break;
        }
      /* setfilename itself remains in the same element. */
      if (i > 0 && i < before_node_section->e.c->contents.number)
        {
           size_t j;
           ELEMENT *before_setfilename
             = new_element (ET_preamble_before_setfilename);

           insert_slice_into_contents (before_setfilename, 0,
                                       before_node_section, 0, i);
           for (j = 0; j < i; j++)
             {
               ELEMENT *content = before_setfilename->e.c->contents.list[j];
               if (!(type_data[content->type].flags & TF_text)
                   && content->e.c->parent)
                 content->e.c->parent = before_setfilename;
             }
           remove_slice_from_contents (before_node_section, 0, i);

           insert_into_contents (before_node_section, before_setfilename, 0);
        }
    }

  /* add a preamble for informational commands */
  informational_preamble = new_element (ET_preamble_before_content);
  /* index of the first element of the preamble */
  first_idx = 0;
  if (before_node_section->e.c->contents.number > 0)
    {
      /* index following the last element index of the preamble */
      size_t i = 0;
      for (; i < before_node_section->e.c->contents.number; i++)
        {
          const ELEMENT *content = before_node_section->e.c->contents.list[i];
          if (content->type == ET_preamble_before_beginning
              || content->type == ET_preamble_before_setfilename)
            first_idx = i+1;
          else if (content->type == ET_paragraph
                   || (!(type_data[content->type].flags & TF_text)
                       && !(parsed_command_data(content->e.c->cmd).flags
                                                      & CF_preamble)))
            break;
        }
      if (first_idx < before_node_section->e.c->contents.number
          && i > first_idx)
        {
           size_t j;
           insert_slice_into_contents (informational_preamble, 0,
                                       before_node_section, first_idx, i);
           for (j = 0; j < i - first_idx; j++)
             {
               ELEMENT *content = informational_preamble->e.c->contents.list[j];
               if (!(type_data[content->type].flags & TF_text)
                   && content->e.c->parent)
                 content->e.c->parent = informational_preamble;
             }
           remove_slice_from_contents (before_node_section, first_idx, i);
        }
    }
  insert_into_contents (before_node_section, informational_preamble,
                        first_idx);
}



def_list_fns(PREAMBLE_LANG_CMD_LIST, preamble_lang, PREAMBLE_LANG_CMD, 3);

static void
add_preamble_lang_cmd (PREAMBLE_LANG_CMD_LIST *preamble_lang,
                       enum command_id cmd, const char *lang_string,
                       STRING_LIST *lang_variants)
{
  PREAMBLE_LANG_CMD preamble_lang_cmd;

  preamble_lang_cmd.cmd = cmd;

  if (lang_string)
    preamble_lang_cmd.plc.lang_string = strdup (lang_string);
  else
    preamble_lang_cmd.plc.lang_variants = lang_variants;

  add_(preamble_lang) (preamble_lang, preamble_lang_cmd);
}

/* ALTIMPL perl/Texinfo/ParserNonXS.pm get_parser_info */
/* Less to do here than in Perl, as the global_commands information is always
   available in C, therefore document.c set_document_options sets the
   options from global_commands, and does not need to get them from
   global_info, therefore they are not in global_info fields.
   Also, some global info is set during parsing.  */
/* It could also have been possible to call dynamically such code
   where preamble_lang_cmd is used, but we do it here to be more
   like Perl, and also because this intermediary structure is easier to
   use than the tree for language information in preamble.
 */
static void
get_parser_info (DOCUMENT *document)
{
  const GLOBAL_COMMANDS *global_commands = &document->global_commands;
  PREAMBLE_LANG_CMD_LIST *preamble_lang
    = &document->global_info.preamble_lang_cmd;
  if (global_commands->language_commands.number > 0)
    {
      size_t i;

      for (i = 0; i < global_commands->language_commands.number; i++)
        {
          const ELEMENT *element = global_commands->language_commands.list[i];

          if (!in_preamble (element))
            break;

          if (element->e.c->cmd == CM_documentlanguagevariant)
            {
              STRING_LIST *language_variants
                = documentlanguagevariant_variants (element);
              add_preamble_lang_cmd (preamble_lang, element->e.c->cmd,
                                     0, language_variants);
            }
          else
            {
              const char *text_arg
                = lookup_extra_string (element, AI_key_text_arg);
              if (text_arg)
                {
                  add_preamble_lang_cmd (preamble_lang, element->e.c->cmd,
                                         text_arg, 0);
                }
            }
        }
    }
}

void
parse_texi_document (void)
{
  DOCUMENT *document = parsed_document;
  char *line = 0;
  const char *linep;

  ELEMENT *before_node_section = setup_document_root_and_before_node_section ();
  ELEMENT *preamble_before_beginning = 0;

  /* Put all the empty lines up to a line starting "\input" inside a
     "preamble_before_beginning" element. */
  while (1)
    {
      ELEMENT *l;

      free (line);
      line = next_text (0);
      if (!line)
        break;

      linep = line;
      linep += strspn (linep, whitespace_chars);
      if (*linep && !looking_at (linep, "\\input"))
        {
          /* This line is not part of the preamble_before_beginning.
             Push back into input stream. */
          input_pushback (line);
          break;
        }

      if (!preamble_before_beginning)
        preamble_before_beginning = new_element (ET_preamble_before_beginning);

      l = new_text_element (ET_text_before_beginning);
      text_append (l->e.text, line);
      add_to_contents_as_array (preamble_before_beginning, l);
    }

  if (preamble_before_beginning)
    add_to_element_contents (before_node_section, preamble_before_beginning);

  parse_texi (before_node_section);

  /* At this point the parsing is done, the document is not parsed_document
     anymore and the diverse document structure fields should not change
     anymore.
     The document structure lists use more memory than needed when
     space > number.  Here would be a good place to realloc such that
     space == number.  The gain is likely to be pretty small, though, so
     we leave the data as is.
   */

  rearrange_tree_beginning (before_node_section, document);
  get_parser_info (document);
}


/* If in a context where paragraphs are to be started, return 1,
   else return 0 */
static int
in_begin_paragraph (const ELEMENT *current)
{
  /* we want to avoid
     brace_container, brace_arg, root_line (ct_line),
     paragraphs (ct_paragraph), line_arg (ct_line, ct_def), balanced_braces
     (only in ct_math, ct_rawpreformatted, ct_inlineraw), block_line_arg
     (ct_line, ct_def), preformatted (ct_preformatted).
   */
  return (begin_paragraph_context (current_context ())
     /* after checking begin_paragraph_context, it remains to check if not
        in brace no_paragraph command that are not context commands,
        outside of paragraph.  Including in commands nested in those commands.
        For example, in @anchor and also in @samp in @anchor */
          && current->type != ET_brace_arg
          && current->type != ET_brace_container);
}

/* Start a new paragraph and return it */
static ELEMENT *
begin_paragraph (ELEMENT *current)
{
  ELEMENT *e;
  enum command_id indent = 0;
  size_t j;

  /* Check if an @indent precedes the paragraph (to record it
     in the 'extra' key). */
  if (current->e.c->contents.number > 0)
    {
      for (j = current->e.c->contents.number; j > 0; j--)
        {
          ELEMENT *child = current->e.c->contents.list[j - 1];
          if (child->type == ET_empty_line
              || child->type == ET_paragraph)
            break;
          if (!(type_data[child->type].flags & TF_text)
              && child->e.c->cmd
              && parsed_command_data(child->e.c->cmd).flags & CF_close_paragraph)
            break;
          /* after an indent there are ignorable_spaces_after_command
             skip through spaces only text element that could be there */
          if (type_data[child->type].flags & TF_text) {}
          else if (child->e.c->cmd == CM_indent
              || child->e.c->cmd == CM_noindent)
            {
              indent = child->e.c->cmd;
              break;
            }
     /* skip through @macro definitions, raw block commands, ignored
        conditional block commands, @author, informational commands,
        commands meant for titlepage such as @vskip or @title, index
        commands and types such as def_line (but cannot find an @*indent
        before), a few brace commands that can be out of paragraphs and
        do not close paragraphs such as @anchor or @image
          else
            fprintf(stderr, "INDENT search skipping through %s\n",
                    print_element_debug_parser(child, 0));
            */
        }
    }

  e = new_element (ET_paragraph);
  if (indent)
    e->flags |= (indent == CM_indent ? EF_indent : EF_noindent);
  add_to_element_contents (current, e);

  push_context (ct_paragraph, 0);
  debug ("C|PARAGRAPH");

  return e;
}

/* Begin a preformatted element if in a preformatted context. */
ELEMENT *
begin_preformatted (ELEMENT *current)
{
  if (current_context () == ct_preformatted)
    {
      ELEMENT *preformatted = new_element (ET_preformatted);
      add_to_element_contents (current, preformatted);
      current = preformatted;
      debug ("C|PREFORMATTED");
    }
  return current;
}

ELEMENT *
end_paragraph (ELEMENT *current,
               enum command_id closed_block_cmd,
               enum command_id interrupting_cmd)
{
  current = close_all_style_commands (current, closed_block_cmd,
                                      interrupting_cmd);
  if (current->type == ET_paragraph)
    {
      debug ("C|CLOSE PARA");
      current = close_container (current);
    }

  return current;
}

ELEMENT *
end_preformatted (ELEMENT *current,
                  enum command_id closed_block_cmd,
                  enum command_id interrupting_cmd)
{
  current = close_all_style_commands (current, closed_block_cmd,
                                      interrupting_cmd);
  if (current->type == ET_preformatted)
    {
      debug ("C|CLOSE PREFORMATTED");
      current = close_container (current);
    }
  return current;
}

/* end paragraph or preformatted */
ELEMENT *
end_paragraph_preformatted (ELEMENT *current,
                            enum command_id closed_block_cmd,
                            enum command_id interrupting_cmd)
{
  current = close_all_style_commands (current, closed_block_cmd,
                                      interrupting_cmd);
  if (current->type == ET_paragraph)
    {
      debug ("C|CLOSE PARA");
      current = close_container (current);
    }
  else if (current->type == ET_preformatted)
    {
      debug ("C|CLOSE PREFORMATTED");
      current = close_container (current);
    }

  return current;
}

/* the element associated with the last internal spaces element added.
   We know that there can only be one at a time as a non space
   character should always lead to abort_empty_line or another
   function being called and the internal space element being
   removed or put in the internal_space_holder info.

   NOTE internal_space_holder is already unset in abort_empty_line
   if the internal space element is put in the internal_space_holder.
   It would be cleaner to unset internal_space_holder in all the
   cases where the internal space element is removed too, such that
   when internal_space_holder is set the previous value is 0 and not
   the previous internal_space_holder, which is now irrelevant as
   its associated space has disappeared.

const ELEMENT *internal_space_holder;
 */

static void
do_abort_empty_line (ELEMENT *current, ELEMENT *last_elt)
{
  if (global_parser_conf->debug)
    {
      debug_nonl ("C|ABORT EMPTY in ");
      debug_parser_print_element (current, 0);
      debug (": %s; |%s|", type_data[last_elt->type].name,
                           last_elt->e.text->text);
    }


  /* Remove element altogether if it's empty. */
  if (last_elt->e.text->end == 0)
    {
      ELEMENT *e = pop_element_from_contents (current);
      if (e->source_mark_list)
        {
          SOURCE_MARK_LIST *source_mark_list = e->source_mark_list;

          size_t i;
          for (i = 0; i < source_mark_list->number; i++)
            place_source_mark (current, source_mark_list->list[i]);
          free_element_source_mark_list (e);
        }

      destroy_element (e);
    }
  else if (last_elt->type == ET_empty_line)
    {
      last_elt->type = in_begin_paragraph (current)
                         ? ET_spaces_before_paragraph : ET_normal_text;
    }
}

/* Add LEN_TEXT of TEXT to the contents of CURRENT, maybe starting a new
   paragraph.
   TEXT may not have a NUL character at TEXT + LEN_TEXT.
   If TRANSFER_MARKS_ELEMENT is given, also transfer mark sources
   from that element.
   */
ELEMENT *
merge_text (ELEMENT *current, const char *text, size_t len_text,
            ELEMENT *transfer_marks_element)
{
  size_t leading_spaces = 0;
  ELEMENT *e;
  ELEMENT *last_element = last_contents_child (current);

  /* paragraphs are mainly started in empty lines, in context brace
     commands or after some commands, if there is nothing in the current
     element, we cannot be in a case where a paragraph is started.
     Also, elements without anything in them are only brace_container
     or menu_entry_name, otherwise a text element is added for leading
     spaces when the element is created */
  if (!last_element)
    goto new_text;

  enum element_type last_elt_type = last_element->type;

  /* determine the number of leading characters in whitespace_chars */
  for (; leading_spaces < len_text
         && strchr (whitespace_chars, text[leading_spaces]);
       leading_spaces++);

  /* Is there a non-whitespace character in the line? */
  if (leading_spaces < len_text)
    {
      /* empty_line, ignorable_spaces_after_command, internal_spaces_*,
         spaces_after_close_brace */
      if (type_data[last_elt_type].flags & TF_leading_space)
        {
          if (leading_spaces)
            {
              if (global_parser_conf->debug)
                {
                  char *additional_text_dbg = strndup (text, leading_spaces);
                  debug ("C|MERGE_TEXT ADD leading empty |%s| to %s",
                         additional_text_dbg,
                         type_data[last_elt_type].name);
                  free (additional_text_dbg);
                }
              text_append_n (last_element->e.text, text, leading_spaces);
              text += leading_spaces;
              len_text -= leading_spaces;
            }
          else if (last_element->e.text->end == 0)
            { /* empty special space.  Reuse it as normal text element.
                 This is different from calling do_abort_empty_line and
                 afterwards adding a new element if there are source marks:
                 we avoid an empty element being added by reusing.
               */
              e = pop_element_from_contents (current);
              e->type = ET_normal_text;

              if (in_begin_paragraph (current))
                {
                  current = begin_paragraph (current);
                }
              goto add_to_empty_text;
            }

          /* following is similar to do_abort_empty_line, except
             for the empty text already handled above, and with
             paragraph opening mixed in */
          if (last_elt_type == ET_empty_line)
            {
              if (in_begin_paragraph (current))
                {
                  last_element->type = ET_spaces_before_paragraph;
                  current = begin_paragraph (current);
          /* shortcut the case with text as last content child as
             it cannot happen if a new paragraph is started */
                  goto new_text;
                }
              /* in that case, we can merge */
              last_element->type = ET_normal_text;
            }
          else
            {/* other special spaces, in general in paragraph begin context */
              if (in_begin_paragraph (current))
                current = begin_paragraph (current);
              /* we do not merge these special types */
              goto new_text;
            }
        }
      else if (in_begin_paragraph (current))
        {
          /* NOTE a new paragraph happens necessarily after a special
             space as handled just above, or after a no_paragraph
             command outside of a paragraph or after a non expanded @value
             outside of a paragraph (here), because
              - there is always an element where a paragraph can begin
              - if the element is not a special space nor a no_paragraph
                command, we are already in a paragraph if a paragraph can
                be opened.
            */
          current = begin_paragraph (current);
          /* shortcut the case with text as last content child as
             it cannot happen if a new paragraph is started */
          goto new_text;
        }
    }

  if (/* can actually be normal_text, and some space elements */
      type_data[last_elt_type].flags & TF_text
      && !strchr (last_element->e.text->text, '\n'))
    {
      /* Transfer source marks */
      if (transfer_marks_element
          && transfer_marks_element->source_mark_list)
        {
          size_t additional_length
            = count_multibyte (last_element->e.text->text);
          transfer_source_marks (transfer_marks_element,
                                 last_element, additional_length);
        }

      if (global_parser_conf->debug)
        {
          char *dbg_text = strndup (text, len_text);
          debug_nonl ("C|MERGED TEXT: %s||| in ", dbg_text);
          free (dbg_text);
          debug_parser_print_element (last_element, 0);
          debug_nonl (" last of ");
          debug_parser_print_element (current, 0); debug ("");
        }

      /* Append text */
      text_append_n (last_element->e.text, text, len_text);
    }
  else
    {
     new_text:
      e = new_text_element (ET_normal_text);
     add_to_empty_text:
      if (transfer_marks_element)
        transfer_source_marks (transfer_marks_element, e, 0);
      text_append_n (e->e.text, text, len_text);
      add_to_contents_as_array (current, e);
      if (global_parser_conf->debug)
        {
          char *dbg_text = strndup (text, len_text);
          debug ("C|NEW TEXT (merge): %s|||", dbg_text);
          free (dbg_text);
        }
    }

  return current;
}

/* If last contents child of CURRENT is an empty line element, remove
   or merge text, and return true.
 */
void
abort_empty_line (ELEMENT *current)
{
  ELEMENT *last_child = last_contents_child (current);

  if (last_child
      /* empty_line, ignorable_spaces_after_command, internal_spaces_*,
         spaces_after_close_brace */
      && type_data[last_child->type].flags & TF_leading_space)
    {
      do_abort_empty_line (current, last_child);
    }
}

/* returns the input ELEMENT if the element text consists only of spaces.
   If there are trailing spaces in ELEMENT, remove them from ELEMENT,
   create and return a new element holding the removed trailing spaces.
   Otherwise return 0.
 */
static ELEMENT *
isolate_trailing_spaces_element (enum element_type spaces_type,
                                 ELEMENT *element)
{
  ELEMENT *spaces_element = 0;
  int i, trailing_spaces;
  int text_len = element->e.text->end;
  char *text = element->e.text->text;

  trailing_spaces = 0;
  for (i = text_len - 1;
       i >= 0 && strchr (whitespace_chars, text[i]);
       i--)
    trailing_spaces++;

  /* only spaces in input element text, return the element */
  if (i < 0)
    return element;

  if (trailing_spaces)
    {
      spaces_element = new_text_element (spaces_type);
      text_append_n (spaces_element->e.text,
                     text + text_len - trailing_spaces,
                     trailing_spaces);

      text[text_len - trailing_spaces] = '\0';
      element->e.text->end -= trailing_spaces;

      if (element->source_mark_list)
        {
          size_t begin_position = count_multibyte (text);
          relocate_source_marks (element->source_mark_list,
                                 spaces_element, begin_position,
                       count_multibyte (spaces_element->e.text->text));
          destroy_element_empty_source_mark_list (element);
        }
    }
  return spaces_element;
}


void
isolate_trailing_space (ELEMENT *current, enum element_type spaces_type)
{
  ELEMENT *last_elt = last_contents_child (current);
  ELEMENT *spaces_element;

  if (!last_elt || !(type_data[last_elt->type].flags & TF_text)
      || last_elt->e.text->end <= 0)
    return;

  spaces_element = isolate_trailing_spaces_element (spaces_type, last_elt);
  /* If text all whitespace */
  if (spaces_element == last_elt)
    {
      last_elt->type = spaces_type;
    }
  else if (spaces_element)
    /* a new element with traling spaces transferred from last_elt */
    add_to_contents_as_array (current, spaces_element);
}

static ELEMENT *
isolate_leading_spaces_element (enum element_type spaces_type,
                                ELEMENT *element)
{
  ELEMENT *spaces_element = 0;
  size_t spaces_len;
  size_t text_len = element->e.text->end;
  char *text = element->e.text->text;

  spaces_len = strspn (text, whitespace_chars);

  /* only spaces in input element text, return the element */
  if (spaces_len == text_len)
    {
      element->type = spaces_type;
      return element;
    }

  if (spaces_len)
    {
      char *temp;

      spaces_element = new_text_element (spaces_type);
      text_append_n (spaces_element->e.text,
                     text, spaces_len);

      temp = strndup (text + spaces_len, text_len - spaces_len);
      element->e.text->end = 0;
      text_append_n (element->e.text, temp, text_len - spaces_len);
      free (temp);

      if (element->source_mark_list)
        {
          relocate_source_marks (element->source_mark_list,
                                 spaces_element, 0,
                                 spaces_len);
          
          destroy_element_empty_source_mark_list (element);
          if (element->source_mark_list)
            {
              SOURCE_MARK_LIST *source_mark_list = element->source_mark_list;

              size_t i;
              for (i = 0; i < source_mark_list->number; i++)
                source_mark_list->list[i]->position -= spaces_len;
            }
        }
    }
  return spaces_element;
}

void
isolate_leading_trailing (ELEMENT *current, int isolate_leading_only)
{
  size_t i;

  if (current->e.c->contents.number == 0)
    return;

  for (i = 0; i < current->e.c->contents.number; i++)
    {
      ELEMENT *content = current->e.c->contents.list[i];

      if (type_data[content->type].flags & TF_text)
        {
          ELEMENT *spaces_element
            = isolate_leading_spaces_element (ET_spaces_before_argument,
                                              content);
          if (spaces_element == content)
            spaces_element->type = ET_spaces_before_argument;
          else
            {
              if (spaces_element)
                insert_into_contents_as_array (current, spaces_element, i);
              break;
            }
        }
      else if (content->e.c->cmd != CM_c
               && content->e.c->cmd != CM_comment)
        break;
    }

  if (isolate_leading_only)
    return;


  for (i = current->e.c->contents.number -1; ; i--)
    {
      ELEMENT *last_element = current->e.c->contents.list[i];

      if (type_data[last_element->type].flags & TF_text)
        {
          ELEMENT *spaces_element;

          if (last_element->type == ET_spaces_before_argument)
            break;

          spaces_element
            = isolate_trailing_spaces_element (ET_spaces_after_argument,
                                               last_element);
          if (spaces_element == last_element)
            {
              if (!(type_data[last_element->type].flags & TF_trailing_space))
                spaces_element->type = ET_spaces_after_argument;
              else
                {
                  debug ("C|NOT ISOLATING SPACES ONLY %zu %s", i,
                                    type_data[last_element->type].name);
                }
            }
          else
            {
              if (spaces_element)
                insert_into_contents_as_array (current, spaces_element, i +1);
              break;
            }
        }
      else if (last_element->e.c->cmd != CM_c
               && last_element->e.c->cmd != CM_comment)
        break;

      if (i == 0)
        break;
    }
}



/* if kbd should be formatted as code */
int
kbd_formatted_as_code (void)
{
  if (global_kbdinputstyle == kbd_code)
    {
       return 1;
    }
  else if (global_kbdinputstyle == kbd_example)
    {
      if (in_preformatted_context_not_menu ())
        return 0;
      else
        return 1;
    }
  return 0;
}


/* If the container can hold a command as an argument, determined as
   parent element taking a command as an argument, like
   @itemize @bullet, and the command as argument being the only content. */
int
parent_of_command_as_argument (ELEMENT *current)
{
  return current->type == ET_block_line_arg
    && current->e.c->parent->e.c->parent
    && (current->e.c->parent->e.c->parent->e.c->cmd == CM_itemize
        || parsed_command_data(current->e.c->parent->e.c->parent->e.c->cmd).data
                                                          == BLOCK_item_line)
    && (current->e.c->contents.number == 1
        || (current->e.c->contents.number == 2
            && type_data[current->e.c->contents.list[0]->type].flags & TF_text
            && !*(current->e.c->contents.list[0]->e.text->text
                  + strspn (current->e.c->contents.list[0]->e.text->text,
                            whitespace_chars))));
}

/* register command_as_argument_kbd_code */
void
register_command_as_argument (ELEMENT *cmd_as_arg)
{
  if (cmd_as_arg->e.c->cmd == CM_kbd
      && kbd_formatted_as_code ()) {
    ELEMENT *command_element
      = cmd_as_arg->e.c->parent->e.c->parent->e.c->parent;
    debug ("C|FOR PARENT @%s command_as_argument %s",
           command_name(command_element->e.c->cmd),
           command_name(cmd_as_arg->e.c->cmd));
    command_element->flags |= EF_command_as_argument_kbd_code;
  }
}

static ELEMENT *
new_value_element (enum command_id cmd, const char *flag,
                   int flag_len, ELEMENT *spaces_element)
{
  ELEMENT *value_elt = new_command_element (ET_brace_command, cmd);
  ELEMENT *brace_container = new_element (ET_brace_container);
  /* occasionnally considered as text in conversion, so make it normal text */
  ELEMENT *value_text = new_text_element (ET_normal_text);

  text_append_n (value_text->e.text, flag, flag_len);
  add_to_element_contents (value_elt, brace_container);
  add_to_contents_as_array (brace_container, value_text);
  if (spaces_element)
    value_elt->elt_info[eit_spaces_after_cmd_before_arg]
      = spaces_element;
  return value_elt;
}

/* Check if line is "@end ..." for current cmd.  If so, advance LINE. */
static int
is_end_current_command (enum command_id cmd, const char **line)
{
  const char *linep;
  char *cmdname;
  enum command_id end_cmd;

  linep = *line;

  linep += strspn (linep, whitespace_chars);
  if (!looking_at (linep, "@end"))
    return 0;

  linep += 4;
  if (!strchr (whitespace_chars, *linep))
    return 0;

  linep += strspn (linep, whitespace_chars);
  if (!*linep)
    return 0;

  cmdname = read_command_name (&linep);
  if (!cmdname)
    return 0;

  end_cmd = lookup_command (cmdname);
  free (cmdname);
  if (end_cmd != cmd)
    return 0;

  *line = linep;
  return 1;
}

void
check_valid_nesting (ELEMENT *current, enum command_id cmd)
{
  enum command_id invalid_parent = 0;
  const ELEMENT *parent_command;

  /* Check whether outer command can contain cmd.  Commands are
     classified according to what commands they can contain:

     plain text
     full text

   */

  int ok = 0; /* Whether nesting is allowed. */

  unsigned long cmd_flags = parsed_command_data(cmd).flags;
  enum command_id outer;
  unsigned long outer_flags;

  if (current->e.c->parent->type == ET_arguments_line)
    parent_command = current->e.c->parent->e.c->parent;
  else
    parent_command = current->e.c->parent;

  outer = parent_command->e.c->cmd;
  outer_flags = parsed_command_data(outer).flags;

  /* first three conditions check if in the main contents of the commands
     or in the arguments where there is checking of nesting */
  if (outer_flags & CF_root && current->type != ET_line_arg)
    ok = 1;
  else if (outer_flags & CF_block
           && current->type != ET_block_line_arg)
    ok = 1;
  else if ((outer == CM_item
           || outer == CM_itemx)
           && current->type != ET_line_arg)
    ok = 1;
  else if (outer_flags & CF_contain_plain_text)
    {
      if ((cmd_flags & CF_brace
           && parsed_command_data(cmd).data == BRACE_accent)
          || (cmd_flags & CF_nobrace
              && parsed_command_data(cmd).data == NOBRACE_symbol
              && (!(cmd_flags & CF_in_heading_spec))))
        ok = 1;
      else if (cmd_flags & CF_brace
               && parsed_command_data(cmd).data == BRACE_noarg)
        ok = 1; /* glyph command */
      if (cmd == CM_c || cmd == CM_comment || cmd == CM_U)
        ok = 1;
    }
  else if (((outer_flags & CF_brace)       /* "full text commands" */
               && (parsed_command_data(outer).data == BRACE_style_other
                   || parsed_command_data(outer).data == BRACE_style_code
                   || parsed_command_data(outer).data == BRACE_style_no_code))
           || outer == CM_center
           || outer == CM_exdent
           || outer == CM_item
           || outer == CM_itemx
           || outer == CM_nodedescription)
    {
      /* Start by checking if the command is allowed inside a "full text
         command" - this is the most permissive. */
      /* in the perl parser the checks are not dynamic as in this function,
         a hash is used and modified when defining the definfoenclose command */
      /* all the brace commands, not the definfoenclose commands, which
         should be consistent with the perl parser */
      if (cmd_flags & CF_brace && !(cmd_flags & CF_INFOENCLOSE))
        ok = 1;
      if (cmd_flags & CF_nobrace && parsed_command_data(cmd).data == NOBRACE_symbol)
        ok = 1;
      /* selected line commands */
      else if (cmd == CM_c
               || cmd == CM_comment
               || cmd == CM_refill
               || cmd == CM_subentry
               || cmd == CM_columnfractions
               || cmd == CM_set
               || cmd == CM_clear
               || cmd == CM_end)
        ok = 1;
      /* selected block commands */
      else if (cmd_flags & CF_block
               && (parsed_command_data(cmd).data == BLOCK_format_raw
                    || parsed_command_data(cmd).data == BLOCK_conditional))
        ok = 1;
      /* not valid in these commands, only right in @float */
      if (cmd == CM_caption || cmd == CM_shortcaption)
        ok = 0;

      if (cmd_flags & CF_in_heading_spec)
        { /* in heading commands can only appear in headings and style
             brace commands */
          ok = 0;
          if (outer_flags & CF_brace
              && (parsed_command_data(outer).data == BRACE_style_other
                  || parsed_command_data(outer).data == BRACE_style_code
                  || parsed_command_data(outer).data == BRACE_style_no_code))
              ok = 1;
        }
    }
  else
    {
      /* Default to valid nesting, for commands for which it is not
         defined which commands can occur within them (e.g. @tab, the
         remaining of brace commands (context, arguments, other)
         that are not treated especially, most line command and block
         commands that have an argument */
      ok = 1;
    }

  if (!ok)
    {
      invalid_parent = parent_command->e.c->cmd;
      if (!invalid_parent)
        {
          /* current_context () == ct_def.  Find def block containing
             command. */
          ELEMENT *d = current;
          while (d->e.c->parent
                 && !(d->e.c->parent->flags & EF_def_line))
            d = d->e.c->parent;
          invalid_parent = d->e.c->parent->e.c->parent->e.c->cmd;
        }

      line_warn ("@%s should not appear in @%s",
                 command_name(cmd),
                 command_name(invalid_parent));
    }
}

void
check_valid_nesting_context (enum command_id cmd)
{
  enum command_id invalid_context = 0, invalid_line = 0;

  if (nesting_context.caption > 0
           && (cmd == CM_caption || cmd == CM_shortcaption))
    {
      line_warn ("@%s should not appear anywhere inside caption",
        command_name(cmd));
      return;
    }

  if (nesting_context.footnote > 0
      && cmd == CM_footnote)
    {
      invalid_context = CM_footnote;
    }
  else if (nesting_context.basic_inline_stack.number > 0
           || nesting_context.basic_inline_stack_on_line.number > 0
           || nesting_context.basic_inline_stack_block.number > 0)
    {
      unsigned long flags = parsed_command_data(cmd).flags;
      int data = parsed_command_data(cmd).data;

      if (!(                                             /* inclusions */
                (flags & (CF_brace | CF_in_heading_spec))
             || ((flags & CF_nobrace) && data == NOBRACE_symbol)
             || cmd == CM_c
             || cmd == CM_comment
             || cmd == CM_refill
             || cmd == CM_subentry
             || cmd == CM_columnfractions
             || cmd == CM_set
             || cmd == CM_clear
             || cmd == CM_end
             || ((flags & CF_block)
                && (data == BLOCK_format_raw || data == BLOCK_conditional))
           )
          || (flags & (CF_ref | CF_INFOENCLOSE))      /* exclusions */
          || cmd == CM_caption
          || cmd == CM_shortcaption
          || cmd == CM_titlefont
          || cmd == CM_anchor
          || cmd == CM_namedanchor
          || cmd == CM_footnote
          || cmd == CM_verb)
        {
          if (nesting_context.basic_inline_stack.number > 0)
            invalid_context = *top_(command)
                                (&nesting_context.basic_inline_stack);
          else if (nesting_context.basic_inline_stack_on_line.number > 0)
            invalid_line = *top_(command)
                                (&nesting_context.basic_inline_stack_on_line);
          else if (nesting_context.basic_inline_stack_block.number > 0)
            invalid_line = *top_(command)
                                (&nesting_context.basic_inline_stack_block);
        }
    }

  if (invalid_context)
    {
      line_warn ("@%s should not appear anywhere inside @%s",
        command_name(cmd),
        command_name(invalid_context));
      return;
    }

  /* Inclusions for "basic inline with refs" commands. */
  if (parsed_command_data(invalid_line).flags & (CF_sectioning_heading | CF_def))
    {
      if (parsed_command_data(cmd).flags & CF_ref)
        invalid_line = 0;
    }

  if (invalid_line)
    {
      line_warn ("@%s should not appear on @%s line",
        command_name(cmd),
        command_name(invalid_line));
    }

  if (nesting_context.regions_stack.number > 0)
    {
      if ((parsed_command_data(cmd).flags & CF_block)
           && (parsed_command_data(cmd).data == BLOCK_region))
        invalid_context
          = *top_(command) (&nesting_context.regions_stack);
    }

  if (invalid_context)
    {
      line_warn ("@%s should not appear in @%s block",
        command_name(cmd),
        command_name(invalid_context));
    }
}

static char *allocated_text;

/* Read input until finding the @end of the CURRENT macro block command,
   taking into account the possibility to have nested @*macro.
   Leave the closing @end on the line. */
static void
process_macro_block_contents (ELEMENT *current, const char **line_out)
{
  const char *line;

  free (allocated_text);
  line = allocated_text = next_text (current);

  while (1)
    {
      const char *p = line;
      const char *q;
      enum command_id cmd = 0;

      if (!line)
        {/* unclosed block */
     /* Error for unclosed raw block commands (except for the first) */
          while (macro_block_stack.number > 0)
            {
              line_error ("expected @end %s",
                   command_name(*top_(command) (&macro_block_stack)));
              pop_(command) (&macro_block_stack);
            }
          break;
        }

      /* Check if we are using a macro within a macro. */
      p += strspn (p, whitespace_chars);
      q = p;
      if (!strncmp (p, "@macro", strlen ("@macro")))
        {
          q += strlen ("@macro");
          cmd = CM_macro;
        }
      else if (!strncmp (p, "@rmacro", strlen ("@rmacro")))
        {
          q += strlen ("@rmacro");
          cmd = CM_rmacro;
        }
      else if (!strncmp (p, "@linemacro", strlen ("@linemacro")))
        {
          q += strlen ("@linemacro");
          cmd = CM_linemacro;
        }
      if (*q && !strchr (whitespace_chars, *q))
        cmd = CM_NONE;
      if (cmd != CM_NONE)
        {
          debug ("C|RAW SECOND LEVEL %s in @%s", command_name(cmd),
                 command_name(current->e.c->cmd));
          add_(command) (&macro_block_stack, cmd);
        }
      /* Else check if line is "@end ..." for current command. */
      else
        {
          enum command_id top_stack_cmd;
          if (macro_block_stack.number == 0)
            {/* current is the first command, not on the stack */
              top_stack_cmd = current->e.c->cmd;
            }
          else
            top_stack_cmd = *top_(command) (&macro_block_stack);
          if (is_end_current_command (top_stack_cmd, &p))
            {
              if (macro_block_stack.number == 0)
                {
                  ELEMENT *e;
                  char *name;
                  enum command_id existing;
                  size_t n;

                  n = strspn (line, whitespace_chars);

                  if (n > 0)
                    {
                      ELEMENT *e = new_text_element (ET_raw);
                      text_append_n (e->e.text, line, n);
                      add_to_contents_as_array (current, e);
                      line += n;
                      line_warn ("@end %s should only appear at the "
                                 "beginning of a line",
                                 command_name(top_stack_cmd));
                    }
                  name = lookup_extra_string (current, AI_key_macro_name);
                  if (name)
                    {
                      existing = lookup_command (name);
                      if (existing)
                        {
                          MACRO *macro;
                          macro = lookup_macro (existing);
                          if (macro)
                            {
                              line_error_ext (MSG_warning, 0,
                                              &current->e.c->source_info,
                                 "macro `%s' previously defined", name);
                              line_error_ext (MSG_warning, 0,
                                          &macro->element->e.c->source_info,
                                 "here is the previous definition of `%s'",
                                              name);
                            }
                          else if (!(existing & USER_COMMAND_BIT))
                            {
                              line_error_ext (MSG_warning, 0,
                                              &current->e.c->source_info,
                                "redefining Texinfo language command: @%s",
                                name);
                            }
                        }
                      if (!(current->flags & EF_invalid_syntax))
                        {
                          new_macro (name, current);
                        }
                    }
                  debug ("C|CLOSED user-defined %s",
                         command_name(top_stack_cmd));
           /* start a new line for the @end line (without the first spaces on
              the line that have already been put in a raw container).
              This is normally done at the beginning of a line, but not here,
              as we directly got the line.  As the @end is processed just below,
              an empty line will not appear in the output, but it is needed to
              avoid a duplicate warning on @end not appearing at the beginning
              of the line */
                  e = new_text_element (ET_empty_line);
                  add_to_contents_as_array (current, e);

                  break;
                }
              else
                pop_(command) (&macro_block_stack);
            }
        }
      /* save the line verbatim */
      ELEMENT *e;
      e = new_text_element (ET_raw);
      text_append (e->e.text, line);
      add_to_contents_as_array (current, e);

      free (allocated_text);
      line = allocated_text = next_text (current);
    }

  *line_out = line;
}

/* Read input until finding the @end of the CURRENT block command,
   taking into account the possibility to have nested @-commands.
   Leave the closing @end on the line. */
static void
process_raw_block_contents (ELEMENT *current, const char **line_out)
{
  enum command_id cmd = current->e.c->cmd;
  const char *block_name = command_name(cmd);
  int cmdname_len = strlen (block_name);
  const char *line;
  int level = 1;

  debug ("C|BLOCK raw or ignored %s", block_name);

  free (allocated_text);
  line = allocated_text = next_text (current);

  while (1)
    {
      const char *p = line;
      const char *q;
      int new_opened = 0;

      if (!line)
        {/* unclosed block */
         /* no warning for the top-level @-command, there will be one
            when closing the command */
          while (level > 1)
            {
              line_error ("expected @end %s", block_name);
              level--;
            }
          break;
        }

      p += strspn (p, whitespace_chars);
      if (*p == '@')
        {
          q = p;
          q++;
          if (!strncmp (q, block_name, cmdname_len))
            {
              q += cmdname_len;
              if (!(*q && *q != '@' && !strchr (whitespace_chars, *q)))
                new_opened = 1;
            }
        }
      if (new_opened)
        {
          debug ("C|RAW SECOND LEVEL @%s", block_name);
          level++;
        }
      /* Else check if line is "@end ..." for current command. */
      else if (is_end_current_command (cmd, &p))
        {
          level--;
          if (level == 0)
            {
              ELEMENT *e;
              int n = strspn (line, whitespace_chars);

              if (n > 0)
                {
                  ELEMENT *e = new_text_element (ET_raw);
                  text_append_n (e->e.text, line, n);
                  add_to_contents_as_array (current, e);
                  line += n;
                  line_warn ("@end %s should only appear at the "
                             "beginning of a line", command_name(cmd));
                }
              debug ("C|CLOSED raw or ignored %s", command_name(cmd));
       /* start a new line for the @end line (without the first spaces on
          the line that have already been put in a raw container).
          This is normally done at the beginning of a line, but not here,
          as we directly got the line.  As the @end is processed afterwards,
          an empty line will not appear in the output, but it is needed to
          avoid a duplicate warning on @end not appearing at the beginning
          of the line */
              e = new_text_element (ET_empty_line);
              add_to_contents_as_array (current, e);

              break;
            }
        }
      /* save the line verbatim */
      ELEMENT *e;
      e = new_text_element (ET_raw);
      text_append (e->e.text, line);
      add_to_contents_as_array (current, e);

      free (allocated_text);
      line = allocated_text = next_text (current);
    }
  *line_out = line;
}


/* Read input until finding the @end of the CURRENT ignored raw format
   block command.  Leave the closing @end on the line */
static void
process_ignored_raw_format_block_contents (ELEMENT *current,
                                           const char **line_out)
{

  /* we proceed with an internal loop here as there cannot be any
     expansion within an ignored format_raw.  We leave the @end line
     in line and do not change retval (in calling code) to have the
     @end line be processed by the following call to
     process_remaining_on_line */

  ELEMENT *e_elided_rawpreformatted;
  ELEMENT *e_empty_line;
  const char *line_dummy;
  const char *line;
  int n;

  free (allocated_text);
  line = allocated_text = next_text (current);

  e_elided_rawpreformatted = new_element (ET_elided_rawpreformatted);
  add_to_element_contents (current, e_elided_rawpreformatted);

  while (1)
    {
      if (!line)
        {
          /* unclosed block */
          break;
        }
      else
        {
          line_dummy = line;
          if (is_end_current_command (current->e.c->cmd, &line_dummy))
            {
              debug ("C|CLOSED ignored raw preformated %s",
                     command_name(current->e.c->cmd));
              /* start a new line for the @end line, this is normally done
                 at the beginning of a line, but not here, as we directly
                 got the line. */

              e_empty_line = new_text_element (ET_empty_line);
              add_to_contents_as_array (current, e_empty_line);

              n = strspn (line, whitespace_chars_except_newline);
              if (n > 0)
                {
                  text_append_n (e_empty_line->e.text, line, n);
                  line += n;
                }

              break;
            }
        }

      ELEMENT *raw_text = new_text_element (ET_raw);
      text_append (raw_text->e.text, line);
      add_to_contents_as_array (e_elided_rawpreformatted, raw_text);

      free (allocated_text);
      line = allocated_text = next_text (e_elided_rawpreformatted);
    }

  *line_out = line;
}

/* Read input until finding the delimiter and end brace of the
   CURRENT @verb command element.  Leave the closing } on the line */
void
process_verb_contents (ELEMENT *current, const char **line_inout)
{
  const char *q;
  const char *delimiter
    = current->e.c->parent->e.c->string_info[sit_delimiter];
  const char *line = *line_inout;

  int delimiter_len = strlen (delimiter);

  while (1)
    {
      if (delimiter_len)
        {
          /* Look forward for the delimiter character followed by a close
             brace. */
          q = line;
          while (1)
            {
              q = strstr (q, delimiter);
              if (!q || q[delimiter_len] == '}')
                break;
              q += delimiter_len;
            }
        }
      else
        {
          /* Look forward for a close brace. */
          q = strchr (line, '}');
        }

      if (q)
        {
          /* Save up to the delimiter character. */
          if (q != line)
            {
              ELEMENT *e = new_text_element (ET_raw);
              text_append_n (e->e.text, line, q - line);
              add_to_contents_as_array (current, e);
            }
          debug ("C|END VERB");
          line = q + delimiter_len;
          /* The '}' will close the @verb command in handle_separator. */
          break;
        }

      /* Save the rest of line. */
      ELEMENT *e = new_text_element (ET_raw);
      text_append (e->e.text, line);
      add_to_contents_as_array (current, e);

      debug_nonl ("C|LINE VERB: ");
      debug_print_protected_string (line); debug("");

      free (allocated_text);
      line = allocated_text = next_text (current);

      if (!line)
        {
          /* unclosed verb */
          break;
        }
    }

  *line_inout = line;
}

/* *LINEP is a pointer into the line being processed.  It is advanced past any
   bytes processed.
   Return STILL_MORE_TO_PROCESS when there is more to process on the line
          GET_A_NEW_LINE when we need to read a new line
          FINISHED_TOTALLY when @bye was found */
int
process_remaining_on_line (ELEMENT **current_inout, const char **line_inout)
{
  ELEMENT *current = *current_inout;
  ELEMENT *macro_call_element = 0;
  const char *line = *line_inout;
  const char *line_after_command;
  int retval = STILL_MORE_TO_PROCESS;
  enum command_id from_alias = CM_NONE;

  enum command_id cmd = CM_NONE;
  /* remains set only if command is unknown, otherwise cmd is used */
  char *command = 0;

  /*
  debug_nonl ("C|PROCESS "); debug_print_protected_string (line); debug ("");
  */

  /* Skip empty lines.  If we reach the end of input, continue in case there
     is an @include. */

  /* There are cases when we need more input, but we don't want to
     get it in the top-level loop in parse_texi - this is mostly
     (always?) when we don't want to start a new, empty line, and
     need to get more from the current, incomplete line of input.
     Also, this ensures that the line cannot be empty in parsing below
   */
  while (*line == '\0')
    {
      debug_nonl ("C|EMPTY TEXT in: ");
      debug_parser_print_element (current, 0); debug ("");

      /* Each place we supply Texinfo input we store the supplied
         input in a static variable like allocated_text, to prevent
         memory leaks.  */
      free (allocated_text);
      line = allocated_text = next_text (current);

      if (!line)
        {
          /* End of the file or of a text fragment. */
          debug ("C|NO MORE LINE for empty text");
          goto funexit;
        }
    }

  if (*line == '@')
    {
      int single_char;
      line_after_command = line + 1;

      command = parse_command_name (&line_after_command, &single_char);
      if (command)
        {
          cmd = lookup_command (command);
          /* known command */
          if (cmd)
            free (command);
          /* command holds the unknown command name if !cmd && command */
        }
      else
        {
          /* @ was followed by gibberish or by nothing, for instance at the
             very end of a string/file. */
          line_error ("unexpected @");
          line = line_after_command;
          goto funexit;
        }
      if (cmd && (parsed_command_data(cmd).flags & CF_ALIAS))
        {
          from_alias = cmd;
          cmd = parsed_command_data(cmd).data;
        }
    }

  /* Handle user-defined macros before anything else because their expansion
     may lead to changes in the line. */
  if (cmd && (parsed_command_data(cmd).flags & CF_MACRO))
    {
      static char *allocated_line;

      line = line_after_command;
      macro_call_element = handle_macro (current, &line, cmd, from_alias);
      if (macro_call_element)
        {
          /* directly get the following input (macro expansion text) instead
             of going through the next call of process_remaining_on_line and
             the processing of empty text.  No difference in output, more
             efficient.
           */

          free (allocated_line);
          allocated_line = next_text (current);
          line = allocated_line;
          goto funexit;
        }
      else
        goto funexit;
    }
  /* expand value if it actually expands and changes the line.  It is
     considered again together with other commands below for all the other cases
     which may need a well formed tree, which is not needed nor available here,
     and early value expansion may be needed to provide with an argument. */
  else if (cmd == CM_value)
    {
      const char *remaining_line = line_after_command;
      ELEMENT *spaces_element = 0;
      if (global_parser_conf->ignore_space_after_braced_command_name)
        {
          int whitespaces_len = strspn (remaining_line, whitespace_chars);
          if (whitespaces_len > 0)
            {
              /* special text in "spaces_after_cmd_before_arg" */
              spaces_element
                = new_text_element (ET_spaces_after_cmd_before_arg);
              text_append_n (spaces_element->e.text,
                             remaining_line, whitespaces_len);
              remaining_line += whitespaces_len;
            }
        }
      if (*remaining_line == '{')
        {
          size_t flag_len;

          remaining_line++;
          flag_len = read_flag_len (remaining_line);
          if (flag_len)
            {
              if (*(remaining_line + flag_len) == '}')
                {
                  char *flag = strndup (remaining_line, flag_len);
                  char *value = fetch_value (flag);

                  remaining_line += flag_len +1; /* past '}' */

                  if (value)
                    {
                      SOURCE_MARK *value_source_mark;
                      ELEMENT *sm_value_element;

                      if (global_parser_conf->max_macro_call_nesting
                          && value_expansion_nr
                                  >= global_parser_conf->max_macro_call_nesting)
                        {
                          line_warn (
                            "value call nested too deeply "
                   "(set MAX_MACRO_CALL_NESTING to override; current value %d)",
                             global_parser_conf->max_macro_call_nesting);
                          free (flag);
                          if (spaces_element)
                            destroy_element (spaces_element);
                          line = remaining_line;
                          goto funexit;
                        }

                      sm_value_element
                        = new_value_element (cmd, flag, flag_len,
                                             spaces_element);

                      input_push_text (strdup (remaining_line),
                                       current_source_info.line_nr, 0, 0);
                      input_push_text (strdup (value),
                                       current_source_info.line_nr, 0, flag);

                      value_source_mark
                          = new_source_mark (SM_type_value_expansion);
                      value_source_mark->status = SM_status_start;
                      value_source_mark->line = strdup (value);
                      value_source_mark->element = sm_value_element;

                      register_source_mark (current, value_source_mark);
                      set_input_source_mark (value_source_mark);

                      value_expansion_nr++;

                      /* Set 'line' to end of string so next input to
                         be processed is taken from input stack. */
                      line = "";
                    }
                  free (flag);
                  if (value)
                    {
                      goto funexit;
                    }
                }
            }
        }
      if (spaces_element)
        destroy_element (spaces_element);
    }

  /* special case for @-command as argument of @itemize or @*table.
     The normal case for those are to be identifier only, not a true command
     with argument, so can be followed by anything.  If followed by
     braces, will be handled as a normal brace command.

     Need to be done as early as possible such that no other condition
     prevail and lead to a missed command */
  if (command_flags(current) & CF_brace && *line != '{'
      && parsed_command_data(current->e.c->cmd).data != BRACE_accent
      && parent_of_command_as_argument (current->e.c->parent))
    {
      register_command_as_argument (current);
      current = current->e.c->parent;
    }

  /* command but before an opening brace, otherwise current
     would be an argument type and not the command, and a new
     @-command was found.  This means that the current->e.c->cmd
     argument (an opening brace, or a character after spaces for
     accent commands) was not found and there is already a new command.

     NOTE the ->{'info'}->{'spaces_after_cmd_before_arg'} element
     in the current command holds the spaces before the opening brace.
     It could be possible to accept an @comment here and put it in this
     element.  It would not necessarily be a good idea, as it would mean
     having an element in info that holds something more complex
     than text and source marks.
   */

  if (command_flags(current) & CF_brace && (cmd || command))
    {
      line_error ("@%s expected braces",
                  command_name(current->e.c->cmd));
      current = current->e.c->parent;
    }

  /* Handle unknown command. */
  if ((!cmd && command)
      /* command marked as unknown, normally a registered user-defined command
         that was set as @alias-ed but has not been defined since, or
         that has been removed (with @unmacro) */
      || (parsed_command_data(cmd).flags & CF_UNKNOWN)
          /* Alias command that did not resolve to a non alias command.
             This is possible only if the command read was already an alias
             resolving to cmd and not to a non alias command.  In turn,
             this is possible if there was an error at the time of alias
             definition (because the alias was defined recursively to itself).
           */
      || (parsed_command_data(cmd).flags & CF_ALIAS))
    {
      const char *unknown_cmd;

      if (cmd)
        {
          unknown_cmd = command_name (cmd);
          /* Would there be something similar in the perl parser?
          debug ("C|COMMAND (REGISTERED UNKNOWN) %d %s", cmd, unknown_cmd);
          */
        }
      else
        {
          unknown_cmd = command;
          /* Would there be something similar in the perl parser?
          debug ("C|COMMAND (UNKNOWN) %s", command);
          */
        }
      line_error ("unknown command `%s'", unknown_cmd);
      if (!cmd)
        free (command);

      line = line_after_command;
      goto funexit;
    }

  /* Brace commands not followed immediately by a brace
     opening.  In particular cases that may lead to "command closing"
     or following character association with an @-command, for accent
     commands */
  /* This condition can only happen immediately after the command opening,
     otherwise the current element is in the 'contents' and not right in the
     command container. */
  if (command_flags(current) & CF_brace && *line != '{')
    {
      debug_nonl ("C|BRACE CMD: no brace after @%s||| ",
                  command_name (current->e.c->cmd));
      debug_print_protected_string (line); debug ("");

      if (strchr (whitespace_chars, *line)
               && ((parsed_command_data(current->e.c->cmd).data == BRACE_accent)
            || global_parser_conf->ignore_space_after_braced_command_name))
        {
           int whitespaces_len;
           int additional_newline = 0;
           whitespaces_len = strspn (line, whitespace_chars);

           for (int i = 0; i < whitespaces_len; i++)
             {
               if (*(line + i) == '\n')
                 {
                   line_warn ("command `@%s' must not be followed by new line",
                              command_name(current->e.c->cmd));
                   if (current_context () == ct_def
                       || (current_context () == ct_line
                           && top_context_command () != CM_NONE))
                     {
                    /* do not consider the end of line to be possibly between
                       the @-command and the opening brace if at the end of a
                       line or block @-command. */
                       current = current->e.c->parent;
                       current = merge_text (current, line, whitespaces_len, 0);
                       line += whitespaces_len;
                       isolate_leading_trailing (current, 0);
                       current = end_line (current);
                       retval = GET_A_NEW_LINE;
                       goto funexit;
                     }
                   additional_newline = 1;
                   break;
                 }
             }

           if (!current->elt_info[eit_spaces_after_cmd_before_arg])
             {
               ELEMENT *e_spaces_after_cmd_before_arg
                 = new_text_element (ET_spaces_after_cmd_before_arg);
               text_append_n (e_spaces_after_cmd_before_arg->e.text,
                              line, whitespaces_len);
               current->elt_info[eit_spaces_after_cmd_before_arg]
                  = e_spaces_after_cmd_before_arg;

               debug_nonl ("C|BRACE CMD before brace init spaces '");
               debug_print_protected_string
                                  (e_spaces_after_cmd_before_arg->e.text->text);
               debug ("'");

               line += whitespaces_len;
             }
           else
             {
       /* contents, at this point can only be for spaces_after_cmd_before_arg */
            /* only ignore spaces and one newline, two newlines lead to
               an empty line before the brace or argument which is incorrect. */
               char *previous_value
                  = current->elt_info[eit_spaces_after_cmd_before_arg]
                                                             ->e.text->text;
               if (additional_newline && strchr ("\n", *previous_value))
                 {
                   debug ("C|BRACE CMD before brace second newline stops spaces");
                   line_error ("@%s expected braces",
                               command_name(current->e.c->cmd));
                   current = current->e.c->parent;
                 }
               else
                 {
                   text_append_n (current
                        ->elt_info[eit_spaces_after_cmd_before_arg]->e.text,
                                  line, whitespaces_len);
                   debug ("C|BRACE CMD before brace add spaces '%s'",
               current->elt_info[eit_spaces_after_cmd_before_arg]->e.text->text
   + strlen (current->elt_info[eit_spaces_after_cmd_before_arg]->e.text->text)
                                                         - whitespaces_len);
                   line += whitespaces_len;
                 }
             }
        }
    /* special case for accent commands, use following character except @
       as argument */
      else if ((command_flags(current) & CF_brace
                && parsed_command_data(current->e.c->cmd).data == BRACE_accent)
               && *line != '@')
        {
          ELEMENT *e, *e2;
          int char_len;

          e = new_element (ET_following_arg);
          add_to_element_contents (current, e);

          /* Count any UTF-8 continuation bytes. */
          char_len = 1;
          while ((line[char_len] & 0xC0) == 0x80)
            char_len++;

          e2 = new_text_element (ET_normal_text);
          text_append_n (e2->e.text, line, char_len);
          debug ("C|ACCENT @%s following_arg: %s",
                 command_name(current->e.c->cmd), e2->e.text->text);
          add_to_contents_as_array (e, e2);

          if (current->e.c->cmd == CM_dotless
              && *line != 'i' && *line != 'j')
            {
              line_error ("@dotless expects `i' or `j' as argument, "
                          "not `%s'", e2->e.text->text);
            }
          line += char_len;
          current = current->e.c->parent;
        }
      else
        {
          line_error ("@%s expected braces",
                      command_name(current->e.c->cmd));
          current = current->e.c->parent;
        }
    }
  else if (handle_menu_entry_separators (&current, &line))
    {
      ; /* Nothing - everything was done in handle_menu_entry_separators. */
    }
  /* Any other @-command. */
  else if (cmd)
    {
      /* command used to get command data.  Needed for the multicategory
         @item command. */
      enum command_id data_cmd = cmd;
      ELEMENT *command_element;
      ELEMENT *last_element = last_contents_child (current);

      debug ("C|COMMAND @%s", debug_parser_command_name (cmd));

      line = line_after_command;

      /* @value not expanded (expansion is done above), and @txiinternalvalue */
      if ((cmd == CM_value) || (cmd == CM_txiinternalvalue))
        {
          size_t flag_len;
          ELEMENT *spaces_element = 0;
          if (global_parser_conf->ignore_space_after_braced_command_name)
            {
              int whitespaces_len = strspn (line, whitespace_chars);
              if (whitespaces_len > 0)
                {
                  /* special text in "spaces_after_cmd_before_arg" */
                  spaces_element
                    = new_text_element (ET_spaces_after_cmd_before_arg);
                  text_append_n (spaces_element->e.text,
                                 line, whitespaces_len);
                  line += whitespaces_len;
                }
            }
          if (*line != '{')
            goto value_invalid;

          line++;
          flag_len = read_flag_len (line);
          if (!flag_len)
            goto value_invalid;

          if (*(line + flag_len) != '}')
            {
              line--;
              goto value_invalid;
            }

          if (1) /* @value syntax is valid */
            {
          /* value_valid: */
              if (cmd == CM_value)
                {
                  char *value;
                  char *flag = strndup (line, flag_len);
                  value = fetch_value (flag);
                  if (!value)
                    {
                    /* Add element for unexpanded @value.
                       This should be an error, but still leave a tree element
                       for the converters to handle */
                      ELEMENT *value_elt;

                      abort_empty_line (current);

                      line_warn ("undefined flag: %s", flag);

                      value_elt
                         = new_value_element (cmd, flag, flag_len,
                                              spaces_element);
                      add_to_element_contents (current, value_elt);

                      line += flag_len +1; /* past '}' */
                    }
                  else
                    {
                      if (spaces_element)
                        destroy_element (spaces_element);
                   /* expansion of value already done above
                       value is set
                    */
                    }
                  free (flag);
                  goto funexit;
                }
              else
                { /* CM_txiinternalvalue */
                  ELEMENT *txiinternalvalue_elt;

                  abort_empty_line (current);

                  txiinternalvalue_elt
                    = new_value_element (cmd, line, flag_len,
                                         spaces_element);

                  add_to_element_contents (current, txiinternalvalue_elt);

                  line += flag_len +1; /* past '}' */

                  goto funexit;
                }
            }
          else
            {
          value_invalid:
              line_error ("bad syntax for @%s", command_name(cmd));
              if (spaces_element)
                destroy_element (spaces_element);
              goto funexit;
            }
        }

      /* Warn on deprecated command */
      if (parsed_command_data(cmd).flags & CF_deprecated)
        {
          int found;
          const char *cmd_name = command_name(cmd);
          uintptr_t warning_nr
           = (uintptr_t)c_hashmap_value (&warned_deprecated_commands, cmd_name,
                                         &found);
          if (found)
            {
              if (warning_nr < 2)
                {
                  warning_nr++;
                  c_hashmap_set_value (&warned_deprecated_commands, cmd_name,
                                       (const void *) warning_nr);
                  line_warn ("@%s is obsolete", cmd_name);
                  if (warning_nr == 2)
                    line_error_ext (MSG_warning, 1, &current_source_info,
                           "further warnings for @%s suppressed", cmd_name);
                }
            }
          else
            {
              warning_nr = 1;
              c_hashmap_register (&warned_deprecated_commands, cmd_name,
                                  (const void *) warning_nr);
              line_warn ("@%s is obsolete", cmd_name);
            }
        }

      /* special case with @ followed by a newline protecting end of lines
         in  @def* */
      if (current_context () == ct_def && cmd == CM_NEWLINE)
        {
          SOURCE_MARK *line_continuation_source_mark
            = new_source_mark (SM_type_defline_continuation);
          register_source_mark (current, line_continuation_source_mark);

          free (allocated_text);
          line = allocated_text = next_text (current);
          goto funexit;
        }

      /* warn on not appearing at line beginning.  Need to do before closing
         paragraph as it also closes the empty line */
      if ((!last_element || last_element->type != ET_empty_line)
          && ((cmd == CM_node || cmd == CM_bye)
              || (parsed_command_data(cmd).flags & CF_block)
              || ((parsed_command_data(cmd).flags & CF_line)
                  && cmd != CM_comment
                  && cmd != CM_c
                  && cmd != CM_columnfractions
                  && cmd != CM_item
                  && cmd != CM_subentry)))
        {
          line_warn ("@%s should only appear at the beginning of a line",
                     command_name(cmd));
        }

      abort_empty_line (current);

      /* close_paragraph_not_preformatted */
      if (cmd == CM_sp)
        current = end_paragraph (current, 0, 0);
      else if (parsed_command_data(cmd).flags & CF_close_paragraph)
        current = end_paragraph_preformatted (current, 0, 0);

      /* done here and not above because it is not possible to check the parent
         before closing paragraph/preformatted */
      if (cmd == CM_item && item_line_parent (current))
        data_cmd = CM_item_LINE;

      if (current->e.c->parent)
        {
          /* NOTE the command name appears in the functions, so it is
             better to use cmd and not data_cmd.  This means that all
             the checks are done with @item as NOBRACE_skipspace */
          check_valid_nesting (current, cmd);
          check_valid_nesting_context (cmd);
        }

      if ((cmd == CM_sortas
           || cmd == CM_seeentry
           || cmd == CM_seealso
           || cmd == CM_subentry)
          && current->e.c->contents.number > 0
       /* it is important to check if in an index command, as otherwise
          the internal space type is not processed and remains as is in
          the final tree. */
          && (command_flags(current->e.c->parent) & CF_index_entry_command
               || current->e.c->parent->e.c->cmd == CM_subentry))
        {
          if (cmd == CM_subentry)
            isolate_trailing_space (current,
                                    ET_spaces_after_argument);
          else
               /* an internal and temporary space type that is converted to
                  a normal space if followed by text or a
                  "spaces_at_end" if followed by spaces only when the
                  index or subentry command is done. */
            isolate_trailing_space (current,
                                ET_internal_spaces_before_brace_in_index);
        }

      /* check command doesn't start a paragraph */
      if (!(parsed_command_data(data_cmd).flags & CF_no_paragraph))
        {
          if (in_begin_paragraph (current))
            current = begin_paragraph (current);
        }

      /* No-brace command */
      if (parsed_command_data(data_cmd).flags & CF_nobrace)
        {
          int status;
          current = handle_other_command (current, &line, cmd, &status,
                                          &command_element);
          if (status == GET_A_NEW_LINE || status == FINISHED_TOTALLY)
            {
              retval = status;
            }
        }
      else if (parsed_command_data(data_cmd).flags & CF_line)
        {
          int status;
          current = handle_line_command (current, &line, cmd, data_cmd, &status,
                                         &command_element);
          if (status == GET_A_NEW_LINE)
            {
              /* @ignore or @verbatim and ignored conditionals
                 followed by a comment */
              if (command_flags(current) & CF_block
                  && (parsed_command_data(current->e.c->cmd).data == BLOCK_raw
             || parsed_command_data(current->e.c->cmd).data == BLOCK_conditional))
                {
                  process_raw_block_contents (current, &line);
                }
              else if (command_flags(current) & CF_block
                  && parsed_command_data(current->e.c->cmd).data
                                                        == BLOCK_format_raw)
                {
                  process_ignored_raw_format_block_contents (current, &line);
                }
              else
                retval = status;
            }
          else if (status == FINISHED_TOTALLY)
            {
              retval = status;
            }
        }
      else if (parsed_command_data(data_cmd).flags & CF_block)
        {
          if (cmd == CM_macro || cmd == CM_rmacro || cmd == CM_linemacro)
            {
              command_element = parse_macro_command_line (cmd, &line, current);
              add_to_element_contents (current, command_element);
              current = command_element;
              process_macro_block_contents (current, &line);
            }
          else
            current = handle_block_command (current, &line, cmd,
                                            &command_element);
        }
      else if (parsed_command_data(data_cmd).flags & CF_brace)
        {
          current = handle_brace_command (current, &line, cmd, &command_element);
        }
      if (from_alias != CM_NONE && command_element)
        {
          command_element->e.c->string_info[sit_alias_of]
            = strdup (command_name (from_alias));
        }
    }
  /* "Separator" characters */
  else if (*line == '{')
    {
      line++;
      current = handle_open_brace (current, &line);
      if (current->e.c->parent && current->e.c->parent->e.c->cmd == CM_verb)
        {
          process_verb_contents (current, &line);
        }
    }
  else if (*line == '}')
    {
      line++;
      current = handle_close_brace (current, &line);
    }
  else if (*line == ',')
    {
      line++;
      /* comma as a command argument separator */
      if (counter_value (&count_remaining_args, current->e.c->parent) > 0
          || (current->e.c->parent && current->e.c->parent->e.c->parent
              && counter_value (&count_remaining_args,
                                current->e.c->parent->e.c->parent) > 0))
        current = handle_comma (current, &line);
      else if (current->type == ET_line_arg
              /* this avoids detecting the comma in @cindex as being on the
                 node line in the following case:
                 @node some node

                 @cindex a, b
               */
               && !current->e.c->parent->e.c->cmd
               && current->e.c->parent->e.c->parent
               && current->e.c->parent->e.c->parent->e.c->cmd == CM_node)
        line_warn ("superfluous arguments for node");
      else
        current = merge_text (current, ",", 1, 0);
    }
  else if (strchr (":\t.", *line))
    {
      /* merge menu separator (other than comma) */
      current = merge_text (current, line, 1, 0);
      line++;
    }
  else if (*line == '\f')
    {
      line++;
      debug_nonl ("C|FORM FEED in "); debug_parser_print_element (current, 1);
      debug_nonl (": "); debug_print_protected_string (line); debug ("");
      if (current->type == ET_paragraph)
        {
          ELEMENT *e;

          /* A form feed stops and restarts a paragraph. */
          current = close_container (current);
          e = new_text_element (ET_empty_line);
          text_append_n (e->e.text, "\f", 1);
          add_to_contents_as_array (current, e);
          e = new_text_element (ET_empty_line);
          add_to_contents_as_array (current, e);
        }
      else
       current = merge_text (current, "\f", 1, 0);
    }
  /* Misc text except end of line. */
  else if (*line != '\n')
    {
      size_t len;

      /* Output until next command, separator or newline. */
      {
        len = strcspn (line, "{}@,:\t.\n\f");
        current = merge_text (current, line, len, 0);
        line += len;
      }
    }
  else /*  End of line */
    {
      debug_nonl ("C|END LINE ");
      debug_parser_print_element (current, 1); debug ("");

      if (*line == '\n')
        {
          current = merge_text (current, "\n", 1, 0);
          line++;
        }
      else
        {
          if (input_number > 0)
            bug_message ("Text remaining without normal text but `%s'", line);
        }

      /* '@end' is processed in here. */
      current = end_line (current);

      /* we can only be in an ignored format_raw if we are directly in
          the command, as a rawpreformatted container is immediatly added
          in a non ignored format_raw */
      if (command_flags(current) & CF_block
          && parsed_command_data(current->e.c->cmd).data == BLOCK_format_raw)
        {
          process_ignored_raw_format_block_contents (current, &line);
        }
      /* @ignore and @verbatim followed by an end of line
         and ignored conditionals */
      else if (command_flags(current) & CF_block
          && (parsed_command_data(current->e.c->cmd).data == BLOCK_raw
             || parsed_command_data(current->e.c->cmd).data == BLOCK_conditional))
        {
          process_raw_block_contents (current, &line);
        }
      else
        retval = GET_A_NEW_LINE;
    }

funexit:
  *current_inout = current;
  *line_inout = line;
  return retval;
}

/* Check for a #line directive. */
static int
check_line_directive (ELEMENT *current, const char *line)
{
  int line_no = 0;
  int status = 0;
  char *parsed_filename;

  if (!global_parser_conf->cpp_line_directives)
    return 0;

  /* Check input is coming directly from a file. */
  if (!current_source_info.file_name || !current_source_info.file_name
      || (current_source_info.macro && *current_source_info.macro))
    return 0;

  parsed_filename = parse_line_directive (line, &status, &line_no);
  if (status)
    {
      SOURCE_MARK *source_mark = new_source_mark (SM_type_line_directive);
      save_line_directive (line_no, parsed_filename);
      free (parsed_filename);

      source_mark->line = strdup (line);
      register_source_mark (current, source_mark);

      return 1;
    }
  return 0;
}

/* Starting point for adding to the tree is CURRENT_ELT.
  */
void
parse_texi (ELEMENT *current_elt)
{
  ELEMENT *current = current_elt;
  static char *allocated_line;
  const char *line;
  int status = STILL_MORE_TO_PROCESS;
  enum context top_context;

  /* Read input file line-by-line. */
  while (1)
    {
      ELEMENT *e;
      int n;

      free (allocated_line);
      line = allocated_line = next_text (current);
      if (!allocated_line)
        {
          debug ("C|NEXT_LINE NO MORE");
          break; /* Out of input. */
        }

      debug_nonl ("C|NEW LINE ");
      debug_print_protected_string (line); debug ("");
      if (check_line_directive (current, line))
        continue;

      /* collect leading whitespace and save as an "ET_empty_line" element.
         This element type can be changed in 'abort_empty_line' when more
         text is read. */

      e = new_text_element (ET_empty_line);
      add_to_contents_as_array (current, e);
      n = strspn (line, whitespace_chars_except_newline);
      if (n > 0)
        {
          text_append_n (e->e.text, line, n);
          line += n;
        }

      /* Process from start of remaining line, advancing it until we run out
         of line. */
      while (1)
        {
          status = process_remaining_on_line (&current, &line);
          if (status == GET_A_NEW_LINE)
            {
              debug ("C|GET_A_NEW_LINE");
              break;
            }
          if (status == FINISHED_TOTALLY)
            {
              debug ("C|FINISHED_TOTALLY");
              goto finished_totally;
            }
          if (!line)
            {
              ELEMENT *last_element = last_contents_child (current);
              debug ("C|END LINE in line loop STILL_MORE_TO_PROCESS");
              /* If we are in an empty line, we want to end the line as usual.
                 If we are after an opening brace or comma or after an empty
                 string, there won't be any more output to abort those
                 unfinished constructs, so we call abort_empty_line here */
              if (!(last_element
                    && last_element->type == ET_empty_line
                    && last_element->e.text->end > 0))
                abort_empty_line (current);
              current = end_line (current);
              break;
            }
        }
    }
 finished_totally:

  /* Check for unclosed conditionals */
  while (conditional_stack.number > 0)
    {
      line_error ("expected @end %s",
        command_name(top_(conditional_stack) (&conditional_stack)->command));
      pop_(conditional_stack) (&conditional_stack);
    }

    {
      ELEMENT *dummy;
      current = close_commands (current, CM_NONE, &dummy, CM_NONE);

      /* Make sure we are at the very top - we could have stopped at a root
         command element (@node, @top, @section), with "document_root" still
         to go.  (This happens if the file didn't end with "@bye".) */
      while (current->e.c->parent)
        current = current->e.c->parent;
    }

  top_context = pop_context ();
  if (top_context != ct_base && top_context != ct_line)
    fatal ("base or line context expected at end of parsing");
  if (!is_context_empty ())
    {
      fprintf (stderr, "Context: %s\n", context_name (current_context ()));
      fatal ("context_stack not empty at the end");
    }

  /* Gather text after @bye */
  if (line && status == FINISHED_TOTALLY) {
    ELEMENT *element_after_bye;
    element_after_bye = new_element (ET_postamble_after_end);

    debug ("C|GATHER AFTER BYE");

    while (1)
      {
        ELEMENT *e;
        free (allocated_line);
        line = allocated_line = next_text (element_after_bye);
        if (!allocated_line)
          break; /* Out of input. */

        e = new_text_element (ET_text_after_end);
        text_append (e->e.text, line);
        add_to_contents_as_array (element_after_bye, e);
      }
    if (element_after_bye->e.c->contents.number == 0)
      destroy_element (element_after_bye);
    else
      add_to_element_contents (current, element_after_bye);
  }

  if (macro_expansion_nr > 0)
    fprintf (stderr, "BUG: at end, macro_expansion_nr > 0: %d\n",
             macro_expansion_nr);
  if (value_expansion_nr > 0)
    fprintf (stderr, "BUG: at end, value_expansion_nr > 0: %d\n",
             value_expansion_nr);
  if (input_number > 0)
    fprintf (stderr, "BUG: at end, input_number > 0: %d\n", input_number);

  /* reinitialize */
  after_end_fetch_nr = -1;

  /* update merged_in.  Only needed for merging happening after first
     index merge */
  resolve_indices_merged_in (&parsed_document->indices_info);

  set_labels_identifiers_target (&parsed_document->labels_list,
                                 &parsed_document->identifiers_target,
                                 parsed_document->sections_list.number);

  parsed_document->tree = current;

  float_list_to_listoffloats_list (&parser_float_records,
                                   &parsed_document->listoffloats);

  parsed_document = 0;
}
