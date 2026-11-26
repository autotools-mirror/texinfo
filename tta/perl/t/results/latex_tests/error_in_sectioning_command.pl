use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'error_in_sectioning_command'} = '*document_root C5
 *before_node_section C1
  *preamble C2
   *normal_command@contents C1 l1
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l4 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {@code{@@error@{@}} (@error{}): Indicating an Error Message}
 |identifier:{_0040error_007b_007d-_0028error_002d_002d_003e_0029_003a-Indicating-an-Error-Message}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C6
    {spaces_before_argument: }
    *normal_command@code C1 l6
     *brace_container C4
      *normal_command@@
      {normal_text:error}
      *normal_command@{
      *normal_command@}
    {normal_text: (}
    *normal_command@error C1 l6
     *brace_container
    {normal_text:): Indicating an Error Message}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l7 {@code{@@error@{@}} (@error{}): Indicating an Error Message}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C6
    {spaces_before_argument: }
    *normal_command@code C1 l7
     *brace_container C4
      *normal_command@@
      {normal_text:error}
      *normal_command@{
      *normal_command@}
    {normal_text: (}
    *normal_command@error C1 l7
     *brace_container
    {normal_text:): Indicating an Error Message}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Describe }
   *normal_command@error C1 l9
    *brace_container
   {normal_text:.\\n}
';


$result_texis{'error_in_sectioning_command'} = '@contents

@node Top
@top top section

@node @code{@@error@{@}} (@error{}): Indicating an Error Message
@chapter @code{@@error@{@}} (@error{}): Indicating an Error Message

Describe @error{}.
';


$result_texts{'error_in_sectioning_command'} = '
top section
***********

1 @error{} (error->): Indicating an Error Message
*************************************************

Describe error->.
';

$result_errors{'error_in_sectioning_command'} = '';

$result_nodes_list{'error_in_sectioning_command'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->@code{@@error@{@}} (@error{}): Indicating an Error Message
2|@code{@@error@{@}} (@error{}): Indicating an Error Message
 associated_section: 1 @code{@@error@{@}} (@error{}): Indicating an Error Message
 associated_title_command: 1 @code{@@error@{@}} (@error{}): Indicating an Error Message
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'error_in_sectioning_command'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->@code{@@error@{@}} (@error{}): Indicating an Error Message
 section_children:
  1|@code{@@error@{@}} (@error{}): Indicating an Error Message
2|@code{@@error@{@}} (@error{}): Indicating an Error Message
 associated_anchor_command: @code{@@error@{@}} (@error{}): Indicating an Error Message
 associated_node: @code{@@error@{@}} (@error{}): Indicating an Error Message
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'error_in_sectioning_command'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'error_in_sectioning_command'} = '';


$result_converted{'latex_text'}->{'error_in_sectioning_command'} = '
\\begin{document}
\\tableofcontents\\newpage
\\label{anchor:Top}%
\\Texinfochapter{{\\texttt{@error\\{\\}} (\\texorpdfstring{\\fbox{error}}{error}): Indicating an Error Message}}
\\label{anchor:_0040error_007b_007d-_0028error_002d_002d_003e_0029_003a-Indicating-an-Error-Message}%

Describe \\fbox{error}.
';

1;
