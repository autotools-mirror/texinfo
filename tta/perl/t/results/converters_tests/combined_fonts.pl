use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'combined_fonts'} = '*document_root C5
 *before_node_section C1
  *preamble C2
   *normal_command@setfilename C1 l1
   |text_arg:{combined_fonts.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:combined_fonts.info}
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
 *normal_command@top C2 l4 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
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
 *normal_command@chapter C15 l7 {chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C12
   *normal_command@code C1 l9
    *brace_container C1
     {normal_text:c--ode}
   {normal_text:, }
   *normal_command@dfn C1 l9
    *brace_container C1
     {normal_text:d--fn}
   {normal_text:, }
   *normal_command@var C1 l9
    *brace_container C1
     {normal_text:v--ar}
   {normal_text:, }
   *normal_command@strong C1 l9
    *brace_container C1
     {normal_text:s--trong}
   {normal_text:, }
   *normal_command@kbd C1 l9
    *brace_container C1
     {normal_text:k--bd}
   {normal_text:, }
   *normal_command@samp C1 l9
    *brace_container C1
     {normal_text:s--amp}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C12
   *normal_command@code C1 l11
    *brace_container C1
     *normal_command@dfn C1 l11
      *brace_container C1
       {normal_text:d--fn in code}
   {normal_text:\\n}
   *normal_command@var C1 l12
    *brace_container C1
     *normal_command@code C1 l12
      *brace_container C1
       {normal_text:c--ode in var}
   {normal_text:\\n}
   *normal_command@code C1 l13
    *brace_container C1
     *normal_command@var C1 l13
      *brace_container C1
       {normal_text:v--ar in code}
   {normal_text:\\n}
   *normal_command@strong C1 l14
    *brace_container C1
     *normal_command@kbd C1 l14
      *brace_container C1
       {normal_text:k--bd in strong}
   {normal_text:\\n}
   *normal_command@samp C1 l15
    *brace_container C1
     *normal_command@strong C1 l15
      *brace_container C1
       {normal_text:s--trong in samp}
   {normal_text:\\n}
   *normal_command@strong C1 l16
    *brace_container C1
     *normal_command@samp C1 l16
      *brace_container C1
       {normal_text:s--amp in strong}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@cite C1 l18
    *brace_container C1
     {normal_text:c--ite}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C4
   *normal_command@code C1 l20
    *brace_container C1
     *normal_command@cite C1 l20
      *brace_container C1
       {normal_text:c--ite in code}
   {normal_text:\\n}
   *normal_command@cite C1 l21
    *brace_container C1
     *normal_command@code C1 l21
      *brace_container C1
       {normal_text:c--ode in cite}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C8
   *normal_command@code C1 l23
    *brace_container C1
     {normal_text:c--ode}
   {normal_text: }
   *normal_command@slanted C1 l23
    *brace_container C1
     {normal_text:s--lanted}
   {normal_text: }
   *normal_command@b C1 l23
    *brace_container C1
     {normal_text:b--}
   {normal_text: }
   *normal_command@t C1 l23
    *brace_container C1
     {normal_text:t--}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C16
   *normal_command@code C1 l25
    *brace_container C1
     *normal_command@slanted C1 l25
      *brace_container C1
       {normal_text:s--lanted in code}
   {normal_text:\\n}
   *normal_command@slanted C1 l26
    *brace_container C1
     *normal_command@code C1 l26
      *brace_container C1
       {normal_text:c--ode in slanted}
   {normal_text:\\n}
   *normal_command@b C1 l27
    *brace_container C1
     *normal_command@slanted C1 l27
      *brace_container C1
       {normal_text:s--lanted in b}
   {normal_text:\\n}
   *normal_command@slanted C1 l28
    *brace_container C1
     *normal_command@b C1 l28
      *brace_container C1
       {normal_text:b-- in slanted}
   {normal_text:\\n}
   *normal_command@t C1 l29
    *brace_container C1
     *normal_command@slanted C1 l29
      *brace_container C1
       {normal_text:s--lanted in t}
   {normal_text:\\n}
   *normal_command@slanted C1 l30
    *brace_container C1
     *normal_command@t C1 l30
      *brace_container C1
       {normal_text:t-- in slanted}
   {normal_text:\\n}
   *normal_command@t C1 l31
    *brace_container C1
     *normal_command@var C1 l31
      *brace_container C1
       {normal_text:v--ar in t}
   {normal_text:\\n}
   *normal_command@var C1 l32
    *brace_container C1
     *normal_command@t C1 l32
      *brace_container C1
       {normal_text:t-- in var}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l34
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C4
    *normal_command@var C1 l35
     *brace_container C1
      {normal_text:v--ar in example}
    {normal_text:\\n}
    *normal_command@cite C1 l36
     *brace_container C1
      {normal_text:c--ite in example}
    {normal_text:\\n}
   *normal_command@end C1 l37
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'combined_fonts'} = '@setfilename combined_fonts.info

@node Top
@top top section

@node chapter
@chapter chapter

@code{c--ode}, @dfn{d--fn}, @var{v--ar}, @strong{s--trong}, @kbd{k--bd}, @samp{s--amp}.

@code{@dfn{d--fn in code}}
@var{@code{c--ode in var}}
@code{@var{v--ar in code}}
@strong{@kbd{k--bd in strong}}
@samp{@strong{s--trong in samp}}
@strong{@samp{s--amp in strong}}

@cite{c--ite}

@code{@cite{c--ite in code}}
@cite{@code{c--ode in cite}}

@code{c--ode} @slanted{s--lanted} @b{b--} @t{t--}

@code{@slanted{s--lanted in code}}
@slanted{@code{c--ode in slanted}}
@b{@slanted{s--lanted in b}}
@slanted{@b{b-- in slanted}}
@t{@slanted{s--lanted in t}}
@slanted{@t{t-- in slanted}}
@t{@var{v--ar in t}}
@var{@t{t-- in var}}

@example
@var{v--ar in example}
@cite{c--ite in example}
@end example
';


$result_texts{'combined_fonts'} = '
top section
***********

1 chapter
*********

c--ode, d-fn, v-ar, s-trong, k--bd, s--amp.

d--fn in code
c--ode in var
v--ar in code
k--bd in strong
s--trong in samp
s--amp in strong

c-ite

c--ite in code
c--ode in cite

c--ode s-lanted b- t--

s--lanted in code
c--ode in slanted
s-lanted in b
b- in slanted
s--lanted in t
t-- in slanted
v--ar in t
t-- in var

v--ar in example
c--ite in example
';

$result_errors{'combined_fonts'} = '';

$result_nodes_list{'combined_fonts'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'combined_fonts'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'combined_fonts'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'combined_fonts'} = '';

1;
