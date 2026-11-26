use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'protected_spaces_on_line'} = '*document_root C1
 *before_node_section C9
  *preamble C2
   *normal_command@linemacro C5 l1
   |formal_args:A{first|rest}
   |macro_name:{test}
    *arguments_line C1
     {macro_line: test {first, rest}\\n}
    {raw:@deffn Function \\first\\ \\rest\\\\n}
    {raw:something\\n}
    {raw:@end deffn\\n}
    *normal_command@end C1 l5
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >linemacro_expansion<start;1><p:1>
    >*linemacro_call@test C2
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:foo}
     >*linemacro_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:(bar, baz)@\\n continuation line}
  *normal_command@deffn C3 l8:@test
   *def_line C1 l8:@test
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C16
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foo}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:bar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:baz}
     {delimiter:)}
     >SOURCEMARKS
     >defline_continuation<1><p:1>
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:continuation}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:line}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:something\\n}
   *normal_command@end C1 l8:@test
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     >SOURCEMARKS
     >linemacro_expansion<end;1><p:5>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >linemacro_expansion<start;2><p:1>
   >*linemacro_call@test C2
    >*linemacro_arg C2
     >{spaces_before_argument: }
     >{macro_call_arg_text:foo@ b}
    >*linemacro_arg C2
     >{spaces_before_argument: }
     >{macro_call_arg_text:(bar, baz) rest@ and more}
  *normal_command@deffn C3 l10:@test
   *def_line C1 l10:@test
   |def_command:{deffn}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C18
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *def_line_arg C3
       {normal_text:foo}
       *normal_command@ 
       {normal_text:b}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:bar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:baz}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:rest}
     *def_arg C1
      *def_line_arg C1
       *normal_command@ 
     *def_arg C1
      *def_line_arg C1
       {normal_text:and}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:more}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:something\\n}
   *normal_command@end C1 l10:@test
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     >SOURCEMARKS
     >linemacro_expansion<end;2><p:5>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >linemacro_expansion<start;3><p:1>
   >*linemacro_call@test C2
    >*linemacro_arg C2
     >{spaces_before_argument: }
     >{macro_call_arg_text:foo}
    >*linemacro_arg C2
     >{spaces_before_argument: }
     >{macro_call_arg_text:(bar, baz)@@}
  *normal_command@deffn C3 l12:@test
   *def_line C1 l12:@test
   |def_command:{deffn}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deffn}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foo}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:bar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:baz}
     {delimiter:)}
     *def_arg C1
      *def_line_arg C1
       *normal_command@@
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:something\\n}
   *normal_command@end C1 l12:@test
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     >SOURCEMARKS
     >linemacro_expansion<end;3><p:5>
     {spaces_after_argument:\\n}
  {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:another with double at\\n}
  {empty_line:\\n}
';


$result_texis{'protected_spaces_on_line'} = '@linemacro test {first, rest}
@deffn Function \\first\\ \\rest\\
something
@end deffn
@end linemacro

@deffn Function foo (bar, baz) continuation line
something
@end deffn

@deffn Function foo@ b (bar, baz) rest@ and more
something
@end deffn

@deffn Function foo (bar, baz)@@
something
@end deffn
 another with double at

';


$result_texts{'protected_spaces_on_line'} = '
Function: foo (bar, baz) continuation line
something

Function: foo b (bar, baz) rest and more
something

Function: foo (bar, baz)@
something
another with double at

';

$result_errors{'protected_spaces_on_line'} = '* W l8:@test|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node (possibly involving @test)

* W l10:@test|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node (possibly involving @test)

* W l12:@test|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node (possibly involving @test)

';

$result_nodes_list{'protected_spaces_on_line'} = '';

$result_sections_list{'protected_spaces_on_line'} = '';

$result_sectioning_root{'protected_spaces_on_line'} = '';

$result_headings_list{'protected_spaces_on_line'} = '';

$result_indices_sort_strings{'protected_spaces_on_line'} = 'fn:
 foo
 foo
 foo b
';

1;
