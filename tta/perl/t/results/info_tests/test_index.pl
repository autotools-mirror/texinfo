use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_index'} = '*document_root C13
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C12 l2 {Element top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Element top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l4
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a-counting-anchor}
     {normal_text:a counting anchor}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:before menu.\\n}
   *index_entry_command@cindex C1 l7
   |EXTRA
   |element_node:{Top}
   |index_entry:I{cp,1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:in Top}
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 l8
   |EXTRA
   |element_node:{Top}
   |index_entry:I{cp,2}
    *line_arg C3
     {spaces_before_argument: }
     *@@
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 l9
   |EXTRA
   |element_node:{Top}
   |index_entry:I{cp,3}
    *line_arg C3
     {spaces_before_argument: }
     *@exclamdown C1 l9
      *brace_container
     {spaces_after_argument:\\n}
   *index_entry_command@cindex C1 l10
   |EXTRA
   |element_node:{Top}
   |index_entry:I{cp,4}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:"}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deffn C4 l12
   *def_line C1 l12
   |EXTRA
   |def_command:{deffn}
   |element_node:{Top}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:fset}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l12
        *brace_container C1
         {normal_text:i}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:g}
     {spaces_after_argument:\\n}
   *@deffnx C1 l13
   |EXTRA
   |def_command:{deffn}
   |element_node:{Top}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffnx}
    *line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:chose}
     {spaces_after_argument:\\n}
   *def_item C1
    {empty_line:\\n}
   *@end C1 l15
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@ftable C4 l17
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@emph l17
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l18
     |EXTRA
     |element_node:{Top}
     |index_entry:I{fn,3}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:a fun}
       {spaces_after_argument:\\n}
    *table_definition C2
     *paragraph C1
      {normal_text:Var text\\n}
     {empty_line:\\n}
   *table_entry C2
    *table_term C2
     *@item C1 l21
     |EXTRA
     |element_node:{Top}
     |index_entry:I{fn,4}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:second fun}
       {spaces_after_argument:\\n}
     *@itemx C1 l22
     |EXTRA
     |element_node:{Top}
     |index_entry:I{fn,5}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:itemx fun}
       {spaces_after_argument:\\n}
    *table_definition C1
     {empty_line:\\n}
   *@end C1 l24
   |EXTRA
   |text_arg:{ftable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ftable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C4 l26
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l27
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{name}
     {normal_text:name}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l28
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{name1-looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
     {normal_text:name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l29
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l31 {name}
 |EXTRA
 |identifier:{name}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:name}
    {spaces_after_argument:\\n}
 *@chapter C171 l32 {A chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l34
  |EXTRA
  |element_node:{name}
  |index_entry:I{cp,5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:index entry looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 l35
  |EXTRA
  |element_node:{name}
  |index_entry:I{fn,6}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:function index entry}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:A paragraph \\n}
   *index_entry_command@findex C1 l38
   |EXTRA
   |element_node:{name}
   |index_entry:I{fn,7}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:other function}
     {spaces_after_argument:\\n}
   {normal_text:end paragraph\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:a\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:a\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:a\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:a\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:a\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 l51
  |EXTRA
  |element_node:{name}
  |index_entry:I{fn,8}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:after lines.}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:b\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 l203
  |EXTRA
  |element_node:{name}
  |index_entry:I{fn,9}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:after more than 100 lines}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l205 {name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
 |EXTRA
 |identifier:{name1-looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
    {spaces_after_argument:\\n}
 *@appendix C13 l206 {Index}
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Index}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l208
  |EXTRA
  |element_node:{name1-looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
  |index_entry:I{cp,6}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:index entry in appendix before para}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Para.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Concept index\\n}
  *@printindex C1 l212
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 l214
  |EXTRA
  |element_node:{name1-looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
  |index_entry:I{fn,10}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:index entry between indices}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Functions index\\n}
  *@printindex C1 l217
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@appendixsec C2 l219 {appendixsec}
 |EXTRA
 |identifier:{appendixsec}
 |is_target:{1}
 |section_heading_number:{A.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendixsec}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@appendixsubsec C2 l221 {appendixsubsec}
 |EXTRA
 |identifier:{appendixsubsec}
 |is_target:{1}
 |section_heading_number:{A.1.1}
 |section_level:{3}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendixsubsec}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@appendixsubsubsec C4 l223 {appendixsubsubsec}
 |EXTRA
 |identifier:{appendixsubsubsec}
 |is_target:{1}
 |section_heading_number:{A.1.1.1}
 |section_level:{4}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:appendixsubsubsec}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@chapheading C1 l225
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapheading}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@centerchap C2 l227 {centerchap}
 |EXTRA
 |identifier:{centerchap}
 |is_target:{1}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:centerchap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@chapter C7 l229 {chapter end}
 |EXTRA
 |identifier:{chapter-end}
 |is_target:{1}
 |section_heading_number:{B}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter end}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l231
  |EXTRA
  |element_node:{name1-looooooooooooooooooooooooooooooooooooooooooooooooooooooooong}
  |index_entry:I{cp,7}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:index in chapter end}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@anchor C1 l233
  |EXTRA
  |identifier:{a-counting-anchor}
  |is_target:{1}
   *brace_arg C1
    {normal_text:a counting anchor}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'test_index'} = '@node Top
@top Element top

@xref{a counting anchor}.

before menu.
@cindex in Top
@cindex @@
@cindex @exclamdown{}
@cindex "

@deffn fset @var{i} a g
@deffnx truc machin bidule chose

@end deffn

@ftable @emph
@item a fun
Var text

@item second fun
@itemx itemx fun

@end ftable

@menu
* name::
* name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong::
@end menu

@node name
@chapter A chapter

@cindex index entry looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
@findex function index entry

A paragraph 
@findex other function
end paragraph

a

a

a

a

a

@findex after lines.

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

@findex after more than 100 lines

@node name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
@appendix Index

@cindex index entry in appendix before para
Para.

Concept index
@printindex cp

@findex index entry between indices

Functions index
@printindex fn

@appendixsec appendixsec

@appendixsubsec appendixsubsec

@appendixsubsubsec appendixsubsubsec

@chapheading chapheading

@centerchap centerchap

@chapter chapter end

@cindex index in chapter end

@anchor{a counting anchor}

@bye
';


$result_texts{'test_index'} = 'Element top
***********

a counting anchor.

before menu.

fset: i a g
truc: machin bidule chose


a fun
Var text

second fun
itemx fun


* name::
* name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong::

1 A chapter
***********


A paragraph 
end paragraph

a

a

a

a

a


b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b

b


Appendix A Index
****************

Para.

Concept index


Functions index

A.1 appendixsec
===============

A.1.1 appendixsubsec
--------------------

A.1.1.1 appendixsubsubsec
.........................

chapheading
***********

centerchap
**********

B chapter end
*************



';

$result_errors{'test_index'} = '* W l227|@centerchap is obsolete
 warning: @centerchap is obsolete

';

$result_nodes_list{'test_index'} = '1|Top
 associated_section: Element top
 associated_title_command: Element top
 menus:
  name
  name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
 node_directions:
  next->name
2|name
 associated_section: 1 A chapter
 associated_title_command: 1 A chapter
 node_directions:
  next->name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
  prev->Top
  up->Top
3|name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
 associated_section: A Index
 associated_title_command: A Index
 node_directions:
  prev->name
  up->Top
';

$result_sections_list{'test_index'} = '1|Element top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->A chapter
 section_children:
  1|A chapter
  2|Index
  3|centerchap
  4|chapter end
2|A chapter
 associated_anchor_command: name
 associated_node: name
 section_directions:
  next->Index
  up->Element top
 toplevel_directions:
  next->Index
  prev->Element top
  up->Element top
3|Index
 associated_anchor_command: name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
 associated_node: name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
 section_directions:
  next->centerchap
  prev->A chapter
  up->Element top
 toplevel_directions:
  next->centerchap
  prev->A chapter
  up->Element top
 section_children:
  1|appendixsec
4|appendixsec
 section_directions:
  up->Index
 section_children:
  1|appendixsubsec
5|appendixsubsec
 section_directions:
  up->appendixsec
 section_children:
  1|appendixsubsubsec
6|appendixsubsubsec
 section_directions:
  up->appendixsubsec
7|centerchap
 section_directions:
  next->chapter end
  prev->Index
  up->Element top
 toplevel_directions:
  next->chapter end
  prev->Index
  up->Element top
8|chapter end
 section_directions:
  prev->centerchap
  up->Element top
 toplevel_directions:
  prev->centerchap
  up->Element top
';

$result_sectioning_root{'test_index'} = 'level: -1
list:
 1|Element top
';

$result_headings_list{'test_index'} = '1|chapheading
';

$result_indices_sort_strings{'test_index'} = 'cp:
 ¡
 "
 @
 in Top
 index entry in appendix before para
 index entry looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
 index in chapter end
fn:
 a fun
 after lines.
 after more than 100 lines
 function index entry
 i
 index entry between indices
 itemx fun
 machin
 other function
 second fun
';


$result_converted{'info'}->{'test_index'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: name,  Up: (dir)

Element top
***********

*Note a counting anchor::.

   before menu.

 -- fset: I a g
 -- truc: machin bidule chose

_a fun_
     Var text

_second fun_
_itemx fun_

* Menu:

* name::
* name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong::


File: ,  Node: name,  Next: name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong,  Prev: Top,  Up: Top

1 A chapter
***********

A paragraph end paragraph

   a

   a

   a

   a

   a

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b

   b


File: ,  Node: name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong,  Prev: name,  Up: Top

Appendix A Index
****************

Para.

   Concept index

 [index ]
* Menu:

* ¡:                                     Top.                   (line 8)
* ":                                     Top.                   (line 8)
* @:                                     Top.                   (line 8)
* in Top:                                Top.                   (line 8)
* index entry in appendix before para:   name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong.
                                                                (line 6)
* index entry looooooooooooooooooooooooooooooooooooooooooooooooooooooooong: name.
                                                                (line 6)
* index in chapter end:                  name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong.
                                                                (line 4)

   Functions index

 [index ]
* Menu:

* a fun:                                 Top.                 (line  13)
* after lines.:                          name.                (line  18)
* after more than 100 lines:             name.                (line 167)
* function index entry:                  name.                (line   6)
* I:                                     Top.                 (line  10)
* index entry between indices:           name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong.
                                                              (line  24)
* itemx fun:                             Top.                 (line  17)
* machin:                                Top.                 (line  11)
* other function:                        name.                (line   6)
* second fun:                            Top.                 (line  16)

A.1 appendixsec
===============

A.1.1 appendixsubsec
--------------------

A.1.1.1 appendixsubsubsec
.........................

chapheading
***********

centerchap
**********

B chapter end
*************


Tag Table:
Node: Top27
Node: name330
Node: name1 looooooooooooooooooooooooooooooooooooooooooooooooooooooooong982
Ref: Index: cp1150
Ref: Index: fn2004
Ref: appendixsec2865
Ref: appendixsubsec2898
Ref: appendixsubsubsec2941
Ref: centerchap3019
Ref: chapter end3042
Ref: a counting anchor3071

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_sort_strings{'info'}->{'test_index'} = 'cp:
 ¡
 "
 @
 in Top
 index entry in appendix before para
 index entry looooooooooooooooooooooooooooooooooooooooooooooooooooooooong
 index in chapter end
fn:
 a fun
 after lines.
 after more than 100 lines
 function index entry
 i
 index entry between indices
 itemx fun
 machin
 other function
 second fun
';

1;
