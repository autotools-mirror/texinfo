use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'printindex_before_document'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *@printindex C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
';


$result_texis{'printindex_before_document'} = '
@printindex cp
';


$result_texts{'printindex_before_document'} = '
';

$result_errors{'printindex_before_document'} = '* W l2|printindex before document beginning: @printindex cp
 warning: printindex before document beginning: @printindex cp

';

$result_nodes_list{'printindex_before_document'} = '';

$result_sections_list{'printindex_before_document'} = '';

$result_sectioning_root{'printindex_before_document'} = '';

$result_headings_list{'printindex_before_document'} = '';

1;
