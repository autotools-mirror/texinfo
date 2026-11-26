use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contents_arg_and_comment'} = '*document_root C1
 *before_node_section C1
  *preamble C1
   *normal_command@contents C1 l1
   |global_command_number:{1}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:aa }
     *normal_command@comment C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:v}
       {spaces_after_argument:\\n}
';


$result_texis{'contents_arg_and_comment'} = '@contents aa @comment v
';


$result_texts{'contents_arg_and_comment'} = '';

$result_errors{'contents_arg_and_comment'} = '* W l1|remaining argument on @contents line: aa 
 warning: remaining argument on @contents line: aa 

';

$result_nodes_list{'contents_arg_and_comment'} = '';

$result_sections_list{'contents_arg_and_comment'} = '';

$result_sectioning_root{'contents_arg_and_comment'} = '';

$result_headings_list{'contents_arg_and_comment'} = '';

1;
