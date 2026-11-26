use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'center'} = '*document_root C1
 *before_node_section C4
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content
  *normal_command@center C1 l2
   *line_arg C4
    {spaces_before_argument:  }
    {normal_text:in center }
    *normal_command@code C1 l2
     *brace_container C1
      {normal_text:in code}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'center'} = '
@center  in center @code{in code}

';


$result_texts{'center'} = 'in center in code

';

$result_errors{'center'} = '';

$result_nodes_list{'center'} = '';

$result_sections_list{'center'} = '';

$result_sectioning_root{'center'} = '';

$result_headings_list{'center'} = '';


$result_converted{'plaintext'}->{'center'} = '                          in center ‘in code’

';


$result_converted{'html_text'}->{'center'} = '<div class="center">in center <code class="code">in code</code>
</div>
';


$result_converted{'xml'}->{'center'} = '<preamblebeforebeginning>
</preamblebeforebeginning><center>  in center <code>in code</code></center>

';


$result_converted{'latex_text'}->{'center'} = '\\begin{document}
\\begin{center}
in center \\texttt{in code}
\\end{center}

';


$result_converted{'docbook'}->{'center'} = '<simpara role="center">in center <literal>in code</literal></simpara>

';

1;
