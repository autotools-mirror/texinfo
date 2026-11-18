use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'heading_node_after_chap'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content C1
   *@settitle C1 l1
    *line_arg C3
     {spaces_before_argument: }
     {heading node after chap}
     {spaces_after_argument:\\n}
 *@node C1 l2 {Cap 1}
 |EXTRA
 |identifier:{Cap-1}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Cap 1}
    {spaces_after_argument:\\n}
 *@chapter C5 l3 {Chapter One}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter One}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:needed to have Node 1 referenced}
    {spaces_after_argument:\\n}
  *paragraph C2
   *@xref C1 l6
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Node-1}
     {Node 1}
   {\\n}
  {empty_line:\\n}
 *@node C1 l8 {Cap 2}
 |EXTRA
 |identifier:{Cap-2}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Cap 2}
    {spaces_after_argument:\\n}
 *@chapter C2 l9 {Chapter Two}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter Two}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C2 l11 {Node 1}
 |EXTRA
 |identifier:{Node-1}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Node 1}
    {spaces_after_argument:\\n}
  *@heading C1 l12
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {Topic}
    {spaces_after_argument:\\n}
';


$result_texis{'heading_node_after_chap'} = '@settitle heading node after chap
@node Cap 1
@chapter Chapter One

@c needed to have Node 1 referenced
@xref{Node 1}

@node Cap 2
@chapter Chapter Two

@node Node 1
@heading Topic
';


$result_texts{'heading_node_after_chap'} = '1 Chapter One
*************

Node 1

2 Chapter Two
*************

Topic
=====
';

$result_errors{'heading_node_after_chap'} = '';

$result_nodes_list{'heading_node_after_chap'} = '1|Cap 1
 associated_section: 1 Chapter One
 associated_title_command: 1 Chapter One
 node_directions:
  next->Cap 2
2|Cap 2
 associated_section: 2 Chapter Two
 associated_title_command: 2 Chapter Two
 node_directions:
  prev->Cap 1
3|Node 1
 associated_title_command: @heading Topic
';

$result_sections_list{'heading_node_after_chap'} = '1|Chapter One
 associated_anchor_command: Cap 1
 associated_node: Cap 1
 section_directions:
  next->Chapter Two
 toplevel_directions:
  next->Chapter Two
2|Chapter Two
 associated_anchor_command: Cap 2
 associated_node: Cap 2
 section_directions:
  prev->Chapter One
 toplevel_directions:
  prev->Chapter One
';

$result_sectioning_root{'heading_node_after_chap'} = 'level: 0
list:
 1|Chapter One
 2|Chapter Two
';

$result_headings_list{'heading_node_after_chap'} = '1|Topic
 associated_anchor_command: Node 1
';

1;
