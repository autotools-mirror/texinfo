use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'line_end_accent_command_macro_call'} = '*document_root C1
 *before_node_section C11
  *preamble_before_content C2
   *normal_command@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{expand}
    *arguments_line C1
     {macro_line: expand {}\\n}
    {raw:@center A @ringaccent \\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;1><p:1>
    >*macro_call@expand C1
     >*brace_arg
  *normal_command@center C1 l5:@expand
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:A }
    *normal_command@ringaccent C1 l5:@expand
     {spaces_after_cmd_before_arg: }
     >SOURCEMARKS
     >macro_expansion<end;1><p:1>
    {spaces_after_argument:\\n}
  {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:a\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l8
  |EXTRA
  |formal_args:A{}
  |macro_name:{nospace}
   *arguments_line C1
    {macro_line: nospace {}\\n}
   {raw:@center B @ringaccent\\n}
   *normal_command@end C1 l10
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;2><p:1>
   >*macro_call@nospace C1
    >*brace_arg
  *normal_command@center C1 l12:@nospace
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:B }
    *normal_command@ringaccent C1 l12:@nospace
     {spaces_after_cmd_before_arg:}
     >SOURCEMARKS
     >macro_expansion<end;2>
    {spaces_after_argument:\\n}
  {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:A\\n}
  {empty_line:\\n}
';


$result_texis{'line_end_accent_command_macro_call'} = '@macro expand {}
@center A @ringaccent 
@end macro

@center A @ringaccent 
 a

@macro nospace {}
@center B @ringaccent
@end macro

@center B @ringaccent
 A

';


$result_texts{'line_end_accent_command_macro_call'} = '
A *
a


B *
A

';

$result_errors{'line_end_accent_command_macro_call'} = '* W l5|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

* W l12|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

';

$result_nodes_list{'line_end_accent_command_macro_call'} = '';

$result_sections_list{'line_end_accent_command_macro_call'} = '';

$result_sectioning_root{'line_end_accent_command_macro_call'} = '';

$result_headings_list{'line_end_accent_command_macro_call'} = '';

1;
