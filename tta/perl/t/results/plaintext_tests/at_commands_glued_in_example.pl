use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'at_commands_glued_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C41
    {normal_text:at}
    *normal_command@@
    {normal_text:.\\n}
    {normal_text:TeX}
    *normal_command@TeX C1 l3
     *brace_container
    {normal_text:TeX.\\n}
    {normal_text:code}
    *normal_command@code C1 l4
     *brace_container C1
      {normal_text:in code}
    {normal_text:code.\\n}
    {normal_text:acronym}
    *normal_command@acronym C2 l5
     *brace_arg C1
      {normal_text:ABC}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:aaa bb cc}
    {normal_text:acronym.\\n}
    {normal_text:acronym2}
    *normal_command@acronym C1 l6
     *brace_arg C1
      {normal_text:ABC}
    {normal_text:acronym.\\n}
    {normal_text:email}
    *normal_command@email C2 l7
     *brace_arg C1
      {normal_text:somebody}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:mali}
    {normal_text:email.\\n}
    {normal_text:ref}
    *normal_command@ref C1 l8
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{Top}
      {normal_text:Top}
    {normal_text:ref.\\n}
    {normal_text:Foornote}
    *normal_command@footnote C1 l9
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {normal_text:in footnote}
    {normal_text:after footnote.\\n}
    {normal_text:accent}
    *normal_command@^ C1 l10
     *brace_container C1
      *normal_command@dotless C1 l10
       *brace_container C1
        {normal_text:i}
    {normal_text:accent.\\n}
    {normal_text:and star}
    *normal_command@*
    {normal_text:star.\\n}
    {normal_text:noindent}
    *normal_command@noindent l12
    {ignorable_spaces_after_command: }
    {normal_text:after noindent\\n}
    {normal_text:sp}
    *normal_command@sp C1 l13
    |EXTRA
    |misc_args:A{4}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:4}
      {spaces_after_argument:\\n}
    {normal_text:anchor}
    *normal_command@anchor C1 l14
    |EXTRA
    |identifier:{anchor}
    |is_target:{1}
     *brace_arg C1
      {normal_text:anchor}
    {normal_text:anchor\\n}
    {normal_text:index}
    *index_entry_command@cindex C1 l15
    |EXTRA
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:index}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l16
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'at_commands_glued_in_example'} = '@example
at@@.
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
@end example
';


$result_texts{'at_commands_glued_in_example'} = 'at@.
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

$result_errors{'at_commands_glued_in_example'} = '* W l13|@sp should only appear at the beginning of a line
 warning: @sp should only appear at the beginning of a line

* W l15|@cindex should only appear at the beginning of a line
 warning: @cindex should only appear at the beginning of a line

* W l15|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* E l8|@ref reference to nonexistent node `Top\'
 @ref reference to nonexistent node `Top\'

';

$result_nodes_list{'at_commands_glued_in_example'} = '';

$result_sections_list{'at_commands_glued_in_example'} = '';

$result_sectioning_root{'at_commands_glued_in_example'} = '';

$result_headings_list{'at_commands_glued_in_example'} = '';

$result_indices_sort_strings{'at_commands_glued_in_example'} = 'cp:
 index
';


$result_converted{'plaintext'}->{'at_commands_glued_in_example'} = '     at@.
     TeXTeXTeX.
     codein codecode.
     acronymABC (aaa bb cc)acronym.
     acronym2ABCacronym.
     emailmali <somebody>email.
     refTopref.
     Foornote(1)after footnote.
     accentîaccent.
     and star
     star.
     noindentafter noindent
     sp



     anchoranchor
     index

   ---------- Footnotes ----------

   (1) in footnote

';

$result_converted_sort_strings{'plaintext'}->{'at_commands_glued_in_example'} = 'cp:
 index
';

1;
