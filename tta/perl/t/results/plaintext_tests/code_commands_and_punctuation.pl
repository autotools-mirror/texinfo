use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'code_commands_and_punctuation'} = '*document_root C1
 *before_node_section C1
  *paragraph C4
   *@code C1 l1
    *brace_container C1
     {AA}
   {. }
   *@samp C1 l1
    *brace_container C1
     {aa}
   {. After.\\n}
';


$result_texis{'code_commands_and_punctuation'} = '@code{AA}. @samp{aa}. After.
';


$result_texts{'code_commands_and_punctuation'} = 'AA. aa. After.
';

$result_errors{'code_commands_and_punctuation'} = '';

$result_nodes_list{'code_commands_and_punctuation'} = '';

$result_sections_list{'code_commands_and_punctuation'} = '';

$result_sectioning_root{'code_commands_and_punctuation'} = '';

$result_headings_list{'code_commands_and_punctuation'} = '';


$result_converted{'plaintext'}->{'code_commands_and_punctuation'} = '‘AA’.  ‘aa’.  After.
';

1;
