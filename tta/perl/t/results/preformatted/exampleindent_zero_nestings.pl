use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'exampleindent_zero_nestings'} = '*document_root C1
 *before_node_section C30
  *preamble_before_content C1
   *normal_command@exampleindent C1 l1
   |EXTRA
   |global_command_number:{1}
   |misc_args:A{asis}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:asis}
     {spaces_after_argument:\\n}
  *normal_command@example C3 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@quotation C3 l3
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:EXAMPLE INDENT in quotation\\n}
    *normal_command@end C1 l5
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l6
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@example C3 l9
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:quotation EXAMPLE INDENT\\n}
    *normal_command@end C1 l11
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l12
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l14
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@display C3 l15
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:EXAMPLE INDENT in display\\n}
    *normal_command@end C1 l17
    |EXTRA
    |text_arg:{display}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:display}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l18
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l20
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@format C3 l21
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:EXAMPLE INDENT in format\\n}
    *normal_command@end C1 l23
    |EXTRA
    |text_arg:{format}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:format}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l24
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l26
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@deffn C3 l27
    *def_line C1 l27
    |EXTRA
    |def_command:{deffn}
    |index_entry:I{fn,1}
    |original_def_cmdname:{deffn}
     *block_line_arg C5
      {spaces_before_argument: }
      *def_category C1
       *def_line_arg C1
        {normal_text:name}
      {spaces: }
      *def_name C1
       *def_line_arg C1
        {normal_text:arg}
      {spaces_after_argument:\\n}
    *def_item C2
     *preformatted C1
      {normal_text:In deffn\\n}
     *normal_command@exdent C1 l29
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:EXDENT}
       {spaces_after_argument:\\n}
    *normal_command@end C1 l30
    |EXTRA
    |text_arg:{deffn}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:deffn}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l31
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C5 l33
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:in first\\n}
   *normal_command@exdent C1 l35
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:exdented first}
     {spaces_after_argument:\\n}
   *normal_command@example C4 l36
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:in second\\n}
    *normal_command@exdent C1 l38
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:exdented second}
      {spaces_after_argument:\\n}
    *normal_command@end C1 l39
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l40
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l42
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@example C4 l43
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@exdent C1 l44
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:exdent in quotation example}
      {spaces_after_argument:\\n}
    *preformatted C1
     {normal_text:AA\\n}
    *normal_command@end C1 l46
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l47
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@exampleindent C1 l49
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{0}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:0}
    {spaces_after_argument:\\n}
  *normal_command@example C3 l50
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@quotation C3 l51
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:EXAMPLE INDENT in quotation\\n}
    *normal_command@end C1 l53
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l54
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l56
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@example C3 l57
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:quotation EXAMPLE INDENT\\n}
    *normal_command@end C1 l59
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l60
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l62
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@display C3 l63
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:EXAMPLE INDENT in display\\n}
    *normal_command@end C1 l65
    |EXTRA
    |text_arg:{display}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:display}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l66
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l68
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@format C3 l69
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:EXAMPLE INDENT in format\\n}
    *normal_command@end C1 l71
    |EXTRA
    |text_arg:{format}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:format}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l72
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l74
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@deffn C3 l75
    *def_line C1 l75
    |EXTRA
    |def_command:{deffn}
    |index_entry:I{fn,2}
    |original_def_cmdname:{deffn}
     *block_line_arg C5
      {spaces_before_argument: }
      *def_category C1
       *def_line_arg C1
        {normal_text:name}
      {spaces: }
      *def_name C1
       *def_line_arg C1
        {normal_text:arg}
      {spaces_after_argument:\\n}
    *def_item C2
     *preformatted C1
      {normal_text:In deffn\\n}
     *normal_command@exdent C1 l77
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:EXDENT}
       {spaces_after_argument:\\n}
    *normal_command@end C1 l78
    |EXTRA
    |text_arg:{deffn}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:deffn}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l79
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C5 l81
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:in first\\n}
   *normal_command@exdent C1 l83
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:exdented first}
     {spaces_after_argument:\\n}
   *normal_command@example C4 l84
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:in second\\n}
    *normal_command@exdent C1 l86
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:exdented second}
      {spaces_after_argument:\\n}
    *normal_command@end C1 l87
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l88
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l90
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@example C4 l91
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@exdent C1 l92
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:exdent in quotation example}
      {spaces_after_argument:\\n}
    *preformatted C1
     {normal_text:AA\\n}
    *normal_command@end C1 l94
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l95
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'exampleindent_zero_nestings'} = '@exampleindent asis
@example
@quotation
EXAMPLE INDENT in quotation
@end quotation
@end example

@quotation
@example
quotation EXAMPLE INDENT
@end example
@end quotation

@example
@display
EXAMPLE INDENT in display
@end display
@end example

@example
@format
EXAMPLE INDENT in format
@end format
@end example

@example
@deffn name arg
In deffn
@exdent EXDENT
@end deffn
@end example

@example
in first
@exdent exdented first
@example
in second
@exdent exdented second
@end example
@end example

@quotation
@example
@exdent exdent in quotation example
AA
@end example
@end quotation

@exampleindent 0
@example
@quotation
EXAMPLE INDENT in quotation
@end quotation
@end example

@quotation
@example
quotation EXAMPLE INDENT
@end example
@end quotation

@example
@display
EXAMPLE INDENT in display
@end display
@end example

@example
@format
EXAMPLE INDENT in format
@end format
@end example

@example
@deffn name arg
In deffn
@exdent EXDENT
@end deffn
@end example

@example
in first
@exdent exdented first
@example
in second
@exdent exdented second
@end example
@end example

@quotation
@example
@exdent exdent in quotation example
AA
@end example
@end quotation

';


$result_texts{'exampleindent_zero_nestings'} = 'EXAMPLE INDENT in quotation

quotation EXAMPLE INDENT

EXAMPLE INDENT in display

EXAMPLE INDENT in format

name: arg
In deffn
EXDENT

in first
exdented first
in second
exdented second

exdent in quotation example
AA

EXAMPLE INDENT in quotation

quotation EXAMPLE INDENT

EXAMPLE INDENT in display

EXAMPLE INDENT in format

name: arg
In deffn
EXDENT

in first
exdented first
in second
exdented second

exdent in quotation example
AA

';

$result_errors{'exampleindent_zero_nestings'} = '* W l27|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l75|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'exampleindent_zero_nestings'} = '';

$result_sections_list{'exampleindent_zero_nestings'} = '';

$result_sectioning_root{'exampleindent_zero_nestings'} = '';

$result_headings_list{'exampleindent_zero_nestings'} = '';

$result_indices_sort_strings{'exampleindent_zero_nestings'} = 'fn:
 arg
 arg
';


$result_converted{'plaintext'}->{'exampleindent_zero_nestings'} = '     EXAMPLE INDENT in quotation

     quotation EXAMPLE INDENT

EXAMPLE INDENT in display

EXAMPLE INDENT in format

 -- name: arg
     In deffn
EXDENT

in first
exdented first
in second
exdented second

     exdent in quotation example
     AA

     EXAMPLE INDENT in quotation

     quotation EXAMPLE INDENT

EXAMPLE INDENT in display

EXAMPLE INDENT in format

 -- name: arg
     In deffn
EXDENT

in first
exdented first
in second
exdented second

     exdent in quotation example
     AA

';

$result_converted_sort_strings{'plaintext'}->{'exampleindent_zero_nestings'} = 'fn:
 arg
 arg
';


$result_converted{'html'}->{'exampleindent_zero_nestings'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
div.display {margin-left: 3.2em}
div.example {margin-left: 3.2em}
dt.def-line {font-size: 1rem}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold}
</style>


</head>

<body>
<div class="example">
<blockquote class="quotation">
<pre class="example-preformatted">EXAMPLE INDENT in quotation
</pre></blockquote>
</div>

<blockquote class="quotation">
<div class="example">
<pre class="example-preformatted">quotation EXAMPLE INDENT
</pre></div>
</blockquote>

<div class="example">
<div class="display">
<pre class="example-preformatted">EXAMPLE INDENT in display
</pre></div>
</div>

<div class="example">
<div class="format">
<pre class="example-preformatted">EXAMPLE INDENT in format
</pre></div>
</div>

<div class="example">
<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-arg"><span class="category-def">name: </span><span><strong class="def-name">arg</strong><a class="copiable-link" href="#index-arg"> &para;</a></span></dt>
<dd><pre class="example-preformatted">In deffn
</pre><pre class="exdent">EXDENT
</pre></dd></dl>
</div>

<div class="example">
<pre class="example-preformatted">in first
</pre><pre class="exdent">exdented first
</pre><div class="example">
<pre class="example-preformatted">in second
</pre><pre class="exdent">exdented second
</pre></div>
</div>

<blockquote class="quotation">
<div class="example">
<pre class="exdent">exdent in quotation example
</pre><pre class="example-preformatted">AA
</pre></div>
</blockquote>

<div class="example">
<blockquote class="quotation">
<pre class="example-preformatted">EXAMPLE INDENT in quotation
</pre></blockquote>
</div>

<blockquote class="quotation">
<div class="example">
<pre class="example-preformatted">quotation EXAMPLE INDENT
</pre></div>
</blockquote>

<div class="example">
<div class="display">
<pre class="example-preformatted">EXAMPLE INDENT in display
</pre></div>
</div>

<div class="example">
<div class="format">
<pre class="example-preformatted">EXAMPLE INDENT in format
</pre></div>
</div>

<div class="example">
<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-arg-1"><span class="category-def">name: </span><span><strong class="def-name">arg</strong><a class="copiable-link" href="#index-arg-1"> &para;</a></span></dt>
<dd><pre class="example-preformatted">In deffn
</pre><pre class="exdent">EXDENT
</pre></dd></dl>
</div>

<div class="example">
<pre class="example-preformatted">in first
</pre><pre class="exdent">exdented first
</pre><div class="example">
<pre class="example-preformatted">in second
</pre><pre class="exdent">exdented second
</pre></div>
</div>

<blockquote class="quotation">
<div class="example">
<pre class="exdent">exdent in quotation example
</pre><pre class="example-preformatted">AA
</pre></div>
</blockquote>




</body>
</html>
';

$result_converted_sort_strings{'html'}->{'exampleindent_zero_nestings'} = 'fn:
 arg
 arg
';

$result_converted_errors{'html'}->{'exampleindent_zero_nestings'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'docbook'}->{'exampleindent_zero_nestings'} = '<blockquote><screen>EXAMPLE INDENT in quotation
</screen></blockquote>
<blockquote><screen>quotation EXAMPLE INDENT
</screen></blockquote>
<literallayout>EXAMPLE INDENT in display
</literallayout>
<literallayout>EXAMPLE INDENT in format
</literallayout>
<synopsis><indexterm role="fn"><primary>arg</primary></indexterm><phrase role="category"><emphasis role="bold">name</emphasis>:</phrase> <function>arg</function></synopsis>
<blockquote><screen>In deffn
</screen><simpara role="exdent">EXDENT</simpara>
</blockquote>
<screen>in first
</screen><simpara role="exdent">exdented first</simpara>
<screen>in second
</screen><simpara role="exdent">exdented second</simpara>

<blockquote><simpara role="exdent">exdent in quotation example</simpara>
<screen>AA
</screen></blockquote>
<blockquote><screen>EXAMPLE INDENT in quotation
</screen></blockquote>
<blockquote><screen>quotation EXAMPLE INDENT
</screen></blockquote>
<literallayout>EXAMPLE INDENT in display
</literallayout>
<literallayout>EXAMPLE INDENT in format
</literallayout>
<synopsis><indexterm role="fn"><primary>arg</primary></indexterm><phrase role="category"><emphasis role="bold">name</emphasis>:</phrase> <function>arg</function></synopsis>
<blockquote><screen>In deffn
</screen><simpara role="exdent">EXDENT</simpara>
</blockquote>
<screen>in first
</screen><simpara role="exdent">exdented first</simpara>
<screen>in second
</screen><simpara role="exdent">exdented second</simpara>

<blockquote><simpara role="exdent">exdent in quotation example</simpara>
<screen>AA
</screen></blockquote>
';


$result_converted{'xml'}->{'exampleindent_zero_nestings'} = '<exampleindent value="asis" line=" asis"></exampleindent>
<example endspaces=" ">
<quotation endspaces=" ">
<pre xml:space="preserve">EXAMPLE INDENT in quotation
</pre></quotation>
</example>

<quotation endspaces=" ">
<example endspaces=" ">
<pre xml:space="preserve">quotation EXAMPLE INDENT
</pre></example>
</quotation>

<example endspaces=" ">
<display endspaces=" ">
<pre xml:space="preserve">EXAMPLE INDENT in display
</pre></display>
</example>

<example endspaces=" ">
<format endspaces=" ">
<pre xml:space="preserve">EXAMPLE INDENT in format
</pre></format>
</example>

<example endspaces=" ">
<deffn endspaces=" "><definitionterm><indexterm index="fn" number="1">arg</indexterm> <defcategory>name</defcategory> <deffunction>arg</deffunction></definitionterm>
<definitionitem><pre xml:space="preserve">In deffn
</pre><exdent> EXDENT</exdent>
</definitionitem></deffn>
</example>

<example endspaces=" ">
<pre xml:space="preserve">in first
</pre><exdent> exdented first</exdent>
<example endspaces=" ">
<pre xml:space="preserve">in second
</pre><exdent> exdented second</exdent>
</example>
</example>

<quotation endspaces=" ">
<example endspaces=" ">
<exdent> exdent in quotation example</exdent>
<pre xml:space="preserve">AA
</pre></example>
</quotation>

<exampleindent value="0" line=" 0"></exampleindent>
<example endspaces=" ">
<quotation endspaces=" ">
<pre xml:space="preserve">EXAMPLE INDENT in quotation
</pre></quotation>
</example>

<quotation endspaces=" ">
<example endspaces=" ">
<pre xml:space="preserve">quotation EXAMPLE INDENT
</pre></example>
</quotation>

<example endspaces=" ">
<display endspaces=" ">
<pre xml:space="preserve">EXAMPLE INDENT in display
</pre></display>
</example>

<example endspaces=" ">
<format endspaces=" ">
<pre xml:space="preserve">EXAMPLE INDENT in format
</pre></format>
</example>

<example endspaces=" ">
<deffn endspaces=" "><definitionterm><indexterm index="fn" number="2">arg</indexterm> <defcategory>name</defcategory> <deffunction>arg</deffunction></definitionterm>
<definitionitem><pre xml:space="preserve">In deffn
</pre><exdent> EXDENT</exdent>
</definitionitem></deffn>
</example>

<example endspaces=" ">
<pre xml:space="preserve">in first
</pre><exdent> exdented first</exdent>
<example endspaces=" ">
<pre xml:space="preserve">in second
</pre><exdent> exdented second</exdent>
</example>
</example>

<quotation endspaces=" ">
<example endspaces=" ">
<exdent> exdent in quotation example</exdent>
<pre xml:space="preserve">AA
</pre></example>
</quotation>

';


$result_converted{'latex_text'}->{'exampleindent_zero_nestings'} = '\\begin{document}
\\begin{Texinfoindented}
\\begin{quote}
\\begin{Texinfopreformatted}%
\\ttfamily EXAMPLE INDENT in quotation
\\end{Texinfopreformatted}
\\end{quote}
\\end{Texinfoindented}

\\begin{quote}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily quotation EXAMPLE INDENT
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{quote}

\\begin{Texinfoindented}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
EXAMPLE INDENT in display
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
EXAMPLE INDENT in format
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{Texinfoindented}

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{arg}& [name]
\\end{tabularx}

\\index[fn]{arg@\\texttt{arg}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
\\begin{Texinfopreformatted}%
\\ttfamily In deffn
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
EXDENT
\\\\
\\end{Texinfoindented}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in first
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented first
\\\\
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in second
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented second
\\\\
\\end{Texinfoindented}
\\end{Texinfoindented}

\\begin{quote}
\\begin{Texinfoindented}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdent in quotation example
\\\\
\\begin{Texinfopreformatted}%
\\ttfamily AA
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{quote}

\\begin{Texinfoindented}
\\begin{quote}
\\begin{Texinfopreformatted}%
\\ttfamily EXAMPLE INDENT in quotation
\\end{Texinfopreformatted}
\\end{quote}
\\end{Texinfoindented}

\\begin{quote}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily quotation EXAMPLE INDENT
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{quote}

\\begin{Texinfoindented}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
EXAMPLE INDENT in display
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
EXAMPLE INDENT in format
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{Texinfoindented}

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{arg}& [name]
\\end{tabularx}

\\index[fn]{arg@\\texttt{arg}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
\\begin{Texinfopreformatted}%
\\ttfamily In deffn
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
EXDENT
\\\\
\\end{Texinfoindented}
\\end{Texinfoindented}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in first
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented first
\\\\
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily in second
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented second
\\\\
\\end{Texinfoindented}
\\end{Texinfoindented}

\\begin{quote}
\\begin{Texinfoindented}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdent in quotation example
\\\\
\\begin{Texinfopreformatted}%
\\ttfamily AA
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{quote}

';

1;
