use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'xref_quote_long_item'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@table C4 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l1
     {spaces_after_argument:\\n}
   *before_item C1
    {empty_line:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l3
      *line_arg C3
       {spaces_before_argument: }
       *normal_command@code C1 l3
        *brace_container C2
         *normal_command@@
         {normal_text:verbatiminclude}
       {spaces_after_argument:\\n}
    *table_definition C2
     *paragraph C2
      *normal_command@xref C4 l4
       *brace_arg C5
       |node_content:A{0|4}
        {normal_text:Texinfo::Convert::Utils $tree = expand_verbatiminclude($registrar}
        *normal_command@comma C1 l4
         *brace_container
        {normal_text: $configuration_information}
        *normal_command@comma C1 l4
         *brace_container
        {normal_text: $verbatiminclude)}
       *brace_arg
       *brace_arg C2
        {spaces_before_argument:\\n}
        {normal_text:Texinfo::Convert::Utils::expand_verbatiminclude}
       *brace_arg C2
        {spaces_before_argument: }
        {normal_text:tp_api}
      {normal_text:.\\n}
     {empty_line:\\n}
   *normal_command@end C1 l7
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'xref_quote_long_item'} = '@table @asis

@item @code{@@verbatiminclude}
@xref{Texinfo::Convert::Utils $tree = expand_verbatiminclude($registrar@comma{} $configuration_information@comma{} $verbatiminclude),,
Texinfo::Convert::Utils::expand_verbatiminclude, tp_api}.

@end table
';


$result_texts{'xref_quote_long_item'} = '
@verbatiminclude
Texinfo::Convert::Utils $tree = expand_verbatiminclude($registrar, $configuration_information, $verbatiminclude).

';

$result_errors{'xref_quote_long_item'} = '';

$result_nodes_list{'xref_quote_long_item'} = '';

$result_sections_list{'xref_quote_long_item'} = '';

$result_sectioning_root{'xref_quote_long_item'} = '';

$result_headings_list{'xref_quote_long_item'} = '';


$result_converted{'info'}->{'xref_quote_long_item'} = Encode::encode('utf-8', 'This is , produced from .

‘@verbatiminclude’
     *Note Texinfo::Convert::Utils::expand_verbatiminclude:
     (tp_api)Texinfo::Convert::Utils $tree =
     expand_verbatiminclude($registrar, $configuration_information,
     $verbatiminclude).


Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'xref_quote_long_item'} = '* W |document without nodes
 warning: document without nodes

';

1;
