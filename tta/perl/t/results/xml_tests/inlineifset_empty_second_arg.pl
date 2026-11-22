use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inlineifset_empty_second_arg'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *paragraph C3
   {normal_text:Toto }
   *normal_command@inlineifset C2 l1
   |EXTRA
   |format:{flag}
    *brace_arg C1
     {normal_text:flag}
    *elided_brace_command_arg C1
     {raw:}
   {normal_text:. After.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Again with space }
   *normal_command@inlineifset C2 l3
   |EXTRA
   |format:{flag}
    *brace_arg C1
     {normal_text:flag}
    *elided_brace_command_arg C1
     {raw: }
   {normal_text:. After.\\n}
';


$result_texis{'inlineifset_empty_second_arg'} = 'Toto @inlineifset{flag,}. After.

Again with space @inlineifset{flag, }. After.
';


$result_texts{'inlineifset_empty_second_arg'} = 'Toto . After.

Again with space . After.
';

$result_errors{'inlineifset_empty_second_arg'} = '';

$result_nodes_list{'inlineifset_empty_second_arg'} = '';

$result_sections_list{'inlineifset_empty_second_arg'} = '';

$result_sectioning_root{'inlineifset_empty_second_arg'} = '';

$result_headings_list{'inlineifset_empty_second_arg'} = '';


$result_converted{'xml'}->{'inlineifset_empty_second_arg'} = '<para>Toto <inlineifset><inlineifsetformat>flag</inlineifsetformat><inlineifsetcontent></inlineifsetcontent></inlineifset>. After.
</para>
<para>Again with space <inlineifset><inlineifsetformat>flag</inlineifsetformat><inlineifsetcontent> </inlineifsetcontent></inlineifset>. After.
</para>';

1;
