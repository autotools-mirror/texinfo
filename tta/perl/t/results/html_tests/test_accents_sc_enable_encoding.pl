use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_accents_sc_enable_encoding'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 punctuation_small_case_accents_utf8.texi:l3 {top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *@top C2 punctuation_small_case_accents_utf8.texi:l4 {top section}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 punctuation_small_case_accents_utf8.texi:l6 {node chap}
 |EXTRA
 |identifier:{node-chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node chap}
    {spaces_after_argument:\\n}
 *@chapter C11 punctuation_small_case_accents_utf8.texi:l7 {chapter}
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
   *@\' C1 punctuation_small_case_accents_utf8.texi:l11
    *following_arg C1
     {normal_text:e}
   {normal_text:, --- }
   *@dfn C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container C1
     {normal_text:def}
   {normal_text: -- }
   *@code C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container C1
     {normal_text:in code}
   {normal_text:. }
   *@samp C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container C1
     {normal_text:in samp}
   {normal_text: aé. }
   *@comma C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container
   {normal_text: }
   *@exclamdown C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container
   {normal_text:. }
   *@dots C1 punctuation_small_case_accents_utf8.texi:l11
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C26
   *@geq C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text: }
   *@enddots C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text: }
   *@AA C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text: }
   *@\' C1 punctuation_small_case_accents_utf8.texi:l13
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *@dotaccent C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container C1
     {normal_text:A}
   {normal_text: }
   *@l C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text:. }
   *@copyright C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text:. }
   *@error C1 punctuation_small_case_accents_utf8.texi:l13
    *brace_container
   {normal_text:.\\n}
   *@quotedblleft C1 punctuation_small_case_accents_utf8.texi:l14
    *brace_container
   {normal_text: in quotes }
   *@quotedblright C1 punctuation_small_case_accents_utf8.texi:l14
    *brace_container
   {normal_text:. }
   *@expansion C1 punctuation_small_case_accents_utf8.texi:l14
    *brace_container
   {normal_text:\\n}
   *@minus C1 punctuation_small_case_accents_utf8.texi:l15
    *brace_container
   {normal_text: }
   *@registeredsymbol C1 punctuation_small_case_accents_utf8.texi:l15
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C26
   *@u C1 punctuation_small_case_accents_utf8.texi:l18
    *brace_container C1
     {normal_text:--a}
   {normal_text:\\n}
   *@^ C1 punctuation_small_case_accents_utf8.texi:l19
    *brace_container C1
     {normal_text:--a}
   {normal_text:\\n}
   *@aa C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container
   {normal_text: }
   *@AA C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container
   {normal_text: }
   *@^ C1 punctuation_small_case_accents_utf8.texi:l20
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *@^ C1 punctuation_small_case_accents_utf8.texi:l20
    *following_arg C1
     {normal_text:E}
   {normal_text: }
   *@~ C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     *@dotless C1 punctuation_small_case_accents_utf8.texi:l20
      *brace_container C1
       {normal_text:i}
   {normal_text: }
   *@dotless C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     {normal_text:i}
   {normal_text: }
   *@udotaccent C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     {normal_text:r}
   {normal_text: }
   *@v C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     *@\' C1 punctuation_small_case_accents_utf8.texi:l20
      *brace_container C1
       {normal_text:r}
   {normal_text: }
   *@= C1 punctuation_small_case_accents_utf8.texi:l20
    *brace_container C1
     *@, C1 punctuation_small_case_accents_utf8.texi:l20
      *brace_container C1
       *@~ C1 punctuation_small_case_accents_utf8.texi:l20
        *brace_container C1
         {normal_text:n}
   {normal_text:.\\n}
   *@equiv C1 punctuation_small_case_accents_utf8.texi:l21
    *brace_container
   {normal_text:\\n}
   *@sc C1 punctuation_small_case_accents_utf8.texi:l22
    *brace_container C17
     *@aa C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container
     {normal_text: }
     *@AA C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container
     {normal_text: }
     *@^ C1 punctuation_small_case_accents_utf8.texi:l22
      *following_arg C1
       {normal_text:e}
     {normal_text: é }
     *@^ C1 punctuation_small_case_accents_utf8.texi:l22
      *following_arg C1
       {normal_text:E}
     {normal_text: }
     *@~ C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       *@dotless C1 punctuation_small_case_accents_utf8.texi:l22
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *@dotless C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       {normal_text:i}
     {normal_text: }
     *@udotaccent C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       {normal_text:r}
     {normal_text: }
     *@v C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       *@\' C1 punctuation_small_case_accents_utf8.texi:l22
        *brace_container C1
         {normal_text:r}
     {normal_text: }
     *@= C1 punctuation_small_case_accents_utf8.texi:l22
      *brace_container C1
       *@, C1 punctuation_small_case_accents_utf8.texi:l22
        *brace_container C1
         *@~ C1 punctuation_small_case_accents_utf8.texi:l22
          *brace_container C1
           {normal_text:n}
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'test_accents_sc_enable_encoding'} = '\\input texinfo

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


$result_texts{'test_accents_sc_enable_encoding'} = 'top section
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

$result_errors{'test_accents_sc_enable_encoding'} = '';

$result_nodes_list{'test_accents_sc_enable_encoding'} = '1|top
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

$result_sections_list{'test_accents_sc_enable_encoding'} = '1|top section
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

$result_sectioning_root{'test_accents_sc_enable_encoding'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'test_accents_sc_enable_encoding'} = '';


$result_converted{'html_text'}->{'test_accents_sc_enable_encoding'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> ¶</a></span></h1>

<ul class="mini-toc">
<li><a href="#node-chap">chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="node-chap">
<h2 class="chapter" id="chapter"><span>1 chapter<a class="copiable-link" href="#chapter"> ¶</a></span></h2>

<p>“in double q”. ‘in simple q’.
</p>
<p>é, — <em class="dfn">def</em> – <code class="code">in code</code>. ‘<samp class="samp">in samp</samp>’ aé. , ¡. …
</p>
<p>≥ <small class="enddots">...</small> Å é Ȧ ł. ©. error→.
“ in quotes ”. ↦
− ®
</p>

<p>–ă
–â
å Å ê Ê ĩ ı ṛ ŕ̌ ņ̃̄.
≡
<small class="sc">Å Å Ê É Ê Ĩ I Ṛ Ŕ̌ Ņ̃̄</small>.
</p>
</div>
</div>
';

1;
