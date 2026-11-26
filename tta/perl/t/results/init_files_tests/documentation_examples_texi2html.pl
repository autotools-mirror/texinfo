use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentation_examples_texi2html'} = '*document_root C11
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *normal_command@settitle C1 l2
    *line_arg C9
     {spaces_before_argument: }
     *normal_command@email C2 l2
      *brace_arg C3
       {normal_text:someone}
       *normal_command@@
       {normal_text:example.com}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:me}
     {normal_text: }
     *normal_command@sansserif C1 l2
      *brace_container C1
       {normal_text:in--title}
     {normal_text: }
     *normal_command@error C1 l2
      *brace_container
     {normal_text: }
     *normal_command@equiv C1 l2
      *brace_container
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@contents C1 l4
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l6 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l7 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C28 l10 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C11
   *normal_command@sansserif C1 l12
    *brace_container C1
     {normal_text:in--text}
   {normal_text: }
   *normal_command@-
   {normal_text: p--n. }
   *normal_command@error C1 l12
    *brace_container
   {normal_text: }
   *normal_command@equiv C1 l12
    *brace_container
   {normal_text:\\n}
   *normal_command@xref C1 l13
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{my-node}
     {normal_text:my node}
   *normal_command@footnote C1 l13
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {normal_text:in footnote}
   {normal_text:.\\n}
  *normal_command@titlefont C1 l14
  |global_command_number:{1}
   *brace_container C1
    {normal_text:in titlefont}
  {normal_text:\\n}
  *paragraph C8
   *normal_command@email C2 l15
    *brace_arg C3
     {normal_text:a}
     *normal_command@@
     {normal_text:b.c}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:someone}
   {normal_text:\\n}
   *normal_command@sc C1 l16
    *brace_container C1
     {normal_text:in Sc}
   {normal_text:\\n}
   *normal_command@var C1 l17
    *brace_container C1
     {normal_text:in var}
   {normal_text:\\n}
   *normal_command@slanted C1 l18
    *brace_container C2
     {normal_text:``slant--}
     *normal_command@code C1 l18
      *brace_container C1
       {normal_text:this}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@math C1 l20
    *brace_arg C7
     *normal_command@sansserif C1 l20
      *brace_container C1
       {normal_text:in--math}
     {normal_text: }
     *normal_command@-
     {normal_text: a=b }
     *normal_command@error C1 l20
      *brace_container
     {normal_text: }
     *normal_command@equiv C1 l20
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@indentedblock C3 l22
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@example C3 l23
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C10
     *normal_command@sansserif C1 l24
      *brace_container C1
       {normal_text:in--example}
     {normal_text: }
     *normal_command@-
     {normal_text: c. }
     *normal_command@error C1 l24
      *brace_container
     {normal_text: }
     *normal_command@equiv C1 l24
      *brace_container
     {normal_text:\\n}
     *normal_command@email C1 l25
      *brace_arg C3
       {normal_text:a}
       *normal_command@@
       {normal_text:example}
     {normal_text:\\n}
    *normal_command@end C1 l26
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l27
   |text_arg:{indentedblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:indentedblock}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@display C3 l29
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    *normal_command@email C1 l30
     *brace_arg C3
      {normal_text:a}
      *normal_command@@
      {normal_text:display}
    {normal_text:\\n}
   *normal_command@end C1 l31
   |text_arg:{display}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:display}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@displaymath C9 l33
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {normal_text:\\frac}
   *balanced_braces C1 l34
    {normal_text:{h}}
   *balanced_braces C3 l34
    {normal_text:{j}
    *normal_command@sup C1 l34
     *brace_container C1
      {normal_text:2}
    {normal_text:}}
   {normal_text: \\dv[n]}
   *balanced_braces C1 l34
    {normal_text:{f}}
   *balanced_braces C1 l34
    {normal_text:{x}}
   {normal_text:\\n}
   *normal_command@end C1 l35
   |text_arg:{displaymath}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:displaymath}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l37
  |element_node:{chapter}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@file C1 l37
     *brace_container C1
      {normal_text:e1}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l38
  |element_node:{chapter}
  |index_entry:I{cp,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:i2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@vindex C1 l40
   *line_arg C1
    {spaces_before_argument:    \\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l42
  |global_command_number:{1}
  |text_arg:{fr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@error C1 l44
    *brace_container
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@equiv C1 l46
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@contents C1 l48
  |global_command_number:{2}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l50 {my node}
 |identifier:{my-node}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:my node}
    {spaces_after_argument:\\n}
 *normal_command@chapter C8 l51 {New node}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:New node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l53
  |global_command_number:{2}
  |text_arg:{pl}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:pl}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@error C1 l55
    *brace_container
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@equiv C1 l57
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l59 {Index}
 |identifier:{Index}
 |is_target:{1}
 |isindex:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Index}
    {spaces_after_argument:\\n}
 *normal_command@appendix C4 l60 {Index}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Index}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l62
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l64 {Second appendix}
 |identifier:{Second-appendix}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Second appendix}
    {spaces_after_argument:\\n}
 *normal_command@appendix C2 l65 {Second appendix}
 |section_heading_number:{B}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Second appendix}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'documentation_examples_texi2html'} = '
@settitle @email{someone@@example.com, me} @sansserif{in--title} @error{} @equiv{}

@contents

@node Top
@top top

@node chapter
@chapter Chapter

@sansserif{in--text} @- p--n. @error{} @equiv{}
@xref{my node}@footnote{in footnote}.
@titlefont{in titlefont}
@email{a@@b.c, someone}
@sc{in Sc}
@var{in var}
@slanted{``slant--@code{this}}

@math{@sansserif{in--math} @- a=b @error{} @equiv{}}

@indentedblock
@example
@sansserif{in--example} @- c. @error{} @equiv{}
@email{a@@example}
@end example
@end indentedblock

@display
@email{a@@display}
@end display

@displaymath
\\frac{h}{j@sup{2}} \\dv[n]{f}{x}
@end displaymath

@cindex @file{e1}
@cindex i2

@vindex    

@documentlanguage fr

@error{}.

@equiv{}

@contents

@node my node
@chapter New node

@documentlanguage pl

@error{}.

@equiv{}

@node Index
@appendix Index

@printindex cp

@node Second appendix
@appendix Second appendix

';


$result_texts{'documentation_examples_texi2html'} = '

top
***

1 Chapter
*********

in-text  p-n. error-> ==
my node.
in titlefont
someone
IN SC
in var
"slant-this

in--math  a=b error-> ==

in--example  c. error-> ==
a@example

a@display

\\frac{h}{j2} \\dv[n]{f}{x}




error->.

==


2 New node
**********


error->.

==

Appendix A Index
****************


Appendix B Second appendix
**************************

';

$result_errors{'documentation_examples_texi2html'} = '* W l40|@vindex missing argument
 warning: @vindex missing argument

';

$result_nodes_list{'documentation_examples_texi2html'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  next->my node
  prev->Top
  up->Top
3|my node
 associated_section: 2 New node
 associated_title_command: 2 New node
 node_directions:
  next->Index
  prev->chapter
  up->Top
4|Index
 associated_section: A Index
 associated_title_command: A Index
 node_directions:
  next->Second appendix
  prev->my node
  up->Top
5|Second appendix
 associated_section: B Second appendix
 associated_title_command: B Second appendix
 node_directions:
  prev->Index
  up->Top
';

$result_sections_list{'documentation_examples_texi2html'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
  2|New node
  3|Index
  4|Second appendix
2|Chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->New node
  up->top
 toplevel_directions:
  next->New node
  prev->top
  up->top
3|New node
 associated_anchor_command: my node
 associated_node: my node
 section_directions:
  next->Index
  prev->Chapter
  up->top
 toplevel_directions:
  next->Index
  prev->Chapter
  up->top
4|Index
 associated_anchor_command: Index
 associated_node: Index
 section_directions:
  next->Second appendix
  prev->New node
  up->top
 toplevel_directions:
  next->Second appendix
  prev->New node
  up->top
5|Second appendix
 associated_anchor_command: Second appendix
 associated_node: Second appendix
 section_directions:
  prev->Index
  up->top
 toplevel_directions:
  prev->Index
  up->top
';

$result_sectioning_root{'documentation_examples_texi2html'} = 'level: -1
list:
 1|top
';

$result_headings_list{'documentation_examples_texi2html'} = '';

$result_indices_sort_strings{'documentation_examples_texi2html'} = 'cp:
 e1
 i2
';

$result_converted_sort_strings{'file_html'}->{'documentation_examples_texi2html'} = 'cp:
 e1
 i2
';

1;
