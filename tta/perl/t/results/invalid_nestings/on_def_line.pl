use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'on_def_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@deffn C3 l1
   *def_line C1 l1
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C8
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l1
       *normal_command@anchor C1 l1
       |identifier:{in-anchor}
       |is_target:{1}
        *brace_arg C1
         {normal_text:in anchor}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *normal_command@titlefont C1 l1
       |global_command_number:{1}
        *brace_container C1
         {normal_text:in titlefont}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@footnote C1 l1
       |global_command_number:{1}
        *brace_command_context C1
         *paragraph C1
          {normal_text:footnote}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@exdent C1 l1
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:exdent}
         {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l2
   |def_command:{deffn}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffnx}
    *line_arg C8
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l2
       *normal_command@anchor C1 l2
       |identifier:{in-anchorx}
       |is_target:{1}
        *brace_arg C1
         {normal_text:in anchorx}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *normal_command@titlefont C1 l2
       |global_command_number:{2}
        *brace_container C1
         {normal_text:in titlefontx}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@footnote C1 l2
       |global_command_number:{2}
        *brace_command_context C1
         *paragraph C1
          {normal_text:footnotex}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@exdent C1 l2
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:exdentx}
         {spaces_after_argument:\\n}
   *normal_command@end C1 l3
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'on_def_line'} = '@deffn {@anchor{in anchor}} @titlefont{in titlefont} @footnote{footnote} @exdent exdent
@deffnx {@anchor{in anchorx}} @titlefont{in titlefontx} @footnote{footnotex} @exdent exdentx
@end deffn
';


$result_texts{'on_def_line'} = ': in titlefont  exdent

: in titlefontx  exdentx

';

$result_errors{'on_def_line'} = '* W l1|@anchor should not appear on @deffn line
 warning: @anchor should not appear on @deffn line

* W l1|@titlefont should not appear on @deffn line
 warning: @titlefont should not appear on @deffn line

* W l1|@footnote should not appear on @deffn line
 warning: @footnote should not appear on @deffn line

* W l1|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l1|@exdent should not appear on @deffn line
 warning: @exdent should not appear on @deffn line

* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l2|@anchor should not appear on @deffnx line
 warning: @anchor should not appear on @deffnx line

* W l2|@titlefont should not appear on @deffnx line
 warning: @titlefont should not appear on @deffnx line

* W l2|@footnote should not appear on @deffnx line
 warning: @footnote should not appear on @deffnx line

* W l2|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l2|@exdent should not appear on @deffnx line
 warning: @exdent should not appear on @deffnx line

* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'on_def_line'} = '';

$result_sections_list{'on_def_line'} = '';

$result_sectioning_root{'on_def_line'} = '';

$result_headings_list{'on_def_line'} = '';

$result_indices_sort_strings{'on_def_line'} = 'fn:
 in titlefont
 in titlefontx
';

1;
