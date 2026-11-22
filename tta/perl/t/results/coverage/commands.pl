use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'commands'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content
  *paragraph C13
   *normal_command@@
   {normal_text: }
   *normal_command@TeX C1 l1
    *brace_container
   {normal_text: }
   *normal_command@\\n
   *normal_command@" C1 l2
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *normal_command@^ C1 l2
    *brace_container C1
     *normal_command@dotless C1 l2
      *brace_container C1
       {normal_text:i}
   {normal_text: }
   *normal_command@~ C1 l2
    *brace_container C1
     {normal_text:a}
   {normal_text: }
   *normal_command@ringaccent C2 l2
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {normal_text:a}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C10
   *normal_command@clicksequence C1 l4
    *brace_container C3
     {normal_text:File }
     *normal_command@click C1 l4
      *brace_container
     {normal_text: Open}
   *normal_command@.
   {normal_text:\\n}
   *normal_command@email C2 l5
    *brace_arg C1
     {normal_text:a}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:b}
   {normal_text: }
   *normal_command@code C1 l5
    *brace_container C1
     {normal_text:code --- -- \'\' ``}
   {normal_text:\\n}
   {normal_text:--- -- \'\' ``. }
   *normal_command@sc C1 l6
    *brace_container C1
     {normal_text:small caps}
   {normal_text:.\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l8
  |index_entry:I{cp,1}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:index entry ``in text\'\' }
    *normal_command@LaTeX C1 l8
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@majorheading C1 l10
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:majorheading }
    *normal_command@b C1 l10
     *brace_container C1
      {normal_text:in b}
    {spaces_after_argument:\\n}
';


$result_texis{'commands'} = '@@ @TeX{} @
@"e @^{@dotless{i}} @~{a} @ringaccent a

@clicksequence{File @click{} Open}@.
@email{a, b} @code{code --- -- \'\' ``}
--- -- \'\' ``. @sc{small caps}.

@cindex index entry ``in text\'\' @LaTeX{}

@majorheading majorheading @b{in b}
';


$result_texts{'commands'} = '@ TeX  e" i^ a~ a*

File -> Open.
b code --- -- \'\' ``
-- - " ". SMALL CAPS.


majorheading in b
*****************
';

$result_errors{'commands'} = '* W l8|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'commands'} = '';

$result_sections_list{'commands'} = '';

$result_sectioning_root{'commands'} = '';

$result_headings_list{'commands'} = '1|majorheading @b{in b}
';

$result_indices_sort_strings{'commands'} = 'cp:
 index entry "in text" LaTeX
';


$result_converted{'plaintext'}->{'commands'} = '@ TeX  ë î ã å

   File → Open.  b <a> ‘code --- -- \'\' ``’ -- - " ".  SMALL CAPS.

majorheading in b
*****************

';

$result_converted_sort_strings{'plaintext'}->{'commands'} = 'cp:
 index entry "in text" LaTeX
';


$result_converted{'html_text'}->{'commands'} = '<p>@ TeX &nbsp;&euml; &icirc; &atilde; &aring;
</p>
<p>File &rarr; Open.
<a class="email" href="mailto:a">b</a> <code class="code">code --- -- \'\' ``</code>
&mdash; &ndash; &rdquo; &ldquo;. <small class="sc">SMALL CAPS</small>.
</p>
<a class="index-entry-id" id="index-index-entry-_0060_0060in-text_0027_0027-LaTeX"></a>

<h2 class="majorheading" id="majorheading-in-b"><span>majorheading <b class="b">in b</b><a class="copiable-link" href="#majorheading-in-b"> &para;</a></span></h2>
';


$result_converted{'xml'}->{'commands'} = '<para>&arobase; &tex; <spacecmd type="nl"/><accent type="uml" bracketed="off">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="tilde">a</accent> <accent type="ring" bracketed="off"> </accent>
</para>
<para><clicksequence>File &click; Open</clicksequence>&eosperiod;
<email><emailaddress>a</emailaddress><emailname> b</emailname></email> <code>code --- -- \'\' ``</code>
&textmdash; &textndash; &textrdquo; &textldquo;. <sc>small caps</sc>.
</para>
<cindex index="cp"> <indexterm index="cp" number="1">index entry &textldquo;in text&textrdquo; &latex;</indexterm></cindex>

<majorheading> majorheading <b>in b</b></majorheading>
';


$result_converted{'latex_text'}->{'commands'} = '\\begin{document}
@ \\TeX{} \\ {}\\"{e} \\^{\\i{}} \\~{a} \\r{a}

File $\\rightarrow{}$ Open\\@.
\\href{mailto:a}{b} \\texttt{code {-}{-}{-} {-}{-} {\'}{\'} {`}{`}}
--- -- \'\' ``. \\textsc{small caps}.

\\index[cp]{index entry ""in text"" LaTeX@index entry ``in text\'\' \\LaTeX{}}%

\\Texinfonopagebreakheading{\\chapter*}{{majorheading \\textbf{in b}}}
';


$result_converted{'docbook'}->{'commands'} = '<para>@ &tex; &#160;&#235; &#238; &#227; &#229;
</para>
<para>File &#8594; Open.
<ulink url="mailto:a">b</ulink> <literal>code --- -- \'\' ``</literal>
&#8212; &#8211; &#8221; &#8220;. SMALL CAPS.
</para>
<indexterm role="cp"><primary>index entry &#8220;in text&#8221; &latex;</primary></indexterm>

<bridgehead renderas="sect1">majorheading <emphasis role="bold">in b</emphasis></bridgehead>
';

1;
