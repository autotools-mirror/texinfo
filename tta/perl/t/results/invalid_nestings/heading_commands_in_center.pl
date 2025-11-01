use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'heading_commands_in_center'} = '*document_root C1
 *before_node_section C1
  *@center C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C8
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    *@code C1 l1
     *brace_container C2
      {aaa }
      *@thischapter
    { }
    *@|
    { a }
    *@thissection
    { }
    *@|
    { b}
';


$result_texis{'heading_commands_in_center'} = '@center @code{aaa @thischapter} @| a @thissection @| b
';


$result_texts{'heading_commands_in_center'} = 'aaa   a   b
';

$result_errors{'heading_commands_in_center'} = '* E l1|@thischapter should only appear in heading or footing
 @thischapter should only appear in heading or footing

* W l1|@| should not appear in @center
 warning: @| should not appear in @center

* E l1|@| should only appear in heading or footing
 @| should only appear in heading or footing

* W l1|@thissection should not appear in @center
 warning: @thissection should not appear in @center

* E l1|@thissection should only appear in heading or footing
 @thissection should only appear in heading or footing

* W l1|@| should not appear in @center
 warning: @| should not appear in @center

* E l1|@| should only appear in heading or footing
 @| should only appear in heading or footing

';

$result_nodes_list{'heading_commands_in_center'} = '';

$result_sections_list{'heading_commands_in_center'} = '';

$result_sectioning_root{'heading_commands_in_center'} = '';

$result_headings_list{'heading_commands_in_center'} = '';

1;
