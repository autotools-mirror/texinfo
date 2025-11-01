use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'footnote_in_center'} = '*document_root C1
 *before_node_section C1
  *@center C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Centered text with a footnote}
    *@footnote C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C3
      *paragraph C2
       {This footnote\\n}
       {shows an important feature of the centered text.\\n}
      {empty_line:\\n}
      *@example C3 l4
       *arguments_line C1
        *block_line_arg
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
       *@table C3 l5
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
        *arguments_line C1
         *block_line_arg C1
         |INFO
         |spaces_after_argument:
          |{spaces_after_argument:\\n}
          *@asis l5
        *table_entry C2
         *table_term C1
          *@item C1 l6
          |INFO
          |spaces_before_argument:
           |{spaces_before_argument: }
           *line_arg C1
           |INFO
           |spaces_after_argument:
            |{spaces_after_argument:\\n}
            {item}
         *table_definition C1
          *preformatted C1
           {line\\n}
        *@end C1 l8
        |INFO
        |spaces_before_argument:
         |{spaces_before_argument: }
        |EXTRA
        |text_arg:{table}
         *line_arg C1
         |INFO
         |spaces_after_argument:
          |{spaces_after_argument: \\n}
          {table}
       *@end C1 l9
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
    { and text after the footnote.}
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
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{enumitem}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfosettitle}{No Title}%

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
