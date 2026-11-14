/* plaintext_paragraph.h - declarations for plaintext_paragraph.c */
#ifndef PLAINTEXT_PARAGRAPH_H
#define PLAINTEXT_PARAGRAPH_H

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

#include "text.h"

/* list of configuration variables, to be reused in code generation */
#define PARA_CONF_VARIABLES_LIST \
  para_SET_CONF(counter) \
  para_SET_CONF(max) \
  para_SET_CONF(indent_length) \
  para_SET_CONF(indent_length_next) \
  para_SET_CONF(end_line_count) \
  para_SET_CONF(unfilled) \
  para_SET_CONF(no_final_newline) \
  para_SET_CONF(add_final_space) \
  para_SET_CONF(no_break) \
  para_SET_CONF(keep_end_lines) \
  para_SET_CONF(frenchspacing) \
  para_SET_CONF(double_width_no_break) \
  para_SET_CONF(debug)


#define para_SET_CONF(variable) \
void para_set_conf_##variable (int variable);

 PARA_CONF_VARIABLES_LIST

#undef para_SET_CONF

int para_new (void);

void para_set_state (int paragraph);
TEXT_AND_LINE_COUNT para_add_next (const char *, int, int transparent);
TEXT para_add_text (const char *, int, int do_upper_case);
void para_set_space_protection (int no_break);
void para__end_line (void);
TEXT_AND_LINE_COUNT para_end_line (void);
TEXT_AND_LINE_COUNT para_end (void);
void para_destroy (void);
TEXT para_add_pending_word (int add_spaces);
void para_allow_end_sentence (void);
void para_remove_end_sentence (void);
void para_add_end_sentence (void);
int para_end_line_count (void);
void para_add_to_counter (int n);
int para_counter (void);

#endif
