use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'value_in_misc_commands'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@set C1
   |EXTRA
   |misc_args:A{text|atext}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:text atext}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 l4 {top atext}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top atext}
    >SOURCEMARKS
    >value_expansion<start;1><p:4>{atext}
     >*@value C1
      >*brace_container C1
       >{text}
    >value_expansion<end;1><p:9>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C132 l6 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@subheading C1 l8
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {Comment like: atext}
    >SOURCEMARKS
    >value_expansion<start;2><p:14>{atext}
     >*@value C1
      >*brace_container C1
       >{text}
    >value_expansion<end;2><p:19>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {Text line followed by a comment on the same line and another below }
   *@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment @value{text}}
     {spaces_after_argument:\\n}
   *@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:comment @value{text}}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{pagesizes_arg|200mm,150mm}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:pagesizes_arg 200mm,150mm}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{afourpaper_macro|@afourpaper}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:afourpaper_macro @afourpaper}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;1><p:1>
   >*@ifnottex C1 l16
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *@pagesizes C1 l17
  >SOURCEMARKS
  >expanded_conditional_command<end;1>
   >*@end C1 l18
   >|EXTRA
   >|text_arg:{ifnottex}
    >*line_arg C3
     >{spaces_before_argument: }
     >{ifnottex}
     >{spaces_after_argument:\\n}
  >value_expansion<start;4>{@afourpaper}
   >*@value C1
    >*brace_container C1
     >{afourpaper_macro}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;3><p:1>{200mm,150mm}
     >*@value C1
      >*brace_container C1
       >{pagesizes_arg}
    {200mm,150mm}
    >SOURCEMARKS
    >value_expansion<end;3><p:11>
    {spaces_after_argument:\\n}
  *@afourpaper C1 l19
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >value_expansion<end;4>
  *@headings C1 l20
  |EXTRA
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {on line following headings atext}
    >SOURCEMARKS
    >value_expansion<start;5><p:27>{atext}
     >*@value C1
      >*brace_container C1
       >{text}
    >value_expansion<end;5><p:32>
    {spaces_after_argument:\\n}
  *@oddfooting C1 l21
   *line_arg C3
    {spaces_before_argument: }
    {some text ignored atext}
    >SOURCEMARKS
    >value_expansion<start;6><p:18>{atext}
     >*@value C1
      >*brace_container C1
       >{text}
    >value_expansion<end;6><p:23>
    {spaces_after_argument:\\n}
  *@everyheading C1 l22
   *line_arg C3
    {spaces_before_argument: }
    {on line following everyheading atext}
    >SOURCEMARKS
    >value_expansion<start;7><p:31>{atext}
     >*@value C1
      >*brace_container C1
       >{text}
    >value_expansion<end;7><p:36>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{need_arg|0.1}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:need_arg 0.1}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;2><p:1>
   >*@ifnottex C1 l26
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *@need C1 l27
  |EXTRA
  |misc_args:A{0.1}
  >SOURCEMARKS
  >expanded_conditional_command<end;2>
   >*@end C1 l28
   >|EXTRA
   >|text_arg:{ifnottex}
    >*line_arg C3
     >{spaces_before_argument: }
     >{ifnottex}
     >{spaces_after_argument:\\n}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;8><p:1>{0.1}
     >*@value C1
      >*brace_container C1
       >{need_arg}
    {0.1}
    >SOURCEMARKS
    >value_expansion<end;8><p:3>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{raisesections_macro|@raisesections}
  >SOURCEMARKS
  >value_expansion<start;9>{@raisesections}
   >*@value C1
    >*brace_container C1
     >{raisesections_macro}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:raisesections_macro @raisesections}
    {spaces_after_argument:\\n}
  *@raisesections C1
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >value_expansion<end;9>
  *@set C1
  |EXTRA
  |misc_args:A{lowersections_macro|@lowersections}
  >SOURCEMARKS
  >value_expansion<start;10>{@lowersections}
   >*@value C1
    >*brace_container C1
     >{lowersections_macro}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:lowersections_macro @lowersections}
    {spaces_after_argument:\\n}
  *@lowersections C1
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >value_expansion<end;10>
  {empty_line:\\n}
  *@c C1
  >SOURCEMARKS
  >expanded_conditional_command<start;3>
   >*@ifnottex C1 l36
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:tex error: Use of \\ doesn\'t match its definition.}
    {spaces_after_argument:\\n}
  *paragraph C3
   *@@
   {definfoenclose phoo,//,\\\\  }
   *@definfoenclose C1 l37
   |EXTRA
   |misc_args:A{phoo|//|\\\\}
    *line_arg C3
     {spaces_before_argument: }
     {phoo,//,\\\\}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phoo C1 l39
   |EXTRA
   |begin:{//}
   |end:{\\\\}
    *brace_container C1
     {bar}
   {\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;3><p:1>
    >*@end C1 l40
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{ifnottex}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{definfoenclose_name|phi}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:definfoenclose_name phi}
    {spaces_after_argument:\\n}
  *@definfoenclose C1 l43
  |EXTRA
  |misc_args:A{phi|:|:}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;11><p:1>{phi}
     >*@value C1
      >*brace_container C1
       >{definfoenclose_name}
    {phi,:,:}
    >SOURCEMARKS
    >value_expansion<end;11><p:3>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phi C1 l45
   |EXTRA
   |begin:{:}
   |end:{:}
    *brace_container C1
     {bar}
   {\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{strong_macro|@strong}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:strong_macro @strong}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{strong_name|strong}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:strong_name strong}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >value_expansion<start;12><p:1>{@strong}
   >*@value C1
    >*brace_container C1
     >{strong_macro}
  *paragraph C2
   *@strong C1 l50
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:}
    |>SOURCEMARKS
    |>value_expansion<end;12>
    *brace_container C1
     {very strong}
   {\\n}
  {empty_line:\\n}
  *@definfoenclose C1 l52
  |EXTRA
  |misc_args:A{strong|(strong:|:)}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;13><p:1>{strong}
     >*@value C1
      >*brace_container C1
       >{strong_name}
    {strong,(strong:,:)}
    >SOURCEMARKS
    >value_expansion<end;13><p:6>
    >value_expansion<start;14><p:8>{strong}
     >*@value C1
      >*brace_container C1
       >{strong_name}
    >value_expansion<end;14><p:14>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >value_expansion<start;15><p:1>{@strong}
   >*@value C1
    >*brace_container C1
     >{strong_macro}
  *paragraph C2
   *definfoenclose_command@strong C1 l54
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg:}
    |>SOURCEMARKS
    |>value_expansion<end;15>
   |EXTRA
   |begin:{(strong:}
   |end:{:)}
    *brace_container C1
     { is it really strong? }
   {\\n}
  {empty_line:\\n}
  *paragraph C2
   *@kbd C1 l56
    *brace_container C1
     {something before kbdinputstyle}
   {\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{kbdinputstyle_arg|code}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:kbdinputstyle_arg code}
    {spaces_after_argument:\\n}
  *@kbdinputstyle C1 l59
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{code}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;16><p:1>{code}
     >*@value C1
      >*brace_container C1
       >{kbdinputstyle_arg}
    {code}
    >SOURCEMARKS
    >value_expansion<end;16><p:4>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@kbd C1 l61
   |EXTRA
   |code:{1}
    *brace_container C1
     {truc}
   {\\n}
  {empty_line:\\n}
  *@example C3 l63
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    *@kbd C1 l64
    |EXTRA
    |code:{1}
     *brace_container C1
      {example}
    {\\n}
   *@end C1 l65
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{asis_arg|asis}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:asis_arg asis}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{zero|0}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:zero 0}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{none_arg|none}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:none_arg none}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{four|4}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:four 4}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{six|6}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:six 6}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@paragraphindent C1 l73
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{asis}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;17><p:1>{asis}
     >*@value C1
      >*brace_container C1
       >{asis_arg}
    {asis}
    >SOURCEMARKS
    >value_expansion<end;17><p:4>
    {spaces_after_argument:\\n}
  *@paragraphindent C1 l74
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{0}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;18><p:1>{0}
     >*@value C1
      >*brace_container C1
       >{zero}
    {0}
    >SOURCEMARKS
    >value_expansion<end;18><p:1>
    {spaces_after_argument:\\n}
  *@paragraphindent C1 l75
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{none}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;19><p:1>{none}
     >*@value C1
      >*brace_container C1
       >{none_arg}
    {none}
    >SOURCEMARKS
    >value_expansion<end;19><p:4>
    {spaces_after_argument:\\n}
  *@paragraphindent C1 l76
  |EXTRA
  |global_command_number:{4}
  |misc_args:A{4}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;20><p:1>{4}
     >*@value C1
      >*brace_container C1
       >{four}
    {4}
    >SOURCEMARKS
    >value_expansion<end;20><p:1>
    {spaces_after_argument:\\n}
  *@firstparagraphindent C1 l77
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{none}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;21><p:1>{none}
     >*@value C1
      >*brace_container C1
       >{none_arg}
    {none}
    >SOURCEMARKS
    >value_expansion<end;21><p:4>
    {spaces_after_argument:\\n}
  *@exampleindent C1 l78
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{6}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;22><p:1>{6}
     >*@value C1
      >*brace_container C1
       >{six}
    {6}
    >SOURCEMARKS
    >value_expansion<end;22><p:1>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{end_arg|end}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:end_arg end}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{separate_arg|separate}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:separate_arg separate }
    {spaces_after_argument:\\n}
  *@footnotestyle C1 l82
  |EXTRA
  |misc_args:A{end}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;23><p:1>{end}
     >*@value C1
      >*brace_container C1
       >{end_arg}
    {end}
    >SOURCEMARKS
    >value_expansion<end;23><p:3>
    {spaces_after_argument:\\n}
  *@footnotestyle C1 l83
  |EXTRA
  |misc_args:A{separate}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;24><p:1>{separate}
     >*@value C1
      >*brace_container C1
       >{separate_arg}
    {separate}
    >SOURCEMARKS
    >value_expansion<end;24><p:8>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{latin1|ISO-8859-1}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:latin1 ISO-8859-1}
    {spaces_after_argument:\\n}
  *@documentencoding C1 l86
  |EXTRA
  |global_command_number:{1}
  |input_encoding_name:{iso-8859-1}
  |text_arg:{ISO-8859-1}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;25><p:1>{ISO-8859-1}
     >*@value C1
      >*brace_container C1
       >{latin1}
    {ISO-8859-1}
    >SOURCEMARKS
    >value_expansion<end;25><p:10>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{en|en}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:en en}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{documentlanguage_command|@documentlanguage}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:documentlanguage_command @documentlanguage}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {documentlanguage }
   *@documentlanguage C1 l91
   |EXTRA
   |global_command_number:{1}
   |text_arg:{en}
    *line_arg C3
     {spaces_before_argument:  }
     >SOURCEMARKS
     >value_expansion<start;26><p:2>{en}
      >*@value C1
       >*brace_container C1
        >{en}
     {en}
     >SOURCEMARKS
     >value_expansion<end;26><p:2>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {documentlanguage on its line\\n}
   >SOURCEMARKS
   >value_expansion<start;27><p:29>{@documentlanguage}
    >*@value C1
     >*brace_container C1
      >{documentlanguage_command}
   *@documentlanguage C1 l94
   |EXTRA
   |global_command_number:{2}
   |text_arg:{en}
    *line_arg C3
     {spaces_before_argument:  }
     >SOURCEMARKS
     >value_expansion<end;27>
     {en}
     {spaces_after_argument:\\n}
   {line following documentlanguage\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{on_arg|on}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:on_arg on}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{off_arg|off}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:off_arg off}
    {spaces_after_argument:\\n}
  *@frenchspacing C1 l99
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{on}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;28><p:1>{on}
     >*@value C1
      >*brace_container C1
       >{on_arg}
    {on}
    >SOURCEMARKS
    >value_expansion<end;28><p:2>
    {spaces_after_argument:\\n}
  *@frenchspacing C1 l100
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{off}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;29><p:1>{off}
     >*@value C1
      >*brace_container C1
       >{off_arg}
    {off}
    >SOURCEMARKS
    >value_expansion<end;29><p:3>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:accepts 10 or 11}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{ten|10}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:ten 10}
    {spaces_after_argument:\\n}
  *@fonttextsize C1 l104
  |EXTRA
  |misc_args:A{10}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;30><p:1>{10}
     >*@value C1
      >*brace_container C1
       >{ten}
    {10}
    >SOURCEMARKS
    >value_expansion<end;30><p:2>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:accept false or true}
    {spaces_after_argument:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:makeinfo don\'t care about the arg and remove the remaining of the line}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{false_arg|false}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:false_arg false}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{true_arg|true}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:true_arg true}
    {spaces_after_argument:\\n}
  *@allowcodebreaks C1 l110
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{false}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;31><p:1>{false}
     >*@value C1
      >*brace_container C1
       >{false_arg}
    {false}
    >SOURCEMARKS
    >value_expansion<end;31><p:5>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@allowcodebreaks C1 l112
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{true}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;32><p:1>{true}
     >*@value C1
      >*brace_container C1
       >{true_arg}
    {true}
    >SOURCEMARKS
    >value_expansion<end;32><p:4>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{page_macro|@page}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:page_macro @page}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{noindent_macro|@noindent}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:noindent_macro @noindent}
    {spaces_after_argument:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{refill_macro|@refill}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:refill_macro @refill}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@@
   {page }
   >SOURCEMARKS
   >value_expansion<start;33><p:5>{@page}
    >*@value C1
     >*brace_container C1
      >{page_macro}
  *@page C1
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<end;33>
    {rawline_text:@@noindent @value{noindent_macro} @@refill @value{refill_macro} something}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >value_expansion<start;34><p:1>{@noindent}
   >*@value C1
    >*brace_container C1
     >{noindent_macro}
  *@noindent l120
  {ignorable_spaces_after_command:     }
  >SOURCEMARKS
  >value_expansion<end;34>
  *paragraph C8
  |EXTRA
  |noindent:{1}
   {noindent at beginning of line\\n}
   >SOURCEMARKS
   >value_expansion<start;35><p:30>{@noindent}
    >*@value C1
     >*brace_container C1
      >{noindent_macro}
   *@noindent l121
   {ignorable_spaces_after_command:\\n}
   >SOURCEMARKS
   >value_expansion<end;35>
   {noindent on the preceding line\\n}
   {  }
   >SOURCEMARKS
   >value_expansion<start;36><p:2>{@noindent}
    >*@value C1
     >*brace_container C1
      >{noindent_macro}
   *@noindent l123
   {ignorable_spaces_after_command:    }
   >SOURCEMARKS
   >value_expansion<end;36>
   {noindent after space at beginning of line\\n}
  *@page C1
   *line_arg C3
    {spaces_before_argument:         }
    {rawline_text:page at beginning of line}
    {spaces_after_argument:\\n}
  *@page C1
   *line_arg C1
    {spaces_before_argument:\\n}
  *paragraph C1
   {After page on it\'s own line.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@@
   {page }
   >SOURCEMARKS
   >value_expansion<start;37><p:5>{@page}
    >*@value C1
     >*brace_container C1
      >{page_macro}
  *@page C1
   *line_arg C3
    {spaces_before_argument:   }
    >SOURCEMARKS
    >value_expansion<end;37>
    {rawline_text:@@noindent @value{noindent_macro}    @@refill @value{refill_macro}}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{contents_macro|@contents}
  >SOURCEMARKS
  >value_expansion<start;38>{@contents}
   >*@value C1
    >*brace_container C1
     >{contents_macro}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:contents_macro @contents}
    {spaces_after_argument:\\n}
  *@contents C1 l131
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >value_expansion<end;38>
  {empty_line:\\n}
  *@vskip C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:@value{text}}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{exdent_macro|@exdent}
  >SOURCEMARKS
  >value_expansion<start;39>{@exdent}
   >*@value C1
    >*brace_container C1
     >{exdent_macro}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:exdent_macro @exdent}
    {spaces_after_argument:\\n}
  *@exdent C1 l136
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<end;39>
    {line after exdent}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{two|2}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:two 2}
    {spaces_after_argument:\\n}
  *@sp C1 l139
  |EXTRA
  |misc_args:A{2}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;40><p:1>{2}
     >*@value C1
      >*brace_container C1
       >{two}
    {2}
    >SOURCEMARKS
    >value_expansion<end;40><p:1>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >value_expansion<start;41><p:1>{@contents}
   >*@value C1
    >*brace_container C1
     >{contents_macro}
  *@contents C1 l141
  |EXTRA
  |global_command_number:{2}
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >value_expansion<end;41>
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{shortcontents_macro|@shortcontents}
  >SOURCEMARKS
  >value_expansion<start;42>{@shortcontents}
   >*@value C1
    >*brace_container C1
     >{shortcontents_macro}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:shortcontents_macro @shortcontents}
    {spaces_after_argument:\\n}
  *@shortcontents C1 l144
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
    >SOURCEMARKS
    >value_expansion<end;42>
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{bye_macro|@bye}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:bye_macro @bye}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >value_expansion<start;43><p:1>{@bye}
   >*@value C1
    >*brace_container C1
     >{bye_macro}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:}
   >SOURCEMARKS
   >value_expansion<end;43>
';


$result_texis{'value_in_misc_commands'} = '@set text atext

@node Top
@top top atext

@node chap

@subheading Comment like: atext

Text line followed by a comment on the same line and another below @c comment @value{text}
@c comment @value{text}

@set pagesizes_arg 200mm,150mm
@set afourpaper_macro @afourpaper

@pagesizes 200mm,150mm
@afourpaper
@headings on line following headings atext
@oddfooting some text ignored atext
@everyheading on line following everyheading atext

@set need_arg 0.1

@need 0.1

@set raisesections_macro @raisesections
@raisesections
@set lowersections_macro @lowersections
@lowersections

@c tex error: Use of \\ doesn\'t match its definition.
@@definfoenclose phoo,//,\\\\  @definfoenclose phoo,//,\\\\

@phoo{bar}

@set definfoenclose_name phi
@definfoenclose phi,:,:

@phi{bar}

@set strong_macro @strong
@set strong_name strong

@strong{very strong}

@definfoenclose strong,(strong:,:)

@strong{ is it really strong? }

@kbd{something before kbdinputstyle}

@set kbdinputstyle_arg code
@kbdinputstyle code

@kbd{truc}

@example
@kbd{example}
@end example

@set asis_arg asis
@set zero 0
@set none_arg none
@set four 4
@set six 6

@paragraphindent asis
@paragraphindent 0
@paragraphindent none
@paragraphindent 4
@firstparagraphindent none
@exampleindent 6

@set end_arg end
@set separate_arg separate 
@footnotestyle end
@footnotestyle separate

@set latin1 ISO-8859-1
@documentencoding ISO-8859-1

@set en en
@set documentlanguage_command @documentlanguage

documentlanguage @documentlanguage  en

documentlanguage on its line
@documentlanguage  en
line following documentlanguage

@set on_arg on
@set off_arg off
@frenchspacing on
@frenchspacing off

@c accepts 10 or 11
@set ten 10
@fonttextsize 10

@c accept false or true
@c makeinfo don\'t care about the arg and remove the remaining of the line
@set false_arg false
@set true_arg true
@allowcodebreaks false

@allowcodebreaks true

@set page_macro @page
@set noindent_macro @noindent
@set refill_macro @refill

@@page @page @@noindent @value{noindent_macro} @@refill @value{refill_macro} something

@noindent     noindent at beginning of line
@noindent
noindent on the preceding line
  @noindent    noindent after space at beginning of line
@page         page at beginning of line
@page
After page on it\'s own line.

@@page @page   @@noindent @value{noindent_macro}    @@refill @value{refill_macro}

@set contents_macro @contents
@contents

@vskip @value{text}

@set exdent_macro @exdent
@exdent line after exdent

@set two 2
@sp 2

@contents

@set shortcontents_macro @shortcontents
@shortcontents

@set bye_macro @bye

@bye';


$result_texts{'value_in_misc_commands'} = '
top atext
*********


Comment like: atext
-------------------

Text line followed by a comment on the same line and another below 





@definfoenclose phoo,//,\\\\  
bar


bar


very strong


 is it really strong? 

something before kbdinputstyle


truc

example






documentlanguage 
documentlanguage on its line
line following documentlanguage






@page 

noindent at beginning of line
noindent on the preceding line
  noindent after space at beginning of line


After page on it\'s own line.

@page 



line after exdent







';

$result_errors{'value_in_misc_commands'} = '* E l20|bad argument to @headings: on line following headings atext
 bad argument to @headings: on line following headings atext

* W l37|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* W l37|@definfoenclose should only appear at the beginning of a line
 warning: @definfoenclose should only appear at the beginning of a line

* W l43|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* WC l43|further warnings for @definfoenclose suppressed
 warning: further warnings for @definfoenclose suppressed

* W l83|multiple @footnotestyle
 warning: multiple @footnotestyle

* W l91|@documentlanguage should only appear at the beginning of a line
 warning: @documentlanguage should only appear at the beginning of a line

* W l118|@page should only appear at the beginning of a line
 warning: @page should only appear at the beginning of a line

* W l118|remaining argument on @page line: @@noindent @value{noindent_macro} @@refill @value{refill_macro} something
 warning: remaining argument on @page line: @@noindent @value{noindent_macro} @@refill @value{refill_macro} something

* W l121|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph

* W l123|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph

* W l124|remaining argument on @page line: page at beginning of line
 warning: remaining argument on @page line: page at beginning of line

* W l128|@page should only appear at the beginning of a line
 warning: @page should only appear at the beginning of a line

* W l128|remaining argument on @page line: @@noindent @value{noindent_macro}    @@refill @value{refill_macro}
 warning: remaining argument on @page line: @@noindent @value{noindent_macro}    @@refill @value{refill_macro}

* W l6|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'value_in_misc_commands'} = '1|Top
 associated_section: top atext
 associated_title_command: top atext
 node_directions:
  next->chap
2|chap
 associated_title_command: @subheading Comment like: atext
 node_directions:
  prev->Top
';

$result_sections_list{'value_in_misc_commands'} = '1|top atext
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'value_in_misc_commands'} = 'level: -1
list:
 1|top atext
';

$result_headings_list{'value_in_misc_commands'} = '1|Comment like: atext
 associated_anchor_command: chap
';

1;
