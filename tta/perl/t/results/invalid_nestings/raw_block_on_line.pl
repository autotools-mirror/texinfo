use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'raw_block_on_line'} = '*document_root C1
 *before_node_section C2
  *preamble
  *index_entry_command@cindex C1 l1
  |index_entry:I{cp,1}
   *line_arg C2
    {spaces_before_argument: }
    *normal_command@tex C1 l1
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
';


$result_texis{'raw_block_on_line'} = '@cindex @tex
';


$result_texts{'raw_block_on_line'} = '';

$result_errors{'raw_block_on_line'} = '* W l1|@tex should only appear at the beginning of a line
 warning: @tex should only appear at the beginning of a line

* E l1|no matching `@end tex\'
 no matching `@end tex\'

* W l1|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W l1|empty index key in @cindex
 warning: empty index key in @cindex

';

$result_nodes_list{'raw_block_on_line'} = '';

$result_sections_list{'raw_block_on_line'} = '';

$result_sectioning_root{'raw_block_on_line'} = '';

$result_headings_list{'raw_block_on_line'} = '';

1;
