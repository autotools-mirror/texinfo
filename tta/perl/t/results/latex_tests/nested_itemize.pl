use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_itemize'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *@itemize C5 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C1
    {spaces_before_paragraph:   }
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C2
     {normal_text:First level item\\n}
     {normal_text:   }
   *@item C3 l3
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:First level item\\n}
    *@itemize C5 l4
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *before_item C1
      {spaces_before_paragraph:     }
     *@item C2 l5
     |EXTRA
     |item_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:Second level item\\n}
       {normal_text:     }
     *@item C3 l6
     |EXTRA
     |item_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:Second level item\\n}
      *@itemize C5 l7
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *before_item C1
        {spaces_before_paragraph:       }
       *@item C2 l8
       |EXTRA
       |item_number:{1}
        {ignorable_spaces_after_command: }
        *paragraph C2
         {normal_text:Third level item\\n}
         {normal_text:       }
       *@item C3 l9
       |EXTRA
       |item_number:{2}
        {ignorable_spaces_after_command: }
        *paragraph C1
         {normal_text:Third level item\\n}
        *@itemize C5 l10
         *arguments_line C1
          *block_line_arg C1
           {spaces_before_argument:\\n}
         *before_item C1
          {spaces_before_paragraph:         }
         *@item C2 l11
         |EXTRA
         |item_number:{1}
          {ignorable_spaces_after_command: }
          *paragraph C2
           {normal_text:Fourth level item\\n}
           {normal_text:         }
         *@item C2 l12
         |EXTRA
         |item_number:{2}
          {ignorable_spaces_after_command: }
          *paragraph C1
           {normal_text:Fourth level item\\n}
         *@end C1 l13
         |EXTRA
         |text_arg:{itemize}
          *line_arg C3
           {spaces_before_argument: }
           {normal_text:itemize}
           {spaces_after_argument:\\n}
       *@end C1 l14
       |EXTRA
       |text_arg:{itemize}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:itemize}
         {spaces_after_argument:\\n}
     *@end C1 l15
     |EXTRA
     |text_arg:{itemize}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:itemize}
       {spaces_after_argument:\\n}
   *@end C1 l16
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'nested_itemize'} = '@itemize
   @item First level item
   @item First level item
@itemize
     @item Second level item
     @item Second level item
@itemize
       @item Third level item
       @item Third level item
@itemize
         @item Fourth level item
         @item Fourth level item
@end itemize
@end itemize
@end itemize
@end itemize

';


$result_texts{'nested_itemize'} = 'First level item
   First level item
Second level item
     Second level item
Third level item
       Third level item
Fourth level item
         Fourth level item

';

$result_errors{'nested_itemize'} = '';

$result_nodes_list{'nested_itemize'} = '';

$result_sections_list{'nested_itemize'} = '';

$result_sectioning_root{'nested_itemize'} = '';

$result_headings_list{'nested_itemize'} = '';


$result_converted{'latex_text'}->{'nested_itemize'} = '\\begin{document}
\\begin{itemize}
   \\item First level item
   \\item First level item
\\begin{itemize}
     \\item Second level item
     \\item Second level item
\\begin{itemize}
       \\item Third level item
       \\item Third level item
\\begin{itemize}
         \\item Fourth level item
         \\item Fourth level item
\\end{itemize}
\\end{itemize}
\\end{itemize}
\\end{itemize}

';

1;
