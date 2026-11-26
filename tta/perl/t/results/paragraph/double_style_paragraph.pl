use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_style_paragraph'} = '*document_root C1
 *before_node_section C5
  *preamble
  *paragraph C1
   *normal_command@emph C1 l1
    *brace_container C1
     *normal_command@strong C1 l1
      *brace_container C3
       {normal_text:\\n}
       {normal_text:First para.\\n}
       {empty_line:\\n}
  *paragraph C1
   {normal_text:Second para.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
';


$result_texis{'double_style_paragraph'} = '@emph{@strong{
First para.

}}Second para.


';


$result_texts{'double_style_paragraph'} = '
First para.

Second para.


';

$result_errors{'double_style_paragraph'} = '* E l1|@strong missing closing brace
 @strong missing closing brace

* E l1|@emph missing closing brace
 @emph missing closing brace

* E l5|misplaced }
 misplaced }

* E l6|misplaced }
 misplaced }

';

$result_nodes_list{'double_style_paragraph'} = '';

$result_sections_list{'double_style_paragraph'} = '';

$result_sectioning_root{'double_style_paragraph'} = '';

$result_headings_list{'double_style_paragraph'} = '';

1;
