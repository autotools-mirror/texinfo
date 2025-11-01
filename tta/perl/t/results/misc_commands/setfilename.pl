use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'setfilename'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C5
   *@setfilename C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{file_comment}
    *line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comment}
     {file_comment}
   *@setfilename C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{file_and_spaces}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:   \\n}
     {file_and_spaces}
   *@setfilename C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{file_space_comment}
    *line_arg C1
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comment}
    |spaces_after_argument:
     |{spaces_after_argument: }
     {file_space_comment}
   *@setfilename C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@ 
     *@verb C1 l4
     |INFO
     |delimiter:{:}
      *brace_container C1
       {raw: name }
     *@ 
   {empty_line:\\n}
';


$result_texis{'setfilename'} = '@setfilename file_comment@c comment
@setfilename file_and_spaces   
@setfilename file_space_comment @c comment
@setfilename @ @verb{: name :}@ 

';


$result_texts{'setfilename'} = '
';

$result_errors{'setfilename'} = '* W l2|multiple @setfilename
 warning: multiple @setfilename

* W l3|multiple @setfilename
 warning: multiple @setfilename

* W l4|multiple @setfilename
 warning: multiple @setfilename

* W l4|@verb should not appear in @setfilename
 warning: @verb should not appear in @setfilename

* E l4|bad argument to @setfilename: @ @verb{: name :}@
 bad argument to @setfilename: @ @verb{: name :}@

';

$result_nodes_list{'setfilename'} = '';

$result_sections_list{'setfilename'} = '';

$result_sectioning_root{'setfilename'} = '';

$result_headings_list{'setfilename'} = '';


$result_converted{'plaintext'}->{'setfilename'} = '';


$result_converted{'html_text'}->{'setfilename'} = '
';


$result_converted{'latex'}->{'setfilename'} = '\\documentclass{book}
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
\\end{document}
';


$result_converted{'docbook'}->{'setfilename'} = '
';


$result_converted{'info'}->{'setfilename'} = 'This is file_comment, produced from .


Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'setfilename'} = '* W |document without nodes
 warning: document without nodes

';


$result_converted{'xml'}->{'setfilename'} = '<setfilename file="file_comment" spaces=" ">file_comment</setfilename><!-- c comment -->
<setfilename file="file_and_spaces" spaces=" ">file_and_spaces   </setfilename>
<setfilename file="file_space_comment" spaces=" ">file_space_comment </setfilename><!-- c comment -->
<setfilename spaces=" "><spacecmd type="spc"/><verb delimiter=":"> name </verb><spacecmd type="spc"/></setfilename>

';

1;
