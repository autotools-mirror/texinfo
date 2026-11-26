use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_refs'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C4
   *normal_command@xref C1 l1
    *brace_arg C1
    |node_content:A{0|0}
     *normal_command@:
   {normal_text:.\\n}
   *normal_command@xref C1 l2
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{-}
     *normal_command@asis C1 l2
      *brace_container C1
       {normal_text: }
   {normal_text:.\\n}
';


$result_texis{'empty_refs'} = '@xref{@:}.
@xref{@asis{ }}.
';


$result_texts{'empty_refs'} = '.
 .
';

$result_errors{'empty_refs'} = '* E l1|@xref reference to nonexistent node `@:\'
 @xref reference to nonexistent node `@:\'

* E l2|@xref reference to nonexistent node `@asis{ }\'
 @xref reference to nonexistent node `@asis{ }\'

';

$result_nodes_list{'empty_refs'} = '';

$result_sections_list{'empty_refs'} = '';

$result_sectioning_root{'empty_refs'} = '';

$result_headings_list{'empty_refs'} = '';

1;
