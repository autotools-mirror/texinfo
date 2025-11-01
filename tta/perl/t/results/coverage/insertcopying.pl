use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'insertcopying'} = '*document_root C1
 *before_node_section C5
  *@copying C5 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {License.\\n}
   {empty_line:\\n}
   *@quotation C3 l4
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument: \\n}
    *paragraph C1
     {You are not allowed.\\n}
    *@end C1 l6
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
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{copying}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {copying}
  {empty_line:\\n}
  *paragraph C1
   {License:\\n}
  {empty_line:\\n}
  *@insertcopying C1 l11
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
';


$result_texis{'insertcopying'} = '@copying
License.

@quotation 
You are not allowed.
@end quotation
@end copying

License:

@insertcopying
';


$result_texts{'insertcopying'} = '
License:

';

$result_errors{'insertcopying'} = '';

$result_nodes_list{'insertcopying'} = '';

$result_sections_list{'insertcopying'} = '';

$result_sectioning_root{'insertcopying'} = '';

$result_headings_list{'insertcopying'} = '';


$result_converted{'plaintext'}->{'insertcopying'} = 'License:

   License.

     You are not allowed.
';


$result_converted{'html_text'}->{'insertcopying'} = '
<p>License:
</p>
<p>License.
</p>
<blockquote class="quotation">
<p>You are not allowed.
</p></blockquote>
';


$result_converted{'xml'}->{'insertcopying'} = '<copying endspaces=" ">
<para>License.
</para>
<quotation endspaces=" "> 
<para>You are not allowed.
</para></quotation>
</copying>

<para>License:
</para>
<insertcopying></insertcopying>
';


$result_converted{'latex_text'}->{'insertcopying'} = '
License:

License.

\\begin{quote}
You are not allowed.
\\end{quote}
';


$result_converted{'docbook_doc'}->{'insertcopying'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book>
<bookinfo><legalnotice><para>License.
</para>
<blockquote><para>You are not allowed.
</para></blockquote></legalnotice></bookinfo>

<para>License:
</para>
<para>License.
</para>
<blockquote><para>You are not allowed.
</para></blockquote></book>
';

1;
