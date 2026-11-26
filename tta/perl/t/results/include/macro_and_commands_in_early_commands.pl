use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_and_commands_in_early_commands'} = '*document_root C4
 *before_node_section C2
  *before_beginning C2
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{begin-file}
    *arguments_line C1
     {macro_line: begin-file\\n}
    {raw:macro_i--n_pass@@\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *preamble_before_content C8
   *normal_command@setfilename C1 l5
   |text_arg:{macro_i--n_pass@texi_commands.info}
    *line_arg C5
     {spaces_before_argument: }
     >SOURCEMARKS
     >macro_expansion<start;1><p:1>
      >*macro_call@begin-file C1
       >*brace_arg
     {normal_text:macro_i--n_pass}
     *normal_command@@
     >SOURCEMARKS
     >macro_expansion<end;1>
     {normal_text:texi_commands.info}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l7
   |formal_args:A{}
   |macro_name:{latin1}
    *arguments_line C1
     {macro_line: latin1 \\n}
    {raw:ISO-8859-1@@\\n}
    *normal_command@end C1 l9
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@documentencoding C1 l11
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1@}
    *line_arg C4
     {spaces_before_argument: }
     >SOURCEMARKS
     >macro_expansion<start;2><p:1>
      >*macro_call@latin1 C1
       >*brace_arg
     {normal_text:ISO-8859-1}
     *normal_command@@
     >SOURCEMARKS
     >macro_expansion<end;2>
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C4 l13
   |formal_args:A{}
   |macro_name:{multiinclude}
    *arguments_line C1
     {macro_line: multiinclude\\n}
    {raw:macro_included.texi\\n}
    {raw:@include inc_@@f--ile.texi\\n}
    *normal_command@end C1 l16
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l18 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l19 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C8 l21 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;1><p:1>
   >*normal_command@include C1 l23
   >|text_arg:{macro_included.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >>SOURCEMARKS
     >>macro_expansion<start;3><p:1>
      >>*macro_call@multiinclude
     >{normal_text:macro_included.texi}
     >{spaces_after_argument:\\n}
  *normal_command@macro C3 macro_included.texi:l1
  |formal_args:A{}
  |macro_name:{themacro}
  >SOURCEMARKS
  >include<end;1>
  >include<start;2>
   >*normal_command@include C1 l23:@multiinclude
   >|text_arg:{inc_@f--ile.texi}
    >*line_arg C5
     >{spaces_before_argument: }
     >{normal_text:inc_}
     >*normal_command@@
     >{normal_text:f--ile.texi}
     >>SOURCEMARKS
     >>macro_expansion<end;3><p:11>
     >{spaces_after_argument:\\n}
   *arguments_line C1
    {macro_line: themacro\\n}
   {raw:in themacro\\n}
   *normal_command@end C1 macro_included.texi:l3
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:In included file.\\n}
   >SOURCEMARKS
   >include<end;2><p:18>
  {empty_line:\\n}
  *paragraph C1
   {normal_text:in themacro\\n}
   >SOURCEMARKS
   >macro_expansion<start;4>
    >*macro_call@themacro C1
     >*brace_arg
   >macro_expansion<end;4><p:11>
  {empty_line:\\n}
  *normal_command@verbatiminclude C1 l27
  |input_encoding_name:{iso-8859-1}
  |text_arg:{inc_@f--ile.texi}
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:inc_}
    *normal_command@@
    {normal_text:f--ile.texi}
    {spaces_after_argument:\\n}
';


$result_texis{'macro_and_commands_in_early_commands'} = '@macro begin-file
macro_i--n_pass@@
@end macro

@setfilename macro_i--n_pass@@texi_commands.info

@macro latin1 
ISO-8859-1@@
@end macro

@documentencoding ISO-8859-1@@

@macro multiinclude
macro_included.texi
@include inc_@@f--ile.texi
@end macro

@node Top
@top top

@node chap

@macro themacro
in themacro
@end macro
In included file.

in themacro

@verbatiminclude inc_@@f--ile.texi
';


$result_texts{'macro_and_commands_in_early_commands'} = '



top
***


In included file.

in themacro

';

$result_errors{'macro_and_commands_in_early_commands'} = '* W l11|encoding `ISO-8859-1@\' is not a canonical texinfo encoding
 warning: encoding `ISO-8859-1@\' is not a canonical texinfo encoding

* W l21|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'macro_and_commands_in_early_commands'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'macro_and_commands_in_early_commands'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'macro_and_commands_in_early_commands'} = 'level: -1
list:
 1|top
';

$result_headings_list{'macro_and_commands_in_early_commands'} = '';

1;
