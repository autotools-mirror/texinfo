use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'index_special_region_no_titlepage_no_nodes'} = '*document_root C7
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo @c -*-texinfo-*-\\n}
   {empty_line:\\n}
  *preamble_before_content C4
   *normal_command@copying C11 index_special_region.texi:l3
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument: \\n}
    {empty_line:\\n}
    *index_entry_command@cindex C1 index_special_region.texi:l5
    |element_region:{copying}
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:Copying this document}
      {spaces_after_argument:\\n}
    *normal_command@anchor C1 index_special_region.texi:l6
    |identifier:{Copying-information}
    |is_target:{1}
     *brace_arg C1
     |element_region:{copying}
      {normal_text:Copying information}
    {spaces_after_close_brace:\\n}
    {empty_line:\\n}
    *paragraph C4
     {normal_text:This is a test manual, trivially and explicitly in the public\\n}
     {normal_text:domain}
     *normal_command@footnote C1 index_special_region.texi:l9
     |global_command_number:{1}
      *brace_command_context C5
       *normal_command@anchor C1 index_special_region.texi:l9
       |identifier:{Public-domain-reference}
       |is_target:{1}
        *brace_arg C1
        |element_region:{copying}
         {normal_text:Public domain reference}
       {spaces_after_close_brace: }
       *paragraph C2
        {normal_text:The public\\n}
        {normal_text:domain is something you should allready know\\n}
       {empty_line:\\n}
       *index_entry_command@cindex C1 index_special_region.texi:l12
       |element_region:{copying}
       |index_entry:I{cp,2}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:Public domain}
         {spaces_after_argument:\\n}
     {normal_text:.\\n}
    {empty_line:\\n}
    *normal_command@printindex C1 index_special_region.texi:l15
    |global_command_number:{1}
    |misc_args:A{cp}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cp}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
    *normal_command@end C1 index_special_region.texi:l17
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@titlepage C10 index_special_region.texi:l19
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *index_entry_command@cindex C1 index_special_region.texi:l21
    |element_region:{titlepage}
    |index_entry:I{cp,3}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:Titlepage index}
      {spaces_after_argument:\\n}
    *normal_command@anchor C1 index_special_region.texi:l22
    |identifier:{Titlepage-anchor}
    |is_target:{1}
     *brace_arg C1
     |element_region:{titlepage}
      {normal_text:Titlepage anchor}
    {spaces_after_close_brace:\\n}
    {empty_line:\\n}
    *paragraph C3
     {normal_text:This is the titlepage}
     *normal_command@footnote C1 index_special_region.texi:l24
     |global_command_number:{2}
      *brace_command_context C5
       *normal_command@anchor C1 index_special_region.texi:l24
       |identifier:{Titlepage-footnote-anchor}
       |is_target:{1}
        *brace_arg C1
        |element_region:{titlepage}
         {normal_text:Titlepage footnote anchor}
       {spaces_after_close_brace:\\n}
       *paragraph C1
        {normal_text:This is a fine document.\\n}
       {empty_line:\\n}
       *index_entry_command@cindex C1 index_special_region.texi:l27
       |element_region:{titlepage}
       |index_entry:I{cp,4}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:Titlepage footnote}
         {spaces_after_argument:\\n}
     {normal_text:\\n}
    {empty_line:\\n}
    *normal_command@insertcopying C1 index_special_region.texi:l30
    |global_command_number:{1}
     *line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@end C1 index_special_region.texi:l31
    |text_arg:{titlepage}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:titlepage}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 index_special_region.texi:l33 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C1 index_special_region.texi:l34 {Top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@chapter C15 index_special_region.texi:l35 {Chapter}
 |identifier:{Chapter}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:  }
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:note this chapter is not associated to a node}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@insertcopying C1 index_special_region.texi:l37
  |global_command_number:{2}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *paragraph C6
   {normal_text:This test demonstrates }
   *normal_command@@
   {normal_text:anchor and indices in }
   *normal_command@@
   {normal_text:copying\\n}
   {normal_text:and titlepage, and various wrong index entries.\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 index_special_region.texi:l42
  |element_node:{Top}
  |index_entry:I{fn,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:findex entry}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_special_region.texi:l44
   *line_arg C1
    {spaces_before_argument:\\n}
  *normal_command@deffn C4 index_special_region.texi:l45
   *def_line C1 index_special_region.texi:l45
   |def_command:{deffn}
   |original_def_cmdname:{deffn}
    *block_line_arg C4
     *def_category C1
      *bracketed_arg C1 index_special_region.texi:l45
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 index_special_region.texi:l45
       {spaces_before_argument: }
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 index_special_region.texi:l46
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C2
     *def_category C1
      *bracketed_arg C1 index_special_region.texi:l46
       {normal_text:truc}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 index_special_region.texi:l47
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C4
     *def_category C1
      *bracketed_arg index_special_region.texi:l47
     {spaces: }
     *def_name C1
      *bracketed_arg index_special_region.texi:l47
     {spaces_after_argument:\\n}
   *normal_command@end C1 index_special_region.texi:l48
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@ftable C4 index_special_region.texi:l50
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 index_special_region.texi:l51
      *line_arg C1
       {spaces_before_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 index_special_region.texi:l52
     |element_node:{Top}
     |index_entry:I{fn,2}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:fun}
       {spaces_after_argument:\\n}
   *normal_command@end C1 index_special_region.texi:l53
   |text_arg:{ftable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ftable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 index_special_region.texi:l55
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 index_special_region.texi:l56
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Copying-and-indices}
     {normal_text:Copying and indices}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 index_special_region.texi:l57
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 index_special_region.texi:l59 {Copying and indices}
 |identifier:{Copying-and-indices}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Copying and indices}
    {spaces_after_argument:\\n}
 *normal_command@appendix C18 index_special_region.texi:l60 {Copying and indices}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Copying and indices}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In the appendix, we print the indices and references.\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 index_special_region.texi:l64
  |element_node:{Copying-and-indices}
  |index_entry:I{fn,3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:another fun}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_special_region.texi:l66
  |element_node:{Copying-and-indices}
  |index_entry:I{cp,5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Copying appendix}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@ref C1 index_special_region.texi:l68
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Copying-information}
     {normal_text:Copying information}
   {normal_text: for the copying information.\\n}
   *normal_command@ref C1 index_special_region.texi:l69
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Public-domain-reference}
     {normal_text:Public domain reference}
   {normal_text: for reference on the licence.\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@ref C1 index_special_region.texi:l71
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Titlepage-anchor}
     {normal_text:Titlepage anchor}
   {normal_text: for the titlepage.\\n}
   *normal_command@ref C1 index_special_region.texi:l72
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Titlepage-footnote-anchor}
     {normal_text:Titlepage footnote anchor}
   {normal_text: for reference on the titlepage.\\n}
  {empty_line:\\n}
  *normal_command@insertcopying C1 index_special_region.texi:l74
  |global_command_number:{3}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 index_special_region.texi:l76
  |global_command_number:{2}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  *normal_command@printindex C1 index_special_region.texi:l77
  |global_command_number:{3}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 index_special_region.texi:l79
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'index_special_region_no_titlepage_no_nodes'} = '\\input texinfo @c -*-texinfo-*-

@copying 

@cindex Copying this document
@anchor{Copying information}

This is a test manual, trivially and explicitly in the public
domain@footnote{@anchor{Public domain reference} The public
domain is something you should allready know

@cindex Public domain
}.

@printindex cp

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

@insertcopying

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

@insertcopying

@printindex cp
@printindex fn

@contents
@bye
';


$result_texts{'index_special_region_no_titlepage_no_nodes'} = '

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

$result_errors{'index_special_region_no_titlepage_no_nodes'} = '* W index_special_region.texi:l44|@cindex missing argument
 warning: @cindex missing argument

* W index_special_region.texi:l45|missing name for @deffn
 warning: missing name for @deffn

* W index_special_region.texi:l46|missing name for @deffnx
 warning: missing name for @deffnx

* W index_special_region.texi:l47|missing name for @deffnx
 warning: missing name for @deffnx

* E index_special_region.texi:l50|missing @ftable argument
 missing @ftable argument

* W index_special_region.texi:l51|@item missing argument
 warning: @item missing argument

';

$result_nodes_list{'index_special_region_no_titlepage_no_nodes'} = '1|Top
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

$result_sections_list{'index_special_region_no_titlepage_no_nodes'} = '1|Top
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

$result_sectioning_root{'index_special_region_no_titlepage_no_nodes'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'index_special_region_no_titlepage_no_nodes'} = '';

$result_indices_sort_strings{'index_special_region_no_titlepage_no_nodes'} = 'cp:
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

$result_converted_sort_strings{'file_html'}->{'index_special_region_no_titlepage_no_nodes'} = 'cp:
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

$result_converted_sort_strings{'file_plaintext'}->{'index_special_region_no_titlepage_no_nodes'} = 'cp:
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
