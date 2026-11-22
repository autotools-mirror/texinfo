use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_paragraph_commands'} = '*document_root C1
 *before_node_section C5
  *preamble_before_content C2
   *normal_command@*
   {normal_text:\\n}
  *normal_command@titlefont C1 l2
  |global_command_number:{1}
   *brace_container C1
    {normal_text:title font}
  {normal_text:\\n}
  *normal_command@image C5 l3
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
  {normal_text:\\n}
';


$result_texis{'no_paragraph_commands'} = '@*
@titlefont{title font}
@image{aa,bb,cc,dd,.ee}
';


$result_texts{'no_paragraph_commands'} = '

title font
aa
';

$result_errors{'no_paragraph_commands'} = '';

$result_nodes_list{'no_paragraph_commands'} = '';

$result_sections_list{'no_paragraph_commands'} = '';

$result_sectioning_root{'no_paragraph_commands'} = '';

$result_headings_list{'no_paragraph_commands'} = '';


$result_converted{'plaintext'}->{'no_paragraph_commands'} = '

title font
**********
Text for image out of paragraph.
';


$result_converted{'html_text'}->{'no_paragraph_commands'} = '<br>
<h1 class="titlefont">title font</h1>
<img class="image" src="aa.ee" alt="dd">
';

$result_converted_errors{'html_text'}->{'no_paragraph_commands'} = '* W l3|@image file `aa\' (for HTML) not found, using `aa.ee\'
 warning: @image file `aa\' (for HTML) not found, using `aa.ee\'

';

1;
