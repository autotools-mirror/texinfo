/* tree_types.h - types for the parse tree that are used in many places */
#ifndef TREE_TYPES_H
#define TREE_TYPES_H
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
#include <stdint.h>

#include "command_ids.h"
#include "element_types.h"
#include "text.h"
#include "source_mark_types.h"
#include "list_macros.h"

/* the *_none enums are not necessarily used, they may also
   be there to avoid using 0, for a code easier to debug */

/* Indices into array returned by new_directions in main/tree.c. */
/* need to be in the same order as explicit nodes directions */
enum directions {
   D_next,
   D_prev,
   D_up,
};

/* types without corresponding keys cannot be set, but are still used
   in code in case they would become useful again */
enum extra_type {
 /* only for AI_key_none for deleted associated info */
   extra_none,           /* no such type currently */
 /* CONTAINER ASSOCIATED_INFO and lookup_* functions */
   extra_element,        /* no such type currently */
   extra_element_oot,    /* no such type currently */
   extra_contents,       /* no such type currently */
   extra_container,      /* no such type currently */
   extra_directions,     /* no such type currently */
   extra_string,
   extra_string_list,
   /* index name and position in index */
   extra_index_entry,
   extra_integer,
   extra_integer_list,

   /* ELEMENT flags */
   extra_flag,

   /* ELEMENT elt_info */
   extra_element_info,
};

/* tree element flags */
/* for text is inserted_text in Perl */
#define EF_inserted                      0x0001
/* transiently needed for tree element copy */
#define EF_copy                          0x0002
/* in extra in Perl */
#define EF_code                          0x0004
#define EF_is_target                     0x0008
#define EF_omit_def_name_space           0x0010
#define EF_not_after_command             0x0020
#define EF_invalid_syntax                0x0040
#define EF_command_as_argument_kbd_code  0x0080
#define EF_indent                        0x0100
#define EF_noindent                      0x0200
#define EF_isindex                       0x0400
/* not in Perl */
#define EF_def_line                      0x0800
/* transiently used for numbering of the elements for the representation
   of the tree.  Not currently used. */
#define EF_numbered                      0x1000
/* an added element, not in the initial tree.  Not systematically set,
   only when useful */
#define EF_added                         0x2000

/* indices in ELEMENT elt_info */
/* to be kept in sync with elt_info_names in main/tree.c */
/*
enum elt_info_type {
   eit_....,
};
 */

/* sync string_list with Texinfo/ManipulateTree.pm
   _print_element_associated_info list for ARRAY ref
   and element_oot with @extra_out_of_tree (currently none)
*/
/* was previously used for removed associated data, currently unused
   ai_key(none, none, 0)
 */
/* corresponds to name, extra type and associated data.  The associated data
   is only used for interfacing with Perl */
#define AI_KEYS_LIST \
  ai_key(cell_number, integer, 0) \
  ai_key(item_number, integer, 0) \
  ai_key(global_command_number, integer, 0) \
  ai_key(expand_index, integer, 0) \
  ai_key(level_modifier, integer, 0) \
  ai_key(max_columns, integer, 0) \
  ai_key(row_number, integer, 0) \
  ai_key(section_level, integer, 0) \
  ai_key(node_number, integer, 0) \
  ai_key(heading_number, integer, 0) \
  ai_key(section_number, integer, 0) \
  \
  ai_key(alias_of, string, 0) \
  ai_key(begin, string, 0) \
  ai_key(def_command, string, 0) \
  ai_key(documentlanguage, string, 0) \
  ai_key(documentscript, string, 0) \
  ai_key(element_node, string, 0) \
  ai_key(element_region, string, 0) \
  ai_key(end, string, 0) \
  ai_key(float_number, string, 0) \
  ai_key(float_type, string, 0) \
  ai_key(format, string, 0) \
  ai_key(identifier, string, 0) \
  ai_key(index_ignore_chars, string, 0) \
  ai_key(input_encoding_name, string, 0) \
  ai_key(macro_name, string, 0) \
  ai_key(normalized, string, 0) \
  ai_key(original_def_cmdname, string, 0) \
  ai_key(section_heading_number, string, 0) \
  ai_key(sortas, string, 0) \
  ai_key(text_arg, string, 0) \
  ai_key(translation_context, string, 0) \
  \
  ai_key(manual_content, integer_list, 0) \
  ai_key(node_content, integer_list, 0) \
  \
  ai_key(documentlanguagevariant, string_list, 0) \
  ai_key(formal_args, string_list, 0) \
  ai_key(misc_args, string_list, 0) \
  \
  ai_key(index_entry, index_entry, 0) \
  ai_key(associated_index_entry, index_entry, 0) \
  \
  ai_key(inserted, flag, EF_inserted) \
  ai_key(code, flag, EF_code) \
  ai_key(is_target, flag, EF_is_target) \
  ai_key(omit_def_name_space, flag, EF_omit_def_name_space) \
  ai_key(not_after_command, flag, EF_not_after_command) \
  ai_key(invalid_syntax, flag, EF_invalid_syntax) \
  ai_key(command_as_argument_kbd_code, flag, EF_command_as_argument_kbd_code) \
  ai_key(indent, flag, EF_indent) \
  ai_key(noindent, flag, EF_noindent) \
  ai_key(isindex, flag, EF_isindex) \

/* Keys used in ASSOCIATED_INFO and other associated info structures. */
enum ai_key_name {
  #define ai_key(name, type, data) AI_key_ ## name,
   AI_KEYS_LIST
  #undef ai_key
};

typedef struct ASSOCIATED_INFO_DATA {
    enum ai_key_name key;
    enum extra_type type;
    const char *name;
    uint16_t data;
} ASSOCIATED_INFO_DATA;

def_list_type(ELEMENT_LIST, struct ELEMENT *);

/* not used in parser */
def_list_type(CONST_ELEMENT_LIST, const struct ELEMENT *);

typedef struct INDEX_ENTRY_LOCATION {
    char *index_name;
    size_t number; /* position in the original index.  May be different in
                   merged index */
} INDEX_ENTRY_LOCATION;

def_list_type(STRING_LIST, char *);
def_list_type(INTEGER_LIST, int);

typedef struct KEY_PAIR {
    enum ai_key_name key;
    union {
      /* for extra_element_oot and extra_container */
      struct ELEMENT *element;
      /* for extra_element */
      const struct ELEMENT *const_element;
    /*
      ELEMENT_LIST *list;
     */
      /* for extra_contents */
      CONST_ELEMENT_LIST *const_list;
      char *string;
      int integer;
      INDEX_ENTRY_LOCATION *index_entry;
      /* for extra_string_list */
      STRING_LIST *strings_list;
      /* for extra_integer_list */
      INTEGER_LIST *integers_list;
      const struct ELEMENT **directions;
    } k;
} KEY_PAIR;

typedef struct SOURCE_INFO {
    int line_nr;
    char *file_name;
    char *macro;
} SOURCE_INFO;

typedef struct ASSOCIATED_INFO {
    KEY_PAIR *info;
    size_t info_number;
    size_t info_space;
} ASSOCIATED_INFO;

def_list_type(SOURCE_MARK_LIST, SOURCE_MARK *);

/* Defined fully in main/document_types.h */
struct OUTPUT_UNIT;

typedef struct CONTAINER {
    struct ELEMENT *parent;
    ELEMENT_LIST contents;
    SOURCE_INFO source_info;

    ASSOCIATED_INFO extra_info;
    struct OUTPUT_UNIT *associated_unit;
   /* ET_definfoenclose_command, ET_index_entry_command
      and macro_call.  Not in Perl, in Perl cmdname
      can be used instead. */
    char *command_name;
    enum command_id cmd;
} CONTAINER;

typedef struct ELEMENT {
    enum element_type type;
    SOURCE_MARK_LIST *source_mark_list;

    union {
      TEXT *text;
      CONTAINER *c;
    } e;

    uint16_t flags; /* can hold up to 16 flags, could use uint32_t for more */
    /* currently no element with elt_info.
       Need to be kept as it is used transiently during a copy, although
       this is not currently useful, as it is only needed if there are
       references to other elements (in extra information), this is not the
       case as can be seen in AI_KEYS_LIST.
     */
    struct ELEMENT **elt_info;
    /* Used when building Perl tree only. This should be SV *sv,
       but we don't want to include the Perl headers everywhere; */
    void *sv;

} ELEMENT;

typedef struct NODE_RELATIONS {
    /* NOTE it could have been good to have the element be const, as
       node relations associated to node elements are not supposed to
       be modified.
       However, the current_node in the Parser is a NODE_RELATIONS
       and the current_node element is modified.  Because of this, it is
       not possible to set the element field to be const */
    ELEMENT *element;
    const struct SECTION_RELATIONS *associated_section;
    /* it can be associated to an heading or a section relations
       so we prefer the element although relations structures 
       would have been more consistent */
    const ELEMENT *associated_title_command;
    const struct SECTION_RELATIONS *node_preceding_part;
    CONST_ELEMENT_LIST *node_descriptions;
    CONST_ELEMENT_LIST *node_long_descriptions;
    CONST_ELEMENT_LIST *menus;
    const struct ELEMENT **node_directions;

    /* Used when building Perl tree only. This should be HV *hv,
       but we don't want to include the Perl headers everywhere; */
    void *hv;
} NODE_RELATIONS;

def_list_type(NODE_RELATIONS_LIST, struct NODE_RELATIONS *);
def_list_type(CONST_NODE_RELATIONS_LIST, const struct NODE_RELATIONS *);

typedef struct HEADING_RELATIONS {
    const ELEMENT *element;
    const NODE_RELATIONS *associated_anchor_command;

    /* Used when building Perl tree only. This should be HV *hv,
       but we don't want to include the Perl headers everywhere; */
    void *hv;
} HEADING_RELATIONS;

def_list_type(HEADING_RELATIONS_LIST, struct HEADING_RELATIONS *);

typedef struct SECTION_RELATIONS {
    const ELEMENT *element;
    const NODE_RELATIONS *associated_anchor_command;
    const NODE_RELATIONS *associated_node;
    const struct SECTION_RELATIONS *associated_part;
    const struct SECTION_RELATIONS *part_associated_section;
    const NODE_RELATIONS *part_following_node;
    const struct SECTION_RELATIONS **section_directions;
    const struct SECTION_RELATIONS **toplevel_directions;
    struct SECTION_RELATIONS_LIST *section_children;

    /* Used when building Perl tree only. This should be HV *hv,
       but we don't want to include the Perl headers everywhere; */
    void *hv;
} SECTION_RELATIONS;

def_list_type(SECTION_RELATIONS_LIST, struct SECTION_RELATIONS *);

/* not used in parser */
typedef struct SECTIONING_ROOT {
    int section_root_level;
    SECTION_RELATIONS_LIST section_children;
} SECTIONING_ROOT;

typedef struct IGNORED_CHARS {
    int backslash;
    int hyphen;
    int lessthan;
    int atsign;
} IGNORED_CHARS;

typedef struct INDEX_ENTRY {
    char *index_name; /* kept with the entry as the indices may be merged */
    int number; /* position in the original index.  May be different in
                   merged index */
    ELEMENT *entry_element;
    ELEMENT *entry_associated_element; /* set if the entry is reassociated to
                                          another element */
} INDEX_ENTRY;

typedef struct INDEX {
    char *name;
    int in_code;

    struct INDEX *merged_in; /* Index this index is merged into, if any. */

    INDEX_ENTRY *index_entries;
    size_t entries_number;
    size_t entries_space;
} INDEX;

/* not used in parser */
typedef struct INDEX_ENTRY_AND_INDEX {
    INDEX *index;
    INDEX_ENTRY *index_entry;
    int entry_number;
} INDEX_ENTRY_AND_INDEX;

/* See parse_node_manual function. */
typedef struct {
    INTEGER_LIST *manual_content;
    INTEGER_LIST *node_content;
} NODE_SPEC_EXTRA;

typedef struct {
    size_t label_number;
    const char *identifier;
 /* cannot be const because is_target is added */
    ELEMENT *element;
 /* for label that is a duplicate, points to the element used in links */
    const ELEMENT *reference;
} LABEL;

def_list_type(LABEL_LIST, LABEL);

typedef struct {
    ELEMENT *float_element;
    const SECTION_RELATIONS *float_section;
} FLOAT_INFORMATION;

def_list_type(FLOAT_INFORMATION_LIST, FLOAT_INFORMATION);

/* The float elements are reference to tree elements, but they are not const
   because in number_floats they are found through the listoffloats list */
typedef struct {
    char *type;
    FLOAT_INFORMATION_LIST float_list;
} LISTOFFLOATS_TYPE;

def_list_type(LISTOFFLOATS_TYPE_LIST, LISTOFFLOATS_TYPE);

/* element is a reference to the tree, but it is not const because it is
   used to set the listoffloats list elements list */
typedef struct {
    const char *type;
    ELEMENT *element;
    const SECTION_RELATIONS *section;
} FLOAT_RECORD;

def_list_type(FLOAT_RECORD_LIST, FLOAT_RECORD);

def_list_type(COMMAND_STACK, enum command_id);

enum tree_added_elements_status {
   tree_added_status_none,
   tree_added_status_elements_added,
   tree_added_status_new_tree,
   tree_added_status_reused_tree,
   tree_added_status_no_tree,
};

/* not used in parser */
typedef struct TREE_ADDED_ELEMENTS {
    ELEMENT *tree;
    ELEMENT_LIST added; /* list of added elements in tree that are not in the
                           document Texinfo tree */
    int in_code;
    enum tree_added_elements_status status;
} TREE_ADDED_ELEMENTS;

/* not used in parser, used in diverse codes */
typedef struct NAME_NUMBER {
    size_t number;
    const char *name;
} NAME_NUMBER;

typedef struct NAME_NUMBER_LIST {
    size_t number;
    NAME_NUMBER *list;
} NAME_NUMBER_LIST;

typedef struct COMMENT_OR_END_LINE {
    const ELEMENT *comment;
    const char *end_line;
} COMMENT_OR_END_LINE;

typedef struct ARGUMENT_COMMENT_END_LINE {
    const ELEMENT *argument;
    COMMENT_OR_END_LINE comment_end_line;
} ARGUMENT_COMMENT_END_LINE;

/* not used in parser, here because it is used in translations */
typedef struct TRANSLATION_TREE {
    char *translated;
    TEXT translation;
    ELEMENT *tree;
} TRANSLATION_TREE;

typedef struct LANG_TRANSLATION_TREE_LIST {
    size_t number;
    size_t space;
    TRANSLATION_TREE **list;
    void *hash;
} LANG_TRANSLATION_TREE_LIST;

typedef struct DOCUMENT_LANG_INFO {
    char *bcp47_locale;
    char *lang;
    char *region;
    char *script;
    STRING_LIST variants;
} DOCUMENT_LANG_INFO;

typedef struct LANG_TRANSLATION {
    DOCUMENT_LANG_INFO *info;
    char *language_env;
    LANG_TRANSLATION_TREE_LIST *translations;
} LANG_TRANSLATION;

/* element or string may not always be present */
typedef struct NAMED_STRING_ELEMENT {
    const char *name;
    ELEMENT *element; /* actually const until added to tree */
    char *string; /* const in gdt_string, but used temporarily in gdt_tree */
} NAMED_STRING_ELEMENT;

def_list_type(NAMED_STRING_ELEMENT_LIST, NAMED_STRING_ELEMENT);

/* used for targets */
struct BUCKET;
struct BUCKET_ARENA;
typedef struct C_HASHMAP {
  struct BUCKET **bucket;
  size_t num_buckets;
  size_t count;

  struct BUCKET_ARENA *arena;
} C_HASHMAP;

#endif
