use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ref_in_def'} = '*document_root C2
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C6 l2 {first}
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C4 l4
   *def_line C1 l4
   |def_command:{deffn}
   |element_node:{first}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *normal_command@ref C1 l4
        *brace_arg C1
        |node_content:A{0|0}
        |normalized:{myanchor}
         {normal_text:myanchor}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *normal_command@ref C1 l4
        *brace_arg C1
        |node_content:A{0|0}
        |normalized:{myanchor}
         {normal_text:myanchor}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l4
       *normal_command@pxref C1 l4
        *brace_arg C1
        |node_content:A{0|0}
        |normalized:{myanchor}
         {normal_text:myanchor}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@pxref C1 l4
        *brace_arg C1
        |node_content:A{0|0}
        |normalized:{myanchor}
         {normal_text:myanchor}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@pxref C1 l4
        *brace_arg C1
        |node_content:A{0|0}
        |normalized:{myanchor}
         {normal_text:myanchor}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l5
   |def_command:{deffn}
   |element_node:{first}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffnx}
    *line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *normal_command@ref C1 l5
        *brace_arg C1
        |node_content:A{0|0}
        |normalized:{myanchor}
         {normal_text:myanchor}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *normal_command@ref C1 l5
        *brace_arg C1
        |node_content:A{0|0}
        |normalized:{myanchor}
         {normal_text:myanchor}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l5
       *normal_command@pxref C1 l5
        *brace_arg C1
        |node_content:A{0|0}
        |normalized:{myanchor}
         {normal_text:myanchor}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@pxref C1 l5
        *brace_arg C1
        |node_content:A{0|0}
        |normalized:{myanchor}
         {normal_text:myanchor}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@pxref C1 l5
        *brace_arg C1
        |node_content:A{0|0}
        |normalized:{myanchor}
         {normal_text:myanchor}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:T\\n}
   *normal_command@end C1 l7
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l9
  |identifier:{myanchor}
  |is_target:{1}
   *brace_arg C1
    {normal_text:myanchor}
  {spaces_after_close_brace:\\n}
';


$result_texis{'ref_in_def'} = '
@node first

@deffn @ref{myanchor} @ref{myanchor} {@pxref{myanchor}} @pxref{myanchor} @pxref{myanchor}
@deffnx @ref{myanchor} @ref{myanchor} {@pxref{myanchor}} @pxref{myanchor} @pxref{myanchor}
T
@end deffn

@anchor{myanchor}
';


$result_texts{'ref_in_def'} = '
myanchor: myanchor myanchor myanchor myanchor
myanchor: myanchor myanchor myanchor myanchor
T

';

$result_errors{'ref_in_def'} = '';

$result_nodes_list{'ref_in_def'} = '1|first
';

$result_sections_list{'ref_in_def'} = '';

$result_sectioning_root{'ref_in_def'} = '';

$result_headings_list{'ref_in_def'} = '';

$result_indices_sort_strings{'ref_in_def'} = 'fn:
 myanchor
 myanchor
';


$result_converted{'plaintext'}->{'ref_in_def'} = ' -- myanchor: myanchor see myanchor see myanchor see myanchor
 -- myanchor: myanchor see myanchor see myanchor see myanchor
     T

';

$result_converted_sort_strings{'plaintext'}->{'ref_in_def'} = 'fn:
 myanchor
 myanchor
';

1;
