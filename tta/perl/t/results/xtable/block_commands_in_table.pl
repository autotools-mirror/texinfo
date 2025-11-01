use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'block_commands_in_table'} = '*document_root C5
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
 *@top C2 l2 {Element}
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
    {Element}
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
 *@chapter C10 l5 {Chapter}
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
  {empty_line:\\n}
  *@table C7 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph l7
   *table_entry C2
    *table_term C2
     *@item C1 l8
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {first item}
     *@itemx C1 l9
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {second itemx}
    *table_definition C3
     {empty_line:\\n}
     *paragraph C1
      {Text.\\n}
     {empty_line:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l13
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {example}
    *table_definition C1
     *@example C3 l14
      *arguments_line C1
       *block_line_arg
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
      *preformatted C3
       {In example\\n}
       {empty_line:\\n}
       {end example.\\n}
      *@end C1 l18
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{example}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {example}
   *table_entry C2
    *table_term C1
     *@item C1 l19
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {empty line}
    *table_definition C2
     {empty_line:\\n}
     *paragraph C1
      {empty line.\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l22
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {quotation}
    *table_definition C2
     *@quotation C3 l23
      *arguments_line C1
       *block_line_arg
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
      *paragraph C1
       {Quotation\\n}
      *@end C1 l25
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{quotation}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {quotation}
     {empty_line:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l27
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {quotation after a blank line}
    *table_definition C2
     {empty_line:\\n}
     *@quotation C3 l29
      *arguments_line C1
       *block_line_arg
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
      *paragraph C1
       {quotation after a blank line\\n}
      *@end C1 l31
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{quotation}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {quotation}
   *@end C1 l32
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table}
  {empty_line:\\n}
  *@vtable C3 l34
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@strong l34
   *table_entry C2
    *table_term C4
     *@item C1 l35
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
       {item before ignored lines}
     *inter_item C1
      *@c C1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {rawline_text:comment}
     *index_entry_command@vindex C1 l37
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
       {vindex}
     *@itemx C1 l38
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
       {itemx now}
    *table_definition C2
     {empty_line:\\n}
     *paragraph C1
      {Description\\n}
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
  *@vtable C3 l42
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@r l42
   *table_entry C2
    *table_term C3
     *@item C1 l43
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
       {item}
     *inter_item C1
      {empty_line:\\n}
     *@itemx C1 l45
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
       {itemx after an empty line}
    *table_definition C3
     {empty_line:\\n}
     *paragraph C1
      {Description.\\n}
     {empty_line:\\n}
   *@end C1 l49
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
  *paragraph C1
   {Something.\\n}
  *@table C4 l52
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph l52
   *table_entry C2
    *table_term C1
     *@item C1 l53
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {in item}
    *table_definition C1
     *paragraph C1
      {Text without blank line\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l55
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {second item}
    *table_definition C1
     *paragraph C1
      {Text without blank line 2\\n}
   *@end C1 l57
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table}
  *paragraph C1
   {After table.\\n}
';


$result_texis{'block_commands_in_table'} = '@node Top
@top Element

@node chap
@chapter Chapter

@table @emph
@item first item
@itemx second itemx

Text.

@item example
@example
In example

end example.
@end example
@item empty line

empty line.
@item quotation
@quotation
Quotation
@end quotation

@item quotation after a blank line

@quotation
quotation after a blank line
@end quotation
@end table

@vtable @strong
@item item before ignored lines
@c comment
@vindex vindex
@itemx itemx now

Description
@end vtable
@vtable @r
@item item

@itemx itemx after an empty line

Description.

@end vtable

Something.
@table @emph
@item in item
Text without blank line
@item second item
Text without blank line 2
@end table
After table.
';


$result_texts{'block_commands_in_table'} = 'Element
*******

1 Chapter
*********

first item
second itemx

Text.

example
In example

end example.
empty line

empty line.
quotation
Quotation

quotation after a blank line

quotation after a blank line

item before ignored lines
itemx now

Description
item

itemx after an empty line

Description.


Something.
in item
Text without blank line
second item
Text without blank line 2
After table.
';

$result_errors{'block_commands_in_table'} = '';

$result_nodes_list{'block_commands_in_table'} = '1|Top
 associated_section: Element
 associated_title_command: Element
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'block_commands_in_table'} = '1|Element
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
  up->Element
 toplevel_directions:
  prev->Element
  up->Element
';

$result_sectioning_root{'block_commands_in_table'} = 'level: -1
list:
 1|Element
';

$result_headings_list{'block_commands_in_table'} = '';

$result_indices_sort_strings{'block_commands_in_table'} = 'vr:
 item
 item before ignored lines
 itemx after an empty line
 itemx now
 vindex
';


$result_converted{'plaintext'}->{'block_commands_in_table'} = 'Element
*******

1 Chapter
*********

_first item_
_second itemx_

     Text.

_example_
          In example

          end example.
_empty line_

     empty line.
_quotation_
          Quotation

_quotation after a blank line_

          quotation after a blank line

*item before ignored lines*
*itemx now*

     Description
item

itemx after an empty line

     Description.

   Something.
_in item_
     Text without blank line
_second item_
     Text without blank line 2
   After table.
';


$result_converted{'html_text'}->{'block_commands_in_table'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="Element"><span>Element<a class="copiable-link" href="#Element"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<dl class="table">
<dt><em class="emph">first item</em></dt>
<dt><em class="emph">second itemx</em></dt>
<dd>
<p>Text.
</p>
</dd>
<dt><em class="emph">example</em></dt>
<dd><div class="example">
<pre class="example-preformatted">In example

end example.
</pre></div>
</dd>
<dt><em class="emph">empty line</em></dt>
<dd>
<p>empty line.
</p></dd>
<dt><em class="emph">quotation</em></dt>
<dd><blockquote class="quotation">
<p>Quotation
</p></blockquote>

</dd>
<dt><em class="emph">quotation after a blank line</em></dt>
<dd>
<blockquote class="quotation">
<p>quotation after a blank line
</p></blockquote>
</dd>
</dl>

<dl class="vtable">
<dt><a id="index-item-before-ignored-lines"></a><span><strong class="strong">item before ignored lines</strong><a class="copiable-link" href="#index-item-before-ignored-lines"> &para;</a></span></dt>
<a class="index-entry-id" id="index-vindex"></a>
<dt><a id="index-itemx-now"></a><span><strong class="strong">itemx now</strong><a class="copiable-link" href="#index-itemx-now"> &para;</a></span></dt>
<dd>
<p>Description
</p></dd>
</dl>
<dl class="vtable">
<dt><a id="index-item"></a><span><span class="r">item</span><a class="copiable-link" href="#index-item"> &para;</a></span></dt>
<dt><a id="index-itemx-after-an-empty-line"></a><span><span class="r">itemx after an empty line</span><a class="copiable-link" href="#index-itemx-after-an-empty-line"> &para;</a></span></dt>
<dd>
<p>Description.
</p>
</dd>
</dl>

<p>Something.
</p><dl class="table">
<dt><em class="emph">in item</em></dt>
<dd><p>Text without blank line
</p></dd>
<dt><em class="emph">second item</em></dt>
<dd><p>Text without blank line 2
</p></dd>
</dl>
<p>After table.
</p></div>
</div>
';


$result_converted{'xml'}->{'block_commands_in_table'} = '<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">chap</nodenext></node>
<top spaces=" "><sectiontitle>Element</sectiontitle>

</top>
<node identifier="chap" spaces=" "><nodename>chap</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>Chapter</sectiontitle>

<table commandarg="emph" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="emph">first item</itemformat></item>
<itemx spaces=" "><itemformat command="emph">second itemx</itemformat></itemx>
</tableterm><tableitem>
<para>Text.
</para>
</tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="emph">example</itemformat></item>
</tableterm><tableitem><example endspaces=" ">
<pre xml:space="preserve">In example

end example.
</pre></example>
</tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="emph">empty line</itemformat></item>
</tableterm><tableitem>
<para>empty line.
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="emph">quotation</itemformat></item>
</tableterm><tableitem><quotation endspaces=" ">
<para>Quotation
</para></quotation>

</tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="emph">quotation after a blank line</itemformat></item>
</tableterm><tableitem>
<quotation endspaces=" ">
<para>quotation after a blank line
</para></quotation>
</tableitem></tableentry></table>

<vtable commandarg="strong" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="strong"><indexterm index="vr" number="1">item before ignored lines</indexterm>item before ignored lines</itemformat></item>
<!-- c comment -->
<vindex index="vr" spaces=" "><indexterm index="vr" number="2">vindex</indexterm></vindex>
<itemx spaces=" "><itemformat command="strong"><indexterm index="vr" number="3">itemx now</indexterm>itemx now</itemformat></itemx>
</tableterm><tableitem>
<para>Description
</para></tableitem></tableentry></vtable>
<vtable commandarg="r" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="r"><indexterm index="vr" number="4">item</indexterm>item</itemformat></item>

<itemx spaces=" "><itemformat command="r"><indexterm index="vr" number="5">itemx after an empty line</indexterm>itemx after an empty line</itemformat></itemx>
</tableterm><tableitem>
<para>Description.
</para>
</tableitem></tableentry></vtable>

<para>Something.
</para><table commandarg="emph" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="emph">in item</itemformat></item>
</tableterm><tableitem><para>Text without blank line
</para></tableitem></tableentry><tableentry><tableterm><item spaces=" "><itemformat command="emph">second item</itemformat></item>
</tableterm><tableitem><para>Text without blank line 2
</para></tableitem></tableentry></table>
<para>After table.
</para></chapter>
';


$result_converted{'docbook'}->{'block_commands_in_table'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<variablelist><varlistentry><term><emphasis>first item</emphasis>
</term><term><emphasis>second itemx</emphasis>
</term><listitem>
<para>Text.
</para>
</listitem></varlistentry><varlistentry><term><emphasis>example</emphasis>
</term><listitem><screen>In example

end example.
</screen></listitem></varlistentry><varlistentry><term><emphasis>empty line</emphasis>
</term><listitem>
<para>empty line.
</para></listitem></varlistentry><varlistentry><term><emphasis>quotation</emphasis>
</term><listitem><blockquote><para>Quotation
</para></blockquote>
</listitem></varlistentry><varlistentry><term><emphasis>quotation after a blank line</emphasis>
</term><listitem>
<blockquote><para>quotation after a blank line
</para></blockquote></listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><indexterm role="vr"><primary>item before ignored lines</primary></indexterm><emphasis role="bold">item before ignored lines</emphasis>
</term><!-- comment -->
<indexterm role="vr"><primary>vindex</primary></indexterm>
<term><indexterm role="vr"><primary>itemx now</primary></indexterm><emphasis role="bold">itemx now</emphasis>
</term><listitem>
<para>Description
</para></listitem></varlistentry></variablelist><variablelist><varlistentry><term><indexterm role="vr"><primary>item</primary></indexterm>item
</term>
<term><indexterm role="vr"><primary>itemx after an empty line</primary></indexterm>itemx after an empty line
</term><listitem>
<para>Description.
</para>
</listitem></varlistentry></variablelist>
<para>Something.
</para><variablelist><varlistentry><term><emphasis>in item</emphasis>
</term><listitem><para>Text without blank line
</para></listitem></varlistentry><varlistentry><term><emphasis>second item</emphasis>
</term><listitem><para>Text without blank line 2
</para></listitem></varlistentry></variablelist><para>After table.
</para></chapter>
';

1;
