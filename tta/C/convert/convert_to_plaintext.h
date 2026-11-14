/* convert_to_plaintext.h - definitions for convert_to_plaintext.c */
#ifndef CONVERT_TO_PLAINTEXT_H
#define CONVERT_TO_PLAINTEXT_H

#include "text.h"
#include "command_ids.h"
#include "tree_types.h"
#include "document_types.h"
#include "converter_types.h"
#include "plaintext_converter_state.h"
#include "list_macros.h"

/* Plaintext command data flags */
#define PF_informative            0x0001
#define PF_ignored                0x0002
#define PF_format_raw             0x0004
#define PF_style_map              0x0008
#define PF_asis                   0x0010
#define PF_quoted                 0x0020
#define PF_example_indented       0x0040
#define PF_indented               0x0080
#define PF_format_context         0x0100
#define PF_preformatted_context   0x0200
#define PF_menu                   0x0400
#define PF_punctuation_no_arg     0x0800
#define PF_flush                  0x1000
#define PF_advance_paragraph_count  0x2000
#define PF_no_punctuation_munging   0x4000
#define PF_non_quoted_when_nested   0x8000

typedef struct LINE_WIDTH_PENDING_TEXT {
    PENDING_TEXT_LIST *pending_text;
    int width;
} LINE_WIDTH_PENDING_TEXT;

void plaintext_format_setup (enum converter_format format);

CONVERTER_INITIALIZATION_INFO *plaintext_converter_defaults
                                (enum converter_format format,
                                 const CONVERTER_INITIALIZATION_INFO *conf);

void plaintext_convert_output_unit (CONVERTER *self,
                                    const OUTPUT_UNIT *output_unit);
TEXT plaintext_output (CONVERTER *self, DOCUMENT *document);

TEXT plaintext_convert (CONVERTER *self, DOCUMENT *document);

TEXT plaintext_convert_tree (CONVERTER *self, const ELEMENT *tree);

void plaintext_free_converter (CONVERTER *self);
void plaintext_converter_initialize (CONVERTER *self);

FORMATTER new_paragraph_formatter (CONVERTER *self, int indent_length,
                                   int indent_length_next);
FORMATTER new_line_formatter (CONVERTER *self, int indent_length);
FORMATTER new_unfilled_formatter (CONVERTER *self, int indent_length);
void push_formatter (CONVERTER *self, const FORMATTER *formatter);
void pop_formatter (CONVERTER *self, int reuse_formatter);


void plaintext_conversion_initialization (CONVERTER *self, DOCUMENT *document);
void plaintext_conversion_finalization (CONVERTER *self);
const enum command_id *plaintext_get_informative_global_commands (void);

void plaintext_node_name (CONVERTER *self, const ELEMENT *element,
                          STRING_WITH_WIDTH *string_result);
int info_cache_node_names (CONVERTER *self, NODE_RELATIONS_LIST *nodes_list,
                           int check_index_string_in_node_names);
void plaintext_process_one_footnote (CONVERTER *self,
                                     const PENDING_FOOTNOTE *footnote_info);
void plaintext_process_printindex (CONVERTER *self,
                                   const ELEMENT *printindex, int in_info);
int plaintext_stream_image_formatted_text (CONVERTER *self,
                                       const ELEMENT *element,
                                       const char *basefile, TEXT text);

void plaintext_setup_output_encoding (CONVERTER *self);
void plaintext_encode_string (CONVERTER *self, const TEXT *text, TEXT *result);

void plaintext_add_quoted_image (CONVERTER *self, TEXT *image_string,
                                 TEXT *image_quoted, TEXT *trailing_text);
void convert_to_plaintext_internal (CONVERTER *self, const ELEMENT *e);
/* TODO add plaintext_ prefix for all the functions? */
void add_lines_count (CONVERTER *self, int lines_count);
void stream_output_n (CONVERTER *self, const char *text, size_t n);
void stream_output (CONVERTER *self, const char *text);
void stream_output_nl (CONVERTER *self, const TEXT_AND_LINE_COUNT text_nl);
void stream_output_add_text (CONVERTER *self, const char *text, size_t n,
                             int do_upper_case);
void stream_output_add_next (CONVERTER *self, const char *text, size_t n,
                             int transparent);
TEXT pending_to_text (PENDING_TEXT_LIST *pending_texts);
void stream_final_result (CONVERTER *self, TEXT *result);

void plaintext_add_target_location (CONVERTER *self, const ELEMENT *element);
int plaintext_convert_line (CONVERTER *self, const ELEMENT *converted,
                            int indent_length, int suppress_styles,
                            int no_added_eol);
void plaintext_convert_line_new_context (CONVERTER *self,
                          const ELEMENT *converted,
                          int indent_length, int suppress_styles,
                          int no_added_eol,
                          LINE_WIDTH_PENDING_TEXT *output);

void pop_count_context (COUNT_CONTEXT_STACK *stack);
void add_newline_if_needed (CONVERTER *self);

decl_list_fns(FONT_TYPE_STACK, font_type, FONT_TYPE);
decl_stack_fns(FONT_TYPE_STACK, font_type, FONT_TYPE);

decl_list_fns(FORMATTER_STACK, formatter, FORMATTER);
decl_stack_fns(FORMATTER_STACK, formatter, FORMATTER);

decl_list_fns(QUOTATION_AUTHORS_LIST, quotations_authors, CONST_ELEMENT_LIST);
decl_stack_fns(QUOTATION_AUTHORS_LIST, quotations_authors, CONST_ELEMENT_LIST);

decl_list_fns(DOCUMENT_CONTEXT_STACK, document_context, DOCUMENT_CONTEXT);
decl_stack_fns(DOCUMENT_CONTEXT_STACK, document_context, DOCUMENT_CONTEXT);

decl_list_fns(TARGET_LOCATION_LIST, target_location, TARGET_LOCATION);
decl_list_fns(INDEX_ENTRY_LINE_COUNT_LIST, index_entry_location, int *);
decl_list_fns(PENDING_TEXT_LIST, pending_text, PENDING_TEXT);

decl_list_fns(COUNT_CONTEXT_STACK, count_context, COUNT_CONTEXT);
decl_stack_fns(COUNT_CONTEXT_STACK, count_context, COUNT_CONTEXT);

decl_list_fns(FORMAT_CONTEXT_STACK, format_context, FORMAT_CONTEXT);
decl_list_fns(TEXT_CONTEXT_STACK, text_element_context, TEXT_CONTEXT);
decl_list_fns(MATH_ELEMENT_IMAGE_LIST, math_element_image, MATH_ELEMENT_IMAGE);

decl_list_fns(PENDING_FOOTNOTE_LIST, pending_footnote, PENDING_FOOTNOTE);
decl_stack_fns(PENDING_FOOTNOTE_LIST, pending_footnote, PENDING_FOOTNOTE);
#endif
