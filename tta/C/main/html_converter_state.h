/* html_converter_state.h - types for HTML-specific converter state */
#ifndef HTML_CONVERTER_STATE_H
#define HTML_CONVERTER_STATE_H

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

/* for SPECIAL_UNIT_INFO_TYPE_NR ... */
#include "html_conversion_data.h"
#include "element_types.h"
#include "command_ids.h"
/* for HTT_* enum html_text_type */
#include "option_types.h"
#include "text.h"
#include "tree_types.h"
#include "document_types.h"
#include "list_macros.h"
#include "converter_types.h"

enum formatting_reference_status {
   FRS_status_none,
   FRS_status_default_set,        /* default is set, no customization (or
                                     customization is the same as default) */
   FRS_status_customization_set,  /* customization is set, no default, or
                                     not the same as default */
   FRS_status_internal,           /* formatting reference is not used, code in C
                                     does the task */
   FRS_status_ignored,            /* explicitly ignored. Only used for
                                     types_conversion and commands_conversion
                                   */
};

/* for style commands up to STYLE_COMMAND_CONTEXT_NR and for
   no args commands up to NO_ARG_COMMAND_CONTEXT_NR */
#define HCC_CONTEXT_TYPES_LIST \
  cctx_type(normal) \
  cctx_type(preformatted) \
  cctx_type(string) \
  cctx_type(css_string) \
  cctx_type(code) \
  cctx_type(math)

enum conversion_context {
  #define cctx_type(name) HCC_type_## name,
   HCC_CONTEXT_TYPES_LIST
  #undef cctx_type
};

#define STYLE_COMMAND_CONTEXT_NR HCC_type_preformatted +1
#define NO_ARG_COMMAND_CONTEXT_NR HCC_type_css_string +1

enum special_target_type {
   ST_footnote_location,
};

enum direction_string_type {
  #define tds_type(name) TDS_type_ ## name,
   TDS_TRANSLATED_TYPES_LIST
   TDS_NON_TRANSLATED_TYPES_LIST
  #undef tds_type
};

/* used both for direction strings and special unit info text */
enum direction_string_context {
  TDS_context_normal,
  TDS_context_string,
};

#define HTML_FILE_ID_SETTING_NAMES_LIST \
  html_file_id_setting_name(external_target_non_split_name) \
  html_file_id_setting_name(external_target_split_name)\
  html_file_id_setting_name(label_target_name) \
  html_file_id_setting_name(node_file_name)\
  html_file_id_setting_name(redirection_file_names)\
  html_file_id_setting_name(sectioning_command_target_name)\
  html_file_id_setting_name(special_unit_target_file_name) \
  html_file_id_setting_name(unit_file_name)

enum html_file_id_setting {
  #define html_file_id_setting_name(name) FIS_## name,
   HTML_FILE_ID_SETTING_NAMES_LIST
  #undef html_file_id_setting_name
};

/* %default_formatting_references in Texinfo::HTML */
#define HTML_FORMATTING_REFERENCES_LIST \
  html_fr_reference(format_begin_file) \
  html_fr_reference(format_button) \
  html_fr_reference(format_button_icon_img) \
  html_fr_reference(format_css_lines) \
  html_fr_reference(format_comment) \
  html_fr_reference(format_contents) \
  html_fr_reference(format_element_header) \
  html_fr_reference(format_element_footer) \
  html_fr_reference(format_end_file) \
  html_fr_reference(format_footnotes_segment) \
  html_fr_reference(format_footnotes_sequence) \
  html_fr_reference(format_single_footnote) \
  html_fr_reference(format_heading_text) \
  html_fr_reference(format_navigation_header) \
  html_fr_reference(format_navigation_panel) \
  html_fr_reference(format_node_redirection_page) \
  html_fr_reference(format_program_string) \
  html_fr_reference(format_protect_text) \
  html_fr_reference(format_separate_anchor) \
  html_fr_reference(format_titlepage) \
  html_fr_reference(format_title_titlepage) \
  html_fr_reference(format_translate_message)

enum html_formatting_reference {
  #define html_fr_reference(name) FR_## name,
   HTML_FORMATTING_REFERENCES_LIST
  #undef html_fr_reference
};

#define HTML_ARGUMENTS_FORMATTED_FORMAT_TYPE \
  html_aft_type(none) \
  html_aft_type(normal) \
  html_aft_type(string) \
  html_aft_type(monospace) \
  html_aft_type(monospacetext) \
  html_aft_type(monospacestring) \
  html_aft_type(filenametext) \
  html_aft_type(url) \
  html_aft_type(raw)

enum html_argument_formatting_type {
   #define html_aft_type(name) AFT_type_##name,
    HTML_ARGUMENTS_FORMATTED_FORMAT_TYPE
   #undef html_aft_type
};

enum html_special_character {
   SC_paragraph_symbol,
   SC_left_quote,
   SC_right_quote,
   SC_bullet,
   SC_non_breaking_space,
};

enum htmlxref_split_type {
   htmlxref_split_type_none = -1,

   htmlxref_split_type_mono,
   htmlxref_split_type_node,
   htmlxref_split_type_section,
   htmlxref_split_type_chapter,
};

#define HTML_STAGE_HANDLER_STAGE_TYPE \
  html_hsht_type(setup) \
  html_hsht_type(structure) \
  html_hsht_type(init) \
  html_hsht_type(finish)

enum html_stage_handler_stage_type {
   HSHT_type_none = -1,

   #define html_hsht_type(name) HSHT_type_##name,
    HTML_STAGE_HANDLER_STAGE_TYPE
   #undef html_hsht_type
};

/* an element in C, and/or a reference to an external language (Perl)
   for stack functions called from outside of the C converter */
typedef struct ELEMENT_REFERENCE {
    const ELEMENT *element;
  /* perl element. This should be HV *hv,
     but we don't want to include the Perl headers everywhere; */
    const void *hv;
} ELEMENT_REFERENCE;

def_list_type(ELEMENT_REFERENCE_STACK, ELEMENT_REFERENCE);

typedef struct FILE_NUMBER_NAME {
    size_t file_number;
    const char *filename;
} FILE_NUMBER_NAME;

typedef struct VARIETY_DIRECTION_INDEX {
    char *special_unit_variety;
    int direction_index;
} VARIETY_DIRECTION_INDEX;

typedef struct HTML_TARGET {
    const ELEMENT *element;
    char *target;
    char *special_unit_filename;
    char *node_filename;
    char *section_filename;
    char *contents_target;
    char *shortcontents_target;

    char *command_text[HTT_string_nonumber+1];
    char *command_description[HTT_string_nonumber+1];
    char *command_name[HTT_string_nonumber+1];
    TREE_ADDED_ELEMENTS tree;
    TREE_ADDED_ELEMENTS tree_nonumber;
    TREE_ADDED_ELEMENTS name_tree;
    TREE_ADDED_ELEMENTS name_tree_nonumber;
    FILE_NUMBER_NAME file_number_name;
    int filename_set;
    const ELEMENT *root_element_command;
    int root_element_command_set;
    const ELEMENT *node_command;
    int node_command_set;

    int formatted_nodedescription_nr;
} HTML_TARGET;

def_list_type(HTML_TARGET_LIST, HTML_TARGET *);

typedef struct EXPLAINED_COMMAND_TYPE {
    enum command_id cmd;
    char *type;
    char *explanation;
} EXPLAINED_COMMAND_TYPE;

def_list_type(EXPLAINED_COMMAND_TYPE_LIST, EXPLAINED_COMMAND_TYPE);

typedef struct FOOTNOTE_ID_NUMBER {
    const char *footnote_id;
    int number;
} FOOTNOTE_ID_NUMBER;

def_list_type(ELEMENT_REFERENCE_STACK_STACK, ELEMENT_REFERENCE_STACK *);

typedef struct HTML_SHARED_CONVERSION_STATE {
    int in_skipped_node_top;
    EXPLAINED_COMMAND_TYPE_LIST explained_commands;
        /* explained_commands->{char $cmdname}->{char $normalized_type}
                               = explanation */
    int footnote_number;
    FOOTNOTE_ID_NUMBER *footnote_id_numbers; /* footnote_id_numbers->{char $footid} = int */
    int html_menu_entry_index;
    int **formatted_index_entries; /* formatted_index_entries->{INDEX_ENTRY $index_entry_ref} = 1, ++ */
    int *formatted_listoffloats_nr;
    /* stored in HTML_TARGET formatted_nodedescription_nr */
    /* formatted_nodedescriptions */
    ELEMENT_REFERENCE_STACK_STACK elements_authors;
} HTML_SHARED_CONVERSION_STATE;

typedef struct HTML_NO_ARG_COMMAND_CONVERSION {
    char *element;
    int unset;
    char *text;
    char *translated_converted;
} HTML_NO_ARG_COMMAND_CONVERSION;

typedef struct HTML_NO_ARG_COMMAND_FORMATTING {
    HTML_NO_ARG_COMMAND_CONVERSION context_formatting[NO_ARG_COMMAND_CONTEXT_NR];
    char *translated_to_convert;
    ELEMENT *translated_tree;
} HTML_NO_ARG_COMMAND_FORMATTING;

typedef struct HTML_NO_ARG_COMMAND_CUSTOMIZATION {
    HTML_NO_ARG_COMMAND_CONVERSION *context_formatting[NO_ARG_COMMAND_CONTEXT_NR];
    char *translated_to_convert;
} HTML_NO_ARG_COMMAND_CUSTOMIZATION;

typedef struct HTML_STYLE_COMMAND_CONVERSION {
    char *element;
    int quote;
} HTML_STYLE_COMMAND_CONVERSION;

typedef struct COMMAND_HTML_STYLE_COMMAND_CONVERSION {
    enum command_id cmd;
    HTML_STYLE_COMMAND_CONVERSION *conversion[STYLE_COMMAND_CONTEXT_NR];
} COMMAND_HTML_STYLE_COMMAND_CONVERSION;

typedef struct HTML_DIRECTION_STRING_TRANSLATED {
    char *to_convert;
    char *converted[TDS_context_string +1];
} HTML_DIRECTION_STRING_TRANSLATED;

typedef struct ARRAY_INDEX_LIST {
    size_t number;
    size_t *list;
} ARRAY_INDEX_LIST;

typedef struct CSS_LIST {
  /* 0 if associated to output units and found by number */
    char *page_name;
    STRING_LIST selectors;
} CSS_LIST;

/* index 0 is for document_global_context_css others for the output files */
def_list_type(PAGES_CSS_LIST, CSS_LIST);

typedef struct COMMAND_ID_INDEX {
    enum command_id cmd;
    size_t index;
} COMMAND_ID_INDEX;

typedef struct COMMAND_INTEGER_INFORMATION {
    enum command_id cmd;
    int integer;
} COMMAND_INTEGER_INFORMATION;

typedef struct TYPE_INTEGER_INFORMATION {
    enum element_type type;
    int integer;
} TYPE_INTEGER_INFORMATION;

typedef struct FILE_SOURCE_INFO {
    char *filename;
    const char *type;
    const char *name;
    const ELEMENT *element;
    char *path;
} FILE_SOURCE_INFO;

def_list_type(FILE_SOURCE_INFO_LIST, FILE_SOURCE_INFO);

typedef struct SPECIAL_UNIT_DIRECTION {
    const OUTPUT_UNIT *output_unit;
    const char *direction;
} SPECIAL_UNIT_DIRECTION;

typedef struct SPECIAL_UNIT_DIRECTION_LIST {
    size_t number;
    SPECIAL_UNIT_DIRECTION *list;
} SPECIAL_UNIT_DIRECTION_LIST;

typedef struct DIRECTION_NODE_NAME {
    char *direction;
    char *node_name;
    size_t direction_nr;
} DIRECTION_NODE_NAME;

typedef struct DIRECTION_NODE_NAME_LIST {
    size_t number;
    DIRECTION_NODE_NAME *list;
} DIRECTION_NODE_NAME_LIST;

typedef struct FORMATTING_REFERENCE {
/* perl references. This should be SV *sv_*,
   but we don't want to include the Perl headers everywhere; */
    void *sv_reference;
    void *sv_default;
    enum formatting_reference_status status;
} FORMATTING_REFERENCE;

typedef struct HTML_FORMATTING_CONTEXT {
    char *context_name;
    int preformatted_number;
    int paragraph_number;
    int upper_case_ctx;
    int space_protected;
    int no_break;
} HTML_FORMATTING_CONTEXT;

def_list_type(HTML_FORMATTING_CONTEXT_STACK, HTML_FORMATTING_CONTEXT);

typedef struct HTML_DOCUMENT_CONTEXT {
    char *context;
    int string_ctx;
    int raw_ctx;
    int verbatim_ctx;
    int math_ctx;
    int inside_preformatted;
    char *document_global_context;
    INTEGER_LIST monospace;
    INTEGER_LIST preformatted_context;
    COMMAND_OR_TYPE_STACK composition_context;
    COMMAND_STACK block_commands;
    HTML_FORMATTING_CONTEXT_STACK formatting_context;
    COMMAND_OR_TYPE_STACK preformatted_classes;
} HTML_DOCUMENT_CONTEXT;


def_list_type(HTML_DOCUMENT_CONTEXT_STACK, HTML_DOCUMENT_CONTEXT);

typedef struct FIXED_STRING_WITH_LEN {
    const char *string;
    size_t len;
} FIXED_STRING_WITH_LEN;

typedef struct CSS_SELECTOR_STYLE {
    char *selector;
    char *style;
} CSS_SELECTOR_STYLE;

def_list_type(CSS_SELECTOR_STYLE_LIST, CSS_SELECTOR_STYLE);

/* we have a circular reference with TYPE_CONVERSION_FUNCTION
   and CONVERTER and with COMMAND_CONVERSION_FUNCTION and CONVERTER */
struct CONVERTER;

typedef struct TYPE_CONVERSION_FUNCTION {
    enum formatting_reference_status status;
    /* points to the perl formatting reference if it is used for
       conversion */
    FORMATTING_REFERENCE *formatting_reference;
    /* the function used for conversion, either a function that calls
       the perl function in formatting_reference, or another C function */
    void (* type_conversion) (struct CONVERTER *self, const enum element_type type,
                              const ELEMENT *element, const char *content,
                              TEXT *text);
} TYPE_CONVERSION_FUNCTION;

typedef struct TYPE_OPEN_FUNCTION {
    enum formatting_reference_status status;
    /* points to the perl formatting reference if it is used for
       conversion */
    FORMATTING_REFERENCE *formatting_reference;
    /* the function used for conversion, either a function that calls
       the perl function in formatting_reference, or another C function */
    void (* type_open) (struct CONVERTER *self, const enum element_type type,
                         const ELEMENT *element, TEXT *text);
} TYPE_OPEN_FUNCTION;

typedef struct HTML_ARG_FORMATTED {
    const ELEMENT *arg_tree;
    char *formatted[AFT_type_raw+1];
} HTML_ARG_FORMATTED;

typedef struct HTML_ARGS_FORMATTED {
    size_t number;
    HTML_ARG_FORMATTED *args;
} HTML_ARGS_FORMATTED;

typedef struct COMMAND_CONVERSION_FUNCTION {
    enum formatting_reference_status status;
    /* points to the perl formatting reference if it is used for
       conversion */
    FORMATTING_REFERENCE *formatting_reference;
    /* the function used for conversion, either a function that calls
       the perl function in formatting_reference, or another C function */
    void (* command_conversion) (struct CONVERTER *self,
                                 const enum command_id cmd,
                                 const ELEMENT *element,
                                 const HTML_ARGS_FORMATTED *args_formatted,
                                 const char *content, TEXT *result);
} COMMAND_CONVERSION_FUNCTION;

typedef struct COMMAND_OPEN_FUNCTION {
    enum formatting_reference_status status;
    /* points to the perl formatting reference if it is used for
       conversion */
    FORMATTING_REFERENCE *formatting_reference;
    /* the function used for conversion, either a function that calls
       the perl function in formatting_reference, or another C function */
    void (* command_open) (struct CONVERTER *self, const enum command_id cmd,
                           const ELEMENT *element, TEXT *result);
} COMMAND_OPEN_FUNCTION;

typedef struct OUTPUT_UNIT_CONVERSION_FUNCTION {
    enum formatting_reference_status status;
    /* points to the perl formatting reference if it is used for
       conversion */
    FORMATTING_REFERENCE *formatting_reference;
    /* the function used for conversion, either a function that calls
       the perl function in formatting_reference, or another C function */
    void (* output_unit_conversion) (struct CONVERTER *self,
                        const enum output_unit_type unit_type,
                        const OUTPUT_UNIT *output_unit, const char *content,
                        TEXT *result);
} OUTPUT_UNIT_CONVERSION_FUNCTION;

typedef struct SPECIAL_UNIT_BODY_FORMATTING {
    enum formatting_reference_status status;
    /* points to the perl formatting reference if it is used for
       conversion */
    FORMATTING_REFERENCE *formatting_reference;
    /* the function used for conversion, either a function that calls
       the perl function in formatting_reference, or another C function */
    void (* special_unit_body_formatting) (struct CONVERTER *self,
            const size_t special_unit_number, const char *special_unit_variety,
            const OUTPUT_UNIT *output_unit,
            TEXT *result);
} SPECIAL_UNIT_BODY_FORMATTING;

typedef struct HTML_PENDING_FOOTNOTE {
    const ELEMENT *command;
    char *footid;
    char *docid;
    int number_in_doc;
    char *footnote_location_filename;
    char *multi_expanded_region;
} HTML_PENDING_FOOTNOTE;

def_list_type(HTML_PENDING_FOOTNOTE_STACK, HTML_PENDING_FOOTNOTE *);

typedef struct HTML_INLINE_CONTENT {
    char *category;
    char *string;
} HTML_INLINE_CONTENT;

def_list_type(HTML_INLINE_CONTENT_STACK, HTML_INLINE_CONTENT);

/* there should be either a pointer to a C tree element in element,
   if set from C, or a reference to a Perl tree element in sv, if set
   from Perl */
typedef struct HTML_ASSOCIATED_INLINE_CONTENT {
    const ELEMENT *element;
  /* Perl element. This should be HV *hv,
     but we don't want to include the Perl headers everywhere; */
    const void *hv;
    TEXT inline_content;
} HTML_ASSOCIATED_INLINE_CONTENT;

def_list_type(HTML_ASSOCIATED_INLINE_CONTENT_LIST,
              HTML_ASSOCIATED_INLINE_CONTENT);

typedef struct HTMLXREF_MANUAL {
    char *manual;
    char *urlprefix[htmlxref_split_type_chapter +1];
} HTMLXREF_MANUAL;

def_list_type(HTMLXREF_MANUAL_LIST, HTMLXREF_MANUAL);

typedef struct ASSOCIATED_INFO_LIST {
    size_t number;
    ASSOCIATED_INFO *list;
} ASSOCIATED_INFO_LIST;

def_list_type(STRING_STACK_LIST, STRING_LIST);

typedef struct JSLICENSE_FILE_INFO {
    char *filename;
    char *license;
    char *url;
    char *source;
} JSLICENSE_FILE_INFO;

typedef struct JSLICENSE_FILE_INFO_LIST {
    char *category;
    size_t number;
    JSLICENSE_FILE_INFO *list;
} JSLICENSE_FILE_INFO_LIST;

typedef struct JSLICENSE_CATEGORY_LIST {
    size_t number;
    JSLICENSE_FILE_INFO_LIST *list;
} JSLICENSE_CATEGORY_LIST;

typedef struct FILE_INFO_KEY_PAIR {
    const char *key;
    int integer;
} FILE_INFO_KEY_PAIR;

typedef struct FILE_ASSOCIATED_INFO {
    size_t info_number;
    size_t info_space;
    FILE_INFO_KEY_PAIR *info;
} FILE_ASSOCIATED_INFO;

typedef struct FILE_ASSOCIATED_INFO_LIST {
    size_t number;
    FILE_ASSOCIATED_INFO *list;
} FILE_ASSOCIATED_INFO_LIST;

typedef struct HTML_STAGE_HANDLER_INFO {
    /* Perl function reference */
    void *sv;
    char *priority;
} HTML_STAGE_HANDLER_INFO;

typedef struct HTML_STAGE_HANDLER_INFO_LIST {
    size_t number;
    HTML_STAGE_HANDLER_INFO *list;
} HTML_STAGE_HANDLER_INFO_LIST;

typedef struct SPECIAL_UNIT_INFO {
    int type;
    size_t variety_nr;
    char *value;
} SPECIAL_UNIT_INFO;

def_list_type(SPECIAL_UNIT_INFO_LIST, SPECIAL_UNIT_INFO);

typedef struct PRE_CLASS_TYPE_INFO {
    enum element_type type;
    char *pre_class;
} PRE_CLASS_TYPE_INFO;

typedef struct HTML_CONVERTER_STATE {
    /* set for a converter */
    int external_references_number; /* total number of external references
                              that could be called during conversion */
    int code_types[TXI_TREE_TYPES_NUMBER];
    COMMAND_INTEGER_INFORMATION *html_customized_upper_case_commands;
    TYPE_INTEGER_INFORMATION *html_customized_code_types;
    char *pre_class_types[TXI_TREE_TYPES_NUMBER];
    ACCENT_ENTITY_INFO accent_entities[BUILTIN_CMD_NUMBER];
    STRING_LIST files_css_rule_lines;
    STRING_LIST files_css_import_lines;
  /* perl function references. This should be SV *sv,
     but we don't want to include the Perl headers everywhere; */
    const void *file_id_setting_refs[FIS_unit_file_name+1];
    int file_id_setting_ref_number; /* number of references actually set */
    FORMATTING_REFERENCE
       formatting_references[FR_format_translate_message+1];
    FORMATTING_REFERENCE
       css_string_formatting_references[FR_format_translate_message+1];
    FORMATTING_REFERENCE commands_open[BUILTIN_CMD_NUMBER];
    FORMATTING_REFERENCE commands_conversion[BUILTIN_CMD_NUMBER];
    FORMATTING_REFERENCE css_string_commands_conversion[BUILTIN_CMD_NUMBER];
    FORMATTING_REFERENCE types_open[TXI_TREE_TYPES_NUMBER];
    FORMATTING_REFERENCE types_conversion[TXI_TREE_TYPES_NUMBER];
    FORMATTING_REFERENCE css_string_types_conversion[TXI_TREE_TYPES_NUMBER];
    FORMATTING_REFERENCE output_units_conversion[OU_special_unit+1];
    FORMATTING_REFERENCE *special_unit_body;
    STRING_LIST special_unit_varieties;
    STRING_LIST customized_special_unit_varieties;
    SPECIAL_UNIT_INFO_LIST customized_special_unit_info;
    char **special_unit_info[SPECIAL_UNIT_INFO_TYPE_NR];
    char **translated_special_unit_info_texinfo[SPECIAL_UNIT_INFO_TREE_NR];
    HTMLXREF_MANUAL_LIST htmlxref;
    TYPE_CONVERSION_FUNCTION type_conversion_function[TXI_TREE_TYPES_NUMBER];
    TYPE_CONVERSION_FUNCTION css_string_type_conversion_function[TXI_TREE_TYPES_NUMBER];
    TYPE_OPEN_FUNCTION type_open_function[TXI_TREE_TYPES_NUMBER];
    COMMAND_CONVERSION_FUNCTION command_conversion_function[BUILTIN_CMD_NUMBER];
    COMMAND_OPEN_FUNCTION command_open_function[BUILTIN_CMD_NUMBER];
    COMMAND_CONVERSION_FUNCTION css_string_command_conversion_function[BUILTIN_CMD_NUMBER];
    OUTPUT_UNIT_CONVERSION_FUNCTION output_unit_conversion_function[OU_special_unit+1];
    SPECIAL_UNIT_BODY_FORMATTING *special_unit_body_formatting;
    HTML_DIRECTION_STRING_TRANSLATED *translated_direction_strings[TDS_TRANSLATED_MAX_NR];
    HTML_DIRECTION_STRING_TRANSLATED **customized_translated_direction_strings[TDS_TRANSLATED_MAX_NR];
    HTML_STAGE_HANDLER_INFO_LIST html_stage_handlers[HSHT_type_finish +1];
    HTML_NO_ARG_COMMAND_CUSTOMIZATION customized_no_arg_commands_formatting[BUILTIN_CMD_NUMBER];
    char ***customized_directions_strings[(TDS_TYPE_MAX_NR) - (TDS_TRANSLATED_MAX_NR)];
    PRE_CLASS_TYPE_INFO *html_customized_pre_class_types;
    COMMAND_ACCENT_ENTITY_INFO *html_customized_accent_entity_info;
    HTML_STYLE_COMMAND_CONVERSION html_style_command_conversion[BUILTIN_CMD_NUMBER][STYLE_COMMAND_CONTEXT_NR];
    COMMAND_HTML_STYLE_COMMAND_CONVERSION *html_customized_style_commands;
    /* for global directions texts, for example Space.  The texts are available
       at converter initialization, possibly based on customization.
       The names are set when first accessed (from XS).
     */
    STRING_LIST global_texts_direction_names;
    const char **main_units_direction_names;
    C_HASHMAP units_direction_names_index;
    DIRECTION_NODE_NAME_LIST customized_global_units_directions;
    STRING_LIST added_global_units_directions;
    STRING_LIST customized_global_text_directions;
    /* associate cmd and index in special_unit_varieties STRING_LIST */
    /* number in sync with command_special_unit_variety, +1 for trailing 0 */
    COMMAND_ID_INDEX command_special_variety_name_index[4+1];

    /* set for a document */
    /* next two set in conversion initialization */
    FIXED_STRING_WITH_LEN special_character[SC_non_breaking_space+1];
    FIXED_STRING_WITH_LEN line_break_element;
    /* reset and set in conversion initialization, based on information
       obtained at converter initialization in files_css_* */
    STRING_LIST css_rule_lines;
    STRING_LIST css_import_lines;
    /* reset and set in conversion initialization */
    CSS_SELECTOR_STYLE_LIST css_element_class_styles;
    /* filled based on css_element_class_styles when needed */
    STRING_LIST css_element_class_list;
    /* next two reset and set in conversion initialization based on
       default and customized and on special characters and similar.
    */
    char ***directions_strings[TDS_TYPE_MAX_NR];
    HTML_NO_ARG_COMMAND_FORMATTING html_no_arg_command_conversion[BUILTIN_CMD_NUMBER];
    enum htmlxref_split_type document_htmlxref_split_type;
    /* Allocated at converter initialization based on customization.
       Zeroed before conversion, then filled. */
    const OUTPUT_UNIT **global_units_directions;
    /* reallocated and reset when set */
    SPECIAL_UNIT_DIRECTION *special_units_direction_names;
    /* both for global units associated to normal output units and
       for special output units, sorted according to direction name */
    /* free'd when global_units_directions are zeroed, set when first
       accessed (from XS only) */
    SPECIAL_UNIT_DIRECTION_LIST global_units_direction_names;
    /* allocated at converter initialization, reset when translate_names
       is called or at the end of the conversion */
    ELEMENT **translated_special_unit_info_tree[SUIT_type_heading+1];
    /* set or reset before conversion */
    void *registered_ids_c_hashmap;
    /* potentially one target list per command (only for some actually,
       registered in html_target_cmds */
    /* reset in conversion initialization.  The trees are also free'd after
       the conversion, to avoid having trees to build at that point.
     */
    HTML_TARGET_LIST html_targets[BUILTIN_CMD_NUMBER];
    HTML_TARGET_LIST html_special_targets[ST_footnote_location+1];
    /* list of cmd with targets that have been allocated */
    COMMAND_STACK html_target_cmds;
    /* reset before conversion before being filled */
    FILE_SOURCE_INFO_LIST files_source_info;
    /* reset in conversion initialization */
    JSLICENSE_CATEGORY_LIST jslicenses;
    size_t *special_unit_file_indices;  /* array of indices in
              output_unit_files each position corresponding to a
              special output unit */
    /* Next are in converter_info in Perl.  Reset in conversion initialization */
    char *title_titlepage;
    ELEMENT *simpletitle_tree;
    enum command_id simpletitle_cmd;
    ELEMENT *title_tree;
    char *title_string;
    char *documentdescription_string;
    char *copying_comment;
    char *documentinfo_metadata;
    char *destination_directory;
    char *document_name;
    /* for user-defined translations */
    /* reset before conversion */
    LANG_TRANSLATION **translation_cache;

    /* set for a document only in C */
    /* output units lists descriptors for output units lists associated
       to the converter, stored in document.
       In Perl the output units lists are directly associated
       to the converter. */
    size_t output_units_descriptors[OUDT_external_nodes_units+1];

    /* state only in C converter */
    unsigned long modified_state; /* specifies which perl state to rebuild */
    ELEMENT_LIST tree_to_build; /* C trees that needs to be built to perl
                               before calling perl functions on it */
    COMMAND_ID_LIST no_arg_formatted_cmd_translated; /* list of commands that
                         were translated and need to be passed back to perl */
    /* next 4 allow to switch from normal HTML formatting to css strings
       formatting */
    FORMATTING_REFERENCE *current_formatting_references;
    TYPE_CONVERSION_FUNCTION *current_types_conversion_function;
    COMMAND_CONVERSION_FUNCTION *current_commands_conversion_function;
    void (* current_format_protect_text) (const char *text, TEXT *result);

    int added_title_tree;
    /* reset and set at the beginning of conversion */
    char *date_in_header;
    /* next two reset and set based on conf before starting the conversion */
    char **html_active_icons;
    char **html_passive_icons;

    /* state common with perl converter */
    int document_global_context_counter;
    const ELEMENT *current_root_command;
    const ELEMENT *current_node;
    /* unset right after an output unit conversion */
    const OUTPUT_UNIT *current_output_unit;
    HTML_DOCUMENT_CONTEXT_STACK html_document_context;
    STRING_LIST multiple_pass;
    /* allocated or resized if needed when setting up page files.
       should be empty at the end of conversion, if not there is an
       error message output and it is cleared */
    STRING_STACK_LIST pending_closes;
    /* reset after the conversion and each time it is set outside
       of the conversion.  Also reset before calling output
       (although it is not needed) */
    FILE_NUMBER_NAME current_filename;
    ELEMENT_REFERENCE_STACK referred_command_stack;
    /* next three reset both in conversion initialization and finalization */
    HTML_SHARED_CONVERSION_STATE shared_conversion_state;
    HTML_INLINE_CONTENT_STACK pending_inline_content;
    HTML_PENDING_FOOTNOTE_STACK pending_footnotes;
    /* checked to be empty and reset if not in conversion finalization */
    HTML_ASSOCIATED_INLINE_CONTENT_LIST associated_inline_content;
    /* reset in conversion initialization, resized and zeroed when the
       number of output units associated files are known. */
    PAGES_CSS_LIST page_css;
    /* reset at conversion initialization */
    STRING_LIST check_htmlxref_already_warned;
    FILE_ASSOCIATED_INFO_LIST html_files_information;
    /* state common with perl converter, not transmitted to perl */
    int use_unicode_text;

    /* used to cache information passed to Perl, corresponding to
       document and converter_info.  Actually reference to the corresponding
       Perl objects as setup at initialization, kept here to be sure that
       they do not change even if later on another object is passed.
     */
    void *pl_info_hv; /* converter->{'converter_info'} */
} HTML_CONVERTER_STATE;



#endif
