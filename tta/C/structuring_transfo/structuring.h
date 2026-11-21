/* structuring.h - declarations for structuring.c */
#ifndef STRUCTURING_H
#define STRUCTURING_H

#include "options_data.h"
#include "tree_types.h"
#include "document_types.h"

/* avoid a dependence on converter_types.h */
struct CONVERTER_CACHE_TRANSLATE;

void associate_internal_references (DOCUMENT *document);
void sectioning_structure (DOCUMENT *document);
void sectioning_targets (DOCUMENT *document, int warn_duplicate_section_target);
void insert_nodes_for_sectioning_commands (DOCUMENT *document,
                                      int warn_duplicate_section_target);
void construct_nodes_tree (DOCUMENT *document);
CONST_NODE_RELATIONS_LIST *get_node_node_childs_from_sectioning (
                                  const NODE_RELATIONS *node_relations);
void warn_non_empty_parts (DOCUMENT *document);
void warn_multiple_node_descriptions (DOCUMENT *document);
void complete_node_tree_with_menus (DOCUMENT *document);
void check_node_tree_menu_structure (DOCUMENT *document);
void check_nodes_are_referenced (DOCUMENT *document);
void number_floats (DOCUMENT *document);

ELEMENT *new_node_menu_entry (const NODE_RELATIONS *node_relations,
                              int use_sections);
ELEMENT *new_complete_node_menu (const NODE_RELATIONS *node_relations,
                        DOCUMENT *document,
                        const LANG_TRANSLATION *lang_translations,
                        int debug_level, int use_sections,
               struct CONVERTER_CACHE_TRANSLATE *translation_function);
void new_block_command (ELEMENT *element);
ELEMENT *new_detailmenu (ERROR_MESSAGE_LIST *error_messages,
                const OPTIONS *options,
                const LANG_TRANSLATION *lang_translation,
                const C_HASHMAP *identifiers_target,
                const NODE_RELATIONS_LIST *nodes_list,
                const CONST_ELEMENT_LIST *menus, int use_sections,
                struct CONVERTER_CACHE_TRANSLATE *translation_function);
ELEMENT *new_complete_menu_master_menu (ERROR_MESSAGE_LIST *error_messages,
                               const OPTIONS *options,
                               const LANG_TRANSLATION *lang_translations,
                               const C_HASHMAP *identifiers_target,
                               const NODE_RELATIONS_LIST *nodes_list,
                               const NODE_RELATIONS *node_relations,
                    struct CONVERTER_CACHE_TRANSLATE *translation_function);

#endif
