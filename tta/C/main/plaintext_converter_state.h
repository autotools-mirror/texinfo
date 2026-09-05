/* plaintext_converter_state.h - plaintext-specific converter state */
#ifndef PLAINTEXT_CONVERTER_STATE_H
#define PLAINTEXT_CONVERTER_STATE_H
/* Copyright 2026 Free Software Foundation, Inc.

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

#include "command_ids.h"
#include "text.h"
#include "tree_types.h"
#include "list_macros.h"

typedef struct PLAINTEXT_COMMAND_STRUCT {
    unsigned long flags;
    int indent_format_length;
} PLAINTEXT_COMMAND_STRUCT;

typedef struct FORMATTER_CONTAINER {
    int paragraph; /* Paragaph ID */
} FORMATTER_CONTAINER;

typedef struct FONT_TYPE {
    int monospace;
    int normal;
    int code_command;
} FONT_TYPE;

def_list_type(FONT_TYPE_STACK, FONT_TYPE);
decl_list_fns(FONT_TYPE_STACK, font_type, FONT_TYPE);
decl_stack_fns(FONT_TYPE_STACK, font_type, FONT_TYPE);

typedef struct UPPER_CASE {
    int upper_case;
    int var;
} UPPER_CASE;

def_list_type(UPPER_CASE_STACK, UPPER_CASE);
decl_list_fns(UPPER_CASE_STACK, upper_case, UPPER_CASE);
decl_stack_fns(UPPER_CASE_STACK, upper_case, UPPER_CASE);

typedef struct FORMATTER {
    FORMATTER_CONTAINER container;
    UPPER_CASE_STACK *upper_case_stack;
    FONT_TYPE_STACK *font_type_stack;
    int w;
    INTEGER_STACK frenchspacing_stack;
    int suppress_styles;
    int no_added_eol;
} FORMATTER;

def_list_type(FORMATTER_STACK, FORMATTER);
decl_list_fns(FORMATTER_STACK, formatter, FORMATTER);

def_list_type(QUOTATION_AUTHORS_LIST, CONST_ELEMENT_LIST);
decl_list_fns(QUOTATION_AUTHORS_LIST, quotations_authors, CONST_ELEMENT_LIST);
decl_stack_fns(QUOTATION_AUTHORS_LIST, quotations_authors, CONST_ELEMENT_LIST);

typedef struct DOCUMENT_CONTEXT {
    int in_multitable;
    QUOTATION_AUTHORS_LIST quotations_authors;
} DOCUMENT_CONTEXT;

def_list_type(DOCUMENT_CONTEXT_STACK, DOCUMENT_CONTEXT);
decl_list_fns(DOCUMENT_CONTEXT_STACK, document_context, DOCUMENT_CONTEXT);
decl_stack_fns(DOCUMENT_CONTEXT_STACK, document_context, DOCUMENT_CONTEXT);

typedef struct TARGET_LOCATION {
    const ELEMENT *target_element;
    size_t bytes;
} TARGET_LOCATION;

def_list_type(TARGET_LOCATION_LIST, TARGET_LOCATION);
/* TODO or in convert_to_plaintext.h */
decl_list_fns(TARGET_LOCATION_LIST, target_location, TARGET_LOCATION);

/* better not base on INDEX_ENTRY_LOCATION as it is another type */
def_list_type(INDEX_ENTRY_LINE_COUNT_LIST, int *);
decl_list_fns(INDEX_ENTRY_LINE_COUNT_LIST, index_entry_location, int *);

enum conv_type {
   PLT_text,
   PLT_protected_text,
   PLT_anchor,
   PLT_quoted_image, /* quoted image */
};

typedef struct PENDING_TEXT {
    TEXT text;
    enum conv_type type;
    union {
      const ELEMENT *anchor;
      /* representation of image without control characters, for debugging */
      TEXT image_string;
    } l;
} PENDING_TEXT;

def_list_type(PENDING_TEXT_LIST, PENDING_TEXT);
decl_list_fns(PENDING_TEXT_LIST, pending_text, PENDING_TEXT);

typedef struct COUNT_CONTEXT {
    size_t lines;
    /* converted text in internal encoding (utf-8) */
    PENDING_TEXT_LIST pending_text;
    INDEX_ENTRY_LINE_COUNT_LIST index_entry_locations;
} COUNT_CONTEXT;

def_list_type(COUNT_CONTEXT_STACK, COUNT_CONTEXT);
decl_list_fns(COUNT_CONTEXT_STACK, count_context, COUNT_CONTEXT);

def_list_type(PENDING_TEXT_LIST_LINES, PENDING_TEXT_LIST);

typedef struct FORMAT_CONTEXT {
    enum command_id cmd;
    int paragraph_count;
    int context_indent_len;
    PENDING_TEXT_LIST_LINES *row_cell_lines;
    int cell_idx;
    int paragraph_counts;
    int columns_size_nr;
    int *columns_size;
    enum command_id item_command;
} FORMAT_CONTEXT;

def_list_type(FORMAT_CONTEXT_STACK, FORMAT_CONTEXT);
decl_list_fns(FORMAT_CONTEXT_STACK, format_context, FORMAT_CONTEXT);

typedef struct TEXT_CONTEXT {
    int counter;
    int max;
} TEXT_CONTEXT;

def_list_type(TEXT_CONTEXT_STACK, TEXT_CONTEXT);
decl_list_fns(TEXT_CONTEXT_STACK, text_element_context, TEXT_CONTEXT);

typedef struct STRING_WITH_WIDTH {
    char *string;
    int len;
    /* TODO or size_t?  Matches return type of para_counter */
    int width;
} STRING_WITH_WIDTH;

typedef struct MATH_ELEMENT_IMAGE {
    /* the element is used to make sure that going through the tree
       and through the MATH_ELEMENT_IMAGE_LIST list is done in sync.
     */
    const ELEMENT *element;
    char *filename;
    int dpi;
    int depth;
} MATH_ELEMENT_IMAGE;

def_list_type(MATH_ELEMENT_IMAGE_LIST, MATH_ELEMENT_IMAGE);
decl_list_fns(MATH_ELEMENT_IMAGE_LIST, math_element_image, MATH_ELEMENT_IMAGE);

typedef struct MATH_ELEMENTS_IMAGES {
    /* result of Texinfo::Convert::LaTeX::convert_math_to_images */
    MATH_ELEMENT_IMAGE_LIST math_images;
    MATH_ELEMENT_IMAGE_LIST displaymath_images;
    /* used in conversion to go through the lists above */
    size_t math_index;
    size_t displaymath_index;
} MATH_ELEMENTS_IMAGES;

typedef struct PENDING_FOOTNOTE {
    const ELEMENT *element;
    int number;
    /* in case added elements are needed for the footnote tree to be
       be converted when processing the footnotes text */
    /* currently for a case of invalid Texinfo construct, but could be
       relevant */
    TREE_ADDED_ELEMENTS *added;
} PENDING_FOOTNOTE;

def_list_type(PENDING_FOOTNOTE_LIST, PENDING_FOOTNOTE);
decl_list_fns(PENDING_FOOTNOTE_LIST, pending_footnote, PENDING_FOOTNOTE);
decl_stack_fns(PENDING_FOOTNOTE_LIST, pending_footnote, PENDING_FOOTNOTE);

typedef struct INDEX_ENTRY_INFO {
    const ELEMENT *node;
    int *location;
    int ignored;
    int line_nr;
} INDEX_ENTRY_INFO;

/* see comment re "6 stacks" in Plaintext.pm */
typedef struct PLAINTEXT_CONVERTER_STATE {
    COMMAND_STACK context;
    FORMAT_CONTEXT_STACK format_context;
    /* text_element_context */
    TEXT_CONTEXT_STACK text_element_context;
    FORMATTER_STACK formatters;
    COUNT_CONTEXT_STACK count_context;
    /* document_context */
    DOCUMENT_CONTEXT_STACK document_context;

    /* based on converter format */
    int warn_strong_note;

    /* to cache values based on customization options */
    char *enabled_encoding;
    int to_utf8;
    /* */
    PLAINTEXT_COMMAND_STRUCT commands_data[BUILTIN_CMD_NUMBER];
    int silent;
    const char *open_quote;
    const char *close_quote;
    const char *open_double_quote;
    const char *close_double_quote;

    /* conversion state */
    int in_copying_header;
    const ENCODING_CONVERSION *encoding_object;
    char *output_filename;
    TEXT text_before_first_node;
    const ELEMENT *current_node;
    int multiple_pass;
    int footnote_index;
    /* cache node names */
    STRING_WITH_WIDTH *node_names_cache;
    PENDING_FOOTNOTE_LIST pending_footnotes;
    /* cache "outside of any node" translated string for use in
       printindex formatting */
    TEXT outside_of_any_node_text;
    int outside_of_any_node_text_width;
    size_t bytes;
    TARGET_LOCATION_LIST *target_locations;
    /* register index entries warned as being outside of any node to avoid
       warning twice */
    C_HASHMAP index_entries_no_node;
    /* register node names already warned for characters that should
       not appear in printindex */
    C_HASHMAP index_entry_node_colon;
    INDEX_ENTRY_INFO **index_entry_conversion_info;
    C_HASHMAP seen_node_descriptions;
    C_HASHMAP seenmenus;
    MATH_ELEMENTS_IMAGES *element_images;
    /* added elements during conversion that either are needed until the
       end because they are in tag table or are needed for some time, as
       is the case for footnote added node in case footnotestyle is separate
     */
    ELEMENT_LIST added_element;
} PLAINTEXT_CONVERTER_STATE;

#endif
