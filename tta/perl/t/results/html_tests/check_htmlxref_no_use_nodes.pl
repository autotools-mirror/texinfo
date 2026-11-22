use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'check_htmlxref_no_use_nodes'} = '*document_root C6
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C1 l2 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C4
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:../there/no_existing_no_manual_direction}
    {normal_text:)}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{first}
    {spaces_before_argument: }
    {normal_text:first}
   *line_arg C5
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {spaces_after_argument:\\n}
 *normal_command@top C6 l3 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@ref C4 l5
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:a}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:b}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:c}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:no_existing_no_manual.info}
   {normal_text:\\n}
   *normal_command@ref C4 l6
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:a}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:b}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:c}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:no_existing_no_manual.info}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@menu C5 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{first}
     {normal_text:first}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |manual_content:A{1|1}
     {normal_text:(}
     {normal_text:other_no_existing_no_manual}
     {normal_text:)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l12
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l14 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C2
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:first}
   *line_arg C5
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:no_existing_no_manual.info}
    {normal_text:)}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l16 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C3
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:chapter}
   *line_arg C4
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:chap_not_existing}
    {normal_text:)}
   *line_arg C6
   |manual_content:A{2|2}
   |node_content:A{4|4}
   |normalized:{node-in-dir}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:dir}
    {normal_text:)}
    {normal_text:node in dir}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l17 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C4 l19
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:aa}
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:some_name_inf.inf}
   {normal_text:.\\n}
';


$result_texis{'check_htmlxref_no_use_nodes'} = '
@node Top, (../there/no_existing_no_manual_direction), first, (dir)
@top top

@ref{a, b, c, no_existing_no_manual.info}
@ref{a, b, c, no_existing_no_manual.info}

@menu
* first::
* (other_no_existing_no_manual)::
* chapter::
@end menu

@node first, (no_existing_no_manual.info)

@node chapter, (chap_not_existing), (dir)node in dir
@chapter Chapter

@xref{aa,,, some_name_inf.inf}.
';


$result_texts{'check_htmlxref_no_use_nodes'} = 'top
***

a
a

* first::
* (other_no_existing_no_manual)::
* chapter::


1 Chapter
*********

aa.
';

$result_errors{'check_htmlxref_no_use_nodes'} = '* W l9|node `first\' in menu where `chapter\' expected
 warning: node `first\' in menu where `chapter\' expected

* W l11|node next pointer for `first\' is `(no_existing_no_manual.info)\' but next is `chapter\' in menu
 warning: node next pointer for `first\' is `(no_existing_no_manual.info)\' but next is `chapter\' in menu

* W l11|node prev pointer for `chapter\' is `(dir)node in dir\' but prev is `first\' in menu
 warning: node prev pointer for `chapter\' is `(dir)node in dir\' but prev is `first\' in menu

';

$result_nodes_list{'check_htmlxref_no_use_nodes'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  first
  (other_no_existing_no_manual)
  chapter
 node_directions:
  next-> (../there/no_existing_no_manual_direction)
  prev->first
  up-> (dir)

2|first
 node_directions:
  next-> (no_existing_no_manual.info)

3|chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  next-> (chap_not_existing)
  prev-> (dir)node in dir

';

$result_sections_list{'check_htmlxref_no_use_nodes'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'check_htmlxref_no_use_nodes'} = 'level: -1
list:
 1|top
';

$result_headings_list{'check_htmlxref_no_use_nodes'} = '';

$result_converted_errors{'file_html'}->{'check_htmlxref_no_use_nodes'} = '* W l5|do not set .info suffix in reference for manual `no_existing_no_manual.info\'
 warning: do not set .info suffix in reference for manual `no_existing_no_manual.info\'

* W l5|no HTML cross-references entry found for `no_existing_no_manual.info\'
 warning: no HTML cross-references entry found for `no_existing_no_manual.info\'

* W l6|do not set .info suffix in reference for manual `no_existing_no_manual.info\'
 warning: do not set .info suffix in reference for manual `no_existing_no_manual.info\'

* W l6|no HTML cross-references entry found for `no_existing_no_manual.info\'
 warning: no HTML cross-references entry found for `no_existing_no_manual.info\'

* W l2|no HTML cross-references entry found for `dir\'
 warning: no HTML cross-references entry found for `dir\'

* W l2|no HTML cross-references entry found for `../there/no_existing_no_manual_direction\'
 warning: no HTML cross-references entry found for `../there/no_existing_no_manual_direction\'

* W l19|do not set .inf suffix in reference for manual `some_name_inf.inf\'
 warning: do not set .inf suffix in reference for manual `some_name_inf.inf\'

* W l19|no HTML cross-references entry found for `some_name_inf.inf\'
 warning: no HTML cross-references entry found for `some_name_inf.inf\'

* W l16|no HTML cross-references entry found for `chap_not_existing\'
 warning: no HTML cross-references entry found for `chap_not_existing\'

* W l16|no HTML cross-references entry found for `dir\'
 warning: no HTML cross-references entry found for `dir\'

';

1;
