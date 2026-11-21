use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'complex_nestings'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
 *@chapter C3 l5 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@example C5 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {deffs\\n}
   *@defun C4 l9
    *def_line C1 l9
    |EXTRA
    |def_command:{defun}
    |element_node:{chap}
    |index_entry:I{fn,1}
    |original_def_cmdname:{defun}
     *block_line_arg C11
      (i){spaces_before_argument: }
      *def_category C1
      |EXTRA
      |inserted:{1}
       *def_line_arg C1
        {Function}
      {spaces: }
      *def_name C1
       *bracketed_arg C1 l9
        {my def}
      {spaces: }
      *def_arg C1
       *def_line_arg C1
        {args}
      {spaces: }
      *def_arg C1
       *def_line_arg C1
        *@var C1 l9
         *brace_container C1
          {arg}
      {spaces: }
      *def_arg C1
       *def_line_arg C1
        *@dots C1 l9
         *brace_container
      {spaces_after_argument:\\n}
    *@defunx C1 l10
    |EXTRA
    |def_command:{defun}
    |element_node:{chap}
    |index_entry:I{fn,2}
    |original_def_cmdname:{defunx}
     *line_arg C9
      (i){spaces_before_argument: }
      *def_category C1
      |EXTRA
      |inserted:{1}
       *def_line_arg C1
        {Function}
      {spaces: }
      *def_name C1
       *bracketed_arg C1 l10
        {other def}
      {spaces: }
      *def_arg C1
       *def_line_arg C1
        {no}
      {spaces: }
      *def_arg C1
       *def_line_arg C1
        {args}
      {spaces_after_argument:\\n}
    *def_item C1
     *@deffn C3 l11
      *def_line C1 l11
      |EXTRA
      |def_command:{deffn}
      |element_node:{chap}
      |index_entry:I{fn,3}
      |original_def_cmdname:{deffn}
       *block_line_arg C13
        {spaces_before_argument: }
        *def_category C1
         *bracketed_arg C1 l11
          {type}
        {spaces: }
        *def_name C1
         *bracketed_arg C1 l11
          {name}
        {spaces: }
        *def_arg C1
         *def_line_arg C1
          {and}
        {spaces: }
        *def_arg C1
         *def_line_arg C1
          {now}
        {spaces: }
        *def_arg C1
         *def_line_arg C1
          {the}
        {spaces: }
        *def_arg C1
         *def_line_arg C1
          {args}
        {spaces_after_argument:\\n}
      *def_item C1
       *@defvar C5 l12
        *def_line C1 l12
        |EXTRA
        |def_command:{defvar}
        |element_node:{chap}
        |index_entry:I{vr,1}
        |original_def_cmdname:{defvar}
         *block_line_arg C7
          (i){spaces_before_argument: }
          *def_category C1
          |EXTRA
          |inserted:{1}
           *def_line_arg C1
            {Variable}
          {spaces: }
          *def_name C1
           *bracketed_arg C1 l12
            {variables}
          {spaces: }
          *def_arg C1
           *def_line_arg C1
            {variable-name}
          {spaces_after_argument:\\n}
        *inter_def_item C1
         *preformatted C1
          {empty_line:\\n}
        *@defvarx C1 l14
        |EXTRA
        |def_command:{defvar}
        |element_node:{chap}
        |index_entry:I{vr,2}
        |original_def_cmdname:{defvarx}
         *line_arg C7
          (i){spaces_before_argument: }
          *def_category C1
          |EXTRA
          |inserted:{1}
           *def_line_arg C1
            {Variable}
          {spaces: }
          *def_name C1
           *bracketed_arg C1 l14
            {variables too}
          {spaces: }
          *def_arg C1
           *def_line_arg C1
            {other-variable}
          {spaces_after_argument:\\n}
        *def_item C3
         *preformatted C3
          {THis is the defvar\\n}
          {empty_line:\\n}
          {A table within the def\\n}
         *@table C4 l18
          *arguments_line C1
           *block_line_arg C3
            {spaces_before_argument: }
            *@asis l18
            {spaces_after_argument:\\n}
          *table_entry C2
           *table_term C1
            *@item C1 l19
             *line_arg C3
              {spaces_before_argument: }
              {item}
              {spaces_after_argument:\\n}
           *table_definition C1
            *preformatted C3
             {text\\n}
             {empty_line:\\n}
             {more text\\n}
          *table_entry C1
           *table_term C1
            *@item C1 l23
             *line_arg C3
              {spaces_before_argument: }
              {second item}
              {spaces_after_argument:\\n}
          *@end C1 l24
          |EXTRA
          |text_arg:{table}
           *line_arg C3
            {spaces_before_argument: }
            {table}
            {spaces_after_argument:\\n}
         *preformatted C2
          {empty_line:\\n}
          {explanation\\n}
        *@end C1 l27
        |EXTRA
        |text_arg:{defvar}
         *line_arg C3
          {spaces_before_argument: }
          {defvar}
          {spaces_after_argument:\\n}
      *@end C1 l28
      |EXTRA
      |text_arg:{deffn}
       *line_arg C3
        {spaces_before_argument: }
        {deffn}
        {spaces_after_argument:\\n}
    *@end C1 l29
    |EXTRA
    |text_arg:{defun}
     *line_arg C3
      {spaces_before_argument: }
      {defun}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *@end C1 l31
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
';


$result_texis{'complex_nestings'} = '@node Top
@top top

@node chap
@chapter Chapter

@example
deffs
@defun {my def} args @var{arg} @dots{}
@defunx {other def} no args
@deffn {type} {name} and now the args
@defvar {variables} variable-name

@defvarx {variables too} other-variable
THis is the defvar

A table within the def
@table @asis
@item item
text

more text
@item second item
@end table

explanation
@end defvar
@end deffn
@end defun

@end example
';


$result_texts{'complex_nestings'} = 'top
***

1 Chapter
*********

deffs
Function: my def args arg ...
Function: other def no args
type: name and now the args
Variable: variables variable-name

Variable: variables too other-variable
THis is the defvar

A table within the def
item
text

more text
second item

explanation

';

$result_errors{'complex_nestings'} = '';

$result_nodes_list{'complex_nestings'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'complex_nestings'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'complex_nestings'} = 'level: -1
list:
 1|top
';

$result_headings_list{'complex_nestings'} = '';

$result_indices_sort_strings{'complex_nestings'} = 'fn:
 my def
 name
 other def
vr:
 variables
 variables too
';


$result_converted{'plaintext'}->{'complex_nestings'} = 'top
***

1 Chapter
*********

     deffs
      -- Function: my def args ARG ...
      -- Function: other def no args
           -- type: name and now the args
                -- Variable: variables variable-name

                -- Variable: variables too other-variable
                    THis is the defvar

                    A table within the def
                    item
                         text

                         more text
                    second item

                    explanation

';

$result_converted_sort_strings{'plaintext'}->{'complex_nestings'} = 'fn:
 my def
 name
 other def
vr:
 variables
 variables too
';


$result_converted{'html_text'}->{'complex_nestings'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<div class="example">
<pre class="example-preformatted">deffs
</pre><dl class="first-deffn first-defun-alias-first-deffn def-block">
<dt class="deffn defun-alias-deffn def-line" id="index-my-def"><span class="category-def">Function: </span><span><strong class="def-name">my def</strong> <var class="def-var-arguments">args <var class="var">arg</var> ...</var><a class="copiable-link" href="#index-my-def"> &para;</a></span></dt>
<dt class="deffnx defunx-alias-deffnx def-cmd-deffn def-line" id="index-other-def"><span class="category-def">Function: </span><span><strong class="def-name">other def</strong> <var class="def-var-arguments">no args</var><a class="copiable-link" href="#index-other-def"> &para;</a></span></dt>
<dd><dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-name"><span class="category-def">type: </span><span><strong class="def-name">name</strong> <var class="def-var-arguments">and now the args</var><a class="copiable-link" href="#index-name"> &para;</a></span></dt>
<dd><dl class="first-defvr first-defvar-alias-first-defvr def-block">
<dt class="defvr defvar-alias-defvr def-line" id="index-variables"><span class="category-def">Variable: </span><span><strong class="def-name">variables</strong> <var class="def-var-arguments">variable-name</var><a class="copiable-link" href="#index-variables"> &para;</a></span></dt>
<dd><pre class="example-preformatted">

</pre></dd><dt class="defvrx defvarx-alias-defvrx def-cmd-defvr def-line" id="index-variables-too"><span class="category-def">Variable: </span><span><strong class="def-name">variables too</strong> <var class="def-var-arguments">other-variable</var><a class="copiable-link" href="#index-variables-too"> &para;</a></span></dt>
<dd><pre class="example-preformatted">THis is the defvar

A table within the def
</pre><dl class="table">
<dt><code class="table-term-preformatted-code">item</code></dt>
<dd><pre class="example-preformatted">text

more text
</pre></dd>
<dt><code class="table-term-preformatted-code">second item</code></dt>
</dl>
<pre class="example-preformatted">

explanation
</pre></dd></dl>
</dd></dl>
</dd></dl>
<pre class="example-preformatted">

</pre></div>
</div>
</div>
';


$result_converted{'xml'}->{'complex_nestings'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chapter</sectiontitle>

<example endspaces=" ">
<pre xml:space="preserve">deffs
</pre><defun endspaces=" "><definitionterm><indexterm index="fn" number="1">my def</indexterm> <defcategory automatic="on">Function</defcategory> <deffunction bracketed="on">my def</deffunction> <defparam>args</defparam> <defparam><var>arg</var></defparam> <defparam>&dots;</defparam></definitionterm>
<defunx><definitionterm><indexterm index="fn" number="2">other def</indexterm> <defcategory automatic="on">Function</defcategory> <deffunction bracketed="on">other def</deffunction> <defparam>no</defparam> <defparam>args</defparam></definitionterm></defunx>
<definitionitem><deffn endspaces=" "><definitionterm><indexterm index="fn" number="3">name</indexterm> <defcategory bracketed="on">type</defcategory> <deffunction bracketed="on">name</deffunction> <defparam>and</defparam> <defparam>now</defparam> <defparam>the</defparam> <defparam>args</defparam></definitionterm>
<definitionitem><defvar endspaces=" "><definitionterm><indexterm index="vr" number="1">variables</indexterm> <defcategory automatic="on">Variable</defcategory> <defvariable bracketed="on">variables</defvariable> <defparam>variable-name</defparam></definitionterm>
<pre xml:space="preserve">
</pre><defvarx><definitionterm><indexterm index="vr" number="2">variables too</indexterm> <defcategory automatic="on">Variable</defcategory> <defvariable bracketed="on">variables too</defvariable> <defparam>other-variable</defparam></definitionterm></defvarx>
<definitionitem><pre xml:space="preserve">THis is the defvar

A table within the def
</pre><table commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"> item</itemformat></item>
</tableterm><tableitem><pre xml:space="preserve">text

more text
</pre></tableitem></tableentry><tableentry><tableterm><item><itemformat command="asis"> second item</itemformat></item>
</tableterm></tableentry></table>
<pre xml:space="preserve">
explanation
</pre></definitionitem></defvar>
</definitionitem></deffn>
</definitionitem></defun>
<pre xml:space="preserve">
</pre></example>
</chapter>
';


$result_converted{'docbook'}->{'complex_nestings'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<screen>deffs
</screen><synopsis><indexterm role="fn"><primary>my def</primary></indexterm><phrase role="category"><emphasis role="bold">Function</emphasis>:</phrase> <function>my def</function> <emphasis role="arg">args</emphasis> <emphasis role="arg"><replaceable>arg</replaceable></emphasis> <emphasis role="arg">&#8230;</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>other def</primary></indexterm><phrase role="category"><emphasis role="bold">Function</emphasis>:</phrase> <function>other def</function> <emphasis role="arg">no</emphasis> <emphasis role="arg">args</emphasis></synopsis>
<blockquote><synopsis><indexterm role="fn"><primary>name</primary></indexterm><phrase role="category"><emphasis role="bold">type</emphasis>:</phrase> <function>name</function> <emphasis role="arg">and</emphasis> <emphasis role="arg">now</emphasis> <emphasis role="arg">the</emphasis> <emphasis role="arg">args</emphasis></synopsis>
<blockquote><synopsis><indexterm role="vr"><primary>variables</primary></indexterm><phrase role="category"><emphasis role="bold">Variable</emphasis>:</phrase> <varname>variables</varname> <emphasis role="arg">variable-name</emphasis></synopsis>
<screen>
</screen><synopsis><indexterm role="vr"><primary>variables too</primary></indexterm><phrase role="category"><emphasis role="bold">Variable</emphasis>:</phrase> <varname>variables too</varname> <emphasis role="arg">other-variable</emphasis></synopsis>
<blockquote><screen>THis is the defvar

A table within the def
</screen><variablelist><varlistentry><term>item
</term><listitem><screen>text

more text
</screen></listitem></varlistentry><varlistentry><term>second item
</term></varlistentry></variablelist><screen>
explanation
</screen></blockquote></blockquote></blockquote><screen>
</screen></chapter>
';


$result_converted{'latex_text'}->{'complex_nestings'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chap}%

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily deffs
\\end{Texinfopreformatted}

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{my def \\EmbracOn{}\\textnormal{\\textsl{args \\Texinfocommandstyletextvar{arg} \\dots{}\\@}}\\EmbracOff{}}& [Function]
\\end{tabularx}

\\index[fn]{my def@\\texttt{my def}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{other def \\EmbracOn{}\\textnormal{\\textsl{no args}}\\EmbracOff{}}& [Function]
\\end{tabularx}

\\index[fn]{other def@\\texttt{other def}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{name \\EmbracOn{}\\textnormal{\\textsl{and now the args}}\\EmbracOff{}}& [type]
\\end{tabularx}

\\index[fn]{name@\\texttt{name}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{variables \\EmbracOn{}\\textnormal{\\textsl{variable-name}}\\EmbracOff{}}& [Variable]
\\end{tabularx}

\\index[vr]{variables@\\texttt{variables}}%
\\begin{Texinfopreformatted}%
\\ttfamily 
\\end{Texinfopreformatted}

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{variables too \\EmbracOn{}\\textnormal{\\textsl{other-variable}}\\EmbracOff{}}& [Variable]
\\end{tabularx}

\\index[vr]{variables too@\\texttt{variables too}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
\\begin{Texinfopreformatted}%
\\ttfamily THis is the defvar

A table within the def
\\end{Texinfopreformatted}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
item}}]
\\begin{Texinfopreformatted}%
\\ttfamily text

more text
\\end{Texinfopreformatted}
\\item[{\\parbox[b]{\\linewidth}{%
second item}}]
\\end{description}
\\begin{Texinfopreformatted}%
\\ttfamily 
explanation
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{Texinfoindented}
\\end{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily 
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
