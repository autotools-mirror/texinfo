use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'frenchspacing_and_code'} = '*document_root C7
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@frenchspacing C1 l2
   |global_command_number:{1}
   |misc_args:A{on}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:on}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l5 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {chapter frenchspacing}
 |identifier:{chapter-frenchspacing}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter frenchspacing}
    {spaces_after_argument:\\n}
 *normal_command@chapter C13 l8 {Chap frenchspacing}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap frenchspacing}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In text w: z? n; p. f\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@code C1 l12
    *brace_container C1
     {normal_text:a: b! gg; h}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l14
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:c: d? j\\n}
   *normal_command@end C1 l16
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypeop C3 l18
   *def_line C1 l18
   |def_command:{deftypeop}
   |element_node:{chapter-frenchspacing}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C19
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l18
       {normal_text:cat: r. a}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l18
       {normal_text:class: MyC. b}
     {spaces: }
     *def_type C1
      *bracketed_arg C1 l18
       {normal_text:type: t. c}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l18
       {normal_text:name? n. d}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:arg?}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:e:}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:f.}
     {spaces:  }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l18
        *brace_container C1
         {normal_text:v: g. h}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *normal_command@code C1 l18
        *brace_container C1
         {normal_text:code? is: k}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:deftypeop\\n}
   *normal_command@end C1 l20
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defop C3 l22
   *def_line C1 l22
   |def_command:{defop}
   |element_node:{chapter-frenchspacing}
   |index_entry:I{fn,2}
   |original_def_cmdname:{defop}
    *block_line_arg C17
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l22
       {normal_text:vcat: r. z}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l22
       {normal_text:vclass: MyC. u}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l22
       {normal_text:vname? n; d}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:varg?}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:ve:}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:f.}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l22
        *brace_container C1
         {normal_text:vv: g? b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l22
        *brace_container C1
         {normal_text:vcode? is: a}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:defop\\n}
   *normal_command@end C1 l24
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@frenchspacing C1 l26
  |global_command_number:{2}
  |misc_args:A{off}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:off}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l27 {chap no}
 |identifier:{chap-no}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap no}
    {spaces_after_argument:\\n}
 *normal_command@chapter C11 l28 {Chap no}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap no}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:In text w: z? n; p. fn \\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@code C1 l32
    *brace_container C1
     {normal_text:a: b! gg; hn}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l34
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:c: d? jn\\n}
   *normal_command@end C1 l36
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypeop C3 l38
   *def_line C1 l38
   |def_command:{deftypeop}
   |element_node:{chap-no}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C19
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l38
       {normal_text:cat: r. a}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l38
       {normal_text:class: MyC. b}
     {spaces: }
     *def_type C1
      *bracketed_arg C1 l38
       {normal_text:type: t. c}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l38
       {normal_text:name? n. d}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:narg?}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:e:}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:f.}
     {spaces:  }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l38
        *brace_container C1
         {normal_text:v: g. h}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *normal_command@code C1 l38
        *brace_container C1
         {normal_text:code? is: k}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:deftypeop n\\n}
   *normal_command@end C1 l40
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defop C3 l42
   *def_line C1 l42
   |def_command:{defop}
   |element_node:{chap-no}
   |index_entry:I{fn,4}
   |original_def_cmdname:{defop}
    *block_line_arg C17
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l42
       {normal_text:vcat: r. z}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l42
       {normal_text:nvclass: MyC. u}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l42
       {normal_text:vname? n; d}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:varg?}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:ve:}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:f.}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l42
        *brace_container C1
         {normal_text:vv: g? b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l42
        *brace_container C1
         {normal_text:vcode? is: a}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:defop n\\n}
   *normal_command@end C1 l44
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defop}
     {spaces_after_argument:\\n}
';


$result_texis{'frenchspacing_and_code'} = '
@frenchspacing on

@node Top
@top top

@node chapter frenchspacing
@chapter Chap frenchspacing

In text w: z? n; p. f

@code{a: b! gg; h}

@example
c: d? j
@end example

@deftypeop {cat: r. a} {class: MyC. b} {type: t. c} {name? n. d} arg? e: f.  @var{v: g. h} @code{code? is: k}
deftypeop
@end deftypeop

@defop {vcat: r. z} {vclass: MyC. u} {vname? n; d} varg? ve: f. @var{vv: g? b} @code{vcode? is: a}
defop
@end defop

@frenchspacing off
@node chap no
@chapter Chap no

In text w: z? n; p. fn 

@code{a: b! gg; hn}

@example
c: d? jn
@end example

@deftypeop {cat: r. a} {class: MyC. b} {type: t. c} {name? n. d} narg? e: f.  @var{v: g. h} @code{code? is: k}
deftypeop n
@end deftypeop

@defop {vcat: r. z} {nvclass: MyC. u} {vname? n; d} varg? ve: f. @var{vv: g? b} @code{vcode? is: a}
defop n
@end defop
';


$result_texts{'frenchspacing_and_code'} = '
top
***

1 Chap frenchspacing
********************

In text w: z? n; p. f

a: b! gg; h

c: d? j

cat: r. a on class: MyC. b: type: t. c name? n. d arg? e: f.  v: g. h code? is: k
deftypeop

vcat: r. z on vclass: MyC. u: vname? n; d varg? ve: f. vv: g? b vcode? is: a
defop

2 Chap no
*********

In text w: z? n; p. fn 

a: b! gg; hn

c: d? jn

cat: r. a on class: MyC. b: type: t. c name? n. d narg? e: f.  v: g. h code? is: k
deftypeop n

vcat: r. z on nvclass: MyC. u: vname? n; d varg? ve: f. vv: g? b vcode? is: a
defop n
';

$result_errors{'frenchspacing_and_code'} = '';

$result_nodes_list{'frenchspacing_and_code'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter frenchspacing
2|chapter frenchspacing
 associated_section: 1 Chap frenchspacing
 associated_title_command: 1 Chap frenchspacing
 node_directions:
  next->chap no
  prev->Top
  up->Top
3|chap no
 associated_section: 2 Chap no
 associated_title_command: 2 Chap no
 node_directions:
  prev->chapter frenchspacing
  up->Top
';

$result_sections_list{'frenchspacing_and_code'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap frenchspacing
 section_children:
  1|Chap frenchspacing
  2|Chap no
2|Chap frenchspacing
 associated_anchor_command: chapter frenchspacing
 associated_node: chapter frenchspacing
 section_directions:
  next->Chap no
  up->top
 toplevel_directions:
  next->Chap no
  prev->top
  up->top
3|Chap no
 associated_anchor_command: chap no
 associated_node: chap no
 section_directions:
  prev->Chap frenchspacing
  up->top
 toplevel_directions:
  prev->Chap frenchspacing
  up->top
';

$result_sectioning_root{'frenchspacing_and_code'} = 'level: -1
list:
 1|top
';

$result_headings_list{'frenchspacing_and_code'} = '';

$result_indices_sort_strings{'frenchspacing_and_code'} = 'fn:
 name? n. d on class: MyC. b
 name? n. d on class: MyC. b
 vname? n; d on nvclass: MyC. u
 vname? n; d on vclass: MyC. u
';


$result_converted{'plaintext'}->{'frenchspacing_and_code'} = 'top
***

1 Chap frenchspacing
********************

In text w: z? n; p. f

   ‘a: b! gg; h’

     c: d? j

 -- cat: r. a on class: MyC. b: type: t. c name? n. d arg? e: f. V: G. H
          code? is: k
     deftypeop

 -- vcat: r. z on vclass: MyC. u: vname? n; d varg? ve: f. VV: G? B
          vcode? is: a
     defop

2 Chap no
*********

In text w: z?  n; p.  fn

   ‘a: b! gg; hn’

     c: d? jn

 -- cat: r.  a on class: MyC. b: type: t. c name? n. d narg? e: f. V: G.
          H code? is: k
     deftypeop n

 -- vcat: r.  z on nvclass: MyC. u: vname? n; d varg? ve: f. VV: G? B
          vcode? is: a
     defop n
';

$result_converted_sort_strings{'plaintext'}->{'frenchspacing_and_code'} = 'fn:
 name? n. d on class: MyC. b
 name? n. d on class: MyC. b
 vname? n; d on nvclass: MyC. u
 vname? n; d on vclass: MyC. u
';


$result_converted{'html_text'}->{'frenchspacing_and_code'} = '
<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter-frenchspacing">Chap frenchspacing</a></li>
<li><a href="#chap-no">Chap no</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter-frenchspacing">
<h2 class="chapter" id="Chap-frenchspacing"><span>1 Chap frenchspacing<a class="copiable-link" href="#Chap-frenchspacing"> &para;</a></span></h2>

<p>In text w: z? n; p. f
</p>
<p><code class="code">a: b! gg; h</code>
</p>
<div class="example">
<pre class="example-preformatted">c: d? j
</pre></div>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-name_003f-n_002e-d-on-class_003a-MyC_002e-b"><span class="category-def">cat: r. a on <code class="code">class: MyC. b</code>: </span><span><code class="def-type">type: t. c</code> <strong class="def-name">name? n. d</strong> <code class="def-code-arguments">arg? e: f.  <var class="var">v: g. h</var> <code class="code">code? is: k</code></code><a class="copiable-link" href="#index-name_003f-n_002e-d-on-class_003a-MyC_002e-b"> &para;</a></span></dt>
<dd><p>deftypeop
</p></dd></dl>

<dl class="first-defop def-block">
<dt class="defop def-line" id="index-vname_003f-n_003b-d-on-vclass_003a-MyC_002e-u"><span class="category-def">vcat: r. z on <code class="code">vclass: MyC. u</code>: </span><span><strong class="def-name">vname? n; d</strong> <var class="def-var-arguments">varg? ve: f. <var class="var">vv: g? b</var> <code class="code">vcode? is: a</code></var><a class="copiable-link" href="#index-vname_003f-n_003b-d-on-vclass_003a-MyC_002e-u"> &para;</a></span></dt>
<dd><p>defop
</p></dd></dl>

<hr>
</div>
<div class="chapter-level-extent" id="chap-no">
<h2 class="chapter" id="Chap-no"><span>2 Chap no<a class="copiable-link" href="#Chap-no"> &para;</a></span></h2>

<p>In text w: z? n; p. fn 
</p>
<p><code class="code">a: b! gg; hn</code>
</p>
<div class="example">
<pre class="example-preformatted">c: d? jn
</pre></div>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-name_003f-n_002e-d-on-class_003a-MyC_002e-b-1"><span class="category-def">cat: r. a on <code class="code">class: MyC. b</code>: </span><span><code class="def-type">type: t. c</code> <strong class="def-name">name? n. d</strong> <code class="def-code-arguments">narg? e: f.  <var class="var">v: g. h</var> <code class="code">code? is: k</code></code><a class="copiable-link" href="#index-name_003f-n_002e-d-on-class_003a-MyC_002e-b-1"> &para;</a></span></dt>
<dd><p>deftypeop n
</p></dd></dl>

<dl class="first-defop def-block">
<dt class="defop def-line" id="index-vname_003f-n_003b-d-on-nvclass_003a-MyC_002e-u"><span class="category-def">vcat: r. z on <code class="code">nvclass: MyC. u</code>: </span><span><strong class="def-name">vname? n; d</strong> <var class="def-var-arguments">varg? ve: f. <var class="var">vv: g? b</var> <code class="code">vcode? is: a</code></var><a class="copiable-link" href="#index-vname_003f-n_003b-d-on-nvclass_003a-MyC_002e-u"> &para;</a></span></dt>
<dd><p>defop n
</p></dd></dl>
</div>
</div>
';


$result_converted{'xml'}->{'frenchspacing_and_code'} = '<preamblebeforebeginning>
</preamblebeforebeginning><frenchspacing value="on" line=" on"></frenchspacing>

<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter frenchspacing</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chapter-frenchspacing"><nodename> chapter frenchspacing</nodename><nodenext automatic="on"> chap no</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chap frenchspacing</sectiontitle>

<para>In text w: z? n; p. f
</para>
<para><code>a: b! gg; h</code>
</para>
<example endspaces=" ">
<pre xml:space="preserve">c: d? j
</pre></example>

<deftypeop endspaces=" "><definitionterm><indexterm index="fn" number="1">name? n. d on class: MyC. b</indexterm> <defcategory bracketed="on">cat: r. a</defcategory> <defclass bracketed="on">class: MyC. b</defclass> <deftype bracketed="on">type: t. c</deftype> <defoperation bracketed="on">name? n. d</defoperation> <defparamtype>arg?</defparamtype> <defparam>e:</defparam> <defparamtype>f.</defparamtype>  <defparam><var>v: g. h</var></defparam> <defparamtype><code>code? is: k</code></defparamtype></definitionterm>
<definitionitem><para>deftypeop
</para></definitionitem></deftypeop>

<defop endspaces=" "><definitionterm><indexterm index="fn" number="2">vname? n; d on vclass: MyC. u</indexterm> <defcategory bracketed="on">vcat: r. z</defcategory> <defclass bracketed="on">vclass: MyC. u</defclass> <defoperation bracketed="on">vname? n; d</defoperation> <defparam>varg?</defparam> <defparam>ve:</defparam> <defparam>f.</defparam> <defparam><var>vv: g? b</var></defparam> <defparam><code>vcode? is: a</code></defparam></definitionterm>
<definitionitem><para>defop
</para></definitionitem></defop>

<frenchspacing value="off" line=" off"></frenchspacing>
</chapter>
<node identifier="chap-no"><nodename> chap no</nodename><nodeprev automatic="on"> chapter frenchspacing</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chap no</sectiontitle>

<para>In text w: z? n; p. fn 
</para>
<para><code>a: b! gg; hn</code>
</para>
<example endspaces=" ">
<pre xml:space="preserve">c: d? jn
</pre></example>

<deftypeop endspaces=" "><definitionterm><indexterm index="fn" number="3">name? n. d on class: MyC. b</indexterm> <defcategory bracketed="on">cat: r. a</defcategory> <defclass bracketed="on">class: MyC. b</defclass> <deftype bracketed="on">type: t. c</deftype> <defoperation bracketed="on">name? n. d</defoperation> <defparamtype>narg?</defparamtype> <defparam>e:</defparam> <defparamtype>f.</defparamtype>  <defparam><var>v: g. h</var></defparam> <defparamtype><code>code? is: k</code></defparamtype></definitionterm>
<definitionitem><para>deftypeop n
</para></definitionitem></deftypeop>

<defop endspaces=" "><definitionterm><indexterm index="fn" number="4">vname? n; d on nvclass: MyC. u</indexterm> <defcategory bracketed="on">vcat: r. z</defcategory> <defclass bracketed="on">nvclass: MyC. u</defclass> <defoperation bracketed="on">vname? n; d</defoperation> <defparam>varg?</defparam> <defparam>ve:</defparam> <defparam>f.</defparam> <defparam><var>vv: g? b</var></defparam> <defparam><code>vcode? is: a</code></defparam></definitionterm>
<definitionitem><para>defop n
</para></definitionitem></defop>
</chapter>
';


$result_converted{'docbook'}->{'frenchspacing_and_code'} = '<chapter label="1" id="chapter-frenchspacing">
<title>Chap frenchspacing</title>

<para>In text w: z? n; p. f
</para>
<para><literal>a: b! gg; h</literal>
</para>
<screen>c: d? j
</screen>
<synopsis><indexterm role="fn"><primary>name? n. d on class: MyC. b</primary></indexterm><phrase role="category"><emphasis role="bold">cat: r. a</emphasis>:</phrase> <ooclass><classname>class: MyC. b</classname></ooclass> <returnvalue>type: t. c</returnvalue> <methodname>name? n. d</methodname> <type>arg?</type> <emphasis role="arg">e:</emphasis> <type>f.</type>  <emphasis role="arg"><replaceable>v: g. h</replaceable></emphasis> <type>code? is: k</type></synopsis>
<blockquote><para>deftypeop
</para></blockquote>
<synopsis><indexterm role="fn"><primary>vname? n; d on vclass: MyC. u</primary></indexterm><phrase role="category"><emphasis role="bold">vcat: r. z</emphasis>:</phrase> <ooclass><classname>vclass: MyC. u</classname></ooclass> <methodname>vname? n; d</methodname> <emphasis role="arg">varg?</emphasis> <emphasis role="arg">ve:</emphasis> <emphasis role="arg">f.</emphasis> <emphasis role="arg"><replaceable>vv: g? b</replaceable></emphasis> <emphasis role="arg">vcode? is: a</emphasis></synopsis>
<blockquote><para>defop
</para></blockquote>
</chapter>
<chapter label="2" id="chap-no">
<title>Chap no</title>

<para>In text w: z? n; p. fn 
</para>
<para><literal>a: b! gg; hn</literal>
</para>
<screen>c: d? jn
</screen>
<synopsis><indexterm role="fn"><primary>name? n. d on class: MyC. b</primary></indexterm><phrase role="category"><emphasis role="bold">cat: r. a</emphasis>:</phrase> <ooclass><classname>class: MyC. b</classname></ooclass> <returnvalue>type: t. c</returnvalue> <methodname>name? n. d</methodname> <type>narg?</type> <emphasis role="arg">e:</emphasis> <type>f.</type>  <emphasis role="arg"><replaceable>v: g. h</replaceable></emphasis> <type>code? is: k</type></synopsis>
<blockquote><para>deftypeop n
</para></blockquote>
<synopsis><indexterm role="fn"><primary>vname? n; d on nvclass: MyC. u</primary></indexterm><phrase role="category"><emphasis role="bold">vcat: r. z</emphasis>:</phrase> <ooclass><classname>nvclass: MyC. u</classname></ooclass> <methodname>vname? n; d</methodname> <emphasis role="arg">varg?</emphasis> <emphasis role="arg">ve:</emphasis> <emphasis role="arg">f.</emphasis> <emphasis role="arg"><replaceable>vv: g? b</replaceable></emphasis> <emphasis role="arg">vcode? is: a</emphasis></synopsis>
<blockquote><para>defop n
</para></blockquote></chapter>
';


$result_converted{'latex_text'}->{'frenchspacing_and_code'} = '\\frenchspacing

\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap frenchspacing}}
\\label{anchor:chapter-frenchspacing}%

In text w: z? n; p. f

\\texttt{a:\\ b!\\ gg;\\ h}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily c:\\ d?\\ j
\\end{Texinfopreformatted}
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{type:\\ t.\\ c name?\\ n.\\ d arg?\\ e:\\ f.\\  \\Texinfocommandstyletextvar{v: g. h}\\ \\texttt{code?\\ is:\\ k}}& [cat: r. a on \\texttt{class:\\ MyC.\\ b}]
\\end{tabularx}

\\index[fn]{name? n. d on class: MyC. b@\\texttt{name?\\ n.\\ d\\ on class:\\ MyC.\\ b}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
deftypeop
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{vname?\\ n;\\ d \\EmbracOn{}\\textnormal{\\textsl{varg? ve: f. \\Texinfocommandstyletextvar{vv: g? b} \\texttt{vcode?\\ is:\\ a}}}\\EmbracOff{}}& [vcat: r. z on \\texttt{vclass:\\ MyC.\\ u}]
\\end{tabularx}

\\index[fn]{vname? n; d on vclass: MyC. u@\\texttt{vname?\\ n;\\ d\\ on vclass:\\ MyC.\\ u}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
defop
\\end{Texinfoindented}

\\nonfrenchspacing
\\Texinfochapter{{Chap no}}
\\label{anchor:chap-no}%

In text w: z? n; p. fn 

\\texttt{a:\\ b!\\ gg;\\ hn}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily c:\\ d?\\ jn
\\end{Texinfopreformatted}
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{type:\\ t.\\ c name?\\ n.\\ d narg?\\ e:\\ f.\\  \\Texinfocommandstyletextvar{v: g. h}\\ \\texttt{code?\\ is:\\ k}}& [cat: r. a on \\texttt{class:\\ MyC.\\ b}]
\\end{tabularx}

\\index[fn]{name? n. d on class: MyC. b@\\texttt{name?\\ n.\\ d\\ on class:\\ MyC.\\ b}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
deftypeop n
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{vname?\\ n;\\ d \\EmbracOn{}\\textnormal{\\textsl{varg? ve: f. \\Texinfocommandstyletextvar{vv: g? b} \\texttt{vcode?\\ is:\\ a}}}\\EmbracOff{}}& [vcat: r. z on \\texttt{nvclass:\\ MyC.\\ u}]
\\end{tabularx}

\\index[fn]{vname? n; d on nvclass: MyC. u@\\texttt{vname?\\ n;\\ d\\ on nvclass:\\ MyC.\\ u}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
defop n
\\end{Texinfoindented}
';

1;
