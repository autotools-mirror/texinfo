use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_in_dotless'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C1
   *@dotless C1 l1
    *brace_container C1
     *@code C1 l1
      *brace_container C1
       {normal_text:i}
';


$result_texis{'command_in_dotless'} = '@dotless{@code{i}}';


$result_texts{'command_in_dotless'} = 'i';

$result_errors{'command_in_dotless'} = '* W l1|@code should not appear in @dotless
 warning: @code should not appear in @dotless

* E l1|@dotless expects `i\' or `j\' as argument, not `@code{i}\'
 @dotless expects `i\' or `j\' as argument, not `@code{i}\'

';

$result_nodes_list{'command_in_dotless'} = '';

$result_sections_list{'command_in_dotless'} = '';

$result_sectioning_root{'command_in_dotless'} = '';

$result_headings_list{'command_in_dotless'} = '';


$result_converted{'plaintext'}->{'command_in_dotless'} = 'ı
';


$result_converted{'html_text'}->{'command_in_dotless'} = '<p><code class="code">i</code></p>';


$result_converted{'latex_text'}->{'command_in_dotless'} = '\\begin{document}
\\textbackslash{}texttt\\{i\\}';


$result_converted{'docbook'}->{'command_in_dotless'} = '<para><literal>i</literal></para>';

1;
