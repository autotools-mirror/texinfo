use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'verb_in_xref'} = '*document_root C1
 *before_node_section C5
  *preamble_before_content
  *@anchor C1 l1
  |EXTRA
  |identifier:{point}
  |is_target:{1}
   *brace_arg C1
    {normal_text:point}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C2 l3
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{point}
     {normal_text:point}
    *brace_arg C2
     {spaces_before_argument: }
     *@verb C1 l3
      *brace_container C6
       {verb_delimiter:*}
       {raw:with\\n}
       {raw:verb\\n}
       {raw:\\n}
       {raw:ggg }
       {verb_delimiter:*}
   {normal_text:.\\n}
';


$result_texis{'verb_in_xref'} = '@anchor{point}

@xref{point, @verb{*with
verb

ggg *}}.
';


$result_texts{'verb_in_xref'} = '
point.
';

$result_errors{'verb_in_xref'} = '* W l3|@verb should not appear anywhere inside @xref
 warning: @verb should not appear anywhere inside @xref

';

$result_nodes_list{'verb_in_xref'} = '';

$result_sections_list{'verb_in_xref'} = '';

$result_sectioning_root{'verb_in_xref'} = '';

$result_headings_list{'verb_in_xref'} = '';


$result_converted{'plaintext'}->{'verb_in_xref'} = 'See with
verb

ggg : point.
';


$result_converted{'html_text'}->{'verb_in_xref'} = '<a class="anchor" id="point"></a>
<p>See <a class="xref" href="#point"><code class="verb">with<br>verb<br><br>ggg&nbsp;</code></a>.
</p>';


$result_converted{'latex_text'}->{'verb_in_xref'} = '\\begin{document}
\\label{anchor:point}%

See \\hyperref[anchor:point]{[point], page~\\pageref*{anchor:point}}.
';


$result_converted{'docbook'}->{'verb_in_xref'} = '<anchor id="point"/>
<para>See <link linkend="point"><literal>with
verb

ggg </literal></link>.
</para>';

1;
