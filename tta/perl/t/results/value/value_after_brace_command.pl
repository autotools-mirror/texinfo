use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'value_after_brace_command'} = '*document_root C1
 *before_node_section C2
  *preamble C3
   *normal_command@set C1
   |misc_args:A{bracedletter|{a}}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:bracedletter {a}}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |misc_args:A{unknowncmd|@unknown}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:unknowncmd @unknown}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C12
   *normal_command@ringaccent C2 l4
   >SOURCEMARKS
   >value_expansion<end;1>
    {spaces_after_cmd_before_arg: }
    >SOURCEMARKS
    >value_expansion<start;1><p:1>{{a}}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:bracedletter}
    *brace_container C1
     {normal_text:a}
   {normal_text:\\n}
   *normal_command@ringaccent C1 l5
   >SOURCEMARKS
   >value_expansion<end;2>
    {spaces_after_cmd_before_arg: }
    >SOURCEMARKS
    >value_expansion<start;2><p:1>{@unknown}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:unknowncmd}
   {normal_text:\\n}
   *normal_command@^ C2 l6
   >SOURCEMARKS
   >value_expansion<end;3>
    {spaces_after_cmd_before_arg: }
    >SOURCEMARKS
    >value_expansion<start;3><p:1>{{a}}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:bracedletter}
    *brace_container C1
     {normal_text:a}
   {normal_text:\\n}
   *normal_command@^ C1 l7
   >SOURCEMARKS
   >value_expansion<end;4>
    {spaces_after_cmd_before_arg: }
    >SOURCEMARKS
    >value_expansion<start;4><p:1>{@unknown}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:unknowncmd}
   {normal_text:\\n}
   *normal_command@code C2 l8
   >SOURCEMARKS
   >value_expansion<end;5>
    {spaces_after_cmd_before_arg: }
    >SOURCEMARKS
    >value_expansion<start;5><p:1>{{a}}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:bracedletter}
    *brace_container C1
     {normal_text:a}
   {normal_text:\\n}
   *normal_command@code C1 l9
   >SOURCEMARKS
   >value_expansion<end;6>
    {spaces_after_cmd_before_arg: }
    >SOURCEMARKS
    >value_expansion<start;6><p:1>{@unknown}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:unknowncmd}
   {normal_text:\\n}
';


$result_texis{'value_after_brace_command'} = '@set bracedletter {a}
@set unknowncmd @unknown

@ringaccent {a}
@ringaccent 
@^ {a}
@^ 
@code {a}
@code 
';


$result_texts{'value_after_brace_command'} = '
a*
*
a^
^
a

';

$result_errors{'value_after_brace_command'} = '* E l5|@ringaccent expected braces
 @ringaccent expected braces

* E l5|unknown command `unknown\'
 unknown command `unknown\'

* E l7|@^ expected braces
 @^ expected braces

* E l7|unknown command `unknown\'
 unknown command `unknown\'

* E l9|@code expected braces
 @code expected braces

* E l9|unknown command `unknown\'
 unknown command `unknown\'

';

$result_nodes_list{'value_after_brace_command'} = '';

$result_sections_list{'value_after_brace_command'} = '';

$result_sectioning_root{'value_after_brace_command'} = '';

$result_headings_list{'value_after_brace_command'} = '';

1;
