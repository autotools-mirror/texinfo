use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'simple'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   *@b C1 l1
    *brace_container C1
     {in  b}
   {.}
';


$result_texis{'simple'} = '@b{in  b}.';


$result_texts{'simple'} = 'in  b.';

$result_errors{'simple'} = '';

$result_nodes_list{'simple'} = '';

$result_sections_list{'simple'} = '';

$result_sectioning_root{'simple'} = '';

$result_headings_list{'simple'} = '';


$result_converted{'plaintext'}->{'simple'} = 'in b.
';


$result_converted{'html_text'}->{'simple'} = '<p><b class="b">in  b</b>.</p>';


$result_converted{'latex_text'}->{'simple'} = '\\textbf{in  b}.';


$result_converted{'docbook'}->{'simple'} = '<para><emphasis role="bold">in  b</emphasis>.</para>';

1;
