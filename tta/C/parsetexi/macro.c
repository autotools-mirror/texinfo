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

#include "text.h"
#include "element_types.h"
#include "source_mark_types.h"
#include "tree_types.h"
/* for VALUE */
#include "document_types.h"
/* bug fatal isascii_alnum */
#include "base_utils.h"
#include "tree.h"
#include "extra.h"
/* for whitespace_chars store_value clear_value wipe_values */
#include "utils.h"
#include "convert_to_texinfo.h"
/* for global_parser_conf */
#include "parser_conf.h"
#include "counter.h"
#include "commands.h"
#include "debug_parser.h"
#include "errors_parser.h"
#include "input.h"
#include "source_marks.h"
/* parsed_document read_command_name remove_empty_content
   whitespace_chars_except_newline merge_text ... */
#include "parser.h"
#include "macro.h"

static MACRO *macro_list;
static size_t macro_number;
static size_t macro_space;

static size_t free_slots_nr;



/* Macro definition. */

MACRO *
lookup_macro (enum command_id cmd)
{
  size_t i;

  for (i = 0; i < macro_number; i++)
    {
      if (macro_list[i].cmd == cmd)
        return &macro_list[i];
    }
  return 0;
}

void
new_macro (const char *name, const ELEMENT *macro)
{
  enum command_id new;
  MACRO *m = 0;

  if (global_parser_conf->no_user_commands)
    return;

  /* Check for an existing definition first for us to overwrite. */
  new = lookup_command (name);
  if (new)
    m = lookup_macro (new);

  if (!m)
    {
      size_t macro_index;
      if (free_slots_nr)
        {
          for (macro_index = 0; macro_index < macro_number; macro_index++)
            if (macro_list[macro_index].cmd == 0)
              break;
          if (macro_index == macro_number)
            bug ("free slot not found");
          free_slots_nr--;
        }
      else
        {
          if (macro_number == macro_space)
            {
              macro_list = realloc (macro_list,
                              (macro_space += 5) * sizeof (MACRO));
              if (!macro_list)
                fatal ("realloc failed");
            }
          macro_index = macro_number;
          macro_number++;
        }
      new = add_texinfo_command (name);
      m = &macro_list[macro_index];
      m->cmd = new;
      new &= ~USER_COMMAND_BIT;
      user_defined_command_data[new].flags |= CF_MACRO;
    }
  else
    {
      free (m->macro_name);
      free (m->macrobody);
    }

  m->macro_name = strdup (name);
  m->element = macro;

  m->macrobody = convert_contents_to_texinfo (macro);
}

/* CMD will be either CM_macro, CM_rmacro or CM_linemacro.  Read the line
   defining a macro's name and the arguments it takes, and return this
   information in a new ELEMENT. */
ELEMENT *
parse_macro_command_line (enum command_id cmd, const char **line_inout,
                          ELEMENT *parent)
{
  const char *line = *line_inout;
  const char *pline = line;
  ELEMENT *macro, *arguments, *macro_line;
  char *name;
  const char *args_ptr;
  STRING_LIST *formal_args;

  /* NOTE macro element is block command, but it has extra misc_args like
     lineraw line commands */
  macro = new_command_element (cmd);
  macro->e.c->source_info = current_source_info;

  arguments = new_element (ET_arguments_line);
  add_to_element_contents (macro, arguments);

  macro_line = new_text_element (ET_macro_line);
  text_append (macro_line->e.text, line);
  add_to_contents_as_array (arguments, macro_line);

  pline += strspn (pline, whitespace_chars);
  name = read_command_name (&pline);

  if (!name)
    {
      line_error ("@%s requires a name", command_name (cmd));
      macro->flags |= EF_invalid_syntax;
      return macro;
    }

  if (*pline && *pline != '{' && *pline != '@'
      && !strchr (whitespace_chars, *pline))
    {
      line_error ("bad name for @%s", command_name (cmd));
      macro->flags |= EF_invalid_syntax;
      free (name);
      return macro;
    }

  debug ("C|MACRO @%s %s", command_name (cmd), name);

  add_extra_string (macro, AI_key_macro_name, name);

  formal_args = new_string_list ();
  add_extra_string_list (macro, AI_key_formal_args, formal_args);

  args_ptr = pline;
  args_ptr += strspn (args_ptr, whitespace_chars);

  if (*args_ptr != '{')
    {
      /* Either error or no args. */
      goto check_trailing;
    }
  args_ptr++;

  while (1)
    {
      /* args_ptr is after a '{' or ','.  INDEX holds the number of
         the macro argument */

      const char *q, *q2;

      args_ptr += strspn (args_ptr, whitespace_chars);

      /* Find end of current argument. */
      q = args_ptr;
      while (*q != '\0' && *q != ',' && *q != '}')
        q++;

      if (!*q)
        {
          /* End of string reached before closing brace. */
          goto check_trailing;
        }

      /* Disregard trailing whitespace. */
      q2 = q;
      while (q2 > args_ptr && strchr (whitespace_chars, q2[-1]))
        q2--;

      if (q2 == args_ptr)
        {
          /* argument is completely whitespace */
          if (*q == ',')
            {
              line_error ("bad or empty @%s formal argument: ",
                          command_name(cmd));
              add_string (formal_args, "");
              macro->flags |= EF_invalid_syntax;
            }
        }
      else
        {
          char *args_string = strndup (args_ptr, q2 - args_ptr);
          add_string (formal_args, args_string);
          free (args_string);

          /* Check the argument name. */
            {
              const char *p;
              for (p = args_ptr; p < q2; p++)
                {
                  if (!isascii_alnum (*p) && *p != '_' && *p != '-')
                    {
                      char *formal_arg = strndup (args_ptr, q2 - args_ptr);
                      line_error ("bad or empty @%s formal argument: %s",
                                  command_name(cmd), formal_arg);
                      free (formal_arg);
                      macro->flags |= EF_invalid_syntax;
                      break;
                    }
                }
            }
        }

      args_ptr = q + 1;

      if (*q == '}')
        break;
    }

 check_trailing:
  pline = args_ptr;
  pline += strspn (pline, whitespace_chars);
  if (*pline && *pline != '@')
    {
      char *argument_str = strdup (pline);
      /* remove new line for the message */
      char *end_line = strchr (argument_str, '\n');

      if (end_line)
            *end_line = '\0';
      line_error ("bad syntax for @%s argument: %s",
                  command_name(cmd), argument_str);
      free (argument_str);
      macro->flags |= EF_invalid_syntax;
    }

  *line_inout = pline;
  return macro;
}


/* Macro use. */

/* Return index +1 into given arguments to look for the value of NAME.
   Return 0 if not found. */

static size_t
lookup_macro_parameter (const char *name, const ELEMENT *macro)
{
  size_t i;
  /* the args_list pointer is const not the ELEMENT */
  const STRING_LIST *formal_args_list = lookup_extra_string_list (macro,
                                                      AI_key_formal_args);

  /* Find 'arg' in MACRO parameters. */
  for (i = 0; i < formal_args_list->number; i++)
    {
       if (!strcmp (formal_args_list->list[i], name))
         return i+1;
    }
  return 0;
}

/* LINE points the opening brace in a macro invocation.  CMD is the command
   identifier of the macro command.  Return array of the arguments.  Return
   value to be freed by caller.  */
static void
expand_macro_arguments (const ELEMENT *macro, const char **line_inout,
                        enum command_id cmd, ELEMENT *current)
{
  const char *line = *line_inout;
  const char *pline = line;
  TEXT *arg;
  int braces_level = 1;
  size_t args_total;
  size_t args_nr = 1;
  int whitespaces_len;
  ELEMENT *argument = new_element (ET_brace_arg);
  ELEMENT *argument_content = new_text_element (ET_macro_call_arg_text);
  const STRING_LIST *formal_args_list = lookup_extra_string_list (macro,
                                                       AI_key_formal_args);

  add_to_element_contents (current, argument);
  arg = argument_content->e.text;

  args_total = formal_args_list->number;

  /* *pline is '{', advance past the open brace, start at braces_level = 1 */
  pline++;
  whitespaces_len = strspn (pline, whitespace_chars);
  if (whitespaces_len > 0)
    {
      ELEMENT *spaces_element = new_text_element (ET_spaces_before_argument);
      text_append_n (spaces_element->e.text, pline, whitespaces_len);
      pline += whitespaces_len;
      add_to_contents_as_array (argument, spaces_element);
    }
  add_to_contents_as_array (argument, argument_content);

  while (braces_level > 0)
    {
      static char *alloc_line;
      /* At the beginning of this loop pline is at the start
         of an argument. */
      const char *sep;

      sep = pline + strcspn (pline, "\\,{}");
      if (!*sep)
        {
          debug ("C|MACRO ARG end of line");
          text_append (arg, pline);
          free (alloc_line);
          line = alloc_line = next_text (argument);
          if (!line)
            {
              line_error ("@%s missing closing brace", command_name (cmd));
              remove_empty_content (argument);
              line = "\n";
              goto funexit;
            }
          pline = line;
          continue;
        }

      text_append_n (arg, pline, sep - pline);

      switch (*sep)
        {
        case '\\':
          if (!strchr ("\\{},", sep[1]))
            text_append_n (arg, sep, 1);
          else
            {
              SOURCE_MARK *escape_backslash_source_mark
                = new_source_mark (SM_type_macro_arg_escape_backslash);
              register_source_mark (argument, escape_backslash_source_mark);

            }
          if (sep[1])
            {
              text_append_n (arg, &sep[1], 1);
              pline = sep + 2;
              if (sep[1] == ',')
                line_warn ("use %s instead of %s in macro arg",
                           "@comma{}", "\\,");
            }
          else
            pline = sep + 1;
          break;
        case '{':
          braces_level++;
          text_append_n (arg, sep, 1);
          pline = sep + 1;
          break;
        case '}':
          braces_level--;
          if (braces_level > 0)
            text_append_n (arg, sep, 1);
          else
            /* end of arguments */
            remove_empty_content (argument);
          pline = sep + 1;
          break;
        case ',':
          pline = sep + 1;
          if (braces_level > 1)
            text_append_n (arg, sep, 1);
          else
            {
              if (args_nr < args_total)
                {
                  const char *p = pline;

                  remove_empty_content (argument);

                  /* new argument */
                  argument = new_element (ET_brace_arg);
                  argument_content
                    = new_text_element (ET_macro_call_arg_text);
                  add_to_element_contents (current, argument);
                  args_nr++;
                  arg = argument_content->e.text;
                  pline += strspn (pline, whitespace_chars);
                  if (pline - p)
                    {
                      ELEMENT *spaces_element
                        = new_text_element (ET_spaces_before_argument);
                      text_append_n (spaces_element->e.text, p, pline - p);
                      add_to_contents_as_array (argument, spaces_element);
                    }
                  add_to_contents_as_array (argument, argument_content);
                  debug ("C|MACRO NEW ARG");
                }
              else
                /* too many args */
                {
                  if (args_total != 1)
                    line_error ("macro `%s' called with too many args",
                                command_name(cmd));
                  text_append_n (arg, sep, 1);
                }
            }
          break;
        }
    }

  line = pline;

  if (args_total == 0
      && (args_nr > 1
          || !empty_spaces_argument (current->e.c->contents.list[0])))
    {
      line_error
        ("macro `%s' declared without argument called with an argument",
         command_name(cmd));
    }
  debug ("C|END MACRO ARGS EXPANSION");

funexit:
  *line_inout = line;
}

static void
expand_linemacro_arguments (const ELEMENT *macro, const char **line_inout,
                            enum command_id cmd, ELEMENT *current)
{
  const char *line = *line_inout;
  const char *pline = line;
  TEXT *arg;
  int braces_level = 0;
  size_t args_total;
  int spaces_nr;
  size_t i;
  ELEMENT *argument = new_element (ET_linemacro_arg);
  ELEMENT *argument_content = new_text_element (ET_macro_call_arg_text);
  const STRING_LIST *formal_args_list = lookup_extra_string_list (macro,
                                                       AI_key_formal_args);

  add_to_element_contents (current, argument);
  arg = argument_content->e.text;

  static COUNTER argument_brace_groups;
  counter_reset (&argument_brace_groups, "argument_brace_groups");
  counter_push (&argument_brace_groups, argument_content, 0);

  spaces_nr = strspn (pline, whitespace_chars_except_newline);
  if (spaces_nr)
    {
      ELEMENT *spaces_element = new_text_element (ET_spaces_before_argument);
      text_append_n (spaces_element->e.text, line, spaces_nr);
      add_to_contents_as_array (argument, spaces_element);

      pline += spaces_nr;
    }
  add_to_contents_as_array (argument, argument_content);

  args_total = formal_args_list->number;

  while (1)
    {
      static char *alloc_line;
      const char *sep;

      sep = pline + strcspn (pline, linecommand_expansion_delimiters);
      if (!*sep)
        {
          debug_nonl ("C|LINEMACRO ARGS no separator %d '", braces_level);
          debug_print_protected_string (pline); debug ("'");
          if (braces_level > 0)
            {
              text_append (arg, pline);

              free (alloc_line);
              line = alloc_line = next_text (argument);
              if (!line)
                {
                  line_error ("@%s missing closing brace", command_name (cmd));
                  line = "";
                  goto funexit;
                }
            }
          else
            {
              int text_len = strcspn (pline, "\n");
              line = pline + text_len;
              text_append_n (arg, pline, text_len);
              if (! *line)
                {
                  /* happens when @ protects the end of line, at the very end
                     of a text fragment and with macro expansion */
                  free (alloc_line);
                  line = alloc_line = next_text (argument);
                  if (!line)
                    {
                      debug ("C|LINEMACRO ARGS end no EOL");
                      line = "";
                      goto funexit;
                    }
                }
              else
                {
                  /* end of macro call with an end of line */
                  goto funexit;
                }
            }
          pline = line;
          continue;
        }

      text_append_n (arg, pline, sep - pline);

      switch (*sep)
        {
          int single_char;
          char *command;
          int whitespaces_len;
        case '@':
          pline = sep + 1;
          command = parse_command_name (&pline, &single_char);
          if (command)
            {
              enum command_id cmd = lookup_command (command);
              if (braces_level <= 0 && cmd
                  && (cmd == CM_comment || cmd == CM_c))
                {
                  line = sep;
                  free (command);
                  goto funexit;
                }
              text_append_n (arg, sep, 1);
              text_append (arg, command);
              if (cmd && (parsed_command_data(cmd).flags & CF_brace)
                  && strchr (whitespace_chars, *pline)
                  && (parsed_command_data(cmd).data == BRACE_accent
                || global_parser_conf->ignore_space_after_braced_command_name))
                {
                  int whitespaces_len = strspn (pline, whitespace_chars);
                  text_append_n (arg, pline, whitespaces_len);
                  pline += whitespaces_len;
                }
              free (command);
            }
          else
            {
              text_append_n (arg, sep, 1);
            }
          break;
        case '{':
          braces_level++;
          text_append_n (arg, sep, 1);
          pline = sep + 1;
          break;
        case '}':
          braces_level--;
          text_append_n (arg, sep, 1);
          pline = sep + 1;
          if (braces_level == 0)
            counter_inc (&argument_brace_groups);
          break;
        /* spaces */
        default:
          pline = sep;
          whitespaces_len = strspn (pline, whitespace_chars_except_newline);

          if (braces_level > 0
              || current->e.c->contents.number >= args_total)
            {
              text_append_n (arg, pline, whitespaces_len);
            }
          else
            {
              ELEMENT *spaces_element
                = new_text_element (ET_spaces_before_argument);

              argument = new_element (ET_linemacro_arg);
              argument_content
                = new_text_element (ET_macro_call_arg_text);
              counter_push (&argument_brace_groups, argument_content, 0);

              add_to_element_contents (current, argument);
              arg = argument_content->e.text;

              text_append_n (spaces_element->e.text, pline,
                             whitespaces_len);
              add_to_contents_as_array (argument, spaces_element);
              add_to_contents_as_array (argument, argument_content);
              debug ("C|LINEMACRO NEW ARG");
            }
          pline += whitespaces_len;
          break;
        }
    }

 funexit:
  for (i = 0; i < current->e.c->contents.number; i++)
    {
      const ELEMENT *argument = current->e.c->contents.list[i];
      /* If argument_content is not explicitly initialized,
         compiler may warn that argument_content may be used uninitialized,
         but we know that it is not possible, as there is textual
         content in argument.
         clang proposes to remove the "j < argument->e.c->contents.number"
         if always true.  It is safer and clearer to keep this condition,
         so initialize to remove the unknown for the compiler. 
       */
      ELEMENT *argument_content = 0;
      size_t j;
      for (j = 0; j < argument->e.c->contents.number; j++)
        {
          if (argument->e.c->contents.list[j]->type != ET_spaces_before_argument)
            {
              argument_content = argument->e.c->contents.list[j];
              break;
            }
        }
      int brace_groups_nr = counter_element_value (&argument_brace_groups,
                                                   argument_content);
      if (brace_groups_nr == 1)
        {
          int text_len = strlen (argument_content->e.text->text);
          if (argument_content->e.text->text[0] == '{'
              && argument_content->e.text->text[text_len -1] == '}')
            {
              char *braced_text = strdup (argument_content->e.text->text);
              debug_nonl ("C|TURN to bracketed %d ", i);
              debug_parser_print_element (argument_content, 0); debug ("");

              text_reset (argument_content->e.text);
              text_append_n (argument_content->e.text,
                             braced_text+1, text_len -2);
              free (braced_text);
              argument_content->type = ET_bracketed_linemacro_arg;
            }
        }
    }
  counter_reset (&argument_brace_groups, 0);
  debug ("C|END LINEMACRO ARGS EXPANSION");

  *line_inout = line;
}
/* ARGUMENTS element holds the arguments used in the macro invocation.
   EXPANDED gets the result of the expansion. */
static void
expand_macro_body (const MACRO *macro_record,
                   const CONST_ELEMENT_LIST *arguments, TEXT *expanded)
{
  size_t pos; /* Position, Index +1 into arguments. */
  const ELEMENT *macro;
  const char *macrobody;
  const char *ptext;

  macrobody = macro_record->macrobody;

  if (!macrobody)
    return;

  macro = macro_record->element;

  ptext = macrobody;
  while (1)
    {
      /* At the start of this loop ptext is at the beginning or
         just after the last backslash sequence. */

      const char *bs; /* Pointer to next backslash. */

      bs = strchrnul (ptext, '\\');
      text_append_n (expanded, ptext, bs - ptext);
      if (!*bs)
        break; /* End of body. */

      ptext = bs + 1;
      if (*ptext == '\\')
        {
          text_append_n (expanded, "\\", 1); /* Escaped backslash (\\). */
          ptext++;
        }
      else
        {
          char *name;
          bs = strchr (ptext, '\\');
          if (!bs)
            {
              /* unpaired backslash */
              text_append (expanded, ptext);
              return;
            }

          name = strndup (ptext, bs - ptext);
          pos = lookup_macro_parameter (name, macro);
          if (pos == 0)
            {
              const char *macro_name = lookup_extra_string (macro,
                                                        AI_key_macro_name);
              line_error ("\\ in @%s expansion followed `%s' instead of "
                          "parameter name or \\",
                          macro_name, name);
              text_append (expanded, "\\");
              text_append (expanded, name);
            }
          else
            {
              size_t index = pos -1;
              if (index < arguments->number)
                {
                  const ELEMENT *argument
                    = arguments->list[index];
                  if (argument)
                    {
                      int surplus_arg;
                      const TEXT *arg_text = simple_arg_text (argument,
                                                          &surplus_arg);
                  /* the argument cannot have superfluous content, as it is text
                     only, therefore a text is always returned.
                   */
                      text_append (expanded, arg_text->text);
                    }
                }
            }
          free (name);
          ptext = bs + 1;
        }
    }
}

void
unset_macro_record (MACRO *m)
{
  if (!m)
    return;

  m->cmd = 0;
  free (m->macro_name);
  m->macro_name = 0;
  free (m->macrobody);
  m->macrobody = 0;
  m->element = 0;

  /* NOTE if m->cmd was already 0, this is not an new free slot.  We assume
     that m->cmd was not already 0 and do not do an explicit check as
     all the callers should already make sure that m->cmd is not 0 (by
     finding the cmd with lookup_command and m with lookup_macro) */
  free_slots_nr++;
}

void
delete_macro (const char *name)
{
  enum command_id cmd;
  MACRO *m;
  cmd = lookup_command (name);
  if (!cmd)
    return;
  m = lookup_macro (cmd);
  unset_macro_record (m);
  remove_texinfo_command (cmd);
}

void
wipe_macros (void)
{
  size_t i;

  for (i = 0; i < macro_number; i++)
    {
      free (macro_list[i].macro_name);
      free (macro_list[i].macrobody);
    }
  macro_number = 0;
  free_slots_nr = 0;
}

/* Handle macro expansion.  CMD is the macro command.
   The returned element is an out of tree element holding the call
   arguments also associated to the macro expansion source mark */
ELEMENT *
handle_macro (ELEMENT *current, const char **line_inout,
              enum command_id cmd, enum command_id from_alias)
{
  const char *line, *p;
  MACRO *macro_record;
  const ELEMENT *macro;
  TEXT expanded;
  char *expanded_macro_text;
  size_t args_number;
  SOURCE_MARK *macro_source_mark;
  ELEMENT *macro_call_element;
  int error = 0;
  const STRING_LIST *formal_args_list;

  line = *line_inout;

  macro_record = lookup_macro (cmd);
  if (!macro_record)
    fatal ("no macro record");
  macro = macro_record->element;
  formal_args_list = lookup_extra_string_list (macro, AI_key_formal_args);

  /* It is important to check for expansion before the expansion and
     not after, as during the expansion, the text may go past the
     call.  In particular for user defined linemacro which generally
     get the final new line from following text.
  */

  macro_expansion_nr++;
  debug ("C|MACRO EXPANSION NUMBER %d %s", macro_expansion_nr,
                                           command_name(cmd));

  if (macro->e.c->cmd != CM_rmacro)
    {
      if (expanding_macro (command_name(cmd)))
        {
          line_error ("recursive call of macro %s is not allowed; "
                      "use @rmacro if needed", command_name(cmd));
          error = 1;
        }
    }

  if (global_parser_conf->max_macro_call_nesting
      && macro_expansion_nr > global_parser_conf->max_macro_call_nesting)
    {
      line_warn (
         "macro call nested too deeply "
         "(set MAX_MACRO_CALL_NESTING to override; current value %d)",
                global_parser_conf->max_macro_call_nesting);
      error = 1;
    }

  if (macro->e.c->cmd == CM_linemacro)
    {
      macro_call_element = new_command_type_element (ET_linemacro_call,
                                             CM_NONE, command_name(cmd));
      expand_linemacro_arguments (macro, &line, cmd, macro_call_element);
    }
  else
    {
      args_number = formal_args_list->number;

      p = line + strspn (line, whitespace_chars);
      if (*p == '{')
        {
          if (macro->e.c->cmd == CM_macro)
            macro_call_element = new_command_type_element (ET_macro_call,
                                             CM_NONE, command_name(cmd));
          else /* macro->e.c->cmd == CM_rmacro */
            macro_call_element = new_command_type_element (ET_rmacro_call,
                                             CM_NONE, command_name(cmd));
          if (p - line > 0)
            {
              ELEMENT *spaces_element
                = new_text_element (ET_spaces_after_cmd_before_arg);
              text_append_n (spaces_element->e.text, line, p - line);
              add_to_contents_as_array (macro_call_element, spaces_element);
            }
          line = p;
          expand_macro_arguments (macro, &line, cmd, macro_call_element);
        }
      /* Warning depending on the number of arguments this macro
         is supposed to take. */
      else if (args_number != 1)
        {
          if (args_number > 1)
            line_warn ("@%s defined with zero or more than one argument should "
                       "be invoked with {}", command_name(cmd));
          /* As agreed on the bug-texinfo mailing list, no warn when zero
             arg and not called with {}. */

          if (macro->e.c->cmd == CM_macro)
            macro_call_element = new_command_type_element (ET_macro_call,
                                          CM_NONE, command_name(cmd));
          else /* macro->e.c->cmd == CM_rmacro */
            macro_call_element = new_command_type_element (ET_rmacro_call,
                                          CM_NONE, command_name(cmd));
        }
      else
        {
          static char *alloc_line;
          ELEMENT *arg_elt = new_element (ET_line_arg);
          if (macro->e.c->cmd == CM_macro)
            macro_call_element = new_command_type_element (ET_macro_call_line,
                                                   CM_NONE, command_name(cmd));
          else /* macro->e.c->cmd == CM_rmacro */
            macro_call_element = new_command_type_element (ET_rmacro_call_line,
                                                   CM_NONE, command_name(cmd));
          add_to_element_contents (macro_call_element, arg_elt);

          while (1)
            {
              if (*line == '\0')
                {
                /* If it takes a single line of input, and we don't have a
                   full line of input already, call next_text. */
                  free (alloc_line);
                  line = alloc_line = next_text (arg_elt);
                  if (!line)
                    {
                      line = "";
                      break;
                    }
                }
              else
                {
                  const char *p = strchrnul (line, '\n');
                  if (arg_elt->e.c->contents.number == 0)
                    {
                      ELEMENT *e = new_text_element (ET_normal_text);
                      add_to_contents_as_array (arg_elt, e);
                    }
                  text_append_n (arg_elt->e.c->contents.list[0]->e.text,
                                 line, (p - line));
                  if (!p)
                    line = p;
                  else
                    {
                      line = "\n";
                      break;
                    }
                }
            }
          isolate_leading_trailing (arg_elt, 1);
        }
    }

  /* Keep the macro_call_element in the tree in source mark even if
     the macro body is not expanded, in case there are source marks
     in the macro_call_element.  If the macrobody is not expanded
     the state of the source mark is not set to start, and there is
     no source mark for an end of the macro call added.  The location
     of the source marks could be wrong, but it is more important to
     have an end for each started sourcemarks, even if the location is
     approximate. */

  if (from_alias != CM_NONE)
     add_extra_string_dup (macro_call_element, AI_key_alias_of,
                           command_name (from_alias));

  if (macro->e.c->cmd == CM_linemacro)
    macro_source_mark = new_source_mark (SM_type_linemacro_expansion);
  else
    macro_source_mark = new_source_mark (SM_type_macro_expansion);
  macro_source_mark->element = macro_call_element;
  register_source_mark (current, macro_source_mark);

  if (error)
    {
      macro_expansion_nr--;
      debug ("C|DROPPING CALL OF MACRO %s", command_name(cmd));
      macro_call_element = 0;
      goto funexit;
    }

  macro_source_mark->status = SM_status_start;

  text_init (&expanded);
  CONST_ELEMENT_LIST *args = get_non_empty_brace_args (macro_call_element);
  expand_macro_body (macro_record, args, &expanded);
  destroy_const_element_list (args);

  if (expanded.end > 0)
    {
      if (expanded.text[expanded.end - 1] == '\n')
        expanded.text[--expanded.end] = '\0';
      expanded_macro_text = expanded.text;
    }
  else
    {
      free (expanded.text);
      /* we want to always have a text for the source mark */
      expanded_macro_text = strdup ("");
    }

  debug ("C|MACROBODY: %s||||||", expanded_macro_text);

  /* first put the line that was interrupted by the macro call
     on the input pending text stack */
  input_push_text (strdup (line), current_source_info.line_nr, 0, 0);

  /* Put expansion in front of the current line. */
  input_push_text (expanded_macro_text, current_source_info.line_nr,
                   command_name(cmd), 0);

  set_input_source_mark (macro_source_mark);

  /* not really important as line is ignored by the caller if there
     was no macro expansion error */
  line = strchr (line, '\0');

 funexit:
  *line_inout = line;
  return macro_call_element;
}


/* @set and @value */

static VALUE_LIST parser_values;

/* initialize parsing run values to the configuration values */
void
init_values (void)
{
  size_t i;

  wipe_values (&parser_values);

  if (parser_values.space < global_parser_conf->values.number)
    {
      parser_values.space = global_parser_conf->values.number;
      parser_values.list = realloc (parser_values.list,
                                    parser_values.space * sizeof (VALUE));
    }
  for (i = 0; i < global_parser_conf->values.number; i++)
    store_value (&parser_values, global_parser_conf->values.list[i].name,
                 global_parser_conf->values.list[i].value);
}

void
store_value_parsed_document (VALUE_LIST *values, const char *name,
                             const char *value)
{
  store_value (values, name, value);

  /* Internal Texinfo flag */
  if (!strncmp (name, "txi", 3) && parsed_document)
    {
      IGNORED_CHARS *ignored_chars_info
        = &parsed_document->global_info.ignored_chars;
      int val = (strcmp (value, "0") != 0);
      if (!strcmp (name, "txiindexbackslashignore"))
        ignored_chars_info->backslash = val;
      else if (!strcmp (name, "txiindexhyphenignore"))
        ignored_chars_info->hyphen = val;
      else if (!strcmp (name, "txiindexlessthanignore"))
        ignored_chars_info->lessthan = val;
      else if (!strcmp (name, "txiindexatsignignore"))
        ignored_chars_info->atsign = val;

      /* also: txicodequotebacktick, txicodequoteundirected,
         txicommandconditionals.  Deal with them here? */
    }
}

void
store_parser_value_parsed_document (const char *name, const char *value)
{
  store_value_parsed_document (&parser_values, name, value);
}

static void
clear_value_parsed_document (VALUE_LIST *values, const char *name)
{
  clear_value (values, name);

  /* Internal Texinfo flag */
  if (!strncmp (name, "txi", 3))
    {
      IGNORED_CHARS *ignored_chars_info
        = &parsed_document->global_info.ignored_chars;
      if (!strcmp (name, "txiindexbackslashignore"))
        ignored_chars_info->backslash = 0;
      else if (!strcmp (name, "txiindexhyphenignore"))
        ignored_chars_info->hyphen = 0;
      else if (!strcmp (name, "txiindexlessthanignore"))
        ignored_chars_info->lessthan = 0;
      else if (!strcmp (name, "txiindexatsignignore"))
        ignored_chars_info->atsign = 0;

      /* also: txicodequotebacktick, txicodequoteundirected,
         txicommandconditionals.  Deal with them here? */
    }
}

void
clear_parser_value_parsed_document (const char *name)
{
  clear_value_parsed_document (&parser_values, name);
}

char *
fetch_value (const char *name)
{
  size_t i;
  VALUE_LIST *values = &parser_values;
  for (i = 0; i < values->number; i++)
    {
      if (!strcmp (values->list[i].name, name))
        return values->list[i].value;
    }

  return 0;
}


/* @definfoenclose */
static INFO_ENCLOSE *infoencl_list;
static size_t infoencl_number;
static size_t infoencl_space;

INFO_ENCLOSE *
lookup_infoenclose (enum command_id cmd)
{
  size_t i;
  for (i = 0; i < infoencl_number; i++)
    {
      if (infoencl_list[i].cmd == cmd)
        return &infoencl_list[i];
    }
  return 0;
}

void
add_infoenclose (enum command_id cmd, const char *begin, const char *end)
{
  size_t i;
  INFO_ENCLOSE *ie = 0;

  /* Check if already defined. */
  for (i = 0; i < infoencl_number; i++)
    {
      if (infoencl_list[i].cmd == cmd)
        {
          ie = &infoencl_list[i];
          free (ie->begin);
          free (ie->end);
          break;
        }
    }

  if (!ie)
    {
      if (infoencl_number == infoencl_space)
        {
          infoencl_list = realloc (infoencl_list,
                                   (infoencl_space += 5)
                                   * sizeof (INFO_ENCLOSE));
        }
      ie = &infoencl_list[infoencl_number++];
    }

  ie->cmd = cmd;
  ie->begin = strdup (begin);
  ie->end = strdup (end);
}

