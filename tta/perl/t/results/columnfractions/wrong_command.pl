use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'wrong_command'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@multitable C2 l1
  |EXTRA
  |max_columns:{0}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l1
      *line_arg C3
       {spaces_before_argument: }
       *@b C1 l1
        *brace_container C1
         {normal_text:3.4}
       {spaces_after_argument: \\n}
   *@end C1 l2
   |EXTRA
   |text_arg:{multitable}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:multitable}
';


$result_texis{'wrong_command'} = '@multitable @columnfractions @b{3.4} 
@end multitable';


$result_texts{'wrong_command'} = '';

$result_errors{'wrong_command'} = '* W l1|@b should not appear in @columnfractions
 warning: @b should not appear in @columnfractions

* E l1|superfluous argument to @columnfractions
 superfluous argument to @columnfractions

';

$result_nodes_list{'wrong_command'} = '';

$result_sections_list{'wrong_command'} = '';

$result_sectioning_root{'wrong_command'} = '';

$result_headings_list{'wrong_command'} = '';


$result_converted{'html_text'}->{'wrong_command'} = '';


$result_converted{'xml'}->{'wrong_command'} = '<multitable endspaces=" "><columnfractions line=" @b{3.4} "></columnfractions>
</multitable>';


$result_converted{'latex_text'}->{'wrong_command'} = '\\begin{document}
\\begin{tabular}{}%
\\end{tabular}%
';

1;
