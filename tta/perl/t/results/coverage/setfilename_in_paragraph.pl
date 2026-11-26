use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'setfilename_in_paragraph'} = '*document_root C1
 *before_node_section C2
  *before_beginning C1
   *paragraph C1
    {normal_text:Some text\\n}
  *preamble C1
   *normal_command@setfilename C1 l2
   |text_arg:{setfilename_in_paragraph.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:setfilename_in_paragraph.info}
     {spaces_after_argument:\\n}
';


$result_texis{'setfilename_in_paragraph'} = 'Some text
@setfilename setfilename_in_paragraph.info
';


$result_texts{'setfilename_in_paragraph'} = '';

$result_errors{'setfilename_in_paragraph'} = '';

$result_nodes_list{'setfilename_in_paragraph'} = '';

$result_sections_list{'setfilename_in_paragraph'} = '';

$result_sectioning_root{'setfilename_in_paragraph'} = '';

$result_headings_list{'setfilename_in_paragraph'} = '';


$result_converted{'plaintext'}->{'setfilename_in_paragraph'} = '';


$result_converted{'html_text'}->{'setfilename_in_paragraph'} = '';


$result_converted{'xml'}->{'setfilename_in_paragraph'} = '<preamblebeforebeginning><para>Some text
</para></preamblebeforebeginning><setfilename file="setfilename_in_paragraph.info"> setfilename_in_paragraph.info</setfilename>
';


$result_converted{'latex_text'}->{'setfilename_in_paragraph'} = '\\begin{document}
';


$result_converted{'docbook'}->{'setfilename_in_paragraph'} = '';

1;
