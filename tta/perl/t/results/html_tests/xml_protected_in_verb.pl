use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'xml_protected_in_verb'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content
  *normal_command@verbatim C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:<a>\\n}
   *normal_command@end C1 l3
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@verb C1 l5
    *brace_container C3
     {verb_delimiter:.}
     {raw: <i> }
     {verb_delimiter:.}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@verbatiminclude C1 l7
  |EXTRA
  |input_encoding_name:{utf-8}
  |text_arg:{file_with_xml_chars.texi}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:file_with_xml_chars.texi}
    {spaces_after_argument:\\n}
';


$result_texis{'xml_protected_in_verb'} = '@verbatim
<a>
@end verbatim

@verb{. <i> .}.

@verbatiminclude file_with_xml_chars.texi
';


$result_texts{'xml_protected_in_verb'} = '<a>

 <i> .

';

$result_errors{'xml_protected_in_verb'} = '';

$result_nodes_list{'xml_protected_in_verb'} = '';

$result_sections_list{'xml_protected_in_verb'} = '';

$result_sectioning_root{'xml_protected_in_verb'} = '';

$result_headings_list{'xml_protected_in_verb'} = '';


$result_converted{'html'}->{'xml_protected_in_verb'} = '<!DOCTYPE html>
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
<pre class="verbatim">&lt;a&gt;
</pre>
<p><code class="verb">&nbsp;&lt;i&gt;&nbsp;</code>.
</p>
<pre class="verbatim">&lt;bidule truc=&quot;ff &amp;amp;&quot;&gt; &amp; &lt;/bidule&gt;
</pre>


</body>
</html>
';

$result_converted_errors{'html'}->{'xml_protected_in_verb'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
