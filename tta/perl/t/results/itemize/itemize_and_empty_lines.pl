use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'itemize_and_empty_lines'} = '*document_root C1
 *before_node_section C14
  *@itemize C7 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {youhou}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {first item\\n}
   *@item C2 l3
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command:\\n}
    *@example C3 l4
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *preformatted C3
      {In example\\n}
      {empty_line:\\n}
      {end example.\\n}
     *@end C1 l8
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{example}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {example}
   *@item C3 l9
   |EXTRA
   |item_number:{3}
    {ignorable_spaces_after_command:\\n}
    {empty_line:\\n}
    *paragraph C1
     {empty line.\\n}
   *@item C5 l12
   |EXTRA
   |item_number:{4}
    {ignorable_spaces_after_command:\\n}
    {empty_line:\\n}
    *@example C3 l14
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *preformatted C1
      {In second example\\n}
     *@end C1 l16
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{example}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {example}
    *@quotation C3 l17
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *paragraph C1
      {Quotation\\n}
     *@end C1 l19
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{quotation}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {quotation}
    {empty_line:\\n}
   *@item C3 l21
   |EXTRA
   |item_number:{5}
    {ignorable_spaces_after_command:\\n}
    {empty_line:\\n}
    *@quotation C3 l23
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *paragraph C1
      {quotation after a blank line\\n}
     *@end C1 l25
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{quotation}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {quotation}
   *@end C1 l26
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
  {empty_line:\\n}
  *@itemize C8 l28
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@item C2 l29
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {first item\\n}
   *@item C2 l30
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command:\\n}
    *@example C3 l31
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *preformatted C3
      {In example\\n}
      {empty_line:\\n}
      {end example.\\n}
     *@end C1 l35
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{example}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {example}
   *@item C3 l36
   |EXTRA
   |item_number:{3}
    {ignorable_spaces_after_command:\\n}
    {empty_line:\\n}
    *paragraph C1
     {empty line.\\n}
   *@item C3 l39
   |EXTRA
   |item_number:{4}
    {ignorable_spaces_after_command:\\n}
    {empty_line:\\n}
    *@example C3 l41
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *preformatted C1
      {In second example\\n}
     *@end C1 l43
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{example}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {example}
   *@item C3 l44
   |EXTRA
   |item_number:{5}
    {ignorable_spaces_after_command:\\n}
    *@quotation C3 l45
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *paragraph C1
      {Quotation\\n}
     *@end C1 l47
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{quotation}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {quotation}
    {empty_line:\\n}
   *@item C3 l49
   |EXTRA
   |item_number:{6}
    {ignorable_spaces_after_command:\\n}
    {empty_line:\\n}
    *@quotation C3 l51
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *paragraph C1
      {quotation after a blank line\\n}
     *@end C1 l53
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{quotation}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {quotation}
   *@end C1 l54
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
  {empty_line:\\n}
  *paragraph C1
   {An itemize\\n}
  *@itemize C3 l57
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@minus l57
   *@item C2 l58
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C2
     {truc \\n}
     {line\\n}
   *@end C1 l60
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
  *paragraph C1
   {After itemize\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C1
   {A nested itemize\\n}
  *@itemize C3 l65
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@minus l65
   *@item C4 l66
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C2
     {truc \\n}
     {line\\n}
    *@itemize C3 l68
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     *arguments_line C1
      *block_line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       *@bullet l68
     *@item C2 l69
     |EXTRA
     |item_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {in nested itemize\\n}
     *@end C1 l70
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{itemize}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {itemize}
    *paragraph C1
     {After inside nested itemize.\\n}
   *@end C1 l72
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
  *paragraph C1
   {After nested itemize\\n}
  {empty_line:\\n}
  *@itemize C5 l75
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@bullet l75
   *@item C2 l76
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {the version number of Texinfo and the program(s) or manual(s) involved.\\n}
   *@item C2 l77
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {hardware and operating system names and versions.\\n}
   *@item C2 l78
   |EXTRA
   |item_number:{3}
    {ignorable_spaces_after_command: }
    *paragraph C2
     {something aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaa\\n}
     {b b bbbbbbbbbbbbbbbbbbbbbbb.\\n}
   *@end C1 l80
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{itemize}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {itemize}
';


$result_texis{'itemize_and_empty_lines'} = '@itemize youhou
@item first item
@item
@example
In example

end example.
@end example
@item

empty line.
@item

@example
In second example
@end example
@quotation
Quotation
@end quotation

@item

@quotation
quotation after a blank line
@end quotation
@end itemize

@itemize
@item first item
@item
@example
In example

end example.
@end example
@item

empty line.
@item

@example
In second example
@end example
@item
@quotation
Quotation
@end quotation

@item

@quotation
quotation after a blank line
@end quotation
@end itemize

An itemize
@itemize @minus
@item truc 
line
@end itemize
After itemize


A nested itemize
@itemize @minus
@item truc 
line
@itemize @bullet
@item in nested itemize
@end itemize
After inside nested itemize.
@end itemize
After nested itemize

@itemize @bullet
@item the version number of Texinfo and the program(s) or manual(s) involved.
@item hardware and operating system names and versions.
@item something aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaa
b b bbbbbbbbbbbbbbbbbbbbbbb.
@end itemize
';


$result_texts{'itemize_and_empty_lines'} = 'first item
In example

end example.

empty line.

In second example
Quotation


quotation after a blank line

first item
In example

end example.

empty line.

In second example
Quotation


quotation after a blank line

An itemize
truc 
line
After itemize


A nested itemize
truc 
line
in nested itemize
After inside nested itemize.
After nested itemize

the version number of Texinfo and the program(s) or manual(s) involved.
hardware and operating system names and versions.
something aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaa
b b bbbbbbbbbbbbbbbbbbbbbbb.
';

$result_errors{'itemize_and_empty_lines'} = '';

$result_nodes_list{'itemize_and_empty_lines'} = '';

$result_sections_list{'itemize_and_empty_lines'} = '';

$result_sectioning_root{'itemize_and_empty_lines'} = '';

$result_headings_list{'itemize_and_empty_lines'} = '';


$result_converted{'plaintext'}->{'itemize_and_empty_lines'} = '   youhou first item
   youhou In example

          end example.
   youhou 
     empty line.
   youhou 
          In second example
          Quotation

   youhou 
          quotation after a blank line

   • first item
   •      In example

          end example.
   • 
     empty line.
   • 
          In second example
   •      Quotation

   • 
          quotation after a blank line

   An itemize
   − truc line
   After itemize

   A nested itemize
   − truc line
        • in nested itemize
     After inside nested itemize.
   After nested itemize

   • the version number of Texinfo and the program(s) or manual(s)
     involved.
   • hardware and operating system names and versions.
   • something aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaa b b
     bbbbbbbbbbbbbbbbbbbbbbb.
';


$result_converted{'html_text'}->{'itemize_and_empty_lines'} = '<ul class="itemize" style="list-style-type: \'youhou\'">
<li>first item
</li><li><div class="example">
<pre class="example-preformatted">In example

end example.
</pre></div>
</li><li>
empty line.
</li><li>
<div class="example">
<pre class="example-preformatted">In second example
</pre></div>
<blockquote class="quotation">
<p>Quotation
</p></blockquote>

</li><li>
<blockquote class="quotation">
<p>quotation after a blank line
</p></blockquote>
</li></ul>

<ul class="itemize mark-bullet">
<li>first item
</li><li><div class="example">
<pre class="example-preformatted">In example

end example.
</pre></div>
</li><li>
empty line.
</li><li>
<div class="example">
<pre class="example-preformatted">In second example
</pre></div>
</li><li><blockquote class="quotation">
<p>Quotation
</p></blockquote>

</li><li>
<blockquote class="quotation">
<p>quotation after a blank line
</p></blockquote>
</li></ul>

<p>An itemize
</p><ul class="itemize mark-minus">
<li>truc 
line
</li></ul>
<p>After itemize
</p>

<p>A nested itemize
</p><ul class="itemize mark-minus">
<li>truc 
line
<ul class="itemize mark-bullet">
<li>in nested itemize
</li></ul>
<p>After inside nested itemize.
</p></li></ul>
<p>After nested itemize
</p>
<ul class="itemize mark-bullet">
<li>the version number of Texinfo and the program(s) or manual(s) involved.
</li><li>hardware and operating system names and versions.
</li><li>something aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaa
b b bbbbbbbbbbbbbbbbbbbbbbb.
</li></ul>
';


$result_converted{'xml'}->{'itemize_and_empty_lines'} = '<itemize spaces=" " endspaces=" "><itemprepend>youhou</itemprepend>
<listitem><prepend>youhou</prepend> <para>first item
</para></listitem><listitem><prepend>youhou</prepend>
<example endspaces=" ">
<pre xml:space="preserve">In example

end example.
</pre></example>
</listitem><listitem><prepend>youhou</prepend>

<para>empty line.
</para></listitem><listitem><prepend>youhou</prepend>

<example endspaces=" ">
<pre xml:space="preserve">In second example
</pre></example>
<quotation endspaces=" ">
<para>Quotation
</para></quotation>

</listitem><listitem><prepend>youhou</prepend>

<quotation endspaces=" ">
<para>quotation after a blank line
</para></quotation>
</listitem></itemize>

<itemize endspaces=" ">
<listitem><prepend>&bullet;</prepend> <para>first item
</para></listitem><listitem><prepend>&bullet;</prepend>
<example endspaces=" ">
<pre xml:space="preserve">In example

end example.
</pre></example>
</listitem><listitem><prepend>&bullet;</prepend>

<para>empty line.
</para></listitem><listitem><prepend>&bullet;</prepend>

<example endspaces=" ">
<pre xml:space="preserve">In second example
</pre></example>
</listitem><listitem><prepend>&bullet;</prepend>
<quotation endspaces=" ">
<para>Quotation
</para></quotation>

</listitem><listitem><prepend>&bullet;</prepend>

<quotation endspaces=" ">
<para>quotation after a blank line
</para></quotation>
</listitem></itemize>

<para>An itemize
</para><itemize commandarg="minus" spaces=" " endspaces=" "><itemprepend><formattingcommand command="minus"/></itemprepend>
<listitem><prepend>&minus;</prepend> <para>truc 
line
</para></listitem></itemize>
<para>After itemize
</para>

<para>A nested itemize
</para><itemize commandarg="minus" spaces=" " endspaces=" "><itemprepend><formattingcommand command="minus"/></itemprepend>
<listitem><prepend>&minus;</prepend> <para>truc 
line
</para><itemize commandarg="bullet" spaces=" " endspaces=" "><itemprepend><formattingcommand command="bullet"/></itemprepend>
<listitem><prepend>&bullet;</prepend> <para>in nested itemize
</para></listitem></itemize>
<para>After inside nested itemize.
</para></listitem></itemize>
<para>After nested itemize
</para>
<itemize commandarg="bullet" spaces=" " endspaces=" "><itemprepend><formattingcommand command="bullet"/></itemprepend>
<listitem><prepend>&bullet;</prepend> <para>the version number of Texinfo and the program(s) or manual(s) involved.
</para></listitem><listitem><prepend>&bullet;</prepend> <para>hardware and operating system names and versions.
</para></listitem><listitem><prepend>&bullet;</prepend> <para>something aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa aaaaaa
b b bbbbbbbbbbbbbbbbbbbbbbb.
</para></listitem></itemize>
';

1;
