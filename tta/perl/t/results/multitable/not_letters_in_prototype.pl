use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'not_letters_in_prototype'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@multitable C3 l1
  |EXTRA
  |max_columns:{0}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument:  }
     {normal_text:1.3  5-6}
     {spaces_after_argument:\\n}
   *before_item C4
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:1.3 }
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:5-6\\n}
   *@end C1 l3
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'not_letters_in_prototype'} = '@multitable  1.3  5-6
 1.3  5-6
@end multitable
';


$result_texts{'not_letters_in_prototype'} = '1.3 5-6
';

$result_errors{'not_letters_in_prototype'} = '* W l1|empty multitable
 warning: empty multitable

* W l2|@item in empty multitable
 warning: @item in empty multitable

* W l2|@tab in empty multitable
 warning: @tab in empty multitable

* W l1|@multitable has text but no @item
 warning: @multitable has text but no @item

';

$result_nodes_list{'not_letters_in_prototype'} = '';

$result_sections_list{'not_letters_in_prototype'} = '';

$result_sectioning_root{'not_letters_in_prototype'} = '';

$result_headings_list{'not_letters_in_prototype'} = '';


$result_converted{'plaintext'}->{'not_letters_in_prototype'} = '1.3
5-6
';


$result_converted{'html_text'}->{'not_letters_in_prototype'} = '<table class="multitable">
<tr><td>1.3 <p>5-6
</p></td></tr>
</table>
';


$result_converted{'xml'}->{'not_letters_in_prototype'} = '<multitable endspaces=" "><columnprototypes>  1.3  5-6
</columnprototypes>
<beforefirstitem> <para>1.3 </para> <para>5-6
</para></beforefirstitem></multitable>
';

1;
