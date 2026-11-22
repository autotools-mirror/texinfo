use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'leading_space_in_def_arg'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@deffn C2 l1
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:category}
     {spaces: }
     *def_name C1
      *bracketed_arg C2 l1
       {spaces_before_argument: }
       {normal_text:name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:arg}
     {spaces_after_argument:\\n}
   *@end C1 l2
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'leading_space_in_def_arg'} = '@deffn category { name} arg
@end deffn
';


$result_texts{'leading_space_in_def_arg'} = 'category: name arg
';

$result_errors{'leading_space_in_def_arg'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'leading_space_in_def_arg'} = '';

$result_sections_list{'leading_space_in_def_arg'} = '';

$result_sectioning_root{'leading_space_in_def_arg'} = '';

$result_headings_list{'leading_space_in_def_arg'} = '';

$result_indices_sort_strings{'leading_space_in_def_arg'} = 'fn:
 name
';


$result_converted{'plaintext'}->{'leading_space_in_def_arg'} = ' -- category: name arg
';

$result_converted_sort_strings{'plaintext'}->{'leading_space_in_def_arg'} = 'fn:
 name
';

1;
