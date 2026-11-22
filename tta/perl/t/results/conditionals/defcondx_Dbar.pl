use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'defcondx_Dbar'} = '*document_root C3
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C5
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:test def*x in a conditional}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:set this from the command line.}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:set bar}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@top C4 defxcond.texi:l8 {deffnx inside conditional}
 |identifier:{deffnx-inside-conditional}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:deffnx inside conditional}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C5 defxcond.texi:l10
   *def_line C1 defxcond.texi:l10
   |def_command:{deffn}
   |original_def_cmdname:{deffn}
    *block_line_arg C3
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:foo}
     {spaces_after_argument:\\n}
   *inter_def_item C1
    {empty_line:\\n}
    >SOURCEMARKS
    >expanded_conditional_command<start;1><p:1>
     >*normal_command@ifset C1 defxcond.texi:l12
      >*arguments_line C1
       >*block_line_arg C3
        >{spaces_before_argument: }
        >{normal_text:bar}
        >{spaces_after_argument:\\n}
   *normal_command@deffnx C1 defxcond.texi:l13
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
   >SOURCEMARKS
   >expanded_conditional_command<end;1>
    >*normal_command@end C1 defxcond.texi:l14
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
    *line_arg C3
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:bar}
     {spaces_after_argument:\\n}
   *def_item C3
    {empty_line:\\n}
    *paragraph C1
     {normal_text:Documentation.\\n}
    {empty_line:\\n}
   *normal_command@end C1 defxcond.texi:l18
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'defcondx_Dbar'} = '\\input texinfo

@c test def*x in a conditional

@c set this from the command line.
@c set bar

@top deffnx inside conditional

@deffn foo

@deffnx bar

Documentation.

@end deffn

@bye
';


$result_texts{'defcondx_Dbar'} = '

deffnx inside conditional
*************************

foo: 

bar: 

Documentation.


';

$result_errors{'defcondx_Dbar'} = '* W defxcond.texi:l10|missing name for @deffn
 warning: missing name for @deffn

* W defxcond.texi:l13|missing name for @deffnx
 warning: missing name for @deffnx

';

$result_nodes_list{'defcondx_Dbar'} = '';

$result_sections_list{'defcondx_Dbar'} = '1|deffnx inside conditional
';

$result_sectioning_root{'defcondx_Dbar'} = 'level: -1
list:
 1|deffnx inside conditional
';

$result_headings_list{'defcondx_Dbar'} = '';

1;
