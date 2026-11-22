use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'commands_in_abbr'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *paragraph C2
   *normal_command@abbr C2 l1
    *brace_arg C1
     {normal_text:A}
    *brace_arg C3
     {spaces_before_argument: }
     *normal_command@b C1 l1
      *brace_container C1
       {normal_text:abbr}
     {normal_text: -- b}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@example C3 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    *normal_command@abbr C2 l4
     *brace_arg C1
      {normal_text:A}
     *brace_arg C3
      {spaces_before_argument: }
      *normal_command@b C1 l4
       *brace_container C1
        {normal_text:abbr}
      {normal_text: -- b}
    {normal_text:.\\n}
   *normal_command@end C1 l5
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'commands_in_abbr'} = '@abbr{A, @b{abbr} -- b}.

@example
@abbr{A, @b{abbr} -- b}.
@end example
';


$result_texts{'commands_in_abbr'} = 'A (abbr - b).

A (abbr -- b).
';

$result_errors{'commands_in_abbr'} = '';

$result_nodes_list{'commands_in_abbr'} = '';

$result_sections_list{'commands_in_abbr'} = '';

$result_sectioning_root{'commands_in_abbr'} = '';

$result_headings_list{'commands_in_abbr'} = '';


$result_converted{'html'}->{'commands_in_abbr'} = '<!DOCTYPE html>
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
<p><abbr class="abbr" title="abbr &ndash; b">A</abbr> (<b class="b">abbr</b> &ndash; b).
</p>
<div class="example">
<pre class="example-preformatted"><abbr class="abbr" title="abbr &ndash; b">A</abbr> (<b class="b">abbr</b> -- b).
</pre></div>



</body>
</html>
';

$result_converted_errors{'html'}->{'commands_in_abbr'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
