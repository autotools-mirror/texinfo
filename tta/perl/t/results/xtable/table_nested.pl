use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'table_nested'} = '*document_root C1
 *before_node_section C9
  *preamble_before_content C2
   *normal_command@macro C23 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{myvtable}
    *arguments_line C1
     {macro_line: myvtable\\n}
    {raw:@vtable @asis\\n}
    {raw:@item first item\\n}
    {raw:@itemx second itemx\\n}
    {raw:\\n}
    {raw:Text.\\n}
    {raw:\\n}
    {raw:@item second item\\n}
    {raw:\\n}
    {raw:Text 2\\n}
    {raw:\\n}
    {raw:@item last\\n}
    {raw:@end vtable\\n}
    {raw:\\n}
    {raw:Something.\\n}
    {raw:@table @emph\\n}
    {raw:@item in item\\n}
    {raw:Text without blank line\\n}
    {raw:@item second item\\n}
    {raw:Text without blank line 2\\n}
    {raw:@end table\\n}
    {raw:After table.\\n}
    *normal_command@end C1 l23
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:Quotation\\n}
  *normal_command@quotation C7 l26
   *arguments_line C1
    *block_line_arg C1
    >SOURCEMARKS
    >macro_expansion<start;1>
     >*macro_call@myvtable C1
      >*brace_arg
     {spaces_before_argument:\\n}
   *normal_command@vtable C5 l27:@myvtable
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *normal_command@asis l27:@myvtable
      {spaces_after_argument:\\n}
    *table_entry C2
     *table_term C2
      *normal_command@item C1 l27:@myvtable
      |EXTRA
      |index_entry:I{vr,1}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:first item}
        {spaces_after_argument:\\n}
      *normal_command@itemx C1 l27:@myvtable
      |EXTRA
      |index_entry:I{vr,2}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:second itemx}
        {spaces_after_argument:\\n}
     *table_definition C3
      {empty_line:\\n}
      *paragraph C1
       {normal_text:Text.\\n}
      {empty_line:\\n}
    *table_entry C2
     *table_term C1
      *normal_command@item C1 l27:@myvtable
      |EXTRA
      |index_entry:I{vr,3}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:second item}
        {spaces_after_argument:\\n}
     *table_definition C3
      {empty_line:\\n}
      *paragraph C1
       {normal_text:Text 2\\n}
      {empty_line:\\n}
    *table_entry C1
     *table_term C1
      *normal_command@item C1 l27:@myvtable
      |EXTRA
      |index_entry:I{vr,4}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:last}
        {spaces_after_argument:\\n}
    *normal_command@end C1 l27:@myvtable
    |EXTRA
    |text_arg:{vtable}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:vtable}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:Something.\\n}
   *normal_command@table C4 l27:@myvtable
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *normal_command@emph l27:@myvtable
      {spaces_after_argument:\\n}
    *table_entry C2
     *table_term C1
      *normal_command@item C1 l27:@myvtable
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:in item}
        {spaces_after_argument:\\n}
     *table_definition C1
      *paragraph C1
       {normal_text:Text without blank line\\n}
    *table_entry C2
     *table_term C1
      *normal_command@item C1 l27:@myvtable
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:second item}
        {spaces_after_argument:\\n}
     *table_definition C1
      *paragraph C1
       {normal_text:Text without blank line 2\\n}
    *normal_command@end C1 l27:@myvtable
    |EXTRA
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:After table.\\n}
    >SOURCEMARKS
    >macro_expansion<end;1><p:12>
   *normal_command@end C1 l28
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Example\\n}
  *normal_command@example C7 l31
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@myvtable C1
     >*brace_arg
   *normal_command@vtable C5 l32:@myvtable
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *normal_command@asis l32:@myvtable
      {spaces_after_argument:\\n}
    *table_entry C2
     *table_term C2
      *normal_command@item C1 l32:@myvtable
      |EXTRA
      |index_entry:I{vr,5}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:first item}
        {spaces_after_argument:\\n}
      *normal_command@itemx C1 l32:@myvtable
      |EXTRA
      |index_entry:I{vr,6}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:second itemx}
        {spaces_after_argument:\\n}
     *table_definition C1
      *preformatted C3
       {empty_line:\\n}
       {normal_text:Text.\\n}
       {empty_line:\\n}
    *table_entry C2
     *table_term C1
      *normal_command@item C1 l32:@myvtable
      |EXTRA
      |index_entry:I{vr,7}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:second item}
        {spaces_after_argument:\\n}
     *table_definition C1
      *preformatted C3
       {empty_line:\\n}
       {normal_text:Text 2\\n}
       {empty_line:\\n}
    *table_entry C1
     *table_term C1
      *normal_command@item C1 l32:@myvtable
      |EXTRA
      |index_entry:I{vr,8}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:last}
        {spaces_after_argument:\\n}
    *normal_command@end C1 l32:@myvtable
    |EXTRA
    |text_arg:{vtable}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:vtable}
      {spaces_after_argument:\\n}
   *preformatted C2
    {empty_line:\\n}
    {normal_text:Something.\\n}
   *normal_command@table C4 l32:@myvtable
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *normal_command@emph l32:@myvtable
      {spaces_after_argument:\\n}
    *table_entry C2
     *table_term C1
      *normal_command@item C1 l32:@myvtable
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:in item}
        {spaces_after_argument:\\n}
     *table_definition C1
      *preformatted C1
       {normal_text:Text without blank line\\n}
    *table_entry C2
     *table_term C1
      *normal_command@item C1 l32:@myvtable
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:second item}
        {spaces_after_argument:\\n}
     *table_definition C1
      *preformatted C1
       {normal_text:Text without blank line 2\\n}
    *normal_command@end C1 l32:@myvtable
    |EXTRA
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:After table.\\n}
    >SOURCEMARKS
    >macro_expansion<end;2><p:12>
   *normal_command@end C1 l33
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Double quotation\\n}
  *normal_command@quotation C3 l36
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@quotation C7 l37
    *arguments_line C1
     *block_line_arg C1
     >SOURCEMARKS
     >macro_expansion<start;3>
      >*macro_call@myvtable C1
       >*brace_arg
      {spaces_before_argument:\\n}
    *normal_command@vtable C5 l38:@myvtable
     *arguments_line C1
      *block_line_arg C3
       {spaces_before_argument: }
       *normal_command@asis l38:@myvtable
       {spaces_after_argument:\\n}
     *table_entry C2
      *table_term C2
       *normal_command@item C1 l38:@myvtable
       |EXTRA
       |index_entry:I{vr,9}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:first item}
         {spaces_after_argument:\\n}
       *normal_command@itemx C1 l38:@myvtable
       |EXTRA
       |index_entry:I{vr,10}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:second itemx}
         {spaces_after_argument:\\n}
      *table_definition C3
       {empty_line:\\n}
       *paragraph C1
        {normal_text:Text.\\n}
       {empty_line:\\n}
     *table_entry C2
      *table_term C1
       *normal_command@item C1 l38:@myvtable
       |EXTRA
       |index_entry:I{vr,11}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:second item}
         {spaces_after_argument:\\n}
      *table_definition C3
       {empty_line:\\n}
       *paragraph C1
        {normal_text:Text 2\\n}
       {empty_line:\\n}
     *table_entry C1
      *table_term C1
       *normal_command@item C1 l38:@myvtable
       |EXTRA
       |index_entry:I{vr,12}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:last}
         {spaces_after_argument:\\n}
     *normal_command@end C1 l38:@myvtable
     |EXTRA
     |text_arg:{vtable}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:vtable}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:Something.\\n}
    *normal_command@table C4 l38:@myvtable
     *arguments_line C1
      *block_line_arg C3
       {spaces_before_argument: }
       *normal_command@emph l38:@myvtable
       {spaces_after_argument:\\n}
     *table_entry C2
      *table_term C1
       *normal_command@item C1 l38:@myvtable
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:in item}
         {spaces_after_argument:\\n}
      *table_definition C1
       *paragraph C1
        {normal_text:Text without blank line\\n}
     *table_entry C2
      *table_term C1
       *normal_command@item C1 l38:@myvtable
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:second item}
         {spaces_after_argument:\\n}
      *table_definition C1
       *paragraph C1
        {normal_text:Text without blank line 2\\n}
     *normal_command@end C1 l38:@myvtable
     |EXTRA
     |text_arg:{table}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:table}
       {spaces_after_argument:\\n}
    *paragraph C1
     {normal_text:After table.\\n}
     >SOURCEMARKS
     >macro_expansion<end;3><p:12>
    *normal_command@end C1 l39
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l40
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'table_nested'} = '@macro myvtable
@vtable @asis
@item first item
@itemx second itemx

Text.

@item second item

Text 2

@item last
@end vtable

Something.
@table @emph
@item in item
Text without blank line
@item second item
Text without blank line 2
@end table
After table.
@end macro

Quotation
@quotation
@vtable @asis
@item first item
@itemx second itemx

Text.

@item second item

Text 2

@item last
@end vtable

Something.
@table @emph
@item in item
Text without blank line
@item second item
Text without blank line 2
@end table
After table.
@end quotation

Example
@example
@vtable @asis
@item first item
@itemx second itemx

Text.

@item second item

Text 2

@item last
@end vtable

Something.
@table @emph
@item in item
Text without blank line
@item second item
Text without blank line 2
@end table
After table.
@end example

Double quotation
@quotation
@quotation
@vtable @asis
@item first item
@itemx second itemx

Text.

@item second item

Text 2

@item last
@end vtable

Something.
@table @emph
@item in item
Text without blank line
@item second item
Text without blank line 2
@end table
After table.
@end quotation
@end quotation
';


$result_texts{'table_nested'} = '
Quotation
first item
second itemx

Text.

second item

Text 2

last

Something.
in item
Text without blank line
second item
Text without blank line 2
After table.

Example
first item
second itemx

Text.

second item

Text 2

last

Something.
in item
Text without blank line
second item
Text without blank line 2
After table.

Double quotation
first item
second itemx

Text.

second item

Text 2

last

Something.
in item
Text without blank line
second item
Text without blank line 2
After table.
';

$result_errors{'table_nested'} = '* W l27:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

* W l27:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

* W l27:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

* W l27:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

* W l32:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

* W l32:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

* W l32:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

* W l32:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

* W l38:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

* W l38:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

* W l38:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

* W l38:@myvtable|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node (possibly involving @myvtable)

';

$result_nodes_list{'table_nested'} = '';

$result_sections_list{'table_nested'} = '';

$result_sectioning_root{'table_nested'} = '';

$result_headings_list{'table_nested'} = '';

$result_indices_sort_strings{'table_nested'} = 'vr:
 first item
 first item
 first item
 last
 last
 last
 second item
 second item
 second item
 second itemx
 second itemx
 second itemx
';


$result_converted{'plaintext'}->{'table_nested'} = 'Quotation
     first item
     second itemx

          Text.

     second item

          Text 2

     last

     Something.
     _in item_
          Text without blank line
     _second item_
          Text without blank line 2
     After table.

   Example
     first item
     second itemx

          Text.

     second item

          Text 2

     last

     Something.
     _in item_
          Text without blank line
     _second item_
          Text without blank line 2
     After table.

   Double quotation
          first item
          second itemx

               Text.

          second item

               Text 2

          last

          Something.
          _in item_
               Text without blank line
          _second item_
               Text without blank line 2
          After table.
';

$result_converted_sort_strings{'plaintext'}->{'table_nested'} = 'vr:
 first item
 first item
 first item
 last
 last
 last
 second item
 second item
 second item
 second itemx
 second itemx
 second itemx
';


$result_converted{'html_text'}->{'table_nested'} = '
<p>Quotation
</p><blockquote class="quotation">
<dl class="vtable">
<dt><a id="index-first-item"></a><span>first item<a class="copiable-link" href="#index-first-item"> &para;</a></span></dt>
<dt><a id="index-second-itemx"></a><span>second itemx<a class="copiable-link" href="#index-second-itemx"> &para;</a></span></dt>
<dd>
<p>Text.
</p>
</dd>
<dt><a id="index-second-item"></a><span>second item<a class="copiable-link" href="#index-second-item"> &para;</a></span></dt>
<dd>
<p>Text 2
</p>
</dd>
<dt><a id="index-last"></a><span>last<a class="copiable-link" href="#index-last"> &para;</a></span></dt>
</dl>

<p>Something.
</p><dl class="table">
<dt><em class="emph">in item</em></dt>
<dd><p>Text without blank line
</p></dd>
<dt><em class="emph">second item</em></dt>
<dd><p>Text without blank line 2
</p></dd>
</dl>
<p>After table.
</p></blockquote>

<p>Example
</p><div class="example">
<dl class="vtable">
<dt><a id="index-first-item-1"></a><span><code class="table-term-preformatted-code">first item</code><a class="copiable-link" href="#index-first-item-1"> &para;</a></span></dt>
<dt><a id="index-second-itemx-1"></a><span><code class="table-term-preformatted-code">second itemx</code><a class="copiable-link" href="#index-second-itemx-1"> &para;</a></span></dt>
<dd><pre class="example-preformatted">

Text.

</pre></dd>
<dt><a id="index-second-item-1"></a><span><code class="table-term-preformatted-code">second item</code><a class="copiable-link" href="#index-second-item-1"> &para;</a></span></dt>
<dd><pre class="example-preformatted">

Text 2

</pre></dd>
<dt><a id="index-last-1"></a><span><code class="table-term-preformatted-code">last</code><a class="copiable-link" href="#index-last-1"> &para;</a></span></dt>
</dl>
<pre class="example-preformatted">

Something.
</pre><dl class="table">
<dt><code class="table-term-preformatted-code"><em class="emph">in item</em></code></dt>
<dd><pre class="example-preformatted">Text without blank line
</pre></dd>
<dt><code class="table-term-preformatted-code"><em class="emph">second item</em></code></dt>
<dd><pre class="example-preformatted">Text without blank line 2
</pre></dd>
</dl>
<pre class="example-preformatted">After table.
</pre></div>

<p>Double quotation
</p><blockquote class="quotation">
<blockquote class="quotation">
<dl class="vtable">
<dt><a id="index-first-item-2"></a><span>first item<a class="copiable-link" href="#index-first-item-2"> &para;</a></span></dt>
<dt><a id="index-second-itemx-2"></a><span>second itemx<a class="copiable-link" href="#index-second-itemx-2"> &para;</a></span></dt>
<dd>
<p>Text.
</p>
</dd>
<dt><a id="index-second-item-2"></a><span>second item<a class="copiable-link" href="#index-second-item-2"> &para;</a></span></dt>
<dd>
<p>Text 2
</p>
</dd>
<dt><a id="index-last-2"></a><span>last<a class="copiable-link" href="#index-last-2"> &para;</a></span></dt>
</dl>

<p>Something.
</p><dl class="table">
<dt><em class="emph">in item</em></dt>
<dd><p>Text without blank line
</p></dd>
<dt><em class="emph">second item</em></dt>
<dd><p>Text without blank line 2
</p></dd>
</dl>
<p>After table.
</p></blockquote>
</blockquote>
';


$result_converted{'xml'}->{'table_nested'} = '<macro name="myvtable" line=" myvtable" endspaces=" ">
@vtable @asis
@item first item
@itemx second itemx

Text.

@item second item

Text 2

@item last
@end vtable

Something.
@table @emph
@item in item
Text without blank line
@item second item
Text without blank line 2
@end table
After table.
</macro>

<para>Quotation
</para><quotation endspaces=" ">
<vtable commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="1">first item</indexterm> first item</itemformat></item>
<itemx><itemformat command="asis"><indexterm index="vr" number="2">second itemx</indexterm> second itemx</itemformat></itemx>
</tableterm><tableitem>
<para>Text.
</para>
</tableitem></tableentry><tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="3">second item</indexterm> second item</itemformat></item>
</tableterm><tableitem>
<para>Text 2
</para>
</tableitem></tableentry><tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="4">last</indexterm> last</itemformat></item>
</tableterm></tableentry></vtable>

<para>Something.
</para><table commandarg="emph" endspaces=" ">
<tableentry><tableterm><item><itemformat command="emph"> in item</itemformat></item>
</tableterm><tableitem><para>Text without blank line
</para></tableitem></tableentry><tableentry><tableterm><item><itemformat command="emph"> second item</itemformat></item>
</tableterm><tableitem><para>Text without blank line 2
</para></tableitem></tableentry></table>
<para>After table.
</para></quotation>

<para>Example
</para><example endspaces=" ">
<vtable commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="5">first item</indexterm> first item</itemformat></item>
<itemx><itemformat command="asis"><indexterm index="vr" number="6">second itemx</indexterm> second itemx</itemformat></itemx>
</tableterm><tableitem><pre xml:space="preserve">
Text.

</pre></tableitem></tableentry><tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="7">second item</indexterm> second item</itemformat></item>
</tableterm><tableitem><pre xml:space="preserve">
Text 2

</pre></tableitem></tableentry><tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="8">last</indexterm> last</itemformat></item>
</tableterm></tableentry></vtable>
<pre xml:space="preserve">
Something.
</pre><table commandarg="emph" endspaces=" ">
<tableentry><tableterm><item><itemformat command="emph"> in item</itemformat></item>
</tableterm><tableitem><pre xml:space="preserve">Text without blank line
</pre></tableitem></tableentry><tableentry><tableterm><item><itemformat command="emph"> second item</itemformat></item>
</tableterm><tableitem><pre xml:space="preserve">Text without blank line 2
</pre></tableitem></tableentry></table>
<pre xml:space="preserve">After table.
</pre></example>

<para>Double quotation
</para><quotation endspaces=" ">
<quotation endspaces=" ">
<vtable commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="9">first item</indexterm> first item</itemformat></item>
<itemx><itemformat command="asis"><indexterm index="vr" number="10">second itemx</indexterm> second itemx</itemformat></itemx>
</tableterm><tableitem>
<para>Text.
</para>
</tableitem></tableentry><tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="11">second item</indexterm> second item</itemformat></item>
</tableterm><tableitem>
<para>Text 2
</para>
</tableitem></tableentry><tableentry><tableterm><item><itemformat command="asis"><indexterm index="vr" number="12">last</indexterm> last</itemformat></item>
</tableterm></tableentry></vtable>

<para>Something.
</para><table commandarg="emph" endspaces=" ">
<tableentry><tableterm><item><itemformat command="emph"> in item</itemformat></item>
</tableterm><tableitem><para>Text without blank line
</para></tableitem></tableentry><tableentry><tableterm><item><itemformat command="emph"> second item</itemformat></item>
</tableterm><tableitem><para>Text without blank line 2
</para></tableitem></tableentry></table>
<para>After table.
</para></quotation>
</quotation>
';


$result_converted{'docbook'}->{'table_nested'} = '
<para>Quotation
</para><blockquote><variablelist><varlistentry><term><indexterm role="vr"><primary>first item</primary></indexterm>first item
</term><term><indexterm role="vr"><primary>second itemx</primary></indexterm>second itemx
</term><listitem>
<para>Text.
</para>
</listitem></varlistentry><varlistentry><term><indexterm role="vr"><primary>second item</primary></indexterm>second item
</term><listitem>
<para>Text 2
</para>
</listitem></varlistentry><varlistentry><term><indexterm role="vr"><primary>last</primary></indexterm>last
</term></varlistentry></variablelist>
<para>Something.
</para><variablelist><varlistentry><term><emphasis>in item</emphasis>
</term><listitem><para>Text without blank line
</para></listitem></varlistentry><varlistentry><term><emphasis>second item</emphasis>
</term><listitem><para>Text without blank line 2
</para></listitem></varlistentry></variablelist><para>After table.
</para></blockquote>
<para>Example
</para><variablelist><varlistentry><term><indexterm role="vr"><primary>first item</primary></indexterm>first item
</term><term><indexterm role="vr"><primary>second itemx</primary></indexterm>second itemx
</term><listitem><screen>
Text.

</screen></listitem></varlistentry><varlistentry><term><indexterm role="vr"><primary>second item</primary></indexterm>second item
</term><listitem><screen>
Text 2

</screen></listitem></varlistentry><varlistentry><term><indexterm role="vr"><primary>last</primary></indexterm>last
</term></varlistentry></variablelist><screen>
Something.
</screen><variablelist><varlistentry><term><emphasis>in item</emphasis>
</term><listitem><screen>Text without blank line
</screen></listitem></varlistentry><varlistentry><term><emphasis>second item</emphasis>
</term><listitem><screen>Text without blank line 2
</screen></listitem></varlistentry></variablelist><screen>After table.
</screen>
<para>Double quotation
</para><blockquote><blockquote><variablelist><varlistentry><term><indexterm role="vr"><primary>first item</primary></indexterm>first item
</term><term><indexterm role="vr"><primary>second itemx</primary></indexterm>second itemx
</term><listitem>
<para>Text.
</para>
</listitem></varlistentry><varlistentry><term><indexterm role="vr"><primary>second item</primary></indexterm>second item
</term><listitem>
<para>Text 2
</para>
</listitem></varlistentry><varlistentry><term><indexterm role="vr"><primary>last</primary></indexterm>last
</term></varlistentry></variablelist>
<para>Something.
</para><variablelist><varlistentry><term><emphasis>in item</emphasis>
</term><listitem><para>Text without blank line
</para></listitem></varlistentry><varlistentry><term><emphasis>second item</emphasis>
</term><listitem><para>Text without blank line 2
</para></listitem></varlistentry></variablelist><para>After table.
</para></blockquote></blockquote>';

1;
