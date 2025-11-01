use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'top_node_top_contents'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C2
   *@contents C1 l1
   |EXTRA
   |global_command_number:{1}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l3 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C1 l4 {Texinfo modules documentation}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Texinfo modules documentation}
';


$result_texis{'top_node_top_contents'} = '@contents

@node Top
@top Texinfo modules documentation
';


$result_texts{'top_node_top_contents'} = '
Texinfo modules documentation
*****************************
';

$result_errors{'top_node_top_contents'} = '';

$result_nodes_list{'top_node_top_contents'} = '1|Top
 associated_section: Texinfo modules documentation
 associated_title_command: Texinfo modules documentation
';

$result_sections_list{'top_node_top_contents'} = '1|Texinfo modules documentation
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'top_node_top_contents'} = 'level: -1
list:
 1|Texinfo modules documentation
';

$result_headings_list{'top_node_top_contents'} = '';


$result_converted{'html_text'}->{'top_node_top_contents'} = '
<div class="top-level-extent" id="Top">
<h1 class="top" id="Texinfo-modules-documentation"><span>Texinfo modules documentation<a class="copiable-link" href="#Texinfo-modules-documentation"> &para;</a></span></h1>
</div>
';

1;
