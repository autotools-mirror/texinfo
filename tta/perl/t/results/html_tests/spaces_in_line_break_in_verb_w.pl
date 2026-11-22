use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'spaces_in_line_break_in_verb_w'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *paragraph C2
   *@w C1 l1
    *brace_container C2
     {normal_text:aaa  bb\\n}
     {normal_text:ccc}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@verb C1 l4
    *brace_container C4
     {verb_delimiter:|}
     {raw:aaa  bb\\n}
     {raw:ccc}
     {verb_delimiter:|}
   {normal_text:\\n}
';


$result_texis{'spaces_in_line_break_in_verb_w'} = '@w{aaa  bb
ccc}

@verb{|aaa  bb
ccc|}
';


$result_texts{'spaces_in_line_break_in_verb_w'} = 'aaa  bb
ccc

aaa  bb
ccc
';

$result_errors{'spaces_in_line_break_in_verb_w'} = '';

$result_nodes_list{'spaces_in_line_break_in_verb_w'} = '';

$result_sections_list{'spaces_in_line_break_in_verb_w'} = '';

$result_sectioning_root{'spaces_in_line_break_in_verb_w'} = '';

$result_headings_list{'spaces_in_line_break_in_verb_w'} = '';


$result_converted{'html'}->{'spaces_in_line_break_in_verb_w'} = '<!DOCTYPE html>
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
<p>aaa&nbsp;bb&nbsp;ccc<!-- /@w -->
</p>
<p><code class="verb">aaa&nbsp;&nbsp;bb<br >ccc</code>
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'spaces_in_line_break_in_verb_w'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
