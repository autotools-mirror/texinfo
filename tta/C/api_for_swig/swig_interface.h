/* swig_interface.h - declarations for swig_interface.c */
#ifndef SWIG_INTERFACE_H
#define SWIG_INTERFACE_H

#include <stddef.h>

#include "source_mark_types.h"
#include "tree_types.h"
#include "document_types.h"
#include "swig_error_messages_types.h"

struct TEXT_OPTIONS;

const char *txi_ext_element_command_data_type (ELEMENT *element);

const char *txi_ext_element_type (ELEMENT *element);
const char *txi_ext_element_text (ELEMENT *element);
const char *txi_ext_element_cmdname (ELEMENT *element);
int txi_ext_element_children_number (ELEMENT *element);
ELEMENT *txi_ext_element_get_child (ELEMENT *element, int index);
ELEMENT *txi_ext_element_parent (ELEMENT *element);
SOURCE_INFO *txi_ext_element_source_info (ELEMENT *element);
int txi_ext_element_source_marks_number (ELEMENT *element);
SOURCE_MARK *txi_ext_element_get_source_mark (ELEMENT *element, int index);

ELEMENT *txi_ext_element_list_element_by_index (ELEMENT_LIST *element_list,
                                                int index);
int txi_ext_element_list_elements_number (ELEMENT_LIST *element_list);

const ELEMENT *txi_ext_const_element_list_element_by_index (
                                              CONST_ELEMENT_LIST *element_list,
                                              int index);
int txi_ext_const_element_list_elements_number (
                                     CONST_ELEMENT_LIST *element_list);

int txi_ext_element_attribute_integer (const ELEMENT *element,
                                       const char *attribute,
                                       int *ret);
const char *txi_ext_element_attribute_string (const ELEMENT *element,
                                              const char *attribute);
ELEMENT *txi_ext_element_attribute_element (const ELEMENT *element,
                                            const char *attribute);

char *txi_ext_string_list_string_by_index (STRING_LIST *string_list,
                                           int index);
int txi_ext_string_list_strings_number (STRING_LIST *string_list);

const STRING_LIST *txi_ext_element_misc_args (ELEMENT *element);
const STRING_LIST *txi_ext_element_formal_args (ELEMENT *element);

INDEX_ENTRY *txi_ext_element_index_entry (DOCUMENT *document,
                                          ELEMENT *element);
INDEX *txi_ext_index_entry_index_info (DOCUMENT *document,
                                       INDEX_ENTRY *index_entry);

ELEMENT *txi_ext_store_new_element (DOCUMENT *document, const char *type_name,
                                    const char *command_name);

void txi_ext_element_reset_text (ELEMENT *element);
void txi_ext_element_append_text (ELEMENT *element, const char *text);

int txi_ext_set_element_attribute_integer (ELEMENT *element,
                                           const char *attribute, int value);
int txi_ext_set_element_attribute_string (ELEMENT *element,
                                          const char *attribute,
                                          const char *value);
int txi_ext_set_element_attribute_element (ELEMENT *element,
                                           const char *attribute,
                                           ELEMENT *value);

SECTION_RELATIONS *txi_ext_section_relation_list_section_relation_by_index (
                SECTION_RELATIONS_LIST *section_relation_list, int index);
int txi_ext_section_relation_list_section_relations_number (
                           SECTION_RELATIONS_LIST *section_relation_list);

NODE_RELATIONS *txi_ext_get_node_relations (ELEMENT *element,
                                            DOCUMENT *document);
SECTION_RELATIONS *txi_ext_get_section_relations (ELEMENT *element,
                                                  DOCUMENT *document);
HEADING_RELATIONS *txi_ext_get_heading_relations (ELEMENT *element,
                                                  DOCUMENT *document);

const ELEMENT *txi_ext_node_relation_node_direction (NODE_RELATIONS *node,
                                                     const char *direction);
const SECTION_RELATIONS *txi_ext_section_relation_section_direction (
                                     SECTION_RELATIONS *section,
                                     const char *direction);
const SECTION_RELATIONS *txi_ext_section_relation_toplevel_direction (
                                     SECTION_RELATIONS *section,
                                     const char *direction);

ELEMENT *txi_ext_document_global_unique_command (DOCUMENT *document,
                                                 const char *cmdname);
const ELEMENT_LIST *txi_ext_document_global_command_list (DOCUMENT *document,
                                                          const char *cmdname);

INDEX_ENTRY *txi_ext_sorted_index_entries_by_index (
                     const INDEX_SORTED_BY_INDEX *index_sorted, int index);
int txi_ext_sorted_index_entries_number (
                      const INDEX_SORTED_BY_INDEX *index_sorted);

const INDEX_SORTED_BY_INDEX *txi_ext_get_index_sorted_by_index (
                           DOCUMENT *document,
                           const char *index_name,
                           int use_unicode_collation,
                           const char *collation_language,
                           const char *collation_locale);

FLOAT_INFORMATION *txi_ext_float_list_float_by_index (
                         FLOAT_INFORMATION_LIST *float_list, int index);
int txi_ext_float_list_floats_number (FLOAT_INFORMATION_LIST *float_list);

FLOAT_INFORMATION_LIST *txi_ext_get_float_type_floats_information (
                           DOCUMENT *document, const char *float_type);

GLOBAL_INFO *txi_ext_document_global_information (DOCUMENT *document);

size_t txi_ext_output_parser_error_messages (DOCUMENT *document,
                                  const char *message_encoding,
                                  int no_warn, int use_filename);

size_t txi_ext_output_document_error_messages (DOCUMENT *document,
                                    const char *message_encoding,
                                    int no_warn, int use_filename);

FORMATTED_ERROR_MESSAGE_LIST *txi_ext_get_parser_error_messages (
                                  DOCUMENT *document,
                                  const char *message_encoding,
                                  int no_warn, int use_filename,
                                  int *count);

FORMATTED_ERROR_MESSAGE_LIST *txi_ext_get_document_error_messages (
                                  DOCUMENT *document,
                                  const char *message_encoding,
                                  int no_warn, int use_filename,
                                  int *count);

FORMATTED_ERROR_MESSAGE_LIST *txi_ext_get_error_messages_list_messages (
                                          ERROR_MESSAGE_LIST *error_messages,
                                          const char *message_encoding,
                                          int no_warn, int use_filename,
                                          int *count);
int txi_ext_messages_list_messages_number (
                          FORMATTED_ERROR_MESSAGE_LIST *messages_list);
FORMATTED_ERROR_MESSAGE *txi_ext_messages_list_message_by_index (
                      FORMATTED_ERROR_MESSAGE_LIST *messages_list, int index);

void txi_ext_destroy_error_messages_list (
                      FORMATTED_ERROR_MESSAGE_LIST *error_messages);

#endif
