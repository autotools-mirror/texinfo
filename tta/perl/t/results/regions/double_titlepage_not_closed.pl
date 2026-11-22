use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_titlepage_not_closed'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *@titlepage C6 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:This is in title page\\n}
    {empty_line:\\n}
    {empty_line:\\n}
    *@titlepage C3 l6
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     {empty_line:\\n}
     *paragraph C1
      {normal_text:And still in title page\\n}
';


$result_texis{'double_titlepage_not_closed'} = '@titlepage

This is in title page


@titlepage

And still in title page
';


$result_texts{'double_titlepage_not_closed'} = '';

$result_errors{'double_titlepage_not_closed'} = '* W l6|@titlepage should not appear in @titlepage block
 warning: @titlepage should not appear in @titlepage block

* W l6|multiple @titlepage
 warning: multiple @titlepage

* E l6|no matching `@end titlepage\'
 no matching `@end titlepage\'

* E l1|no matching `@end titlepage\'
 no matching `@end titlepage\'

';

$result_nodes_list{'double_titlepage_not_closed'} = '';

$result_sections_list{'double_titlepage_not_closed'} = '';

$result_sectioning_root{'double_titlepage_not_closed'} = '';

$result_headings_list{'double_titlepage_not_closed'} = '';

1;
