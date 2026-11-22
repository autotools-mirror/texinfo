use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'sole_image'} = '*document_root C1
 *before_node_section C5
  *preamble_before_content
  *@image C1 l1
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:aa}
  {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:next para\\n}
';


$result_texis{'sole_image'} = '@image{aa}

next para
';


$result_texts{'sole_image'} = 'aa

next para
';

$result_errors{'sole_image'} = '';

$result_nodes_list{'sole_image'} = '';

$result_sections_list{'sole_image'} = '';

$result_sectioning_root{'sole_image'} = '';

$result_headings_list{'sole_image'} = '';


$result_converted{'plaintext'}->{'sole_image'} = 'Text for image out of paragraph.

next para
';


$result_converted{'html_text'}->{'sole_image'} = '<img class="image" src="aa.jpg" alt="aa">

<p>next para
</p>';

$result_converted_errors{'html_text'}->{'sole_image'} = '* W l1|@image file `aa\' (for HTML) not found, using `aa.jpg\'
 warning: @image file `aa\' (for HTML) not found, using `aa.jpg\'

';

1;
