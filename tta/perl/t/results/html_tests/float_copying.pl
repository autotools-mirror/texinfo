use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'float_copying'} = '*document_root C6
 *before_node_section C2
  *preamble_before_setfilename C1
   *preamble_before_beginning C2
    {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
    {text_before_beginning:\\n}
  *preamble_before_content C4
   *@setfilename C1 float_copying.texi:l3
   |EXTRA
   |text_arg:{float_copying.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float_copying.info}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@copying C4 float_copying.texi:l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument: \\n}
    {empty_line:\\n}
    *@float C7 float_copying.texi:l7
    |EXTRA
    |float_number:{1}
    |float_type:{Copyright notice}
    |global_command_number:{1}
    |identifier:{public-domain}
    |is_target:{1}
     *arguments_line C2
      *block_line_arg C2
       {spaces_before_argument: }
       {normal_text:Copyright notice}
      *block_line_arg C3
       {spaces_before_argument: }
       {normal_text:public domain}
       {spaces_after_argument:\\n}
     {empty_line:\\n}
     *paragraph C2
      {normal_text:Public domain is not really a licence, as it means than \\n}
      {normal_text:the author abandon his copyright.\\n}
     {empty_line:\\n}
     *@caption C1 float_copying.texi:l12
      *brace_command_context C6
       *paragraph C3
        {normal_text:The Public Domain notice}
        *@footnote C1 float_copying.texi:l12
        |EXTRA
        |global_command_number:{1}
         *brace_command_context C8
          {spaces_before_argument:\\n}
          *paragraph C3
           {normal_text:The caption copying footnote\\n}
           *@anchor C1 float_copying.texi:l14
           |EXTRA
           |identifier:{caption-copying-footnote-anchor}
           |is_target:{1}
            *brace_arg C1
            |EXTRA
            |element_region:{copying}
             {normal_text:caption copying footnote anchor}
           {spaces_after_close_brace:\\n}
          {empty_line:\\n}
          *index_entry_command@cindex C1 float_copying.texi:l16
          |EXTRA
          |element_region:{copying}
          |index_entry:I{cp,1}
           *line_arg C3
            {spaces_before_argument: }
            {normal_text:indexed caption copying footnote}
            {spaces_after_argument:\\n}
          *index_entry_command@findex C1 float_copying.texi:l17
          |EXTRA
          |element_region:{copying}
          |index_entry:I{fn,1}
           *line_arg C3
            {spaces_before_argument: }
            {normal_text:public domain function}
            {spaces_after_argument:\\n}
          {empty_line:\\n}
          *paragraph C3
           {normal_text:see }
           *@ref C1 float_copying.texi:l19
            *brace_arg C1
            |EXTRA
            |node_content:A{0|0}
            |normalized:{Copying-and-floats}
             {normal_text:Copying and floats}
           {normal_text:.\\n}
          {empty_line:\\n}
        {normal_text:\\n}
       {empty_line:\\n}
       *@anchor C1 float_copying.texi:l23
       |EXTRA
       |identifier:{public-domain-anchor}
       |is_target:{1}
        *brace_arg C1
        |EXTRA
        |element_region:{copying}
         {normal_text:public domain anchor}
       {spaces_after_close_brace:\\n}
       *index_entry_command@cindex C1 float_copying.texi:l24
       |EXTRA
       |element_region:{copying}
       |index_entry:I{cp,2}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:indexed caption}
         {spaces_after_argument:\\n}
       *index_entry_command@findex C1 float_copying.texi:l25
       |EXTRA
       |element_region:{copying}
       |index_entry:I{fn,2}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:indexed caption function}
         {spaces_after_argument:\\n}
     {spaces_after_close_brace:\\n}
     *@end C1 float_copying.texi:l27
     |EXTRA
     |text_arg:{float}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:float}
       {spaces_after_argument:\\n}
    *@end C1 float_copying.texi:l28
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 float_copying.texi:l30 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C12 float_copying.texi:l31 {Top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 float_copying.texi:l33
  |EXTRA
  |element_node:{Top}
  |index_entry:I{cp,3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:See the caption }
   *@ref C1 float_copying.texi:l35
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{public-domain-anchor}
     {normal_text:public domain anchor}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:See the float }
   *@ref C1 float_copying.texi:l37
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{public-domain}
     {normal_text:public domain}
   {normal_text:.\\n}
  {empty_line:\\n}
  *@insertcopying C1 float_copying.texi:l39
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@menu C3 float_copying.texi:l41
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 float_copying.texi:l42
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Copying-and-floats}
     {normal_text:Copying and floats}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 float_copying.texi:l43
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 float_copying.texi:l45 {Copying and floats}
 |EXTRA
 |identifier:{Copying-and-floats}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Copying and floats}
    {spaces_after_argument:\\n}
 *@appendix C20 float_copying.texi:l46 {Copying and floats}
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Copying and floats}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:In the appendix, we print the references and the copying once more\\n}
   {normal_text:and the list of coyright notices (listoffloats).\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:See the caption }
   *@ref C1 float_copying.texi:l51
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{public-domain-anchor}
     {normal_text:public domain anchor}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:See the float }
   *@ref C1 float_copying.texi:l53
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{public-domain}
     {normal_text:public domain}
   {normal_text:.\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 float_copying.texi:l55
  |EXTRA
  |element_node:{Copying-and-floats}
  |index_entry:I{cp,4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:listofloats}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@insertcopying C1 float_copying.texi:l57
  |EXTRA
  |global_command_number:{2}
   *line_arg C1
    {spaces_before_argument:\\n}
  *@insertcopying C1 float_copying.texi:l58
  |EXTRA
  |global_command_number:{3}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@subheading C1 float_copying.texi:l60
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:listoffloats}
    {spaces_after_argument:\\n}
  *@listoffloats C1 float_copying.texi:l61
  |EXTRA
  |float_type:{Copyright notice}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Copyright notice}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@subheading C1 float_copying.texi:l63
  |EXTRA
  |global_command_number:{2}
  |heading_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:printindex}
    {spaces_after_argument:\\n}
  *@printindex C1 float_copying.texi:l64
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  *@printindex C1 float_copying.texi:l65
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'float_copying'} = '\\input texinfo @c -*-texinfo-*-

@setfilename float_copying.info

@copying 

@float Copyright notice, public domain

Public domain is not really a licence, as it means than 
the author abandon his copyright.

@caption{The Public Domain notice@footnote{
The caption copying footnote
@anchor{caption copying footnote anchor}

@cindex indexed caption copying footnote
@findex public domain function

see @ref{Copying and floats}.

}

@anchor{public domain anchor}
@cindex indexed caption
@findex indexed caption function
}
@end float
@end copying

@node Top
@top Top

@cindex Top

See the caption @ref{public domain anchor}.

See the float @ref{public domain}.

@insertcopying

@menu
* Copying and floats::
@end menu

@node Copying and floats
@appendix Copying and floats

In the appendix, we print the references and the copying once more
and the list of coyright notices (listoffloats).

See the caption @ref{public domain anchor}.

See the float @ref{public domain}.

@cindex listofloats

@insertcopying
@insertcopying

@subheading listoffloats
@listoffloats Copyright notice

@subheading printindex
@printindex cp
@printindex fn

@bye
';


$result_texts{'float_copying'} = '

Top
***


See the caption public domain anchor.

See the float public domain.


* Copying and floats::

Appendix A Copying and floats
*****************************

In the appendix, we print the references and the copying once more
and the list of coyright notices (listoffloats).

See the caption public domain anchor.

See the float public domain.



listoffloats
------------

printindex
----------

';

$result_errors{'float_copying'} = '';

$result_floats{'float_copying'} = 'Copyright notice: 1
 F1: {public-domain}
  C: The Public Domain notice@footnote{
   The caption copying footnote
   @anchor{caption copying footnote anchor}
   
   @cindex indexed caption copying footnote
   @findex public domain function
   
   see @ref{Copying and floats}.
   
   }
   
   @anchor{public domain anchor}
   @cindex indexed caption
   @findex indexed caption function
';

$result_nodes_list{'float_copying'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  Copying and floats
 node_directions:
  next->Copying and floats
2|Copying and floats
 associated_section: A Copying and floats
 associated_title_command: A Copying and floats
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'float_copying'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Copying and floats
 section_children:
  1|Copying and floats
2|Copying and floats
 associated_anchor_command: Copying and floats
 associated_node: Copying and floats
 section_directions:
  up->Top
 toplevel_directions:
  prev->Top
  up->Top
';

$result_sectioning_root{'float_copying'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'float_copying'} = '1|listoffloats
2|printindex
';

$result_indices_sort_strings{'float_copying'} = 'cp:
 indexed caption
 indexed caption copying footnote
 listofloats
 Top
fn:
 indexed caption function
 public domain function
';

$result_converted_sort_strings{'file_html'}->{'float_copying'} = 'cp:
 indexed caption
 indexed caption copying footnote
 listofloats
 Top
fn:
 indexed caption function
 public domain function
';

1;
