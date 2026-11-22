use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'node_line_arguments'} = '*document_root C8
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C1 l2 {one arg1}
 |identifier:{one-arg1}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:one arg1}
    {spaces_after_argument: \\n}
 *normal_command@node C1 l3 {one arg2}
 |identifier:{one-arg2}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C2
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:one arg2}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{two-arg}
    {spaces_before_argument: }
    {normal_text:two arg}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l4 {one arg3}
 |identifier:{one-arg3}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C3
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:one arg3}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{two-arg}
    {spaces_before_argument: }
    {normal_text:two arg}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{three-arg}
    {spaces_before_argument: }
    {normal_text:three arg}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l5 {one arg4}
 |identifier:{one-arg4}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:one arg4}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{two-arg}
    {spaces_before_argument: }
    {normal_text:two arg}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{three-arg}
    {spaces_before_argument: }
    {normal_text:three arg}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{four-arg}
    {spaces_before_argument: }
    {normal_text:four arg}
    {spaces_after_argument:\\n}
 *normal_command@node C2 l6 {one arg5}
 |identifier:{one-arg5}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:one arg5}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{two-arg}
    {spaces_before_argument: }
    {normal_text:two arg}
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{three-arg}
    {spaces_before_argument: }
    {normal_text:three arg}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{four-arg-five-arg}
    {spaces_before_argument: }
    {normal_text:four arg five arg}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l8 {comment}
 |identifier:{comment}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:comment}
    {spaces_after_argument: }
    *normal_command@comment C1
     *line_arg C2
      {rawline_text:}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l10 {arg1 @comma{} arg2}
 |identifier:{arg1-_002c-arg2}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C3
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:arg1 }
    *normal_command@comma C1 l10
     *brace_container
    {normal_text: arg2}
   *line_arg C3
   |node_content:A{1|2}
   |normalized:{_00e7edilla}
    {spaces_before_argument: }
    *normal_command@, C1 l10
     *following_arg C1
      {normal_text:c}
    {normal_text:edilla}
   *line_arg C4
   |node_content:A{1|1}
   |normalized:{comma-in-strong_002c}
    {spaces_before_argument: }
    *normal_command@strong C1 l10
     *brace_container C1
      {normal_text:comma in strong,}
    {spaces_after_argument: }
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comma , end}
      {spaces_after_argument:\\n}
';


$result_texis{'node_line_arguments'} = '
@node one arg1 
@node one arg2, two arg
@node one arg3, two arg, three arg
@node one arg4, two arg, three arg, four arg
@node one arg5, two arg, three arg, four arg five arg

@node comment @comment

@node arg1 @comma{} arg2, @,cedilla, @strong{comma in strong,} @c comma , end
';


$result_texts{'node_line_arguments'} = '

';

$result_errors{'node_line_arguments'} = '* W l6|superfluous arguments for node
 warning: superfluous arguments for node

* E l3|Next reference to nonexistent `two arg\'
 Next reference to nonexistent `two arg\'

* E l4|Next reference to nonexistent `two arg\'
 Next reference to nonexistent `two arg\'

* E l4|Prev reference to nonexistent `three arg\'
 Prev reference to nonexistent `three arg\'

* E l5|Next reference to nonexistent `two arg\'
 Next reference to nonexistent `two arg\'

* E l5|Prev reference to nonexistent `three arg\'
 Prev reference to nonexistent `three arg\'

* E l5|Up reference to nonexistent `four arg\'
 Up reference to nonexistent `four arg\'

* E l6|Next reference to nonexistent `two arg\'
 Next reference to nonexistent `two arg\'

* E l6|Prev reference to nonexistent `three arg\'
 Prev reference to nonexistent `three arg\'

* E l6|Up reference to nonexistent `four arg five arg\'
 Up reference to nonexistent `four arg five arg\'

* E l10|Next reference to nonexistent `@,cedilla\'
 Next reference to nonexistent `@,cedilla\'

* E l10|Prev reference to nonexistent `@strong{comma in strong,}\'
 Prev reference to nonexistent `@strong{comma in strong,}\'

* W l2|node `one arg1\' not in menu
 warning: node `one arg1\' not in menu

* W l3|node `one arg2\' unreferenced
 warning: node `one arg2\' unreferenced

* W l4|node `one arg3\' unreferenced
 warning: node `one arg3\' unreferenced

* W l5|node `one arg4\' unreferenced
 warning: node `one arg4\' unreferenced

* W l6|node `one arg5\' unreferenced
 warning: node `one arg5\' unreferenced

* W l8|node `comment\' unreferenced
 warning: node `comment\' unreferenced

* W l10|node `arg1 @comma{} arg2\' unreferenced
 warning: node `arg1 @comma{} arg2\' unreferenced

';

$result_nodes_list{'node_line_arguments'} = '1|one arg1
2|one arg2
3|one arg3
4|one arg4
5|one arg5
6|comment
7|arg1 @comma{} arg2
';

$result_sections_list{'node_line_arguments'} = '';

$result_sectioning_root{'node_line_arguments'} = '';

$result_headings_list{'node_line_arguments'} = '';

1;
