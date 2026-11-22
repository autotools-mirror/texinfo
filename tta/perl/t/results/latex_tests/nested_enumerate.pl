use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_enumerate'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *normal_command@enumerate C5 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C1
    {spaces_before_paragraph:   }
   *normal_command@item C2 l2
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C2
     {normal_text:First level item\\n}
     {normal_text:   }
   *normal_command@item C3 l3
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:First level item\\n}
    *normal_command@enumerate C5 l4
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *before_item C1
      {spaces_before_paragraph:     }
     *normal_command@item C2 l5
     |item_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:Second level item\\n}
       {normal_text:     }
     *normal_command@item C3 l6
     |item_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:Second level item\\n}
      *normal_command@enumerate C5 l7
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *before_item C1
        {spaces_before_paragraph:       }
       *normal_command@item C2 l8
       |item_number:{1}
        {ignorable_spaces_after_command: }
        *paragraph C2
         {normal_text:Third level item\\n}
         {normal_text:       }
       *normal_command@item C3 l9
       |item_number:{2}
        {ignorable_spaces_after_command: }
        *paragraph C1
         {normal_text:Third level item\\n}
        *normal_command@enumerate C5 l10
         *arguments_line C1
          *block_line_arg C1
           {spaces_before_argument:\\n}
         *before_item C1
          {spaces_before_paragraph:         }
         *normal_command@item C2 l11
         |item_number:{1}
          {ignorable_spaces_after_command: }
          *paragraph C2
           {normal_text:Fourth level item\\n}
           {normal_text:         }
         *normal_command@item C2 l12
         |item_number:{2}
          {ignorable_spaces_after_command: }
          *paragraph C1
           {normal_text:Fourth level item\\n}
         *normal_command@end C1 l13
         |text_arg:{enumerate}
          *line_arg C3
           {spaces_before_argument: }
           {normal_text:enumerate}
           {spaces_after_argument:\\n}
       *normal_command@end C1 l14
       |text_arg:{enumerate}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:enumerate}
         {spaces_after_argument:\\n}
     *normal_command@end C1 l15
     |text_arg:{enumerate}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:enumerate}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l16
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'nested_enumerate'} = '@enumerate
   @item First level item
   @item First level item
@enumerate
     @item Second level item
     @item Second level item
@enumerate
       @item Third level item
       @item Third level item
@enumerate
         @item Fourth level item
         @item Fourth level item
@end enumerate
@end enumerate
@end enumerate
@end enumerate

';


$result_texts{'nested_enumerate'} = '1. First level item
   2. First level item
1. Second level item
     2. Second level item
1. Third level item
       2. Third level item
1. Fourth level item
         2. Fourth level item

';

$result_errors{'nested_enumerate'} = '';

$result_nodes_list{'nested_enumerate'} = '';

$result_sections_list{'nested_enumerate'} = '';

$result_sectioning_root{'nested_enumerate'} = '';

$result_headings_list{'nested_enumerate'} = '';


$result_converted{'latex_text'}->{'nested_enumerate'} = '\\begin{document}
\\begin{enumerate}[start=1]
   \\item First level item
   \\item First level item
\\begin{enumerate}[start=1]
     \\item Second level item
     \\item Second level item
\\begin{enumerate}[start=1]
       \\item Third level item
       \\item Third level item
\\begin{enumerate}[start=1]
         \\item Fourth level item
         \\item Fourth level item
\\end{enumerate}
\\end{enumerate}
\\end{enumerate}
\\end{enumerate}

';

1;
