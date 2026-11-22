use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'references_to_top_no_top_output'} = '*document_root C5
 *before_node_section C2
  *preamble_before_setfilename C1
   *preamble_before_beginning C1
    {text_before_beginning:\\n}
  *preamble_before_content C4
   *normal_command@setfilename C1 l2
   |text_arg:{references_to_top_no_top_output.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:references_to_top_no_top_output.info}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@copying C3 l4
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C3
     {normal_text:Copying\\n}
     *normal_command@anchor C1 l6
     |identifier:{a-in-copying}
     |is_target:{1}
      *brace_arg C1
      |element_region:{copying}
       {normal_text:a in copying}
     {spaces_after_close_brace:\\n}
    *normal_command@end C1 l7
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l9 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C19 l10 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Begin Top\\n}
  {empty_line:\\n}
  *normal_command@anchor C1 l14
  |identifier:{a-in-top}
  |is_target:{1}
   *brace_arg C1
    {normal_text:a in top}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Paragraph }
   *normal_command@anchor C1 l16
   |identifier:{a-in-paragraph-in-top}
   |is_target:{1}
    *brace_arg C1
     {normal_text:a in paragraph in top}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@footnote C1 l18
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C2
      {normal_text:in footnote }
      *normal_command@anchor C1 l18
      |identifier:{a-in-footnote}
      |is_target:{1}
       *brace_arg C1
        {normal_text:a in footnote}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@insertcopying C1 l20
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C5 l22
  |float_number:{1}
  |float_type:{list}
  |global_command_number:{1}
  |identifier:{My-Flist}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:list}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:My Flist}
     {spaces_after_argument:\\n}
   *paragraph C3
    {normal_text:In Flist\\n}
    *normal_command@anchor C1 l24
    |identifier:{a-in-float}
    |is_target:{1}
     *brace_arg C1
      {normal_text:a in float}
    {normal_text:.\\n}
   *normal_command@caption C1 l25
    *brace_command_context C1
     *paragraph C2
      {normal_text:Caption Flist. }
      *normal_command@anchor C1 l25
      |identifier:{a-in-caption}
      |is_target:{1}
       *brace_arg C1
        {normal_text:a in caption}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l26
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l28
  |element_node:{Top}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:index in Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:End of Top\\n}
  {empty_line:\\n}
 *normal_command@node C1 l32 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C11 l33 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C12
   *normal_command@pxref C1 l35
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{a-in-copying}
     {normal_text:a in copying}
   {normal_text:.\\n}
   *normal_command@pxref C1 l36
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{a-in-top}
     {normal_text:a in top}
   {normal_text:\\n}
   *normal_command@pxref C1 l37
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{a-in-footnote}
     {normal_text:a in footnote}
   {normal_text:\\n}
   *normal_command@pxref C1 l38
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{a-in-float}
     {normal_text:a in float}
   {normal_text:\\n}
   *normal_command@pxref C1 l39
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{a-in-caption}
     {normal_text:a in caption}
   {normal_text:\\n}
   *normal_command@pxref C1 l40
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{a-in-paragraph-in-top}
     {normal_text:a in paragraph in top}
   {normal_text:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l42
  |element_node:{chapter}
  |index_entry:I{cp,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap index}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l44
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C5 l46
  |float_number:{1.1}
  |float_type:{list}
  |global_command_number:{2}
  |identifier:{Main-Flist}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:list}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Main Flist}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In Main\\n}
   *normal_command@caption C1 l48
    *brace_command_context C1
     *paragraph C1
      {normal_text:Caption Main}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l49
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l51
  |float_type:{list}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:list}
    {spaces_after_argument:\\n}
';


$result_texis{'references_to_top_no_top_output'} = '
@setfilename references_to_top_no_top_output.info

@copying
Copying
@anchor{a in copying}
@end copying

@node Top
@top top

Begin Top

@anchor{a in top}

Paragraph @anchor{a in paragraph in top}.

@footnote{in footnote @anchor{a in footnote}}

@insertcopying

@float list, My Flist
In Flist
@anchor{a in float}.
@caption{Caption Flist. @anchor{a in caption}}
@end float

@cindex index in Top

End of Top

@node chapter
@chapter Chap

@pxref{a in copying}.
@pxref{a in top}
@pxref{a in footnote}
@pxref{a in float}
@pxref{a in caption}
@pxref{a in paragraph in top}

@cindex chap index

@printindex cp

@float list, Main Flist
In Main
@caption{Caption Main}
@end float

@listoffloats list
';


$result_texts{'references_to_top_no_top_output'} = '

top
***

Begin Top


Paragraph .




list, My Flist
In Flist
.


End of Top

1 Chap
******

a in copying.
a in top
a in footnote
a in float
a in caption
a in paragraph in top



list, Main Flist
In Main

';

$result_errors{'references_to_top_no_top_output'} = '';

$result_floats{'references_to_top_no_top_output'} = 'list: 2
 F1: {My-Flist}
  C: Caption Flist. @anchor{a in caption}
 F1.1: {Main-Flist}
  C: Caption Main
';

$result_nodes_list{'references_to_top_no_top_output'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'references_to_top_no_top_output'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'references_to_top_no_top_output'} = 'level: -1
list:
 1|top
';

$result_headings_list{'references_to_top_no_top_output'} = '';

$result_indices_sort_strings{'references_to_top_no_top_output'} = 'cp:
 chap index
 index in Top
';

$result_converted_sort_strings{'file_html'}->{'references_to_top_no_top_output'} = 'cp:
 chap index
 index in Top
';


$result_converted{'html_text'}->{'references_to_top_no_top_output'} = '

<a class="node" id="Top"></a><p class="nav-panel">
<span class="nav-button">[<a href="#chapter" title="Index" rel="index">Index</a>]</span></p>
<a class="top" id="top"></a><ul class="mini-toc">
<li><a href="#chapter">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button">[<a href="#chapter" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<p>see <a class="pxref" href="#a-in-copying">a in copying</a>.
see <a class="pxref" href="#a-in-top">a in top</a>
see <a class="pxref" href="#a-in-footnote">a in footnote</a>
see <a class="pxref" href="#a-in-float">a in float</a>
see <a class="pxref" href="#a-in-caption">a in caption</a>
see <a class="pxref" href="#a-in-paragraph-in-top">a in paragraph in top</a>
</p>
<a class="index-entry-id" id="index-chap-index"></a>

<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter_cp_letter-C">C</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-chap-index">chap index</a></td><td class="printindex-index-section"><a href="#chapter">chapter</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

<div class="float" id="Main-Flist">
<p>In Main
</p><div class="caption"><p><strong class="strong">list 1.1: </strong>Caption Main</p></div></div>
<dl class="listoffloats">
<dt><a href="#My-Flist">list 1</a></dt><dd class="caption-in-listoffloats"><p>Caption Flist. </p></dd>
<dt><a href="#Main-Flist">list 1.1</a></dt><dd class="caption-in-listoffloats"><p>Caption Main</p></dd>
</dl>
</div>
';

1;
