use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'image_inline_or_not'} = '*document_root C5
 *before_node_section C6
  *preamble_before_content
  *normal_command@image C1 l1
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:A}
  {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Para }
   *normal_command@image C1 l3
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:hh}
   {normal_text:.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l5 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C15 l6 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@image C1 l8
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:B}
  {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Para }
   *normal_command@image C1 l10
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:jj}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@example C3 l12
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C7
    {empty_line:\\n}
    *normal_command@image C1 l14
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:in_example}
    {normal_text:\\n}
    {empty_line:\\n}
    {normal_text:T\\n}
    *normal_command@image C1 l17
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:in example after text}
    {normal_text:\\n}
   *normal_command@end C1 l18
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l20
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@image C1 l20
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:in_quotation_arg}
     {spaces_after_argument:\\n}
   *normal_command@image C1 l21
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:in_quotation_content}
   {normal_text:\\n}
   *normal_command@end C1 l22
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C3 l24
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l24
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l25
      *line_arg C3
       {spaces_before_argument: }
       *normal_command@image C1 l25
       |input_encoding_name:{utf-8}
        *brace_arg C1
         {normal_text:in_table_item}
       {spaces_after_argument:\\n}
    *table_definition C8
     {empty_line:\\n}
     *normal_command@image C1 l27
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:in_table_def}
     {normal_text:\\n}
     {empty_line:\\n}
     *paragraph C3
      {normal_text:AA }
      *normal_command@image C1 l29
      |input_encoding_name:{utf-8}
       *brace_arg C1
        {normal_text:in_table_def_para}
      {normal_text:\\n}
     {empty_line:\\n}
     *normal_command@image C1 l31
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:in_table_def_after}
     {normal_text:\\n}
   *normal_command@end C1 l32
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C5 l34
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l35
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node_005fimage}
     *normal_command@image C1 l35
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:node_image}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C2
      *normal_command@image C1 l35
      |input_encoding_name:{utf-8}
       *brace_arg C1
        {normal_text:image_in_description}
      {normal_text:\\n}
   *menu_entry C6 l36
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     *normal_command@image C1 l36
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:in_menu_entry_name}
    {menu_entry_separator:: }
    *menu_entry_node C4
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{extnode}
     {normal_text:(}
     {normal_text:somewhere}
     {normal_text:)}
     *normal_command@image C1 l36
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:extnode}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_comment C1
    *preformatted C3
     {after_menu_description_line:\\n}
     *normal_command@image C1 l38
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:in_menu_comment}
     {normal_text:\\n}
   *normal_command@end C1 l39
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l41 {@image{node_image}}
 |identifier:{node_005fimage}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@image C1 l41
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:node_image}
    {spaces_after_argument:\\n}
 *normal_command@chapter C8 l42 {@image{in_chapter_arg}}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@image C1 l42
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:in_chapter_arg}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:T}
   *normal_command@footnote C1 l45
   |global_command_number:{1}
    *brace_command_context C3
     {spaces_before_argument:\\n}
     *normal_command@image C1 l46
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:in_footnote}
     {normal_text:\\n}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:U}
   *normal_command@footnote C1 l49
   |global_command_number:{2}
    *brace_command_context C3
     {spaces_before_argument:\\n}
     *paragraph C3
      {normal_text:Some t\\n}
      *normal_command@image C1 l51
      |input_encoding_name:{utf-8}
       *brace_arg C1
        {normal_text:in text in_footnote}
      {normal_text:\\n}
     {empty_line:\\n}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@float C8 l55
  |float_number:{1.1}
  |float_type:{F}
  |global_command_number:{1}
  |identifier:{g}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:F}
    *block_line_arg C2
     {normal_text:g}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@image C1 l57
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:in_float}
   {normal_text:\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l59
    *brace_command_context C2
     *normal_command@image C1 l59
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:in_caption}
     *paragraph C2
      {normal_text: PAra }
      *normal_command@image C1 l59
      |input_encoding_name:{utf-8}
       *brace_arg C1
        {normal_text:in_caption_para}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l60
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
';


$result_texis{'image_inline_or_not'} = '@image{A}

Para @image{hh}.

@node Top
@top top

@image{B}

Para @image{jj}.

@example

@image{in_example}

T
@image{in example after text}
@end example

@quotation @image{in_quotation_arg}
@image{in_quotation_content}
@end quotation

@table @asis
@item @image{in_table_item}

@image{in_table_def}

AA @image{in_table_def_para}

@image{in_table_def_after}
@end table

@menu
* @image{node_image}:: @image{image_in_description}
* @image{in_menu_entry_name}: (somewhere)@image{extnode}.

@image{in_menu_comment}
@end menu

@node @image{node_image}
@chapter @image{in_chapter_arg}


T@footnote{
@image{in_footnote}
}

U@footnote{
Some t
@image{in text in_footnote}

}

@float F,g

@image{in_float}

@caption{@image{in_caption} PAra @image{in_caption_para}}
@end float
';


$result_texts{'image_inline_or_not'} = 'A

Para hh.

top
***

B

Para jj.


in_example

T
in example after text

in_quotation_arg
in_quotation_content

in_table_item

in_table_def

AA in_table_def_para

in_table_def_after

* node_image:: image_in_description
* in_menu_entry_name: (somewhere)extnode.

in_menu_comment

1 in_chapter_arg
****************


T

U

F, g

in_float

';

$result_errors{'image_inline_or_not'} = '';

$result_floats{'image_inline_or_not'} = 'F: 1
 F1.1: {g}
  C: @image{in_caption} PAra @image{in_caption_para}
';

$result_nodes_list{'image_inline_or_not'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  @image{node_image}
  (somewhere)@image{extnode}
 node_directions:
  next->@image{node_image}
2|@image{node_image}
 associated_section: 1 @image{in_chapter_arg}
 associated_title_command: 1 @image{in_chapter_arg}
 node_directions:
  next->(somewhere)@image{extnode}
  prev->Top
  up->Top
';

$result_sections_list{'image_inline_or_not'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->@image{in_chapter_arg}
 section_children:
  1|@image{in_chapter_arg}
2|@image{in_chapter_arg}
 associated_anchor_command: @image{node_image}
 associated_node: @image{node_image}
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'image_inline_or_not'} = 'level: -1
list:
 1|top
';

$result_headings_list{'image_inline_or_not'} = '';


$result_converted{'xml'}->{'image_inline_or_not'} = '<image><imagefile>A</imagefile></image>

<para>Para <image where="inline"><imagefile>hh</imagefile></image>.
</para>
<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> <image where="inline"><imagefile>node_image</imagefile></image></nodenext></node>
<top><sectiontitle> top</sectiontitle>

<image><imagefile>B</imagefile></image>

<para>Para <image where="inline"><imagefile>jj</imagefile></image>.
</para>
<example endspaces=" ">
<pre xml:space="preserve">
<image where="inline"><imagefile>in_example</imagefile></image>

T
<image where="inline"><imagefile>in example after text</imagefile></image>
</pre></example>

<quotation endspaces=" "><quotationtype> <image where="inline"><imagefile>in_quotation_arg</imagefile></image></quotationtype>
<image><imagefile>in_quotation_content</imagefile></image>
</quotation>

<table commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"> <image where="inline"><imagefile>in_table_item</imagefile></image></itemformat></item>
</tableterm><tableitem>
<image><imagefile>in_table_def</imagefile></image>

<para>AA <image where="inline"><imagefile>in_table_def_para</imagefile></image>
</para>
<image><imagefile>in_table_def_after</imagefile></image>
</tableitem></tableentry></table>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode><image where="inline"><imagefile>node_image</imagefile></image></menunode><menuseparator>:: </menuseparator><menudescription><pre xml:space="preserve"><image where="inline"><imagefile>image_in_description</imagefile></image>
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle><image where="inline"><imagefile>in_menu_entry_name</imagefile></image></menutitle><menuseparator>: </menuseparator><menunode>(somewhere)<image where="inline"><imagefile>extnode</imagefile></image></menunode><menuseparator>.</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
<image where="inline"><imagefile>in_menu_comment</imagefile></image>
</pre></menucomment></menu>

</top>
<node identifier="node_005fimage"><nodename> <image where="inline"><imagefile>node_image</imagefile></image></nodename><nodenext automatic="on"></nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <image where="inline"><imagefile>in_chapter_arg</imagefile></image></sectiontitle>


<para>T<footnote>
<image><imagefile>in_footnote</imagefile></image>
</footnote>
</para>
<para>U<footnote>
<para>Some t
<image where="inline"><imagefile>in text in_footnote</imagefile></image>
</para>
</footnote>
</para>
<float identifier="g" type="F" number="1.1" endspaces=" "><floattype> F</floattype><floatname>g</floatname>

<image><imagefile>in_float</imagefile></image>

<caption><image><imagefile>in_caption</imagefile></image><para> PAra <image where="inline"><imagefile>in_caption_para</imagefile></image></para></caption>
</float>
</chapter>
';

1;
