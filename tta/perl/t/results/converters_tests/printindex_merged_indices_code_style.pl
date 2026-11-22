use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'printindex_merged_indices_code_style'} = '*document_root C5
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
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C25 l5 {Chapter}
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
  *normal_command@synindex C1 l7
  |EXTRA
  |misc_args:A{cp|fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@synindex C1 l9
  |EXTRA
  |misc_args:A{vr|fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:vr fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l11
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c``b}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@vindex C1 l13
  |EXTRA
  |element_node:{chap}
  |index_entry:I{vr,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:v``j}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 l15
  |EXTRA
  |element_node:{chap}
  |index_entry:I{fn,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:f``g}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defcodeindex C1 l17
  |EXTRA
  |misc_args:A{cdi}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cdi}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@synindex C1 l19
  |EXTRA
  |misc_args:A{cdi|fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cdi fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cdiindex C1 l21
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cdi,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cdi``h}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defindex C1 l23
  |EXTRA
  |misc_args:A{ddi}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ddi}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@syncodeindex C1 l25
  |EXTRA
  |misc_args:A{ddi|cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ddi cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@ddiindex C1 l27
  |EXTRA
  |element_node:{chap}
  |index_entry:I{ddi,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ddi``g}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l29
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
';


$result_texis{'printindex_merged_indices_code_style'} = '@node Top
@top top

@node chap
@chapter Chapter

@synindex cp fn

@synindex vr fn

@cindex c``b

@vindex v``j

@findex f``g

@defcodeindex cdi

@synindex cdi fn

@cdiindex cdi``h

@defindex ddi

@syncodeindex ddi cp

@ddiindex ddi``g

@printindex fn
';


$result_texts{'printindex_merged_indices_code_style'} = 'top
***

1 Chapter
*********












';

$result_errors{'printindex_merged_indices_code_style'} = '';

$result_indices{'printindex_merged_indices_code_style'} = 'cdi ->fn
cp ->fn
ddi C ->fn
fn C
ky C
pg C
tp C
vr ->fn
';

$result_nodes_list{'printindex_merged_indices_code_style'} = '1|Top
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

$result_sections_list{'printindex_merged_indices_code_style'} = '1|top
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

$result_sectioning_root{'printindex_merged_indices_code_style'} = 'level: -1
list:
 1|top
';

$result_headings_list{'printindex_merged_indices_code_style'} = '';

$result_indices_sort_strings{'printindex_merged_indices_code_style'} = 'fn:
 c"b
 cdi"h
 ddi``g
 f``g
 v"j
';


$result_converted{'plaintext'}->{'printindex_merged_indices_code_style'} = 'top
***

1 Chapter
*********

* Menu:

* c"b:                                   chap.                  (line 6)
* cdi"h:                                 chap.                  (line 6)
* ddi``g:                                chap.                  (line 6)
* f``g:                                  chap.                  (line 6)
* v"j:                                   chap.                  (line 6)

';

$result_converted_sort_strings{'plaintext'}->{'printindex_merged_indices_code_style'} = 'fn:
 c"b
 cdi"h
 ddi``g
 f``g
 v"j
';


$result_converted{'html_text'}->{'printindex_merged_indices_code_style'} = '<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>



<a class="index-entry-id" id="index-c_0060_0060b"></a>

<a class="index-entry-id" id="index-v_0060_0060j"></a>

<a class="index-entry-id" id="index-f_0060_0060g"></a>



<a class="index-entry-id" id="index-cdi_0060_0060h"></a>



<a class="index-entry-id" id="index-ddi_0060_0060g"></a>

<div class="printindex fn-printindex">
<table class="index-letters-header-printindex fn-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-V"><b>V</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex fn-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-C">C</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-c_0060_0060b">c&ldquo;b</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-cdi_0060_0060h">cdi&ldquo;h</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-D">D</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-ddi_0060_0060g"><code>ddi``g</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-F">F</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-f_0060_0060g"><code>f``g</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-V">V</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-v_0060_0060j">v&ldquo;j</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex fn-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_fn_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-V"><b>V</b></a>
 &nbsp; 
</td></tr></table>
</div>
</div>
</div>
';


$result_converted{'xml'}->{'printindex_merged_indices_code_style'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chapter</sectiontitle>

<synindex from="cp" to="fn" line=" cp fn"></synindex>

<synindex from="vr" to="fn" line=" vr fn"></synindex>

<cindex index="cp"> <indexterm index="cp" number="1" mergedindex="fn">c&textldquo;b</indexterm></cindex>

<vindex index="vr"> <indexterm index="vr" number="1" incode="0" mergedindex="fn">v&textldquo;j</indexterm></vindex>

<findex index="fn"> <indexterm index="fn" number="1">f``g</indexterm></findex>

<defcodeindex value="cdi" line=" cdi"></defcodeindex>

<synindex from="cdi" to="fn" line=" cdi fn"></synindex>

<indexcommand command="cdiindex" index="cdi"> <indexterm index="cdi" number="1" incode="0" mergedindex="fn">cdi&textldquo;h</indexterm></indexcommand>

<defindex value="ddi" line=" ddi"></defindex>

<syncodeindex from="ddi" to="cp" line=" ddi cp"></syncodeindex>

<indexcommand command="ddiindex" index="ddi"> <indexterm index="ddi" number="1" incode="1" mergedindex="fn">ddi``g</indexterm></indexcommand>

<printindex value="fn" line=" fn"></printindex>
</chapter>
';


$result_converted{'docbook'}->{'printindex_merged_indices_code_style'} = '<chapter label="1" id="chap">
<title>Chapter</title>



<indexterm role="cp"><primary>c&#8220;b</primary></indexterm>

<indexterm role="vr"><primary>v&#8220;j</primary></indexterm>

<indexterm role="fn"><primary>f``g</primary></indexterm>



<indexterm role="cdi"><primary>cdi&#8220;h</primary></indexterm>



<indexterm role="ddi"><primary>ddi``g</primary></indexterm>

<index role="fn"></index>
</chapter>
';

1;
