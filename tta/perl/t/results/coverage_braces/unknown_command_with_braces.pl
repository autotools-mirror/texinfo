use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_command_with_braces'} = '*document_root C1
 *before_node_section C13
  *preamble
  *paragraph C1
   {normal_text:Unknown thing \\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Unknown macro  first paragraph\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:second paragraph\\n}
  {empty_line:\\n}
  {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:first paragraph\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:second paragraph\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:third\\n}
';


$result_texis{'unknown_command_with_braces'} = 'Unknown thing 

Unknown macro  first paragraph

second paragraph

 first paragraph

second paragraph

third
';


$result_texts{'unknown_command_with_braces'} = 'Unknown thing 

Unknown macro  first paragraph

second paragraph

first paragraph

second paragraph

third
';

$result_errors{'unknown_command_with_braces'} = '* E l1|unknown command `thing\'
 unknown command `thing\'

* E l1|misplaced {
 misplaced {

* E l1|misplaced }
 misplaced }

* E l3|unknown command `unknown\'
 unknown command `unknown\'

* E l3|misplaced {
 misplaced {

* E l5|misplaced }
 misplaced }

* E l7|unknown command `unknown2\'
 unknown command `unknown2\'

* E l7|misplaced {
 misplaced {

* E l11|misplaced }
 misplaced }

';

$result_nodes_list{'unknown_command_with_braces'} = '';

$result_sections_list{'unknown_command_with_braces'} = '';

$result_sectioning_root{'unknown_command_with_braces'} = '';

$result_headings_list{'unknown_command_with_braces'} = '';

1;
