use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'float_with_at_commands'} = '*document_root C1
 *before_node_section C5
  *preamble_before_content
  *normal_command@float C7 l1
  |float_number:{1}
  |float_type:{entrée}
  |global_command_number:{1}
  |identifier:{premi_00e8re-entr_00e9e}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:entr}
     *normal_command@\' C1 l1
      *following_arg C1
       {normal_text:e}
     {normal_text:e}
    *block_line_arg C7
     {spaces_before_argument: }
     {normal_text:premi}
     *normal_command@` C1 l1
      *following_arg C1
       {normal_text:e}
     {normal_text:re entr}
     *normal_command@\' C1 l1
      *following_arg C1
       {normal_text:e}
     {normal_text:e}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C5
    {normal_text:Ceci est notre premi}
    *normal_command@` C1 l3
     *following_arg C1
      {normal_text:e}
    {normal_text:re entr}
    *normal_command@\' C1 l3
     *following_arg C1
      {normal_text:e}
    {normal_text:e.\\n}
   *normal_command@caption C1 l4
    *brace_command_context C1
     *paragraph C5
      {normal_text:La premi}
      *normal_command@` C1 l4
       *following_arg C1
        {normal_text:e}
      {normal_text:re entr}
      *normal_command@\' C1 l4
       *following_arg C1
        {normal_text:e}
      {normal_text:e est importante}
   {spaces_after_close_brace:\\n}
   {empty_line:\\n}
   *normal_command@end C1 l6
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l9
  |float_type:{entrée}
  |global_command_number:{1}
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:entr}
    *normal_command@\' C1 l9
     *following_arg C1
      {normal_text:e}
    {normal_text:e}
    {spaces_after_argument:\\n}
';


$result_texis{'float_with_at_commands'} = '@float entr@\'ee, premi@`ere entr@\'ee

Ceci est notre premi@`ere entr@\'ee.
@caption{La premi@`ere entr@\'ee est importante}

@end float


@listoffloats entr@\'ee
';


$result_texts{'float_with_at_commands'} = 'entre\'e, premie`re entre\'e

Ceci est notre premie`re entre\'e.



';

$result_errors{'float_with_at_commands'} = '';

$result_floats{'float_with_at_commands'} = 'entrée: 1
 F1: {premi_00e8re-entr_00e9e}
  C: La premi@`ere entr@\'ee est importante
';

$result_nodes_list{'float_with_at_commands'} = '';

$result_sections_list{'float_with_at_commands'} = '';

$result_sectioning_root{'float_with_at_commands'} = '';

$result_headings_list{'float_with_at_commands'} = '';


$result_converted{'plaintext'}->{'float_with_at_commands'} = 'Ceci est notre première entrée.

entrée 1: La première entrée est importante

* Menu:

* entrée 1: première entrée.             La première entrée est
                                         importante

';


$result_converted{'html'}->{'float_with_at_commands'} = '<!DOCTYPE html>
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



</head>

<body>
<div class="float" id="premi_00e8re-entr_00e9e">

<p>Ceci est notre premi&egrave;re entr&eacute;e.
</p>
<div class="caption"><p><strong class="strong">entr&eacute;e 1: </strong>La premi&egrave;re entr&eacute;e est importante</p></div></div>

<dl class="listoffloats">
<dt><a href="#premi_00e8re-entr_00e9e">entr&eacute;e 1</a></dt><dd class="caption-in-listoffloats"><p>La premi&egrave;re entr&eacute;e est importante</p></dd>
</dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'float_with_at_commands'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'float_with_at_commands'} = '<float identifier="premi_00e8re-entr_00e9e" type="entrée" number="1" endspaces=" "><floattype> entr<accent type="acute" bracketed="off">e</accent>e</floattype><floatname> premi<accent type="grave" bracketed="off">e</accent>re entr<accent type="acute" bracketed="off">e</accent>e</floatname>

<para>Ceci est notre premi<accent type="grave" bracketed="off">e</accent>re entr<accent type="acute" bracketed="off">e</accent>e.
</para><caption><para>La premi<accent type="grave" bracketed="off">e</accent>re entr<accent type="acute" bracketed="off">e</accent>e est importante</para></caption>

</float>


<listoffloats type="entrée"> entr<accent type="acute" bracketed="off">e</accent>e</listoffloats>
';


$result_converted{'latex'}->{'float_with_at_commands'} = '\\documentclass{book}
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

% new float for type `entrée\'
\\newfloat{TexinfoFloatentree}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatentree}{entr\\\'{e}e}
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
\\begin{TexinfoFloatentree}

Ceci est notre premi\\`{e}re entr\\\'{e}e.
\\caption{La premi\\`{e}re entr\\\'{e}e est importante}

\\label{anchor:premi_00e8re-entr_00e9e}%
\\end{TexinfoFloatentree}


\\listof{TexinfoFloatentree}{}
\\end{document}
';

1;
