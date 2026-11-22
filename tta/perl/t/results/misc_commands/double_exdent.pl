use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_exdent'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@example C4 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:Example   Hoho.\\n}
   *@example C4 l3
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:Nested Other line\\n}
    *@exdent C1 l5
     *line_arg C2
      {spaces_before_argument: }
      *@exdent C1 l5
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:double  exdented nested other line}
        {spaces_after_argument:\\n}
    *@end C1 l6
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'double_exdent'} = '@example
Example   Hoho.
@example
Nested Other line
@exdent @exdent double  exdented nested other line
@end example
@end example
';


$result_texts{'double_exdent'} = 'Example   Hoho.
Nested Other line
double  exdented nested other line
';

$result_errors{'double_exdent'} = '* W l5|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l5|@exdent should not appear in @exdent
 warning: @exdent should not appear in @exdent

';

$result_nodes_list{'double_exdent'} = '';

$result_sections_list{'double_exdent'} = '';

$result_sectioning_root{'double_exdent'} = '';

$result_headings_list{'double_exdent'} = '';

1;
