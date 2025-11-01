use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'heading_in_footnote'} = '*document_root C1
 *before_node_section C1
  *paragraph C3
   {T}
   *@footnote C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:\\n}
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C4
     *paragraph C1
      {AAA\\n}
     *@heading C1 l3
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |global_command_number:{1}
     |heading_number:{1}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {H1}
     *index_entry_command@cindex C1 l4
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |index_entry:I{cp,1}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {ind e}
     *paragraph C1
      {BBB\\n}
   {\\n}
';


$result_texis{'heading_in_footnote'} = 'T@footnote{
AAA
@heading H1
@cindex ind e
BBB
}
';


$result_texts{'heading_in_footnote'} = 'T
';

$result_errors{'heading_in_footnote'} = '* W l4|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'heading_in_footnote'} = '';

$result_sections_list{'heading_in_footnote'} = '';

$result_sectioning_root{'heading_in_footnote'} = '';

$result_headings_list{'heading_in_footnote'} = '1|H1
';

$result_indices_sort_strings{'heading_in_footnote'} = 'cp:
 ind e
';


$result_converted{'plaintext'}->{'heading_in_footnote'} = 'T(1)

   ---------- Footnotes ----------

   (1) AAA

H1
==

BBB

';


$result_converted{'html_text'}->{'heading_in_footnote'} = '<p>T<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>
</p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>AAA
</p><h3 class="heading" id="H1"><span>H1<a class="copiable-link" href="#H1"> &para;</a></span></h3>
<a class="index-entry-id" id="index-ind-e"></a>
<p>BBB
</p>
</div>
';


$result_converted{'latex_text'}->{'heading_in_footnote'} = 'T\\footnote{AAA
\\section*{{H1}}
\\index[cp]{ind e@ind e}%
BBB
}
';


$result_converted{'docbook'}->{'heading_in_footnote'} = '<para>T<footnote><para>AAA
</para><bridgehead renderas="sect1">H1</bridgehead>
<indexterm role="cp"><primary>ind e</primary></indexterm>
<para>BBB
</para></footnote>
</para>';

1;
