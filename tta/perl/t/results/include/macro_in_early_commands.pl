use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_early_commands'} = '*document_root C4
 *before_node_section C2
  *before_beginning C3
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{begin-file}
    *arguments_line C1
     {macro_line: begin-file\\n}
    {raw:macro_in_pass\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   *normal_command@macro C3 l4
   |formal_args:A{ext}
   |macro_name:{end-file-name}
    *arguments_line C1
     {macro_line: end-file-name {ext}\\n}
    {raw:texi_commands.\\ext\\\\n}
    *normal_command@end C1 l6
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *preamble C10
   *normal_command@setfilename C1 l8
   |text_arg:{macro_in_passtexi_commands.info}
    *line_arg C3
     {spaces_before_argument: }
     >SOURCEMARKS
     >macro_expansion<start;1><p:1>
      >*macro_call@begin-file C1
       >*brace_arg
     {normal_text:macro_in_passtexi_commands.info}
     >SOURCEMARKS
     >macro_expansion<end;1><p:13>
     >macro_expansion<start;2><p:13>
      >*macro_call@end-file-name C1
       >*brace_arg C1
        >{macro_call_arg_text:info}
     >macro_expansion<end;2><p:31>
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l10
   |formal_args:A{}
   |macro_name:{latin1}
    *arguments_line C1
     {macro_line: latin1 \\n}
    {raw:ISO-8859-1\\n}
    *normal_command@end C1 l12
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l14
   |formal_args:A{}
   |macro_name:{documentencoding-command}
    *arguments_line C1
     {macro_line: documentencoding-command\\n}
    {raw:@documentencoding\\n}
    *normal_command@end C1 l16
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >macro_expansion<start;3><p:1>
    >*macro_call@documentencoding-command
   *normal_command@documentencoding C1 l18:@documentencoding-command
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C3
     {spaces_before_argument: }
     >SOURCEMARKS
     >macro_expansion<end;3>
     >macro_expansion<start;4><p:1>
      >*macro_call@latin1 C1
       >*brace_arg
     {normal_text:ISO-8859-1}
     >SOURCEMARKS
     >macro_expansion<end;4><p:10>
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C4 l20
   |formal_args:A{}
   |macro_name:{multiinclude}
    *arguments_line C1
     {macro_line: multiinclude\\n}
    {raw:macro_included.texi\\n}
    {raw:@include inc_file.texi\\n}
    *normal_command@end C1 l23
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l25 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l26 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C8 l28 {chap}
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
   >*normal_command@include C1 l30
   >|text_arg:{macro_included.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >>SOURCEMARKS
     >>macro_expansion<start;5><p:1>
      >>*macro_call@multiinclude
     >{normal_text:macro_included.texi}
     >{spaces_after_argument:\\n}
  *normal_command@macro C3 macro_included.texi:l1
  |formal_args:A{}
  |macro_name:{themacro}
  >SOURCEMARKS
  >include<end;1>
  >include<start;2>
   >*normal_command@include C1 l30:@multiinclude
   >|text_arg:{inc_file.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:inc_file.texi}
     >>SOURCEMARKS
     >>macro_expansion<end;5><p:13>
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
   >macro_expansion<start;6>
    >*macro_call@themacro C1
     >*brace_arg
   >macro_expansion<end;6><p:11>
  {empty_line:\\n}
  *paragraph C6
   {normal_text:macro_in_pass_texi_commands}
   *normal_command@{
   {normal_text:info}
   *normal_command@}
   {normal_text:\\n}
   {normal_text:texi_commands.info\\n}
   >SOURCEMARKS
   >macro_expansion<start;7>
    >*macro_call@end-file-name C1
     >*brace_arg C1
      >{macro_call_arg_text:info}
   >macro_expansion<end;7><p:18>
';


$result_texis{'macro_in_early_commands'} = '@macro begin-file
macro_in_pass
@end macro
@macro end-file-name {ext}
texi_commands.\\ext\\
@end macro

@setfilename macro_in_passtexi_commands.info

@macro latin1 
ISO-8859-1
@end macro

@macro documentencoding-command
@documentencoding
@end macro

@documentencoding ISO-8859-1

@macro multiinclude
macro_included.texi
@include inc_file.texi
@end macro

@node Top
@top top

@node chap

@macro themacro
in themacro
@end macro
In included file.

in themacro

macro_in_pass_texi_commands@{info@}
texi_commands.info
';


$result_texts{'macro_in_early_commands'} = '




top
***


In included file.

in themacro

macro_in_pass_texi_commands{info}
texi_commands.info
';

$result_errors{'macro_in_early_commands'} = '* W l28|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'macro_in_early_commands'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'macro_in_early_commands'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'macro_in_early_commands'} = 'level: -1
list:
 1|top
';

$result_headings_list{'macro_in_early_commands'} = '';

1;
