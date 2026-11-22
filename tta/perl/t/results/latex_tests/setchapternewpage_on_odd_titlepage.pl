use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'setchapternewpage_on_odd_titlepage'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C5
   *normal_command@setchapternewpage C1 l1
   |misc_args:A{on}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:on}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@setchapternewpage C1 l3
   |misc_args:A{odd}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:odd}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@titlepage C3 l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in titlepage\\n}
    *normal_command@end C1 l7
    |text_arg:{titlepage}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:titlepage}
      {spaces_after_argument:\\n}
';


$result_texis{'setchapternewpage_on_odd_titlepage'} = '@setchapternewpage on

@setchapternewpage odd

@titlepage
in titlepage
@end titlepage
';


$result_texts{'setchapternewpage_on_odd_titlepage'} = '

';

$result_errors{'setchapternewpage_on_odd_titlepage'} = '* W l3|multiple @setchapternewpage
 warning: multiple @setchapternewpage

';

$result_nodes_list{'setchapternewpage_on_odd_titlepage'} = '';

$result_sections_list{'setchapternewpage_on_odd_titlepage'} = '';

$result_sectioning_root{'setchapternewpage_on_odd_titlepage'} = '';

$result_headings_list{'setchapternewpage_on_odd_titlepage'} = '';


$result_converted{'latex_text'}->{'setchapternewpage_on_odd_titlepage'} = '\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%

\\makeatletter
\\patchcmd{\\chapter}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{}{}
\\makeatother
\\pagestyle{double}%

\\begin{document}

\\frontmatter
\\pagestyle{empty}%
\\begin{titlepage}
\\begingroup
\\newskip\\titlepagetopglue \\titlepagetopglue = 1.5in
\\newskip\\titlepagebottomglue \\titlepagebottomglue = 2pc
\\setlength{\\parindent}{0pt}
% Leave some space at the very top of the page.
    \\vglue\\titlepagetopglue
in titlepage
\\endgroup
\\end{titlepage}
\\mainmatter
\\pagestyle{double}%
';

1;
