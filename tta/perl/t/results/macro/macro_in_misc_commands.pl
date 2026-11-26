use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_misc_commands'} = '*document_root C6
 *before_node_section C1
  *preamble C4
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{text}
    *arguments_line C1
     {macro_line: text \\n}
    {raw:atext\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l5
   |formal_args:A{}
   |macro_name:{Top}
    *arguments_line C1
     {macro_line: Top\\n}
    {raw:Top\\n}
    *normal_command@end C1 l7
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l9 {Top}
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
    {normal_text:Top}
    >SOURCEMARKS
    >macro_expansion<end;1><p:3>
    {spaces_after_argument:\\n}
 *normal_command@top C123 l10 {top atext}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top atext}
    >SOURCEMARKS
    >macro_expansion<start;2><p:4>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;2><p:9>
    {spaces_after_argument:\\n}
  *normal_command@subheading C1 l11
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Comment like: atext}
    >SOURCEMARKS
    >macro_expansion<start;3><p:14>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;3><p:19>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Text line followed by a comment on the same line and another below }
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment @text{}}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment @text{}}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l16
  |formal_args:A{}
  |macro_name:{en}
   *arguments_line C1
    {macro_line: en \\n}
   {raw:en\\n}
   *normal_command@end C1 l18
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@macro C3 l19
  |formal_args:A{}
  |macro_name:{documentlanguagecommand}
   *arguments_line C1
    {macro_line: documentlanguagecommand \\n}
   {raw:@documentlanguage\\n}
   *normal_command@end C1 l21
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:documentlanguage }
   *normal_command@documentlanguage C1 l23
   |global_command_number:{1}
   |text_arg:{en}
    *line_arg C3
     {spaces_before_argument:  }
     >SOURCEMARKS
     >macro_expansion<start;4><p:2>
      >*macro_call@en C1
       >*brace_arg
     {normal_text:en}
     >SOURCEMARKS
     >macro_expansion<end;4><p:2>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:documentlanguage on its line\\n}
   >SOURCEMARKS
   >macro_expansion<start;5><p:29>
    >*macro_call@documentlanguagecommand C1
     >*brace_arg
   *normal_command@documentlanguage C1 l26:@documentlanguagecommand
   |global_command_number:{2}
   |text_arg:{en}
    *line_arg C3
     {spaces_before_argument:  }
     >SOURCEMARKS
     >macro_expansion<end;5>
     {normal_text:en}
     {spaces_after_argument:\\n}
   {normal_text:line following documentlanguage\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l29
  |formal_args:A{}
  |macro_name:{pagesizesarg}
   *arguments_line C1
    {macro_line: pagesizesarg\\n}
   {raw:200mm,150mm\\n}
   *normal_command@end C1 l31
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l33
  |formal_args:A{}
  |macro_name:{afourpapermacro}
   *arguments_line C1
    {macro_line: afourpapermacro \\n}
   {raw:@afourpaper\\n}
   *normal_command@end C1 l35
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@pagesizes C1 l37
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
    {normal_text:200mm,150mm}
    >SOURCEMARKS
    >macro_expansion<end;6><p:11>
    {spaces_after_argument:\\n}
  *normal_command@afourpaper C1 l38:@afourpapermacro
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;7>
  *normal_command@headings C1 l39
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:on line following headings atext}
    >SOURCEMARKS
    >macro_expansion<start;8><p:27>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;8><p:32>
    {spaces_after_argument:\\n}
  *normal_command@oddfooting C1 l40
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:on line following oddfooting atext}
    >SOURCEMARKS
    >macro_expansion<start;9><p:29>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;9><p:34>
    {spaces_after_argument:\\n}
  *normal_command@everyheading C1 l41
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:on line following everyheading atext}
    >SOURCEMARKS
    >macro_expansion<start;10><p:31>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;10><p:36>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l43
  |formal_args:A{}
  |macro_name:{needarg}
   *arguments_line C1
    {macro_line: needarg\\n}
   {raw:0.1\\n}
   *normal_command@end C1 l45
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@need C1 l47
  |misc_args:A{0.1}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;11><p:1>
     >*macro_call@needarg C1
      >*brace_arg
    {normal_text:0.1}
    >SOURCEMARKS
    >macro_expansion<end;11><p:3>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l49
  |formal_args:A{}
  |macro_name:{raisesectionsmacro}
  >SOURCEMARKS
  >macro_expansion<start;12>
   >*macro_call@raisesectionsmacro C1
    >*brace_arg
   *arguments_line C1
    {macro_line: raisesectionsmacro \\n}
   {raw:@raisesections\\n}
   *normal_command@end C1 l51
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@raisesections C1
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;12>
  *normal_command@macro C3 l53
  |formal_args:A{}
  |macro_name:{lowersectionsmacro}
  >SOURCEMARKS
  >macro_expansion<start;13>
   >*macro_call@lowersectionsmacro C1
    >*brace_arg
   *arguments_line C1
    {macro_line: lowersectionsmacro \\n}
   {raw:@lowersections\\n}
   *normal_command@end C1 l55
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@lowersections C1
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;13>
  {empty_line:\\n}
  *paragraph C3
   *normal_command@@
   {normal_text:definfoenclose phoo,//,\\\\  }
   *normal_command@definfoenclose C1 l58
   |misc_args:A{phoo|//|\\\\}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:phoo,//,\\\\}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phoo C1 l60
   |begin:{//}
   |end:{\\\\}
    *brace_container C1
     {normal_text:bar}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l62
  |formal_args:A{}
  |macro_name:{definfoenclosename}
   *arguments_line C1
    {macro_line: definfoenclosename \\n}
   {raw:phi\\n}
   *normal_command@end C1 l64
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@definfoenclose C1 l65
  |misc_args:A{phi|:|:}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;14><p:1>
     >*macro_call@definfoenclosename C1
      >*brace_arg
    {normal_text:phi,:,:}
    >SOURCEMARKS
    >macro_expansion<end;14><p:3>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phi C1 l67
   |begin:{:}
   |end:{:}
    *brace_container C1
     {normal_text:bar}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l69
  |formal_args:A{}
  |macro_name:{strongmacro}
   *arguments_line C1
    {macro_line: strongmacro \\n}
   {raw:@strong\\n}
   *normal_command@end C1 l71
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@macro C3 l72
  |formal_args:A{}
  |macro_name:{strongname}
   *arguments_line C1
    {macro_line: strongname \\n}
   {raw:strong\\n}
   *normal_command@end C1 l74
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;15><p:1>
   >*macro_call@strongmacro C1
    >*brace_arg
  *paragraph C2
   *normal_command@strong C2 l76:@strongmacro
    {spaces_after_cmd_before_arg:}
    >SOURCEMARKS
    >macro_expansion<end;15>
    *brace_container C1
     {normal_text:very strong}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@definfoenclose C1 l78
  |misc_args:A{strong|(strong:|:)}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;16><p:1>
     >*macro_call@strongname C1
      >*brace_arg
    {normal_text:strong,(strong:,:)}
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
   *definfoenclose_command@strong C2 l80:@strongmacro
   |begin:{(strong:}
   |end:{:)}
    {spaces_after_cmd_before_arg:}
    >SOURCEMARKS
    >macro_expansion<end;18>
    *brace_container C1
     {normal_text: is it really strong? }
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@kbd C1 l82
    *brace_container C1
     {normal_text:something before kbdinputstyle}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l84
  |formal_args:A{}
  |macro_name:{kbdinputstylearg}
   *arguments_line C1
    {macro_line: kbdinputstylearg \\n}
   {raw:code\\n}
   *normal_command@end C1 l86
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@kbdinputstyle C1 l87
  |global_command_number:{1}
  |misc_args:A{code}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;19><p:1>
     >*macro_call@kbdinputstylearg C1
      >*brace_arg
    {normal_text:code}
    >SOURCEMARKS
    >macro_expansion<end;19><p:4>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@kbd C1 l89
   |code:{1}
    *brace_container C1
     {normal_text:truc}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l91
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    *normal_command@kbd C1 l92
    |code:{1}
     *brace_container C1
      {normal_text:example}
    {normal_text:\\n}
   *normal_command@end C1 l93
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l95
  |formal_args:A{}
  |macro_name:{asisarg}
   *arguments_line C1
    {macro_line: asisarg \\n}
   {raw:asis\\n}
   *normal_command@end C1 l97
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@macro C3 l98
  |formal_args:A{}
  |macro_name:{zero}
   *arguments_line C1
    {macro_line: zero \\n}
   {raw:0\\n}
   *normal_command@end C1 l100
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@macro C3 l101
  |formal_args:A{}
  |macro_name:{nonearg}
   *arguments_line C1
    {macro_line: nonearg \\n}
   {raw:none\\n}
   *normal_command@end C1 l103
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@macro C3 l104
  |formal_args:A{}
  |macro_name:{four}
   *arguments_line C1
    {macro_line: four \\n}
   {raw:4\\n}
   *normal_command@end C1 l106
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@macro C3 l107
  |formal_args:A{}
  |macro_name:{six}
   *arguments_line C1
    {macro_line: six \\n}
   {raw:6\\n}
   *normal_command@end C1 l109
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@paragraphindent C1 l111
  |global_command_number:{1}
  |misc_args:A{asis}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;20><p:1>
     >*macro_call@asisarg C1
      >*brace_arg
    {normal_text:asis}
    >SOURCEMARKS
    >macro_expansion<end;20><p:4>
    {spaces_after_argument:\\n}
  *normal_command@paragraphindent C1 l112
  |global_command_number:{2}
  |misc_args:A{0}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;21><p:1>
     >*macro_call@zero C1
      >*brace_arg
    {normal_text:0}
    >SOURCEMARKS
    >macro_expansion<end;21><p:1>
    {spaces_after_argument:\\n}
  *normal_command@paragraphindent C1 l113
  |global_command_number:{3}
  |misc_args:A{none}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;22><p:1>
     >*macro_call@nonearg C1
      >*brace_arg
    {normal_text:none}
    >SOURCEMARKS
    >macro_expansion<end;22><p:4>
    {spaces_after_argument:\\n}
  *normal_command@paragraphindent C1 l114
  |global_command_number:{4}
  |misc_args:A{4}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;23><p:1>
     >*macro_call@four C1
      >*brace_arg
    {normal_text:4}
    >SOURCEMARKS
    >macro_expansion<end;23><p:1>
    {spaces_after_argument:\\n}
  *normal_command@firstparagraphindent C1 l115
  |global_command_number:{1}
  |misc_args:A{none}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;24><p:1>
     >*macro_call@nonearg C1
      >*brace_arg
    {normal_text:none}
    >SOURCEMARKS
    >macro_expansion<end;24><p:4>
    {spaces_after_argument:\\n}
  *normal_command@exampleindent C1 l116
  |global_command_number:{1}
  |misc_args:A{6}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;25><p:1>
     >*macro_call@six C1
      >*brace_arg
    {normal_text:6}
    >SOURCEMARKS
    >macro_expansion<end;25><p:1>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l118
  |formal_args:A{}
  |macro_name:{endarg}
   *arguments_line C1
    {macro_line: endarg \\n}
   {raw:end\\n}
   *normal_command@end C1 l120
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@macro C3 l121
  |formal_args:A{}
  |macro_name:{separatearg}
   *arguments_line C1
    {macro_line: separatearg \\n}
   {raw:separate \\n}
   *normal_command@end C1 l123
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@footnotestyle C1 l124
  |misc_args:A{end}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;26><p:1>
     >*macro_call@endarg C1
      >*brace_arg
    {normal_text:end}
    >SOURCEMARKS
    >macro_expansion<end;26><p:3>
    {spaces_after_argument:\\n}
  *normal_command@footnotestyle C1 l125
  |misc_args:A{separate}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;27><p:1>
     >*macro_call@separatearg C1
      >*brace_arg
    {normal_text:separate}
    {spaces_after_argument: \\n}
    >SOURCEMARKS
    >macro_expansion<end;27><p:1>
  {empty_line:\\n}
  *normal_command@macro C3 l127
  |formal_args:A{}
  |macro_name:{onarg}
   *arguments_line C1
    {macro_line: onarg \\n}
   {raw:on\\n}
   *normal_command@end C1 l129
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@macro C3 l130
  |formal_args:A{}
  |macro_name:{offarg}
   *arguments_line C1
    {macro_line: offarg \\n}
   {raw:off\\n}
   *normal_command@end C1 l132
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@frenchspacing C1 l133
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;28><p:1>
     >*macro_call@onarg C1
      >*brace_arg
    {normal_text:on}
    >SOURCEMARKS
    >macro_expansion<end;28><p:2>
    {spaces_after_argument:\\n}
  *normal_command@frenchspacing C1 l134
  |global_command_number:{2}
  |misc_args:A{off}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;29><p:1>
     >*macro_call@offarg C1
      >*brace_arg
    {normal_text:off}
    >SOURCEMARKS
    >macro_expansion<end;29><p:3>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:accepts 10 or 11}
    {spaces_after_argument:\\n}
  *normal_command@macro C3 l137
  |formal_args:A{}
  |macro_name:{ten}
   *arguments_line C1
    {macro_line: ten \\n}
   {raw:10\\n}
   *normal_command@end C1 l139
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@fonttextsize C1 l140
  |misc_args:A{10}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;30><p:1>
     >*macro_call@ten C1
      >*brace_arg
    {normal_text:10}
    >SOURCEMARKS
    >macro_expansion<end;30><p:2>
    {spaces_after_argument:\\n}
  *normal_command@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:accept false or true}
    {spaces_after_argument:\\n}
  *normal_command@macro C3 l142
  |formal_args:A{}
  |macro_name:{falsearg}
   *arguments_line C1
    {macro_line: falsearg \\n}
   {raw:false\\n}
   *normal_command@end C1 l144
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@macro C3 l145
  |formal_args:A{}
  |macro_name:{truearg}
   *arguments_line C1
    {macro_line: truearg\\n}
   {raw:true\\n}
   *normal_command@end C1 l147
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@allowcodebreaks C1 l148
  |global_command_number:{1}
  |misc_args:A{false}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;31><p:1>
     >*macro_call@falsearg C1
      >*brace_arg
    {normal_text:false}
    >SOURCEMARKS
    >macro_expansion<end;31><p:5>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@allowcodebreaks C1 l150
  |global_command_number:{2}
  |misc_args:A{true}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;32><p:1>
     >*macro_call@truearg C1
      >*brace_arg
    {normal_text:true}
    >SOURCEMARKS
    >macro_expansion<end;32><p:4>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l152
  |formal_args:A{}
  |macro_name:{pagemacro}
   *arguments_line C1
    {macro_line: pagemacro \\n}
   {raw:@page\\n}
   *normal_command@end C1 l154
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@macro C3 l155
  |formal_args:A{}
  |macro_name:{noindentmacro}
   *arguments_line C1
    {macro_line: noindentmacro \\n}
   {raw:@noindent\\n}
   *normal_command@end C1 l157
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@macro C3 l158
  |formal_args:A{}
  |macro_name:{refillmacro}
   *arguments_line C1
    {macro_line: refillmacro \\n}
   {raw:@refill\\n}
   *normal_command@end C1 l160
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@@
   {normal_text:page }
   >SOURCEMARKS
   >macro_expansion<start;33><p:5>
    >*macro_call@pagemacro C1
     >*brace_arg
  *normal_command@page C1
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<end;33>
    {rawline_text:on page line}
    {spaces_after_argument:\\n}
  *paragraph C8
   *normal_command@@
   {normal_text:noindent }
   >SOURCEMARKS
   >macro_expansion<start;34><p:9>
    >*macro_call@noindentmacro C1
     >*brace_arg
   *normal_command@noindent l163:@noindentmacro
   {ignorable_spaces_after_command: }
   >SOURCEMARKS
   >macro_expansion<end;34>
   *normal_command@@
   {normal_text:refill }
   >SOURCEMARKS
   >macro_expansion<start;35><p:7>
    >*macro_call@refillmacro C1
     >*brace_arg
   *normal_command@refill
   >SOURCEMARKS
   >macro_expansion<end;35>
   {normal_text: something\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;36><p:1>
   >*macro_call@noindentmacro C1
    >*brace_arg
  *normal_command@noindent l165:@noindentmacro
  {ignorable_spaces_after_command:     }
  >SOURCEMARKS
  >macro_expansion<end;36>
  *paragraph C8
  |noindent:{1}
   {normal_text:noindent at beginning of line\\n}
   >SOURCEMARKS
   >macro_expansion<start;37><p:30>
    >*macro_call@noindentmacro C1
     >*brace_arg
   *normal_command@noindent l166:@noindentmacro
   {ignorable_spaces_after_command:\\n}
   >SOURCEMARKS
   >macro_expansion<end;37>
   {normal_text:noindent on the preceding line\\n}
   {normal_text:  }
   >SOURCEMARKS
   >macro_expansion<start;38><p:2>
    >*macro_call@noindentmacro C1
     >*brace_arg
   *normal_command@noindent l168:@noindentmacro
   {ignorable_spaces_after_command:    }
   >SOURCEMARKS
   >macro_expansion<end;38>
   {normal_text:noindent after space at beginning of line\\n}
   >SOURCEMARKS
   >macro_expansion<start;39><p:42>
    >*macro_call@pagemacro C1
     >*brace_arg
  *normal_command@page C1
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
  *normal_command@page C1
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;40>
  *paragraph C1
   {normal_text:After page on its own line.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@@
   {normal_text:page }
   >SOURCEMARKS
   >macro_expansion<start;41><p:5>
    >*macro_call@pagemacro C1
     >*brace_arg
  *normal_command@page C1
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;41>
  *paragraph C9
   {normal_text:two spaces   }
   *normal_command@@
   {normal_text:noindent }
   >SOURCEMARKS
   >macro_expansion<start;42><p:9>
    >*macro_call@noindentmacro C1
     >*brace_arg
   *normal_command@noindent l174:@noindentmacro
   {ignorable_spaces_after_command:    }
   >SOURCEMARKS
   >macro_expansion<end;42>
   *normal_command@@
   {normal_text:refill }
   >SOURCEMARKS
   >macro_expansion<start;43><p:7>
    >*macro_call@refillmacro C1
     >*brace_arg
   *normal_command@refill
   >SOURCEMARKS
   >macro_expansion<end;43>
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l176
  |formal_args:A{}
  |macro_name:{contentsmacro}
  >SOURCEMARKS
  >macro_expansion<start;44>
   >*macro_call@contentsmacro C1
    >*brace_arg
   *arguments_line C1
    {macro_line: contentsmacro \\n}
   {raw:@contents\\n}
   *normal_command@end C1 l178
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@contents C1 l179:@contentsmacro
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;44>
  {empty_line:\\n}
  *normal_command@vskip C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:@atext{}}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l183
  |formal_args:A{}
  |macro_name:{exdentmacro}
  >SOURCEMARKS
  >macro_expansion<start;45>
   >*macro_call@exdentmacro C1
    >*brace_arg
   *arguments_line C1
    {macro_line: exdentmacro \\n}
   {raw:@exdent\\n}
   *normal_command@end C1 l185
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@exdent C1 l186:@exdentmacro
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<end;45>
    {normal_text:line after exdent}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l188
  |formal_args:A{}
  |macro_name:{two}
   *arguments_line C1
    {macro_line: two \\n}
   {raw:2\\n}
   *normal_command@end C1 l190
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@sp C1 l191
  |misc_args:A{2}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;46><p:1>
     >*macro_call@two C1
      >*brace_arg
    {normal_text:2}
    >SOURCEMARKS
    >macro_expansion<end;46><p:1>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l193
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l194
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node-atext}
     {normal_text:node atext}
     >SOURCEMARKS
     >macro_expansion<start;47><p:5>
      >*macro_call@text C1
       >*brace_arg
     >macro_expansion<end;47><p:10>
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l195
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l197 {node atext}
 |identifier:{node-atext}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node atext}
    >SOURCEMARKS
    >macro_expansion<start;48><p:5>
     >*macro_call@text C1
      >*brace_arg
    >macro_expansion<end;48><p:10>
    {spaces_after_argument:\\n}
 *normal_command@chapter C9 l198 {chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;49><p:1>
   >*macro_call@contentsmacro C1
    >*brace_arg
  *normal_command@contents C1 l200:@contentsmacro
  |global_command_number:{2}
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;49>
  {empty_line:\\n}
  *normal_command@macro C3 l202
  |formal_args:A{}
  |macro_name:{shortcontentsmacro}
  >SOURCEMARKS
  >macro_expansion<start;50>
   >*macro_call@shortcontentsmacro C1
    >*brace_arg
   *arguments_line C1
    {macro_line: shortcontentsmacro \\n}
   {raw:@shortcontents\\n}
   *normal_command@end C1 l204
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  *normal_command@shortcontents C1 l205:@shortcontentsmacro
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >macro_expansion<end;50>
  {empty_line:\\n}
  *normal_command@macro C3 l207
  |formal_args:A{}
  |macro_name:{byemacro}
   *arguments_line C1
    {macro_line: byemacro\\n}
   {raw:@bye\\n}
   *normal_command@end C1 l209
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;51><p:1>
   >*macro_call@byemacro C1
    >*brace_arg
 *normal_command@bye C1
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
