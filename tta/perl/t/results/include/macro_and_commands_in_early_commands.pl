use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_and_commands_in_early_commands'} = '*document_root C4
 *before_node_section C10
  *@macro C3 l1
  |EXTRA
  |macro_name:{begin-file}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: begin-file\\n}
   {raw:macro_i--n_pass@@\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *@setfilename C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   |>SOURCEMARKS
   |>macro_expansion<start;1><p:1>
    |>*macro_call@begin-file C1
     |>*brace_arg
  |EXTRA
  |text_arg:{macro_i--n_pass@texi_commands.info}
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {macro_i--n_pass}
    *@@
    >SOURCEMARKS
    >macro_expansion<end;1>
    {texi_commands.info}
  {empty_line:\\n}
  *@macro C3 l7
  |EXTRA
  |macro_name:{latin1}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: latin1 \\n}
   {raw:ISO-8859-1@@\\n}
   *@end C1 l9
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  *@documentencoding C1 l11
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   |>SOURCEMARKS
   |>macro_expansion<start;2><p:1>
    |>*macro_call@latin1 C1
     |>*brace_arg
  |EXTRA
  |global_command_number:{1}
  |input_encoding_name:{iso-8859-1}
  |text_arg:{ISO-8859-1@}
   *line_arg C2
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ISO-8859-1}
    *@@
    >SOURCEMARKS
    >macro_expansion<end;2>
  {empty_line:\\n}
  *@macro C4 l13
  |EXTRA
  |macro_name:{multiinclude}
  |misc_args:A{}
   *arguments_line C1
    {macro_line: multiinclude\\n}
   {raw:macro_included.texi\\n}
   {raw:@include inc_@@f--ile.texi\\n}
   *@end C1 l16
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
 *@node C1 l18 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C2 l19 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
 *@node C8 l21 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;1><p:1>
   >*@include C1 l23
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >|>SOURCEMARKS
    >|>macro_expansion<start;3><p:1>
     >|>*macro_call@multiinclude
   >|EXTRA
   >|text_arg:{macro_included.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{macro_included.texi}
  *@macro C3 macro_included.texi:l1
  |EXTRA
  |macro_name:{themacro}
  |misc_args:A{}
  >SOURCEMARKS
  >include<end;1>
  >include<start;2>
   >*@include C1 l23:@multiinclude
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{inc_@f--ile.texi}
    >*line_arg C3
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{inc_}
     >*@@
     >{f--ile.texi}
     >>SOURCEMARKS
     >>macro_expansion<end;3><p:11>
   *arguments_line C1
    {macro_line: themacro\\n}
   {raw:in themacro\\n}
   *@end C1 macro_included.texi:l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  *paragraph C1
   {In included file.\\n}
   >SOURCEMARKS
   >include<end;2><p:18>
  {empty_line:\\n}
  *paragraph C1
   {in themacro\\n}
   >SOURCEMARKS
   >macro_expansion<start;4>
    >*macro_call@themacro C1
     >*brace_arg
   >macro_expansion<end;4><p:11>
  {empty_line:\\n}
  *@verbatiminclude C1 l27
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |input_encoding_name:{iso-8859-1}
  |text_arg:{inc_@f--ile.texi}
   *line_arg C3
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {inc_}
    *@@
    {f--ile.texi}
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
