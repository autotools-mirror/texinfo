use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'various_vtable_command_as_argument'} = '*document_root C7
 *before_node_section
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
 *@chapter C16 l5 {Chap}
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
    {Chap}
  {empty_line:\\n}
  *@vtable C5 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@inlineraw l7
   *table_entry C1
    *table_term C1
     *@item C1 l8
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,1}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {html}
   *table_entry C1
    *table_term C1
     *@item C1 l9
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,2}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {docbook}
   *table_entry C1
    *table_term C1
     *@item C1 l10
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,3}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {titi}
   *@end C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{vtable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {vtable}
  {empty_line:\\n}
  *@vtable C3 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@image l13
   *table_entry C1
    *table_term C2
     *@item C1 l14
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,4}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {first}
     *@itemx C1 l15
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,5}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {second}
   *@end C1 l16
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{vtable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {vtable}
  {empty_line:\\n}
  *@vtable C3 l18
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@footnote l18
   *table_entry C1
    *table_term C2
     *@item C1 l19
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,6}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {aa}
     *@itemx C1 l20
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,7}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {bb}
   *@end C1 l21
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{vtable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {vtable}
  {empty_line:\\n}
  *@vtable C3 l23
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@caption l23
   *table_entry C1
    *table_term C2
     *@item C1 l24
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,8}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {caa}
     *@itemx C1 l25
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,9}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {cbb}
   *@end C1 l26
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{vtable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {vtable}
  {empty_line:\\n}
  *@vtable C4 l28
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@math l28
   *table_entry C1
    *table_term C1
     *@item C1 l29
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,10}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {a + b}
   *table_entry C1
    *table_term C1
     *@item C1 l30
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,11}
      *line_arg C2
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {a}
       *@sup C1 l30
        *brace_container C1
         {c}
   *@end C1 l31
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{vtable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {vtable}
  {empty_line:\\n}
  *@vtable C3 l33
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@anchor l33
   *table_entry C1
    *table_term C2
     *@item C1 l34
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,12}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {anchor 1}
     *@itemx C1 l35
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,13}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {anchor 2}
   *@end C1 l36
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{vtable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {vtable}
  {empty_line:\\n}
  *@vtable C3 l38
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@verb l38
   *table_entry C1
    *table_term C2
     *@item C1 l39
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,14}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {:uu:}
     *@itemx C1 l40
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{chap}
     |index_entry:I{vr,15}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {?nn?}
   *@end C1 l41
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{vtable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {vtable}
  {empty_line:\\n}
 *@node C1 l43 {Indices}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
 |normalized:{Indices}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Indices}
 *@appendix C3 l44 {Print the index}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Print the index}
  {empty_line:\\n}
  *@printindex C1 l46
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{vr}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {vr}
';


$result_texis{'various_vtable_command_as_argument'} = '@node Top
@top top

@node chap
@chapter Chap

@vtable @inlineraw
@item html
@item docbook
@item titi
@end vtable

@vtable @image
@item first
@itemx second
@end vtable

@vtable @footnote
@item aa
@itemx bb
@end vtable

@vtable @caption
@item caa
@itemx cbb
@end vtable

@vtable @math
@item a + b
@item a@sup{c}
@end vtable

@vtable @anchor
@item anchor 1
@itemx anchor 2
@end vtable

@vtable @verb
@item :uu:
@itemx ?nn?
@end vtable

@node Indices
@appendix Print the index

@printindex vr
';


$result_texts{'various_vtable_command_as_argument'} = 'top
***

1 Chap
******

html
docbook
titi

first
second

aa
bb

caa
cbb

a + b
ac

anchor 1
anchor 2

:uu:
?nn?

Appendix A Print the index
**************************

';

$result_errors{'various_vtable_command_as_argument'} = '* W l18|@footnote should not appear on @vtable line
 warning: @footnote should not appear on @vtable line

* W l23|@caption should not appear on @vtable line
 warning: @caption should not appear on @vtable line

* W l33|@anchor should not appear on @vtable line
 warning: @anchor should not appear on @vtable line

* W l38|@verb should not appear on @vtable line
 warning: @verb should not appear on @vtable line

';

$result_nodes_list{'various_vtable_command_as_argument'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  next->Indices
  prev->Top
  up->Top
3|Indices
 associated_section: A Print the index
 associated_title_command: A Print the index
 node_directions:
  prev->chap
  up->Top
';

$result_sections_list{'various_vtable_command_as_argument'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
  2|Print the index
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  next->Print the index
  up->top
 toplevel_directions:
  next->Print the index
  prev->top
  up->top
3|Print the index
 associated_anchor_command: Indices
 associated_node: Indices
 section_directions:
  prev->Chap
  up->top
 toplevel_directions:
  prev->Chap
  up->top
';

$result_sectioning_root{'various_vtable_command_as_argument'} = 'level: -1
list:
 1|top
';

$result_headings_list{'various_vtable_command_as_argument'} = '';

$result_indices_sort_strings{'various_vtable_command_as_argument'} = 'vr:
 :uu:
 ?nn?
 a + b
 aa
 ac
 anchor 1
 anchor 2
 bb
 caa
 cbb
 docbook
 first
 html
 second
 titi
';


$result_converted{'plaintext'}->{'various_vtable_command_as_argument'} = 'top
***

1 Chap
******

[first]
[second]

(1)
(2)

a + b
a^{c}

:uu:
?nn?

   ---------- Footnotes ----------

   (1) aa

   (2) bb

Appendix A Print the index
**************************

* Menu:

* :uu::                                  chap.                 (line 15)
* ?nn?:                                  chap.                 (line 16)
* a + b:                                 chap.                 (line 12)
* aa:                                    chap.                 (line  9)
* a^{c}:                                 chap.                 (line 13)
* anchor 1:                              chap.                 (line 15)
* anchor 2:                              chap.                 (line 15)
* bb:                                    chap.                 (line 10)
* caa:                                   chap.                 (line 12)
* cbb:                                   chap.                 (line 12)
* docbook:                               chap.                 (line  6)
* first:                                 chap.                 (line  6)
* html:                                  chap.                 (line  6)
* second:                                chap.                 (line  7)
* titi:                                  chap.                 (line  6)

';

$result_converted_errors{'plaintext'}->{'various_vtable_command_as_argument'} = [
  {
    'error_line' => 'warning: could not find @image file `first.txt\' nor alternate text
',
    'line_nr' => 14,
    'text' => 'could not find @image file `first.txt\' nor alternate text',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: could not find @image file `second.txt\' nor alternate text
',
    'line_nr' => 15,
    'text' => 'could not find @image file `second.txt\' nor alternate text',
    'type' => 'warning'
  }
];



$result_converted{'html_text'}->{'various_vtable_command_as_argument'} = '<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
[<a href="#Indices" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chap</a></li>
<li><a href="#Indices">Print the index</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
<p>
[<a href="#Indices" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<dl class="vtable">
<dt><a id="index-html"></a><span><a class="copiable-link" href="#index-html"> &para;</a></span></dt>
<dt><a id="index-docbook"></a><span><a class="copiable-link" href="#index-docbook"> &para;</a></span></dt>
<dt><a id="index-titi"></a><span><a class="copiable-link" href="#index-titi"> &para;</a></span></dt>
</dl>

<dl class="vtable">
<dt><a id="index-first"></a><span><img class="image" src="first.jpg" alt="first"><a class="copiable-link" href="#index-first"> &para;</a></span></dt>
<dt><a id="index-second"></a><span><img class="image" src="second.jpg" alt="second"><a class="copiable-link" href="#index-second"> &para;</a></span></dt>
</dl>

<dl class="vtable">
<dt><a id="index-aa"></a><span><a class="copiable-link" href="#index-aa"> &para;</a></span></dt>
<dt><a id="index-bb"></a><span><a class="copiable-link" href="#index-bb"> &para;</a></span></dt>
</dl>

<dl class="vtable">
<dt><a id="index-caa"></a><span><a class="copiable-link" href="#index-caa"> &para;</a></span></dt>
<dt><a id="index-cbb"></a><span><a class="copiable-link" href="#index-cbb"> &para;</a></span></dt>
</dl>

<dl class="vtable">
<dt><a id="index-a-_002b-b"></a><span><em class="math">a + b</em><a class="copiable-link" href="#index-a-_002b-b"> &para;</a></span></dt>
<dt><a id="index-ac"></a><span><em class="math">a<sup class="sup">c</sup></em><a class="copiable-link" href="#index-ac"> &para;</a></span></dt>
</dl>

<dl class="vtable">
<dt><a id="index-anchor-1"></a><span><a class="copiable-link" href="#index-anchor-1"> &para;</a></span></dt>
<dt><a id="index-anchor-2"></a><span><a class="copiable-link" href="#index-anchor-2"> &para;</a></span></dt>
</dl>

<dl class="vtable">
<dt><a id="index-_003auu_003a"></a><span><code class="verb">:uu:</code><a class="copiable-link" href="#index-_003auu_003a"> &para;</a></span></dt>
<dt><a id="index-_003fnn_003f"></a><span><code class="verb">?nn?</code><a class="copiable-link" href="#index-_003fnn_003f"> &para;</a></span></dt>
</dl>

<hr>
</div>
<div class="appendix-level-extent" id="Indices">
<div class="nav-panel">
<p>
[<a href="#Indices" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="appendix" id="Print-the-index"><span>Appendix A Print the index<a class="copiable-link" href="#Print-the-index"> &para;</a></span></h2>

<div class="printindex vr-printindex">
<table class="index-letters-header-printindex vr-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Indices_vr_symbol-1"><b>:</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_symbol-2"><b>?</b></a>
 &nbsp; 
<br>
<a class="summary-letter-printindex" href="#Indices_vr_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-H"><b>H</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-S"><b>S</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-T"><b>T</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex vr-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="Indices_vr_symbol-1">:</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-_003auu_003a"><code>:uu:</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="Indices_vr_symbol-2">?</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-_003fnn_003f"><code>?nn?</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="Indices_vr_letter-A">A</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-a-_002b-b"><code>a + b</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-aa"><code>aa</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-ac"><code>a<sup class="sup">c</sup></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-anchor-1"><code>anchor 1</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-anchor-2"><code>anchor 2</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="Indices_vr_letter-B">B</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-bb"><code>bb</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="Indices_vr_letter-C">C</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-caa"><code>caa</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-cbb"><code>cbb</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="Indices_vr_letter-D">D</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-docbook"><code>docbook</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="Indices_vr_letter-F">F</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-first"><code>first</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="Indices_vr_letter-H">H</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-html"><code>html</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="Indices_vr_letter-S">S</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-second"><code>second</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="Indices_vr_letter-T">T</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-titi"><code>titi</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex vr-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Indices_vr_symbol-1"><b>:</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_symbol-2"><b>?</b></a>
 &nbsp; 
<br>
<a class="summary-letter-printindex" href="#Indices_vr_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-C"><b>C</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-H"><b>H</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-S"><b>S</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Indices_vr_letter-T"><b>T</b></a>
 &nbsp; 
</td></tr></table>
</div>
</div>
</div>
';

$result_converted_errors{'html_text'}->{'various_vtable_command_as_argument'} = [
  {
    'error_line' => 'warning: @image file `first\' (for HTML) not found, using `first.jpg\'
',
    'line_nr' => 14,
    'text' => '@image file `first\' (for HTML) not found, using `first.jpg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `second\' (for HTML) not found, using `second.jpg\'
',
    'line_nr' => 15,
    'text' => '@image file `second\' (for HTML) not found, using `second.jpg\'',
    'type' => 'warning'
  }
];



$result_converted{'xml'}->{'various_vtable_command_as_argument'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

</top>
<node identifier="chap" spaces=" "><nodename>chap</nodename><nodenext automatic="on">Indices</nodenext><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chap</sectiontitle>

<vtable commandarg="inlineraw" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="inlineraw"><indexterm index="vr" number="1">html</indexterm>html</itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="inlineraw"><indexterm index="vr" number="2">docbook</indexterm>docbook</itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="inlineraw"><indexterm index="vr" number="3">titi</indexterm>titi</itemformat></item>
</tableterm></tableentry></vtable>

<vtable commandarg="image" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="image"><indexterm index="vr" number="4">first</indexterm>first</itemformat></item>
<itemx spaces=" "><itemformat command="image"><indexterm index="vr" number="5">second</indexterm>second</itemformat></itemx>
</tableterm></tableentry></vtable>

<vtable commandarg="footnote" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="footnote"><indexterm index="vr" number="6">aa</indexterm>aa</itemformat></item>
<itemx spaces=" "><itemformat command="footnote"><indexterm index="vr" number="7">bb</indexterm>bb</itemformat></itemx>
</tableterm></tableentry></vtable>

<vtable commandarg="caption" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="caption"><indexterm index="vr" number="8">caa</indexterm>caa</itemformat></item>
<itemx spaces=" "><itemformat command="caption"><indexterm index="vr" number="9">cbb</indexterm>cbb</itemformat></itemx>
</tableterm></tableentry></vtable>

<vtable commandarg="math" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="math"><indexterm index="vr" number="10">a + b</indexterm>a + b</itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="math"><indexterm index="vr" number="11">a<sup>c</sup></indexterm>a<sup>c</sup></itemformat></item>
</tableterm></tableentry></vtable>

<vtable commandarg="anchor" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="anchor"><indexterm index="vr" number="12">anchor 1</indexterm>anchor 1</itemformat></item>
<itemx spaces=" "><itemformat command="anchor"><indexterm index="vr" number="13">anchor 2</indexterm>anchor 2</itemformat></itemx>
</tableterm></tableentry></vtable>

<vtable commandarg="verb" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="verb"><indexterm index="vr" number="14">:uu:</indexterm>:uu:</itemformat></item>
<itemx spaces=" "><itemformat command="verb"><indexterm index="vr" number="15">?nn?</indexterm>?nn?</itemformat></itemx>
</tableterm></tableentry></vtable>

</chapter>
<node identifier="Indices" spaces=" "><nodename>Indices</nodename><nodeprev automatic="on">chap</nodeprev><nodeup automatic="on">Top</nodeup></node>
<appendix spaces=" "><sectiontitle>Print the index</sectiontitle>

<printindex spaces=" " value="vr" line="vr"></printindex>
</appendix>
';


$result_converted{'docbook'}->{'various_vtable_command_as_argument'} = '<chapter label="1" id="chap">
<title>Chap</title>

<variablelist><varlistentry><term><indexterm role="vr"><primary>html</primary></indexterm>
</term></varlistentry><varlistentry><term><indexterm role="vr"><primary>docbook</primary></indexterm>
</term></varlistentry><varlistentry><term><indexterm role="vr"><primary>titi</primary></indexterm>
</term></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="vr"><primary>first</primary></indexterm><informalfigure><mediaobject><imageobject><imagedata fileref="first.jpg" format="JPG"></imagedata></imageobject></mediaobject></informalfigure>
</term><term><indexterm role="vr"><primary>second</primary></indexterm><informalfigure><mediaobject><imageobject><imagedata fileref="second.jpg" format="JPG"></imagedata></imageobject></mediaobject></informalfigure>
</term></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="vr"><primary>aa</primary></indexterm><footnote><para>aa</para></footnote>
</term><term><indexterm role="vr"><primary>bb</primary></indexterm><footnote><para>bb</para></footnote>
</term></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="vr"><primary>caa</primary></indexterm>
</term><term><indexterm role="vr"><primary>cbb</primary></indexterm>
</term></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="vr"><primary>a + b</primary></indexterm><inlineequation><mathphrase>a + b</mathphrase></inlineequation>
</term></varlistentry><varlistentry><term><indexterm role="vr"><primary>a<superscript>c</superscript></primary></indexterm><inlineequation><mathphrase>a<superscript>c</superscript></mathphrase></inlineequation>
</term></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="vr"><primary>anchor 1</primary></indexterm>
</term><term><indexterm role="vr"><primary>anchor 2</primary></indexterm>
</term></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="vr"><primary>:uu:</primary></indexterm><literal>:uu:</literal>
</term><term><indexterm role="vr"><primary>?nn?</primary></indexterm><literal>?nn?</literal>
</term></varlistentry></variablelist>
</chapter>
<appendix label="A" id="Indices">
<title>Print the index</title>

<index role="vr"></index>
</appendix>
';

$result_converted_errors{'docbook'}->{'various_vtable_command_as_argument'} = [
  {
    'error_line' => 'warning: @image file `first\' not found, using `first.jpg\'
',
    'line_nr' => 14,
    'text' => '@image file `first\' not found, using `first.jpg\'',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: @image file `second\' not found, using `second.jpg\'
',
    'line_nr' => 15,
    'text' => '@image file `second\' not found, using `second.jpg\'',
    'type' => 'warning'
  }
];



$result_converted{'latex_text'}->{'various_vtable_command_as_argument'} = '\\label{anchor:Top}%
\\chapter{{Chap}}
\\label{anchor:chap}%

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
html
\\index[vr]{html@\\texttt{html}}%
}}]
\\item[{\\parbox[b]{\\linewidth}{%
docbook
\\index[vr]{docbook@\\texttt{docbook}}%
}}]
\\item[{\\parbox[b]{\\linewidth}{%
titi
\\index[vr]{titi@\\texttt{titi}}%
}}]
\\end{description}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
first\\\\
\\index[vr]{first@\\texttt{first}}%
second
\\index[vr]{second@\\texttt{second}}%
}}]
\\end{description}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
aa\\\\
\\index[vr]{aa@\\texttt{aa}}%
bb
\\index[vr]{bb@\\texttt{bb}}%
}}]
\\end{description}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
caa\\\\
\\index[vr]{caa@\\texttt{caa}}%
cbb
\\index[vr]{cbb@\\texttt{cbb}}%
}}]
\\end{description}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
a + b
\\index[vr]{a + b@\\texttt{a + b}}%
}}]
\\item[{\\parbox[b]{\\linewidth}{%
a\\textsuperscript{c}
\\index[vr]{ac@\\texttt{a\\textsuperscript{c}}}%
}}]
\\end{description}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
anchor 1\\\\
\\index[vr]{anchor 1@\\texttt{anchor 1}}%
anchor 2
\\index[vr]{anchor 2@\\texttt{anchor 2}}%
}}]
\\end{description}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
:uu:\\\\
\\index[vr]{:uu:@\\texttt{:uu:}}%
?nn?
\\index[vr]{?nn?@\\texttt{?nn?}}%
}}]
\\end{description}

\\appendix
\\chapter{{Print the index}}
\\label{anchor:Indices}%

\\printindex[vr]
';

1;
