use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'unknown_accents'} = '*document_root C1
 *before_node_section C11
  *paragraph C8
   *@" C1 l1
    *following_arg C1
     {X}
   { }
   *@" C1 l1
    *following_arg C1
     {x}
   { }
   *@" C1 l1
    *following_arg C1
     {Q}
   { }
   *@" C1 l1
    *following_arg C1
     {Y}
   {\\n}
  {empty_line:\\n}
  *paragraph C12
   *@\' C1 l3
    *following_arg C1
     {z}
   { }
   *@\' C1 l3
    *following_arg C1
     {q}
   { }
   *@\' C1 l3
    *following_arg C1
     {r}
   {\\n}
   *@\' C1 l4
    *following_arg C1
     {Z}
   { }
   *@\' C1 l4
    *following_arg C1
     {Q}
   { }
   *@\' C1 l4
    *following_arg C1
     {R}
   {\\n}
  {empty_line:\\n}
  *paragraph C4
   *@, C1 l6
    *brace_container C1
     {H}
   { }
   *@, C1 l6
    *brace_container C1
     {h}
   {\\n}
  {empty_line:\\n}
  *paragraph C16
   *@^ C1 l8
    *following_arg C1
     {z}
   { }
   *@^ C1 l8
    *following_arg C1
     {r}
   { }
   *@^ C1 l8
    *following_arg C1
     {t}
   { }
   *@^ C1 l8
    *following_arg C1
     {k}
   {\\n}
   *@^ C1 l9
    *following_arg C1
     {Z}
   { }
   *@^ C1 l9
    *following_arg C1
     {R}
   { }
   *@^ C1 l9
    *following_arg C1
     {T}
   { }
   *@^ C1 l9
    *following_arg C1
     {K}
   {\\n}
  {empty_line:\\n}
  *paragraph C6
   *@` C1 l11
    *following_arg C1
     {z}
   { }
   *@` C1 l11
    *following_arg C1
     {m}
   { }
   *@` C1 l11
    *following_arg C1
     {p}
   {\\n}
  {empty_line:\\n}
  *paragraph C4
   *@~ C1 l13
    *following_arg C1
     {Z}
   { }
   *@~ C1 l13
    *following_arg C1
     {s}
   {\\n}
';


$result_texis{'unknown_accents'} = '@"X @"x @"Q @"Y

@\'z @\'q @\'r
@\'Z @\'Q @\'R

@,{H} @,{h}

@^z @^r @^t @^k
@^Z @^R @^T @^K

@`z @`m @`p

@~Z @~s
';


$result_texts{'unknown_accents'} = 'X" x" Q" Y"

z\' q\' r\'
Z\' Q\' R\'

H, h,

z^ r^ t^ k^
Z^ R^ T^ K^

z` m` p`

Z~ s~
';

$result_errors{'unknown_accents'} = '';

$result_nodes_list{'unknown_accents'} = '';

$result_sections_list{'unknown_accents'} = '';

$result_sectioning_root{'unknown_accents'} = '';

$result_headings_list{'unknown_accents'} = '';


$result_converted{'plaintext'}->{'unknown_accents'} = 'Ẍ ẍ Q̈ Ÿ

   ź q́ ŕ Ź Q́ Ŕ

   Ḩ ḩ

   ẑ r̂ t̂ k̂ Ẑ R̂ T̂ K̂

   z̀ m̀ p̀

   Z̃ s̃
';


$result_converted{'html_text'}->{'unknown_accents'} = '<p>&#7820; &#7821; Q&#776; &#376;
</p>
<p>&#378; q&#769; &#341;
&#377; Q&#769; &#340;
</p>
<p>&#7720; &#7721;
</p>
<p>&#7825; r&#770; t&#770; k&#770;
&#7824; R&#770; T&#770; K&#770;
</p>
<p>z&#768; m&#768; p&#768;
</p>
<p>Z&#771; s&#771;
</p>';


$result_converted{'xml'}->{'unknown_accents'} = '<para><accent type="uml" bracketed="off">X</accent> <accent type="uml" bracketed="off">x</accent> <accent type="uml" bracketed="off">Q</accent> <accent type="uml" bracketed="off">Y</accent>
</para>
<para><accent type="acute" bracketed="off">z</accent> <accent type="acute" bracketed="off">q</accent> <accent type="acute" bracketed="off">r</accent>
<accent type="acute" bracketed="off">Z</accent> <accent type="acute" bracketed="off">Q</accent> <accent type="acute" bracketed="off">R</accent>
</para>
<para><accent type="cedil">H</accent> <accent type="cedil">h</accent>
</para>
<para><accent type="circ" bracketed="off">z</accent> <accent type="circ" bracketed="off">r</accent> <accent type="circ" bracketed="off">t</accent> <accent type="circ" bracketed="off">k</accent>
<accent type="circ" bracketed="off">Z</accent> <accent type="circ" bracketed="off">R</accent> <accent type="circ" bracketed="off">T</accent> <accent type="circ" bracketed="off">K</accent>
</para>
<para><accent type="grave" bracketed="off">z</accent> <accent type="grave" bracketed="off">m</accent> <accent type="grave" bracketed="off">p</accent>
</para>
<para><accent type="tilde" bracketed="off">Z</accent> <accent type="tilde" bracketed="off">s</accent>
</para>';


$result_converted{'latex_text'}->{'unknown_accents'} = '\\"{X} \\"{x} \\"{Q} \\"{Y}

\\\'{z} \\\'{q} \\\'{r}
\\\'{Z} \\\'{Q} \\\'{R}

\\c{H} \\c{h}

\\^{z} \\^{r} \\^{t} \\^{k}
\\^{Z} \\^{R} \\^{T} \\^{K}

\\`{z} \\`{m} \\`{p}

\\~{Z} \\~{s}
';


$result_converted{'docbook'}->{'unknown_accents'} = '<para>&#7820; &#7821; Q&#776; &#376;
</para>
<para>&#378; q&#769; &#341;
&#377; Q&#769; &#340;
</para>
<para>&#7720; &#7721;
</para>
<para>&#7825; r&#770; t&#770; k&#770;
&#7824; R&#770; T&#770; K&#770;
</para>
<para>z&#768; m&#768; p&#768;
</para>
<para>Z&#771; s&#771;
</para>';

1;
