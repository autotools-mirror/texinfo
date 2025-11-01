use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'enumerate_and_empty_lines'} = '*document_root C1
 *before_node_section C3
  *@enumerate C8 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {first item\\n}
   *@item C2 l3
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: \\n}
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
    {ignorable_spaces_after_command: \\n}
    {empty_line:\\n}
    *paragraph C1
     {empty line.\\n}
   *@item C3 l12
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
   *@item C3 l17
   |EXTRA
   |item_number:{5}
    {ignorable_spaces_after_command: \\n}
    *@quotation C3 l18
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *paragraph C1
      {Quotation\\n}
     *@end C1 l20
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
   *@item C3 l22
   |EXTRA
   |item_number:{6}
    {ignorable_spaces_after_command:\\n}
    {empty_line:\\n}
    *@quotation C3 l24
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *paragraph C1
      {quotation after a blank line\\n}
     *@end C1 l26
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
   *@end C1 l27
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {enumerate}
  {empty_line:\\n}
  *@enumerate C3 l29
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@item C2 l30
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa fffffffff ggggggggg vvvvvvvvv ggggggggg h\\n}
   *@end C1 l31
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {enumerate}
';


$result_texis{'enumerate_and_empty_lines'} = '@enumerate
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
@end enumerate

@enumerate
@item aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa fffffffff ggggggggg vvvvvvvvv ggggggggg h
@end enumerate
';


$result_texts{'enumerate_and_empty_lines'} = '1. first item
2. In example

end example.
3. 
empty line.
4. 
In second example
5. Quotation

6. 
quotation after a blank line

1. aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa fffffffff ggggggggg vvvvvvvvv ggggggggg h
';

$result_errors{'enumerate_and_empty_lines'} = '';

$result_nodes_list{'enumerate_and_empty_lines'} = '';

$result_sections_list{'enumerate_and_empty_lines'} = '';

$result_sectioning_root{'enumerate_and_empty_lines'} = '';

$result_headings_list{'enumerate_and_empty_lines'} = '';


$result_converted{'plaintext'}->{'enumerate_and_empty_lines'} = '  1. first item
  2.      In example

          end example.
  3. 
     empty line.
  4. 
          In second example
  5.      Quotation

  6. 
          quotation after a blank line

  1. aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa fffffffff ggggggggg
     vvvvvvvvv ggggggggg h
';


$result_converted{'html_text'}->{'enumerate_and_empty_lines'} = '<ol class="enumerate">
<li> first item
</li><li> <div class="example">
<pre class="example-preformatted">In example

end example.
</pre></div>
</li><li> 
empty line.
</li><li> 
<div class="example">
<pre class="example-preformatted">In second example
</pre></div>
</li><li> <blockquote class="quotation">
<p>Quotation
</p></blockquote>

</li><li> 
<blockquote class="quotation">
<p>quotation after a blank line
</p></blockquote>
</li></ol>

<ol class="enumerate">
<li> aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa fffffffff ggggggggg vvvvvvvvv ggggggggg h
</li></ol>
';


$result_converted{'xml'}->{'enumerate_and_empty_lines'} = '<enumerate first="1" endspaces=" ">
<listitem> <para>first item
</para></listitem><listitem> 
<example endspaces=" ">
<pre xml:space="preserve">In example

end example.
</pre></example>
</listitem><listitem> 

<para>empty line.
</para></listitem><listitem>

<example endspaces=" ">
<pre xml:space="preserve">In second example
</pre></example>
</listitem><listitem> 
<quotation endspaces=" ">
<para>Quotation
</para></quotation>

</listitem><listitem>

<quotation endspaces=" ">
<para>quotation after a blank line
</para></quotation>
</listitem></enumerate>

<enumerate first="1" endspaces=" ">
<listitem> <para>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa fffffffff ggggggggg vvvvvvvvv ggggggggg h
</para></listitem></enumerate>
';

1;
