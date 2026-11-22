use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'space_in_image'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *normal_command@image C5 l1
  |input_encoding_name:{utf-8}
   *brace_arg C3
    {spaces_before_argument: }
    {normal_text:a}
    {spaces_after_argument: }
   *brace_arg C1
    {normal_text:bb}
   *brace_arg C2
    {spaces_before_argument: }
    {normal_text:cc}
   *brace_arg C2
    {normal_text:dd}
    {spaces_after_argument: }
   *brace_arg C2
    {normal_text:.e}
    {spaces_after_argument: }
  *paragraph C3
   {normal_text:. }
   *normal_command@image C1 l1
   |input_encoding_name:{utf-8}
    *brace_arg C3
     {spaces_before_argument: }
     {normal_text:f}
     {spaces_after_argument: }
   {normal_text:.}
';


$result_texis{'space_in_image'} = '@image{ a ,bb, cc,dd ,.e }. @image{ f }.';


$result_texts{'space_in_image'} = 'a. f.';

$result_errors{'space_in_image'} = '';

$result_nodes_list{'space_in_image'} = '';

$result_sections_list{'space_in_image'} = '';

$result_sectioning_root{'space_in_image'} = '';

$result_headings_list{'space_in_image'} = '';


$result_converted{'plaintext'}->{'space_in_image'} = 'An image text before paragraph..  Another image text, in paragraph..
';


$result_converted{'html_text'}->{'space_in_image'} = '<img class="image" src="a.e" alt="dd"><p>. <img class="image" src="f.jpg" alt="f">.</p>';

$result_converted_errors{'html_text'}->{'space_in_image'} = '* W l1|@image file `a\' (for HTML) not found, using `a.e\'
 warning: @image file `a\' (for HTML) not found, using `a.e\'

* W l1|@image file `f\' (for HTML) not found, using `f.jpg\'
 warning: @image file `f\' (for HTML) not found, using `f.jpg\'

';


$result_converted{'latex_text'}->{'space_in_image'} = '\\begin{document}
\\includegraphics[width=bb,height=cc,alt={dd}]{a}. \\includegraphics{f}.';

$result_converted_errors{'latex_text'}->{'space_in_image'} = '* W l1|@image file `a\' (for LaTeX) not found
 warning: @image file `a\' (for LaTeX) not found

* W l1|@image file `f\' (for LaTeX) not found
 warning: @image file `f\' (for LaTeX) not found

';


$result_converted{'docbook'}->{'space_in_image'} = '<informalfigure><mediaobject><imageobject><imagedata fileref="a.jpg" format="JPG"></imagedata></imageobject><textobject><literallayout>An image text before paragraph.</literallayout></textobject></mediaobject></informalfigure><para>. <inlinemediaobject><imageobject><imagedata fileref="f.jpg" format="JPG"></imagedata></imageobject><textobject><literallayout>Another image text, in paragraph.</literallayout></textobject></inlinemediaobject>.</para>';

1;
