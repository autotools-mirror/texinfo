use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_def_command'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@deffn C2 l1
   *def_line C1 l1
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:empty}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:deffn}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l4
   *def_line C1 l4
   |def_command:{deffn}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:empty}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:deffn}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:with}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:deffnx}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l5
   |def_command:{deffn}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deffnx}
    *line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:empty}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:deffnx}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l6
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_def_command'} = '@deffn empty deffn
@end deffn

@deffn empty deffn with deffnx
@deffnx empty deffnx
@end deffn
';


$result_texts{'empty_def_command'} = 'empty: deffn

empty: deffn with deffnx
empty: deffnx
';

$result_errors{'empty_def_command'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l4|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l5|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'empty_def_command'} = '';

$result_sections_list{'empty_def_command'} = '';

$result_sectioning_root{'empty_def_command'} = '';

$result_headings_list{'empty_def_command'} = '';

$result_indices_sort_strings{'empty_def_command'} = 'fn:
 deffn
 deffn
 deffnx
';


$result_converted{'plaintext'}->{'empty_def_command'} = ' -- empty: deffn

 -- empty: deffn with deffnx
 -- empty: deffnx
';

$result_converted_sort_strings{'plaintext'}->{'empty_def_command'} = 'fn:
 deffn
 deffn
 deffnx
';

1;
