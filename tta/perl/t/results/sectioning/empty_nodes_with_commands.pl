use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_nodes_with_commands'} = '*document_root C5
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C2 l2
  *arguments_line C1
   *line_arg C2
    {spaces_before_argument: }
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {@
}
  *arguments_line C1
   *line_arg C2
    {spaces_before_argument: }
    *normal_command@\\n
 *normal_command@node C1 l5 {@:}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@:
    {spaces_after_argument:\\n}
 *normal_command@node C1 l6 {@asis{ }}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@asis C1 l6
     *brace_container C1
      {normal_text: }
    {spaces_after_argument:\\n}
';


$result_texis{'empty_nodes_with_commands'} = '
@node @c comment

@node @
@node @:
@node @asis{ }
';


$result_texts{'empty_nodes_with_commands'} = '
';

$result_errors{'empty_nodes_with_commands'} = '* E l2|empty argument in @node
 empty argument in @node

* W l4|@ should not occur at end of argument to line command
 warning: @ should not occur at end of argument to line command

* E l4|empty node name after expansion `@
\'
 empty node name after expansion `@
\'

* E l5|empty node name after expansion `@:\'
 empty node name after expansion `@:\'

* E l6|empty node name after expansion `@asis{ }\'
 empty node name after expansion `@asis{ }\'

';

$result_nodes_list{'empty_nodes_with_commands'} = '';

$result_sections_list{'empty_nodes_with_commands'} = '';

$result_sectioning_root{'empty_nodes_with_commands'} = '';

$result_headings_list{'empty_nodes_with_commands'} = '';

1;
