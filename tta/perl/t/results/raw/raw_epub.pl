use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'raw_epub'} = '*document_root C1
 *before_node_section C2
  *preamble C1
   {empty_line:\\n}
  *paragraph C2
   {normal_text:in EPUB\\n}
   *normal_command@end C1 l3
   |text_arg:{epub}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:epub}
     {spaces_after_argument:\\n}
';


$result_texis{'raw_epub'} = '
in EPUB
@end epub
';


$result_texts{'raw_epub'} = '
in EPUB
';

$result_errors{'raw_epub'} = '* E l1|unknown command `epub\'
 unknown command `epub\'

* W l3|unknown @end epub
 warning: unknown @end epub

';

$result_nodes_list{'raw_epub'} = '';

$result_sections_list{'raw_epub'} = '';

$result_sectioning_root{'raw_epub'} = '';

$result_headings_list{'raw_epub'} = '';


$result_converted{'plaintext'}->{'raw_epub'} = 'in EPUB
';


$result_converted{'xml'}->{'raw_epub'} = '
<para>in EPUB
</para>';

1;
