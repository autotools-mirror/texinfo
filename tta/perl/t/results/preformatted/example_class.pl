use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'example_class'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:perl}
     {spaces_after_argument:\\n}
   *preformatted C21
    {normal_text:foreach my $unclosed_file (keys(%unclosed_files)) }
    *normal_command@{
    {normal_text:\\n}
    {normal_text:  if (!close($unclosed_files}
    *normal_command@{
    {normal_text:$unclosed_file}
    *normal_command@}
    {normal_text:)) }
    *normal_command@{
    {normal_text:\\n}
    {normal_text:    warn(sprintf("%s: error on closing %s: %s\\n",\\n}
    {normal_text:                     $real_command_name, $unclosed_file, $!));\\n}
    {normal_text:    $error_count++;\\n}
    {normal_text:    _exit($error_count, \\}
    *normal_command@@
    {normal_text:opened_files);\\n}
    {normal_text:  }
    *normal_command@}
    {normal_text:\\n}
    *normal_command@}
    {normal_text:\\n}
   *normal_command@end C1 l10
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'example_class'} = '@example perl
foreach my $unclosed_file (keys(%unclosed_files)) @{
  if (!close($unclosed_files@{$unclosed_file@})) @{
    warn(sprintf("%s: error on closing %s: %s\\n",
                     $real_command_name, $unclosed_file, $!));
    $error_count++;
    _exit($error_count, \\@@opened_files);
  @}
@}
@end example
';


$result_texts{'example_class'} = 'foreach my $unclosed_file (keys(%unclosed_files)) {
  if (!close($unclosed_files{$unclosed_file})) {
    warn(sprintf("%s: error on closing %s: %s\\n",
                     $real_command_name, $unclosed_file, $!));
    $error_count++;
    _exit($error_count, \\@opened_files);
  }
}
';

$result_errors{'example_class'} = '';

$result_nodes_list{'example_class'} = '';

$result_sections_list{'example_class'} = '';

$result_sectioning_root{'example_class'} = '';

$result_headings_list{'example_class'} = '';


$result_converted{'plaintext'}->{'example_class'} = '     foreach my $unclosed_file (keys(%unclosed_files)) {
       if (!close($unclosed_files{$unclosed_file})) {
         warn(sprintf("%s: error on closing %s: %s\\n",
                          $real_command_name, $unclosed_file, $!));
         $error_count++;
         _exit($error_count, \\@opened_files);
       }
     }
';


$result_converted{'html'}->{'example_class'} = '<!DOCTYPE html>
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

<style type="text/css">
div.example {margin-left: 3.2em}
</style>


</head>

<body>
<div class="example user-perl">
<pre class="example-preformatted">foreach my $unclosed_file (keys(%unclosed_files)) {
  if (!close($unclosed_files{$unclosed_file})) {
    warn(sprintf(&quot;%s: error on closing %s: %s\\n&quot;,
                     $real_command_name, $unclosed_file, $!));
    $error_count++;
    _exit($error_count, \\@opened_files);
  }
}
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'example_class'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'example_class'} = '<screen>foreach my $unclosed_file (keys(%unclosed_files)) {
  if (!close($unclosed_files{$unclosed_file})) {
    warn(sprintf(&quot;%s: error on closing %s: %s\\n&quot;,
                     $real_command_name, $unclosed_file, $!));
    $error_count++;
    _exit($error_count, \\@opened_files);
  }
}
</screen>';


$result_converted{'xml'}->{'example_class'} = '<example endspaces=" "><examplelanguage> perl</examplelanguage>
<pre xml:space="preserve">foreach my $unclosed_file (keys(%unclosed_files)) &lbrace;
  if (!close($unclosed_files&lbrace;$unclosed_file&rbrace;)) &lbrace;
    warn(sprintf(&quot;%s: error on closing %s: %s\\n&quot;,
                     $real_command_name, $unclosed_file, $!));
    $error_count++;
    _exit($error_count, \\&arobase;opened_files);
  &rbrace;
&rbrace;
</pre></example>
';


$result_converted{'latex_text'}->{'example_class'} = '\\begin{document}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily foreach my \\$unclosed\\_file (keys(\\%unclosed\\_files)) \\{
\\  if (!close(\\$unclosed\\_files\\{\\$unclosed\\_file\\})) \\{
\\    warn(sprintf("\\%s:\\ error on closing \\%s:\\ \\%s\\textbackslash{}n",
\\                     \\$real\\_command\\_name,\\ \\$unclosed\\_file,\\ \\$!));
\\    \\$error\\_count++;
\\    \\_exit(\\$error\\_count,\\ \\textbackslash{}@opened\\_files);
\\  \\}
\\}
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
