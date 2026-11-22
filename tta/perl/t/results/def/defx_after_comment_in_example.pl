use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'defx_after_comment_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@deffn C4 l2
    *def_line C1 l2
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
        *@var C1 l2
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
     *preformatted C1
      *@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment}
        {spaces_after_argument:\\n}
    *@deffnx C1 l4
    |EXTRA
    |def_command:{deffn}
    |index_entry:I{fn,2}
    |original_def_cmdname:{deffnx}
     *line_arg C7
      {spaces_before_argument: }
      *def_category C1
       *bracketed_arg C1 l4
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
    *@end C1 l5
    |EXTRA
    |text_arg:{deffn}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:deffn}
      {spaces_after_argument:\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'defx_after_comment_in_example'} = '@example
@deffn fset @var{i} a g
@c comment
@deffnx {truc} bidulr machin...
@end deffn
@end example
';


$result_texts{'defx_after_comment_in_example'} = 'fset: i a g
truc: bidulr machin...
';

$result_errors{'defx_after_comment_in_example'} = '* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l4|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'defx_after_comment_in_example'} = '';

$result_sections_list{'defx_after_comment_in_example'} = '';

$result_sectioning_root{'defx_after_comment_in_example'} = '';

$result_headings_list{'defx_after_comment_in_example'} = '';

$result_indices_sort_strings{'defx_after_comment_in_example'} = 'fn:
 bidulr
 i
';


$result_converted{'plaintext'}->{'defx_after_comment_in_example'} = '      -- fset: I a g
      -- truc: bidulr machin...
';

$result_converted_sort_strings{'plaintext'}->{'defx_after_comment_in_example'} = 'fn:
 bidulr
 i
';

1;
