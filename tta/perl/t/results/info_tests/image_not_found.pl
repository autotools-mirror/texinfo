use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'image_not_found'} = '*document_root C2
 *before_node_section
 *@node C3 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  *@image C1 l2
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {n_f_image}
  {\\n}
';


$result_texis{'image_not_found'} = '@node Top
@image{n_f_image}
';


$result_texts{'image_not_found'} = 'n_f_image
';

$result_errors{'image_not_found'} = '';

$result_nodes_list{'image_not_found'} = '1|Top
';

$result_sections_list{'image_not_found'} = '';

$result_sectioning_root{'image_not_found'} = '';

$result_headings_list{'image_not_found'} = '';


$result_converted{'info'}->{'image_not_found'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

[n_f_image]


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'image_not_found'} = '* W l2|could not find @image file `n_f_image.txt\' nor alternate text
 warning: could not find @image file `n_f_image.txt\' nor alternate text

';

1;
