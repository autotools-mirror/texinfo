use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'image_in_paragraph'} = '*document_root C1
 *before_node_section C1
  *paragraph C3
   {Para. }
   *@image C5 l1
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {aa}
    *brace_arg C1
     {bb}
    *brace_arg C1
     {cc}
    *brace_arg C1
     {dd}
    *brace_arg C1
     {.ee}
   {. After image.\\n}
';


$result_texis{'image_in_paragraph'} = 'Para. @image{aa,bb,cc,dd,.ee}. After image.
';


$result_texts{'image_in_paragraph'} = 'Para. aa. After image.
';

$result_errors{'image_in_paragraph'} = '';

$result_nodes_list{'image_in_paragraph'} = '';

$result_sections_list{'image_in_paragraph'} = '';

$result_sectioning_root{'image_in_paragraph'} = '';

$result_headings_list{'image_in_paragraph'} = '';


$result_converted{'plaintext'}->{'image_in_paragraph'} = 'Para.  Text for image out of paragraph..  After image.
';


$result_converted{'html_text'}->{'image_in_paragraph'} = '<p>Para. <img class="image" src="aa.ee" alt="dd">. After image.
</p>';

$result_converted_errors{'html_text'}->{'image_in_paragraph'} = [
  {
    'error_line' => 'warning: @image file `aa\' (for HTML) not found, using `aa.ee\'
',
    'line_nr' => 1,
    'text' => '@image file `aa\' (for HTML) not found, using `aa.ee\'',
    'type' => 'warning'
  }
];


1;
