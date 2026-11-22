use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_deftypefnnewline'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C4
   *normal_command@setfilename C1 l1
   |text_arg:{test_deftypefnnewline.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:test_deftypefnnewline.info}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@deftypefnnewline C1 l3
   |global_command_number:{1}
   |misc_args:A{on}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:on}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l5 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l6 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l8 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C31 l9 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefun C3 l11
   *def_line C1 l11
   |def_command:{deftypefun}
   |element_node:{chapter}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deftypefun}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:data-type}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:arguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@end C1 l13
   |text_arg:{deftypefun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefn C3 l15
   *def_line C1 l15
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypefn_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypefn no arg\\n}
   *normal_command@end C1 l17
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypeop C3 l19
   *def_line C1 l19
   |def_command:{deftypeop}
   |element_node:{chapter}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypeop_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypeop\\n}
   *normal_command@end C1 l21
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypeop C3 l23
   *def_line C1 l23
   |def_command:{deftypeop}
   |element_node:{chapter}
   |index_entry:I{fn,4}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypeop_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypeop no arg\\n}
   *normal_command@end C1 l25
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypecv C3 l27
   *def_line C1 l27
   |def_command:{deftypecv}
   |element_node:{chapter}
   |index_entry:I{vr,1}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypecv_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypecv\\n}
   *normal_command@end C1 l29
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypecv C3 l31
   *def_line C1 l31
   |def_command:{deftypecv}
   |element_node:{chapter}
   |index_entry:I{vr,2}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypecv_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypecv with arguments\\n}
   *normal_command@end C1 l33
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l35
   *def_line C1 l35
   |def_command:{deffn}
   |element_node:{chapter}
   |index_entry:I{fn,5}
   |original_def_cmdname:{deffn}
    *block_line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:fun}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:arg}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:fff\\n}
   *normal_command@end C1 l37
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefnnewline C1 l39
  |global_command_number:{2}
  |misc_args:A{off}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:off}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefun C3 l41
   *def_line C1 l41
   |def_command:{deftypefun}
   |element_node:{chapter}
   |index_entry:I{fn,6}
   |original_def_cmdname:{deftypefun}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:data-type2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:name2}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:arguments2...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:aaa2\\n}
   *normal_command@end C1 l43
   |text_arg:{deftypefun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefn C3 l45
   *def_line C1 l45
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,7}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypefn_name2}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypefn no arg2\\n}
   *normal_command@end C1 l47
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypeop C3 l49
   *def_line C1 l49
   |def_command:{deftypeop}
   |element_node:{chapter}
   |index_entry:I{fn,8}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory2}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypeop_name2}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:a--rguments2...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypeop2\\n}
   *normal_command@end C1 l51
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypeop C3 l53
   *def_line C1 l53
   |def_command:{deftypeop}
   |element_node:{chapter}
   |index_entry:I{fn,9}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory2}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypeop_name2}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypeop no arg2\\n}
   *normal_command@end C1 l55
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypecv C3 l57
   *def_line C1 l57
   |def_command:{deftypecv}
   |element_node:{chapter}
   |index_entry:I{vr,3}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory2}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypecv_name2}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypecv2\\n}
   *normal_command@end C1 l59
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypecv C3 l61
   *def_line C1 l61
   |def_command:{deftypecv}
   |element_node:{chapter}
   |index_entry:I{vr,4}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory2}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypecv_name2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rguments2...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypecv with arguments2\\n}
   *normal_command@end C1 l63
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l65
   *def_line C1 l65
   |def_command:{deffn}
   |element_node:{chapter}
   |index_entry:I{fn,10}
   |original_def_cmdname:{deffn}
    *block_line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:fun2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:arg2}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:fff2\\n}
   *normal_command@end C1 l67
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'test_deftypefnnewline'} = '@setfilename test_deftypefnnewline.info

@deftypefnnewline on

@node Top
@top top

@node chapter
@chapter chap

@deftypefun data-type name arguments...
aaa
@end deftypefun

@deftypefn c--ategory t--ype d--eftypefn_name
d--eftypefn no arg
@end deftypefn

@deftypeop c--ategory c--lass t--ype d--eftypeop_name a--rguments...
d--eftypeop
@end deftypeop

@deftypeop c--ategory c--lass t--ype d--eftypeop_name
d--eftypeop no arg
@end deftypeop

@deftypecv c--ategory c--lass t--ype d--eftypecv_name
d--eftypecv
@end deftypecv

@deftypecv c--ategory c--lass t--ype d--eftypecv_name a--rguments...
d--eftypecv with arguments
@end deftypecv

@deffn fun arg
fff
@end deffn

@deftypefnnewline off

@deftypefun data-type2 name2 arguments2...
aaa2
@end deftypefun

@deftypefn c--ategory2 t--ype2 d--eftypefn_name2
d--eftypefn no arg2
@end deftypefn

@deftypeop c--ategory2 c--lass2 t--ype2 d--eftypeop_name2 a--rguments2...
d--eftypeop2
@end deftypeop

@deftypeop c--ategory2 c--lass2 t--ype2 d--eftypeop_name2
d--eftypeop no arg2
@end deftypeop

@deftypecv c--ategory2 c--lass2 t--ype2 d--eftypecv_name2
d--eftypecv2
@end deftypecv

@deftypecv c--ategory2 c--lass2 t--ype2 d--eftypecv_name2 a--rguments2...
d--eftypecv with arguments2
@end deftypecv

@deffn fun2 arg2
fff2
@end deffn
';


$result_texts{'test_deftypefnnewline'} = '

top
***

1 chap
******

Function: data-type name arguments...
aaa

c--ategory: t--ype d--eftypefn_name
d-eftypefn no arg

c--ategory on c--lass: t--ype d--eftypeop_name a--rguments...
d-eftypeop

c--ategory on c--lass: t--ype d--eftypeop_name
d-eftypeop no arg

c--ategory of c--lass: t--ype d--eftypecv_name
d-eftypecv

c--ategory of c--lass: t--ype d--eftypecv_name a--rguments...
d-eftypecv with arguments

fun: arg
fff


Function: data-type2 name2 arguments2...
aaa2

c--ategory2: t--ype2 d--eftypefn_name2
d-eftypefn no arg2

c--ategory2 on c--lass2: t--ype2 d--eftypeop_name2 a--rguments2...
d-eftypeop2

c--ategory2 on c--lass2: t--ype2 d--eftypeop_name2
d-eftypeop no arg2

c--ategory2 of c--lass2: t--ype2 d--eftypecv_name2
d-eftypecv2

c--ategory2 of c--lass2: t--ype2 d--eftypecv_name2 a--rguments2...
d-eftypecv with arguments2

fun2: arg2
fff2
';

$result_errors{'test_deftypefnnewline'} = '';

$result_nodes_list{'test_deftypefnnewline'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'test_deftypefnnewline'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'test_deftypefnnewline'} = 'level: -1
list:
 1|top
';

$result_headings_list{'test_deftypefnnewline'} = '';

$result_indices_sort_strings{'test_deftypefnnewline'} = 'fn:
 arg
 arg2
 d--eftypefn_name
 d--eftypefn_name2
 d--eftypeop_name on c--lass
 d--eftypeop_name on c--lass
 d--eftypeop_name2 on c--lass2
 d--eftypeop_name2 on c--lass2
 name
 name2
vr:
 d--eftypecv_name of c--lass
 d--eftypecv_name of c--lass
 d--eftypecv_name2 of c--lass2
 d--eftypecv_name2 of c--lass2
';


$result_converted{'plaintext'}->{'test_deftypefnnewline'} = 'top
***

1 chap
******

 -- Function:
          data-type
          name arguments...
     aaa

 -- c-ategory:
          t--ype
          d--eftypefn_name
     d-eftypefn no arg

 -- c-ategory on c--lass:
          t--ype
          d--eftypeop_name a--rguments...
     d-eftypeop

 -- c-ategory on c--lass:
          t--ype
          d--eftypeop_name
     d-eftypeop no arg

 -- c-ategory of c--lass: t--ype d--eftypecv_name
     d-eftypecv

 -- c-ategory of c--lass: t--ype d--eftypecv_name a--rguments...
     d-eftypecv with arguments

 -- fun: arg
     fff

 -- Function: data-type2 name2 arguments2...
     aaa2

 -- c-ategory2: t--ype2 d--eftypefn_name2
     d-eftypefn no arg2

 -- c-ategory2 on c--lass2: t--ype2 d--eftypeop_name2 a--rguments2...
     d-eftypeop2

 -- c-ategory2 on c--lass2: t--ype2 d--eftypeop_name2
     d-eftypeop no arg2

 -- c-ategory2 of c--lass2: t--ype2 d--eftypecv_name2
     d-eftypecv2

 -- c-ategory2 of c--lass2: t--ype2 d--eftypecv_name2 a--rguments2...
     d-eftypecv with arguments2

 -- fun2: arg2
     fff2
';

$result_converted_sort_strings{'plaintext'}->{'test_deftypefnnewline'} = 'fn:
 arg
 arg2
 d--eftypefn_name
 d--eftypefn_name2
 d--eftypeop_name on c--lass
 d--eftypeop_name on c--lass
 d--eftypeop_name2 on c--lass2
 d--eftypeop_name2 on c--lass2
 name
 name2
vr:
 d--eftypecv_name of c--lass
 d--eftypecv_name of c--lass
 d--eftypecv_name2 of c--lass2
 d--eftypecv_name2 of c--lass2
';


$result_converted{'html_text'}->{'test_deftypefnnewline'} = '

<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<dl class="first-deftypefn first-deftypefun-alias-first-deftypefn def-block">
<dt class="deftypefn deftypefun-alias-deftypefn def-line" id="index-name"><span class="category-def">Function:<br> </span><span><code class="def-type">data-type</code><br> <strong class="def-name">name</strong> <code class="def-code-arguments">arguments...</code><a class="copiable-link" href="#index-name"> &para;</a></span></dt>
<dd><p>aaa
</p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-d_002d_002deftypefn_005fname"><span class="category-def">c&ndash;ategory:<br> </span><span><code class="def-type">t--ype</code><br> <strong class="def-name">d--eftypefn_name</strong><a class="copiable-link" href="#index-d_002d_002deftypefn_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;eftypefn no arg
</p></dd></dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-d_002d_002deftypeop_005fname-on-c_002d_002dlass"><span class="category-def">c&ndash;ategory on <code class="code">c--lass</code>:<br> </span><span><code class="def-type">t--ype</code><br> <strong class="def-name">d--eftypeop_name</strong> <code class="def-code-arguments">a--rguments...</code><a class="copiable-link" href="#index-d_002d_002deftypeop_005fname-on-c_002d_002dlass"> &para;</a></span></dt>
<dd><p>d&ndash;eftypeop
</p></dd></dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-d_002d_002deftypeop_005fname-on-c_002d_002dlass-1"><span class="category-def">c&ndash;ategory on <code class="code">c--lass</code>:<br> </span><span><code class="def-type">t--ype</code><br> <strong class="def-name">d--eftypeop_name</strong><a class="copiable-link" href="#index-d_002d_002deftypeop_005fname-on-c_002d_002dlass-1"> &para;</a></span></dt>
<dd><p>d&ndash;eftypeop no arg
</p></dd></dl>

<dl class="first-deftypecv def-block">
<dt class="deftypecv def-line" id="index-d_002d_002deftypecv_005fname-of-c_002d_002dlass"><span class="category-def">c&ndash;ategory of <code class="code">c--lass</code>: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypecv_name</strong><a class="copiable-link" href="#index-d_002d_002deftypecv_005fname-of-c_002d_002dlass"> &para;</a></span></dt>
<dd><p>d&ndash;eftypecv
</p></dd></dl>

<dl class="first-deftypecv def-block">
<dt class="deftypecv def-line" id="index-d_002d_002deftypecv_005fname-of-c_002d_002dlass-1"><span class="category-def">c&ndash;ategory of <code class="code">c--lass</code>: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypecv_name</strong> <code class="def-code-arguments">a--rguments...</code><a class="copiable-link" href="#index-d_002d_002deftypecv_005fname-of-c_002d_002dlass-1"> &para;</a></span></dt>
<dd><p>d&ndash;eftypecv with arguments
</p></dd></dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-arg"><span class="category-def">fun: </span><span><strong class="def-name">arg</strong><a class="copiable-link" href="#index-arg"> &para;</a></span></dt>
<dd><p>fff
</p></dd></dl>


<dl class="first-deftypefn first-deftypefun-alias-first-deftypefn def-block">
<dt class="deftypefn deftypefun-alias-deftypefn def-line" id="index-name2"><span class="category-def">Function: </span><span><code class="def-type">data-type2</code> <strong class="def-name">name2</strong> <code class="def-code-arguments">arguments2...</code><a class="copiable-link" href="#index-name2"> &para;</a></span></dt>
<dd><p>aaa2
</p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-d_002d_002deftypefn_005fname2"><span class="category-def">c&ndash;ategory2: </span><span><code class="def-type">t--ype2</code> <strong class="def-name">d--eftypefn_name2</strong><a class="copiable-link" href="#index-d_002d_002deftypefn_005fname2"> &para;</a></span></dt>
<dd><p>d&ndash;eftypefn no arg2
</p></dd></dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-d_002d_002deftypeop_005fname2-on-c_002d_002dlass2"><span class="category-def">c&ndash;ategory2 on <code class="code">c--lass2</code>: </span><span><code class="def-type">t--ype2</code> <strong class="def-name">d--eftypeop_name2</strong> <code class="def-code-arguments">a--rguments2...</code><a class="copiable-link" href="#index-d_002d_002deftypeop_005fname2-on-c_002d_002dlass2"> &para;</a></span></dt>
<dd><p>d&ndash;eftypeop2
</p></dd></dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-d_002d_002deftypeop_005fname2-on-c_002d_002dlass2-1"><span class="category-def">c&ndash;ategory2 on <code class="code">c--lass2</code>: </span><span><code class="def-type">t--ype2</code> <strong class="def-name">d--eftypeop_name2</strong><a class="copiable-link" href="#index-d_002d_002deftypeop_005fname2-on-c_002d_002dlass2-1"> &para;</a></span></dt>
<dd><p>d&ndash;eftypeop no arg2
</p></dd></dl>

<dl class="first-deftypecv def-block">
<dt class="deftypecv def-line" id="index-d_002d_002deftypecv_005fname2-of-c_002d_002dlass2"><span class="category-def">c&ndash;ategory2 of <code class="code">c--lass2</code>: </span><span><code class="def-type">t--ype2</code> <strong class="def-name">d--eftypecv_name2</strong><a class="copiable-link" href="#index-d_002d_002deftypecv_005fname2-of-c_002d_002dlass2"> &para;</a></span></dt>
<dd><p>d&ndash;eftypecv2
</p></dd></dl>

<dl class="first-deftypecv def-block">
<dt class="deftypecv def-line" id="index-d_002d_002deftypecv_005fname2-of-c_002d_002dlass2-1"><span class="category-def">c&ndash;ategory2 of <code class="code">c--lass2</code>: </span><span><code class="def-type">t--ype2</code> <strong class="def-name">d--eftypecv_name2</strong> <code class="def-code-arguments">a--rguments2...</code><a class="copiable-link" href="#index-d_002d_002deftypecv_005fname2-of-c_002d_002dlass2-1"> &para;</a></span></dt>
<dd><p>d&ndash;eftypecv with arguments2
</p></dd></dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-arg2"><span class="category-def">fun2: </span><span><strong class="def-name">arg2</strong><a class="copiable-link" href="#index-arg2"> &para;</a></span></dt>
<dd><p>fff2
</p></dd></dl>
</div>
</div>
';


$result_converted{'xml'}->{'test_deftypefnnewline'} = '<setfilename file="test_deftypefnnewline.info"> test_deftypefnnewline.info</setfilename>

<deftypefnnewline value="on" line=" on"></deftypefnnewline>

<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap</sectiontitle>

<deftypefun endspaces=" "><definitionterm><indexterm index="fn" number="1">name</indexterm> <defcategory automatic="on">Function</defcategory> <deftype>data-type</deftype> <deffunction>name</deffunction> <defparamtype>arguments...</defparamtype></definitionterm>
<definitionitem><para>aaa
</para></definitionitem></deftypefun>

<deftypefn endspaces=" "><definitionterm><indexterm index="fn" number="2">d--eftypefn_name</indexterm> <defcategory>c--ategory</defcategory> <deftype>t--ype</deftype> <deffunction>d--eftypefn_name</deffunction></definitionterm>
<definitionitem><para>d&textndash;eftypefn no arg
</para></definitionitem></deftypefn>

<deftypeop endspaces=" "><definitionterm><indexterm index="fn" number="3">d--eftypeop_name on c--lass</indexterm> <defcategory>c--ategory</defcategory> <defclass>c--lass</defclass> <deftype>t--ype</deftype> <defoperation>d--eftypeop_name</defoperation> <defparamtype>a--rguments...</defparamtype></definitionterm>
<definitionitem><para>d&textndash;eftypeop
</para></definitionitem></deftypeop>

<deftypeop endspaces=" "><definitionterm><indexterm index="fn" number="4">d--eftypeop_name on c--lass</indexterm> <defcategory>c--ategory</defcategory> <defclass>c--lass</defclass> <deftype>t--ype</deftype> <defoperation>d--eftypeop_name</defoperation></definitionterm>
<definitionitem><para>d&textndash;eftypeop no arg
</para></definitionitem></deftypeop>

<deftypecv endspaces=" "><definitionterm><indexterm index="vr" number="1">d--eftypecv_name of c--lass</indexterm> <defcategory>c--ategory</defcategory> <defclass>c--lass</defclass> <deftype>t--ype</deftype> <defclassvar>d--eftypecv_name</defclassvar></definitionterm>
<definitionitem><para>d&textndash;eftypecv
</para></definitionitem></deftypecv>

<deftypecv endspaces=" "><definitionterm><indexterm index="vr" number="2">d--eftypecv_name of c--lass</indexterm> <defcategory>c--ategory</defcategory> <defclass>c--lass</defclass> <deftype>t--ype</deftype> <defclassvar>d--eftypecv_name</defclassvar> <defparam>a--rguments...</defparam></definitionterm>
<definitionitem><para>d&textndash;eftypecv with arguments
</para></definitionitem></deftypecv>

<deffn endspaces=" "><definitionterm><indexterm index="fn" number="5">arg</indexterm> <defcategory>fun</defcategory> <deffunction>arg</deffunction></definitionterm>
<definitionitem><para>fff
</para></definitionitem></deffn>

<deftypefnnewline value="off" line=" off"></deftypefnnewline>

<deftypefun endspaces=" "><definitionterm><indexterm index="fn" number="6">name2</indexterm> <defcategory automatic="on">Function</defcategory> <deftype>data-type2</deftype> <deffunction>name2</deffunction> <defparamtype>arguments2...</defparamtype></definitionterm>
<definitionitem><para>aaa2
</para></definitionitem></deftypefun>

<deftypefn endspaces=" "><definitionterm><indexterm index="fn" number="7">d--eftypefn_name2</indexterm> <defcategory>c--ategory2</defcategory> <deftype>t--ype2</deftype> <deffunction>d--eftypefn_name2</deffunction></definitionterm>
<definitionitem><para>d&textndash;eftypefn no arg2
</para></definitionitem></deftypefn>

<deftypeop endspaces=" "><definitionterm><indexterm index="fn" number="8">d--eftypeop_name2 on c--lass2</indexterm> <defcategory>c--ategory2</defcategory> <defclass>c--lass2</defclass> <deftype>t--ype2</deftype> <defoperation>d--eftypeop_name2</defoperation> <defparamtype>a--rguments2...</defparamtype></definitionterm>
<definitionitem><para>d&textndash;eftypeop2
</para></definitionitem></deftypeop>

<deftypeop endspaces=" "><definitionterm><indexterm index="fn" number="9">d--eftypeop_name2 on c--lass2</indexterm> <defcategory>c--ategory2</defcategory> <defclass>c--lass2</defclass> <deftype>t--ype2</deftype> <defoperation>d--eftypeop_name2</defoperation></definitionterm>
<definitionitem><para>d&textndash;eftypeop no arg2
</para></definitionitem></deftypeop>

<deftypecv endspaces=" "><definitionterm><indexterm index="vr" number="3">d--eftypecv_name2 of c--lass2</indexterm> <defcategory>c--ategory2</defcategory> <defclass>c--lass2</defclass> <deftype>t--ype2</deftype> <defclassvar>d--eftypecv_name2</defclassvar></definitionterm>
<definitionitem><para>d&textndash;eftypecv2
</para></definitionitem></deftypecv>

<deftypecv endspaces=" "><definitionterm><indexterm index="vr" number="4">d--eftypecv_name2 of c--lass2</indexterm> <defcategory>c--ategory2</defcategory> <defclass>c--lass2</defclass> <deftype>t--ype2</deftype> <defclassvar>d--eftypecv_name2</defclassvar> <defparam>a--rguments2...</defparam></definitionterm>
<definitionitem><para>d&textndash;eftypecv with arguments2
</para></definitionitem></deftypecv>

<deffn endspaces=" "><definitionterm><indexterm index="fn" number="10">arg2</indexterm> <defcategory>fun2</defcategory> <deffunction>arg2</deffunction></definitionterm>
<definitionitem><para>fff2
</para></definitionitem></deffn>
</chapter>
';


$result_converted{'docbook'}->{'test_deftypefnnewline'} = '<chapter label="1" id="chapter">
<title>chap</title>

<synopsis><indexterm role="fn"><primary>name</primary></indexterm><phrase role="category"><emphasis role="bold">Function</emphasis>:</phrase> <returnvalue>data-type</returnvalue> <function>name</function> <type>arguments...</type></synopsis>
<blockquote><para>aaa
</para></blockquote>
<synopsis><indexterm role="fn"><primary>d--eftypefn_name</primary></indexterm><phrase role="category"><emphasis role="bold">c--ategory</emphasis>:</phrase> <returnvalue>t--ype</returnvalue> <function>d--eftypefn_name</function></synopsis>
<blockquote><para>d&#8211;eftypefn no arg
</para></blockquote>
<synopsis><indexterm role="fn"><primary>d--eftypeop_name on c--lass</primary></indexterm><phrase role="category"><emphasis role="bold">c--ategory</emphasis>:</phrase> <ooclass><classname>c--lass</classname></ooclass> <returnvalue>t--ype</returnvalue> <methodname>d--eftypeop_name</methodname> <type>a--rguments...</type></synopsis>
<blockquote><para>d&#8211;eftypeop
</para></blockquote>
<synopsis><indexterm role="fn"><primary>d--eftypeop_name on c--lass</primary></indexterm><phrase role="category"><emphasis role="bold">c--ategory</emphasis>:</phrase> <ooclass><classname>c--lass</classname></ooclass> <returnvalue>t--ype</returnvalue> <methodname>d--eftypeop_name</methodname></synopsis>
<blockquote><para>d&#8211;eftypeop no arg
</para></blockquote>
<synopsis><indexterm role="vr"><primary>d--eftypecv_name of c--lass</primary></indexterm><phrase role="category"><emphasis role="bold">c--ategory</emphasis>:</phrase> <ooclass><classname>c--lass</classname></ooclass> <returnvalue>t--ype</returnvalue> <property>d--eftypecv_name</property></synopsis>
<blockquote><para>d&#8211;eftypecv
</para></blockquote>
<synopsis><indexterm role="vr"><primary>d--eftypecv_name of c--lass</primary></indexterm><phrase role="category"><emphasis role="bold">c--ategory</emphasis>:</phrase> <ooclass><classname>c--lass</classname></ooclass> <returnvalue>t--ype</returnvalue> <property>d--eftypecv_name</property> <emphasis role="arg">a--rguments...</emphasis></synopsis>
<blockquote><para>d&#8211;eftypecv with arguments
</para></blockquote>
<synopsis><indexterm role="fn"><primary>arg</primary></indexterm><phrase role="category"><emphasis role="bold">fun</emphasis>:</phrase> <function>arg</function></synopsis>
<blockquote><para>fff
</para></blockquote>

<synopsis><indexterm role="fn"><primary>name2</primary></indexterm><phrase role="category"><emphasis role="bold">Function</emphasis>:</phrase> <returnvalue>data-type2</returnvalue> <function>name2</function> <type>arguments2...</type></synopsis>
<blockquote><para>aaa2
</para></blockquote>
<synopsis><indexterm role="fn"><primary>d--eftypefn_name2</primary></indexterm><phrase role="category"><emphasis role="bold">c--ategory2</emphasis>:</phrase> <returnvalue>t--ype2</returnvalue> <function>d--eftypefn_name2</function></synopsis>
<blockquote><para>d&#8211;eftypefn no arg2
</para></blockquote>
<synopsis><indexterm role="fn"><primary>d--eftypeop_name2 on c--lass2</primary></indexterm><phrase role="category"><emphasis role="bold">c--ategory2</emphasis>:</phrase> <ooclass><classname>c--lass2</classname></ooclass> <returnvalue>t--ype2</returnvalue> <methodname>d--eftypeop_name2</methodname> <type>a--rguments2...</type></synopsis>
<blockquote><para>d&#8211;eftypeop2
</para></blockquote>
<synopsis><indexterm role="fn"><primary>d--eftypeop_name2 on c--lass2</primary></indexterm><phrase role="category"><emphasis role="bold">c--ategory2</emphasis>:</phrase> <ooclass><classname>c--lass2</classname></ooclass> <returnvalue>t--ype2</returnvalue> <methodname>d--eftypeop_name2</methodname></synopsis>
<blockquote><para>d&#8211;eftypeop no arg2
</para></blockquote>
<synopsis><indexterm role="vr"><primary>d--eftypecv_name2 of c--lass2</primary></indexterm><phrase role="category"><emphasis role="bold">c--ategory2</emphasis>:</phrase> <ooclass><classname>c--lass2</classname></ooclass> <returnvalue>t--ype2</returnvalue> <property>d--eftypecv_name2</property></synopsis>
<blockquote><para>d&#8211;eftypecv2
</para></blockquote>
<synopsis><indexterm role="vr"><primary>d--eftypecv_name2 of c--lass2</primary></indexterm><phrase role="category"><emphasis role="bold">c--ategory2</emphasis>:</phrase> <ooclass><classname>c--lass2</classname></ooclass> <returnvalue>t--ype2</returnvalue> <property>d--eftypecv_name2</property> <emphasis role="arg">a--rguments2...</emphasis></synopsis>
<blockquote><para>d&#8211;eftypecv with arguments2
</para></blockquote>
<synopsis><indexterm role="fn"><primary>arg2</primary></indexterm><phrase role="category"><emphasis role="bold">fun2</emphasis>:</phrase> <function>arg2</function></synopsis>
<blockquote><para>fff2
</para></blockquote></chapter>
';


$result_converted{'latex_text'}->{'test_deftypefnnewline'} = '

\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{chap}}
\\label{anchor:chapter}%


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{data-type}& [Function]\\\\
\\texttt{name arguments...}\\end{tabularx}

\\index[fn]{name@\\texttt{name}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
aaa
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{t{-}{-}ype}& [c--ategory]\\\\
\\texttt{d{-}{-}eftypefn\\_name}\\end{tabularx}

\\index[fn]{d--eftypefn\\_name@\\texttt{d{-}{-}eftypefn\\_name}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
d--eftypefn no arg
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{t{-}{-}ype}& [c--ategory on \\texttt{c{-}{-}lass}]\\\\
\\texttt{d{-}{-}eftypeop\\_name a{-}{-}rguments...}\\end{tabularx}

\\index[fn]{d--eftypeop\\_name on c--lass@\\texttt{d{-}{-}eftypeop\\_name\\ on c{-}{-}lass}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
d--eftypeop
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{t{-}{-}ype}& [c--ategory on \\texttt{c{-}{-}lass}]\\\\
\\texttt{d{-}{-}eftypeop\\_name}\\end{tabularx}

\\index[fn]{d--eftypeop\\_name on c--lass@\\texttt{d{-}{-}eftypeop\\_name\\ on c{-}{-}lass}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
d--eftypeop no arg
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{t{-}{-}ype d{-}{-}eftypecv\\_name}& [c--ategory of \\texttt{c{-}{-}lass}]
\\end{tabularx}

\\index[vr]{d--eftypecv\\_name of c--lass@\\texttt{d{-}{-}eftypecv\\_name\\ of c{-}{-}lass}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
d--eftypecv
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{t{-}{-}ype d{-}{-}eftypecv\\_name a{-}{-}rguments...}& [c--ategory of \\texttt{c{-}{-}lass}]
\\end{tabularx}

\\index[vr]{d--eftypecv\\_name of c--lass@\\texttt{d{-}{-}eftypecv\\_name\\ of c{-}{-}lass}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
d--eftypecv with arguments
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{arg}& [fun]
\\end{tabularx}

\\index[fn]{arg@\\texttt{arg}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
fff
\\end{Texinfoindented}



\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{data-type2 name2 arguments2...}& [Function]
\\end{tabularx}

\\index[fn]{name2@\\texttt{name2}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
aaa2
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{t{-}{-}ype2 d{-}{-}eftypefn\\_name2}& [c--ategory2]
\\end{tabularx}

\\index[fn]{d--eftypefn\\_name2@\\texttt{d{-}{-}eftypefn\\_name2}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
d--eftypefn no arg2
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{t{-}{-}ype2 d{-}{-}eftypeop\\_name2 a{-}{-}rguments2...}& [c--ategory2 on \\texttt{c{-}{-}lass2}]
\\end{tabularx}

\\index[fn]{d--eftypeop\\_name2 on c--lass2@\\texttt{d{-}{-}eftypeop\\_name2\\ on c{-}{-}lass2}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
d--eftypeop2
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{t{-}{-}ype2 d{-}{-}eftypeop\\_name2}& [c--ategory2 on \\texttt{c{-}{-}lass2}]
\\end{tabularx}

\\index[fn]{d--eftypeop\\_name2 on c--lass2@\\texttt{d{-}{-}eftypeop\\_name2\\ on c{-}{-}lass2}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
d--eftypeop no arg2
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{t{-}{-}ype2 d{-}{-}eftypecv\\_name2}& [c--ategory2 of \\texttt{c{-}{-}lass2}]
\\end{tabularx}

\\index[vr]{d--eftypecv\\_name2 of c--lass2@\\texttt{d{-}{-}eftypecv\\_name2\\ of c{-}{-}lass2}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
d--eftypecv2
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{t{-}{-}ype2 d{-}{-}eftypecv\\_name2 a{-}{-}rguments2...}& [c--ategory2 of \\texttt{c{-}{-}lass2}]
\\end{tabularx}

\\index[vr]{d--eftypecv\\_name2 of c--lass2@\\texttt{d{-}{-}eftypecv\\_name2\\ of c{-}{-}lass2}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
d--eftypecv with arguments2
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{arg2}& [fun2]
\\end{tabularx}

\\index[fn]{arg2@\\texttt{arg2}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
fff2
\\end{Texinfoindented}
';

1;
