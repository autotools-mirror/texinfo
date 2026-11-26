use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'block_command_alias'} = '*document_root C1
 *before_node_section C2
  *preamble C2
   *normal_command@alias C1 l1
   |misc_args:A{lang|lisp}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:lang=lisp}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@lisp C2 l3
  |alias_of:{lang}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    {normal_text:in lang\\n}
    *normal_command@end C1 l5
    |text_arg:{lang}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:lang}
      {spaces_after_argument:\\n}
';


$result_texis{'block_command_alias'} = '@alias lang=lisp

@lisp
in lang
@end lang
';


$result_texts{'block_command_alias'} = '
in lang
';

$result_errors{'block_command_alias'} = '* W l1|environment command lisp as argument to @alias
 warning: environment command lisp as argument to @alias

* W l5|unknown @end lang
 warning: unknown @end lang

* E l3|no matching `@end lisp\'
 no matching `@end lisp\'

';

$result_nodes_list{'block_command_alias'} = '';

$result_sections_list{'block_command_alias'} = '';

$result_sectioning_root{'block_command_alias'} = '';

$result_headings_list{'block_command_alias'} = '';

1;
