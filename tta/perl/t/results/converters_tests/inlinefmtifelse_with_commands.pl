use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'inlinefmtifelse_with_commands'} = '*document_root C1
 *before_node_section C11
  *paragraph C2
   *@inlinefmtifelse C3 l1
   |EXTRA
   |expand_index:{2}
   |format:{html}
    *brace_arg C1
     {html}
    *elided_brace_command_arg C1
     {raw:if @code{html}}
    *brace_arg C2
     {else }
     *@code C1 l1
      *brace_container C1
       {html}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmtifelse C3 l3
   |EXTRA
   |expand_index:{2}
   |format:{plaintext}
    *brace_arg C1
     {plaintext}
    *elided_brace_command_arg C1
     {raw:if @emph{plaintext}}
    *brace_arg C2
     {else }
     *@emph C1 l3
      *brace_container C1
       {plaintext}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmtifelse C3 l5
   |EXTRA
   |expand_index:{2}
   |format:{xml}
    *brace_arg C1
     {xml}
    *elided_brace_command_arg C1
     {raw:if xml @env{second} arg}
    *brace_arg C2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {xml }
     *@env C1 l5
      *brace_container C1
       {else}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmtifelse C3 l7
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
     {raw: if docbook @string{spaces} }
    *brace_arg C3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {else }
     *@strong C1 l7
      *brace_container C1
       {docbook spaces}
     { }
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmtifelse C3 l9
   |EXTRA
   |expand_index:{2}
   |format:{tex}
    *brace_arg C1
     {tex}
    *elided_brace_command_arg C1
     {raw:if @var{tex}}
    *brace_arg C2
     *@var C1 l9
      *brace_container C1
       {else}
     { tex}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlinefmtifelse C3 l11
   |EXTRA
   |expand_index:{2}
   |format:{latex}
    *brace_arg C1
     {latex}
    *elided_brace_command_arg C1
     {raw:if @sc{latex}}
    *brace_arg C2
     *@sc C1 l11
      *brace_container C1
       {else}
     { latex}
   {.\\n}
';


$result_texis{'inlinefmtifelse_with_commands'} = '@inlinefmtifelse{html,if @code{html},else @code{html}}.

@inlinefmtifelse{plaintext,if @emph{plaintext},else @emph{plaintext}}.

@inlinefmtifelse{xml,if xml @env{second} arg, xml @env{else}}.

@inlinefmtifelse{ docbook , if docbook @string{spaces} , else @strong{docbook spaces} }.

@inlinefmtifelse{tex,if @var{tex},@var{else} tex}.

@inlinefmtifelse{latex,if @sc{latex},@sc{else} latex}.
';


$result_texts{'inlinefmtifelse_with_commands'} = 'else html.

else plaintext.

xml else.

else docbook spaces .

else tex.

ELSE latex.
';

$result_errors{'inlinefmtifelse_with_commands'} = '';

$result_nodes_list{'inlinefmtifelse_with_commands'} = '';

$result_sections_list{'inlinefmtifelse_with_commands'} = '';

$result_sectioning_root{'inlinefmtifelse_with_commands'} = '';

$result_headings_list{'inlinefmtifelse_with_commands'} = '';


$result_converted{'plaintext'}->{'inlinefmtifelse_with_commands'} = 'else ‘html’.

   if @emph{plaintext}.

   xml ‘else’.

   else *docbook spaces* .

   ELSE tex.

   ELSE latex.
';


$result_converted{'html_text'}->{'inlinefmtifelse_with_commands'} = '<p>if @code{html}.
</p>
<p>else <em class="emph">plaintext</em>.
</p>
<p>xml <code class="env">else</code>.
</p>
<p>else <strong class="strong">docbook spaces</strong> .
</p>
<p><var class="var">else</var> tex.
</p>
<p><small class="sc">ELSE</small> latex.
</p>';


$result_converted{'xml'}->{'inlinefmtifelse_with_commands'} = '<para><inlinefmtifelse><inlinefmtifelseformat>html</inlinefmtifelseformat><inlinefmtifelsecontentif>if @code{html}</inlinefmtifelsecontentif><inlinefmtifelsecontentelse>else <code>html</code></inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>
<para><inlinefmtifelse><inlinefmtifelseformat>plaintext</inlinefmtifelseformat><inlinefmtifelsecontentif>if @emph{plaintext}</inlinefmtifelsecontentif><inlinefmtifelsecontentelse>else <emph>plaintext</emph></inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>
<para>if xml @env{second} arg.
</para>
<para><inlinefmtifelse><inlinefmtifelseformat spaces=" ">docbook </inlinefmtifelseformat><inlinefmtifelsecontentif> if docbook @string{spaces} </inlinefmtifelsecontentif><inlinefmtifelsecontentelse spaces=" ">else <strong>docbook spaces</strong> </inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>
<para><inlinefmtifelse><inlinefmtifelseformat>tex</inlinefmtifelseformat><inlinefmtifelsecontentif>if @var{tex}</inlinefmtifelsecontentif><inlinefmtifelsecontentelse><var>else</var> tex</inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>
<para><inlinefmtifelse><inlinefmtifelseformat>latex</inlinefmtifelseformat><inlinefmtifelsecontentif>if @sc{latex}</inlinefmtifelsecontentif><inlinefmtifelsecontentelse><sc>else</sc> latex</inlinefmtifelsecontentelse></inlinefmtifelse>.
</para>';


$result_converted{'docbook'}->{'inlinefmtifelse_with_commands'} = '<para>else <literal>html</literal>.
</para>
<para>else <emphasis>plaintext</emphasis>.
</para>
<para>xml <envar>else</envar>.
</para>
<para> if docbook @string{spaces} .
</para>
<para><replaceable>else</replaceable> tex.
</para>
<para>ELSE latex.
</para>';


$result_converted{'latex_text'}->{'inlinefmtifelse_with_commands'} = 'else \\texttt{html}.

else \\emph{plaintext}.

xml \\texttt{else}.

else \\textbf{docbook spaces} .

\\Texinfocommandstyletextvar{else} tex.

if @sc\\{latex\\}.
';

1;
