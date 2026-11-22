use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_titlepage_and_setchapternewpage_on'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@setchapternewpage C1 l1
   |misc_args:A{on}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:on}
     {spaces_after_argument:\\n}
';


$result_texis{'no_titlepage_and_setchapternewpage_on'} = '@setchapternewpage on
';


$result_texts{'no_titlepage_and_setchapternewpage_on'} = '';

$result_errors{'no_titlepage_and_setchapternewpage_on'} = '';

$result_nodes_list{'no_titlepage_and_setchapternewpage_on'} = '';

$result_sections_list{'no_titlepage_and_setchapternewpage_on'} = '';

$result_sectioning_root{'no_titlepage_and_setchapternewpage_on'} = '';

$result_headings_list{'no_titlepage_and_setchapternewpage_on'} = '';


$result_converted{'latex_text'}->{'no_titlepage_and_setchapternewpage_on'} = '\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%
\\begin{document}
';

1;
