use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'invalid'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@multitable C2 l1
  |EXTRA
  |max_columns:{0}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l1
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:2x.2 2.23x}
       {spaces_after_argument:\\n}
   *@end C1 l2
   |EXTRA
   |text_arg:{multitable}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:multitable}
';


$result_texis{'invalid'} = '@multitable @columnfractions 2x.2 2.23x
@end multitable';


$result_texts{'invalid'} = '';

$result_errors{'invalid'} = '* E l1|column fraction not a number: 2x.2
 column fraction not a number: 2x.2

* E l1|column fraction not a number: 2.23x
 column fraction not a number: 2.23x

';

$result_nodes_list{'invalid'} = '';

$result_sections_list{'invalid'} = '';

$result_sectioning_root{'invalid'} = '';

$result_headings_list{'invalid'} = '';

1;
