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
#include "document_types.h"
#include "types_data.h"
#include "text.h"
#include "list_macros.h"
/* for fatal */
#include "base_utils.h"
#include "tree.h"
#include "builtin_commands.h"
/* non_leading_trailing_indices count_multibyte */
#include "utils.h"
#include "command_stack.h"
#include "counter.h"
#include "commands.h"
#include "debug_parser.h"
#include "errors_parser.h"
#include "source_marks.h"
#include "context_stack.h"
#include "def.h"
#include "parser.h"

/* Return CURRENT->e.c->parent.  The other arguments are used if an error
   message should be printed. */
ELEMENT *
close_brace_command (ELEMENT *current,
                     enum command_id closed_block_cmd,
                     enum command_id interrupting_cmd,
                     int missing_brace)
{
  const TEXT *verb_delimiter = 0;

  counter_pop (&count_remaining_args);

  if (parsed_command_data(current->e.c->cmd).data == BRACE_context)
    {
      if (pop_context () != ct_base)
        fatal ("base context brace command context expected");
      if (current->e.c->cmd == CM_footnote)
        nesting_context.footnote--;
      if (current->e.c->cmd == CM_caption
          || current->e.c->cmd == CM_shortcaption)
        nesting_context.caption--;
    }
  else if (current->e.c->cmd == CM_inlineraw)
    {
      if (pop_context () != ct_inlineraw)
        fatal ("inlineraw context expected");
    }
  else if (command_flags(current) & CF_math)
    {
      if (pop_context () != ct_math)
        fatal ("math context expected");
    }

  if (command_flags(current) & CF_contain_basic_inline)
    (void) pop_(command) (&nesting_context.basic_inline_stack);

  if (current->e.c->cmd == CM_verb)
    verb_delimiter = get_verb_delimiter (current);

  if (verb_delimiter)
    {
      if (missing_brace)
        {
          size_t i;
          for (i = 0; i < current->e.c->contents.number; i++)
            {
              ELEMENT *content = current->e.c->contents.list[i];
              if (content->type == ET_brace_container)
                {
                  ELEMENT *verb_delimiter_e
                    = new_text_element (ET_verb_delimiter);
                  text_append_n (verb_delimiter_e->e.text,
                                 verb_delimiter->text,
                                 verb_delimiter->end);
                  add_to_contents_as_array (content, verb_delimiter_e);
                }
            }

          command_error (current,
                      "@%s missing closing delimiter sequence: %s}",
                      command_name(current->e.c->cmd),
                      verb_delimiter->text);
        }
    }
  else
    {
      if (closed_block_cmd)
        command_error (current,
                        "@end %s seen before @%s closing brace",
                        command_name(closed_block_cmd),
                        command_name(current->e.c->cmd));
      else if (interrupting_cmd)
        command_error (current,
                        "@%s seen before @%s closing brace",
                        command_name(interrupting_cmd),
                        command_name(current->e.c->cmd));
      else if (missing_brace)
         command_error (current,
                        "@%s missing closing brace",
                        command_name(current->e.c->cmd));
    }
  current = current->e.c->parent;
  return current;
}

/* Close out any brace commands that mark text, not allowing multiple
   paragraphs. */
ELEMENT *
close_all_style_commands (ELEMENT *current,
                          enum command_id closed_block_cmd,
                          enum command_id interrupting_cmd)
{
  while (current->e.c->parent
         && (command_flags(current->e.c->parent) & CF_brace)
         && !(parsed_command_data(current->e.c->parent->e.c->cmd).data
                                                  == BRACE_context))
    {
      debug ("C|CLOSING(all_style_commands) @%s",
             command_name(current->e.c->parent->e.c->cmd));

      if (current->type == ET_brace_container
          || current->type == ET_brace_arg)
        {
          if (parsed_command_data(current->e.c->parent->e.c->cmd).data
                                                  == BRACE_arguments)
            isolate_leading_trailing (current, 0);
          else if (parsed_command_data(current->e.c->parent->e.c->cmd).data
                                                  == BRACE_inline)
            isolate_leading_trailing (current, 1);
        }

      current = close_brace_command (current->e.c->parent,
                           closed_block_cmd, interrupting_cmd, 1);
    }

  return current;
}

static int
is_container_empty (const ELEMENT *current)
{
  /* all kind of text elements */
  if (type_data[current->type].flags & TF_text)
    {
      if (current->e.text->end == 0)
        return 1;
    }
  else if (current->e.c->contents.number == 0)
    return 1;

  return 0;
}

/* remove an empty content that only holds source marks */
void
remove_empty_content (ELEMENT *current)
{
  ARG_INDICES arg_indices;
  int non_empty;

  non_empty = non_leading_trailing_indices (current, &arg_indices);

  if (non_empty)
    {
      size_t i = arg_indices.end;
      while (i >= arg_indices.start)
        {
          ELEMENT *child_element = current->e.c->contents.list[i];
          if (!(!(type_data[child_element->type].flags & TF_text)
                && child_element->e.c->cmd)
              && is_container_empty (child_element))
            {
              ELEMENT *destination;
              size_t additional_length = 0;
              if (i > 0)
                {
                  destination = current->e.c->contents.list[i -1];
                  if (type_data[destination->type].flags & TF_text)
                    additional_length
                      = count_multibyte (destination->e.text->text);
                }
              else
                destination = current;
              transfer_source_marks (child_element, destination,
                                     additional_length);

              debug_nonl ("C|REMOVE empty child ");
              debug_parser_print_element (child_element, 0);
              debug_nonl (" from ");
              debug_parser_print_element (current, 0); debug ("");
              destroy_element (remove_from_contents (current, i));
            }
          else
            break;

          if (i == 0)
            break;
          else
            i--;
        }
    }
}

/* this should only be called for non @-command elements otherwise
   empty command elements will be removed */
ELEMENT *
close_container (ELEMENT *current)
{
  int source_marks_nr = 0;
  ELEMENT *element_to_remove;

  remove_empty_content (current);

  if (current->type == ET_paragraph)
    if (pop_context () != ct_paragraph)
      fatal ("paragraph context expected");

  /* keep the element if not empty */
  if (! is_container_empty (current))
    return current->e.c->parent;

  if (current->source_mark_list)
    source_marks_nr = current->source_mark_list->number;
  debug_nonl ("C|CONTAINER EMPTY ");
  debug_parser_print_element (current, 1);
  debug_nonl (" (%d source marks)", source_marks_nr); debug ("");

  /* Keep the element if there are source marks */
  if (current->source_mark_list)
    return current->e.c->parent;

  element_to_remove = current;
  current = current->e.c->parent;

  debug_nonl ("C|REMOVE empty type ");
  debug_parser_print_element (element_to_remove, 1); debug ("");

  destroy_element (pop_element_from_contents (current));

  return current;
}

void
close_command_cleanup (ELEMENT *current)
{
  if (!current->e.c->cmd)
    return;

  if (current->e.c->cmd == CM_multitable)
    {
      int in_head_or_rows = -1;
      size_t i;
      ELEMENT_LIST old_contents = current->e.c->contents;

      /* Clear current contents. */
      memset (&current->e.c->contents, 0, sizeof (ELEMENT_LIST));

      /* Rearrange the contents of the multitable to collect rows into
         ET_multitable_head and ET_multitable_body elements. */
      for (i = 0; i < old_contents.number; i++)
        {
          ELEMENT *row = old_contents.list[i];

          if (row->type == ET_row)
            {
              int counter_index = counter_remove_element (&count_cells, row);
              if (counter_index < 0)
                fprintf (stderr, "BUG: could not remove row counter\n");
              /* Check if we need to open a new container. */
              if (row->e.c->contents.list[0]->e.c->cmd == CM_headitem)
                {
                  if (in_head_or_rows <= 0)
                    {
                      add_to_element_contents (current,
                                        new_element (ET_multitable_head));
                      in_head_or_rows = 1;
                    }
                }
              else if (row->e.c->contents.list[0]->e.c->cmd == CM_item)
                {
                  if (in_head_or_rows == 1 || in_head_or_rows == -1)
                    {
                      add_to_element_contents (current,
                                        new_element (ET_multitable_body));
                      in_head_or_rows = 0;
                    }
                }

              add_to_element_contents (last_contents_child (current), row);
            }
          else
            {
              add_to_element_contents (current, row);
              in_head_or_rows = -1;
            }
        }
      free (old_contents.list);

    }
  else if (current->e.c->cmd == CM_itemize || current->e.c->cmd == CM_enumerate)
    {
      counter_pop (&count_items);
    }

  /* Put everything after the last @def*x command in a def_item type
     container. */
  if (parsed_command_data(current->e.c->cmd).flags & CF_def
      || current->e.c->cmd == CM_defblock)
    {
      gather_def_item (current, 0);
    }

  if (current->e.c->cmd == CM_table
      || current->e.c->cmd == CM_ftable
      || current->e.c->cmd == CM_vtable)
    {
      /* > 1 for the arguments_line */
      if (current->e.c->contents.number > 1)
        gather_previous_item (current, CM_NONE);
    }

  /* Block commands that contain @item's - e.g. @multitable, @table,
     @itemize. */
  if (parsed_command_data(current->e.c->cmd).flags & CF_blockitem
      /* > 1 for the arguments_line */
      && current->e.c->contents.number > 1
      && current->e.c->contents.list[1]->type == ET_before_item)
    {
      const ELEMENT *before_item = current->e.c->contents.list[1];

      /* If the ET_before_item is empty, remove it.  Note that the
         some before_item content could also have been reparented in
         gather_previous_item */
      if (is_container_empty (before_item)
          && !before_item->source_mark_list)
        {
          /* remove empty before_item, leaving out the arguments_line */
          ELEMENT *removed = remove_from_contents (current, 1);
          destroy_element (removed);
        }
      else /* Non-empty ET_before_item */
        {
          /* The elements that can appear right in a block item command
             besides before_item are either an @*item or are associated
             with items */
          /* arguments_line is the first content */
          if (current->e.c->contents.number == 2)
            {
       /* no @*item, only before_item.  Warn if before_item is not empty */
              int empty_before_item = 1;
              size_t i;
              /* Check if contents consist solely of @comment's. */
              for (i = 0; i < before_item->e.c->contents.number; i++)
                {
                  ELEMENT *content = before_item->e.c->contents.list[i];
                /* content can be spaces text element such as empty_line */
                  if (!(!(type_data[content->type].flags & TF_text)
                        && (content->e.c->cmd == CM_c
                            || content->e.c->cmd == CM_comment)))
                    {
                      empty_before_item = 0;
                      break;
                    }
               }

              if (!empty_before_item)
                {
                  command_warn (current, "@%s has text but no @item",
                            command_name(current->e.c->cmd));
                }
            }
        }
    }
}

void
pop_block_command_contexts (enum command_id cmd)
{
  if (parsed_command_data(cmd).flags & CF_preformatted
       || parsed_command_data(cmd).data == BLOCK_menu)
    {
      if (pop_context () != ct_preformatted)
        fatal ("preformatted context expected");
    }
  else if (parsed_command_data(cmd).data == BLOCK_format_raw)
    {
      if (pop_context () != ct_rawpreformatted)
        fatal ("rawpreformatted context expected");
    }
  else if (cmd == CM_displaymath)
    {
      if (pop_context () != ct_math)
        fatal ("math context expected");
    }
  else if (parsed_command_data(cmd).data == BLOCK_region)
    {
      (void) pop_(command) (&nesting_context.regions_stack);
    }
}

void
close_ignored_block_conditional (ELEMENT *current)
{
  SOURCE_MARK *source_mark
    = new_source_mark (SM_type_ignored_conditional_block);
  ELEMENT *conditional = pop_element_from_contents (current);

  conditional->e.c->parent = 0;
  source_mark->element = conditional;
  register_source_mark (current, source_mark);
}

ELEMENT *
close_current (ELEMENT *current,
               enum command_id closed_block_cmd,
               enum command_id interrupting_cmd)
{
  /* Element is a command */
  if (current->e.c->cmd)
    {
      enum command_id cmd = current->e.c->cmd;
      debug ("C|CLOSING(close_current) @%s", command_name(cmd));
      if (command_flags(current) & CF_brace)
        {
          current = close_brace_command (current, closed_block_cmd,
                                         interrupting_cmd, 1);
        }
      else if (command_flags(current) & CF_block)
        {
          if (closed_block_cmd)
            {
              line_error ("`@end' expected `%s', but saw `%s'",
                          command_name(cmd),
                          command_name(closed_block_cmd));
            }
          else if (interrupting_cmd)
            {
              line_error ("@%s seen before @end %s",
                          command_name(interrupting_cmd),
                          command_name(cmd));
            }
          else
            {
              line_error_ext (MSG_error, 0, &current->e.c->source_info,
                              "no matching `@end %s'",
                              command_name(cmd));

            }
          pop_block_command_contexts (cmd);
          current = current->e.c->parent;
          /* In ignored conditional. */
          if (parsed_command_data(cmd).data == BLOCK_conditional)
            close_ignored_block_conditional (current);
        }
      else
        {
          /* @item and @tab commands are closed here, as well as line commands
             with invalid content. */
          current = current->e.c->parent;
        }
    }
  else if (current->type != ET_NONE)
    {
      ELEMENT *close_brace;

      debug ("C|CLOSING type %s", type_data[current->type].name);

      switch (current->type)
        {
        case ET_balanced_braces:
          close_brace = new_text_element (ET_normal_text);
          command_error (current, "misplaced {");
          /* We prefer adding an element to merging because we may
             be at the end of the document after an empty line we
             do not want to modify */
          /* current = merge_text (current, "}", 0); */
          text_append_n (close_brace->e.text, "}", 1);
          add_to_contents_as_array (current, close_brace);
          current = current->e.c->parent;
          break;
        case ET_bracketed_arg:
          command_error (current, "misplaced {");
          isolate_leading_trailing (current, 0);
          current = current->e.c->parent;
          break;
        case ET_line_arg:
          current = end_line_misc_line (current);
          break;
        case ET_block_line_arg:
          current = end_line_starting_block (current);
          break;
        default:
          current = close_container (current);
          break;
        }
    }
  else
    {
      /* should never get here */
      fprintf (stderr, "BUG: closing container without type\n");
      if (current->e.c->parent)
        current = current->e.c->parent;
    }

  return current;
}

/* Return lowest level ancestor of CURRENT containing a CLOSED_BLOCK_COMMAND
   element, or the lowest level ancestor if CLOSED_BLOCK_COMMAND is 0.
   Set CLOSED_BLOCK_ELEMENT to the last closed element.  INTERRUPTING is used
   in close_brace_command to display an error message.  Remove a context from
   context stack if CLOSED_BLOCK_COMMAND is not 0 and a context was added
   by the CLOSED_BLOCK_COMMAND.
   CLOSED_BLOCK_COMMAND should be the id of a block command.
 */
ELEMENT *
close_commands (ELEMENT *current, enum command_id closed_block_cmd,
                ELEMENT **closed_element, enum command_id interrupting_cmd)
{
  *closed_element = 0;

  /* should correspond to a bogus brace @-commands without argument
     followed by spaces only, and not by newline, at the end of the document
   */
  if (command_flags(current) & CF_brace)
    {
      line_error ("@%s expected braces",
                  command_name(current->e.c->cmd));
      current = current->e.c->parent;
    }

  current = end_paragraph_preformatted (current, closed_block_cmd,
                                        interrupting_cmd);

  while (current->e.c->parent
         && (!closed_block_cmd || current->e.c->cmd != closed_block_cmd)
     /* Stop if in a root command. */
         && !(current->e.c->cmd && command_flags(current) & CF_root)
     /* Stop if at a type at the root */
         && !(current->type == ET_before_node_section))
    {
      close_command_cleanup (current);
      current = close_current (current, closed_block_cmd, interrupting_cmd);
    }

  if (closed_block_cmd && current->e.c->cmd == closed_block_cmd)
    {
      pop_block_command_contexts (current->e.c->cmd);
      *closed_element = current;
      current = current->e.c->parent;

      if (parsed_command_data((*closed_element)->e.c->cmd).data
                                                         == BLOCK_conditional)
        /* In ignored conditional. */
        close_ignored_block_conditional (current);
    }
  else
    {
      if (closed_block_cmd)
        line_error ("unmatched `@end %s'", command_name(closed_block_cmd));
      if (! ((current->e.c->cmd && command_flags(current) & CF_root)
             || (current->type == ET_before_node_section)
             || (current->type == ET_root_line)
             || (current->type == ET_document_root)))
        {
          debug_nonl ("C|close_commands unexpectedly stopped ");
          debug_parser_print_element (current, 1); debug ("");
        }
    }

  return current;
}
