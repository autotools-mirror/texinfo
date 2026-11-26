use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_accents_sc_use_numeric_entity'} = '*document_root C5
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo\\n}
   {empty_line:\\n}
  *preamble
 *normal_command@node C1 punctuation_small_case_accents_utf8.texi:l3 {top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 punctuation_small_case_accents_utf8.texi:l4 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 punctuation_small_case_accents_utf8.texi:l6 {node chap}
 |identifier:{node-chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C11 punctuation_small_case_accents_utf8.texi:l7 {chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:``in double q\'\'. `in simple q\'.\\n}
  {empty_line:\\n}
  *paragraph C14
   *normal_command@\' C1 punctuation_small_case_accents_utf8.texi:l11
    *following_arg C1
     {normal_text:e}
   {normal_text:, --- }
   *normal_command@dfn C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container C1
     {normal_text:def}
   {normal_text: -- }
   *normal_command@code C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container C1
     {normal_text:in code}
   {normal_text:. }
   *normal_command@samp C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container C1
     {normal_text:in samp}
   {normal_text: aé. }
   *normal_command@comma C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container
   {normal_text: }
   *normal_command@exclamdown C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container
   {normal_text:. }
   *normal_command@dots C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C26
   *normal_command@geq C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text: }
   *normal_command@enddots C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text: }
   *normal_command@AA C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text: }
   *normal_command@\' C1 punctuation_small_case_accents_utf8.texi:l13
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *normal_command@dotaccent C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container C1
     {normal_text:A}
   {normal_text: }
   *normal_command@l C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text:. }
   *normal_command@copyright C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text:. }
   *normal_command@error C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text:.\\n}
   *normal_command@quotedblleft C1 punctuation_small_case_accents_utf8.texi:l14
    *brace_container
   {normal_text: in quotes }
   *normal_command@quotedblright C1 punctuation_small_case_accents_utf8.texi:l14
    *brace_container
   {normal_text:. }
   *normal_command@expansion C1 punctuation_small_case_accents_utf8.texi:l14
    *brace_container
   {normal_text:\\n}
   *normal_command@minus C1 punctuation_small_case_accents_utf8.texi:l15
    *brace_container
   {normal_text: }
   *normal_command@registeredsymbol C1 punctuation_small_case_accents_utf8.texi:l15
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C26
   *normal_command@u C1 punctuation_small_case_accents_utf8.texi:l18
    *brace_container C1
     {normal_text:--a}
   {normal_text:\\n}
   *normal_command@^ C1 punctuation_small_case_accents_utf8.texi:l19
    *brace_container C1
     {normal_text:--a}
   {normal_text:\\n}
   *normal_command@aa C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container
   {normal_text: }
   *normal_command@AA C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container
   {normal_text: }
   *normal_command@^ C1 punctuation_small_case_accents_utf8.texi:l20
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *normal_command@^ C1 punctuation_small_case_accents_utf8.texi:l20
    *following_arg C1
     {normal_text:E}
   {normal_text: }
   *normal_command@~ C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     *normal_command@dotless C1 punctuation_small_case_accents_utf8.texi:l20
      *brace_container C1
       {normal_text:i}
   {normal_text: }
   *normal_command@dotless C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     {normal_text:i}
   {normal_text: }
   *normal_command@udotaccent C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     {normal_text:r}
   {normal_text: }
   *normal_command@v C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     *normal_command@\' C1 punctuation_small_case_accents_utf8.texi:l20
      *brace_container C1
       {normal_text:r}
   {normal_text: }
   *normal_command@= C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     *normal_command@, C1 punctuation_small_case_accents_utf8.texi:l20
      *brace_container C1
       *normal_command@~ C1 punctuation_small_case_accents_utf8.texi:l20
        *brace_container C1
         {normal_text:n}
   {normal_text:.\\n}
   *normal_command@equiv C1 punctuation_small_case_accents_utf8.texi:l21
    *brace_container
   {normal_text:\\n}
   *normal_command@sc C1 punctuation_small_case_accents_utf8.texi:l22
    *brace_container C17
     *normal_command@aa C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container
     {normal_text: }
     *normal_command@AA C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container
     {normal_text: }
     *normal_command@^ C1 punctuation_small_case_accents_utf8.texi:l22
      *following_arg C1
       {normal_text:e}
     {normal_text: é }
     *normal_command@^ C1 punctuation_small_case_accents_utf8.texi:l22
      *following_arg C1
       {normal_text:E}
     {normal_text: }
     *normal_command@~ C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       *normal_command@dotless C1 punctuation_small_case_accents_utf8.texi:l22
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *normal_command@dotless C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       {normal_text:i}
     {normal_text: }
     *normal_command@udotaccent C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       {normal_text:r}
     {normal_text: }
     *normal_command@v C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       *normal_command@\' C1 punctuation_small_case_accents_utf8.texi:l22
        *brace_container C1
         {normal_text:r}
     {normal_text: }
     *normal_command@= C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       *normal_command@, C1 punctuation_small_case_accents_utf8.texi:l22
        *brace_container C1
         *normal_command@~ C1 punctuation_small_case_accents_utf8.texi:l22
          *brace_container C1
           {normal_text:n}
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'test_accents_sc_use_numeric_entity'} = '\\input texinfo

@node top
@top top section

@node node chap
@chapter chapter

``in double q\'\'. `in simple q\'.

@\'e, --- @dfn{def} -- @code{in code}. @samp{in samp} aé. @comma{} @exclamdown{}. @dots{}

@geq{} @enddots{} @AA{} @\'e @dotaccent{A} @l{}. @copyright{}. @error{}.
@quotedblleft{} in quotes @quotedblright{}. @expansion{}
@minus{} @registeredsymbol{}


@u{--a}
@^{--a}
@aa{} @AA{} @^e @^E @~{@dotless{i}} @dotless{i} @udotaccent{r} @v{@\'{r}} @={@,{@~{n}}}.
@equiv{}
@sc{@aa{} @AA{} @^e é @^E @~{@dotless{i}} @dotless{i} @udotaccent{r} @v{@\'{r}} @={@,{@~{n}}}}.

';


$result_texts{'test_accents_sc_use_numeric_entity'} = 'top section
***********

1 chapter
*********

"in double q". `in simple q\'.

e\', -- def - in code. in samp aé. , !. ...

>= ... AA e\' A. /l. (C). error->.
" in quotes ". ==>
- (R)


-a(
-a^
aa AA e^ E^ i~ i .r r\'< n~,=.
==
AA AA E^ É E^ I~ I .R R\'< N~,=.

';

$result_errors{'test_accents_sc_use_numeric_entity'} = '';

$result_nodes_list{'test_accents_sc_use_numeric_entity'} = '1|top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->node chap
2|node chap
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->top
  up->top
';

$result_sections_list{'test_accents_sc_use_numeric_entity'} = '1|top section
 associated_anchor_command: top
 associated_node: top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: node chap
 associated_node: node chap
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'test_accents_sc_use_numeric_entity'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'test_accents_sc_use_numeric_entity'} = '';


$result_converted{'html_text'}->{'test_accents_sc_use_numeric_entity'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &#182;</a></span></h1>

<ul class="mini-toc">
<li><a href="#node-chap">chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="node-chap">
<h2 class="chapter" id="chapter"><span>1 chapter<a class="copiable-link" href="#chapter"> &#182;</a></span></h2>

<p>&#8220;in double q&#8221;. &#8216;in simple q&#8217;.
</p>
<p>&#233;, &#8212; <em class="dfn">def</em> &#8211; <code class="code">in code</code>. &#8216;<samp class="samp">in samp</samp>&#8217; aé. &#44; &#161;. &#8230;
</p>
<p>&#8805; <small class="enddots">...</small> &#197; &#233; &#550; &#322;. &#169;. error<span class="arrow">&#8594;</span>.
&#8220; in quotes &#8221;. <span class="expansion">&#8614;</span>
&#8722; &#174;
</p>

<p>&#8211;a&#774;
&#8211;a&#770;
&#229; &#197; &#234; &#202; &#297; &#305; &#7771; &#341;&#780; &#241;&#807;&#772;.
&#8801;
<small class="sc">&#197; &#197; &#202; É &#202; &#296; I &#7770; &#340;&#780; &#209;&#807;&#772;</small>.
</p>
</div>
</div>
';

1;
