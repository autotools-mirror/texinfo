use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inter_item_commands_in_table'} = '*document_root C5
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C27 l5 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@vtable C3 l7
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l7
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C2
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment in table}
       {spaces_after_argument:\\n}
     *normal_command@item C1 l9
     |element_node:{chapter}
     |index_entry:I{vr,1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:acode--b}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine\\n}
   *normal_command@end C1 l11
   |text_arg:{vtable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vtable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@vtable C3 l13
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l13
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C3
     *normal_command@item C1 l14
     |element_node:{chapter}
     |index_entry:I{vr,2}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:aasis--b}
       {spaces_after_argument:\\n}
     *inter_item C1
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment between item and itemx}
        {spaces_after_argument:\\n}
     *normal_command@itemx C1 l16
     |element_node:{chapter}
     |index_entry:I{vr,3}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:b}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine\\n}
   *normal_command@end C1 l18
   |text_arg:{vtable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vtable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@ftable C4 l20
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@var l20
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C3
     *normal_command@item C1 l21
     |element_node:{chapter}
     |index_entry:I{fn,1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:avar--b}
       {spaces_after_argument:\\n}
     *inter_item C3
      *index_entry_command@cindex C1 l22
      |element_node:{chapter}
      |index_entry:I{cp,1}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:index entry between item and itemx}
        {spaces_after_argument:\\n}
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:and a comment}
        {spaces_after_argument:\\n}
      *normal_command@comment C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:and another comment}
        {spaces_after_argument:\\n}
     *normal_command@itemx C1 l25
     |element_node:{chapter}
     |index_entry:I{fn,2}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:b}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine\\n}
   *table_entry C2
    *table_term C3
     *normal_command@item C1 l27
     |element_node:{chapter}
     |index_entry:I{fn,3}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:c}
       {spaces_after_argument:\\n}
     *inter_item C3
      {empty_line:\\n}
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment between lines}
        {spaces_after_argument:\\n}
      {empty_line:\\n}
     *normal_command@itemx C1 l31
     |element_node:{chapter}
     |index_entry:I{fn,4}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:d}
       {spaces_after_argument:\\n}
    *table_definition C2
     {empty_line:\\n}
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment at end}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l34
   |text_arg:{ftable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ftable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@ftable C3 l36
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@emph l36
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C3
     *normal_command@item C1 l37
     |element_node:{chapter}
     |index_entry:I{fn,5}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:a}
       {spaces_after_argument:\\n}
     *inter_item C1
      *index_entry_command@cindex C1 l38
      |element_node:{chapter}
      |index_entry:I{cp,2}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:index entry between item and itemx}
        {spaces_after_argument:\\n}
     *normal_command@itemx C1 l39
     |element_node:{chapter}
     |index_entry:I{fn,6}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:b}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine\\n}
   *normal_command@end C1 l41
   |text_arg:{ftable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ftable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C3 l43
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l43
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C3
     *index_entry_command@cindex C1 l44
     |element_node:{chapter}
     |index_entry:I{cp,3}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cindex in table}
       {spaces_after_argument: \\n}
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment in table}
       {spaces_after_argument:\\n}
     *normal_command@item C1 l46
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:abb}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine\\n}
   *normal_command@end C1 l48
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C4 l50
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l50
     {spaces_after_argument:\\n}
   *before_item C2
    *index_entry_command@cindex C1 l51
    |element_node:{chapter}
    |index_entry:I{cp,4}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cindex in table}
      {spaces_after_argument: \\n}
    *paragraph C1
     {normal_text:Texte before first item.\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l53
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:abb}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l54
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C3 l56
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@samp l56
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C3
     *index_entry_command@cindex C1 l57
     |element_node:{chapter}
     |index_entry:I{cp,5}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:samp cindex in table}
       {spaces_after_argument: \\n}
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:samp comment in table}
       {spaces_after_argument:\\n}
     *normal_command@item C1 l59
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine samp\\n}
   *normal_command@end C1 l61
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C4 l63
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@samp l63
     {spaces_after_argument:\\n}
   *before_item C2
    *index_entry_command@cindex C1 l64
    |element_node:{chapter}
    |index_entry:I{cp,6}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:samp cindex in table}
      {spaces_after_argument: \\n}
    *paragraph C1
     {normal_text:Texte before first item samp.\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l66
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l67
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C4 l69
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@samp l69
     {spaces_after_argument: \\n}
   *before_item C3
    {empty_line:\\n}
    *index_entry_command@cindex C1 l71
    |element_node:{chapter}
    |index_entry:I{cp,7}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cindex between lines}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l73
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb1}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l74
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C4 l76
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@samp l76
     {spaces_after_argument: \\n}
   *before_item C2
    *index_entry_command@cindex C1 l77
    |element_node:{chapter}
    |index_entry:I{cp,8}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cindex before line}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l79
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb2}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l80
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C4 l82
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@samp l82
     {spaces_after_argument: \\n}
   *before_item C1
    {empty_line:\\n}
   *table_entry C1
    *table_term C2
     *index_entry_command@cindex C1 l84
     |element_node:{chapter}
     |index_entry:I{cp,9}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cindex after line}
       {spaces_after_argument:\\n}
     *normal_command@item C1 l85
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb2}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l86
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C3 l88
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@samp l88
     {spaces_after_argument: \\n}
   *table_entry C1
    *table_term C5
     *index_entry_command@cindex C1 l89
     |element_node:{chapter}
     |index_entry:I{cp,10}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cindex first}
       {spaces_after_argument:\\n}
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:commant}
       {spaces_after_argument:\\n}
     *index_entry_command@cindex C1 l91
     |element_node:{chapter}
     |index_entry:I{cp,11}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:second}
       {spaces_after_argument:\\n}
     *index_entry_command@cindex C1 l92
     |element_node:{chapter}
     |index_entry:I{cp,12}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:third}
       {spaces_after_argument:\\n}
     *normal_command@item C1 l93
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb2}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l94
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
';


$result_texis{'inter_item_commands_in_table'} = '@node Top
@top top

@node chapter
@chapter chap

@vtable @code
@c comment in table
@item acode--b
l--ine
@end vtable

@vtable @asis
@item aasis--b
@c comment between item and itemx
@itemx b
l--ine
@end vtable

@ftable @var
@item avar--b
@cindex index entry between item and itemx
@c and a comment
@comment and another comment
@itemx b
l--ine
@item c

@c comment between lines

@itemx d

@c comment at end
@end ftable

@ftable @emph
@item a
@cindex index entry between item and itemx
@itemx b
l--ine
@end ftable

@table @code
@cindex cindex in table 
@c comment in table
@item abb
l--ine
@end table

@table @code
@cindex cindex in table 
Texte before first item.
@item abb
@end table

@table @samp
@cindex samp cindex in table 
@c samp comment in table
@item asamp--bb
l--ine samp
@end table

@table @samp
@cindex samp cindex in table 
Texte before first item samp.
@item asamp--bb
@end table

@table @samp 

@cindex cindex between lines

@item asamp--bb1
@end table

@table @samp 
@cindex cindex before line

@item asamp--bb2
@end table

@table @samp 

@cindex cindex after line
@item asamp--bb2
@end table

@table @samp 
@cindex cindex first
@c commant
@cindex second
@cindex third
@item asamp--bb2
@end table


';


$result_texts{'inter_item_commands_in_table'} = 'top
***

1 chap
******

acode-b
l-ine

aasis-b
b
l-ine

avar-b
b
l-ine
c


d


a
b
l-ine

abb
l-ine

Texte before first item.
abb

asamp-bb
l-ine samp

Texte before first item samp.
asamp-bb



asamp-bb1


asamp-bb2


asamp-bb2

asamp-bb2


';

$result_errors{'inter_item_commands_in_table'} = '';

$result_nodes_list{'inter_item_commands_in_table'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'inter_item_commands_in_table'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'inter_item_commands_in_table'} = 'level: -1
list:
 1|top
';

$result_headings_list{'inter_item_commands_in_table'} = '';

$result_indices_sort_strings{'inter_item_commands_in_table'} = 'cp:
 cindex after line
 cindex before line
 cindex between lines
 cindex first
 cindex in table
 cindex in table
 index entry between item and itemx
 index entry between item and itemx
 samp cindex in table
 samp cindex in table
 second
 third
fn:
 a
 avar--b
 b
 b
 c
 d
vr:
 aasis--b
 acode--b
 b
';


$result_converted{'plaintext'}->{'inter_item_commands_in_table'} = 'top
***

1 chap
******

‘acode--b’
     l-ine

aasis-b
b
     l-ine

AVAR-B
B
     l-ine
C

D

_a_
_b_
     l-ine

‘abb’
     l-ine

     Texte before first item.
‘abb’

‘asamp--bb’
     l-ine samp

     Texte before first item samp.
‘asamp--bb’

‘asamp--bb1’

‘asamp--bb2’

‘asamp--bb2’

‘asamp--bb2’

';

$result_converted_sort_strings{'plaintext'}->{'inter_item_commands_in_table'} = 'cp:
 cindex after line
 cindex before line
 cindex between lines
 cindex first
 cindex in table
 cindex in table
 index entry between item and itemx
 index entry between item and itemx
 samp cindex in table
 samp cindex in table
 second
 third
fn:
 a
 avar--b
 b
 b
 c
 d
vr:
 aasis--b
 acode--b
 b
';


$result_converted{'html_text'}->{'inter_item_commands_in_table'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<dl class="vtable">
<dt><a id="index-acode_002d_002db"></a><span><code class="code">acode--b</code><a class="copiable-link" href="#index-acode_002d_002db"> &para;</a></span></dt>
<dd><p>l&ndash;ine
</p></dd>
</dl>

<dl class="vtable">
<dt><a id="index-aasis_002d_002db"></a><span>aasis&ndash;b<a class="copiable-link" href="#index-aasis_002d_002db"> &para;</a></span></dt>
<dt><a id="index-b-2"></a><span>b<a class="copiable-link" href="#index-b-2"> &para;</a></span></dt>
<dd><p>l&ndash;ine
</p></dd>
</dl>

<dl class="ftable">
<dt><a id="index-avar_002d_002db"></a><span><var class="var">avar&ndash;b</var><a class="copiable-link" href="#index-avar_002d_002db"> &para;</a></span></dt>
<dd><a class="index-entry-id" id="index-index-entry-between-item-and-itemx"></a>
</dd>
<dt><a id="index-b"></a><span><var class="var">b</var><a class="copiable-link" href="#index-b"> &para;</a></span></dt>
<dd><p>l&ndash;ine
</p></dd>
<dt><a id="index-c"></a><span><var class="var">c</var><a class="copiable-link" href="#index-c"> &para;</a></span></dt>
<dt><a id="index-d"></a><span><var class="var">d</var><a class="copiable-link" href="#index-d"> &para;</a></span></dt>
</dl>

<dl class="ftable">
<dt><a id="index-a"></a><span><em class="emph">a</em><a class="copiable-link" href="#index-a"> &para;</a></span></dt>
<dd><a class="index-entry-id" id="index-index-entry-between-item-and-itemx-1"></a>
</dd>
<dt><a id="index-b-1"></a><span><em class="emph">b</em><a class="copiable-link" href="#index-b-1"> &para;</a></span></dt>
<dd><p>l&ndash;ine
</p></dd>
</dl>

<dl class="table">
<dt><a class="index-entry-id" id="index-cindex-in-table"></a>
<code class="code">abb</code></dt>
<dd><p>l&ndash;ine
</p></dd>
</dl>

<dl class="table">
<dd><a class="index-entry-id" id="index-cindex-in-table-1"></a>
<p>Texte before first item.
</p></dd>
<dt><code class="code">abb</code></dt>
</dl>

<dl class="table">
<dt><a class="index-entry-id" id="index-samp-cindex-in-table"></a>
&lsquo;<samp class="samp">asamp--bb</samp>&rsquo;</dt>
<dd><p>l&ndash;ine samp
</p></dd>
</dl>

<dl class="table">
<dd><a class="index-entry-id" id="index-samp-cindex-in-table-1"></a>
<p>Texte before first item samp.
</p></dd>
<dt>&lsquo;<samp class="samp">asamp--bb</samp>&rsquo;</dt>
</dl>

<dl class="table">
<dd>
<a class="index-entry-id" id="index-cindex-between-lines"></a>

</dd>
<dt>&lsquo;<samp class="samp">asamp--bb1</samp>&rsquo;</dt>
</dl>

<dl class="table">
<dd><a class="index-entry-id" id="index-cindex-before-line"></a>

</dd>
<dt>&lsquo;<samp class="samp">asamp--bb2</samp>&rsquo;</dt>
</dl>

<dl class="table">
<dt><a class="index-entry-id" id="index-cindex-after-line"></a>
&lsquo;<samp class="samp">asamp--bb2</samp>&rsquo;</dt>
</dl>

<dl class="table">
<dt><a class="index-entry-id" id="index-cindex-first"></a>
<a class="index-entry-id" id="index-second"></a>
<a class="index-entry-id" id="index-third"></a>
&lsquo;<samp class="samp">asamp--bb2</samp>&rsquo;</dt>
</dl>


</div>
</div>
';


$result_converted{'xml'}->{'inter_item_commands_in_table'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap</sectiontitle>

<vtable commandarg="code" endspaces=" ">
<tableentry><tableterm><!-- c comment in table -->
<item><itemformat command="code"><indexterm index="vr" number="1">acode--b</indexterm> acode--b</itemformat></item>
</tableterm><tableitem><para>l&textndash;ine
</para></tableitem></tableentry></vtable>

<vtable commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="2">aasis--b</indexterm> aasis&textndash;b</itemformat></item>
<!-- c comment between item and itemx -->
<itemx><itemformat command="asis"><indexterm index="vr" number="3">b</indexterm> b</itemformat></itemx>
</tableterm><tableitem><para>l&textndash;ine
</para></tableitem></tableentry></vtable>

<ftable commandarg="var" endspaces=" ">
<tableentry><tableterm><item><itemformat command="var"><indexterm index="fn" number="1">avar--b</indexterm> avar&textndash;b</itemformat></item>
<cindex index="cp"> <indexterm index="cp" number="1">index entry between item and itemx</indexterm></cindex>
<!-- c and a comment -->
<!-- comment and another comment -->
<itemx><itemformat command="var"><indexterm index="fn" number="2">b</indexterm> b</itemformat></itemx>
</tableterm><tableitem><para>l&textndash;ine
</para></tableitem></tableentry><tableentry><tableterm><item><itemformat command="var"><indexterm index="fn" number="3">c</indexterm> c</itemformat></item>

<!-- c comment between lines -->

<itemx><itemformat command="var"><indexterm index="fn" number="4">d</indexterm> d</itemformat></itemx>
</tableterm><tableitem>
<!-- c comment at end -->
</tableitem></tableentry></ftable>

<ftable commandarg="emph" endspaces=" ">
<tableentry><tableterm><item><itemformat command="emph"><indexterm index="fn" number="5">a</indexterm> a</itemformat></item>
<cindex index="cp"> <indexterm index="cp" number="2">index entry between item and itemx</indexterm></cindex>
<itemx><itemformat command="emph"><indexterm index="fn" number="6">b</indexterm> b</itemformat></itemx>
</tableterm><tableitem><para>l&textndash;ine
</para></tableitem></tableentry></ftable>

<table commandarg="code" endspaces=" ">
<tableentry><tableterm><cindex index="cp"> <indexterm index="cp" number="3">cindex in table</indexterm></cindex>
<!-- c comment in table -->
<item><itemformat command="code"> abb</itemformat></item>
</tableterm><tableitem><para>l&textndash;ine
</para></tableitem></tableentry></table>

<table commandarg="code" endspaces=" ">
<beforefirstitem><cindex index="cp"> <indexterm index="cp" number="4">cindex in table</indexterm></cindex>
<para>Texte before first item.
</para></beforefirstitem><tableentry><tableterm><item><itemformat command="code"> abb</itemformat></item>
</tableterm></tableentry></table>

<table commandarg="samp" endspaces=" ">
<tableentry><tableterm><cindex index="cp"> <indexterm index="cp" number="5">samp cindex in table</indexterm></cindex>
<!-- c samp comment in table -->
<item><itemformat command="samp"> asamp--bb</itemformat></item>
</tableterm><tableitem><para>l&textndash;ine samp
</para></tableitem></tableentry></table>

<table commandarg="samp" endspaces=" ">
<beforefirstitem><cindex index="cp"> <indexterm index="cp" number="6">samp cindex in table</indexterm></cindex>
<para>Texte before first item samp.
</para></beforefirstitem><tableentry><tableterm><item><itemformat command="samp"> asamp--bb</itemformat></item>
</tableterm></tableentry></table>

<table commandarg="samp" endspaces=" "> 
<beforefirstitem>
<cindex index="cp"> <indexterm index="cp" number="7">cindex between lines</indexterm></cindex>

</beforefirstitem><tableentry><tableterm><item><itemformat command="samp"> asamp--bb1</itemformat></item>
</tableterm></tableentry></table>

<table commandarg="samp" endspaces=" "> 
<beforefirstitem><cindex index="cp"> <indexterm index="cp" number="8">cindex before line</indexterm></cindex>

</beforefirstitem><tableentry><tableterm><item><itemformat command="samp"> asamp--bb2</itemformat></item>
</tableterm></tableentry></table>

<table commandarg="samp" endspaces=" "> 
<beforefirstitem>
</beforefirstitem><tableentry><tableterm><cindex index="cp"> <indexterm index="cp" number="9">cindex after line</indexterm></cindex>
<item><itemformat command="samp"> asamp--bb2</itemformat></item>
</tableterm></tableentry></table>

<table commandarg="samp" endspaces=" "> 
<tableentry><tableterm><cindex index="cp"> <indexterm index="cp" number="10">cindex first</indexterm></cindex>
<!-- c commant -->
<cindex index="cp"> <indexterm index="cp" number="11">second</indexterm></cindex>
<cindex index="cp"> <indexterm index="cp" number="12">third</indexterm></cindex>
<item><itemformat command="samp"> asamp--bb2</itemformat></item>
</tableterm></tableentry></table>


</chapter>
';


$result_converted{'docbook'}->{'inter_item_commands_in_table'} = '<chapter label="1" id="chapter">
<title>chap</title>

<variablelist><varlistentry><term><!-- comment in table -->
<indexterm role="vr"><primary>acode--b</primary></indexterm><literal>acode--b</literal>
</term><listitem><para>l&#8211;ine
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="vr"><primary>aasis--b</primary></indexterm>aasis&#8211;b
</term><!-- comment between item and itemx -->
<term><indexterm role="vr"><primary>b</primary></indexterm>b
</term><listitem><para>l&#8211;ine
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="fn"><primary>avar--b</primary></indexterm><replaceable>avar&#8211;b</replaceable>
</term><indexterm role="cp"><primary>index entry between item and itemx</primary></indexterm>
<!-- and a comment -->
<!-- and another comment -->
<term><indexterm role="fn"><primary>b</primary></indexterm><replaceable>b</replaceable>
</term><listitem><para>l&#8211;ine
</para></listitem></varlistentry><varlistentry><term><indexterm role="fn"><primary>c</primary></indexterm><replaceable>c</replaceable>
</term>
<!-- comment between lines -->

<term><indexterm role="fn"><primary>d</primary></indexterm><replaceable>d</replaceable>
</term><listitem>
<!-- comment at end -->
</listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="fn"><primary>a</primary></indexterm><emphasis>a</emphasis>
</term><indexterm role="cp"><primary>index entry between item and itemx</primary></indexterm>
<term><indexterm role="fn"><primary>b</primary></indexterm><emphasis>b</emphasis>
</term><listitem><para>l&#8211;ine
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="cp"><primary>cindex in table</primary></indexterm>
<!-- comment in table -->
<literal>abb</literal>
</term><listitem><para>l&#8211;ine
</para></listitem></varlistentry></variablelist>
<variablelist><indexterm role="cp"><primary>cindex in table</primary></indexterm>
<para>Texte before first item.
</para><varlistentry><term><literal>abb</literal>
</term></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="cp"><primary>samp cindex in table</primary></indexterm>
<!-- samp comment in table -->
&#8216;<literal>asamp--bb</literal>&#8217;
</term><listitem><para>l&#8211;ine samp
</para></listitem></varlistentry></variablelist>
<variablelist><indexterm role="cp"><primary>samp cindex in table</primary></indexterm>
<para>Texte before first item samp.
</para><varlistentry><term>&#8216;<literal>asamp--bb</literal>&#8217;
</term></varlistentry></variablelist>
<variablelist>
<indexterm role="cp"><primary>cindex between lines</primary></indexterm>

<varlistentry><term>&#8216;<literal>asamp--bb1</literal>&#8217;
</term></varlistentry></variablelist>
<variablelist><indexterm role="cp"><primary>cindex before line</primary></indexterm>

<varlistentry><term>&#8216;<literal>asamp--bb2</literal>&#8217;
</term></varlistentry></variablelist>
<variablelist>
<varlistentry><term><indexterm role="cp"><primary>cindex after line</primary></indexterm>
&#8216;<literal>asamp--bb2</literal>&#8217;
</term></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="cp"><primary>cindex first</primary></indexterm>
<!-- commant -->
<indexterm role="cp"><primary>second</primary></indexterm>
<indexterm role="cp"><primary>third</primary></indexterm>
&#8216;<literal>asamp--bb2</literal>&#8217;
</term></varlistentry></variablelist>

</chapter>
';

1;
