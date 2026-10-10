/* end_line.c -- what to do at the end of a whole line of input */
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
#include <ctype.h>
#include <stdio.h>
#include <unistd.h>
/* for strcasecmp */
#include <strings.h>

#include "command_ids.h"
#include "element_types.h"
#include "source_mark_types.h"
#include "text.h"
#include "tree_types.h"
#include "document_types.h"
#include "types_data.h"
#include "list_macros.h"
/* for isascii_alnum fatal */
#include "base_utils.h"
#include "tree.h"
#include "extra.h"
#include "builtin_commands.h"
#include "structure_list.h"
/* for whitespace_chars read_flag_len
   indices_info_index_by_name ultimate_index analyze_documentlanguage_argument
   analyze_documentscript_argument */
#include "utils.h"
/* for parse_float_type add_to_float_record_list */
#include "floats.h"
/* for parse_node_manual */
#include "manipulate_tree.h"
#include "convert_to_texinfo.h"
/* for convert_to_node_identifier */
#include "node_name_normalization.h"
/* for global_parser_conf */
#include "parser_conf.h"
#include "commands.h"
#include "debug_parser.h"
#include "errors_parser.h"
#include "command_stack.h"
#include "counter.h"
#include "input.h"
#include "source_marks.h"
#include "context_stack.h"
/* check_register_target_element_label */
#include "labels.h"
/* add_infoenclose */
#include "macro.h"
#include "indices.h"
#include "handle_commands.h"
#include "def.h"
#include "parser.h"

static int
is_decimal_number (const char *string)
{
  const char *p = string;
  const char *first_digits = 0;
  const char *second_digits = 0;

  if (string[0] == '\0')
    return 0;

  if (strchr (digit_chars, *p))
    p = first_digits = string + strspn (string, digit_chars);

  if (*p == '.')
    {
      p++;
      if (strchr (digit_chars, *p))
        p = second_digits = p + strspn (p, digit_chars);
    }

  if (*p /* Bytes remaining at end of argument. */
      || (!first_digits && !second_digits)) /* Need digits either
                                               before or after the
                                               decimal point. */
    {
      return 0;
    }

  return 1;
}

static int
is_whole_number (const char *string)
{
  if (string[strspn (string, digit_chars)] == '\0')
    return 1;
  return 0;
}

/* Parse the arguments to a line command.  Return an element whose contents
   is an array of the arguments.  For some commands, there is further
   processing of the arguments (for example, for an @alias, remember the
   alias.) */
STRING_LIST *
parse_line_command_args (ELEMENT *line_command)
{
#define ADD_ARG(string) do { \
    add_string (line_args, string); \
} while (0)

  ELEMENT *line_arg;
  STRING_LIST *line_args;
  enum command_id cmd;
  const TEXT *line_text;
  const char *line;
  int surplus_arg;

  cmd = line_command->e.c->cmd;

  if (parsed_command_data(cmd).flags & CF_root)
    {
      /* arguments_line type element */
      const ELEMENT *arguments_line = line_command->e.c->contents.list[0];
      line_arg = arguments_line->e.c->contents.list[0];
    }
  else
    line_arg = line_command->e.c->contents.list[0];

  line_text = simple_arg_text (line_arg, &surplus_arg);

  if (line_text == 0)
   {
     if (!surplus_arg)
       {
         command_error (line_command, "bad argument to @%s",
                        command_name(cmd));
       }
   } else if (line_text->end == 0)
     command_error (line_command, "@%s missing argument", command_name(cmd));

  if (surplus_arg)
      line_error ("superfluous argument to @%s", command_name (cmd));

  if (!line_text || line_text->end == 0)
    return 0;

  line = line_text->text;

  /* put in extra "misc_args" */
  line_args = new_string_list ();

  switch (cmd)
    {
    case CM_alias:
      {
        if (global_parser_conf->no_user_commands)
          break;
        /* @alias NEW = EXISTING */
        char *new = 0, *existing = 0;
        enum command_id new_cmd, existing_cmd;

        new = read_command_name (&line);
        if (!new)
          goto alias_invalid;

        line += strspn (line, whitespace_chars);
        if (*line != '=')
          goto alias_invalid;
        line++;
        line += strspn (line, whitespace_chars);

        if (!isascii_alnum (*line))
          goto alias_invalid;

        existing = read_command_name (&line);

        if (!existing)
          goto alias_invalid;

        if (*line)
          goto alias_invalid; /* Trailing argument. */

        ADD_ARG(new);
        ADD_ARG(existing);

        existing_cmd = lookup_command (existing);
        if (!existing_cmd)
          {
            /* supposedly existing command not defined.  Pre-register a
               user-defined command */
            existing_cmd = add_texinfo_command (existing);
            user_defined_command_data[existing_cmd & ~USER_COMMAND_BIT].flags
                                                                 |= CF_UNKNOWN;
          }
        else
          {
            if (parsed_command_data(existing_cmd).flags & CF_block)
              line_warn ("environment command %s as argument to @alias",
                         command_name(existing_cmd));
          }

        if (parsed_command_data(existing_cmd).flags & CF_ALIAS)
          {
            enum command_id alias_exist_cmd
              = parsed_command_data(existing_cmd).data;
            if (! strcmp (command_name(alias_exist_cmd), new))
              line_warn ("recursive alias definition of %s through %s ignored",
                            new, command_name(existing_cmd));
            else
              existing_cmd = alias_exist_cmd;
          }

        /* Remember the alias. */
        new_cmd = add_texinfo_command (new);
        new_cmd &= ~USER_COMMAND_BIT;
        user_defined_command_data[new_cmd].flags |= CF_ALIAS;
        user_defined_command_data[new_cmd].data = existing_cmd;
        if (existing_cmd & USER_COMMAND_BIT)
          {
            enum command_id user_data_cmd = existing_cmd & ~USER_COMMAND_BIT;
            user_defined_command_data[user_data_cmd].flags |= CF_REGISTERED;
          }

        /* Note the data field is an int, existing_cmd is
           enum command_id, so would have problems if enum command_id
           were wider than an int. */

        free (new); free (existing);

        break;
      alias_invalid:
        line_error ("bad argument to @alias");
        free (new); free (existing);
        break;
      }
    case CM_definfoenclose:
      {
        if (global_parser_conf->no_user_commands)
          break;

        /* @definfoenclose phoo,//,\\ */
        char *new_command = 0, *start = 0, *end = 0;
        enum command_id new_cmd;
        int len;

        new_command = read_command_name (&line);
        if (!new_command)
          goto definfoenclose_invalid;

        line += strspn (line, whitespace_chars);
        if (*line != ',')
          goto definfoenclose_invalid;
        line++; /* Past ','. */
        line += strspn (line, whitespace_chars);

        len = strcspn (line, ",");
        start = strndup (line, len);
        line += len;

        if (!*line)
          goto definfoenclose_invalid; /* Not enough args. */
        line++; /* Past ','. */
        line += strspn (line, whitespace_chars);
        len = strcspn (line, ",");
        end = strndup (line, len);

        if (*line == ',')
          goto definfoenclose_invalid; /* Too many args. */

        /* check that it is an highlighting command */
        new_cmd = lookup_builtin_command (new_command);
        if (new_cmd &&
            (!(command_data[new_cmd].flags & CF_brace)
             || (command_data[new_cmd].data != BRACE_style_no_code
                 && command_data[new_cmd].data != BRACE_style_code
                 && command_data[new_cmd].data != BRACE_style_other)))
          {
            line_error ("cannot redefine with @definfoenclose: %s",
                        new_command);
            goto definfoenclose_add_args;
          }

        /* Remember it. */
        new_cmd = add_texinfo_command (new_command);
        add_infoenclose (new_cmd, start, end);
        debug ("C|DEFINFOENCLOSE @%s: %s, %s", new_command, start, end);
        new_cmd &= ~USER_COMMAND_BIT;

        user_defined_command_data[new_cmd].flags
          |= (CF_INFOENCLOSE | CF_brace);
        user_defined_command_data[new_cmd].data = BRACE_style_other;
        user_defined_command_data[new_cmd].args_number = 1;

      definfoenclose_add_args:
        ADD_ARG(new_command); free (new_command);
        ADD_ARG(start); free (start);
        ADD_ARG(end); free (end);

        break;
      definfoenclose_invalid:
        line_error ("bad argument to @definfoenclose");
        free (new_command); free (start); free (end);
        break;
      }
    case CM_columnfractions:
      {
        /*  @multitable @columnfractions .33 .33 .33 */
        const char *p, *q;

        if (!*line)
          {
            line_error ("empty @columnfractions");
            break;
          }
        p = line;
        while (1)
          {
            char *arg;

            p += strspn (p, whitespace_chars);
            if (!*p)
              break;
            q = strpbrk (p, whitespace_chars);
            if (!q)
              q = p + strlen (p);

            arg = strndup (p, q - p);

            /* Check argument is valid. */
            if (!is_decimal_number (arg))
              {
                line_error ("column fraction not a number: %s", arg);
              }
            else
              {
                add_string (line_args, arg);
              }
            free (arg);
            p = q;
          }
        break;
      }
    case CM_sp:
      {
        /* Argument is at least one digit. */
        if (strchr (digit_chars, *line)
            && !*(line + 1 + strspn (line + 1, digit_chars)))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@sp arg must be numeric, not `%s'", line);
        break;
      }
    case CM_defindex:
    case CM_defcodeindex:
      {
        if (global_parser_conf->no_user_commands
            || global_parser_conf->no_index)
          break;

        char *name = 0;
        const char *p = line;

        name = read_command_name (&p);
        if (*p)
          goto defindex_invalid; /* Trailing characters. */

        /* Disallow index names NAME where it is likely that for
           a source file BASE.texi, there will be other files called
           BASE.NAME in the same directory.  This is to prevent such
           files being overwritten by the files read by texindex. */
        {
          static const char *forbidden_index_names[] = {
            "cp", "fn", "ky", "pg", "tp", "vr",
            "cps", "fns", "kys", "pgs", "tps", "vrs",
            "info", "ps", "pdf", "htm", "html",
            "log", "aux", "dvi", "texi", "txi",
            "texinfo", "tex", "bib", 0
          };
          const char **ptr;
          for (ptr = forbidden_index_names; *ptr; ptr++)
            if (!strcmp (name, *ptr))
              goto defindex_reserved;
        }

        add_index (name, cmd == CM_defcodeindex ? 1 : 0);
        ADD_ARG(name);

        free (name);
        break;
      defindex_invalid:
        line_error ("bad argument to @%s: %s",
                     command_name(cmd), line);
        free (name);
        break;
      defindex_reserved:
        line_error ("reserved index name %s", name);
        free (name);
        break;
      }
    case CM_synindex:
    case CM_syncodeindex:
      {
        /* synindex FROM TO */
        char *index_name_from = 0, *index_name_to = 0;
        INDEX *from_index;
        INDEX *to_index;
        const char *p = line;

        if (!isascii_alnum (*p))
          goto synindex_invalid;
        index_name_from = read_command_name (&p);
        if (!index_name_from)
          goto synindex_invalid;

        p += strspn (p, whitespace_chars);

        if (!isascii_alnum (*p))
          goto synindex_invalid;
        index_name_to = read_command_name (&p);
        if (!index_name_to)
          goto synindex_invalid;
        if (*p)
          goto synindex_invalid; /* More at end of line. */

        if (global_parser_conf->no_index)
          {
            free (index_name_from);
            free (index_name_to);
            break;
          }

        from_index = indices_info_index_by_name (&parsed_document->indices_info,
                                                 index_name_from);
        to_index = indices_info_index_by_name (&parsed_document->indices_info,
                                               index_name_to);
        if (!from_index)
          line_error ("unknown source index in @%s: %s",
                      command_name(cmd), index_name_from);
        if (!to_index)
          line_error ("unknown destination index in @%s: %s",
                      command_name(cmd), index_name_to);

        if (from_index && to_index)
          {
            INDEX *current_to = to_index;
            /* Find ultimate index this merges to. */
            current_to = ultimate_index (current_to);

            if (current_to != from_index)
              {
                from_index->merged_in = current_to;
                from_index->in_code = (cmd == CM_syncodeindex);
                ADD_ARG(index_name_from);
                ADD_ARG(index_name_to);
                /* Note that 'current_to' may not end up as the index
                   'from_index' merges into if there are further @synindex
                   commands. */
              }
            else
              line_warn ("@%s leads to a merging of %s in itself, ignoring",
                          command_name(cmd), index_name_from);
          }

        free (index_name_from);
        free (index_name_to);

        break;
      synindex_invalid:
        line_error ("bad argument to @%s: %s",
                     command_name(cmd), line);
        free (index_name_from); free (index_name_to);
        break;
      }
    case CM_printindex:
      {
        char *arg;
        const char *p = line;
        arg = read_command_name (&p);
        if (!arg || *p)
          line_error ("bad argument to @printindex: %s", line);
        else if (global_parser_conf->no_index)
          {}
        else
          {
            INDEX *idx
             = indices_info_index_by_name (&parsed_document->indices_info, arg);
            if (!idx)
              line_error ("unknown index `%s' in @printindex", arg);
            else
              {
                if (idx->merged_in)
                  {
                    INDEX *i2 = ultimate_index (idx);
                    line_warn
                      ("printing an index `%s' merged in another one, `%s'",
                       arg, i2->name);
                  }
                if (!current_node && !current_section
                      && nesting_context.regions_stack.number == 0)
                  {
                    line_warn ("printindex before document beginning: "
                                "@printindex %s", arg);
                  }
                ADD_ARG (arg);
              }
          }
        free (arg);
        break;
      }
    case CM_everyheadingmarks:
    case CM_everyfootingmarks:
    case CM_evenheadingmarks:
    case CM_oddheadingmarks:
    case CM_evenfootingmarks:
    case CM_oddfootingmarks:
      {
        if (!strcmp (line, "top") || !strcmp (line, "bottom"))
          {
            ADD_ARG (line);
          }
        else
          line_error ("@%s arg must be `top' or `bottom', not `%s'",
                       command_name(cmd), line);

        break;
      }
    case CM_fonttextsize:
      {
        if (!strcmp (line, "10") || !strcmp (line, "11"))
          {
            ADD_ARG (line);
          }
        else
          line_error ("Only @fonttextsize 10 or 11 is supported, not "
                       "`%s'", line);
        break;
      }
    case CM_footnotestyle:
      {
        if (!strcmp (line, "separate") || !strcmp (line, "end"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@footnotestyle arg must be "
                       "`separate' or `end', not `%s'", line);
        break;
      }
    case CM_setchapternewpage:
      {
        if (!strcmp (line, "on") || !strcmp (line, "off")
            || !strcmp (line, "odd"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@setchapternewpage arg must be "
                       "`on', `off' or `odd', not `%s'", line);
        break;
      }
    case CM_need:
      {
        /* valid: 2, 2., .2, 2.2 */

        if (is_decimal_number (line))
          ADD_ARG(line);
        else
          line_error ("bad argument to @need: %s", line);

        break;
      }
    case CM_paragraphindent:
      {
        if (!strcmp (line, "none") || !strcmp (line, "asis")
            || is_whole_number (line))
          ADD_ARG(line);
        else
          line_error ("@paragraphindent arg must be "
                       "numeric/`none'/`asis', not `%s'", line);
        break;
      }
    case CM_firstparagraphindent:
      {
        if (!strcmp (line, "none") || !strcmp (line, "insert"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@firstparagraphindent arg must be "
                       "`none' or `insert', not `%s'", line);

        break;
      }
    case CM_exampleindent:
      {
        if (!strcmp (line, "asis") || is_whole_number (line))
          ADD_ARG(line);
        else
          line_error ("@exampleindent arg must be "
                       "numeric/`asis', not `%s'", line);
        break;
      }
    case CM_frenchspacing:
    case CM_xrefautomaticsectiontitle:
    case CM_codequoteundirected:
    case CM_codequotebacktick:
    case CM_deftypefnnewline:
    case CM_microtype:
      {
        if (!strcmp (line, "on") || !strcmp (line, "off"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("expected @%s on or off, not `%s'",
                      command_name(cmd), line);

        break;
      }
    case CM_kbdinputstyle:
      {
        if (!strcmp (line, "code"))
          global_kbdinputstyle = kbd_code;
        else if (!strcmp (line, "example"))
          global_kbdinputstyle = kbd_example;
        else if (!strcmp (line, "distinct"))
          global_kbdinputstyle = kbd_distinct;
        else goto kdbinputstyle_invalid;

        ADD_ARG(line);

        if (0)
          {
        kdbinputstyle_invalid:
          line_error ("@kbdinputstyle arg must be "
                       "`code'/`example'/`distinct', not `%s'", line);
          }
        break;
      }
    case CM_allowcodebreaks:
      {
        if (!strcmp (line, "true") || !strcmp (line, "false"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@allowcodebreaks arg must be "
                       "`true' or `false', not `%s'", line);
        break;
      }
    case CM_urefbreakstyle:
      {
        if (!strcmp (line, "after") || !strcmp (line, "before")
            || !strcmp (line, "none"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("@urefbreakstyle arg must be "
                       "`after'/`before'/`none', not `%s'", line);
        break;
      }
    case CM_headings:
      {
        if (!strcmp (line, "off") || !strcmp (line, "on")
            || !strcmp (line, "single") || !strcmp (line, "double")
            || !strcmp (line, "singleafter") || !strcmp (line, "doubleafter"))
          {
            ADD_ARG(line);
          }
        else
          line_error ("bad argument to @headings: %s", line);
        break;
      }
    default:
      ;
    }
  if (line_args->number == 0)
    {
      destroy_strings_list (line_args);
      return 0;
    }
  else
    return line_args;

#undef ADD_ARG
}

ELEMENT *
end_line_def_line (ELEMENT *current)
{
  ELEMENT *def_line_container = current;
  enum command_id def_command;
  char *def_cmdname;
  ELEMENT *index_entry = 0; /* Index entry text. */
  ELEMENT *def_info_name = 0;
  ELEMENT *def_info_class = 0;
  ELEMENT *def_info_category = 0;
  size_t i;
  enum context top_context = pop_context ();

  if (top_context != ct_def)
    fatal ("def context expected");

  def_cmdname = lookup_extra_string (current->e.c->parent,
                                     AI_key_def_command);
  def_command = lookup_command (def_cmdname);

  debug_nonl ("C|END DEF LINE %s; current ",
               command_name(def_command));
  debug_parser_print_element (current, 1); debug ("");

  parse_def (def_command, current);

  /* def_line */
  current = current->e.c->parent;

  /* Record the index entry if def_line_container is not empty. */
  for (i = 0; i < def_line_container->e.c->contents.number; i++)
    {
      ELEMENT *def_e = def_line_container->e.c->contents.list[i];
      if (def_e->type == ET_def_name)
        def_info_name = def_e;
      else if (def_e->type == ET_def_class)
        def_info_class = def_e;
      else if (def_e->type == ET_def_category)
        def_info_category = def_e;
      else if (def_e->type == ET_def_arg || def_e->type == ET_def_typearg)
        break;
    }

  if (def_info_category)
    {
      if (def_info_name)
        {
          const char *t;
          ELEMENT *arg = def_info_name->e.c->contents.list[0];
          /* Set index_entry unless an empty ET_bracketed_arg. */
          if (arg->type == ET_bracketed_arg
              && (arg->e.c->contents.number == 0
                  || (arg->e.c->contents.number == 1
                      && (arg->e.c->contents.list[0]->type == ET_normal_text
                          || arg->e.c->contents.list[0]->type
                                             == ET_spaces_before_argument)
                      && (t = arg->e.c->contents.list[0]->e.text->text)
                      && t[strspn (t, whitespace_chars)] == '\0')))
            {
            }
          else
            index_entry = def_info_name;
        }

      if (index_entry)
        {
          if (def_info_class &&
              (command_data[def_command].flags & CF_def_class_method
               || command_data[def_command].flags
                                               & CF_def_class_variable))
            {
              STRING_LIST *global_documentlanguagevariant
                = &parsed_document->global_info.documentlanguagevariant;

              if (global_documentlanguage)
                add_extra_string_dup (current, AI_key_documentlanguage,
                                      global_documentlanguage);
              if (global_documentscript)
                add_extra_string_dup (current, AI_key_documentscript,
                                      global_documentscript);

              if (global_documentlanguagevariant->number)
                {
                  STRING_LIST *documentlanguagevariant = new_string_list ();
                  copy_strings (documentlanguagevariant,
                                global_documentlanguagevariant);
                  add_extra_string_list (current,
                                         AI_key_documentlanguagevariant,
                                         documentlanguagevariant);
                }
            }

          if (def_command != CM_defline && def_command != CM_deftypeline)
            enter_index_entry (def_command, current);
        }
      else
        {
          def_cmdname = lookup_extra_string (current,
                                             AI_key_original_def_cmdname);
          command_warn (current, "missing name for @%s", def_cmdname);
        }
    }
  else
    {
      def_cmdname = lookup_extra_string (current, AI_key_original_def_cmdname);
      command_warn (current, "missing category for @%s", def_cmdname);
    }

  current = current->e.c->parent;
  current = begin_preformatted (current);

  return current;
}

/* Actions to be taken at the end of a line that started a block that
   has to be ended with "@end". */
ELEMENT *
end_line_starting_block (ELEMENT *current)
{
  const ELEMENT *arguments_line;
  ELEMENT *block_line_arg;

  enum command_id command = CM_NONE;

  if (current->e.c->parent->flags & EF_def_line)
    command = current->e.c->parent->e.c->parent->e.c->cmd;
  else if (current->e.c->parent->e.c->cmd)
    command = current->e.c->parent->e.c->cmd;
  else if (current->e.c->parent->e.c->parent
           && current->e.c->parent->e.c->parent->e.c->cmd)
    command = current->e.c->parent->e.c->parent->e.c->cmd;

  /* Should never happen */
  if (command == CM_NONE)
    fatal ("end_line_starting_block: parent command not found");

  if (parsed_command_data(command).flags & CF_contain_basic_inline)
      (void) pop_command_list (&nesting_context.basic_inline_stack_block);

  if (current->e.c->parent->flags & EF_def_line)
    return end_line_def_line (current);

  isolate_leading_trailing (current, 0);

  if (pop_context () != ct_line)
    fatal ("line context expected");

  debug_nonl ("C|END BLOCK LINE: ");
  debug_parser_print_element (current, 1); debug ("");

  /* @multitable args */
  if (command == CM_multitable)
    {
      int max_columns = 0;
      ELEMENT *multitable = current->e.c->parent->e.c->parent;
      const ELEMENT *columnfractions = multitable_columnfractions (
                                                             multitable);
      if (columnfractions)
        {
          const STRING_LIST *misc_args
            = lookup_extra_string_list (columnfractions, AI_key_misc_args);

          if (misc_args)
            max_columns = misc_args->number;

          add_extra_integer (multitable, AI_key_max_columns, max_columns);
        }
      else
        {
          size_t i;
      /* NOTE max_columns could overflow, as in general INT_MAX < SIZE_MAX.
         We ignore as this would be for unrealistic column numbers */
          ELEMENT *multitable = current->e.c->parent->e.c->parent;
          int non_empty;
          ARG_INDICES arg_indices;

          non_empty = non_leading_trailing_indices (current,
                                                    &arg_indices);

          if (non_empty)
            {
              for (i = arg_indices.start;
                   i < current->e.c->contents.number; i++)
                {
                  ELEMENT *e = current->e.c->contents.list[i];

                  if (e->type == ET_bracketed_arg)
                    {
                      max_columns++;
                    }
                  else if (type_data[e->type].flags & TF_text)
                    {
              /*
              TODO: this should be a warning or an error - all prototypes
              on a @multitable line should be in braces, as documented in the
              Texinfo manual.
              if (e->e.text->end > 0)
                 .....
               */
                    }
                  else
                    {
                      if (e->e.c->cmd != CM_c && e->e.c->cmd != CM_comment)
                        {
                          char *texi;
                          texi = convert_to_texinfo (e);
                          command_warn (multitable,
                                        "unexpected argument on @%s line: %s",
                                        command_name(multitable->e.c->cmd), texi);
                          free (texi);
                        }
                    }
                }
            }

          if (max_columns == 0)
            command_warn (multitable, "empty multitable");
        }

      add_extra_integer (multitable, AI_key_max_columns, max_columns);
    }

  current = current->e.c->parent;
  if (current->type == ET_arguments_line)
    current = current->e.c->parent;
  if (counter_value (&count_remaining_args, current) != -1)
    counter_pop (&count_remaining_args);

  /* arguments_line type element */
  arguments_line = current->e.c->contents.list[0];
  block_line_arg = arguments_line->e.c->contents.list[0];

  if (command == CM_float)
    {
      char *float_type = 0;

      current->e.c->source_info = current_source_info;
      if (arguments_line->e.c->contents.number >= 2)
        {
          ELEMENT *float_label_element
            = arguments_line->e.c->contents.list[1];
          check_register_target_element_label (float_label_element, current);
        }
      float_type = parse_float_type (current,
                                     arguments_line->e.c->contents.list[0]);

      /* add to global 'floats' array */
      add_to_float_record_list (&parser_float_records, float_type, current,
                                current_section);
    }
  else if (parsed_command_data(command).flags & CF_blockitem)
    {
      if (command == CM_enumerate)
        {
          int surplus_arg;
          const TEXT *arg_text = simple_arg_text (block_line_arg,
                                                 &surplus_arg);
          if (arg_text)
            {
              if (surplus_arg)
                {
                   command_error (current, "superfluous argument to @%s",
                                  command_name(current->e.c->cmd));
                }
              if ((arg_text->end == 1
                   && isascii_alpha (arg_text->text[0]))
                  || (arg_text->end > 0
                      && !*(arg_text->text + strspn (arg_text->text,
                                                     digit_chars))))
                {}
              else if (arg_text->end > 0)
                command_error (current, "bad argument to @%s",
                               command_name(command));
            }
          else if (surplus_arg)
            command_error (current, "bad argument to @%s",
                           command_name(command));
        }
      else if (command == CM_itemize)
        {
          const ELEMENT *command_as_argument
            = block_line_argument_command (block_line_arg);

          /* Check if command as argument isn't an accent command */
          if (block_line_arg->e.c->contents.number > 0)
            {
              ARG_INDICES arg_indices;
              int non_empty;
              non_empty = non_leading_trailing_indices (block_line_arg,
                                                        &arg_indices);
              if (non_empty && arg_indices.start == arg_indices.end)
                {
                  const ELEMENT *arg
                    = block_line_arg->e.c->contents.list[arg_indices.start];
                  if (!(type_data[arg->type].flags & TF_text)
                      && (arg->e.c->contents.number == 0
                          || (arg->e.c->contents.number == 1
              && arg->e.c->contents.list[0]->e.c->contents.number == 0)))
                    {
                      enum command_id cmd = element_builtin_cmd (arg);
                      if (command_data[cmd].flags & CF_brace
                          && command_data[cmd].data == BRACE_accent)
                        {
                          command_warn (current, "accent command `@%s' "
                            "not allowed as @%s argument",
                            command_name(cmd),
                            command_name(command));
                        }
                    }
                }
            }
          /* if the command as argument does not have braces but it is
             not a mark (noarg) command, warn */
          if (command_as_argument
              && command_as_argument->e.c->contents.number <= 0
              && parsed_command_data(command_as_argument->e.c->cmd).data
                                                            != BRACE_noarg)
            {
               command_warn (current, "@%s expected braces",
                             command_name(command_as_argument->e.c->cmd));
            }
        }
      else if (parsed_command_data(command).data == BLOCK_item_line)
        {
          const ELEMENT *command_as_argument
            = block_line_argument_command (block_line_arg);

          if (!command_as_argument)
            {
              if (!empty_spaces_argument (block_line_arg))
                {
                  char *texi_arg;

                  /* expand the contents to avoid surrounding spaces */
                  texi_arg
                    = convert_contents_to_texinfo (block_line_arg);
                  command_error (current, "bad argument to @%s: %s",
                                 command_name(command), texi_arg);
                  free (texi_arg);
                }
              else
                {
                  command_error (current, "missing @%s argument",
                                 command_name(command));
                }
            }
          else
            {
              if (parsed_command_data(command_as_argument->e.c->cmd).data
                                                                == BRACE_noarg)
                {
                  command_error (current,
                                 "command @%s not accepting argument in brace "
                                 "should not be on @%s line",
                                 command_name(command_as_argument->e.c->cmd),
                                 command_name(command));
                  command_as_argument = 0;
                }
            }
        }


      {
        ELEMENT *bi = new_element (ET_before_item);
        add_to_element_contents (current, bi);
        current = bi;
      }
    } /* CF_blockitem */
  else if (parsed_command_data(command).args_number == 0
           && (! (parsed_command_data(command).flags & CF_variadic))
           && ! empty_spaces_argument (block_line_arg))
    {
      char *texi_arg;

      /* expand the contents to avoid surrounding spaces */
      texi_arg = convert_contents_to_texinfo (block_line_arg);
      command_warn (current, "unexpected argument on @%s line: %s",
                     command_name(command), texi_arg);
      free (texi_arg);
    }

  if (parsed_command_data(command).data == BLOCK_conditional)
    {
      int iftrue = 0; /* Whether the conditional is true. */
      int bad_line = 1;
      if (command == CM_ifclear || command == CM_ifset
          || command == CM_ifcommanddefined
          || command == CM_ifcommandnotdefined)
        {
          int surplus_arg;
          const TEXT *name = simple_arg_text (block_line_arg,
                                              &surplus_arg);

          if (!name || name->end == 0)
            {
              line_error ("@%s requires a name", command_name(command));
              bad_line = 0;
            }
          else
            {
              const char *p = name->text;
              p += strspn (p, whitespace_chars);
              if (!*p)
                {
                  line_error ("@%s requires a name", command_name(command));
                  bad_line = 0;
                }
              else
                {
                  size_t flag_len = read_flag_len (p);
                  if (flag_len && !*(p + flag_len))
                    {
                      char *flag = strndup (p, flag_len);
                      bad_line = 0;
                      if (command == CM_ifclear || command == CM_ifset)
                        {
                          char *val = fetch_value (flag);
                          if (val)
                            iftrue = 1;
                          if (command == CM_ifclear)
                            iftrue = !iftrue;
                        }
                      else /* command == CM_ifcommanddefined
                              || command == CM_ifcommandnotdefined */
                        {
                          enum command_id c = lookup_command (flag);
                          if (c)
                            iftrue = 1;
                          if (command == CM_ifcommandnotdefined)
                            iftrue = !iftrue;
                        }
                      debug ("C|CONDITIONAL @%s %s: %d",
                             command_name(command), flag, iftrue);
                      free (flag);
                    }
                }
            }

          if (bad_line)
            line_error ("bad name for @%s", command_name(command));
        }
      else if (!memcmp (command_name(command), "if", 2)) /* e.g. @ifhtml */
        {
          const char *p;
          /* Handle @if* and @ifnot* */

          p = command_name(command) + 2; /* After "if". */
          /* note that if a 2 letter format existed, like @ifme, the length of
             p should be checked before the call to memcmp */
          if (!memcmp (p, "not", 3))
            p += 3; /* After "not". */

          iftrue = parser_format_expanded_p (p);
          if (!memcmp (command_name(command), "ifnot", 5))
            iftrue = !iftrue;

          debug ("C|CONDITIONAL @%s format %s: %d", command_name(command),
                 p, iftrue);
        }
      else
        bug_message ("unknown conditional command @%s", command_name(command));

      if (iftrue)
        {
          ELEMENT *e;
          SOURCE_MARK *source_mark;
          current = current->e.c->parent;
          e = pop_element_from_contents (current);
          e->e.c->parent = 0;
          source_mark = new_source_mark (SM_type_expanded_conditional_command);
          source_mark->status = SM_status_start;
          source_mark->element = e;
          register_source_mark (current, source_mark);
          debug ("C|PUSH BEGIN COND %s", command_name(command));
          push_conditional_stack (command, source_mark);
        }
    }

  if (parsed_command_data(command).data == BLOCK_menu)
    {
      /* Start reading a menu.  Processing will continue in
         in menus.c. */

      ELEMENT *menu_comment = new_element (ET_menu_comment);
      add_to_element_contents (current, menu_comment);
      current = menu_comment;
      debug ("C|MENU_COMMENT OPEN");
    }
  if (parsed_command_data(command).data == BLOCK_format_raw)
    {
      if (parser_format_expanded_p (command_name(command)))
        {
          ELEMENT *rawpreformatted = new_element (ET_rawpreformatted);
          add_to_element_contents (current, rawpreformatted);
          current = rawpreformatted;
        }
    }
  if (parsed_command_data(command).data != BLOCK_raw
      && parsed_command_data(command).data != BLOCK_conditional)
    current = begin_preformatted (current);

  return current;
}

static void
associate_title_command_anchor (NODE_RELATIONS *current_node_relations,
                       ELEMENT *current, SECTION_RELATIONS *section_relations,
                       HEADING_RELATIONS *heading_relations)
{
  if (!current_node_relations->associated_title_command)
    {
      current_node_relations->associated_title_command = current;
      if (section_relations)
        section_relations->associated_anchor_command
          = current_node_relations;
      else
        heading_relations->associated_anchor_command
          = current_node_relations;
    }
}

/* Actions to be taken at the end of an argument to a line command
   not starting a block.  @end is processed in here. */
ELEMENT *
end_line_misc_line (ELEMENT *current)
{
  enum command_id cmd;
  enum command_id data_cmd;
  int arg_spec;
  ELEMENT *misc_cmd;
  char *end_command = 0;
  enum command_id end_id = CM_NONE;
  int included_file = 0;
  SOURCE_MARK *include_source_mark = 0;
  ELEMENT *command_element;
  ELEMENT *line_arg = 0;

  if (current->e.c->parent->type == ET_arguments_line)
    {
      const ELEMENT *arguments_line;

      command_element = current->e.c->parent->e.c->parent;
      arguments_line = command_element->e.c->contents.list[0];
      line_arg = arguments_line->e.c->contents.list[0];
    }
  else
    {
      command_element = current->e.c->parent;
      line_arg = command_element->e.c->contents.list[0];
    }

  data_cmd = cmd = command_element->e.c->cmd;

  /* we are in a command line context, so the @item command information is
     associated to CM_item_LINE */
  if (cmd == CM_item)
    data_cmd = CM_item_LINE;

  if (parsed_command_data(data_cmd).flags & CF_contain_basic_inline)
    (void) pop_(command) (&nesting_context.basic_inline_stack_on_line);

  arg_spec = parsed_command_data(data_cmd).data;

  if (arg_spec != LINE_specific
      && (parsed_command_data(data_cmd).args_number > 1
          || (parsed_command_data(data_cmd).flags & CF_variadic)))
    counter_pop (&count_remaining_args);

  if (current->e.c->parent->flags & EF_def_line)
    return end_line_def_line (current);

  isolate_leading_trailing (current, 0);

  current = command_element;
  misc_cmd = current;

  debug ("C|MISC END %s", command_name(cmd));

  if (pop_context () != ct_line)
    fatal ("line context expected");

  if (arg_spec == LINE_specific)
    {
      STRING_LIST *args = parse_line_command_args (current);
      if (args)
        add_extra_string_list (current, AI_key_misc_args, args);
    }
  else if (arg_spec == LINE_text)
    {
      char *text = 0;
      int superfluous_arg = 0;

      text = text_contents_to_plain_text (current->e.c->contents.list[0],
                                          &superfluous_arg);

      if (!strcmp (text, "") && cmd != CM_documentscript)
        {
          if (!superfluous_arg)
            line_warn ("@%s missing argument", command_name(cmd));
          free (text);
        }
      else
        {
          add_extra_string (current, AI_key_text_arg, text);
          if (current->e.c->cmd == CM_end)
            {
              const char *line = text;

              /* Set end_command - used below. */
              end_command = read_command_name (&line);
              if (end_command)
                {
                  /* Check if argument is a block Texinfo command. */
                  end_id = lookup_command (end_command);
                  if (end_id == 0 || !(parsed_command_data(end_id).flags & CF_block))
                    {
                      command_warn (current, "unknown @end %s", end_command);
                      free (end_command); end_command = 0;
                    }
                  else
                    {
                      debug ("C|END BLOCK @end %s", end_command);

                      /* If there is superfluous text after @end argument, set
                         superfluous_arg such that the error message triggered by an
                         unexpected @-command on the @end line is issued below.  Note
                         that superfluous_arg may also be true if it was set above. */
                      if (end_command
                          && line[strspn (line, whitespace_chars)] != '\0')
                          superfluous_arg = 1;
                    }
                }
              /* if superfluous_arg is set there is a similar and somewhat
                 better error message below */
              else if (!superfluous_arg)
                {
                  command_error (current, "bad argument to @end: %s", line);
                }
            }
          else if (superfluous_arg)
            {
              /* An error message is issued below. */
            }
          else if (current->e.c->cmd == CM_include)
            {
              int status;
              char *included_file_path, *file_path;

              file_path = parser_encode_file_name (text);
              included_file_path = parser_locate_include_file (file_path);
              free (file_path);

              if (!included_file_path)
                {
                  command_error (current,
                                 "@include: could not find %s", text);
                }
              else
                {
                  status = input_push_file (included_file_path);
                  if (status)
                    {
                      char *decoded_file_path
                         = convert_to_utf8 (strdup (included_file_path));
                      command_error (current,
                                     "@include: could not open %s: %s",
                                     decoded_file_path,
                                     strerror (status));
                      free (decoded_file_path);
                    }
                  else
                    {
                      included_file = 1;
                      debug ("C|Included %s", included_file_path);

                      include_source_mark = new_source_mark (SM_type_include);
                      include_source_mark->status = SM_status_start;
                      set_input_source_mark (include_source_mark);
                      add_string (&parsed_document->global_info.included_files,
                                  included_file_path);
                    }
                  free (included_file_path);
                }
            }
          else if (current->e.c->cmd == CM_verbatiminclude)
            {
              char *fullpath, *file_path;
              GLOBAL_INFO *global_info = &parsed_document->global_info;

              if (global_info->input_encoding_name)
                add_extra_string_dup (current, AI_key_input_encoding_name,
                                      global_info->input_encoding_name);
              /* gather included file for 'included_files'.  No errors, they
                 should be output by converters */
              file_path = parser_encode_file_name (text);
              fullpath = parser_locate_include_file (file_path);
              free (file_path);
              if (fullpath && access (fullpath, R_OK) == 0)
                add_string (&global_info->included_files, fullpath);
              free (fullpath);
            }
          else if (current->e.c->cmd == CM_documentencoding)
            {
              size_t i;
              char *normalized_text;
              int possible_encoding = 0;

              normalized_text = normalize_encoding_name (text,
                                                         &possible_encoding);

              if (! possible_encoding)
                command_warn (current, "bad encoding name `%s'",
                              text);
              else
                {
                  int encoding_set;
                  const char *input_encoding = 0;

            /* Warn if the encoding is not one of the encodings supported as an
               argument to @documentencoding, documented in Texinfo manual */
                  {
                    static const char *canonical_encodings[] = {
                      "us-ascii", "utf-8", "iso-8859-1",
                      "iso-8859-15","iso-8859-2","koi8-r", "koi8-u",
                      0
                    };
                    const char *texinfo_encoding = 0;
                    char *text_lc;
                    char *p;

                    text_lc = strdup (text);
                    for (p = text_lc; *p; p++)
                      if (isascii_alpha (*p))
                        *p = tolower (*p);

                    for (i = 0; (canonical_encodings[i]); i++)
                      {
                        if (!strcmp (text_lc, canonical_encodings[i]))
                          {
                            texinfo_encoding = canonical_encodings[i];
                            break;
                          }
                      }
                    free (text_lc);
                    if (!texinfo_encoding)
                      {
                        command_warn (current, "encoding `%s' is not a "
                                    "canonical texinfo encoding", text);
                      }
                  }

              /* Set input_encoding -- for output within an HTML file, used
                                       in most output formats */
                  input_encoding = map_encoding_name (normalized_text);

                  if (!input_encoding)
                    {
                      input_encoding = normalized_text;
                    }

                  /* set_input_encoding also sets
                     global_info->input_encoding_name */
                  encoding_set = set_input_encoding (input_encoding);
                  if (encoding_set)
                    {
                      add_extra_string_dup (current, AI_key_input_encoding_name,
                                            input_encoding);
                    }
                  else
                    command_warn (current, "unhandled encoding name `%s'",
                                  text);
                }
              free (normalized_text);
            }
          else if (current->e.c->cmd == CM_documentlanguage)
            {
              /* messages setup in Texinfo::Common warn_unknown_language */
              char *region_code;
              int lang_is_valid;
              int region_is_valid;
              char *lang = analyze_documentlanguage_argument (text,
                                        &region_code,
                                        &lang_is_valid, &region_is_valid);

              if (!lang)
                {
                  command_warn (current, "%s is not a valid language argument",
                                text);
                }
              else
                {
                  if (!lang_is_valid)
                    {
                      command_warn (current, "%s is not a valid language code",
                                    lang);
                    }
                  free (lang);
                  if (!region_is_valid)
                    {
                      command_warn (current, "%s is not a valid region code",
                                             region_code);
                    }
                  free (region_code);
           /* Set the document language unless it was set on the command line. */
                  if (!global_parser_conf->global_documentlanguage_fixed)
                    {
                      free (global_documentlanguage);
                      global_documentlanguage = strdup (text);

          /* setting documentlanguage resets documentscript and
             documentlanguagevariant. */

                      if (!global_parser_conf->global_documentscript_fixed)
                        {
                          free (global_documentscript);
                          global_documentscript = 0;
                        }
                      clear_strings_list (
                       &parsed_document->global_info.documentlanguagevariant);

                      add_to_element_list (
                        &parsed_document->global_commands.language_commands,
                        current);
                    }
                }
            }
          else if (current->e.c->cmd == CM_documentscript)
            {
              int valid_script;
              const char *script
                = analyze_documentscript_argument (text, &valid_script);
              if (!script)
                {
                  command_warn (current, "bad language script argument `%s'",
                                text);
                }
              else
                {
                  if (!valid_script)
                    command_warn (current, "unknown language script name `%s'",
                                  text);
                  if (!global_parser_conf->global_documentscript_fixed)
                    {
                      free (global_documentscript);
                      if (!strcmp (script, ""))
                        global_documentscript = 0;
                      else
                        global_documentscript = strdup (script);

                      add_to_element_list (
                        &parsed_document->global_commands.language_commands,
                        current);
                    }
                }
            }
        }
      if (superfluous_arg)
        {
          char *p;
          char *p1;
          char *texi_line
            = convert_to_texinfo (current->e.c->contents.list[0]);

          p = texi_line;

          /* trim leading whitespace. */
          p += strspn (p, whitespace_chars);

          /* Trim trailing whitespace. */
          p1 = strchr (p, '\0');
          if (p1 > p)
            {
              while (p1 > p && strchr (whitespace_chars, p1[-1]))
                p1--;
              *p1 = '\0';
            }
          command_error (current, "bad argument to @%s: %s",
                         command_name(current->e.c->cmd), p);
          free (texi_line);
        }
    }
  else if (current->e.c->cmd == CM_node)
    {
      size_t i;
      /* arguments_line type element */
      ELEMENT *arguments_line = current->e.c->contents.list[0];
      char *node_normalized;
      NODE_RELATIONS *node_relations = 0;

      for (i = 1; i < arguments_line->e.c->contents.number && i < 4; i++)
        {
          ELEMENT *node_line_arg = arguments_line->e.c->contents.list[i];
          NODE_SPEC_EXTRA *direction_label_info
            = parse_node_manual (node_line_arg, 1);
          if (direction_label_info->node_content)
            {
              ELEMENT *tmp = new_element (ET_NONE);
              char *normalized;

              add_extra_container (node_line_arg, AI_key_node_content,
                                   direction_label_info->node_content);

              tmp->e.c->contents
                 = direction_label_info->node_content->e.c->contents;
              normalized = convert_to_node_identifier (tmp);
              tmp->e.c->contents.list = 0;
              destroy_element (tmp);

              add_extra_string (node_line_arg, AI_key_normalized, normalized);
            }
          if (direction_label_info->manual_content)
            add_extra_container (node_line_arg, AI_key_manual_content,
                                 direction_label_info->manual_content);
          free (direction_label_info);
        }

      /* Now take care of the node itself */
      if (empty_spaces_argument (line_arg))
        {
          line_error_ext (MSG_error, 0, &current->e.c->source_info,
                          "empty argument in @%s", command_name (cmd));
        }
      check_register_target_element_label (line_arg, current);
      node_normalized = lookup_extra_string (current, AI_key_identifier);
      if (node_normalized)
        {
          node_relations
           = add_node_to_node_relations_list (&parsed_document->nodes_list,
                                              current);
          add_extra_integer (current, AI_key_node_number,
                             parsed_document->nodes_list.number);
          current_node = node_relations;
        }

      if (current_part && !current_part->part_associated_section
          && node_relations)
        {
         /* we only associate a part to the following node if the
            part is not already associate to a sectioning command,
            but the part can be associated to the sectioning command later
            if a sectioning command follows the node. */
          node_relations->node_preceding_part = current_part;
          current_part->part_following_node = node_relations;
        }
    }
  else if (current->e.c->cmd == CM_listoffloats)
    {
      parse_float_type (current, current->e.c->contents.list[0]);
    }
  else
    {
      if (command_flags(current) & CF_index_entry_command)
        {
          current->e.c->string_info[sit_command_name]
            = strdup (command_name(current->e.c->cmd));
        }
      /* All the other "line" commands. Check they have an argument. Empty
         @top and @xrefname are allowed. */
      if (empty_spaces_argument (line_arg)
          && current->e.c->cmd != CM_top
          && current->e.c->cmd != CM_xrefname
          && current->e.c->cmd != CM_documentlanguagevariant
          && current->e.c->cmd != CM_documentscript)
        {
          command_warn (current, "@%s missing argument",
                        command_name(current->e.c->cmd));
        }
      else if (current->e.c->cmd == CM_documentlanguagevariant)
        {
      /* done in Texinfo::Common::warn_documentlanguagevariant_arguments */
          if (current->e.c->contents.number > 0)
            {
              size_t i;
              STRING_LIST *documentlanguagevariant
                = &parsed_document->global_info.documentlanguagevariant;

              clear_strings_list (documentlanguagevariant);

              for (i = 0; i < current->e.c->contents.number; i++)
                {
                  int valid_variant;
                  int surplus_arg;
                  const ELEMENT *content = current->e.c->contents.list[i];

                  const char *variant
                    = analyze_documentlanguagevariant_argument_e (content,
                                               &valid_variant, &surplus_arg);
  /* messages setup in Texinfo::Common warn_documentlanguagevariant_arguments */
                  if (variant)
                    {
                      if (surplus_arg)
                        command_warn (current,
                         "superfluous content in number %zu argument to @%s",
                              i+1, command_name(current->e.c->cmd));

                      if (valid_variant)
                        {
                          if (strcmp (variant, ""))
                            add_string (documentlanguagevariant, variant);
                        }
                      else
                        {
                          command_warn (current,
                            "unknown language variant: `%s'", variant);
                          add_string (documentlanguagevariant, variant);
                        }
                    }
                  else
                    {
                     /* no different message for malformed and only surplus */
                       command_warn (current,
                                     "bad number %zu argument to @%s",
                                     i+1, command_name(current->e.c->cmd));
                    }
                }
            }
          add_to_element_list (
            &parsed_document->global_commands.language_commands, current);
        }
      else
        {
          if ((current->e.c->parent->e.c->cmd == CM_ftable
               || current->e.c->parent->e.c->cmd == CM_vtable)
              && (current->e.c->cmd == CM_item
                  || current->e.c->cmd == CM_itemx))
            {
              enter_index_entry (current->e.c->parent->e.c->cmd,
                                 current);
            }
          else if (command_flags(current) & CF_index_entry_command)
          /* Index commands */
            {
              enter_index_entry (current->e.c->cmd, current);
            }
          /* if there is a brace command interrupting an index or subentry
             command, replace the internal internal_spaces_before_brace_in_index
             text type with its final type depending on whether there is
             text after the brace command. */
          if ((command_flags(current) & CF_index_entry_command
                || current->e.c->cmd == CM_subentry))
            {
              set_non_ignored_space_in_index_before_command (
                                     current->e.c->contents.list[0]);
            }
        }
    }

  current = current->e.c->parent;
  if (end_command) /* Set above */
    {
      /* More processing of @end */
      ELEMENT *end_elt;

      debug ("C|END COMMAND %s", end_command);
      free (end_command);

      /* Reparent the "@end" element to be a child of the block element. */
      end_elt = pop_element_from_contents (current);

      /* If not a conditional */
      if (parsed_command_data(end_id).data != BLOCK_conditional
          /* ignored conditional */
          || current->e.c->cmd == end_id
          /* not a non-ignored conditional */
          || (conditional_stack.number == 0
              || (top_(conditional_stack) (
                           &conditional_stack))->command != end_id))
        {
          ELEMENT *closed_command;
          /* This closes tree elements (e.g. paragraphs) until we reach
             end_command.  It can print an error if another block command
             is found first. */
          current = close_commands (current, end_id, &closed_command, 0);
          if (!closed_command)
            destroy_element_and_children (end_elt);
          else
            {
              close_command_cleanup (closed_command);

              add_to_element_contents (closed_command, end_elt);

              if (parsed_command_data(closed_command->e.c->cmd).data == BLOCK_menu
                  && parsed_command_data(current_context_command ()).data
                                                              == BLOCK_menu)
                {
                  ELEMENT *e;
                  debug ("C|CLOSE menu but still in menu context");
                  e = new_element (ET_menu_comment);
                  add_to_element_contents (current, e);
                  current = e;
                }
              else if (closed_command->e.c->cmd == CM_float)
                {
                  const ELEMENT *caption = 0;
                  const ELEMENT *shortcaption = 0;
                  size_t i;

                  for (i = 0; i < closed_command->e.c->contents.number; i++)
                    {
                      const ELEMENT *content
                       = closed_command->e.c->contents.list[i];

                      if (!(type_data[content->type].flags & TF_text))
                        {
                          if (content->e.c->cmd == CM_caption)
                            {
                              if (caption)
                                command_warn (content,
                                              "ignoring multiple @%s",
                                             command_name(content->e.c->cmd));
                              else
                                caption = content;
                            }
                          else if (content->e.c->cmd == CM_shortcaption)
                            {
                              if (shortcaption)
                                command_warn (content,
                                              "ignoring multiple @%s",
                                             command_name(content->e.c->cmd));
                              else
                                shortcaption = content;
                            }
                        }
                    }
                }
            }
          if (close_preformatted_command (end_id))
            current = begin_preformatted (current);
        }
      else
        {
          /* If we are in a non-ignored conditional, there is not
             an element for the block in the tree; it is recorded
             in the conditional stack.  Pop it, such that
             the "@end" line does not appear in the final tree for a
             conditional block. */
          CONDITIONAL_ITEM *cond_info = pop_conditional_stack ();
          SOURCE_MARK *end_source_mark;
          SOURCE_MARK *cond_source_mark = cond_info->source_mark;

          debug ("C|POP END COND %s %s", command_name(end_id),
                 command_name(cond_info->command));

          end_source_mark = new_source_mark (cond_source_mark->type);
          end_source_mark->counter = cond_source_mark->counter;
          end_source_mark->status = SM_status_end;
          end_elt->e.c->parent = 0;
          end_source_mark->element = end_elt;
          register_source_mark (current, end_source_mark);
        }
    }
  else
    {
     /* If a file was included, remove the include command completely.
        Also ignore @setfilename in included file, as said in the manual. */
      if (included_file || (cmd == CM_setfilename && top_file_index () > 0))
        {
          SOURCE_MARK *source_mark = 0;
          if (included_file && include_source_mark)
            source_mark = include_source_mark;
          else
            source_mark = new_source_mark (SM_type_setfilename);

          if (source_mark)
            {
              /* keep the elements, also keeping source marks that are within
                removed elements.  For the C parser it is also easier to
                manage the source mark memory which can stay associated
                to the element. */
              source_mark->element = pop_element_from_contents (current);
            /* remove parent information, as the parent could be removed
               from the tree (case of a before_item, for example), and also
               because it seems incorrect to consider that there is a specific
               parent in the tree. */
              source_mark->element->e.c->parent = 0;
              register_source_mark (current, source_mark);
            }
        }
      if (close_preformatted_command (cmd))
        current = begin_preformatted (current);
    }

  if (cmd == CM_setfilename && (current_node || current_section))
    command_warn (misc_cmd, "@setfilename after the first element");
  else if (cmd == CM_columnfractions)
    {
      /* Check if in multitable. */
      if (!current->e.c->parent || !current->e.c->parent->e.c->parent
          || current->e.c->parent->e.c->parent->e.c->cmd != CM_multitable)
        {
          line_error ("@columnfractions only meaningful on a @multitable line");
        }
    }
  else if (parsed_command_data(data_cmd).flags & CF_root)
    {
      SECTION_RELATIONS *section_relations = 0;
      current = last_contents_child (current);

      if (cmd != CM_node)
        {
          section_relations = add_section_to_section_relations_list (
                            &parsed_document->sections_list, current);
          add_extra_integer (current, AI_key_section_number,
                             parsed_document->sections_list.number);

      /* Set 'associated_section' extra key for a node. */
          if (cmd != CM_part)
            {
             /* associate section with the current node as its title. */
              if (current_node)
                {
                  associate_title_command_anchor (current_node, current,
                                                  section_relations, 0);
                  if (!current_node->associated_section)
                    {
                      current_node->associated_section = section_relations;
                      section_relations->associated_node = current_node;
                    }
                }

              if (current_part)
                {
                  section_relations->associated_part = current_part;
                  current_part->part_associated_section = section_relations;
                  if (current->e.c->cmd == CM_top)
                    {
                      line_error_ext (MSG_warning, 0,
                               &current_part->element->e.c->source_info,
                             "@part should not be associated with @top");
                    }
                  current_part = 0;
                }

              current_section = section_relations;
            }
          else /* if (cmd == CM_part) */
            {
              current_part = section_relations;
              if (current_node)
                {
                  if (!(current_node->associated_section))
                    line_warn ("@node precedes @part, but parts may not be "
                               "associated with nodes");
                }
            }
        }
    }
  /* only *heading as sectioning commands are handled just before */
  else if (parsed_command_data(data_cmd).flags & CF_sectioning_heading
           || data_cmd == CM_xrefname)
   {
     HEADING_RELATIONS *heading_relations
       = add_heading_to_heading_relations_list (
                                        &parsed_document->headings_list,
                                        command_element);
     add_extra_integer (command_element, AI_key_heading_number,
                        parsed_document->headings_list.number);
     if (current_node)
       associate_title_command_anchor (current_node, command_element,
                                       0, heading_relations);
   }

  return current;
}

/* Actions to be taken when a whole line of input has been processed */
ELEMENT *
end_line (ELEMENT *current)
{
  ELEMENT *current_old = current; /* Used at very end of function */
  ELEMENT *last_element = last_contents_child (current);
  enum element_type last_element_type = ET_NONE;

  if (last_element)
    last_element_type = last_element->type;

  /* If empty line, start a new paragraph. */
  if (last_element_type == ET_empty_line)
    {
      debug_nonl ("C|END EMPTY LINE in ");
      debug_parser_print_element (current, 0); debug ("");
      if (current->type == ET_paragraph)
        {
          ELEMENT *e;
          /* Remove empty_line element. */
          e = pop_element_from_contents (current);

          debug ("C|CLOSE PARA");
          current = close_container (current);

          /* Add empty_line to higher-level element. */
          add_to_contents_as_array (current, e);
        }
      else if (current->type == ET_preformatted
               && current->e.c->parent->type == ET_menu_entry_description)
        {
          /* happens for an empty line following a menu_description */
          ELEMENT *empty_line, *e;
          empty_line = pop_element_from_contents (current);
          if (current->e.c->contents.number == 0)
            {
              /* it should not be possible to have source marks associated
                 to that container */
              current = current->e.c->parent;
              destroy_element (pop_element_from_contents (current));
            }
          else
            current = current->e.c->parent;

          current = current->e.c->parent->e.c->parent;
          e = new_element (ET_menu_comment);
          add_to_element_contents (current, e);

          current = e;
          e = new_element (ET_preformatted);
          add_to_element_contents (current, e);

          current = e;
          e = new_text_element (ET_after_menu_description_line);
          text_append (e->e.text, empty_line->e.text->text);
          transfer_source_marks (empty_line, e, 0);
          destroy_element (empty_line);
          add_to_contents_as_array (current, e);

          debug ("C|MENU: END DESCRIPTION, OPEN COMMENT");
        }
      else if (current_context () == ct_paragraph)
        {/* in a paragraph, but not directly.  For instance an empty line
            in a style brace @-command */
          current = end_paragraph (current, 0, 0);
        }
      /* TODO Close brace commands in more contexts?  Other contexts here could
         be ct_preformatted, ct_rawpreformatted, ct_math, ct_inlineraw.
         There are t.*.t tests with empty line in brace command in each of
         these contexts.
       */
      else if (current_context () == ct_base)
        { /* closes no_paragraph brace commands that are not context brace
             commands but contain a new line, anchor for example */
          current = close_all_style_commands (current, 0, 0);
        }
    }
  /* The end of the line of a menu entry, without description. */
  else if (current->type == ET_menu_entry_name
           || current->type == ET_menu_entry_node)
    {
      current = end_line_menu_entry (current);
    }
  /* End of a line starting a block. */
  else if (current->type == ET_block_line_arg)
    {
      current = end_line_starting_block (current);
    }
  else if (current->type == ET_line_arg)
    {
      current = end_line_misc_line (current);
    }

  /* 'line' or 'def' at top of "context stack" - this happens when
     line commands are nested (always incorrectly?) */
  if ((current_context () == ct_line
       && top_context_command () != CM_NONE)
       || current_context () == ct_def)
    {
      debug_nonl ("C|Still opened line/block command %s: ",
                  context_name (current_context ()));
      debug_parser_print_element (current, 1); debug ("");

     /* should correspond to a bogus brace @-commands without argument
       followed by spaces only, and not by newline, at the end of the document
       on a line/def command
     */
      if (command_flags(current) & CF_brace)
        {
          line_error ("@%s expected braces",
                      command_name(current->e.c->cmd));
          current = current->e.c->parent;
        }

      if (current_context () == ct_def)
        {
          while (current->e.c->parent
                 && !(current->e.c->parent->flags & EF_def_line))
            {
              current = close_current (current, 0, 0);
            }
        }
      else
        {
          while (current->e.c->parent
                 && current->type != ET_line_arg
                 && current->type != ET_block_line_arg)
            {
              current = close_current (current, 0, 0);
            }
        }

      /* Check is disabled as new_element can reuse storage. */
      if (0 && current == current_old)
        fatal ("infinite loop when closing commands");

      current = end_line (current);
    }
  return current;
}

