use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inlinefmtspaces'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C5
   {normal_text:A }
   *normal_command@inlinefmt C3 l1
   |expand_index:{1}
   |format:{plaintext}
    {spaces_after_cmd_before_arg: }
    *brace_arg C3
     {spaces_before_argument: }
     {normal_text:plaintext}
     {spaces_after_argument: }
    *brace_arg C4
     {spaces_before_argument: }
     {normal_text:plaintext `` }
     *normal_command@lbracechar C1 l1
      *brace_container
     {normal_text: }
   {normal_text: a.  Now html\\n}
   *normal_command@inlinefmt C2 l2
   |expand_index:{1}
   |format:{html}
    *brace_arg C3
     {spaces_before_argument: }
     {normal_text:html}
     {spaces_after_argument: }
    *brace_arg C4
     {spaces_before_argument: }
     {normal_text:in <i>}
     *normal_command@acronym C1 l2
      *brace_arg C1
       {normal_text:HTML}
     {normal_text:</i>}
   {normal_text:.\\n}
';


$result_texis{'inlinefmtspaces'} = 'A @inlinefmt { plaintext , plaintext `` @lbracechar{} } a.  Now html
@inlinefmt{ html , in <i>@acronym{HTML}</i>}.
';


$result_texts{'inlinefmtspaces'} = 'A plaintext " {  a.  Now html
in <i>HTML</i>.
';

$result_errors{'inlinefmtspaces'} = '';

$result_nodes_list{'inlinefmtspaces'} = '';

$result_sections_list{'inlinefmtspaces'} = '';

$result_sectioning_root{'inlinefmtspaces'} = '';

$result_headings_list{'inlinefmtspaces'} = '';


$result_converted{'plaintext'}->{'inlinefmtspaces'} = 'A plaintext " { a.  Now html .
';


$result_converted{'html_text'}->{'inlinefmtspaces'} = '<p>A  a.  Now html
in &lt;i&gt;<abbr class="acronym">HTML</abbr>&lt;/i&gt;.
</p>';


$result_converted{'xml'}->{'inlinefmtspaces'} = '<para>A <inlinefmt><inlinefmtformat> </inlinefmtformat><inlinefmtcontent> plaintext </inlinefmtcontent></inlinefmt> a.  Now html
<inlinefmt><inlinefmtformat> html </inlinefmtformat><inlinefmtcontent> in &lt;i&gt;<acronym><acronymword>HTML</acronymword></acronym>&lt;/i&gt;</inlinefmtcontent></inlinefmt>.
</para>';


$result_converted{'docbook'}->{'inlinefmtspaces'} = '<para>A  a.  Now html
.
</para>';


$result_converted{'latex_text'}->{'inlinefmtspaces'} = '\\begin{document}
A  a.  Now html
.
';

1;
