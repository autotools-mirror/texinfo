use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_expansion_in_multitable_prototype'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{simple}
    *arguments_line C1
     {macro_line: simple\\n}
    {raw:ab\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@macro C3 l5
   |EXTRA
   |formal_args:A{arg}
   |macro_name:{endbrace}
    *arguments_line C1
     {macro_line: endbrace {arg}\\n}
    {raw:c\\arg\\d}\\n}
    *@end C1 l7
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *@multitable C3 l9
  |EXTRA
  |max_columns:{5}
   *arguments_line C1
    *block_line_arg C11
     {spaces_before_argument: }
     *bracketed_arg C1 l9
      {normal_text:h ab i}
      >SOURCEMARKS
      >macro_expansion<start;1><p:2>
       >*macro_call@simple C1
        >*brace_arg
      >macro_expansion<end;1><p:4>
     {normal_text: }
     *bracketed_arg C1 l9
      {normal_text:j ab}
      >SOURCEMARKS
      >macro_expansion<start;2><p:2>
       >*macro_call@simple C1
        >*brace_arg
      >macro_expansion<end;2><p:4>
     {normal_text: }
     *bracketed_arg C3 l9
      {normal_text:k }
      *@emph C1 l9
       *brace_container C1
        {normal_text:s}
      {normal_text:nab}
      >SOURCEMARKS
      >macro_expansion<start;3><p:1>
       >*macro_call@simple C1
        >*brace_arg
      >macro_expansion<end;3><p:3>
     {normal_text: }
     *bracketed_arg C3 l9
     >SOURCEMARKS
     >macro_expansion<end;4>
      {normal_text:g c}
      >SOURCEMARKS
      >macro_expansion<start;4><p:2>
       >*macro_call@endbrace C1
        >*brace_arg C1
         >{macro_call_arg_text:@code{l}}
      *@code C1 l9:@endbrace
       *brace_container C1
        {normal_text:l}
      {normal_text:d}
     {normal_text: }
     *bracketed_arg C1 l9
     >SOURCEMARKS
     >macro_expansion<end;5>
      {normal_text:h cTd}
      >SOURCEMARKS
      >macro_expansion<start;5><p:2>
       >*macro_call@endbrace C1
        >*brace_arg C1
         >{macro_call_arg_text:T}
     {spaces_after_argument:\\n}
   *multitable_body C1
    *row C5
    |EXTRA
    |row_number:{1}
     *@item C2 l10
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:l1 }
     *@tab C2 l10
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:t1 }
     *@tab C2 l10
     |EXTRA
     |cell_number:{3}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:t2 }
     *@tab C2 l10
     |EXTRA
     |cell_number:{4}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:t3 }
     *@tab C2 l10
     |EXTRA
     |cell_number:{5}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:t4\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'macro_expansion_in_multitable_prototype'} = '@macro simple
ab
@end macro

@macro endbrace {arg}
c\\arg\\d}
@end macro

@multitable {h ab i} {j ab} {k @emph{s}nab} {g c@code{l}d} {h cTd}
@item l1 @tab t1 @tab t2 @tab t3 @tab t4
@end multitable
';


$result_texts{'macro_expansion_in_multitable_prototype'} = '

l1 t1 t2 t3 t4
';

$result_errors{'macro_expansion_in_multitable_prototype'} = '';

$result_nodes_list{'macro_expansion_in_multitable_prototype'} = '';

$result_sections_list{'macro_expansion_in_multitable_prototype'} = '';

$result_sectioning_root{'macro_expansion_in_multitable_prototype'} = '';

$result_headings_list{'macro_expansion_in_multitable_prototype'} = '';

1;
