use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'at_commands_glued_in_paragraph'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *paragraph C35
   {normal_text:at}
   *@@
   {normal_text:.\\n}
   {normal_text:TeX}
   *@TeX C1 l2
    *brace_container
   {normal_text:TeX.\\n}
   {normal_text:code}
   *@code C1 l3
    *brace_container C1
     {normal_text:in code}
   {normal_text:code.\\n}
   {normal_text:acronym}
   *@acronym C2 l4
    *brace_arg C1
     {normal_text:ABC}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:aaa bb cc}
   {normal_text:acronym.\\n}
   {normal_text:acronym2}
   *@acronym C1 l5
    *brace_arg C1
     {normal_text:ABC}
   {normal_text:acronym.\\n}
   {normal_text:email}
   *@email C2 l6
    *brace_arg C1
     {normal_text:somebody}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:mali}
   {normal_text:email.\\n}
   {normal_text:ref}
   *@ref C1 l7
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Top}
     {normal_text:Top}
   {normal_text:ref.\\n}
   {normal_text:Foornote}
   *@footnote C1 l8
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {normal_text:in footnote}
   {normal_text:after footnote.\\n}
   {normal_text:accent}
   *@^ C1 l9
    *brace_container C1
     *@dotless C1 l9
      *brace_container C1
       {normal_text:i}
   {normal_text:accent.\\n}
   {normal_text:and star}
   *@*
   {normal_text:star.\\n}
   {normal_text:noindent}
   *@noindent l11
   {ignorable_spaces_after_command: }
   {normal_text:after noindent\\n}
   {normal_text:sp}
  *@sp C1 l12
  |EXTRA
  |misc_args:A{4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:4}
    {spaces_after_argument:\\n}
  *paragraph C5
   {normal_text:anchor}
   *@anchor C1 l13
   |EXTRA
   |identifier:{anchor}
   |is_target:{1}
    *brace_arg C1
     {normal_text:anchor}
   {normal_text:anchor\\n}
   {normal_text:index}
   *index_entry_command@cindex C1 l14
   |EXTRA
   |index_entry:I{cp,1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:index}
     {spaces_after_argument:\\n}
';


$result_texis{'at_commands_glued_in_paragraph'} = 'at@@.
TeX@TeX{}TeX.
code@code{in code}code.
acronym@acronym{ABC, aaa bb cc}acronym.
acronym2@acronym{ABC}acronym.
email@email{somebody, mali}email.
ref@ref{Top}ref.
Foornote@footnote{in footnote}after footnote.
accent@^{@dotless{i}}accent.
and star@*star.
noindent@noindent after noindent
sp@sp 4
anchor@anchor{anchor}anchor
index@cindex index
';


$result_texts{'at_commands_glued_in_paragraph'} = 'at@.
TeXTeXTeX.
codein codecode.
acronymABC (aaa bb cc)acronym.
acronym2ABCacronym.
emailmaliemail.
refTopref.
Foornoteafter footnote.
accenti^accent.
and star
star.
noindentafter noindent
sp



anchoranchor
index';

$result_errors{'at_commands_glued_in_paragraph'} = '* W l11|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph

* W l12|@sp should only appear at the beginning of a line
 warning: @sp should only appear at the beginning of a line

* W l14|@cindex should only appear at the beginning of a line
 warning: @cindex should only appear at the beginning of a line

* W l14|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* E l7|@ref reference to nonexistent node `Top\'
 @ref reference to nonexistent node `Top\'

';

$result_nodes_list{'at_commands_glued_in_paragraph'} = '';

$result_sections_list{'at_commands_glued_in_paragraph'} = '';

$result_sectioning_root{'at_commands_glued_in_paragraph'} = '';

$result_headings_list{'at_commands_glued_in_paragraph'} = '';

$result_indices_sort_strings{'at_commands_glued_in_paragraph'} = 'cp:
 index
';


$result_converted{'plaintext'}->{'at_commands_glued_in_paragraph'} = 'at@.  TeXTeXTeX. code‘in code’code.  acronymABC (aaa bb cc)acronym.
acronym2ABCacronym.  emailmali <somebody>email.  refTopref.
Foornote(1)after footnote.  accentîaccent.  and star
star.  noindentafter noindent sp




   anchoranchor index

   ---------- Footnotes ----------

   (1) in footnote

';

$result_converted_sort_strings{'plaintext'}->{'at_commands_glued_in_paragraph'} = 'cp:
 index
';

1;
