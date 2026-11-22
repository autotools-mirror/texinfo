use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'itemize_long_item'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@itemize C8 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc}
     {spaces_after_argument:\\n}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:first item\\n}
   *@item C2 l3
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command:\\n}
    *@example C3 l4
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *preformatted C3
      {normal_text:In example\\n}
      {empty_line:\\n}
      {normal_text:end example.\\n}
     *@end C1 l8
     |EXTRA
     |text_arg:{example}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:example}
       {spaces_after_argument:\\n}
   *@item C3 l9
   |EXTRA
   |item_number:{3}
    {ignorable_spaces_after_command:\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:empty line.\\n}
   *@item C3 l12
   |EXTRA
   |item_number:{4}
    {ignorable_spaces_after_command:\\n}
    {empty_line:\\n}
    *@example C3 l14
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *preformatted C1
      {normal_text:In second example\\n}
     *@end C1 l16
     |EXTRA
     |text_arg:{example}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:example}
       {spaces_after_argument:\\n}
   *@item C3 l17
   |EXTRA
   |item_number:{5}
    {ignorable_spaces_after_command:\\n}
    *@quotation C3 l18
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *paragraph C1
      {normal_text:Quotation\\n}
     *@end C1 l20
     |EXTRA
     |text_arg:{quotation}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:quotation}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
   *@item C3 l22
   |EXTRA
   |item_number:{6}
    {ignorable_spaces_after_command:\\n}
    {empty_line:\\n}
    *@quotation C3 l24
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *paragraph C1
      {normal_text:quotation after a blank line\\n}
     *@end C1 l26
     |EXTRA
     |text_arg:{quotation}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:quotation}
       {spaces_after_argument:\\n}
   *@end C1 l27
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
';


$result_texis{'itemize_long_item'} = '@itemize youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc
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
';


$result_texts{'itemize_long_item'} = 'first item
In example

end example.

empty line.

In second example
Quotation


quotation after a blank line
';

$result_errors{'itemize_long_item'} = '';

$result_nodes_list{'itemize_long_item'} = '';

$result_sections_list{'itemize_long_item'} = '';

$result_sectioning_root{'itemize_long_item'} = '';

$result_headings_list{'itemize_long_item'} = '';


$result_converted{'plaintext'}->{'itemize_long_item'} = '   youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc 
     first item
   youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc In example

          end example.
   youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc 
     empty line.
   youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc 
          In second example
   youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc 
          Quotation

   youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc 
          quotation after a blank line
';


$result_converted{'html_text'}->{'itemize_long_item'} = '<ul class="itemize" style="list-style-type: \'youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc\'">
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
';


$result_converted{'xml'}->{'itemize_long_item'} = '<itemize endspaces=" "><itemprepend> youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc</itemprepend>
<listitem><prepend>youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc</prepend> <para>first item
</para></listitem><listitem><prepend>youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc</prepend>
<example endspaces=" ">
<pre xml:space="preserve">In example

end example.
</pre></example>
</listitem><listitem><prepend>youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc</prepend>

<para>empty line.
</para></listitem><listitem><prepend>youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc</prepend>

<example endspaces=" ">
<pre xml:space="preserve">In second example
</pre></example>
</listitem><listitem><prepend>youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc</prepend>
<quotation endspaces=" ">
<para>Quotation
</para></quotation>

</listitem><listitem><prepend>youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc</prepend>

<quotation endspaces=" ">
<para>quotation after a blank line
</para></quotation>
</listitem></itemize>
';


$result_converted{'latex_text'}->{'itemize_long_item'} = '\\begin{document}
\\begin{itemize}[label=youhou itemize very long item aaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbb cccccccccccc]
\\item first item
\\item \\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily In example

end example.
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\item 
empty line.
\\item 
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily In second example
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\item \\begin{quote}
Quotation
\\end{quote}

\\item 
\\begin{quote}
quotation after a blank line
\\end{quote}
\\end{itemize}
';

1;
