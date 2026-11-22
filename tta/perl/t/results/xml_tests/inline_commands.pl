use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inline_commands'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content
  *paragraph C4
   *@inlineraw C2 l1
   |EXTRA
   |expand_index:{1}
   |format:{xml}
    *brace_arg C1
     {normal_text:xml}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:<sc>xml inlineraw</sc>}
   {normal_text:\\n}
   *@inlineraw C2 l2
   |EXTRA
   |format:{html}
    *brace_arg C1
     {normal_text:html}
    *elided_brace_command_arg C1
     {raw: <code>html</code>}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@inlinefmt C2 l4
   |EXTRA
   |expand_index:{1}
   |format:{xml}
    *brace_arg C1
     {normal_text:xml}
    *brace_arg C3
     {spaces_before_argument: }
     *@env C1 l4
      *brace_container C1
       {normal_text:inlinefmt}
     {normal_text:, xml}
   {normal_text:\\n}
   *@inlinefmt C2 l5
   |EXTRA
   |format:{html}
    *brace_arg C1
     {normal_text:html}
    *elided_brace_command_arg C1
     {raw: @env{inlinefmt}, html}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@inlinefmtifelse C3 l7
   |EXTRA
   |expand_index:{1}
   |format:{xml}
    *brace_arg C1
     {normal_text:xml}
    *brace_arg C3
     {spaces_before_argument: }
     {normal_text:xml }
     *@code C1 l7
      *brace_container C1
       {normal_text:inlinefmtifelse}
    *elided_brace_command_arg C1
     {raw: else xml}
   {normal_text:\\n}
   *@inlinefmtifelse C3 l8
   |EXTRA
   |expand_index:{2}
   |format:{html}
    *brace_arg C1
     {normal_text:html}
    *elided_brace_command_arg C1
     {raw: html @var{inlinefmtifelse}}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:else html}
   {normal_text:\\n}
';


$result_texis{'inline_commands'} = '@inlineraw{xml, <sc>xml inlineraw</sc>}
@inlineraw{html, <code>html</code>}

@inlinefmt{xml, @env{inlinefmt}, xml}
@inlinefmt{html, @env{inlinefmt}, html}

@inlinefmtifelse{xml, xml @code{inlinefmtifelse}, else xml}
@inlinefmtifelse{html, html @var{inlinefmtifelse}, else html}
';


$result_texts{'inline_commands'} = '<sc>xml inlineraw</sc>


inlinefmt, xml


xml inlinefmtifelse
else html
';

$result_errors{'inline_commands'} = '';

$result_nodes_list{'inline_commands'} = '';

$result_sections_list{'inline_commands'} = '';

$result_sectioning_root{'inline_commands'} = '';

$result_headings_list{'inline_commands'} = '';


$result_converted{'xml'}->{'inline_commands'} = '<para> <sc>xml inlineraw</sc>
<inlineraw><inlinerawformat>html</inlinerawformat><inlinerawcontent> &lt;code&gt;html&lt;/code&gt;</inlinerawcontent></inlineraw>
</para>
<para> <env>inlinefmt</env>, xml
<inlinefmt><inlinefmtformat>html</inlinefmtformat><inlinefmtcontent> @env{inlinefmt}, html</inlinefmtcontent></inlinefmt>
</para>
<para> xml <code>inlinefmtifelse</code>
<inlinefmtifelse><inlinefmtifelseformat>html</inlinefmtifelseformat><inlinefmtifelsecontentif> html @var{inlinefmtifelse}</inlinefmtifelsecontentif><inlinefmtifelsecontentelse> else html</inlinefmtifelsecontentelse></inlinefmtifelse>
</para>';

1;
