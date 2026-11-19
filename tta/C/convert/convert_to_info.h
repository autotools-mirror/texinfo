/* convert_to_info.h - definitions for convert_to_info.c */
#ifndef CONVERT_TO_INFO_H
#define CONVERT_TO_INFO_H

#include "text.h"
#include "command_ids.h"
#include "tree_types.h"
#include "document_types.h"
#include "converter_types.h"
#include "list_macros.h"

CONVERTER_INITIALIZATION_INFO *info_converter_defaults
                                (enum converter_format format,
                                 const CONVERTER_INITIALIZATION_INFO *conf);

TEXT info_output (CONVERTER *self, DOCUMENT *document);

void info_format_anchor (CONVERTER *self, const ELEMENT *anchor);
void info_format_contents (CONVERTER *self, SECTIONING_ROOT *sectioning_root,
                           enum command_id contents_or_shortcontents_cmd);
void info_format_footnotes (CONVERTER *self, const OUTPUT_UNIT *output_unit);
void info_format_reference_to_footnote (CONVERTER *self);
void info_format_printindex (CONVERTER *self, const ELEMENT *printindex);
void info_format_ref (CONVERTER *self, enum command_id cmd,
                      const ELEMENT *element, const CONST_ELEMENT_LIST *args);
void info_format_error_outside_of_any_node (CONVERTER *self,
                                       const ELEMENT *element);
void info_format_node (CONVERTER *self, const ELEMENT *node,
                       const NODE_RELATIONS *node_relations);
TEXT info_format_image (CONVERTER *self, const char *image_file,
                   const TEXT *text, const TEXT *alt,
                   int dpi, int depth, int *lines_count);
int info_format_image_element (CONVERTER *self, const ELEMENT *element,
                               const CONST_ELEMENT_LIST *args);
TEXT info_quote_image (CONVERTER *self, const TEXT *image_text);
#endif
