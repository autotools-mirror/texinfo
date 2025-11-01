use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'brace_in_index'} = '*document_root C1
 *before_node_section C14
  *preamble_before_content
  *paragraph C2
   *@{
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@math C1 l3
    *brace_command_context C1
     *@{
   {\\n}
  {empty_line:\\n}
  *@displaymath C4 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@{
   {\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {displaymath}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@{
  {empty_line:\\n}
  *index_entry_command@cindex C1 l11
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |index_entry:I{cp,2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@math C1 l11
     *brace_command_context C1
      *@{
  {empty_line:\\n}
  *index_entry_command@cindex C1 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |index_entry:I{cp,3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@samp C1 l13
     *brace_container C1
      *@{
  {empty_line:\\n}
  *@defun C3 l15
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l15
   |EXTRA
   |def_command:{defun}
   |def_index_element:
    |* C1
     |*def_line_arg C3
      |{A}
      |*@{
      |{A}
   |index_entry:I{fn,1}
   |original_def_cmdname:{defun}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Function}
     (i){spaces: }
     *def_name C1
      *def_line_arg C3
       {A}
       *@{
       {A}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {BBB}
     {delimiter:)}
   *def_item C1
    *paragraph C1
     {CCC\\n}
   *@end C1 l17
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defun}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defun}
';


$result_texis{'brace_in_index'} = '@{

@math{@{}

@displaymath
@{
@end displaymath

@cindex @{

@cindex @math{@{}

@cindex @samp{@{}

@defun A@{A (BBB)
CCC
@end defun
';


$result_texts{'brace_in_index'} = '{

{

{




Function: A{A (BBB)
CCC
';

$result_errors{'brace_in_index'} = '* W l9|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W l11|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W l13|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W l15|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'brace_in_index'} = '';

$result_sections_list{'brace_in_index'} = '';

$result_sectioning_root{'brace_in_index'} = '';

$result_headings_list{'brace_in_index'} = '';

$result_indices_sort_strings{'brace_in_index'} = 'cp:
 {
 {
 {
fn:
 A{A
';


$result_converted{'latex_text'}->{'brace_in_index'} = '\\begin{document}
\\{

$\\{$

\\[
\\{
\\]

\\index[cp]{@\\textbraceleft{}}%

\\index[cp]{@$\\lbrace{}$}%

\\index[cp]{@`\\texttt{\\textbraceleft{}}\'}%


\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{A\\{A \\EmbracOn{}\\textnormal{\\textsl{(BBB)}}\\EmbracOff{}}& [Function]
\\end{tabularx}

\\index[fn]{AA@\\texttt{A\\textbraceleft{}A}}%
\\begin{quote}
\\unskip{\\parskip=0pt\\noindent}%
CCC
\\end{quote}
';

1;
