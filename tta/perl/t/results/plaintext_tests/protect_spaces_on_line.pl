use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'protect_spaces_on_line'} = '*document_root C1
 *before_node_section C5
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C5
   {normal_text:Before samp. }
   *normal_command@samp C1 l2
    *brace_container C1
     {normal_text:a}
   {normal_text:. after samp, w }
   *normal_command@w C1 l2
    *brace_container C1
     {normal_text:in   w. after dot}
   {normal_text:  afterw\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@exdent C1 l5
    *line_arg C7
     {spaces_before_argument: }
     {normal_text:before samp. }
     *normal_command@samp C1 l5
      *brace_container C1
       {normal_text:a}
     {normal_text:. after samp, w }
     *normal_command@w C1 l5
      *brace_container C1
       {normal_text:in   w. after dot}
     {normal_text:  afterw}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l6
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'protect_spaces_on_line'} = '
Before samp. @samp{a}. after samp, w @w{in   w. after dot}  afterw

@quotation
@exdent before samp. @samp{a}. after samp, w @w{in   w. after dot}  afterw
@end quotation
';


$result_texts{'protect_spaces_on_line'} = 'Before samp. a. after samp, w in   w. after dot  afterw

before samp. a. after samp, w in   w. after dot  afterw
';

$result_errors{'protect_spaces_on_line'} = '';

$result_nodes_list{'protect_spaces_on_line'} = '';

$result_sections_list{'protect_spaces_on_line'} = '';

$result_sectioning_root{'protect_spaces_on_line'} = '';

$result_headings_list{'protect_spaces_on_line'} = '';


$result_converted{'plaintext'}->{'protect_spaces_on_line'} = 'Before samp.  ‘a’.  after samp, w in w.  after dot afterw

before samp.  ‘a’.  after samp, w in w.  after dot afterw
';

1;
