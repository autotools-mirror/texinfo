use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'item_index_transformation'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C9 l2 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C4 l4
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l4
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C6
     *index_entry_command@cindex C1 l9
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,2}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:After1}
       {spaces_after_argument:\\n}
     *index_entry_command@cindex C1 l10
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,3}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:After2}
       {spaces_after_argument:\\n}
     *index_entry_command@cindex C1 l5
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:Before1}
       {spaces_after_argument:\\n}
     *normal_command@item C1 l6
     |EXTRA
     |associated_index_entry:I{cp,2}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:one}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l7
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:onex}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l8
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:oney}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:AAA\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l12
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:two}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:BBB\\n}
   *normal_command@end C1 l14
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C4 l16
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l16
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C5
     *index_entry_command@cindex C1 l20
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,4}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:after1}
       {spaces_after_argument:\\n}
     *index_entry_command@cindex C1 l21
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,5}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:after2}
       {spaces_after_argument:\\n}
     *normal_command@item C1 l17
     |EXTRA
     |associated_index_entry:I{cp,4}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:three}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l18
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:threex}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l19
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:zzzz}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:CCCC\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l23
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:zzzz2}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:DDDDD\\n}
   *normal_command@end C1 l25
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C4 l27
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l27
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C4
     *index_entry_command@cindex C1 l28
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,6}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:before1}
       {spaces_after_argument:\\n}
     *index_entry_command@cindex C1 l29
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,7}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:before2}
       {spaces_after_argument:\\n}
     *normal_command@item C1 l30
     |EXTRA
     |associated_index_entry:I{cp,6}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:four}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l31
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:fourx}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:EEEE\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l33
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:foour}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:FFFFf\\n}
   *normal_command@end C1 l35
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C4 l37
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l37
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l38
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:five}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:GGGG\\n}
   *table_entry C2
    *table_term C4
     *index_entry_command@cindex C1 l42
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,8}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:after6}
       {spaces_after_argument:\\n}
     *index_entry_command@cindex C1 l43
     |EXTRA
     |element_node:{chap}
     |index_entry:I{cp,9}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:after7}
       {spaces_after_argument:\\n}
     *normal_command@item C1 l40
     |EXTRA
     |associated_index_entry:I{cp,8}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:six}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l41
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:sixx}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:HHHHHH\\n}
   *normal_command@end C1 l45
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'item_index_transformation'} = '@node chap
@chapter Chapter

@table @asis
@cindex After1
@cindex After2
@cindex Before1
@item one
@itemx onex
@itemx oney
AAA
@item two
BBB
@end table

@table @asis
@cindex after1
@cindex after2
@item three
@itemx threex
@itemx zzzz
CCCC
@item zzzz2
DDDDD
@end table

@table @asis
@cindex before1
@cindex before2
@item four
@itemx fourx
EEEE
@item foour
FFFFf
@end table

@table @asis
@item five
GGGG
@cindex after6
@cindex after7
@item six
@itemx sixx
HHHHHH
@end table
';


$result_texts{'item_index_transformation'} = '1 Chapter
*********

one
onex
oney
AAA
two
BBB

three
threex
zzzz
CCCC
zzzz2
DDDDD

four
fourx
EEEE
foour
FFFFf

five
GGGG
six
sixx
HHHHHH
';

$result_errors{'item_index_transformation'} = '';

$result_nodes_list{'item_index_transformation'} = '1|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
';

$result_sections_list{'item_index_transformation'} = '1|Chapter
 associated_anchor_command: chap
 associated_node: chap
';

$result_sectioning_root{'item_index_transformation'} = 'level: 0
list:
 1|Chapter
';

$result_headings_list{'item_index_transformation'} = '';

$result_indices_sort_strings{'item_index_transformation'} = 'cp:
 after1
 After1
 after2
 After2
 after6
 after7
 before1
 Before1
 before2
';


$result_converted{'plaintext'}->{'item_index_transformation'} = '1 Chapter
*********

one
onex
oney
     AAA
two
     BBB

three
threex
zzzz
     CCCC
zzzz2
     DDDDD

four
fourx
     EEEE
foour
     FFFFf

five
     GGGG
six
sixx
     HHHHHH
';

$result_converted_sort_strings{'plaintext'}->{'item_index_transformation'} = 'cp:
 after1
 After1
 after2
 After2
 after6
 after7
 before1
 Before1
 before2
';


$result_converted{'html_text'}->{'item_index_transformation'} = '<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<dl class="table">
<dt><a class="index-entry-id" id="index-After2"></a>
<a class="index-entry-id" id="index-Before1"></a>
<a id="index-After1"></a><span>one<a class="copiable-link" href="#index-After1"> &para;</a></span></dt>
<dt>onex</dt>
<dt>oney</dt>
<dd><p>AAA
</p></dd>
<dt>two</dt>
<dd><p>BBB
</p></dd>
</dl>

<dl class="table">
<dt><a class="index-entry-id" id="index-after2"></a>
<a id="index-after1"></a><span>three<a class="copiable-link" href="#index-after1"> &para;</a></span></dt>
<dt>threex</dt>
<dt>zzzz</dt>
<dd><p>CCCC
</p></dd>
<dt>zzzz2</dt>
<dd><p>DDDDD
</p></dd>
</dl>

<dl class="table">
<dt><a class="index-entry-id" id="index-before2"></a>
<a id="index-before1"></a><span>four<a class="copiable-link" href="#index-before1"> &para;</a></span></dt>
<dt>fourx</dt>
<dd><p>EEEE
</p></dd>
<dt>foour</dt>
<dd><p>FFFFf
</p></dd>
</dl>

<dl class="table">
<dt>five</dt>
<dd><p>GGGG
</p></dd>
<dt><a class="index-entry-id" id="index-after7"></a>
<a id="index-after6"></a><span>six<a class="copiable-link" href="#index-after6"> &para;</a></span></dt>
<dt>sixx</dt>
<dd><p>HHHHHH
</p></dd>
</dl>
</div>
';


$result_converted{'xml'}->{'item_index_transformation'} = '<node identifier="chap"><nodename> chap</nodename></node>
<chapter><sectiontitle> Chapter</sectiontitle>

<table commandarg="asis" endspaces=" ">
<tableentry><tableterm><cindex index="cp"> <indexterm index="cp" number="2">After1</indexterm></cindex>
<cindex index="cp"> <indexterm index="cp" number="3">After2</indexterm></cindex>
<cindex index="cp"> <indexterm index="cp" number="1">Before1</indexterm></cindex>
<item><itemformat command="asis"> one</itemformat></item>
<itemx><itemformat command="asis"> onex</itemformat></itemx>
<itemx><itemformat command="asis"> oney</itemformat></itemx>
</tableterm><tableitem><para>AAA
</para></tableitem></tableentry><tableentry><tableterm><item><itemformat command="asis"> two</itemformat></item>
</tableterm><tableitem><para>BBB
</para></tableitem></tableentry></table>

<table commandarg="asis" endspaces=" ">
<tableentry><tableterm><cindex index="cp"> <indexterm index="cp" number="4">after1</indexterm></cindex>
<cindex index="cp"> <indexterm index="cp" number="5">after2</indexterm></cindex>
<item><itemformat command="asis"> three</itemformat></item>
<itemx><itemformat command="asis"> threex</itemformat></itemx>
<itemx><itemformat command="asis"> zzzz</itemformat></itemx>
</tableterm><tableitem><para>CCCC
</para></tableitem></tableentry><tableentry><tableterm><item><itemformat command="asis"> zzzz2</itemformat></item>
</tableterm><tableitem><para>DDDDD
</para></tableitem></tableentry></table>

<table commandarg="asis" endspaces=" ">
<tableentry><tableterm><cindex index="cp"> <indexterm index="cp" number="6">before1</indexterm></cindex>
<cindex index="cp"> <indexterm index="cp" number="7">before2</indexterm></cindex>
<item><itemformat command="asis"> four</itemformat></item>
<itemx><itemformat command="asis"> fourx</itemformat></itemx>
</tableterm><tableitem><para>EEEE
</para></tableitem></tableentry><tableentry><tableterm><item><itemformat command="asis"> foour</itemformat></item>
</tableterm><tableitem><para>FFFFf
</para></tableitem></tableentry></table>

<table commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"> five</itemformat></item>
</tableterm><tableitem><para>GGGG
</para></tableitem></tableentry><tableentry><tableterm><cindex index="cp"> <indexterm index="cp" number="8">after6</indexterm></cindex>
<cindex index="cp"> <indexterm index="cp" number="9">after7</indexterm></cindex>
<item><itemformat command="asis"> six</itemformat></item>
<itemx><itemformat command="asis"> sixx</itemformat></itemx>
</tableterm><tableitem><para>HHHHHH
</para></tableitem></tableentry></table>
</chapter>
';


$result_converted{'docbook'}->{'item_index_transformation'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<variablelist><varlistentry><term><indexterm role="cp"><primary>After1</primary></indexterm>
<indexterm role="cp"><primary>After2</primary></indexterm>
<indexterm role="cp"><primary>Before1</primary></indexterm>
one
</term><term>onex
</term><term>oney
</term><listitem><para>AAA
</para></listitem></varlistentry><varlistentry><term>two
</term><listitem><para>BBB
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="cp"><primary>after1</primary></indexterm>
<indexterm role="cp"><primary>after2</primary></indexterm>
three
</term><term>threex
</term><term>zzzz
</term><listitem><para>CCCC
</para></listitem></varlistentry><varlistentry><term>zzzz2
</term><listitem><para>DDDDD
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="cp"><primary>before1</primary></indexterm>
<indexterm role="cp"><primary>before2</primary></indexterm>
four
</term><term>fourx
</term><listitem><para>EEEE
</para></listitem></varlistentry><varlistentry><term>foour
</term><listitem><para>FFFFf
</para></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term>five
</term><listitem><para>GGGG
</para></listitem></varlistentry><varlistentry><term><indexterm role="cp"><primary>after6</primary></indexterm>
<indexterm role="cp"><primary>after7</primary></indexterm>
six
</term><term>sixx
</term><listitem><para>HHHHHH
</para></listitem></varlistentry></variablelist></chapter>
';

1;
