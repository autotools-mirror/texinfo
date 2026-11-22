use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_alias_definfoenclose_defindex'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C42 l5 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l7
  |formal_args:A{arg}
  |macro_name:{phooindex}
   *arguments_line C1
    {macro_line: phooindex {arg}\\n}
   {raw:||\\arg\\||\\n}
   *normal_command@end C1 l9
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:||maa||\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@phooindex C1
     >*brace_arg C1
      >{macro_call_arg_text:maa}
   >macro_expansion<end;1><p:7>
  {empty_line:\\n}
  *normal_command@definfoenclose C1 l12
  |misc_args:A{phooindex|;|:}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:phooindex,;,:}
    {spaces_after_argument:\\n}
  *paragraph C2
   *definfoenclose_command@phooindex C1 l13
   |begin:{;}
   |end:{:}
    *brace_container C1
     {normal_text:dbb}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@alias C1 l15
  |misc_args:A{phooindex|strong}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:phooindex = strong}
    {spaces_after_argument:\\n}
  *paragraph C2
   *normal_command@strong C1 l16
   |alias_of:{phooindex}
    *brace_container C1
     {normal_text:acc}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@defindex C1 l18
  |misc_args:A{phoo}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:phoo}
    {spaces_after_argument:\\n}
  *index_entry_command@phooindex C1 l19
  |element_node:{chap}
  |index_entry:I{phoo,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:idd}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@definfoenclose C1 l21
  |misc_args:A{phooindex|;|:}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:phooindex,;,:}
    {spaces_after_argument:\\n}
  *paragraph C2
   *definfoenclose_command@phooindex C1 l22
   |begin:{;}
   |end:{:}
    *brace_container C1
     {normal_text:dee}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l24
  |formal_args:A{arg}
  |macro_name:{phooindex}
   *arguments_line C1
    {macro_line: phooindex {arg}\\n}
   {raw:!!\\arg\\!!\\n}
   *normal_command@end C1 l26
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:!!mff!!\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call_line@phooindex C1
     >*line_arg C2
      >{spaces_before_argument: }
      >{normal_text:mff}
   >macro_expansion<end;2><p:7>
  {empty_line:\\n}
  *normal_command@defindex C1 l29
  |misc_args:A{phoo}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:phoo}
    {spaces_after_argument:\\n}
  *index_entry_command@phooindex C1 l30
  |element_node:{chap}
  |index_entry:I{phoo,2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:igg}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l32
  |formal_args:A{arg}
  |macro_name:{phooindex}
   *arguments_line C1
    {macro_line: phooindex {arg}\\n}
   {raw:!!\\arg\\!!\\n}
   *normal_command@end C1 l34
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:!!mhh!!\\n}
   >SOURCEMARKS
   >macro_expansion<start;3>
    >*macro_call_line@phooindex C1
     >*line_arg C2
      >{spaces_before_argument: }
      >{normal_text:mhh}
   >macro_expansion<end;3><p:7>
  {empty_line:\\n}
  *normal_command@alias C1 l37
  |misc_args:A{phooindex|strong}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:phooindex = strong}
    {spaces_after_argument:\\n}
  *paragraph C2
   *normal_command@strong C1 l38
   |alias_of:{phooindex}
    *brace_container C1
     {normal_text:aii}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@definfoenclose C1 l40
  |misc_args:A{phoo|;|:}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:phoo,;,:}
    {spaces_after_argument:\\n}
  *paragraph C2
   *definfoenclose_command@phoo C1 l41
   |begin:{;}
   |end:{:}
    *brace_container C1
     {normal_text:djj}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@defindex C1 l43
  |misc_args:A{phoo}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:phoo}
    {spaces_after_argument:\\n}
  *index_entry_command@phooindex C1 l44
  |element_node:{chap}
  |index_entry:I{phoo,3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ikk}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@alias C1 l46
  |misc_args:A{phooindex|strong}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:phooindex = strong}
    {spaces_after_argument:\\n}
  *paragraph C2
   *normal_command@strong C1 l47
   |alias_of:{phooindex}
    *brace_container C1
     {normal_text:all}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l49
  |formal_args:A{arg}
  |macro_name:{phooindex}
   *arguments_line C1
    {macro_line: phooindex {arg}\\n}
   {raw:%%\\arg\\%%\\n}
   *normal_command@end C1 l51
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:%%mmm%%\\n}
   >SOURCEMARKS
   >macro_expansion<start;4>
    >*macro_call@phooindex C1
     >*brace_arg C1
      >{macro_call_arg_text:mmm}
   >macro_expansion<end;4><p:7>
  {empty_line:\\n}
  *normal_command@printindex C1 l54
  |global_command_number:{1}
  |misc_args:A{phoo}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:phoo}
    {spaces_after_argument:\\n}
';


$result_texis{'macro_alias_definfoenclose_defindex'} = '@node Top
@top top

@node chap
@chapter chap

@macro phooindex {arg}
||\\arg\\||
@end macro
||maa||

@definfoenclose phooindex,;,:
@phooindex{dbb}

@alias phooindex = strong
@strong{acc}

@defindex phoo
@phooindex idd

@definfoenclose phooindex,;,:
@phooindex{dee}

@macro phooindex {arg}
!!\\arg\\!!
@end macro
!!mff!!

@defindex phoo
@phooindex igg

@macro phooindex {arg}
!!\\arg\\!!
@end macro
!!mhh!!

@alias phooindex = strong
@strong{aii}

@definfoenclose phoo,;,:
@phoo{djj}

@defindex phoo
@phooindex ikk

@alias phooindex = strong
@strong{all}

@macro phooindex {arg}
%%\\arg\\%%
@end macro
%%mmm%%

@printindex phoo
';


$result_texts{'macro_alias_definfoenclose_defindex'} = 'top
***

1 chap
******

||maa||

dbb

acc


dee

!!mff!!


!!mhh!!

aii

djj


all

%%mmm%%

';

$result_errors{'macro_alias_definfoenclose_defindex'} = '* W l12|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* W l21|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* WC l21|further warnings for @definfoenclose suppressed
 warning: further warnings for @definfoenclose suppressed

';

$result_indices{'macro_alias_definfoenclose_defindex'} = 'cp
fn C
ky C
pg C
phoo
tp C
vr C
';

$result_nodes_list{'macro_alias_definfoenclose_defindex'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'macro_alias_definfoenclose_defindex'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'macro_alias_definfoenclose_defindex'} = 'level: -1
list:
 1|top
';

$result_headings_list{'macro_alias_definfoenclose_defindex'} = '';

$result_indices_sort_strings{'macro_alias_definfoenclose_defindex'} = 'phoo:
 idd
 igg
 ikk
';


$result_converted{'plaintext'}->{'macro_alias_definfoenclose_defindex'} = 'top
***

1 chap
******

||maa||

   ;dbb:

   *acc*

   ;dee:

   !!mff!!

   !!mhh!!

   *aii*

   ;djj:

   *all*

   %%mmm%%

* Menu:

* idd:                                   chap.                 (line 12)
* igg:                                   chap.                 (line 16)
* ikk:                                   chap.                 (line 22)

';

$result_converted_sort_strings{'plaintext'}->{'macro_alias_definfoenclose_defindex'} = 'phoo:
 idd
 igg
 ikk
';

1;
