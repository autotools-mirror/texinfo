use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_comment'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@multitable C2 l1
  |max_columns:{0}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l1
      *line_arg C2
       {spaces_before_argument: }
       *normal_command@c C1
        *line_arg C2
         {rawline_text:}
         {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |text_arg:{multitable}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:multitable}
';


$result_texis{'empty_comment'} = '@multitable @columnfractions @c
@end multitable';


$result_texts{'empty_comment'} = '';

$result_errors{'empty_comment'} = '* E l1|@columnfractions missing argument
 @columnfractions missing argument

';

$result_nodes_list{'empty_comment'} = '';

$result_sections_list{'empty_comment'} = '';

$result_sectioning_root{'empty_comment'} = '';

$result_headings_list{'empty_comment'} = '';


$result_converted{'html_text'}->{'empty_comment'} = '';


$result_converted{'xml'}->{'empty_comment'} = '<multitable endspaces=" "><columnfractions line=" @c"></columnfractions><!-- c -->
</multitable>';


$result_converted{'latex_text'}->{'empty_comment'} = '\\begin{document}
\\begin{tabular}{}%
\\end{tabular}%
';

1;
