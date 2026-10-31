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
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
 *@chapter C42 l5 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l7
  |EXTRA
  |formal_args:A{arg}
  |macro_name:{phooindex}
   *arguments_line C1
    {macro_line: phooindex {arg}\\n}
   {raw:||\\arg\\||\\n}
   *@end C1 l9
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *paragraph C1
   {||maa||\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@phooindex C1
     >*brace_arg C1
      >{macro_call_arg_text:maa}
   >macro_expansion<end;1><p:7>
  {empty_line:\\n}
  *@definfoenclose C1 l12
  |EXTRA
  |misc_args:A{phooindex|;|:}
   *line_arg C3
    {spaces_before_argument: }
    {phooindex,;,:}
    {spaces_after_argument:\\n}
  *paragraph C2
   *definfoenclose_command@phooindex C1 l13
   |EXTRA
   |begin:{;}
   |end:{:}
    *brace_container C1
     {dbb}
   {\\n}
  {empty_line:\\n}
  *@alias C1 l15
  |EXTRA
  |misc_args:A{phooindex|strong}
   *line_arg C3
    {spaces_before_argument: }
    {phooindex = strong}
    {spaces_after_argument:\\n}
  *paragraph C2
   *@strong C1 l16
   |INFO
   |alias_of:{phooindex}
    *brace_container C1
     {acc}
   {\\n}
  {empty_line:\\n}
  *@defindex C1 l18
  |EXTRA
  |misc_args:A{phoo}
   *line_arg C3
    {spaces_before_argument: }
    {phoo}
    {spaces_after_argument:\\n}
  *index_entry_command@phooindex C1 l19
  |EXTRA
  |element_node:{chap}
  |index_entry:I{phoo,1}
   *line_arg C3
    {spaces_before_argument: }
    {idd}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@definfoenclose C1 l21
  |EXTRA
  |misc_args:A{phooindex|;|:}
   *line_arg C3
    {spaces_before_argument: }
    {phooindex,;,:}
    {spaces_after_argument:\\n}
  *paragraph C2
   *definfoenclose_command@phooindex C1 l22
   |EXTRA
   |begin:{;}
   |end:{:}
    *brace_container C1
     {dee}
   {\\n}
  {empty_line:\\n}
  *@macro C3 l24
  |EXTRA
  |formal_args:A{arg}
  |macro_name:{phooindex}
   *arguments_line C1
    {macro_line: phooindex {arg}\\n}
   {raw:!!\\arg\\!!\\n}
   *@end C1 l26
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *paragraph C1
   {!!mff!!\\n}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call_line@phooindex C1
     >*line_arg C2
      >{spaces_before_argument: }
      >{mff}
   >macro_expansion<end;2><p:7>
  {empty_line:\\n}
  *@defindex C1 l29
  |EXTRA
  |misc_args:A{phoo}
   *line_arg C3
    {spaces_before_argument: }
    {phoo}
    {spaces_after_argument:\\n}
  *index_entry_command@phooindex C1 l30
  |EXTRA
  |element_node:{chap}
  |index_entry:I{phoo,2}
   *line_arg C3
    {spaces_before_argument: }
    {igg}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l32
  |EXTRA
  |formal_args:A{arg}
  |macro_name:{phooindex}
   *arguments_line C1
    {macro_line: phooindex {arg}\\n}
   {raw:!!\\arg\\!!\\n}
   *@end C1 l34
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *paragraph C1
   {!!mhh!!\\n}
   >SOURCEMARKS
   >macro_expansion<start;3>
    >*macro_call_line@phooindex C1
     >*line_arg C2
      >{spaces_before_argument: }
      >{mhh}
   >macro_expansion<end;3><p:7>
  {empty_line:\\n}
  *@alias C1 l37
  |EXTRA
  |misc_args:A{phooindex|strong}
   *line_arg C3
    {spaces_before_argument: }
    {phooindex = strong}
    {spaces_after_argument:\\n}
  *paragraph C2
   *@strong C1 l38
   |INFO
   |alias_of:{phooindex}
    *brace_container C1
     {aii}
   {\\n}
  {empty_line:\\n}
  *@definfoenclose C1 l40
  |EXTRA
  |misc_args:A{phoo|;|:}
   *line_arg C3
    {spaces_before_argument: }
    {phoo,;,:}
    {spaces_after_argument:\\n}
  *paragraph C2
   *definfoenclose_command@phoo C1 l41
   |EXTRA
   |begin:{;}
   |end:{:}
    *brace_container C1
     {djj}
   {\\n}
  {empty_line:\\n}
  *@defindex C1 l43
  |EXTRA
  |misc_args:A{phoo}
   *line_arg C3
    {spaces_before_argument: }
    {phoo}
    {spaces_after_argument:\\n}
  *index_entry_command@phooindex C1 l44
  |EXTRA
  |element_node:{chap}
  |index_entry:I{phoo,3}
   *line_arg C3
    {spaces_before_argument: }
    {ikk}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@alias C1 l46
  |EXTRA
  |misc_args:A{phooindex|strong}
   *line_arg C3
    {spaces_before_argument: }
    {phooindex = strong}
    {spaces_after_argument:\\n}
  *paragraph C2
   *@strong C1 l47
   |INFO
   |alias_of:{phooindex}
    *brace_container C1
     {all}
   {\\n}
  {empty_line:\\n}
  *@macro C3 l49
  |EXTRA
  |formal_args:A{arg}
  |macro_name:{phooindex}
   *arguments_line C1
    {macro_line: phooindex {arg}\\n}
   {raw:%%\\arg\\%%\\n}
   *@end C1 l51
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *paragraph C1
   {%%mmm%%\\n}
   >SOURCEMARKS
   >macro_expansion<start;4>
    >*macro_call@phooindex C1
     >*brace_arg C1
      >{macro_call_arg_text:mmm}
   >macro_expansion<end;4><p:7>
  {empty_line:\\n}
  *@printindex C1 l54
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{phoo}
   *line_arg C3
    {spaces_before_argument: }
    {phoo}
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
