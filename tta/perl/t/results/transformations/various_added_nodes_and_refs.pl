use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'various_added_nodes_and_refs'} = '*document_root C19
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |added:{1}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l1 {otp}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:otp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l3 {a node [+1+]}
 |EXTRA
 |added:{1}
 |identifier:{a-node-_005b_002b1_002b_005d}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:a node}
    {normal_text: [+1+]}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l3 {a node}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l5 {a node @code{in code}}
 |EXTRA
 |added:{1}
 |identifier:{a-node-in-code}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:a node }
    *normal_command@code C1
     *brace_container C1
      {normal_text:in code}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l5 {a node @code{in code}}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:a node }
    *normal_command@code C1 l5
     *brace_container C1
      {normal_text:in code}
    {spaces_after_argument: }
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {a @comma{}@comma{} node @code{a@comma{}b@comma{}}}
 |EXTRA
 |added:{1}
 |identifier:{a-_002c_002c-node-a_002cb_002c}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    {normal_text:a }
    *normal_command@comma C1
     *brace_container
    *normal_command@comma C1
     *brace_container
    {normal_text: node }
    *normal_command@code C1
     *brace_container C4
      {normal_text:a}
      *normal_command@comma C1
       *brace_container
      {normal_text:b}
      *normal_command@comma C1
       *brace_container
    {spaces_after_argument:\\n}
 *normal_command@section C2 l7 {a ,, node @code{a,b,}}
 |EXTRA
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{4}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:a ,, node }
    *normal_command@code C1 l7
     *brace_container C1
      {normal_text:a,b,}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {@asis{(}in paren(too  aaa}
 |EXTRA
 |added:{1}
 |identifier:{_0028in-paren_0028too-aaa}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    *normal_command@asis C1
     *brace_container C1
      {normal_text:(}
    {normal_text:in paren(too  aaa}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l9 {(in paren(too  aaa}
 |EXTRA
 |section_heading_number:{2.2}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:(in paren(too  aaa}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l11 {changed @code{node} and (@samp{file})}
 |EXTRA
 |added:{1}
 |identifier:{changed-node-and-_0028file_0029}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    {normal_text:changed }
    * C1
     *normal_command@code C1
      *brace_container C1
       {normal_text:node}
    {normal_text: and (}
    * C1
     *normal_command@samp C1
      *brace_container C1
       {normal_text:file}
    {normal_text:)}
    {spaces_after_argument:\\n}
 *normal_command@subsection C2 l11 {changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})}
 |EXTRA
 |section_heading_number:{2.2.1}
 |section_level:{3}
 |section_number:{6}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    {normal_text:changed }
    *normal_command@ref C1 l11
     *brace_arg C2
     |EXTRA
     |node_content:A{1|1}
     |normalized:{node}
      {spaces_before_argument: }
      *normal_command@code C1 l11
       *brace_container C1
        {normal_text:node}
    {normal_text: and (}
    *normal_command@pxref C4 l11
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C2
      {spaces_before_argument: }
      *normal_command@samp C1 l11
       *brace_container C1
        {normal_text:file}
    {normal_text:)}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l13 {@asis{} [+1+]}
 |EXTRA
 |added:{1}
 |identifier:{-_005b_002b1_002b_005d}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    *normal_command@asis C1
     *brace_container
    {normal_text: [+1+]}
    {spaces_after_argument:\\n}
 *normal_command@subsection C2 l13 {@asis{}}
 |EXTRA
 |section_heading_number:{2.2.2}
 |section_level:{3}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@asis C1 l13
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l15 {a@asis{::}b@asis{	} c}
 |EXTRA
 |added:{1}
 |identifier:{a_003a_003ab-c}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    {normal_text:a}
    *normal_command@asis C1
     *brace_container C1
      {normal_text:::}
    {normal_text:b}
    *normal_command@asis C1
     *brace_container C1
      {normal_text:\\t}
    {normal_text: c}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l15 {a::b	 c}
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a::b\\t c}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l17 {a node [+2+]}
 |EXTRA
 |added:{1}
 |identifier:{a-node-_005b_002b2_002b_005d}
 |is_target:{1}
 |node_number:{9}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:a node}
    {normal_text: [+2+]}
    {spaces_after_argument:\\n}
 *normal_command@section C6 l17 {a node}
 |EXTRA
 |section_heading_number:{3.1}
 |section_level:{2}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C14
   *normal_command@ref C1 l20
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a-node}
     {normal_text:a node}
   {normal_text:\\n}
   *normal_command@ref C1 l21
    *brace_arg C4
    |EXTRA
    |node_content:A{0|1}
    |normalized:{a-node-in-code}
     {normal_text:a node }
     *normal_command@code C1 l21
      *brace_container C1
       {normal_text:in code}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   {normal_text:\\n}
   *normal_command@ref C3 l23
    *brace_arg C2
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a}
     {normal_text:a}
     {spaces_after_argument: }
    *brace_arg
    *brace_arg C3
     {spaces_before_argument: }
     {normal_text:node }
     *normal_command@code C1 l23
      *brace_container C1
       {normal_text:a,b,}
   {normal_text:\\n}
   *normal_command@ref C1 l24
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0028in-paren_0028too-aaa}
     {normal_text:(in paren(too  aaa}
   {normal_text:\\n}
   *normal_command@ref C1 l25
    *brace_arg C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{changed-node-and-_0028file_0029}
     {normal_text:changed }
     *normal_command@ref C1 l25
      *brace_arg C2
      |EXTRA
      |node_content:A{1|1}
      |normalized:{node}
       {spaces_before_argument: }
       *normal_command@code C1 l25
        *brace_container C1
         {normal_text:node}
     {normal_text: and (}
     *normal_command@pxref C4 l25
      *brace_arg C1
       {spaces_before_argument: }
      *brace_arg
      *brace_arg C1
       {spaces_before_argument: }
      *brace_arg C2
       {spaces_before_argument: }
       *normal_command@samp C1 l25
        *brace_container C1
         {normal_text:file}
     {normal_text:)}
   {normal_text:\\n}
   *normal_command@ref C1 l26
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     *normal_command@asis C1 l26
      *brace_container
   {normal_text:\\n}
   *normal_command@ref C1 l27
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{a_003a_003ab-c}
     {normal_text:a::b\\t c}
   {normal_text:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
';


$result_texis{'various_added_nodes_and_refs'} = '@node Top
@top otp

@node a node [+1+]
@chapter a node

@node a node @code{in code}
@chapter a node @code{in code} @c comment

@node a @comma{}@comma{} node @code{a@comma{}b@comma{}}
@section a ,, node @code{a,b,}

@node @asis{(}in paren(too  aaa
@section (in paren(too  aaa

@node changed @code{node} and (@samp{file})
@subsection changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})

@node @asis{} [+1+]
@subsection @asis{}

@node a@asis{::}b@asis{	} c
@chapter a::b	 c

@node a node [+2+]
@section a node


@ref{a node}
@ref{a node @code{in code} @c comment
}
@ref{a ,, node @code{a,b,}}
@ref{(in paren(too  aaa}
@ref{changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})}
@ref{@asis{}}
@ref{a::b	 c}


';


$result_texts{'various_added_nodes_and_refs'} = 'otp
***

1 a node
********

2 a node in code
****************

2.1 a ,, node a,b,
==================

2.2 (in paren(too  aaa
======================

2.2.1 changed node and ()
-------------------------

2.2.2 
------

3 a::b	 c
********

3.1 a node
==========


a node
a node in code
a
(in paren(too  aaa
changed node and ()

a::b	 c


';

$result_errors{'various_added_nodes_and_refs'} = '* W l25|@ref should not appear anywhere inside @ref
 warning: @ref should not appear anywhere inside @ref

* W l25|@pxref should not appear anywhere inside @ref
 warning: @pxref should not appear anywhere inside @ref

* E l11|@ref reference to nonexistent node `@code{node}\'
 @ref reference to nonexistent node `@code{node}\'

* E l20|@ref reference to nonexistent node `a node\'
 @ref reference to nonexistent node `a node\'

* E l23|@ref reference to nonexistent node `a\'
 @ref reference to nonexistent node `a\'

* W l24|@ref to `(in paren(too  aaa\', different from node name `@asis{(}in paren(too  aaa\'
 warning: @ref to `(in paren(too  aaa\', different from node name `@asis{(}in paren(too  aaa\'

* E l25|@ref reference to nonexistent node `@code{node}\'
 @ref reference to nonexistent node `@code{node}\'

* W l25|@ref to `changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})\', different from node name `changed @code{node} and (@samp{file})\'
 warning: @ref to `changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})\', different from node name `changed @code{node} and (@samp{file})\'

* E l26|@ref reference to nonexistent node `@asis{}\'
 @ref reference to nonexistent node `@asis{}\'

* W l27|@ref to `a::b	 c\', different from node name `a@asis{::}b@asis{	} c\'
 warning: @ref to `a::b	 c\', different from node name `a@asis{::}b@asis{	} c\'

';

$result_nodes_list{'various_added_nodes_and_refs'} = '1|Top
 associated_section: otp
 associated_title_command: otp
 node_directions:
  next->a node [+1+]
2|a node [+1+]
 associated_section: 1 a node
 associated_title_command: 1 a node
 node_directions:
  next->a node @code{in code}
  prev->Top
  up->Top
3|a node @code{in code}
 associated_section: 2 a node @code{in code}
 associated_title_command: 2 a node @code{in code}
 node_directions:
  next->a@asis{::}b@asis{	} c
  prev->a node [+1+]
  up->Top
4|a @comma{}@comma{} node @code{a@comma{}b@comma{}}
 associated_section: 2.1 a ,, node @code{a,b,}
 associated_title_command: 2.1 a ,, node @code{a,b,}
 node_directions:
  next->@asis{(}in paren(too  aaa
  up->a node @code{in code}
5|@asis{(}in paren(too  aaa
 associated_section: 2.2 (in paren(too  aaa
 associated_title_command: 2.2 (in paren(too  aaa
 node_directions:
  prev->a @comma{}@comma{} node @code{a@comma{}b@comma{}}
  up->a node @code{in code}
6|changed @code{node} and (@samp{file})
 associated_section: 2.2.1 changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})
 associated_title_command: 2.2.1 changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})
 node_directions:
  next->@asis{} [+1+]
  up->@asis{(}in paren(too  aaa
7|@asis{} [+1+]
 associated_section: 2.2.2 @asis{}
 associated_title_command: 2.2.2 @asis{}
 node_directions:
  prev->changed @code{node} and (@samp{file})
  up->@asis{(}in paren(too  aaa
8|a@asis{::}b@asis{	} c
 associated_section: 3 a::b	 c
 associated_title_command: 3 a::b	 c
 node_directions:
  prev->a node @code{in code}
  up->Top
9|a node [+2+]
 associated_section: 3.1 a node
 associated_title_command: 3.1 a node
 node_directions:
  up->a@asis{::}b@asis{	} c
';

$result_sections_list{'various_added_nodes_and_refs'} = '1|otp
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->a node
 section_children:
  1|a node
  2|a node @code{in code}
  3|a::b	 c
2|a node
 associated_anchor_command: a node [+1+]
 associated_node: a node [+1+]
 section_directions:
  next->a node @code{in code}
  up->otp
 toplevel_directions:
  next->a node @code{in code}
  prev->otp
  up->otp
3|a node @code{in code}
 associated_anchor_command: a node @code{in code}
 associated_node: a node @code{in code}
 section_directions:
  next->a::b	 c
  prev->a node
  up->otp
 toplevel_directions:
  next->a::b	 c
  prev->a node
  up->otp
 section_children:
  1|a ,, node @code{a,b,}
  2|(in paren(too  aaa
4|a ,, node @code{a,b,}
 associated_anchor_command: a @comma{}@comma{} node @code{a@comma{}b@comma{}}
 associated_node: a @comma{}@comma{} node @code{a@comma{}b@comma{}}
 section_directions:
  next->(in paren(too  aaa
  up->a node @code{in code}
5|(in paren(too  aaa
 associated_anchor_command: @asis{(}in paren(too  aaa
 associated_node: @asis{(}in paren(too  aaa
 section_directions:
  prev->a ,, node @code{a,b,}
  up->a node @code{in code}
 section_children:
  1|changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})
  2|@asis{}
6|changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})
 associated_anchor_command: changed @code{node} and (@samp{file})
 associated_node: changed @code{node} and (@samp{file})
 section_directions:
  next->@asis{}
  up->(in paren(too  aaa
7|@asis{}
 associated_anchor_command: @asis{} [+1+]
 associated_node: @asis{} [+1+]
 section_directions:
  prev->changed @ref{ @code{node}} and (@pxref{ ,, , @samp{file}})
  up->(in paren(too  aaa
8|a::b	 c
 associated_anchor_command: a@asis{::}b@asis{	} c
 associated_node: a@asis{::}b@asis{	} c
 section_directions:
  prev->a node @code{in code}
  up->otp
 toplevel_directions:
  prev->a node @code{in code}
  up->otp
 section_children:
  1|a node
9|a node
 associated_anchor_command: a node [+2+]
 associated_node: a node [+2+]
 section_directions:
  up->a::b	 c
';

$result_sectioning_root{'various_added_nodes_and_refs'} = 'level: -1
list:
 1|otp
';

$result_headings_list{'various_added_nodes_and_refs'} = '';

1;
