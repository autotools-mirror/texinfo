use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'no_brace_space_end_line'} = '*document_root C1
 *before_node_section C3
  *paragraph C2
   *@code C1 l1
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *brace_container C1
     {c}
   {.\\n}
  {empty_line:\\n}
  *paragraph C4
   *@TeX l3
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:\\n}
   {text\\n}
   *@code l5
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:\\n}
   {Arg.}
';


$result_texis{'no_brace_space_end_line'} = '@code {c}.

@TeX
text
@code
Arg.';


$result_texts{'no_brace_space_end_line'} = 'c.

TeXtext
Arg.';

$result_errors{'no_brace_space_end_line'} = '* W l3|command `@TeX\' must not be followed by new line
 warning: command `@TeX\' must not be followed by new line

* E l4|@TeX expected braces
 @TeX expected braces

* W l5|command `@code\' must not be followed by new line
 warning: command `@code\' must not be followed by new line

* E l6|@code expected braces
 @code expected braces

';

$result_nodes_list{'no_brace_space_end_line'} = '';

$result_sections_list{'no_brace_space_end_line'} = '';

$result_sectioning_root{'no_brace_space_end_line'} = '';

$result_headings_list{'no_brace_space_end_line'} = '';

1;
