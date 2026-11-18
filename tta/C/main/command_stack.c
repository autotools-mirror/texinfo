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

#include "command_ids.h"
#include "tree_types.h"
/* COMMAND_OR_TYPE_STACK */
#include "converter_types.h"
/* HTML_FORMATTING_CONTEXT HTML_DOCUMENT_CONTEXT */
#include "html_converter_state.h"
#include "list_macros.h"
/* fatal */
#include "base_utils.h"
/* for strings lists definitions */
#include "utils.h"
#include "command_stack.h"

/* Generic stack functions */

void
reset_command_stack (COMMAND_STACK *stack)
{
  stack->number = 0;
  stack->space = 0;
  free (stack->list);
  stack->list = 0;
}

def_list_fns(COMMAND_STACK, command, enum command_id, 5);
def_stack_fns(COMMAND_STACK, command, enum command_id);


/* stack of command or type ids */
void
push_command_or_type (COMMAND_OR_TYPE_STACK *stack, enum command_id cmd,
                      enum element_type type)
{
  if (stack->number >= stack->space)
    {
      stack->list
        = realloc (stack->list,
                   (stack->space += 5) * sizeof (COMMAND_OR_TYPE));
    }

  if (type)
    {
      stack->list[stack->number].ct.type = type;
      stack->list[stack->number].variety = CTV_type_type;
    }
  else if (cmd)
    {
      stack->list[stack->number].ct.cmd = cmd;
      stack->list[stack->number].variety = CTV_type_command;
    }
  else
    {
      stack->list[stack->number].ct.cmd = 0;
      stack->list[stack->number].variety = CTV_type_none;
    }

  stack->number++;
}

void
pop_command_or_type (COMMAND_OR_TYPE_STACK *stack)
{
  if (stack->number == 0)
    fatal ("command or type stack empty");

  stack->number--;
}

COMMAND_OR_TYPE *
top_command_or_type (const COMMAND_OR_TYPE_STACK *stack)
{
  if (stack->number == 0)
    fatal ("command or type stack empty for top");

  return &stack->list[stack->number - 1];
}


/* stack of strings */

def_stack_fns(STRING_LIST, string, char *);

/* very similar to add_string, but allow a NULL string argument */
void
push_string_stack_string (STRING_LIST *stack, const char *string)
{
  char *new_string = 0;
  if (string)
    new_string = strdup (string);
  add_(string) (stack, new_string);
}

void
pop_string_stack (STRING_LIST *stack)
{
  char **string = top_(string) (stack);
  free (*string);
  pop_(string) (stack);
}


/* stack of integers */

def_stack_fns(INTEGER_LIST, integer, int);


/* accents/elements stacks */

def_stack_fns(CONST_ELEMENT_LIST, const_element, const ELEMENT *);


/* elements stack that can also be called from an external language (Perl)
   where there is no reference to C elements */

def_list_fns(ELEMENT_REFERENCE_STACK, element_reference, ELEMENT_REFERENCE, 5);
def_stack_fns(ELEMENT_REFERENCE_STACK, element_reference, ELEMENT_REFERENCE);

void
push_element_reference_stack_element (ELEMENT_REFERENCE_STACK *stack,
                                      const ELEMENT *e, const void *hv)
{
  ELEMENT_REFERENCE new_element_reference = { e, hv };
  add_(element_reference) (stack, new_element_reference);
}

int
command_is_in_referred_command_stack (const ELEMENT_REFERENCE_STACK *stack,
                                      const ELEMENT *e, const void *hv)
{
  size_t i;
  for (i = 0; i < stack->number; i++)
    {
      ELEMENT_REFERENCE *element_reference = &stack->list[i];
      if ((e && element_reference->element == e)
          || (hv && element_reference->hv == hv))
        {
          return 1;
        }
    }
  return 0;
}

ELEMENT_REFERENCE_STACK *
new_element_reference_stack (void)
{
  ELEMENT_REFERENCE_STACK *stack = (ELEMENT_REFERENCE_STACK *)
                   malloc (sizeof (ELEMENT_REFERENCE_STACK));
  memset (stack, 0, sizeof (ELEMENT_REFERENCE_STACK));
  return stack;
}

void
destroy_element_reference_stack (ELEMENT_REFERENCE_STACK *stack)
{
  free (stack->list);
  free (stack);
}


/* HTML specific but also used to build Perl data */
HTML_DOCUMENT_CONTEXT *
html_top_document_context (const CONVERTER *self)
{
  const HTML_DOCUMENT_CONTEXT_STACK *stack;
  stack = &self->html_converter->html_document_context;

  if (stack->number == 0)
    fatal ("HTML document context stack empty for top");

  return &stack->list[stack->number - 1];
}

HTML_FORMATTING_CONTEXT *
html_top_formatting_context (const HTML_FORMATTING_CONTEXT_STACK *stack)
{
  if (stack->number == 0)
    fatal ("HTML formatting context stack empty for top");

  return &stack->list[stack->number - 1];
}

