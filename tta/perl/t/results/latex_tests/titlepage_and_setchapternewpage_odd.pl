use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'titlepage_and_setchapternewpage_odd'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C4
   *@setchapternewpage C1 l1
   |EXTRA
   |misc_args:A{odd}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:odd}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@titlepage C3 l3
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in titlepage\\n}
    *@end C1 l5
    |EXTRA
    |text_arg:{titlepage}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:titlepage}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
';


$result_texis{'titlepage_and_setchapternewpage_odd'} = '@setchapternewpage odd

@titlepage
in titlepage
@end titlepage

';


$result_texts{'titlepage_and_setchapternewpage_odd'} = '

';

$result_errors{'titlepage_and_setchapternewpage_odd'} = '';

$result_nodes_list{'titlepage_and_setchapternewpage_odd'} = '';

$result_sections_list{'titlepage_and_setchapternewpage_odd'} = '';

$result_sectioning_root{'titlepage_and_setchapternewpage_odd'} = '';

$result_headings_list{'titlepage_and_setchapternewpage_odd'} = '';


$result_converted{'latex_text'}->{'titlepage_and_setchapternewpage_odd'} = '\\pagestyle{double}%


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
