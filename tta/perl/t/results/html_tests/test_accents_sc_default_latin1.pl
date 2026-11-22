use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_accents_sc_default_latin1'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@documentencoding C1 punctuation_small_case_accents_latin1.texi:l3
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ISO-8859-1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 punctuation_small_case_accents_latin1.texi:l5 {top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *@top C2 punctuation_small_case_accents_latin1.texi:l6 {top section}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 punctuation_small_case_accents_latin1.texi:l8 {node chap}
 |EXTRA
 |identifier:{node-chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node chap}
    {spaces_after_argument:\\n}
 *@chapter C11 punctuation_small_case_accents_latin1.texi:l9 {chapter}
 |EXTRA
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
   *@\' C1 punctuation_small_case_accents_latin1.texi:l13
    *following_arg C1
     {normal_text:e}
   {normal_text:, --- }
   *@dfn C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container C1
     {normal_text:def}
   {normal_text: -- }
   *@code C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container C1
     {normal_text:in code}
   {normal_text:. }
   *@samp C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container C1
     {normal_text:in samp}
   {normal_text: aé. }
   *@comma C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container
   {normal_text: }
   *@exclamdown C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container
   {normal_text:. }
   *@dots C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C26
   *@geq C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text: }
   *@enddots C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text: }
   *@AA C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text: }
   *@\' C1 punctuation_small_case_accents_latin1.texi:l15
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *@dotaccent C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container C1
     {normal_text:A}
   {normal_text: }
   *@l C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text:. }
   *@copyright C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text:. }
   *@error C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text:.\\n}
   *@quotedblleft C1 punctuation_small_case_accents_latin1.texi:l16
    *brace_container
   {normal_text: in quotes }
   *@quotedblright C1 punctuation_small_case_accents_latin1.texi:l16
    *brace_container
   {normal_text:. }
   *@expansion C1 punctuation_small_case_accents_latin1.texi:l16
    *brace_container
   {normal_text:\\n}
   *@minus C1 punctuation_small_case_accents_latin1.texi:l17
    *brace_container
   {normal_text: }
   *@registeredsymbol C1 punctuation_small_case_accents_latin1.texi:l17
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C26
   *@u C1 punctuation_small_case_accents_latin1.texi:l20
    *brace_container C1
     {normal_text:--a}
   {normal_text:\\n}
   *@^ C1 punctuation_small_case_accents_latin1.texi:l21
    *brace_container C1
     {normal_text:--a}
   {normal_text:\\n}
   *@aa C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container
   {normal_text: }
   *@AA C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container
   {normal_text: }
   *@^ C1 punctuation_small_case_accents_latin1.texi:l22
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *@^ C1 punctuation_small_case_accents_latin1.texi:l22
    *following_arg C1
     {normal_text:E}
   {normal_text: }
   *@~ C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container C1
     *@dotless C1 punctuation_small_case_accents_latin1.texi:l22
      *brace_container C1
       {normal_text:i}
   {normal_text: }
   *@dotless C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container C1
     {normal_text:i}
   {normal_text: }
   *@udotaccent C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container C1
     {normal_text:r}
   {normal_text: }
   *@v C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container C1
     *@\' C1 punctuation_small_case_accents_latin1.texi:l22
      *brace_container C1
       {normal_text:r}
   {normal_text: }
   *@= C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container C1
     *@, C1 punctuation_small_case_accents_latin1.texi:l22
      *brace_container C1
       *@~ C1 punctuation_small_case_accents_latin1.texi:l22
        *brace_container C1
         {normal_text:n}
   {normal_text:.\\n}
   *@equiv C1 punctuation_small_case_accents_latin1.texi:l23
    *brace_container
   {normal_text:\\n}
   *@sc C1 punctuation_small_case_accents_latin1.texi:l24
    *brace_container C17
     *@aa C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container
     {normal_text: }
     *@AA C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container
     {normal_text: }
     *@^ C1 punctuation_small_case_accents_latin1.texi:l24
      *following_arg C1
       {normal_text:e}
     {normal_text: }
     *@^ C1 punctuation_small_case_accents_latin1.texi:l24
      *following_arg C1
       {normal_text:E}
     {normal_text: é }
     *@~ C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container C1
       *@dotless C1 punctuation_small_case_accents_latin1.texi:l24
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *@dotless C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container C1
       {normal_text:i}
     {normal_text: }
     *@udotaccent C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container C1
       {normal_text:r}
     {normal_text: }
     *@v C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container C1
       *@\' C1 punctuation_small_case_accents_latin1.texi:l24
        *brace_container C1
         {normal_text:r}
     {normal_text: }
     *@= C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container C1
       *@, C1 punctuation_small_case_accents_latin1.texi:l24
        *brace_container C1
         *@~ C1 punctuation_small_case_accents_latin1.texi:l24
          *brace_container C1
           {normal_text:n}
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'test_accents_sc_default_latin1'} = '\\input texinfo

@documentencoding ISO-8859-1

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
@sc{@aa{} @AA{} @^e @^E é @~{@dotless{i}} @dotless{i} @udotaccent{r} @v{@\'{r}} @={@,{@~{n}}}}.

';


$result_texts{'test_accents_sc_default_latin1'} = '
top section
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
AA AA E^ E^ É I~ I .R R\'< N~,=.

';

$result_errors{'test_accents_sc_default_latin1'} = '';

$result_nodes_list{'test_accents_sc_default_latin1'} = '1|top
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

$result_sections_list{'test_accents_sc_default_latin1'} = '1|top section
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

$result_sectioning_root{'test_accents_sc_default_latin1'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'test_accents_sc_default_latin1'} = '';


$result_converted{'html_text'}->{'test_accents_sc_default_latin1'} = '
<div class="top-level-extent" id="Top">
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#node-chap">chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="node-chap">
<h2 class="chapter" id="chapter"><span>1 chapter<a class="copiable-link" href="#chapter"> &para;</a></span></h2>

<p>&ldquo;in double q&rdquo;. &lsquo;in simple q&rsquo;.
</p>
<p>&eacute;, &mdash; <em class="dfn">def</em> &ndash; <code class="code">in code</code>. &lsquo;<samp class="samp">in samp</samp>&rsquo; aé. , &iexcl;. &hellip;
</p>
<p>&ge; <small class="enddots">...</small> &Aring; &eacute; &#550; &#322;. &copy;. error<span class="arrow">&rarr;</span>.
&ldquo; in quotes &rdquo;. <span class="expansion">&rarr;</span>
&minus; &reg;
</p>

<p>&ndash;a&#774;
&ndash;a&#770;
&aring; &Aring; &ecirc; &Ecirc; &#297; &inodot; &#7771; &#341;&#780; &ntilde;&#807;&#772;.
&equiv;
<small class="sc">&Aring; &Aring; &Ecirc; &Ecirc; É &#296; I &#7770; &#340;&#780; &Ntilde;&#807;&#772;</small>.
</p>
</div>
</div>
';

1;
