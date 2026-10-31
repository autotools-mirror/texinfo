use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_misc_commands'} = '*document_root C6
 *before_node_section C1
  *preamble_before_content C4
   *@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{text}
    *arguments_line C1
     {macro_line: text \\n}
    {raw:atext\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@macro C3 l5
   |EXTRA
   |formal_args:A{}
   |macro_name:{Top}
    *arguments_line C1
     {macro_line: Top\\n}
    {raw:Top\\n}
    *@end C1 l7
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l9 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;1><p:1>
     >*macro_call@Top C1
      >*brace_arg
    {Top}
    >SOURCEMARKS
    >macro_expansion<end;1><p:3>
    {spaces_after_argument:\\n}
 *@top C123 l10 {top atext}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top atext}
    >SOURCEMARKS
    >macro_expansion<start;2><p:4>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;2><p:9>
    {spaces_after_argument:\\n}
  *@subheading C1 l11
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {Comment like: atext}
    >SOURCEMARKS
    >macro_expansion<start;3><p:14>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;3><p:19>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {Text line followed by a comment on the same line and another below }
   *@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment @text{}}
     {spaces_after_argument:\\n}
   *@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment @text{}}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l16
  |EXTRA
  |formal_args:A{}
  |macro_name:{en}
   *arguments_line C1
    {macro_line: en \\n}
   {raw:en\\n}
   *@end C1 l18
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@macro C3 l19
  |EXTRA
  |formal_args:A{}
  |macro_name:{documentlanguagecommand}
   *arguments_line C1
    {macro_line: documentlanguagecommand \\n}
   {raw:@documentlanguage\\n}
   *@end C1 l21
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {documentlanguage }
   *@documentlanguage C1 l23
   |EXTRA
   |global_command_number:{1}
   |text_arg:{en}
    *line_arg C3
     {spaces_before_argument:  }
     >SOURCEMARKS
     >macro_expansion<start;4><p:2>
      >*macro_call@en C1
       >*brace_arg
     {en}
     >SOURCEMARKS
     >macro_expansion<end;4><p:2>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {documentlanguage on its line\\n}
   >SOURCEMARKS
   >macro_expansion<start;5><p:29>
    >*macro_call@documentlanguagecommand C1
     >*brace_arg
   *@documentlanguage C1 l26:@documentlanguagecommand
   |EXTRA
   |global_command_number:{2}
   |text_arg:{en}
    *line_arg C3
     {spaces_before_argument:  }
     >SOURCEMARKS
     >macro_expansion<end;5>
     {en}
     {spaces_after_argument:\\n}
   {line following documentlanguage\\n}
  {empty_line:\\n}
  *@macro C3 l29
  |EXTRA
  |formal_args:A{}
  |macro_name:{pagesizesarg}
   *arguments_line C1
    {macro_line: pagesizesarg\\n}
   {raw:200mm,150mm\\n}
   *@end C1 l31
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l33
  |EXTRA
  |formal_args:A{}
  |macro_name:{afourpapermacro}
   *arguments_line C1
    {macro_line: afourpapermacro \\n}
   {raw:@afourpaper\\n}
   *@end C1 l35
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@pagesizes C1 l37
  >SOURCEMARKS
  >macro_expansion<start;7>
   >*macro_call@afourpapermacro C1
    >*brace_arg
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;6><p:1>
     >*macro_call@pagesizesarg C1
      >*brace_arg
    {200mm,150mm}
    >SOURCEMARKS
    >macro_expansion<end;6><p:11>
    {spaces_after_argument:\\n}
  *@afourpaper C1 l38:@afourpapermacro
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;7>
  *@headings C1 l39
  |EXTRA
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {on line following headings atext}
    >SOURCEMARKS
    >macro_expansion<start;8><p:27>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;8><p:32>
    {spaces_after_argument:\\n}
  *@oddfooting C1 l40
   *line_arg C3
    {spaces_before_argument: }
    {on line following oddfooting atext}
    >SOURCEMARKS
    >macro_expansion<start;9><p:29>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;9><p:34>
    {spaces_after_argument:\\n}
  *@everyheading C1 l41
   *line_arg C3
    {spaces_before_argument: }
    {on line following everyheading atext}
    >SOURCEMARKS
    >macro_expansion<start;10><p:31>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;10><p:36>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l43
  |EXTRA
  |formal_args:A{}
  |macro_name:{needarg}
   *arguments_line C1
    {macro_line: needarg\\n}
   {raw:0.1\\n}
   *@end C1 l45
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@need C1 l47
  |EXTRA
  |misc_args:A{0.1}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;11><p:1>
     >*macro_call@needarg C1
      >*brace_arg
    {0.1}
    >SOURCEMARKS
    >macro_expansion<end;11><p:3>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l49
  |EXTRA
  |formal_args:A{}
  |macro_name:{raisesectionsmacro}
  >SOURCEMARKS
  >macro_expansion<start;12>
   >*macro_call@raisesectionsmacro C1
    >*brace_arg
   *arguments_line C1
    {macro_line: raisesectionsmacro \\n}
   {raw:@raisesections\\n}
   *@end C1 l51
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@raisesections C1
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;12>
  *@macro C3 l53
  |EXTRA
  |formal_args:A{}
  |macro_name:{lowersectionsmacro}
  >SOURCEMARKS
  >macro_expansion<start;13>
   >*macro_call@lowersectionsmacro C1
    >*brace_arg
   *arguments_line C1
    {macro_line: lowersectionsmacro \\n}
   {raw:@lowersections\\n}
   *@end C1 l55
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@lowersections C1
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;13>
  {empty_line:\\n}
  *paragraph C3
   *@@
   {definfoenclose phoo,//,\\\\  }
   *@definfoenclose C1 l58
   |EXTRA
   |misc_args:A{phoo|//|\\\\}
    *line_arg C3
     {spaces_before_argument: }
     {phoo,//,\\\\}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phoo C1 l60
   |EXTRA
   |begin:{//}
   |end:{\\\\}
    *brace_container C1
     {bar}
   {\\n}
  {empty_line:\\n}
  *@macro C3 l62
  |EXTRA
  |formal_args:A{}
  |macro_name:{definfoenclosename}
   *arguments_line C1
    {macro_line: definfoenclosename \\n}
   {raw:phi\\n}
   *@end C1 l64
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@definfoenclose C1 l65
  |EXTRA
  |misc_args:A{phi|:|:}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;14><p:1>
     >*macro_call@definfoenclosename C1
      >*brace_arg
    {phi,:,:}
    >SOURCEMARKS
    >macro_expansion<end;14><p:3>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phi C1 l67
   |EXTRA
   |begin:{:}
   |end:{:}
    *brace_container C1
     {bar}
   {\\n}
  {empty_line:\\n}
  *@macro C3 l69
  |EXTRA
  |formal_args:A{}
  |macro_name:{strongmacro}
   *arguments_line C1
    {macro_line: strongmacro \\n}
   {raw:@strong\\n}
   *@end C1 l71
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@macro C3 l72
  |EXTRA
  |formal_args:A{}
  |macro_name:{strongname}
   *arguments_line C1
    {macro_line: strongname \\n}
   {raw:strong\\n}
   *@end C1 l74
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;15><p:1>
   >*macro_call@strongmacro C1
    >*brace_arg
  *paragraph C2
   *@strong C1 l76:@strongmacro
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:}
    |>SOURCEMARKS
    |>macro_expansion<end;15>
    *brace_container C1
     {very strong}
   {\\n}
  {empty_line:\\n}
  *@definfoenclose C1 l78
  |EXTRA
  |misc_args:A{strong|(strong:|:)}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;16><p:1>
     >*macro_call@strongname C1
      >*brace_arg
    {strong,(strong:,:)}
    >SOURCEMARKS
    >macro_expansion<end;16><p:6>
    >macro_expansion<start;17><p:8>
     >*macro_call@strongname C1
      >*brace_arg
    >macro_expansion<end;17><p:14>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;18><p:1>
   >*macro_call@strongmacro C1
    >*brace_arg
  *paragraph C2
   *definfoenclose_command@strong C1 l80:@strongmacro
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:}
    |>SOURCEMARKS
    |>macro_expansion<end;18>
   |EXTRA
   |begin:{(strong:}
   |end:{:)}
    *brace_container C1
     { is it really strong? }
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@kbd C1 l82
    *brace_container C1
     {something before kbdinputstyle}
   {\\n}
  {empty_line:\\n}
  *@macro C3 l84
  |EXTRA
  |formal_args:A{}
  |macro_name:{kbdinputstylearg}
   *arguments_line C1
    {macro_line: kbdinputstylearg \\n}
   {raw:code\\n}
   *@end C1 l86
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@kbdinputstyle C1 l87
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{code}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;19><p:1>
     >*macro_call@kbdinputstylearg C1
      >*brace_arg
    {code}
    >SOURCEMARKS
    >macro_expansion<end;19><p:4>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@kbd C1 l89
   |EXTRA
   |code:{1}
    *brace_container C1
     {truc}
   {\\n}
  {empty_line:\\n}
  *@example C3 l91
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    *@kbd C1 l92
    |EXTRA
    |code:{1}
     *brace_container C1
      {example}
    {\\n}
   *@end C1 l93
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l95
  |EXTRA
  |formal_args:A{}
  |macro_name:{asisarg}
   *arguments_line C1
    {macro_line: asisarg \\n}
   {raw:asis\\n}
   *@end C1 l97
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@macro C3 l98
  |EXTRA
  |formal_args:A{}
  |macro_name:{zero}
   *arguments_line C1
    {macro_line: zero \\n}
   {raw:0\\n}
   *@end C1 l100
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@macro C3 l101
  |EXTRA
  |formal_args:A{}
  |macro_name:{nonearg}
   *arguments_line C1
    {macro_line: nonearg \\n}
   {raw:none\\n}
   *@end C1 l103
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@macro C3 l104
  |EXTRA
  |formal_args:A{}
  |macro_name:{four}
   *arguments_line C1
    {macro_line: four \\n}
   {raw:4\\n}
   *@end C1 l106
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@macro C3 l107
  |EXTRA
  |formal_args:A{}
  |macro_name:{six}
   *arguments_line C1
    {macro_line: six \\n}
   {raw:6\\n}
   *@end C1 l109
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@paragraphindent C1 l111
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{asis}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;20><p:1>
     >*macro_call@asisarg C1
      >*brace_arg
    {asis}
    >SOURCEMARKS
    >macro_expansion<end;20><p:4>
    {spaces_after_argument:\\n}
  *@paragraphindent C1 l112
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{0}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;21><p:1>
     >*macro_call@zero C1
      >*brace_arg
    {0}
    >SOURCEMARKS
    >macro_expansion<end;21><p:1>
    {spaces_after_argument:\\n}
  *@paragraphindent C1 l113
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{none}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;22><p:1>
     >*macro_call@nonearg C1
      >*brace_arg
    {none}
    >SOURCEMARKS
    >macro_expansion<end;22><p:4>
    {spaces_after_argument:\\n}
  *@paragraphindent C1 l114
  |EXTRA
  |global_command_number:{4}
  |misc_args:A{4}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;23><p:1>
     >*macro_call@four C1
      >*brace_arg
    {4}
    >SOURCEMARKS
    >macro_expansion<end;23><p:1>
    {spaces_after_argument:\\n}
  *@firstparagraphindent C1 l115
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{none}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;24><p:1>
     >*macro_call@nonearg C1
      >*brace_arg
    {none}
    >SOURCEMARKS
    >macro_expansion<end;24><p:4>
    {spaces_after_argument:\\n}
  *@exampleindent C1 l116
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{6}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;25><p:1>
     >*macro_call@six C1
      >*brace_arg
    {6}
    >SOURCEMARKS
    >macro_expansion<end;25><p:1>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l118
  |EXTRA
  |formal_args:A{}
  |macro_name:{endarg}
   *arguments_line C1
    {macro_line: endarg \\n}
   {raw:end\\n}
   *@end C1 l120
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@macro C3 l121
  |EXTRA
  |formal_args:A{}
  |macro_name:{separatearg}
   *arguments_line C1
    {macro_line: separatearg \\n}
   {raw:separate \\n}
   *@end C1 l123
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@footnotestyle C1 l124
  |EXTRA
  |misc_args:A{end}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;26><p:1>
     >*macro_call@endarg C1
      >*brace_arg
    {end}
    >SOURCEMARKS
    >macro_expansion<end;26><p:3>
    {spaces_after_argument:\\n}
  *@footnotestyle C1 l125
  |EXTRA
  |misc_args:A{separate}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;27><p:1>
     >*macro_call@separatearg C1
      >*brace_arg
    {separate}
    {spaces_after_argument: \\n}
    >SOURCEMARKS
    >macro_expansion<end;27><p:1>
  {empty_line:\\n}
  *@macro C3 l127
  |EXTRA
  |formal_args:A{}
  |macro_name:{onarg}
   *arguments_line C1
    {macro_line: onarg \\n}
   {raw:on\\n}
   *@end C1 l129
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@macro C3 l130
  |EXTRA
  |formal_args:A{}
  |macro_name:{offarg}
   *arguments_line C1
    {macro_line: offarg \\n}
   {raw:off\\n}
   *@end C1 l132
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@frenchspacing C1 l133
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;28><p:1>
     >*macro_call@onarg C1
      >*brace_arg
    {on}
    >SOURCEMARKS
    >macro_expansion<end;28><p:2>
    {spaces_after_argument:\\n}
  *@frenchspacing C1 l134
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{off}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;29><p:1>
     >*macro_call@offarg C1
      >*brace_arg
    {off}
    >SOURCEMARKS
    >macro_expansion<end;29><p:3>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:accepts 10 or 11}
    {spaces_after_argument:\\n}
  *@macro C3 l137
  |EXTRA
  |formal_args:A{}
  |macro_name:{ten}
   *arguments_line C1
    {macro_line: ten \\n}
   {raw:10\\n}
   *@end C1 l139
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@fonttextsize C1 l140
  |EXTRA
  |misc_args:A{10}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;30><p:1>
     >*macro_call@ten C1
      >*brace_arg
    {10}
    >SOURCEMARKS
    >macro_expansion<end;30><p:2>
    {spaces_after_argument:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:accept false or true}
    {spaces_after_argument:\\n}
  *@macro C3 l142
  |EXTRA
  |formal_args:A{}
  |macro_name:{falsearg}
   *arguments_line C1
    {macro_line: falsearg \\n}
   {raw:false\\n}
   *@end C1 l144
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@macro C3 l145
  |EXTRA
  |formal_args:A{}
  |macro_name:{truearg}
   *arguments_line C1
    {macro_line: truearg\\n}
   {raw:true\\n}
   *@end C1 l147
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@allowcodebreaks C1 l148
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{false}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;31><p:1>
     >*macro_call@falsearg C1
      >*brace_arg
    {false}
    >SOURCEMARKS
    >macro_expansion<end;31><p:5>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@allowcodebreaks C1 l150
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{true}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;32><p:1>
     >*macro_call@truearg C1
      >*brace_arg
    {true}
    >SOURCEMARKS
    >macro_expansion<end;32><p:4>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l152
  |EXTRA
  |formal_args:A{}
  |macro_name:{pagemacro}
   *arguments_line C1
    {macro_line: pagemacro \\n}
   {raw:@page\\n}
   *@end C1 l154
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@macro C3 l155
  |EXTRA
  |formal_args:A{}
  |macro_name:{noindentmacro}
   *arguments_line C1
    {macro_line: noindentmacro \\n}
   {raw:@noindent\\n}
   *@end C1 l157
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@macro C3 l158
  |EXTRA
  |formal_args:A{}
  |macro_name:{refillmacro}
   *arguments_line C1
    {macro_line: refillmacro \\n}
   {raw:@refill\\n}
   *@end C1 l160
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@@
   {page }
   >SOURCEMARKS
   >macro_expansion<start;33><p:5>
    >*macro_call@pagemacro C1
     >*brace_arg
  *@page C1
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<end;33>
    {rawline_text:on page line}
    {spaces_after_argument:\\n}
  *paragraph C8
   *@@
   {noindent }
   >SOURCEMARKS
   >macro_expansion<start;34><p:9>
    >*macro_call@noindentmacro C1
     >*brace_arg
   *@noindent l163:@noindentmacro
   {ignorable_spaces_after_command: }
   >SOURCEMARKS
   >macro_expansion<end;34>
   *@@
   {refill }
   >SOURCEMARKS
   >macro_expansion<start;35><p:7>
    >*macro_call@refillmacro C1
     >*brace_arg
   *@refill
   >SOURCEMARKS
   >macro_expansion<end;35>
   { something\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;36><p:1>
   >*macro_call@noindentmacro C1
    >*brace_arg
  *@noindent l165:@noindentmacro
  {ignorable_spaces_after_command:     }
  >SOURCEMARKS
  >macro_expansion<end;36>
  *paragraph C8
  |EXTRA
  |noindent:{1}
   {noindent at beginning of line\\n}
   >SOURCEMARKS
   >macro_expansion<start;37><p:30>
    >*macro_call@noindentmacro C1
     >*brace_arg
   *@noindent l166:@noindentmacro
   {ignorable_spaces_after_command:\\n}
   >SOURCEMARKS
   >macro_expansion<end;37>
   {noindent on the preceding line\\n}
   {  }
   >SOURCEMARKS
   >macro_expansion<start;38><p:2>
    >*macro_call@noindentmacro C1
     >*brace_arg
   *@noindent l168:@noindentmacro
   {ignorable_spaces_after_command:    }
   >SOURCEMARKS
   >macro_expansion<end;38>
   {noindent after space at beginning of line\\n}
   >SOURCEMARKS
   >macro_expansion<start;39><p:42>
    >*macro_call@pagemacro C1
     >*brace_arg
  *@page C1
  >SOURCEMARKS
  >macro_expansion<start;40>
   >*macro_call@pagemacro C1
    >*brace_arg
   *line_arg C3
    {spaces_before_argument:         }
    >SOURCEMARKS
    >macro_expansion<end;39>
    {rawline_text:page at beginning of line}
    {spaces_after_argument:\\n}
  *@page C1
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;40>
  *paragraph C1
   {After page on its own line.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@@
   {page }
   >SOURCEMARKS
   >macro_expansion<start;41><p:5>
    >*macro_call@pagemacro C1
     >*brace_arg
  *@page C1
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;41>
  *paragraph C9
   {two spaces   }
   *@@
   {noindent }
   >SOURCEMARKS
   >macro_expansion<start;42><p:9>
    >*macro_call@noindentmacro C1
     >*brace_arg
   *@noindent l174:@noindentmacro
   {ignorable_spaces_after_command:    }
   >SOURCEMARKS
   >macro_expansion<end;42>
   *@@
   {refill }
   >SOURCEMARKS
   >macro_expansion<start;43><p:7>
    >*macro_call@refillmacro C1
     >*brace_arg
   *@refill
   >SOURCEMARKS
   >macro_expansion<end;43>
   {\\n}
  {empty_line:\\n}
  *@macro C3 l176
  |EXTRA
  |formal_args:A{}
  |macro_name:{contentsmacro}
  >SOURCEMARKS
  >macro_expansion<start;44>
   >*macro_call@contentsmacro C1
    >*brace_arg
   *arguments_line C1
    {macro_line: contentsmacro \\n}
   {raw:@contents\\n}
   *@end C1 l178
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@contents C1 l179:@contentsmacro
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;44>
  {empty_line:\\n}
  *@vskip C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:@atext{}}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l183
  |EXTRA
  |formal_args:A{}
  |macro_name:{exdentmacro}
  >SOURCEMARKS
  >macro_expansion<start;45>
   >*macro_call@exdentmacro C1
    >*brace_arg
   *arguments_line C1
    {macro_line: exdentmacro \\n}
   {raw:@exdent\\n}
   *@end C1 l185
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@exdent C1 l186:@exdentmacro
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<end;45>
    {line after exdent}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@macro C3 l188
  |EXTRA
  |formal_args:A{}
  |macro_name:{two}
   *arguments_line C1
    {macro_line: two \\n}
   {raw:2\\n}
   *@end C1 l190
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@sp C1 l191
  |EXTRA
  |misc_args:A{2}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;46><p:1>
     >*macro_call@two C1
      >*brace_arg
    {2}
    >SOURCEMARKS
    >macro_expansion<end;46><p:1>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l193
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l194
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{node atext}
    |normalized:{node-atext}
     {node atext}
     >SOURCEMARKS
     >macro_expansion<start;47><p:5>
      >*macro_call@text C1
       >*brace_arg
     >macro_expansion<end;47><p:10>
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l195
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l197 {node atext}
 |EXTRA
 |identifier:{node-atext}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {node atext}
    >SOURCEMARKS
    >macro_expansion<start;48><p:5>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;48><p:10>
    {spaces_after_argument:\\n}
 *@chapter C9 l198 {chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;49><p:1>
   >*macro_call@contentsmacro C1
    >*brace_arg
  *@contents C1 l200:@contentsmacro
  |EXTRA
  |global_command_number:{2}
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;49>
  {empty_line:\\n}
  *@macro C3 l202
  |EXTRA
  |formal_args:A{}
  |macro_name:{shortcontentsmacro}
  >SOURCEMARKS
  >macro_expansion<start;50>
   >*macro_call@shortcontentsmacro C1
    >*brace_arg
   *arguments_line C1
    {macro_line: shortcontentsmacro \\n}
   {raw:@shortcontents\\n}
   *@end C1 l204
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  *@shortcontents C1 l205:@shortcontentsmacro
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;50>
  {empty_line:\\n}
  *@macro C3 l207
  |EXTRA
  |formal_args:A{}
  |macro_name:{byemacro}
   *arguments_line C1
    {macro_line: byemacro\\n}
   {raw:@bye\\n}
   *@end C1 l209
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;51><p:1>
   >*macro_call@byemacro C1
    >*brace_arg
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
   >SOURCEMARKS
   >macro_expansion<end;51>
';


$result_texis{'macro_in_misc_commands'} = '@macro text 
atext
@end macro

@macro Top
Top
@end macro

@node Top
@top top atext
@subheading Comment like: atext

Text line followed by a comment on the same line and another below @c comment @text{}
@c comment @text{}

@macro en 
en
@end macro
@macro documentlanguagecommand 
@documentlanguage
@end macro

documentlanguage @documentlanguage  en

documentlanguage on its line
@documentlanguage  en
line following documentlanguage

@macro pagesizesarg
200mm,150mm
@end macro

@macro afourpapermacro 
@afourpaper
@end macro

@pagesizes 200mm,150mm
@afourpaper
@headings on line following headings atext
@oddfooting on line following oddfooting atext
@everyheading on line following everyheading atext

@macro needarg
0.1
@end macro

@need 0.1

@macro raisesectionsmacro 
@raisesections
@end macro
@raisesections
@macro lowersectionsmacro 
@lowersections
@end macro
@lowersections

@@definfoenclose phoo,//,\\\\  @definfoenclose phoo,//,\\\\

@phoo{bar}

@macro definfoenclosename 
phi
@end macro
@definfoenclose phi,:,:

@phi{bar}

@macro strongmacro 
@strong
@end macro
@macro strongname 
strong
@end macro

@strong{very strong}

@definfoenclose strong,(strong:,:)

@strong{ is it really strong? }

@kbd{something before kbdinputstyle}

@macro kbdinputstylearg 
code
@end macro
@kbdinputstyle code

@kbd{truc}

@example
@kbd{example}
@end example

@macro asisarg 
asis
@end macro
@macro zero 
0
@end macro
@macro nonearg 
none
@end macro
@macro four 
4
@end macro
@macro six 
6
@end macro

@paragraphindent asis
@paragraphindent 0
@paragraphindent none
@paragraphindent 4
@firstparagraphindent none
@exampleindent 6

@macro endarg 
end
@end macro
@macro separatearg 
separate 
@end macro
@footnotestyle end
@footnotestyle separate 

@macro onarg 
on
@end macro
@macro offarg 
off
@end macro
@frenchspacing on
@frenchspacing off

@c accepts 10 or 11
@macro ten 
10
@end macro
@fonttextsize 10
@c accept false or true
@macro falsearg 
false
@end macro
@macro truearg
true
@end macro
@allowcodebreaks false

@allowcodebreaks true

@macro pagemacro 
@page
@end macro
@macro noindentmacro 
@noindent
@end macro
@macro refillmacro 
@refill
@end macro

@@page @page on page line
@@noindent @noindent @@refill @refill something

@noindent     noindent at beginning of line
@noindent
noindent on the preceding line
  @noindent    noindent after space at beginning of line
@page         page at beginning of line
@page
After page on its own line.

@@page @page
two spaces   @@noindent @noindent    @@refill @refill

@macro contentsmacro 
@contents
@end macro
@contents

@vskip @atext{}

@macro exdentmacro 
@exdent
@end macro
@exdent line after exdent

@macro two 
2
@end macro
@sp 2

@menu
* node atext::
@end menu

@node node atext
@chapter chapter

@contents

@macro shortcontentsmacro 
@shortcontents
@end macro
@shortcontents

@macro byemacro
@bye
@end macro

@bye
';


$result_texts{'macro_in_misc_commands'} = '

top atext
*********
Comment like: atext
-------------------

Text line followed by a comment on the same line and another below 

documentlanguage 
documentlanguage on its line
line following documentlanguage







@definfoenclose phoo,//,\\\\  
bar


bar


very strong


 is it really strong? 

something before kbdinputstyle


truc

example








@page 
@noindent @refill  something

noindent at beginning of line
noindent on the preceding line
  noindent after space at beginning of line


After page on its own line.

@page 
two spaces   @noindent @refill 



line after exdent




* node atext::

1 chapter
*********




';

$result_errors{'macro_in_misc_commands'} = '* W l23|@documentlanguage should only appear at the beginning of a line
 warning: @documentlanguage should only appear at the beginning of a line

* E l39|bad argument to @headings: on line following headings atext
 bad argument to @headings: on line following headings atext

* W l58|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* W l58|@definfoenclose should only appear at the beginning of a line
 warning: @definfoenclose should only appear at the beginning of a line

* W l65|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* WC l65|further warnings for @definfoenclose suppressed
 warning: further warnings for @definfoenclose suppressed

* W l125|multiple @footnotestyle
 warning: multiple @footnotestyle

* W l162:@pagemacro|@page should only appear at the beginning of a line
 warning: @page should only appear at the beginning of a line (possibly involving @pagemacro)

* W l162:@pagemacro|remaining argument on @page line: on page line
 warning: remaining argument on @page line: on page line (possibly involving @pagemacro)

* W l163:@noindentmacro|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph (possibly involving @noindentmacro)

* W l163:@refillmacro|@refill is obsolete
 warning: @refill is obsolete (possibly involving @refillmacro)

* W l166:@noindentmacro|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph (possibly involving @noindentmacro)

* W l168:@noindentmacro|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph (possibly involving @noindentmacro)

* W l169:@pagemacro|remaining argument on @page line: page at beginning of line
 warning: remaining argument on @page line: page at beginning of line (possibly involving @pagemacro)

* W l173:@pagemacro|@page should only appear at the beginning of a line
 warning: @page should only appear at the beginning of a line (possibly involving @pagemacro)

* W l174:@noindentmacro|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph (possibly involving @noindentmacro)

* W l174:@refillmacro|@refill is obsolete
 warning: @refill is obsolete (possibly involving @refillmacro)

* WC l174:@refillmacro|further warnings for @refill suppressed
 warning: further warnings for @refill suppressed (possibly involving @refillmacro)

';

$result_nodes_list{'macro_in_misc_commands'} = '1|Top
 associated_section: top atext
 associated_title_command: top atext
 menus:
  node atext
 node_directions:
  next->node atext
2|node atext
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'macro_in_misc_commands'} = '1|top atext
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: node atext
 associated_node: node atext
 section_directions:
  up->top atext
 toplevel_directions:
  prev->top atext
  up->top atext
';

$result_sectioning_root{'macro_in_misc_commands'} = 'level: -1
list:
 1|top atext
';

$result_headings_list{'macro_in_misc_commands'} = '1|Comment like: atext
';

1;
