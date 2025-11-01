use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inlinefmtifelse'} = '*document_root C1
 *before_node_section C15
  *paragraph C4
   *@inlinefmtifelse C3 l1
   |EXTRA
   |expand_index:{2}
   |format:{html}
    *brace_arg C1
     {html}
    *elided_brace_command_arg C1
     {raw:}
    *brace_arg C1
     {else html no if}
   {.\\n}
   *@inlinefmtifelse C3 l2
   |EXTRA
   |expand_index:{2}
   |format:{html}
    *brace_arg C1
     {html}
    *elided_brace_command_arg C1
     {raw:if html}
    *brace_arg C1
     {else html}
   {.\\n}
  {empty_line:\\n}
  *paragraph C4
   *@inlinefmtifelse C2 l4
   |EXTRA
   |expand_index:{2}
   |format:{plaintext}
    *brace_arg C1
     {plaintext}
    *elided_brace_command_arg C1
     {raw:if plaintext no second arg}
   {.\\n}
   *@inlinefmtifelse C3 l5
   |EXTRA
   |expand_index:{2}
   |format:{plaintext}
    *brace_arg C1
     {plaintext}
    *elided_brace_command_arg C1
     {raw:if plaintext}
    *brace_arg C1
     {else plaintext}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmtifelse C3 l7
   |EXTRA
   |expand_index:{2}
   |format:{xml}
    *brace_arg C1
     {xml}
    *elided_brace_command_arg C1
     {raw:if xml empty second arg}
    *brace_arg
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmtifelse C3 l9
   |EXTRA
   |expand_index:{2}
   |format:{docbook}
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {docbook}
    *elided_brace_command_arg C1
     {raw: if docbook spaces }
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {else docbook spaces }
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmtifelse C3 l11
   |EXTRA
   |expand_index:{2}
   |format:{tex}
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {tex}
    *elided_brace_command_arg C1
     {raw: if tex spaces }
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {else tex spaces }
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmtifelse C3 l13
   |EXTRA
   |expand_index:{2}
   |format:{docbook}
    *brace_arg C1
     {docbook}
    *elided_brace_command_arg C1
     {raw:if docbook}
    *brace_arg C1
     {else docbook}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmtifelse C3 l15
   |EXTRA
   |expand_index:{2}
   |format:{tex}
    *brace_arg C1
     {tex}
    *elided_brace_command_arg C1
     {raw:if tex}
    *brace_arg C1
     {else tex}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmtifelse C3 l17
   |EXTRA
   |expand_index:{2}
   |format:{latex}
    *brace_arg C1
     {latex}
    *elided_brace_command_arg C1
     {raw:if latex}
    *brace_arg C1
     {else latex}
   {.\\n}
';


$result_texis{'inlinefmtifelse'} = '@inlinefmtifelse{html,,else html no if}.
@inlinefmtifelse{html,if html,else html}.

@inlinefmtifelse{plaintext,if plaintext no second arg}.
@inlinefmtifelse{plaintext,if plaintext,else plaintext}.

@inlinefmtifelse{xml,if xml empty second arg,}.

@inlinefmtifelse{ docbook , if docbook spaces , else docbook spaces }.

@inlinefmtifelse{ tex , if tex spaces , else tex spaces }.

@inlinefmtifelse{docbook,if docbook,else docbook}.

@inlinefmtifelse{tex,if tex,else tex}.

@inlinefmtifelse{latex,if latex,else latex}.
';


$result_texts{'inlinefmtifelse'} = 'else html no if.
else html.

.
else plaintext.

.

else docbook spaces .

else tex spaces .

else docbook.

else tex.

else latex.
';

$result_errors{'inlinefmtifelse'} = '';

$result_nodes_list{'inlinefmtifelse'} = '';

$result_sections_list{'inlinefmtifelse'} = '';

$result_sectioning_root{'inlinefmtifelse'} = '';

$result_headings_list{'inlinefmtifelse'} = '';


$result_converted{'plaintext'}->{'inlinefmtifelse'} = 'else html no if.  else html.

   if plaintext no second arg.  if plaintext.

   .

   else docbook spaces .

   else tex spaces .

   else docbook.

   else tex.

   else latex.
';


$result_converted{'html_text'}->{'inlinefmtifelse'} = '<p>.
if html.
</p>
<p>.
else plaintext.
</p>
<p>.
</p>
<p>else docbook spaces .
</p>
<p>else tex spaces .
</p>
<p>else docbook.
</p>
<p>else tex.
</p>
<p>else latex.
</p>';


$result_converted{'xml'}->{'inlinefmtifelse'} = '<para><inlinefmtifelse><inlinefmtifelseformat>html</inlinefmtifelseformat><inlinefmtifelsecontentelse>else html no if</inlinefmtifelsecontentelse></inlinefmtifelse>.
<inlinefmtifelse><inlinefmtifelseformat>html</inlinefmtifelseformat><inlinefmtifelsecontentif>if html</inlinefmtifelsecontentif><inlinefmtifelsecontentelse>else html</inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>
<para><inlinefmtifelse><inlinefmtifelseformat>plaintext</inlinefmtifelseformat><inlinefmtifelsecontentif>if plaintext no second arg</inlinefmtifelsecontentif></inlinefmtifelse>.
<inlinefmtifelse><inlinefmtifelseformat>plaintext</inlinefmtifelseformat><inlinefmtifelsecontentif>if plaintext</inlinefmtifelsecontentif><inlinefmtifelsecontentelse>else plaintext</inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>
<para>if xml empty second arg.
</para>
<para><inlinefmtifelse><inlinefmtifelseformat spaces=" ">docbook </inlinefmtifelseformat><inlinefmtifelsecontentif> if docbook spaces </inlinefmtifelsecontentif><inlinefmtifelsecontentelse spaces=" ">else docbook spaces </inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>
<para><inlinefmtifelse><inlinefmtifelseformat spaces=" ">tex </inlinefmtifelseformat><inlinefmtifelsecontentif> if tex spaces </inlinefmtifelsecontentif><inlinefmtifelsecontentelse spaces=" ">else tex spaces </inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>
<para><inlinefmtifelse><inlinefmtifelseformat>docbook</inlinefmtifelseformat><inlinefmtifelsecontentif>if docbook</inlinefmtifelsecontentif><inlinefmtifelsecontentelse>else docbook</inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>
<para><inlinefmtifelse><inlinefmtifelseformat>tex</inlinefmtifelseformat><inlinefmtifelsecontentif>if tex</inlinefmtifelsecontentif><inlinefmtifelsecontentelse>else tex</inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>
<para><inlinefmtifelse><inlinefmtifelseformat>latex</inlinefmtifelseformat><inlinefmtifelsecontentif>if latex</inlinefmtifelsecontentif><inlinefmtifelsecontentelse>else latex</inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>';


$result_converted{'docbook'}->{'inlinefmtifelse'} = '<para>else html no if.
else html.
</para>
<para>.
else plaintext.
</para>
<para>.
</para>
<para> if docbook spaces .
</para>
<para>else tex spaces .
</para>
<para>if docbook.
</para>
<para>else tex.
</para>
<para>else latex.
</para>';


$result_converted{'latex_text'}->{'inlinefmtifelse'} = 'else html no if.
else html.

.
else plaintext.

.

else docbook spaces .

else tex spaces .

else docbook.

else tex.

if latex.
';

1;
