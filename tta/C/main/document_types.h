/* document_types.h - parsed Texinfo document types */
#ifndef DOCUMENT_TYPES_H
#define DOCUMENT_TYPES_H

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
/* for iconv_t */
#include <iconv.h>

#include "command_ids.h"
#include "tree_types.h"
#include "option_types.h"
#include "global_commands_types.h"
/* RUD_DIRECTIONS_TYPES_LIST RUD_FILE_DIRECTIONS_TYPES */
#include "html_conversion_data.h"
#include "list_macros.h"
/*
#include "options_types.h"
#include "convert_to_text.h"
 */

/* to avoid interdependency with options_types.h, including for
   other include files */
struct OPTIONS;
/* same with convert_to_text.h */
struct TEXT_OPTIONS;

struct C_HASHMAP;

#define F_DOCM_tree                      0x0001
#define F_DOCM_index_names               0x0002
#define F_DOCM_floats                    0x0004
#define F_DOCM_internal_references       0x0008
#define F_DOCM_labels_list               0x0010
#define F_DOCM_identifiers_target        0x0020
#define F_DOCM_global_info               0x0040
#define F_DOCM_global_commands           0x0080
#define F_DOCM_nodes_list                0x0100
#define F_DOCM_sections_list             0x0200
#define F_DOCM_merged_indices            0x0400
#define F_DOCM_indices_sort_strings      0x0800
#define F_DOCM_output_units              0x1000
#define F_DOCM_headings_list             0x2000
#define F_DOCM_sectioning_root           0x4000

enum error_type {
   MSG_error,
   MSG_warning,
   MSG_document_error,
   MSG_document_warning
};

typedef struct ERROR_MESSAGE {
    char *message;
    char *error_line;
    enum error_type type;
    int continuation;
    SOURCE_INFO source_info;
} ERROR_MESSAGE;

typedef struct ERROR_MESSAGE_LIST {
    ERROR_MESSAGE *list;
    size_t number;
    size_t space;
} ERROR_MESSAGE_LIST;

enum output_units_descriptor_type {
   OUDT_units,
   OUDT_special_units,
   OUDT_associated_special_units,
   OUDT_external_nodes_units,
};

typedef struct KEY_STRING_PAIR {
    char *key;
    char *string;
} KEY_STRING_PAIR;

typedef struct OTHER_GLOBAL_INFO {
    KEY_STRING_PAIR *info;
    size_t info_number;
    size_t info_space;
} OTHER_GLOBAL_INFO;

typedef struct PREAMBLE_LANG_CMD {
    enum command_id cmd;
    union {
      char *lang_string;
      STRING_LIST *lang_variants;
    } plc;
} PREAMBLE_LANG_CMD;

def_list_type(PREAMBLE_LANG_CMD_LIST, PREAMBLE_LANG_CMD);

typedef struct GLOBAL_INFO {
    char *input_file_name;
    char *input_directory;
    char *input_encoding_name;
    int sections_level_modifier;
    /* Ignored characters for index sort key */
    IGNORED_CHARS ignored_chars;
    STRING_LIST included_files;
    /* current documentlanguagevariant argument */
    STRING_LIST documentlanguagevariant;
    /* based on the successive @documentlanguage, @documentscript and
       @documentlanguagevariant in the document preamble, if
       not overriden by command-line or initialization files */
    PREAMBLE_LANG_CMD_LIST preamble_lang_cmd;

    /* remaining, in general passed to/from perl but not used in C */
    OTHER_GLOBAL_INFO other_info;
} GLOBAL_INFO;

typedef struct INDEX_LIST {
    size_t number;
    INDEX **list;
} INDEX_LIST;

typedef struct MERGED_INDEX {
    char *name;
    INDEX_ENTRY *index_entries;
    size_t entries_number;
} MERGED_INDEX;

typedef struct MERGED_INDICES {
    size_t number;
    MERGED_INDEX *indices;
} MERGED_INDICES;

/* used in converter code, not in document code, but associated to
   document.  Corresponds to @documentinfo, @copying, @publication... */
typedef struct DOCUMENT_INFO {
    ELEMENT_LIST title;
    ELEMENT_LIST author;
    ELEMENT_LIST subtitle;
    const ELEMENT *copying;
    const ELEMENT *publication;
} DOCUMENT_INFO;

typedef struct ENCODING_CONVERSION {
    char *encoding_name;
    iconv_t iconv;
} ENCODING_CONVERSION;

/* not used in document, but used for indices for sort keys that can
   contain NUL */
typedef struct BYTES_STRING {
    size_t len;
    unsigned char *bytes;
} BYTES_STRING;

typedef struct INDEX_SUBENTRY_SORT_STRING {
    char *sort_string;
    int alpha;
} INDEX_SUBENTRY_SORT_STRING;

typedef struct INDEX_ENTRY_SORT_STRING {
    INDEX_ENTRY *entry;
    /* original index information can be accessed as entry->index_name
       and entry->number */
    /* in perl 'index_name' => $index_entry->{'index_name'} */
    /* in perl 'number' => $index_entry->{'entry_number'} */
    size_t subentries_number;
    INDEX_SUBENTRY_SORT_STRING *sort_string_subentries;
} INDEX_ENTRY_SORT_STRING;

typedef struct INDEX_SORT_STRINGS {
    MERGED_INDEX *index;
    size_t entries_number;
    INDEX_ENTRY_SORT_STRING *sort_string_entries;
} INDEX_SORT_STRINGS;

typedef struct INDICES_SORT_STRINGS {
    size_t number;
    INDEX_SORT_STRINGS *indices;
} INDICES_SORT_STRINGS;

typedef struct INDEX_SORTED_BY_INDEX {
    char *name;
    INDEX_ENTRY **entries;
    size_t entries_number;
} INDEX_SORTED_BY_INDEX;

typedef struct LETTER_INDEX_ENTRIES {
    char *letter;
    INDEX_ENTRY **entries;
    size_t entries_number;
} LETTER_INDEX_ENTRIES;

typedef struct INDEX_SORTED_BY_LETTER {
    char *name;
    LETTER_INDEX_ENTRIES *letter_entries;
    size_t letter_number;
} INDEX_SORTED_BY_LETTER;

enum collation_type_name {
   ctn_unicode, /* the default */
   ctn_no_unicode,
 /* removed until there is a native C possibility for collation
    linguistic tailoring
   ctn_language_collation,
  */
   ctn_locale_collation, /* experimental, to test strxfrm */
};

typedef struct COLLATION_INDICES_SORTED_BY_INDEX {
    enum collation_type_name type;
    char *language;
    INDEX_SORTED_BY_INDEX *sorted_indices;
} COLLATION_INDICES_SORTED_BY_INDEX;

typedef struct COLLATIONS_INDICES_SORTED_BY_INDEX {
    size_t number;
    size_t space;
    COLLATION_INDICES_SORTED_BY_INDEX *collation_sorted_indices;
} COLLATIONS_INDICES_SORTED_BY_INDEX;

typedef struct COLLATION_INDICES_SORTED_BY_LETTER {
    enum collation_type_name type;
    char *language;
    INDEX_SORTED_BY_LETTER *sorted_indices;
} COLLATION_INDICES_SORTED_BY_LETTER;

typedef struct COLLATIONS_INDICES_SORTED_BY_LETTER {
    size_t number;
    size_t space;
    COLLATION_INDICES_SORTED_BY_LETTER *collation_sorted_indices;
} COLLATIONS_INDICES_SORTED_BY_LETTER;

enum relative_unit_direction_type {
  #define rud_type(name) RUD_type_## name,
   RUD_DIRECTIONS_TYPES_LIST
   RUD_FILE_DIRECTIONS_TYPES
  #undef rud_type
  #define rud_type(name) RUD_type_FirstInFile## name,
   RUD_DIRECTIONS_TYPES_LIST
  #undef rud_type
};

enum output_unit_type {
   OU_unit,
   OU_external_node_unit,
   OU_special_unit,
};

/* structure used after splitting output units. */
typedef struct OUTPUT_UNIT {
    /* Used when building Perl tree only. This should be HV *hv,
       but we don't want to include the Perl headers everywhere; */
    void *hv;

    enum output_unit_type unit_type;
    size_t index;
    /* for regular unit we have both access to the unit command,
       which may be the node or section tree element, and to
       unit_node and/or unit_section node/section relations which allow
       to access directly the associated node and associated section
       information without going through the unit command */
    union {
      const struct ELEMENT *unit_command;
      /* for special units, not in the tree */
      struct ELEMENT *special_unit_command;
    } uc;
    const NODE_RELATIONS *unit_node;
    const SECTION_RELATIONS *unit_section;
    char *unit_filename;
    ELEMENT_LIST unit_contents;
    struct OUTPUT_UNIT *tree_unit_directions[2];

    struct OUTPUT_UNIT *first_in_page;
    const struct OUTPUT_UNIT *directions[RUD_type_FirstInFileNodeBack+1];

    /* for special output units only */
    /* could be an enum as for now new special types cannot be customized
       but lets keep it an option */
    char *special_unit_variety;
    /* for special units associated to a document output unit */
    const struct OUTPUT_UNIT *associated_document_unit;
} OUTPUT_UNIT;

typedef struct OUTPUT_UNIT_LIST {
    struct OUTPUT_UNIT **list;
    size_t number;
    size_t space;
} OUTPUT_UNIT_LIST;

typedef struct OUTPUT_UNIT_LISTS {
    OUTPUT_UNIT_LIST *output_units_lists;
    size_t number;
    size_t space;
} OUTPUT_UNIT_LISTS;

typedef struct DOCUMENT {
    ELEMENT *tree;
    INDEX_LIST indices_info;
    LISTOFFLOATS_TYPE_LIST listoffloats;
    ELEMENT_LIST internal_references;
    LABEL_LIST labels_list;
  /* target elements with unique identifiers, sorted/hashed by identifier */
    C_HASHMAP identifiers_target;
  /* Information that is not local to where it is set in the Texinfo input,
   for example document language and encoding. */
    GLOBAL_INFO global_info;
    GLOBAL_COMMANDS global_commands;

    NODE_RELATIONS_LIST nodes_list;
    HEADING_RELATIONS_LIST headings_list;
    SECTION_RELATIONS_LIST sections_list;
    SECTIONING_ROOT *sectioning_root;

    MERGED_INDICES *merged_indices;
    INDICES_SORT_STRINGS *indices_sort_strings;
    COLLATIONS_INDICES_SORTED_BY_INDEX *sorted_indices_by_index;
    COLLATIONS_INDICES_SORTED_BY_LETTER *sorted_indices_by_letter;

    size_t descriptor;
    STRING_LIST *small_strings;
    ERROR_MESSAGE_LIST error_messages;
    ERROR_MESSAGE_LIST parser_error_messages;
    struct OPTIONS *options; /* for options used in structuring */
    OPTION **sorted_options;
    struct TEXT_OPTIONS *convert_index_text_options; /* for index
                                       sorting without converter */
    /* Used to hold output unit lists, such that they may be created,
       retrieved  and freed.  An output units list should only be accessed
       through the handler returned when created.
       In general, the lists are created and managed by converters or other
       codes, not by code related to the Texinfo parsed DOCUMENT, the
       DOCUMENT is merely used to store them, since it generally
       outlives converters.
     */
    OUTPUT_UNIT_LISTS output_units_lists;
    /* this is used if the output units are used outside of converters,
       as is done in the tests */
    size_t output_units_descriptors[OUDT_external_nodes_units+1];

    /* lists used to retrieve and store element handles to retrieve
       C elements associated to Perl elements.
       Not used in any code built.
     */
     /*
    ELEMENT_LIST element_handles;
      */
    /* elements not in the tree, could be added with new_element_from_sv
       and would also be in element_handles, or by the SWIG interface. */
    ELEMENT_LIST additional_elements;

    /* flags for modified information not already passed to Perl */
    unsigned long modified_information;

    /* Reference to Perl document.  Used to have a place where caching
       can happen reliably even if the caller changes the hash associated
       to a descriptor (has happened in the past).  Is also used to
       find the Perl document to reuse and modify the same document already
       passed to Perl, when possible.
     */
    void *hv;
} DOCUMENT;

/* following not in document, but used in parser */
typedef struct EXPANDED_FORMAT {
    char *format;
    int expandedp;
} EXPANDED_FORMAT;

typedef struct {
    char *name;
    char *value;
} VALUE;

def_list_type(VALUE_LIST, VALUE);

/* enums needed in document and converters codes, but not in this file */
enum command_location {
   CL_before,
   CL_last,
   CL_preamble,
   CL_preamble_or_first,
};

/* in SWIG interface, but we do not want to have the type defined in the
   header file used in the definition of the interface */
typedef struct PARSER {
    size_t parser_conf_descriptor;
} PARSER;

#endif
