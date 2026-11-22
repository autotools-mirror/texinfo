use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_errormsg'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C5
   {normal_text:Some text\\n}
   *normal_command@errormsg C1 l2
    *brace_arg C4
     {normal_text:Text }
     *normal_command@~ C1 l2
      *following_arg C1
       {normal_text:e}
     {normal_text: }
     *normal_command@code C1 l2
      *brace_container C1
       {normal_text:code}
   {normal_text:\\n}
   *normal_command@errormsg C1 l3
    *brace_arg C3
     {spaces_before_argument:  }
     {normal_text:with surrounding spaces}
     {spaces_after_argument:   }
   {normal_text:\\n}
';


$result_texis{'test_errormsg'} = 'Some text
@errormsg{Text @~e @code{code}}
@errormsg{  with surrounding spaces   }
';


$result_texts{'test_errormsg'} = 'Some text


';

$result_errors{'test_errormsg'} = '* E l2|Text 
 Text 

* E l3|with surrounding spaces
 with surrounding spaces

';

$result_nodes_list{'test_errormsg'} = '';

$result_sections_list{'test_errormsg'} = '';

$result_sectioning_root{'test_errormsg'} = '';

$result_headings_list{'test_errormsg'} = '';


$result_converted{'plaintext'}->{'test_errormsg'} = 'Some text
';


$result_converted{'html_text'}->{'test_errormsg'} = '<p>Some text


</p>';


$result_converted{'xml'}->{'test_errormsg'} = '<para>Some text
<errormsg>Text <accent type="tilde" bracketed="off">e</accent> <code>code</code></errormsg>
<errormsg>  with surrounding spaces   </errormsg>
</para>';


$result_converted{'latex_text'}->{'test_errormsg'} = '\\begin{document}
Some text


';


$result_converted{'docbook'}->{'test_errormsg'} = '<para>Some text


</para>';

1;
