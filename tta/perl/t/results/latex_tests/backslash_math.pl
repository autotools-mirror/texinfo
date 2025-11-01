use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'backslash_math'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   *@math C1 l1
    *brace_command_context C5
     {a }
     *@\\
     { b }
     *@backslashchar C1 l1
      *brace_container
     { c}
   {.\\n}
';


$result_texis{'backslash_math'} = '@math{a @\\ b @backslashchar{} c}.
';


$result_texts{'backslash_math'} = 'a \\ b \\ c.
';

$result_errors{'backslash_math'} = '';

$result_nodes_list{'backslash_math'} = '';

$result_sections_list{'backslash_math'} = '';

$result_sectioning_root{'backslash_math'} = '';

$result_headings_list{'backslash_math'} = '';


$result_converted{'latex_text'}->{'backslash_math'} = '\\begin{document}
$a \\backslash{} b \\mathtt{\\backslash{}} c$.
';

1;
