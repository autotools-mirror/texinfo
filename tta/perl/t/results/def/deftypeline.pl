use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'deftypeline'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@defblock C4 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@deftypeline C1 l2
   |def_command:{deftypeline}
   |original_def_cmdname:{deftypeline}
    *line_arg C18
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_type C1
      *bracketed_arg C1 l2
       {normal_text:long int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foo}
     {spaces: }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l2
        *brace_container C1
         {normal_text:bar}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l2
        *brace_container C1
         {normal_text:baz}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C2
     *normal_command@dots C1 l3
      *brace_container
     {normal_text:\\n}
   *normal_command@end C1 l4
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
';


$result_texis{'deftypeline'} = '@defblock
@deftypeline Function {long int} foo (int @var{bar}, int @var{baz})
@dots{}
@end defblock
';


$result_texts{'deftypeline'} = 'Function: long int foo (int bar, int baz)
...
';

$result_errors{'deftypeline'} = '';

$result_nodes_list{'deftypeline'} = '';

$result_sections_list{'deftypeline'} = '';

$result_sectioning_root{'deftypeline'} = '';

$result_headings_list{'deftypeline'} = '';


$result_converted{'plaintext'}->{'deftypeline'} = ' -- Function: long int foo (int BAR, int BAZ)
     ...
';


$result_converted{'html'}->{'deftypeline'} = '<!DOCTYPE html>
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
dt.def-line {font-size: 1rem}
strong.def-name {font-family: monospace; font-weight: bold}
</style>


</head>

<body>
<dl class="defblock def-block">
<dt class="deftypeline def-line"><span class="category-def">Function: </span><code class="def-type">long int</code> <strong class="def-name">foo</strong> <code class="def-code-arguments">(int <var class="var">bar</var>, int <var class="var">baz</var>)</code></dt>
<dd><p>&hellip;
</p></dd></dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'deftypeline'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'latex'}->{'deftypeline'} = '\\documentclass{book}
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
\\usepackage{tabularx}
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

% style command for var in \'cmd_text\' formatting context
\\newcommand\\Texinfocommandstyletextvar[1]{{\\normalfont{}\\textsl{#1}}}%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

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

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{long int foo (int\\ \\Texinfocommandstyletextvar{bar},\\ int\\ \\Texinfocommandstyletextvar{baz})}& [Function]
\\end{tabularx}

\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
\\dots{}\\@
\\end{Texinfoindented}
\\end{document}
';


$result_converted{'docbook'}->{'deftypeline'} = '<synopsis><phrase role="category"><emphasis role="bold">Function</emphasis>:</phrase> <returnvalue>long int</returnvalue> <varname>foo</varname> (<type>int</type> <emphasis role="arg"><replaceable>bar</replaceable></emphasis>, <type>int</type> <emphasis role="arg"><replaceable>baz</replaceable></emphasis>)</synopsis>
<blockquote><para>&#8230;
</para></blockquote>';


$result_converted{'xml'}->{'deftypeline'} = '<defblock endspaces=" ">
<deftypeline><definitionterm> <defcategory>Function</defcategory> <deftype bracketed="on">long int</deftype> <defsymbol>foo</defsymbol> <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>bar</var></defparam><defdelimiter>,</defdelimiter> <defparamtype>int</defparamtype> <defparam><var>baz</var></defparam><defdelimiter>)</defdelimiter></definitionterm></deftypeline>
<definitionitem><para>&dots;
</para></definitionitem></defblock>
';

1;
