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

%module Texinfo

/* We do not include config.h as the define there could be incompatible with
   the language define.  This is likely to be the case for Perl, see comments
   in build_perl_info.c.

   We define DATADIR on the command-line.
 */

/* All the functions defined inline should have their name prefixed by
   txi_ext_inline_ and use a rename in order to prevent name clashes with
   names (including future names) in Texinfo C libraries.  Similarly, all
    the functions defined in convert/swig_* have a txi_ext_ prefix.
 */

%{
#include <stddef.h>
#include <stdlib.h>
/* not necessarily used, but could be for debugging */
#include <stdio.h>

#include "source_mark_types.h"
#include "element_types.h"
#include "types_data.h"
#include "tree_types.h"
#include "reader_types.h"
#include "translations.h"
#include "parser_api.h"
#include "parser_conf.h"
#include "set_parser_conf.h"
#include "tree.h"
#include "targets.h"
#include "utils.h"
#include "errors.h"
#include "node_name_normalization.h"
#include "convert_to_texinfo.h"
#include "manipulate_tree.h"
#include "document.h"
#include "manipulate_indices.h"
#include "transformations.h"
#include "reader_api.h"
#include "convert_to_text.h"
/* expand_verbatiminclude */
#include "convert_utils.h"
#include "swig_element_data.h"
#include "swig_error_messages_types.h"
#include "swig_text_options.h"
#include "swig_interface.h"
#include "swig_parser_api.h"
%}

// incremented for incompatible changes after 7.3
#define interface_version 1

// Initialization

%init %{
general_output_strings_setup ();

reset_parser (0);
%}

%rename(setup) txi_ext_inline_setup;
// TODO consider removing the paths arguments, there is no clear use case
// which would require setting a different path than the one
// automatically determined.
void
txi_ext_inline_setup (int texinfo_uninstalled=0, const char *datadir_in=0,
                      const char *t2a_builddir_in=0,
                      const char *t2a_srcdir_in=0);

%{
void
txi_ext_inline_setup (int texinfo_uninstalled, const char *datadir_in,
                      const char *t2a_builddir_in,
                      const char *t2a_srcdir_in)
{
  char *t2a_srcdir = 0;
  char *t2a_builddir = 0;
  const char *datadir;

  if (datadir_in)
    datadir = datadir_in;
  else
    datadir = DATADIR;

  if (texinfo_uninstalled)
    {
      if (t2a_srcdir_in)
        t2a_srcdir = strdup (t2a_srcdir_in);
      else
        {
          t2a_srcdir = getenv ("t2a_srcdir");
          if (t2a_srcdir)
            t2a_srcdir = strdup (t2a_srcdir);
          else
            /* swig/somelanguage */
            t2a_srcdir = strdup ("../../");
        }
      if (t2a_builddir_in)
        t2a_builddir = strdup (t2a_builddir_in);
      else
        {
          t2a_builddir = getenv ("t2a_builddir");
          if (!t2a_builddir)
            /* this is correct for in-source builds only. */
            t2a_builddir = strdup (t2a_srcdir);
          else
            t2a_builddir = strdup (t2a_builddir);
        }
    }

  /* initialize the C library */
  messages_and_encodings_setup (datadir);
  setup_texinfo_main (texinfo_uninstalled, datadir,
                      t2a_builddir, t2a_srcdir);

  free (t2a_builddir);
  free (t2a_srcdir);
}
%}


// Access to lists used in different places

// swig_interface.h

// elements lists
%rename(element_list_element_by_index) txi_ext_element_list_element_by_index;
ELEMENT *txi_ext_element_list_element_by_index (ELEMENT_LIST *element_list,
                                                int index);
%rename(element_list_elements_number) txi_ext_element_list_elements_number;
int txi_ext_element_list_elements_number (ELEMENT_LIST *element_list);

%rename(const_element_list_element_by_index) txi_ext_const_element_list_element_by_index;
const ELEMENT *txi_ext_const_element_list_element_by_index (
                                              CONST_ELEMENT_LIST *element_list,
                                              int index);
%rename(const_element_list_elements_number) txi_ext_const_element_list_elements_number;
int txi_ext_const_element_list_elements_number (CONST_ELEMENT_LIST *element_list);

// strings lists
%rename(string_list_string_by_index) txi_ext_string_list_string_by_index;
char *txi_ext_string_list_string_by_index (STRING_LIST *string_list, int index);
%rename(string_list_strings_number) txi_ext_string_list_strings_number;
int txi_ext_string_list_strings_number (STRING_LIST *string_list);

// error messages lists

// swig_error_messages_types.h
// Only fields with currently used getters
typedef struct FORMATTED_ERROR_MESSAGE {
    int continuation;
    char *formatted;
} FORMATTED_ERROR_MESSAGE;

// swig_interface.h
%rename(messages_list_messages_number) txi_ext_messages_list_messages_number;
int txi_ext_messages_list_messages_number (FORMATTED_ERROR_MESSAGE_LIST *messages_list);
%rename(messages_list_message_by_index) txi_ext_messages_list_message_by_index;
FORMATTED_ERROR_MESSAGE *txi_ext_messages_list_message_by_index (
                      FORMATTED_ERROR_MESSAGE_LIST *messages_list, int index);

%rename(destroy_error_messages_list) txi_ext_destroy_error_messages_list;
void txi_ext_destroy_error_messages_list (FORMATTED_ERROR_MESSAGE_LIST *error_messages);


// Information on elements

%include "swig_element_types.h"

// swig_element_data.h
#define cm_flag(name) \
  %rename(element_command_is_##name) txi_ext_element_command_is_##name;
TXI_CM_FLAGS_LIST
#undef cm_flag

#define cm_oflag(name) \
  %rename(element_command_is_##name) txi_ext_element_command_is_##name;
TXI_CM_OTHER_FLAGS_LIST
#undef cm_oflag

#define ty_flag(name) \
  %rename(element_type_is_##name) txi_ext_element_type_is_##name;
TXI_TY_FLAGS_LIST
#undef ty_flag

%include "swig_element_data.h"

// swig_interface.h
%rename (element_command_data_type) txi_ext_element_command_data_type;
const char *txi_ext_element_command_data_type (ELEMENT *element);


// Parser
// swig_parser_api.h

%rename (parser) txi_ext_parser;
%rename (destroy_parser) txi_ext_destroy_parser;

// parsing entry points
%rename (parse_file) txi_ext_parse_file;
DOCUMENT *txi_ext_parse_file (PARSER *parser, const char *input_file_path,
                              int *OUTPUT);
%rename (parse_piece) txi_ext_parse_piece;
DOCUMENT *txi_ext_parse_piece (PARSER *parser, const char *string,
                               int line_nr=1);
%rename (parse_string) txi_ext_parse_string;
DOCUMENT *txi_ext_parse_string (PARSER *parser, const char *string,
                                int line_nr=1);
%rename (parse_text) txi_ext_parse_text;
DOCUMENT *txi_ext_parse_text (PARSER *parser, const char *string,
                              int line_nr=1);

// Parser configuration
%rename (parser_conf_reset_values) txi_ext_parser_conf_reset_values;
%rename (parser_conf_add_value) txi_ext_parser_conf_add_value;

%rename (parser_conf_set_show_menu) txi_ext_parser_conf_set_show_menu;
%rename (parser_conf_set_CPP_LINE_DIRECTIVES) txi_ext_parser_conf_set_CPP_LINE_DIRECTIVES;
%rename (parser_conf_set_DEBUG) txi_ext_parser_conf_set_DEBUG;
%rename (parser_conf_set_IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME) txi_ext_parser_conf_set_IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME;
%rename (parser_conf_set_MAX_MACRO_CALL_NESTING) txi_ext_parser_conf_set_MAX_MACRO_CALL_NESTING;
%rename (parser_conf_set_NO_INDEX) txi_ext_parser_conf_set_NO_INDEX;
%rename (parser_conf_set_NO_USER_COMMANDS) txi_ext_parser_conf_set_NO_USER_COMMANDS;
%rename (parser_conf_clear_INCLUDE_DIRECTORIES) txi_ext_parser_conf_clear_INCLUDE_DIRECTORIES;
%rename (parser_conf_add_include_directory) txi_ext_parser_conf_add_include_directory;
%rename (parser_conf_clear_expanded_formats) txi_ext_parser_conf_clear_expanded_formats;
%rename (parser_conf_add_expanded_format) txi_ext_parser_conf_add_expanded_format;
%rename (parser_conf_set_documentlanguage) txi_ext_parser_conf_set_documentlanguage;
%rename (parser_conf_set_documentscript) txi_ext_parser_conf_set_documentscript;
%rename (parser_conf_set_DOC_ENCODING_FOR_INPUT_FILE_NAME) txi_ext_parser_conf_set_DOC_ENCODING_FOR_INPUT_FILE_NAME;
%rename (parser_conf_set_INPUT_FILE_NAME_ENCODING) txi_ext_parser_conf_set_INPUT_FILE_NAME_ENCODING;
%rename (parser_conf_set_LOCALE_ENCODING) txi_ext_parser_conf_set_LOCALE_ENCODING;
%rename (parser_conf_set_COMMAND_LINE_ENCODING) txi_ext_parser_conf_set_COMMAND_LINE_ENCODING;
%rename (parser_conf_set_accept_internalvalue) txi_ext_parser_conf_set_accept_internalvalue;
%rename (parser_conf_get_INCLUDE_DIRECTORIES) txi_ext_parser_conf_get_INCLUDE_DIRECTORIES;

%include "swig_parser_api.h"

// Only one of the next two function should be called as both clear the
// document errors list.

// swig_interface.h
// Output the error messages on stderr
%rename(output_parser_error_messages) txi_ext_output_parser_error_messages;

size_t txi_ext_output_parser_error_messages (DOCUMENT *document,
                                  const char *message_encoding=0,
                                  int no_warn=0, int use_filename=0);

// Get the error messages.  The caller should call
// destroy_error_messages_list on the return value when done.
%rename(get_parser_error_messages) txi_ext_get_parser_error_messages;
FORMATTED_ERROR_MESSAGE_LIST *txi_ext_get_parser_error_messages (
                                  DOCUMENT *document,
                                  const char *message_encoding=0,
                                  int no_warn=0, int use_filename=0,
                                  int *OUTPUT);


// Structuring

// document.h
void set_document_options (DOCUMENT *document,
                      const OPTIONS_LIST *program_options=0,
                      const OPTIONS_LIST *cmdline_options=0,
                      const OPTIONS_LIST *init_files_options=0);

// transformations.h
/* document tree transformations selection flags */
#define STTF_complete_tree_nodes_menus              0x0001
#define STTF_complete_tree_nodes_missing_menu       0x0002
#define STTF_fill_gaps_in_sectioning                0x0004
#define STTF_move_index_entries_after_items         0x0008
#define STTF_regenerate_master_menu                 0x0010
#define STTF_relate_index_entries_to_table_items    0x0020

/* document structuring selection flags */
#define STTF_floats                                 0x0080
#define STTF_no_warn_non_empty_parts                0x0100
#define STTF_nodes_tree                             0x0200
/* #define STTF_       0x0400 */

/* for complete_tree_nodes_menus, complete_tree_nodes_missing_menu
   and regenerate_master_menu */
#define STTF_complete_menus_use_sections            0x0800

/* backward compatibility */
#define STTF_insert_nodes_for_sectioning_commands   0x8000

void complete_transform_document (DOCUMENT *document, unsigned long flags,
                                  int format_menu, int auto_section_node=0,
                                  int warn_duplicate_section_target=0,
                                  const char *fill_gap_heading_texi=0);

// manipulate_tree.h
ELEMENT *protect_comma_in_tree (ELEMENT *tree);
ELEMENT *protect_colon_in_tree (ELEMENT *tree);
ELEMENT *reference_to_arg_in_tree (ELEMENT *tree, DOCUMENT *document);
// transformations.h
ELEMENT *protect_hashchar_at_line_beginning (ELEMENT *tree, DOCUMENT *document);
void protect_first_parenthesis_in_targets (ELEMENT *tree);


// Only one of the next two function should be called as both clear the
// document errors list.

// swig_interface.h
// Output the error messages on stderr
%rename(output_document_error_messages) txi_ext_output_document_error_messages;
size_t txi_ext_output_document_error_messages (DOCUMENT *document,
                                    const char *message_encoding=0,
                                    int no_warn=0, int use_filename=0);

// Get the error messages.  The caller should call
// destroy_error_messages_list on the return value when done.
%rename(get_document_error_messages) txi_ext_get_document_error_messages;
FORMATTED_ERROR_MESSAGE_LIST *txi_ext_get_document_error_messages (
                                  DOCUMENT *document,
                                  const char *message_encoding=0,
                                  int no_warn=0, int use_filename=0,
                                  int *OUTPUT);

// Document interface

%rename(document_tree) txi_ext_inline_document_tree;
%inline %{
ELEMENT *txi_ext_inline_document_tree (DOCUMENT *document);
%}

%{
ELEMENT *txi_ext_inline_document_tree (DOCUMENT *document)
{
  return document->tree;
}
%}

// targets.h
%rename(get_element_by_identifier) txi_ext_inline_get_element_by_identifier;
%inline %{
ELEMENT *txi_ext_inline_get_element_by_identifier (DOCUMENT *document,
                                    const char *identifier);
%}

%{
ELEMENT *
txi_ext_inline_get_element_by_identifier (DOCUMENT *document,
                                          const char *identifier)
{
  return find_identifier_target (&document->identifiers_target, identifier);
}
%}

// swig_interface.h
%rename(document_global_unique_command) txi_ext_document_global_unique_command;
ELEMENT *txi_ext_document_global_unique_command (DOCUMENT *document,
                                                 const char *cmdname);
%rename(document_global_command_list) txi_ext_document_global_command_list;
const ELEMENT_LIST *txi_ext_document_global_command_list (DOCUMENT *document,
                                                          const char *cmdname);

// node_name_normalization.h
%newobject convert_to_identifier;
char *convert_to_identifier (const ELEMENT *element);

// index sorting and associated data

// tree_types.h
// without the index entries
typedef struct INDEX {
    char *name;
    int in_code;

    struct INDEX *merged_in; /* Index this index is merged into, if any. */
} INDEX;

typedef struct INDEX_ENTRY {
    char *index_name; /* kept with the entry as the indices may be merged */
    int number; /* position in the original index.  May be different in
                   merged index */
    ELEMENT *entry_element;
    ELEMENT *entry_associated_element; /* set if the entry is reassociated to
                                          another element */
} INDEX_ENTRY;

// swig_interface.h
%rename(sorted_index_entries_by_index) txi_ext_sorted_index_entries_by_index;
INDEX_ENTRY *txi_ext_sorted_index_entries_by_index (
                     const INDEX_SORTED_BY_INDEX *index_sorted, int index);
%rename(sorted_index_entries_number) txi_ext_sorted_index_entries_number;
int txi_ext_sorted_index_entries_number (
                     const INDEX_SORTED_BY_INDEX *index_sorted);

// FIXME remove to avoid needing translations in the interface?
// no language tailoring available, since we use C code only and there
// is no language tailoring for index sorting in C only.
%rename(get_index_sorted_by_index) txi_ext_inline_get_index_sorted_by_index;
const INDEX_SORTED_BY_INDEX *txi_ext_inline_get_index_sorted_by_index (
                           DOCUMENT *document,
                           const char *index_name,
                           int use_unicode_collation=1);
/* wrapper without language tailoring */
%{
const INDEX_SORTED_BY_INDEX *txi_ext_inline_get_index_sorted_by_index (
                           DOCUMENT *document,
                           const char *index_name,
                           int use_unicode_collation)
{
  return txi_ext_get_index_sorted_by_index (document, index_name,
                              use_unicode_collation, 0, 0);
}
%}

// listoffloats
// tree_types.h
typedef struct {
    ELEMENT *float_element;
    const SECTION_RELATIONS *float_section;
} FLOAT_INFORMATION;

// swig_interface.h
%rename(float_list_float_by_index) txi_ext_float_list_float_by_index;
FLOAT_INFORMATION *txi_ext_float_list_float_by_index (
                         FLOAT_INFORMATION_LIST *float_list, int index);
%rename(float_list_floats_number) txi_ext_float_list_floats_number;
int txi_ext_float_list_floats_number (FLOAT_INFORMATION_LIST *float_list);

%rename(get_float_type_floats_information) txi_ext_get_float_type_floats_information;
FLOAT_INFORMATION_LIST *txi_ext_get_float_type_floats_information (
                            DOCUMENT *document, const char *float_type);

// Document-wide information
/* Only document-wide interesting information */
typedef struct GLOBAL_INFO {
    char *input_file_name;
    char *input_directory;
    char *input_encoding_name;
    STRING_LIST included_files;
} GLOBAL_INFO;

%rename(document_global_information) txi_ext_document_global_information;
GLOBAL_INFO *txi_ext_document_global_information (DOCUMENT *document);


// Tree Element interface

// Access to tree element information

// tree_types.h
typedef struct SOURCE_INFO {
    int line_nr;
    char *file_name;
    char *macro;
} SOURCE_INFO;

// for SOURCE_MARK
%include "source_mark_types.h"

// swig_interface.h
%rename(element_type) txi_ext_element_type;
const char *txi_ext_element_type (ELEMENT *element);
%rename(element_text) txi_ext_element_text;
const char *txi_ext_element_text (ELEMENT *element);
// returns the macro name for user-defined macro calls too
%rename(element_cmdname) txi_ext_element_cmdname;
const char *txi_ext_element_cmdname (ELEMENT *element);
%rename(element_children_number) txi_ext_element_children_number;
int txi_ext_element_children_number (ELEMENT *element);
%rename(element_get_child) txi_ext_element_get_child;
ELEMENT *txi_ext_element_get_child (ELEMENT *element, int index);
%rename(element_parent) txi_ext_element_parent;
ELEMENT *txi_ext_element_parent (ELEMENT *element);
%rename(element_source_info) txi_ext_element_source_info;
SOURCE_INFO *txi_ext_element_source_info (ELEMENT *element);
%rename(element_source_marks_number) txi_ext_element_source_marks_number;
int txi_ext_element_source_marks_number (ELEMENT *element);
%rename(element_get_source_mark) txi_ext_element_get_source_mark;
SOURCE_MARK *txi_ext_element_get_source_mark (ELEMENT *element, int index);

// It would have been better to return None/undef/nil if not set and
// a value otherwise, but it does not seems to be possible, likely because
// not all languages have a value such as None.
// if OUTPUT is not 0, the value is undefined.
%rename(element_attribute_integer) txi_ext_element_attribute_integer;
int txi_ext_element_attribute_integer (const ELEMENT *element,
                                       const char *attribute,
                                       int *OUTPUT);
%rename(element_attribute_string) txi_ext_element_attribute_string;
const char *txi_ext_element_attribute_string (const ELEMENT *element,
                                             const char *attribute);
%rename(element_attribute_element) txi_ext_element_attribute_element;
ELEMENT *txi_ext_element_attribute_element (const ELEMENT *element,
                                            const char *attribute);

%rename(element_index_entry) txi_ext_element_index_entry;
INDEX_ENTRY *txi_ext_element_index_entry (DOCUMENT *document,
                                          ELEMENT *element);
%rename(index_entry_index_info) txi_ext_index_entry_index_info;
INDEX *txi_ext_index_entry_index_info (DOCUMENT *document,
                                       INDEX_ENTRY *index_entry);

%rename(element_misc_args) txi_ext_element_misc_args;
const STRING_LIST *txi_ext_element_misc_args (ELEMENT *element);

%rename(element_formal_args) txi_ext_element_formal_args;
const STRING_LIST *txi_ext_element_formal_args (ELEMENT *element);

// New element and element modification

// swig_interface.h
// is_text_element is used to disambiguate between text element and
// container element when the type is NUL
%rename(store_new_element) txi_ext_store_new_element;
ELEMENT *txi_ext_store_new_element (DOCUMENT *document, const char *type_name,
                                const char *command_name, int is_text_element);

%rename(element_reset_text) txi_ext_element_reset_text;
void txi_ext_element_reset_text (ELEMENT *element);
%rename(element_append_text) txi_ext_element_append_text;
void txi_ext_element_append_text (ELEMENT *element, const char *text);

%rename(set_element_attribute_integer) txi_ext_set_element_attribute_integer;
int txi_ext_set_element_attribute_integer (ELEMENT *element,
                                           const char *attribute, int value);
%rename(set_element_attribute_string) txi_ext_set_element_attribute_string;
int txi_ext_set_element_attribute_string (ELEMENT *element,
                                          const char *attribute,
                                          const char *value);
%rename(set_element_attribute_element) txi_ext_set_element_attribute_element;
int txi_ext_set_element_attribute_element (ELEMENT *element,
                                           const char *attribute,
                                           ELEMENT *value);

// tree.h
void add_to_element_contents (ELEMENT *parent, ELEMENT *e);


// Nodes, sections and headings relations

// Data structures

// swig_interface.h
%rename(section_relation_list_section_relation_by_index) txi_ext_section_relation_list_section_relation_by_index;
SECTION_RELATIONS *txi_ext_section_relation_list_section_relation_by_index (
                SECTION_RELATIONS_LIST *section_relation_list, int index);
%rename(section_relation_list_section_relations_number) txi_ext_section_relation_list_section_relations_number;
int txi_ext_section_relation_list_section_relations_number (
                           SECTION_RELATIONS_LIST *section_relation_list);

// tree_types.h
typedef struct NODE_RELATIONS {
    ELEMENT *element;
    const SECTION_RELATIONS *associated_section;
    /* it can be associated to an heading or a section relations
       so we prefer the element although relations structures
       would have been more consistent */
    const ELEMENT *associated_title_command;
    const SECTION_RELATIONS *node_preceding_part;
    CONST_ELEMENT_LIST *node_descriptions;
    CONST_ELEMENT_LIST *node_long_descriptions;
    CONST_ELEMENT_LIST *menus;
     /*
    const struct ELEMENT **menu_directions;
    const struct ELEMENT **node_directions;
      */
} NODE_RELATIONS;

typedef struct HEADING_RELATIONS {
    const ELEMENT *element;
    const NODE_RELATIONS *associated_anchor_command;
} HEADING_RELATIONS;

typedef struct SECTION_RELATIONS {
    const ELEMENT *element;
    const NODE_RELATIONS *associated_anchor_command;
    const NODE_RELATIONS *associated_node;
    const SECTION_RELATIONS *associated_part;
    const SECTION_RELATIONS *part_associated_section;
    const NODE_RELATIONS *part_following_node;
     /*
    const struct SECTION_RELATIONS **section_directions;
    const struct SECTION_RELATIONS **toplevel_directions;
      */
    SECTION_RELATIONS_LIST *section_children;
} SECTION_RELATIONS;

// functions

// swig_interface.h
%rename(get_node_relations) txi_ext_get_node_relations;
NODE_RELATIONS *txi_ext_get_node_relations (ELEMENT *element,
                                            DOCUMENT *document);
%rename(get_section_relations) txi_ext_get_section_relations;
SECTION_RELATIONS *txi_ext_get_section_relations (ELEMENT *element,
                                                  DOCUMENT *document);
%rename(get_heading_relations) txi_ext_get_heading_relations;
HEADING_RELATIONS *txi_ext_get_heading_relations (ELEMENT *element,
                                                  DOCUMENT *document);

%rename(node_relation_node_direction) txi_ext_node_relation_node_direction;
const ELEMENT *txi_ext_node_relation_node_direction (NODE_RELATIONS *node,
                                                     const char *direction);
%rename(section_relation_section_direction) txi_ext_section_relation_section_direction;
const SECTION_RELATIONS *txi_ext_section_relation_section_direction (
                                              SECTION_RELATIONS *section,
                                              const char *direction);
%rename(section_relation_toplevel_direction) txi_ext_section_relation_toplevel_direction;
const SECTION_RELATIONS *txi_ext_section_relation_toplevel_direction (
                                     SECTION_RELATIONS *section,
                                     const char *direction);

%rename(sectioning_root_children) txi_ext_inline_sectioning_root_children;
%inline %{
SECTION_RELATIONS_LIST *txi_ext_inline_sectioning_root_children (DOCUMENT *document);
%}

%{
SECTION_RELATIONS_LIST *
txi_ext_inline_sectioning_root_children (DOCUMENT *document)
{
  if (!document->sectioning_root)
    return 0;
  return &document->sectioning_root->section_children;
}
%}


// Reader

%include "reader_types.h"

%rename(new_reader) txi_ext_inline_new_reader;
%inline %{
struct READER *txi_ext_inline_new_reader (ELEMENT *tree, DOCUMENT *document);
%}

%{
struct READER *
txi_ext_inline_new_reader (ELEMENT *tree, DOCUMENT *document)
{
  // reader_api.h
  size_t reader_descriptor = txi_register_new_reader (tree, document);
  return retrieve_reader_descriptor (reader_descriptor);
}
%}

%rename(reader_read) txi_ext_inline_reader_read;
%inline %{
const READER_TOKEN *txi_ext_inline_reader_read (struct READER *reader);
%}

%{
const READER_TOKEN *
txi_ext_inline_reader_read (struct READER *reader)
{
  if (!reader)
    return 0;

  // reader_api.h
  return txi_reader_read (reader);
}
%}

// reader_api.h
%rename(reader_skip_children) txi_reader_skip_children;
const READER_TOKEN *txi_reader_skip_children (struct READER *reader,
                                              const ELEMENT *element);


// Finish

// document.h
void destroy_document (DOCUMENT *document);

// Conversion

// To Texinfo

// convert_to_texinfo.h
%newobject convert_to_texinfo;
char *convert_to_texinfo (const ELEMENT *e);
%newobject convert_contents_to_texinfo;
char *convert_contents_to_texinfo (const ELEMENT *e);

// To plain text

%include "swig_text_options_types.h"

// swig_text_options.h
%rename(text_options_set_encoding) txi_ext_text_options_set_encoding;
%rename(text_options_clear_expanded_formats) txi_ext_text_options_clear_expanded_formats;
%rename(text_options_add_expanded_format) txi_ext_text_options_add_expanded_format;
// TODO document that it should be called early to be set to values before
// starting conversion, to set as expected the language to end of preamble
// language
%rename(document_text_options) txi_ext_document_text_options;

#define tico_option_name(name) \
%rename(text_options_set_##name) txi_ext_text_options_set_##name;
 TEXT_INDICATOR_CONVERTER_OPTIONS
#undef tico_option_name

%include "swig_text_options.h"

// convert_to_text.h
void text_set_options_encoding (TEXT_OPTIONS *text_options, char *encoding);
void text_reset_options_encoding (TEXT_OPTIONS *text_options);

%newobject convert_to_text;
char *convert_to_text (const ELEMENT *root, TEXT_OPTIONS *text_options);


// Tree representation
// Very relevant for debugging, no reason to use otherwise

// manipulate_tree.h
%newobject tree_print_details;
char *tree_print_details (ELEMENT *tree, const char *fname_encoding=0,
                          int use_filename=0, int show_element_pointer=0);

%newobject element_print_details;
char *element_print_details (ELEMENT *element, const char *fname_encoding=0,
                             int use_filename=0);


// Helper functions
// TODO move to another module/file?

// These could also be re-implemented in the different languages.
// Which one to add/remove?

// What about API stability for those functions?

// utils.h
ELEMENT *get_label_element (const ELEMENT *e);
// TODO add a wrapper around utils.c informative_command_value?
// or let it be re-implemented in the diverse languages?

// manipulate_indices.h
// used in a test
// FIXME remove to avoid needing translations in the interface?
%rename(index_content_element) txi_ext_inline_index_content_element;
ELEMENT *txi_ext_inline_index_content_element (const ELEMENT *element,
                                DOCUMENT *document,
                                int prefer_reference_element=0,
                                int debug_level=0);

%inline %{
ELEMENT * txi_ext_inline_index_content_element (const ELEMENT *element,
                                DOCUMENT *document,
                                int prefer_reference_element,
                                int debug_level);
%}

%{
ELEMENT *
txi_ext_inline_index_content_element (const ELEMENT *element,
                                DOCUMENT *document,
                                int prefer_reference_element,
                                int debug_level)
{
  return element_index_content_element (element, prefer_reference_element,
                                        document, debug_level);
}
%}


// TODO add a wrapper around new_complete_menu_master_menu?

// utils.h
// used in po4a
const ELEMENT *block_line_argument_command (const ELEMENT *block_line_arg);

%rename(valid_documentlanguage) txi_ext_inline_valid_documentlanguage;
%inline %{
int txi_ext_inline_valid_documentlanguage (const char *text);
%}

%{
int
txi_ext_inline_valid_documentlanguage (const char *text)
{
  int valid_lang;
  int valid_region;
  char *region_code;
  char *lang = analyze_documentlanguage_argument (text, &region_code,
                                                  &valid_lang, &valid_region);
  int valid = lang && valid_lang && ((!region_code) || valid_region);

  free (lang);
  free (region_code);

  return valid;
}
%}

// convert_utils.h
// used in po4a
// Structure used to return both error messages and element
%inline %{
typedef struct TXI_EXT_ELEMENT_FORMATTED_ERRORS {
  ELEMENT *element;
  FORMATTED_ERROR_MESSAGE_LIST *errors;
} TXI_EXT_ELEMENT_FORMATTED_ERRORS;
%}

%rename(expand_verbatiminclude) txi_ext_inline_expand_verbatiminclude;
TXI_EXT_ELEMENT_FORMATTED_ERRORS *
txi_ext_inline_expand_verbatiminclude (const ELEMENT *current,
                                 const STRING_LIST *include_directories,
                                 const char *input_file_name_encoding=0,
                                 int doc_encoding_for_input_file_name=1,
                                 const char *locale_encoding=0,
                                 const GLOBAL_INFO *global_information=0,
                                 const char *message_encoding=0,
                                 int debug=0, int no_warn=0,
                                 int use_filename=0);
%{
TXI_EXT_ELEMENT_FORMATTED_ERRORS *
txi_ext_inline_expand_verbatiminclude (const ELEMENT *current,
                                 const STRING_LIST *include_directories,
                                 const char *input_file_name_encoding,
                                 int doc_encoding_for_input_file_name,
                                 const char *locale_encoding,
                                 const GLOBAL_INFO *global_information,
                                 const char *message_encoding,
                                 int debug, int no_warn, int use_filename)
{
  ERROR_MESSAGE_LIST error_messages;
  TXI_EXT_ELEMENT_FORMATTED_ERRORS *result = (TXI_EXT_ELEMENT_FORMATTED_ERRORS *)
            malloc (sizeof (TXI_EXT_ELEMENT_FORMATTED_ERRORS));
  ELEMENT *expanded_verbatiminclude;
  int count;
  memset (&error_messages, 0, sizeof (ERROR_MESSAGE_LIST));
  expanded_verbatiminclude = expand_verbatiminclude (current,
                                 include_directories,
                                 &error_messages, input_file_name_encoding,
                                 doc_encoding_for_input_file_name,
                                 locale_encoding, global_information, debug);
  result->element = expanded_verbatiminclude;
  result->errors = txi_ext_get_error_messages_list_messages (&error_messages,
                                 message_encoding,
                                 no_warn, use_filename, &count);
  wipe_error_message_list (&error_messages);

  return result;
}
%}

// destroys element and the structure only, the error messages should be
// destroyed by the caller.
%rename(destroy_element_formatted_errors) txi_ext_inline_destroy_element_formatted_errors;

%inline %{
void
txi_ext_inline_destroy_element_formatted_errors(
                   TXI_EXT_ELEMENT_FORMATTED_ERRORS *element_formatted_error);
%}

%{
void
txi_ext_inline_destroy_element_formatted_errors(
                   TXI_EXT_ELEMENT_FORMATTED_ERRORS *element_formatted_error)
{
  if (element_formatted_error)
    {
      if (element_formatted_error->element)
        destroy_element_and_children(element_formatted_error->element);
      free (element_formatted_error);
    }
}
%}
