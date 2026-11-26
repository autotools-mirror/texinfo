use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'menu_in_deffn'} = '*document_root C2
 *before_node_section C1
  *preamble
 *normal_command@node C3 l1 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l3
   *def_line C1 l3
   |def_command:{deffn}
   |element_node:{first}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:c}
     {spaces_after_argument: \\n}
   *def_item C1
    *normal_command@menu C3 l4
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *menu_entry C4 l5
      {menu_entry_leading_text:* }
      *menu_entry_node C3
      |manual_content:A{1|1}
       {normal_text:(}
       {normal_text:mynode}
       {normal_text:)}
      {menu_entry_separator:::}
      *menu_entry_description C1
       *preformatted C1
        {normal_text:\\n}
     *normal_command@end C1 l6
     |text_arg:{menu}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:menu}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l7
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'menu_in_deffn'} = '@node first

@deffn a b c 
@menu
* (mynode)::
@end menu
@end deffn
';


$result_texts{'menu_in_deffn'} = '
a: b c
* (mynode)::
';

$result_errors{'menu_in_deffn'} = '* W l4|@menu in invalid context
 warning: @menu in invalid context

';

$result_nodes_list{'menu_in_deffn'} = '1|first
';

$result_sections_list{'menu_in_deffn'} = '';

$result_sectioning_root{'menu_in_deffn'} = '';

$result_headings_list{'menu_in_deffn'} = '';

$result_indices_sort_strings{'menu_in_deffn'} = 'fn:
 b
';

1;
