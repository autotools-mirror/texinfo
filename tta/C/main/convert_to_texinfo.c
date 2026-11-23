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

/* In sync with Texinfo::Convert::Texinfo */

#include <config.h>

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "text.h"
#include "command_ids.h"
#include "element_types.h"
#include "tree_types.h"
#include "types_data.h"
/* for lookup_extra* */
#include "extra.h"
/* new_element and destroy_element for convert_contents_to_texinfo */
#include "tree.h"
#include "builtin_commands.h"
/* get_label_element and collapse_spaces */
#include "utils.h"
#include "debug.h"
#include "convert_to_texinfo.h"


static void convert_to_texinfo_internal (const ELEMENT *e, TEXT *result);


#define ADD(x) text_append (result, x)

static void
convert_args (const ELEMENT *element, TEXT *result)
{
  size_t i;
  size_t arg_nr = 0;

  for (i = 0; i < element->e.c->contents.number; i++)
    {
      const ELEMENT *arg = element->e.c->contents.list[i];

      if (arg_nr)
        ADD(",");
      arg_nr++;
      convert_to_texinfo_internal (arg, result);
    }
}

static void
convert_to_texinfo_internal (const ELEMENT *e, TEXT *result)
{
  if (e->flags & EF_inserted || e->type == ET_arguments_line)
    {}
  else if (type_data[e->type].flags & TF_text)
    {
      if (e->type == ET_bracketed_linemacro_arg)
        ADD("{");
      if (e->e.text->end > 0)
        ADD(e->e.text->text);
      if (e->type == ET_bracketed_linemacro_arg)
        ADD("}");
    }
  else
    {
      /* includes user-defined macro calls (which are only in source marks) */
      const char *cmdname = element_command_name (e);
      if (cmdname)
        {
          enum command_id cmd = element_builtin_data_cmd (e);

          ADD("@");  ADD(cmdname);

          if (command_data[cmd].flags & CF_nobrace)
            {
           /* the spaces following a command are put in a text element in the
              tree, not associated to the command element. */
           /* item, tab and headitem are nobrace commands with contents */
              if (e->e.c->contents.number == 0)
                return;
            }
          else if (e->e.c->contents.number > 0
                   && e->e.c->contents.list[0]->type == ET_arguments_line)
            {
           /* root commands and block commands that are not def commands */
              const ELEMENT *arguments = e->e.c->contents.list[0];

           /* used for @macro too, in that case the whole line is the
              only argument, there is no separation by commas */
              convert_args (arguments, result);
            }
          else if (command_data[cmd].flags & CF_brace
                   || command_data[cmd].flags & CF_INFOENCLOSE
                   || e->type == ET_macro_call || e->type == ET_rmacro_call)
            {
       /* contents may not be set for a command without braces.  In that
          case it is better if the command is considered as a command without
          argument. */
              if (e->e.c->contents.number == 0)
                return;

              size_t i;
              int braces = 0;

              size_t arg_nr = 0;

              for (i = 0; i < e->e.c->contents.number; i++)
                {
                  const ELEMENT *arg = e->e.c->contents.list[i];

                  if (arg->type != ET_spaces_after_cmd_before_arg)
                    {
                      if (arg->type != ET_following_arg)
                        {
                          if (arg_nr == 0)
                            {
                              ADD("{");
                              braces = 1;
                            }
                          else
                            ADD(",");
                        }
                      arg_nr++;
                    }
                  convert_to_texinfo_internal (arg, result);
                }

              if (braces)
                ADD("}");
              return;
            }
          else if (command_data[cmd].flags & CF_line
                   || e->type == ET_index_entry_command
                   || e->type == ET_macro_call_line
                   || e->type == ET_rmacro_call_line)
            {
          /* line commands that are not root commands */
              convert_args (e, result);
              return;
            }
          else if (command_data[cmd].flags & CF_def
                   || e->type == ET_linemacro_call)
            { /* @def* commands (that are also block commands) */
            }
          else
            {
              fprintf (stderr,
                       "BUG: Unknown command type to convert to texinfo: %s\n",
                       element_command_name (e));
            }
        }
      else
        {
          if (e->type == ET_bracketed_arg)
            ADD("{");
        }
      if (e->e.c->contents.number > 0)
        {
          size_t i;
          for (i = 0; i < e->e.c->contents.number; i++)
            convert_to_texinfo_internal (e->e.c->contents.list[i], result);
        }

      if (e->type == ET_bracketed_arg)
        ADD("}");
    }

  return;
}
#undef ADD

TEXT
convert_to_texinfo_text (const ELEMENT *e)
{
  TEXT result;
  text_init (&result);

  if (!e)
    return result;

  /* in case of a document without any content expanded, for instance
     containing only containers, we still want to output an empty string */
  text_append (&result, "");
  convert_to_texinfo_internal (e, &result);
  return result;
}

/* Return value to be freed by caller. */
char *
convert_to_texinfo (const ELEMENT *e)
{
  TEXT result = convert_to_texinfo_text (e);
  return result.text;
}

/* Return value to be freed by caller. */
char *
convert_contents_to_texinfo (const ELEMENT *e)
{
  int non_empty;
  ARG_INDICES arg_indices;

  non_empty = non_leading_trailing_indices (e, &arg_indices);

  if (non_empty)
    {
      TEXT result;
      ELEMENT *tmp = new_element (ET_generic_container);
      insert_slice_into_contents (tmp, 0, e, arg_indices.start,
                                  arg_indices.end +1);
      result = convert_to_texinfo_text (tmp);
      destroy_element (tmp);
      return result.text;
    }
  else
    return 0;
}

/* Return value to be freed by caller. */
char *
target_element_to_texi_label (const ELEMENT *element)
{
  const ELEMENT *label_element = get_label_element (element);
  /* get_label_element does not handle links to external manuals in menus */
  if (!label_element)
    {
      return convert_contents_to_texinfo (element);
    }
  return convert_contents_to_texinfo (label_element);
}

int
check_node_same_texinfo_code (const ELEMENT *reference_node,
                              const ELEMENT *node_content)
{
  char *reference_node_texi;
  char *node_texi;
  int equal_texi;
  const char *normalized = lookup_extra_string (reference_node,
                                                AI_key_identifier);

  if (normalized)
    {
      char *tmp_texi;
      const ELEMENT *label_element = get_label_element (reference_node);

      tmp_texi = convert_contents_to_texinfo (label_element);
      reference_node_texi = collapse_spaces (tmp_texi);
      free (tmp_texi);
    }
  else
    reference_node_texi = strdup ("");

  if (node_content)
    {
      char *tmp_texi;

      const ELEMENT *last_content = last_contents_child (node_content);
      if (last_content && last_content->type == ET_space_at_end_menu_node)
        {
          ELEMENT *tmp_elt = new_element (ET_generic_container);
          insert_slice_into_contents (tmp_elt, 0,
                                      node_content, 0,
                                      node_content->e.c->contents.number -1);
          tmp_texi = convert_to_texinfo (tmp_elt);
          destroy_element (tmp_elt);
        }
      else
        tmp_texi = convert_contents_to_texinfo (node_content);

      node_texi = collapse_spaces (tmp_texi);
      free (tmp_texi);
    }
  else
    node_texi = strdup ("");

  equal_texi = !strcmp (reference_node_texi, node_texi);
  free (reference_node_texi);
  free (node_texi);

  return equal_texi;
}

/* for debugging */
/* Return value to be freed by caller. */
char *
root_heading_command_to_texinfo (const ELEMENT *element)
{
  char *tree_txi = 0;
  char *result;

  enum command_id data_cmd = element_builtin_data_cmd (element);

  if (data_cmd)
    {
      if ((data_cmd == CM_node
           || (command_data[data_cmd].flags & CF_sectioning_heading))
          && element->e.c->contents.list[0]->type == ET_arguments_line
          /* Should always be true */
          && element->e.c->contents.list[0]->e.c->contents.list[0]->type
                                                             == ET_line_arg
          && element->e.c->contents.list[0]->e.c->contents.list[0]
                                              ->e.c->contents.number > 0)
        {
          const ELEMENT *tree
            = element->e.c->contents.list[0]->e.c->contents.list[0];
          tree_txi = convert_contents_to_texinfo (tree);
        }
    }
  else
    return strdup ("Not a command");

  if (tree_txi)
    {
      xasprintf (&result, "@%s %s", builtin_command_name (data_cmd),
                                    tree_txi);
      free (tree_txi);
    }
  else
   xasprintf (&result, "@%s", builtin_command_name (data_cmd));

  return (result);
}
