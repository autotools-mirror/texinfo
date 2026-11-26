use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'indices'} = '*document_root C5
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@set C1
   |misc_args:A{txiindexbackslashignore|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:txiindexbackslashignore}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l5 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C22 l8 {Index}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Index}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l10
  |element_node:{chapter}
  |index_entry:I{cp,1}
  |index_ignore_chars:{\\}
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@" C1 l10
     *following_arg C1
      {normal_text:a}
    {normal_text: }
    *normal_command@" C1 l10
     *brace_container C1
      {normal_text:o}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l11
  |element_node:{chapter}
  |index_entry:I{cp,2}
  |index_ignore_chars:{\\}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:AA}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l12
  |element_node:{chapter}
  |index_entry:I{cp,3}
  |index_ignore_chars:{\\}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:aa}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l13
  |element_node:{chapter}
  |index_entry:I{cp,4}
  |index_ignore_chars:{\\}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:i}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l14
  |element_node:{chapter}
  |index_entry:I{cp,5}
  |index_ignore_chars:{\\}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Z}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l15
  |element_node:{chapter}
  |index_entry:I{cp,6}
  |index_ignore_chars:{\\}
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@^ C1 l15
     *following_arg C1
      {normal_text:i}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l17
  |element_node:{chapter}
  |index_entry:I{cp,7}
  |index_ignore_chars:{\\}
   *line_arg C10
    {spaces_before_argument: }
    *normal_command@math C1 l17
     *brace_arg C3
      {normal_text:a!"}
      *normal_command@@
      {normal_text:b}
    {normal_text: "!}
    *normal_command@@
    {normal_text: }
    *normal_command@" C1 l17
     *following_arg C1
      {normal_text:a}
    {normal_text: }
    *normal_command@" C1 l17
     *brace_container C1
      {normal_text:o}
    {spaces_after_argument: }
    *normal_command@subentry C1 l17
    |sortas:{a!"@b}
     *line_arg C14
      {spaces_before_argument: }
      *normal_command@sortas C1 l17
       *brace_arg C3
        {normal_text:a!"}
        *normal_command@@
        {normal_text:b}
      {spaces_after_close_brace: }
      {normal_text:sub}
      *normal_command@math C1 l17
       *brace_arg C3
        {normal_text:a!"}
        *normal_command@@
        {normal_text:b}
      {normal_text: sub "!}
      *normal_command@@
      {normal_text: }
      *normal_command@" C1 l17
       *following_arg C1
        {normal_text:a}
      {normal_text: }
      *normal_command@" C1 l17
       *brace_container C1
        {normal_text:o}
      {spaces_at_end: }
      *normal_command@seealso C1 l17
       *brace_arg C7
        *normal_command@math C1 l17
         *brace_arg C3
          {normal_text:a!"}
          *normal_command@@
          {normal_text:b}
        {normal_text: "!}
        *normal_command@@
        {normal_text: }
        *normal_command@" C1 l17
         *following_arg C1
          {normal_text:a}
        {normal_text: }
        *normal_command@" C1 l17
         *brace_container C1
          {normal_text:o}
      {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l18
  |element_node:{chapter}
  |index_entry:I{cp,8}
  |index_ignore_chars:{\\}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:\\cmd}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l19
  |element_node:{chapter}
  |index_entry:I{cp,9}
  |index_ignore_chars:{\\}
  |sortas:{\\cmd}
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:totocmd}
    {spaces_at_end: }
    *normal_command@sortas C1 l19
     *brace_arg C1
      {normal_text:\\cmd}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@clear C1
  |misc_args:A{txiindexbackslashignore}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:txiindexbackslashignore}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l23
  |element_node:{chapter}
  |index_entry:I{cp,10}
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:\\some\\command for }
    *normal_command@file C1 l23
     *brace_container C1
      {normal_text:file}
    {spaces_after_argument: }
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@findex C1 l25
  |element_node:{chapter}
  |index_entry:I{fn,1}
   *line_arg C6
    {spaces_before_argument: }
    {normal_text:the }
    *normal_command@r C1 l25
     *brace_container C1
      {normal_text:person}
    {normal_text: index }
    *normal_command@file C1 l25
     *brace_container C1
      {normal_text:aa}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l27
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l29
  |global_command_number:{2}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
';


$result_texis{'indices'} = '
@set txiindexbackslashignore

@node Top
@top top section

@node chapter
@chapter Index

@cindex @"a @"{o}
@cindex AA
@cindex aa
@cindex i
@cindex Z
@cindex @^i

@cindex @math{a!"@@b} "!@@ @"a @"{o} @subentry @sortas{a!"@@b} sub@math{a!"@@b} sub "!@@ @"a @"{o} @seealso{@math{a!"@@b} "!@@ @"a @"{o}}
@cindex \\cmd
@cindex totocmd @sortas{\\cmd}

@clear txiindexbackslashignore

@cindex \\some\\command for @file{file} @c comment

@findex the @r{person} index @file{aa}

@printindex cp

@printindex fn
';


$result_texts{'indices'} = '
top section
***********

1 Index
*******







';

$result_errors{'indices'} = '* E l23|misplaced {
 misplaced {

* E l23|misplaced }
 misplaced }

';

$result_nodes_list{'indices'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Index
 associated_title_command: 1 Index
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'indices'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Index
 section_children:
  1|Index
2|Index
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'indices'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'indices'} = '';

$result_indices_sort_strings{'indices'} = 'cp:
 \\cmd
 \\some\\command for file
 ä ö
 a!"@b "!@ ä ö, a!"@b
 aa
 AA
 cmd
 i
 î
 Z
fn:
 the person index aa
';


$result_converted{'latex_text'}->{'indices'} = '
\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Index}}
\\label{anchor:chapter}%

\\index[cp]{ä ö@"\\""{a} "\\""{o}}%
\\index[cp]{AA@AA}%
\\index[cp]{aa@aa}%
\\index[cp]{i@i}%
\\index[cp]{Z@Z}%
\\index[cp]{î@\\^{i}}%

\\index[cp]{a"!"""@b """!"@ ä ö@$a"!"""@b$ """!"@ "\\""{a} "\\""{o}!a"!"""@b@sub$a"!"""@b$ sub """!"@ "\\""{a} "\\""{o}|seealso{$a!"@b$ "!@ \\"{a} \\"{o}}}%
\\index[cp]{cmd@\\textbackslash{}cmd}%
\\index[cp]{\\textbackslash{}cmd@totocmd}%


\\index[cp]{\\textbackslash{}some\\textbackslash{}command for file@\\textbackslash{}some\\textbackslash{}command for \\texttt{file}}%

\\index[fn]{the person index aa@\\texttt{the \\textnormal{person}\\ index \\texttt{aa}}}%

\\printindex[cp]

\\printindex[fn]
';

1;
