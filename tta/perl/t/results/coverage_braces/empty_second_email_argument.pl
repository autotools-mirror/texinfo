use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_second_email_argument'} = '*document_root C1
 *before_node_section C1
  *paragraph C1
   *@email C2 l1
    *brace_arg C3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {a}
     *@@
     {b.c}
    *brace_arg
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
';


$result_texis{'empty_second_email_argument'} = '@email{ a@@b.c, }';


$result_texts{'empty_second_email_argument'} = 'a@b.c';

$result_errors{'empty_second_email_argument'} = '';

$result_nodes_list{'empty_second_email_argument'} = '';

$result_sections_list{'empty_second_email_argument'} = '';

$result_sectioning_root{'empty_second_email_argument'} = '';

$result_headings_list{'empty_second_email_argument'} = '';


$result_converted{'plaintext'}->{'empty_second_email_argument'} = '<a@b.c>
';


$result_converted{'html_text'}->{'empty_second_email_argument'} = '<p><a class="email" href="mailto:a@b.c">a@b.c</a></p>';


$result_converted{'latex_text'}->{'empty_second_email_argument'} = '\\href{mailto:a@b.c}{\\nolinkurl{a@b.c}}';


$result_converted{'docbook'}->{'empty_second_email_argument'} = '<para><email>a@b.c</email></para>';

1;
