use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'good_space_comment'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@multitable C2 l1
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l1
     |misc_args:A{0|1}
      *line_arg C4
       {spaces_before_argument: }
       {normal_text:0 1}
       {spaces_after_argument:  }
       *normal_command@c C1
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:space comment}
         {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |text_arg:{multitable}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:multitable}
';


$result_texis{'good_space_comment'} = '@multitable @columnfractions 0 1  @c space comment
@end multitable';


$result_texts{'good_space_comment'} = '';

$result_errors{'good_space_comment'} = '';

$result_nodes_list{'good_space_comment'} = '';

$result_sections_list{'good_space_comment'} = '';

$result_sectioning_root{'good_space_comment'} = '';

$result_headings_list{'good_space_comment'} = '';


$result_converted{'html_text'}->{'good_space_comment'} = '';


$result_converted{'xml'}->{'good_space_comment'} = '<multitable endspaces=" "><columnfractions line=" 0 1  @c space comment"><columnfraction value="0"></columnfraction><columnfraction value="1"></columnfraction></columnfractions><!-- c space comment -->
</multitable>';


$result_converted{'latex_text'}->{'good_space_comment'} = '\\begin{document}
\\begin{tabular}{m{0\\textwidth} m{1\\textwidth}}%
\\end{tabular}%
';

1;
