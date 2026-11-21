use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentlanguagevariant_selection'} = '*document_root C5
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
         {Instance Variable}
       {spaces: }
       *def_class C1
        *def_line_arg C1
         {SSS}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         {BBB}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         {CCC}
       {spaces_after_argument:\\n}
     *@end C1 l4
     |EXTRA
     |text_arg:{defivar}
      *line_arg C3
       {spaces_before_argument: }
       {defivar}
       {spaces_after_argument:\\n}
    *@end C1 l5
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@documentlanguage C1 l7
   |EXTRA
   |global_command_number:{1}
   |text_arg:{sr}
    *line_arg C3
     {spaces_before_argument: }
     {sr}
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C3 l8
   |EXTRA
   |global_command_number:{1}
    *line_arg C4
     {spaces_before_argument: }
     {1959acad}
     *@^ C1 l8
      *following_arg C1
       {e}
     {spaces_after_argument: }
    *line_arg C1
     {spaces_before_argument: }
    *line_arg C3
     {spaces_before_argument: }
     {1694acad}
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
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 l11 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument: \\n}
  {empty_line:\\n}
 *@node C1 l13 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
 *@chapter C16 l14 {Chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defivar C2 l16
   *def_line C1 l16
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{sr}
   |documentlanguagevariant:A{1959acad|1694acad}
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
      |documentlanguagevariant:A{1959acad|1694acad}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {some}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {other}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {ivar}
     {spaces_after_argument:\\n}
   *@end C1 l17
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {defivar}
     {spaces_after_argument: \\n}
  {empty_line:\\n}
  *@documentlanguagevariant C1 l19
  |EXTRA
  |global_command_number:{2}
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
       {after}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {reset}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {ivar}
     {spaces_after_argument:\\n}
   *@end C1 l22
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguagevariant C3 l24
  |EXTRA
  |global_command_number:{3}
   *line_arg C2
    {spaces_before_argument: }
    {abl1943 s}
   *line_arg C2
    {spaces_before_argument: }
    {1901}
   *line_arg C1
    {spaces_before_argument: \\n}
  *@documentlanguage C1 l25
  |EXTRA
  |global_command_number:{2}
  |text_arg:{az}
   *line_arg C3
    {spaces_before_argument: }
    {az}
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
       {script}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {before}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {change}
     {spaces_after_argument:\\n}
   *@end C1 l28
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguagevariant C3 l30
  |EXTRA
  |global_command_number:{4}
   *line_arg C2
    {spaces_before_argument: }
    {akhmimic c}
   *line_arg C2
    {spaces_before_argument: }
    {aluku}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@defivar C2 l32
   *def_line C1 l32
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{az}
   |documentlanguagevariant:A{aluku}
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
      |documentlanguagevariant:A{aluku}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {one}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {after}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {change}
     {spaces_after_argument:\\n}
   *@end C1 l33
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {defivar}
     {spaces_after_argument:\\n}
';


$result_texis{'documentlanguagevariant_selection'} = '
@copying
@defivar SSS BBB CCC
@end defivar
@end copying

@documentlanguage sr
@documentlanguagevariant 1959acad@^e , , 1694acad

@node Top
@top top 

@node chap
@chapter Chap

@defivar some other ivar
@end defivar 

@documentlanguagevariant

@defivar after reset ivar
@end defivar

@documentlanguagevariant abl1943 s, 1901, 
@documentlanguage az

@defivar script before change
@end defivar

@documentlanguagevariant akhmimic c, aluku,

@defivar one after change
@end defivar
';


$result_texts{'documentlanguagevariant_selection'} = '

top
***

1 Chap
******

Променљива примерка од some: other ivar


Променљива примерка од after: reset ivar


Instance Variable of script: before change


Instance Variable of one: after change
';

$result_errors{'documentlanguagevariant_selection'} = '* W l8|superfluous content in number 1 argument to @documentlanguagevariant
 warning: superfluous content in number 1 argument to @documentlanguagevariant

* W l24|bad number 1 argument to @documentlanguagevariant
 warning: bad number 1 argument to @documentlanguagevariant

* W l30|bad number 1 argument to @documentlanguagevariant
 warning: bad number 1 argument to @documentlanguagevariant

';

$result_nodes_list{'documentlanguagevariant_selection'} = '1|Top
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

$result_sections_list{'documentlanguagevariant_selection'} = '1|top
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

$result_sectioning_root{'documentlanguagevariant_selection'} = 'level: -1
list:
 1|top
';

$result_headings_list{'documentlanguagevariant_selection'} = '';

$result_indices_sort_strings{'documentlanguagevariant_selection'} = 'vr:
 after of one
 BBB of SSS
 before of script
 other од some
 reset од after
';


$result_converted{'plaintext'}->{'documentlanguagevariant_selection'} = 'top
***

1 Chap
******

 -- Променљива примерка од some: other ivar

 -- Променљива примерка од after: reset ivar

 -- Instance Variable of script: before change

 -- Instance Variable of one: after change
';

$result_converted_sort_strings{'plaintext'}->{'documentlanguagevariant_selection'} = 'vr:
 after of one
 BBB of SSS
 before of script
 other од some
 reset од after
';

1;
