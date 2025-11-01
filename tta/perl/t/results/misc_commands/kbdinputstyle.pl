use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'kbdinputstyle'} = '*document_root C1
 *before_node_section C28
  *@macro C14 l1
  |EXTRA
  |macro_name:{codekbdmacro}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: codekbdmacro\\n}
   {raw:@code{in code out of example @code{in nested code}}.\\n}
   {raw:@kbd{kbd out of example}.\\n}
   {raw:@code{kbd @kbd{in code}}.\\n}
   {raw:@code{for nesting @r{r in code @kbd{in r in code}}}\\n}
   {raw:\\n}
   {raw:in example\\n}
   {raw:@example\\n}
   {raw:@code{in code in example @code{in nested code}}.\\n}
   {raw:@kbd{kbd in example}.\\n}
   {raw:@code{kbd @kbd{in code} in example}.\\n}
   {raw:@code{for nesting in example @r{r in code in example @kbd{in r in code in example}}}\\n}
   {raw:@end example\\n}
   *@end C1 l14
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *paragraph C2
   *@@
   {kbdinputstyle code\\n}
  {empty_line:\\n}
  *@kbdinputstyle C1 l18
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{code}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {code}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@codekbdmacro C1
    >*brace_arg
  *paragraph C8
   *@code C1 l20:@codekbdmacro
    *brace_container C2
     {in code out of example }
     *@code C1 l20:@codekbdmacro
      *brace_container C1
       {in nested code}
   {.\\n}
   *@kbd C1 l20:@codekbdmacro
   |EXTRA
   |code:{1}
    *brace_container C1
     {kbd out of example}
   {.\\n}
   *@code C1 l20:@codekbdmacro
    *brace_container C2
     {kbd }
     *@kbd C1 l20:@codekbdmacro
     |EXTRA
     |code:{1}
      *brace_container C1
       {in code}
   {.\\n}
   *@code C1 l20:@codekbdmacro
    *brace_container C2
     {for nesting }
     *@r C1 l20:@codekbdmacro
      *brace_container C2
       {r in code }
       *@kbd C1 l20:@codekbdmacro
       |EXTRA
       |code:{1}
        *brace_container C1
         {in r in code}
   {\\n}
  {empty_line:\\n}
  *paragraph C1
   {in example\\n}
  *@example C3 l20:@codekbdmacro
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C8
    *@code C1 l20:@codekbdmacro
     *brace_container C2
      {in code in example }
      *@code C1 l20:@codekbdmacro
       *brace_container C1
        {in nested code}
    {.\\n}
    *@kbd C1 l20:@codekbdmacro
    |EXTRA
    |code:{1}
     *brace_container C1
      {kbd in example}
    {.\\n}
    *@code C1 l20:@codekbdmacro
     *brace_container C3
      {kbd }
      *@kbd C1 l20:@codekbdmacro
      |EXTRA
      |code:{1}
       *brace_container C1
        {in code}
      { in example}
    {.\\n}
    *@code C1 l20:@codekbdmacro
     *brace_container C2
      {for nesting in example }
      *@r C1 l20:@codekbdmacro
       *brace_container C2
        {r in code in example }
        *@kbd C1 l20:@codekbdmacro
        |EXTRA
        |code:{1}
         *brace_container C1
          {in r in code in example}
    {\\n}
   *@end C1 l20:@codekbdmacro
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
     >SOURCEMARKS
     >macro_expansion<end;1><p:7>
  {empty_line:\\n}
  *paragraph C2
   *@@
   {kbdinputstyle example\\n}
  {empty_line:\\n}
  *@kbdinputstyle C1 l24
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{example}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {example}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;2><p:1>
   >*macro_call@codekbdmacro C1
    >*brace_arg
  *paragraph C8
   *@code C1 l26:@codekbdmacro
    *brace_container C2
     {in code out of example }
     *@code C1 l26:@codekbdmacro
      *brace_container C1
       {in nested code}
   {.\\n}
   *@kbd C1 l26:@codekbdmacro
   |EXTRA
   |code:{1}
    *brace_container C1
     {kbd out of example}
   {.\\n}
   *@code C1 l26:@codekbdmacro
    *brace_container C2
     {kbd }
     *@kbd C1 l26:@codekbdmacro
     |EXTRA
     |code:{1}
      *brace_container C1
       {in code}
   {.\\n}
   *@code C1 l26:@codekbdmacro
    *brace_container C2
     {for nesting }
     *@r C1 l26:@codekbdmacro
      *brace_container C2
       {r in code }
       *@kbd C1 l26:@codekbdmacro
       |EXTRA
       |code:{1}
        *brace_container C1
         {in r in code}
   {\\n}
  {empty_line:\\n}
  *paragraph C1
   {in example\\n}
  *@example C3 l26:@codekbdmacro
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C8
    *@code C1 l26:@codekbdmacro
     *brace_container C2
      {in code in example }
      *@code C1 l26:@codekbdmacro
       *brace_container C1
        {in nested code}
    {.\\n}
    *@kbd C1 l26:@codekbdmacro
     *brace_container C1
      {kbd in example}
    {.\\n}
    *@code C1 l26:@codekbdmacro
     *brace_container C3
      {kbd }
      *@kbd C1 l26:@codekbdmacro
       *brace_container C1
        {in code}
      { in example}
    {.\\n}
    *@code C1 l26:@codekbdmacro
     *brace_container C2
      {for nesting in example }
      *@r C1 l26:@codekbdmacro
       *brace_container C2
        {r in code in example }
        *@kbd C1 l26:@codekbdmacro
         *brace_container C1
          {in r in code in example}
    {\\n}
   *@end C1 l26:@codekbdmacro
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
     >SOURCEMARKS
     >macro_expansion<end;2><p:7>
  {empty_line:\\n}
  *paragraph C2
   *@@
   {kbdinputstyle distinct\\n}
  {empty_line:\\n}
  *@kbdinputstyle C1 l30
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{distinct}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {distinct}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;3><p:1>
   >*macro_call@codekbdmacro C1
    >*brace_arg
  *paragraph C8
   *@code C1 l32:@codekbdmacro
    *brace_container C2
     {in code out of example }
     *@code C1 l32:@codekbdmacro
      *brace_container C1
       {in nested code}
   {.\\n}
   *@kbd C1 l32:@codekbdmacro
    *brace_container C1
     {kbd out of example}
   {.\\n}
   *@code C1 l32:@codekbdmacro
    *brace_container C2
     {kbd }
     *@kbd C1 l32:@codekbdmacro
      *brace_container C1
       {in code}
   {.\\n}
   *@code C1 l32:@codekbdmacro
    *brace_container C2
     {for nesting }
     *@r C1 l32:@codekbdmacro
      *brace_container C2
       {r in code }
       *@kbd C1 l32:@codekbdmacro
        *brace_container C1
         {in r in code}
   {\\n}
  {empty_line:\\n}
  *paragraph C1
   {in example\\n}
  *@example C3 l32:@codekbdmacro
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C8
    *@code C1 l32:@codekbdmacro
     *brace_container C2
      {in code in example }
      *@code C1 l32:@codekbdmacro
       *brace_container C1
        {in nested code}
    {.\\n}
    *@kbd C1 l32:@codekbdmacro
     *brace_container C1
      {kbd in example}
    {.\\n}
    *@code C1 l32:@codekbdmacro
     *brace_container C3
      {kbd }
      *@kbd C1 l32:@codekbdmacro
       *brace_container C1
        {in code}
      { in example}
    {.\\n}
    *@code C1 l32:@codekbdmacro
     *brace_container C2
      {for nesting in example }
      *@r C1 l32:@codekbdmacro
       *brace_container C2
        {r in code in example }
        *@kbd C1 l32:@codekbdmacro
         *brace_container C1
          {in r in code in example}
    {\\n}
   *@end C1 l32:@codekbdmacro
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
     >SOURCEMARKS
     >macro_expansion<end;3><p:7>
';


$result_texis{'kbdinputstyle'} = '@macro codekbdmacro
@code{in code out of example @code{in nested code}}.
@kbd{kbd out of example}.
@code{kbd @kbd{in code}}.
@code{for nesting @r{r in code @kbd{in r in code}}}

in example
@example
@code{in code in example @code{in nested code}}.
@kbd{kbd in example}.
@code{kbd @kbd{in code} in example}.
@code{for nesting in example @r{r in code in example @kbd{in r in code in example}}}
@end example
@end macro

@@kbdinputstyle code

@kbdinputstyle code

@code{in code out of example @code{in nested code}}.
@kbd{kbd out of example}.
@code{kbd @kbd{in code}}.
@code{for nesting @r{r in code @kbd{in r in code}}}

in example
@example
@code{in code in example @code{in nested code}}.
@kbd{kbd in example}.
@code{kbd @kbd{in code} in example}.
@code{for nesting in example @r{r in code in example @kbd{in r in code in example}}}
@end example

@@kbdinputstyle example

@kbdinputstyle example

@code{in code out of example @code{in nested code}}.
@kbd{kbd out of example}.
@code{kbd @kbd{in code}}.
@code{for nesting @r{r in code @kbd{in r in code}}}

in example
@example
@code{in code in example @code{in nested code}}.
@kbd{kbd in example}.
@code{kbd @kbd{in code} in example}.
@code{for nesting in example @r{r in code in example @kbd{in r in code in example}}}
@end example

@@kbdinputstyle distinct

@kbdinputstyle distinct

@code{in code out of example @code{in nested code}}.
@kbd{kbd out of example}.
@code{kbd @kbd{in code}}.
@code{for nesting @r{r in code @kbd{in r in code}}}

in example
@example
@code{in code in example @code{in nested code}}.
@kbd{kbd in example}.
@code{kbd @kbd{in code} in example}.
@code{for nesting in example @r{r in code in example @kbd{in r in code in example}}}
@end example
';


$result_texts{'kbdinputstyle'} = '
@kbdinputstyle code


in code out of example in nested code.
kbd out of example.
kbd in code.
for nesting r in code in r in code

in example
in code in example in nested code.
kbd in example.
kbd in code in example.
for nesting in example r in code in example in r in code in example

@kbdinputstyle example


in code out of example in nested code.
kbd out of example.
kbd in code.
for nesting r in code in r in code

in example
in code in example in nested code.
kbd in example.
kbd in code in example.
for nesting in example r in code in example in r in code in example

@kbdinputstyle distinct


in code out of example in nested code.
kbd out of example.
kbd in code.
for nesting r in code in r in code

in example
in code in example in nested code.
kbd in example.
kbd in code in example.
for nesting in example r in code in example in r in code in example
';

$result_errors{'kbdinputstyle'} = '';

$result_nodes_list{'kbdinputstyle'} = '';

$result_sections_list{'kbdinputstyle'} = '';

$result_sectioning_root{'kbdinputstyle'} = '';

$result_headings_list{'kbdinputstyle'} = '';


$result_converted{'plaintext'}->{'kbdinputstyle'} = '@kbdinputstyle code

   ‘in code out of example in nested code’.  ‘kbd out of example’.  ‘kbd
in code’.  ‘for nesting r in code ‘in r in code’’

   in example
     in code in example in nested code.
     kbd in example.
     kbd in code in example.
     for nesting in example r in code in example ‘in r in code in example’

   @kbdinputstyle example

   ‘in code out of example in nested code’.  ‘kbd out of example’.  ‘kbd
in code’.  ‘for nesting r in code ‘in r in code’’

   in example
     in code in example in nested code.
     kbd in example.
     kbd in code in example.
     for nesting in example r in code in example ‘in r in code in example’

   @kbdinputstyle distinct

   ‘in code out of example in nested code’.  ‘kbd out of example’.  ‘kbd
in code’.  ‘for nesting r in code ‘in r in code’’

   in example
     in code in example in nested code.
     kbd in example.
     kbd in code in example.
     for nesting in example r in code in example ‘in r in code in example’
';


$result_converted{'html_text'}->{'kbdinputstyle'} = '
<p>@kbdinputstyle code
</p>

<p><code class="code">in code out of example <code class="code">in nested code</code></code>.
<code class="code as-code-kbd">kbd out of example</code>.
<code class="code">kbd <code class="code as-code-kbd">in code</code></code>.
<code class="code">for nesting <span class="r">r in code <code class="code as-code-kbd">in r in code</code></span></code>
</p>
<p>in example
</p><div class="example">
<pre class="example-preformatted"><code class="code">in code in example <code class="code">in nested code</code></code>.
<code class="code as-code-kbd">kbd in example</code>.
<code class="code">kbd <code class="code as-code-kbd">in code</code> in example</code>.
<code class="code">for nesting in example <span class="r">r in code in example <code class="code as-code-kbd">in r in code in example</code></span></code>
</pre></div>

<p>@kbdinputstyle example
</p>

<p><code class="code">in code out of example <code class="code">in nested code</code></code>.
<code class="code as-code-kbd">kbd out of example</code>.
<code class="code">kbd <code class="code as-code-kbd">in code</code></code>.
<code class="code">for nesting <span class="r">r in code <code class="code as-code-kbd">in r in code</code></span></code>
</p>
<p>in example
</p><div class="example">
<pre class="example-preformatted"><code class="code">in code in example <code class="code">in nested code</code></code>.
<kbd class="kbd">kbd in example</kbd>.
<code class="code">kbd <kbd class="kbd">in code</kbd> in example</code>.
<code class="code">for nesting in example <span class="r">r in code in example <kbd class="kbd">in r in code in example</kbd></span></code>
</pre></div>

<p>@kbdinputstyle distinct
</p>

<p><code class="code">in code out of example <code class="code">in nested code</code></code>.
<kbd class="kbd">kbd out of example</kbd>.
<code class="code">kbd <kbd class="kbd">in code</kbd></code>.
<code class="code">for nesting <span class="r">r in code <kbd class="kbd">in r in code</kbd></span></code>
</p>
<p>in example
</p><div class="example">
<pre class="example-preformatted"><code class="code">in code in example <code class="code">in nested code</code></code>.
<kbd class="kbd">kbd in example</kbd>.
<code class="code">kbd <kbd class="kbd">in code</kbd> in example</code>.
<code class="code">for nesting in example <span class="r">r in code in example <kbd class="kbd">in r in code in example</kbd></span></code>
</pre></div>
';


$result_converted{'latex'}->{'kbdinputstyle'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfosettitle}{No Title}%

% style command for kbd in \'cmd_text\' formatting context
\\newcommand\\Texinfocommandstyletextkbd[1]{{\\ttfamily\\textsl{#1}}}%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}


% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\chaptername{} \\thechapter{} \\chaptertitle{}][][\\thepage]
                              {\\chaptername{} \\thechapter{} \\chaptertitle{}}{}{\\thepage}}

% allow line breaking at underscore
\\let\\Texinfounderscore\\_
\\renewcommand{\\_}{\\Texinfounderscore\\discretionary{}{}{}}
\\renewcommand{\\includegraphics}[1]{\\fbox{FIG \\detokenize{#1}}}

\\makeatother
% set default for @setchapternewpage
\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%


@kbdinputstyle code


\\texttt{in code out of example \\texttt{in nested code}}.
\\texttt{kbd out of example}.
\\texttt{kbd \\texttt{in code}}.
\\texttt{for nesting \\textnormal{r in code \\texttt{in r in code}}}

in example
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\texttt{in code in example \\texttt{in nested code}}.
\\texttt{kbd in example}.
\\texttt{kbd \\texttt{in code}\\ in example}.
\\texttt{for nesting in example \\textnormal{r in code in example \\texttt{in r in code in example}}}
\\end{Texinfopreformatted}
\\end{Texinfoindented}

@kbdinputstyle example


\\texttt{in code out of example \\texttt{in nested code}}.
\\texttt{kbd out of example}.
\\texttt{kbd \\texttt{in code}}.
\\texttt{for nesting \\textnormal{r in code \\texttt{in r in code}}}

in example
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\texttt{in code in example \\texttt{in nested code}}.
\\Texinfocommandstyletextkbd{kbd in example}.
\\texttt{kbd \\Texinfocommandstyletextkbd{in code}\\ in example}.
\\texttt{for nesting in example \\textnormal{r in code in example \\Texinfocommandstyletextkbd{in r in code in example}}}
\\end{Texinfopreformatted}
\\end{Texinfoindented}

@kbdinputstyle distinct


\\texttt{in code out of example \\texttt{in nested code}}.
\\Texinfocommandstyletextkbd{kbd out of example}.
\\texttt{kbd \\Texinfocommandstyletextkbd{in code}}.
\\texttt{for nesting \\textnormal{r in code \\Texinfocommandstyletextkbd{in r in code}}}

in example
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\texttt{in code in example \\texttt{in nested code}}.
\\Texinfocommandstyletextkbd{kbd in example}.
\\texttt{kbd \\Texinfocommandstyletextkbd{in code}\\ in example}.
\\texttt{for nesting in example \\textnormal{r in code in example \\Texinfocommandstyletextkbd{in r in code in example}}}
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{document}
';

1;
