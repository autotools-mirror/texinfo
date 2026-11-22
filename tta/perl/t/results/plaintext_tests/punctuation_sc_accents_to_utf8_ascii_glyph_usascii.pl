use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'punctuation_sc_accents_to_utf8_ascii_glyph_usascii'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo\\n}
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@documentencoding C1 punctuation_small_case_accents_us_ascii.texi:l3
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{us-ascii}
   |text_arg:{US-ASCII}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:US-ASCII}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 punctuation_small_case_accents_us_ascii.texi:l5 {top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *@top C2 punctuation_small_case_accents_us_ascii.texi:l6 {top section}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 punctuation_small_case_accents_us_ascii.texi:l8 {node chap}
 |EXTRA
 |identifier:{node-chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node chap}
    {spaces_after_argument:\\n}
 *@chapter C11 punctuation_small_case_accents_us_ascii.texi:l9 {chapter}
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
  *paragraph C16
   *@\' C1 punctuation_small_case_accents_us_ascii.texi:l13
    *following_arg C1
     {normal_text:e}
   {normal_text:, --- }
   *@dfn C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container C1
     {normal_text:def}
   {normal_text: -- }
   *@code C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container C1
     {normal_text:in code}
   {normal_text:. }
   *@samp C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container C1
     {normal_text:in samp}
   {normal_text: a}
   *@\' C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container C1
     {normal_text:e}
   {normal_text:. }
   *@comma C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container
   {normal_text: }
   *@exclamdown C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container
   {normal_text:. }
   *@dots C1 punctuation_small_case_accents_us_ascii.texi:l13
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C26
   *@geq C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   {normal_text: }
   *@enddots C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   {normal_text: }
   *@AA C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   {normal_text: }
   *@\' C1 punctuation_small_case_accents_us_ascii.texi:l15
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *@dotaccent C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container C1
     {normal_text:A}
   {normal_text: }
   *@l C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   {normal_text:. }
   *@copyright C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   {normal_text:. }
   *@error C1 punctuation_small_case_accents_us_ascii.texi:l15
    *brace_container
   {normal_text:.\\n}
   *@quotedblleft C1 punctuation_small_case_accents_us_ascii.texi:l16
    *brace_container
   {normal_text: in quotes }
   *@quotedblright C1 punctuation_small_case_accents_us_ascii.texi:l16
    *brace_container
   {normal_text:. }
   *@expansion C1 punctuation_small_case_accents_us_ascii.texi:l16
    *brace_container
   {normal_text:\\n}
   *@minus C1 punctuation_small_case_accents_us_ascii.texi:l17
    *brace_container
   {normal_text: }
   *@registeredsymbol C1 punctuation_small_case_accents_us_ascii.texi:l17
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C26
   *@u C1 punctuation_small_case_accents_us_ascii.texi:l20
    *brace_container C1
     {normal_text:--a}
   {normal_text:\\n}
   *@^ C1 punctuation_small_case_accents_us_ascii.texi:l21
    *brace_container C1
     {normal_text:--a}
   {normal_text:\\n}
   *@aa C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container
   {normal_text: }
   *@AA C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container
   {normal_text: }
   *@^ C1 punctuation_small_case_accents_us_ascii.texi:l22
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *@^ C1 punctuation_small_case_accents_us_ascii.texi:l22
    *following_arg C1
     {normal_text:E}
   {normal_text: }
   *@~ C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container C1
     *@dotless C1 punctuation_small_case_accents_us_ascii.texi:l22
      *brace_container C1
       {normal_text:i}
   {normal_text: }
   *@dotless C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container C1
     {normal_text:i}
   {normal_text: }
   *@udotaccent C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container C1
     {normal_text:r}
   {normal_text: }
   *@v C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container C1
     *@\' C1 punctuation_small_case_accents_us_ascii.texi:l22
      *brace_container C1
       {normal_text:r}
   {normal_text: }
   *@= C1 punctuation_small_case_accents_us_ascii.texi:l22
    *brace_container C1
     *@, C1 punctuation_small_case_accents_us_ascii.texi:l22
      *brace_container C1
       *@~ C1 punctuation_small_case_accents_us_ascii.texi:l22
        *brace_container C1
         {normal_text:n}
   {normal_text:.\\n}
   *@equiv C1 punctuation_small_case_accents_us_ascii.texi:l23
    *brace_container
   {normal_text:\\n}
   *@sc C1 punctuation_small_case_accents_us_ascii.texi:l24
    *brace_container C17
     *@aa C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container
     {normal_text: }
     *@AA C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container
     {normal_text: }
     *@^ C1 punctuation_small_case_accents_us_ascii.texi:l24
      *following_arg C1
       {normal_text:e}
     {normal_text: é }
     *@^ C1 punctuation_small_case_accents_us_ascii.texi:l24
      *following_arg C1
       {normal_text:E}
     {normal_text: }
     *@~ C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container C1
       *@dotless C1 punctuation_small_case_accents_us_ascii.texi:l24
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *@dotless C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container C1
       {normal_text:i}
     {normal_text: }
     *@udotaccent C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container C1
       {normal_text:r}
     {normal_text: }
     *@v C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container C1
       *@\' C1 punctuation_small_case_accents_us_ascii.texi:l24
        *brace_container C1
         {normal_text:r}
     {normal_text: }
     *@= C1 punctuation_small_case_accents_us_ascii.texi:l24
      *brace_container C1
       *@, C1 punctuation_small_case_accents_us_ascii.texi:l24
        *brace_container C1
         *@~ C1 punctuation_small_case_accents_us_ascii.texi:l24
          *brace_container C1
           {normal_text:n}
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'punctuation_sc_accents_to_utf8_ascii_glyph_usascii'} = '\\input texinfo

@documentencoding US-ASCII

@node top
@top top section

@node node chap
@chapter chapter

``in double q\'\'. `in simple q\'.

@\'e, --- @dfn{def} -- @code{in code}. @samp{in samp} a@\'{e}. @comma{} @exclamdown{}. @dots{}

@geq{} @enddots{} @AA{} @\'e @dotaccent{A} @l{}. @copyright{}. @error{}.
@quotedblleft{} in quotes @quotedblright{}. @expansion{}
@minus{} @registeredsymbol{}


@u{--a}
@^{--a}
@aa{} @AA{} @^e @^E @~{@dotless{i}} @dotless{i} @udotaccent{r} @v{@\'{r}} @={@,{@~{n}}}.
@equiv{}
@sc{@aa{} @AA{} @^e é @^E @~{@dotless{i}} @dotless{i} @udotaccent{r} @v{@\'{r}} @={@,{@~{n}}}}.

';


$result_texts{'punctuation_sc_accents_to_utf8_ascii_glyph_usascii'} = '
top section
***********

1 chapter
*********

"in double q". `in simple q\'.

e\', -- def - in code. in samp ae\'. , !. ...

>= ... AA e\' A. /l. (C). error->.
" in quotes ". ==>
- (R)


-a(
-a^
aa AA e^ E^ i~ i .r r\'< n~,=.
==
AA AA E^ É E^ I~ I .R R\'< N~,=.

';

$result_errors{'punctuation_sc_accents_to_utf8_ascii_glyph_usascii'} = '';

$result_nodes_list{'punctuation_sc_accents_to_utf8_ascii_glyph_usascii'} = '1|top
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

$result_sections_list{'punctuation_sc_accents_to_utf8_ascii_glyph_usascii'} = '1|top section
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

$result_sectioning_root{'punctuation_sc_accents_to_utf8_ascii_glyph_usascii'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'punctuation_sc_accents_to_utf8_ascii_glyph_usascii'} = '';

1;
