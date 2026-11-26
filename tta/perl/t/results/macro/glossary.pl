use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'glossary'} = '*document_root C5
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo.tex\\n}
   {empty_line:\\n}
  *preamble_before_content C8
   *normal_command@setfilename C1 glossary.texi:l3
   |text_arg:{glossary}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:glossary}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 glossary.texi:l5
   |formal_args:A{}
   |macro_name:{glossarytext}
    *arguments_line C1
     {macro_line: glossarytext\\n}
    {raw:@table @asis\\n}
    *normal_command@end C1 glossary.texi:l7
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C5 glossary.texi:l9
   |formal_args:A{}
   |macro_name:{glossary}
    *arguments_line C1
     {macro_line: glossary\\n}
    {raw:@glossarytext\\n}
    {raw:@end table\\n}
    {raw:\\n}
    *normal_command@end C1 glossary.texi:l13
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C19 glossary.texi:l15
   |formal_args:A{id|name|text}
   |macro_name:{gentry}
    *arguments_line C1
     {macro_line: gentry {id, name, text}\\n}
    {raw:@ifhtml\\n}
    {raw:@ref{\\id\\,\\name\\}\\n}
    {raw:@end ifhtml\\n}
    {raw:@ifnothtml\\n}
    {raw:\\name\\ (@pxref{\\id\\})\\n}
    {raw:@end ifnothtml\\n}
    {raw:@unmacro expandglossary\\n}
    {raw:@macro expandglossary{glossary}\\n}
    {raw:@unmacro glossarytext\\n}
    {raw:@macro glossarytext\\n}
    {raw:\\\\glossary\\\\\\n}
    {raw:@item \\name\\ @anchor{\\id\\}\\n}
    {raw:\\text\\\\n}
    {raw:@end macro\\n}
    {raw:@end macro\\n}
    {raw:@expandglossary {@glossarytext{}}\\n}
    {raw:\\n}
    *normal_command@end C1 glossary.texi:l33
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 glossary.texi:l35 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C6 glossary.texi:l36 {Top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 glossary.texi:l38
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *menu_entry C4 glossary.texi:l39
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{glossary}
     {normal_text:glossary}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 glossary.texi:l40
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C15
   {normal_text:The }
   >SOURCEMARKS
   >macro_expansion<start;1><p:4>
    >*macro_call@gentry C3
     >*brace_arg C1
      >{macro_call_arg_text:id1}
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:name1}
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:text1, arg1 }
      >>SOURCEMARKS
      >>macro_arg_escape_backslash<1><p:5>
   >expanded_conditional_command<start;1><p:4>
    >*normal_command@ifhtml C1 glossary.texi:l42:@gentry
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
   *normal_command@ref C2 glossary.texi:l42:@gentry
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{id1}
     {normal_text:id1}
    *brace_arg C1
     {normal_text:name1}
   {normal_text:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;1><p:1>
    >*normal_command@end C1 glossary.texi:l42:@gentry
    >|text_arg:{ifhtml}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifhtml}
      >{spaces_after_argument:\\n}
   >ignored_conditional_block<1><p:1>
    >*normal_command@ifnothtml C3 glossary.texi:l42:@gentry
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:name1 (@pxref{id1})\\n}
     >*normal_command@end C1 glossary.texi:l42:@gentry
     >|text_arg:{ifnothtml}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifnothtml}
       >{spaces_after_argument:\\n}
   *normal_command@unmacro C1
   |misc_args:A{expandglossary}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:expandglossary}
     {spaces_after_argument:\\n}
   *normal_command@macro C8 glossary.texi:l42:@gentry
   |formal_args:A{glossary}
   |macro_name:{expandglossary}
   >SOURCEMARKS
   >macro_expansion<start;2>
    >*macro_call@expandglossary C2
     >{spaces_after_cmd_before_arg: }
     >*brace_arg C1
      >{macro_call_arg_text:@glossarytext{}}
    *arguments_line C1
     {macro_line: expandglossary{glossary}\\n}
    {raw:@unmacro glossarytext\\n}
    {raw:@macro glossarytext\\n}
    {raw:\\glossary\\\\n}
    {raw:@item name1 @anchor{id1}\\n}
    {raw:text1, arg1 \\n}
    {raw:@end macro\\n}
    *normal_command@end C1 glossary.texi:l42:@gentry
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   *normal_command@unmacro C1
   |misc_args:A{glossarytext}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:glossarytext}
     {spaces_after_argument:\\n}
   *normal_command@macro C5 glossary.texi:l42:@expandglossary
   |formal_args:A{}
   |macro_name:{glossarytext}
   >SOURCEMARKS
   >macro_expansion<end;1>
    *arguments_line C1
     {macro_line: glossarytext\\n}
    {raw:@glossarytext{}\\n}
    {raw:@item name1 @anchor{id1}\\n}
    {raw:text1, arg1 \\n}
    *normal_command@end C1 glossary.texi:l42:@expandglossary
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      >SOURCEMARKS
      >macro_expansion<end;2><p:5>
      {spaces_after_argument:\\n}
   {normal_text: is used in many cases while\\n}
   >SOURCEMARKS
   >macro_expansion<start;3><p:29>
    >*macro_call@gentry C3
     >*brace_arg C1
      >{macro_call_arg_text:id2}
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:name2}
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:text2}
   >expanded_conditional_command<start;2><p:29>
    >*normal_command@ifhtml C1 glossary.texi:l43:@gentry
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
   *normal_command@ref C2 glossary.texi:l43:@gentry
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{id2}
     {normal_text:id2}
    *brace_arg C1
     {normal_text:name2}
   {normal_text:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;2><p:1>
    >*normal_command@end C1 glossary.texi:l43:@gentry
    >|text_arg:{ifhtml}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifhtml}
      >{spaces_after_argument:\\n}
   >ignored_conditional_block<2><p:1>
    >*normal_command@ifnothtml C3 glossary.texi:l43:@gentry
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
     >{raw:name2 (@pxref{id2})\\n}
     >*normal_command@end C1 glossary.texi:l43:@gentry
     >|text_arg:{ifnothtml}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifnothtml}
       >{spaces_after_argument:\\n}
   *normal_command@unmacro C1
   |misc_args:A{expandglossary}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:expandglossary}
     {spaces_after_argument:\\n}
   *normal_command@macro C8 glossary.texi:l43:@gentry
   |formal_args:A{glossary}
   |macro_name:{expandglossary}
   >SOURCEMARKS
   >macro_expansion<start;4>
    >*macro_call@expandglossary C2
     >{spaces_after_cmd_before_arg: }
     >*brace_arg C1
      >{macro_call_arg_text:@glossarytext{}}
    *arguments_line C1
     {macro_line: expandglossary{glossary}\\n}
    {raw:@unmacro glossarytext\\n}
    {raw:@macro glossarytext\\n}
    {raw:\\glossary\\\\n}
    {raw:@item name2 @anchor{id2}\\n}
    {raw:text2\\n}
    {raw:@end macro\\n}
    *normal_command@end C1 glossary.texi:l43:@gentry
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   *normal_command@unmacro C1
   |misc_args:A{glossarytext}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:glossarytext}
     {spaces_after_argument:\\n}
   *normal_command@macro C5 glossary.texi:l43:@expandglossary
   |formal_args:A{}
   |macro_name:{glossarytext}
   >SOURCEMARKS
   >macro_expansion<end;3>
    *arguments_line C1
     {macro_line: glossarytext\\n}
    {raw:@glossarytext{}\\n}
    {raw:@item name2 @anchor{id2}\\n}
    {raw:text2\\n}
    *normal_command@end C1 glossary.texi:l43:@expandglossary
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      >SOURCEMARKS
      >macro_expansion<end;4><p:5>
      {spaces_after_argument:\\n}
   {normal_text: is quite specific\\n}
  {empty_line:\\n}
 *normal_command@node C1 glossary.texi:l45 {glossary}
 |identifier:{glossary}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:glossary}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 glossary.texi:l46 {glossary}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:glossary}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;5>
   >*macro_call@glossary C1
    >*brace_arg
  >macro_expansion<start;6>
   >*macro_call@glossarytext
  >macro_expansion<7>
   >*macro_call@glossarytext C1
    >*brace_arg
  {ignorable_spaces_after_command: }
  *paragraph C4
  >SOURCEMARKS
  >macro_expansion<end;5>
   {normal_text:name2 }
   *normal_command@anchor C1 glossary.texi:l47:@glossarytext
   |identifier:{id2}
   |is_target:{1}
    *brace_arg C1
     {normal_text:id2}
   {spaces_after_close_brace:\\n}
   {normal_text:text2\\n}
   >SOURCEMARKS
   >macro_expansion<end;6><p:5>
  {empty_line:\\n}
  {empty_line:\\n}
';


$result_texis{'glossary'} = '\\input texinfo.tex

@setfilename glossary

@macro glossarytext
@table @asis
@end macro

@macro glossary
@glossarytext
@end table

@end macro

@macro gentry {id, name, text}
@ifhtml
@ref{\\id\\,\\name\\}
@end ifhtml
@ifnothtml
\\name\\ (@pxref{\\id\\})
@end ifnothtml
@unmacro expandglossary
@macro expandglossary{glossary}
@unmacro glossarytext
@macro glossarytext
\\\\glossary\\\\
@item \\name\\ @anchor{\\id\\}
\\text\\
@end macro
@end macro
@expandglossary {@glossarytext{}}

@end macro

@node Top
@top Top

@menu 
* glossary::
@end menu

The @ref{id1,name1}
@unmacro expandglossary
@macro expandglossary{glossary}
@unmacro glossarytext
@macro glossarytext
\\glossary\\
@item name1 @anchor{id1}
text1, arg1 
@end macro
@end macro
@unmacro glossarytext
@macro glossarytext
@glossarytext{}
@item name1 @anchor{id1}
text1, arg1 
@end macro
 is used in many cases while
@ref{id2,name2}
@unmacro expandglossary
@macro expandglossary{glossary}
@unmacro glossarytext
@macro glossarytext
\\glossary\\
@item name2 @anchor{id2}
text2
@end macro
@end macro
@unmacro glossarytext
@macro glossarytext
@glossarytext{}
@item name2 @anchor{id2}
text2
@end macro
 is quite specific

@node glossary
@chapter glossary

 name2 @anchor{id2}
text2


';


$result_texts{'glossary'} = '



Top
***

* glossary::

The id1
 is used in many cases while
id2
 is quite specific

1 glossary
**********

name2 text2


';

$result_errors{'glossary'} = '* W glossary.texi:l42|use @comma{} instead of \\, in macro arg
 warning: use @comma{} instead of \\, in macro arg

* W glossary.texi:l42:@gentry|@ifhtml should only appear at the beginning of a line
 warning: @ifhtml should only appear at the beginning of a line (possibly involving @gentry)

* E glossary.texi:l47:@glossarytext|recursive call of macro glossarytext is not allowed; use @rmacro if needed
 recursive call of macro glossarytext is not allowed; use @rmacro if needed (possibly involving @glossarytext)

* E glossary.texi:l47:@glossarytext|@item outside of table or list
 @item outside of table or list (possibly involving @glossarytext)

* E glossary.texi:l47:@glossary|unmatched `@end table\'
 unmatched `@end table\' (possibly involving @glossary)

* E glossary.texi:l42:@gentry|@ref reference to nonexistent node `id1\'
 @ref reference to nonexistent node `id1\' (possibly involving @gentry)

';

$result_nodes_list{'glossary'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  glossary
 node_directions:
  next->glossary
2|glossary
 associated_section: 1 glossary
 associated_title_command: 1 glossary
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'glossary'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->glossary
 section_children:
  1|glossary
2|glossary
 associated_anchor_command: glossary
 associated_node: glossary
 section_directions:
  up->Top
 toplevel_directions:
  prev->Top
  up->Top
';

$result_sectioning_root{'glossary'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'glossary'} = '';

1;
