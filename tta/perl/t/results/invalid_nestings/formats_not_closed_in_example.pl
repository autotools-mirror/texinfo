use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'formats_not_closed_in_example'} = '*document_root C1
 *before_node_section C1
  *@example C4 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *@table C2 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *arguments_line C1
     *block_line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      *@asis l3
    *table_entry C2
     *table_term C1
      *@item C1 l4
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {item}
     *table_definition C2
      *preformatted C3
       {table line\\n}
       {empty_line:\\n}
       {Some text.\\n}
      *@enumerate C4 l8
       *arguments_line C1
        *block_line_arg
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
       *before_item C1
        *preformatted C1
         {empty_line:\\n}
       *@item C1 l10
       |EXTRA
       |item_number:{1}
        *preformatted C2
         {ignorable_spaces_after_command: }
         {first item\\n}
       *@item C1 l11
       |EXTRA
       |item_number:{2}
        *preformatted C3
         {ignorable_spaces_after_command: }
         {an item\\n}
         {empty_line:\\n}
   *@end C1 l13
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
';


$result_texis{'formats_not_closed_in_example'} = '@example

@table @asis
@item item
table line

Some text.
@enumerate

@item first item
@item an item

@end example
';


$result_texts{'formats_not_closed_in_example'} = '
item
table line

Some text.

1. first item
2. an item

';

$result_errors{'formats_not_closed_in_example'} = '* E l13|`@end\' expected `enumerate\', but saw `example\'
 `@end\' expected `enumerate\', but saw `example\'

* E l13|`@end\' expected `table\', but saw `example\'
 `@end\' expected `table\', but saw `example\'

';

$result_nodes_list{'formats_not_closed_in_example'} = '';

$result_sections_list{'formats_not_closed_in_example'} = '';

$result_sectioning_root{'formats_not_closed_in_example'} = '';

$result_headings_list{'formats_not_closed_in_example'} = '';

1;
