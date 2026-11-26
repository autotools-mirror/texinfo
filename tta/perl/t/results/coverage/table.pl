use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'table'} = '*document_root C1
 *before_node_section C7
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@table C3 l2
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l2
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C2
     *normal_command@item C1 l3
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:table item}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l4
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:table itemx}
       {spaces_after_argument:\\n}
    *table_definition C2
     {empty_line:\\n}
     *paragraph C1
      {normal_text:In table\\n}
   *normal_command@end C1 l7
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@vtable C4 l9
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@samp l9
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:samp}
       {spaces_after_argument:\\n}
   *before_item C3
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:after vtable}
      {spaces_after_argument:\\n}
    *index_entry_command@cindex C1 l11
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:index entry}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
   *table_entry C2
    *table_term C4
     *normal_command@item C1 l13
     |index_entry:I{vr,1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:vtable item}
       {spaces_after_argument:\\n}
     *inter_item C1
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:after item}
        {spaces_after_argument:\\n}
     *index_entry_command@kindex C1 l15
     |index_entry:I{ky,1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:key}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l16
     |index_entry:I{vr,2}
      *line_arg C4
       {spaces_before_argument: }
       {normal_text:itemx vtable}
       {spaces_after_argument: }
       *normal_command@comment C1
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:comment in itemx line}
         {spaces_after_argument:\\n}
    *table_definition C1
     {empty_line:\\n}
   *normal_command@end C1 l18
   |text_arg:{vtable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vtable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C3 l20
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@strong l20
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l21
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:unknown command after indicating command}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l22
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'table'} = '
@table @asis
@item table item
@itemx table itemx

In table
@end table

@vtable @samp@c samp
@c after vtable
@cindex index entry

@item vtable item
@c after item
@kindex key
@itemx itemx vtable @comment comment in itemx line

@end vtable

@table @strong
@item unknown command after indicating command
@end table
';


$result_texts{'table'} = 'table item
table itemx

In table


vtable item
itemx vtable


unknown command after indicating command
';

$result_errors{'table'} = '* W l11|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W l13|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l15|entry for index `ky\' outside of any node
 warning: entry for index `ky\' outside of any node

* W l16|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* E l20|unknown command `unknown\'
 unknown command `unknown\'

';

$result_nodes_list{'table'} = '';

$result_sections_list{'table'} = '';

$result_sectioning_root{'table'} = '';

$result_headings_list{'table'} = '';

$result_indices_sort_strings{'table'} = 'cp:
 index entry
ky:
 key
vr:
 itemx vtable
 vtable item
';


$result_converted{'plaintext'}->{'table'} = 'table item
table itemx

     In table

‘vtable item’
‘itemx vtable’

*unknown command after indicating command*
';

$result_converted_sort_strings{'plaintext'}->{'table'} = 'cp:
 index entry
ky:
 key
vr:
 itemx vtable
 vtable item
';


$result_converted{'html_text'}->{'table'} = '<dl class="table">
<dt>table item</dt>
<dt>table itemx</dt>
<dd>
<p>In table
</p></dd>
</dl>

<dl class="vtable">
<dd><a class="index-entry-id" id="index-index-entry"></a>

</dd>
<dt><a id="index-vtable-item"></a><span>&lsquo;<samp class="samp">vtable item</samp>&rsquo;<a class="copiable-link" href="#index-vtable-item"> &para;</a></span></dt>
<a class="index-entry-id" id="index-key"></a>
<dt><a id="index-itemx-vtable"></a><span>&lsquo;<samp class="samp">itemx vtable</samp>&rsquo;<a class="copiable-link" href="#index-itemx-vtable"> &para;</a></span></dt>
</dl>

<dl class="table">
<dt><strong class="strong">unknown command after indicating command</strong></dt>
</dl>
';


$result_converted{'xml'}->{'table'} = '<preamblebeforebeginning>
</preamblebeforebeginning><table commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"> table item</itemformat></item>
<itemx><itemformat command="asis"> table itemx</itemformat></itemx>
</tableterm><tableitem>
<para>In table
</para></tableitem></tableentry></table>

<vtable commandarg="samp" endspaces=" "><!-- c samp -->
<beforefirstitem><!-- c after vtable -->
<cindex index="cp"> <indexterm index="cp" number="1">index entry</indexterm></cindex>

</beforefirstitem><tableentry><tableterm><item><itemformat command="samp"><indexterm index="vr" number="1">vtable item</indexterm> vtable item</itemformat></item>
<!-- c after item -->
<kindex index="ky"> <indexterm index="ky" number="1">key</indexterm></kindex>
<itemx><itemformat command="samp"><indexterm index="vr" number="2">itemx vtable</indexterm> itemx vtable </itemformat></itemx><!-- comment comment in itemx line -->
</tableterm><tableitem>
</tableitem></tableentry></vtable>

<table commandarg="strong" endspaces=" ">
<tableentry><tableterm><item><itemformat command="strong"> unknown command after indicating command</itemformat></item>
</tableterm></tableentry></table>
';


$result_converted{'latex_text'}->{'table'} = '\\begin{document}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
table item\\\\
table itemx}}]

In table
\\end{description}

\\begin{description}
\\item[] \\index[cp]{index entry@index entry}%

\\item[{\\parbox[b]{\\linewidth}{%
\\Texinfotablestylesamp{vtable item}\\\\
\\index[vr]{vtable item@\\texttt{vtable item}}%
\\index[ky]{key@\\texttt{key}}%
\\Texinfotablestylesamp{itemx vtable}
\\index[vr]{itemx vtable@\\texttt{itemx vtable}}%
}}]

\\end{description}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\textbf{unknown command after indicating command}}}]
\\end{description}
';


$result_converted{'docbook'}->{'table'} = '<variablelist><varlistentry><term>table item
</term><term>table itemx
</term><listitem>
<para>In table
</para></listitem></varlistentry></variablelist>
<variablelist><!-- after vtable -->
<indexterm role="cp"><primary>index entry</primary></indexterm>

<varlistentry><term><indexterm role="vr"><primary>vtable item</primary></indexterm>&#8216;<literal>vtable item</literal>&#8217;
</term><!-- after item -->
<indexterm role="ky"><primary>key</primary></indexterm>
<term><indexterm role="vr"><primary>itemx vtable</primary></indexterm>&#8216;<literal>itemx vtable<!-- comment in itemx line -->
</literal>&#8217;
</term><listitem>
</listitem></varlistentry></variablelist>
<variablelist><varlistentry><term><emphasis role="bold">unknown command after indicating command</emphasis>
</term></varlistentry></variablelist>';

1;
