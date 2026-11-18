/* command_stack.h - declarations for command_stack.c */
#ifndef COMMAND_STACK_H
#define COMMAND_STACK_H
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

#include "command_ids.h"
#include "element_types.h"
#include "tree_types.h"
#include "converter_types.h"
#include "list_macros.h"
/* ELEMENT_REFERENCE_STACK HTML_DOCUMENT_CONTEXT HTML_FORMATTING_CONTEXT
   HTML_FORMATTING_CONTEXT_STACK */
#include "html_converter_state.h"

decl_list_fns(COMMAND_STACK, command, enum command_id);
decl_stack_fns(COMMAND_STACK, command, enum command_id);

void reset_command_stack (COMMAND_STACK *stack);

void push_command_or_type (COMMAND_OR_TYPE_STACK *stack, enum command_id cmd,
                           enum element_type type);
void pop_command_or_type (COMMAND_OR_TYPE_STACK *stack);
COMMAND_OR_TYPE *top_command_or_type (const COMMAND_OR_TYPE_STACK *stack);

void push_string_stack_string (STRING_LIST *stack, const char *string);
decl_stack_fns(STRING_LIST, string, char *);
void pop_string_stack (STRING_LIST *stack);

decl_stack_fns(INTEGER_LIST, integer, int);

decl_stack_fns(CONST_ELEMENT_LIST, const_element, const ELEMENT *);

void push_element_reference_stack_element (ELEMENT_REFERENCE_STACK *stack,
                                      const ELEMENT *e, const void *hv);
decl_stack_fns(ELEMENT_REFERENCE_STACK, element_reference, ELEMENT_REFERENCE);
int command_is_in_referred_command_stack (const ELEMENT_REFERENCE_STACK *stack,
                                      const ELEMENT *e, const void *hv);
ELEMENT_REFERENCE_STACK *new_element_reference_stack (void);
void destroy_element_reference_stack (ELEMENT_REFERENCE_STACK *stack);

HTML_DOCUMENT_CONTEXT *html_top_document_context (const CONVERTER *self);

HTML_FORMATTING_CONTEXT *html_top_formatting_context
                         (const HTML_FORMATTING_CONTEXT_STACK *stack);
#endif
