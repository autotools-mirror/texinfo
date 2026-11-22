use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'accents_errors'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *paragraph C10
   {normal_text:accent at end of line }
   *normal_command@ringaccent C2 l1
    {spaces_after_cmd_before_arg:\\n}
    *following_arg C1
     {normal_text:a}
   {normal_text:ccent at end of line and spaces }
   *normal_command@ringaccent C2 l2
    {spaces_after_cmd_before_arg:  \\n}
    *following_arg C1
     {normal_text:a}
   {normal_text:ccent followed by }
   *normal_command@@
   {normal_text: }
   *normal_command@ringaccent l3
   *normal_command@.
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C11
   {normal_text:accent character with spaces }
   *normal_command@~ C2 l5
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {normal_text:f}
   {normal_text:ollowing.\\n}
   {normal_text:accent character at end of line }
   *normal_command@~ C2 l6
    {spaces_after_cmd_before_arg:\\n}
    *following_arg C1
     {normal_text:a}
   {normal_text:ccent character followed by }
   *normal_command@@
   {normal_text: }
   *normal_command@~ l7
   *normal_command@.
   {normal_text:\\n}
';


$result_texis{'accents_errors'} = 'accent at end of line @ringaccent
accent at end of line and spaces @ringaccent  
accent followed by @@ @ringaccent@.

accent character with spaces @~ following.
accent character at end of line @~
accent character followed by @@ @~@.
';


$result_texts{'accents_errors'} = 'accent at end of line a*ccent at end of line and spaces a*ccent followed by @ *.

accent character with spaces f~ollowing.
accent character at end of line a~ccent character followed by @ ~.
';

$result_errors{'accents_errors'} = '* W l1|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

* W l2|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

* E l3|@ringaccent expected braces
 @ringaccent expected braces

* W l6|command `@~\' must not be followed by new line
 warning: command `@~\' must not be followed by new line

* E l7|@~ expected braces
 @~ expected braces

';

$result_nodes_list{'accents_errors'} = '';

$result_sections_list{'accents_errors'} = '';

$result_sectioning_root{'accents_errors'} = '';

$result_headings_list{'accents_errors'} = '';

1;
