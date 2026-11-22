use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'texinfo_command_alias'} = '*document_root C1
 *before_node_section C7
  *preamble_before_content C4
   *@macro C3 l1
   |EXTRA
   |formal_args:A{arg}
   |macro_name:{mystrong}
    *arguments_line C1
     {macro_line: mystrong {arg}\\n}
    {raw:!!\\arg\\!!\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@alias C1 l5
   |EXTRA
   |misc_args:A{strong|mystrong}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:strong = mystrong}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:!!aa!!\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mystrong C1
    >|EXTRA
    >|alias_of:{strong}
     >*brace_arg C1
      >{macro_call_arg_text:aa}
   >macro_expansion<end;1><p:6>
  {empty_line:\\n}
  *@definfoenclose C1 l9
  |EXTRA
  |misc_args:A{mystrong|;|:}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:mystrong,;,:}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@mystrong C1 l11
   |EXTRA
   |alias_of:{strong}
   |begin:{;}
   |end:{:}
    *brace_container C1
     {normal_text:bb}
   {normal_text:\\n}
  {empty_line:\\n}
';


$result_texis{'texinfo_command_alias'} = '@macro mystrong {arg}
!!\\arg\\!!
@end macro

@alias strong = mystrong

!!aa!!

@definfoenclose mystrong,;,:

@mystrong{bb}

';


$result_texts{'texinfo_command_alias'} = '

!!aa!!


bb

';

$result_errors{'texinfo_command_alias'} = '* W l9|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

';

$result_nodes_list{'texinfo_command_alias'} = '';

$result_sections_list{'texinfo_command_alias'} = '';

$result_sectioning_root{'texinfo_command_alias'} = '';

$result_headings_list{'texinfo_command_alias'} = '';


$result_converted{'plaintext'}->{'texinfo_command_alias'} = '!!aa!!

   ;bb:

';

1;
