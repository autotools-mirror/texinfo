use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'wrong_braces_simple'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content
  *normal_command@deffn C2 l1
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces_after_argument: \\n}
   *normal_command@end C1 l2
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C2 l4
   *def_line C1 l4
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces:  }
     *def_arg C1
      *def_line_arg C1
       {normal_text:after}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l5
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C2 l7
   *def_line C1 l7
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deffn}
    *block_line_arg C12
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l7
       {spaces_before_argument:\\n}
   *normal_command@end C1 l8
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C2 l10
   *def_line C1 l10
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,4}
   |original_def_cmdname:{deffn}
    *block_line_arg C12
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces: }
     *def_arg C1
      *bracketed_arg C3 l10
       {spaces_before_argument: }
       {normal_text:and after}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l11
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C6 l13
   *def_line C1 l13
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,5}
   |original_def_cmdname:{deffn}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:c}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:d}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:e}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l14
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,6}
   |original_def_cmdname:{deffnx}
    *line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces_after_argument: \\n}
   *normal_command@deffnx C1 l15
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,7}
   |original_def_cmdname:{deffnx}
    *line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces:  }
     *def_arg C1
      *def_line_arg C1
       {normal_text:after}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l16
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,8}
   |original_def_cmdname:{deffnx}
    *line_arg C12
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l16
       {spaces_before_argument:\\n}
   *normal_command@deffnx C1 l17
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,9}
   |original_def_cmdname:{deffnx}
    *line_arg C12
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces: }
     *def_arg C1
      *bracketed_arg C3 l17
       {spaces_before_argument: }
       {normal_text:and after}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l18
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'wrong_braces_simple'} = '@deffn truc machin bidule chose and 
@end deffn

@deffn truc machin bidule chose and  after
@end deffn

@deffn truc machin bidule chose and {
}@end deffn

@deffn truc machin bidule chose and { and after
}@end deffn

@deffn a b c d e
@deffnx truc machin bidule chose and 
@deffnx truc machin bidule chose and  after
@deffnx truc machin bidule chose and {
}@deffnx truc machin bidule chose and { and after
}@end deffn
';


$result_texts{'wrong_braces_simple'} = 'truc: machin bidule chose and

truc: machin bidule chose and  after

truc: machin bidule chose and 

truc: machin bidule chose and and after

a: b c d e
truc: machin bidule chose and
truc: machin bidule chose and  after
truc: machin bidule chose and 
truc: machin bidule chose and and after
';

$result_errors{'wrong_braces_simple'} = '* E l1|misplaced }
 misplaced }

* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l4|misplaced }
 misplaced }

* W l4|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l7|misplaced {
 misplaced {

* W l7|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l10|misplaced {
 misplaced {

* W l10|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l13|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l14|misplaced }
 misplaced }

* W l14|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l15|misplaced }
 misplaced }

* W l15|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l16|misplaced {
 misplaced {

* W l16|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l17|misplaced {
 misplaced {

* W l17|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'wrong_braces_simple'} = '';

$result_sections_list{'wrong_braces_simple'} = '';

$result_sectioning_root{'wrong_braces_simple'} = '';

$result_headings_list{'wrong_braces_simple'} = '';

$result_indices_sort_strings{'wrong_braces_simple'} = 'fn:
 b
 machin
 machin
 machin
 machin
 machin
 machin
 machin
 machin
';

1;
