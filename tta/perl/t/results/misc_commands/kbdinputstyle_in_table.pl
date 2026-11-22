use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'kbdinputstyle_in_table'} = '*document_root C1
 *before_node_section C33
  *preamble_before_content C2
   *@macro C19 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{codekbdmacro}
    *arguments_line C1
     {macro_line: codekbdmacro\\n}
    {raw:@table @kbd\\n}
    {raw:@item i--tem out of example\\n}
    {raw:@end table\\n}
    {raw:\\n}
    {raw:@table @kbd{}\\n}
    {raw:@item braced i--tem out of example\\n}
    {raw:@end table\\n}
    {raw:\\n}
    {raw:in example\\n}
    {raw:@example\\n}
    {raw:@table @kbd\\n}
    {raw:@item i--tem in example\\n}
    {raw:@end table\\n}
    {raw:@table @kbd{}\\n}
    {raw:@item braced i--tem in example\\n}
    {raw:@end table\\n}
    {raw:@end example\\n}
    *@end C1 l19
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *@@
   {normal_text:kbdinputstyle code\\n}
  {empty_line:\\n}
  *@kbdinputstyle C1 l23
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{code}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:code}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@codekbdmacro C1
    >*brace_arg
  *@table C3 l25:@codekbdmacro
  |EXTRA
  |command_as_argument_kbd_code:{1}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@kbd l25:@codekbdmacro
     |EXTRA
     |code:{1}
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l25:@codekbdmacro
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:i--tem out of example}
       {spaces_after_argument:\\n}
   *@end C1 l25:@codekbdmacro
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C3 l25:@codekbdmacro
  |EXTRA
  |command_as_argument_kbd_code:{1}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@kbd C1 l25:@codekbdmacro
     |EXTRA
     |code:{1}
      *brace_container
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l25:@codekbdmacro
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:braced i--tem out of example}
       {spaces_after_argument:\\n}
   *@end C1 l25:@codekbdmacro
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in example\\n}
  *@example C4 l25:@codekbdmacro
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@table C3 l25:@codekbdmacro
   |EXTRA
   |command_as_argument_kbd_code:{1}
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *@kbd l25:@codekbdmacro
      |EXTRA
      |code:{1}
      {spaces_after_argument:\\n}
    *table_entry C1
     *table_term C1
      *@item C1 l25:@codekbdmacro
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:i--tem in example}
        {spaces_after_argument:\\n}
    *@end C1 l25:@codekbdmacro
    |EXTRA
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      {spaces_after_argument:\\n}
   *@table C3 l25:@codekbdmacro
   |EXTRA
   |command_as_argument_kbd_code:{1}
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *@kbd C1 l25:@codekbdmacro
      |EXTRA
      |code:{1}
       *brace_container
      {spaces_after_argument:\\n}
    *table_entry C1
     *table_term C1
      *@item C1 l25:@codekbdmacro
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:braced i--tem in example}
        {spaces_after_argument:\\n}
    *@end C1 l25:@codekbdmacro
    |EXTRA
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      {spaces_after_argument:\\n}
   *@end C1 l25:@codekbdmacro
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     >SOURCEMARKS
     >macro_expansion<end;1><p:7>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@@
   {normal_text:kbdinputstyle example\\n}
  {empty_line:\\n}
  *@kbdinputstyle C1 l29
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{example}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:example}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;2><p:1>
   >*macro_call@codekbdmacro C1
    >*brace_arg
  *@table C3 l31:@codekbdmacro
  |EXTRA
  |command_as_argument_kbd_code:{1}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@kbd l31:@codekbdmacro
     |EXTRA
     |code:{1}
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l31:@codekbdmacro
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:i--tem out of example}
       {spaces_after_argument:\\n}
   *@end C1 l31:@codekbdmacro
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C3 l31:@codekbdmacro
  |EXTRA
  |command_as_argument_kbd_code:{1}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@kbd C1 l31:@codekbdmacro
     |EXTRA
     |code:{1}
      *brace_container
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l31:@codekbdmacro
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:braced i--tem out of example}
       {spaces_after_argument:\\n}
   *@end C1 l31:@codekbdmacro
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in example\\n}
  *@example C4 l31:@codekbdmacro
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@table C3 l31:@codekbdmacro
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *@kbd l31:@codekbdmacro
      {spaces_after_argument:\\n}
    *table_entry C1
     *table_term C1
      *@item C1 l31:@codekbdmacro
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:i--tem in example}
        {spaces_after_argument:\\n}
    *@end C1 l31:@codekbdmacro
    |EXTRA
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      {spaces_after_argument:\\n}
   *@table C3 l31:@codekbdmacro
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *@kbd C1 l31:@codekbdmacro
       *brace_container
      {spaces_after_argument:\\n}
    *table_entry C1
     *table_term C1
      *@item C1 l31:@codekbdmacro
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:braced i--tem in example}
        {spaces_after_argument:\\n}
    *@end C1 l31:@codekbdmacro
    |EXTRA
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      {spaces_after_argument:\\n}
   *@end C1 l31:@codekbdmacro
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     >SOURCEMARKS
     >macro_expansion<end;2><p:7>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@@
   {normal_text:kbdinputstyle distinct\\n}
  {empty_line:\\n}
  *@kbdinputstyle C1 l35
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{distinct}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:distinct}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;3><p:1>
   >*macro_call@codekbdmacro C1
    >*brace_arg
  *@table C3 l37:@codekbdmacro
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@kbd l37:@codekbdmacro
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l37:@codekbdmacro
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:i--tem out of example}
       {spaces_after_argument:\\n}
   *@end C1 l37:@codekbdmacro
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C3 l37:@codekbdmacro
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@kbd C1 l37:@codekbdmacro
      *brace_container
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l37:@codekbdmacro
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:braced i--tem out of example}
       {spaces_after_argument:\\n}
   *@end C1 l37:@codekbdmacro
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in example\\n}
  *@example C4 l37:@codekbdmacro
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@table C3 l37:@codekbdmacro
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *@kbd l37:@codekbdmacro
      {spaces_after_argument:\\n}
    *table_entry C1
     *table_term C1
      *@item C1 l37:@codekbdmacro
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:i--tem in example}
        {spaces_after_argument:\\n}
    *@end C1 l37:@codekbdmacro
    |EXTRA
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      {spaces_after_argument:\\n}
   *@table C3 l37:@codekbdmacro
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *@kbd C1 l37:@codekbdmacro
       *brace_container
      {spaces_after_argument:\\n}
    *table_entry C1
     *table_term C1
      *@item C1 l37:@codekbdmacro
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:braced i--tem in example}
        {spaces_after_argument:\\n}
    *@end C1 l37:@codekbdmacro
    |EXTRA
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      {spaces_after_argument:\\n}
   *@end C1 l37:@codekbdmacro
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     >SOURCEMARKS
     >macro_expansion<end;3><p:7>
     {spaces_after_argument:\\n}
';


$result_texis{'kbdinputstyle_in_table'} = '@macro codekbdmacro
@table @kbd
@item i--tem out of example
@end table

@table @kbd{}
@item braced i--tem out of example
@end table

in example
@example
@table @kbd
@item i--tem in example
@end table
@table @kbd{}
@item braced i--tem in example
@end table
@end example
@end macro

@@kbdinputstyle code

@kbdinputstyle code

@table @kbd
@item i--tem out of example
@end table

@table @kbd{}
@item braced i--tem out of example
@end table

in example
@example
@table @kbd
@item i--tem in example
@end table
@table @kbd{}
@item braced i--tem in example
@end table
@end example

@@kbdinputstyle example

@kbdinputstyle example

@table @kbd
@item i--tem out of example
@end table

@table @kbd{}
@item braced i--tem out of example
@end table

in example
@example
@table @kbd
@item i--tem in example
@end table
@table @kbd{}
@item braced i--tem in example
@end table
@end example

@@kbdinputstyle distinct

@kbdinputstyle distinct

@table @kbd
@item i--tem out of example
@end table

@table @kbd{}
@item braced i--tem out of example
@end table

in example
@example
@table @kbd
@item i--tem in example
@end table
@table @kbd{}
@item braced i--tem in example
@end table
@end example
';


$result_texts{'kbdinputstyle_in_table'} = '
@kbdinputstyle code


i-tem out of example

braced i-tem out of example

in example
i--tem in example
braced i--tem in example

@kbdinputstyle example


i-tem out of example

braced i-tem out of example

in example
i--tem in example
braced i--tem in example

@kbdinputstyle distinct


i-tem out of example

braced i-tem out of example

in example
i--tem in example
braced i--tem in example
';

$result_errors{'kbdinputstyle_in_table'} = '';

$result_nodes_list{'kbdinputstyle_in_table'} = '';

$result_sections_list{'kbdinputstyle_in_table'} = '';

$result_sectioning_root{'kbdinputstyle_in_table'} = '';

$result_headings_list{'kbdinputstyle_in_table'} = '';


$result_converted{'plaintext'}->{'kbdinputstyle_in_table'} = '@kbdinputstyle code

‘i--tem out of example’

‘braced i--tem out of example’

   in example
     ‘i--tem in example’
     ‘braced i--tem in example’

   @kbdinputstyle example

‘i--tem out of example’

‘braced i--tem out of example’

   in example
     ‘i--tem in example’
     ‘braced i--tem in example’

   @kbdinputstyle distinct

‘i--tem out of example’

‘braced i--tem out of example’

   in example
     ‘i--tem in example’
     ‘braced i--tem in example’
';


$result_converted{'html_text'}->{'kbdinputstyle_in_table'} = '
<p>@kbdinputstyle code
</p>

<dl class="table">
<dt><code class="code as-code-kbd">i--tem out of example</code></dt>
</dl>

<dl class="table">
<dt><code class="code as-code-kbd">braced i--tem out of example</code></dt>
</dl>

<p>in example
</p><div class="example">
<dl class="table">
<dt><code class="table-term-preformatted-code"><code class="code as-code-kbd">i--tem in example</code></code></dt>
</dl>
<dl class="table">
<dt><code class="table-term-preformatted-code"><code class="code as-code-kbd">braced i--tem in example</code></code></dt>
</dl>
</div>

<p>@kbdinputstyle example
</p>

<dl class="table">
<dt><code class="code as-code-kbd">i--tem out of example</code></dt>
</dl>

<dl class="table">
<dt><code class="code as-code-kbd">braced i--tem out of example</code></dt>
</dl>

<p>in example
</p><div class="example">
<dl class="table">
<dt><code class="table-term-preformatted-code"><kbd class="kbd">i--tem in example</kbd></code></dt>
</dl>
<dl class="table">
<dt><code class="table-term-preformatted-code"><kbd class="kbd">braced i--tem in example</kbd></code></dt>
</dl>
</div>

<p>@kbdinputstyle distinct
</p>

<dl class="table">
<dt><kbd class="kbd">i--tem out of example</kbd></dt>
</dl>

<dl class="table">
<dt><kbd class="kbd">braced i--tem out of example</kbd></dt>
</dl>

<p>in example
</p><div class="example">
<dl class="table">
<dt><code class="table-term-preformatted-code"><kbd class="kbd">i--tem in example</kbd></code></dt>
</dl>
<dl class="table">
<dt><code class="table-term-preformatted-code"><kbd class="kbd">braced i--tem in example</kbd></code></dt>
</dl>
</div>
';


$result_converted{'latex'}->{'kbdinputstyle_in_table'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
% This is used to provide a default no-operation \'keyval\' definition
% of the "alt" key in the "Gin" ("Graphics Inclusion") family used
% by graphicx.  This prevents an "alt" attribute generating an error in
% older versions of graphicx.
\\makeatletter
\\providecommand\\KV@Gin@alt{}
\\makeatother
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage{enumitem}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfothechapterheading}{}
\\newtitlemark{\\Texinfothechapterheading}%
\\newcommand{\\Texinfoheadingchaptername}{\\chaptername}
\\newtitlemark{\\Texinfoheadingchaptername}%
\\newcommand{\\Texinfosettitle}{No Title}%

\\newcommand{\\Texinfounnumberedchapter}[1]{\\chapter*{#1}
\\addcontentsline{toc}{chapter}{\\protect\\textbf{#1}}%
\\renewcommand{\\Texinfothechapterheading}{}%
\\chaptermark{#1}%
}%

\\newcommand{\\Texinfounnumberedpart}[1]{\\part*{#1}
\\addcontentsline{toc}{part}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsection}[1]{\\section*{#1}
\\addcontentsline{toc}{section}{\\protect\\textbf{#1}}%
\\sectionmark{#1}%
}%

\\newcommand{\\Texinfounnumberedsubsection}[1]{\\subsection*{#1}
\\addcontentsline{toc}{subsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsubsubsection}[1]{\\subsubsection*{#1}
\\addcontentsline{toc}{subsubsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfochapter}[1]{\\chapter{#1}
\\renewcommand{\\Texinfothechapterheading}{\\Texinfoheadingchaptername{} \\thechapter{} }%
}%

% style command for kbd in \'cmd_text\' formatting context
\\newcommand\\Texinfocommandstyletextkbd[1]{{\\ttfamily\\textsl{#1}}}%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

% set defaults for lists that match Texinfo TeX formatting
\\setlist[description]{style=nextline, font=\\normalfont}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\Texinfothechapterheading{}\\chaptertitle{}][][\\thepage]
                              {\\Texinfothechapterheading{}\\chaptertitle{}}{}{\\thepage}}

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


\\begin{document}
@kbdinputstyle code


\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\texttt{i{-}{-}tem out of example}}}]
\\end{description}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\texttt{braced i{-}{-}tem out of example}}}]
\\end{description}

in example
\\begin{Texinfoindented}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\texttt{i{-}{-}tem in example}}}]
\\end{description}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\texttt{braced i{-}{-}tem in example}}}]
\\end{description}
\\end{Texinfoindented}

@kbdinputstyle example


\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\texttt{i{-}{-}tem out of example}}}]
\\end{description}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\texttt{braced i{-}{-}tem out of example}}}]
\\end{description}

in example
\\begin{Texinfoindented}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\Texinfocommandstyletextkbd{i{-}{-}tem in example}}}]
\\end{description}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\Texinfocommandstyletextkbd{braced i{-}{-}tem in example}}}]
\\end{description}
\\end{Texinfoindented}

@kbdinputstyle distinct


\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\Texinfocommandstyletextkbd{i{-}{-}tem out of example}}}]
\\end{description}

\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\Texinfocommandstyletextkbd{braced i{-}{-}tem out of example}}}]
\\end{description}

in example
\\begin{Texinfoindented}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\Texinfocommandstyletextkbd{i{-}{-}tem in example}}}]
\\end{description}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\Texinfocommandstyletextkbd{braced i{-}{-}tem in example}}}]
\\end{description}
\\end{Texinfoindented}
\\end{document}
';

1;
