use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'block_commands'} = '*document_root C1
 *before_node_section C7
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *@group C3 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:in group\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C3 l6
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:warning}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:in quotation\\n}
   *@end C1 l8
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@float C7 l10
  |EXTRA
  |float_number:{1}
  |float_type:{a float}
  |global_command_number:{1}
  |identifier:{b-float}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:a float}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:b float}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In float\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   *@caption C1 l14
    *brace_command_context C3
     *paragraph C1
      {normal_text:in caption\\n}
     {empty_line:\\n}
     *paragraph C1
      {normal_text:in caption}
   {spaces_after_close_brace:\\n}
   *@end C1 l17
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
';


$result_texis{'block_commands'} = '
@group
in group
@end group

@quotation warning
in quotation
@end quotation

@float a float, b float
In float


@caption{in caption

in caption}
@end float
';


$result_texts{'block_commands'} = 'in group

warning
in quotation

a float, b float
In float


';

$result_errors{'block_commands'} = '';

$result_floats{'block_commands'} = 'a float: 1
 F1: {b-float}
  C: in caption
   
   in caption
';

$result_nodes_list{'block_commands'} = '';

$result_sections_list{'block_commands'} = '';

$result_sectioning_root{'block_commands'} = '';

$result_headings_list{'block_commands'} = '';


$result_converted{'plaintext'}->{'block_commands'} = 'in group

     warning: in quotation

In float

a float 1: in caption

in caption
';


$result_converted{'html_text'}->{'block_commands'} = '<div class="group"><p>in group
</p></div>
<blockquote class="quotation">
<p><b class="b">warning:</b> in quotation
</p></blockquote>

<div class="float" id="b-float">
<p>In float
</p>

<div class="caption"><p><strong class="strong">a float 1: </strong>in caption
</p>
<p>in caption</p></div></div>';


$result_converted{'xml'}->{'block_commands'} = '<preamblebeforebeginning>
</preamblebeforebeginning><group endspaces=" ">
<para>in group
</para></group>

<quotation endspaces=" "><quotationtype> warning</quotationtype>
<para>in quotation
</para></quotation>

<float identifier="b-float" type="a float" number="1" endspaces=" "><floattype> a float</floattype><floatname> b float</floatname>
<para>In float
</para>

<caption><para>in caption
</para>
<para>in caption</para></caption>
</float>
';


$result_converted{'latex_text'}->{'block_commands'} = '\\begin{document}
in group

\\begin{quote}
\\textbf{warning:} in quotation
\\end{quote}

\\begin{TexinfoFloatafloat}
In float


\\caption{in caption

in caption}
\\label{anchor:b-float}%
\\end{TexinfoFloatafloat}
';


$result_converted{'docbook'}->{'block_commands'} = '<para>in group
</para>
<warning><para>in quotation
</para></warning>
<anchor id="b-float"/>
<para>In float
</para>

';

1;
