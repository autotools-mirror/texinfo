use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'on_subheading_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@subheading C1 l1
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C10
    {spaces_before_argument: }
    *@noindent l1
    {ignorable_spaces_after_command: }
    {normal_text:Text }
    *@titlefont C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_container C1
      {normal_text:in titlefont}
    {normal_text: }
    *@anchor C1 l1
    |EXTRA
    |identifier:{in-anchor}
    |is_target:{1}
     *brace_arg C1
      {normal_text:in anchor}
    *@footnote C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {normal_text:footnote}
    {normal_text: }
    *@exdent C1 l1
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:exdent}
      {spaces_after_argument:\\n}
';


$result_texis{'on_subheading_line'} = '@subheading @noindent Text @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
';


$result_texts{'on_subheading_line'} = 'Text in titlefont  exdent
-------------------------
';

$result_errors{'on_subheading_line'} = '* W l1|@noindent should not appear on @subheading line
 warning: @noindent should not appear on @subheading line

* W l1|@titlefont should not appear on @subheading line
 warning: @titlefont should not appear on @subheading line

* W l1|@anchor should not appear on @subheading line
 warning: @anchor should not appear on @subheading line

* W l1|@footnote should not appear on @subheading line
 warning: @footnote should not appear on @subheading line

* W l1|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l1|@exdent should not appear on @subheading line
 warning: @exdent should not appear on @subheading line

';

$result_nodes_list{'on_subheading_line'} = '';

$result_sections_list{'on_subheading_line'} = '';

$result_sectioning_root{'on_subheading_line'} = '';

$result_headings_list{'on_subheading_line'} = '1|@noindent Text @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent

';

1;
