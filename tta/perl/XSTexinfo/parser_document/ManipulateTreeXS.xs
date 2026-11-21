/* Copyright 2023-2026 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* ALTIMP perl/Texinfo/ManipulateTreeNonXS.pm */

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include <string.h>

#include "tree_types.h"
#include "document_types.h"
#include "xs_utils.h"
/* new_document */
#include "document.h"
/* insert_nodes_for_sectioning_commands */
#include "structuring.h"
/* relate_index_entries_to_table_items_in_document
   move_index_entries_after_items_in_document */
#include "transformations.h"
#include "manipulate_tree.h"
#include "get_perl_info.h"
#include "build_perl_info.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */

MODULE = Texinfo::ManipulateTree	PACKAGE = Texinfo::ManipulateTree

PROTOTYPES: ENABLE

# This is only used in tests, and not for all the tests, copy_element_tree is
# more generally used because the C tree element cannot be found in general.
SV *
copy_tree_root (SV *tree_in)
    PREINIT:
        DOCUMENT *document;
     CODE:
        document = get_sv_tree_document (tree_in, "copy_tree_root");
        if (document)
          {
            ELEMENT *result = copy_tree_root (document->tree);
            DOCUMENT *copy_document = new_document ();
          /* document additional information, global info, labels, indices...
             is not setup with the copy, we only have the tree to store.
             This is not different from the Perl code and, in general,
             it is best that way.
           */
            SV *sv = build_texinfo_tree (result, 0);
            HV *hv = (HV *) SvRV (sv);
            copy_document->tree = result;
            hv_store (hv, "tree_document_descriptor",
                      strlen ("tree_document_descriptor"),
                      newSViv ((IV) copy_document->descriptor), 0);
            RETVAL = newSVsv (sv);
          }
        else
          RETVAL = newSV(0);
    OUTPUT:
        RETVAL

void
relate_index_entries_to_table_items_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document;
     CODE:
        document = get_sv_document_document (document_in,
                   "relate_index_entries_to_table_items_in_document");
        if (document)
          relate_index_entries_to_table_items_in_document (document);

void
move_index_entries_after_items_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document;
     CODE:
        document = get_sv_document_document (document_in,
                            "move_index_entries_after_items_in_document");
        if (document)
          move_index_entries_after_items_in_document (document);

# Next functions are provided to be able to test the C code.  The functions
# used in Perl code should be the corresponding functions with tree in
# argument that are not overriden.
void
protect_colon_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document
          = get_sv_document_document (document_in, "protect_colon_in_document");
        if (document)
          protect_colon_in_document (document);

void
protect_comma_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                                             "protect_comma_in_document");
        if (document)
          protect_comma_in_document (document);

void
protect_node_after_label_in_document (SV *document_in)
    PREINIT:
        DOCUMENT *document = 0;
     CODE:
        document = get_sv_document_document (document_in,
                              "protect_node_after_label_in_document");
        if (document)
          protect_node_after_label_in_document (document);

void
insert_nodes_for_sectioning_commands (SV *document_in, SV *warn_duplicate_section_target_sv=0)
    PREINIT:
        DOCUMENT *document = 0;
    CODE:
        document = get_sv_document_document (document_in,
                               "insert_nodes_for_sectioning_commands");
        if (document)
          {
            int warn_duplicate_section_target = -1;
            if (warn_duplicate_section_target_sv
                && SvOK (warn_duplicate_section_target_sv))
              warn_duplicate_section_target
                 = SvIV (warn_duplicate_section_target_sv);

            insert_nodes_for_sectioning_commands (document,
                                      warn_duplicate_section_target);
          }

# could that be called in a situation where the document is not found?
SV *
tree_print_details (SV *tree_in, SV *fname_encoding_in=0, SV *use_filename_in=0)
    PREINIT:
        const DOCUMENT *document = 0;
        SV *result_sv = 0;
     CODE:
        document = get_sv_tree_document (tree_in,
                                         "tree_print_details");
        if (document)
          {
            char *result;
            const char *fname_encoding = 0;
            int use_filename = 0;

            if (fname_encoding_in && SvOK (fname_encoding_in))
              fname_encoding = SvPVbyte_nolen(fname_encoding_in);

            if (use_filename_in && SvOK (use_filename_in))
              use_filename = SvIV (use_filename_in);

            result = tree_print_details (document->tree,
                                fname_encoding, use_filename, 0);
            result_sv = newSVpv_utf8 (result, 0);
            non_perl_free (result);
          }

        if (result_sv)
          RETVAL = result_sv;
        else
          RETVAL = newSV (0);
    OUTPUT:
        RETVAL

# Simplistic wrapper around SvREFCNT.  Should be similar to
# Devel::Peek::SvREFCNT, but we do not use Devel::Peek as it cannot be loaded
# in an eval.
# The second argument is only used in the Perl subroutine.
int
SvREFCNT (SV *sv, ...)
    PROTOTYPE: $;$
    CODE:
        if (!SvOK (sv))
          RETVAL = -1;
        else
          RETVAL = SvREFCNT (sv);
    OUTPUT:
        RETVAL

