use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_line_arguments'} = '*document_root C8
 *before_node_section C1
  {empty_line:\\n}
 *@node C1 l2 {one arg1}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{one-arg1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
    {one arg1}
 *@node C1 l3 {one arg2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{one-arg2}
  *arguments_line C2
   *line_arg C1
    {one arg2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{two arg}
   |normalized:{two-arg}
    {two arg}
 *@node C1 l4 {one arg3}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{one-arg3}
  *arguments_line C3
   *line_arg C1
    {one arg3}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{two arg}
   |normalized:{two-arg}
    {two arg}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{three arg}
   |normalized:{three-arg}
    {three arg}
 *@node C1 l5 {one arg4}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{one-arg4}
  *arguments_line C4
   *line_arg C1
    {one arg4}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{two arg}
   |normalized:{two-arg}
    {two arg}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{three arg}
   |normalized:{three-arg}
    {three arg}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{four arg}
   |normalized:{four-arg}
    {four arg}
 *@node C2 l6 {one arg5}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{one-arg5}
  *arguments_line C4
   *line_arg C1
    {one arg5}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{two arg}
   |normalized:{two-arg}
    {two arg}
   *line_arg C1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{three arg}
   |normalized:{three-arg}
    {three arg}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{four arg five arg}
   |normalized:{four-arg-five-arg}
    {four arg five arg}
  {empty_line:\\n}
 *@node C2 l8 {comment}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{comment}
  *arguments_line C1
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@comment C1
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:}
   |spaces_after_argument:
    |{spaces_after_argument: }
    {comment}
  {empty_line:\\n}
 *@node C1 l10 {arg1 @comma{} arg2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{7}
 |normalized:{arg1-_002c-arg2}
  *arguments_line C3
   *line_arg C3
    {arg1 }
    *@comma C1 l10
     *brace_container
    { arg2}
   *line_arg C2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{@,cedilla}
   |normalized:{_00e7edilla}
    *@, C1 l10
     *following_arg C1
      {c}
    {edilla}
   *line_arg C1
   |INFO
   |comment_at_end:
    |*@c C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:comma , end}
   |spaces_after_argument:
    |{spaces_after_argument: }
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{@strong{comma in strong,}}
   |normalized:{comma-in-strong_002c}
    *@strong C1 l10
     *brace_container C1
      {comma in strong,}
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
