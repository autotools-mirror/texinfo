use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inlinefmtspaces'} = '*document_root C1
 *before_node_section C1
  *paragraph C5
   {A }
   *@inlinefmt C2 l1
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
   |EXTRA
   |expand_index:{1}
   |format:{plaintext}
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {plaintext}
    *brace_arg C3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {plaintext `` }
     *@lbracechar C1 l1
      *brace_container
     { }
   { a.  Now html\\n}
   *@inlinefmt C2 l2
   |EXTRA
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {html}
    *brace_arg C3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {in <i>}
     *@acronym C1 l2
      *brace_arg C1
       {HTML}
     {</i>}
   {.\\n}
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


$result_converted{'xml'}->{'inlinefmtspaces'} = '<para>A <inlinefmt spacesaftercmd=" "><inlinefmtformat spaces=" ">plaintext </inlinefmtformat><inlinefmtcontent spaces=" ">plaintext &textldquo; &lbracechar; </inlinefmtcontent></inlinefmt> a.  Now html
<inlinefmt><inlinefmtformat spaces=" ">html </inlinefmtformat><inlinefmtcontent spaces=" ">in &lt;i&gt;<acronym><acronymword>HTML</acronymword></acronym>&lt;/i&gt;</inlinefmtcontent></inlinefmt>.
</para>';


$result_converted{'docbook'}->{'inlinefmtspaces'} = '<para>A  a.  Now html
.
</para>';


$result_converted{'latex_text'}->{'inlinefmtspaces'} = 'A  a.  Now html
.
';

1;
