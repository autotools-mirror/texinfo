use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'command_brace_no_arg_punctuation'} = '*document_root C1
 *before_node_section C1
  *paragraph C8
   *@TeX C1 l1
    *brace_container
   {. And }
   *@LaTeX C1 l1
    *brace_container
   {. }
   *@copyright C1 l1
    *brace_container
   {. }
   *@registeredsymbol C1 l1
    *brace_container
   {. End.\\n}
';


$result_texis{'command_brace_no_arg_punctuation'} = '@TeX{}. And @LaTeX{}. @copyright{}. @registeredsymbol{}. End.
';


$result_texts{'command_brace_no_arg_punctuation'} = 'TeX. And LaTeX. (C). (R). End.
';

$result_errors{'command_brace_no_arg_punctuation'} = '';

$result_nodes_list{'command_brace_no_arg_punctuation'} = '';

$result_sections_list{'command_brace_no_arg_punctuation'} = '';

$result_sectioning_root{'command_brace_no_arg_punctuation'} = '';

$result_headings_list{'command_brace_no_arg_punctuation'} = '';


$result_converted{'plaintext'}->{'command_brace_no_arg_punctuation'} = 'TeX.  And LaTeX.  ©.  ®.  End.
';

1;
