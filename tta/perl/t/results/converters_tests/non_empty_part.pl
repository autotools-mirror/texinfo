use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'non_empty_part'} = '*document_root C16
 *before_node_section C1
  *preamble_before_content
 *@part C4 l1 {part before}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {part before}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Content before\\n}
  {empty_line:\\n}
 *@node C1 l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C4 l6 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{chapter-node}
     {chapter node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{part-chapter-node}
     {part chapter node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@part C4 l13 {part I}
 |EXTRA
 |global_command_number:{2}
 |section_level:{0}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {part I}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Content I\\n}
  {empty_line:\\n}
 *@chapter C2 l17 {chap in Top node}
 |EXTRA
 |identifier:{chap-in-Top-node}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap in Top node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@part C4 l19 {Part II}
 |EXTRA
 |global_command_number:{3}
 |section_level:{0}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Part II}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Content II\\n}
  {empty_line:\\n}
 *@node C1 l23 {part chapter node}
 |EXTRA
 |identifier:{part-chapter-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {part chapter node}
    {spaces_after_argument:\\n}
 *@part C4 l24 {part III}
 |EXTRA
 |global_command_number:{4}
 |section_level:{0}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {part III}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Content III\\n}
  {empty_line:\\n}
 *@chapter C2 l28 {chapter with part node}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter with part node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@part C4 l30 {Part IV}
 |EXTRA
 |global_command_number:{5}
 |section_level:{0}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Part IV}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Content IV\\n}
  {empty_line:\\n}
 *@part C4 l34 {Part V}
 |EXTRA
 |global_command_number:{6}
 |section_level:{0}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Part V}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Content V\\n}
  {empty_line:\\n}
 *@chapter C2 l38 {with part no node}
 |EXTRA
 |identifier:{with-part-no-node}
 |is_target:{1}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {with part no node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@part C4 l40 {Part VI}
 |EXTRA
 |global_command_number:{7}
 |section_level:{0}
 |section_number:{11}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Part VI}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Content VI\\n}
  {empty_line:\\n}
 *@node C2 l44 {node between part and chapter}
 |EXTRA
 |identifier:{node-between-part-and-chapter}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {node between part and chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@chapter C2 l46 {chapter after part node}
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{12}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter after part node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'non_empty_part'} = '@part part before

Content before

@node Top
@top top

@menu
* chapter node::
* part chapter node::
@end menu

@part part I

Content I

@chapter chap in Top node

@part Part II

Content II

@node part chapter node
@part part III

Content III

@chapter chapter with part node

@part Part IV

Content IV

@part Part V

Content V

@chapter with part no node

@part Part VI

Content VI

@node node between part and chapter

@chapter chapter after part node

';


$result_texts{'non_empty_part'} = 'part before
***********

Content before

top
***

* chapter node::
* part chapter node::

part I
******

Content I

1 chap in Top node
******************

Part II
*******

Content II

part III
********

Content III

2 chapter with part node
************************

Part IV
*******

Content IV

Part V
******

Content V

3 with part no node
*******************

Part VI
*******

Content VI


4 chapter after part node
*************************

';

$result_errors{'non_empty_part'} = '* W l1|@part should not be associated with @top
 warning: @part should not be associated with @top

* W l24|@node precedes @part, but parts may not be associated with nodes
 warning: @node precedes @part, but parts may not be associated with nodes

* W l19|no sectioning command associated with @part
 warning: no sectioning command associated with @part

* W l30|no sectioning command associated with @part
 warning: no sectioning command associated with @part

* W l1|@part not empty
 warning: @part not empty

* W l13|@part not empty
 warning: @part not empty

* W l19|@part not empty
 warning: @part not empty

* W l24|@part not empty
 warning: @part not empty

* W l30|@part not empty
 warning: @part not empty

* W l34|@part not empty
 warning: @part not empty

* W l40|@part not empty
 warning: @part not empty

* W l5|node `Top\' lacks menu item for `node between part and chapter\' but is above it in sectioning
 warning: node `Top\' lacks menu item for `node between part and chapter\' but is above it in sectioning

* E l9|@menu reference to nonexistent node `chapter node\'
 @menu reference to nonexistent node `chapter node\'

* W l44|node `node between part and chapter\' unreferenced
 warning: node `node between part and chapter\' unreferenced

';

$result_nodes_list{'non_empty_part'} = '1|Top
 associated_section: top
 node_preceding_part: part before
 associated_title_command: top
 menus:
  chapter node
  part chapter node
 node_directions:
  next->part chapter node
2|part chapter node
 associated_section: 2 chapter with part node
 node_preceding_part: Part II
 associated_title_command: 2 chapter with part node
 node_directions:
  prev->Top
  up->Top
3|node between part and chapter
 associated_section: 4 chapter after part node
 node_preceding_part: Part VI
 associated_title_command: 4 chapter after part node
 node_directions:
  up->Top
';

$result_sections_list{'non_empty_part'} = '1|part before
 part_following_node: Top
 part_associated_section: top
 section_directions:
  next->top
2|top
 associated_anchor_command: Top
 associated_node: Top
 associated_part: part before
 section_directions:
  next->part I
  prev->part before
 toplevel_directions:
  next->chap in Top node
3|part I
 part_associated_section: 1 chap in Top node
 section_directions:
  next->Part II
  prev->top
 section_children:
  1|chap in Top node
4|chap in Top node
 associated_part: part I
 section_directions:
  up->part I
 toplevel_directions:
  next->chapter with part node
  prev->top
  up->top
5|Part II
 part_following_node: part chapter node
 section_directions:
  next->part III
  prev->part I
6|part III
 part_associated_section: 2 chapter with part node
 section_directions:
  next->Part IV
  prev->Part II
 section_children:
  1|chapter with part node
7|chapter with part node
 associated_anchor_command: part chapter node
 associated_node: part chapter node
 associated_part: part III
 section_directions:
  up->part III
 toplevel_directions:
  next->with part no node
  prev->chap in Top node
  up->top
8|Part IV
 section_directions:
  next->Part V
  prev->part III
9|Part V
 part_associated_section: 3 with part no node
 section_directions:
  next->Part VI
  prev->Part IV
 section_children:
  1|with part no node
10|with part no node
 associated_part: Part V
 section_directions:
  up->Part V
 toplevel_directions:
  next->chapter after part node
  prev->chapter with part node
  up->top
11|Part VI
 part_following_node: node between part and chapter
 part_associated_section: 4 chapter after part node
 section_directions:
  prev->Part V
 section_children:
  1|chapter after part node
12|chapter after part node
 associated_anchor_command: node between part and chapter
 associated_node: node between part and chapter
 associated_part: Part VI
 section_directions:
  up->Part VI
 toplevel_directions:
  prev->with part no node
  up->top
';

$result_sectioning_root{'non_empty_part'} = 'level: -1
list:
 1|part before
 2|top
 3|part I
 4|Part II
 5|part III
 6|Part IV
 7|Part V
 8|Part VI
';

$result_headings_list{'non_empty_part'} = '';


$result_converted{'plaintext'}->{'non_empty_part'} = 'Content before

top
***

Content I

1 chap in Top node
******************

Content II

Content III

2 chapter with part node
************************

Content IV

Content V

3 with part no node
*******************

Content VI

4 chapter after part node
*************************

';


$result_converted{'html_text'}->{'non_empty_part'} = '<div class="part-level-extent" id="part-before">
<h1 class="part"><span>part before<a class="copiable-link" href="#part-before"> &para;</a></span></h1>
<hr>

<p>Content before
</p>
</div>
<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>


</div>
<div class="part-level-extent" id="part-I">
<h1 class="part"><span>part I<a class="copiable-link" href="#part-I"> &para;</a></span></h1>
<hr>

<p>Content I
</p>
<ul class="mini-toc">
<li><a href="#chap-in-Top-node">chap in Top node</a></li>
</ul>
<div class="chapter-level-extent" id="chap-in-Top-node">
<h2 class="chapter"><span>1 chap in Top node<a class="copiable-link" href="#chap-in-Top-node"> &para;</a></span></h2>

<hr>
</div>
</div>
<div class="part-level-extent" id="Part-II">
<h1 class="part"><span>Part II<a class="copiable-link" href="#Part-II"> &para;</a></span></h1>
<hr>

<p>Content II
</p>
<div class="chapter-level-extent" id="part-chapter-node">
</div>
</div>
<div class="part-level-extent" id="part-III">
<h1 class="part"><span>part III<a class="copiable-link" href="#part-III"> &para;</a></span></h1>
<hr>

<p>Content III
</p>
<ul class="mini-toc">
<li><a href="#part-chapter-node">chapter with part node</a></li>
</ul>
<h2 class="chapter" id="chapter-with-part-node"><span>2 chapter with part node<a class="copiable-link" href="#chapter-with-part-node"> &para;</a></span></h2>

</div>
<div class="part-level-extent" id="Part-IV">
<h1 class="part"><span>Part IV<a class="copiable-link" href="#Part-IV"> &para;</a></span></h1>
<hr>

<p>Content IV
</p>
</div>
<div class="part-level-extent" id="Part-V">
<h1 class="part"><span>Part V<a class="copiable-link" href="#Part-V"> &para;</a></span></h1>
<hr>

<p>Content V
</p>
<ul class="mini-toc">
<li><a href="#with-part-no-node">with part no node</a></li>
</ul>
<div class="chapter-level-extent" id="with-part-no-node">
<h2 class="chapter"><span>3 with part no node<a class="copiable-link" href="#with-part-no-node"> &para;</a></span></h2>

<hr>
</div>
</div>
<div class="part-level-extent" id="Part-VI">
<h1 class="part"><span>Part VI<a class="copiable-link" href="#Part-VI"> &para;</a></span></h1>
<hr>

<p>Content VI
</p>
<ul class="mini-toc">
<li><a href="#node-between-part-and-chapter">chapter after part node</a></li>
</ul>
<div class="chapter-level-extent" id="node-between-part-and-chapter">

<h2 class="chapter" id="chapter-after-part-node"><span>4 chapter after part node<a class="copiable-link" href="#chapter-after-part-node"> &para;</a></span></h2>

</div>
</div>
';


$result_converted{'xml'}->{'non_empty_part'} = '<part><sectiontitle> part before</sectiontitle>

<para>Content before
</para>
</part>
<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> part chapter node</nodenext></node>
<top><sectiontitle> top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>part chapter node</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<part><sectiontitle> part I</sectiontitle>

<para>Content I
</para>
<chapter><sectiontitle> chap in Top node</sectiontitle>

</chapter>
</part>
<part><sectiontitle> Part II</sectiontitle>

<para>Content II
</para>
</part>
<node identifier="part-chapter-node"><nodename> part chapter node</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<part><sectiontitle> part III</sectiontitle>

<para>Content III
</para>
<chapter><sectiontitle> chapter with part node</sectiontitle>

</chapter>
</part>
<part><sectiontitle> Part IV</sectiontitle>

<para>Content IV
</para>
</part>
<part><sectiontitle> Part V</sectiontitle>

<para>Content V
</para>
<chapter><sectiontitle> with part no node</sectiontitle>

</chapter>
</part>
<part><sectiontitle> Part VI</sectiontitle>

<para>Content VI
</para>
<node identifier="node-between-part-and-chapter"><nodename> node between part and chapter</nodename><nodeup automatic="on"> Top</nodeup></node>

<chapter><sectiontitle> chapter after part node</sectiontitle>

</chapter>
</part>
';


$result_converted{'docbook'}->{'non_empty_part'} = '<part label="">
<title>part I</title>
<chapter label="1" id="chap-in-Top-node">
<title>chap in Top node</title>

<para>Content I
</para>

</chapter>
</part>
<part label="">
<title>Part II</title>
<partintro>

<para>Content II
</para>
</partintro>
</part>
<part label="">
<title>part III</title>
<chapter label="2" id="part-chapter-node">
<title>chapter with part node</title>

<para>Content III
</para>

</chapter>
</part>
<part label="">
<title>Part IV</title>
<partintro>

<para>Content IV
</para>
</partintro>
</part>
<part label="">
<title>Part V</title>
<chapter label="3" id="with-part-no-node">
<title>with part no node</title>

<para>Content V
</para>

</chapter>
</part>
<part label="">
<title>Part VI</title>
<chapter label="4" id="node-between-part-and-chapter">
<title>chapter after part node</title>

<para>Content VI
</para>


</chapter>
</part>
';


$result_converted{'latex_text'}->{'non_empty_part'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfounnumberedpart{{part I}}

Content I

\\Texinfochapter{{chap in Top node}}
\\label{anchor:chap-in-Top-node}%

\\Texinfounnumberedpart{{Part II}}

Content II

\\Texinfounnumberedpart{{part III}}

Content III

\\Texinfochapter{{chapter with part node}}
\\label{anchor:part-chapter-node}%

\\Texinfounnumberedpart{{Part IV}}

Content IV

\\Texinfounnumberedpart{{Part V}}

Content V

\\Texinfochapter{{with part no node}}
\\label{anchor:with-part-no-node}%

\\Texinfounnumberedpart{{Part VI}}

Content VI


\\Texinfochapter{{chapter after part node}}
\\label{anchor:node-between-part-and-chapter}%

';


$result_converted{'info'}->{'non_empty_part'} = Encode::encode('utf-8', 'This is , produced from .

Content before


File: ,  Node: Top,  Next: part chapter node,  Up: (dir)

top
***

* Menu:

* chapter node::
* part chapter node::

Content I

1 chap in Top node
******************

Content II


File: ,  Node: part chapter node,  Prev: Top,  Up: Top

Content III

2 chapter with part node
************************

Content IV

Content V

3 with part no node
*******************

Content VI


File: ,  Node: node between part and chapter,  Up: Top

4 chapter after part node
*************************


Tag Table:
Node: Top43
Ref: chap in Top node172
Node: part chapter node223
Ref: with part no node368
Node: node between part and chapter421

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
