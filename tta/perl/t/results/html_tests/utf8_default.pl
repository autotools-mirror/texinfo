use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'utf8_default'} = '*document_root C1
 *before_node_section C3
  *@documentencoding C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |input_encoding_name:{utf-8}
  |text_arg:{utf-8}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {utf-8}
  {empty_line:\\n}
  *paragraph C3
   {AA }
   *@^ C1 l3
    *following_arg C1
     {e}
   { --- -- \'` \'\' ``}
';


$result_texis{'utf8_default'} = '@documentencoding utf-8

AA @^e --- -- \'` \'\' ``';


$result_texts{'utf8_default'} = '
AA e^ -- - \'` " "';

$result_errors{'utf8_default'} = '';

$result_nodes_list{'utf8_default'} = '';

$result_sections_list{'utf8_default'} = '';

$result_sectioning_root{'utf8_default'} = '';

$result_headings_list{'utf8_default'} = '';


$result_converted{'html_text'}->{'utf8_default'} = '
<p>AA &ecirc; &mdash; &ndash; &rsquo;&lsquo; &rdquo; &ldquo;</p>';

1;
