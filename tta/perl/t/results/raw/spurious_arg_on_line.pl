use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'spurious_arg_on_line'} = '*document_root C1
 *before_node_section C5
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@tex C3 l2
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      {normal_text:argt}
      {spaces_after_argument:\\n}
    *rawpreformatted C1
     {normal_text:in tex\\n}
    *normal_command@end C1 l4
    |EXTRA
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@verbatim C3 l6
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:argverbatim}
     {spaces_after_argument:\\n}
   {raw:in verbatim\\n}
   *normal_command@end C1 l8
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@html C3 l10
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:argh}
     {spaces_after_argument:\\n}
   *elided_rawpreformatted C1
    {raw:in html\\n}
   *normal_command@end C1 l12
   |EXTRA
   |text_arg:{html}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:html}
     {spaces_after_argument:\\n}
';


$result_texis{'spurious_arg_on_line'} = '
@tex argt
in tex
@end tex

@verbatim argverbatim
in verbatim
@end verbatim

@html argh
in html
@end html
';


$result_texts{'spurious_arg_on_line'} = 'in tex

in verbatim

';

$result_errors{'spurious_arg_on_line'} = '* W l2|unexpected argument on @tex line: argt
 warning: unexpected argument on @tex line: argt

* W l6|unexpected argument on @verbatim line: argverbatim
 warning: unexpected argument on @verbatim line: argverbatim

* W l10|unexpected argument on @html line: argh
 warning: unexpected argument on @html line: argh

';

$result_nodes_list{'spurious_arg_on_line'} = '';

$result_sections_list{'spurious_arg_on_line'} = '';

$result_sectioning_root{'spurious_arg_on_line'} = '';

$result_headings_list{'spurious_arg_on_line'} = '';


$result_converted{'plaintext'}->{'spurious_arg_on_line'} = 'in verbatim

';


$result_converted{'xml'}->{'spurious_arg_on_line'} = '<preamblebeforebeginning>
</preamblebeforebeginning><tex endspaces=" ">
in tex
</tex>

<verbatim xml:space="preserve" endspaces=" ">
in verbatim
</verbatim>

<html endspaces=" ">
in html
</html>
';

1;
