use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'not_closed'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@deffn C3 l1
   *def_line C1 l1
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:bidule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l2
   |def_command:{deffn}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffnx}
    *line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:chose}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:args}
     {spaces_after_argument:\\n}
   *def_item C1
    *normal_command@defvar C1 l3
     *def_line C1 l3
     |def_command:{defvar}
     |index_entry:I{vr,1}
     |original_def_cmdname:{defvar}
      *block_line_arg C9
       (i){spaces_before_argument: }
       *def_category C1
       |inserted:{1}
        *def_line_arg C1
         {normal_text:Variable}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         {normal_text:type1}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         {normal_text:var}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         {normal_text:bidule}
       {spaces_after_argument:\\n}
';


$result_texis{'not_closed'} = '@deffn truc bidule machin
@deffnx truc chose args
@defvar type1 var bidule
';


$result_texts{'not_closed'} = 'truc: bidule machin
truc: chose args
Variable: type1 var bidule
';

$result_errors{'not_closed'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l3|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* E l3|no matching `@end defvar\'
 no matching `@end defvar\'

* E l1|no matching `@end deffn\'
 no matching `@end deffn\'

';

$result_nodes_list{'not_closed'} = '';

$result_sections_list{'not_closed'} = '';

$result_sectioning_root{'not_closed'} = '';

$result_headings_list{'not_closed'} = '';

$result_indices_sort_strings{'not_closed'} = 'fn:
 bidule
 chose
vr:
 type1
';

1;
