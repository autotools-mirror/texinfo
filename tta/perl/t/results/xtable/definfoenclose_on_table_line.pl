use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'definfoenclose_on_table_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@definfoenclose C1 l1
   |misc_args:A{phi|:|:}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:phi,:,:}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@table C3 l3
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *definfoenclose_command@phi l3
     |begin:{:}
     |end:{:}
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C2
     *normal_command@item C1 l4
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:item}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 l5
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:item x}
       {spaces_after_argument:\\n}
    *table_definition C2
     {empty_line:\\n}
     *paragraph C1
      {normal_text:table content.\\n}
   *normal_command@end C1 l8
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
';


$result_texis{'definfoenclose_on_table_line'} = '@definfoenclose phi,:,:

@table @phi
@item item
@itemx item x

table content.
@end table
';


$result_texts{'definfoenclose_on_table_line'} = '
item
item x

table content.
';

$result_errors{'definfoenclose_on_table_line'} = '* W l1|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* W l3|@phi should not appear on @table line
 warning: @phi should not appear on @table line

';

$result_nodes_list{'definfoenclose_on_table_line'} = '';

$result_sections_list{'definfoenclose_on_table_line'} = '';

$result_sectioning_root{'definfoenclose_on_table_line'} = '';

$result_headings_list{'definfoenclose_on_table_line'} = '';


$result_converted{'plaintext'}->{'definfoenclose_on_table_line'} = ':item:
:item x:

     table content.
';


$result_converted{'html_text'}->{'definfoenclose_on_table_line'} = '
<dl class="table">
<dt>:item:</dt>
<dt>:item x:</dt>
<dd>
<p>table content.
</p></dd>
</dl>
';


$result_converted{'xml'}->{'definfoenclose_on_table_line'} = '<definfoenclose command="phi" open=":" close=":" line=" phi,:,:"></definfoenclose>

<table commandarg="phi" begin=":" end=":" endspaces=" ">
<tableentry><tableterm><item><itemformat command="phi" begin=":" end=":"> item</itemformat></item>
<itemx><itemformat command="phi" begin=":" end=":"> item x</itemformat></itemx>
</tableterm><tableitem>
<para>table content.
</para></tableitem></tableentry></table>
';


$result_converted{'docbook'}->{'definfoenclose_on_table_line'} = '
<variablelist><varlistentry><term>item
</term><term>item x
</term><listitem>
<para>table content.
</para></listitem></varlistentry></variablelist>';

1;
