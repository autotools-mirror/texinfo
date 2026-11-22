use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'symbol_after_command'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *@table C9 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@asis l1
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l2
      *line_arg C2
       {normal_text:. dot}
       {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l3
      *line_arg C2
       {normal_text:, comma}
       {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l4
      *line_arg C4
       *@@
       {normal_text: }
       *@@
       {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l5
      *line_arg C4
       *@{
       {normal_text: }
       *@{
       {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l6
      *line_arg C2
       {normal_text:! exclam}
       {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l7
      *line_arg C2
       {normal_text:\'\' quotes}
       {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l8
      *line_arg C2
       {normal_text:: colon}
       {spaces_after_argument:\\n}
   *@end C1 l9
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C18
   *@@
   {normal_text:. }
   *@{
   {normal_text:, }
   *@@
   *@@
   {normal_text: }
   *@?
   {normal_text:, }
   *@!
   {normal_text:: }
   *@@
   *@{
   {normal_text: }
   *@@
   {normal_text:\'\' }
   *@@
   {normal_text::\\n}
';


$result_texis{'symbol_after_command'} = '@table @asis
@item. dot
@item, comma
@item@@ @@
@item@{ @{
@item! exclam
@item\'\' quotes
@item: colon
@end table

@@. @{, @@@@ @?, @!: @@@{ @@\'\' @@:
';


$result_texts{'symbol_after_command'} = '. dot
, comma
@ @
{ {
! exclam
" quotes
: colon

@. {, @@ ?, !: @{ @" @:
';

$result_errors{'symbol_after_command'} = '';

$result_nodes_list{'symbol_after_command'} = '';

$result_sections_list{'symbol_after_command'} = '';

$result_sectioning_root{'symbol_after_command'} = '';

$result_headings_list{'symbol_after_command'} = '';


$result_converted{'plaintext'}->{'symbol_after_command'} = '. dot
, comma
@ @
{ {
! exclam
" quotes
: colon

   @.  {, @@ ?, !: @{ @" @:
';


$result_converted{'html_text'}->{'symbol_after_command'} = '<dl class="table">
<dt>. dot</dt>
<dt>, comma</dt>
<dt>@ @</dt>
<dt>{ {</dt>
<dt>! exclam</dt>
<dt>&rdquo; quotes</dt>
<dt>: colon</dt>
</dl>

<p>@. {, @@ ?, !: @{ @&rdquo; @:
</p>';


$result_converted{'xml'}->{'symbol_after_command'} = '<table commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis">. dot</itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item><itemformat command="asis">, comma</itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item><itemformat command="asis">&arobase; &arobase;</itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item><itemformat command="asis">&lbrace; &lbrace;</itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item><itemformat command="asis">! exclam</itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item><itemformat command="asis">&textrdquo; quotes</itemformat></item>
</tableterm></tableentry><tableentry><tableterm><item><itemformat command="asis">: colon</itemformat></item>
</tableterm></tableentry></table>

<para>&arobase;. &lbrace;, &arobase;&arobase; &eosquest;, &eosexcl;: &arobase;&lbrace; &arobase;&textrdquo; &arobase;:
</para>';


$result_converted{'latex_text'}->{'symbol_after_command'} = '\\begin{document}
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
. dot}}]
\\item[{\\parbox[b]{\\linewidth}{%
, comma}}]
\\item[{\\parbox[b]{\\linewidth}{%
@ @}}]
\\item[{\\parbox[b]{\\linewidth}{%
\\{ \\{}}]
\\item[{\\parbox[b]{\\linewidth}{%
! exclam}}]
\\item[{\\parbox[b]{\\linewidth}{%
\'\' quotes}}]
\\item[{\\parbox[b]{\\linewidth}{%
: colon}}]
\\end{description}

@. \\{, @@ \\@?, \\@!: @\\{ @\'\' @:
';


$result_converted{'docbook'}->{'symbol_after_command'} = '<variablelist><varlistentry><term>. dot
</term></varlistentry><varlistentry><term>, comma
</term></varlistentry><varlistentry><term>@ @
</term></varlistentry><varlistentry><term>{ {
</term></varlistentry><varlistentry><term>! exclam
</term></varlistentry><varlistentry><term>&#8221; quotes
</term></varlistentry><varlistentry><term>: colon
</term></varlistentry></variablelist>
<para>@. {, @@ ?, !: @{ @&#8221; @:
</para>';

1;
