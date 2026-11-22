use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'commands_in_settitle_with_title'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@settitle C1 l1
    *line_arg C15
     {spaces_before_argument: }
     *normal_command@sc C1 l1
      *brace_container C6
       {normal_text:sc }
       *normal_command@~ C1 l1
        *following_arg C1
         {normal_text:n}
       {normal_text: }
       *normal_command@aa C1 l1
        *brace_container
       {normal_text: }
       *normal_command@TeX C1 l1
        *brace_container
     {normal_text: node }
     *normal_command@" C1 l1
      *following_arg C1
       {normal_text:i}
     {normal_text: }
     *normal_command@" C1 l1
      *brace_container C1
       *normal_command@dotless C1 l1
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *normal_command@` C1 l1
      *brace_container C1
       *normal_command@= C1 l1
        *following_arg C1
         {normal_text:E}
     {normal_text: }
     *normal_command@l C1 l1
      *brace_container
     {normal_text: }
     *normal_command@, C1 l1
      *brace_container C1
       *normal_command@\' C1 l1
        *following_arg C1
         {normal_text:C}
     {normal_text: }
     *normal_command@exclamdown C1 l1
      *brace_container
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l4 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 l7 {Chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Document.\\n}
  {empty_line:\\n}
';


$result_texis{'commands_in_settitle_with_title'} = '@settitle @sc{sc @~n @aa{} @TeX{}} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}

@node Top
@top top

@node chapter
@chapter Chap

Document.

';


$result_texts{'commands_in_settitle_with_title'} = '
top
***

1 Chap
******

Document.

';

$result_errors{'commands_in_settitle_with_title'} = '';

$result_nodes_list{'commands_in_settitle_with_title'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'commands_in_settitle_with_title'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'commands_in_settitle_with_title'} = 'level: -1
list:
 1|top
';

$result_headings_list{'commands_in_settitle_with_title'} = '';


$result_converted{'plaintext'}->{'commands_in_settitle_with_title'} = 'top
***

1 Chap
******

Document.

';


$result_converted{'html_text'}->{'commands_in_settitle_with_title'} = '<h1 class="settitle"><small class="sc">SC &Ntilde; &Aring; TeX</small> node &iuml; &iuml; &#274;&#768; &#322; &#262;&#807; &iexcl;</h1>
<hr>

<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter">Chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter" id="Chap"><span>1 Chap<a class="copiable-link" href="#Chap"> &para;</a></span></h2>

<p>Document.
</p>
</div>
</div>
';


$result_converted{'xml'}->{'commands_in_settitle_with_title'} = '<settitle> <sc>sc <accent type="tilde" bracketed="off">n</accent> &aring; &tex;</sc> node <accent type="uml" bracketed="off">i</accent> <accent type="uml"><dotless>i</dotless></accent> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> &lslash; <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent> &iexcl;</settitle>

<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chap</sectiontitle>

<para>Document.
</para>
</chapter>
';


$result_converted{'docbook'}->{'commands_in_settitle_with_title'} = '<chapter label="1" id="chapter">
<title>Chap</title>

<para>Document.
</para>
</chapter>
';


$result_converted{'latex_text'}->{'commands_in_settitle_with_title'} = '
\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chap}}
\\label{anchor:chapter}%

Document.

';

1;
