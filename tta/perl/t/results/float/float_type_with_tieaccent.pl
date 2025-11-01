use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'float_type_with_tieaccent'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *@float C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{A 1͡a 第͡H ê͡一 and text}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{label}
   *arguments_line C2
    *block_line_arg C6
     {A }
     *@tieaccent C1 l1
      *brace_container C1
       {1a}
     { }
     *@tieaccent C1 l1
      *brace_container C1
       {第H}
     { }
     *@tieaccent C1 l1
      *brace_container C2
       *@^ C1 l1
        *following_arg C1
         {e}
       {一 and text}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {label}
   *paragraph C1
    {inside\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {float}
  {empty_line:\\n}
  *@listoffloats C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{A 1͡a 第͡H ê͡一 and text}
  |global_command_number:{1}
   *line_arg C6
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {A }
    *@tieaccent C1 l5
     *brace_container C1
      {1a}
    { }
    *@tieaccent C1 l5
     *brace_container C1
      {第H}
    { }
    *@tieaccent C1 l5
     *brace_container C2
      *@^ C1 l5
       *following_arg C1
        {e}
      {一 and text}
';


$result_texis{'float_type_with_tieaccent'} = '@float A @tieaccent{1a} @tieaccent{第H} @tieaccent{@^e一 and text}, label
inside
@end float

@listoffloats A @tieaccent{1a} @tieaccent{第H} @tieaccent{@^e一 and text}
';


$result_texts{'float_type_with_tieaccent'} = 'A 1a[ 第H[ e^一 and text[, label
inside

';

$result_errors{'float_type_with_tieaccent'} = '';

$result_floats{'float_type_with_tieaccent'} = 'A 1͡a 第͡H ê͡一 and text: 1
 F1: {label}
';

$result_nodes_list{'float_type_with_tieaccent'} = '';

$result_sections_list{'float_type_with_tieaccent'} = '';

$result_sectioning_root{'float_type_with_tieaccent'} = '';

$result_headings_list{'float_type_with_tieaccent'} = '';


$result_converted{'plaintext'}->{'float_type_with_tieaccent'} = 'inside

A 1͡a 第͡H ê͡一 and text 1

* Menu:

* A 1͡a 第͡H ê͡一 and text 1: label.        

';


$result_converted{'html'}->{'float_type_with_tieaccent'} = '<!DOCTYPE html>
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

<body lang="">
<div class="float" id="label">
<p>inside
</p><div class="type-number-float"><p><strong class="strong">A 1&#865;a 第&#865;H &ecirc;&#865;一 and text 1</strong></p></div></div>
<dl class="listoffloats">
<dt><a href="#label">A 1&#865;a 第&#865;H &ecirc;&#865;一 and text 1</a></dt><dd></dd>
</dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'float_type_with_tieaccent'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



$result_converted{'xml'}->{'float_type_with_tieaccent'} = '<float identifier="label" type="A 1͡a 第͡H ê͡一 and text" number="1" spaces=" " endspaces=" "><floattype>A <accent type="tieaccent">1a</accent> <accent type="tieaccent">第H</accent> <accent type="tieaccent"><accent type="circ" bracketed="off">e</accent>一 and text</accent></floattype><floatname spaces=" ">label</floatname>
<para>inside
</para></float>

<listoffloats type="A 1͡a 第͡H ê͡一 and text" spaces=" ">A <accent type="tieaccent">1a</accent> <accent type="tieaccent">第H</accent> <accent type="tieaccent"><accent type="circ" bracketed="off">e</accent>一 and text</accent></listoffloats>
';


$result_converted{'latex'}->{'float_type_with_tieaccent'} = '\\documentclass{book}
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

% new float for type `A 1͡a 第͡H ê͡一 and text\'
\\newfloat{TexinfoFloatAaDiHeYiandtext}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatAaDiHeYiandtext}{}
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

\\begin{document}
\\begin{TexinfoFloatAaDiHeYiandtext}
inside
\\label{anchor:label}%
\\end{TexinfoFloatAaDiHeYiandtext}

\\listof{TexinfoFloatAaDiHeYiandtext}{}
\\end{document}
';

1;
