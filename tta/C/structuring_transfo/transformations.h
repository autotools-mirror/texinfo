/* transformations.h - declarations for transformations.c */
#ifndef TRANSFORMATIONS_H
#define TRANSFORMATIONS_H

#include "tree_types.h"
#include "document_types.h"

/* tree transformations, keep in sync with
   Texinfo::Common::valid_tree_transformations and STTF flags just below */
#define TT_TYPES_LIST \
  tt_type(complete_tree_nodes_menus) \
  tt_type(complete_tree_nodes_missing_menu) \
  tt_type(fill_gaps_in_sectioning) \
  tt_type(insert_nodes_for_sectioning_commands) \
  tt_type(move_index_entries_after_items) \
  tt_type(regenerate_master_menu) \
  tt_type(relate_index_entries_to_table_items)

/* sync relevant flags with swig/texinfo.i */
/* document tree transformations selection flags, only used in
   complete_transform_document, called from C */
#define STTF_complete_tree_nodes_menus              0x0001
#define STTF_complete_tree_nodes_missing_menu       0x0002
#define STTF_fill_gaps_in_sectioning                0x0004
#define STTF_move_index_entries_after_items         0x0008
#define STTF_regenerate_master_menu                 0x0010
#define STTF_relate_index_entries_to_table_items    0x0020

/* document structuring selection flags */
#define STTF_auto_section_node                      0x0040
#define STTF_floats                                 0x0080
#define STTF_no_warn_non_empty_parts                0x0100
#define STTF_warn_multiple_node_descriptions        0x0200
#define STTF_nodes_tree                             0x0400
#define STTF_no_warn_duplicate_section_target       0x0800

/* for complete_tree_nodes_menus, complete_tree_nodes_missing_menu
   and regenerate_master_menu */
#define STTF_complete_menus_use_sections            0x1000

/* not strictly a structuring and transformations selection flags */
/* used to mark that splitting is possible for a format */
#define STTF_split                                  0x2000
/* used to mark that internal links can be output for that format */
#define STTF_internal_links                         0x4000
/* mark a format handled by texi2dvi */
#define STTF_texi2dvi_format                        0x8000

/* backward compatibility */
#define STTF_insert_nodes_for_sectioning_commands   0x00010000

void fill_gaps_in_sectioning_in_document (DOCUMENT *document,
                                     const char *commands_heading_texi);
void relate_index_entries_to_table_items_in_document (DOCUMENT *document);
void move_index_entries_after_items_in_document (DOCUMENT *document);
void reference_to_arg_in_document (DOCUMENT *document);
void complete_tree_nodes_menus_in_document (DOCUMENT *document,
                                            int use_sections);
void complete_tree_nodes_missing_menu (DOCUMENT *document, int use_sections);
int regenerate_master_menu (DOCUMENT *document, int use_sections);
ELEMENT *protect_hashchar_at_line_beginning (ELEMENT *tree,
                                             DOCUMENT *document);
void protect_hashchar_at_line_beginning_in_document (DOCUMENT *document);
void protect_first_parenthesis_in_targets (ELEMENT *tree);
void protect_first_parenthesis_in_targets_in_document (DOCUMENT *document);

void complete_transform_document (DOCUMENT *document, unsigned long flags,
                                  int format_menu, int auto_section_node,
                                  int warn_duplicate_section_target,
                                  const char *commands_heading_texi);

#endif
