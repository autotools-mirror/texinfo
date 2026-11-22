use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'defx_after_text'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@deffn C4 l1
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:fset}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l1
        *brace_container C1
         {normal_text:i}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:g}
     {spaces_after_argument:\\n}
   *inter_def_item C1
    *paragraph C1
     {normal_text:Text in deffn\\n}
   *@deffnx C1 l3
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,2}
   |not_after_command:{1}
   |original_def_cmdname:{deffnx}
    *line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l3
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:bidulr}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:machin...}
     {spaces_after_argument:\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{deffn}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:deffn}
';


$result_texis{'defx_after_text'} = '@deffn fset @var{i} a g
Text in deffn
@deffnx {truc} bidulr machin...
@end deffn';


$result_texts{'defx_after_text'} = 'fset: i a g
Text in deffn
truc: bidulr machin...
';

$result_errors{'defx_after_text'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l3|must be after `@deffn\' to use `@deffnx\'
 must be after `@deffn\' to use `@deffnx\'

* W l3|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'defx_after_text'} = '';

$result_sections_list{'defx_after_text'} = '';

$result_sectioning_root{'defx_after_text'} = '';

$result_headings_list{'defx_after_text'} = '';

$result_indices_sort_strings{'defx_after_text'} = 'fn:
 bidulr
 i
';

1;
