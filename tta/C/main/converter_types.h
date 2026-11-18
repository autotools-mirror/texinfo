/* converter_types.h - declarations of types used in many places */
#ifndef CONVERTER_TYPES_H
#define CONVERTER_TYPES_H

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

/* for FILE */
#include <stdio.h>
#include <stddef.h>

#include "text.h"
#include "element_types.h"
#include "command_ids.h"
#include "tree_types.h"
#include "document_types.h"
#include "option_types.h"
#include "options_data.h"
#include "list_macros.h"

/* for interdependency with convert_to_text.h */
struct TEXT_OPTIONS;

struct C_HASHMAP;

struct PLAINTEXT_CONVERTER_STATE;

struct HTML_CONVERTER_STATE;

/* formatting context flags */
#define CTXF_string     0x0001
#define CTXF_code       0x0002



typedef struct TRANSLATED_COMMAND {
    enum command_id cmd;
    char *translation;
} TRANSLATED_COMMAND;

def_list_type(TRANSLATED_COMMAND_LIST, TRANSLATED_COMMAND);

typedef struct DEPRECATED_DIR_INFO {
  char *reference_dir;
  char *obsolete_dir;
} DEPRECATED_DIR_INFO;

def_list_type(DEPRECATED_DIRS_LIST, DEPRECATED_DIR_INFO);

/* information on converter configuration from a source of configuration
   (either output format or user customization) */
typedef struct CONVERTER_INITIALIZATION_INFO {
    TRANSLATED_COMMAND_LIST translated_commands;
    OPTIONS_LIST conf;
    DEPRECATED_DIRS_LIST deprecated_config_directories;
    /* gather strings that are not customization options */
    STRING_LIST non_valid_customization;
} CONVERTER_INITIALIZATION_INFO;


/* except for COF_none, which means that the format has no C implementation,
   the value of the enum should match the index in the converter_format_data
   table that dispatches the functions used for conversion */
enum converter_format {
   COF_unknown = -2,
   COF_none, /* -1 */
   COF_plaintext,
   COF_info,
   COF_html,
   COF_rawtext,
   COF_plaintexinfo,
};

/* for string information passing to/from perl */
enum sv_string_type {
   svt_byte,
   svt_dir,
   svt_char,
};

enum command_type_variety {
   CTV_type_none,
   CTV_type_command,
   CTV_type_type,
};

typedef struct COMMAND_ID_LIST {
    size_t number;
    enum command_id *list;
} COMMAND_ID_LIST;

typedef struct FILE_STREAM {
    char *file_path;
    FILE *stream;
    /* actually PerlIO */
    void *io;
} FILE_STREAM;

def_list_type(FILE_STREAM_LIST, FILE_STREAM);

typedef struct OUTPUT_FILES_INFORMATION {
    STRING_LIST opened_files;
    FILE_STREAM_LIST unclosed_files;
} OUTPUT_FILES_INFORMATION;

typedef struct FILE_NAME_PATH_COUNTER {
    char *filename;
    char *normalized_filename;
    char *filepath;
    int counter;
    int elements_in_file_count; /* only used in HTML, corresponds to
                                   'elements_in_file_count' */
    TEXT body;           /* file body output, used for HTML */
    const OUTPUT_UNIT *first_unit;
} FILE_NAME_PATH_COUNTER;

typedef struct FILE_NAME_PATH_COUNTER_LIST {
    size_t number;
    size_t space;
    FILE_NAME_PATH_COUNTER *list;
} FILE_NAME_PATH_COUNTER_LIST;

/* contains only indices with entries */
def_list_type(SORTED_INDEX_NAMES, const INDEX *);

typedef struct CONVERTER {
    int converter_descriptor;
  /* perl converter. This should be SV *sv,
     but we don't want to include the Perl headers everywhere; */
    void *sv;

  /* this is the type of the converter, not of the output.  (Similar to
     a module name in Perl).  Should only be used to determine which
     functions are to be called */
    enum converter_format format;
    /* used to pass converter_defaults result, if going through XS and
       destroyed shortly after */
    CONVERTER_INITIALIZATION_INFO *format_defaults;
    OPTIONS *conf;
    /* an array containing the fields of conf ordered by name */
    OPTION **sorted_options;
    /* set to commands user defined from customization in generic converter
       during converter initialization, or reset and set to each of
       the commands values just before starting the conversion in HTML */
    COMMAND_OPTION_VALUE commands_init_conf[BUILTIN_CMD_NUMBER];
    EXPANDED_FORMAT *expanded_formats;
    TRANSLATED_COMMAND_LIST translated_commands;
    /* set based on documentlanguage customization option, if set,
       and reset when the documentlanguage changes.  Allocated
       and put in the cache if the language was never seen.
     */
    const LANG_TRANSLATION *current_lang_translations;

    ERROR_MESSAGE_LIST error_messages;
    /* for error messages registered in the converter */
    STRING_LIST small_strings;

    DOCUMENT *document;

    /* reset in converter_set_document */
    struct TEXT_OPTIONS *convert_text_options;
    struct TEXT_OPTIONS *convert_index_text_options;

    int upper_case[BUILTIN_CMD_NUMBER];

    /* output unit files API */
    /* reset for output */
    FILE_NAME_PATH_COUNTER_LIST output_unit_files;
    /* reset at allocation */
    size_t *output_unit_file_indices;   /* array of indices in output_unit_files
              each position corresponding to an output unit. */

    /* to find index in output_unit_files based on name */
    /* reset upon allocation */
    NAME_NUMBER_LIST page_name_number;

  /* API to open, set encoding and register files */
    OUTPUT_FILES_INFORMATION output_files_information;

  /* associates deprecated directories and reference directories */
    DEPRECATED_DIRS_LIST deprecated_config_directories;

    /* resized and reset at the beginning of the conversion */
    SORTED_INDEX_NAMES sorted_index_names;

    INDICES_SORT_STRINGS *indices_sort_strings;
    COLLATIONS_INDICES_SORTED_BY_INDEX *sorted_indices_by_index;
    COLLATIONS_INDICES_SORTED_BY_LETTER *sorted_indices_by_letter;

  /* Info/plaintext specific */
    struct PLAINTEXT_CONVERTER_STATE *plaintext_converter;

  /* HTML specific */
    struct HTML_CONVERTER_STATE *html_converter;
} CONVERTER;

/* in command_stack */
/* either a type or a command id */
typedef struct {
    enum command_type_variety variety;
    union {
      enum command_id cmd;
      enum element_type type;
    } ct;
} COMMAND_OR_TYPE;

def_list_type(COMMAND_OR_TYPE_STACK, COMMAND_OR_TYPE);

/* following types used in several converter codes, but not in this file */

typedef struct TARGET_FILENAME {
    char *target;
    char *filename;
    const char *extension;
} TARGET_FILENAME;

typedef struct TARGET_CONTENTS_FILENAME {
    char *target;
    char *filename;
    char *target_contents;
    char *target_shortcontents;
} TARGET_CONTENTS_FILENAME;

typedef struct FILE_NAME_PATH {
    char *filename;
    char *filepath;
} FILE_NAME_PATH;

typedef struct TARGET_DIRECTORY_FILENAME {
    char *filename;
    char *directory;
    char *target;
} TARGET_DIRECTORY_FILENAME;

typedef struct OUTPUT_TEXT_FILES_INFO {
    OUTPUT_FILES_INFORMATION *output_files_information;
    char *text;
    size_t len;
} OUTPUT_TEXT_FILES_INFO;

typedef struct CONVERTER_TEXT_INFO {
    CONVERTER *converter;
    char *text;
} CONVERTER_TEXT_INFO;

typedef struct ACCENT_ENTITY_INFO {
    char *entity;
    char *characters;
} ACCENT_ENTITY_INFO;

typedef struct COMMAND_ACCENT_ENTITY_INFO {
    enum command_id cmd;
    ACCENT_ENTITY_INFO accent_entity_info;
} COMMAND_ACCENT_ENTITY_INFO;

/* for translation, to pass HTML specific function and the converter */
typedef struct CONVERTER_CACHE_TRANSLATE {
    CONVERTER *converter;
    TRANSLATION_TREE * (* cache_translate_string_fn) (
                        CONVERTER *converter,
                        const char *string,
                        const LANG_TRANSLATION *lang_translation,
                        const char *translation_context);
} CONVERTER_CACHE_TRANSLATE;

typedef struct CONVERTER_CDT_TREE {
    CONVERTER *converter;
    ELEMENT * (*cdt_tree_fn) (const char *string, CONVERTER *self,
                             NAMED_STRING_ELEMENT_LIST *replaced_substrings,
                             const char *translation_context);
} CONVERTER_CDT_TREE;

#endif

