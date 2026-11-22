use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_then_known_index_entry'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C1
   {spaces_before_paragraph: }
  *paragraph C3
   {normal_text:someindex entry.\\n}
   *@defindex C1 l2
   |EXTRA
   |misc_args:A{some}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:some}
     {spaces_after_argument:\\n}
   *index_entry_command@someindex C1 l3
   |EXTRA
   |index_entry:I{some,1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:someindex entry.}
     {spaces_after_argument:\\n}
';


$result_texis{'unknown_then_known_index_entry'} = ' someindex entry.
@defindex some
@someindex someindex entry.
';


$result_texts{'unknown_then_known_index_entry'} = 'someindex entry.
';

$result_errors{'unknown_then_known_index_entry'} = '* E l1|unknown command `someindex\'
 unknown command `someindex\'

* W l3|entry for index `some\' outside of any node
 warning: entry for index `some\' outside of any node

';

$result_indices{'unknown_then_known_index_entry'} = 'cp
fn C
ky C
pg C
some
tp C
vr C
';

$result_nodes_list{'unknown_then_known_index_entry'} = '';

$result_sections_list{'unknown_then_known_index_entry'} = '';

$result_sectioning_root{'unknown_then_known_index_entry'} = '';

$result_headings_list{'unknown_then_known_index_entry'} = '';

$result_indices_sort_strings{'unknown_then_known_index_entry'} = 'some:
 someindex entry.
';

1;
