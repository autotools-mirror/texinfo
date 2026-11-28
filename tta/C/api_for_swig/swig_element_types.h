/* swig_element_types.h - declarations for interface elements types */
#ifndef SWIG_ELEMENT_TYPES_H
#define SWIG_ELEMENT_TYPES_H

/* next two may need changes for builtin_commands.h flags modifications */
#define TXI_CM_FLAGS_LIST \
  cm_flag(line) \
  cm_flag(root) \
  cm_flag(sectioning_heading) \
  cm_flag(brace) \
  cm_flag(math) \
  cm_flag(variadic) \
  cm_flag(ref) \
  cm_flag(block) \
  cm_flag(global) \
  cm_flag(def) \
  cm_flag(def_alias) \
  cm_flag(preformatted) \
  cm_flag(preformatted_code) \
  cm_flag(no_paragraph) \
  cm_flag(nobrace) \
  cm_flag(blockitem) \
  cm_flag(index_entry_command) \
  cm_flag(global_unique)

#define TXI_CM_OTHER_FLAGS_LIST \
  cm_oflag(letter_no_arg) \
  cm_oflag(inline_format) \
  cm_oflag(inline_conditional) \
  cm_oflag(in_index) \
  cm_oflag(in_def) \
  cm_oflag(brace_code) \
  cm_oflag(explained) \
  cm_oflag(formatted_line) \
  cm_oflag(formatted_nobrace) \
  cm_oflag(formattable_line) \
  cm_oflag(non_formatted_block) \
  cm_oflag(non_formatted_brace) \
  cm_oflag(appendix) \
  cm_oflag(unnumbered) \
  cm_oflag(metadata)

/* next list may need changes for types_data.h flags modifications */
#define TXI_TY_FLAGS_LIST \
  ty_flag(text) \
  ty_flag(command) \
  ty_flag(container) \
  ty_flag(leading_space) \
  ty_flag(trailing_space)

#endif
