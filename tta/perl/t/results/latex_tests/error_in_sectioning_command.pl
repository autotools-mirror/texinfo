use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'error_in_sectioning_command'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@contents C1 l1
   |EXTRA
   |global_command_number:{1}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l3 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C2 l4 {top section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top section}
  {empty_line:\\n}
 *@node C1 l6 {@code{@@error@{@}} (@error{}): Indicating an Error Message}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{_0040error_007b_007d-_0028error_002d_002d_003e_0029_003a-Indicating-an-Error-Message}
  *arguments_line C1
   *line_arg C4
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@code C1 l6
     *brace_container C4
      *@@
      {error}
      *@{
      *@}
    { (}
    *@error C1 l6
     *brace_container
    {): Indicating an Error Message}
 *@chapter C3 l7 {@code{@@error@{@}} (@error{}): Indicating an Error Message}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C4
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@code C1 l7
     *brace_container C4
      *@@
      {error}
      *@{
      *@}
    { (}
    *@error C1 l7
     *brace_container
    {): Indicating an Error Message}
  {empty_line:\\n}
  *paragraph C3
   {Describe }
   *@error C1 l9
    *brace_container
   {.\\n}
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
\\chapter{{\\texttt{@error\\{\\}} (\\texorpdfstring{\\fbox{error}}{error}): Indicating an Error Message}}
\\label{anchor:_0040error_007b_007d-_0028error_002d_002d_003e_0029_003a-Indicating-an-Error-Message}%

Describe \\fbox{error}.
';

1;
