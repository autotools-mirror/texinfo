use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'verb_not_closed_with_char'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C1
   *normal_command@verb C1 l1
    *brace_container C7
     {verb_delimiter:*}
     {raw:\\n}
     {raw:\\n}
     {raw:In verb\\n}
     {raw:\\n}
     {raw:*}
     {verb_delimiter:*}
';


$result_texis{'verb_not_closed_with_char'} = '@verb{*

In verb

**}';


$result_texts{'verb_not_closed_with_char'} = '

In verb

*';

$result_errors{'verb_not_closed_with_char'} = '* E l1|@verb missing closing delimiter sequence: *}
 @verb missing closing delimiter sequence: *}

';

$result_nodes_list{'verb_not_closed_with_char'} = '';

$result_sections_list{'verb_not_closed_with_char'} = '';

$result_sectioning_root{'verb_not_closed_with_char'} = '';

$result_headings_list{'verb_not_closed_with_char'} = '';

1;
