use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_deftypeop_name'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@deftypeop C2 l1
   *def_line C1 l1
   |EXTRA
   |def_command:{deftypeop}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C2
       {normal_text:Command}
       *normal_command@code C1 l1
        *brace_container C1
         {normal_text:com}
     {spaces: }
     *def_class C1
      *bracketed_arg C2 l1
       {normal_text:Window}
       *normal_command@code C1 l1
        *brace_container C1
         {normal_text:int}
     {spaces: }
     *def_type C1
      *def_line_arg C2
       {normal_text:expose}
       *normal_command@var C1 l1
        *brace_container C1
         {normal_text:exp}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_deftypeop_name'} = '@deftypeop Command@code{com} {Window@code{int}} expose@var{exp}
@end deftypeop
';


$result_texts{'empty_deftypeop_name'} = 'Commandcom on Windowint: exposeexp 
';

$result_errors{'empty_deftypeop_name'} = '* W l1|missing name for @deftypeop
 warning: missing name for @deftypeop

';

$result_nodes_list{'empty_deftypeop_name'} = '';

$result_sections_list{'empty_deftypeop_name'} = '';

$result_sectioning_root{'empty_deftypeop_name'} = '';

$result_headings_list{'empty_deftypeop_name'} = '';

1;
