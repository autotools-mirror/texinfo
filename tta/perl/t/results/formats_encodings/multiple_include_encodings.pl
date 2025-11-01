use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'multiple_include_encodings'} = '*document_root C19
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\input texinfo.tex\\n}
  *preamble_before_content C10
   *@documentencoding C1 multiple_include_encodings.texi:l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ISO-8859-1}
   {empty_line:\\n}
   *@copying C3 multiple_include_encodings.texi:l4
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C1
     {Télé.\\n}
    *@end C1 multiple_include_encodings.texi:l6
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{copying}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {copying}
   {empty_line:\\n}
   >SOURCEMARKS
   >include<start;1><p:1>
    >*@include C1 multiple_include_encodings.texi:l8
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
    >|EXTRA
    >|text_arg:{documentdescription_EUC_CN.texi}
     >*line_arg C1
     >|INFO
     >|spaces_after_argument:
      >|{spaces_after_argument:\\n}
      >{documentdescription_EUC_CN.texi}
   *@documentencoding C1 documentdescription_EUC_CN.texi:l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{2}
   |input_encoding_name:{euc-cn}
   |text_arg:{EUC-CN}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {EUC-CN}
   {empty_line:\\n}
   *@documentdescription C3 documentdescription_EUC_CN.texi:l3
   >SOURCEMARKS
   >include<end;1>
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *paragraph C1
     {Sample 示例 \\n}
    *@end C1 documentdescription_EUC_CN.texi:l5
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{documentdescription}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {documentdescription}
   {empty_line:\\n}
   *@documentencoding C1 multiple_include_encodings.texi:l10
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{3}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {ISO-8859-1}
   {empty_line:\\n}
 *@node C1 multiple_include_encodings.texi:l12 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C4 multiple_include_encodings.texi:l13 {include files with multiple encodings}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {include files with multiple encodings}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;2><p:1>
   >*@include C1 multiple_include_encodings.texi:l15
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{verbatim_encoded_latin1.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{verbatim_encoded_latin1.texi}
  *paragraph C1
   {é\\n}
   >SOURCEMARKS
   >include<end;2><p:2>
  {empty_line:\\n}
 *@node C1 multiple_include_encodings.texi:l17 {ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{_00e4-_00eb-_00ef-_00f6-_00fc-_00ff-_00c4-_00cb-_00cf-_00d6-_00dc}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
 *@chapter C6 multiple_include_encodings.texi:l18 {ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;3><p:1>
   >*@include C1 multiple_include_encodings.texi:l20
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{chapter_japanese_shift_jis.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{chapter_japanese_shift_jis.texi}
  *@documentencoding C1 chapter_japanese_shift_jis.texi:l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{4}
  |input_encoding_name:{shift_jis}
  |text_arg:{shift_jis}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {shift_jis}
  *@documentlanguage C1 chapter_japanese_shift_jis.texi:l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |text_arg:{ja}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ja}
  {empty_line:\\n}
  {empty_line:\\n}
 *@node C1 chapter_japanese_shift_jis.texi:l5 {Preface}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Preface}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Preface}
 *@chapter C7 chapter_japanese_shift_jis.texi:l6 {Preface}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Preface}
  {empty_line:\\n}
  *paragraph C1
   {これは GNU LilyPond バージョン \\n}
  {empty_line:\\n}
  *paragraph C1
   {それは 1995 年のある日の EJE (Eindhoven Youth Orchestra) のリハーサル中のできごとでした − ある変わり者のバイオリン奏者であるジャンは同じく変わり者のフレンチホルン奏者のハン-ウェンに彼がかかわっている新しい大きなプロジェクトのことを話しました。それは音楽を出版するための自動化されたシステムです (正確には、それは MPP − MusiXTeX のプリプロセッサです)。それを聞いてハン-ウェンはすぐに楽譜からいくつかの部分をプリントアウトしたいと思い、彼はそのためのソフトウェアを探し始め、すぐにその虜になってしまいました。それが MPP の終わりを決定付けました。多くの哲学的考察を含み白熱した email の交換の後、ハン-ウェンは 1996 年に LilyPond の製作を開始しました。この時、ジャンはハン-ウェンの新しいプロジェクトに引きずり込まれました。\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *@node C1 chapter_japanese_shift_jis.texi:l13 {Introduction}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{Introduction}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Introduction}
 *@chapter C7 chapter_japanese_shift_jis.texi:l14 {Introduction}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Introduction}
  {empty_line:\\n}
  *paragraph C1
   {この章では読者に LilyPond とこのドキュメントについての紹介を行います。\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;3><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;4><p:1>
   >*@include C1 multiple_include_encodings.texi:l22
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{chapter_char_latin2_latin2_in_refs.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{chapter_char_latin2_latin2_in_refs.texi}
  *@documentencoding C1 chapter_char_latin2_latin2_in_refs.texi:l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{5}
  |input_encoding_name:{iso-8859-2}
  |text_arg:{ISO-8859-2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ISO-8859-2}
  {empty_line:\\n}
 *@node C1 chapter_char_latin2_latin2_in_refs.texi:l3 {char latin2 latin2}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{5}
 |normalized:{char-latin2-latin2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {char latin2 latin2}
 *@chapter C9 chapter_char_latin2_latin2_in_refs.texi:l4 {char latin2 latin2 in refs}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {char latin2 latin2 in refs}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 chapter_char_latin2_latin2_in_refs.texi:l6
    *brace_arg C1
    |EXTRA
    |node_content:{Ą ą ˛ Ę ę}
    |normalized:{_0104-_0105-_02db-_0118-_0119}
     {Ą ą ˛ Ę ę}
   {.\\n}
  {empty_line:\\n}
  *@printindex C1 chapter_char_latin2_latin2_in_refs.texi:l8
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  {empty_line:\\n}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:Aogonek(0xa1=0241) aogonek(0xb1=0261) standalone ogonek(0xca=0312) Eogonek(0xea=0352) eogonek}
  *@menu C3 chapter_char_latin2_latin2_in_refs.texi:l11
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 chapter_char_latin2_latin2_in_refs.texi:l12
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Ą ą ˛ Ę ę}
    |normalized:{_0104-_0105-_02db-_0118-_0119}
     {Ą ą ˛ Ę ę}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 chapter_char_latin2_latin2_in_refs.texi:l13
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C1 chapter_char_latin2_latin2_in_refs.texi:l15 {Ą ą ˛ Ę ę}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{_0104-_0105-_02db-_0118-_0119}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Ą ą ˛ Ę ę}
 *@section C7 chapter_char_latin2_latin2_in_refs.texi:l16 {Ą ą ˛ Ę ę}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4.1}
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Ą ą ˛ Ę ę}
  {empty_line:\\n}
  *index_entry_command@cindex C1 chapter_char_latin2_latin2_in_refs.texi:l18
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |element_node:{_0104-_0105-_02db-_0118-_0119}
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Ą ą ˛ Ę ę}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;4><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;5><p:1>
   >*@include C1 multiple_include_encodings.texi:l24
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{chapter_chinese_mixed_with_en_EUC_CN.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{chapter_chinese_mixed_with_en_EUC_CN.texi}
  *@documentencoding C1 chapter_chinese_mixed_with_en_EUC_CN.texi:l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{6}
  |input_encoding_name:{euc-cn}
  |text_arg:{EUC-CN}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {EUC-CN}
  {empty_line:\\n}
 *@node C1 chapter_chinese_mixed_with_en_EUC_CN.texi:l3 {Mixed english and chinese EUC-CN}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{7}
 |normalized:{Mixed-english-and-chinese-EUC_002dCN}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Mixed english and chinese EUC-CN}
 *@chapter C25 chapter_chinese_mixed_with_en_EUC_CN.texi:l4 {Mixed english and chinese EUC-CN}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Mixed english and chinese EUC-CN}
  {empty_line:\\n}
  *paragraph C2
   {Example of english and chinese, chinese aligned or not.\\n}
   {1. english only\\n}
  {empty_line:\\n}
  *paragraph C5
   {The Emacs mode for programming in Ada 95 with GNAT helps the user\\n}
   {in\\n}
   {understanding existing code and facilitates writing new code.  It\\n}
   {furthermore provides some utility functions for easier integration of\\n}
   {standard Emacs features when programming in Ada.\\n}
  {empty_line:\\n}
  *paragraph C1
   {2. chinese already aligned in source(this result)\\n}
  {empty_line:\\n}
  *paragraph C2
   {这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存读取\\n}
   {变量的值，而不是作某些优化。（这些优化有可能导致程序不能获得正确的值）\\n}
  {empty_line:\\n}
  *paragraph C1
   {3. chinese not aligned in source\\n}
  {empty_line:\\n}
  *paragraph C4
   {这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存\\n}
   {读取\\n}
   {变量的值，而不是作某些优化。\\n}
   {（这些优化有可能导致程序不能获得正确的值）\\n}
  {empty_line:\\n}
  *paragraph C1
   {4. a mix of chinese and english\\n}
  {empty_line:\\n}
  *paragraph C2
   {restrict 表示在当前 scope 内不允许其它变量指向它。用处，比如防止 memory\\n}
   {overlap。\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;5><p:1>
  {empty_line:\\n}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:need to finish with an encoding that can accept all the}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:codepoints used in the other encodings}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;6><p:1>
   >*@include C1 multiple_include_encodings.texi:l29
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{chapter_chinese_mixed_with_en.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument:\\n}
     >{chapter_chinese_mixed_with_en.texi}
  *@documentencoding C1 chapter_chinese_mixed_with_en.texi:l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{7}
  |input_encoding_name:{utf-8}
  |text_arg:{utf-8}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {utf-8}
  {empty_line:\\n}
 *@node C1 chapter_chinese_mixed_with_en.texi:l3 {Mixed chinese and english utf-8}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{8}
 |normalized:{Mixed-chinese-and-english-utf_002d8}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Mixed chinese and english utf-8}
 *@chapter C21 chapter_chinese_mixed_with_en.texi:l4 {Mixed chinese and english utf-8}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{6}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Mixed chinese and english utf-8}
  {empty_line:\\n}
  *paragraph C1
   {Example of english and chinese, chinese aligned or not.\\n}
  {empty_line:\\n}
  *paragraph C1
   {1. english only\\n}
  {empty_line:\\n}
  *paragraph C5
   {The Emacs mode for programming in Ada 95 with GNAT helps the user\\n}
   {in\\n}
   {understanding existing code and facilitates writing new code.  It\\n}
   {furthermore provides some utility functions for easier integration of\\n}
   {standard Emacs features when programming in Ada.\\n}
  {empty_line:\\n}
  *paragraph C1
   {2. chinese already aligned in source(this result)\\n}
  {empty_line:\\n}
  *paragraph C2
   {这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存读取\\n}
   {变量的值，而不是作某些优化。（这些优化有可能导致程序不能获得正确的值）\\n}
  {empty_line:\\n}
  *paragraph C1
   {3. chinese not aligned in source\\n}
  {empty_line:\\n}
  *paragraph C4
   {这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存\\n}
   {读取\\n}
   {变量的值，而不是作某些优化。\\n}
   {（这些优化有可能导致程序不能获得正确的值）\\n}
  {empty_line:\\n}
  *paragraph C1
   {4. a mix of chinese and english\\n}
  {empty_line:\\n}
  *paragraph C2
   {restrict 表示在当前 scope 内不允许其它变量指向它。用处，比如防止 memory\\n}
   {overlap。\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
 *postamble_after_end C3
  {}
  >SOURCEMARKS
  >include<end;6>
  {text_after_end:\\n}
  {text_after_end:@bye\\n}
';


$result_texis{'multiple_include_encodings'} = '\\input texinfo.tex
@documentencoding ISO-8859-1

@copying
Télé.
@end copying

@documentencoding EUC-CN

@documentdescription
Sample 示例 
@end documentdescription

@documentencoding ISO-8859-1

@node Top
@top include files with multiple encodings

é

@node ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
@chapter ä ë ï ö ü ÿ Ä Ë Ï Ö Ü

@documentencoding shift_jis
@documentlanguage ja


@node Preface
@chapter Preface

これは GNU LilyPond バージョン 

それは 1995 年のある日の EJE (Eindhoven Youth Orchestra) のリハーサル中のできごとでした − ある変わり者のバイオリン奏者であるジャンは同じく変わり者のフレンチホルン奏者のハン-ウェンに彼がかかわっている新しい大きなプロジェクトのことを話しました。それは音楽を出版するための自動化されたシステムです (正確には、それは MPP − MusiXTeX のプリプロセッサです)。それを聞いてハン-ウェンはすぐに楽譜からいくつかの部分をプリントアウトしたいと思い、彼はそのためのソフトウェアを探し始め、すぐにその虜になってしまいました。それが MPP の終わりを決定付けました。多くの哲学的考察を含み白熱した email の交換の後、ハン-ウェンは 1996 年に LilyPond の製作を開始しました。この時、ジャンはハン-ウェンの新しいプロジェクトに引きずり込まれました。


@node Introduction
@chapter Introduction

この章では読者に LilyPond とこのドキュメントについての紹介を行います。


@documentencoding ISO-8859-2

@node char latin2 latin2
@chapter char latin2 latin2 in refs

@ref{Ą ą ˛ Ę ę}.

@printindex cp

@c Aogonek(0xa1=0241) aogonek(0xb1=0261) standalone ogonek(0xca=0312) Eogonek(0xea=0352) eogonek
@menu
* Ą ą ˛ Ę ę::
@end menu

@node Ą ą ˛ Ę ę
@section Ą ą ˛ Ę ę

@cindex Ą ą ˛ Ę ę


@documentencoding EUC-CN

@node Mixed english and chinese EUC-CN
@chapter Mixed english and chinese EUC-CN

Example of english and chinese, chinese aligned or not.
1. english only

The Emacs mode for programming in Ada 95 with GNAT helps the user
in
understanding existing code and facilitates writing new code.  It
furthermore provides some utility functions for easier integration of
standard Emacs features when programming in Ada.

2. chinese already aligned in source(this result)

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存读取
变量的值，而不是作某些优化。（这些优化有可能导致程序不能获得正确的值）

3. chinese not aligned in source

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存
读取
变量的值，而不是作某些优化。
（这些优化有可能导致程序不能获得正确的值）

4. a mix of chinese and english

restrict 表示在当前 scope 内不允许其它变量指向它。用处，比如防止 memory
overlap。



@c need to finish with an encoding that can accept all the
@c codepoints used in the other encodings

@documentencoding utf-8

@node Mixed chinese and english utf-8
@chapter Mixed chinese and english utf-8

Example of english and chinese, chinese aligned or not.

1. english only

The Emacs mode for programming in Ada 95 with GNAT helps the user
in
understanding existing code and facilitates writing new code.  It
furthermore provides some utility functions for easier integration of
standard Emacs features when programming in Ada.

2. chinese already aligned in source(this result)

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存读取
变量的值，而不是作某些优化。（这些优化有可能导致程序不能获得正确的值）

3. chinese not aligned in source

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存
读取
变量的值，而不是作某些优化。
（这些优化有可能导致程序不能获得正确的值）

4. a mix of chinese and english

restrict 表示在当前 scope 内不允许其它变量指向它。用处，比如防止 memory
overlap。


@bye

@bye
';


$result_texts{'multiple_include_encodings'} = '




include files with multiple encodings
*************************************

é

1 ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
***********************



2 Preface
*********

これは GNU LilyPond バージョン 

それは 1995 年のある日の EJE (Eindhoven Youth Orchestra) のリハーサル中のできごとでした − ある変わり者のバイオリン奏者であるジャンは同じく変わり者のフレンチホルン奏者のハン-ウェンに彼がかかわっている新しい大きなプロジェクトのことを話しました。それは音楽を出版するための自動化されたシステムです (正確には、それは MPP − MusiXTeX のプリプロセッサです)。それを聞いてハン-ウェンはすぐに楽譜からいくつかの部分をプリントアウトしたいと思い、彼はそのためのソフトウェアを探し始め、すぐにその虜になってしまいました。それが MPP の終わりを決定付けました。多くの哲学的考察を含み白熱した email の交換の後、ハン-ウェンは 1996 年に LilyPond の製作を開始しました。この時、ジャンはハン-ウェンの新しいプロジェクトに引きずり込まれました。


3 Introduction
**************

この章では読者に LilyPond とこのドキュメントについての紹介を行います。



4 char latin2 latin2 in refs
****************************

Ą ą ˛ Ę ę.


* Ą ą ˛ Ę ę::

4.1 Ą ą ˛ Ę ę
=============




5 Mixed english and chinese EUC-CN
**********************************

Example of english and chinese, chinese aligned or not.
1. english only

The Emacs mode for programming in Ada 95 with GNAT helps the user
in
understanding existing code and facilitates writing new code.  It
furthermore provides some utility functions for easier integration of
standard Emacs features when programming in Ada.

2. chinese already aligned in source(this result)

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存读取
变量的值，而不是作某些优化。（这些优化有可能导致程序不能获得正确的值）

3. chinese not aligned in source

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存
读取
变量的值，而不是作某些优化。
（这些优化有可能导致程序不能获得正确的值）

4. a mix of chinese and english

restrict 表示在当前 scope 内不允许其它变量指向它。用处，比如防止 memory
overlap。





6 Mixed chinese and english utf-8
*********************************

Example of english and chinese, chinese aligned or not.

1. english only

The Emacs mode for programming in Ada 95 with GNAT helps the user
in
understanding existing code and facilitates writing new code.  It
furthermore provides some utility functions for easier integration of
standard Emacs features when programming in Ada.

2. chinese already aligned in source(this result)

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存读取
变量的值，而不是作某些优化。（这些优化有可能导致程序不能获得正确的值）

3. chinese not aligned in source

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存
读取
变量的值，而不是作某些优化。
（这些优化有可能导致程序不能获得正确的值）

4. a mix of chinese and english

restrict 表示在当前 scope 内不允许其它变量指向它。用处，比如防止 memory
overlap。


';

$result_errors{'multiple_include_encodings'} = '* W documentdescription_EUC_CN.texi:l1|encoding `EUC-CN\' is not a canonical texinfo encoding
 warning: encoding `EUC-CN\' is not a canonical texinfo encoding

* W chapter_japanese_shift_jis.texi:l1|encoding `shift_jis\' is not a canonical texinfo encoding
 warning: encoding `shift_jis\' is not a canonical texinfo encoding

* W chapter_chinese_mixed_with_en_EUC_CN.texi:l1|encoding `EUC-CN\' is not a canonical texinfo encoding
 warning: encoding `EUC-CN\' is not a canonical texinfo encoding

';

$result_nodes_list{'multiple_include_encodings'} = '1|Top
 associated_section: include files with multiple encodings
 associated_title_command: include files with multiple encodings
 node_directions:
  next->ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
2|ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 associated_section: 1 ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 associated_title_command: 1 ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 node_directions:
  next->Preface
  prev->Top
  up->Top
3|Preface
 associated_section: 2 Preface
 associated_title_command: 2 Preface
 node_directions:
  next->Introduction
  prev->ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
  up->Top
4|Introduction
 associated_section: 3 Introduction
 associated_title_command: 3 Introduction
 node_directions:
  next->char latin2 latin2
  prev->Preface
  up->Top
5|char latin2 latin2
 associated_section: 4 char latin2 latin2 in refs
 associated_title_command: 4 char latin2 latin2 in refs
 menus:
  Ą ą ˛ Ę ę
 node_directions:
  next->Mixed english and chinese EUC-CN
  prev->Introduction
  up->Top
6|Ą ą ˛ Ę ę
 associated_section: 4.1 Ą ą ˛ Ę ę
 associated_title_command: 4.1 Ą ą ˛ Ę ę
 node_directions:
  up->char latin2 latin2
7|Mixed english and chinese EUC-CN
 associated_section: 5 Mixed english and chinese EUC-CN
 associated_title_command: 5 Mixed english and chinese EUC-CN
 node_directions:
  next->Mixed chinese and english utf-8
  prev->char latin2 latin2
  up->Top
8|Mixed chinese and english utf-8
 associated_section: 6 Mixed chinese and english utf-8
 associated_title_command: 6 Mixed chinese and english utf-8
 node_directions:
  prev->Mixed english and chinese EUC-CN
  up->Top
';

$result_sections_list{'multiple_include_encodings'} = '1|include files with multiple encodings
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 section_children:
  1|ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
  2|Preface
  3|Introduction
  4|char latin2 latin2 in refs
  5|Mixed english and chinese EUC-CN
  6|Mixed chinese and english utf-8
2|ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 associated_anchor_command: ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 associated_node: ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
 section_directions:
  next->Preface
  up->include files with multiple encodings
 toplevel_directions:
  next->Preface
  prev->include files with multiple encodings
  up->include files with multiple encodings
3|Preface
 associated_anchor_command: Preface
 associated_node: Preface
 section_directions:
  next->Introduction
  prev->ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
  up->include files with multiple encodings
 toplevel_directions:
  next->Introduction
  prev->ä ë ï ö ü ÿ Ä Ë Ï Ö Ü
  up->include files with multiple encodings
4|Introduction
 associated_anchor_command: Introduction
 associated_node: Introduction
 section_directions:
  next->char latin2 latin2 in refs
  prev->Preface
  up->include files with multiple encodings
 toplevel_directions:
  next->char latin2 latin2 in refs
  prev->Preface
  up->include files with multiple encodings
5|char latin2 latin2 in refs
 associated_anchor_command: char latin2 latin2
 associated_node: char latin2 latin2
 section_directions:
  next->Mixed english and chinese EUC-CN
  prev->Introduction
  up->include files with multiple encodings
 toplevel_directions:
  next->Mixed english and chinese EUC-CN
  prev->Introduction
  up->include files with multiple encodings
 section_children:
  1|Ą ą ˛ Ę ę
6|Ą ą ˛ Ę ę
 associated_anchor_command: Ą ą ˛ Ę ę
 associated_node: Ą ą ˛ Ę ę
 section_directions:
  up->char latin2 latin2 in refs
7|Mixed english and chinese EUC-CN
 associated_anchor_command: Mixed english and chinese EUC-CN
 associated_node: Mixed english and chinese EUC-CN
 section_directions:
  next->Mixed chinese and english utf-8
  prev->char latin2 latin2 in refs
  up->include files with multiple encodings
 toplevel_directions:
  next->Mixed chinese and english utf-8
  prev->char latin2 latin2 in refs
  up->include files with multiple encodings
8|Mixed chinese and english utf-8
 associated_anchor_command: Mixed chinese and english utf-8
 associated_node: Mixed chinese and english utf-8
 section_directions:
  prev->Mixed english and chinese EUC-CN
  up->include files with multiple encodings
 toplevel_directions:
  prev->Mixed english and chinese EUC-CN
  up->include files with multiple encodings
';

$result_sectioning_root{'multiple_include_encodings'} = 'level: -1
list:
 1|include files with multiple encodings
';

$result_headings_list{'multiple_include_encodings'} = '';

$result_indices_sort_strings{'multiple_include_encodings'} = 'cp:
 Ą ą ˛ Ę ę
';

1;
