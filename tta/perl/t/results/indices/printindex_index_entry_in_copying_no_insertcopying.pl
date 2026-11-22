use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'printindex_index_entry_in_copying_no_insertcopying'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@copying C11 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *index_entry_command@findex C1 l3
    |EXTRA
    |element_region:{copying}
    |index_entry:I{fn,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:Copying this document}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
    *normal_command@defun C4 l5
     *def_line C1 l5
     |EXTRA
     |def_command:{defun}
     |element_region:{copying}
     |index_entry:I{fn,2}
     |original_def_cmdname:{defun}
      *block_line_arg C7
       (i){spaces_before_argument: }
       *def_category C1
       |EXTRA
       |inserted:{1}
        *def_line_arg C1
         {normal_text:Function}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         {normal_text:fun}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         {normal_text:arg}
       {spaces_after_argument:\\n}
     *normal_command@defunx C1 l6
     |EXTRA
     |def_command:{defun}
     |element_region:{copying}
     |index_entry:I{fn,3}
     |original_def_cmdname:{defunx}
      *line_arg C7
       (i){spaces_before_argument: }
       *def_category C1
       |EXTRA
       |inserted:{1}
        *def_line_arg C1
         {normal_text:Function}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         {normal_text:xf}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         {normal_text:arg}
       {spaces_after_argument:\\n}
     *def_item C1
      *paragraph C1
       {normal_text:Defun\\n}
     *normal_command@end C1 l8
     |EXTRA
     |text_arg:{defun}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:defun}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
    *normal_command@ftable C3 l10
     *arguments_line C1
      *block_line_arg C3
       {spaces_before_argument: }
       *normal_command@asis l10
       {spaces_after_argument:\\n}
     *table_entry C1
      *table_term C2
       *normal_command@item C1 l11
       |EXTRA
       |element_region:{copying}
       |index_entry:I{fn,4}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:ftable item}
         {spaces_after_argument:\\n}
       *normal_command@itemx C1 l12
       |EXTRA
       |element_region:{copying}
       |index_entry:I{fn,5}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:xftable xitem}
         {spaces_after_argument:\\n}
     *normal_command@end C1 l13
     |EXTRA
     |text_arg:{ftable}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:ftable}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
    *normal_command@printindex C1 l15
    |EXTRA
    |global_command_number:{1}
    |misc_args:A{fn}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:fn}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
    *normal_command@end C1 l17
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l19 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C6 l20 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Top.\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l24
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l25
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l26
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l28 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l29 {Chapter}
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
  {empty_line:\\n}
  {empty_line:\\n}
';


$result_texis{'printindex_index_entry_in_copying_no_insertcopying'} = '@copying

@findex Copying this document

@defun fun arg
@defunx xf arg
Defun
@end defun

@ftable @asis
@item ftable item
@itemx xftable xitem
@end ftable

@printindex fn

@end copying

@node Top
@top top

Top.

@menu
* chapter::
@end menu

@node chapter
@chapter Chapter



';


$result_texts{'printindex_index_entry_in_copying_no_insertcopying'} = '
top
***

Top.

* chapter::

1 Chapter
*********



';

$result_errors{'printindex_index_entry_in_copying_no_insertcopying'} = '';

$result_nodes_list{'printindex_index_entry_in_copying_no_insertcopying'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'printindex_index_entry_in_copying_no_insertcopying'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'printindex_index_entry_in_copying_no_insertcopying'} = 'level: -1
list:
 1|top
';

$result_headings_list{'printindex_index_entry_in_copying_no_insertcopying'} = '';

$result_indices_sort_strings{'printindex_index_entry_in_copying_no_insertcopying'} = 'fn:
 Copying this document
 ftable item
 fun
 xf
 xftable xitem
';


$result_converted{'info'}->{'printindex_index_entry_in_copying_no_insertcopying'} = Encode::encode('utf-8', 'This is , produced from .

 -- Function: fun arg
 -- Function: xf arg
     Defun

ftable item
xftable xitem


File: ,  Node: Top,  Next: chapter,  Up: (dir)

top
***

Top.

* Menu:

* chapter::


File: ,  Node: chapter,  Prev: Top,  Up: Top

1 Chapter
*********


Tag Table:
Node: Top109
Node: chapter196

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_sort_strings{'info'}->{'printindex_index_entry_in_copying_no_insertcopying'} = 'fn:
 Copying this document
 ftable item
 fun
 xf
 xftable xitem
';


$result_converted{'plaintext'}->{'printindex_index_entry_in_copying_no_insertcopying'} = 'top
***

Top.

1 Chapter
*********

';

$result_converted_sort_strings{'plaintext'}->{'printindex_index_entry_in_copying_no_insertcopying'} = 'fn:
 Copying this document
 ftable item
 fun
 xf
 xftable xitem
';


$result_converted{'html_text'}->{'printindex_index_entry_in_copying_no_insertcopying'} = '
<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<p>Top.
</p>

<ul class="mini-toc">
<li><a href="#chapter">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>



</div>
</div>
';


$result_converted{'xml'}->{'printindex_index_entry_in_copying_no_insertcopying'} = '<copying endspaces=" ">

<findex index="fn"> <indexterm index="fn" number="1">Copying this document</indexterm></findex>

<defun endspaces=" "><definitionterm><indexterm index="fn" number="2">fun</indexterm> <defcategory automatic="on">Function</defcategory> <deffunction>fun</deffunction> <defparam>arg</defparam></definitionterm>
<defunx><definitionterm><indexterm index="fn" number="3">xf</indexterm> <defcategory automatic="on">Function</defcategory> <deffunction>xf</deffunction> <defparam>arg</defparam></definitionterm></defunx>
<definitionitem><para>Defun
</para></definitionitem></defun>

<ftable commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"><indexterm index="fn" number="4">ftable item</indexterm> ftable item</itemformat></item>
<itemx><itemformat command="asis"><indexterm index="fn" number="5">xftable xitem</indexterm> xftable xitem</itemformat></itemx>
</tableterm></tableentry></ftable>

<printindex value="fn" line=" fn"></printindex>

</copying>

<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<para>Top.
</para>
<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chapter</sectiontitle>



</chapter>
';

1;
