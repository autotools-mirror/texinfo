use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'uref_url'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C18
   *@uref C2 l1
    *brace_arg C1
     {normal_text:--a}
    *brace_arg C1
     {normal_text:--b}
   {normal_text:\\n}
   *@uref C1 l2
    *brace_arg C1
     {normal_text:--c}
   {normal_text:\\n}
   *@uref C2 l3
    *brace_arg
    *brace_arg C1
     {normal_text:--d}
   {normal_text:\\n}
   *@uref C3 l4
    *brace_arg C1
     {normal_text:--e}
    *brace_arg C1
     {normal_text:--f}
    *brace_arg C1
     {normal_text:--g}
   {normal_text:\\n}
   *@uref C3 l5
    *brace_arg
    *brace_arg C1
     {normal_text:--h}
    *brace_arg C1
     {normal_text:--i}
   {normal_text:\\n}
   *@uref C3 l6
    *brace_arg C1
     {normal_text:--j}
    *brace_arg
    *brace_arg C1
     {normal_text:--k}
   {normal_text:\\n}
   *@uref C3 l7
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:--l}
   {normal_text:\\n}
   *@url C2 l8
    *brace_arg C1
     {normal_text:--m}
    *brace_arg C1
     {normal_text:--n}
   {normal_text:\\n}
   *@url C3 l9
    *brace_arg C1
     {normal_text:--o}
    *brace_arg C1
     {normal_text:--p}
    *brace_arg C1
     {normal_text:--q}
   {normal_text:\\n}
';


$result_texis{'uref_url'} = '@uref{--a,--b}
@uref{--c}
@uref{,--d}
@uref{--e,--f,--g}
@uref{,--h,--i}
@uref{--j,,--k}
@uref{,,--l}
@url{--m,--n}
@url{--o,--p,--q}
';


$result_texts{'uref_url'} = '--a (-b)
--c
 (-d)
-g
-i
-k
-l
--m (-n)
-q
';

$result_errors{'uref_url'} = '';

$result_nodes_list{'uref_url'} = '';

$result_sections_list{'uref_url'} = '';

$result_sectioning_root{'uref_url'} = '';

$result_headings_list{'uref_url'} = '';


$result_converted{'plaintext'}->{'uref_url'} = '-b (--a) <--c> -d -g -i -k -l -n (--m) -q
';


$result_converted{'html_text'}->{'uref_url'} = '<p><a class="uref" href="--a">&ndash;b</a>
<a class="uref" href="--c">--c</a>
&ndash;d
<a class="uref" href="--e">&ndash;g</a>
&ndash;i
<a class="uref" href="--j">&ndash;k</a>
&ndash;l
<a class="url" href="--m">&ndash;n</a>
<a class="url" href="--o">&ndash;q</a>
</p>';


$result_converted{'latex_text'}->{'uref_url'} = '\\begin{document}
\\href{--a}{--b (\\nolinkurl{--a})}
\\url{--c}
--d
--g
--i
--k
--l
\\href{--m}{--n (\\nolinkurl{--m})}
--q
';


$result_converted{'docbook'}->{'uref_url'} = '<para><ulink url="--a">&#8211;b</ulink>
<ulink url="--c">--c</ulink>
<ulink url="">&#8211;d</ulink>
<ulink url="--e">&#8211;f</ulink>
<ulink url="">&#8211;h</ulink>
<ulink url="--j">&#8211;k</ulink>
<ulink url="">&#8211;l</ulink>
<ulink url="--m">&#8211;n</ulink>
<ulink url="--o">&#8211;p</ulink>
</para>';

1;
