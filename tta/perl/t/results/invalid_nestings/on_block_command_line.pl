use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'on_block_command_line'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@multitable C3 l1
  |max_columns:{1}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      *normal_command@anchor C1 l1
      |identifier:{in-anchor}
      |is_target:{1}
       *brace_arg C1
        {normal_text:in anchor}
     {normal_text: }
     *normal_command@titlefont C1 l1
     |global_command_number:{1}
      *brace_container C1
       {normal_text:in titlefont}
     {spaces_after_argument:\\n}
   *multitable_body C1
    *row C1
    |row_number:{1}
     *normal_command@item C3 l2
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *normal_command@titlefont C1 l2
      |global_command_number:{2}
       *brace_container C1
        {normal_text:in titlefont}
      {normal_text:\\n}
   *normal_command@end C1 l3
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C2 l5
   *arguments_line C1
    *block_line_arg C9
     {spaces_before_argument: }
     *normal_command@indent l5
     {ignorable_spaces_after_command: }
     *normal_command@titlefont C1 l5
     |global_command_number:{3}
      *brace_container C1
       {normal_text:in titlefont}
     {normal_text: }
     *normal_command@anchor C1 l5
     |identifier:{in-quotation-anchor}
     |is_target:{1}
      *brace_arg C1
       {normal_text:in quotation anchor}
     *normal_command@footnote C1 l5
     |global_command_number:{1}
      *brace_command_context C1
       *paragraph C1
        {normal_text:footnote}
     {normal_text: }
     *normal_command@exdent C1 l5
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:exdent}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l6
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'on_block_command_line'} = '@multitable {@anchor{in anchor}} @titlefont{in titlefont}
@item @titlefont{in titlefont}
@end multitable

@quotation @indent @titlefont{in titlefont} @anchor{in quotation anchor}@footnote{footnote} @exdent exdent
@end quotation
';


$result_texts{'on_block_command_line'} = 'in titlefont

in titlefont  exdent
';

$result_errors{'on_block_command_line'} = '* W l1|@anchor should not appear on @multitable line
 warning: @anchor should not appear on @multitable line

* W l1|@titlefont should not appear on @multitable line
 warning: @titlefont should not appear on @multitable line

* W l1|unexpected argument on @multitable line: @titlefont{in titlefont}
 warning: unexpected argument on @multitable line: @titlefont{in titlefont}

* W l5|@indent should not appear on @quotation line
 warning: @indent should not appear on @quotation line

* W l5|@titlefont should not appear on @quotation line
 warning: @titlefont should not appear on @quotation line

* W l5|@anchor should not appear on @quotation line
 warning: @anchor should not appear on @quotation line

* W l5|@footnote should not appear on @quotation line
 warning: @footnote should not appear on @quotation line

* W l5|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l5|@exdent should not appear on @quotation line
 warning: @exdent should not appear on @quotation line

';

$result_nodes_list{'on_block_command_line'} = '';

$result_sections_list{'on_block_command_line'} = '';

$result_sectioning_root{'on_block_command_line'} = '';

$result_headings_list{'on_block_command_line'} = '';

1;
