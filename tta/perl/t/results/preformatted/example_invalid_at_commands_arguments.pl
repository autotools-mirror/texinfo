use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'example_invalid_at_commands_arguments'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@example C2 l1
   *arguments_line C3
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@ref C4 l1
      *brace_arg C1
      |EXTRA
      |node_content:A{0|0}
       {normal_text:a}
      *brace_arg C1
       {normal_text:b}
      *brace_arg C1
       {normal_text:c}
      *brace_arg C1
       {normal_text:d}
     {normal_text: fa}
    *block_line_arg C4
     {spaces_before_argument: }
     *normal_command@anchor C1 l1
     |EXTRA
     |identifier:{an-anchor}
     |is_target:{1}
      *brace_arg C1
       {normal_text:an anchor}
     {spaces_after_close_brace: }
     {normal_text:on example line}
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@center C1 l1
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:in center}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'example_invalid_at_commands_arguments'} = '@example @ref{a,b,c,d} fa, @anchor{an anchor} on example line, @center in center
@end example
';


$result_texts{'example_invalid_at_commands_arguments'} = '';

$result_errors{'example_invalid_at_commands_arguments'} = '* W l1|@ref should not appear on @example line
 warning: @ref should not appear on @example line

* W l1|@anchor should not appear on @example line
 warning: @anchor should not appear on @example line

* W l1|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* W l1|@center should not appear on @example line
 warning: @center should not appear on @example line

';

$result_nodes_list{'example_invalid_at_commands_arguments'} = '';

$result_sections_list{'example_invalid_at_commands_arguments'} = '';

$result_sectioning_root{'example_invalid_at_commands_arguments'} = '';

$result_headings_list{'example_invalid_at_commands_arguments'} = '';


$result_converted{'plaintext'}->{'example_invalid_at_commands_arguments'} = '';


$result_converted{'html'}->{'example_invalid_at_commands_arguments'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">



</head>

<body>



</body>
</html>
';

$result_converted_errors{'html'}->{'example_invalid_at_commands_arguments'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'example_invalid_at_commands_arguments'} = '';


$result_converted{'xml'}->{'example_invalid_at_commands_arguments'} = '<example endspaces=" "><examplelanguage> <ref label="a" manual="d"><xrefnodename>a</xrefnodename><xrefinfoname>b</xrefinfoname><xrefprinteddesc>c</xrefprinteddesc><xrefinfofile>d</xrefinfofile></ref> fa</examplelanguage><examplearg> <anchor identifier="an-anchor">an anchor</anchor> on example line</examplearg><examplearg> <center> in center</center>
</examplearg>
</example>
';


$result_converted{'latex_text'}->{'example_invalid_at_commands_arguments'} = '\\begin{document}
\\begin{Texinfoindented}
\\end{Texinfoindented}
';

1;
