use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'on_section_line'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *normal_command@section C1 l1 {@noindent Text @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
}
 |EXTRA
 |identifier:{Text-in-titlefont-}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C10
    {spaces_before_argument: }
    *normal_command@noindent l1
    {ignorable_spaces_after_command: }
    {normal_text:Text }
    *normal_command@titlefont C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_container C1
      {normal_text:in titlefont}
    {normal_text: }
    *normal_command@anchor C1 l1
    |EXTRA
    |identifier:{in-anchor}
    |is_target:{1}
     *brace_arg C1
      {normal_text:in anchor}
    *normal_command@footnote C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {normal_text:footnote}
    {normal_text: }
    *normal_command@exdent C1 l1
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:exdent}
      {spaces_after_argument:\\n}
';


$result_texis{'on_section_line'} = '@section @noindent Text @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
';


$result_texts{'on_section_line'} = '1 Text in titlefont  exdent
===========================
';

$result_errors{'on_section_line'} = '* W l1|@noindent should not appear on @section line
 warning: @noindent should not appear on @section line

* W l1|@titlefont should not appear on @section line
 warning: @titlefont should not appear on @section line

* W l1|@anchor should not appear on @section line
 warning: @anchor should not appear on @section line

* W l1|@footnote should not appear on @section line
 warning: @footnote should not appear on @section line

* W l1|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l1|@exdent should not appear on @section line
 warning: @exdent should not appear on @section line

';

$result_nodes_list{'on_section_line'} = '';

$result_sections_list{'on_section_line'} = '1|@noindent Text @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent

';

$result_sectioning_root{'on_section_line'} = 'level: 1
list:
 1|@noindent Text @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent

';

$result_headings_list{'on_section_line'} = '';

1;
