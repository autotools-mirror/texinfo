use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'on_node_line'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {@ref{a, b, c, filename}}
 |EXTRA
 |identifier:{a}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C2
   *line_arg C2
    {spaces_before_argument: }
    *@ref C4 l1
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
      {a}
     *brace_arg C2
      {spaces_before_argument: }
      {b}
     *brace_arg C2
      {spaces_before_argument: }
      {c}
     *brace_arg C2
      {spaces_before_argument: }
      {filename}
   *line_arg C9
   |EXTRA
   |manual_content:A{2|2}
   |node_content:A{5|8}
   |normalized:{-}
    {spaces_before_argument: }
    {(}
    *@pxref C4 l1
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
      {Top}
     *brace_arg
     *brace_arg
     *brace_arg C2
      {spaces_before_argument: }
      {somemanual}
    {)}
    { }
    *@anchor C1 l1
    |EXTRA
    |identifier:{in-anchor}
    |is_target:{1}
     *brace_arg C1
      {in anchor}
    *@footnote C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {footnote}
    { }
    *@exdent C1 l1
     *line_arg C3
      {spaces_before_argument: }
      {exdent}
      {spaces_after_argument:\\n}
';


$result_texis{'on_node_line'} = '@node @ref{a, b, c, filename}, (@pxref{Top,,, somemanual}) @anchor{in anchor}@footnote{footnote} @exdent exdent
';


$result_texts{'on_node_line'} = '';

$result_errors{'on_node_line'} = '* W l1|@ref should not appear on @node line
 warning: @ref should not appear on @node line

* W l1|@pxref should not appear on @node line
 warning: @pxref should not appear on @node line

* W l1|@anchor should not appear on @node line
 warning: @anchor should not appear on @node line

* W l1|@footnote should not appear on @node line
 warning: @footnote should not appear on @node line

* W l1|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l1|@exdent should not appear on @node line
 warning: @exdent should not appear on @node line

';

$result_nodes_list{'on_node_line'} = '1|@ref{a, b, c, filename}
 node_directions:
  next-> (@pxref{Top,,, somemanual}) @anchor{in anchor}@footnote{footnote} @exdent exdent

';

$result_sections_list{'on_node_line'} = '';

$result_sectioning_root{'on_node_line'} = '';

$result_headings_list{'on_node_line'} = '';


$result_converted{'plaintext'}->{'on_node_line'} = '';


$result_converted{'xml'}->{'on_node_line'} = '<node identifier="a"><nodename> <ref label="a" manual="filename"><xrefnodename>a</xrefnodename><xrefinfoname> b</xrefinfoname><xrefprinteddesc> c</xrefprinteddesc><xrefinfofile> filename</xrefinfofile></ref></nodename><nodenext> (<pxref label="Top" manual="somemanual"><xrefnodename>Top</xrefnodename><xrefinfofile> somemanual</xrefinfofile></pxref>) <anchor identifier="in-anchor">in anchor</anchor><footnote><para>footnote</para></footnote> <exdent> exdent</exdent>
</nodenext></node>';

1;
