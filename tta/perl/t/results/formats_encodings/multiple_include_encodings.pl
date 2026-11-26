use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multiple_include_encodings'} = '*document_root C19
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\input texinfo.tex\\n}
  *preamble_before_content C10
   *normal_command@documentencoding C1 multiple_include_encodings.texi:l2
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ISO-8859-1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@copying C3 multiple_include_encodings.texi:l4
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:Télé.\\n}
    *normal_command@end C1 multiple_include_encodings.texi:l6
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >include<start;1><p:1>
    >*normal_command@include C1 multiple_include_encodings.texi:l8
    >|text_arg:{documentdescription_EUC_CN.texi}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:documentdescription_EUC_CN.texi}
      >{spaces_after_argument:\\n}
   *normal_command@documentencoding C1 documentdescription_EUC_CN.texi:l1
   |global_command_number:{2}
   |input_encoding_name:{euc-cn}
   |text_arg:{EUC-CN}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:EUC-CN}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@documentdescription C3 documentdescription_EUC_CN.texi:l3
   >SOURCEMARKS
   >include<end;1>
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:Sample 示例 \\n}
    *normal_command@end C1 documentdescription_EUC_CN.texi:l5
    |text_arg:{documentdescription}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:documentdescription}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@documentencoding C1 multiple_include_encodings.texi:l10
   |global_command_number:{3}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ISO-8859-1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 multiple_include_encodings.texi:l12 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 multiple_include_encodings.texi:l13 {include files with multiple encodings}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:include files with multiple encodings}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;2><p:1>
   >*normal_command@include C1 multiple_include_encodings.texi:l15
   >|text_arg:{verbatim_encoded_latin1.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:verbatim_encoded_latin1.texi}
     >{spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:é\\n}
   >SOURCEMARKS
   >include<end;2><p:2>
  {empty_line:\\n}
 *normal_command@node C1 multiple_include_encodings.texi:l17 {ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
 |identifier:{_00e4-_00eb-_00ef-_00f6-_00fc-_00ff-_00c4-_00cb-_00cf-_00d6-_00dc}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 multiple_include_encodings.texi:l18 {ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ä ë ï ö ü ÿ Ä Ë Ï Ö Ü}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;3><p:1>
   >*normal_command@include C1 multiple_include_encodings.texi:l20
   >|text_arg:{chapter_japanese_shift_jis.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:chapter_japanese_shift_jis.texi}
     >{spaces_after_argument:\\n}
  *normal_command@documentencoding C1 chapter_japanese_shift_jis.texi:l1
  |global_command_number:{4}
  |input_encoding_name:{shift_jis}
  |text_arg:{shift_jis}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:shift_jis}
    {spaces_after_argument:\\n}
  *normal_command@documentlanguage C1 chapter_japanese_shift_jis.texi:l2
  |global_command_number:{1}
  |text_arg:{ja}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ja}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@node C1 chapter_japanese_shift_jis.texi:l5 {Preface}
 |identifier:{Preface}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Preface}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 chapter_japanese_shift_jis.texi:l6 {Preface}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Preface}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:これは GNU LilyPond バージョン \\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:それは 1995 年のある日の EJE (Eindhoven Youth Orchestra) のリハーサル中のできごとでした − ある変わり者のバイオリン奏者であるジャンは同じく変わり者のフレンチホルン奏者のハン-ウェンに彼がかかわっている新しい大きなプロジェクトのことを話しました。それは音楽を出版するための自動化されたシステムです (正確には、それは MPP − MusiXTeX のプリプロセッサです)。それを聞いてハン-ウェンはすぐに楽譜からいくつかの部分をプリントアウトしたいと思い、彼はそのためのソフトウェアを探し始め、すぐにその虜になってしまいました。それが MPP の終わりを決定付けました。多くの哲学的考察を含み白熱した email の交換の後、ハン-ウェンは 1996 年に LilyPond の製作を開始しました。この時、ジャンはハン-ウェンの新しいプロジェクトに引きずり込まれました。\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@node C1 chapter_japanese_shift_jis.texi:l13 {Introduction}
 |identifier:{Introduction}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Introduction}
    {spaces_after_argument:\\n}
 *normal_command@chapter C7 chapter_japanese_shift_jis.texi:l14 {Introduction}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Introduction}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:この章では読者に LilyPond とこのドキュメントについての紹介を行います。\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;3><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;4><p:1>
   >*normal_command@include C1 multiple_include_encodings.texi:l22
   >|text_arg:{chapter_char_latin2_latin2_in_refs.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:chapter_char_latin2_latin2_in_refs.texi}
     >{spaces_after_argument:\\n}
  *normal_command@documentencoding C1 chapter_char_latin2_latin2_in_refs.texi:l1
  |global_command_number:{5}
  |input_encoding_name:{iso-8859-2}
  |text_arg:{ISO-8859-2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ISO-8859-2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 chapter_char_latin2_latin2_in_refs.texi:l3 {char latin2 latin2}
 |identifier:{char-latin2-latin2}
 |is_target:{1}
 |isindex:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:char latin2 latin2}
    {spaces_after_argument:\\n}
 *normal_command@chapter C9 chapter_char_latin2_latin2_in_refs.texi:l4 {char latin2 latin2 in refs}
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:char latin2 latin2 in refs}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 chapter_char_latin2_latin2_in_refs.texi:l6
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{_0104-_0105-_02db-_0118-_0119}
     {normal_text:Ą ą ˛ Ę ę}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 chapter_char_latin2_latin2_in_refs.texi:l8
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:Aogonek(0xa1=0241) aogonek(0xb1=0261) standalone ogonek(0xca=0312) Eogonek(0xea=0352) eogonek}
    {spaces_after_argument:\\n}
  *normal_command@menu C3 chapter_char_latin2_latin2_in_refs.texi:l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 chapter_char_latin2_latin2_in_refs.texi:l12
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{_0104-_0105-_02db-_0118-_0119}
     {normal_text:Ą ą ˛ Ę ę}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 chapter_char_latin2_latin2_in_refs.texi:l13
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 chapter_char_latin2_latin2_in_refs.texi:l15 {Ą ą ˛ Ę ę}
 |identifier:{_0104-_0105-_02db-_0118-_0119}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Ą ą ˛ Ę ę}
    {spaces_after_argument:\\n}
 *normal_command@section C7 chapter_char_latin2_latin2_in_refs.texi:l16 {Ą ą ˛ Ę ę}
 |section_heading_number:{4.1}
 |section_level:{2}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Ą ą ˛ Ę ę}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 chapter_char_latin2_latin2_in_refs.texi:l18
  |element_node:{_0104-_0105-_02db-_0118-_0119}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Ą ą ˛ Ę ę}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;4><p:1>
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;5><p:1>
   >*normal_command@include C1 multiple_include_encodings.texi:l24
   >|text_arg:{chapter_chinese_mixed_with_en_EUC_CN.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:chapter_chinese_mixed_with_en_EUC_CN.texi}
     >{spaces_after_argument:\\n}
  *normal_command@documentencoding C1 chapter_chinese_mixed_with_en_EUC_CN.texi:l1
  |global_command_number:{6}
  |input_encoding_name:{euc-cn}
  |text_arg:{EUC-CN}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:EUC-CN}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 chapter_chinese_mixed_with_en_EUC_CN.texi:l3 {Mixed english and chinese EUC-CN}
 |identifier:{Mixed-english-and-chinese-EUC_002dCN}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Mixed english and chinese EUC-CN}
    {spaces_after_argument:\\n}
 *normal_command@chapter C25 chapter_chinese_mixed_with_en_EUC_CN.texi:l4 {Mixed english and chinese EUC-CN}
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Mixed english and chinese EUC-CN}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:Example of english and chinese, chinese aligned or not.\\n}
   {normal_text:1. english only\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:The Emacs mode for programming in Ada 95 with GNAT helps the user\\n}
   {normal_text:in\\n}
   {normal_text:understanding existing code and facilitates writing new code.  It\\n}
   {normal_text:furthermore provides some utility functions for easier integration of\\n}
   {normal_text:standard Emacs features when programming in Ada.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:2. chinese already aligned in source(this result)\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存读取\\n}
   {normal_text:变量的值，而不是作某些优化。（这些优化有可能导致程序不能获得正确的值）\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:3. chinese not aligned in source\\n}
  {empty_line:\\n}
  *paragraph C4
   {normal_text:这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存\\n}
   {normal_text:读取\\n}
   {normal_text:变量的值，而不是作某些优化。\\n}
   {normal_text:（这些优化有可能导致程序不能获得正确的值）\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:4. a mix of chinese and english\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:restrict 表示在当前 scope 内不允许其它变量指向它。用处，比如防止 memory\\n}
   {normal_text:overlap。\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<end;5><p:1>
  {empty_line:\\n}
  *normal_command@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:need to finish with an encoding that can accept all the}
    {spaces_after_argument:\\n}
  *normal_command@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:codepoints used in the other encodings}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;6><p:1>
   >*normal_command@include C1 multiple_include_encodings.texi:l29
   >|text_arg:{chapter_chinese_mixed_with_en.texi}
    >*line_arg C3
     >{spaces_before_argument: }
     >{normal_text:chapter_chinese_mixed_with_en.texi}
     >{spaces_after_argument:\\n}
  *normal_command@documentencoding C1 chapter_chinese_mixed_with_en.texi:l1
  |global_command_number:{7}
  |input_encoding_name:{utf-8}
  |text_arg:{utf-8}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:utf-8}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 chapter_chinese_mixed_with_en.texi:l3 {Mixed chinese and english utf-8}
 |identifier:{Mixed-chinese-and-english-utf_002d8}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Mixed chinese and english utf-8}
    {spaces_after_argument:\\n}
 *normal_command@chapter C21 chapter_chinese_mixed_with_en.texi:l4 {Mixed chinese and english utf-8}
 |section_heading_number:{6}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Mixed chinese and english utf-8}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Example of english and chinese, chinese aligned or not.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:1. english only\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:The Emacs mode for programming in Ada 95 with GNAT helps the user\\n}
   {normal_text:in\\n}
   {normal_text:understanding existing code and facilitates writing new code.  It\\n}
   {normal_text:furthermore provides some utility functions for easier integration of\\n}
   {normal_text:standard Emacs features when programming in Ada.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:2. chinese already aligned in source(this result)\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存读取\\n}
   {normal_text:变量的值，而不是作某些优化。（这些优化有可能导致程序不能获得正确的值）\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:3. chinese not aligned in source\\n}
  {empty_line:\\n}
  *paragraph C4
   {normal_text:这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存\\n}
   {normal_text:读取\\n}
   {normal_text:变量的值，而不是作某些优化。\\n}
   {normal_text:（这些优化有可能导致程序不能获得正确的值）\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:4. a mix of chinese and english\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:restrict 表示在当前 scope 内不允许其它变量指向它。用处，比如防止 memory\\n}
   {normal_text:overlap。\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
 *postamble_after_end C3
  {normal_text:}
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

$result_converted_sort_strings{'file_html'}->{'multiple_include_encodings'} = 'cp:
 Ą ą ˛ Ę ę
';

$result_converted_sort_strings{'file_info'}->{'multiple_include_encodings'} = 'cp:
 Ą ą ˛ Ę ę
';

1;
