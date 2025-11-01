use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'enumerate_in_example'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *@example C3 l2
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@enumerate C4 l3
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *@item C1 l4
    |EXTRA
    |item_number:{1}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {first item\\n}
    *@item C1 l5
    |EXTRA
    |item_number:{2}
     *preformatted C4
      {ignorable_spaces_after_command: }
      {second  item\\n}
      {empty_line:\\n}
      {still second\\n}
    *@end C1 l8
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
   *@end C1 l9
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
';


$result_texis{'enumerate_in_example'} = '
@example
@enumerate
@item first item
@item second  item

still second
@end enumerate
@end example
';


$result_texts{'enumerate_in_example'} = '
1. first item
2. second  item

still second
';

$result_errors{'enumerate_in_example'} = '';

$result_nodes_list{'enumerate_in_example'} = '';

$result_sections_list{'enumerate_in_example'} = '';

$result_sectioning_root{'enumerate_in_example'} = '';

$result_headings_list{'enumerate_in_example'} = '';


$result_converted{'plaintext'}->{'enumerate_in_example'} = '       1. first item
       2. second  item

          still second
';


$result_converted{'html_text'}->{'enumerate_in_example'} = '
<div class="example">
<ol class="enumerate">
<li> <pre class="example-preformatted">first item
</pre></li><li> <pre class="example-preformatted">second  item

still second
</pre></li></ol>
</div>
';


$result_converted{'xml'}->{'enumerate_in_example'} = '
<example endspaces=" ">
<enumerate first="1" endspaces=" ">
<listitem><pre xml:space="preserve"> first item
</pre></listitem><listitem><pre xml:space="preserve"> second  item

still second
</pre></listitem></enumerate>
</example>
';


$result_converted{'latex_text'}->{'enumerate_in_example'} = '
\\begin{Texinfoindented}
\\begin{enumerate}[start=1]
\\item \\begin{Texinfopreformatted}%
\\ttfamily first item
\\end{Texinfopreformatted}
\\item \\begin{Texinfopreformatted}%
\\ttfamily second  item

still second
\\end{Texinfopreformatted}
\\end{enumerate}
\\end{Texinfoindented}
';

1;
