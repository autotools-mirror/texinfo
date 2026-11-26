use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_line_in_email'} = '*document_root C1
 *before_node_section C5
  *preamble
  *paragraph C1
   *normal_command@email C1 l1
    *brace_arg C2
     {spaces_before_argument: \\n}
     {spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:mail,\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:text\\n}
';


$result_texis{'empty_line_in_email'} = '@email{ 

}mail,

text
';


$result_texts{'empty_line_in_email'} = 'mail,

text
';

$result_errors{'empty_line_in_email'} = '* E l1|@email missing closing brace
 @email missing closing brace

* E l6|misplaced }
 misplaced }

';

$result_nodes_list{'empty_line_in_email'} = '';

$result_sections_list{'empty_line_in_email'} = '';

$result_sectioning_root{'empty_line_in_email'} = '';

$result_headings_list{'empty_line_in_email'} = '';


$result_converted{'plaintext'}->{'empty_line_in_email'} = '   mail,

   text
';


$result_converted{'html_text'}->{'empty_line_in_email'} = '<p>mail,
</p>
<p>text
</p>';


$result_converted{'latex_text'}->{'empty_line_in_email'} = '\\begin{document}
mail,

text
';


$result_converted{'docbook'}->{'empty_line_in_email'} = '<para></para><para>mail,
</para>
<para>text
</para>';

1;
