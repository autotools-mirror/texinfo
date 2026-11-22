use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'def_in_style_command'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *paragraph C1
   *@code C1 l1
    *brace_container C1
     {normal_text:\\n}
  *@defun C3 l2
   *def_line C1 l2
   |EXTRA
   |def_command:{defun}
   |index_entry:I{fn,1}
   |original_def_cmdname:{defun}
    *block_line_arg C7
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:args...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:text\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{defun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defun}
     {spaces_after_argument:\\n}
';


$result_texis{'def_in_style_command'} = '@code{
}@defun name args...
text
@end defun
';


$result_texts{'def_in_style_command'} = '
Function: name args...
text
';

$result_errors{'def_in_style_command'} = '* E l1|@code missing closing brace
 @code missing closing brace

* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l5|misplaced }
 misplaced }

';

$result_nodes_list{'def_in_style_command'} = '';

$result_sections_list{'def_in_style_command'} = '';

$result_sectioning_root{'def_in_style_command'} = '';

$result_headings_list{'def_in_style_command'} = '';

$result_indices_sort_strings{'def_in_style_command'} = 'fn:
 name
';

1;
