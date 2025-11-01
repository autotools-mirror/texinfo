use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'image_extension'} = '*document_root C1
 *before_node_section C2
  *@image C5 l1
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {f---ile}
   *brace_arg
   *brace_arg
   *brace_arg
   *brace_arg C1
    {.gr--a}
  {\\n}
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

$result_converted_errors{'plaintext'}->{'image_extension'} = [
  {
    'error_line' => 'warning: could not find @image file `f---ile.txt\' nor alternate text
',
    'line_nr' => 1,
    'text' => 'could not find @image file `f---ile.txt\' nor alternate text',
    'type' => 'warning'
  }
];



$result_converted{'html_text'}->{'image_extension'} = '<img class="image" src="f---ile.gr--a" alt="f---ile">
';

$result_converted_errors{'html_text'}->{'image_extension'} = [
  {
    'error_line' => 'warning: @image file `f---ile\' (for HTML) not found, using `f---ile.gr--a\'
',
    'line_nr' => 1,
    'text' => '@image file `f---ile\' (for HTML) not found, using `f---ile.gr--a\'',
    'type' => 'warning'
  }
];



$result_converted{'xml'}->{'image_extension'} = '<image><imagefile>f---ile</imagefile><imageextension>.gr--a</imageextension></image>
';


$result_converted{'docbook'}->{'image_extension'} = '<informalfigure><mediaobject><imageobject><imagedata fileref="f---ile.jpg" format="JPG"></imagedata></imageobject></mediaobject></informalfigure>
';

$result_converted_errors{'docbook'}->{'image_extension'} = [
  {
    'error_line' => 'warning: @image file `f---ile\' not found, using `f---ile.jpg\'
',
    'line_nr' => 1,
    'text' => '@image file `f---ile\' not found, using `f---ile.jpg\'',
    'type' => 'warning'
  }
];



$result_converted{'latex_text'}->{'image_extension'} = '\\includegraphics{f---ile}
';

$result_converted_errors{'latex_text'}->{'image_extension'} = [
  {
    'error_line' => 'warning: @image file `f---ile\' (for LaTeX) not found
',
    'line_nr' => 1,
    'text' => '@image file `f---ile\' (for LaTeX) not found',
    'type' => 'warning'
  }
];



$result_converted{'info'}->{'image_extension'} = 'This is , produced from .

[f---ile]

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'image_extension'} = [
  {
    'error_line' => 'warning: document without nodes
',
    'text' => 'document without nodes',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: could not find @image file `f---ile.txt\' nor alternate text
',
    'line_nr' => 1,
    'text' => 'could not find @image file `f---ile.txt\' nor alternate text',
    'type' => 'warning'
  }
];


1;
