use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inline_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C9
    {normal_text:A }
    *normal_command@inlineraw C2 l2
    |expand_index:{1}
    |format:{plaintext}
     *brace_arg C1
      {normal_text:plaintext}
     *brace_arg C6
      {spaces_before_argument: }
      {normal_text:plaintext \\n}
      {empty_line:\\n}
      {normal_text:`` }
      *normal_command@lbracechar C1 l4
       *brace_container
      {normal_text: }
    {normal_text: a.\\n}
    *normal_command@inlinefmt C2 l5
    |expand_index:{1}
    |format:{plaintext}
     *brace_arg C1
      {normal_text:plaintext}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:`` }
    {normal_text:.\\n}
    {empty_line:\\n}
    {normal_text:  Now html\\n}
    *normal_command@inlineraw C2 l8
    |expand_index:{1}
    |format:{html}
     *brace_arg C1
      {normal_text:html}
     *brace_arg C5
      {spaces_before_argument: \\n}
      {spaces_before_argument:\\n}
      {normal_text:in <i>}
      *normal_command@acronym C1 l10
       *brace_arg C1
        {normal_text:HTML}
      {normal_text:</i>}
    {normal_text:.\\n}
   *normal_command@end C1 l11
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'inline_in_example'} = '@example
A @inlineraw{plaintext, plaintext 

`` @lbracechar{} } a.
@inlinefmt{plaintext, `` }.

  Now html
@inlineraw{html, 

in <i>@acronym{HTML}</i>}.
@end example
';


$result_texts{'inline_in_example'} = 'A plaintext 

`` {  a.
`` .

  Now html
in <i>HTML</i>.
';

$result_errors{'inline_in_example'} = '';

$result_nodes_list{'inline_in_example'} = '';

$result_sections_list{'inline_in_example'} = '';

$result_sectioning_root{'inline_in_example'} = '';

$result_headings_list{'inline_in_example'} = '';


$result_converted{'plaintext'}->{'inline_in_example'} = '     A plaintext

     `` {  a.
     `` .

       Now html
     .
';


$result_converted{'xml'}->{'inline_in_example'} = '<example endspaces=" ">
<pre xml:space="preserve">A <inlineraw><inlinerawformat>plaintext</inlinerawformat><inlinerawcontent> plaintext 

`` &lbracechar; </inlinerawcontent></inlineraw> a.
<inlinefmt><inlinefmtformat>plaintext</inlinefmtformat><inlinefmtcontent> `` </inlinefmtcontent></inlinefmt>.

  Now html
<inlineraw><inlinerawformat>html</inlinerawformat><inlinerawcontent> 

in &lt;i&gt;<acronym><acronymword>HTML</acronymword></acronym>&lt;/i&gt;</inlinerawcontent></inlineraw>.
</pre></example>
';

1;
