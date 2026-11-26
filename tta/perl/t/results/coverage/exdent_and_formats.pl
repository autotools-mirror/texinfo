use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'exdent_and_formats'} = '*document_root C1
 *before_node_section C35
  *preamble
  *normal_command@example C5 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C8
    {normal_text: Example   Hoho. }
    *normal_command@TeX C1 l2
     *brace_container
    {normal_text: . }
    *normal_command@*
    {normal_text: }
    *normal_command@@
    {normal_text:.\\n}
    {empty_line:\\n}
   *normal_command@exdent C1 l4
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Other line}
     {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:not exdented\\n}
   *normal_command@end C1 l6
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *normal_command@example C6 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@exdent C1 l10
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:exdented  and dash --- in example}
     {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:Not exdented\\n}
   *normal_command@exdent C1 l12
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:exdented}
     {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:Not exdented\\n}
   *normal_command@end C1 l14
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Para1.\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l18
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C2
    {normal_text:qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq \\n}
    {normal_text:qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q\\n}
   *normal_command@end C1 l21
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Para2.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Para3.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Last para.\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l29
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C2
    {normal_text:quotation1\\n}
    {normal_text:quotation2\\n}
   *normal_command@end C1 l32
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C5 l34
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:quotation para 1\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:quotation para 2\\n}
   *normal_command@end C1 l38
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C4 l40
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:Example   Hoho.\\n}
   *normal_command@example C4 l42
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:Nested Other line\\n}
    *normal_command@exdent C1 l44
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:exdented nested other line}
      {spaces_after_argument:\\n}
    *normal_command@end C1 l45
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l46
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l48
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@exdent C1 l49
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:exdented quotation line   and dash --- in quotation}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l50
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l52
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:Not exdented followed by exdented\\n}
   *normal_command@exdent C1 l54
    *line_arg C3
     {spaces_before_argument:  }
     {normal_text:exdented quotation line}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l55
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l57
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@exdent C1 l58
    *line_arg C3
     {spaces_before_argument:  }
     {normal_text:exdented quotation line}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Followed by not exdented \\n}
   *normal_command@end C1 l60
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l62
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@exdent C1 l63
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az}
     {spaces_after_argument:\\n}
   *normal_command@exdent C1 l64
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:azeaz az az az az}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l65
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l67
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@exdent C1 l68
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line}
     {spaces_after_argument:\\n}
   *normal_command@exdent C1 l69
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:az az az az}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l70
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l72
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:quotation line oidfjslsd aez a aze azaz aeae za eaz az zelef  aaa\\n}
   *normal_command@exdent C1 l74
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ezkfjklezf}
     {spaces_after_argument: \\n}
   *normal_command@end C1 l75
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l77
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@exdent C1 l78
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:very loooooooooooooooooooooooooooooooooong exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line}
     {spaces_after_argument:\\n}
   *normal_command@exdent C1 l79
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:az az az az}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l80
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'exdent_and_formats'} = '@example
 Example   Hoho. @TeX{} . @* @@.

@exdent Other line
not exdented
@end example


@example
@exdent exdented  and dash --- in example
Not exdented
@exdent exdented
Not exdented
@end example

Para1.

@quotation
qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q
@end quotation

Para2.

Para3.

Last para.

@quotation
quotation1
quotation2
@end quotation

@quotation
quotation para 1

quotation para 2
@end quotation

@example
Example   Hoho.
@example
Nested Other line
@exdent exdented nested other line
@end example
@end example

@quotation
@exdent exdented quotation line   and dash --- in quotation
@end quotation

@quotation
Not exdented followed by exdented
@exdent  exdented quotation line
@end quotation

@quotation
@exdent  exdented quotation line
Followed by not exdented 
@end quotation

@quotation
@exdent exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az
@exdent azeaz az az az az
@end quotation

@quotation
@exdent exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line
@exdent az az az az
@end quotation

@quotation
quotation line oidfjslsd aez a aze azaz aeae za eaz az zelef  aaa
@exdent ezkfjklezf 
@end quotation

@quotation
@exdent very loooooooooooooooooooooooooooooooooong exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line
@exdent az az az az
@end quotation
';


$result_texts{'exdent_and_formats'} = ' Example   Hoho. TeX . 
 @.

Other line
not exdented


exdented  and dash --- in example
Not exdented
exdented
Not exdented

Para1.

qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q

Para2.

Para3.

Last para.

quotation1
quotation2

quotation para 1

quotation para 2

Example   Hoho.
Nested Other line
exdented nested other line

exdented quotation line   and dash -- in quotation

Not exdented followed by exdented
exdented quotation line

exdented quotation line
Followed by not exdented 

exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az
azeaz az az az az

exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line
az az az az

quotation line oidfjslsd aez a aze azaz aeae za eaz az zelef  aaa
ezkfjklezf

very loooooooooooooooooooooooooooooooooong exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line
az az az az
';

$result_errors{'exdent_and_formats'} = '';

$result_nodes_list{'exdent_and_formats'} = '';

$result_sections_list{'exdent_and_formats'} = '';

$result_sectioning_root{'exdent_and_formats'} = '';

$result_headings_list{'exdent_and_formats'} = '';


$result_converted{'plaintext'}->{'exdent_and_formats'} = '      Example   Hoho. TeX .
      @.

Other line
     not exdented

exdented  and dash --- in example
     Not exdented
exdented
     Not exdented

   Para1.

     qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd
     sdq sdq qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq
     sdqsd q

   Para2.

   Para3.

   Last para.

     quotation1 quotation2

     quotation para 1

     quotation para 2

     Example   Hoho.
          Nested Other line
     exdented nested other line

exdented quotation line and dash -- in quotation

     Not exdented followed by exdented
exdented quotation line

exdented quotation line
     Followed by not exdented

exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az
azeaz az az az az

exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line
az az az az

     quotation line oidfjslsd aez a aze azaz aeae za eaz az zelef aaa
ezkfjklezf

very loooooooooooooooooooooooooooooooooong exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line
az az az az
';


$result_converted{'html_text'}->{'exdent_and_formats'} = '<div class="example">
<pre class="example-preformatted"> Example   Hoho. TeX . 
 @.

</pre><pre class="exdent">Other line
</pre><pre class="example-preformatted">not exdented
</pre></div>


<div class="example">
<pre class="exdent">exdented  and dash --- in example
</pre><pre class="example-preformatted">Not exdented
</pre><pre class="exdent">exdented
</pre><pre class="example-preformatted">Not exdented
</pre></div>

<p>Para1.
</p>
<blockquote class="quotation">
<p>qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q
</p></blockquote>

<p>Para2.
</p>
<p>Para3.
</p>
<p>Last para.
</p>
<blockquote class="quotation">
<p>quotation1
quotation2
</p></blockquote>

<blockquote class="quotation">
<p>quotation para 1
</p>
<p>quotation para 2
</p></blockquote>

<div class="example">
<pre class="example-preformatted">Example   Hoho.
</pre><div class="example">
<pre class="example-preformatted">Nested Other line
</pre><pre class="exdent">exdented nested other line
</pre></div>
</div>

<blockquote class="quotation">
<p class="exdent">exdented quotation line   and dash &mdash; in quotation
</p></blockquote>

<blockquote class="quotation">
<p>Not exdented followed by exdented
</p><p class="exdent">exdented quotation line
</p></blockquote>

<blockquote class="quotation">
<p class="exdent">exdented quotation line
</p><p>Followed by not exdented 
</p></blockquote>

<blockquote class="quotation">
<p class="exdent">exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az
</p><p class="exdent">azeaz az az az az
</p></blockquote>

<blockquote class="quotation">
<p class="exdent">exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line
</p><p class="exdent">az az az az
</p></blockquote>

<blockquote class="quotation">
<p>quotation line oidfjslsd aez a aze azaz aeae za eaz az zelef  aaa
</p><p class="exdent">ezkfjklezf
</p></blockquote>

<blockquote class="quotation">
<p class="exdent">very loooooooooooooooooooooooooooooooooong exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line
</p><p class="exdent">az az az az
</p></blockquote>
';


$result_converted{'xml'}->{'exdent_and_formats'} = '<example endspaces=" ">
<pre xml:space="preserve"> Example   Hoho. &tex; . &linebreak; &arobase;.

</pre><exdent> Other line</exdent>
<pre xml:space="preserve">not exdented
</pre></example>


<example endspaces=" ">
<exdent> exdented  and dash --- in example</exdent>
<pre xml:space="preserve">Not exdented
</pre><exdent> exdented</exdent>
<pre xml:space="preserve">Not exdented
</pre></example>

<para>Para1.
</para>
<quotation endspaces=" ">
<para>qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q
</para></quotation>

<para>Para2.
</para>
<para>Para3.
</para>
<para>Last para.
</para>
<quotation endspaces=" ">
<para>quotation1
quotation2
</para></quotation>

<quotation endspaces=" ">
<para>quotation para 1
</para>
<para>quotation para 2
</para></quotation>

<example endspaces=" ">
<pre xml:space="preserve">Example   Hoho.
</pre><example endspaces=" ">
<pre xml:space="preserve">Nested Other line
</pre><exdent> exdented nested other line</exdent>
</example>
</example>

<quotation endspaces=" ">
<exdent> exdented quotation line   and dash &textmdash; in quotation</exdent>
</quotation>

<quotation endspaces=" ">
<para>Not exdented followed by exdented
</para><exdent>  exdented quotation line</exdent>
</quotation>

<quotation endspaces=" ">
<exdent>  exdented quotation line</exdent>
<para>Followed by not exdented 
</para></quotation>

<quotation endspaces=" ">
<exdent> exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az</exdent>
<exdent> azeaz az az az az</exdent>
</quotation>

<quotation endspaces=" ">
<exdent> exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line</exdent>
<exdent> az az az az</exdent>
</quotation>

<quotation endspaces=" ">
<para>quotation line oidfjslsd aez a aze azaz aeae za eaz az zelef  aaa
</para><exdent> ezkfjklezf </exdent>
</quotation>

<quotation endspaces=" ">
<exdent> very loooooooooooooooooooooooooooooooooong exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line</exdent>
<exdent> az az az az</exdent>
</quotation>
';


$result_converted{'latex_text'}->{'exdent_and_formats'} = '\\begin{document}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\ Example   Hoho.\\ \\TeX{}\\ .\\ \\leavevmode{}\\\\\\ @.

\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
Other line
\\\\
\\begin{Texinfopreformatted}%
\\ttfamily not exdented
\\end{Texinfopreformatted}
\\end{Texinfoindented}


\\begin{Texinfoindented}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented  and dash --- in example
\\\\
\\begin{Texinfopreformatted}%
\\ttfamily Not exdented
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented
\\\\
\\begin{Texinfopreformatted}%
\\ttfamily Not exdented
\\end{Texinfopreformatted}
\\end{Texinfoindented}

Para1.

\\begin{quote}
qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q
\\end{quote}

Para2.

Para3.

Last para.

\\begin{quote}
quotation1
quotation2
\\end{quote}

\\begin{quote}
quotation para 1

quotation para 2
\\end{quote}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily Example   Hoho.
\\end{Texinfopreformatted}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily Nested Other line
\\end{Texinfopreformatted}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented nested other line
\\\\
\\end{Texinfoindented}
\\end{Texinfoindented}

\\begin{quote}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented quotation line   and dash --- in quotation
\\\\
\\end{quote}

\\begin{quote}
Not exdented followed by exdented
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented quotation line
\\\\
\\end{quote}

\\begin{quote}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented quotation line
\\\\
Followed by not exdented 
\\end{quote}

\\begin{quote}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az
\\\\
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
azeaz az az az az
\\\\
\\end{quote}

\\begin{quote}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line
\\\\
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
az az az az
\\\\
\\end{quote}

\\begin{quote}
quotation line oidfjslsd aez a aze azaz aeae za eaz az zelef  aaa
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
ezkfjklezf
\\\\
\\end{quote}

\\begin{quote}
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
very loooooooooooooooooooooooooooooooooong exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line
\\\\
\\leavevmode{}\\\\
\\hbox{\\kern -\\leftmargin}%
az az az az
\\\\
\\end{quote}
';


$result_converted{'docbook'}->{'exdent_and_formats'} = '<screen> Example   Hoho. &tex; . 
 @.

</screen><simpara role="exdent">Other line</simpara>
<screen>not exdented
</screen>

<simpara role="exdent">exdented  and dash --- in example</simpara>
<screen>Not exdented
</screen><simpara role="exdent">exdented</simpara>
<screen>Not exdented
</screen>
<para>Para1.
</para>
<blockquote><para>qsddsqkdsqkkmljsqjsqodmmdsqdsmqj dqs sdq sqd sdq dsq sdq sqd sqd sdq sdq 
qsd dsq sdq dsq dssdq sdq sdq sdq dsq sdq dsq dsq sdq dsq sdqsd q
</para></blockquote>
<para>Para2.
</para>
<para>Para3.
</para>
<para>Last para.
</para>
<blockquote><para>quotation1
quotation2
</para></blockquote>
<blockquote><para>quotation para 1
</para>
<para>quotation para 2
</para></blockquote>
<screen>Example   Hoho.
</screen><screen>Nested Other line
</screen><simpara role="exdent">exdented nested other line</simpara>

<blockquote><simpara role="exdent">exdented quotation line   and dash &#8212; in quotation</simpara>
</blockquote>
<blockquote><para>Not exdented followed by exdented
</para><simpara role="exdent">exdented quotation line</simpara>
</blockquote>
<blockquote><simpara role="exdent">exdented quotation line</simpara>
<para>Followed by not exdented 
</para></blockquote>
<blockquote><simpara role="exdent">exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az</simpara>
<simpara role="exdent">azeaz az az az az</simpara>
</blockquote>
<blockquote><simpara role="exdent">exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line</simpara>
<simpara role="exdent">az az az az</simpara>
</blockquote>
<blockquote><para>quotation line oidfjslsd aez a aze azaz aeae za eaz az zelef  aaa
</para><simpara role="exdent">ezkfjklezf</simpara>
</blockquote>
<blockquote><simpara role="exdent">very loooooooooooooooooooooooooooooooooong exdented quotation line oidfjslsd aez a aze azaz aeae za eaz az azeaz end line</simpara>
<simpara role="exdent">az az az az</simpara>
</blockquote>';

1;
