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
#include <stdio.h>
#include <stdlib.h>

#include "element_types.h"
#include "command_ids.h"
#include "text.h"
#include "tree_types.h"
#include "types_data.h"
#include "list_macros.h"
/* fatal */
#include "base_utils.h"
#include "extra.h"
#include "builtin_commands.h"
/* for ultimate_index xasprintf */
#include "utils.h"
#include "command_stack.h"
/* for global_parser_conf */
#include "parser_conf.h"
/*
#include "convert_to_texinfo.h"
*/
#include "commands.h"
#include "errors_parser.h"
#include "context_stack.h"
/* parsed_document current_node current_section check_space_element */
#include "parser.h"
#include "indices.h"

size_t space_for_indices = 0;

typedef struct {
    enum command_id cmd;
    INDEX *idx;
} CMD_TO_IDX;

/* Array mapping Texinfo commands to index data structures. */
static CMD_TO_IDX *cmd_to_idx = 0;
static size_t num_index_commands = 0;
static size_t cmd_to_idx_space = 0;

static void
associate_command_to_index (enum command_id cmd, INDEX *idx)
{
  if (num_index_commands == cmd_to_idx_space)
    {
      cmd_to_idx = realloc (cmd_to_idx,
                            sizeof (CMD_TO_IDX) * (cmd_to_idx_space += 10));
      if (!cmd_to_idx)
        fatal ("no index for command");
    }

  cmd_to_idx[num_index_commands].cmd = cmd;
  cmd_to_idx[num_index_commands++].idx = idx;
}

/* Get the index associated with CMD. */
static INDEX *
index_of_command (enum command_id cmd)
{
  size_t i;

  for (i = 0; i < num_index_commands; i++)
    {
      if (cmd_to_idx[i].cmd == cmd)
        return cmd_to_idx[i].idx;
    }
  return 0;
}


/* Save a new Texinfo command with the name CMDNAME and record that it
   creates index entries in IDX. */
static void
add_index_command (char *cmdname, INDEX *idx)
{
  enum command_id new = add_texinfo_command (cmdname);
  user_defined_command_data[new & ~USER_COMMAND_BIT].flags
    |= CF_line | CF_index_entry_command | CF_contain_basic_inline
      | CF_no_paragraph;
  user_defined_command_data[new & ~USER_COMMAND_BIT].data = LINE_line;
  associate_command_to_index (new, idx);
}

static INDEX *
add_index_internal (char *name, int in_code)
{
  INDEX_LIST *indices = &parsed_document->indices_info;
  INDEX *idx = (INDEX *) malloc (sizeof (INDEX));

  memset (idx, 0, sizeof (INDEX));
  idx->name = name;
  idx->in_code = in_code;

  if (indices->number == space_for_indices)
    {
      space_for_indices += 5;
      indices->list
        = realloc (indices->list, space_for_indices * sizeof (INDEX *));
    }

  indices->list[indices->number] = idx;
  indices->number++;

  return idx;
}



/* Add a user defined index with the name NAME */
void
add_index (const char *name, int in_code)
{
  INDEX *idx
    = indices_info_index_by_name (&parsed_document->indices_info, name);
  char *cmdname;

  if (!idx)
    idx = add_index_internal (strdup (name), in_code);

  /* For example, "rq" -> "rqindex". */
  xasprintf (&cmdname, "%s%s", name, "index");
  add_index_command (cmdname, idx);
  free (cmdname);
}

void
init_index_commands (void)
{
  INDEX *idx;
  INDEX_LIST *indices = &parsed_document->indices_info;

  space_for_indices = 0;
  num_index_commands = 0;

  struct def { char *name; int in_code;
               enum command_id cmd2; enum command_id cmd1;}
  *p, default_indices[] = {
    {"cp", 0, CM_cpindex, CM_cindex}, /* concepts */
    {"fn", 1, CM_fnindex, CM_findex}, /* functions */
    {"vr", 1, CM_vrindex, CM_vindex}, /* variables */
    {"ky", 1, CM_kyindex, CM_kindex}, /* keystrokes */
    {"pg", 1, CM_pgindex, CM_pindex}, /* programs */
    {"tp", 1, CM_tpindex, CM_tindex}, /* types */
    {0, 0, 0, 0}
  };
  size_t i, j;

#define MAX (10 * 2)

#define X(command) CM_##command, CM_##command##x
  struct def_cmds { char *name; enum command_id id[MAX]; }
    def_command_indices[] = {
     {"fn",

      {X(deffn),
       X(deftypefn),
       X(deftypeop),
       X(defop),
       X(defun),
       X(defmac),
       X(defspec),
       X(deftypefun),
       X(defmethod),
       X(deftypemethod),
      }
     },

     {"vr",

      {X(defvr),
       X(deftypevr),
       X(defcv),
       X(deftypecv),
       X(defvar),
       X(defivar),
       X(defopt),
       X(deftypevar),
       X(deftypeivar),
      }
     },

     {"tp",

      {X(deftp),}
     }
    };
#undef X

  for (p = default_indices; p->name; p++)
    {
      idx = add_index_internal (strdup (p->name), p->in_code);

      /* Both @cpindex and @cindex are associated. */
      associate_command_to_index (p->cmd2, idx);
      associate_command_to_index (p->cmd1, idx);
    }

  associate_command_to_index (CM_vtable,
    indices_info_index_by_name (indices, "vr"));
  associate_command_to_index (CM_ftable,
    indices_info_index_by_name (indices, "fn"));

  for (i = 0;
       i < sizeof (def_command_indices) / sizeof (def_command_indices[0]);
       i++)
    {
      enum command_id cmd;
      idx = indices_info_index_by_name (indices,
                                        def_command_indices[i].name);
      if (idx)
        {
          for (j = 0; j < MAX; j++)
            {
              cmd = def_command_indices[i].id[j];
              if (cmd)
                associate_command_to_index (cmd, idx);
              else
                break;
            }
        }
    }
#undef MAX
}

/* INDEX_TYPE_CMD is used to determine which index to enter the entry in.
   ELEMENT is the element in the main body of the manual that
   the index entry refers/belongs to.
*/
void
enter_index_entry (enum command_id index_type_cmd,
                   ELEMENT *element)
{
  INDEX *idx;
  INDEX_ENTRY *entry;
  TEXT ignored_chars;

  if (global_parser_conf->no_index)
    return;

  const IGNORED_CHARS *ignored_chars_info
    = &parsed_document->global_info.ignored_chars;

  idx = index_of_command (index_type_cmd);
  if (idx->entries_number == idx->entries_space)
    {
      idx->index_entries = realloc (idx->index_entries,
                     sizeof (INDEX_ENTRY) * (idx->entries_space += 20));
      if (!idx->index_entries)
        fatal ("realloc failed");
    }
  entry = &idx->index_entries[idx->entries_number++];
  memset (entry, 0, sizeof (INDEX_ENTRY));

  entry->index_name = idx->name;
  /* not needed in the parser, the position in the index is directly used.
     Used for sorting */
  entry->number = idx->entries_number;
  entry->entry_element = element;

  /* Create ignored_chars string. */
  text_init (&ignored_chars);
  if (ignored_chars_info->backslash)
    text_append (&ignored_chars, "\\");
  if (ignored_chars_info->hyphen)
    text_append (&ignored_chars, "-");
  if (ignored_chars_info->lessthan)
    text_append (&ignored_chars, "<");
  if (ignored_chars_info->atsign)
    text_append (&ignored_chars, "@");
  if (ignored_chars.end > 0)
    {
      add_extra_string_dup (element, AI_key_index_ignore_chars, ignored_chars.text);
      free (ignored_chars.text);
    }

  /* put in extra "misc_args" as an array with two elements in Perl */
  {
    INDEX_ENTRY_LOCATION *index_entry = (INDEX_ENTRY_LOCATION *)
           malloc (sizeof (INDEX_ENTRY_LOCATION));
    index_entry->index_name = strdup (idx->name);
    index_entry->number = idx->entries_number;
    add_extra_index_entry (element, AI_key_index_entry, index_entry);
  }

  if (nesting_context.regions_stack.number > 0)
    {
      enum command_id region = *top_(command) (&nesting_context.regions_stack);
      add_extra_string_dup (element, AI_key_element_region, command_name (region));
    }
  else if (current_node)
    {
      const char *normalized = lookup_extra_string (current_node->element,
                                                    AI_key_identifier);
      add_extra_string_dup (element, AI_key_element_node, normalized);
    }

  if (nesting_context.regions_stack.number == 0
      && !current_node && !current_section)
    line_warn ("entry for index `%s' outside of any node", idx->name);
}

/* turn spaces that are ignored before @-commands like @sortas{} and
   @seeentry{} back to regular spaces if there is content after the @-command
 */
void
set_non_ignored_space_in_index_before_command (ELEMENT *content)
{
  ELEMENT *e;
  ELEMENT *pending_spaces_element = 0;
  size_t i;
  for (i = 0; i < content->e.c->contents.number; i++)
    {
      e = content->e.c->contents.list[i];
      if (e->type == ET_internal_spaces_before_brace_in_index)
        {
          pending_spaces_element = e;
          /* set to "spaces_at_end" in case there are only spaces after */
          e->type = ET_spaces_at_end;
        }
      else if (pending_spaces_element)
        {
          if (! (!(type_data[e->type].flags & TF_text)
                 && (e->e.c->cmd == CM_sortas
                     || e->e.c->cmd == CM_subentry
                     || e->e.c->cmd == CM_seeentry
                     || e->e.c->cmd == CM_seealso))
              && (! check_space_element (e)))
            {
              pending_spaces_element->type = ET_normal_text;
              pending_spaces_element = 0;
            }
        }
      if (!(type_data[e->type].flags & TF_text)
          && e->e.c->cmd == CM_subentry
          && e->e.c->contents.number > 0)
        {
          set_non_ignored_space_in_index_before_command(
                                                  e->e.c->contents.list[0]);
        }
    }
}



void
resolve_indices_merged_in (const INDEX_LIST *indices_info)
{
  size_t i;
  for (i = 0; i < indices_info->number; i++)
    {
      INDEX *idx = indices_info->list[i];
      if (idx->merged_in)
        {
          /* This index is merged in another one. */
          INDEX *ultimate = ultimate_index (idx);
          idx->merged_in = ultimate;
        }
    }
}

