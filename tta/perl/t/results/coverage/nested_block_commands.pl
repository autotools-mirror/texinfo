use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'nested_block_commands'} = '*document_root C1
 *before_node_section C24
  *preamble_before_content
  *@group C4 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:In group\\n}
   *@quotation C3 l3
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in quotation\\n}
    *@end C1 l5
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *@end C1 l6
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C3 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@quotation C3 l9
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in quotation\\n}
    *@end C1 l11
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *@end C1 l12
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C5 l14
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:In group\\n}
   *@quotation C3 l16
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in quotation\\n}
    *@end C1 l18
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:after quotation\\n}
   *@end C1 l20
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C5 l22
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:In group sp b\\n}
   *@quotation C3 l25
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in quotation\\n}
    *@end C1 l27
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *@end C1 l28
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C6 l30
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:In group sp b a\\n}
   {empty_line:\\n}
   *@quotation C3 l34
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in quotation\\n}
    *@end C1 l36
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *@end C1 l37
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C5 l39
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:In group sp a\\n}
   {empty_line:\\n}
   *@quotation C3 l42
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in quotation\\n}
    *@end C1 l44
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *@end C1 l45
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C3 l47
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@quotation C4 l48
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:in quotation sp b\\n}
    *@end C1 l51
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *@end C1 l52
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C3 l54
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@quotation C5 l55
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:in quotation sp b a\\n}
    {empty_line:\\n}
    *@end C1 l59
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *@end C1 l60
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C3 l62
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@quotation C4 l63
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in quotation sp a\\n}
    {empty_line:\\n}
    *@end C1 l66
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *@end C1 l67
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C5 l69
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@quotation C3 l70
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in quotation\\n}
    *@end C1 l72
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:After quotation sp b\\n}
   *@end C1 l75
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C5 l77
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@quotation C3 l78
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in quotation\\n}
    *@end C1 l80
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:After quotation sp a\\n}
   {empty_line:\\n}
   *@end C1 l83
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C6 l85
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@quotation C3 l86
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:in quotation\\n}
    *@end C1 l88
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:After quotation sp b a\\n}
   {empty_line:\\n}
   *@end C1 l92
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
';


$result_texis{'nested_block_commands'} = '@group
In group
@quotation
in quotation
@end quotation
@end group

@group
@quotation
in quotation
@end quotation
@end group

@group
In group
@quotation
in quotation
@end quotation
after quotation
@end group

@group

In group sp b
@quotation
in quotation
@end quotation
@end group

@group

In group sp b a

@quotation
in quotation
@end quotation
@end group

@group
In group sp a

@quotation
in quotation
@end quotation
@end group

@group
@quotation

in quotation sp b
@end quotation
@end group

@group
@quotation

in quotation sp b a

@end quotation
@end group

@group
@quotation
in quotation sp a

@end quotation
@end group

@group
@quotation
in quotation
@end quotation

After quotation sp b
@end group

@group
@quotation
in quotation
@end quotation
After quotation sp a

@end group

@group
@quotation
in quotation
@end quotation

After quotation sp b a

@end group
';


$result_texts{'nested_block_commands'} = 'In group
in quotation

in quotation

In group
in quotation
after quotation


In group sp b
in quotation


In group sp b a

in quotation

In group sp a

in quotation


in quotation sp b


in quotation sp b a


in quotation sp a


in quotation

After quotation sp b

in quotation
After quotation sp a


in quotation

After quotation sp b a

';

$result_errors{'nested_block_commands'} = '';

$result_nodes_list{'nested_block_commands'} = '';

$result_sections_list{'nested_block_commands'} = '';

$result_sectioning_root{'nested_block_commands'} = '';

$result_headings_list{'nested_block_commands'} = '';


$result_converted{'plaintext'}->{'nested_block_commands'} = 'In group
     in quotation

     in quotation

   In group
     in quotation
   after quotation

   In group sp b
     in quotation

   In group sp b a

     in quotation

   In group sp a

     in quotation

     in quotation sp b

     in quotation sp b a

     in quotation sp a

     in quotation

   After quotation sp b

     in quotation
   After quotation sp a

     in quotation

   After quotation sp b a

';


$result_converted{'html_text'}->{'nested_block_commands'} = '<div class="group"><p>In group
</p><blockquote class="quotation">
<p>in quotation
</p></blockquote>
</div>
<div class="group"><blockquote class="quotation">
<p>in quotation
</p></blockquote>
</div>
<div class="group"><p>In group
</p><blockquote class="quotation">
<p>in quotation
</p></blockquote>
<p>after quotation
</p></div>
<div class="group">
<p>In group sp b
</p><blockquote class="quotation">
<p>in quotation
</p></blockquote>
</div>
<div class="group">
<p>In group sp b a
</p>
<blockquote class="quotation">
<p>in quotation
</p></blockquote>
</div>
<div class="group"><p>In group sp a
</p>
<blockquote class="quotation">
<p>in quotation
</p></blockquote>
</div>
<div class="group"><blockquote class="quotation">

<p>in quotation sp b
</p></blockquote>
</div>
<div class="group"><blockquote class="quotation">

<p>in quotation sp b a
</p>
</blockquote>
</div>
<div class="group"><blockquote class="quotation">
<p>in quotation sp a
</p>
</blockquote>
</div>
<div class="group"><blockquote class="quotation">
<p>in quotation
</p></blockquote>

<p>After quotation sp b
</p></div>
<div class="group"><blockquote class="quotation">
<p>in quotation
</p></blockquote>
<p>After quotation sp a
</p>
</div>
<div class="group"><blockquote class="quotation">
<p>in quotation
</p></blockquote>

<p>After quotation sp b a
</p>
</div>';


$result_converted{'xml'}->{'nested_block_commands'} = '<group endspaces=" ">
<para>In group
</para><quotation endspaces=" ">
<para>in quotation
</para></quotation>
</group>

<group endspaces=" ">
<quotation endspaces=" ">
<para>in quotation
</para></quotation>
</group>

<group endspaces=" ">
<para>In group
</para><quotation endspaces=" ">
<para>in quotation
</para></quotation>
<para>after quotation
</para></group>

<group endspaces=" ">

<para>In group sp b
</para><quotation endspaces=" ">
<para>in quotation
</para></quotation>
</group>

<group endspaces=" ">

<para>In group sp b a
</para>
<quotation endspaces=" ">
<para>in quotation
</para></quotation>
</group>

<group endspaces=" ">
<para>In group sp a
</para>
<quotation endspaces=" ">
<para>in quotation
</para></quotation>
</group>

<group endspaces=" ">
<quotation endspaces=" ">

<para>in quotation sp b
</para></quotation>
</group>

<group endspaces=" ">
<quotation endspaces=" ">

<para>in quotation sp b a
</para>
</quotation>
</group>

<group endspaces=" ">
<quotation endspaces=" ">
<para>in quotation sp a
</para>
</quotation>
</group>

<group endspaces=" ">
<quotation endspaces=" ">
<para>in quotation
</para></quotation>

<para>After quotation sp b
</para></group>

<group endspaces=" ">
<quotation endspaces=" ">
<para>in quotation
</para></quotation>
<para>After quotation sp a
</para>
</group>

<group endspaces=" ">
<quotation endspaces=" ">
<para>in quotation
</para></quotation>

<para>After quotation sp b a
</para>
</group>
';


$result_converted{'latex_text'}->{'nested_block_commands'} = '\\begin{document}
In group
\\begin{quote}
in quotation
\\end{quote}

\\begin{quote}
in quotation
\\end{quote}

In group
\\begin{quote}
in quotation
\\end{quote}
after quotation


In group sp b
\\begin{quote}
in quotation
\\end{quote}


In group sp b a

\\begin{quote}
in quotation
\\end{quote}

In group sp a

\\begin{quote}
in quotation
\\end{quote}

\\begin{quote}

in quotation sp b
\\end{quote}

\\begin{quote}

in quotation sp b a

\\end{quote}

\\begin{quote}
in quotation sp a

\\end{quote}

\\begin{quote}
in quotation
\\end{quote}

After quotation sp b

\\begin{quote}
in quotation
\\end{quote}
After quotation sp a


\\begin{quote}
in quotation
\\end{quote}

After quotation sp b a

';


$result_converted{'docbook'}->{'nested_block_commands'} = '<para>In group
</para><blockquote><para>in quotation
</para></blockquote>
<blockquote><para>in quotation
</para></blockquote>
<para>In group
</para><blockquote><para>in quotation
</para></blockquote><para>after quotation
</para>

<para>In group sp b
</para><blockquote><para>in quotation
</para></blockquote>

<para>In group sp b a
</para>
<blockquote><para>in quotation
</para></blockquote>
<para>In group sp a
</para>
<blockquote><para>in quotation
</para></blockquote>
<blockquote>
<para>in quotation sp b
</para></blockquote>
<blockquote>
<para>in quotation sp b a
</para>
</blockquote>
<blockquote><para>in quotation sp a
</para>
</blockquote>
<blockquote><para>in quotation
</para></blockquote>
<para>After quotation sp b
</para>
<blockquote><para>in quotation
</para></blockquote><para>After quotation sp a
</para>

<blockquote><para>in quotation
</para></blockquote>
<para>After quotation sp b a
</para>
';

1;
