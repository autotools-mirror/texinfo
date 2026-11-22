use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comments_end_lines'} = '*document_root C1
 *before_node_section C20
  *preamble_before_content
  *normal_command@itemize C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:itemize it\\n}
   *normal_command@end C1 l3
   |EXTRA
   |text_arg:{itemize}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:  }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment itemize}
       {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C2 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@end C1 l6
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C3 l8
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l8
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l9
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:it}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l10
   |EXTRA
   |text_arg:{table}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:table}
       {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l12
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:Quot no arg\\n}
   *normal_command@end C1 l14
   |EXTRA
   |text_arg:{quotation}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:quot no arg}
       {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@group C3 l16
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:in gr\\n}
   *normal_command@end C1 l18
   |EXTRA
   |text_arg:{group}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l20
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:in ex\\n}
   *normal_command@end C1 l22
   |EXTRA
   |text_arg:{example}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@multitable C3 l24
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l24
     |EXTRA
     |misc_args:A{0.4|0.6}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.4 0.6}
       {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *normal_command@item C2 l25
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:a }
     *normal_command@tab C2 l25
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:b\\n}
   *normal_command@end C1 l26
   |EXTRA
   |text_arg:{multitable}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C3 l28
  |EXTRA
  |float_number:{1}
  |float_type:{f}
  |global_command_number:{1}
  |identifier:{g}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:f}
    *block_line_arg C2
     {normal_text:g}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In f\\n}
   *normal_command@end C1 l30
   |EXTRA
   |text_arg:{float}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:  }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@flushright C3 l32
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:flushright\\n}
   *normal_command@end C1 l34
   |EXTRA
   |text_arg:{flushright}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:flushright}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@raggedright C3 l36
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:raggedright\\n}
   *normal_command@end C1 l38
   |EXTRA
   |text_arg:{raggedright}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:raggedright}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
';


$result_texis{'comments_end_lines'} = '@itemize
@item itemize it
@end itemize  @c comment itemize

@enumerate
@end enumerate @c comm

@table @asis
@item it
@end table @c table

@quotation
Quot no arg
@end quotation @c quot no arg

@group
in gr
@end group @c comm

@example
in ex
@end example @c comm

@multitable @columnfractions 0.4 0.6
@item a @tab b
@end multitable @c comm

@float f,g
In f
@end float  @c comm

@flushright
flushright
@end flushright @c comm

@raggedright
raggedright
@end raggedright @c comm
';


$result_texts{'comments_end_lines'} = 'itemize it


it

Quot no arg

in gr

in ex

a b

f, g
In f

flushright

raggedright
';

$result_errors{'comments_end_lines'} = '';

$result_floats{'comments_end_lines'} = 'f: 1
 F1: {g}
';

$result_nodes_list{'comments_end_lines'} = '';

$result_sections_list{'comments_end_lines'} = '';

$result_sectioning_root{'comments_end_lines'} = '';

$result_headings_list{'comments_end_lines'} = '';


$result_converted{'xml'}->{'comments_end_lines'} = '<itemize endspaces=" ">
<listitem><prepend>&bullet;</prepend> <para>itemize it
</para></listitem></itemize>  <!-- c comment itemize -->

<enumerate first="1" endspaces=" ">
</enumerate> <!-- c comm -->

<table commandarg="asis" endspaces=" ">
<tableentry><tableterm><item><itemformat command="asis"> it</itemformat></item>
</tableterm></tableentry></table> <!-- c table -->

<quotation endspaces=" ">
<para>Quot no arg
</para></quotation> <!-- c quot no arg -->

<group endspaces=" ">
<para>in gr
</para></group> <!-- c comm -->

<example endspaces=" ">
<pre xml:space="preserve">in ex
</pre></example> <!-- c comm -->

<multitable endspaces=" "><columnfractions line=" 0.4 0.6"><columnfraction value="0.4"></columnfraction><columnfraction value="0.6"></columnfraction></columnfractions>
<tbody><row><entry command="item"> <para>a </para></entry><entry command="tab"> <para>b
</para></entry></row></tbody></multitable> <!-- c comm -->

<float identifier="g" type="f" number="1" endspaces=" "><floattype> f</floattype><floatname>g</floatname>
<para>In f
</para></float>  <!-- c comm -->

<flushright endspaces=" ">
<para>flushright
</para></flushright> <!-- c comm -->

<raggedright endspaces=" ">
<para>raggedright
</para></raggedright> <!-- c comm -->
';

1;
