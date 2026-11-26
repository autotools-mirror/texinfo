use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inter_item_commands_in_table_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@table C4 l2
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *normal_command@var l2
      {spaces_after_argument:\\n}
    *table_entry C2
     *table_term C5
      *normal_command@item C1 l3
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:a--b}
        {spaces_after_argument:\\n}
      *inter_item C1
       *preformatted C3
        *index_entry_command@cindex C1 l4
        |index_entry:I{cp,1}
         *line_arg C3
          {spaces_before_argument: }
          {normal_text:index entry between item and itemx}
          {spaces_after_argument:\\n}
        *normal_command@c C1
         *line_arg C3
          {spaces_before_argument: }
          {rawline_text:and a comment}
          {spaces_after_argument:\\n}
        *normal_command@comment C1
         *line_arg C3
          {spaces_before_argument: }
          {rawline_text:and another comment}
          {spaces_after_argument:\\n}
      *normal_command@itemx C1 l7
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:b}
        {spaces_after_argument:\\n}
      *inter_item C1
       *preformatted C1
        {empty_line:\\n}
      *normal_command@itemx C1 l9
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:c}
        {spaces_after_argument:\\n}
     *table_definition C1
      *preformatted C1
       {normal_text:l--ine\\n}
    *table_entry C1
     *table_term C1
      *normal_command@item C1 l11
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:d}
        {spaces_after_argument:\\n}
    *normal_command@end C1 l12
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l13
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'inter_item_commands_in_table_in_example'} = '@example
@table @var
@item a--b
@cindex index entry between item and itemx
@c and a comment
@comment and another comment
@itemx b

@itemx c
l--ine
@item d
@end table
@end example
';


$result_texts{'inter_item_commands_in_table_in_example'} = 'a--b
b

c
l--ine
d
';

$result_errors{'inter_item_commands_in_table_in_example'} = '* W l4|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'inter_item_commands_in_table_in_example'} = '';

$result_sections_list{'inter_item_commands_in_table_in_example'} = '';

$result_sectioning_root{'inter_item_commands_in_table_in_example'} = '';

$result_headings_list{'inter_item_commands_in_table_in_example'} = '';

$result_indices_sort_strings{'inter_item_commands_in_table_in_example'} = 'cp:
 index entry between item and itemx
';


$result_converted{'plaintext'}->{'inter_item_commands_in_table_in_example'} = '     A-B
     B

     C
          l--ine
     D
';

$result_converted_sort_strings{'plaintext'}->{'inter_item_commands_in_table_in_example'} = 'cp:
 index entry between item and itemx
';


$result_converted{'html_text'}->{'inter_item_commands_in_table_in_example'} = '<div class="example">
<dl class="table">
<dt><code class="table-term-preformatted-code"><var class="var">a--b</var></code></dt>
<dd><pre class="example-preformatted"><a class="index-entry-id" id="index-index-entry-between-item-and-itemx"></a></pre></dd>
<dt><code class="table-term-preformatted-code"><var class="var">b</var></code></dt>
<dd><pre class="example-preformatted">

</pre></dd>
<dt><code class="table-term-preformatted-code"><var class="var">c</var></code></dt>
<dd><pre class="example-preformatted">l--ine
</pre></dd>
<dt><code class="table-term-preformatted-code"><var class="var">d</var></code></dt>
</dl>
</div>
';


$result_converted{'xml'}->{'inter_item_commands_in_table_in_example'} = '<example endspaces=" ">
<table commandarg="var" endspaces=" ">
<tableentry><tableterm><item><itemformat command="var"> a--b</itemformat></item>
<pre xml:space="preserve"><cindex index="cp"> <indexterm index="cp" number="1">index entry between item and itemx</indexterm></cindex>
<!-- c and a comment -->
<!-- comment and another comment -->
</pre><itemx><itemformat command="var"> b</itemformat></itemx>
<pre xml:space="preserve">
</pre><itemx><itemformat command="var"> c</itemformat></itemx>
</tableterm><tableitem><pre xml:space="preserve">l--ine
</pre></tableitem></tableentry><tableentry><tableterm><item><itemformat command="var"> d</itemformat></item>
</tableterm></tableentry></table>
</example>
';


$result_converted{'docbook'}->{'inter_item_commands_in_table_in_example'} = '<variablelist><varlistentry><term><replaceable>a--b</replaceable>
</term><screen><indexterm role="cp"><primary>index entry between item and itemx</primary></indexterm><!-- and a comment -->
<!-- and another comment -->
</screen><term><replaceable>b</replaceable>
</term><screen>
</screen><term><replaceable>c</replaceable>
</term><listitem><screen>l--ine
</screen></listitem></varlistentry><varlistentry><term><replaceable>d</replaceable>
</term></varlistentry></variablelist>';

1;
