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
   {at}
   *@@
   {.\\n}
   {TeX}
   *@TeX C1 l2
    *brace_container
   {TeX.\\n}
   {code}
   *@code C1 l3
    *brace_container C1
     {in code}
   {code.\\n}
   {acronym}
   *@acronym C2 l4
    *brace_arg C1
     {ABC}
    *brace_arg C2
     {spaces_before_argument: }
     {aaa bb cc}
   {acronym.\\n}
   {acronym2}
   *@acronym C1 l5
    *brace_arg C1
     {ABC}
   {acronym.\\n}
   {email}
   *@email C2 l6
    *brace_arg C1
     {somebody}
    *brace_arg C2
     {spaces_before_argument: }
     {mali}
   {email.\\n}
   {ref}
   *@ref C1 l7
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Top}
     {Top}
   {ref.\\n}
   {Foornote}
   *@footnote C1 l8
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {in footnote}
   {after footnote.\\n}
   {accent}
   *@^ C1 l9
    *brace_container C1
     *@dotless C1 l9
      *brace_container C1
       {i}
   {accent.\\n}
   {and star}
   *@*
   {star.\\n}
   {noindent}
   *@noindent l11
   {ignorable_spaces_after_command: }
   {after noindent\\n}
   {sp}
  *@sp C1 l12
  |EXTRA
  |misc_args:A{4}
   *line_arg C3
    {spaces_before_argument: }
    {4}
    {spaces_after_argument:\\n}
  *paragraph C5
   {anchor}
   *@anchor C1 l13
   |EXTRA
   |identifier:{anchor}
   |is_target:{1}
    *brace_arg C1
     {anchor}
   {anchor\\n}
   {index}
   *index_entry_command@cindex C1 l14
   |EXTRA
   |index_entry:I{cp,1}
    *line_arg C3
     {spaces_before_argument: }
     {index}
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
