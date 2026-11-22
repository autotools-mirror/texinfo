use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'index_entry_in_preformatted'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l5 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C6
    *index_entry_command@cindex C1 l8
    |EXTRA
    |element_node:{chap}
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:first}
      {spaces_after_argument:\\n}
    {normal_text:text\\n}
    {empty_line:\\n}
    *index_entry_command@cindex C1 l11
    |EXTRA
    |element_node:{chap}
    |index_entry:I{cp,2}
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:other}
      {spaces_after_argument: }
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment}
        {spaces_after_argument:\\n}
    {normal_text:text2\\n}
    *index_entry_command@cindex C1 l13
    |EXTRA
    |element_node:{chap}
    |index_entry:I{cp,3}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:last}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l14
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'index_entry_in_preformatted'} = '@node Top
@top top

@node chap
@chapter Chapter

@example
@cindex first
text

@cindex other @c comment
text2
@cindex last
@end example
';


$result_texts{'index_entry_in_preformatted'} = 'top
***

1 Chapter
*********

text

text2
';

$result_errors{'index_entry_in_preformatted'} = '';

$result_nodes_list{'index_entry_in_preformatted'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'index_entry_in_preformatted'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'index_entry_in_preformatted'} = 'level: -1
list:
 1|top
';

$result_headings_list{'index_entry_in_preformatted'} = '';

$result_indices_sort_strings{'index_entry_in_preformatted'} = 'cp:
 first
 last
 other
';


$result_converted{'plaintext'}->{'index_entry_in_preformatted'} = 'top
***

1 Chapter
*********

     text

     text2
';

$result_converted_sort_strings{'plaintext'}->{'index_entry_in_preformatted'} = 'cp:
 first
 last
 other
';


$result_converted{'html_text'}->{'index_entry_in_preformatted'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<div class="example">
<pre class="example-preformatted"><a class="index-entry-id" id="index-first"></a>text

<a class="index-entry-id" id="index-other"></a>text2
<a class="index-entry-id" id="index-last"></a></pre></div>
</div>
</div>
';


$result_converted{'xml'}->{'index_entry_in_preformatted'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chapter</sectiontitle>

<example endspaces=" ">
<pre xml:space="preserve"><cindex index="cp"> <indexterm index="cp" number="1">first</indexterm></cindex>
text

<cindex index="cp"> <indexterm index="cp" number="2">other</indexterm></cindex><!-- c comment -->
text2
<cindex index="cp"> <indexterm index="cp" number="3">last</indexterm></cindex>
</pre></example>
</chapter>
';


$result_converted{'docbook'}->{'index_entry_in_preformatted'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<screen><indexterm role="cp"><primary>first</primary></indexterm>text

<indexterm role="cp"><primary>other</primary></indexterm><!-- comment -->text2
<indexterm role="cp"><primary>last</primary></indexterm></screen></chapter>
';


$result_converted{'latex_text'}->{'index_entry_in_preformatted'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chap}%

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\index[cp]{first@first}%
text

\\index[cp]{other@other}%
text2
\\index[cp]{last@last}%
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
