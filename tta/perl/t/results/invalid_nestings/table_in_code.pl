use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'table_in_code'} = '*document_root C1
 *before_node_section C3
  *paragraph C1
   *@code C1 l1
    *brace_container C2
     {\\n}
     {in code\\n}
  *@table C3 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph l3
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
       {line}
    *table_definition C1
     *paragraph C1
      {text\\n}
   *@end C1 l6
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{table}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {table}
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
</code></para><table commandarg="emph" spaces=" " endspaces=" ">
<tableentry><tableterm><item spaces=" "><itemformat command="emph">line</itemformat></item>
</tableterm><tableitem><para>text
</para></tableitem></tableentry></table>

';

1;
