use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_multitable'} = '*document_root C1
 *before_node_section C3
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@multitable C3 l2
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C3 l2
      {normal_text:truc AAAA }
      *normal_command@ 
      {normal_text: machin}
     {normal_text:    }
     *bracketed_arg C1 l2
      {normal_text:bidule}
     {spaces_after_argument:\\n}
   *multitable_body C2
    *row C2
    |EXTRA
    |row_number:{1}
     *normal_command@item C3 l3
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command:\\n}
      *normal_command@multitable C3 l4
      |EXTRA
      |max_columns:{2}
       *arguments_line C1
        *block_line_arg C5
         {spaces_before_argument: }
         *bracketed_arg C1 l4
          {normal_text:AAAA}
         {normal_text: }
         *bracketed_arg C1 l4
          {normal_text:machin}
         {spaces_after_argument:\\n}
       *multitable_body C1
        *row C2
        |EXTRA
        |row_number:{1}
         *normal_command@item C2 l5
         |EXTRA
         |cell_number:{1}
          {ignorable_spaces_after_command: }
          *paragraph C1
           {normal_text:AAAA }
         *normal_command@tab C2 l5
         |EXTRA
         |cell_number:{2}
          {ignorable_spaces_after_command: }
          *paragraph C1
           {normal_text:machin\\n}
       *normal_command@end C1 l6
       |EXTRA
       |text_arg:{multitable}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:multitable}
         {spaces_after_argument:\\n}
      {spaces_before_paragraph: }
     *normal_command@tab C2 l7
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:bidule\\n}
    *row C2
    |EXTRA
    |row_number:{2}
     *normal_command@item C2 l8
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:other item }
     *normal_command@tab C2 l8
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:in tab\\n}
   *normal_command@end C1 l9
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'nested_multitable'} = '
@multitable {truc AAAA @  machin}    {bidule}
@item
@multitable {AAAA} {machin}
@item AAAA @tab machin
@end multitable
 @tab bidule
@item other item @tab in tab
@end multitable
';


$result_texts{'nested_multitable'} = 'AAAA machin
bidule
other item in tab
';

$result_errors{'nested_multitable'} = '';

$result_nodes_list{'nested_multitable'} = '';

$result_sections_list{'nested_multitable'} = '';

$result_sectioning_root{'nested_multitable'} = '';

$result_headings_list{'nested_multitable'} = '';


$result_converted{'plaintext'}->{'nested_multitable'} = 'AAAA   machin        bidule
other item           in tab
';

1;
