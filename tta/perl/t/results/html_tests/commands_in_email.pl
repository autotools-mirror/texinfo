use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'commands_in_email'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@email C1 l1
    *brace_arg C4
     {endots }
     *@enddots C1 l1
      *brace_container
     { }
     *@code C1 l1
      *brace_container C1
       {in code}
';


$result_texis{'commands_in_email'} = '@email{endots @enddots{} @code{in code}}';


$result_texts{'commands_in_email'} = 'endots ... in code';

$result_errors{'commands_in_email'} = '';

$result_nodes_list{'commands_in_email'} = '';

$result_sections_list{'commands_in_email'} = '';

$result_sectioning_root{'commands_in_email'} = '';

$result_headings_list{'commands_in_email'} = '';


$result_converted{'html_text'}->{'commands_in_email'} = '<p><a class="email" href="mailto:endots%20...%20in%20code">endots ... in code</a></p>';

1;
