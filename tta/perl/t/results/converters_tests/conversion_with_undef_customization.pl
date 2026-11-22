use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'conversion_with_undef_customization'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C5 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@contents C1 l4
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  *@shortcontents C1 l5
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *@node C1 l7 {chap@^e}
 |EXTRA
 |identifier:{chap_00ea}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:chap}
    *@^ C1 l7
     *following_arg C1
      {normal_text:e}
    {spaces_after_argument:\\n}
 *@chapter C6 l8 {Chap@^e}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:Chap}
    *@^ C1 l8
     *following_arg C1
      {normal_text:e}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Text}
   *@footnote C1 l10
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C2
      {normal_text:Go }
      *@samp C1 l10
       *brace_container C1
        {normal_text:s}
   {normal_text:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l12
  |EXTRA
  |element_node:{chap_00ea}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l14 {sec}
 |EXTRA
 |identifier:{sec}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec}
    {spaces_after_argument:\\n}
 *@section C5 l15 {Section}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 l17
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C3 l19
   *def_line C1 l19
   |EXTRA
   |def_command:{deftypefn}
   |element_node:{sec}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C15
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:category}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:type}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:something}
     {spaces: }
     {delimiter:(}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:aa}
     {spaces: }
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:A def.\\n}
   *@end C1 l21
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefn}
     {spaces_after_argument:\\n}
';


$result_texis{'conversion_with_undef_customization'} = '@node Top
@top top

@contents
@shortcontents

@node chap@^e
@chapter Chap@^e

Text@footnote{Go @samp{s}}

@cindex entry

@node sec
@section Section

@printindex cp

@deftypefn category type name something ( aa )
A def.
@end deftypefn
';


$result_texts{'conversion_with_undef_customization'} = 'top
***


1 Chape^
********

Text


1.1 Section
===========


category: type name something ( aa )
A def.
';

$result_errors{'conversion_with_undef_customization'} = '';

$result_nodes_list{'conversion_with_undef_customization'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap@^e
2|chap@^e
 associated_section: 1 Chap@^e
 associated_title_command: 1 Chap@^e
 node_directions:
  prev->Top
  up->Top
3|sec
 associated_section: 1.1 Section
 associated_title_command: 1.1 Section
 node_directions:
  up->chap@^e
';

$result_sections_list{'conversion_with_undef_customization'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap@^e
 section_children:
  1|Chap@^e
2|Chap@^e
 associated_anchor_command: chap@^e
 associated_node: chap@^e
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|Section
3|Section
 associated_anchor_command: sec
 associated_node: sec
 section_directions:
  up->Chap@^e
';

$result_sectioning_root{'conversion_with_undef_customization'} = 'level: -1
list:
 1|top
';

$result_headings_list{'conversion_with_undef_customization'} = '';

$result_indices_sort_strings{'conversion_with_undef_customization'} = 'cp:
 entry
fn:
 name
';

$result_converted_sort_strings{'file_html'}->{'conversion_with_undef_customization'} = 'cp:
 entry
fn:
 name
';

$result_converted_sort_strings{'file_info'}->{'conversion_with_undef_customization'} = 'cp:
 entry
fn:
 name
';

$result_converted_sort_strings{'file_plaintext'}->{'conversion_with_undef_customization'} = 'cp:
 entry
fn:
 name
';

1;
