use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'footnote_in_center'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@center C1 l1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:Centered text with a footnote}
    *normal_command@footnote C1 l1
    |global_command_number:{1}
     *brace_command_context C3
      *paragraph C2
       {normal_text:This footnote\\n}
       {normal_text:shows an important feature of the centered text.\\n}
      {empty_line:\\n}
      *normal_command@example C3 l4
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *normal_command@table C3 l5
        *arguments_line C1
         *block_line_arg C3
          {spaces_before_argument: }
          *normal_command@asis l5
          {spaces_after_argument:\\n}
        *table_entry C2
         *table_term C1
          *normal_command@item C1 l6
           *line_arg C3
            {spaces_before_argument: }
            {normal_text:item}
            {spaces_after_argument:\\n}
         *table_definition C1
          *preformatted C1
           {normal_text:line\\n}
        *normal_command@end C1 l8
        |text_arg:{table}
         *line_arg C3
          {spaces_before_argument: }
          {normal_text:table}
          {spaces_after_argument: \\n}
       *normal_command@end C1 l9
       |text_arg:{example}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:example}
         {spaces_after_argument:\\n}
    {normal_text: and text after the footnote.}
    {spaces_after_argument:\\n}
';


$result_texis{'footnote_in_center'} = '@center Centered text with a footnote@footnote{This footnote
shows an important feature of the centered text.

@example
@table @asis
@item item
line
@end table 
@end example
} and text after the footnote.
';


$result_texts{'footnote_in_center'} = 'Centered text with a footnote and text after the footnote.
';

$result_errors{'footnote_in_center'} = '';

$result_nodes_list{'footnote_in_center'} = '';

$result_sections_list{'footnote_in_center'} = '';

$result_sectioning_root{'footnote_in_center'} = '';

$result_headings_list{'footnote_in_center'} = '';


$result_converted{'plaintext'}->{'footnote_in_center'} = '     Centered text with a footnote(1) and text after the footnote.

   ---------- Footnotes ----------

   (1) This footnote shows an important feature of the centered text.

     item
          line

';


$result_converted{'html_text'}->{'footnote_in_center'} = '<div class="center">Centered text with a footnote<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a> and text after the footnote.
</div><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>This footnote
shows an important feature of the centered text.
</p>
<div class="example">
<dl class="table">
<dt><code class="table-term-preformatted-code">item</code></dt>
<dd><pre class="example-preformatted">line
</pre></dd>
</dl>
</div>
</div>
';


$result_converted{'latex'}->{'footnote_in_center'} = '\\documentclass{book}
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
\\begin{center}
Centered text with a footnote\\footnote{This footnote
shows an important feature of the centered text.

\\begin{Texinfoindented}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
item}}]
\\begin{Texinfopreformatted}%
\\ttfamily line
\\end{Texinfopreformatted}
\\end{description}
\\end{Texinfoindented}
} and text after the footnote.
\\end{center}
\\end{document}
';


$result_converted{'docbook'}->{'footnote_in_center'} = '<simpara role="center">Centered text with a footnote<footnote><para>This footnote
shows an important feature of the centered text.
</para>
<variablelist><varlistentry><term>item
</term><listitem><screen>line
</screen></listitem></varlistentry></variablelist></footnote> and text after the footnote.</simpara>
';

1;
