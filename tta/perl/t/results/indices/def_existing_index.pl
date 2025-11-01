use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'def_existing_index'} = '*document_root C1
 *before_node_section C1
  *@defcodeindex C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
';


$result_texis{'def_existing_index'} = '@defcodeindex cp
';


$result_texts{'def_existing_index'} = '';

$result_errors{'def_existing_index'} = '* E l1|reserved index name cp
 reserved index name cp

';

$result_nodes_list{'def_existing_index'} = '';

$result_sections_list{'def_existing_index'} = '';

$result_sectioning_root{'def_existing_index'} = '';

$result_headings_list{'def_existing_index'} = '';


$result_converted{'info'}->{'def_existing_index'} = 'This is , produced from .


Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'def_existing_index'} = [
  {
    'error_line' => 'warning: document without nodes
',
    'text' => 'document without nodes',
    'type' => 'warning'
  }
];



$result_converted{'plaintext'}->{'def_existing_index'} = '';


$result_converted{'html_text'}->{'def_existing_index'} = '';


$result_converted{'xml'}->{'def_existing_index'} = '<defcodeindex spaces=" " line="cp"></defcodeindex>
';

1;
