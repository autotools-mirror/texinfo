use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'punctuation_sc_accents_to_utf8_ascii_glyph_latin1'} = '*document_root C5
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo\\n}
   {empty_line:\\n}
  *preamble C2
   *normal_command@documentencoding C1 punctuation_small_case_accents_latin1.texi:l3
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ISO-8859-1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 punctuation_small_case_accents_latin1.texi:l5 {top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 punctuation_small_case_accents_latin1.texi:l6 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 punctuation_small_case_accents_latin1.texi:l8 {node chap}
 |identifier:{node-chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C11 punctuation_small_case_accents_latin1.texi:l9 {chapter}
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
   *normal_command@\' C1 punctuation_small_case_accents_latin1.texi:l13
    *following_arg C1
     {normal_text:e}
   {normal_text:, --- }
   *normal_command@dfn C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container C1
     {normal_text:def}
   {normal_text: -- }
   *normal_command@code C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container C1
     {normal_text:in code}
   {normal_text:. }
   *normal_command@samp C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container C1
     {normal_text:in samp}
   {normal_text: aé. }
   *normal_command@comma C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container
   {normal_text: }
   *normal_command@exclamdown C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container
   {normal_text:. }
   *normal_command@dots C1 punctuation_small_case_accents_latin1.texi:l13
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C26
   *normal_command@geq C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text: }
   *normal_command@enddots C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text: }
   *normal_command@AA C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text: }
   *normal_command@\' C1 punctuation_small_case_accents_latin1.texi:l15
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *normal_command@dotaccent C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container C1
     {normal_text:A}
   {normal_text: }
   *normal_command@l C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text:. }
   *normal_command@copyright C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text:. }
   *normal_command@error C1 punctuation_small_case_accents_latin1.texi:l15
    *brace_container
   {normal_text:.\\n}
   *normal_command@quotedblleft C1 punctuation_small_case_accents_latin1.texi:l16
    *brace_container
   {normal_text: in quotes }
   *normal_command@quotedblright C1 punctuation_small_case_accents_latin1.texi:l16
    *brace_container
   {normal_text:. }
   *normal_command@expansion C1 punctuation_small_case_accents_latin1.texi:l16
    *brace_container
   {normal_text:\\n}
   *normal_command@minus C1 punctuation_small_case_accents_latin1.texi:l17
    *brace_container
   {normal_text: }
   *normal_command@registeredsymbol C1 punctuation_small_case_accents_latin1.texi:l17
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C26
   *normal_command@u C1 punctuation_small_case_accents_latin1.texi:l20
    *brace_container C1
     {normal_text:--a}
   {normal_text:\\n}
   *normal_command@^ C1 punctuation_small_case_accents_latin1.texi:l21
    *brace_container C1
     {normal_text:--a}
   {normal_text:\\n}
   *normal_command@aa C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container
   {normal_text: }
   *normal_command@AA C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container
   {normal_text: }
   *normal_command@^ C1 punctuation_small_case_accents_latin1.texi:l22
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *normal_command@^ C1 punctuation_small_case_accents_latin1.texi:l22
    *following_arg C1
     {normal_text:E}
   {normal_text: }
   *normal_command@~ C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container C1
     *normal_command@dotless C1 punctuation_small_case_accents_latin1.texi:l22
      *brace_container C1
       {normal_text:i}
   {normal_text: }
   *normal_command@dotless C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container C1
     {normal_text:i}
   {normal_text: }
   *normal_command@udotaccent C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container C1
     {normal_text:r}
   {normal_text: }
   *normal_command@v C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container C1
     *normal_command@\' C1 punctuation_small_case_accents_latin1.texi:l22
      *brace_container C1
       {normal_text:r}
   {normal_text: }
   *normal_command@= C1 punctuation_small_case_accents_latin1.texi:l22
    *brace_container C1
     *normal_command@, C1 punctuation_small_case_accents_latin1.texi:l22
      *brace_container C1
       *normal_command@~ C1 punctuation_small_case_accents_latin1.texi:l22
        *brace_container C1
         {normal_text:n}
   {normal_text:.\\n}
   *normal_command@equiv C1 punctuation_small_case_accents_latin1.texi:l23
    *brace_container
   {normal_text:\\n}
   *normal_command@sc C1 punctuation_small_case_accents_latin1.texi:l24
    *brace_container C17
     *normal_command@aa C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container
     {normal_text: }
     *normal_command@AA C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container
     {normal_text: }
     *normal_command@^ C1 punctuation_small_case_accents_latin1.texi:l24
      *following_arg C1
       {normal_text:e}
     {normal_text: }
     *normal_command@^ C1 punctuation_small_case_accents_latin1.texi:l24
      *following_arg C1
       {normal_text:E}
     {normal_text: é }
     *normal_command@~ C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container C1
       *normal_command@dotless C1 punctuation_small_case_accents_latin1.texi:l24
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *normal_command@dotless C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container C1
       {normal_text:i}
     {normal_text: }
     *normal_command@udotaccent C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container C1
       {normal_text:r}
     {normal_text: }
     *normal_command@v C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container C1
       *normal_command@\' C1 punctuation_small_case_accents_latin1.texi:l24
        *brace_container C1
         {normal_text:r}
     {normal_text: }
     *normal_command@= C1 punctuation_small_case_accents_latin1.texi:l24
      *brace_container C1
       *normal_command@, C1 punctuation_small_case_accents_latin1.texi:l24
        *brace_container C1
         *normal_command@~ C1 punctuation_small_case_accents_latin1.texi:l24
          *brace_container C1
           {normal_text:n}
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'punctuation_sc_accents_to_utf8_ascii_glyph_latin1'} = '\\input texinfo

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


$result_texts{'punctuation_sc_accents_to_utf8_ascii_glyph_latin1'} = '
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

$result_errors{'punctuation_sc_accents_to_utf8_ascii_glyph_latin1'} = '';

$result_nodes_list{'punctuation_sc_accents_to_utf8_ascii_glyph_latin1'} = '1|top
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

$result_sections_list{'punctuation_sc_accents_to_utf8_ascii_glyph_latin1'} = '1|top section
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

$result_sectioning_root{'punctuation_sc_accents_to_utf8_ascii_glyph_latin1'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'punctuation_sc_accents_to_utf8_ascii_glyph_latin1'} = '';

1;
