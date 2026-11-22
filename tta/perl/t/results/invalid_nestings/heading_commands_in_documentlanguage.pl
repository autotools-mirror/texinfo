use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'heading_commands_in_documentlanguage'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *@documentlanguage C1 l1
   |EXTRA
   |global_command_number:{1}
   |text_arg:{    b}
    *line_arg C10
     {spaces_before_argument: }
     *@code C1 l1
      *brace_container C2
       {normal_text:aaa }
       *@thischapter
     {normal_text: }
     *@|
     {normal_text: }
     *@thissection
     {normal_text: }
     *@|
     {normal_text: b}
     {spaces_after_argument:\\n}
';


$result_texis{'heading_commands_in_documentlanguage'} = '@documentlanguage @code{aaa @thischapter} @| @thissection @| b
';


$result_texts{'heading_commands_in_documentlanguage'} = '';

$result_errors{'heading_commands_in_documentlanguage'} = '* W l1|@code should not appear in @documentlanguage
 warning: @code should not appear in @documentlanguage

* E l1|@thischapter should only appear in heading or footing
 @thischapter should only appear in heading or footing

* W l1|@| should not appear in @documentlanguage
 warning: @| should not appear in @documentlanguage

* E l1|@| should only appear in heading or footing
 @| should only appear in heading or footing

* W l1|@thissection should not appear in @documentlanguage
 warning: @thissection should not appear in @documentlanguage

* E l1|@thissection should only appear in heading or footing
 @thissection should only appear in heading or footing

* W l1|@| should not appear in @documentlanguage
 warning: @| should not appear in @documentlanguage

* E l1|@| should only appear in heading or footing
 @| should only appear in heading or footing

* E l1|bad argument to @documentlanguage: @code{aaa @thischapter} @| @thissection @| b
 bad argument to @documentlanguage: @code{aaa @thischapter} @| @thissection @| b

';

$result_nodes_list{'heading_commands_in_documentlanguage'} = '';

$result_sections_list{'heading_commands_in_documentlanguage'} = '';

$result_sectioning_root{'heading_commands_in_documentlanguage'} = '';

$result_headings_list{'heading_commands_in_documentlanguage'} = '';

1;
