use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'verbatim_and_verbatiminclude'} = '*document_root C1
 *before_node_section C26
  *preamble_before_content
  *normal_command@verbatim C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb\\n}
   *normal_command@end C1 l3
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Text before\\n}
  *normal_command@verbatim C3 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:in verbatime\\n}
   *normal_command@end C1 l8
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:Text after\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:In quotation\\n}
   *normal_command@verbatim C4 l13
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {raw:In verbatim in quotation\\n}
    {raw:In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb\\n}
    *normal_command@end C1 l16
    |EXTRA
    |text_arg:{verbatim}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:verbatim}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l17
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Before\\n}
  *normal_command@verbatim C3 l20
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:In verbatim test text\\n}
   *normal_command@end C1 l22
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:After\\n}
  {empty_line:\\n}
  *normal_command@verbatiminclude C1 l25
  |EXTRA
  |input_encoding_name:{utf-8}
  |text_arg:{verb.txt}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:verb.txt}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l27
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:In quotation include \\n}
   *normal_command@verbatiminclude C1 l29
   |EXTRA
   |input_encoding_name:{utf-8}
   |text_arg:{verb.txt}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verb.txt}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l30
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Before include\\n}
  *normal_command@verbatiminclude C1 l33
  |EXTRA
  |input_encoding_name:{utf-8}
  |text_arg:{verb.txt}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:verb.txt}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:After\\n}
  {empty_line:\\n}
  *normal_command@example C5 l36
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    {normal_text:In example\\n}
    {empty_line:\\n}
   *normal_command@verbatim C4 l39
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {raw:In verbatim in example\\n}
    {raw:In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb\\n}
    *normal_command@end C1 l42
    |EXTRA
    |text_arg:{verbatim}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:verbatim}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *normal_command@end C1 l44
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C6 l46
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:In quotation with spaces\\n}
   {empty_line:\\n}
   *normal_command@verbatim C4 l49
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {raw:In verbatim in quotation with spaces\\n}
    {raw:In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb\\n}
    *normal_command@end C1 l52
    |EXTRA
    |text_arg:{verbatim}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:verbatim}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@end C1 l54
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C6 l56
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:In quotation \\n}
   {empty_line:\\n}
   *normal_command@verbatim C3 l59
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {raw:In verbatim in quotation\\n}
    *normal_command@end C1 l61
    |EXTRA
    |text_arg:{verbatim}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:verbatim}
      {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:in quotation after end verbaatim\\n}
   *normal_command@end C1 l63
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'verbatim_and_verbatiminclude'} = '@verbatim
In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb
@end verbatim

Text before
@verbatim
in verbatime
@end verbatim
Text after

@quotation
In quotation
@verbatim
In verbatim in quotation
In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb
@end verbatim
@end quotation

Before
@verbatim
In verbatim test text
@end verbatim
After

@verbatiminclude verb.txt

@quotation
In quotation include 
@verbatiminclude verb.txt
@end quotation

Before include
@verbatiminclude verb.txt
After

@example
In example

@verbatim
In verbatim in example
In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb
@end verbatim

@end example

@quotation
In quotation with spaces

@verbatim
In verbatim in quotation with spaces
In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb
@end verbatim

@end quotation

@quotation
In quotation 

@verbatim
In verbatim in quotation
@end verbatim
in quotation after end verbaatim
@end quotation
';


$result_texts{'verbatim_and_verbatiminclude'} = 'In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb

Text before
in verbatime
Text after

In quotation
In verbatim in quotation
In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb

Before
In verbatim test text
After


In quotation include 

Before include
After

In example

In verbatim in example
In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb


In quotation with spaces

In verbatim in quotation with spaces
In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb


In quotation 

In verbatim in quotation
in quotation after end verbaatim
';

$result_errors{'verbatim_and_verbatiminclude'} = '';

$result_nodes_list{'verbatim_and_verbatiminclude'} = '';

$result_sections_list{'verbatim_and_verbatiminclude'} = '';

$result_sectioning_root{'verbatim_and_verbatiminclude'} = '';

$result_headings_list{'verbatim_and_verbatiminclude'} = '';


$result_converted{'plaintext'}->{'verbatim_and_verbatiminclude'} = 'In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb

   Text before
in verbatime
   Text after

     In quotation
     In verbatim in quotation
     In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb

   Before
In verbatim test text
   After

     In quotation include

   Before include
   After

     In example

     In verbatim in example
     In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb

     In quotation with spaces

     In verbatim in quotation with spaces
     In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb

     In quotation

     In verbatim in quotation
     in quotation after end verbaatim
';

$result_converted_errors{'plaintext'}->{'verbatim_and_verbatiminclude'} = '* E l25|@verbatiminclude: could not find verb.txt
 @verbatiminclude: could not find verb.txt

* E l29|@verbatiminclude: could not find verb.txt
 @verbatiminclude: could not find verb.txt

* E l33|@verbatiminclude: could not find verb.txt
 @verbatiminclude: could not find verb.txt

';


$result_converted{'xml'}->{'verbatim_and_verbatiminclude'} = '<verbatim xml:space="preserve" endspaces=" ">
In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb
</verbatim>

<para>Text before
</para><verbatim xml:space="preserve" endspaces=" ">
in verbatime
</verbatim>
<para>Text after
</para>
<quotation endspaces=" ">
<para>In quotation
</para><verbatim xml:space="preserve" endspaces=" ">
In verbatim in quotation
In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb
</verbatim>
</quotation>

<para>Before
</para><verbatim xml:space="preserve" endspaces=" ">
In verbatim test text
</verbatim>
<para>After
</para>
<verbatiminclude file="verb.txt"> verb.txt</verbatiminclude>

<quotation endspaces=" ">
<para>In quotation include 
</para><verbatiminclude file="verb.txt"> verb.txt</verbatiminclude>
</quotation>

<para>Before include
</para><verbatiminclude file="verb.txt"> verb.txt</verbatiminclude>
<para>After
</para>
<example endspaces=" ">
<pre xml:space="preserve">In example

</pre><verbatim xml:space="preserve" endspaces=" ">
In verbatim in example
In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb
</verbatim>
<pre xml:space="preserve">
</pre></example>

<quotation endspaces=" ">
<para>In quotation with spaces
</para>
<verbatim xml:space="preserve" endspaces=" ">
In verbatim in quotation with spaces
In verbatim                @@                        aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa       bbbbbbbbbbbbbb
</verbatim>

</quotation>

<quotation endspaces=" ">
<para>In quotation 
</para>
<verbatim xml:space="preserve" endspaces=" ">
In verbatim in quotation
</verbatim>
<para>in quotation after end verbaatim
</para></quotation>
';

1;
