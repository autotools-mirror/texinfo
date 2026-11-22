use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'settitle_and_headings'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content C4
   *@settitle C1 l1
    *line_arg C5
     {spaces_before_argument: }
     {normal_text:Title }
     *@*
     {normal_text: for a manual}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@headings C1 l3
   |EXTRA
   |global_command_number:{1}
   |misc_args:A{double}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:double}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@chapter C9 l5 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@page C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:More text\\n}
  {empty_line:\\n}
  *@page C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Another page\\n}
';


$result_texis{'settitle_and_headings'} = '@settitle Title @* for a manual

@headings double

@chapter chap

@page

More text

@page

Another page
';


$result_texts{'settitle_and_headings'} = '

1 chap
******



More text



Another page
';

$result_errors{'settitle_and_headings'} = '';

$result_nodes_list{'settitle_and_headings'} = '';

$result_sections_list{'settitle_and_headings'} = '1|chap
';

$result_sectioning_root{'settitle_and_headings'} = 'level: 0
list:
 1|chap
';

$result_headings_list{'settitle_and_headings'} = '';


$result_converted{'latex_text'}->{'settitle_and_headings'} = '
\\pagestyle{double}%

\\begin{document}
\\Texinfochapter{{chap}}
\\label{anchor:chap}%

\\newpage{}%
\\phantom{blabla}%

More text

\\newpage{}%
\\phantom{blabla}%

Another page
';

1;
