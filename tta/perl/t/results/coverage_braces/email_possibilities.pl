use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'email_possibilities'} = '*document_root C1
 *before_node_section C1
  *paragraph C6
   *@email C2 l1
    *brace_arg C1
     {--a}
    *brace_arg C1
     {--b}
   {\\n}
   *@email C2 l2
    *brace_arg
    *brace_arg C1
     {--b}
   {\\n}
   *@email C1 l3
    *brace_arg C1
     {--a}
   {\\n}
';


$result_texis{'email_possibilities'} = '@email{--a,--b}
@email{,--b}
@email{--a}
';


$result_texts{'email_possibilities'} = '-b
-b
--a
';

$result_errors{'email_possibilities'} = '';

$result_nodes_list{'email_possibilities'} = '';

$result_sections_list{'email_possibilities'} = '';

$result_sectioning_root{'email_possibilities'} = '';

$result_headings_list{'email_possibilities'} = '';


$result_converted{'plaintext'}->{'email_possibilities'} = '-b <--a> -b <--a>
';


$result_converted{'html_text'}->{'email_possibilities'} = '<p><a class="email" href="mailto:--a">&ndash;b</a>
&ndash;b
<a class="email" href="mailto:--a">--a</a>
</p>';


$result_converted{'latex_text'}->{'email_possibilities'} = '\\href{mailto:--a}{--b}
--b
\\href{mailto:--a}{\\nolinkurl{--a}}
';


$result_converted{'docbook'}->{'email_possibilities'} = '<para><ulink url="mailto:--a">&#8211;b</ulink>
&#8211;b
<email>--a</email>
</para>';

1;
