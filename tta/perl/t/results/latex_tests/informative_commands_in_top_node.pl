use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'informative_commands_in_top_node'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C7 l2 {top sectionning}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top sectionning}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@paragraphindent C1 l4
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:5}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@evenfooting C1 l6
   *line_arg C13
    {spaces_before_argument: }
    *normal_command@thischapter
    {normal_text: }
    *normal_command@thistitle
    {normal_text: }
    *normal_command@|
    {normal_text: }
    *normal_command@thisfile
    {normal_text: }
    *normal_command@|
    {normal_text: }
    *normal_command@code C1 l6
     *brace_container C1
      *normal_command@thischaptername
    {spaces_after_argument:\\n}
  *normal_command@paragraphindent C1 l7
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {next node}
 |EXTRA
 |identifier:{next-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:next node}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l10 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In chapter\\n}
';


$result_texis{'informative_commands_in_top_node'} = '@node Top
@top top sectionning

@paragraphindent 5

@evenfooting @thischapter @thistitle @| @thisfile @| @code{@thischaptername}
@paragraphindent 2

@node next node
@chapter chap

In chapter
';


$result_texts{'informative_commands_in_top_node'} = 'top sectionning
***************



1 chap
******

In chapter
';

$result_errors{'informative_commands_in_top_node'} = '';

$result_nodes_list{'informative_commands_in_top_node'} = '1|Top
 associated_section: top sectionning
 associated_title_command: top sectionning
 node_directions:
  next->next node
2|next node
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'informative_commands_in_top_node'} = '1|top sectionning
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: next node
 associated_node: next node
 section_directions:
  up->top sectionning
 toplevel_directions:
  prev->top sectionning
  up->top sectionning
';

$result_sectioning_root{'informative_commands_in_top_node'} = 'level: -1
list:
 1|top sectionning
';

$result_headings_list{'informative_commands_in_top_node'} = '';


$result_converted{'latex_text'}->{'informative_commands_in_top_node'} = '\\begin{document}
\\label{anchor:Top}%
\\setlength{\\parindent}{5em}
\\newpagestyle{custom}{%
\\setfoot[\\Texinfothechapterheading{}\\chaptertitle{} \\Texinfosettitle{}][\\Texinfotheinclude{}][\\texttt{\\chaptertitle{}}]%
{}{}{}%
}%
\\pagestyle{custom}%
\\setlength{\\parindent}{2em}
\\Texinfochapter{{chap}}
\\label{anchor:next-node}%

In chapter
';

1;
