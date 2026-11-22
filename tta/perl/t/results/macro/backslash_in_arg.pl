use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'backslash_in_arg'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C9 l2 {chap}
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l4
  |formal_args:A{TEXT}
  |macro_name:{funindex}
   *arguments_line C1
    {macro_line: funindex {TEXT}\\n}
   {raw:@findex \\TEXT\\\\n}
   *normal_command@end C1 l6
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call_line@funindex C1
    >*line_arg C2
     >{spaces_before_argument: }
     >{normal_text:\\\\q}
  *index_entry_command@findex C1 l8:@funindex
  |element_node:{chap}
  |index_entry:I{fn,1}
  >SOURCEMARKS
  >macro_expansion<start;2>
   >*macro_call@funindex C1
    >*brace_arg C1
     >{macro_call_arg_text:\\r}
     >>SOURCEMARKS
     >>macro_arg_escape_backslash<1>
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:\\\\q}
    >SOURCEMARKS
    >macro_expansion<end;1><p:3>
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 l9:@funindex
  |element_node:{chap}
  |index_entry:I{fn,2}
  >SOURCEMARKS
  >macro_expansion<start;3>
   >*macro_call_line@funindex C1
    >*line_arg C2
     >{spaces_before_argument: }
     >{normal_text:\\q}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:\\r}
    >SOURCEMARKS
    >macro_expansion<end;2><p:2>
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 l10:@funindex
  |element_node:{chap}
  |index_entry:I{fn,3}
  >SOURCEMARKS
  >macro_expansion<start;4>
   >*macro_call@funindex C1
    >*brace_arg C1
     >{macro_call_arg_text:\\r}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:\\q}
    >SOURCEMARKS
    >macro_expansion<end;3><p:2>
    {spaces_after_argument:\\n}
  *index_entry_command@findex C1 l11:@funindex
  |element_node:{chap}
  |index_entry:I{fn,4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:\\r}
    >SOURCEMARKS
    >macro_expansion<end;4><p:2>
    {spaces_after_argument:\\n}
  *normal_command@printindex C1 l12
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
';


$result_texis{'backslash_in_arg'} = '@node Top
@node chap

@macro funindex {TEXT}
@findex \\TEXT\\
@end macro

@findex \\\\q
@findex \\r
@findex \\q
@findex \\r
@printindex fn
';


$result_texts{'backslash_in_arg'} = '

';

$result_errors{'backslash_in_arg'} = '* W l2|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'backslash_in_arg'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'backslash_in_arg'} = '';

$result_sectioning_root{'backslash_in_arg'} = '';

$result_headings_list{'backslash_in_arg'} = '';

$result_indices_sort_strings{'backslash_in_arg'} = 'fn:
 \\\\q
 \\q
 \\r
 \\r
';

1;
