use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bad_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C3
   *@alias C1 l2
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:garbage-on-line =cmd garbage}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@alias C1 l4
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:garbage-on-line =cmd }
     *@code C1 l4
      *brace_container C1
       {normal_text:in code}
     {spaces_after_argument:\\n}
';


$result_texis{'bad_line'} = '
@alias garbage-on-line =cmd garbage

@alias garbage-on-line =cmd @code{in code}
';


$result_texts{'bad_line'} = '
';

$result_errors{'bad_line'} = '* E l2|bad argument to @alias
 bad argument to @alias

* W l4|@code should not appear in @alias
 warning: @code should not appear in @alias

* E l4|superfluous argument to @alias
 superfluous argument to @alias

* E l4|bad argument to @alias
 bad argument to @alias

';

$result_nodes_list{'bad_line'} = '';

$result_sections_list{'bad_line'} = '';

$result_sectioning_root{'bad_line'} = '';

$result_headings_list{'bad_line'} = '';

1;
