use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'end_sentence_after_or_not_after_quoted_node'} = '*document_root C3
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
    {Top}
    {spaces_after_argument:\\n}
 *@top C14 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@ref C2 l4
    *brace_arg C1
    |EXTRA
    |node_content:{aaa}
    |normalized:{aaa}
     {aaa}
    *brace_arg C2
     {spaces_before_argument: }
     {n}
   {. b.\\n}
   *@ref C2 l5
    *brace_arg C1
    |EXTRA
    |node_content:{aaB}
    |normalized:{aaB}
     {aaB}
    *brace_arg C2
     {spaces_before_argument: }
     {n}
   {. b.\\n}
  {empty_line:\\n}
  *paragraph C4
   *@ref C2 l7
    *brace_arg C1
    |EXTRA
    |node_content:{c.dd}
    |normalized:{c_002edd}
     {c.dd}
    *brace_arg C2
     {spaces_before_argument: }
     {n}
   {. v.\\n}
   *@ref C2 l8
    *brace_arg C1
    |EXTRA
    |node_content:{c.dD}
    |normalized:{c_002edD}
     {c.dD}
    *brace_arg C2
     {spaces_before_argument: }
     {n}
   {. v.\\n}
  {empty_line:\\n}
  *@anchor C1 l10
  |EXTRA
  |identifier:{aaa}
  |is_target:{1}
   *brace_arg C1
    {aaa}
  {spaces_after_close_brace:\\n}
  *@anchor C1 l11
  |EXTRA
  |identifier:{aaB}
  |is_target:{1}
   *brace_arg C1
    {aaB}
  {spaces_after_close_brace:\\n}
  *@anchor C1 l12
  |EXTRA
  |identifier:{c_002edd}
  |is_target:{1}
   *brace_arg C1
    {c.dd}
  {spaces_after_close_brace:\\n}
  *@anchor C1 l13
  |EXTRA
  |identifier:{c_002edD}
  |is_target:{1}
   *brace_arg C1
    {c.dD}
  {spaces_after_close_brace:\\n}
';


$result_texis{'end_sentence_after_or_not_after_quoted_node'} = '@node Top
@top top

@ref{aaa, n}. b.
@ref{aaB, n}. b.

@ref{c.dd, n}. v.
@ref{c.dD, n}. v.

@anchor{aaa}
@anchor{aaB}
@anchor{c.dd}
@anchor{c.dD}
';


$result_texts{'end_sentence_after_or_not_after_quoted_node'} = 'top
***

aaa. b.
aaB. b.

c.dd. v.
c.dD. v.

';

$result_errors{'end_sentence_after_or_not_after_quoted_node'} = '';

$result_nodes_list{'end_sentence_after_or_not_after_quoted_node'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'end_sentence_after_or_not_after_quoted_node'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'end_sentence_after_or_not_after_quoted_node'} = 'level: -1
list:
 1|top
';

$result_headings_list{'end_sentence_after_or_not_after_quoted_node'} = '';


$result_converted{'info'}->{'end_sentence_after_or_not_after_quoted_node'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

top
***

*note n: aaa.  b.  *note n: aaB. b.

   *note n: c.dd.  v.  *note n: c.dD. v.


Tag Table:
Node: Top27
Ref: aaa153
Ref: aaB153
Ref: c.dd153
Ref: c.dD153

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'end_sentence_after_or_not_after_quoted_node'} = '* W l7|@ref node name should not contain `.\'
 warning: @ref node name should not contain `.\'

* W l8|@ref node name should not contain `.\'
 warning: @ref node name should not contain `.\'

';

1;
