use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'itemize_in_headitem_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@example C10 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@itemize C3 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *before_item C1
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:a \\n}
    *normal_command@end C1 l4
    |text_arg:{itemize}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemize}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *normal_command@itemize C3 l6
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@item C2 l7
    |item_number:{1}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:bbb\\n}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:ccc\\n}
    *normal_command@end C1 l9
    |text_arg:{itemize}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemize}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *normal_command@itemize C4 l11
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *before_item C1
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:ddd\\n}
    *normal_command@item C1 l13
    |item_number:{1}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:eee\\n}
    *normal_command@end C1 l14
    |text_arg:{itemize}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemize}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *normal_command@itemize C4 l16
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@item C2 l17
    |item_number:{1}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:fff\\n}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:ggg\\n}
    *normal_command@item C1 l19
    |item_number:{2}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:hhh\\n}
    *normal_command@end C1 l20
    |text_arg:{itemize}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemize}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *normal_command@end C1 l22
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'itemize_in_headitem_in_example'} = '@example
@itemize
 a 
@end itemize

@itemize
@item bbb
 ccc
@end itemize

@itemize
 ddd
@item eee
@end itemize

@itemize
@item fff
 ggg
@item hhh
@end itemize

@end example
';


$result_texts{'itemize_in_headitem_in_example'} = 'a 

bbb
ccc

ddd
eee

fff
ggg
hhh

';

$result_errors{'itemize_in_headitem_in_example'} = '* E l3|@headitem not meaningful inside `@itemize\' block
 @headitem not meaningful inside `@itemize\' block

* W l2|@itemize has text but no @item
 warning: @itemize has text but no @item

* E l8|@headitem not meaningful inside `@itemize\' block
 @headitem not meaningful inside `@itemize\' block

* E l12|@headitem not meaningful inside `@itemize\' block
 @headitem not meaningful inside `@itemize\' block

* E l18|@headitem not meaningful inside `@itemize\' block
 @headitem not meaningful inside `@itemize\' block

';

$result_nodes_list{'itemize_in_headitem_in_example'} = '';

$result_sections_list{'itemize_in_headitem_in_example'} = '';

$result_sectioning_root{'itemize_in_headitem_in_example'} = '';

$result_headings_list{'itemize_in_headitem_in_example'} = '';


$result_converted{'plaintext'}->{'itemize_in_headitem_in_example'} = '          a

        • bbb
          ccc

          ddd
        • eee

        • fff
          ggg
        • hhh

';

1;
