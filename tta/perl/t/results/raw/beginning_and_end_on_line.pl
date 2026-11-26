use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'beginning_and_end_on_line'} = '*document_root C1
 *before_node_section C5
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@tex C2 l2
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      {normal_text:in tex}
      {spaces_after_argument: }
    *normal_command@end C1 l2
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@verbatim C2 l4
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:in verbatim}
     {spaces_after_argument: }
   *normal_command@end C1 l4
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@html C2 l6
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:in html}
     {spaces_after_argument: }
   *normal_command@end C1 l6
   |text_arg:{html}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:html}
     {spaces_after_argument:\\n}
';


$result_texis{'beginning_and_end_on_line'} = '
@tex in tex @end tex

@verbatim in verbatim @end verbatim

@html in html @end html
';


$result_texts{'beginning_and_end_on_line'} = '

';

$result_errors{'beginning_and_end_on_line'} = '* W l2|@end should only appear at the beginning of a line
 warning: @end should only appear at the beginning of a line

* W l2|unexpected argument on @tex line: in tex
 warning: unexpected argument on @tex line: in tex

* W l4|@end should only appear at the beginning of a line
 warning: @end should only appear at the beginning of a line

* W l4|unexpected argument on @verbatim line: in verbatim
 warning: unexpected argument on @verbatim line: in verbatim

* W l6|@end should only appear at the beginning of a line
 warning: @end should only appear at the beginning of a line

* W l6|unexpected argument on @html line: in html
 warning: unexpected argument on @html line: in html

';

$result_nodes_list{'beginning_and_end_on_line'} = '';

$result_sections_list{'beginning_and_end_on_line'} = '';

$result_sectioning_root{'beginning_and_end_on_line'} = '';

$result_headings_list{'beginning_and_end_on_line'} = '';


$result_converted{'plaintext'}->{'beginning_and_end_on_line'} = '';


$result_converted{'xml'}->{'beginning_and_end_on_line'} = '<preamblebeforebeginning>
</preamblebeforebeginning><tex endspaces=" "> 
</tex>

<verbatim xml:space="preserve" endspaces=" "> 
</verbatim>

<html endspaces=" "> 
</html>
';

1;
