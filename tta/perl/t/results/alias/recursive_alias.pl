use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'recursive_alias'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content C6
   *@alias C1 l1
   |EXTRA
   |misc_args:A{new|strong}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:new = strong}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@alias C1 l3
   |EXTRA
   |misc_args:A{other|new}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:other = new}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@alias C1 l5
   |EXTRA
   |misc_args:A{strong|other}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:strong = other}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *@strong C1 l7
   |EXTRA
   |alias_of:{other}
    *brace_container C1
     {normal_text:aa}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:bb.\\n}
';


$result_texis{'recursive_alias'} = '@alias new = strong

@alias other = new

@alias strong = other

@strong{aa}.

bb.
';


$result_texts{'recursive_alias'} = '


aa.

bb.
';

$result_errors{'recursive_alias'} = '* W l5|recursive alias definition of strong through other ignored
 warning: recursive alias definition of strong through other ignored

* E l9|unknown command `other\'
 unknown command `other\'

* E l9|misplaced {
 misplaced {

* E l9|misplaced }
 misplaced }

';

$result_nodes_list{'recursive_alias'} = '';

$result_sections_list{'recursive_alias'} = '';

$result_sectioning_root{'recursive_alias'} = '';

$result_headings_list{'recursive_alias'} = '';


$result_converted{'plaintext'}->{'recursive_alias'} = '*aa*.

   bb.
';

1;
