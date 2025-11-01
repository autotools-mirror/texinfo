use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'index_special_region_no_insertcopying_titlepage_no_nodes'} = '*document_root C7
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *@copying C14 index_special_region_no_insertcopying.texi:l3
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument: \\n}
    {empty_line:\\n}
    *index_entry_command@cindex C1 index_special_region_no_insertcopying.texi:l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |element_region:{copying}
    |index_entry:I{cp,1}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {Copying this document}
    *@anchor C1 index_special_region_no_insertcopying.texi:l6
    |EXTRA
    |is_target:{1}
    |normalized:{Copying-information}
     *brace_arg C1
     |EXTRA
     |element_region:{copying}
      {Copying information}
    {spaces_after_close_brace:\\n}
    {empty_line:\\n}
    *paragraph C4
     {This is a test manual, trivially and explicitly in the public\\n}
     {domain}
     *@footnote C1 index_special_region_no_insertcopying.texi:l9
     |EXTRA
     |global_command_number:{1}
      *brace_command_context C5
       *@anchor C1 index_special_region_no_insertcopying.texi:l9
       |EXTRA
       |is_target:{1}
       |normalized:{Public-domain-reference}
        *brace_arg C1
        |EXTRA
        |element_region:{copying}
         {Public domain reference}
       {spaces_after_close_brace: }
       *paragraph C2
        {The public\\n}
        {domain is something you should allready know\\n}
       {empty_line:\\n}
       *index_entry_command@cindex C1 index_special_region_no_insertcopying.texi:l12
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |element_region:{copying}
       |index_entry:I{cp,2}
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {Public domain}
     {.\\n}
    {empty_line:\\n}
    *@printindex C1 index_special_region_no_insertcopying.texi:l15
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{1}
    |misc_args:A{cp}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {cp}
    {empty_line:\\n}
    *@printindex C1 index_special_region_no_insertcopying.texi:l17
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{2}
    |misc_args:A{cp}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {cp}
    *@printindex C1 index_special_region_no_insertcopying.texi:l18
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |global_command_number:{3}
    |misc_args:A{fn}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {fn}
    {empty_line:\\n}
    *@end C1 index_special_region_no_insertcopying.texi:l20
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{copying}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {copying}
   {empty_line:\\n}
   *@titlepage C10 index_special_region_no_insertcopying.texi:l22
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    {empty_line:\\n}
    *index_entry_command@cindex C1 index_special_region_no_insertcopying.texi:l24
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |element_region:{titlepage}
    |index_entry:I{cp,3}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {Titlepage index}
    *@anchor C1 index_special_region_no_insertcopying.texi:l25
    |EXTRA
    |is_target:{1}
    |normalized:{Titlepage-anchor}
     *brace_arg C1
     |EXTRA
     |element_region:{titlepage}
      {Titlepage anchor}
    {spaces_after_close_brace:\\n}
    {empty_line:\\n}
    *paragraph C3
     {This is the titlepage}
     *@footnote C1 index_special_region_no_insertcopying.texi:l27
     |EXTRA
     |global_command_number:{2}
      *brace_command_context C5
       *@anchor C1 index_special_region_no_insertcopying.texi:l27
       |EXTRA
       |is_target:{1}
       |normalized:{Titlepage-footnote-anchor}
        *brace_arg C1
        |EXTRA
        |element_region:{titlepage}
         {Titlepage footnote anchor}
       {spaces_after_close_brace:\\n}
       *paragraph C1
        {This is a fine document.\\n}
       {empty_line:\\n}
       *index_entry_command@cindex C1 index_special_region_no_insertcopying.texi:l30
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |element_region:{titlepage}
       |index_entry:I{cp,4}
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {Titlepage footnote}
     {\\n}
    {empty_line:\\n}
    *@insertcopying C1 index_special_region_no_insertcopying.texi:l33
    |EXTRA
    |global_command_number:{1}
     *line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *@end C1 index_special_region_no_insertcopying.texi:l34
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{titlepage}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {titlepage}
   {empty_line:\\n}
 *@node C1 index_special_region_no_insertcopying.texi:l36 {Top}
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
 *@top C1 index_special_region_no_insertcopying.texi:l37 {Top}
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
    {Top}
 *@chapter C15 index_special_region_no_insertcopying.texi:l38 {Chapter}
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
   |comment_at_end:
    |*@c C1
    ||INFO
    ||spaces_before_argument:
     ||{spaces_before_argument: }
     |*line_arg C1
     ||INFO
     ||spaces_after_argument:
      ||{spaces_after_argument:\\n}
      |{rawline_text:note this chapter is not associated to a node}
   |spaces_after_argument:
    |{spaces_after_argument:  }
    {Chapter}
  {empty_line:\\n}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:@insertcopying}
  {empty_line:\\n}
  *paragraph C6
   {This test demonstrates }
   *@@
   {anchor and indices in }
   *@@
   {copying\\n}
   {and titlepage, and various wrong index entries.\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 index_special_region_no_insertcopying.texi:l45
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Top}
  |index_entry:I{fn,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {findex entry}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_special_region_no_insertcopying.texi:l47
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  *@deffn C4 index_special_region_no_insertcopying.texi:l48
   *def_line C1 index_special_region_no_insertcopying.texi:l48
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffn}
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg C1 index_special_region_no_insertcopying.texi:l48
       {truc}
     {spaces: }
     *def_name C1
      *bracketed_arg index_special_region_no_insertcopying.texi:l48
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
   *@deffnx C1 index_special_region_no_insertcopying.texi:l49
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg C1 index_special_region_no_insertcopying.texi:l49
       {truc}
   *@deffnx C1 index_special_region_no_insertcopying.texi:l50
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg index_special_region_no_insertcopying.texi:l50
     {spaces: }
     *def_name C1
      *bracketed_arg index_special_region_no_insertcopying.texi:l50
   *@end C1 index_special_region_no_insertcopying.texi:l51
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
  {empty_line:\\n}
  *@ftable C4 index_special_region_no_insertcopying.texi:l53
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 index_special_region_no_insertcopying.texi:l54
      *line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 index_special_region_no_insertcopying.texi:l55
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |element_node:{Top}
     |index_entry:I{fn,2}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {fun}
   *@end C1 index_special_region_no_insertcopying.texi:l56
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{ftable}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ftable}
  {empty_line:\\n}
  *@menu C3 index_special_region_no_insertcopying.texi:l58
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 index_special_region_no_insertcopying.texi:l59
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Copying and indices}
    |normalized:{Copying-and-indices}
     {Copying and indices}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 index_special_region_no_insertcopying.texi:l60
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C1 index_special_region_no_insertcopying.texi:l62 {Copying and indices}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Copying-and-indices}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Copying and indices}
 *@appendix C15 index_special_region_no_insertcopying.texi:l63 {Copying and indices}
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
    {Copying and indices}
  {empty_line:\\n}
  *paragraph C1
   {In the appendix, we print the indices and references.\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 index_special_region_no_insertcopying.texi:l67
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Copying-and-indices}
  |index_entry:I{fn,3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {another fun}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_special_region_no_insertcopying.texi:l69
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{Copying-and-indices}
  |index_entry:I{cp,5}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Copying appendix}
  {empty_line:\\n}
  *paragraph C4
   *@ref C1 index_special_region_no_insertcopying.texi:l71
    *brace_arg C1
    |EXTRA
    |node_content:{Copying information}
    |normalized:{Copying-information}
     {Copying information}
   { for the copying information.\\n}
   *@ref C1 index_special_region_no_insertcopying.texi:l72
    *brace_arg C1
    |EXTRA
    |node_content:{Public domain reference}
    |normalized:{Public-domain-reference}
     {Public domain reference}
   { for reference on the licence.\\n}
  {empty_line:\\n}
  *paragraph C4
   *@ref C1 index_special_region_no_insertcopying.texi:l74
    *brace_arg C1
    |EXTRA
    |node_content:{Titlepage anchor}
    |normalized:{Titlepage-anchor}
     {Titlepage anchor}
   { for the titlepage.\\n}
   *@ref C1 index_special_region_no_insertcopying.texi:l75
    *brace_arg C1
    |EXTRA
    |node_content:{Titlepage footnote anchor}
    |normalized:{Titlepage-footnote-anchor}
     {Titlepage footnote anchor}
   { for reference on the titlepage.\\n}
  {empty_line:\\n}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:@insertcopying}
  {empty_line:\\n}
  *@contents C1 index_special_region_no_insertcopying.texi:l79
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'index_special_region_no_insertcopying_titlepage_no_nodes'} = '\\input texinfo @c -*-texinfo-*-

@copying 

@cindex Copying this document
@anchor{Copying information}

This is a test manual, trivially and explicitly in the public
domain@footnote{@anchor{Public domain reference} The public
domain is something you should allready know

@cindex Public domain
}.

@printindex cp

@printindex cp
@printindex fn

@end copying

@titlepage

@cindex Titlepage index
@anchor{Titlepage anchor}

This is the titlepage@footnote{@anchor{Titlepage footnote anchor}
This is a fine document.

@cindex Titlepage footnote
}

@insertcopying
@end titlepage

@node Top
@top Top
@chapter Chapter  @c note this chapter is not associated to a node

@c @insertcopying

This test demonstrates @@anchor and indices in @@copying
and titlepage, and various wrong index entries.

@findex findex entry

@cindex
@deffn{truc} { }
@deffnx{truc}
@deffnx{} {}
@end deffn

@ftable
@item
@item fun
@end ftable

@menu
* Copying and indices::
@end menu

@node Copying and indices
@appendix Copying and indices

In the appendix, we print the indices and references.

@findex another fun

@cindex Copying appendix

@ref{Copying information} for the copying information.
@ref{Public domain reference} for reference on the licence.

@ref{Titlepage anchor} for the titlepage.
@ref{Titlepage footnote anchor} for reference on the titlepage.

@c @insertcopying

@contents
@bye
';


$result_texts{'index_special_region_no_insertcopying_titlepage_no_nodes'} = '

Top
***
1 Chapter
*********


This test demonstrates @anchor and indices in @copying
and titlepage, and various wrong index entries.


truc: 
truc: 
: 


fun

* Copying and indices::

Appendix A Copying and indices
******************************

In the appendix, we print the indices and references.



Copying information for the copying information.
Public domain reference for reference on the licence.

Titlepage anchor for the titlepage.
Titlepage footnote anchor for reference on the titlepage.


';

$result_errors{'index_special_region_no_insertcopying_titlepage_no_nodes'} = '* W index_special_region_no_insertcopying.texi:l47|@cindex missing argument
 warning: @cindex missing argument

* W index_special_region_no_insertcopying.texi:l48|missing name for @deffn
 warning: missing name for @deffn

* W index_special_region_no_insertcopying.texi:l49|missing name for @deffnx
 warning: missing name for @deffnx

* W index_special_region_no_insertcopying.texi:l50|missing name for @deffnx
 warning: missing name for @deffnx

* E index_special_region_no_insertcopying.texi:l53|missing @ftable argument
 missing @ftable argument

* W index_special_region_no_insertcopying.texi:l54|@item missing argument
 warning: @item missing argument

';

$result_nodes_list{'index_special_region_no_insertcopying_titlepage_no_nodes'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  Copying and indices
 node_directions:
  next->Copying and indices
2|Copying and indices
 associated_section: A Copying and indices
 associated_title_command: A Copying and indices
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'index_special_region_no_insertcopying_titlepage_no_nodes'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
  2|Copying and indices
2|Chapter
 section_directions:
  next->Copying and indices
  up->Top
 toplevel_directions:
  next->Copying and indices
  prev->Top
  up->Top
3|Copying and indices
 associated_anchor_command: Copying and indices
 associated_node: Copying and indices
 section_directions:
  prev->Chapter
  up->Top
 toplevel_directions:
  prev->Chapter
  up->Top
';

$result_sectioning_root{'index_special_region_no_insertcopying_titlepage_no_nodes'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'index_special_region_no_insertcopying_titlepage_no_nodes'} = '';

$result_indices_sort_strings{'index_special_region_no_insertcopying_titlepage_no_nodes'} = 'cp:
 Copying appendix
 Copying this document
 Public domain
 Titlepage footnote
 Titlepage index
fn:
 another fun
 findex entry
 fun
';

1;
