use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'two_setchapternewpage_odd_on'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C3
   *@setchapternewpage C1 l1
   |EXTRA
   |misc_args:A{odd}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:odd}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@setchapternewpage C1 l3
   |EXTRA
   |misc_args:A{on}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:on}
     {spaces_after_argument:\\n}
';


$result_texis{'two_setchapternewpage_odd_on'} = '@setchapternewpage odd

@setchapternewpage on
';


$result_texts{'two_setchapternewpage_odd_on'} = '
';

$result_errors{'two_setchapternewpage_odd_on'} = '* W l3|multiple @setchapternewpage
 warning: multiple @setchapternewpage

';

$result_nodes_list{'two_setchapternewpage_odd_on'} = '';

$result_sections_list{'two_setchapternewpage_odd_on'} = '';

$result_sectioning_root{'two_setchapternewpage_odd_on'} = '';

$result_headings_list{'two_setchapternewpage_odd_on'} = '';


$result_converted{'latex_text'}->{'two_setchapternewpage_odd_on'} = '\\pagestyle{double}%

\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%
\\begin{document}
';

1;
