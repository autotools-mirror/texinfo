use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'good_comment'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@multitable C2 l1
  |max_columns:{3}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l1
     |misc_args:A{0.4|.6|5.}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.4 .6 5.}
       *normal_command@c C1
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:comment}
         {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |text_arg:{multitable}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:multitable}
';


$result_texis{'good_comment'} = '@multitable @columnfractions 0.4 .6 5.@c comment
@end multitable';


$result_texts{'good_comment'} = '';

$result_errors{'good_comment'} = '';

$result_nodes_list{'good_comment'} = '';

$result_sections_list{'good_comment'} = '';

$result_sectioning_root{'good_comment'} = '';

$result_headings_list{'good_comment'} = '';


$result_converted{'html_text'}->{'good_comment'} = '';


$result_converted{'xml'}->{'good_comment'} = '<multitable endspaces=" "><columnfractions line=" 0.4 .6 5.@c comment"><columnfraction value="0.4"></columnfraction><columnfraction value=".6"></columnfraction><columnfraction value="5."></columnfraction></columnfractions><!-- c comment -->
</multitable>';


$result_converted{'latex_text'}->{'good_comment'} = '\\begin{document}
\\begin{tabular}{m{0.4\\textwidth} m{.6\\textwidth} m{5.\\textwidth}}%
\\end{tabular}%
';

1;
