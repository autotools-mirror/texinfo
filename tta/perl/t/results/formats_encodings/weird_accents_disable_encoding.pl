use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'weird_accents_disable_encoding'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@documentencoding C1 l1
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ISO-8859-1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 l4 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l6 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *@chapter C11 l7 {Chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@= C1 l9
    *brace_container C1
     *@~ C1 l9
      *brace_container C1
       *@dotless C1 l9
        *brace_container C1
         {normal_text:i}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@= C1 l11
    *brace_container C1
     *@, C1 l11
      *brace_container C1
       *@~ C1 l11
        *brace_container C1
         {normal_text:n}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@= C1 l13
    *brace_container C1
     *@ubaraccent C1 l13
      *brace_container C1
       {normal_text:a}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@^ C1 l15
    *brace_container C1
     *@udotaccent C1 l15
      *brace_container C1
       *@` C1 l15
        *following_arg C1
         {normal_text:r}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@= C1 l17
    *brace_container C1
     *@\' C1 l17
      *brace_container C1
       *@` C1 l17
        *brace_container C1
         {normal_text:r}
   {normal_text:\\n}
';


$result_texis{'weird_accents_disable_encoding'} = '@documentencoding ISO-8859-1

@node Top
@top top

@node chap
@chapter Chapter

@={@~{@dotless{i}}}

@={@,{@~{n}}}

@={@ubaraccent{a}}

@^{@udotaccent{@`r}}

@={@\'{@`{r}}}
';


$result_texts{'weird_accents_disable_encoding'} = '
top
***

1 Chapter
*********

i~=

n~,=

a_=

.r`^

r`\'=
';

$result_errors{'weird_accents_disable_encoding'} = '';

$result_nodes_list{'weird_accents_disable_encoding'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'weird_accents_disable_encoding'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'weird_accents_disable_encoding'} = 'level: -1
list:
 1|top
';

$result_headings_list{'weird_accents_disable_encoding'} = '';


$result_converted{'plaintext'}->{'weird_accents_disable_encoding'} = 'top
***

1 Chapter
*********

i~=

   n~,=

   a_=

   .r`^

   r`\'=
';


$result_converted{'html_text'}->{'weird_accents_disable_encoding'} = '
<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p>&#297;&#772;
</p>
<p>&ntilde;&#807;&#772;
</p>
<p>a&#818;&#772;
</p>
<p>r&#768;&#803;&#770;
</p>
<p>r&#768;&#769;&#772;
</p></div>
</div>
';


$result_converted{'xml'}->{'weird_accents_disable_encoding'} = '<documentencoding encoding="ISO-8859-1"> ISO-8859-1</documentencoding>

<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chapter</sectiontitle>

<para><accent type="macr"><accent type="tilde"><dotless>i</dotless></accent></accent>
</para>
<para><accent type="macr"><accent type="cedil"><accent type="tilde">n</accent></accent></accent>
</para>
<para><accent type="macr"><accent type="ubaraccent">a</accent></accent>
</para>
<para><accent type="circ"><accent type="udotaccent"><accent type="grave" bracketed="off">r</accent></accent></accent>
</para>
<para><accent type="macr"><accent type="acute"><accent type="grave">r</accent></accent></accent>
</para></chapter>
';


$result_converted{'docbook'}->{'weird_accents_disable_encoding'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<para>&#297;&#772;
</para>
<para>&#241;&#807;&#772;
</para>
<para>a&#818;&#772;
</para>
<para>r&#768;&#803;&#770;
</para>
<para>r&#768;&#769;&#772;
</para></chapter>
';


$result_converted{'latex_text'}->{'weird_accents_disable_encoding'} = '
\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chap}%

\\={\\~{\\i{}}}

\\={\\c{\\~{n}}}

\\={\\b{a}}

\\^{\\d{\\`{r}}}

\\={\\\'{\\`{r}}}
';

1;
