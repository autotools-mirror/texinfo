/* parser.h - include many other header files.  type declarations.
   declarations for close.c, end_line.c, separator.c, parser.c,
   multitable.c, and menu.c. */

#ifndef PARSER_H
#define PARSER_H
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

#include <stddef.h>

#include "element_types.h"
#include "command_ids.h"
#include "source_mark_types.h"
#include "tree_types.h"
#include "document_types.h"
#include "counter.h"


/* Not set currently.
extern const ELEMENT *internal_space_holder;
 */

/* In close.c */
void remove_empty_content (ELEMENT *current);
ELEMENT *close_container (ELEMENT *current);
void close_command_cleanup (ELEMENT *current);
ELEMENT *close_commands (ELEMENT *current, enum command_id closed_block_cmd,
                         ELEMENT **closed_element,
                         enum command_id interrupting_cmd);
ELEMENT *close_all_style_commands (ELEMENT *current,
                               enum command_id closed_block_cmd,
                               enum command_id interrupting_cmd);
ELEMENT *close_current (ELEMENT *current,
                        enum command_id closed_block_cmd,
                        enum command_id interrupting_cmd);
ELEMENT *close_brace_command (ELEMENT *current,
                              enum command_id closed_block_cmd,
                              enum command_id interrupting_cmd,
                              int missing_brace);
void close_ignored_block_conditional (ELEMENT *current);

/* In end_line.c */
ELEMENT *end_line (ELEMENT *current);
ELEMENT *end_line_misc_line (ELEMENT *current);
ELEMENT *end_line_starting_block (ELEMENT *current);

/* In separator.c */
ELEMENT *handle_open_brace (ELEMENT *current, const char **line_inout);
ELEMENT *handle_close_brace (ELEMENT *current, const char **line_inout);
ELEMENT *handle_comma (ELEMENT *current, const char **line_inout);

/* In parser.c */
typedef struct {
    enum command_id command;
    SOURCE_MARK *source_mark;
} CONDITIONAL_ITEM;

ELEMENT *setup_document_root_and_before_node_section (void);
void parse_texi (ELEMENT *current_elt);
void parse_texi_document (void);

def_list_type(CONDITIONAL_ITEM_STACK, CONDITIONAL_ITEM);
decl_list_fns(CONDITIONAL_ITEM_STACK, conditional_stack, CONDITIONAL_ITEM);
decl_stack_fns(CONDITIONAL_ITEM_STACK, conditional_stack, CONDITIONAL_ITEM);

void push_conditional_stack (enum command_id cond, SOURCE_MARK *source_mark);
CONDITIONAL_ITEM *pop_conditional_stack (void);
extern CONDITIONAL_ITEM_STACK conditional_stack;

void move_last_space_to_element (ELEMENT *current);
void abort_empty_line (ELEMENT *current);
ELEMENT *end_paragraph (ELEMENT *current,
                        enum command_id closed_block_cmd,
                        enum command_id interrupting_cmd);
ELEMENT *end_paragraph_preformatted (ELEMENT *current,
                                 enum command_id closed_block_cmd,
                                 enum command_id interrupting_cmd);
void isolate_trailing_space (ELEMENT *current, enum element_type spaces_type);
int kbd_formatted_as_code (void);
int parent_of_command_as_argument (ELEMENT *current);
void register_command_as_argument (ELEMENT *cmd_as_arg);
ELEMENT *begin_preformatted (ELEMENT *current);
ELEMENT *end_preformatted (ELEMENT *current,
                           enum command_id closed_block_cmd,
                           enum command_id interrupting_cmd);
char *read_command_name (const char **ptr);
const char *read_comment (const char *line, int *has_comment);
void isolate_leading_trailing (ELEMENT *current, int isolate_leading_only);
char *text_contents_to_plain_text (ELEMENT *e, int *superfluous_arg);
ELEMENT *merge_text (ELEMENT *current, const char *text, size_t text_len,
                     ELEMENT *transfer_marks_element);
int check_space_element (ELEMENT *e);
void gather_spaces_after_cmd_before_arg (ELEMENT *current);
char *parse_command_name (const char **ptr, int *single_char);

/* Return values */
#define GET_A_NEW_LINE 0
#define STILL_MORE_TO_PROCESS 1
#define FINISHED_TOTALLY 2

extern const char *whitespace_chars_except_newline;
extern const char *linecommand_expansion_delimiters;

extern DOCUMENT *parsed_document;

extern FLOAT_RECORD_LIST parser_float_records;
extern C_HASHMAP warned_deprecated_commands;

extern NODE_RELATIONS *current_node;
extern const SECTION_RELATIONS *current_section;
extern SECTION_RELATIONS *current_part;

extern char *global_documentlanguage;
extern char *global_documentscript;

enum kbd_enum {kbd_none, kbd_code, kbd_example, kbd_distinct };
extern enum kbd_enum global_kbdinputstyle;

int register_global_command (ELEMENT *current, enum command_id cmd_in);

extern COUNTER count_remaining_args, count_items, count_cells;
void reset_parser_counters (void);

/* In multitable.c */
ELEMENT *item_multitable_parent (ELEMENT *current);
void gather_previous_item (ELEMENT *current, enum command_id next_command);

/* In menus.c */
int handle_menu_entry_separators (ELEMENT **current_inout,
                                  const char **line_inout);
ELEMENT *end_line_menu_entry (ELEMENT *current);
#endif
