use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'U_in_contain_plain_text'} = '*document_root C5
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
 *normal_command@chapter C8 l5 {chap}
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
  *paragraph C7
   {normal_text:TT }
   *normal_command@U C1 l7
    *brace_arg C1
     {normal_text:2021}
   {normal_text: a}
   *normal_command@tie C1 l7
    *brace_container
   {normal_text:b }
   *normal_command@^ C1 l7
    *brace_container C1
     *normal_command@U C1 l7
      *brace_arg C1
       {normal_text:1E2B}
   {normal_text:.\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 l9
  |EXTRA
  |element_node:{chap}
  |index_entry:I{fn,1}
  |sortas:{ ab }
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:aa}
    {spaces_at_end: }
    *normal_command@sortas C1 l9
     *brace_arg C5
      *normal_command@U C1 l9
       *brace_arg C1
        {normal_text:2021}
      {normal_text: a}
      *normal_command@tie C1 l9
       *brace_container
      {normal_text:b }
      *normal_command@^ C1 l9
       *brace_container C1
        *normal_command@U C1 l9
         *brace_arg C1
          {normal_text:1E2B}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l11
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'U_in_contain_plain_text'} = '@node Top
@top top

@node chap
@chapter chap

TT @U{2021} a@tie{}b @^{@U{1E2B}}.

@findex aa @sortas{@U{2021} a@tie{}b @^{@U{1E2B}}}

@printindex fn

';


$result_texts{'U_in_contain_plain_text'} = 'top
***

1 chap
******

TT U+2021 a b U+1E2B^.



';

$result_errors{'U_in_contain_plain_text'} = '';

$result_nodes_list{'U_in_contain_plain_text'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'U_in_contain_plain_text'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'U_in_contain_plain_text'} = 'level: -1
list:
 1|top
';

$result_headings_list{'U_in_contain_plain_text'} = '';

$result_indices_sort_strings{'U_in_contain_plain_text'} = 'fn:
  ab 
';


$result_converted{'plaintext'}->{'U_in_contain_plain_text'} = 'top
***

1 chap
******

TT ‡ a b ḫ̂.

* Menu:

* aa:                                    chap.                  (line 8)

';

$result_converted_sort_strings{'plaintext'}->{'U_in_contain_plain_text'} = 'fn:
  ab 
';


$result_converted{'html_text'}->{'U_in_contain_plain_text'} = '<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="chap-1"><span>1 chap<a class="copiable-link" href="#chap-1"> &para;</a></span></h2>

<p>TT &#x2021; a&nbsp;b &#x1E2B;&#770;.
</p>
<a class="index-entry-id" id="index-aa"></a>

<div class="printindex fn-printindex">
<table class="index-entries-printindex fn-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_symbol-1"> </th></tr>
<tr><td class="printindex-index-entry"><a href="#index-aa"><code>aa</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

</div>
</div>
';


$result_converted{'xml'}->{'U_in_contain_plain_text'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap</sectiontitle>

<para>TT <U>2021</U> a&nbsp;b <accent type="circ"><U>1E2B</U></accent>.
</para>
<findex index="fn"> <indexterm index="fn" number="1">aa <sortas><U>2021</U> a&nbsp;b <accent type="circ"><U>1E2B</U></accent></sortas></indexterm></findex>

<printindex value="fn" line=" fn"></printindex>

</chapter>
';


$result_converted{'latex_text'}->{'U_in_contain_plain_text'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{chap}}
\\label{anchor:chap}%

TT ‡ a~b \\^{ḫ}.

\\index[fn]{ ab @\\texttt{aa}}%

\\printindex[fn]

';


$result_converted{'docbook'}->{'U_in_contain_plain_text'} = '<chapter label="1" id="chap">
<title>chap</title>

<para>TT &#x2021; a&#160;b &#x1E2B;&#770;.
</para>
<indexterm role="fn"><primary>aa</primary></indexterm>

<index role="fn"></index>

</chapter>
';

1;
