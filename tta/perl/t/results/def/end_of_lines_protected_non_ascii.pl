use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'end_of_lines_protected_non_ascii'} = '*document_root C1
 *before_node_section C4
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *@deffn C3 end_of_lines_protected_non_ascii.texi:l2
   *def_line C1 end_of_lines_protected_non_ascii.texi:l2
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C21
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:catégorie}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:deffn_nùme}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:àrguments}
     {spaces:    }
     >SOURCEMARKS
     >defline_continuation<1><p:1>
     *def_arg C1
      *def_line_arg C1
       {normal_text:more}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 end_of_lines_protected_non_ascii.texi:l3
       {normal_text:àrgs   with end ôf line within}
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
       *@@
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@@
       >SOURCEMARKS
       >defline_continuation<3>
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 end_of_lines_protected_non_ascii.texi:l5
       {normal_text:one last arg}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:deffn\\n}
   *@end C1 end_of_lines_protected_non_ascii.texi:l7
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'end_of_lines_protected_non_ascii'} = '
@deffn catégorie deffn_nùme àrguments    more {àrgs   with end ôf line within} with 3 @@ @@ {one last arg}
deffn
@end deffn

';


$result_texts{'end_of_lines_protected_non_ascii'} = 'catégorie: deffn_nùme àrguments    more àrgs   with end ôf line within with 3 @ @ one last arg
deffn

';

$result_errors{'end_of_lines_protected_non_ascii'} = '* W end_of_lines_protected_non_ascii.texi:l5|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'end_of_lines_protected_non_ascii'} = '';

$result_sections_list{'end_of_lines_protected_non_ascii'} = '';

$result_sectioning_root{'end_of_lines_protected_non_ascii'} = '';

$result_headings_list{'end_of_lines_protected_non_ascii'} = '';

$result_indices_sort_strings{'end_of_lines_protected_non_ascii'} = 'fn:
 deffn_nùme
';


$result_converted{'plaintext'}->{'end_of_lines_protected_non_ascii'} = ' -- catégorie: deffn_nùme àrguments more àrgs with end ôf line within
          with 3 @ @ one last arg
     deffn

';

$result_converted_sort_strings{'plaintext'}->{'end_of_lines_protected_non_ascii'} = 'fn:
 deffn_nùme
';

1;
