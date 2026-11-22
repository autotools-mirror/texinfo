use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_w'} = '*document_root C1
 *before_node_section C33
  *preamble_before_content
  *paragraph C2
   *normal_command@w C1 l1
    *brace_container C2
     {normal_text:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbb bbbbb bbb b b b b b b b b b bb .\\n}
     {normal_text:ccc dddd}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:a a a a a a a a a a a a a a a a a a a a a a a a a a a a  }
   *normal_command@w C1 l4
    *brace_container C1
     {normal_text:b a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a}
   {normal_text:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@w C1 l7
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@w C1 l9
    *brace_container C2
     {normal_text: a rr   \\n}
     {normal_text:  ggg.}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:AA}
   *normal_command@w C1 l12
    *brace_container
   {normal_text:bbb.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:FF}
   *normal_command@w C1 l14
    *brace_container C1
     {normal_text:d}
   {normal_text:nnn.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:aa}
   *normal_command@w C1 l16
    *brace_container C1
     {normal_text:  f  f}
   {normal_text:ggg.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:aa2}
   *normal_command@w C1 l18
    *brace_container C1
     {normal_text:  f  f }
   {normal_text:ggg2.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:aa3 }
   *normal_command@w C1 l21
    *brace_container C1
     {normal_text:  f  f }
   {normal_text:ggg3.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:aa4 }
   *normal_command@w C1 l24
    *brace_container C1
     {normal_text:  f  f }
   {normal_text: ggg4.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:aa5 }
   *normal_command@w C1 l26
    *brace_container
   {normal_text: ggg5.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:aa6 }
   *normal_command@w C1 l28
    *brace_container
   {normal_text:ggg6.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:aa6}
   *normal_command@w C1 l30
    *brace_container
   {normal_text: ggg6.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:aaf }
   *normal_command@w C1 l32
    *brace_container C1
     {normal_text: }
   {normal_text: bbb.\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:begin and end quotations: }
   *normal_command@w C1 l34
    *brace_container C1
     *normal_command@t C1 l34
      *brace_container C7
       {normal_text:`}
       *normal_command@w C1 l34
        *brace_container
       {normal_text:`}
       *normal_command@dots C1 l34
        *brace_container
       {normal_text:\'}
       *normal_command@w C1 l34
        *brace_container
       {normal_text:\'}
   {normal_text:.  This\\n}
   {normal_text:convention should be followed in Texinfo files.  TeX converts\\n}
   {normal_text:two single quotes to left- and right-hand doubled.\\n}
';


$result_texis{'test_w'} = '@w{aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbb bbbbb bbb b b b b b b b b b bb .
ccc dddd}.

a a a a a a a a a a a a a a a a a a a a a a a a a a a a  @w{b a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a}


@w{}

@w{ a rr   
  ggg.}

AA@w{}bbb.

FF@w{d}nnn.

aa@w{  f  f}ggg.

aa2@w{  f  f }ggg2.


aa3 @w{  f  f }ggg3.


aa4 @w{  f  f } ggg4.

aa5 @w{} ggg5.

aa6 @w{}ggg6.

aa6@w{} ggg6.

aaf @w{ } bbb.

begin and end quotations: @w{@t{`@w{}`@dots{}\'@w{}\'}}.  This
convention should be followed in Texinfo files.  TeX converts
two single quotes to left- and right-hand doubled.
';


$result_texts{'test_w'} = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbb bbbbb bbb b b b b b b b b b bb .
ccc dddd.

a a a a a a a a a a a a a a a a a a a a a a a a a a a a  b a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a




 a rr   
  ggg.

AAbbb.

FFdnnn.

aa  f  fggg.

aa2  f  f ggg2.


aa3   f  f ggg3.


aa4   f  f  ggg4.

aa5  ggg5.

aa6 ggg6.

aa6 ggg6.

aaf   bbb.

begin and end quotations: ``...\'\'.  This
convention should be followed in Texinfo files.  TeX converts
two single quotes to left- and right-hand doubled.
';

$result_errors{'test_w'} = '';

$result_nodes_list{'test_w'} = '';

$result_sections_list{'test_w'} = '';

$result_sectioning_root{'test_w'} = '';

$result_headings_list{'test_w'} = '';


$result_converted{'plaintext'}->{'test_w'} = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbb bbbbb bbb b b b b b b b b b bb .  ccc dddd.

   a a a a a a a a a a a a a a a a a a a a a a a a a a a a
b a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a

   

    a rr ggg.

   AAbbb.

   FFdnnn.

   aa f fggg.

   aa2 f f ggg2.

   aa3  f f ggg3.

   aa4  f f  ggg4.

   aa5  ggg5.

   aa6 ggg6.

   aa6 ggg6.

   aaf   bbb.

   begin and end quotations: ``...\'\'.  This convention should be
followed in Texinfo files.  TeX converts two single quotes to left- and
right-hand doubled.
';


$result_converted{'html_text'}->{'test_w'} = '<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&nbsp;bbbbbbbbbbbbb&nbsp;bbbbb&nbsp;bbb&nbsp;b&nbsp;b&nbsp;b&nbsp;b&nbsp;b&nbsp;b&nbsp;b&nbsp;b&nbsp;b&nbsp;bb&nbsp;.&nbsp;ccc&nbsp;dddd<!-- /@w -->.
</p>
<p>a a a a a a a a a a a a a a a a a a a a a a a a a a a a  b&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a&nbsp;a<!-- /@w -->
</p>

<p><!-- /@w -->
</p>
<p>&nbsp;a&nbsp;rr&nbsp;&nbsp;ggg.<!-- /@w -->
</p>
<p>AA<!-- /@w -->bbb.
</p>
<p>FFd<!-- /@w -->nnn.
</p>
<p>aa&nbsp;f&nbsp;f<!-- /@w -->ggg.
</p>
<p>aa2&nbsp;f&nbsp;f&nbsp;<!-- /@w -->ggg2.
</p>

<p>aa3 &nbsp;f&nbsp;f&nbsp;<!-- /@w -->ggg3.
</p>

<p>aa4 &nbsp;f&nbsp;f&nbsp;<!-- /@w --> ggg4.
</p>
<p>aa5 <!-- /@w --> ggg5.
</p>
<p>aa6 <!-- /@w -->ggg6.
</p>
<p>aa6<!-- /@w --> ggg6.
</p>
<p>aaf &nbsp;<!-- /@w --> bbb.
</p>
<p>begin and end quotations: <code class="t">`<!-- /@w -->`&hellip;\'<!-- /@w -->\'</code><!-- /@w -->.  This
convention should be followed in Texinfo files.  TeX converts
two single quotes to left- and right-hand doubled.
</p>';


$result_converted{'latex_text'}->{'test_w'} = '\\begin{document}
\\hbox{aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbb bbbbb bbb b b b b b b b b b bb .
ccc dddd}.

a a a a a a a a a a a a a a a a a a a a a a a a a a a a  \\hbox{b a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a a}


\\hbox{}

\\hbox{ a rr   
  ggg.}

AA\\hbox{}bbb.

FF\\hbox{d}nnn.

aa\\hbox{  f  f}ggg.

aa2\\hbox{  f  f }ggg2.


aa3 \\hbox{  f  f }ggg3.


aa4 \\hbox{  f  f } ggg4.

aa5 \\hbox{} ggg5.

aa6 \\hbox{}ggg6.

aa6\\hbox{} ggg6.

aaf \\hbox{ } bbb.

begin and end quotations: \\hbox{\\texttt{`\\hbox{}`\\dots{}\\@\'\\hbox{}\'}}.  This
convention should be followed in Texinfo files.  TeX converts
two single quotes to left- and right-hand doubled.
';


$result_converted{'docbook'}->{'test_w'} = '<para>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa&amp;#160;bbbbbbbbbbbbb&amp;#160;bbbbb&amp;#160;bbb&amp;#160;b&amp;#160;b&amp;#160;b&amp;#160;b&amp;#160;b&amp;#160;b&amp;#160;b&amp;#160;b&amp;#160;b&amp;#160;bb&amp;#160;.&amp;#160;ccc&amp;#160;dddd<!-- /@w -->.
</para>
<para>a a a a a a a a a a a a a a a a a a a a a a a a a a a a  b&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a&amp;#160;a<!-- /@w -->
</para>

<para><!-- /@w -->
</para>
<para>&amp;#160;a&amp;#160;rr&amp;#160;&amp;#160;ggg.<!-- /@w -->
</para>
<para>AA<!-- /@w -->bbb.
</para>
<para>FFd<!-- /@w -->nnn.
</para>
<para>aa&amp;#160;f&amp;#160;f<!-- /@w -->ggg.
</para>
<para>aa2&amp;#160;f&amp;#160;f&amp;#160;<!-- /@w -->ggg2.
</para>

<para>aa3 &amp;#160;f&amp;#160;f&amp;#160;<!-- /@w -->ggg3.
</para>

<para>aa4 &amp;#160;f&amp;#160;f&amp;#160;<!-- /@w --> ggg4.
</para>
<para>aa5 <!-- /@w --> ggg5.
</para>
<para>aa6 <!-- /@w -->ggg6.
</para>
<para>aa6<!-- /@w --> ggg6.
</para>
<para>aaf &amp;#160;<!-- /@w --> bbb.
</para>
<para>begin and end quotations: <literal>`<!-- /@w -->`&#8230;\'<!-- /@w -->\'</literal><!-- /@w -->.  This
convention should be followed in Texinfo files.  TeX converts
two single quotes to left- and right-hand doubled.
</para>';

1;
