use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'sections_and_printindex'} = '*document_root C8
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 l2 {for example}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:for example}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {node}
 |EXTRA
 |identifier:{node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node}
    {spaces_after_argument:\\n}
 *@chapter C3 l5 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l7
  |EXTRA
  |element_node:{node}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry1}
    {spaces_after_argument:\\n}
 *@node C1 l8 {sec}
 |EXTRA
 |identifier:{sec}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:sec}
    {spaces_after_argument:\\n}
 *@section C3 l9 {Sec}
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Sec}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l11
  |EXTRA
  |element_node:{sec}
  |index_entry:I{cp,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:entry2}
    {spaces_after_argument:\\n}
 *@appendix C4 l12 {App}
 |EXTRA
 |identifier:{App}
 |is_target:{1}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:App}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 l14
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'sections_and_printindex'} = '@node Top
@top for example

@node node
@chapter chap

@cindex entry1
@node sec
@section Sec

@cindex entry2
@appendix App

@printindex cp

';


$result_texts{'sections_and_printindex'} = 'for example
***********

1 chap
******

1.1 Sec
=======

Appendix A App
**************


';

$result_errors{'sections_and_printindex'} = '';

$result_nodes_list{'sections_and_printindex'} = '1|Top
 associated_section: for example
 associated_title_command: for example
 node_directions:
  next->node
2|node
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
3|sec
 associated_section: 1.1 Sec
 associated_title_command: 1.1 Sec
 node_directions:
  up->node
';

$result_sections_list{'sections_and_printindex'} = '1|for example
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
  2|App
2|chap
 associated_anchor_command: node
 associated_node: node
 section_directions:
  next->App
  up->for example
 toplevel_directions:
  next->App
  prev->for example
  up->for example
 section_children:
  1|Sec
3|Sec
 associated_anchor_command: sec
 associated_node: sec
 section_directions:
  up->chap
4|App
 section_directions:
  prev->chap
  up->for example
 toplevel_directions:
  prev->chap
  up->for example
';

$result_sectioning_root{'sections_and_printindex'} = 'level: -1
list:
 1|for example
';

$result_headings_list{'sections_and_printindex'} = '';

$result_indices_sort_strings{'sections_and_printindex'} = 'cp:
 entry1
 entry2
';


$result_converted{'plaintext'}->{'sections_and_printindex'} = 'for example
***********

1 chap
******

1.1 Sec
=======

Appendix A App
**************

* Menu:

* entry1:                                node.                  (line 5)
* entry2:                                sec.                   (line 9)

';

$result_converted_sort_strings{'plaintext'}->{'sections_and_printindex'} = 'cp:
 entry1
 entry2
';


$result_converted{'html_text'}->{'sections_and_printindex'} = '<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button">[<a href="#sec" title="Index" rel="index">Index</a>]</span></p>
<h1 class="top" id="for-example"><span>for example<a class="copiable-link" href="#for-example"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#node">chap</a></li>
<li><a href="#App">App</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="node">
<p class="nav-panel">
<span class="nav-button">[<a href="#sec" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<a class="index-entry-id" id="index-entry1"></a>
<ul class="mini-toc">
<li><a href="#sec">Sec</a></li>
</ul>
<hr>
<div class="section-level-extent" id="sec">
<p class="nav-panel">
<span class="nav-button">[<a href="#sec" title="Index" rel="index">Index</a>]</span></p>
<h3 class="section" id="Sec"><span>1.1 Sec<a class="copiable-link" href="#Sec"> &para;</a></span></h3>

<a class="index-entry-id" id="index-entry2"></a>
</div>
</div>
<div class="appendix-level-extent" id="App">
<h2 class="appendix"><span>Appendix A App<a class="copiable-link" href="#App"> &para;</a></span></h2>

<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="sec_cp_letter-E">E</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-entry1">entry1</a></td><td class="printindex-index-section"><a href="#node">node</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-entry2">entry2</a></td><td class="printindex-index-section"><a href="#sec">sec</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

</div>
</div>
';


$result_converted{'xml'}->{'sections_and_printindex'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> node</nodenext></node>
<top><sectiontitle> for example</sectiontitle>

</top>
<node identifier="node"><nodename> node</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap</sectiontitle>

<cindex index="cp"> <indexterm index="cp" number="1">entry1</indexterm></cindex>
<node identifier="sec"><nodename> sec</nodename><nodeup automatic="on"> node</nodeup></node>
<section><sectiontitle> Sec</sectiontitle>

<cindex index="cp"> <indexterm index="cp" number="2">entry2</indexterm></cindex>
</section>
</chapter>
<appendix><sectiontitle> App</sectiontitle>

<printindex value="cp" line=" cp"></printindex>

</appendix>
';


$result_converted{'docbook'}->{'sections_and_printindex'} = '<chapter label="1" id="node">
<title>chap</title>

<indexterm role="cp"><primary>entry1</primary></indexterm>
<sect1 label="1.1" id="sec">
<title>Sec</title>

<indexterm role="cp"><primary>entry2</primary></indexterm>
</sect1>
</chapter>
<appendix label="A" id="App">
<title>App</title>

<index role="cp"></index>

</appendix>
';


$result_converted{'latex_text'}->{'sections_and_printindex'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{chap}}
\\label{anchor:node}%

\\index[cp]{entry1@entry1}%
\\section{{Sec}}
\\label{anchor:sec}%

\\index[cp]{entry2@entry2}%
\\appendix
\\renewcommand{\\Texinfoheadingchaptername}{\\appendixname}
\\Texinfochapter{{App}}
\\label{anchor:App}%

\\printindex[cp]

';

1;
