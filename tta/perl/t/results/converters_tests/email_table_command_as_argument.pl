use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'email_table_command_as_argument'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@table C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@email l1
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l2
      *line_arg C5
       {spaces_before_argument: }
       {normal_text:www-discuss}
       *@@
       {normal_text:gnu.org}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:discussion\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'email_table_command_as_argument'} = '@table @email
@item www-discuss@@gnu.org
discussion
@end table
';


$result_texts{'email_table_command_as_argument'} = 'www-discuss@gnu.org
discussion
';

$result_errors{'email_table_command_as_argument'} = '';

$result_nodes_list{'email_table_command_as_argument'} = '';

$result_sections_list{'email_table_command_as_argument'} = '';

$result_sectioning_root{'email_table_command_as_argument'} = '';

$result_headings_list{'email_table_command_as_argument'} = '';


$result_converted{'plaintext'}->{'email_table_command_as_argument'} = '<www-discuss@gnu.org>
     discussion
';


$result_converted{'html_text'}->{'email_table_command_as_argument'} = '<dl class="table">
<dt><a class="email" href="mailto:www-discuss@gnu.org">www-discuss@gnu.org</a></dt>
<dd><p>discussion
</p></dd>
</dl>
';


$result_converted{'xml'}->{'email_table_command_as_argument'} = '<table commandarg="email" endspaces=" ">
<tableentry><tableterm><item><itemformat command="email"> www-discuss&arobase;gnu.org</itemformat></item>
</tableterm><tableitem><para>discussion
</para></tableitem></tableentry></table>
';


$result_converted{'docbook'}->{'email_table_command_as_argument'} = '<variablelist><varlistentry><term><email>www-discuss@gnu.org</email>
</term><listitem><para>discussion
</para></listitem></varlistentry></variablelist>';


$result_converted{'latex_text'}->{'email_table_command_as_argument'} = '\\begin{document}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
www-discuss@gnu.org}}]
discussion
\\end{description}
';

1;
