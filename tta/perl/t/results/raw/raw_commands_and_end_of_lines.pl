use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'raw_commands_and_end_of_lines'} = '*document_root C1
 *before_node_section C43
  *before_beginning C1
   {empty_line:\\n}
  *preamble C2
   *normal_command@html C3 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:Surrounded by empty lines.\\n}
    *normal_command@end C1 l4
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {normal_text:Block commands on a line\\n}
   *normal_command@html C3 l7
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C2
     {normal_text:in block\\n}
     {normal_text:in block l2\\n}
    *normal_command@end C1 l10
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
   {normal_text:end commands on a line.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Before the opening command }
   *normal_command@html C3 l13
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in block\\n}
    *normal_command@end C1 l15
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
   {normal_text:end commands on a line.\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:Before the opening command }
   *normal_command@html C3 l18
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in block\\n}
    *normal_command@end C1 l20
    |text_arg:{html after the closing command.}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html after the closing command.}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Before the opening command }
   *normal_command@html C3 l22
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in block\\n}
    *normal_command@end C1 l24
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      {spaces_after_argument:\\n}
   {normal_text:. A symbol on a line.\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:Before the opening command }
   *normal_command@html C3 l27
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in block\\n}
    *normal_command@end C1 l29
    |text_arg:{html. A symbol after the closing command.}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html. A symbol after the closing command.}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@tex C3 l31
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *rawpreformatted C1
    {normal_text:Surrounded by empty lines.\\n}
   *normal_command@end C1 l33
   |text_arg:{tex}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:tex}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Block commands on a line\\n}
   *normal_command@tex C3 l36
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in block\\n}
    *normal_command@end C1 l38
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:\\n}
   {normal_text:end commands on a line.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Before the opening command }
   *normal_command@tex C3 l41
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in block\\n}
    *normal_command@end C1 l43
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:\\n}
   {normal_text:end commands on a line.\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:Before the opening command }
   *normal_command@tex C3 l46
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in block\\n}
    *normal_command@end C1 l48
    |text_arg:{tex after the closing command.}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex after the closing command.}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Before the opening command }
   *normal_command@tex C3 l50
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in block\\n}
    *normal_command@end C1 l52
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:\\n}
   {normal_text:. A symbol on a line.\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:Before the opening command }
   *normal_command@tex C3 l55
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in block\\n}
    *normal_command@end C1 l57
    |text_arg:{tex. A symbol after the closing command.}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex. A symbol after the closing command.}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@verbatim C3 l59
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:Surrounded by empty lines.\\n}
   *normal_command@end C1 l61
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Block commands on a line\\n}
  *normal_command@verbatim C3 l64
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:in block\\n}
   *normal_command@end C1 l66
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:end commands on a line.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Before the opening command }
  *normal_command@verbatim C3 l69
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:in block\\n}
   *normal_command@end C1 l71
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:end commands on a line.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Before the opening command }
  *normal_command@verbatim C3 l74
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:in block\\n}
   *normal_command@end C1 l76
   |text_arg:{verbatim after the closing command.}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim after the closing command.}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Before the opening command }
  *normal_command@verbatim C3 l78
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:in block\\n}
   *normal_command@end C1 l80
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:. A symbol on a line.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Before the opening command }
  *normal_command@verbatim C3 l83
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:in block\\n}
   *normal_command@end C1 l85
   |text_arg:{verbatim. A symbol after the closing command.}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim. A symbol after the closing command.}
     {spaces_after_argument:\\n}
';


$result_texis{'raw_commands_and_end_of_lines'} = '
@html
Surrounded by empty lines.
@end html

Block commands on a line
@html
in block
in block l2
@end html
end commands on a line.

Before the opening command @html
in block
@end html
end commands on a line.

Before the opening command @html
in block
@end html after the closing command.

Before the opening command @html
in block
@end html
. A symbol on a line.

Before the opening command @html
in block
@end html. A symbol after the closing command.

@tex
Surrounded by empty lines.
@end tex

Block commands on a line
@tex
in block
@end tex
end commands on a line.

Before the opening command @tex
in block
@end tex
end commands on a line.

Before the opening command @tex
in block
@end tex after the closing command.

Before the opening command @tex
in block
@end tex
. A symbol on a line.

Before the opening command @tex
in block
@end tex. A symbol after the closing command.

@verbatim
Surrounded by empty lines.
@end verbatim

Block commands on a line
@verbatim
in block
@end verbatim
end commands on a line.

Before the opening command @verbatim
in block
@end verbatim
end commands on a line.

Before the opening command @verbatim
in block
@end verbatim after the closing command.

Before the opening command @verbatim
in block
@end verbatim
. A symbol on a line.

Before the opening command @verbatim
in block
@end verbatim. A symbol after the closing command.
';


$result_texts{'raw_commands_and_end_of_lines'} = 'Surrounded by empty lines.

Block commands on a line
in block
in block l2
end commands on a line.

Before the opening command in block
end commands on a line.

Before the opening command in block

Before the opening command in block
. A symbol on a line.

Before the opening command in block

Surrounded by empty lines.

Block commands on a line
in block
end commands on a line.

Before the opening command in block
end commands on a line.

Before the opening command in block

Before the opening command in block
. A symbol on a line.

Before the opening command in block

Surrounded by empty lines.

Block commands on a line
in block
end commands on a line.

Before the opening command in block
end commands on a line.

Before the opening command in block

Before the opening command in block
. A symbol on a line.

Before the opening command in block
';

$result_errors{'raw_commands_and_end_of_lines'} = '* W l13|@html should only appear at the beginning of a line
 warning: @html should only appear at the beginning of a line

* W l18|@html should only appear at the beginning of a line
 warning: @html should only appear at the beginning of a line

* E l20|bad argument to @end: html after the closing command.
 bad argument to @end: html after the closing command.

* W l22|@html should only appear at the beginning of a line
 warning: @html should only appear at the beginning of a line

* W l27|@html should only appear at the beginning of a line
 warning: @html should only appear at the beginning of a line

* E l29|bad argument to @end: html. A symbol after the closing command.
 bad argument to @end: html. A symbol after the closing command.

* W l41|@tex should only appear at the beginning of a line
 warning: @tex should only appear at the beginning of a line

* W l46|@tex should only appear at the beginning of a line
 warning: @tex should only appear at the beginning of a line

* E l48|bad argument to @end: tex after the closing command.
 bad argument to @end: tex after the closing command.

* W l50|@tex should only appear at the beginning of a line
 warning: @tex should only appear at the beginning of a line

* W l55|@tex should only appear at the beginning of a line
 warning: @tex should only appear at the beginning of a line

* E l57|bad argument to @end: tex. A symbol after the closing command.
 bad argument to @end: tex. A symbol after the closing command.

* W l69|@verbatim should only appear at the beginning of a line
 warning: @verbatim should only appear at the beginning of a line

* W l74|@verbatim should only appear at the beginning of a line
 warning: @verbatim should only appear at the beginning of a line

* E l76|bad argument to @end: verbatim after the closing command.
 bad argument to @end: verbatim after the closing command.

* W l78|@verbatim should only appear at the beginning of a line
 warning: @verbatim should only appear at the beginning of a line

* W l83|@verbatim should only appear at the beginning of a line
 warning: @verbatim should only appear at the beginning of a line

* E l85|bad argument to @end: verbatim. A symbol after the closing command.
 bad argument to @end: verbatim. A symbol after the closing command.

';

$result_nodes_list{'raw_commands_and_end_of_lines'} = '';

$result_sections_list{'raw_commands_and_end_of_lines'} = '';

$result_sectioning_root{'raw_commands_and_end_of_lines'} = '';

$result_headings_list{'raw_commands_and_end_of_lines'} = '';


$result_converted{'plaintext'}->{'raw_commands_and_end_of_lines'} = 'Block commands on a line end commands on a line.

   Before the opening command end commands on a line.

   Before the opening command

   Before the opening command .  A symbol on a line.

   Before the opening command

   Block commands on a line end commands on a line.

   Before the opening command end commands on a line.

   Before the opening command

   Before the opening command .  A symbol on a line.

   Before the opening command

Surrounded by empty lines.

   Block commands on a line
in block
   end commands on a line.

   Before the opening command
in block
   end commands on a line.

   Before the opening command
in block

   Before the opening command
in block
   .  A symbol on a line.

   Before the opening command
in block
';


$result_converted{'xml'}->{'raw_commands_and_end_of_lines'} = '<preamblebeforebeginning>
</preamblebeforebeginning><html endspaces=" ">
Surrounded by empty lines.
</html>

<para>Block commands on a line
<html endspaces=" ">
in block
in block l2
</html>
end commands on a line.
</para>
<para>Before the opening command <html endspaces=" ">
in block
</html>
end commands on a line.
</para>
<para>Before the opening command <html endspaces=" ">
in block
</html>
</para>
<para>Before the opening command <html endspaces=" ">
in block
</html>
. A symbol on a line.
</para>
<para>Before the opening command <html endspaces=" ">
in block
</html>
</para>
<tex endspaces=" ">
Surrounded by empty lines.
</tex>

<para>Block commands on a line
<tex endspaces=" ">
in block
</tex>
end commands on a line.
</para>
<para>Before the opening command <tex endspaces=" ">
in block
</tex>
end commands on a line.
</para>
<para>Before the opening command <tex endspaces=" ">
in block
</tex>
</para>
<para>Before the opening command <tex endspaces=" ">
in block
</tex>
. A symbol on a line.
</para>
<para>Before the opening command <tex endspaces=" ">
in block
</tex>
</para>
<verbatim xml:space="preserve" endspaces=" ">
Surrounded by empty lines.
</verbatim>

<para>Block commands on a line
</para><verbatim xml:space="preserve" endspaces=" ">
in block
</verbatim>
<para>end commands on a line.
</para>
<para>Before the opening command </para><verbatim xml:space="preserve" endspaces=" ">
in block
</verbatim>
<para>end commands on a line.
</para>
<para>Before the opening command </para><verbatim xml:space="preserve" endspaces=" ">
in block
</verbatim>

<para>Before the opening command </para><verbatim xml:space="preserve" endspaces=" ">
in block
</verbatim>
<para>. A symbol on a line.
</para>
<para>Before the opening command </para><verbatim xml:space="preserve" endspaces=" ">
in block
</verbatim>
';

1;
