use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'protect_node_after_label_source_mark_in_protected'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{vvv}
    *arguments_line C1
     {macro_line: vvv {}\\n}
    {raw:some text .,\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@set C1
   |EXTRA
   |misc_args:A{punct|,.}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:punct ,.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C5
   {normal_text:There is some text }
   >SOURCEMARKS
   >macro_expansion<start;1><p:9>
    >*macro_call@vvv C1
     >*brace_arg
   *normal_command@asis C1
    *brace_container C1
     {normal_text:.,,,..}
     >SOURCEMARKS
     >macro_expansion<end;1><p:2>
     >value_expansion<start;1><p:3>{,.}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:punct}
     >value_expansion<end;1><p:5>
   {normal_text: and after}
   *normal_command@asis C1
    *brace_container C1
     {normal_text:.}
   {normal_text:\\n}
';


$result_texis{'protect_node_after_label_source_mark_in_protected'} = '@macro vvv {}
some text .,
@end macro

@set punct ,.

There is some text @asis{.,,,..} and after@asis{.}
';


$result_texts{'protect_node_after_label_source_mark_in_protected'} = '

There is some text .,,,.. and after.
';

$result_errors{'protect_node_after_label_source_mark_in_protected'} = '';

$result_nodes_list{'protect_node_after_label_source_mark_in_protected'} = '';

$result_sections_list{'protect_node_after_label_source_mark_in_protected'} = '';

$result_sectioning_root{'protect_node_after_label_source_mark_in_protected'} = '';

$result_headings_list{'protect_node_after_label_source_mark_in_protected'} = '';

1;
