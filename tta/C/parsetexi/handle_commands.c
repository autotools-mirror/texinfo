/* handle_commands.c -- what to do when a command name is first read */
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

#include "command_ids.h"
#include "element_types.h"
#include "source_mark_types.h"
#include "tree_types.h"
#include "types_data.h"
#include "text.h"
#include "list_macros.h"
/* isascii_alnum fatal */
#include "base_utils.h"
#include "tree.h"
#include "extra.h"
#include "builtin_commands.h"
/* for whitespace_chars read_flag_len item_line_parent
   element_value_equivalent */
#include "utils.h"
#include "manipulate_tree.h"
#include "command_stack.h"
/* for global_parser_conf */
#include "parser_conf.h"
#include "counter.h"
#include "commands.h"
#include "context_stack.h"
#include "debug_parser.h"
#include "errors_parser.h"
#include "input.h"
/* lookup_infoenclose */
#include "macro.h"
/* parsed_document read_comment read_command_name
   STILL_MORE_TO_PROCESS end_line register_global_command count_items
   close_commands ... */
#include "parser.h"
#include "def.h"
#include "handle_commands.h"

/* Return a containing @itemize or @enumerate if inside it. */
static ELEMENT *
item_container_parent (const ELEMENT *current)
{
  if ((current->e.c->cmd == CM_item
       || current->type == ET_before_item)
      && current->e.c->parent
      && ((current->e.c->parent->e.c->cmd == CM_itemize
           || current->e.c->parent->e.c->cmd == CM_enumerate)))
    {
      return current->e.c->parent;
    }
  return 0;
}

/* Check that there are no text holding environments (currently
   checking only paragraphs and non empty preformatted) in contents. */
int
check_no_text (const ELEMENT *current)
{
  int after_paragraph = 0;
  size_t i, j;
  for (i = 0; i < current->e.c->contents.number; i++)
    {
      enum element_type t;
      ELEMENT *f;
      f = current->e.c->contents.list[i];
      t = f->type;
      if (t == ET_paragraph)
        {
          after_paragraph = 1;
          break;
        }
      else if (t == ET_preformatted)
        {
          for (j = 0; j < f->e.c->contents.number; j++)
            {
              ELEMENT *g = f->e.c->contents.list[j];
              /* text should be normal_text */
              if ((type_data[g->type].flags & TF_text
                   && g->e.text->end > 0
                   && g->e.text->text[strspn
                                       (g->e.text->text, whitespace_chars)])
                  /* empty_line text is possible */
                  || (!(type_data[g->type].flags & TF_text)
                      && g->e.c->cmd != CM_c
                      && g->e.c->cmd != CM_comment
                      && g->type != ET_index_entry_command))
                {
                  after_paragraph = 1;
                  break;
                }
            }
          if (after_paragraph)
            break;
        }
    }
  return after_paragraph;
}

int
in_paragraph (ELEMENT *current)
{
  while (current->e.c->parent
         && (command_flags(current->e.c->parent) & CF_brace)
         && !(parsed_command_data(current->e.c->parent->e.c->cmd).data
                                                 == BRACE_context))
    {
      current = current->e.c->parent->e.c->parent;
    }
  if (current->type == ET_paragraph)
    return 1;
  else
    return 0;
}

/* Return end of argument before comment and whitespace. */
static const char *
skip_to_comment (const char *text, int *has_comment)
{
  const char *q = text;
  const char *q1;

  while (1)
    {
      q1 = strstr (q, "@c");
      if (!q1)
        {
          q = q + strlen (q);
          break;
        }

      /* q is advanced to after @c/@comment, whether there is indeed
         a comment or not.  In case there is no @c/@comment, this allows
         to advance on the line and loop to search again for @c/@comment */
      q = read_comment (q1, has_comment);
      if (*has_comment)
        {
          /* replace q at the start of the comment */
          q = q1;
          break;
        }
    }

  return q;
}

/* Return end of argument before comment and whitespace. */
static const char *
skip_to_argument_end (const char *text, int *has_comment)
{
  const char *q = skip_to_comment (text, has_comment);

  /* q is now either at the end of the string, or at the start of a comment.
     Find the start of any trailing whitespace. */
  while (strchr (whitespace_chars, q[-1]))
    q--;

  return q;
}

/* Return end of argument before comment and whitespace if the
   line is followed either by whitespaces or a comment. */
const char *
skip_to_comment_if_comment_or_spaces (const char *after_argument,
                                      int *has_comment)
{
  const char *r = skip_to_argument_end (after_argument, has_comment);

  if (!strchr (whitespace_chars, *after_argument)
      && *after_argument != '@')
    return 0;

  if (*after_argument == '@')
    {
      /* Check for a comment, e.g. "@set flag@c comment" */
      if (after_argument != r)
        return 0;
    }
  return r;
}

/* Process argument to raw line command. */
static STRING_LIST *
parse_rawline_command (const char *line, enum command_id cmd,
                       const char **comment_text)
{
#define ADD_ARG(string, len) do { \
  tmp_string = strndup (string, len); \
  add_string (args, tmp_string); \
  free (tmp_string); \
} while (0)
  char *tmp_string;
  STRING_LIST *args = 0;
  const char *p = 0;
  const char *q = 0;
  const char *r = 0;
  char *value = 0;

  *comment_text = 0;
  int has_comment = 0;

  switch (cmd)
    {
    case CM_set:
      {
      p = line;
      p += strspn (p, whitespace_chars);
      if (!*p)
        goto set_no_name;
      if (!isascii_alnum (*p) && *p != '-' && *p != '_')
        goto set_invalid;
      q = strpbrk (p,
                   " \t\f\r\n"       /* whitespace */
                   "{\\}~^+\"<>|@"); /* other bytes that aren't allowed */
      if (q)
        {
        /* see also read_flag_len function in utils.c */
          r = skip_to_comment_if_comment_or_spaces (q, &has_comment);
          if (!r)
            goto set_invalid;
        }
      else /* very specific case of end of text fragment after name
              without anything following the name, in particular
              without new line */
        q = p + strlen (p);

      args = new_string_list ();
      ADD_ARG(p, q - p); /* name */

      p = q + strspn (q, whitespace_chars);
      /* Actually, whitespace characters except form feed. */

      if (r >= p)
        ADD_ARG(p, r - p); /* value */
      else
        ADD_ARG("", 0);

      store_parser_value_parsed_document (args->list[0],
                                          args->list[1]);

      if (has_comment)
        *comment_text = r + strspn(r, whitespace_chars);

      break;
    set_no_name:
      line_error ("@set requires a name");
      break;
    set_invalid:
      line_error ("bad name for @set");
      break;
      }
    case CM_clear:
      {
      char *flag = 0;
      size_t flag_len;
      p = line;
      p += strspn (p, whitespace_chars);
      if (!*p)
        goto clear_no_name;
      q = p;
      flag_len = read_flag_len (p);
      if (!flag_len)
        goto clear_invalid;
      q = p + flag_len;
      r = skip_to_comment_if_comment_or_spaces (q, &has_comment);
      if (!r || r != q)
        goto clear_invalid; /* Trailing argument. */

      args = new_string_list ();
      ADD_ARG (p, flag_len);
      flag = strndup (p, flag_len);
      clear_parser_value_parsed_document (flag);
      free (flag);

      if (has_comment)
        *comment_text = r + strspn(r, whitespace_chars);

      break;
    clear_no_name:
      line_error ("@clear requires a name");
      break;
    clear_invalid:
      free (flag);
      line_error ("bad name for @clear");
      break;
      }
    case CM_unmacro:
      p = line;
      p += strspn (p, whitespace_chars);
      if (!*p)
        goto unmacro_noname;
      q = p;
      value = read_command_name (&q);
      if (!value)
        goto unmacro_badname;
      r = skip_to_comment_if_comment_or_spaces (q, &has_comment);
      if (!r || r != q)
        goto unmacro_badname; /* Trailing argument. */
      delete_macro (value);
      args = new_string_list ();
      ADD_ARG(value, q - p);
      debug ("C|UNMACRO %s", value);
      free (value);

      if (has_comment)
        *comment_text = r + strspn(r, whitespace_chars);

      break;
    unmacro_noname:
      line_error ("@unmacro requires a name");
      break;
    unmacro_badname:
      line_error ("bad name for @unmacro");
      break;
    default:
      break;
    }

  return args;
#undef ADD_ARG
}

/* symbol skipspace other */
ELEMENT *
handle_other_command (ELEMENT *current, const char **line_inout,
                     enum command_id cmd, int *status,
                     ELEMENT **command_element)
{
  ELEMENT *command_e = 0;
  const char *line = *line_inout;
  int arg_spec;

  *status = STILL_MORE_TO_PROCESS;

  arg_spec = parsed_command_data(cmd).data;
  if (arg_spec != NOBRACE_skipspace)
    {
      command_e = new_command_element (cmd);
      add_to_element_contents (current, command_e);
      if (parsed_command_data(cmd).flags & CF_in_heading_spec
          && (nesting_context.basic_inline_stack_on_line.number <= 0
              || !(parsed_command_data(
          *top_(command) (&nesting_context.basic_inline_stack_on_line)).flags
                    & CF_heading_spec)))

        {
          line_error ("@%s should only appear in heading or footing",
                      command_name(cmd));
        }

      if (arg_spec == NOBRACE_symbol)
        {
          if (cmd == CM_BACKSLASH && current_context () != ct_math)
            {
              line_warn ("@\\ should only appear in math context");
            }
          if (cmd == CM_NEWLINE)
            {
              if (current_context () == ct_line
                  && top_context_command () != CM_NONE)
                line_warn ("@ should not occur at end of argument "
                           "to line command");
              current = end_line (current);
              *status = GET_A_NEW_LINE;
            }
        }
      else  /* NOBRACE_other */
        {
          register_global_command (command_e, 0);
          if (close_preformatted_command (cmd))
            current = begin_preformatted (current);
        }
    }
  else
    {
      ELEMENT *ignorable_spaces;
      size_t len;

      /* @item can occur in several contents: in an @itemize, a @table, or
         a @multitable. */
      if (cmd == CM_item || cmd == CM_headitem || cmd == CM_tab)
        {
          ELEMENT *parent;

          /* @itemize or @enumerate */
          if ((parent = item_container_parent (current)))
            {
              if (cmd == CM_item)
                {
                  debug ("C|ITEM CONTAINER");
                  counter_inc (&count_items);
                  command_e = new_command_element (cmd);

                  add_extra_integer (command_e, AI_key_item_number,
                                     counter_value (&count_items, parent));

                  add_to_element_contents (parent, command_e);
                  current = command_e;
                }
              else
                {
                  line_error ("@%s not meaningful inside `@%s' block",
                              command_name(cmd),
                              command_name(parent->e.c->cmd));
                }
              current = begin_preformatted (current);
            }
          /* @table, @vtable, @ftable */
          else if ((parent = item_line_parent (current)))
            {
              line_error ("@%s not meaningful inside `@%s' block",
                          command_name(cmd),
                          command_name(parent->e.c->cmd));
              current = begin_preformatted (current);
            }
          /* In a @multitable */
          else if ((parent = item_multitable_parent (current)))
            {
              int status;
          /* no need to check status, as max_columns would be set to 0 if
             is was not found, which is correct.  max_columns not found is
             not possible, anyway, so it does not matter at all. */
              int max_columns = lookup_extra_integer (parent,
                                          AI_key_max_columns, &status);
              if (max_columns == 0)
                {
                  line_warn ("@%s in empty multitable",
                             command_name(cmd));
                }
              else if (cmd == CM_tab)
                {
                  ELEMENT *row;
                  row = last_contents_child (parent);
                  if (row->type == ET_before_item)
                    line_error ("@tab before @item");
                  else if (counter_value (&count_cells, row)
                           >= max_columns)
                    {
                      line_error ("too many columns in multitable item"
                                  " (max %d)", max_columns);
                    }
                  else
                    {
                      counter_inc (&count_cells);
                      command_e = new_command_element (cmd);
                      add_to_element_contents (row, command_e);
                      current = command_e;
                      debug ("C|TAB");

                      add_extra_integer (current, AI_key_cell_number,
                                         counter_value (&count_cells, row));
                    }
                }
              else /* @item or @headitem */
                {
                  ELEMENT *row;

                  debug ("C|ROW");
                  row = new_element (ET_row);
                  add_to_element_contents (parent, row);

                  /* Note that the "row_number" extra value
                     isn't actually used anywhere at present. */
                  /* -2 because of the 'arguments_line' */
                  add_extra_integer (row, AI_key_row_number,
                                     parent->e.c->contents.number - 2);

                  command_e = new_command_element (cmd);
                  add_to_element_contents (row, command_e);
                  current = command_e;

                  counter_push (&count_cells, row, 1);
                  add_extra_integer (current, AI_key_cell_number,
                                     counter_value (&count_cells, row));
                }
              current = begin_preformatted (current);
            } /* In @multitable */
          else if (cmd == CM_tab)
            {
              line_error ("ignoring @tab outside of multitable");
              current = begin_preformatted (current);
            }
          else
            {
              line_error ("@%s outside of table or list",
                          command_name(cmd));
              current = begin_preformatted (current);
            }
          if (command_e)
            command_e->e.c->source_info = current_source_info;
        }
      else
        {
          command_e = new_command_element (cmd);
          command_e->e.c->source_info = current_source_info;
          add_to_element_contents (current, command_e);
          if ((cmd == CM_indent || cmd == CM_noindent)
               && in_paragraph (current))
            {
              line_warn ("@%s is useless inside of a paragraph",
                         command_name(cmd));
            }
        }

      /* Add an "ET_ignorable_spaces_after_command" element containing the
         whitespace at the beginning of the rest of the line after skipspaces
         commands, if COMMAND is 0. */
      ignorable_spaces = new_text_element (ET_ignorable_spaces_after_command);
      add_to_contents_as_array (current, ignorable_spaces);

      len = strspn (line, whitespace_chars_except_newline);
      text_append_n (ignorable_spaces->e.text, line, len);
      line += len;
    }

  *line_inout = line;
  *command_element = command_e;
  return current;
}

static ELEMENT *
new_element_at_begin_reloc (ELEMENT *text_element, size_t leading_len,
                            enum element_type type)
{
  ELEMENT *new_e = new_text_element (type);
  char *text_text = strdup (text_element->e.text->text);
  size_t text_len = text_element->e.text->end;

  text_reset (text_element->e.text);
  text_append_n (text_element->e.text, text_text + leading_len,
                 text_len - leading_len);

  text_append_n (new_e->e.text, text_text, leading_len);

  free (text_text);

  if (text_element->source_mark_list)
    {
      size_t i;
      size_t leading_len = count_multibyte (new_e->e.text->text);
      relocate_source_marks (text_element->source_mark_list, new_e,
                             0, leading_len);
      if (text_element->source_mark_list->number > 0)
        {
          for (i = 0; i < text_element->source_mark_list->number; i++)
            text_element->source_mark_list->list[i]->position -= leading_len;
        }
      else
        destroy_element_empty_source_mark_list (text_element);
    }
  return new_e;
}

static void
raw_line_command_arg_spaces (ELEMENT *text_element, ELEMENT *line_args)
{
  size_t spaces_len;

  /* should only happen if there is nothing after the @-command, not
     even a new line.  Example in tests, misc_commands.t comment_without_line
   */
  if (text_element->e.text->end == 0)
    return;

  if (text_element->e.text->text[text_element->e.text->end -1] == '\n')
    {
      ELEMENT *spaces_after = new_text_element (ET_spaces_after_argument);

      text_element->e.text->text[text_element->e.text->end -1] = '\0';
      text_element->e.text->end--;

      text_append_n (spaces_after->e.text, "\n", 1);
      add_to_contents_as_array (line_args, spaces_after);
    }
  spaces_len = strspn (text_element->e.text->text, whitespace_chars);
  if (spaces_len > 0)
    {
      ELEMENT *spaces_before = new_element_at_begin_reloc (text_element,
                                 spaces_len, ET_spaces_before_argument);
      insert_into_contents_as_array (line_args, spaces_before, 0);
    }
}

static void
add_comment_at_end (ELEMENT *line_args, ELEMENT *text_element,
                    const char *input_comment_cmd_text)
{
  size_t comment_byte_len = strlen (input_comment_cmd_text);
  size_t command_len;
  size_t comment_len;
  int has_comment = 0;
  enum command_id cmd;
  ELEMENT *comment_e;
  ELEMENT *comment_line_args = new_element (ET_line_arg);
  ELEMENT *comment_text_element = new_text_element (ET_rawline_text);
  const char *argument_text;
  char *comment_cmd_text = strndup (input_comment_cmd_text, comment_byte_len);
  if (comment_cmd_text[comment_byte_len -1] == '\n')
    {
      comment_cmd_text[comment_byte_len -1] = '\0';
      comment_byte_len--;
    }
  if (text_element->source_mark_list)
    comment_len = count_multibyte (comment_cmd_text);

  if (text_element->e.text->text[text_element->e.text->end -1] == '\n')
    {
      char *tmp_str;

      text_element->e.text->text[text_element->e.text->end -1] = '\0';
      text_element->e.text->end--;

      xasprintf (&tmp_str, "%s\n", comment_cmd_text);
      free (comment_cmd_text);
      comment_cmd_text = tmp_str;
    }
  argument_text = read_comment (comment_cmd_text, &has_comment);

  if (!has_comment)
    bug ("add_comment_at_end: unexpected no comment\n");

  command_len = argument_text - comment_cmd_text;
  if (command_len < 4)
    cmd = CM_c;
  else
    cmd = CM_comment;

  comment_e = new_command_element (cmd);
  add_to_element_contents (comment_e, comment_line_args);
  add_to_contents_as_array (comment_line_args, comment_text_element);

  text_append (comment_text_element->e.text, argument_text);
  free (comment_cmd_text);

  /* remove comment text from initial text and relocate source marks */
  if (text_element->source_mark_list)
    {
      /* the source marks are first relocated with the leading
         @c/@comment string */
      size_t text_len = count_multibyte (text_element->e.text->text);
      relocate_source_marks (text_element->source_mark_list,
                             comment_text_element,
                             text_len - comment_len, comment_len);
      destroy_element_empty_source_mark_list (text_element);

      /* now remove the leading comment @-command to keep only comment
         command argument */
      if (comment_text_element->source_mark_list)
        {
          size_t i;
          for (i = 0; i < comment_text_element->source_mark_list->number; i++)
            {
              SOURCE_MARK *s_mark
                 = comment_text_element->source_mark_list->list[i];
              if (s_mark->position < command_len)
                s_mark->position = 0;
              else
                s_mark->position -= command_len;
            }
        }
    }
  text_element->e.text->text[
      text_element->e.text->end - comment_byte_len] = '\0';
  text_element->e.text->end -= comment_byte_len;

  raw_line_command_arg_spaces (comment_text_element, comment_line_args);

  add_to_element_contents (line_args, comment_e);
}

/* STATUS is set to GET_A_NEW_LINE if we should get a new line after this,
   to FINISHED_TOTALLY if we should stop processing completely. */
/* data_cmd (used for the information on the command) and cmd (for the
   command name) is different for the only multicategory command, @item */
ELEMENT *
handle_line_command (ELEMENT *current, const char **line_inout,
                     enum command_id cmd, enum command_id data_cmd,
                     int *status, ELEMENT **command_element)
{
  ELEMENT *command_e = 0;
  const char *line = *line_inout;
  int arg_spec;

  *status = STILL_MORE_TO_PROCESS;

  /* Root commands (like @node) and @bye */
  if (parsed_command_data(data_cmd).flags & CF_root || cmd == CM_bye)
    {
      ELEMENT *closed_elt; /* Not used */
      current = close_commands (current, 0, &closed_elt, cmd);
      /* if parse_string is called on a line with a node/section then
         it will directly be in the string document root container,
         otherwise it is not directly in the root, but in another container */
      if (current->type != ET_root_line)
        {
          current = current->e.c->parent;
          if (!current)
            fatal ("no parent element");
        }
    }

  /* Look up information about this command
     ( text line lineraw specific special ). */
  arg_spec = parsed_command_data(data_cmd).data;

  /* All the cases using the raw line.
     For some commands, the arguments are determined especially from the
     raw line, for other the line is taken as is as argument, and possibly
     later ignored for commands without arg.
   */
  if (arg_spec == LINE_lineraw)
    {
      STRING_LIST *args = 0;
      ELEMENT *line_args = new_element (ET_line_arg);
      ELEMENT *text_element = new_text_element (ET_rawline_text);
      enum command_id global_cmd = CM_NONE;
      const char *comment_text = 0;
      int ignored = 0;
      SOURCE_INFO next_source_info;

      if (cmd == CM_insertcopying)
        {
          const ELEMENT *p = current;
          while (p)
            {
              if (p->e.c->cmd == CM_copying)
                {
                  line_error ("@%s not allowed inside `@copying' block",
                              command_name(cmd));
                  ignored = 1;
                  break;
                }
              p = p->e.c->parent;
            }
        }
      /* prepare tree to gather source marks */
      add_to_contents_as_array (line_args, text_element);
      text_append (text_element->e.text, line);

      /* If the current input is the result of a macro expansion,
         it may not be a complete line.  Check for this and acquire the rest
         of the line if necessary in text_element.  It is better to
         use text_element text to hold the line because it also makes
         sure that the source marks are well positioned.
       */
      if (!strchr (line, '\n'))
        {
          char *new;
          TEXT *t = text_element->e.text;
      /* if the line is completed, the source info is not the source info
         of the command anymore, so reset the current source info after
         getting the end of the line and use next_source_info to register
         the source info for the end of the command line.
       */
          SOURCE_INFO save_src_info = current_source_info;
          while (1)
            {
              new = next_text (line_args);
              if (!new)
                break;

              text_append (t, new);
              free (new);

              if (t->text[t->end - 1] == '\n')
                break;
            }

          next_source_info = current_source_info;
          current_source_info = save_src_info;
        }
      else
        next_source_info = current_source_info;

      args = parse_rawline_command (text_element->e.text->text, cmd,
                                    &comment_text);

      if (!ignored)
        {
          command_e = new_command_element (cmd);
          add_to_element_contents (current, command_e);

          add_to_element_contents (command_e, line_args);

          if (cmd != CM_c && cmd != CM_comment
              && !text_element->e.text->text[strspn
                        (text_element->e.text->text, whitespace_chars)])
            {
  /* nothing else than spaces.  Reuse the text element as space element. */
              text_element->type = ET_spaces_before_argument;
            }
          else
            {
              if (!comment_text && parsed_command_data(data_cmd).args_number == 0)
                {
                  int has_comment = 0;
                  const char *q
                    = skip_to_comment (text_element->e.text->text,
                                       &has_comment);
                  if (has_comment)
                    comment_text = q;
                }

              if (comment_text)
                {
                  add_comment_at_end (line_args, text_element, comment_text);

                  if (!text_element->e.text->text[strspn
                            (text_element->e.text->text, whitespace_chars)])
                    {
         /* nothing else than spaces after removing the comment.  Reuse the
            text element as space element kept in info */
                      text_element->type = ET_spaces_before_argument;
                    }
                  else
                    {
                      size_t spaces_len
                        = strspn (text_element->e.text->text, whitespace_chars);
                      if (spaces_len > 0)
                        {
                          ELEMENT *spaces_before
                             = new_element_at_begin_reloc (text_element,
                                     spaces_len, ET_spaces_before_argument);
                          insert_into_contents_as_array (line_args,
                                                         spaces_before, 0);
                        }

                      if (parsed_command_data(data_cmd).args_number == 0)
                        {
                   /* For commands without argument, a bogus argument is in
                      text_element. */
                          line_warn ("remaining argument on @%s line: %s",
                                     command_name(cmd),
                                     text_element->e.text->text);
                        }
                    }
                }
              else
                {
                  raw_line_command_arg_spaces (text_element, line_args);
                  if (parsed_command_data(data_cmd).args_number == 0)
                    {
                   /* For commands without argument, a bogus argument is in
                      text_element. */
                      line_warn ("remaining argument on @%s line: %s",
                                 command_name(cmd),
                                 text_element->e.text->text);
                    }
                }
            }

          if (args)
            add_extra_string_list (command_e, AI_key_misc_args, args);

          element_value_equivalent (command_e, &global_cmd);
        }
      else
        destroy_element_and_children (line_args);

      if (cmd == CM_raisesections)
        {
          parsed_document->global_info.sections_level_modifier++;
        }
      else if (cmd == CM_lowersections)
        {
          parsed_document->global_info.sections_level_modifier--;
        }

      if (command_e)
        register_global_command (command_e, global_cmd);

      current_source_info = next_source_info;

      /* NOTE at this point, the line should be at the end of the line,
         and empty string, for instance, but it is not the case.
         This is not an error because the returned status are such
         that the returned line is ignored. */

      /* This does nothing for the command being processed, as there is
         no line context setup nor line_args, but it closes a line or block
         line @-commands the raw line command is on.  For c/comment
         this corresponds to legitimate constructs, not for other raw line
         commands.
       */
      current = end_line (current);

      if (cmd == CM_bye)
        {
          *status = FINISHED_TOTALLY;
          goto funexit;
        }

      if (close_preformatted_command (cmd))
        current = begin_preformatted (current);

      *status = GET_A_NEW_LINE;
      goto funexit;
    }
  else
    /* text, line, or specific.
       (This includes handling of "@end", which is LINE_text.) */
    {
      ELEMENT *arg;

      if (cmd == CM_item || cmd == CM_itemx)
        {
          ELEMENT *parent;
          if ((parent = item_line_parent (current)))
            {
              debug ("C|ITEM LINE %s", command_name(cmd));
              current = parent;
              gather_previous_item (current, cmd);
            }
          else
            {
              line_error ("@%s outside of table or list",
                          command_name(cmd));
              current = begin_preformatted (current);
            }
          command_e = new_command_element (cmd);
          command_e->e.c->source_info = current_source_info;
          add_to_element_contents (current, command_e);
        }
      else
        {
          /* Add to contents */

          if (parsed_command_data(cmd).flags & CF_index_entry_command)
            command_e = new_command_type_element (ET_index_entry_command, cmd,
                                                  command_name(cmd));
          else
            command_e = new_command_element (cmd);

          command_e->e.c->source_info = current_source_info;

          if (cmd == CM_nodedescription)
            {
              if (current_node)
                {
                  if (!current_node->node_descriptions)
                    current_node->node_descriptions = new_const_element_list ();
                  add_to_const_element_list (current_node->node_descriptions,
                                             command_e);
                }
            }
          else if (cmd == CM_subentry)
            {
              int subentry_level = 1;
              const ELEMENT *parent = current->e.c->parent;
              const ELEMENT *current_subentry_parent = parent;

              if (!(command_flags(parent) & CF_index_entry_command)
                  && parent->e.c->cmd != CM_subentry)
                {
                  line_warn ("@subentry should only occur in an index entry");
                }

              while (subentry_level < 3)
                {
                  if (current_subentry_parent->e.c->cmd == CM_subentry)
                    {
                       subentry_level++;
                       current_subentry_parent
                         = current_subentry_parent->e.c->parent->e.c->parent;
                    }
                  else
                    break;
                }
              if (subentry_level > 2)
                {
                  line_error
                    ("no more than two levels of index subentry are allowed");
                }
            }

          add_to_element_contents (current, command_e);

          if (parsed_command_data(data_cmd).flags & CF_sectioning_heading)
            {
              int sections_level_modifier
                = parsed_document->global_info.sections_level_modifier;
              if (sections_level_modifier)
                {
                  add_extra_integer (command_e, AI_key_level_modifier,
                                     sections_level_modifier);
                }
            }
          /* @def*x */
          else if (parsed_command_data(data_cmd).flags & CF_def)
            {
              enum command_id base_command;
              int after_paragraph;
              int appropriate_command;
              enum command_id cmdname;
              char *val;

              if (cmd == CM_defline || cmd == CM_deftypeline)
                {
                  base_command = cmd;
                  add_extra_string_dup (command_e, AI_key_original_def_cmdname,
                                        command_name(cmd));
                  add_extra_string_dup (command_e, AI_key_def_command,
                                        command_name(cmd));
                }
              else
                {
                  /* Find the command with "x" stripped from the end, e.g.
                     deffnx -> deffn. */

                  char *base_name;
                  int base_len;

                  add_extra_string_dup (command_e, AI_key_original_def_cmdname,
                                        command_name(cmd));
                  base_name = strdup (command_name(cmd));
                  base_len = strlen (base_name);
                  if (base_name[base_len - 1] != 'x')
                    fatal ("no x at end of def command name");
                  base_name[base_len - 1] = '\0';
                  base_command = lookup_command (base_name);
                  if (base_command == CM_NONE)
                    fatal ("no def base command");
                  add_extra_string (command_e, AI_key_def_command, base_name);
                }

              command_e->flags |= EF_def_line;

              cmdname = current->e.c->cmd;
              if (cmdname != CM_defblock)
                after_paragraph = check_no_text (current);
              else
                after_paragraph = 0;
              push_context (ct_def, cmd);

              /* Check txidefnamenospace flag */
              val = fetch_value ("txidefnamenospace");
              if (val)
                command_e->flags |= EF_omit_def_name_space;

              if (cmdname == base_command || cmdname == CM_defblock)
                appropriate_command = 1;
              else
                appropriate_command = 0;

              if (appropriate_command)
                {
                  ELEMENT *e = pop_element_from_contents (current);
                  /* e should be the same as command_e */
                  /* Gather an "inter_def_item" element. */
                  gather_def_item (current, cmd);
                  add_to_element_contents (current, e);
                }
              if (!appropriate_command || after_paragraph)
                {
                  /* error - deffnx not after deffn */
                  line_error ("must be after `@%s' to use `@%s'",
                               command_name(base_command),
                               command_name(cmd));
                  command_e->flags |= EF_not_after_command;
                }
            }
        }

      /* change 'current' to its last child.  This is command_e.  */
      current = last_contents_child (current);
      arg = new_element (ET_line_arg);

      if (parsed_command_data(data_cmd).flags & CF_root)
        {
          ELEMENT *arguments_line = new_element (ET_arguments_line);
          add_to_element_contents (current, arguments_line);
          add_to_element_contents (arguments_line, arg);
        }
      else /* def or line command */
        add_to_element_contents (current, arg);

      if (parsed_command_data(data_cmd).flags & CF_contain_basic_inline)
        add_(command) (&nesting_context.basic_inline_stack_on_line, cmd);

      /* LINE_specific commands arguments are handled in a specific way.
         The only other line commands that have a fixed number of arguments
         and more than one is node, so the following condition only applies
         to node */
      if (arg_spec != LINE_specific
          && parsed_command_data(data_cmd).args_number > 1)
        {
          counter_push (&count_remaining_args,
                        current,
                        parsed_command_data(data_cmd).args_number - 1);
        }
      else if (parsed_command_data(data_cmd).flags & CF_variadic)
        {
          /* Unlimited args */
          counter_push (&count_remaining_args, current,
                        COUNTER_VARIADIC);
        }
      if (cmd == CM_author)
        {
          ELEMENT *parent = current;
          int found = 0;
          while (parent->e.c->parent)
            {
              parent = parent->e.c->parent;
              enum command_id parent_cmd = parent->e.c->cmd;
              if (parent->type == ET_brace_command_context)
                break;
              if (parent_cmd == CM_titlepage
                  || parent_cmd == CM_quotation
                  || parent_cmd == CM_smallquotation
                  || parent_cmd == CM_documentinfo)
                {
                  found = 1; break;
                }
            }
          if (!found)
            line_warn ("@author not meaningful outside "
          "`@titlepage', `@documentinfo' and `@quotation' environments");
        }
      else if (cmd == CM_dircategory && current_node)
        line_warn ("@dircategory after first node");
      else if (cmd == CM_printindex && current_node)
        current_node->element->flags |= EF_isindex;


      if (parsed_command_data(data_cmd).flags & CF_def)
        current = last_contents_child (current);
      else if (parsed_command_data(data_cmd).flags & CF_root)
        {
          /* arguments_line type element */
          const ELEMENT *arguments_line = current->e.c->contents.list[0];
          if (arguments_line->type != ET_arguments_line)
            {
              bug_message (
                "root command first content is not arguments_line type: %s",
                type_data[arguments_line->type].name);

              abort ();
            }
          current = last_contents_child (arguments_line);
          push_context (ct_line, cmd);
        }
      else
        {
          current = last_contents_child (current);
      /* add 'line' to context_stack.  This will be the
         case while we read the argument on this line. */
          push_context (ct_line, cmd);
        }
    }

  if (command_e)
    register_global_command (command_e, 0);
  if (cmd == CM_dircategory)
    add_to_element_list (&parsed_document->global_commands
                                             .dircategory_direntry,
                         command_e);

funexit:
  *line_inout = line;
  *command_element = command_e;
  return current;
}

int
parser_format_expanded_p (const char *format)
{
  return format_expanded_p (global_parser_conf->expanded_formats, format);
}

/* A command name has been read that starts a multiline block, which should
   end in @end <command name>.  The block will be processed until
   "end_line_misc_line" in end_line.c processes the @end command. */
ELEMENT *
handle_block_command (ELEMENT *current, const char **line_inout,
                      enum command_id cmd, ELEMENT **command_element)
{
  const char *line = *line_inout;
  unsigned long flags = parsed_command_data(cmd).flags;
  ELEMENT *block = 0;
  ELEMENT *bla_element;   /* block line arg element */
  ELEMENT *block_line_e;

  if (parsed_command_data(cmd).data == BLOCK_menu
      && (current->type == ET_menu_comment
          || current->type == ET_menu_entry_description))
    {
      /* This is, in general, caused by @detailmenu within @menu */
      if (current->type == ET_menu_comment)
        current = close_container (current);
      else /* menu_entry_description */
        {
          current = close_container (current);
          if (current->type == ET_menu_entry)
            current = current->e.c->parent;
          else
            {
              bug_message ("menu description parent not a menu_entry: %s",
                           type_data[current->type].name);
              abort ();
            }
        }
    }

  if (flags & CF_def)
    {
      ELEMENT *def_line;
      char *val;
      block = new_command_element (cmd);
      block->e.c->source_info = current_source_info;

      def_line = new_element (ET_def_line);
      def_line->e.c->source_info = current_source_info;

      add_extra_string_dup (def_line, AI_key_def_command, command_name(cmd));
      add_extra_string_dup (def_line, AI_key_original_def_cmdname,
                            command_name(cmd));
      def_line->flags |= EF_def_line;
      /* Check txidefnamenospace flag */
      val = fetch_value ("txidefnamenospace");
      if (val)
        def_line->flags |= EF_omit_def_name_space;

      add_to_element_contents (block, def_line);
      block_line_e = def_line;
      push_context (ct_def, cmd);
    }
  else
    {
      block = new_command_element (cmd);

      if (parsed_command_data(cmd).data == BLOCK_preformatted)
        push_context (ct_preformatted, cmd);
      else if (cmd == CM_displaymath)
        push_context (ct_math, cmd);
      else if (parsed_command_data(cmd).data == BLOCK_format_raw)
        {
          push_context (ct_rawpreformatted, cmd);
        }
      else if (parsed_command_data(cmd).data == BLOCK_region)
        {
          add_(command) (&nesting_context.regions_stack, cmd);
        }
      else if (parsed_command_data(cmd).data == BLOCK_menu)
        {
          push_context (ct_preformatted, cmd);

          if (cmd == CM_direntry)
            add_to_element_list (&parsed_document->global_commands
                                                 .dircategory_direntry,
                                 block);

          if (current_node)
            {
              if (cmd == CM_direntry && global_parser_conf->show_menu)
                {
                  line_warn ("@direntry after first node");
                }
              else if (cmd == CM_menu)
                {
                  if (!(command_flags(current) & CF_root))
                    line_warn ("@menu in invalid context");
                  else
                    {
                      if (!current_node->menus)
                        current_node->menus = new_const_element_list ();
                      add_to_const_element_list (current_node->menus, block);
                    }
                }
            }
        }
      /* BLOCK_item_container */
      else if (cmd == CM_itemize || cmd == CM_enumerate)
        counter_push (&count_items, block, 0);
      /* BLOCK_other */
      else if (cmd == CM_nodedescriptionblock)
        {
          if (current_node)
            {
              if (!current_node->node_long_descriptions)
                current_node->node_long_descriptions
                                   = new_const_element_list ();
              add_to_const_element_list (current_node->node_long_descriptions,
                                         block);
            }
        }

      block_line_e = block;
      if (parsed_command_data(block_line_e->e.c->cmd).args_number > 1)
        {
          counter_push (&count_remaining_args,
                        block_line_e,
                        parsed_command_data(block_line_e->e.c->cmd).args_number - 1);
        }
      else if (parsed_command_data(block_line_e->e.c->cmd).flags & CF_variadic)
        {
          /* Unlimited args */
          counter_push (&count_remaining_args, block_line_e,
                        COUNTER_VARIADIC);
        }
      push_context (ct_line, cmd);
    }
  block->e.c->source_info = current_source_info;
  add_to_element_contents (current, block);

  bla_element = new_element (ET_block_line_arg);
  if (!(parsed_command_data(cmd).flags & CF_def))
    {
      ELEMENT *arguments = new_element (ET_arguments_line);
      add_to_element_contents (block_line_e, arguments);
      add_to_element_contents (arguments, bla_element);
    }
  else
    {
      add_to_element_contents (block_line_e, bla_element);
    }


  if (parsed_command_data(cmd).flags & CF_contain_basic_inline)
    add_(command) (&nesting_context.basic_inline_stack_block, cmd);

  register_global_command (block, 0);

  *line_inout = line;
  *command_element = block;
  return bla_element;
}

/* in that case command_element always point to the returned current
   element and therefore only one of the two could be used, but we
   prefer consistently using the same prototype as other
   handle_*_command functions */
ELEMENT *
handle_brace_command (ELEMENT *current, const char **line_inout,
                      enum command_id cmd, ELEMENT **command_element)
{
  ELEMENT *command_e;

  debug ("C|OPEN BRACE @%s", command_name(cmd));

  if (parsed_command_data(cmd).flags & CF_INFOENCLOSE)
    command_e = new_command_type_element (ET_definfoenclose_command, cmd,
                                          command_name(cmd));
  else
    command_e = new_command_element (cmd);

  /* The line number information is only ever used for brace commands
     if the command is given with braces, but it's easier just to always
     store the information. */
  command_e->e.c->source_info = current_source_info;

  add_to_element_contents (current, command_e);

  /* sortas cannot be definfoenclose'd */
  if (cmd == CM_sortas)
    {
      if (!(command_flags(current->e.c->parent) & CF_index_entry_command)
          && current->e.c->parent->e.c->cmd != CM_subentry)
        {
          line_warn ("@%s should only appear in an index entry",
                     command_name(cmd));
        }
    }
  else
    {
      if (parsed_command_data(cmd).flags & CF_INFOENCLOSE)
        {
          INFO_ENCLOSE *ie = lookup_infoenclose (cmd);
          if (ie)
            {
              add_extra_string_dup (command_e, AI_key_begin, ie->begin);
              add_extra_string_dup (command_e, AI_key_end, ie->end);
            }
        }
      else if (cmd == CM_kbd)
        {
          if (kbd_formatted_as_code ())
            {
              command_e->flags |= EF_code;
            }
        }
    }
  current = command_e;
  *command_element = command_e;
  return current;
}
