use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'definfoenclose'} = '*document_root C1
 *before_node_section C15
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C2
   {definfoenclose phoo,//,\\  }
   *@definfoenclose C1 l2
   |EXTRA
   |misc_args:A{phoo|//|\\}
    *line_arg C3
     {spaces_before_argument: }
     {phoo,//,\\}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phoo C1 l4
   |EXTRA
   |begin:{//}
   |end:{\\}
    *brace_container C1
     {bar}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   {definfoenclose phi,:,:  }
   *@definfoenclose C1 l6
   |EXTRA
   |misc_args:A{phi|:|:}
    *line_arg C3
     {spaces_before_argument: }
     {phi,:,:}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phi C1 l8
   |EXTRA
   |begin:{:}
   |end:{:}
    *brace_container C1
     {bar}
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@strong C1 l10
    *brace_container C1
     {very strong}
   {\\n}
  {empty_line:\\n}
  *@definfoenclose C1 l12
  |EXTRA
  |misc_args:A{strong|(strong:|:)}
   *line_arg C3
    {spaces_before_argument: }
    {strong,(strong:,:)}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@strong C1 l14
   |EXTRA
   |begin:{(strong:}
   |end:{:)}
    *brace_container C1
     { is it really strong? }
   {\\n}
';


$result_texis{'definfoenclose'} = '
definfoenclose phoo,//,\\  @definfoenclose phoo,//,\\

@phoo{bar}

definfoenclose phi,:,:  @definfoenclose phi,:,:

@phi{bar}

@strong{very strong}

@definfoenclose strong,(strong:,:)

@strong{ is it really strong? }
';


$result_texts{'definfoenclose'} = 'definfoenclose phoo,//,\\  
bar

definfoenclose phi,:,:  
bar

very strong


 is it really strong? 
';

$result_errors{'definfoenclose'} = '* W l2|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* W l2|@definfoenclose should only appear at the beginning of a line
 warning: @definfoenclose should only appear at the beginning of a line

* W l6|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* WC l6|further warnings for @definfoenclose suppressed
 warning: further warnings for @definfoenclose suppressed

* W l6|@definfoenclose should only appear at the beginning of a line
 warning: @definfoenclose should only appear at the beginning of a line

';

$result_nodes_list{'definfoenclose'} = '';

$result_sections_list{'definfoenclose'} = '';

$result_sectioning_root{'definfoenclose'} = '';

$result_headings_list{'definfoenclose'} = '';


$result_converted{'plaintext'}->{'definfoenclose'} = 'definfoenclose phoo,//,\\

   //bar\\

   definfoenclose phi,:,:

   :bar:

   *very strong*

   (strong: is it really strong?  :)
';


$result_converted{'html_text'}->{'definfoenclose'} = '<p>definfoenclose phoo,//,\\  </p>
<p>//bar\\
</p>
<p>definfoenclose phi,:,:  </p>
<p>:bar:
</p>
<p><strong class="strong">very strong</strong>
</p>

<p>(strong: is it really strong? :)
</p>';


$result_converted{'latex'}->{'definfoenclose'} = '\\documentclass{book}
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
definfoenclose phoo,//,\\textbackslash{}  
bar

definfoenclose phi,:,:  
bar

\\textbf{very strong}


\\textbf{ is it really strong? }
\\end{document}
';


$result_converted{'docbook'}->{'definfoenclose'} = '<para>definfoenclose phoo,//,\\  </para>
<para>bar
</para>
<para>definfoenclose phi,:,:  </para>
<para>bar
</para>
<para><emphasis role="bold">very strong</emphasis>
</para>

<para> is it really strong? 
</para>';

1;
