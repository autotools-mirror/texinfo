/* convert_to_texinfo.h - definitions for convert_to_texinfo.c */
#ifndef CONVERT_TO_TEXINFO_H
#define CONVERT_TO_TEXINFO_H

#include "text.h"
#include "tree_types.h"

TEXT convert_to_texinfo_text (const ELEMENT *e);
char *convert_to_texinfo (const ELEMENT *e);
char *convert_contents_to_texinfo (const ELEMENT *e);
char *target_element_to_texi_label (const ELEMENT *element);

int check_node_same_texinfo_code (const ELEMENT *reference_node,
                                  const ELEMENT *node_content);
char *root_heading_command_to_texinfo (const ELEMENT *element);

#endif
