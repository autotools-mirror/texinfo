use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ref_in_style_command'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C2
   *normal_command@samp C1 l1
    *brace_container C1
     *normal_command@ref C3 l1
      *brace_arg C1
      |node_content:A{0|0}
      |normalized:{other-node}
       {normal_text:other node}
      *brace_arg
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:manula}
   {normal_text:.}
';


$result_texis{'ref_in_style_command'} = '@samp{@ref{other node,, manula}}.';


$result_texts{'ref_in_style_command'} = 'other node.';

$result_errors{'ref_in_style_command'} = '* E l1|@ref reference to nonexistent node `other node\'
 @ref reference to nonexistent node `other node\'

';

$result_nodes_list{'ref_in_style_command'} = '';

$result_sections_list{'ref_in_style_command'} = '';

$result_sectioning_root{'ref_in_style_command'} = '';

$result_headings_list{'ref_in_style_command'} = '';


$result_converted{'plaintext'}->{'ref_in_style_command'} = '‘manula: other node’.
';


$result_converted{'html_text'}->{'ref_in_style_command'} = '<p>&lsquo;<samp class="samp">`manula\'</samp>&rsquo;.</p>';


$result_converted{'latex_text'}->{'ref_in_style_command'} = '\\begin{document}
`\\texttt{manula}\'.';


$result_converted{'docbook'}->{'ref_in_style_command'} = '<para>&#8216;<literal><link linkend="other-node">manula</link></literal>&#8217;.</para>';

1;
