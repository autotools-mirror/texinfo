use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'accent_argument_non_ascii'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C2 l2 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
 *@node C1 l4 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
 *@chapter C2 l5 {Chapter}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Chapter}
  *paragraph C4
   *@\' C1 l6
    *brace_container C1
     {ê}
   {\\n}
   *@\' C1 l7
    *following_arg C1
     {ê}
   {\\n}
';


$result_texis{'accent_argument_non_ascii'} = '@node Top
@top top

@node chap
@chapter Chapter
@\'{ê}
@\'ê
';


$result_texts{'accent_argument_non_ascii'} = 'top
***

1 Chapter
*********
ê\'
ê\'
';

$result_errors{'accent_argument_non_ascii'} = '';

$result_nodes_list{'accent_argument_non_ascii'} = '1|Top
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

$result_sections_list{'accent_argument_non_ascii'} = '1|top
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

$result_sectioning_root{'accent_argument_non_ascii'} = 'level: -1
list:
 1|top
';

$result_headings_list{'accent_argument_non_ascii'} = '';


$result_converted{'plaintext'}->{'accent_argument_non_ascii'} = 'top
***

1 Chapter
*********

ế ế
';


$result_converted{'html_text'}->{'accent_argument_non_ascii'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>
<p>ê&#769;
ê&#769;
</p></div>
</div>
';


$result_converted{'xml'}->{'accent_argument_non_ascii'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

</top>
<node identifier="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chapter</sectiontitle>
<para><accent type="acute">ê</accent>
<accent type="acute" bracketed="off">ê</accent>
</para></chapter>
';


$result_converted{'docbook'}->{'accent_argument_non_ascii'} = '<chapter label="1" id="chap">
<title>Chapter</title>
<para>ê&#769;
ê&#769;
</para></chapter>
';


$result_converted{'latex_text'}->{'accent_argument_non_ascii'} = '\\begin{document}
\\label{anchor:Top}%
\\chapter{{Chapter}}
\\label{anchor:chap}%
\\\'{ê}
\\\'{ê}
';

1;
