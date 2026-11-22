use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentscript_argument'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C14
   *normal_command@documentscript C1 l1
   |global_command_number:{1}
   |text_arg:{Kits}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Kits}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l2
   |global_command_number:{2}
   |text_arg:{kits}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:kits}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l3
   |global_command_number:{3}
   |text_arg:{cyrillic}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:cyrillic}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l4
   |global_command_number:{4}
   |text_arg:{Cyrillic}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Cyrillic}
     {spaces_after_argument:  \\n}
   *normal_command@documentscript C1 l5
   |global_command_number:{5}
   |text_arg:{}
    *line_arg C1
     {spaces_before_argument:     \\n}
   *normal_command@documentscript C1 l6
   |global_command_number:{6}
   |text_arg:{unknown}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:unknown}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l7
   |global_command_number:{7}
   |text_arg:{}
    *line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@documentscript C1 l8
   |global_command_number:{8}
   |text_arg:{UKNO}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:UKNO}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l9
   |global_command_number:{9}
   |text_arg:{AÂbc}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:AÂbc}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l10
   |global_command_number:{10}
   |text_arg:{M让}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:M让}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l11
   |global_command_number:{11}
   |text_arg:{a}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:a}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l12
   |global_command_number:{12}
   |text_arg:{UknowN}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:UknowN}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l13
   |global_command_number:{13}
   |text_arg:{j  k}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:j  k}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l14
   |global_command_number:{14}
   |text_arg:{a%}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:a%}
     {spaces_after_argument:\\n}
';


$result_texis{'documentscript_argument'} = '@documentscript Kits
@documentscript kits
@documentscript cyrillic
@documentscript Cyrillic  
@documentscript     
@documentscript unknown
@documentscript
@documentscript UKNO
@documentscript AÂbc
@documentscript M让
@documentscript a
@documentscript UknowN
@documentscript j  k
@documentscript a%
';


$result_texts{'documentscript_argument'} = '';

$result_errors{'documentscript_argument'} = '* W l6|unknown language script name `unknown\'
 warning: unknown language script name `unknown\'

* W l8|unknown language script name `UKNO\'
 warning: unknown language script name `UKNO\'

* W l9|bad language script argument `AÂbc\'
 warning: bad language script argument `AÂbc\'

* W l10|bad language script argument `M让\'
 warning: bad language script argument `M让\'

* W l11|unknown language script name `a\'
 warning: unknown language script name `a\'

* W l12|unknown language script name `UknowN\'
 warning: unknown language script name `UknowN\'

* W l13|bad language script argument `j  k\'
 warning: bad language script argument `j  k\'

* W l14|bad language script argument `a%\'
 warning: bad language script argument `a%\'

';

$result_nodes_list{'documentscript_argument'} = '';

$result_sections_list{'documentscript_argument'} = '';

$result_sectioning_root{'documentscript_argument'} = '';

$result_headings_list{'documentscript_argument'} = '';

1;
