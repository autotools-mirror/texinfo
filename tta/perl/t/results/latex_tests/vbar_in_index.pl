use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'vbar_in_index'} = '*document_root C1
 *before_node_section C3
  *preamble
  *index_entry_command@findex C1 l1
  |index_entry:I{fn,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A|B}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l2
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:C|D}
    {spaces_after_argument:\\n}
';


$result_texis{'vbar_in_index'} = '@findex A|B
@cindex C|D
';


$result_texts{'vbar_in_index'} = '';

$result_errors{'vbar_in_index'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l2|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'vbar_in_index'} = '';

$result_sections_list{'vbar_in_index'} = '';

$result_sectioning_root{'vbar_in_index'} = '';

$result_headings_list{'vbar_in_index'} = '';

$result_indices_sort_strings{'vbar_in_index'} = 'cp:
 C|D
fn:
 A|B
';


$result_converted{'latex_text'}->{'vbar_in_index'} = '\\begin{document}
\\index[fn]{AB@\\texttt{A"|B}}%
\\index[cp]{CD@C"|D}%
';

1;
