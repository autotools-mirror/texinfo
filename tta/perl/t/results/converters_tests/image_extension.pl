use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'image_extension'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *normal_command@image C5 l1
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:f---ile}
   *brace_arg
   *brace_arg
   *brace_arg
   *brace_arg C1
    {normal_text:.gr--a}
  {normal_text:\\n}
';


$result_texis{'image_extension'} = '@image{f---ile,,,,.gr--a}
';


$result_texts{'image_extension'} = 'f---ile
';

$result_errors{'image_extension'} = '';

$result_nodes_list{'image_extension'} = '';

$result_sections_list{'image_extension'} = '';

$result_sectioning_root{'image_extension'} = '';

$result_headings_list{'image_extension'} = '';


$result_converted{'plaintext'}->{'image_extension'} = '[f---ile]
';

$result_converted_errors{'plaintext'}->{'image_extension'} = '* W l1|could not find @image file `f---ile.txt\' nor alternate text
 warning: could not find @image file `f---ile.txt\' nor alternate text

';


$result_converted{'html_text'}->{'image_extension'} = '<img class="image" src="f---ile.gr--a" alt="f---ile">
';

$result_converted_errors{'html_text'}->{'image_extension'} = '* W l1|@image file `f---ile\' (for HTML) not found, using `f---ile.gr--a\'
 warning: @image file `f---ile\' (for HTML) not found, using `f---ile.gr--a\'

';


$result_converted{'xml'}->{'image_extension'} = '<image><imagefile>f---ile</imagefile><imageextension>.gr--a</imageextension></image>
';


$result_converted{'docbook'}->{'image_extension'} = '<informalfigure><mediaobject><imageobject><imagedata fileref="f---ile.jpg" format="JPG"></imagedata></imageobject></mediaobject></informalfigure>
';

$result_converted_errors{'docbook'}->{'image_extension'} = '* W l1|@image file `f---ile\' not found, using `f---ile.jpg\'
 warning: @image file `f---ile\' not found, using `f---ile.jpg\'

';


$result_converted{'latex_text'}->{'image_extension'} = '\\begin{document}
\\includegraphics{f---ile}
';

$result_converted_errors{'latex_text'}->{'image_extension'} = '* W l1|@image file `f---ile\' (for LaTeX) not found
 warning: @image file `f---ile\' (for LaTeX) not found

';


$result_converted{'info'}->{'image_extension'} = Encode::encode('utf-8', 'This is , produced from .

[f---ile]

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'image_extension'} = '* W |document without nodes
 warning: document without nodes

* W l1|could not find @image file `f---ile.txt\' nor alternate text
 warning: could not find @image file `f---ile.txt\' nor alternate text

';

1;
