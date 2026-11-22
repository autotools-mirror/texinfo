use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_documentscript_selection'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C5
   *@copying C3 l2
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *@defivar C2 l3
     *def_line C1 l3
     |EXTRA
     |def_command:{defivar}
     |element_region:{copying}
     |index_entry:I{vr,1}
     |original_def_cmdname:{defivar}
      *block_line_arg C9
       (i){spaces_before_argument: }
       *def_category C1
       |EXTRA
       |inserted:{1}
        *def_line_arg C1
         {normal_text:Instance Variable}
       {spaces: }
       *def_class C1
        *def_line_arg C1
         {normal_text:SSS}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         {normal_text:BBB}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         {normal_text:CCC}
       {spaces_after_argument:\\n}
     *@end C1 l4
     |EXTRA
     |text_arg:{defivar}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:defivar}
       {spaces_after_argument:\\n}
    *@end C1 l5
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@documentlanguage C1 l7
   |EXTRA
   |global_command_number:{1}
   |text_arg:{sr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:sr}
     {spaces_after_argument:\\n}
   *@documentscript C1 l8
   |EXTRA
   |global_command_number:{1}
   |text_arg:{UkNo}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:UkNo}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l10 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 l11 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l13 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *@chapter C17 l14 {Chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defivar C2 l16
   *def_line C1 l16
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{sr}
   |documentscript:{UkNo}
   |element_node:{chap}
   |index_entry:I{vr,2}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{sr}
      |documentscript:{UkNo}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:some}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:other}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:ivar}
     {spaces_after_argument:\\n}
   *@end C1 l17
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentscript C1 l19
  |EXTRA
  |global_command_number:{2}
  |text_arg:{}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@defivar C2 l21
   *def_line C1 l21
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{sr}
   |element_node:{chap}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{sr}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:after}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:reset}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:ivar}
     {spaces_after_argument:\\n}
   *@end C1 l22
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentscript C1 l24
  |EXTRA
  |global_command_number:{3}
  |text_arg:{Bad}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Bad}
    {spaces_after_argument:\\n}
  *@documentlanguage C1 l25
  |EXTRA
  |global_command_number:{2}
  |text_arg:{az}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:az}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defivar C2 l27
   *def_line C1 l27
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{az}
   |element_node:{chap}
   |index_entry:I{vr,4}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{az}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:script}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:before}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:change}
     {spaces_after_argument:\\n}
   *@end C1 l28
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentscript C1 l30
  |EXTRA
  |global_command_number:{4}
  |text_arg:{wwrong}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:wwrong}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defivar C2 l32
   *def_line C1 l32
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{az}
   |documentscript:{wwrong}
   |element_node:{chap}
   |index_entry:I{vr,5}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{az}
      |documentscript:{wwrong}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:after}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:script}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:change}
     {spaces_after_argument:\\n}
   *@end C1 l33
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'unknown_documentscript_selection'} = '
@copying
@defivar SSS BBB CCC
@end defivar
@end copying

@documentlanguage sr
@documentscript UkNo

@node Top
@top top

@node chap
@chapter Chap

@defivar some other ivar
@end defivar

@documentscript

@defivar after reset ivar
@end defivar

@documentscript Bad
@documentlanguage az

@defivar script before change
@end defivar

@documentscript wwrong

@defivar after script change
@end defivar

';


$result_texts{'unknown_documentscript_selection'} = '

top
***

1 Chap
******

Променљива примерка од some: other ivar


Променљива примерка од after: reset ivar


Instance Variable of script: before change


Instance Variable of after: script change

';

$result_errors{'unknown_documentscript_selection'} = '* W l8|unknown language script name `UkNo\'
 warning: unknown language script name `UkNo\'

* W l24|unknown language script name `Bad\'
 warning: unknown language script name `Bad\'

* W l30|unknown language script name `wwrong\'
 warning: unknown language script name `wwrong\'

';

$result_nodes_list{'unknown_documentscript_selection'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chap
 associated_title_command: 1 Chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'unknown_documentscript_selection'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chap
 section_children:
  1|Chap
2|Chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'unknown_documentscript_selection'} = 'level: -1
list:
 1|top
';

$result_headings_list{'unknown_documentscript_selection'} = '';

$result_indices_sort_strings{'unknown_documentscript_selection'} = 'vr:
 BBB of SSS
 before of script
 other од some
 reset од after
 script of after
';


$result_converted{'plaintext'}->{'unknown_documentscript_selection'} = 'top
***

1 Chap
******

 -- Променљива примерка од some: other ivar

 -- Променљива примерка од after: reset ivar

 -- Instance Variable of script: before change

 -- Instance Variable of after: script change

';

$result_converted_sort_strings{'plaintext'}->{'unknown_documentscript_selection'} = 'vr:
 BBB of SSS
 before of script
 other од some
 reset од after
 script of after
';

1;
