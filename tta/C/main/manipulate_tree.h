/* manipulate_tree.h - declarations for manipulate_tree.c */
#ifndef MANIPULATE_TREE_H
#define MANIPULATE_TREE_H

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
#include <inttypes.h>

#include "text.h"
#include "element_types.h"
#include "source_mark_types.h"
#include "tree_types.h"
#include "document_types.h"

ELEMENT *copy_element_tree (ELEMENT *current,
                            ELEMENT_LIST *added_root_elements);
ELEMENT *copy_tree_root (ELEMENT *root);
ELEMENT *copy_contents (const ELEMENT *element,
               ELEMENT_LIST *added_root_elements, enum element_type type);



ELEMENT *copy_container_contents (const ELEMENT *container);



void tree_remove_parents (ELEMENT *element);



void add_source_mark (SOURCE_MARK *source_mark, ELEMENT *e);
size_t relocate_source_marks (SOURCE_MARK_LIST *source_mark_list, ELEMENT *new_e,
                              size_t previous_position, size_t current_position);



int parse_node_manual (ELEMENT *node, NODE_SPEC_EXTRA *manual_node);



uintptr_t print_element_details (ELEMENT *element, int level,
                              const char *prepended,
                              uintptr_t current_nr, TEXT *result,
                              const char *fname_encoding, int use_filename,
                              int show_element_pointer);
uintptr_t print_tree_details (ELEMENT *element, int level,
                              const char *prepended,
                              uintptr_t current_nr, TEXT *result,
                              const char *fname_encoding, int use_filename,
                              int show_element_pointer);
char *tree_print_details (ELEMENT *tree, const char *fname_encoding,
                          int use_filename, int show_element_pointer);
char *element_print_details (ELEMENT *element, const char *fname_encoding,
                             int use_filename);
char *element_number_or_error (const ELEMENT *element);
char *root_command_element_string (const ELEMENT *element);

uintptr_t set_element_tree_numbers (ELEMENT *element, uintptr_t current_nr);
void remove_element_tree_numbers (ELEMENT *element);



ELEMENT *modify_tree (ELEMENT *tree,
 ELEMENT_LIST *(*operation)(const char *type, ELEMENT *element, void *argument),
                      void *argument);

ELEMENT *new_asis_command_with_text (const char *text, ELEMENT *parent,
                                     enum element_type type);

ELEMENT *protect_colon_in_tree (ELEMENT *tree);
ELEMENT *protect_comma_in_tree (ELEMENT *tree);
ELEMENT *protect_node_after_label_in_tree (ELEMENT *tree);

void protect_colon_in_document (DOCUMENT *document);
void protect_comma_in_document (DOCUMENT *document);
void protect_node_after_label_in_document (DOCUMENT *document);
void protect_first_parenthesis (ELEMENT *element);

ELEMENT *reference_to_arg_in_tree (ELEMENT *tree, DOCUMENT *document);



const char *normalized_menu_entry_internal_node (const ELEMENT *entry);
ELEMENT *normalized_entry_associated_internal_node (const ELEMENT *entry,
                                 const C_HASHMAP *identifiers_target);
const ELEMENT *first_menu_node (const NODE_RELATIONS *node_relations,
                                const C_HASHMAP *identifiers_target);
#endif
