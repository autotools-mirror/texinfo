use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'command_in_U'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@U C1 l1
    *brace_arg C1
     *@code C1 l1
      *brace_container C1
       {09AF}
';


$result_texis{'command_in_U'} = '@U{@code{09AF}}';


$result_texts{'command_in_U'} = '09AF';

$result_errors{'command_in_U'} = '* W l1|no argument specified for @U
 warning: no argument specified for @U

';

$result_nodes_list{'command_in_U'} = '';

$result_sections_list{'command_in_U'} = '';

$result_sectioning_root{'command_in_U'} = '';

$result_headings_list{'command_in_U'} = '';


$result_converted{'plaintext'}->{'command_in_U'} = '';


$result_converted{'html_text'}->{'command_in_U'} = '<p>&#x<code class="code">09AF</code>;</p>';


$result_converted{'latex_text'}->{'command_in_U'} = '';


$result_converted{'docbook'}->{'command_in_U'} = '<para></para>';

1;
