/* tree.h - declarations for tree.c */
#ifndef TREE_H
#define TREE_H

#include <stddef.h>

#include "element_types.h"
#include "command_ids.h"
#include "list_macros.h"
#include "tree_types.h"

/* Array of "associated info" key names, extra type and data. */
extern const ASSOCIATED_INFO_DATA associated_info_table[];

ASSOCIATED_INFO *new_associated_info (void);
ELEMENT *new_element (enum element_type type);
ELEMENT *new_command_element (enum element_type type, enum command_id cmd);
ELEMENT *new_text_element (enum element_type type);
ELEMENT_LIST *new_list (void);
CONST_ELEMENT_LIST *new_const_element_list (void);
const ELEMENT **new_directions (void);

decl_list_fns(CONST_ELEMENT_LIST, const_element, const ELEMENT *);
decl_list_fns(ELEMENT_LIST, element, ELEMENT *);

void add_to_element_contents (ELEMENT *parent, ELEMENT *e);
void add_element_to_element_contents (ELEMENT *parent, ELEMENT *e);
void add_to_contents_as_array (ELEMENT *parent, ELEMENT *e);
void insert_into_element_list (ELEMENT_LIST *list, ELEMENT *e, size_t where);
void insert_into_contents (ELEMENT *parent, ELEMENT *e, size_t where);
void insert_into_contents_as_array (ELEMENT *parent, ELEMENT *e, size_t where);
void add_element_if_not_in_list (ELEMENT_LIST *list, ELEMENT *e);
void insert_list_slice_into_list (ELEMENT_LIST *to, size_t where,
                                  const ELEMENT_LIST *from,
                                  size_t start, size_t end);
void insert_slice_into_contents (ELEMENT *to, size_t idx, const ELEMENT *from,
                                 size_t start, size_t end);
void insert_list_slice_into_contents (ELEMENT *to, size_t idx,
                                      const ELEMENT_LIST *from,
                                      size_t start, size_t end);
void insert_list_slice_into_const_list (CONST_ELEMENT_LIST *to, size_t where,
                          const ELEMENT_LIST *from, size_t start, size_t end);
void list_set_empty_contents (ELEMENT_LIST *e_list, size_t n);
ELEMENT *remove_from_element_list (ELEMENT_LIST *list, size_t where);
const ELEMENT *remove_from_const_element_list (CONST_ELEMENT_LIST *list,
                                               size_t where);
ELEMENT *remove_from_contents (ELEMENT *parent, size_t where);
void remove_slice_from_contents (ELEMENT *parent, size_t start, size_t end);
ELEMENT *last_contents_child (const ELEMENT *current);
ELEMENT *pop_element_from_contents (ELEMENT *parent);
void destroy_list (ELEMENT_LIST *list);
void destroy_const_element_list (CONST_ELEMENT_LIST *list);
void destroy_element (ELEMENT *e);
void destroy_element_and_children (ELEMENT *e);
const ELEMENT *replace_remove_list_element (ELEMENT_LIST *list,
                              const ELEMENT *removed, ELEMENT *added);
void destroy_key_pair_value (KEY_PAIR *k_pair);
void destroy_associated_info (ASSOCIATED_INFO *a);
void free_element_source_mark_list (ELEMENT *e);
void destroy_element_empty_source_mark_list (ELEMENT *e);

enum ai_key_name find_associated_info_key (const char *attribute);

void setup_ai_key_name_index (void);

#endif
