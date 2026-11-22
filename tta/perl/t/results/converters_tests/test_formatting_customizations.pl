use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_formatting_customizations'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C1 formatting_customizations_input.texi:l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 formatting_customizations_input.texi:l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 formatting_customizations_input.texi:l4 {chapt}
 |EXTRA
 |identifier:{chapt}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapt}
    {spaces_after_argument:\\n}
 *@chapter C4 formatting_customizations_input.texi:l5 {Chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C8
   *@AA C1 formatting_customizations_input.texi:l7
    *brace_container
   {normal_text: }
   *@equiv C1 formatting_customizations_input.texi:l7
    *brace_container
   {normal_text: }
   *@@
   {normal_text: }
   *@copyright C1 formatting_customizations_input.texi:l7
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
';


$result_texis{'test_formatting_customizations'} = '@node Top
@top top

@node chapt
@chapter Chap

@AA{} @equiv{} @@ @copyright{}

';


$result_texts{'test_formatting_customizations'} = 'top
***

1 Chap
******

AA == @ (C)

';

$result_errors{'test_formatting_customizations'} = '';

$result_nodes_list{'test_formatting_customizations'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapt
2|chapt
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'test_formatting_customizations'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chapt
 associated_node: chapt
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'test_formatting_customizations'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_formatting_customizations'} = '';


$result_converted{'plaintext'}->{'test_formatting_customizations'} = 'top
***

Chap
****

Å == @ (C)

';


$result_converted{'html_text'}->{'test_formatting_customizations'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapt">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapt">
<h2 class="chapter" id="Chap"><span>Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<p>&Aring; &equiv; @ &copy;
</p>
</div>
</div>
';


$result_converted{'xml'}->{'test_formatting_customizations'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapt</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chapt"><nodename> chapt</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chap</sectiontitle>

<para>&Aring; &equiv; &arobase; &copyright;
</para>
</chapter>
';


$result_converted{'docbook'}->{'test_formatting_customizations'} = '<chapter label="" id="chapt">
<title>Chap</title>

<para>&#197; &#8801; @ &#169;
</para>
</chapter>
';


$result_converted{'latex_text'}->{'test_formatting_customizations'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:chapt}%

\\AA{} $\\equiv{}$ @ \\copyright{}

';

1;
