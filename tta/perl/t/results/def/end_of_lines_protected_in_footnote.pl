use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'end_of_lines_protected_in_footnote'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   *@footnote C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:\\n}
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *@deffn C3 l2
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *def_line C1 l2
      |EXTRA
      |def_command:{deffn}
      |def_index_element:
       |* C1
        |*def_line_arg C1
         |{deffn_name}
      |index_entry:I{fn,1}
      |original_def_cmdname:{deffn}
       *block_line_arg C21
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        *def_category C1
         *def_line_arg C1
          {category}
        {spaces: }
        *def_name C1
         *def_line_arg C1
          {deffn_name}
        {spaces: }
        *def_arg C1
         *def_line_arg C1
          {arguments}
        {spaces: }
        *def_arg C1
         *def_line_arg C1
          {arg2}
        {spaces:    }
        >SOURCEMARKS
        >defline_continuation<1><p:1>
        *def_arg C1
         *def_line_arg C1
          {more}
        {spaces: }
        *def_arg C1
         *bracketed_arg C1 l3
          {args   with end of line within}
          >SOURCEMARKS
          >defline_continuation<2><p:5>
        {spaces: }
        *def_arg C1
         *def_line_arg C1
          {with}
        {spaces: }
        *def_arg C1
         *def_line_arg C1
          {3}
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
         *bracketed_arg C1 l5
          {one last arg}
      *def_item C1
       *paragraph C1
        {deffn\\n}
      *@end C1 l7
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{deffn}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {deffn}
   {\\n}
';


$result_texis{'end_of_lines_protected_in_footnote'} = '@footnote{
@deffn category deffn_name arguments arg2    more {args   with end of line within} with 3 @@ @@ {one last arg}
deffn
@end deffn
}
';


$result_texts{'end_of_lines_protected_in_footnote'} = '
';

$result_errors{'end_of_lines_protected_in_footnote'} = '* W l5|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'end_of_lines_protected_in_footnote'} = '';

$result_sections_list{'end_of_lines_protected_in_footnote'} = '';

$result_sectioning_root{'end_of_lines_protected_in_footnote'} = '';

$result_headings_list{'end_of_lines_protected_in_footnote'} = '';

$result_indices_sort_strings{'end_of_lines_protected_in_footnote'} = 'fn:
 deffn_name
';


$result_converted{'plaintext'}->{'end_of_lines_protected_in_footnote'} = '(1)

   ---------- Footnotes ----------

   (1)  -- category: deffn_name arguments arg2 more args with end of
          line within with 3 @ @ one last arg
     deffn

';

1;
