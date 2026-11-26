use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inlinerawspaces'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C5
   {normal_text:A }
   *normal_command@inlineraw C2 l1
   |expand_index:{1}
   |format:{plaintext}
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
   *normal_command@inlineraw C3 l2
   |expand_index:{1}
   |format:{html}
    {spaces_after_cmd_before_arg: }
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


$result_texis{'inlinerawspaces'} = 'A @inlineraw{ plaintext , plaintext `` @lbracechar{} } a.  Now html
@inlineraw { html , in <i>@acronym{HTML}</i>}.
';


$result_texts{'inlinerawspaces'} = 'A plaintext `` {  a.  Now html
in <i>HTML</i>.
';

$result_errors{'inlinerawspaces'} = '';

$result_nodes_list{'inlinerawspaces'} = '';

$result_sections_list{'inlinerawspaces'} = '';

$result_sectioning_root{'inlinerawspaces'} = '';

$result_headings_list{'inlinerawspaces'} = '';


$result_converted{'plaintext'}->{'inlinerawspaces'} = 'A plaintext `` { a.  Now html .
';


$result_converted{'html_text'}->{'inlinerawspaces'} = '<p>A  a.  Now html
in <i><abbr class="acronym">HTML</abbr></i>.
</p>';


$result_converted{'xml'}->{'inlinerawspaces'} = '<para>A <inlineraw><inlinerawformat> plaintext </inlinerawformat><inlinerawcontent> plaintext &textldquo; &lbracechar; </inlinerawcontent></inlineraw> a.  Now html
<inlineraw><inlinerawformat> </inlinerawformat><inlinerawcontent> html </inlinerawcontent></inlineraw>.
</para>';


$result_converted{'docbook'}->{'inlinerawspaces'} = '<para>A  a.  Now html
.
</para>';


$result_converted{'latex_text'}->{'inlinerawspaces'} = '\\begin{document}
A  a.  Now html
.
';

1;
