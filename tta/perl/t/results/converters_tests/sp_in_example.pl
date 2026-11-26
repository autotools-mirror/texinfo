use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'sp_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C18
    {normal_text:Para\\n}
    *normal_command@sp C1 l3
    |misc_args:A{1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:1}
      {spaces_after_argument:\\n}
    {normal_text:other para\\n}
    {normal_text:Now lone }
    *normal_command@@
    {normal_text:sp:\\n}
    {empty_line:\\n}
    *normal_command@sp C1 l7
    |misc_args:A{1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:1}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
    *normal_command@sp C1 l9
    |misc_args:A{2}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:2}
      {spaces_after_argument:\\n}
    {normal_text:Para after sp\\n}
    {empty_line:\\n}
    {normal_text:A\\n}
    *normal_command@sp C1 l13
    |misc_args:A{2}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:2}
      {spaces_after_argument:\\n}
    {normal_text:B\\n}
    {empty_line:\\n}
    {normal_text:sp after para\\n}
    *normal_command@sp C1 l17
    |misc_args:A{1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:1}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l18
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'sp_in_example'} = '@example
Para
@sp 1
other para
Now lone @@sp:

@sp 1

@sp 2
Para after sp

A
@sp 2
B

sp after para
@sp 1
@end example
';


$result_texts{'sp_in_example'} = 'Para

other para
Now lone @sp:





Para after sp

A


B

sp after para

';

$result_errors{'sp_in_example'} = '';

$result_nodes_list{'sp_in_example'} = '';

$result_sections_list{'sp_in_example'} = '';

$result_sectioning_root{'sp_in_example'} = '';

$result_headings_list{'sp_in_example'} = '';


$result_converted{'plaintext'}->{'sp_in_example'} = '     Para

     other para
     Now lone @sp:





     Para after sp

     A


     B

     sp after para

';


$result_converted{'html_text'}->{'sp_in_example'} = '<div class="example">
<pre class="example-preformatted">Para

other para
Now lone @sp:





Para after sp

A


B

sp after para

</pre></div>
';


$result_converted{'xml'}->{'sp_in_example'} = '<example endspaces=" ">
<pre xml:space="preserve">Para
<sp value="1" line=" 1"></sp>
other para
Now lone &arobase;sp:

<sp value="1" line=" 1"></sp>

<sp value="2" line=" 2"></sp>
Para after sp

A
<sp value="2" line=" 2"></sp>
B

sp after para
<sp value="1" line=" 1"></sp>
</pre></example>
';


$result_converted{'docbook'}->{'sp_in_example'} = '<screen>Para
other para
Now lone @sp:


Para after sp

A
B

sp after para
</screen>';


$result_converted{'latex_text'}->{'sp_in_example'} = '\\begin{document}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily Para
\\vskip 1\\baselineskip %
other para
Now lone @sp:

\\vskip 1\\baselineskip %

\\vskip 2\\baselineskip %
Para after sp

A
\\vskip 2\\baselineskip %
B

sp after para
\\vskip 1\\baselineskip %
\\end{Texinfopreformatted}
\\end{Texinfoindented}
';

1;
