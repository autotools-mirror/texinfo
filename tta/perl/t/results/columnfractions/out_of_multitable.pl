use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'out_of_multitable'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *@columnfractions C1 l1
   |EXTRA
   |misc_args:A{0.6|0.4}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:0.6 0.4 aaa}
';


$result_texis{'out_of_multitable'} = '@columnfractions 0.6 0.4 aaa';


$result_texts{'out_of_multitable'} = '';

$result_errors{'out_of_multitable'} = '* E l1|column fraction not a number: aaa
 column fraction not a number: aaa

* E l1|@columnfractions only meaningful on a @multitable line
 @columnfractions only meaningful on a @multitable line

';

$result_nodes_list{'out_of_multitable'} = '';

$result_sections_list{'out_of_multitable'} = '';

$result_sectioning_root{'out_of_multitable'} = '';

$result_headings_list{'out_of_multitable'} = '';


$result_converted{'html_text'}->{'out_of_multitable'} = '';


$result_converted{'xml'}->{'out_of_multitable'} = '<columnfractions line=" 0.6 0.4 aaa"><columnfraction value="0.6"></columnfraction><columnfraction value="0.4"></columnfraction></columnfractions>';


$result_converted{'latex_text'}->{'out_of_multitable'} = '\\begin{document}
';

1;
