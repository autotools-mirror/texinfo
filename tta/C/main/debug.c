/* Copyright 2014-2026 Free Software Foundation, Inc.

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
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "text.h"
#include "command_ids.h"
#include "tree_types.h"
#include "types_data.h"
/* element_command_name */
#include "builtin_commands.h"
#include "debug.h"

/* Detailed information on elements using a compact format also used for
   tests is available with manipulate_tree.c functions:
    element_print_details and tree_print_details.
 */

const char *
debug_element_command_name (const ELEMENT *e)
{
  if (e->e.c->cmd == CM_TAB)
    return "\\t";
  else if (e->e.c->cmd == CM_NEWLINE)
    return "\\n";
  else
    return element_command_name (e);
}

char *
debug_protect_eol (const char *input_string)
{
  const char *end_of_line;

  if (!input_string)
    return strdup ("[NULL]");

  end_of_line = strpbrk (input_string, "\n\t\f");

  if (end_of_line)
    {
      const char *p = input_string;
      TEXT text;
      text_init (&text);
      while (end_of_line)
        {
          size_t add_len = end_of_line - p;
          if (add_len)
            {
              text_append_n (&text, p, add_len);
              p += add_len;
            }
          if (*end_of_line == '\n')
            text_append_n (&text, "\\n", 2);
          else if (*end_of_line == '\t')
            text_append_n (&text, "\\t", 2);
          else if (*end_of_line == '\f')
            text_append_n (&text, "\\f", 2);
          p += 1;
          end_of_line = strpbrk (p, "\n\t\f");
        }
      if (*p)
        {
          text_append (&text, p);
        }
      return text.text;
    }
  return strdup (input_string);
}

char *
print_element_debug (const ELEMENT *e, int print_parent)
{
  TEXT text;

  text_init (&text);
  text_append (&text, "");
  if (e->type)
    text_printf (&text, "(%s)", type_data[e->type].name);
  if (type_data[e->type].flags & TF_text)
    {
      if (e->e.text->end == 0)
        {
          text_append_n (&text, "[T]", 3);
        }
      else
        {
          char *element_text = debug_protect_eol (e->e.text->text);
          text_printf (&text, "[T: %s]", element_text);
          free (element_text);
        }
    }
  else
    {
      if (e->e.c->cmd)
        text_printf (&text, "@%s", debug_element_command_name (e));
      if (e->e.c->contents.number)
        text_printf (&text, "[C%d]", e->e.c->contents.number);
      if (print_parent && e->e.c->parent)
        {
          text_append (&text, " <- ");
          if (e->e.c->parent->type)
            text_printf (&text, "(%s)", type_data[e->e.c->parent->type].name);
          if (e->e.c->parent->e.c->cmd)
            text_printf (&text, "@%s",
                         element_command_name (e->e.c->parent));
        }
    }
  return text.text;
}

