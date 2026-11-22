use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'table_in_code'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *paragraph C1
   *normal_command@code C1 l1
    *brace_container C2
     {normal_text:\\n}
     {normal_text:in code\\n}
  *normal_command@table C3 l3
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@emph l3
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l4
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:line}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:text\\n}
   *normal_command@end C1 l6
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'table_in_code'} = '@code{
in code
}@table @emph
@item line
text
@end table

';


$result_texts{'table_in_code'} = '
in code
line
text

';

$result_errors{'table_in_code'} = '* E l1|@code missing closing brace
 @code missing closing brace

* E l7|misplaced }
 misplaced }

';

$result_nodes_list{'table_in_code'} = '';

$result_sections_list{'table_in_code'} = '';

$result_sectioning_root{'table_in_code'} = '';

$result_headings_list{'table_in_code'} = '';


$result_converted{'plaintext'}->{'table_in_code'} = '‘ in code ’
_line_
     text

';


$result_converted{'xml'}->{'table_in_code'} = '<para><code>
in code
</code></para><table commandarg="emph" endspaces=" ">
<tableentry><tableterm><item><itemformat command="emph"> line</itemformat></item>
</tableterm><tableitem><para>text
</para></tableitem></tableentry></table>

';

1;
