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
  *@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C41
    {at}
    *@@
    {.\\n}
    {TeX}
    *@TeX C1 l3
     *brace_container
    {TeX.\\n}
    {code}
    *@code C1 l4
     *brace_container C1
      {in code}
    {code.\\n}
    {acronym}
    *@acronym C2 l5
     *brace_arg C1
      {ABC}
     *brace_arg C2
      {spaces_before_argument: }
      {aaa bb cc}
    {acronym.\\n}
    {acronym2}
    *@acronym C1 l6
     *brace_arg C1
      {ABC}
    {acronym.\\n}
    {email}
    *@email C2 l7
     *brace_arg C1
      {somebody}
     *brace_arg C2
      {spaces_before_argument: }
      {mali}
    {email.\\n}
    {ref}
    *@ref C1 l8
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{Top}
      {Top}
    {ref.\\n}
    {Foornote}
    *@footnote C1 l9
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {in footnote}
    {after footnote.\\n}
    {accent}
    *@^ C1 l10
     *brace_container C1
      *@dotless C1 l10
       *brace_container C1
        {i}
    {accent.\\n}
    {and star}
    *@*
    {star.\\n}
    {noindent}
    *@noindent l12
    {ignorable_spaces_after_command: }
    {after noindent\\n}
    {sp}
    *@sp C1 l13
    |EXTRA
    |misc_args:A{4}
     *line_arg C3
      {spaces_before_argument: }
      {4}
      {spaces_after_argument:\\n}
    {anchor}
    *@anchor C1 l14
    |EXTRA
    |identifier:{anchor}
    |is_target:{1}
     *brace_arg C1
      {anchor}
    {anchor\\n}
    {index}
    *index_entry_command@cindex C1 l15
    |EXTRA
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {index}
      {spaces_after_argument:\\n}
   *@end C1 l16
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
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
