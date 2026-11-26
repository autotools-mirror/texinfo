use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'japanese_utf8'} = '*document_root C8
 *before_node_section C2
  *before_beginning C2
   {raw:\\input texinfo @c -*- coding: utf-8; mode: texinfo; -*-\\n}
   *normal_command@documentencoding C1 japanese_utf8.texi:l2
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{UTF-8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:UTF-8}
     {spaces_after_argument:\\n}
  *preamble C5
   *normal_command@setfilename C1 japanese_utf8.texi:l3
   |text_arg:{japanese_utf8.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:japanese_utf8.info}
     {spaces_after_argument:\\n}
   *normal_command@settitle C1 japanese_utf8.texi:l4
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:GNU LilyPond -- Manuel d\'initiation japanese}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@documentlanguage C1 japanese_utf8.texi:l6
   |global_command_number:{1}
   |text_arg:{ja}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ja}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 japanese_utf8.texi:l8 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C9 japanese_utf8.texi:l9 {GNU LilyPond --- 学習マニュアル}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:GNU LilyPond --- 学習マニュアル}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@copying C7 japanese_utf8.texi:l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C3
    {normal_text:Copyright }
    *normal_command@copyright C1 japanese_utf8.texi:l12
     *brace_container
    {normal_text: 1999--2008 著作者一同\\n}
   {empty_line:\\n}
   *paragraph C2
    *normal_command@emph C1 japanese_utf8.texi:l14
     *brace_container C3
      {normal_text:The translation of the following copyright notice is provided\\n}
      {normal_text:for courtesy to non-English speakers, but only the notice in English\\n}
      {normal_text:legally counts.}
    {normal_text:\\n}
   {empty_line:\\n}
   *paragraph C2
    *normal_command@emph C1 japanese_utf8.texi:l18
     *brace_container C2
      {normal_text:以下は英語を話さない人々のための著作権についての注意書きです。しかしながら、\\n}
      {normal_text:英語で書かれた注意書きだけが法的に有効です。}
    {normal_text:\\n}
   *normal_command@end C1 japanese_utf8.texi:l20
   |text_arg:{copying}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:copying}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:これは GNU LilyPond バージョン \\n}
  {empty_line:\\n}
  *normal_command@menu C4 japanese_utf8.texi:l25
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 japanese_utf8.texi:l26
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Preface}
     {normal_text:Preface}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 japanese_utf8.texi:l27
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Introduction}
     {normal_text:Introduction}
    {menu_entry_separator:::                   }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:LilyPond とは何なのか、なぜ LilyPond を使うのか、どうやって LilyPond を使うのか\\n}
   *normal_command@end C1 japanese_utf8.texi:l28
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 japanese_utf8.texi:l30 {Preface}
 |identifier:{Preface}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Preface}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 japanese_utf8.texi:l31 {Preface}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Preface}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:それは 1995 年のある日の EJE (Eindhoven Youth Orchestra) のリハーサル中のできごとでした − ある変わり者のバイオリン奏者であるジャンは同じく変わり者のフレンチホルン奏者のハン-ウェンに彼がかかわっている新しい大きなプロジェクトのことを話しました。それは音楽を出版するための自動化されたシステムです (正確には、それは MPP − MusiXTeX のプリプロセッサです)。それを聞いてハン-ウェンはすぐに楽譜からいくつかの部分をプリントアウトしたいと思い、彼はそのためのソフトウェアを探し始め、すぐにその虜になってしまいました。それが MPP の終わりを決定付けました。多くの哲学的考察を含み白熱した email の交換の後、ハン-ウェンは 1996 年に LilyPond の製作を開始しました。この時、ジャンはハン-ウェンの新しいプロジェクトに引きずり込まれました。\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@node C1 japanese_utf8.texi:l36 {Introduction}
 |identifier:{Introduction}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Introduction}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 japanese_utf8.texi:l37 {Introduction}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Introduction}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:この章では読者に LilyPond とこのドキュメントについての紹介を行います。\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'japanese_utf8'} = '\\input texinfo @c -*- coding: utf-8; mode: texinfo; -*-
@documentencoding UTF-8
@setfilename japanese_utf8.info
@settitle GNU LilyPond -- Manuel d\'initiation japanese

@documentlanguage ja

@node Top
@top GNU LilyPond --- 学習マニュアル

@copying
Copyright @copyright{} 1999--2008 著作者一同

@emph{The translation of the following copyright notice is provided
for courtesy to non-English speakers, but only the notice in English
legally counts.}

@emph{以下は英語を話さない人々のための著作権についての注意書きです。しかしながら、
英語で書かれた注意書きだけが法的に有効です。}
@end copying


これは GNU LilyPond バージョン 

@menu
* Preface::
* Introduction::                   LilyPond とは何なのか、なぜ LilyPond を使うのか、どうやって LilyPond を使うのか
@end menu

@node Preface
@chapter Preface

それは 1995 年のある日の EJE (Eindhoven Youth Orchestra) のリハーサル中のできごとでした − ある変わり者のバイオリン奏者であるジャンは同じく変わり者のフレンチホルン奏者のハン-ウェンに彼がかかわっている新しい大きなプロジェクトのことを話しました。それは音楽を出版するための自動化されたシステムです (正確には、それは MPP − MusiXTeX のプリプロセッサです)。それを聞いてハン-ウェンはすぐに楽譜からいくつかの部分をプリントアウトしたいと思い、彼はそのためのソフトウェアを探し始め、すぐにその虜になってしまいました。それが MPP の終わりを決定付けました。多くの哲学的考察を含み白熱した email の交換の後、ハン-ウェンは 1996 年に LilyPond の製作を開始しました。この時、ジャンはハン-ウェンの新しいプロジェクトに引きずり込まれました。


@node Introduction
@chapter Introduction

この章では読者に LilyPond とこのドキュメントについての紹介を行います。

@bye
';


$result_texts{'japanese_utf8'} = '

GNU LilyPond -- 学習マニュアル
******************************



これは GNU LilyPond バージョン 

* Preface::
* Introduction::                   LilyPond とは何なのか、なぜ LilyPond を使うのか、どうやって LilyPond を使うのか

1 Preface
*********

それは 1995 年のある日の EJE (Eindhoven Youth Orchestra) のリハーサル中のできごとでした − ある変わり者のバイオリン奏者であるジャンは同じく変わり者のフレンチホルン奏者のハン-ウェンに彼がかかわっている新しい大きなプロジェクトのことを話しました。それは音楽を出版するための自動化されたシステムです (正確には、それは MPP − MusiXTeX のプリプロセッサです)。それを聞いてハン-ウェンはすぐに楽譜からいくつかの部分をプリントアウトしたいと思い、彼はそのためのソフトウェアを探し始め、すぐにその虜になってしまいました。それが MPP の終わりを決定付けました。多くの哲学的考察を含み白熱した email の交換の後、ハン-ウェンは 1996 年に LilyPond の製作を開始しました。この時、ジャンはハン-ウェンの新しいプロジェクトに引きずり込まれました。


2 Introduction
**************

この章では読者に LilyPond とこのドキュメントについての紹介を行います。

';

$result_errors{'japanese_utf8'} = '';

$result_nodes_list{'japanese_utf8'} = '1|Top
 associated_section: GNU LilyPond --- 学習マニュアル
 associated_title_command: GNU LilyPond --- 学習マニュアル
 menus:
  Preface
  Introduction
 node_directions:
  next->Preface
2|Preface
 associated_section: 1 Preface
 associated_title_command: 1 Preface
 node_directions:
  next->Introduction
  prev->Top
  up->Top
3|Introduction
 associated_section: 2 Introduction
 associated_title_command: 2 Introduction
 node_directions:
  prev->Preface
  up->Top
';

$result_sections_list{'japanese_utf8'} = '1|GNU LilyPond --- 学習マニュアル
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Preface
 section_children:
  1|Preface
  2|Introduction
2|Preface
 associated_anchor_command: Preface
 associated_node: Preface
 section_directions:
  next->Introduction
  up->GNU LilyPond --- 学習マニュアル
 toplevel_directions:
  next->Introduction
  prev->GNU LilyPond --- 学習マニュアル
  up->GNU LilyPond --- 学習マニュアル
3|Introduction
 associated_anchor_command: Introduction
 associated_node: Introduction
 section_directions:
  prev->Preface
  up->GNU LilyPond --- 学習マニュアル
 toplevel_directions:
  prev->Preface
  up->GNU LilyPond --- 学習マニュアル
';

$result_sectioning_root{'japanese_utf8'} = 'level: -1
list:
 1|GNU LilyPond --- 学習マニュアル
';

$result_headings_list{'japanese_utf8'} = '';

1;
