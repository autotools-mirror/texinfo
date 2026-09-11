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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

#include <config.h>

#include <stdlib.h>
#include <stdio.h>
#include <stddef.h>
/* for ssize_t */
#include <sys/types.h>
#include <string.h>
/* for strcasecmp */
#include <strings.h>
#include <errno.h>
#include <inttypes.h>
#include <sys/stat.h>
#include <dirent.h>
/* for euidaccess.  Not portable, use gnulib */
#include <unistd.h>

#include "command_ids.h"
#include "element_types.h"
#include "option_types.h"
#include "options_data.h"
#include "text.h"
#include "tree_types.h"
#include "document_types.h"
#include "converter_types.h"
#include "html_converter_state.h"
#include "html_converter_types.h"
#include "html_conversion_data.h"
#include "html_css_data.h"
/* bug fatal isascii_alnum isascii_alpha read_var_len */
#include "base_utils.h"
/* new_element */
#include "tree.h"
/* also for fill_source_info_file */
#include "errors.h"
#include "builtin_commands.h"
#include "command_stack.h"
#include "utils.h"
/* option_force_conf option_set_conf */
#include "customization_options.h"
#include "extra.h"
#include "debug.h"
#include "targets.h"
/* unicode_character_brace_no_arg_commands */
#include "unicode.h"
#include "convert_to_texinfo.h"
#include "node_name_normalization.h"
/* nobrace_symbol_text text_brace_no_arg_commands */
#include "convert_to_text.h"
/* free_translation_cache */
#include "translations.h"
#include "output_unit.h"
#include "html_conversion_state.h"
/* converter_encoded_output_file_name */
#include "convert_utils.h"
/* no_brace_command_accent_upper_case
   xml_text_entity_no_arg_commands_formatting */
#include "converter.h"
#include "convert_indices.h"
#include "call_html_perl_function.h"
#include "hashmap.h"
#include "format_html.h"
/* txi_paths_info */
#include "document.h"
#include "set_parser_conf.h"
#include "parser_api.h"
/* html_complete_no_arg_commands_formatting html_run_stage_handlers
   html_add_to_files_source_info html_find_file_source_info
   html_reset_shared_conversion_state */
#include "convert_html.h"
#include "html_prepare_converter.h"
#include "html_conversion_api.h"
#include "html_converter_api.h"

typedef struct CMD_VARIETY {
    enum command_id cmd;
    char *variety;
} CMD_VARIETY;

typedef struct COMMAND_ID_ARGS_SPECIFICATION {
    enum command_id cmd;
    unsigned long flags[MAX_COMMAND_ARGS_NR];
} COMMAND_ID_ARGS_SPECIFICATION;

/* in main/html_css_data.c */
extern const CSS_SELECTOR_STYLE base_default_css_element_class_styles[];

const char *html_global_unit_direction_names[] = {
  #define hgdt_name(name) #name,
   HTML_GLOBAL_DIRECTIONS_LIST
  #undef hgdt_name
};

const char *html_formatting_reference_names[] = {
  #define html_fr_reference(name) #name,
   HTML_FORMATTING_REFERENCES_LIST
  #undef html_fr_reference
};

static CSS_SELECTOR_STYLE_LIST default_css_element_class_styles;

COMMAND_ARGS_SPECIFICATION html_command_args_flags[BUILTIN_CMD_NUMBER];

/* should match enum htmlxref_split_type */
const char *htmlxref_split_type_names[htmlxref_split_type_chapter + 1] =
{
  "mono", "node", "section", "chapter"
};

static COMMAND_ID_ARGS_SPECIFICATION default_commands_args[] = {
  {CM_anchor, {F_AFT_monospacestring}},
  {CM_namedanchor, {F_AFT_monospacestring, F_AFT_normal}},
  {CM_email, {F_AFT_url | F_AFT_monospacestring, F_AFT_normal}},
  {CM_footnote, {F_AFT_none}}, /* no flag */
  {CM_printindex, {F_AFT_none}}, /* no flag */
  {CM_uref, {F_AFT_url | F_AFT_monospacestring, F_AFT_normal, F_AFT_normal}},
  {CM_url, {F_AFT_url | F_AFT_monospacestring, F_AFT_normal, F_AFT_normal}},
  {CM_sp, {F_AFT_none}}, /* no flag */
  {CM_inforef, {F_AFT_monospace, F_AFT_normal, F_AFT_filenametext}},
  {CM_xref, {F_AFT_monospace, F_AFT_normal, F_AFT_normal, F_AFT_filenametext, F_AFT_normal}},
  {CM_pxref, {F_AFT_monospace, F_AFT_normal, F_AFT_normal, F_AFT_filenametext, F_AFT_normal}},
  {CM_ref, {F_AFT_monospace, F_AFT_normal, F_AFT_normal, F_AFT_filenametext, F_AFT_normal}},
  {CM_link, {F_AFT_monospace, F_AFT_normal, F_AFT_filenametext}},
  {CM_image, {F_AFT_url | F_AFT_filenametext | F_AFT_monospacestring, F_AFT_filenametext, F_AFT_filenametext, F_AFT_string | F_AFT_normal, F_AFT_filenametext}},
  {CM_inlinefmt, {F_AFT_monospacetext, F_AFT_normal}},
  {CM_inlinefmtifelse, {F_AFT_monospacetext, F_AFT_normal, F_AFT_normal}},
  {CM_inlineraw, {F_AFT_monospacetext, F_AFT_raw}},
  {CM_inlineifclear, {F_AFT_monospacetext, F_AFT_normal}},
  {CM_inlineifset, {F_AFT_monospacetext, F_AFT_normal}},
  {CM_item, {F_AFT_none}}, /* no flag */
  {CM_itemx, {F_AFT_none}}, /* no flag */
  {CM_value, {F_AFT_monospacestring}},
  {CM_abbr, {F_AFT_normal, F_AFT_string | F_AFT_normal}},
  {CM_acronym, {F_AFT_normal, F_AFT_string | F_AFT_normal}},
};

/* types that are in code style in the default case. */
static enum element_type default_code_types[] = {
  0,
};

const PRE_CLASS_TYPE_INFO default_pre_class_types[] = {
  {ET_menu_comment, "menu-comment"},
  {0, 0}
};

static enum command_id quoted_style_commands[] = {
  CM_samp, 0
};

static enum command_id HTML_align_cmd[] = {
   CM_raggedright, CM_flushleft, CM_flushright, CM_center, 0
};

static enum command_id additional_format_context_cmd[] = {
   CM_tab, CM_item, CM_itemx, CM_headitem, 0
 };

/* should correspond to enum html_special_character */
/* HTML textual entity, UTF-8 encoded, unicode point, HTML numeric entity */
const char *special_characters_formatting[SC_non_breaking_space+1][4] = {
  {"&para;", "\xC2\xB6", "00B6", "&#182;"},
  {"&lsquo;", "\xE2\x80\x98", "2018", "&#8216;"},
  {"&rsquo;", "\xE2\x80\x99", "2019", "&#8217;"},
  {"&bull;", "\xE2\x80\xA2", "2022", "&#8226;"},
  {"&nbsp;", "\xC2\xA0", "00A0", "&#160;"},
};

CMD_VARIETY command_special_unit_variety[] = {
                                {CM_contents, "contents"},
                                {CM_shortcontents, "shortcontents"},
                                {CM_summarycontents, "shortcontents"},
                                {CM_footnote, "footnotes"},
                                {0, 0},
};

static const enum command_id conf_for_special_units[]
                          = {CM_footnotestyle, 0};

static const enum command_id contents_elements_options[]
             = {CM_contents, CM_shortcontents, CM_summarycontents, 0};

static const enum command_id informative_global_commands[]
             = {CM_documentlanguage, CM_documentscript, CM_footnotestyle,
                CM_xrefautomaticsectiontitle,
                CM_deftypefnnewline, 0};

static enum element_type ignored_types[] = {
    ET_ignorable_spaces_after_command,
    ET_postamble_after_end,
    ET_preamble_before_beginning,
    ET_preamble_before_setfilename,
    ET_spaces_at_end,
    ET_spaces_before_paragraph,
    ET_spaces_after_close_brace,
    ET_spaces_before_argument,
    ET_spaces_after_argument,
    ET_arguments_line, 0
};

HTML_COMMAND_STRUCT html_commands_data[BUILTIN_CMD_NUMBER];

static HTML_NO_ARG_COMMAND_CONVERSION default_no_arg_commands_formatting
                              [BUILTIN_CMD_NUMBER][NO_ARG_COMMAND_CONTEXT_NR];

static HTML_STYLE_COMMAND_CONVERSION default_style_commands_formatting
                               [BUILTIN_CMD_NUMBER][STYLE_COMMAND_CONTEXT_NR];

static COMMAND_STACK preformatted_cmd_list;
static COMMAND_STACK def_cmd_list;

static char *unicode_entities[BUILTIN_CMD_NUMBER];

COMMAND_ID_LIST no_arg_formatted_cmd;
COMMAND_ID_LIST style_formatted_cmd;
COMMAND_ID_LIST accent_cmd;
COMMAND_ID_LIST format_raw_cmd;



/* Initialization code called only once.  Setup some base/default data */

static void
register_format_context_command (enum command_id cmd)
{
  html_commands_data[cmd].flags |= HF_format_context;
}

static void register_pre_class_command (enum command_id cmd,
                                        enum command_id main_cmd)
{
  if (main_cmd)
    html_commands_data[cmd].pre_class_cmd = main_cmd;
  else
    html_commands_data[cmd].pre_class_cmd = cmd;

  html_commands_data[cmd].flags |= HF_pre_class;
}

static void
set_no_arg_commands_formatting (HTML_NO_ARG_COMMAND_CONVERSION *spec,
                                char *text)
{
  spec->text = text;
  spec->unset = 0;
}

static char *
get_special_list_mark_css_string_no_arg_command (enum command_id cmd)
{
  int s;
  for (s = 0;
       special_list_mark_css_string_no_arg_command[s].cmd > 0;
       s++)
    {
       if (special_list_mark_css_string_no_arg_command[s].cmd == cmd)
        {
           return special_list_mark_css_string_no_arg_command[s].string;
           break;
        }
    }
  return 0;
}

void
clear_css_selector_style_list (CSS_SELECTOR_STYLE_LIST *selector_styles)
{
  size_t j;

  for (j = 0; j < selector_styles->number; j++)
    {
      CSS_SELECTOR_STYLE *selector_style = &selector_styles->list[j];
      free (selector_style->selector);
      free (selector_style->style);
    }
  /* The following is not needed, as next the list is freed, or
     set_css_selector_style_list_size is called, which sets number.
  selector_styles->number = 0;
   */
}

static void
set_css_selector_style_list_size (CSS_SELECTOR_STYLE_LIST *selector_styles,
                                  size_t size)
{
  if (selector_styles->space < size)
    {
      selector_styles->list = (CSS_SELECTOR_STYLE *)
        realloc (selector_styles->list, size * sizeof (CSS_SELECTOR_STYLE));
      selector_styles->space = size;
    }
  selector_styles->number = size;
}

/* set information that is independent of customization, only called once */
/* depends on xml formatting data setup in setup_converter_generic.
   When the libraries initialization functions are called when loading XS
   modules, the Convert::Converter module should be loaded before
   the Convert::HTML module. */
void
html_format_setup (enum converter_format format)
{
  int i;
  int no_arg_formatted_cmd_nr = 0;
  int accent_cmd_nr = 0;
  int style_formatted_cmd_nr = 0;
  int format_raw_cmd_nr = 0;
  int no_arg_formatted_cmd_idx;
  int default_commands_args_nr
    = sizeof (default_commands_args) / sizeof (default_commands_args[0]);
  int max_args = MAX_COMMAND_ARGS_NR;
  CSS_SELECTOR_STYLE *display_preformatted_css_selector_style;
  TEXT css_string_text;

  const enum command_id indented_format[] = {
    CM_example, CM_display, CM_lisp, 0
  };

  html_default_options_setup ();

  set_css_selector_style_list_size (&default_css_element_class_styles,
                                    BASE_DEFAULT_CSS_ELEMENT_CLASS_STYLE_NR);
  for (i = 0; i < BASE_DEFAULT_CSS_ELEMENT_CLASS_STYLE_NR; i++)
    {
      CSS_SELECTOR_STYLE *selector_style
        = &default_css_element_class_styles.list[i];
      selector_style->selector
        = base_default_css_element_class_styles[i].selector;
      selector_style->style
        = base_default_css_element_class_styles[i].style;
    }
  sort_css_element_class_styles (&default_css_element_class_styles);

  display_preformatted_css_selector_style
    = find_css_selector_style (&default_css_element_class_styles,
                               "pre.display-preformatted");
  html_css_set_selector_style (&default_css_element_class_styles,
                               "pre.format-preformatted",
                               display_preformatted_css_selector_style->style);

  for (i = 0; i < default_commands_args_nr; i++)
    {
      /* we file the status for specified commands, to distinguish them
         but it is not actually used in the code, as we default to
         normal for unspecified commands too */
      enum command_id cmd = default_commands_args[i].cmd;
      html_command_args_flags[cmd].status = 1;
      memcpy (&html_command_args_flags[cmd].flags,
              &default_commands_args[i].flags,
              max_args * sizeof (unsigned long));
    }

  for (i = 0; indented_format[i]; i++)
    {
      char *css_selector;
      enum command_id cmd = indented_format[i];
      html_commands_data[cmd].flags |= HF_indented_preformatted;

      /* div.lisp is output as div.example */
      if (cmd != CM_lisp)
        {
          xasprintf (&css_selector, "div.%s", builtin_command_name (cmd));
          html_css_set_selector_style (&default_css_element_class_styles,
                                       css_selector,
                                       "margin-left: 3.2em");
          free (css_selector);
        }
    }

  for (i = 0; small_block_associated_command[i][0]; i++)
    {
      enum command_id small_cmd = small_block_associated_command[i][0];
      enum command_id cmd = small_block_associated_command[i][1];
      if (command_data[cmd].flags & CF_preformatted)
        {
          register_pre_class_command (small_cmd, cmd);
        }
      html_commands_data[small_cmd].flags |= HF_small_block_command;
      if (html_commands_data[cmd].flags & HF_indented_preformatted)
        html_commands_data[small_cmd].flags |= HF_indented_preformatted;
    }

  for (i = 0; no_brace_command_accent_upper_case[i][0]; i++)
    {
      enum command_id cmd = no_brace_command_accent_upper_case[i][0];
      enum command_id upper_case_cmd = no_brace_command_accent_upper_case[i][1];
      html_commands_data[cmd].upper_case_cmd = upper_case_cmd;
    }

  /* set flags */
  /* also count the number of no_arg_formatted_cmd, style_formatted_cmd and
     accent_cmd commands and other types of commands */
  for (i = 1; i < BUILTIN_CMD_NUMBER; i++)
    {
      if (xml_text_entity_no_arg_commands_formatting[i])
        no_arg_formatted_cmd_nr++;

      if (html_style_commands_element[i]
          || (command_data[i].flags & CF_brace
              && (command_data[i].data == BRACE_style_other
                  || command_data[i].data == BRACE_style_code
                  || command_data[i].data == BRACE_style_no_code)))
        {
          html_commands_data[i].flags |= HF_style_command;
          style_formatted_cmd_nr++;
        }

      if (command_data[i].flags & CF_brace
          && command_data[i].data == BRACE_accent)
        {
          accent_cmd_nr++;
          html_command_args_flags[i].status = 1;
          html_command_args_flags[i].flags[0] = F_AFT_none;
        }

      if ((command_data[i].flags & CF_block
           && command_data[i].data != BLOCK_format_raw)
          || command_data[i].flags & CF_root)
        register_format_context_command (i);

      if (command_data[i].flags & CF_preformatted
          || command_data[i].flags & CF_root)
        html_commands_data[i].flags |= HF_composition_context;

      if (command_data[i].flags & CF_block)
        {
          if (command_data[i].data == BLOCK_menu)
            html_commands_data[i].flags |= HF_composition_context;
          else if (command_data[i].data == BLOCK_format_raw)
            {
              html_commands_data[i].flags |= HF_format_raw;
              format_raw_cmd_nr++;
            }
        }

      if (command_data[i].flags & CF_preformatted)
        {
          if (!(html_commands_data[i].flags & HF_pre_class))
            register_pre_class_command (i, 0);
          add_(command) (&preformatted_cmd_list, i);
        }

      if (command_data[i].flags & CF_def)
        add_(command) (&def_cmd_list, i);
    }
  register_pre_class_command (CM_verbatim, 0);
  register_pre_class_command (CM_menu, 0);
  for (i = 0; additional_format_context_cmd[i]; i++)
    register_format_context_command (additional_format_context_cmd[i]);

  /* do not consider indicateurl to be a style command, it has a different
     formatting function */
  html_commands_data[CM_indicateurl].flags &= ~HF_style_command;

  for (i = 0; HTML_align_cmd[i]; i++)
    {
      enum command_id cmd = HTML_align_cmd[i];
      html_commands_data[cmd].flags |= HF_HTML_align | HF_composition_context;
    }

  html_commands_data[CM_float].flags |= HF_composition_context;

  initialize_cmd_list (&no_arg_formatted_cmd, no_arg_formatted_cmd_nr,
                       no_arg_formatted_cmd_nr);
  initialize_cmd_list (&accent_cmd, accent_cmd_nr, 0);
  initialize_cmd_list (&style_formatted_cmd, style_formatted_cmd_nr, 0);
  initialize_cmd_list (&format_raw_cmd, format_raw_cmd_nr, 0);

  for (i = 0; quoted_style_commands[i]; i++)
    {
      enum command_id cmd = quoted_style_commands[i];
      enum conversion_context cctx;
      for (cctx = 0; cctx < STYLE_COMMAND_CONTEXT_NR; cctx++)
        {
          default_style_commands_formatting[cmd][cctx].quote = 1;
        }
    }

  no_arg_formatted_cmd_idx = 0;
  for (i = 0; i < BUILTIN_CMD_NUMBER; i++)
    {
      if (command_data[i].flags & CF_brace
          && command_data[i].data == BRACE_accent)
        {
          accent_cmd.list[accent_cmd.number] = i;
          accent_cmd.number++;
        }
      else if (html_commands_data[i].flags & HF_format_raw)
        {
          format_raw_cmd.list[format_raw_cmd.number] = i;
          format_raw_cmd.number++;
        }

      if (html_commands_data[i].flags & HF_style_command)
        {
          style_formatted_cmd.list[style_formatted_cmd.number] = i;
          style_formatted_cmd.number++;

          if (html_style_commands_element[i])
            {
              enum conversion_context cctx;
              for (cctx = 0; cctx < STYLE_COMMAND_CONTEXT_NR; cctx++)
                {
       /* the default_style_commands_formatting contains const char only
          but the type is not const, so drop the const with a cast */
                  default_style_commands_formatting[i][cctx].element
                    = (char *) html_style_commands_element[i];
                }
            }
        }

      if (xml_text_entity_no_arg_commands_formatting[i])
        {
          /* the value is never modified but the struct field type is not const
             so need to cast to drop const */
          default_no_arg_commands_formatting[i][HCC_type_normal].text
             = (char *)xml_text_entity_no_arg_commands_formatting[i];

          no_arg_formatted_cmd.list[no_arg_formatted_cmd_idx] = i;
          no_arg_formatted_cmd_idx++;

          /* preset unset for string and preformatted contexts */
          /* css_string coverage is checked when setting css string context
             values below and unset is set explicitly if needed */
          default_no_arg_commands_formatting[i][HCC_type_string].unset = 1;
          default_no_arg_commands_formatting[i][HCC_type_preformatted].unset = 1;
        }
    }

  default_style_commands_formatting[CM_sc][HCC_type_preformatted].element
      = "span";

  /* modify normal context values and add other contexts values, removing
     unset.  Should only be for commands with normal context already set.
   */
  default_no_arg_commands_formatting[CM_SPACE][HCC_type_normal].text = "&nbsp;";
  default_no_arg_commands_formatting[CM_TAB][HCC_type_normal].text = "&nbsp;";
  default_no_arg_commands_formatting[CM_NEWLINE][HCC_type_normal].text = "&nbsp;";

  default_no_arg_commands_formatting[CM_enddots][HCC_type_normal].text = "...";
  default_no_arg_commands_formatting[CM_enddots][HCC_type_normal].element
     = "small";

  set_no_arg_commands_formatting (
   &default_no_arg_commands_formatting[CM_dots][HCC_type_preformatted], "...");
  set_no_arg_commands_formatting (
   &default_no_arg_commands_formatting[CM_enddots][HCC_type_preformatted], "...");

  default_no_arg_commands_formatting[CM_ASTERISK][HCC_type_normal].text = "<br>";
  set_no_arg_commands_formatting (
   &default_no_arg_commands_formatting[CM_ASTERISK][HCC_type_preformatted], "\n");

  for (i = 0; i < no_arg_formatted_cmd_nr; i++)
    {
      enum command_id cmd = no_arg_formatted_cmd.list[i];
      /* prepare unicode numeric entities.  Freed at exit */
      if (unicode_character_brace_no_arg_commands[cmd].codepoint)
        {
          unsigned long point_nr
           = strtoul (unicode_character_brace_no_arg_commands[cmd].codepoint,
                      NULL, 16);
          char *entity;
          xasprintf (&entity, "&#%lu;", point_nr);
          unicode_entities[cmd] = entity;
        }

      /* css_strings */
      if (cmd == CM_ASTERISK)
        default_no_arg_commands_formatting[cmd][HCC_type_css_string].text
          = "\\A ";
      else if (cmd == CM_error)
        {
          default_no_arg_commands_formatting[cmd][HCC_type_css_string].text
            = 0;
          default_no_arg_commands_formatting[cmd][HCC_type_css_string].unset
            = 1;
        }
      else if (unicode_character_brace_no_arg_commands[cmd].css_string)
        {
          unsigned long point_nr
           = strtoul (unicode_character_brace_no_arg_commands[cmd].codepoint,
                      NULL, 16);
          if (point_nr < 128) /* 7bit ascii */
            default_no_arg_commands_formatting[cmd][HCC_type_css_string].text
              = (char *)unicode_character_brace_no_arg_commands[cmd].text;
          else
          /* the value is never modified but the struct field type is not const
             so need to cast to drop const */
            default_no_arg_commands_formatting[cmd][HCC_type_css_string].text
              = (char *)unicode_character_brace_no_arg_commands[cmd].css_string;
        }
      else if (nobrace_symbol_text[cmd])
        default_no_arg_commands_formatting[cmd][HCC_type_css_string].text
          /* the value is never modified but the struct field type is not const
             so need to cast to drop const */
          = (char *)nobrace_symbol_text[cmd];
      else if (text_brace_no_arg_commands[cmd])
          /* the value is never modified but the struct field type is not const
             so need to cast to drop const */
        default_no_arg_commands_formatting[cmd][HCC_type_css_string].text
          = (char *)text_brace_no_arg_commands[cmd];
      else
        fprintf (stderr, "BUG: %s: no css_string\n",
                         command_data[cmd].cmdname);
    }

  /* w not in css_string, set the corresponding default_css_element_class_styles
     especially, which also has none and not w in the class */
  html_css_set_selector_style (&default_css_element_class_styles,
                               "ul.mark-none", "list-style-type: none");

  text_init (&css_string_text);
  /* setup default_css_element_class_styles for mark commands based on
     css strings */
  for (i = 0; i < no_arg_formatted_cmd_nr; i++)
    {
      enum command_id cmd = no_arg_formatted_cmd.list[i];
      if (default_no_arg_commands_formatting[cmd][HCC_type_css_string].text
          && command_data[cmd].flags & CF_brace)
        {
          char *selector;
          text_append_n (&css_string_text, "list-style-type: ", 17);
          if (cmd == CM_bullet)
            text_append_n (&css_string_text, "disc", 4);
          else
            {
              char *css_string;
              const char *p;
              char *special_list_mark_command
                = get_special_list_mark_css_string_no_arg_command (cmd);
              if (special_list_mark_command)
                css_string = special_list_mark_command;
              else
                css_string
        = default_no_arg_commands_formatting[cmd][HCC_type_css_string].text;
              p = html_after_escaped_characters (css_string);
              text_append_n (&css_string_text, "\"", 1);
              if (p && !*p)
                {
                  text_append_n (&css_string_text, css_string,
                                 p - css_string - 1);
                }
              else
                text_append (&css_string_text, css_string);
              text_append_n (&css_string_text, "\"", 1);
            }
          xasprintf (&selector, "ul.mark-%s", builtin_command_name (cmd));
          html_css_set_selector_style (&default_css_element_class_styles,
                                       selector, css_string_text.text);
          free (selector);
          text_reset (&css_string_text);
        }
    }
  free (css_string_text.text);
}

/* ALTIMP Texinfo::Convert::HTML builtin_default_css_text */
/* should be called after html_format_setup */
char *
html_builtin_default_css_text (void)
{
  TEXT css_text;
  size_t i;

  text_init (&css_text);
  text_append (&css_text, "");

  for (i = 0; i < default_css_element_class_styles.number; i++)
    {
      CSS_SELECTOR_STYLE *selector_style
        = &default_css_element_class_styles.list[i];
      if (strlen (selector_style->style))
        text_printf (&css_text, "%s {%s}\n", selector_style->selector,
                                             selector_style->style);
    }

  return css_text.text;
}



/* converter_initialize functions.

   beginning of converter initialize, setup special units info, apply
   defaults based on customization variables.
   Apply specific customizations (from Perl) */

/* This should be constant at the end of the converter initialization */
int
html_nr_string_directions (const CONVERTER *self)
{
  const HTML_CONVERTER_STATE *self_html = self->html_converter;

  /* The corresponding direction without FirstInFile are used instead
     of FirstInFile*, so the directions_strings are not set */
  return NON_SPECIAL_DIRECTIONS_NR - FIRSTINFILE_NR
       + (int) self_html->special_unit_varieties.number
       + (int) self_html->added_global_units_directions.number
       + (int) self_html->customized_global_text_directions.number;
}

/* here because it is used in files also needing html_nr_string_directions */
void
html_free_customized_global_units_directions (
             DIRECTION_NODE_NAME_LIST *customized_global_units_directions)
{
  size_t j;
  for (j = 0; j < customized_global_units_directions->number; j++)
    {
      DIRECTION_NODE_NAME *direction_node_name
       = &customized_global_units_directions->list[j];
      free (direction_node_name->direction);
      free (direction_node_name->node_name);
    }
  free (customized_global_units_directions->list);
  customized_global_units_directions->list = 0;
  customized_global_units_directions->number = 0;
}

/* only used from XS */
void
html_set_global_direction (CONVERTER *self,
              DIRECTION_NODE_NAME_LIST *customized_global_units_directions,
              const char *direction, const char *node_name)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  DIRECTION_NODE_NAME *direction_node_name = 0;
  int main_directions_idx = html_get_direction_index (self, direction);
  if (main_directions_idx < 0)
    {
      message_list_document_warn (&self->error_messages,
            self->conf, 0, "not setting an unknown direction: %s",
                      direction);
      return;
    }

  if (customized_global_units_directions->number > 0)
    {
      size_t i;
      for (i = 0; i < customized_global_units_directions->number; i++)
        {
          DIRECTION_NODE_NAME *current
            = &customized_global_units_directions->list[i];
          if (!strcmp (current->direction, direction))
            {
              direction_node_name = current;
              break;
            }
        }
      if (!direction_node_name)
        customized_global_units_directions->list
          = realloc (
             customized_global_units_directions->list,
             sizeof (DIRECTION_NODE_NAME)
              * (customized_global_units_directions->number+1));
    }
  else
    {
      customized_global_units_directions->list
        = (DIRECTION_NODE_NAME *)
            malloc (sizeof (DIRECTION_NODE_NAME));
    }

  if (!direction_node_name)
    {
      direction_node_name
        = &customized_global_units_directions->list[
            customized_global_units_directions->number];
      direction_node_name->node_name = 0;
      direction_node_name->direction = strdup (direction);
      if (main_directions_idx > DEFAULT_GLOBAL_DIRECTION_LAST_IDX)
        {
          /* do not replace relative directions */
          direction_node_name->direction_nr = 0;

          if (node_name)
            message_list_document_warn (&self->error_messages,
               self->conf, 0, "keep direction %s, do not set to `%s'",
                   self_html->main_units_direction_names[main_directions_idx],
                                 node_name);
          else
            message_list_document_warn (&self->error_messages,
              self->conf, 0, "keep direction %s",
                  self_html->main_units_direction_names[main_directions_idx]);
        }
      else
        direction_node_name->direction_nr = main_directions_idx+1;
      customized_global_units_directions->number++;
    }
  else
    {
      free (direction_node_name->node_name);
      direction_node_name->node_name = 0;
    }
  if (node_name)
    direction_node_name->node_name = strdup (node_name);
}

/* Also used to get htmlxref info from Perl.  Initialize in C */
HTMLXREF_MANUAL *
new_htmlxref_manual_list (size_t size)
{
  HTMLXREF_MANUAL *result = (HTMLXREF_MANUAL *)
        malloc (size * sizeof (HTMLXREF_MANUAL));
  memset (result, 0, size * sizeof (HTMLXREF_MANUAL));

  return result;
}

/* This variable setting/substitution is quite generic and could be used
   in other codes, but it is only needed here for now */
typedef struct STRING_VARIABLE_INFO {
    char *name;
    char *string;
} STRING_VARIABLE_INFO;

typedef struct STRING_VARIABLES_LIST {
    size_t number;
    size_t space;
    STRING_VARIABLE_INFO *list;
} STRING_VARIABLES_LIST;

static void
set_variable_value (STRING_VARIABLES_LIST *variables,
                    const char *name, const char *value)
{
  size_t i;

  for (i = 0; i < variables->number; i++)
    {
      STRING_VARIABLE_INFO *variable = &variables->list[i];
      if (!strcmp (variable->name, name))
        {
          free (variable->string);
          variable->string = strdup (value);
          return;
        }
    }

  if (variables->number == variables->space)
    {
      variables->list = (STRING_VARIABLE_INFO *) realloc
        (variables->list,
                   sizeof (STRING_VARIABLE_INFO) * (variables->space += 5));
    }

  variables->list[variables->number].name = strdup (name);
  variables->list[variables->number].string = strdup (value);

  variables->number++;
}

static void
clear_string_variables_list (STRING_VARIABLES_LIST *variables)
{
  size_t i;

  for (i = 0; i < variables->number; i++)
    {
      STRING_VARIABLE_INFO *variable = &variables->list[i];
      free (variable->name);
      free (variable->string);
    }
  variables->number = 0;
}

static char *
substitute_variables (const char *input_text,
                      const STRING_VARIABLES_LIST *variables)
{
  TEXT substituted;
  const char *p = input_text;

  text_init (&substituted);
  text_append (&substituted, "");

  while (*p)
    {
      const char *q = strchr (p, '$');
      if (q)
        {
          int found = 0;
          size_t var_len;

          if (q - p)
            text_append_n (&substituted, p, q - p);
          p = q;
          q++; /* past $ */
          if (*q == '{')
            {
              /* past { */
              q++;
              var_len = read_var_len (q);
              if (var_len)
                {
                  if (*(q + var_len) == '}')
                    {
                      size_t i;
                      char *flag = strndup (q, var_len);

                      /* past } */
                      q += var_len +1;
                      for (i = 0; i < variables->number; i++)
                        {
                          if (!strcmp (variables->list[i].name, flag))
                            {
                              text_append (&substituted,
                                           variables->list[i].string);
                              found = 1;
                              break;
                            }
                        }
                      free (flag);
                    }
                }
            }

          if (!found)
            text_append_n (&substituted, p, q - p);
          p = q;
        }
      else
        {
          text_append (&substituted, p);
          break;
        }
    }

  return substituted.text;
}

static HTMLXREF_MANUAL *
get_create_htmlxref_manual (HTMLXREF_MANUAL_LIST *htmlxref_list,
                            const char *manual_name)
{
  size_t i;
  HTMLXREF_MANUAL *htmlxref_manual;

  for (i = 0; i < htmlxref_list->number; i++)
    {
      htmlxref_manual = &htmlxref_list->list[i];
      if (!strcmp (htmlxref_manual->manual, manual_name))
        return htmlxref_manual;
    }

  if (htmlxref_list->number == htmlxref_list->space)
    {
      htmlxref_list->list = (HTMLXREF_MANUAL *) realloc
        (htmlxref_list->list,
                   sizeof (HTMLXREF_MANUAL) * (htmlxref_list->space += 5));
    }

  htmlxref_manual = &htmlxref_list->list[htmlxref_list->number];
  memset (htmlxref_manual, 0, sizeof (HTMLXREF_MANUAL));
  htmlxref_manual->manual = strdup (manual_name);

  htmlxref_list->number++;

  return htmlxref_manual;
}

static void
parse_htmlxref_files (CONVERTER *self, HTMLXREF_MANUAL_LIST *htmlxref_list,
                      STRING_LIST *htmlxref_files)
{
  size_t i;

  STRING_VARIABLES_LIST variables;
  memset (&variables, 0, sizeof (STRING_VARIABLES_LIST));

  for (i = 0; i < htmlxref_files->number; i++)
    {
      const char *file = htmlxref_files->list[i];
      FILE *stream = 0;
      int line_nr = 0;

      if (self->conf->DEBUG.o.integer > 0)
        fprintf (stderr, "C|html refs config file: %s\n", file);

      stream = fopen (file, "r");
      if (!stream)
        {
          char *decoded_file;
          const char *encoding = self->conf->COMMAND_LINE_ENCODING.o.string;

          if (encoding)
            {
              int status;
              /* cast to remove const */
              decoded_file = decode_string ((char *)file,
                                            encoding, &status, 0);
            }
          else
            decoded_file = strdup (file);

          message_list_document_warn (&self->error_messages,
                 self->conf, 0, "could not open html refs config file %s: %s",
                                      decoded_file, strerror (errno));

          free (decoded_file);

          continue;
        }

      while (1)
        {
          const char *p;
          size_t n;
          char *line = 0;
          ssize_t status = getline (&line, &n, stream);
          size_t len;
          char *split_or_mono = 0;
          char *manual;
          char *href = 0;
          enum htmlxref_split_type htmlxref_type = htmlxref_split_type_none;
          const char *q;
          size_t spaces_len;
          char *subst_href;
          HTMLXREF_MANUAL *htmlxref_manual;

          if (status == -1)
            {
              free (line);
              break;
            }
          line_nr++;

                    /*
          fprintf (stderr, "LLL %s:%d: %s", file, line_nr, line);
                    */

          p = line;

          p += strspn (p, whitespace_chars);
          if (*p == '#' || *p == '\0')
            goto next_line;

          len = read_var_len (p);
          if (len)
            {
              q = p;
              q += len;
              q += strspn (q, whitespace_chars);
              if (*q == '=')
                {
                  char *name = strndup (p, len);
                  char *definition;
                  char *end_line;
                  q++;
                  q += strspn (q, whitespace_chars);
                  definition = substitute_variables (q, &variables);
                  end_line = strchr (definition, '\n');
                  if (end_line)
                    *end_line = '\0';
                  set_variable_value (&variables, name, definition);
                    /*
                  fprintf (stderr, "VVV %s='%s'\n", name, definition);
                     */
                  free (definition);
                  free (name);
                  goto next_line;
                }
            }
          len = strcspn (p, whitespace_chars);
          /* should always be true as we already handled a spaces only line */
          if (len)
            {
              q = p + len;
              spaces_len = strspn (q, whitespace_chars);

              if (spaces_len && *q)
                {
                  size_t spec_len;

                  q += spaces_len;
                  spec_len = strcspn (q, whitespace_chars);

                  if (spec_len)
                    {
                      split_or_mono = strndup (q, spec_len);
                      q += spec_len;

                      enum htmlxref_split_type i;

                      for (i = 0; i < htmlxref_split_type_chapter+1; i++)
                        {
                          if (!strcmp (split_or_mono,
                                       htmlxref_split_type_names[i]))
                            {
                              htmlxref_type = i;
                              break;
                            }
                        }
                    }
                }
            }
            /*
          fprintf (stderr, "SOM %s %d\n", split_or_mono, htmlxref_type);
             */
          if (!split_or_mono)
            {
              SOURCE_INFO source_info;
              fill_source_info_file (&source_info, self, line_nr, file);

              message_list_line_error_ext (&self->error_messages,
                             (self->conf && self->conf->DEBUG.o.integer > 0),
                             MSG_warning, 0, &source_info, "missing type");
              goto next_line;
            }
          else if (htmlxref_type == htmlxref_split_type_none)
            {
              SOURCE_INFO source_info;
              fill_source_info_file (&source_info, self, line_nr, file);

              message_list_line_error_ext (&self->error_messages,
                      (self->conf && self->conf->DEBUG.o.integer > 0),
                       MSG_warning, 0, &source_info,
                       "unrecognized type: %s", split_or_mono);
              free (split_or_mono);
              goto next_line;
            }

          manual = strndup (p, len);

          spaces_len = strspn (q, whitespace_chars);
          if (spaces_len && *q)
            {
              q += spaces_len;
              size_t spec_len = strcspn (q, whitespace_chars);
              if (spec_len)
                {
                  href = strndup (q, spec_len);
                }
            }

          /* No warning for an empty URL prefix as it is the only way to
             override an entry appearing in a file processed later on
          if (!href)
            {
              SOURCE_INFO source_info;
              fill_source_info_file (&source_info, self, line_nr, file);

              message_list_line_error_ext (&self->error_messages,
                      (self->conf && self->conf->DEBUG.o.integer > 0),
                      MSG_warning, 0, &source_info,
                      "missing %s URL prefix for `%s'", split_or_mono, manual);
              free (split_or_mono);
              free (manual);
              goto next_line;
            }
           */
          free (split_or_mono);

          htmlxref_manual
            = get_create_htmlxref_manual (htmlxref_list, manual);
          free (manual);

           /*
          fprintf (stderr, "FFF %s '%s' %d '%s'\n", htmlxref_manual->manual,
                             href, htmlxref_type, htmlxref_manual->urlprefix[htmlxref_type]);
            */
          if (htmlxref_manual->urlprefix[htmlxref_type])
            {
              free (href);
              goto next_line;
            }

          if (href)
            {
              subst_href = substitute_variables (href, &variables);

              free (href);

              if (htmlxref_type != htmlxref_split_type_mono)
                {
                  size_t j;
                  for (j = strlen (subst_href); j > 0; j--)
                    {
                      if (subst_href[j-1] == '/')
                        subst_href[j-1] = '\0';
                      else
                        break;
                    }
                }
            }
          else
            subst_href = strdup ("");

           /*
          fprintf (stderr, "HHH %s '%s' %d\n", htmlxref_manual->manual,
                             subst_href, htmlxref_type);
           */

          htmlxref_manual->urlprefix[htmlxref_type] = strdup (subst_href);
          free (subst_href);
        next_line:
          free (line);
        }

      clear_string_variables_list (&variables);

      if (fclose (stream) == EOF)
        {
          char *decoded_file;
          const char *encoding = self->conf->COMMAND_LINE_ENCODING.o.string;

          if (encoding)
            {
              int status;
              /* cast to remove const */
              decoded_file = decode_string ((char *)file, encoding,
                                            &status, 0);
            }
          else
            decoded_file = strdup (file);
          message_list_document_warn (&self->error_messages,
                 self->conf, 0, "error on closing html refs config file %s: %s",
                                      decoded_file, strerror (errno));

          free (decoded_file);
        }
    }
  free (variables.list);
}

static void
load_htmlxref_files (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  const char *htmlxref_mode = self->conf->HTMLXREF_MODE.o.string;
  const char *htmlxref_file_name = "htmlxref.cnf";
  STRING_LIST htmlxref_files;

  if (htmlxref_mode && !strcmp (htmlxref_mode, "none"))
    return;

  memset (&htmlxref_files, 0, sizeof (STRING_LIST));
  if (htmlxref_mode && !strcmp (htmlxref_mode, "file"))
    {
      char *encoded_htmlxref_file_name;
      char *path_encoding;
      const char *htmlxref_file = self->conf->HTMLXREF_FILE.o.string;

      if (htmlxref_file)
        htmlxref_file_name = htmlxref_file;

      /* cast to remove const */
      encoded_htmlxref_file_name
         = converter_encoded_output_file_name (self->conf,
                                     &self->document->global_info,
                                     (char *)htmlxref_file_name,
                                     &path_encoding, 0);
      free (path_encoding);

      if (euidaccess (encoded_htmlxref_file_name, R_OK) == 0)
        add_string (&htmlxref_files, encoded_htmlxref_file_name);
      else
        message_list_document_warn (&self->error_messages,
                 self->conf, 0, "could not find html refs config file %s",
                                         htmlxref_file_name);
      free (encoded_htmlxref_file_name);
    }
  else
    {
      STRING_LIST htmlxref_dirs;
      const char *cnf_directory_name = "htmlxref.d";
      char *encoded_htmlxref_file_name;
      char *path_encoding;

      memset (&htmlxref_dirs, 0, sizeof (STRING_LIST));

      if (self->conf->TEST.o.integer > 0)
        {
          /* to have reproducible tests, do not use system or user
             directories if TEST is set. */
          if (txi_paths_info.texinfo_uninstalled)
            {
              if (txi_paths_info.p.uninstalled.t2a_srcdir)
                {
                  char *path;
                  xasprintf (&path, "%s/perl/t/input_files",
                             txi_paths_info.p.uninstalled.t2a_srcdir);
                  add_string (&htmlxref_dirs, path);
                  free (path);
                }
              else
                add_string (&htmlxref_dirs, "t/input_files");
            }
          add_string (&htmlxref_dirs, ".texinfo");
        }
      else
        {
          copy_strings (&htmlxref_dirs,
                        self->conf->TEXINFO_LANGUAGE_DIRECTORIES.o.strlist);
        }

      if (self->conf->TEST.o.integer > 0)
        {
          htmlxref_file_name = self->conf->HTMLXREF_FILE.o.string;
          cnf_directory_name = 0;
        }
      else if (self->conf->HTMLXREF_FILE.o.string)
        htmlxref_file_name = self->conf->HTMLXREF_FILE.o.string;

      /* encode file name and handle specific cases for the main htmlxref file
         without search in directories.
       */
      if (htmlxref_file_name)
        {
          /* cast to remove const */
          encoded_htmlxref_file_name
            = converter_encoded_output_file_name (self->conf,
                                        &self->document->global_info,
                                        (char *)htmlxref_file_name,
                                        &path_encoding, 0);
          free (path_encoding);

          if (file_name_is_absolute (encoded_htmlxref_file_name))
            {
              if (euidaccess (encoded_htmlxref_file_name, R_OK) == 0)
                add_string (&htmlxref_dirs, encoded_htmlxref_file_name);

              free (encoded_htmlxref_file_name);
              htmlxref_file_name = 0;
            }
          else
            {
              char *file_name_and_directories[3];
              int file_with_directories = 0;

              splitpath (encoded_htmlxref_file_name, file_name_and_directories);
              free (file_name_and_directories[0]);
              free (file_name_and_directories[2]);
              if (file_name_and_directories[1])
                {
                  STRING_LIST *file_directories
                    = splitdir (file_name_and_directories[1]);
                  free (file_name_and_directories[1]);
                  if (file_directories->number)
                    file_with_directories = 1;

                  destroy_strings_list (file_directories);
                }

              if (file_with_directories)
                {
                  if (euidaccess (encoded_htmlxref_file_name, R_OK) == 0)
                    add_string (&htmlxref_dirs, encoded_htmlxref_file_name);

                  free (encoded_htmlxref_file_name);
                  htmlxref_file_name = 0;
                }
            }
        }

      /* now search in directories */
      if (htmlxref_file_name || cnf_directory_name)
        {
          static DEPRECATED_DIRS_LIST deprecated_dirs_used;
          DEPRECATED_DIRS_LIST *deprecated_dirs
            = &self->deprecated_config_directories;
          char *encoded_cnf_directory_name;
          size_t i;

          if (cnf_directory_name)
            {
              /* cast to remove const */
              encoded_cnf_directory_name
                = converter_encoded_output_file_name (self->conf,
                                        &self->document->global_info,
                                        (char *)cnf_directory_name,
                                        &path_encoding, 0);
              free (path_encoding);
            }

          for (i = 0; i < htmlxref_dirs.number; i++)
            {
              char *fullpath;
              int deprecated_dir_set = 0;

              if (htmlxref_file_name)
                {
                  xasprintf (&fullpath, "%s/%s", htmlxref_dirs.list[i],
                             encoded_htmlxref_file_name);
                  if (euidaccess (fullpath, R_OK) == 0)
                    {
                      if (deprecated_dirs)
                        {
                          DEPRECATED_DIR_INFO *deprecated_dir_info
                            = find_deprecated_dir_info (deprecated_dirs,
                                                    htmlxref_dirs.list[i]);
                          if (deprecated_dir_info)
                            add_deprecated_dir_info (&deprecated_dirs_used,
                                                     deprecated_dir_info);
                          deprecated_dir_set = 1;
                        }
                      add_string (&htmlxref_files, fullpath);
                    }

                  free (fullpath);
                }

              if (cnf_directory_name)
                {
                  char *cnf_dir;
                  struct stat finfo;

                  xasprintf (&cnf_dir, "%s/%s", htmlxref_dirs.list[i],
                             encoded_cnf_directory_name);

                  if (stat (cnf_dir, &finfo) == 0 && S_ISDIR (finfo.st_mode))
                    {
                      DIR *dir = opendir (cnf_dir);
                      char *possible_file;
                      if (dir)
                        {
                          int file_found = 0;

                          struct dirent *entry;
                          while ((entry = readdir (dir)))
                            {
#ifdef _DIRENT_HAVE_DTYPE
                              if (entry->d_type != S_REG
                                  && entry->d_type != S_UNKNOWN)
                                continue;
#endif

                              size_t len = strlen (entry->d_name);
                              if (len >= 4
                                  && !memcmp (&entry->d_name[len - 4],
                                              ".cnf", 4))
                                {
                                  xasprintf (&possible_file, "%s/%s",
                                             cnf_dir, entry->d_name);
                                  if (euidaccess (possible_file, R_OK) == 0)
                                    {
                                      add_string (&htmlxref_files,
                                                  possible_file);
                                      file_found = 1;
                                    }
                                  free (possible_file);
                                }
                            }
                          (void) closedir (dir);

                          if (!deprecated_dir_set && file_found
                              && deprecated_dirs)
                            {
                              DEPRECATED_DIR_INFO *deprecated_dir_info
                                = find_deprecated_dir_info (deprecated_dirs,
                                                        htmlxref_dirs.list[i]);
                              if (deprecated_dir_info)
                                add_deprecated_dir_info (&deprecated_dirs_used,
                                                         deprecated_dir_info);
                              deprecated_dir_set = 1;
                            }
                        }
                    }
                  free (cnf_dir);
                }
            }

          if (cnf_directory_name)
            free (encoded_cnf_directory_name);

          if (deprecated_dirs_used.number)
            {
              size_t i;
              const char *encoding = self->conf->COMMAND_LINE_ENCODING.o.string;
              for (i = 0; i < deprecated_dirs_used.number; i++)
                {
                  char *dir_name, *replacement_dir;
                  DEPRECATED_DIR_INFO *deprecated_dir_info
                    = &deprecated_dirs_used.list[i];
                  if (encoding)
                    {
                      int status;
                      dir_name
                       = decode_string (deprecated_dir_info->obsolete_dir,
                                         encoding, &status, 0);
                      replacement_dir
                        = decode_string (deprecated_dir_info->reference_dir,
                                         encoding, &status, 0);
                      free (deprecated_dir_info->obsolete_dir);
                      free (deprecated_dir_info->reference_dir);
                    }
                  else
                    {
                      dir_name = deprecated_dir_info->obsolete_dir;
                      replacement_dir
                         = deprecated_dir_info->reference_dir;
                    }

                  message_list_document_warn (&self->error_messages,
                      self->conf, 0,
                      "%s directory is deprecated. Use %s instead",
                      dir_name, replacement_dir);

                  free (dir_name);
                  free (replacement_dir);
                }
              deprecated_dirs_used.number = 0;
            }
          if (htmlxref_file_name)
            free (encoded_htmlxref_file_name);
        }
      free_strings_list (&htmlxref_dirs);
    }

  if (htmlxref_files.number > 0)
    {
      parse_htmlxref_files (self, &self_html->htmlxref, &htmlxref_files);
      free_strings_list (&htmlxref_files);
    }
}

static void
html_process_css_file (CONVERTER *self, FILE *fh, char *filename,
                       STRING_LIST *imports, STRING_LIST *rules)
{
  TEXT text;
  int in_rules = 0;
  int in_comment = 0;
  int in_import = 0;
  int in_string = 0;
  int line_nr = 0;

  /* the rule is to assume utf-8.  There could also be a BOM, and
     the Content-Type: HTTP header but it is not relevant here.
     https://developer.mozilla.org/en-US/docs/Web/CSS/@charset
   */
  const char *input_encoding = "utf-8";
  ENCODING_CONVERSION *conversion
    = get_encoding_conversion (input_encoding, &input_conversions);

  text_init (&text);

  while (1)
    {
      size_t n;
      char *input_line = 0;
      char *line;
      const char *p;
      char in_string_string;

      ssize_t status = getline (&input_line, &n, fh);
      if (status == -1)
        {
          free (input_line);
          break;
        }
      if (!conversion)
        line = strdup (input_line);
      else
        {
          TEXT conv_line
            = encode_with_iconv (conversion->iconv, input_line,
                                 strlen (input_line), 0, ieh_error, 0);
          line = conv_line.text;
        }

      free (input_line);
      line_nr ++;
      /*
      char *protected_line = debug_protect_eol (line);
      fprintf (stderr, "NL(%d) '%s'\n", line_nr, protected_line);
      free (protected_line);
       */
      if (line_nr == 1)
        {
          int line_len = strlen (line);
          if (line_len > 13)
            {
              size_t n_charset;
              const char *q;
              char *charset;
              if (memcmp (line, "@charset ", 9))
                goto nocharset;
              p = line + 9;
              p += strspn (p, " ");
              if (*p != '"')
                goto nocharset;
              p++;
              q = p;
              n_charset = strcspn (p, "\"");
              if (!n_charset)
                goto nocharset;
              p += n_charset;
              if (*p != '"')
                goto nocharset;
              p++;
              p += strspn (p, " ");
              if (*p != ';')
                goto nocharset;
              p++;
              p += strspn (p, " ");
              if (*p && !strchr ("\n\r", *p))
                goto nocharset;
              charset = strndup (q, n_charset);
              conversion
               = get_encoding_conversion (charset, &input_conversions);
              free (charset);
              free (line);
              continue;
            }
          nocharset:
            ;
        }

      if (in_rules)
        {
          add_string (rules, line);
          free (line);
          continue;
        }

      text_reset (&text);
      text_append (&text, "");

      p = line;
      while (1)
        {
          /*
          char *protected_p = debug_protect_eol (p);
          char *protected_text = debug_protect_eol (text.text);
          fprintf (stderr,
            "%s!in_comment %d in_rules %d in_import %d in_string %d: '%s'\n",
             protected_text, in_comment, in_rules,
             in_import, in_string,protected_p);
          free (protected_p);
          free (protected_text);
           */

          if (in_comment)
            {
              const char *q = p;
              while (1)
                {
                  const char *k = strchr (q, '*');
                  if (k)
                    {
                      k++;
                      if (*k == '/')
                        {
                          k++;
                          text_append_n (&text, p, k - p);
                          p = k;
                          in_comment = 0;
                          break;
                        }
                      else if (!*k)
                        break;
                      else
                        q = k;
                    }
                  else
                    break;
                }
              if (in_comment)
                {
                  text_append (&text, p);
                  add_string (imports, text.text);
                  break;
                }
            }
          else if (!in_string && *p == '/')
            {
              p++;
              if (*p == '*')
                {
                  p++;
                  text_append_n (&text, "/*", 2);
                  in_comment = 1;
                }
              else
                {
                  if (text.end > 0)
                    {
                      text_append_n (&text, "\n", 1);
                      add_string (imports, text.text);
                    }
                  p--; /* back on / */
                  add_string (rules, p);
                  in_rules = 1;
                  break;
                }
            }
          else if (!in_string && in_import && *p && strchr ("\"'", *p))
            {
              /* strings outside of import start rules */
              text_append_n (&text, p, 1);
              in_string_string = *p;
              p++;
              in_string = 1;
            }
          else if (in_string && *p == '\\' && *(p+1) == in_string_string)
            {
              text_append_n (&text, p, 2);
              p += 2;
            }
          else if (in_string && *p == in_string_string)
            {
              text_append_n (&text, p, 1);
              p++;
              in_string = 0;
            }
          else
            {
              int matched_import = 0;
              if (!in_string && !in_import)
                {
                  const char *q = p;
                  if (*q == '\\')
                    q++;
                  if (strlen (q) >= 7 && !memcmp (q, "@import", 7))
                    {
                      q += 7;
                      if (!*q || strchr (whitespace_chars, *q))
                        {
                          /* spaces except newlines */
                          q += strspn (q, " \t\v\f");
                          text_append_n (&text, p, q - p);
                          in_import = 1;
                          p = q;
                          matched_import = 1;
                        }
                    }
                }
              if (!matched_import)
                {
                  if (!in_string && in_import && *p == ';')
                    {
                      text_append_n (&text, ";", 1);
                      p++;
                      in_import = 0;
                    }
                  else if ((in_import || in_string) && *p && !strchr ("\n\r", *p))
                    {
                      /* Count any UTF-8 continuation bytes. */
                      int char_len = 1;
                      while ((p[char_len] & 0xC0) == 0x80)
                        char_len++;
                      text_append_n (&text, p, char_len);
                      p += char_len;
                    }
                  else if (!in_import && *p && !strchr (whitespace_chars, *p))
                    {
                      if (text.end > 0)
                        {
                          text_append_n (&text, "\n", 1);
                          add_string (imports, text.text);
                        }
                      add_string (rules, p);
                      in_rules = 1;
                      break;
                    }
                  else if (*p && strchr (whitespace_chars, *p))
                    {
                      text_append_n (&text, p, 1);
                      p++;
                    }
                  else if (!*p)
                    {
                      add_string (imports, text.text);
                      break;
                    }
                }
            }
        }
      free (line);
    }

  free (text.text);

  if (in_string || in_string || in_import)
    {
      SOURCE_INFO source_info;
      source_info.macro = 0;
      source_info.file_name = filename;
      source_info.line_nr = line_nr;

      if (in_string)
        {
          message_list_line_error_ext (&self->error_messages,
                      (self->conf && self->conf->DEBUG.o.integer > 0),
                                     MSG_warning, 0,
                                     &source_info,
                                "string not closed in css file");
        }
      if (in_comment)
        {
          message_list_line_error_ext (&self->error_messages,
                      (self->conf && self->conf->DEBUG.o.integer > 0),
                                     MSG_warning, 0,
                                     &source_info,
                                "--css-include ended in comment");
        }
      if (in_import && !in_comment && !in_string)
        {
          message_list_line_error_ext (&self->error_messages,
                      (self->conf && self->conf->DEBUG.o.integer > 0),
                                     MSG_warning, 0,
                                     &source_info,
                                "@import not finished in css file");
        }
    }
}

static void
html_prepare_css (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  const STRING_LIST *css_files;
  STRING_LIST *css_import_lines;
  STRING_LIST *css_rule_lines;
  size_t i;

  if (self->conf->NO_CSS.o.integer > 0)
    return;

  css_files = self->conf->CSS_FILES.o.strlist;

  if (!css_files || css_files->number <= 0)
    return;

  css_import_lines = new_string_list ();
  css_rule_lines = new_string_list ();

  for (i = 0; i < css_files->number; i++)
    {
      FILE *css_file_fh;
      char *css_file_path;
      char *css_file = css_files->list[i];
      if (!strcmp (css_file, "-"))
        {
          css_file_fh = stdin;
          css_file_path = strdup ("-");
        }
      else
        {
          int use_inc_dir;
          css_file_path = locate_include_file (css_file,
                             self->conf->INCLUDE_DIRECTORIES.o.strlist,
                               &use_inc_dir);
          if (!css_file_path)
            {
              char *css_input_file_name;
              const char *encoding
                = self->conf->COMMAND_LINE_ENCODING.o.string;
              if (encoding)
                {
                  int status;
                  css_input_file_name
                   = decode_string (css_file, encoding, &status, 0);
                }
              else
                css_input_file_name = strdup (css_file);
              message_list_document_warn (&self->error_messages,
                      self->conf, 0, "CSS file %s not found",
                      css_input_file_name);
              free (css_input_file_name);
              continue;
            }

          css_file_fh = fopen (css_file_path, "r");
          if (!css_file_fh)
            {
              char *css_file_name;
              const char *encoding
                = self->conf->COMMAND_LINE_ENCODING.o.string;
              if (encoding)
                {
                  int status;
                  css_file_name
                   = decode_string (css_file_path, encoding, &status, 0);
                }
              else
                css_file_name = strdup (css_file_path);
              message_list_document_warn (&self->error_messages,
                                          self->conf, 0,
                         "could not open --include-file %s: %s",
                               css_file_name, strerror (errno));

              free (css_file_name);
              free (css_file_path);
              continue;
            }
        }

      html_process_css_file (self, css_file_fh, css_file_path,
                             css_import_lines, css_rule_lines);

      if (fclose (css_file_fh))
        {
          char *css_file_name;
          const char *encoding
            = self->conf->COMMAND_LINE_ENCODING.o.string;
          if (encoding)
            {
              int status;
              css_file_name
               = decode_string (css_file_path, encoding, &status, 0);
            }
          else
            css_file_name = strdup (css_file_path);

          message_list_document_error (&self->error_messages, self->conf, 0,
                         "error on closing CSS file  %s: %s",
                         css_file_name, strerror (errno));

          free (css_file_path);
        }

      free (css_file_path);
    }

  if (self->conf->DEBUG.o.integer > 0)
    {
      if (css_import_lines->number > 0)
        {
          fprintf (stderr, "C|# css import lines\n");
          for (i = 0; i < css_import_lines->number; i++)
            fprintf (stderr, "%s", css_import_lines->list[i]);
        }
      if (css_rule_lines->number > 0)
        {
          fprintf (stderr, "C|# css rule lines\n");
          for (i = 0; i < css_rule_lines->number; i++)
            fprintf (stderr, "%s", css_rule_lines->list[i]);
        }
    }

  clear_strings_list (&self_html->files_css_import_lines);
  clear_strings_list (&self_html->files_css_rule_lines);
  copy_strings (&self_html->files_css_import_lines, css_import_lines);
  copy_strings (&self_html->files_css_rule_lines, css_rule_lines);

  destroy_strings_list (css_import_lines);
  destroy_strings_list (css_rule_lines);
}

/* this code corresponds to the Perl converter_initialize code, only for
   code to be called before Perl customization setup information is passed */
void
html_converter_initialize_beginning (CONVERTER *self)
{
  const char *split = self->conf->SPLIT.o.string;
  int max_header_level = self->conf->MAX_HEADER_LEVEL.o.integer;

  self->html_converter = (HTML_CONVERTER_STATE *)
                              malloc (sizeof (HTML_CONVERTER_STATE));
  memset (self->html_converter, 0, sizeof (HTML_CONVERTER_STATE));

  if (!self->conf->FORMAT_MENU.o.string)
    option_force_conf (&self->conf->FORMAT_MENU, 0, "");

 /* NOTE we reset silently if the split specification is not one known.
    The main program warns if the specific command line option value is
    not known.  We could add a warning here to catch mistakes in init
    files.  Wait for user reports.
  */
  if (split && strlen (split) && strcmp (split, "chapter")
      && strcmp (split, "section") && strcmp (split, "node"))
    option_force_conf (&self->conf->SPLIT, 0, "node");

  if (max_header_level < 0)
    option_force_conf (&self->conf->MAX_HEADER_LEVEL,
                 html_default_options->options->MAX_HEADER_LEVEL.o.integer, 0);
  else if (max_header_level < 1)
    option_force_conf (&self->conf->MAX_HEADER_LEVEL, 1, 0);

  /* For CONTENTS_OUTPUT_LOCATION
     should lead to contents not output, but if not, it is not an issue,
     the way to set contents to be output or not should be through the
     contents and shortcontents @-commands and customization options.
   */

  if (!self->conf->CONTENTS_OUTPUT_LOCATION.o.string)
    option_force_conf (&self->conf->CONTENTS_OUTPUT_LOCATION, 0, "");
  if (!self->conf->INDEX_ENTRY_COLON.o.string)
    option_force_conf (&self->conf->INDEX_ENTRY_COLON, 0, "");
  if (!self->conf->MENU_ENTRY_COLON.o.string)
    option_force_conf (&self->conf->MENU_ENTRY_COLON, 0, "");

  load_htmlxref_files (self);
  html_prepare_css (self);
}

/* for customized special_unit_info (coming from Perl) */
SPECIAL_UNIT_INFO *
html_add_special_unit_info (SPECIAL_UNIT_INFO_LIST *special_unit_info_list,
                            int type, size_t variety_nr, const char *value)
{
  SPECIAL_UNIT_INFO *special_unit_info;

  if (special_unit_info_list->number == special_unit_info_list->space)
    {
      special_unit_info_list->list = realloc (special_unit_info_list->list,
            sizeof (SPECIAL_UNIT_INFO) * (special_unit_info_list->space += 5));
    }
  special_unit_info
    = &special_unit_info_list->list[special_unit_info_list->number];
  memset (special_unit_info, 0, sizeof (SPECIAL_UNIT_INFO));
  special_unit_info->type = type;
  special_unit_info->variety_nr = variety_nr;
  if (value)
    special_unit_info->value = strdup (value);

  special_unit_info_list->number++;
  return special_unit_info;
}

static char **
new_special_unit_info_type (int special_units_varieties_nr)
{
  char **special_unit_info = (char **)
        malloc ((special_units_varieties_nr +1) * sizeof (char *));
  memset (special_unit_info, 0,
          (special_units_varieties_nr +1) * sizeof (char *));
  return special_unit_info;
}

/* in main/html_conversion_data.c */
extern const STRING_LIST default_special_unit_varieties;

/* Setup special units varieties names.  Separate from
   html_converter_init_special_units_info such that customization may be set
   after setting up special units varieties names but before calling
   html_converter_init_special_units_info
 */
void
html_converter_init_special_unit_varieties (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  /* NOTE if the special units can be customized, then
     self_html->special_unit_varieties should ba set and used directly instead.
     Also default special units and special units indices should be
     mapped instead of assuming that they are the same when setting
     self_html->special_unit_info */
  copy_strings (&self_html->special_unit_varieties, &default_special_unit_varieties);
}

/* set units info to default and also apply customization */
void
html_converter_init_special_units_info (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t nr_special_units;

  nr_special_units = self_html->special_unit_varieties.number;

  /* special units info */
  /* set to defaults */
  if (nr_special_units > 0)
    {
      size_t i;
      enum special_unit_info_type j;
      enum special_unit_info_tree l;
      for (j = 0; j < SPECIAL_UNIT_INFO_TYPE_NR; j++)
        {
          size_t k;

          self_html->special_unit_info[j]
            = new_special_unit_info_type (nr_special_units);
          for (k = 0; k < nr_special_units; k++)
            {
              if (default_special_unit_info[j][k])
                self_html->special_unit_info[j][k]
                  = strdup (default_special_unit_info[j][k]);
            }
        }
      for (l = 0; l < SPECIAL_UNIT_INFO_TREE_NR; l++)
        {
          size_t k;

          self_html->translated_special_unit_info_texinfo[l]
            = new_special_unit_info_type (nr_special_units);
          for (k = 0; k < nr_special_units; k++)
            {
              if (default_special_unit_tree_info[l][k])
                self_html->translated_special_unit_info_texinfo[l][k]
                  = strdup (default_special_unit_tree_info[l][k]);
            }
        }
      /* apply customization */
      for (i = 0; i < self_html->customized_special_unit_info.number; i++)
        {
          int t;
          SPECIAL_UNIT_INFO *custom_unit_info
            = &self_html->customized_special_unit_info.list[i];
          size_t variety_idx = custom_unit_info->variety_nr -1;
          enum special_unit_info_type type = custom_unit_info->type;
          enum special_unit_info_tree tree_type = SUIT_type_none;

          for (t = 0; translated_special_unit_info[t].tree_type
                                                     != SUIT_type_none; t++)
            {
              enum special_unit_info_type string_type
                = translated_special_unit_info[t].string_type;
              if (string_type == type)
                {
                  tree_type = translated_special_unit_info[t].tree_type;

                  free (self_html->translated_special_unit_info_texinfo[tree_type]
                                                                [variety_idx]);

                  if (custom_unit_info->value)
                    self_html->translated_special_unit_info_texinfo[tree_type]
                                                               [variety_idx]
                      = strdup (custom_unit_info->value);
                  else
                    self_html->translated_special_unit_info_texinfo[tree_type]
                                                           [variety_idx] = 0;
                  break;
                }
            }

          if (tree_type != SUIT_type_none)
            continue;

          free (self_html->special_unit_info[type][variety_idx]);

          if (custom_unit_info->value)
            self_html->special_unit_info[type][variety_idx]
              = strdup (custom_unit_info->value);
          else
            self_html->special_unit_info[type][variety_idx] = 0;
        }
    }
}

/* Used to get Perl formatting references.  Initialize in C */
FORMATTING_REFERENCE *
new_special_unit_formatting_references (int special_units_varieties_nr)
{
  FORMATTING_REFERENCE *formatting_references = (FORMATTING_REFERENCE *)
    malloc (special_units_varieties_nr * sizeof (FORMATTING_REFERENCE));
  memset (formatting_references, 0,
          special_units_varieties_nr * sizeof (FORMATTING_REFERENCE));
  return formatting_references;
}

static HTML_DIRECTION_STRING_TRANSLATED *
new_directions_strings_translated_type (int nr_string_directions)
{
  HTML_DIRECTION_STRING_TRANSLATED *result
    = (HTML_DIRECTION_STRING_TRANSLATED *) malloc
        (nr_string_directions * sizeof (HTML_DIRECTION_STRING_TRANSLATED));
  memset (result, 0,
          nr_string_directions * sizeof (HTML_DIRECTION_STRING_TRANSLATED));
  return result;
}

static int *
determine_non_default_special_unit_directions (const CONVERTER *self)
{
  const HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t i;
  size_t nr_special_units = self_html->special_unit_varieties.number;
  int *non_default_special_unit_directions = 0;
  /* determine the special units directions that are not the same as
     the default units directions.  If not the same as the defaults,
     the default direction info should not be used as they are not for
     the customized special unit direction */
  if (nr_special_units > 0)
    {
      non_default_special_unit_directions = (int *)
                      malloc (nr_special_units * sizeof (int));
      memset (non_default_special_unit_directions, 0,
              nr_special_units * sizeof (int));

      for (i = 0; i < nr_special_units; i++)
        {
          if (strcmp (self_html->special_unit_info[SUI_type_direction][i],
                  default_special_unit_info[SUI_type_direction][i]))
            non_default_special_unit_directions[i] = 1;
        }
    }
  return non_default_special_unit_directions;
}

static int
register_type_conversion_function (TYPE_CONVERSION_FUNCTION *result,
                                   enum element_type type,
                                   FORMATTING_REFERENCE *formatting_reference)
{
  if (formatting_reference->status > 0)
    {
      result->status = formatting_reference->status;
      if (formatting_reference->status != FRS_status_ignored)
        {
          result->type_conversion = &html_type_conversion_external;
          result->formatting_reference = formatting_reference;
          return 1;
        }
    }
  return 0;
}

static int
register_type_open_function (TYPE_OPEN_FUNCTION *result,
                             enum element_type type,
                             FORMATTING_REFERENCE *formatting_reference)
{
  if (formatting_reference->status > 0)
    {
      result->status = formatting_reference->status;
      if (formatting_reference->status != FRS_status_ignored)
        {
          result->type_open = &html_type_open_external;
          result->formatting_reference = formatting_reference;
          return 1;
        }
    }
  return 0;
}

static int
register_command_conversion_function (COMMAND_CONVERSION_FUNCTION *result,
                         enum command_id cmd,
                         FORMATTING_REFERENCE *formatting_reference)
{
  if (formatting_reference->status > 0)
    {
      result->status = formatting_reference->status;
      if (formatting_reference->status != FRS_status_ignored)
        {
          result->command_conversion = &html_command_conversion_external;
          result->formatting_reference = formatting_reference;
          return 1;
        }
    }
  return 0;
}

static int
register_command_open_function (COMMAND_OPEN_FUNCTION *result,
                                enum command_id cmd,
                                FORMATTING_REFERENCE *formatting_reference)
{
  if (formatting_reference->status > 0)
    {
      result->status = formatting_reference->status;
      if (formatting_reference->status != FRS_status_ignored)
        {
          result->command_open = &html_command_open_external;
          result->formatting_reference = formatting_reference;
          return 1;
        }
    }
  return 0;
}

static int
register_output_unit_conversion_function
                                  (OUTPUT_UNIT_CONVERSION_FUNCTION *result,
                                   enum output_unit_type type,
                                   FORMATTING_REFERENCE *formatting_reference)
{
  if (formatting_reference->status > 0)
    {
      result->status = formatting_reference->status;
      if (formatting_reference->status != FRS_status_ignored)
        {
          result->output_unit_conversion
            = &html_output_unit_conversion_external;
          result->formatting_reference = formatting_reference;
          return 1;
        }
    }
  return 0;
}

static int
register_special_unit_body_formatting_function
                                  (SPECIAL_UNIT_BODY_FORMATTING *result,
                                   const char *special_unit_variety,
                                   FORMATTING_REFERENCE *formatting_reference)
{
  if (formatting_reference && formatting_reference->status > 0)
    {
      result->status = formatting_reference->status;
      if (formatting_reference->status != FRS_status_ignored)
        {
          result->special_unit_body_formatting
               = &html_special_unit_body_formatting_external;
          result->formatting_reference = formatting_reference;
          return 1;
        }
    }
  return 0;
}

static int
compare_htmlxref_manual (const void *a, const void *b)
{
  const HTMLXREF_MANUAL *hxfm_a = (const HTMLXREF_MANUAL *) a;
  const HTMLXREF_MANUAL *hxfm_b = (const HTMLXREF_MANUAL *) b;

  return strcmp (hxfm_a->manual, hxfm_b->manual);
}

typedef struct COMMAND_INTERNAL_CONVERSION {
    enum command_id cmd;
    void (* command_conversion) (struct CONVERTER *self,
                                 const enum command_id cmd,
                                 const ELEMENT *element,
                                 const HTML_ARGS_FORMATTED *args_formatted,
                                 const char *content, TEXT *result);
} COMMAND_INTERNAL_CONVERSION;

/* associate command to the C function implementing the conversion */
static const COMMAND_INTERNAL_CONVERSION commands_internal_conversion_table[] = {
  {CM_today, &html_convert_today_command},
  {CM_w, &html_convert_w_command},
  {CM_value, &html_convert_value_command},
  {CM_email, &html_convert_email_command},
  {CM_abbr, &html_convert_explained_command},
  {CM_acronym, &html_convert_explained_command},
  {CM_anchor, &html_convert_anchor_command},
  {CM_namedanchor, &html_convert_anchor_command},
  {CM_footnote, &html_convert_footnote_command},
  {CM_uref, &html_convert_uref_command},
  {CM_url, &html_convert_uref_command},
  {CM_image, &html_convert_image_command},
  {CM_math, &html_convert_math_command},
  /* note that if indicateurl had been in style_formatted_cmd this
     would have prevented indicateurl to be associated to
     convert_style_command */
  {CM_indicateurl, &html_convert_indicateurl_command},
  {CM_titlefont, &html_convert_titlefont_command},
  {CM_U, &html_convert_U_command},

  {CM_inlineraw, &html_convert_inline_command},
  {CM_inlinefmt, &html_convert_inline_command},
  {CM_inlinefmtifelse, &html_convert_inline_command},
  {CM_inlineifclear, &html_convert_inline_command},
  {CM_inlineifset, &html_convert_inline_command},

  {CM_inforef, &html_convert_xref_command},
  {CM_link, &html_convert_xref_command},
  {CM_xref, &html_convert_xref_command},
  {CM_ref, &html_convert_xref_command},
  {CM_pxref, &html_convert_xref_command},

  {CM_html, &html_convert_raw_command},
  {CM_tex, &html_convert_raw_command},
  {CM_xml, &html_convert_raw_command},
  {CM_docbook, &html_convert_raw_command},
  {CM_latex, &html_convert_raw_command},

  {CM_indentedblock, &html_convert_indented_command},
  {CM_smallindentedblock, &html_convert_indented_command},
  {CM_verbatim, &html_convert_verbatim_command},
  {CM_displaymath, &html_convert_displaymath_command},
  {CM_raggedright, &html_convert_simple_block_command},
  {CM_flushleft, &html_convert_simple_block_command},
  {CM_flushright, &html_convert_simple_block_command},
  {CM_group, &html_convert_simple_block_command},
  {CM_menu, &html_convert_menu_command},
  {CM_detailmenu, &html_convert_menu_command},
  {CM_float, &html_convert_float_command},
  {CM_quotation, &html_convert_quotation_command},
  {CM_smallquotation, &html_convert_quotation_command},
  {CM_cartouche, &html_convert_cartouche_command},
  {CM_itemize, &html_convert_itemize_command},
  {CM_enumerate, &html_convert_enumerate_command},
  {CM_multitable, &html_convert_multitable_command},
  {CM_table, &html_convert_xtable_command},
  {CM_ftable, &html_convert_xtable_command},
  {CM_vtable, &html_convert_xtable_command},

  {CM_verbatiminclude, &html_convert_verbatiminclude_command},
  {CM_sp, &html_convert_sp_command},
  {CM_exdent, &html_convert_exdent_command},
  {CM_center, &html_convert_center_command},
  {CM_author, &html_convert_author_command},
  {CM_title, &html_convert_title_command},
  {CM_subtitle, &html_convert_subtitle_command},
  {CM_item, &html_convert_item_command},
  {CM_headitem, &html_convert_item_command},
  {CM_itemx, &html_convert_item_command},
  {CM_tab, &html_convert_tab_command},
  {CM_insertcopying, &html_convert_insertcopying_command},
  {CM_maketitle, &html_convert_maketitle_command},
  {CM_listoffloats, &html_convert_listoffloats_command},
  {CM_printindex, &html_convert_printindex_command},
  /* @informative_global_commands in perl */
  {CM_documentlanguage, &html_convert_informative_command},
  {CM_documentscript, &html_convert_informative_command},
  {CM_footnotestyle, &html_convert_informative_command},
  {CM_xrefautomaticsectiontitle, &html_convert_informative_command},
  {CM_deftypefnnewline, &html_convert_informative_command},

  {CM_documentlanguagevariant, &html_convert_documentlanguagevariant_command},

  {CM_contents, &html_convert_contents_command},
  {CM_shortcontents, &html_convert_contents_command},
  {CM_summarycontents, &html_convert_contents_command},

  /* other @def* commands are handled together */
  {CM_defblock, &html_convert_def_command},

  {CM_node, &html_convert_heading_command},
  {CM_top, &html_convert_heading_command},
  {CM_chapter, &html_convert_heading_command},
  {CM_unnumbered, &html_convert_heading_command},
  {CM_chapheading, &html_convert_heading_command},
  {CM_appendix, &html_convert_heading_command},
  {CM_section, &html_convert_heading_command},
  {CM_unnumberedsec, &html_convert_heading_command},
  {CM_heading, &html_convert_heading_command},
  {CM_appendixsec, &html_convert_heading_command},
  {CM_subsection, &html_convert_heading_command},
  {CM_unnumberedsubsec, &html_convert_heading_command},
  {CM_subheading, &html_convert_heading_command},
  {CM_appendixsubsec, &html_convert_heading_command},
  {CM_subsubsection, &html_convert_heading_command},
  {CM_unnumberedsubsubsec, &html_convert_heading_command},
  {CM_subsubheading, &html_convert_heading_command},
  {CM_appendixsubsubsec, &html_convert_heading_command},
  {CM_part, &html_convert_heading_command},
  {CM_appendixsection, &html_convert_heading_command},
  {CM_majorheading, &html_convert_heading_command},
  {CM_centerchap, &html_convert_heading_command},

  {0, 0},
};

typedef struct COMMAND_INTERNAL_OPEN {
    enum command_id cmd;
    void (* command_open) (CONVERTER *self, const enum command_id cmd,
                           const ELEMENT *element, TEXT *result);
} COMMAND_INTERNAL_OPEN;

/* associate command to the C function implementing the opening */
static const COMMAND_INTERNAL_OPEN commands_internal_open_table[] = {
  {CM_node, &html_open_node_part_command},
  {CM_part, &html_open_node_part_command},
  {CM_quotation, &html_open_quotation_command},
  {CM_smallquotation, &html_open_quotation_command},
  {0, 0},
};

typedef struct TYPE_INTERNAL_CONVERSION {
    enum element_type type;
    void (* type_conversion) (CONVERTER *self, const enum element_type type,
                              const ELEMENT *element, const char *content,
                              TEXT *result);
} TYPE_INTERNAL_CONVERSION;

/* associate type to the C function implementing the conversion */
static const TYPE_INTERNAL_CONVERSION types_internal_conversion_table[] = {
  {ET_text, &html_convert_text},
  {ET_paragraph, &html_convert_paragraph_type},
  {ET_preformatted, &html_convert_preformatted_type},
  {ET_balanced_braces, &html_convert_balanced_braces_type},
  {ET_index_entry_command, &html_convert_index_entry_command_type},
  {ET_definfoenclose_command, &html_convert_definfoenclose_type},
  {ET_untranslated_def_line_arg,
   &html_convert_untranslated_def_line_arg_type},
  {ET_row, &html_convert_row_type},
  {ET_multitable_head, &html_convert_multitable_head_type},
  {ET_multitable_body, &html_convert_multitable_body_type},
  {ET_menu_entry, &html_convert_menu_entry_type},
  {ET_menu_comment, &html_convert_menu_comment_type},
  {ET_before_item, &html_convert_before_item_type},
  {ET_table_term, &html_convert_table_term_type},
  {ET_def_line, &html_convert_def_line_type},
  {ET_def_item, &html_convert_def_item_type},
  {ET_inter_def_item, &html_convert_def_item_type},
  {ET_before_defline, &html_convert_def_item_type},
  {ET_table_definition, &html_convert_table_definition_type},
  {ET_inter_item, &html_convert_table_definition_type},

  {0, 0},
};

typedef struct TYPE_INTERNAL_OPEN {
    enum element_type type;
    void (* type_open) (CONVERTER *self, const enum element_type type,
                        const ELEMENT *element, TEXT *result);
} TYPE_INTERNAL_OPEN;

/* associate type to the C function implementing the opening */
static const TYPE_INTERNAL_OPEN types_internal_open_table[] = {
  {ET_paragraph, &html_open_inline_container_type},
  {ET_preformatted, &html_open_inline_container_type},
  {0, 0},
};

typedef struct OUTPUT_UNIT_INTERNAL_CONVERSION {
    enum output_unit_type type;
    void (* output_unit_conversion) (CONVERTER *self,
                        const enum output_unit_type unit_type,
                        const OUTPUT_UNIT *output_unit, const char *content,
                        TEXT *result);
} OUTPUT_UNIT_INTERNAL_CONVERSION;

static const OUTPUT_UNIT_INTERNAL_CONVERSION output_units_internal_conversion_table[] = {
  {OU_special_unit, &html_convert_special_unit_type},
  {OU_unit, &html_convert_unit_type},
  {0, 0},
};

typedef struct SPECIAL_UNIT_BODY_INTERNAL_CONVERSION {
    char *special_unit_variety;
    void (* special_unit_body_formatting) (CONVERTER *self,
                               const size_t special_unit_number,
                               const char *special_unit_variety,
                               const OUTPUT_UNIT *output_unit,
                               TEXT *result);
} SPECIAL_UNIT_BODY_INTERNAL_CONVERSION;

static const SPECIAL_UNIT_BODY_INTERNAL_CONVERSION
   special_unit_body_internal_formatting_table[] = {
  {"contents", &html_default_format_special_body_contents},
  {"shortcontents", &html_default_format_special_body_shortcontents},
  {"footnotes", &html_default_format_special_body_footnotes},
  {"about", &html_default_format_special_body_about},
  {0, 0},
};

/* set SELF->main_units_direction_names array of direction names
   and SELF->->units_direction_names_index hash associating direction names
   to their index in SELF->main_units_direction_names.
   Also set direction number in SELF->customized_global_units_directions
   items.

   No exact equivalent in Perl where names only are used, more similar code
   in converter_initialize.
 */
int
html_set_main_units_direction_names (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t nr_special_units = self_html->special_unit_varieties.number;
  /* The corresponding direction without FirstInFile are used instead
     of FirstInFile*, so the directions_strings are not set */
  int nr_string_directions = NON_SPECIAL_DIRECTIONS_NR - FIRSTINFILE_NR
                             + (int) nr_special_units;
  size_t i;

  free (self_html->main_units_direction_names);

  self_html->main_units_direction_names = (const char **) malloc
     ((nr_special_units + NON_SPECIAL_DIRECTIONS_NR +1)
         * sizeof (char *));
  memcpy (self_html->main_units_direction_names, html_button_direction_names,
          NON_SPECIAL_DIRECTIONS_NR * sizeof (char *));
  memcpy (self_html->main_units_direction_names + NON_SPECIAL_DIRECTIONS_NR,
          self_html->special_unit_info[SUI_type_direction],
          nr_special_units * sizeof (char *));
  self_html->main_units_direction_names[
               nr_special_units + NON_SPECIAL_DIRECTIONS_NR] = 0;

  /* at the same time the names are added to the main_units_direction_names
     array, fill an hash associating the name to the index in the
     array used to retrieve the indice based on the direction name.

     Setup now and fill with directions already set, since
     html_get_direction_index is called just below
   */
  init_c_hashmap (&self_html->units_direction_names_index,
                  nr_string_directions + FIRSTINFILE_NR
                  + self_html->customized_global_units_directions.number
                  + self_html->added_global_units_directions.number
                  + self_html->customized_global_text_directions.number);
  for (i = 0; self_html->main_units_direction_names[i]; i++)
    {
      uintptr_t idx = i;
      c_hashmap_register (&self_html->units_direction_names_index,
                          self_html->main_units_direction_names[i],
                          (void *)idx);
    }

  if (self_html->customized_global_units_directions.number > 0)
    {
      for (i = 0; i < self_html->customized_global_units_directions.number; i++)
        {
          DIRECTION_NODE_NAME *direction_node_name
            = &self_html->customized_global_units_directions.list[i];
          const char *direction = direction_node_name->direction;
          int main_directions_idx = html_get_direction_index (self, direction);
          if (main_directions_idx < 0)
            {
              /* an added global output unit direction */
              /* it would be unlikely for the direction to already exist,
                 since it should ultimately come from a Perl hash.  In case
                 it could be set from C, it is better to check */
              size_t added_string_nr
                 = find_string (&self_html->added_global_units_directions,
                                direction);
              if (!added_string_nr)
                {
                  add_string (&self_html->added_global_units_directions, direction);
                  added_string_nr = self_html->added_global_units_directions.number;
                }
              direction_node_name->direction_nr
                = nr_special_units + NON_SPECIAL_DIRECTIONS_NR
                  + added_string_nr;
            }
          else
            {
              if (main_directions_idx > DEFAULT_GLOBAL_DIRECTION_LAST_IDX)
                 {
                   /* do not replace relative directions */
                   message_list_document_warn (&self->error_messages,
                     self->conf, 0, "keep direction %s, do not set to `%s'",
                         self_html->main_units_direction_names[main_directions_idx],
                                       direction_node_name->node_name);
                 }
              else
                direction_node_name->direction_nr = main_directions_idx+1;
            }
        }
    }

  if (self_html->added_global_units_directions.number)
    {
      self_html->main_units_direction_names
       = (const char **) realloc (self_html->main_units_direction_names,
          (nr_special_units + NON_SPECIAL_DIRECTIONS_NR +
           self_html->added_global_units_directions.number +1) * sizeof (char *));

      for (i = 0; i < self_html->added_global_units_directions.number; i++)
        {
          size_t added_idx = NON_SPECIAL_DIRECTIONS_NR + nr_special_units + i;
          uintptr_t idx = added_idx;

          self_html->main_units_direction_names[added_idx]
             = self_html->added_global_units_directions.list[i];

          c_hashmap_register (&self_html->units_direction_names_index,
                              self_html->main_units_direction_names[added_idx],
                              (void *)idx);
        }

      nr_string_directions += self_html->added_global_units_directions.number;

      self_html->main_units_direction_names[
               nr_special_units + NON_SPECIAL_DIRECTIONS_NR
              + self_html->added_global_units_directions.number] = 0;
    }

  if (self_html->customized_global_text_directions.number)
    {
      /* remove duplicate directions starting from the end to remove only
         already seen strings */
      for (i = self_html->customized_global_text_directions.number; i > 0; i--)
        {
          const char *direction
            = self_html->customized_global_text_directions.list[i-1];
          int main_directions_idx = html_get_direction_index (self, direction);
          if (main_directions_idx >= 0)
            {
              remove_from_strings_list (
                &self_html->customized_global_text_directions, i-1);
            }
        }

      if (self_html->customized_global_text_directions.number)
        /* now add to customized_global_text_directions */
        {
          self_html->main_units_direction_names
           = (const char **) realloc (self_html->main_units_direction_names,
            (nr_special_units + NON_SPECIAL_DIRECTIONS_NR +
             self_html->added_global_units_directions.number +
         self_html->customized_global_text_directions.number +1) * sizeof (char *));

          for (i = 0; i < self_html->customized_global_text_directions.number; i++)
            {
              const char *direction
               = self_html->customized_global_text_directions.list[i];
              size_t added_idx = nr_special_units + NON_SPECIAL_DIRECTIONS_NR
                 + self_html->added_global_units_directions.number +i;
              uintptr_t idx = added_idx;

              self_html->main_units_direction_names[added_idx] = direction;

              c_hashmap_register (&self_html->units_direction_names_index,
                                  self_html->main_units_direction_names[added_idx],
                                  (void *)idx);
             }
          self_html->main_units_direction_names[
            nr_special_units + NON_SPECIAL_DIRECTIONS_NR
             + self_html->added_global_units_directions.number
             + self_html->customized_global_text_directions.number] = 0;
        }

      nr_string_directions += self_html->customized_global_text_directions.number;
    }

  /*
  for (i = 0; self_html->main_units_direction_names[i]; i++)
    fprintf (stderr, "DEBUG: direction unit names: %zu '%s'\n", i,
             self_html->main_units_direction_names[i]);
   */

  return nr_string_directions;
}


/* When initializing from Perl, html_converter_get_customization_sv is called
   first to set customization information based on Perl data.  Then this
   function is called for the remainder of initialization that requires
   customization information.
 */
void
html_converter_customize (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t i;
  int l;
  enum direction_string_type DS_type;
  size_t nr_special_units = self_html->special_unit_varieties.number;
  int nr_string_directions = html_nr_string_directions (self);
  int nr_dir_str_contexts = TDS_context_string +1;
  int *non_default_special_unit_directions =
     determine_non_default_special_unit_directions (self);

  /* counters of external formatting functions */
  int external_special_unit_body_formatting_function = 0;
  int external_output_unit_conversion_function = 0;
  int external_command_conversion_function = 0;
  int external_command_open_function = 0;
  int external_type_conversion_function = 0;
  int external_type_open_function = 0;
  int external_formatting_function = 0;
  int added_external_references;

  /* for @sc */
  for (l = 0; default_upper_case_commands[l]; l++)
    self->upper_case[default_upper_case_commands[l]] = 1;

  for (l = 0; default_code_types[l]; l++)
    self_html->code_types[default_code_types[l]] = 1;

  for (l = 0; default_pre_class_types[l].type; l++)
    {
      const PRE_CLASS_TYPE_INFO *pre_class_type = &default_pre_class_types[l];
      self_html->pre_class_types[pre_class_type->type]
        = strdup (pre_class_type->pre_class);
    }

  for (l = 0; xml_accent_text_entities[l].cmd; l++)
    {
      enum command_id cmd = xml_accent_text_entities[l].cmd;
      const ACCENT_ENTITY_INFO *xml_accent_info
        = &xml_accent_text_entities[l].accent_entity_info;
      ACCENT_ENTITY_INFO *accent_info = &self_html->accent_entities[cmd];

      if (xml_accent_info->entity)
        accent_info->entity = strdup (xml_accent_info->entity);
      if (xml_accent_info->characters)
        accent_info->characters = strdup (xml_accent_info->characters);
    }

  for (i = 0; i < style_formatted_cmd.number; i++)
    {
      enum command_id cmd = style_formatted_cmd.list[i];
      enum conversion_context cctx;
      for (cctx = 0; cctx < STYLE_COMMAND_CONTEXT_NR; cctx++)
        {
          HTML_STYLE_COMMAND_CONVERSION *format_spec
            = &self_html->html_style_command_conversion[cmd][cctx];
          HTML_STYLE_COMMAND_CONVERSION *default_spec
            = &default_style_commands_formatting[cmd][cctx];

          if (default_spec->element)
            format_spec->element = strdup (default_spec->element);
          format_spec->quote = default_spec->quote;
        }
    }

  /* apply customization (from Perl) */

  if (self_html->html_customized_upper_case_commands)
    {
      for (l = 0; self_html->html_customized_upper_case_commands[l].cmd; l++)
        {
          COMMAND_INTEGER_INFORMATION *customized_upper
            = &self_html->html_customized_upper_case_commands[l];
          self->upper_case[customized_upper->cmd] = customized_upper->integer;
        }
    }

  if (self_html->html_customized_code_types)
    {
      for (l = 0; self_html->html_customized_code_types[l].type; l++)
        {
          TYPE_INTEGER_INFORMATION *customized_code
            = &self_html->html_customized_code_types[l];
          self_html->code_types[customized_code->type] = customized_code->integer;
        }
    }

  if (self_html->html_customized_pre_class_types)
    {
      for (l = 0; self_html->html_customized_pre_class_types[l].type; l++)
        {
          PRE_CLASS_TYPE_INFO *customized_pre_class
            = &self_html->html_customized_pre_class_types[l];
          enum element_type type = customized_pre_class->type;

          free (self_html->pre_class_types[type]);
          self_html->pre_class_types[type]
             = strdup (customized_pre_class->pre_class);
        }
    }

  if (self_html->html_customized_accent_entity_info)
    {
      for (l = 0; self_html->html_customized_accent_entity_info[l].cmd; l++)
        {
          enum command_id cmd = self_html->html_customized_accent_entity_info[l].cmd;
          const ACCENT_ENTITY_INFO *custom_accent_info
            = &self_html->html_customized_accent_entity_info[l].accent_entity_info;
          ACCENT_ENTITY_INFO *accent_info = &self_html->accent_entities[cmd];

          if (custom_accent_info->entity)
            {
              free (accent_info->entity);
              if (strlen (custom_accent_info->entity))
                accent_info->entity = strdup (custom_accent_info->entity);
              else
                accent_info->entity = 0;
            }
          if (custom_accent_info->characters)
            {
              free (accent_info->characters);
              accent_info->characters = strdup (custom_accent_info->characters);
            }
        }
    }

  if (self_html->html_customized_style_commands)
    {
      for (l = 0; self_html->html_customized_style_commands[l].cmd; l++)
        {
          enum conversion_context cctx;
          enum command_id cmd = self_html->html_customized_style_commands[l].cmd;
          /* should not happen thanks to checks in perl
          if (!(html_commands_data[cmd].flags & HF_style_command))
            fprintf (stderr, "ERROR: %s: customized as style command\n",
                     builtin_command_name (cmd));
           */

          for (cctx = 0; cctx < STYLE_COMMAND_CONTEXT_NR; cctx++)
            {
              if (self_html->html_customized_style_commands[l].conversion[cctx])
                {
                  HTML_STYLE_COMMAND_CONVERSION *format_spec
                    = &self_html->html_style_command_conversion[cmd][cctx];
                  HTML_STYLE_COMMAND_CONVERSION *custom_spec
                    = self_html->html_customized_style_commands[l].conversion[cctx];

                  free (format_spec->element);

                  if (custom_spec->element)
                    format_spec->element = strdup (custom_spec->element);
                  else
                    format_spec->element = 0;
                  format_spec->quote = custom_spec->quote;
                }
            }
        }
    }

  /* initialization needing some information not available before.  Besides
     customized information, mainly the number of special units, which we
     pretend could be customized (even though it cannot for now) */

  /* setup translated_direction_strings */
  for (DS_type = 0; DS_type < TDS_TRANSLATED_MAX_NR; DS_type++)
    {
      self_html->translated_direction_strings[DS_type]
        = new_directions_strings_translated_type (nr_string_directions);
      for (l = 0; l < nr_string_directions; l++)
        {
          HTML_DIRECTION_STRING_TRANSLATED *dir_string_translated
            = &self_html->translated_direction_strings[DS_type][l];
          if (self_html->customized_translated_direction_strings[DS_type]
              && self_html->customized_translated_direction_strings[DS_type][l])
            {
              HTML_DIRECTION_STRING_TRANSLATED *custom_dir_translated
                = self_html->customized_translated_direction_strings[DS_type][l];
              if (custom_dir_translated->to_convert)
                dir_string_translated->to_convert
                  = strdup (custom_dir_translated->to_convert);
              else
                {
                  int j;

                  for (j = 0; j < nr_dir_str_contexts; j++)
                    if (custom_dir_translated->converted[j])
                      dir_string_translated->converted[j]
                        = strdup (custom_dir_translated->converted[j]);
                }
            }
          else if (l < NON_SPECIAL_DIRECTIONS_NR - FIRSTINFILE_NR
                   || (l < (NON_SPECIAL_DIRECTIONS_NR - FIRSTINFILE_NR)
                       + (int) self_html->special_unit_varieties.number
                       && !non_default_special_unit_directions[
                       l - (NON_SPECIAL_DIRECTIONS_NR - FIRSTINFILE_NR)]))
            {
              const HTML_DEFAULT_DIRECTION_STRING_TRANSLATED *default_dir_translated
                = &default_translated_directions_strings[DS_type][l];
              if (default_dir_translated->to_convert)
                dir_string_translated->to_convert
                  = strdup (default_dir_translated->to_convert);
              else
                {
                  if (default_dir_translated->converted)
                    {
                      int j;

                      for (j = 0; j < nr_dir_str_contexts; j++)
                          dir_string_translated->converted[j]
                            = strdup (default_dir_translated->converted);
                    }
                }
            }
        }
    }

  free (non_default_special_unit_directions);


  /* allocate space for translated tree types, they will be created
     on-demand during the conversion */
  for (l = 0; l < SPECIAL_UNIT_INFO_TREE_NR; l++)
    {
      self_html->translated_special_unit_info_tree[l] = (ELEMENT **)
        malloc ((nr_special_units +1) * sizeof (ELEMENT *));
      memset (self_html->translated_special_unit_info_tree[l], 0,
               (nr_special_units +1) * sizeof (ELEMENT *));
    }

  self_html->global_units_directions
    = (const OUTPUT_UNIT **) malloc ((DEFAULT_GLOBAL_DIRECTION_LAST_IDX
                + nr_special_units
                + self_html->added_global_units_directions.number+1)
                               * sizeof (OUTPUT_UNIT));

  /* note that we allocate the same size as no_arg_formatted_cmd
     even though in general there are much less translated commands,
     for simplicity */
  if (no_arg_formatted_cmd.number)
    {
      self_html->no_arg_formatted_cmd_translated.list = (enum command_id *)
       malloc (no_arg_formatted_cmd.number * sizeof (enum command_id));
      memset (self_html->no_arg_formatted_cmd_translated.list, 0,
              no_arg_formatted_cmd.number * sizeof (enum command_id));
    }

  for (l = 0; command_special_unit_variety[l].cmd; l++)
    {
      char *special_unit_variety = command_special_unit_variety[l].variety;
      /* number is index +1 */
      size_t number = find_string (&self_html->special_unit_varieties,
                                   special_unit_variety);
      enum command_id cmd = command_special_unit_variety[l].cmd;
      html_commands_data[cmd].flags |= HF_special_variety;
      self_html->command_special_variety_name_index[l].cmd = cmd;
      self_html->command_special_variety_name_index[l].index = number - 1;
    }

  for (l = 0; ignored_types[l]; l++)
    {
      enum element_type type = ignored_types[l];
      self_html->type_conversion_function[type].status = FRS_status_ignored;
      self_html->css_string_type_conversion_function[type].status
                                                  = FRS_status_ignored;
    }

  for (l = 0; l < TXI_TREE_TYPES_NUMBER; l++)
    {
      int status = register_type_conversion_function (
                                        &self_html->type_conversion_function[l],
                                        l, &self_html->types_conversion[l]);
      external_type_conversion_function += status;

      status = register_type_open_function (&self_html->type_open_function[l],
                                   l, &self_html->types_open[l]);
      external_type_open_function += status;

      register_type_conversion_function (
             &self_html->css_string_type_conversion_function[l], l,
             &self_html->css_string_types_conversion[l]);
    }

  for (l = 0; l < BUILTIN_CMD_NUMBER; l++)
    {
      int status = register_command_conversion_function (
                            &self_html->command_conversion_function[l],
                            l, &self_html->commands_conversion[l]);
      external_command_conversion_function += status;

      status = register_command_open_function (
                            &self_html->command_open_function[l],
                            l, &self_html->commands_open[l]);
      external_command_open_function += status;

      register_command_conversion_function (
            &self_html->css_string_command_conversion_function[l], l,
             &self_html->css_string_commands_conversion[l]);
    }

  for (l = 0; l < OU_special_unit+1; l++)
    {
      int status = register_output_unit_conversion_function
                                  (&self_html->output_unit_conversion_function[l],
                                        l, &self_html->output_units_conversion[l]);
      external_output_unit_conversion_function += status;
    }

  self_html->special_unit_body_formatting = (SPECIAL_UNIT_BODY_FORMATTING *)
    malloc (nr_special_units * sizeof (SPECIAL_UNIT_BODY_FORMATTING));
  memset (self_html->special_unit_body_formatting, 0,
          nr_special_units * sizeof (SPECIAL_UNIT_BODY_FORMATTING));

  for (i = 0; i < nr_special_units; i++)
    {
      int status;
      FORMATTING_REFERENCE *formatting_reference = 0;
      if (self_html->special_unit_body)
        {
          formatting_reference = &self_html->special_unit_body[i];
        }
      status = register_special_unit_body_formatting_function
                                  (&self_html->special_unit_body_formatting[i],
          self_html->special_unit_varieties.list[i], formatting_reference);
      external_special_unit_body_formatting_function += status;
    }

  qsort (self_html->htmlxref.list, self_html->htmlxref.number,
         sizeof (HTMLXREF_MANUAL), compare_htmlxref_manual);

  /* set to customization such that it is not replaced by C functions */
  if (self->conf->XS_EXTERNAL_FORMATTING.o.integer > 0)
    {
      for (l = 0; l < FR_format_translate_message+1; l++)
        if (self_html->formatting_references[l].status == FRS_status_default_set)
          {
            self_html->formatting_references[l].status
                                   = FRS_status_customization_set;
            external_formatting_function++;
          }
    }
  else
    { /* count the functions implemented in perl */
      for (l = 0; l < FR_format_translate_message+1; l++)
        if (self_html->formatting_references[l].status
                  == FRS_status_customization_set)
          external_formatting_function++;
    }

  /* remaining of the file is for the replacement of call to external
     functions by internal functions in C.
   */
  if (self->conf->XS_EXTERNAL_CONVERSION.o.integer > 0)
    goto out;

  for (i = 0; types_internal_conversion_table[i].type_conversion; i++)
    {
      enum element_type type = types_internal_conversion_table[i].type;
      TYPE_CONVERSION_FUNCTION *type_conversion
         = &self_html->type_conversion_function[type];
      TYPE_CONVERSION_FUNCTION *css_string_type_conversion
         = &self_html->css_string_type_conversion_function[type];
      if (type_conversion->status == FRS_status_default_set
          || type_conversion->status == FRS_status_none)
        {
          if (type_conversion->status == FRS_status_default_set)
            external_type_conversion_function--;
          type_conversion->formatting_reference = 0;
          type_conversion->status = FRS_status_internal;
          type_conversion->type_conversion
              = types_internal_conversion_table[i].type_conversion;
        }
      css_string_type_conversion->formatting_reference = 0;
      css_string_type_conversion->status = FRS_status_internal;
      if (type == ET_text)
        css_string_type_conversion->type_conversion
          = &html_css_string_convert_text;
      else
        css_string_type_conversion->type_conversion
          = types_internal_conversion_table[i].type_conversion;
    }

  for (i = 0; types_internal_open_table[i].type_open; i++)
    {
      enum element_type type = types_internal_open_table[i].type;
      TYPE_OPEN_FUNCTION *type_open = &self_html->type_open_function[type];
      if (type_open->status == FRS_status_default_set
          || type_open->status == FRS_status_none)
        {
          if (type_open->status == FRS_status_default_set)
            external_type_open_function--;
          type_open->formatting_reference = 0;
          type_open->status = FRS_status_internal;
          type_open->type_open
              = types_internal_open_table[i].type_open;
        }
    }

  for (i = 0; commands_internal_conversion_table[i].command_conversion; i++)
    {
      enum command_id cmd = commands_internal_conversion_table[i].cmd;
      COMMAND_CONVERSION_FUNCTION *command_conversion
               = &self_html->command_conversion_function[cmd];
      COMMAND_CONVERSION_FUNCTION *css_string_command_conversion
               = &self_html->css_string_command_conversion_function[cmd];
      if (command_conversion->status == FRS_status_default_set
          || command_conversion->status == FRS_status_none)
        {
          if (command_conversion->status == FRS_status_default_set)
            external_command_conversion_function--;
          command_conversion->formatting_reference = 0;
          command_conversion->status = FRS_status_internal;
          command_conversion->command_conversion
              = commands_internal_conversion_table[i].command_conversion;
        }
      css_string_command_conversion->formatting_reference = 0;
      css_string_command_conversion->status = FRS_status_internal;
      css_string_command_conversion->command_conversion
              = commands_internal_conversion_table[i].command_conversion;
    }

  if (strcmp (self->conf->FORMAT_MENU.o.string, "menu")
      && strcmp (self->conf->FORMAT_MENU.o.string, "menu_no_detailmenu"))
    {
      static enum command_id menu_cmd_list[]
       = {CM_menu, CM_detailmenu, 0};
      int j;
      for (j = 0; menu_cmd_list[j]; j++)
        {
          enum command_id cmd = menu_cmd_list[j];
          COMMAND_CONVERSION_FUNCTION *command_conversion
               = &self_html->command_conversion_function[cmd];
          if (command_conversion->status == FRS_status_internal)
            command_conversion->status = FRS_status_ignored;
        }
    }
  for (i = 0; i < format_raw_cmd.number; i++)
    {
      enum command_id cmd = format_raw_cmd.list[i];
      COMMAND_CONVERSION_FUNCTION *command_conversion
        = &self_html->command_conversion_function[cmd];
      if (command_conversion->status == FRS_status_internal)
        {
          const char *format = builtin_command_name (cmd);
          if (!format_expanded_p (self->expanded_formats, format))
            command_conversion->status = FRS_status_ignored;
        }
    }

  /* all the no arg formatted commands are implemented in C */
  for (i = 0; i < no_arg_formatted_cmd.number; i++)
    {
      enum command_id cmd = no_arg_formatted_cmd.list[i];
      COMMAND_CONVERSION_FUNCTION *command_conversion
           = &self_html->command_conversion_function[cmd];
      COMMAND_CONVERSION_FUNCTION *css_string_command_conversion
           = &self_html->css_string_command_conversion_function[cmd];
      if (command_conversion->status == FRS_status_default_set
          || command_conversion->status == FRS_status_none)
        {
          if (command_conversion->status == FRS_status_default_set)
            external_command_conversion_function--;
          command_conversion->formatting_reference = 0;
          command_conversion->status = FRS_status_internal;
          command_conversion->command_conversion
            = &html_convert_no_arg_command;
        }

      css_string_command_conversion->formatting_reference = 0;
      css_string_command_conversion->status = FRS_status_internal;
      css_string_command_conversion->command_conversion
        = &html_css_string_convert_no_arg_command;
    }

  /* all the accents commands are implemented in C */
  if (accent_cmd.number)
    {
      for (i = 0; i < accent_cmd.number; i++)
        {
          enum command_id cmd = accent_cmd.list[i];
          COMMAND_CONVERSION_FUNCTION *command_conversion
               = &self_html->command_conversion_function[cmd];
          COMMAND_CONVERSION_FUNCTION *css_string_command_conversion
               = &self_html->css_string_command_conversion_function[cmd];
          if (command_conversion->status == FRS_status_default_set
              || command_conversion->status == FRS_status_none)
            {
              if (command_conversion->status == FRS_status_default_set)
                external_command_conversion_function--;
              command_conversion->formatting_reference = 0;
              command_conversion->status = FRS_status_internal;
              command_conversion->command_conversion
                = &html_convert_accent_command;
            }
          css_string_command_conversion->formatting_reference = 0;
          css_string_command_conversion->status = FRS_status_internal;
          css_string_command_conversion->command_conversion
            = &html_css_string_convert_accent_command;
        }
    }

  /* all the commands in style_formatted_cmd are implemented in C.
     It is not only the style commands, some others too.  indicateurl
     is not in style_formatted_cmd */
  if (style_formatted_cmd.number)
    {
      for (i = 0; i < style_formatted_cmd.number; i++)
        {
          enum command_id cmd = style_formatted_cmd.list[i];
          COMMAND_CONVERSION_FUNCTION *command_conversion
               = &self_html->command_conversion_function[cmd];
          COMMAND_CONVERSION_FUNCTION *css_string_command_conversion
               = &self_html->css_string_command_conversion_function[cmd];

          if (command_conversion->status == FRS_status_default_set
              || command_conversion->status == FRS_status_none)
            {
              if (command_conversion->status == FRS_status_default_set)
                external_command_conversion_function--;
              command_conversion->formatting_reference = 0;
              command_conversion->status = FRS_status_internal;
              command_conversion->command_conversion
                = &html_convert_style_command;
            }

          css_string_command_conversion->formatting_reference = 0;
          css_string_command_conversion->status = FRS_status_internal;
          css_string_command_conversion->command_conversion
            = &html_convert_style_command;
        }
    }

  /* preformatted commands are implemented in C */
  if (preformatted_cmd_list.number > 0)
    {
      for (i = 0; i < preformatted_cmd_list.number; i++)
        {
          enum command_id cmd = preformatted_cmd_list.list[i];
          COMMAND_CONVERSION_FUNCTION *command_conversion
               = &self_html->command_conversion_function[cmd];
          COMMAND_CONVERSION_FUNCTION *css_string_command_conversion
               = &self_html->css_string_command_conversion_function[cmd];

          if (command_conversion->status == FRS_status_default_set
              || command_conversion->status == FRS_status_none)
            {
              if (command_conversion->status == FRS_status_default_set)
                external_command_conversion_function--;
              command_conversion->formatting_reference = 0;
              command_conversion->status = FRS_status_internal;
              command_conversion->command_conversion
                = &html_convert_preformatted_command;
            }

          css_string_command_conversion->formatting_reference = 0;
          css_string_command_conversion->status = FRS_status_internal;
          css_string_command_conversion->command_conversion
            = &html_convert_preformatted_command;
        }
    }
  /* def commands are implemented in C */
  if (def_cmd_list.number > 0)
    {
      for (i = 0; i < def_cmd_list.number; i++)
        {
          enum command_id cmd = def_cmd_list.list[i];
          COMMAND_CONVERSION_FUNCTION *command_conversion
               = &self_html->command_conversion_function[cmd];
          COMMAND_CONVERSION_FUNCTION *css_string_command_conversion
               = &self_html->css_string_command_conversion_function[cmd];

          if (command_conversion->status == FRS_status_default_set
              || command_conversion->status == FRS_status_none)
            {
              if (command_conversion->status == FRS_status_default_set)
                external_command_conversion_function--;
              command_conversion->formatting_reference = 0;
              command_conversion->status = FRS_status_internal;
              command_conversion->command_conversion
                = &html_convert_def_command;
            }

          css_string_command_conversion->formatting_reference = 0;
          css_string_command_conversion->status = FRS_status_internal;
          css_string_command_conversion->command_conversion
            = &html_convert_def_command;
        }
    }

  for (i = 0; commands_internal_open_table[i].command_open; i++)
    {
      enum command_id cmd = commands_internal_open_table[i].cmd;
      COMMAND_OPEN_FUNCTION *command_open = &self_html->command_open_function[cmd];
      if (command_open->status == FRS_status_default_set
          || command_open->status == FRS_status_none)
        {
          if (command_open->status == FRS_status_default_set)
            external_command_open_function--;
          command_open->formatting_reference = 0;
          command_open->status = FRS_status_internal;
          command_open->command_open
              = commands_internal_open_table[i].command_open;
        }
    }

  for (i = 0;
     output_units_internal_conversion_table[i].output_unit_conversion; i++)
    {
      enum output_unit_type type
           = output_units_internal_conversion_table[i].type;
      OUTPUT_UNIT_CONVERSION_FUNCTION *output_unit_conversion
         = &self_html->output_unit_conversion_function[type];
      if (output_unit_conversion->status == FRS_status_default_set
          || output_unit_conversion->status == FRS_status_none)
        {
          if (output_unit_conversion->status == FRS_status_default_set)
            external_output_unit_conversion_function--;
          output_unit_conversion->formatting_reference = 0;
          output_unit_conversion->status = FRS_status_internal;
          output_unit_conversion->output_unit_conversion
           = output_units_internal_conversion_table[i].output_unit_conversion;
        }
    }

  for (i = 0;
    special_unit_body_internal_formatting_table[i].special_unit_variety; i++)
    {
      const SPECIAL_UNIT_BODY_INTERNAL_CONVERSION *internal_conversion
        = &special_unit_body_internal_formatting_table[i];
      /* number is index +1 */
      size_t number = find_string (&self_html->special_unit_varieties,
                                   internal_conversion->special_unit_variety);
      int j = number -1;
      if (j >= 0)
        {
          SPECIAL_UNIT_BODY_FORMATTING *body_formatting
            = &self_html->special_unit_body_formatting[j];
          if (body_formatting->status == FRS_status_default_set
              || body_formatting->status == FRS_status_none)
            {
              if (body_formatting->status == FRS_status_default_set)
                external_special_unit_body_formatting_function--;
              body_formatting->formatting_reference = 0;
              body_formatting->status = FRS_status_internal;
              body_formatting->special_unit_body_formatting
                = internal_conversion->special_unit_body_formatting;
            }
        }
    }

 out:
  added_external_references = self->conf->BIT_user_function_number
        + self_html->file_id_setting_ref_number
        + external_special_unit_body_formatting_function
        + external_output_unit_conversion_function
        + external_command_conversion_function
        + external_command_open_function
        + external_type_conversion_function
        + external_type_open_function
        + external_formatting_function;

  self_html->external_references_number += added_external_references;

   /*
  fprintf (stderr, "TOTAL: %d. prev %d conf %zu fi %d sbf %d ouc %d cc %d co %d tc %d to %d f %d\n",
           self_html->external_references_number,
           self_html->external_references_number - added_external_references,
           self->conf->BIT_user_function_number,
           self_html->file_id_setting_ref_number,
           external_special_unit_body_formatting_function,
           external_output_unit_conversion_function,
           external_command_conversion_function,
           external_command_open_function,
           external_type_conversion_function,
           external_type_open_function,
           external_formatting_function);
    */

  /* modified when formatting a Texinfo as a CSS string, but always
     reset to these values afterwards */
  /* set it now and not right before starting to output, as the
     current_* may be used in code called before starting the
     conversion, mainly for index strings sorting to use a customized
     function for translation */
  self_html->current_formatting_references
    = &self_html->formatting_references[0];
  self_html->current_commands_conversion_function
    = &self_html->command_conversion_function[0];
  self_html->current_types_conversion_function
    = &self_html->type_conversion_function[0];
  self_html->current_format_protect_text = &html_default_format_protect_text;
}



/* Initialize output state.  Sequence of:
     html_conversion_initialization
     html_setup_output for output() or html_setup_convert for convert()

   To be followed by setting up output units
     html_prepare_conversion_units
 */

void
free_html_no_arg_command_conversion (
                         HTML_NO_ARG_COMMAND_CONVERSION *format_spec)
{
  free (format_spec->element);
  free (format_spec->text);
  free (format_spec->translated_converted);
}

static void
copy_html_no_arg_command_conversion (HTML_NO_ARG_COMMAND_CONVERSION *to,
                                     HTML_NO_ARG_COMMAND_CONVERSION *from)
{
  if (from->element)
    to->element = strdup (from->element);
  else
    to->element = 0;
  to->unset = from->unset;
  if (from->text)
    to->text = strdup (from->text);
  else
    to->text = 0;
  if (from->translated_converted)
    to->translated_converted = strdup (from->translated_converted);
  else
    to->translated_converted = 0;
}

char ***
new_directions_strings_type (int nr_string_directions,
                             int nr_dir_str_contexts)
{
  int i;
  char ***result = (char ***)
        malloc (nr_string_directions * sizeof (char **));
  memset (result, 0,
          nr_string_directions * sizeof (char **));

  for (i = 0; i < nr_string_directions; i++)
    {
      result[i] = (char **)
         malloc (nr_dir_str_contexts * sizeof (char *));
      memset (result[i], 0,
              nr_dir_str_contexts * sizeof (char *));
    }

  return result;
}

/* transform <hr> to <hr/>
   main effect is s/^(<[a-zA-Z]+[^<>]*)>$/$1\/>/ */
static char *
xhtml_re_close_lone_element (const char *input)
{
  size_t len = strlen (input);
  size_t n;
  const char *p;
  char *result;
  if (len < 3 || input[len -1] != '>' || input[0] != '<'
      || !isascii_alpha (input[1]))
    return strdup (input);

  /* before > */
  p = input + len - 2;
  while (p > input +1)
    {
      if (*p == '/')
        /* already a closed lone element */
        return strdup (input);
      if (strchr (whitespace_chars, *p))
        p--;
      else
        break;
    }

  p = input + 2;
  n = strcspn (p, "<>");
  if (n +2 != len -1)
    return strdup (input);

  result = (char *) malloc ((len +1 +1) * sizeof (char));
  memcpy (result, input, (len -1) * sizeof (char));
  result[len -1] = '/';
  result[len] = '>';
  result[len+1] = '\0';

  return result;
}

static void
close_lone_conf_element (OPTION *option)
{
  const char *variable_value = option->o.string;
  if (variable_value)
    {
      char *closed_lone_element = xhtml_re_close_lone_element (variable_value);
      if (strcmp (closed_lone_element, variable_value))
        {
          option_force_conf (option, 0, closed_lone_element);
        }
      free (closed_lone_element);
    }
}

void
free_js_categories_list (JSLICENSE_CATEGORY_LIST *js_files_info)
{
  if (js_files_info->number)
    {
      size_t i;
      for (i = 0; i < js_files_info->number; i++)
        {
          JSLICENSE_FILE_INFO_LIST *jslicences_files_info
            = &js_files_info->list[i];
          free (jslicences_files_info->category);
          if (jslicences_files_info->number)
            {
              size_t j;
              for (j = 0; j < jslicences_files_info->number; j++)
                {
                  JSLICENSE_FILE_INFO *jslicense_file_info
                    = &jslicences_files_info->list[j];
                  free (jslicense_file_info->filename);
                  free (jslicense_file_info->license);
                  free (jslicense_file_info->url);
                  free (jslicense_file_info->source);
                }
            }
          free (jslicences_files_info->list);
        }
      free (js_files_info->list);
    }
  js_files_info->number = 0;
}

static void
reset_html_targets_list (CONVERTER *self, HTML_TARGET_LIST *targets)
{
  if (targets->number)
    {
      size_t i;
      for (i = 0; i < targets->number; i++)
        {
          int j;
          HTML_TARGET *html_target = targets->list[i];
          /* setup before conversion */
          free (html_target->target);
          free (html_target->special_unit_filename);
          free (html_target->node_filename);
          free (html_target->section_filename);
          free (html_target->contents_target);
          free (html_target->shortcontents_target);

          free_tree_added_elements (&html_target->tree);
          free_tree_added_elements (&html_target->tree_nonumber);
          free_tree_added_elements (&html_target->name_tree);
          free_tree_added_elements (&html_target->name_tree_nonumber);

          for (j = 0; j < HTT_string_nonumber+1; j++)
            free (html_target->command_text[j]);

          for (j = 0; j < HTT_string_nonumber+1; j++)
            free (html_target->command_description[j]);

          for (j = 0; j < HTT_string_nonumber+1; j++)
            free (html_target->command_name[j]);
          free (html_target);
          /* targets->list[i] = 0; */
        }
      targets->number = 0;
    }
}

void
reset_html_targets (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t i;

  for (i = 0; i < self_html->html_target_cmds.number; i++)
    {
      enum command_id cmd = self_html->html_target_cmds.list[i];
      reset_html_targets_list (self, &self_html->html_targets[cmd]);
    }

  for (i = 0; i < ST_footnote_location+1; i++)
    {
      reset_html_targets_list (self, &self_html->html_special_targets[i]);
    }
}

void
reset_html_page_css (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t i;

  for (i = 0; i < self_html->page_css.number; i++)
    {
      CSS_LIST *page_css_list = &self_html->page_css.list[i];

      free_strings_list (&page_css_list->selectors);
      free (page_css_list->page_name);
    }
  self_html->page_css.number = 0;
}

static const enum command_id spaces_cmd[] = {
  CM_SPACE, CM_TAB, CM_NEWLINE, CM_tie
};

/* called first in convert and output */
void
html_conversion_initialization (CONVERTER *self, const char *context,
                                DOCUMENT *document)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  int i;
  size_t j;
  const char *output_encoding;
  int nr_string_directions = html_nr_string_directions (self);
  int nr_dir_str_contexts = TDS_context_string + 1;
  enum direction_string_type DS_type;
  const char *line_break_element;
  int *non_default_special_unit_directions =
     determine_non_default_special_unit_directions (self);

  converter_set_document (self, document);

  if (!document && self->conf->DEBUG.o.integer > 0)
    {
      fprintf (stderr,
               "C|REMARK: conversion_initialization: no document\n");
    }

  /* corresponds with default_no_arg_commands_formatting
     + conf_default_no_arg_commands_formatting_normal in Perl */
  HTML_NO_ARG_COMMAND_CONVERSION
   output_no_arg_commands_formatting[BUILTIN_CMD_NUMBER]
                                              [NO_ARG_COMMAND_CONTEXT_NR];

  /* in Perl converter_info is reset here, in C corresponds to
     different fields of the converter structure.
     They are reset here when relevant */

  free (self_html->title_titlepage);
  self_html->title_titlepage = 0;
  free (self_html->title_string);
  self_html->title_string = 0;
  free (self_html->documentdescription_string);
  self_html->documentdescription_string = 0;
  free (self_html->documentinfo_metadata);
  self_html->documentinfo_metadata = 0;
  free (self_html->copying_comment);
  self_html->copying_comment = 0;
  free (self_html->destination_directory);
  self_html->destination_directory = 0;
  free (self_html->document_name);
  self_html->document_name = 0;

  self_html->simpletitle_tree = 0;
  self_html->simpletitle_cmd = CM_NONE;

  if (self_html->added_title_tree)
    {
      destroy_element_and_children (self_html->title_tree);

      self_html->added_title_tree = 0;
    }
  self_html->title_tree = 0;

  set_global_document_commands (self, CL_before, informative_global_commands);
  set_global_document_commands (self, CL_before, contents_elements_options);

  clear_strings_list (&self_html->css_import_lines);
  clear_strings_list (&self_html->css_rule_lines);
  copy_strings (&self_html->css_import_lines, &self_html->files_css_import_lines);
  copy_strings (&self_html->css_rule_lines, &self_html->files_css_rule_lines);

  html_reset_shared_conversion_state (self);

  reset_html_page_css (self);

  reset_html_targets (self);

  html_clear_pending_footnotes (&self_html->pending_footnotes);

  self_html->current_node = 0;
  self_html->current_root_command = 0;

  free_translation_cache (self_html->translation_cache);
  self_html->translation_cache = 0;

  /* it actually matters only with output, not with convert, but it is
     better to reset in any case */
  free_js_categories_list (&self_html->jslicenses);

  output_encoding = self->conf->OUTPUT_ENCODING_NAME.o.string;

  for (i = 0; i < SC_non_breaking_space+1; i++)
    {
      const char *unicode_point = special_characters_formatting[i][2];
      const char *entity = special_characters_formatting[i][0];
      const char *encoded_string = special_characters_formatting[i][1];
      const char *numeric_entity = special_characters_formatting[i][3];
      const char *special_character_string;

      if (self->conf->OUTPUT_CHARACTERS.o.integer > 0
          && unicode_point_decoded_in_encoding (output_encoding,
                                                unicode_point))
        special_character_string = encoded_string;
      else if (self->conf->USE_NUMERIC_ENTITY.o.integer > 0)
        special_character_string = numeric_entity;
      else
        special_character_string = entity;

      self_html->special_character[i].string = special_character_string;
      self_html->special_character[i].len = strlen (special_character_string);
    }

  if (!self->conf->OPEN_QUOTE_SYMBOL.o.string)
    {
      int set = option_set_conf (&self->conf->OPEN_QUOTE_SYMBOL, 0,
                         self_html->special_character[SC_left_quote].string);
      /* override undef set in init file/command line */
      if (!set)
        option_force_conf (&self->conf->OPEN_QUOTE_SYMBOL, 0, "");
    }
  if (!self->conf->CLOSE_QUOTE_SYMBOL.o.string)
    {
      int set = option_set_conf (&self->conf->CLOSE_QUOTE_SYMBOL, 0,
                         self_html->special_character[SC_right_quote].string);
      /* override undef set in init file/command line */
      if (!set)
        option_force_conf (&self->conf->CLOSE_QUOTE_SYMBOL, 0, "");
    }
  if (!self->conf->MENU_SYMBOL.o.string)
    {
      int set = option_set_conf (&self->conf->MENU_SYMBOL, 0,
                         self_html->special_character[SC_bullet].string);
      /* override undef set in init file/command line */
      if (!set)
        option_force_conf (&self->conf->MENU_SYMBOL, 0, "");
    }

  if (self->conf->USE_XML_SYNTAX.o.integer > 0)
    {
      close_lone_conf_element (&self->conf->BIG_RULE);
      close_lone_conf_element (&self->conf->DEFAULT_RULE);
      line_break_element = "<br/>";
    }
  else
    line_break_element = "<br>";

  self_html->line_break_element.string = line_break_element;
  self_html->line_break_element.len = strlen (line_break_element);

  memcpy (output_no_arg_commands_formatting, default_no_arg_commands_formatting,
          sizeof (default_no_arg_commands_formatting));

  /* if not the textual entity */
  if (strcmp(self_html->special_character[SC_non_breaking_space].string,
             special_characters_formatting[SC_non_breaking_space][0]))
    {
      for (j = 0; j < sizeof (spaces_cmd) / sizeof (spaces_cmd[0]); j++)
        {
          enum command_id cmd = spaces_cmd[j];
          /* cast to drop const */
          output_no_arg_commands_formatting[cmd][HCC_type_normal].text
            = (char *)self_html->special_character[SC_non_breaking_space].string;
        }
    }

  if (self->conf->USE_NUMERIC_ENTITY.o.integer > 0)
    {
      for (j = 0; j < no_arg_formatted_cmd.number; j++)
        {
          enum command_id cmd = no_arg_formatted_cmd.list[j];
          if (unicode_entities[cmd])
            output_no_arg_commands_formatting[cmd][HCC_type_normal].text
              = unicode_entities[cmd];
        }
    }

  /* cast to discard const */
  output_no_arg_commands_formatting[CM_ASTERISK][HCC_type_normal].text
    = (char *)self_html->line_break_element.string;

  clear_css_selector_style_list (&self_html->css_element_class_styles);
  set_css_selector_style_list_size (&self_html->css_element_class_styles,
                                    default_css_element_class_styles.number);
  for (j = 0; j < default_css_element_class_styles.number; j++)
    {
      CSS_SELECTOR_STYLE *default_selector_style
        = &default_css_element_class_styles.list[j];
      CSS_SELECTOR_STYLE *selector_style
        = &self_html->css_element_class_styles.list[j];
      selector_style->selector = strdup (default_selector_style->selector);
      selector_style->style = strdup (default_selector_style->style);
    }

  for (j = 0; j < no_arg_formatted_cmd.number; j++)
    {
      enum command_id cmd = no_arg_formatted_cmd.list[j];
      enum conversion_context cctx;
      HTML_NO_ARG_COMMAND_CUSTOMIZATION *customized_no_arg_cmd_formatting
        = &self_html->customized_no_arg_commands_formatting[cmd];
      HTML_NO_ARG_COMMAND_FORMATTING *result_formatting
        = &self_html->html_no_arg_command_conversion[cmd];

      free (result_formatting->translated_to_convert);
      if (customized_no_arg_cmd_formatting->translated_to_convert)
        result_formatting->translated_to_convert
          = strdup (
            customized_no_arg_cmd_formatting->translated_to_convert);
      else
        result_formatting->translated_to_convert = 0;

      for (cctx = 0; cctx < NO_ARG_COMMAND_CONTEXT_NR; cctx++)
        {
          HTML_NO_ARG_COMMAND_CONVERSION *customized_no_arg_cmd
            = customized_no_arg_cmd_formatting->context_formatting[cctx];
          HTML_NO_ARG_COMMAND_CONVERSION *result
            = &result_formatting->context_formatting[cctx];

          free_html_no_arg_command_conversion (result);

          if (customized_no_arg_cmd)
            {
              copy_html_no_arg_command_conversion (result,
                                                   customized_no_arg_cmd);
            }
          else if (!output_no_arg_commands_formatting[cmd][cctx].unset)
            {
              const char *unicode_brace_no_arg_formatting = 0;
              if (self->conf->OUTPUT_CHARACTERS.o.integer > 0)
                {
                  unicode_brace_no_arg_formatting
                    = unicode_brace_no_arg_command (cmd,
                         self->conf->OUTPUT_ENCODING_NAME.o.string);
                }
              if (unicode_brace_no_arg_formatting)
                {
                  memset (result, 0, sizeof (HTML_NO_ARG_COMMAND_CONVERSION));
                  result->text
                    = strdup (unicode_brace_no_arg_formatting);

                  /* reset CSS for itemize command arguments */
                  if (cctx == HCC_type_css_string
                      && command_data[cmd].flags & CF_brace
                      && cmd != CM_bullet && cmd != CM_w)
                    {
                      const char *special_list_mark_command
                       = get_special_list_mark_css_string_no_arg_command (cmd);

                      if (!special_list_mark_command)
                        {
                           char *selector;
                           char *style;
                           xasprintf (&selector, "ul.mark-%s",
                                      builtin_command_name (cmd));
                           xasprintf (&style, "list-style-type: \"%s\"",
                                      result->text);
                           html_css_set_selector_style (
                                         &self_html->css_element_class_styles,
                                                        selector, style);
                           free (selector);
                           free (style);
                        }
                    }
                }
              else
                {
                  copy_html_no_arg_command_conversion (result,
                     &output_no_arg_commands_formatting[cmd][cctx]);
                }
            }
          else
            {
              copy_html_no_arg_command_conversion (result,
                &output_no_arg_commands_formatting[cmd][cctx]);
            }
        }
    }

  for (j = 0; j < no_arg_formatted_cmd.number; j++)
    {
      enum command_id cmd = no_arg_formatted_cmd.list[j];
      COMMAND_CONVERSION_FUNCTION *command_conversion
        = &self_html->command_conversion_function[cmd];
      if (command_conversion->status == FRS_status_default_set
          || command_conversion->status == FRS_status_internal)
        {
          html_complete_no_arg_commands_formatting (self, cmd, 0);
        }
    }

  for (DS_type = 0; DS_type < TDS_TYPE_MAX_NR; DS_type++)
    {
      int i;
      const char * const*default_converted_dir_str;
      char ***customized_type_dir_strings;

      if (!self_html->directions_strings[DS_type])
        self_html->directions_strings[DS_type]
          = new_directions_strings_type (nr_string_directions,
                                         nr_dir_str_contexts);
      else
        html_clear_direction_string_type (self,
                                          self_html->directions_strings[DS_type]);

      /* those will be determined from translatable strings */
      if (DS_type < TDS_TRANSLATED_MAX_NR)
        continue;

      default_converted_dir_str =
        default_converted_directions_strings[
                                       DS_type - (TDS_TRANSLATED_MAX_NR)];
      customized_type_dir_strings = self_html->customized_directions_strings[
                                       DS_type - (TDS_TRANSLATED_MAX_NR)];
      for (i = 0; i < nr_string_directions; i++)
        {
          if (customized_type_dir_strings && customized_type_dir_strings[i])
            {
              int j;
              for (j = 0; j < nr_dir_str_contexts; j++)
                {
                  if (customized_type_dir_strings[i][j])
                    self_html->directions_strings[DS_type][i][j]
                      = html_substitute_non_breaking_space (self,
                                     customized_type_dir_strings[i][j]);
                }
            }
          else if (default_converted_dir_str[i])
            {
              if (i < NON_SPECIAL_DIRECTIONS_NR - FIRSTINFILE_NR
                  || (i < (int) self_html->special_unit_varieties.number +
                        NON_SPECIAL_DIRECTIONS_NR - FIRSTINFILE_NR
                      && !non_default_special_unit_directions[
                       i - (NON_SPECIAL_DIRECTIONS_NR - FIRSTINFILE_NR)]))
                self_html->directions_strings[DS_type][i][TDS_context_normal]
                  = html_substitute_non_breaking_space (self,
                                            default_converted_dir_str[i]);
            }

          if (self_html->directions_strings[DS_type][i][TDS_context_normal]
              && !self_html->directions_strings[DS_type][i][TDS_context_string])
            {
              self_html->directions_strings[DS_type][i][TDS_context_string]
                 = strdup (
               self_html->directions_strings[DS_type][i][TDS_context_normal]);
            }
        }
    }

  free (non_default_special_unit_directions);

  sort_css_element_class_styles (&self_html->css_element_class_styles);

  /* set the htmlxref type split of the document */
  self_html->document_htmlxref_split_type = htmlxref_split_type_mono;

  if (self->conf->SPLIT.o.string && strlen (self->conf->SPLIT.o.string))
    {
      int i;
      for (i = 1; i < htmlxref_split_type_chapter+1; i++)
        {
          if (!strcmp (self->conf->SPLIT.o.string,
                       htmlxref_split_type_names[i]))
            {
              self_html->document_htmlxref_split_type = i;
              break;
            }
        }
    }

  /* directions */
  memset (self_html->global_units_directions, 0,
    (DEFAULT_GLOBAL_DIRECTION_LAST_IDX + self_html->special_unit_varieties.number
     + self_html->added_global_units_directions.number +1) * sizeof (OUTPUT_UNIT));

  free (self_html->global_units_direction_names.list);
  self_html->global_units_direction_names.list = 0;
  self_html->global_units_direction_names.number = 0;

  clear_strings_list (&self_html->check_htmlxref_already_warned);

  if (self->conf->NODE_NAME_IN_INDEX.o.integer < 0)
    option_set_conf (&self->conf->NODE_NAME_IN_INDEX,
                     self->conf->USE_NODES.o.integer, 0);

  if (self->conf->HTML_MATH.o.string
      && self->conf->CONVERT_TO_LATEX_IN_MATH.o.integer < 0)
    {
      option_set_conf (&self->conf->CONVERT_TO_LATEX_IN_MATH, 1, 0);
    }

  if (self->conf->NO_TOP_NODE_OUTPUT.o.integer > 0
      && self->conf->SHOW_TITLE.o.integer < 0)
    option_set_conf (&self->conf->SHOW_TITLE, 1, 0);

  if (self->conf->SPLIT.o.string != 0
      && !strcmp (self->conf->SPLIT.o.string, "node")
      && self->conf->USE_ACCESSKEY.o.integer < 0)
    option_set_conf (&self->conf->USE_ACCESSKEY, 1, 0);

  html_new_document_context (self, context, 0, 0, 0);
  self_html->document_global_context_counter = 0;

  converter_sort_index_names (self);

  if (self->document)
    {
      const LISTOFFLOATS_TYPE_LIST *listoffloats
         = &self->document->listoffloats;

      if (listoffloats->number)
        {
          self_html->shared_conversion_state.formatted_listoffloats_nr
           = (int *) malloc (listoffloats->number * sizeof (int));
          memset (self_html->shared_conversion_state.formatted_listoffloats_nr,
              0, listoffloats->number * sizeof (int));
        }
    }
}

static void
init_conversion_after_setup_handler (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  /* the presence of contents elements in the document is used in diverse
     places, set it once for all here */
  set_global_document_commands (self, CL_last, contents_elements_options);

  if (self->conf->OUTPUT_CHARACTERS.o.integer > 0
      && self->conf->OUTPUT_ENCODING_NAME.o.string
      /* not sure if strcasecmp is needed or not */
      && !strcasecmp (self->conf->OUTPUT_ENCODING_NAME.o.string, "utf-8"))
    self_html->use_unicode_text = 1;
}

static void
fill_jslicense_file_info (JSLICENSE_FILE_INFO *jslicense_file_info,
                          const char *filename, const char *license,
                          const char *url, const char *source)
{
  jslicense_file_info->filename = strdup (filename);
  jslicense_file_info->license = strdup (license);
  jslicense_file_info->url = strdup (url);
  jslicense_file_info->source = strdup (source);
}

void
initialize_js_categories_list (JSLICENSE_CATEGORY_LIST *js_files_info,
                              size_t size)
{
  js_files_info->list = (JSLICENSE_FILE_INFO_LIST *)
           malloc (size * sizeof (JSLICENSE_FILE_INFO_LIST));
  memset (js_files_info->list, 0,
                  size * sizeof (JSLICENSE_FILE_INFO_LIST));
  js_files_info->number = size;
}

void
initialize_jslicense_files (JSLICENSE_FILE_INFO_LIST *jslicences_files_info,
                            const char *category, size_t size)
{
  jslicences_files_info->category = strdup (category);
  jslicences_files_info->list = (JSLICENSE_FILE_INFO *)
              malloc (size * sizeof (JSLICENSE_FILE_INFO));
  memset (jslicences_files_info->list, 0,
          size * sizeof (JSLICENSE_FILE_INFO));
  jslicences_files_info->number = size;
}

/* first function to call a stage handler */
int
html_setup_output (CONVERTER *self, char **paths)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  int handler_fatal_error_level;
  int setup_handler_status;
  int js_categories_list_nr = 0;
  char *body_element_attributes;
  const char *default_bcp47_locale;
  const char *preamble_bcp47_locale;

  /* Should not actually be needed, as it is already deleted after conversion
     and each time it is set out of the conversion. */
  memset (&self_html->current_filename, 0, sizeof (FILE_NUMBER_NAME));

  if (self->conf->OUTFILE.o.string)
    {
      int i;
      int need_unsplit = 0;
      const char *outfile = self->conf->OUTFILE.o.string;
      if (!strlen(outfile) || !strcmp (outfile, "-"))
        need_unsplit = 1;
      else
        {
          for (i = 0; null_device_names[i]; i++)
            {
              if (!strcmp (null_device_names[i], outfile))
                {
                  need_unsplit = 1;
                  break;
                }
            }
        }
      if (need_unsplit)
        {
          option_force_conf (&self->conf->SPLIT, 0, "");
          option_force_conf (&self->conf->MONOLITHIC, 1, 0);
        }
    }

  if (self->conf->SPLIT.o.string && strlen (self->conf->SPLIT.o.string))
    option_set_conf (&self->conf->NODE_FILES, 1, 0);

  option_set_conf (&self->conf->EXTERNAL_CROSSREF_SPLIT, 0,
            self->conf->SPLIT.o.string);

  handler_fatal_error_level = self->conf->HANDLER_FATAL_ERROR_LEVEL.o.integer;
  if (handler_fatal_error_level < 0)
    {
      handler_fatal_error_level
        = txi_base_options.HANDLER_FATAL_ERROR_LEVEL.o.integer;
      option_force_conf (&self->conf->HANDLER_FATAL_ERROR_LEVEL,
                         handler_fatal_error_level, 0);
    }

  if (self->conf->HTML_MATH.o.string
      && !strcmp (self->conf->HTML_MATH.o.string, "mathjax"))
    {
     /*
     See https://www.gnu.org/licenses/javascript-labels.html

     The link to the source for mathjax does not strictly follow the advice
     there: instead we link to instructions for obtaining the full source in
     its preferred form of modification.
      */
       if (!self->conf->MATHJAX_SCRIPT.o.string)
         option_set_conf (&self->conf->MATHJAX_SCRIPT, 0,
            "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-svg.js");

       if (!self->conf->MATHJAX_SOURCE.o.string)
         option_set_conf (&self->conf->MATHJAX_SOURCE, 0,
 "http://docs.mathjax.org/en/latest/web/hosting.html#getting-mathjax-via-git");
    }

  setup_handler_status = html_run_stage_handlers (self, HSHT_type_setup);

  if (setup_handler_status < handler_fatal_error_level
      && setup_handler_status > -handler_fatal_error_level)
    {}
  else
    return 0;

  set_commands_options_value (self->commands_init_conf,
                              self->sorted_options, 0);

  default_bcp47_locale = current_bcp47_locale (self);

  set_converter_preamble_language_commands (self);

  preamble_bcp47_locale = current_bcp47_locale (self);

  if (strcmp (preamble_bcp47_locale, ""))
    {
      xasprintf (&body_element_attributes, "lang=\"%s\"",
                 preamble_bcp47_locale);
      option_set_conf (&self->conf->BODY_ELEMENT_ATTRIBUTES,
                       0, body_element_attributes);
      free (body_element_attributes);
    }
  else
    {
      /* Note: HTML 5 documentation specifies that the lang attribute can
         take an empty string as its value to specify that the language
         is unknown.  However, outputting lang="" is unnecessary. */
    }

  if (strcmp (default_bcp47_locale, preamble_bcp47_locale))
    {
      self->current_lang_translations
       = reset_lang_translation_from_customization (
                              &converters_translation_cache,
                              self->conf->documentlanguage.o.string,
                              self->conf->documentscript.o.string,
                              TXI_CONVERT_STRINGS_NR);
    }

  init_conversion_after_setup_handler (self);

  if (self->conf->HTML_MATH.o.string
      && !strcmp (self->conf->HTML_MATH.o.string, "mathjax"))
    js_categories_list_nr++;

  if (self->conf->INFO_JS_DIR.o.string)
    js_categories_list_nr++;

  if (js_categories_list_nr > 0)
    {
      int i = 0;
      initialize_js_categories_list (&self_html->jslicenses, js_categories_list_nr);
      if (self->conf->HTML_MATH.o.string
          && !strcmp (self->conf->HTML_MATH.o.string, "mathjax"))
        {
          JSLICENSE_FILE_INFO_LIST *jslicences_files_info
            = &self_html->jslicenses.list[i];
          initialize_jslicense_files (jslicences_files_info, "mathjax", 1);
          fill_jslicense_file_info (&jslicences_files_info->list[0],
                                    self->conf->MATHJAX_SCRIPT.o.string,
                                    "Apache License, Version 2.0.",
                                "https://www.apache.org/licenses/LICENSE-2.0",
                                    self->conf->MATHJAX_SOURCE.o.string);
          i++;
        }
      if (self->conf->INFO_JS_DIR.o.string)
        {
          JSLICENSE_FILE_INFO_LIST *jslicences_files_info
            = &self_html->jslicenses.list[i];
          initialize_jslicense_files (jslicences_files_info, "infojs", 2);
          fill_jslicense_file_info (&jslicences_files_info->list[0],
                                    "js/info.js",
                                    "GNU General Public License 3.0 or later",
                                    "https://www.gnu.org/licenses/gpl-3.0.html",
                                    "js/info.js");
          fill_jslicense_file_info (&jslicences_files_info->list[1],
                                    "js/modernizr.js", "Expat",
                                    "http://www.jclark.com/xml/copying.txt",
                                    "js/modernizr.js");
        }
    }

  /* ($output_file, $destination_directory, $output_filename, $document_name) */
  determine_files_and_directory (self,
                          self->conf->TEXINFO_OUTPUT_FORMAT.o.string, paths);

  self_html->document_name = strdup (paths[3]);
  self_html->destination_directory = strdup (paths[1]);

  return 1;
}

void
html_setup_convert (CONVERTER *self)
{
  init_conversion_after_setup_handler (self);
}

static OUTPUT_UNIT *
register_special_unit (CONVERTER *self, char *special_unit_variety)
{
  ELEMENT *unit_command = new_element (ET_special_unit_element);
  OUTPUT_UNIT *special_unit = new_output_unit (OU_special_unit);

  special_unit->special_unit_variety = special_unit_variety;
  unit_command->e.c->associated_unit = special_unit;
  special_unit->uc.special_unit_command = unit_command;

  return special_unit;
}

typedef struct SPECIAL_UNIT_ORDER {
    const char *order;
    const char *variety;
} SPECIAL_UNIT_ORDER;

static int
compare_special_units (const void *a, const void *b)
{
  const SPECIAL_UNIT_ORDER *spu_order_a = (const SPECIAL_UNIT_ORDER *) a;
  const SPECIAL_UNIT_ORDER *spu_order_b = (const SPECIAL_UNIT_ORDER *) b;

  int result = strcmp (spu_order_a->order, spu_order_b->order);
  if (result != 0)
    return result;
  return strcmp (spu_order_a->variety, spu_order_b->variety);
}

static void
prepare_special_units (CONVERTER *self, size_t output_units_descriptor)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  size_t i;
  STRING_LIST *special_unit_varieties = &self_html->special_unit_varieties;
  SPECIAL_UNIT_ORDER *special_units_order;
  OUTPUT_UNIT *previous_output_unit = 0;

  size_t special_units_descriptor
         = new_output_units_descriptor (self->document);
  size_t associated_special_units_descriptor
         = new_output_units_descriptor (self->document);

  /* retrieve after reallocating */

  OUTPUT_UNIT_LIST *special_units
    = retrieve_output_units (self->document, special_units_descriptor);

  OUTPUT_UNIT_LIST *associated_special_units
    = retrieve_output_units (self->document,
                             associated_special_units_descriptor);

  OUTPUT_UNIT_LIST *output_units
    = retrieve_output_units (self->document, output_units_descriptor);

  /* for separate special output units */
  STRING_LIST *do_special = new_string_list ();

  self_html->output_units_descriptors[OUDT_special_units] = special_units_descriptor;
  self_html->output_units_descriptors[OUDT_associated_special_units]
     = associated_special_units_descriptor;

  if (self->document->sections_list.number > 1)
    {
      enum command_id contents_cmds[2] = {CM_shortcontents, CM_contents};
      int i;
      for (i = 0; i < 2; i++)
        {
          int contents_set = 0;
          enum command_id cmd = contents_cmds[i];
          const OPTION *contents_option_ref
            = get_converter_command_option (self->sorted_options, cmd);
          if (contents_option_ref->o.integer > 0)
            contents_set = 1;
          if (contents_set)
            {
              int j;
              char *special_unit_variety = 0;
              char *contents_location
                = self->conf->CONTENTS_OUTPUT_LOCATION.o.string;

              for (j = 0; command_special_unit_variety[j].cmd; j++)
                {
                  if (command_special_unit_variety[j].cmd == cmd)
                    {
                      special_unit_variety
                        = command_special_unit_variety[j].variety;
                      break;
                    }
                }
              if (contents_location
                  && !strcmp (contents_location, "separate_element"))
                add_string (do_special, special_unit_variety);
              else
                {
                  OUTPUT_UNIT *special_output_unit = 0;
                  const OUTPUT_UNIT *associated_output_unit = 0;
                  if (contents_location
                      && !strcmp (contents_location, "after_title"))
                    {
                      associated_output_unit = output_units->list[0];
                    }
                  else if (contents_location
                           && !strcmp (contents_location, "after_top"))
                    {
                      if (self->document->global_commands.top)
                        {/* note that top is a uniq command */
                          const ELEMENT *section_top
                             = self->document->global_commands.top;

                          if (section_top->e.c->associated_unit)
                            associated_output_unit
                                 = section_top->e.c->associated_unit;
                        }
                      if (!associated_output_unit)
                        continue;
                    }
                  else if (contents_location
                           && !strcmp (contents_location, "inline"))
                    {
                      const ELEMENT_LIST *global_command
                       = get_cmd_global_multi_command (
                                      &self->document->global_commands, cmd);
                      if (global_command->number > 0)
                        {
                          size_t i;
                          for (i = 0; i < global_command->number; i++)
                            {
                              const ELEMENT *command = global_command->list[i];
                              ROOT_AND_UNIT *root_unit
                               = html_get_tree_root_element (self, command, 0);
                              if (root_unit->output_unit)
                                associated_output_unit = root_unit->output_unit;
                              free (root_unit);
                              if (associated_output_unit)
                                break;
                            }
                        }
                      else
                        continue;
                    }
                  else /* should not happen */
                    continue;

                  special_output_unit
                    = register_special_unit (self, special_unit_variety);
                  special_output_unit->associated_document_unit
                    = associated_output_unit;
                  add_to_output_unit_list (associated_special_units,
                                           special_output_unit);
                }
            }
        }
    }

  if (self->document->global_commands.footnotes.number > 0
      && self->conf->footnotestyle.o.string
      && !strcmp (self->conf->footnotestyle.o.string, "separate")
      && output_units->number > 1)
    add_string (do_special, "footnotes");

  if ((self->conf->DO_ABOUT.o.integer < 0
       && output_units->number > 1
       && ((self->conf->SPLIT.o.string && strlen (self->conf->SPLIT.o.string))
           || self->conf->HEADERS.o.integer > 0))
      || self->conf->DO_ABOUT.o.integer > 0)
    add_string (do_special, "about");

  special_units_order = (SPECIAL_UNIT_ORDER *)
    malloc (sizeof (SPECIAL_UNIT_ORDER) * do_special->number);
  for (i = 0; i < do_special->number; i++)
    {
      char *special_unit_variety = do_special->list[i];
      special_units_order[i].order = html_special_unit_info (self,
                                                        SUI_type_order,
                                                        special_unit_variety);
      special_units_order[i].variety = special_unit_variety;
    }

  qsort (special_units_order, do_special->number, sizeof (SPECIAL_UNIT_ORDER),
         compare_special_units);

  previous_output_unit = output_units->list[output_units->number-1];

  for (i = 0; i < do_special->number; i++)
    {
      /* take the string from special_unit_varieties */
      char *special_unit_variety;
      /* number is index +1 */
      size_t number = find_string (special_unit_varieties,
                                   special_units_order[i].variety);
      int special_unit_varieties_idx = number -1;
      if (special_unit_varieties_idx < 0)
        {
          char *msg;
          xasprintf (&msg, "special_unit_varieties not found: %s\n",
                           special_units_order[i].variety);
          bug (msg);
        }

      special_unit_variety
        = special_unit_varieties->list[special_unit_varieties_idx];
      OUTPUT_UNIT *special_output_unit
                    = register_special_unit (self, special_unit_variety);
      add_to_output_unit_list (special_units,
                               special_output_unit);

      if (previous_output_unit)
        {
          special_output_unit->tree_unit_directions[D_prev]
             = previous_output_unit;
          previous_output_unit->tree_unit_directions[D_next]
             = special_output_unit;
        }
      previous_output_unit = special_output_unit;
    }

  free (special_units_order);
  destroy_strings_list (do_special);
}

void
html_prepare_conversion_units (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t output_units_descriptor;

  if (self->conf->USE_NODES.o.integer > 0)
    output_units_descriptor = register_split_by_node (self->document);
  else
    output_units_descriptor = register_split_by_section (self->document);
  self_html->output_units_descriptors[OUDT_units] = output_units_descriptor;

  /* configuration used to determine if a special element is to be done
     (in addition to contents) */
  set_global_document_commands (self, CL_last, conf_for_special_units);
  /*
    NOTE if the last value of footnotestyle is separate, all the footnotes
    formatted text are set to the special element set in _prepare_special_units
    as _html_get_tree_root_element uses the Footnote direction for every footnote.
    Therefore if @footnotestyle separate is set late in the document the current
    value may not be consistent with the link obtained for the footnote
    formatted text.  This is not an issue, as the manual says that
    @footnotestyle should only appear in the preamble, and it makes sense
    to have something consistent in the whole document for footnotes position.
   */
  prepare_special_units (self, output_units_descriptor);

  /* reset to the default */
  set_global_document_commands (self, CL_before, conf_for_special_units);

  self->document->modified_information |= F_DOCM_output_units;
}



/* prepare HTML targets for nodes, floats, sections, footnotes, heading
   commands, index entries and special output units.  Also prepare
   normalized file names for root commands.

   Both for output() and convert().
   NOTE: in Perl done in prepare_conversion_units, separated here to
   be able, in XS, to setup some Perl data between html_prepare_conversion_units
   and html_prepare_conversion_units_targets.
 */

int
html_id_is_registered (CONVERTER *self, const char *string)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  return is_c_hashmap_registered (self_html->registered_ids_c_hashmap, string);
}

void
html_register_id (CONVERTER *self, const char *string,
                  const void *element_target)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  c_hashmap_register (self_html->registered_ids_c_hashmap, string,
                      element_target);
}

/* used for diverse elements: tree units, indices, footnotes, special
  elements, contents elements... */
static HTML_TARGET *
add_element_target_to_list (HTML_TARGET_LIST *targets,
                            const ELEMENT *element, const char *target)
{
  HTML_TARGET *element_target;

  if (targets->number == targets->space)
    {
      targets->list = realloc (targets->list,
                   sizeof (HTML_TARGET *) * (targets->space += 5));
    }
  element_target = (HTML_TARGET *) malloc (sizeof (HTML_TARGET));
  targets->list[targets->number] = element_target;
  memset (element_target, 0, sizeof (HTML_TARGET));
  element_target->element = element;
  if (target)
    element_target->target = strdup (target);

  targets->number++;
  return element_target;
}

/* setup a list per command id.  Note that elements associated to targets
   without cmd are all associated to 0.  This is the case for the special
   units associated elements with type ET_special_unit_element and cmd 0 */
static HTML_TARGET *
add_element_target (CONVERTER *self, const ELEMENT *element,
                    const char *target)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  enum command_id cmd = element_builtin_cmd (element);
  HTML_TARGET_LIST *targets = &self_html->html_targets[cmd];
  return add_element_target_to_list (targets, element, target);
}

static HTML_TARGET *
add_special_target (CONVERTER *self, enum special_target_type type,
                    const ELEMENT *element, const char *target)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  HTML_TARGET_LIST *targets = &self_html->html_special_targets[type];
  return add_element_target_to_list (targets, element, target);
}

static char *
unique_target (CONVERTER *self, const char *target_base)
{
  int nr = 1;
  char *target = strdup (target_base);
  while (1)
    {
      if (html_id_is_registered (self, target))
        {
          free (target);
          xasprintf (&target, "%s-%d", target_base, nr);
          nr++;
          if (nr == 0)
            fatal ("overflow");
        }
      else
        return target;
    }
}

/* calls customization function requiring output units */
static void
set_special_units_targets_files (CONVERTER *self, const char *document_name)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  size_t i;
  TEXT text_name;
  const OUTPUT_UNIT_LIST *special_units = retrieve_output_units
    (self->document, self_html->output_units_descriptors[OUDT_special_units]);

  const char *extension = "";
  if (self->conf->EXTENSION.o.string)
    extension = self->conf->EXTENSION.o.string;

  text_init (&text_name);

  for (i = 0; i < special_units->number; i++)
    {
      TARGET_FILENAME *target_filename;
      char *default_filename = 0;
      char *filename = 0;
      const OUTPUT_UNIT *special_unit = special_units->list[i];
      const char *special_unit_variety = special_unit->special_unit_variety;

      /* refers to self_html->special_unit_info */
      const char *target = html_special_unit_info (self, SUI_type_target,
                                                   special_unit_variety);

      if (!target)
        continue;

      if (((self->conf->SPLIT.o.string && strlen (self->conf->SPLIT.o.string))
           || self->conf->MONOLITHIC.o.integer <= 0)
    /* in general document_name not defined means called through convert */
          && document_name)
        {
          const char *special_unit_file_string
            = html_special_unit_info (self, SUI_type_file_string,
                                      special_unit_variety);
          text_reset (&text_name);
          if (!special_unit_file_string)
            special_unit_file_string = "";
          text_append (&text_name, document_name);
          text_append (&text_name, special_unit_file_string);
          if (extension && strlen (extension))
            {
              text_append (&text_name, ".");
              text_append (&text_name, extension);
            }
          default_filename = strdup (text_name.text);
        }
      target_filename = call_file_id_setting_special_unit_target_file_name (
                               self, special_unit, target, default_filename);
      if (target_filename)
        {
          if (target_filename->target)
            target = target_filename->target;
          if (target_filename->filename)
            {
              filename = target_filename->filename;
              free (default_filename);
            }
          else
            filename = default_filename;
        }
      else
        filename = default_filename;

      if (self->conf->DEBUG.o.integer > 0)
        {
          const char *fileout = filename;
          if (!fileout)
            fileout = "UNDEF";
          fprintf (stderr, "C|Add special %s: target %s,\n    filename %s\n",
                            special_unit_variety, target, fileout);
        }

      HTML_TARGET *element_target
        = add_element_target (self, special_unit->uc.special_unit_command,
                              target);
      element_target->special_unit_filename = filename;
      html_register_id (self, target, element_target);

      if (target_filename)
        {
          if (target_filename->target)
            free (target_filename->target);

          free (target_filename);
        }
    }
  free (text_name.text);
}

/* calls customization function requiring output units */
static void
prepare_associated_special_units_targets (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  const OUTPUT_UNIT_LIST *associated_special_units = retrieve_output_units
   (self->document,
    self_html->output_units_descriptors[OUDT_associated_special_units]);

  if (associated_special_units && associated_special_units->number > 0)
    {
      size_t i;
      for (i = 0; i < associated_special_units->number; i++)
        {
          HTML_TARGET *element_target;
          TARGET_FILENAME *target_filename;
          char *filename = 0;
          const OUTPUT_UNIT *special_unit = associated_special_units->list[i];
          const char *special_unit_variety = special_unit->special_unit_variety;

          /* it may be undef'ined in user customization code */
          const char *target = html_special_unit_info (self, SUI_type_target,
                                                       special_unit_variety);
          target_filename
            = call_file_id_setting_special_unit_target_file_name (
                               self, special_unit, target, filename);
          if (target_filename)
            {
              if (target_filename->target)
                target = target_filename->target;
              if (target_filename->filename)
                filename = target_filename->filename;
            }

          if (self->conf->DEBUG.o.integer > 0)
            {
              const char *str_filename;
              const char *str_target;
              if (filename)
                str_filename = filename;
              else
                str_filename = "UNDEF (default)";
              if (target)
                str_target = target;
              else
                str_target = "UNDEF";
              fprintf (stderr, "C|Add content %s: target %s,\n"
                                "    filename %s\n", special_unit_variety,
                                str_target, str_filename);
            }
          element_target
           = add_element_target (self, special_unit->uc.special_unit_command,
             target);
          if (target)
            html_register_id (self, target, element_target);
          if (filename)
            element_target->special_unit_filename = filename;

          if (target_filename)
            {
              if (target_filename->target)
                free (target_filename->target);

              free (target_filename);
            }
        }
    }
}

/* calls customization function requiring elements */
/* also used for xrefname, although there is no reason to use the associated
   target, as for xrefname only the text is of interest */
static void
new_sectioning_command_target (CONVERTER *self, const ELEMENT *command)
{
  char *normalized_name;
  char *filename;
  char *target_base;
  char *target;
  char *target_contents = 0;
  char *target_shortcontents = 0;
  TARGET_CONTENTS_FILENAME *target_contents_filename;
  /* should not be needed for a sectioning command, as it should not
     be possible for that command to be a user-defined command,
     but it is better to be consistent, and it may change in the future */
  enum command_id data_cmd = element_builtin_data_cmd (command);
  unsigned long flags = command_data[data_cmd].flags;
  HTML_TARGET *element_target = 0;

  const char *identifier = lookup_extra_string (command, AI_key_identifier);

  if (identifier)
    {
 /* case of a sectioning command that is also a target for cross-references. */
      int found;
      HTML_CONVERTER_STATE *self_html = self->html_converter;
      /* target are in the registered_ids_c_hashmap, not identifiers */
      char *target_str = html_normalized_to_id (identifier);

      /* cast to drop const */
      element_target
        = (HTML_TARGET *) c_hashmap_value (self_html->registered_ids_c_hashmap,
                                           target_str, &found);
      free (target_str);
      /*
      fprintf (stderr, "HHHH %s %s\n", identifier, tree_print_details (command, 0, 0));
       */
      target = strdup (element_target->target);
      filename = strdup (element_target->node_filename);
      normalized_name = strdup (identifier);
    }
  else
    {
      TARGET_FILENAME *target_filename
        = normalized_sectioning_command_filename (self, command);

      normalized_name = target_filename->target;
      filename = target_filename->filename;

      free (target_filename);

      target_base = html_normalized_to_id (normalized_name);

      if (!strlen (target_base) && command->e.c->cmd == CM_top)
        {
    /* @top is allowed to be empty.  In that case it gets this target name */
          free (target_base);
          target_base = strdup ("SEC_Top");
          free (normalized_name);
          normalized_name = strdup (target_base);
        }

      if (strlen (target_base))
        target = unique_target (self, target_base);
      else
        target = strdup ("");

      free (target_base);
    }

  if (strlen (target)
      && (flags & CF_sectioning_heading))
    {
      char *target_base_contents;
      char *target_base_shortcontents;
      xasprintf (&target_base_contents, "toc-%s", normalized_name);
      target_contents = unique_target (self, target_base_contents);
      free (target_base_contents);

      xasprintf (&target_base_shortcontents, "stoc-%s", normalized_name);
      target_shortcontents = unique_target (self, target_base_shortcontents);
      free (target_base_shortcontents);
    }

  free (normalized_name);

  target_contents_filename
    = call_file_id_setting_sectioning_command_target_name (self, command,
                  target, target_contents, target_shortcontents, filename);
  if (target_contents_filename)
    {
      free (target);
      target = target_contents_filename->target;
      free (filename);
      filename = target_contents_filename->filename;
      free (target_contents);
      target_contents = target_contents_filename->target_contents;
      free (target_shortcontents);
      target_shortcontents = target_contents_filename->target_shortcontents;

      free (target_contents_filename);
    }

  if (!element_target)
    {
      if (self->conf->DEBUG.o.integer > 0)
        {
          const char *command_name = element_command_name (command);
          fprintf (stderr, "C|Register %s %s\n", command_name, target);
        }
      element_target = add_element_target (self, command, target);
      html_register_id (self, target, element_target);
    }
  else
    {
    /* reset in case they were modified by the user. */
      free (element_target->target);
      element_target->target = strdup (target);
      free (element_target->node_filename);
      element_target->node_filename = strdup (filename);
    }

  element_target->section_filename = filename;

  free (target);

  if (target_contents)
    {
      element_target->contents_target = target_contents;
      html_register_id (self, target_contents, 0);
    }
  else
    element_target->contents_target = strdup ("");

  if (target_shortcontents)
    {
      element_target->shortcontents_target = target_shortcontents;
      html_register_id (self, target_shortcontents, 0);
    }
  else
    element_target->shortcontents_target = strdup ("");
}

/* calls customization function requiring elements */
/*
 This set with two different codes
  * the target information, id and normalized filename of 'identifiers_target',
    ie everything that may be the target of a ref, @node, @float label,
    @anchor, @namedanchor and sectioning commands without associated node.
  * The target information of sectioning elements.  Sectioning commands
    without associated node are processed a second time, to set specific
    sectioning command information.
 @node and section commands targets are therefore both set.

 conversion to HTML is done on-demand, upon call to command_text
 and similar functions.
 Note that 'node_filename', which is set here for Top target information
 too, is not used later for Top anchors or links, see the NOTE below
 associated with setting TOP_NODE_FILE_TARGET.
 */
static void
set_root_commands_targets_node_files (CONVERTER *self)
{

  if (identifiers_target_number (&self->document->identifiers_target))
    {
      const char *extension = 0;

      if (self->conf->EXTENSION.o.string)
        extension = self->conf->EXTENSION.o.string;
      /* use labels_list and not identifiers_target to process in the
         document order */
      const LABEL_LIST *label_targets = &self->document->labels_list;
      size_t i;
      for (i = 0; i < label_targets->number; i++)
        {
          int called = 0;
          char *target;
          char *node_filename;
          char *user_node_filename;
          const ELEMENT *label_element;
          const ELEMENT *target_element;
          const LABEL *label = &label_targets->list[i];

          if (!label->identifier || label->reference)
            continue;

          target_element = label->element;
          label_element = get_label_element (target_element);

          TARGET_FILENAME *target_filename =
              html_normalized_label_id_file (self, label->identifier,
                                             label_element);
          target = target_filename->target;
          if (extension)
            xasprintf (&node_filename, "%s.%s", target_filename->filename,
                                                extension);
          else
            node_filename = strdup (target_filename->filename);

          free (target_filename->filename);
          free (target_filename);

          /* a non defined filename is ok if called with convert, but not
             if output in files.  We reset if undef, silently unless verbose
             in case called by convert. */

          user_node_filename = call_file_id_setting_node_file_name (self,
                                               target_element, node_filename,
                                               &called);
          if (user_node_filename)
            {
              free (node_filename);
              node_filename = user_node_filename;
            }
          else if (called)
            {
              if (self->conf->VERBOSE.o.integer > 0)
                {
                  message_list_document_warn (&self->error_messages, self->conf,
                             0, "user-defined node file name not set for `%s'",
                             node_filename);
                }
              else if (self->conf->DEBUG.o.integer > 0)
                {
                  fprintf (stderr,
                     "C|user-defined node file name undef for `%s'\n",
                       node_filename);
                }
            }

          if (self->conf->DEBUG.o.integer > 0)
            {
              const char *command_name = element_command_name (target_element);
              fprintf (stderr, "C|Label @%s %s, %s\n", command_name, target,
                               node_filename);
            }

          HTML_TARGET *element_target
            = add_element_target (self, target_element, target);
          element_target->node_filename = node_filename;
          html_register_id (self, target, element_target);

          free (target);
        }
    }

  if (self->document->sections_list.number > 0)
    {
      size_t i;
      for (i = 0; i < self->document->sections_list.number; i++)
        {
          const SECTION_RELATIONS *section_relations
            = self->document->sections_list.list[i];
          const ELEMENT *section_element = section_relations->element;
          new_sectioning_command_target (self, section_element);
        }
    }
}

static void
prepare_index_entries_targets (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  if (self->document->indices_info.number > 0)
    {
      size_t i;
      self_html->shared_conversion_state.formatted_index_entries
        = (int **) malloc (self->sorted_index_names.number * sizeof (int *));

      for (i = 0; i < self->sorted_index_names.number; i++)
        {
          size_t j;
          const INDEX *idx = self->sorted_index_names.list[i];
          /* no need to test for idx->entries_number > 0 as indices without
             entries are not kept in sorted_index_names. */
          self_html->shared_conversion_state.formatted_index_entries[i]
            = (int *) malloc (idx->entries_number * sizeof (int));
          memset (self_html->shared_conversion_state.formatted_index_entries[i],
                  0, idx->entries_number * sizeof (int));
          for (j = 0; j < idx->entries_number; j++)
            {
              const INDEX_ENTRY *index_entry;
              const ELEMENT *main_entry_element;
              const ELEMENT *seeentry;
              const ELEMENT *seealso;
              /* not modified, but cannot be explicit const as it is inserted
                 in an array of non-const elements */
              ELEMENT *entry_reference_content_element;
              ELEMENT *normalize_index_element;
              ELEMENT_LIST *subentries_tree;
              const ELEMENT *target_element;
              TEXT target_base;
              char *normalized_index;
              const char *region;
              char *target;

              index_entry = &idx->index_entries[j];
              main_entry_element = index_entry->entry_element;
              seeentry = index_entry_referred_entry (main_entry_element,
                                                     CM_seeentry);
              if (seeentry)
                continue;
              seealso = index_entry_referred_entry (main_entry_element,
                                                    CM_seealso);
              if (seealso)
                continue;

              region = lookup_extra_string (main_entry_element,
                                            AI_key_element_region);
              entry_reference_content_element
               = converter_index_content_element (main_entry_element, self, 1);
        /* construct element to convert to a normalized identifier to use as
           hrefs target */
              normalize_index_element = new_element (ET_NONE);
              add_to_contents_as_array (normalize_index_element,
                                        entry_reference_content_element);

              subentries_tree
               = comma_index_subentries_tree (main_entry_element, " ");
              if (subentries_tree)
                {
                  insert_list_slice_into_contents (normalize_index_element,
                                   normalize_index_element->e.c->contents.number,
                                   subentries_tree, 0,
                                   subentries_tree->number);
                }
              normalized_index
                = convert_to_identifier (normalize_index_element);

              destroy_element (normalize_index_element);
              if (subentries_tree)
                free_comma_index_subentries_tree (subentries_tree);

              destroy_element_and_children (entry_reference_content_element);

              text_init (&target_base);
              text_append (&target_base, "index-");
              if (region)
                {
                  text_append (&target_base, region);
                  text_append (&target_base, "-");
                }
              text_append (&target_base, normalized_index);
              free (normalized_index);
              target = unique_target (self, target_base.text);
              free (target_base.text);
              if (index_entry->entry_associated_element)
                target_element = index_entry->entry_associated_element;
              else
                target_element = main_entry_element;

              add_element_target (self, target_element, target);
              html_register_id (self, target, 0);

              free (target);
            }
        }
    }
}

static int
compare_footnote_id (const void *a, const void *b)
{
  const FOOTNOTE_ID_NUMBER *fid_a = (const FOOTNOTE_ID_NUMBER *) a;
  const FOOTNOTE_ID_NUMBER *fid_b = (const FOOTNOTE_ID_NUMBER *) b;

  return strcmp (fid_a->footnote_id, fid_b->footnote_id);
}

static const char *footid_base = "FOOT";
static const char *docid_base = "DOCF";

static void
prepare_footnotes_targets (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  const ELEMENT_LIST *global_footnotes
    = &self->document->global_commands.footnotes;

  self_html->shared_conversion_state.footnote_number = 0;

  if (global_footnotes->number > 0)
    {
      size_t i;
      self_html->shared_conversion_state.footnote_id_numbers
        = (FOOTNOTE_ID_NUMBER *) malloc (global_footnotes->number *
                                         sizeof (FOOTNOTE_ID_NUMBER));
      for (i = 0; i < global_footnotes->number; i++)
        {
          const HTML_TARGET *element_target;
          const ELEMENT *footnote = global_footnotes->list[i];
          TEXT footid;
          TEXT docid;
          int nr = i+1;

          text_init (&footid);
          text_init (&docid);
          text_printf (&footid, "%s%d", footid_base, nr);
          text_printf (&docid, "%s%d", docid_base, nr);

          while (1)
            {
              if (html_id_is_registered (self, footid.text)
                    || html_id_is_registered (self, docid.text))
                {
                  nr++;
                  if (nr == 0)
                    fatal ("overflow footnote target nr");

                  text_init (&footid);
                  text_init (&docid);
                  text_printf (&footid, "%s%d", footid_base, nr);
                  text_printf (&docid, "%s%d", docid_base, nr);
                }
              else
                break;
            }
          html_register_id (self, footid.text, 0);
          html_register_id (self, docid.text, 0);

          element_target = add_element_target (self, footnote, footid.text);
          add_special_target (self, ST_footnote_location, footnote,
                              docid.text);

          if (self->conf->DEBUG.o.integer > 0)
            {
              char *footnote_txi = convert_to_texinfo (footnote);
              fprintf (stderr, "C|Enter footnote: target %s, nr %d\n%s\n",
                       footid.text, nr, footnote_txi);
              free (footnote_txi);
            }
          self_html->shared_conversion_state.footnote_id_numbers[i].footnote_id
             = element_target->target;
          self_html->shared_conversion_state.footnote_id_numbers[i].number = 0;
          free (footid.text);
          free (docid.text);
        }
      qsort (self_html->shared_conversion_state.footnote_id_numbers,
             global_footnotes->number,
             sizeof (FOOTNOTE_ID_NUMBER), compare_footnote_id);
    }
}

/* keep the heading command names sorted alphabetically followed by
   xrefname to match order in perl */
static const enum command_id heading_commands_list[] = {
  CM_chapheading, CM_heading, CM_majorheading, CM_subheading,
  CM_subsubheading, CM_xrefname,
  0,
};

/* indirectly calls customization function requiring elements */
static void
set_heading_commands_targets (CONVERTER *self)
{
  int i;
  for (i = 0; heading_commands_list[i]; i++)
    {
      enum command_id cmd = heading_commands_list[i];
      const ELEMENT_LIST *global_command
        = get_cmd_global_multi_command (&self->document->global_commands, cmd);

      if (global_command->number > 0)
        {
          size_t j;
          for (j = 0; j < global_command->number; j++)
            {
              const ELEMENT *command = global_command->list[j];
              new_sectioning_command_target (self, command);
            }
        }
    }
}

/* duplicate in format_html.c */
static int
compare_element_target (const void *a, const void *b)
{
  const HTML_TARGET **ete_a = (const HTML_TARGET **) a;
  const HTML_TARGET **ete_b = (const HTML_TARGET **) b;
  /* we cast to uintptr_t because comparison of pointers from different
     objects is undefined behaviour in C.  In practice it is probably
     not an issue */
  uintptr_t a_element_addr = (uintptr_t)(*ete_a)->element;
  uintptr_t b_element_addr = (uintptr_t)(*ete_b)->element;

  return (a_element_addr > b_element_addr) - (a_element_addr < b_element_addr);
}

/* For debug/check/optimization
   used to check to what extent the targets are already ordered.
   Return the number of elements ordered ok with respect to the
   previous element
 */
size_t
check_targets_order (enum command_id cmd, HTML_TARGET_LIST *element_targets)
{
  size_t i;
  size_t result = 0;
  if (element_targets->number <= 1)
    return result;
  for (i = 1; i < element_targets->number; i++)
    {
      if (compare_element_target (element_targets->list[i-1],
                                  element_targets->list[i]) > 0)
        {
          fprintf (stderr, "no %s %zu %"PRIuPTR" %p %s %zu %"PRIuPTR" %p %s\n",
           builtin_command_name (cmd), i-1,
           (uintptr_t)element_targets->list[i-1]->element,
           element_targets->list[i-1]->element,
           element_targets->list[i-1]->target,
           i, (uintptr_t)element_targets->list[i]->element,
           element_targets->list[i]->element, element_targets->list[i]->target);
        }
      else
        result++;
    }
  return result;
}

/* It may not be efficient to sort and find back with bsearch if there is
   a small number of elements.  However, some target elements are more
   likely to already be ordered when they are accessed in their order of
   appearance in the document.  There is no guarantee, as it is only in the
   same array that adresses are guaranteed to be increasing.  A check done
   in 2024 with gcc, using check_targets_order, and also looking at the
   address of newly allocated elements shows that elements are
   not that much allocated in order.  However, overall, the addresses are
   more in order when elements are accessed in the document order.
   For indices, it is not really possible to get them in document order,
   within an index they are in document order, but not across indices.
   The other data are in document order, for nodes and similar because
   the labels list is used instead of identifiers_target on purpose.
 */
static void
sort_cmd_targets (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  enum command_id cmd;
  int type;

  /* holds the commands with targets that have been allocated, not only
     those with actual targets.  There is a difference only if the
     converter is reused */
  self_html->html_target_cmds.number = 0;

  for (cmd = 0; cmd < BUILTIN_CMD_NUMBER; cmd++)
    {
      if (self_html->html_targets[cmd].number > 0)
        {
          HTML_TARGET_LIST *element_targets = &self_html->html_targets[cmd];
           /* to check the order
          size_t ordered_items = check_targets_order (cmd, element_targets);
          fprintf (stderr, "ORDER %s %zu / %zu\n", builtin_command_name (cmd),
                   ordered_items, element_targets->number -1);
            */
          qsort (element_targets->list,
                 element_targets->number,
                 sizeof (HTML_TARGET *), compare_element_target);
          add_(command) (&self_html->html_target_cmds, cmd);
        }
      else if (self_html->html_targets[cmd].space > 0)
        add_(command) (&self_html->html_target_cmds, cmd);
    }
  for (type = 0; type < ST_footnote_location+1; type++)
    {
     if (self_html->html_special_targets[type].number > 0)
        {
          HTML_TARGET_LIST *element_targets
            = &self_html->html_special_targets[type];
          qsort (element_targets->list,
                 element_targets->number,
                 sizeof (HTML_TARGET *), compare_element_target);
        }
    }
}

/* return the approximate number of targets for that manual */
static size_t
ids_hashmap_predicted_values (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t sectioning_commands_nr;
  size_t index_entries_nr = 0;
  size_t heading_commands_nr = 0;
  size_t i;

  OUTPUT_UNIT_LIST *special_units = retrieve_output_units
    (self->document, self_html->output_units_descriptors[OUDT_special_units]);
  OUTPUT_UNIT_LIST *associated_special_units = retrieve_output_units
   (self->document,
    self_html->output_units_descriptors[OUDT_associated_special_units]);

  sectioning_commands_nr = self->document->sections_list.number;

  if (self->document->indices_info.number > 0)
    {
      size_t i;
      for (i = 0; i < self->sorted_index_names.number; i++)
        index_entries_nr += self->sorted_index_names.list[i]->entries_number;
    }

  for (i = 0; heading_commands_list[i]; i++)
    {
      enum command_id cmd = heading_commands_list[i];
      const ELEMENT_LIST *global_command
        = get_cmd_global_multi_command (&self->document->global_commands, cmd);
      heading_commands_nr += global_command->number;
    }

  return special_units->number + associated_special_units->number
   + identifiers_target_number (&self->document->identifiers_target)
   + 3 * sectioning_commands_nr
   + heading_commands_nr
   + index_entries_nr
   + self->document->global_commands.footnotes.number * 2;
}

/* indirectly calls all the functions calling customization function
   requiring elements and output units except for external nodes formatting */
/* for conversion units except for associated special units that require
   files for document units to be set */
/* does not modify the structures the labels are prepared for (output units,
   command elements, index entries...) */
void
html_prepare_conversion_units_targets (CONVERTER *self,
                                       const char *document_name)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t predicted_values = ids_hashmap_predicted_values (self);

  /* Not done as in Perl in conversion initialization, to be able to
     have correctly predicted number of id */
  if (self_html->registered_ids_c_hashmap)
    {
      clear_c_hashmap (self_html->registered_ids_c_hashmap);
      init_c_hashmap (self_html->registered_ids_c_hashmap, predicted_values);
    }
  else
    self_html->registered_ids_c_hashmap = new_c_hashmap (predicted_values);

  /*
   Do that before the other elements, to be sure that special page ids
   are registered before elements id are.
   */
  set_special_units_targets_files (self, document_name);

  prepare_associated_special_units_targets (self);

  set_root_commands_targets_node_files (self);

  prepare_index_entries_targets (self);
  prepare_footnotes_targets (self);

  set_heading_commands_targets (self);

  sort_cmd_targets (self);
}



/* For output() prepare pages and associate them to files, setup unit
   direction and file counters.  In that case
   html_prepare_output_units_global_targets is called in
   html_prepare_units_directions_files.

   For convert() html_prepare_output_units_global_targets only is called.
 */

/* Associate output units to the global targets, First, Last, Top, Index.
   and special output units */
void
html_prepare_output_units_global_targets (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  int i;
  int all_special_units_nr = 0;
  int s;
  const SECTION_RELATIONS_LIST *sections_list = &self->document->sections_list;

  const OUTPUT_UNIT_LIST *output_units = retrieve_output_units
   (self->document, self_html->output_units_descriptors[OUDT_units]);

  const OUTPUT_UNIT *top_output_unit = html_get_top_unit (self->document,
                                                          output_units);

  size_t special_output_units_lists[2] = {
    self_html->output_units_descriptors[OUDT_special_units],
    self_html->output_units_descriptors[OUDT_associated_special_units]};

  self_html->global_units_directions[D_First] = output_units->list[0];
  self_html->global_units_directions[D_Last]
    = output_units->list[output_units->number - 1];

  self_html->global_units_directions[D_Top] = top_output_unit;

  /*
  Associate Index with the last @printindex.  According to Werner Lemberg,
  "the most general index is normally the last one, not the first"
  https://lists.gnu.org/archive/html/bug-texinfo/2025-01/msg00019.html
   */
  /* It is always the last printindex, even if it is not output (for example
     it is in @copying and @titlepage, which are certainly wrong constructs).
   */
  if (self->document->global_commands.printindex.number > 0)
    {
      const ELEMENT *printindex
        = self->document->global_commands.printindex.list[
               self->document->global_commands.printindex.number -1];
      ROOT_AND_UNIT *root_unit
        = html_get_tree_root_element (self, printindex, 0);
      if (root_unit->output_unit)
        {
          const OUTPUT_UNIT *document_unit = root_unit->output_unit;
          const ELEMENT *root_command = root_unit->root;
          if (root_command && root_command->e.c->cmd != CM_NONE)
            {
              const SECTION_RELATIONS *section_relations = 0;
              int status;
              if (root_command->e.c->cmd == CM_node)
                {
                  size_t node_number
                    = lookup_extra_integer (root_command,
                                            AI_key_node_number, &status);
                  const NODE_RELATIONS *node_relations
                    = self->document->nodes_list.list[node_number -1];

                  if (node_relations->associated_section)
                    section_relations = node_relations->associated_section;
                }
              else
                {
                  size_t section_number
                        = lookup_extra_integer (root_command,
                                         AI_key_section_number, &status);
                  section_relations
                    = sections_list->list[section_number -1];
                }
       /* find the first level 1 sectioning element to associate the printindex
           with */
              if (section_relations)
                {
                  int status;
                  while (1)
                    {
                      int section_level
                        = lookup_extra_integer (section_relations->element,
                                            AI_key_section_level, &status);
                      if (!status && section_level <= 1)
                        break;

                      const SECTION_RELATIONS * const *up_section_directions
                        = section_relations->section_directions;
                      if (up_section_directions
                          && up_section_directions[D_up]
                          && up_section_directions[D_up]
                                ->element->e.c->associated_unit)
                        {
                          section_relations = up_section_directions[D_up];
                          document_unit
                            = section_relations->element->e.c->associated_unit;
                        }
                      else
                        break;
                    }
                }
            }
          self_html->global_units_directions[D_Index] = document_unit;
        }
      free (root_unit);
    }

  if (self_html->customized_global_units_directions.number > 0)
    {
      size_t l;
      for (l = 0; l < self_html->customized_global_units_directions.number; l++)
        {
          const ELEMENT *node_element = 0;
          const DIRECTION_NODE_NAME *direction_node_name
            = &self_html->customized_global_units_directions.list[l];
          size_t global_directions_idx;
          DOCUMENT *label_document;
          ELEMENT *label_tree;

          if (direction_node_name->direction_nr == 0)
            {
              /*
              fprintf (stderr, "CUSTOM DIRECTION: Not setting %zu %s %s\n", l,
                                direction_node_name->direction,
                                direction_node_name->node_name);
               */
              continue;
            }
          else if (direction_node_name->direction_nr
                               <= DEFAULT_GLOBAL_DIRECTION_LAST_IDX+1)
            /* replace a default global direction */
            global_directions_idx = direction_node_name->direction_nr -1;
          else if (direction_node_name->direction_nr
                      > NON_SPECIAL_DIRECTIONS_NR)
            {
            /* additional global direction, with/after special units */
              global_directions_idx = DEFAULT_GLOBAL_DIRECTION_LAST_IDX
               + (direction_node_name->direction_nr - NON_SPECIAL_DIRECTIONS_NR);
            }
          else
            {
              /* Should not be possible, as direction_node_name->direction_nr
                 should have been left to 0 above or in
                 html_set_global_direction */
              char *message;
              xasprintf (&message,
                         "Replacing relative direction %zu: %zu %s (%s `%s')",
                         l, direction_node_name->direction_nr,
                         self_html->main_units_direction_names[
                                    direction_node_name->direction_nr -1],
                         direction_node_name->direction,
                         direction_node_name->node_name);
              fatal (message);
              free (message);
            }

          /* Determine the document unit corresponding to the direction
             node name Texinfo code */

          /* Parse the customized direction node name Texinfo code */
          /* same as creating a new parser in Perl */
          reset_parser_conf ();
          parser_conf_set_NO_INDEX (1);
          parser_conf_set_NO_USER_COMMANDS (1);

          label_document
            = parse_string (direction_node_name->node_name, 1);
          if (label_document->parser_error_messages.number > 0)
            {
              const ERROR_MESSAGE_LIST *error_messages
                = &label_document->parser_error_messages;
              size_t j;
              fprintf (stderr, "Global %s node name parsing %zu error(s)\n",
                       direction_node_name->direction,
                       error_messages->number);
              fprintf (stderr, "node name: %s\n",
                               direction_node_name->node_name);
              fprintf (stderr, "Error messages: \n");
              for (j = 0; j < error_messages->number; j++)
                fprintf (stderr, "%s", error_messages->list[j].error_line);
            }
          wipe_document_parser_errors (label_document);
          label_tree = unregister_document_merge_with_document (
                                   label_document, self->document);

          /* convert to identifier and determine the node element target */
          if (label_tree)
            {
              char *normalized_node = convert_to_node_identifier (label_tree);
              if (normalized_node)
                {
                  const char *non_hyphen_char = normalized_node
                                     + strspn (normalized_node, "-");
                  if (*non_hyphen_char)
                    {
                      node_element = find_identifier_target (
                                     &self->document->identifiers_target,
                                        normalized_node);
                    }
                  free (normalized_node);
                }
              destroy_element_and_children (label_tree);
            }
          if (!node_element)
            {
              message_list_document_warn (&self->error_messages,
                                                  self->conf, 0,
                                "could not find %s node `%s'",
                             direction_node_name->direction,
                             direction_node_name->node_name);
            }
          else
            self_html->global_units_directions[global_directions_idx]
              = node_element->e.c->associated_unit;
        }
    }

  if (self->conf->DEBUG.o.integer > 0)
    {
      int i;
      fprintf (stderr, "C|GLOBAL DIRECTIONS:\n");
      for (i = 0; i < DEFAULT_GLOBAL_DIRECTION_LAST_IDX+1; i++)
        {
          if (self_html->global_units_directions[i])
            {
              const OUTPUT_UNIT *global_unit = self_html->global_units_directions[i];
              char *unit_texi = output_unit_texi (global_unit);
              fprintf (stderr, " %s: %s\n", html_global_unit_direction_names[i],
                                            unit_texi);
              free (unit_texi);
            }
        }
      fprintf (stderr, "C|TEXT DIRECTIONS:\n");
      for (i = DEFAULT_GLOBAL_DIRECTION_LAST_IDX+1;
           i < DEFAULT_TEXT_DIRECTION_LAST_IDX+1; i++)
        {
          const char *name = html_direction_string (self, i, TDS_type_button,
                                                    TDS_context_normal);
          if (name)
            fprintf (stderr, " %s {%s}\n", html_global_unit_direction_names[i],
                                           name);
        }
      fprintf (stderr, "\n");
    }

  /* In addition to setting global_units_directions as in Perl,
     determine total number of special output units and fill
     special_units_direction_names.  Used to setup the complete
     list of global output units based on a direction name.
   */
  for (i = 0; i < 2; i++)
    {
      size_t special_units_descriptor = special_output_units_lists[i];
      const OUTPUT_UNIT_LIST *units_list
       = retrieve_output_units (self->document, special_units_descriptor);
      if (units_list && units_list->number)
        all_special_units_nr += units_list->number;
    }

  self_html->special_units_direction_names = (SPECIAL_UNIT_DIRECTION *)
    realloc (self_html->special_units_direction_names,
             sizeof (SPECIAL_UNIT_DIRECTION) * (all_special_units_nr+1));
  memset (self_html->special_units_direction_names, 0,
          sizeof (SPECIAL_UNIT_DIRECTION) * (all_special_units_nr+1));

  s = 0;
  for (i = 0; i < 2; i++)
    {
      size_t special_units_descriptor = special_output_units_lists[i];
      const OUTPUT_UNIT_LIST *units_list
        = retrieve_output_units (self->document, special_units_descriptor);
      if (units_list && units_list->number)
        {
          size_t j;
          for (j = 0; j < units_list->number; j++)
            {
              const OUTPUT_UNIT *special_unit = units_list->list[j];
              const char *special_unit_variety
                = special_unit->special_unit_variety;
              int special_unit_direction_index
                = html_special_unit_variety_direction_index (self,
                                                special_unit_variety);
              self_html->global_units_directions[special_unit_direction_index]
                = special_unit;

              self_html->special_units_direction_names[s].output_unit = special_unit;
              self_html->special_units_direction_names[s].direction
                = html_special_unit_info (self, SUI_type_direction,
                                          special_unit_variety);
              s++;
            }
        }
    }
}

static int
compare_global_units_direction_name (const void *a, const void *b)
{
  const SPECIAL_UNIT_DIRECTION *gudn_a = (const SPECIAL_UNIT_DIRECTION *) a;
  const SPECIAL_UNIT_DIRECTION *gudn_b = (const SPECIAL_UNIT_DIRECTION *) b;

  return strcmp (gudn_a->direction, gudn_b->direction);
}

/* To find more easily a global output unit based on a direction name, for an
   XS interface, associate global output units to names and sort according
   to names.  Only called from Perl/XS, not needed when doing C only */
void
html_setup_global_units_direction_names (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  SPECIAL_UNIT_DIRECTION *global_units_directions_list;
  int i;
  int global_directions_nr = 0;
  int global_units_direction_idx = 0;
  const SPECIAL_UNIT_DIRECTION *special_units_direction_names
    = self_html->special_units_direction_names;

  for (i = 0; i < DEFAULT_GLOBAL_DIRECTION_LAST_IDX+1; i++)
    if (self_html->global_units_directions[i])
      global_directions_nr++;

  for (i = 0; special_units_direction_names[i].output_unit; i++)
    global_directions_nr++;

  if (self_html->customized_global_units_directions.number > 0)
    {
      size_t l;
      for (l = 0; l < self_html->customized_global_units_directions.number; l++)
        {
          DIRECTION_NODE_NAME *direction_node_name
            = &self_html->customized_global_units_directions.list[l];
          if (direction_node_name->direction_nr > NON_SPECIAL_DIRECTIONS_NR)
            global_directions_nr++;
        }
    }

  global_units_directions_list = (SPECIAL_UNIT_DIRECTION *)
   malloc (sizeof (SPECIAL_UNIT_DIRECTION) * (global_directions_nr));

  for (i = 0; i < DEFAULT_GLOBAL_DIRECTION_LAST_IDX+1; i++)
    {
      if (self_html->global_units_directions[i])
        {
          global_units_directions_list[global_units_direction_idx].direction
            = html_global_unit_direction_names[i];
          global_units_directions_list[global_units_direction_idx].output_unit
            = self_html->global_units_directions[i];
          global_units_direction_idx++;
        }
    }

  for (i = 0; special_units_direction_names[i].output_unit; i++)
    {
      global_units_directions_list[global_units_direction_idx].direction
        = special_units_direction_names[i].direction;
      global_units_directions_list[global_units_direction_idx].output_unit
        = special_units_direction_names[i].output_unit;
      global_units_direction_idx++;
    }

  if (self_html->customized_global_units_directions.number > 0)
    {
      size_t l;
      for (l = 0; l < self_html->customized_global_units_directions.number; l++)
        {
          DIRECTION_NODE_NAME *direction_node_name
            = &self_html->customized_global_units_directions.list[l];
          if (direction_node_name->direction_nr > NON_SPECIAL_DIRECTIONS_NR)
            {
              size_t global_directions_idx = DEFAULT_GLOBAL_DIRECTION_LAST_IDX
           + (direction_node_name->direction_nr - NON_SPECIAL_DIRECTIONS_NR);
              global_units_directions_list[global_units_direction_idx].direction
                = direction_node_name->direction;
              global_units_directions_list[global_units_direction_idx].output_unit
                = self_html->global_units_directions[global_directions_idx];
              global_units_direction_idx++;
            }
        }
    }

  qsort (global_units_directions_list,
         global_directions_nr,
         sizeof (SPECIAL_UNIT_DIRECTION), compare_global_units_direction_name);

  self_html->global_units_direction_names.list = global_units_directions_list;
  self_html->global_units_direction_names.number = global_directions_nr;
}

/* To find more easily a global text direction index based on a direction
   name, for an XS interface, associate global direction texts to names
   and sort according to names.  Only called from Perl/XS, not needed when
   doing C only */
void
html_setup_global_texts_direction_names (CONVERTER *self)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;
  size_t i;

  for (i = DEFAULT_GLOBAL_DIRECTION_LAST_IDX+1;
       i < DEFAULT_TEXT_DIRECTION_LAST_IDX+1; i++)
    {
      add_string (&self_html->global_texts_direction_names,
                  html_global_unit_direction_names[i]);
    }

  for (i = 0; i < self_html->customized_global_text_directions.number; i++)
    {
      add_string (&self_html->global_texts_direction_names,
                  self_html->customized_global_text_directions.list[i]);
    }

  sort_strings_list (&self_html->global_texts_direction_names);
}

void
html_reset_files_source_info (FILE_SOURCE_INFO_LIST *files_source_info)
{
  size_t i;
  for (i = 0; i < files_source_info->number; i++)
    {
      free (files_source_info->list[i].filename);
      free (files_source_info->list[i].path);
    }
  files_source_info->number = 0;
}

static char *
add_to_unit_file_name_paths (char **unit_file_name_paths,
                             const char *filename,
                             const OUTPUT_UNIT *output_unit)
{
  unit_file_name_paths[output_unit->index] = strdup (filename);

  return unit_file_name_paths[output_unit->index];
}

static void
html_initialize_pending_closes (CONVERTER *self, size_t number)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  if (self_html->pending_closes.space < number)
    {
      self_html->pending_closes.list = (STRING_LIST *)
        realloc (self_html->pending_closes.list, number * sizeof (STRING_LIST));
  /* The existing string stacks per file should already be empty, either because
     the code is consistent for opening and closing, or because they are
     emptied after the conversion (with an error message).

     Therefore, only the newly allocated string stacks per file are
     initialized.
   */
      memset (&self_html->pending_closes.list[self_html->pending_closes.space],
              0, (number - self_html->pending_closes.space)
                 * sizeof (STRING_LIST));
      self_html->pending_closes.space = number;
    }
  self_html->pending_closes.number = number;
}

static void
prepare_page_css (CONVERTER *self, size_t pages_number)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  /* 0 is for document_global_context_css, the remaining indices
     for the output unit files or the unique page with convert */
  size_t css_pages_number = pages_number +1;

  if (self_html->page_css.space < css_pages_number)
    {
      self_html->page_css.space = css_pages_number;
      self_html->page_css.list = (CSS_LIST *)
       realloc (self_html->page_css.list,
                self_html->page_css.space * sizeof (CSS_LIST));
    }

  memset (self_html->page_css.list, 0,
          css_pages_number * sizeof (CSS_LIST));

  self_html->page_css.number = css_pages_number;
}

/* setup a page (+global context) in case there are no files, ie called
   with convert or output with an empty string as filename. */
void
html_setup_output_simple_page (CONVERTER *self, const char *output_filename)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  NAME_NUMBER *page_name_number;

  free (self->output_unit_file_indices);
  self->output_unit_file_indices = 0;

  free (self_html->special_unit_file_indices);
  self_html->special_unit_file_indices = 0;

  prepare_page_css (self, 1);

  self_html->html_files_information.number = 1+1;
  self_html->html_files_information.list = (FILE_ASSOCIATED_INFO *)
       malloc (self_html->html_files_information.number
          * sizeof (FILE_ASSOCIATED_INFO));
  memset (self_html->html_files_information.list, 0,
          self_html->html_files_information.number * sizeof (FILE_ASSOCIATED_INFO));

  html_initialize_pending_closes (self, 1+1);

  allocate_name_number_list (&self->page_name_number, 1);

  page_name_number = &self->page_name_number.list[0];
  page_name_number->number = 1;
  page_name_number->name = output_filename;
}

/* calls customization function requiring output units */
static FILE_SOURCE_INFO_LIST *
html_set_pages_files (CONVERTER *self, const OUTPUT_UNIT_LIST *output_units,
                      const OUTPUT_UNIT_LIST *special_units,
                      const OUTPUT_UNIT_LIST *associated_special_units,
                      const char *output_file,
                      const char *destination_directory, const char *output_filename,
                      const char *document_name)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  FILE_SOURCE_INFO_LIST *files_source_info;
  char **unit_file_name_paths;
  size_t i;

  files_source_info = &self_html->files_source_info;

  unit_file_name_paths = (char **)
   malloc (output_units->number * sizeof (char *));
  memset (unit_file_name_paths, 0,
          output_units->number * sizeof (char *));

  if (!self->conf->SPLIT.o.string || !strlen (self->conf->SPLIT.o.string))
    {
      size_t i;
      html_add_to_files_source_info (files_source_info, output_filename,
                                     "special_file", "non_split", 0,
                                     output_file);
      for (i = 0; i < output_units->number; i++)
        {
          add_to_unit_file_name_paths (unit_file_name_paths,
                                       output_filename,
                                       output_units->list[i]);
        }
    }
  else
    {
      char *top_node_filename_str;
      const OUTPUT_UNIT *top_node_output_unit = 0;
      const char *extension = 0;
      const ELEMENT *top_node = 0;
      const ELEMENT *top_target_element = 0;
      size_t file_nr = 0;
      size_t i;

      /* first determine the top node file name. */
      if (identifiers_target_number (&self->document->identifiers_target))
        {
          top_target_element
              = find_identifier_target (&self->document->identifiers_target,
                                       "Top");
          if (top_target_element && top_target_element->e.c->cmd == CM_node)
            top_node = top_target_element;
        }

      top_node_filename_str = top_node_filename (self, document_name);

      if (top_node && top_node_filename_str)
        {
          top_node_output_unit = top_node->e.c->associated_unit;
          html_add_to_files_source_info (files_source_info,
                                        top_node_filename_str,
                                        "special_file", "Top", 0, 0);
          add_to_unit_file_name_paths (unit_file_name_paths,
                                       top_node_filename_str,
                                       top_node_output_unit);
        }

      if (self->conf->EXTENSION.o.string
          && strlen (self->conf->EXTENSION.o.string))
        extension = self->conf->EXTENSION.o.string;

      for (i = 0; i < output_units->number; i++)
        {
          const OUTPUT_UNIT *output_unit = output_units->list[i];
          const OUTPUT_UNIT *file_output_unit;
          const char *output_unit_file_name;
          /* For Top node. */
          if (top_node_output_unit && top_node_output_unit == output_unit)
            continue;

          file_output_unit = output_unit->first_in_page;
          output_unit_file_name
           = unit_file_name_paths[file_output_unit->index];
          if (!output_unit_file_name)
            {
              const char *node_filename = 0;
              size_t j;
              for (j = 0; j < file_output_unit->unit_contents.number; j++)
                {
                  const ELEMENT *root_command
                     = file_output_unit->unit_contents.list[j];
                  if (root_command->e.c->cmd == CM_node)
                    {
                      const ELEMENT *node_target = 0;
                      const char *normalized = lookup_extra_string (root_command,
                                                               AI_key_identifier);
                      if (normalized)
                        node_target
                         = find_identifier_target (
                                  &self->document->identifiers_target,
                                  normalized);
                   /* double node are not normalized, they are handled here */
                      if (!node_target)
                        {
                          const FILE_SOURCE_INFO *file_source_info = 0;

                          TEXT file_name_text;
                          text_init (&file_name_text);
                          text_append (&file_name_text, "unknown_node");
                          if (extension)
                            {
                              text_append (&file_name_text, ".");
                              text_append (&file_name_text, extension);
                            }
                          file_source_info
                            = html_find_file_source_info (files_source_info,
                                                         file_name_text.text);
                          if (!file_source_info)
                            {
                              file_source_info
                                = html_add_to_files_source_info (
                                                           files_source_info,
                                                file_name_text.text, "node", 0,
                                                              root_command, 0);
                              node_filename = file_source_info->filename;
                            }
                          free (file_name_text.text);
                        }
                      else
                        {
          /* Nodes with {'extra'}->{'is_target'} should always be in
            'identifiers_target', and thus in targets.  It is a bug otherwise. */
                          FILE_SOURCE_INFO *file_source_info = 0;
                          HTML_TARGET *node_target
                            = html_get_target (self, root_command);
                          node_filename = node_target->node_filename;

                          file_source_info
                            = html_find_file_source_info (files_source_info,
                                                          node_filename);
                          if (file_source_info)
                            {
                              if (!strcmp (file_source_info->type,
                                           "stand_in_file"))
                                {/* NOTE we keep the order, as in perl */
                                  html_set_file_source_info (file_source_info,
                                                             "node",
                                                           0, root_command, 0);
                                }
                            }
                          else
                            html_add_to_files_source_info (files_source_info,
                                                    node_filename, "node", 0,
                                                      root_command, 0);
                        }
                      output_unit_file_name
                        = add_to_unit_file_name_paths (unit_file_name_paths,
                                                       node_filename,
                                                       file_output_unit);
                      break;
                    }
                }
              if (!node_filename)
                {
                  /* use section to do the file name if there is no node */
                  const SECTION_RELATIONS *command
                    = file_output_unit->unit_section;
                  if (command)
                    {
                      if (command->element->e.c->cmd == CM_top && !top_node
                          && top_node_filename_str)
                        {
                   /* existing top_node_filename can happen, see
                      html_tests.t top_file_name_and_node_name_collision */
                          FILE_SOURCE_INFO *file_source_info
                            = html_find_file_source_info (files_source_info,
                                                      top_node_filename_str);
                          if (file_source_info)
                            {/* NOTE we keep the order, as in perl */
                              html_set_file_source_info (file_source_info,
                                                        "special_file", "Top",
                                                        0, 0);
                            }
                          else
                            {
                              html_add_to_files_source_info (files_source_info,
                                                       top_node_filename_str,
                                                       "special_file", "Top",
                                                       0, 0);
                            }
                          output_unit_file_name
                           = add_to_unit_file_name_paths (unit_file_name_paths,
                                                          top_node_filename_str,
                                                           file_output_unit);
                        }
                      else
                        {
                          const HTML_TARGET *section_target
                            = html_get_target (self, command->element);
                          const char *section_filename
                            = section_target->section_filename;

                          FILE_SOURCE_INFO *file_source_info
                            = html_find_file_source_info (files_source_info,
                                                          section_filename);
                          if (file_source_info)
                            {
                              if (!strcmp (file_source_info->type,
                                           "stand_in_file"))
                                {/* NOTE we keep the order, as in perl */
                                  html_set_file_source_info (file_source_info,
                                                            "section",
                                                     0, command->element, 0);
                                }
                            }
                          else
                            html_add_to_files_source_info (files_source_info,
                                                 section_filename, "section", 0,
                                                 command->element, 0);
                          output_unit_file_name
                            = add_to_unit_file_name_paths (unit_file_name_paths,
                                                           section_filename,
                                                           file_output_unit);
                        }
                    }
                  else
                    {
                      /* when everything else has failed */
                      if (file_nr == 0 && !top_node
                          && top_node_filename_str)
                        {
                          const FILE_SOURCE_INFO *file_source_info
                            = html_find_file_source_info (files_source_info,
                                                       top_node_filename_str);
                          if (!file_source_info)
                            {
                              html_add_to_files_source_info (files_source_info,
                                                       top_node_filename_str,
                                                       "stand_in_file", "Top",
                                                       0, 0);
                            }
                          output_unit_file_name
                           = add_to_unit_file_name_paths (unit_file_name_paths,
                                                         top_node_filename_str,
                                                           file_output_unit);
                        }
                      else
                        {
                          const FILE_SOURCE_INFO *file_source_info;

                          TEXT file_name_text;
                          text_init (&file_name_text);
                          text_printf (&file_name_text, "%s_%zu", document_name,
                                                                  file_nr);
                          if (extension)
                            {
                              text_append (&file_name_text, ".");
                              text_append (&file_name_text, extension);
                            }
                          file_source_info
                            = html_find_file_source_info (files_source_info,
                                                        file_name_text.text);
                          if (!file_source_info)
                            {
                              html_add_to_files_source_info (files_source_info,
                                                       file_name_text.text,
                                                       "stand_in_file",
                                                       "unknown",
                                                       0, 0);
                            }
                          output_unit_file_name
                           = add_to_unit_file_name_paths (unit_file_name_paths,
                                                          file_name_text.text,
                                                           file_output_unit);
                          free (file_name_text.text);
                        }
                      file_nr++;
                    }
                }
            }
          if (output_unit != file_output_unit)
            add_to_unit_file_name_paths (unit_file_name_paths,
                                         output_unit_file_name,
                                         output_unit);
        }
      free (top_node_filename_str);
    }

  self->output_unit_file_indices = (size_t *)
    realloc (self->output_unit_file_indices,
             output_units->number * sizeof (size_t));

  for (i = 0; i < output_units->number; i++)
    {
      size_t output_unit_file_idx = 0;
      const FILE_NAME_PATH_COUNTER *output_unit_file;
      OUTPUT_UNIT *output_unit = output_units->list[i];
      char *filename = unit_file_name_paths[i];
      const FILE_SOURCE_INFO *file_source_info
        = html_find_file_source_info (files_source_info, filename);
      const char *filepath = file_source_info->path;

      FILE_NAME_PATH *file_name_path
        = call_file_id_setting_unit_file_name (self, output_unit,
                                               filename, filepath);
      if (file_name_path)
        {
          if (file_name_path->filename)
            {
              FILE_SOURCE_INFO *file_source_info
               = html_find_file_source_info (files_source_info,
                                             file_name_path->filename);
              if (file_source_info)
                {
          /*  It is likely that setting different paths for the same file is
              not intended, so we warn. */
                  if (file_source_info->path && file_name_path->filepath
                      && strcmp (file_source_info->path,
                                 file_name_path->filepath))
                    {
                      message_list_document_warn (&self->error_messages,
                                                  self->conf, 0,
                                     "resetting %s file path %s to %s",
                                           file_name_path->filename,
                                           file_source_info->path,
                                           file_name_path->filepath);
                    }
                  else if (file_name_path->filepath
                           && !file_source_info->path)
                    {
                      message_list_document_warn (&self->error_messages,
                                                  self->conf, 0,
                        "resetting %s file path from a relative path to %s",
                                           file_name_path->filename,
                                           file_name_path->filepath);
                    }
                  else if (!file_name_path->filepath
                           && file_source_info->path)
                    {
                      message_list_document_warn (&self->error_messages,
                                                  self->conf, 0,
                        "resetting %s file path from %s to a relative path",
                                           file_name_path->filename,
                                           file_source_info->path);
                    }
                  html_set_file_source_info (file_source_info, "special_file",
                                "user_defined", 0, file_name_path->filepath);
                }
              else
                html_add_to_files_source_info (files_source_info,
                                          file_name_path->filename,
                                          "special_file", "user_defined",
                                           0, file_name_path->filepath);
              free (filename);
              filename = file_name_path->filename;
            }
          free (file_name_path->filepath);
          free (file_name_path);
        }
      output_unit_file_idx
        = set_output_unit_file (self, output_unit, filename, 1);
      self->output_unit_file_indices[i] = output_unit_file_idx;
      output_unit_file = &self->output_unit_files.list[output_unit_file_idx];
      if (self->conf->DEBUG.o.integer > 0)
        {
          char *output_unit_text = output_unit_texi (output_unit);
          fprintf (stderr, "C|Page %s: %s(%d)\n", output_unit_text,
                 output_unit->unit_filename, output_unit_file->counter);
          free (output_unit_text);
        }
      free (filename);
    }

  free (unit_file_name_paths);

  if (special_units && special_units->number)
    {
      size_t i;
      self_html->special_unit_file_indices = (size_t *)
        realloc (self_html->special_unit_file_indices,
                 special_units->number * sizeof (size_t));
      for (i = 0; i < special_units->number; i++)
        {
          size_t special_unit_file_idx = 0;
          const FILE_NAME_PATH_COUNTER *special_unit_file;
          OUTPUT_UNIT *special_unit = special_units->list[i];
          const ELEMENT *unit_command = special_unit->uc.special_unit_command;
          const HTML_TARGET *special_unit_target
            = html_get_target (self, unit_command);
          const char *filename = special_unit_target->special_unit_filename;

        /* Associate the special elements that have no page with the main page.
           This may only happen if not split. */
          if (!filename && special_units->number
              && output_units->list[0]->unit_filename)
            {
              filename = output_units->list[0]->unit_filename;
            }

          if (filename)
            {
              FILE_SOURCE_INFO *file_source_info
               = html_find_file_source_info (files_source_info, filename);
              if (file_source_info)
                {
                  if (!strcmp (file_source_info->type, "stand_in_file"))
                    {/* NOTE we keep the order, as in perl */
                      html_set_file_source_info (file_source_info,
                                                 "special_unit",
                                                 0, unit_command, 0);
                    }
                }
              else
                html_add_to_files_source_info (files_source_info, filename,
                                               "special_unit", 0,
                                               unit_command, 0);
            }
          special_unit_file_idx
            = set_output_unit_file (self, special_unit, filename, 1);
          self_html->special_unit_file_indices[i] = special_unit_file_idx;
          special_unit_file
             = &self->output_unit_files.list[special_unit_file_idx];
          if (self->conf->DEBUG.o.integer > 0)
            fprintf (stderr, "C|Special page: %s(%d)\n", filename,
                             special_unit_file->counter);
        }
    }
  else
    {
      free (self_html->special_unit_file_indices);
      self_html->special_unit_file_indices = 0;
    }

  for (i = 0; i < files_source_info->number; i++)
    {
      FILE_SOURCE_INFO *file_source_info = &files_source_info->list[i];
      set_file_path (self, file_source_info->filename, file_source_info->path,
                     destination_directory);
    }

  /*
   to be able to associate to the output unit file the associated
   output units will be output into, this is done after document output
   units got files.
   In practice only used for contents and shortcontents.
   */
  if (associated_special_units && associated_special_units->number > 0)
    {
      size_t i;
      for (i = 0; i < associated_special_units->number; i++)
        {
          const char *filename = 0;
          OUTPUT_UNIT *special_unit = associated_special_units->list[i];
          const OUTPUT_UNIT *associated_output_unit
            = special_unit->associated_document_unit;
          const ELEMENT *unit_command = special_unit->uc.special_unit_command;
          HTML_TARGET *element_target
            = html_get_target (self, unit_command);

          if (!element_target->special_unit_filename)
            {/* set the file if not already set */
              char *unit_filename = 0;
              if (associated_output_unit)
                unit_filename = strdup (associated_output_unit->unit_filename);
              element_target->special_unit_filename = unit_filename;
            }
          filename = element_target->special_unit_filename;

   /* set here the file name, but do not increment the counter as it is
      already set for the output unit the special output unit is in. */
          if (filename)
            set_output_unit_file (self, special_unit, filename, 0);
        }
    }

  prepare_page_css (self, self->output_unit_files.number);

  self_html->html_files_information.number = self->output_unit_files.number +1;
  self_html->html_files_information.list = (FILE_ASSOCIATED_INFO *)
   malloc (self_html->html_files_information.number * sizeof (FILE_ASSOCIATED_INFO));
  memset (self_html->html_files_information.list, 0,
          self_html->html_files_information.number * sizeof (FILE_ASSOCIATED_INFO));

  html_initialize_pending_closes (self, self->output_unit_files.number +1);

  return files_source_info;
}

static void
prepare_special_units_directions (CONVERTER *self,
                                  OUTPUT_UNIT_LIST *special_units)
{
  size_t i;

  if (!special_units)
    return;

  for (i = 0; i < special_units->number; i++)
    {
      OUTPUT_UNIT *special_unit = special_units->list[i];
      special_unit->directions[RUD_type_This] = special_unit;
    }
}

/* Return structure to be freed by the caller */
FILE_SOURCE_INFO_LIST *
html_prepare_units_directions_files (CONVERTER *self,
          const char *output_file, const char *destination_directory,
          const char *output_filename, const char *document_name)
{
  HTML_CONVERTER_STATE *self_html = self->html_converter;

  size_t i;
  FILE_SOURCE_INFO_LIST *files_source_info = 0;
  size_t external_nodes_units_descriptor
     = new_output_units_descriptor (self->document);
  OUTPUT_UNIT_LIST *external_node_target_units
    = retrieve_output_units (self->document, external_nodes_units_descriptor);
  OUTPUT_UNIT_LIST *output_units = retrieve_output_units
    (self->document, self_html->output_units_descriptors[OUDT_units]);
  OUTPUT_UNIT_LIST *special_units = retrieve_output_units
    (self->document, self_html->output_units_descriptors[OUDT_special_units]);
  OUTPUT_UNIT_LIST *associated_special_units = retrieve_output_units
    (self->document,
     self_html->output_units_descriptors[OUDT_associated_special_units]);
  const NODE_RELATIONS_LIST *nodes_list = &self->document->nodes_list;

  self_html->output_units_descriptors[OUDT_external_nodes_units]
     = external_nodes_units_descriptor;

  html_prepare_output_units_global_targets (self);

  split_pages (output_units, nodes_list, self->conf->SPLIT.o.string);

  /* needed even if !strlen (output_file), as self->output_unit_files.number
     is checked below */
  /* same as calling initialize_output_units_files in Perl */
  clear_output_unit_files (&self->output_unit_files);

  html_reset_files_source_info (&self_html->files_source_info);

  if (strlen (output_file))
    {
      files_source_info =
        html_set_pages_files (self, output_units, special_units,
                        associated_special_units, output_file,
                        destination_directory, output_filename, document_name);
    }
  else
    html_setup_output_simple_page (self, output_filename);

  units_directions (&self->document->identifiers_target,
                    nodes_list, output_units,
                    external_node_target_units,
                    self->conf->DEBUG.o.integer);

  prepare_special_units_directions (self, special_units);

  units_file_directions (output_units);

  self->document->modified_information |= F_DOCM_output_units;

 /* elements_in_file_count is only set in HTML, not in
    Texinfo::Convert::Converter */
  if (self->output_unit_files.number)
    {
      /* set elements_in_file_count and prepare page_name_number
         for sorting */
      allocate_name_number_list (&self->page_name_number,
                                 self->output_unit_files.number);

      for (i = 0; i < self->output_unit_files.number; i++)
        {
          FILE_NAME_PATH_COUNTER *file_counter
            = &self->output_unit_files.list[i];
          NAME_NUMBER *page_name_number = &self->page_name_number.list[i];

          /* counter is dynamic, decreased when the element is encountered
             elements_in_file_count is not modified afterwards */
          file_counter->elements_in_file_count = file_counter->counter;

          page_name_number->number = i+1;
          page_name_number->name = file_counter->filename;
        }

      sort_name_number_list (&self->page_name_number);
    }

  return files_source_info;
}

