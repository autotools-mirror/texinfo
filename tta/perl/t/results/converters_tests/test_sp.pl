use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_sp'} = '*document_root C1
 *before_node_section C16
  *preamble_before_content
  *paragraph C1
   {normal_text:Para\\n}
  *normal_command@sp C1 l2
  |EXTRA
  |misc_args:A{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:1}
    {spaces_after_argument:\\n}
  *paragraph C4
   {normal_text:other para\\n}
   {normal_text:Now lone }
   *normal_command@@
   {normal_text:sp:\\n}
  {empty_line:\\n}
  *normal_command@sp C1 l6
  |EXTRA
  |misc_args:A{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@sp C1 l8
  |EXTRA
  |misc_args:A{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:2}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Para after sp\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:A\\n}
  *normal_command@sp C1 l12
  |EXTRA
  |misc_args:A{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:2}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:B\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:sp after para\\n}
  *normal_command@sp C1 l16
  |EXTRA
  |misc_args:A{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:1}
    {spaces_after_argument:\\n}
';


$result_texis{'test_sp'} = 'Para
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
';


$result_texts{'test_sp'} = 'Para

other para
Now lone @sp:





Para after sp

A


B

sp after para

';

$result_errors{'test_sp'} = '';

$result_nodes_list{'test_sp'} = '';

$result_sections_list{'test_sp'} = '';

$result_sectioning_root{'test_sp'} = '';

$result_headings_list{'test_sp'} = '';


$result_converted{'plaintext'}->{'test_sp'} = 'Para

   other para Now lone @sp:




   Para after sp

   A


   B

   sp after para

';


$result_converted{'html_text'}->{'test_sp'} = '<p>Para
</p><br>
<p>other para
Now lone @sp:
</p>
<br>

<br>
<br>
<p>Para after sp
</p>
<p>A
</p><br>
<br>
<p>B
</p>
<p>sp after para
</p><br>
';


$result_converted{'xml'}->{'test_sp'} = '<para>Para
</para><sp value="1" line=" 1"></sp>
<para>other para
Now lone &arobase;sp:
</para>
<sp value="1" line=" 1"></sp>

<sp value="2" line=" 2"></sp>
<para>Para after sp
</para>
<para>A
</para><sp value="2" line=" 2"></sp>
<para>B
</para>
<para>sp after para
</para><sp value="1" line=" 1"></sp>
';


$result_converted{'docbook'}->{'test_sp'} = '<para>Para
</para><para>other para
Now lone @sp:
</para>

<para>Para after sp
</para>
<para>A
</para><para>B
</para>
<para>sp after para
</para>';


$result_converted{'latex_text'}->{'test_sp'} = '\\begin{document}
Para
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
';

1;
