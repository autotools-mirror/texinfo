use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_call_empty_two_arg'} = '*document_root C1
 *before_node_section C23
  *preamble C2
   *normal_command@macro C4 l1
   |formal_args:A{aa|bb}
   |macro_name:{twoa}
    *arguments_line C1
     {macro_line: twoa {aa, bb}\\n}
    {raw:first \\aa\\,\\n}
    {raw:second \\bb\\,\\n}
    *normal_command@end C1 l4
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   {normal_text:first ,\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@twoa C1
     >*brace_arg
   {normal_text:second ,\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:8>
  {empty_line:\\n}
  *paragraph C2
   {normal_text:first ,\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@twoa C1
     >*brace_arg C1
      >{spaces_before_argument: }
   {normal_text:second ,\\n}
   >SOURCEMARKS
   >macro_expansion<end;2><p:8>
  {empty_line:\\n}
  *paragraph C2
   {normal_text:first ,\\n}
   >SOURCEMARKS
   >macro_expansion<start;3>
    >*macro_call@twoa C2
     >*brace_arg
     >*brace_arg C1
      >{spaces_before_argument: }
   {normal_text:second ,\\n}
   >SOURCEMARKS
   >macro_expansion<end;3><p:8>
  {empty_line:\\n}
  *paragraph C2
   {normal_text:first ,\\n}
   >SOURCEMARKS
   >macro_expansion<start;4>
    >*macro_call@twoa C2
     >*brace_arg C1
      >{spaces_before_argument: }
     >*brace_arg
   {normal_text:second ,\\n}
   >SOURCEMARKS
   >macro_expansion<end;4><p:8>
  {empty_line:\\n}
  *paragraph C2
   {normal_text:first ,\\n}
   >SOURCEMARKS
   >macro_expansion<start;5>
    >*macro_call@twoa C2
     >*brace_arg C1
      >{spaces_before_argument: }
     >*brace_arg C1
      >{spaces_before_argument: }
   {normal_text:second ,\\n}
   >SOURCEMARKS
   >macro_expansion<end;5><p:8>
  {empty_line:\\n}
  *paragraph C2
   {normal_text:first g,\\n}
   >SOURCEMARKS
   >macro_expansion<start;6>
    >*macro_call@twoa C2
     >*brace_arg C1
      >{macro_call_arg_text:g}
     >*brace_arg C1
      >{spaces_before_argument: }
   {normal_text:second ,\\n}
   >SOURCEMARKS
   >macro_expansion<end;6><p:8>
  {empty_line:\\n}
  *paragraph C2
   {normal_text:first h,\\n}
   >SOURCEMARKS
   >macro_expansion<start;7>
    >*macro_call@twoa C2
     >*brace_arg C1
      >{macro_call_arg_text:h}
     >*brace_arg
   {normal_text:second ,\\n}
   >SOURCEMARKS
   >macro_expansion<end;7><p:8>
  {empty_line:\\n}
  *paragraph C2
   {normal_text:first ,\\n}
   >SOURCEMARKS
   >macro_expansion<start;8>
    >*macro_call@twoa C2
     >*brace_arg
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:i}
   {normal_text:second i,\\n}
   >SOURCEMARKS
   >macro_expansion<end;8><p:9>
  {empty_line:\\n}
  *paragraph C2
   {normal_text:first ,\\n}
   >SOURCEMARKS
   >macro_expansion<start;9>
    >*macro_call@twoa C2
     >*brace_arg C1
      >{spaces_before_argument: }
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:j}
   {normal_text:second j,\\n}
   >SOURCEMARKS
   >macro_expansion<end;9><p:9>
  {empty_line:\\n}
  *paragraph C2
   {normal_text:first ,\\n}
   >SOURCEMARKS
   >macro_expansion<start;10>
    >*macro_call@twoa C2
     >*brace_arg
     >*brace_arg C1
      >{macro_call_arg_text:k}
   {normal_text:second k,\\n}
   >SOURCEMARKS
   >macro_expansion<end;10><p:9>
  {empty_line:\\n}
  *paragraph C2
   {normal_text:first ,\\n}
   >SOURCEMARKS
   >macro_expansion<start;11>
    >*macro_call@twoa C2
     >*brace_arg C1
      >{spaces_before_argument: }
     >*brace_arg C1
      >{macro_call_arg_text:l}
   {normal_text:second l,\\n}
   >SOURCEMARKS
   >macro_expansion<end;11><p:9>
  {empty_line:\\n}
';


$result_texis{'macro_call_empty_two_arg'} = '@macro twoa {aa, bb}
first \\aa\\,
second \\bb\\,
@end macro

first ,
second ,

first ,
second ,

first ,
second ,

first ,
second ,

first ,
second ,

first g,
second ,

first h,
second ,

first ,
second i,

first ,
second j,

first ,
second k,

first ,
second l,

';


$result_texts{'macro_call_empty_two_arg'} = '
first ,
second ,

first ,
second ,

first ,
second ,

first ,
second ,

first ,
second ,

first g,
second ,

first h,
second ,

first ,
second i,

first ,
second j,

first ,
second k,

first ,
second l,

';

$result_errors{'macro_call_empty_two_arg'} = '';

$result_nodes_list{'macro_call_empty_two_arg'} = '';

$result_sections_list{'macro_call_empty_two_arg'} = '';

$result_sectioning_root{'macro_call_empty_two_arg'} = '';

$result_headings_list{'macro_call_empty_two_arg'} = '';

1;
