use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_deftype'} = '*document_root C1
 *before_node_section C8
  *preamble
  *normal_command@deftypefun C3 l1
   *def_line C1 l1
   |def_command:{deftypefun}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deftypefun}
    *block_line_arg C15
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_type C1
      *bracketed_arg l1
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:f}
     {spaces: }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:const}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:type&}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:x}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:Deftypefun.\\n}
   *normal_command@end C1 l3
   |text_arg:{deftypefun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defun C3 l5
   *def_line C1 l5
   |def_command:{defun}
   |index_entry:I{fn,2}
   |original_def_cmdname:{defun}
    *block_line_arg C13
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:f}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:const}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:type&}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:x}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:Defun.\\n}
   *normal_command@end C1 l7
   |text_arg:{defun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypemethod C3 l9
   *def_line C1 l9
   |def_command:{deftypemethod}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deftypemethod}
    *block_line_arg C17
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Method}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c}
     {spaces: }
     *def_type C1
      *bracketed_arg l9
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:f}
     {spaces: }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:const}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:type&}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:x}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:Deftypemethod.\\n}
   *normal_command@end C1 l11
   |text_arg:{deftypemethod}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypemethod}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defmethod C3 l13
   *def_line C1 l13
   |def_command:{defmethod}
   |index_entry:I{fn,4}
   |original_def_cmdname:{defmethod}
    *block_line_arg C15
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Method}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:f}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:const}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:type&}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:x}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:Defmethod.\\n}
   *normal_command@end C1 l15
   |text_arg:{defmethod}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defmethod}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_deftype'} = '@deftypefun {} f (const type& x)
Deftypefun.
@end deftypefun

@defun f (const type& x)
Defun.
@end defun

@deftypemethod c {} f (const type& x)
Deftypemethod.
@end deftypemethod

@defmethod c f (const type& x)
Defmethod.
@end defmethod
';


$result_texts{'empty_deftype'} = 'Function:  f (const type& x)
Deftypefun.

Function: f (const type& x)
Defun.

Method on c:  f (const type& x)
Deftypemethod.

Method on c: f (const type& x)
Defmethod.
';

$result_errors{'empty_deftype'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l5|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l9|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l13|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'empty_deftype'} = '';

$result_sections_list{'empty_deftype'} = '';

$result_sectioning_root{'empty_deftype'} = '';

$result_headings_list{'empty_deftype'} = '';

$result_indices_sort_strings{'empty_deftype'} = 'fn:
 f
 f
 f on c
 f on c
';

1;
