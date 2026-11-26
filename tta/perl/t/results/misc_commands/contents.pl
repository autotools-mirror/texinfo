use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'contents'} = '*document_root C1
 *before_node_section C14
  *before_beginning C1
   {empty_line:\\n}
  *preamble
  *paragraph C3
   {normal_text:first }
   *normal_command@@
   {normal_text:contents }
  *normal_command@contents C1 l2
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:line following first content}
    {spaces_after_argument:\\n}
  *paragraph C3
   {normal_text:second }
   *normal_command@@
   {normal_text:contents }
  *normal_command@contents C1 l3
  |global_command_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:line following second content}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Third content on the following line on his own\\n}
  *normal_command@contents C1 l5
  |global_command_number:{3}
   *line_arg C1
    {spaces_before_argument:\\n}
  *paragraph C2
   {normal_text:Line following contents\\n}
   {normal_text:shortcontents }
  *normal_command@shortcontents C1 l7
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:eol}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:shortcontents }
  *normal_command@shortcontents C1 l8
  |global_command_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:eol}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:summarycontents }
  *normal_command@summarycontents C1 l9
  |global_command_number:{3}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:line following summarycontents}
    {spaces_after_argument:\\n}
';


$result_texis{'contents'} = '
first @@contents @contents line following first content
second @@contents @contents line following second content
Third content on the following line on his own
@contents
Line following contents
shortcontents @shortcontents eol
shortcontents @shortcontents eol
summarycontents @summarycontents line following summarycontents
';


$result_texts{'contents'} = 'first @contents second @contents Third content on the following line on his own
Line following contents
shortcontents shortcontents summarycontents ';

$result_errors{'contents'} = '* W l2|@contents should only appear at the beginning of a line
 warning: @contents should only appear at the beginning of a line

* W l2|remaining argument on @contents line: line following first content
 warning: remaining argument on @contents line: line following first content

* W l3|@contents should only appear at the beginning of a line
 warning: @contents should only appear at the beginning of a line

* W l3|remaining argument on @contents line: line following second content
 warning: remaining argument on @contents line: line following second content

* W l7|@shortcontents should only appear at the beginning of a line
 warning: @shortcontents should only appear at the beginning of a line

* W l7|remaining argument on @shortcontents line: eol
 warning: remaining argument on @shortcontents line: eol

* W l8|@shortcontents should only appear at the beginning of a line
 warning: @shortcontents should only appear at the beginning of a line

* W l8|remaining argument on @shortcontents line: eol
 warning: remaining argument on @shortcontents line: eol

* W l9|@summarycontents should only appear at the beginning of a line
 warning: @summarycontents should only appear at the beginning of a line

* W l9|remaining argument on @summarycontents line: line following summarycontents
 warning: remaining argument on @summarycontents line: line following summarycontents

';

$result_nodes_list{'contents'} = '';

$result_sections_list{'contents'} = '';

$result_sectioning_root{'contents'} = '';

$result_headings_list{'contents'} = '';

1;
