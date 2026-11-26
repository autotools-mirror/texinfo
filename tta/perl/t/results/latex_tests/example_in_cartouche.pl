use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'example_in_cartouche'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@cartouche C5 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:Normal cartouche\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:New para\\n}
   *normal_command@end C1 l5
   |text_arg:{cartouche}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:cartouche}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@cartouche C3 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@example C3 l8
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C2
     {normal_text:% pwd\\n}
     {normal_text:/usr/local/share/emacs\\n}
    *normal_command@end C1 l11
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l12
   |text_arg:{cartouche}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:cartouche}
     {spaces_after_argument:\\n}
';


$result_texis{'example_in_cartouche'} = '@cartouche
Normal cartouche

New para
@end cartouche

@cartouche
@example
% pwd
/usr/local/share/emacs
@end example
@end cartouche
';


$result_texts{'example_in_cartouche'} = 'Normal cartouche

New para

% pwd
/usr/local/share/emacs
';

$result_errors{'example_in_cartouche'} = '';

$result_nodes_list{'example_in_cartouche'} = '';

$result_sections_list{'example_in_cartouche'} = '';

$result_sectioning_root{'example_in_cartouche'} = '';

$result_headings_list{'example_in_cartouche'} = '';


$result_converted{'latex_text'}->{'example_in_cartouche'} = '\\begin{document}
\\begin{Texinfocartouche}
Normal cartouche

New para
\\end{Texinfocartouche}

\\begin{Texinfocartouche}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\% pwd
/usr/local/share/emacs
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{Texinfocartouche}
';

1;
