use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'something_before_columnfractions'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@multitable C2 l1
  |max_columns:{0}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:aaa }
     *normal_command@columnfractions C1 l1
     |misc_args:A{0.3|0.7}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.3 0.7}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |text_arg:{multitable}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:multitable}
';


$result_texis{'something_before_columnfractions'} = '@multitable aaa @columnfractions 0.3 0.7
@end multitable';


$result_texts{'something_before_columnfractions'} = '';

$result_errors{'something_before_columnfractions'} = '* W l1|unexpected argument on @multitable line: @columnfractions 0.3 0.7

 warning: unexpected argument on @multitable line: @columnfractions 0.3 0.7


* W l1|empty multitable
 warning: empty multitable

';

$result_nodes_list{'something_before_columnfractions'} = '';

$result_sections_list{'something_before_columnfractions'} = '';

$result_sectioning_root{'something_before_columnfractions'} = '';

$result_headings_list{'something_before_columnfractions'} = '';


$result_converted{'html_text'}->{'something_before_columnfractions'} = '';


$result_converted{'xml'}->{'something_before_columnfractions'} = '<multitable endspaces=" "><columnprototypes> aaa <columnfractions line=" 0.3 0.7"><columnfraction value="0.3"></columnfraction><columnfraction value="0.7"></columnfraction></columnfractions>
</columnprototypes></multitable>';


$result_converted{'latex_text'}->{'something_before_columnfractions'} = '\\begin{document}
\\begin{tabular}{}%
\\end{tabular}%
';

1;
