use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'end_of_lines_protected'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@deffn C3 l1
   *def_line C1 l1
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C21
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:category}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:deffn_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:arguments}
     {spaces:    }
     >SOURCEMARKS
     >defline_continuation<1><p:1>
     *def_arg C1
      *def_line_arg C1
       {normal_text:more}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l2
       {normal_text:args   with end of line within}
       >SOURCEMARKS
       >defline_continuation<2><p:5>
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:with}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@@
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@@
       >SOURCEMARKS
       >defline_continuation<3>
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l4
       {normal_text:one last arg}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:deffn\\n}
   *normal_command@end C1 l6
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'end_of_lines_protected'} = '@deffn category deffn_name arguments    more {args   with end of line within} with 3 @@ @@ {one last arg}
deffn
@end deffn
';


$result_texts{'end_of_lines_protected'} = 'category: deffn_name arguments    more args   with end of line within with 3 @ @ one last arg
deffn
';

$result_errors{'end_of_lines_protected'} = '* W l4|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'end_of_lines_protected'} = '';

$result_sections_list{'end_of_lines_protected'} = '';

$result_sectioning_root{'end_of_lines_protected'} = '';

$result_headings_list{'end_of_lines_protected'} = '';

$result_indices_sort_strings{'end_of_lines_protected'} = 'fn:
 deffn_name
';


$result_converted{'plaintext'}->{'end_of_lines_protected'} = ' -- category: deffn_name arguments more args with end of line within
          with 3 @ @ one last arg
     deffn
';

$result_converted_sort_strings{'plaintext'}->{'end_of_lines_protected'} = 'fn:
 deffn_name
';

1;
