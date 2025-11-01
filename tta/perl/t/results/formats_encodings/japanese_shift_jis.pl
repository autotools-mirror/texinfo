use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'japanese_shift_jis'} = '*document_root C8
 *before_node_section C2
  *preamble_before_setfilename C2
   *preamble_before_beginning C1
    {text_before_beginning:\\input texinfo @c -*- coding: utf-8; mode: texinfo; -*-\\n}
   *@documentencoding C1 japanese_shift_jis.texi:l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{shift_jis}
   |text_arg:{shift_jis}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {shift_jis}
  *preamble_before_content C5
   *@setfilename C1 japanese_shift_jis.texi:l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{japanese_shift_jis.info}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {japanese_shift_jis.info}
   *@settitle C1 japanese_shift_jis.texi:l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {GNU LilyPond -- Manuel d\'initiation japanese}
   {empty_line:\\n}
   *@documentlanguage C1 japanese_shift_jis.texi:l6
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
 *@node C1 japanese_shift_jis.texi:l8 {Top}
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
 *@top C9 japanese_shift_jis.texi:l9 {GNU LilyPond --- 学習マニュアル}
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
    {GNU LilyPond --- 学習マニュアル}
  {empty_line:\\n}
  *@copying C7 japanese_shift_jis.texi:l11
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C3
    {Copyright }
    *@copyright C1 japanese_shift_jis.texi:l12
     *brace_container
    { 1999--2008 著作者一同\\n}
   {empty_line:\\n}
   *paragraph C2
    *@emph C1 japanese_shift_jis.texi:l14
     *brace_container C3
      {The translation of the following copyright notice is provided\\n}
      {for courtesy to non-English speakers, but only the notice in English\\n}
      {legally counts.}
    {\\n}
   {empty_line:\\n}
   *paragraph C2
    *@emph C1 japanese_shift_jis.texi:l18
     *brace_container C2
      {以下は英語を話さない人々のための著作権についての注意書きです。しかしながら、\\n}
      {英語で書かれた注意書きだけが法的に有効です。}
    {\\n}
   *@end C1 japanese_shift_jis.texi:l20
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
  {empty_line:\\n}
  *paragraph C1
   {これは GNU LilyPond バージョン \\n}
  {empty_line:\\n}
  *@menu C4 japanese_shift_jis.texi:l25
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 japanese_shift_jis.texi:l26
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Preface}
    |normalized:{Preface}
     {Preface}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 japanese_shift_jis.texi:l27
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Introduction}
    |normalized:{Introduction}
     {Introduction}
    {menu_entry_separator:::                   }
    *menu_entry_description C1
     *preformatted C1
      {LilyPond とは何なのか、なぜ LilyPond を使うのか、どうやって LilyPond を使うのか\\n}
   *@end C1 japanese_shift_jis.texi:l28
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
 *@node C1 japanese_shift_jis.texi:l30 {Preface}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Preface}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Preface}
 *@chapter C5 japanese_shift_jis.texi:l31 {Preface}
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
    {Preface}
  {empty_line:\\n}
  *paragraph C1
   {それは 1995 年のある日の EJE (Eindhoven Youth Orchestra) のリハーサル中のできごとでした − ある変わり者のバイオリン奏者であるジャンは同じく変わり者のフレンチホルン奏者のハン-ウェンに彼がかかわっている新しい大きなプロジェクトのことを話しました。それは音楽を出版するための自動化されたシステムです (正確には、それは MPP − MusiXTeX のプリプロセッサです)。それを聞いてハン-ウェンはすぐに楽譜からいくつかの部分をプリントアウトしたいと思い、彼はそのためのソフトウェアを探し始め、すぐにその虜になってしまいました。それが MPP の終わりを決定付けました。多くの哲学的考察を含み白熱した email の交換の後、ハン-ウェンは 1996 年に LilyPond の製作を開始しました。この時、ジャンはハン-ウェンの新しいプロジェクトに引きずり込まれました。\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *@node C1 japanese_shift_jis.texi:l36 {Introduction}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{Introduction}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Introduction}
 *@chapter C4 japanese_shift_jis.texi:l37 {Introduction}
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
    {Introduction}
  {empty_line:\\n}
  *paragraph C1
   {この章では読者に LilyPond とこのドキュメントについての紹介を行います。\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'japanese_shift_jis'} = '\\input texinfo @c -*- coding: utf-8; mode: texinfo; -*-
@documentencoding shift_jis
@setfilename japanese_shift_jis.info
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


$result_texts{'japanese_shift_jis'} = '

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

$result_errors{'japanese_shift_jis'} = '* W japanese_shift_jis.texi:l2|encoding `shift_jis\' is not a canonical texinfo encoding
 warning: encoding `shift_jis\' is not a canonical texinfo encoding

';

$result_nodes_list{'japanese_shift_jis'} = '1|Top
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

$result_sections_list{'japanese_shift_jis'} = '1|GNU LilyPond --- 学習マニュアル
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

$result_sectioning_root{'japanese_shift_jis'} = 'level: -1
list:
 1|GNU LilyPond --- 学習マニュアル
';

$result_headings_list{'japanese_shift_jis'} = '';

1;
