use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_use_iso'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C3
   {normal_text:AA }
   *normal_command@^ C1 l1
    *following_arg C1
     {normal_text:e}
   {normal_text: --- -- \'` \'\' ``}
';


$result_texis{'no_use_iso'} = 'AA @^e --- -- \'` \'\' ``';


$result_texts{'no_use_iso'} = 'AA e^ -- - \'` " "';

$result_errors{'no_use_iso'} = '';

$result_nodes_list{'no_use_iso'} = '';

$result_sections_list{'no_use_iso'} = '';

$result_sectioning_root{'no_use_iso'} = '';

$result_headings_list{'no_use_iso'} = '';


$result_converted{'html_text'}->{'no_use_iso'} = '<p>AA &ecirc; -- - \'` &quot; &quot;</p>';

1;
