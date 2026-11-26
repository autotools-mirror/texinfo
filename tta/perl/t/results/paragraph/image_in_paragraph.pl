use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'image_in_paragraph'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C3
   {normal_text:Para. }
   *normal_command@image C5 l1
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:aa}
    *brace_arg C1
     {normal_text:bb}
    *brace_arg C1
     {normal_text:cc}
    *brace_arg C1
     {normal_text:dd}
    *brace_arg C1
     {normal_text:.ee}
   {normal_text:. After image.\\n}
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

$result_converted_errors{'html_text'}->{'image_in_paragraph'} = '* W l1|@image file `aa\' (for HTML) not found, using `aa.ee\'
 warning: @image file `aa\' (for HTML) not found, using `aa.ee\'

';

1;
