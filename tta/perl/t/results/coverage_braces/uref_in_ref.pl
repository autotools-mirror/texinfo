use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'uref_in_ref'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C2
   *@ref C5 l1
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     {(file)node}
    *brace_arg C3
     {spaces_before_argument: }
     {cross ref with uref }
     *@uref C2 l1
      *brace_arg C1
       {href://http/myhost.com/index.html}
      *brace_arg C1
       {uref1}
    *brace_arg C3
     {spaces_before_argument: }
     {title with uref2 }
     *@uref C2 l1
      *brace_arg C1
       {href://http/myhost.com/index2.html}
      *brace_arg C1
       {uref2}
    *brace_arg C3
     {spaces_before_argument: }
     {info file with uref3 }
     *@uref C2 l1
      *brace_arg C1
       {href://http/myhost.com/index3.html}
      *brace_arg C1
       {uref3}
    *brace_arg C3
     {spaces_before_argument: }
     {printed manual with uref4 }
     *@uref C2 l1
      *brace_arg C1
       {href://http/myhost.com/index4.html}
      *brace_arg C1
       {uref4}
   {\\n}
';


$result_texis{'uref_in_ref'} = '@ref{(file)node, cross ref with uref @uref{href://http/myhost.com/index.html,uref1}, title with uref2 @uref{href://http/myhost.com/index2.html,uref2}, info file with uref3 @uref{href://http/myhost.com/index3.html,uref3}, printed manual with uref4 @uref{href://http/myhost.com/index4.html,uref4}}
';


$result_texts{'uref_in_ref'} = '(file)node
';

$result_errors{'uref_in_ref'} = '';

$result_nodes_list{'uref_in_ref'} = '';

$result_sections_list{'uref_in_ref'} = '';

$result_sectioning_root{'uref_in_ref'} = '';

$result_headings_list{'uref_in_ref'} = '';


$result_converted{'plaintext'}->{'uref_in_ref'} = 'cross ref with uref uref1 (href://http/myhost.com/index.html): (info
file with uref3 uref3 (href://http/myhost.com/index3.html))(file)node
';


$result_converted{'html_text'}->{'uref_in_ref'} = '<p><a data-manual="info file with uref3 href://http/myhost.com/index3.html (uref3)" href="index3.html%20%28uref3%29.html#g_t_0028file_0029node">title with uref2 <a class="uref" href="href://http/myhost.com/index2.html">uref2</a></a> in <cite class="cite">printed manual with uref4 <a class="uref" href="href://http/myhost.com/index4.html">uref4</a></cite>
</p>';


$result_converted{'latex_text'}->{'uref_in_ref'} = '\\begin{document}
Section ``title with uref2 \\href{href://http/myhost.com/index2.html}{uref2 (\\nolinkurl{href://http/myhost.com/index2.html})}\'\' in \\textsl{printed manual with uref4 \\href{href://http/myhost.com/index4.html}{uref4 (\\nolinkurl{href://http/myhost.com/index4.html})}}
';


$result_converted{'docbook'}->{'uref_in_ref'} = '<para>section &#8220;title with uref2 <ulink url="href://http/myhost.com/index2.html">uref2</ulink>&#8221; in <citetitle>printed manual with uref4 <ulink url="href://http/myhost.com/index4.html">uref4</ulink></citetitle>
</para>';

1;
