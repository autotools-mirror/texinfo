use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'at_commands_in_refs_utf8'} = '*document_root C55
 *before_node_section C1
  *preamble_before_content C3
   *normal_command@setfilename C1 l1
   |EXTRA
   |text_arg:{at_commands_in_refs_utf8.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:at_commands_in_refs_utf8.info}
     {spaces_after_argument:\\n}
   *normal_command@documentencoding C1 l2
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:utf-8}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l5 {Top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C28 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{-_007b-_007d}
     *normal_command@-
     {normal_text: }
     *normal_command@{
     {normal_text: }
     *normal_command@}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C17
    |EXTRA
    |node_content:A{0|16}
    |normalized:{-_0021-_002e-_002e-_003f-_0040}
     *normal_command@ 
     {normal_text: }
     *normal_command@\\t
     {normal_text: }
     *normal_command@!
     {normal_text: }
     *normal_command@*
     {normal_text: }
     *normal_command@.
     {normal_text: }
     *normal_command@:
     {normal_text: .}
     *normal_command@:
     {normal_text: }
     *normal_command@?
     {normal_text: }
     *normal_command@@
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C9
    |EXTRA
    |node_content:A{0|8}
    |normalized:{_0040-_007b-_007d-_005c-_0023}
     *normal_command@atchar C1 l10
      *brace_container
     {normal_text: }
     *normal_command@lbracechar C1 l10
      *brace_container
     {normal_text: }
     *normal_command@rbracechar C1 l10
      *brace_container
     {normal_text: }
     *normal_command@backslashchar C1 l10
      *brace_container
     {normal_text: }
     *normal_command@hashchar C1 l10
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l11
    {menu_entry_leading_text:* }
    *menu_entry_node C9
    |EXTRA
    |node_content:A{0|8}
    |normalized:{LaTeX-TeX-_002c-_2026-_002e_002e_002e}
     *normal_command@LaTeX C1 l11
      *brace_container
     {normal_text: }
     *normal_command@TeX C1 l11
      *brace_container
     {normal_text: }
     *normal_command@comma C1 l11
      *brace_container
     {normal_text: }
     *normal_command@dots C1 l11
      *brace_container
     {normal_text: }
     *normal_command@enddots C1 l11
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l12
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{error_002d_002d_003e-_20ac-_00a1}
     *normal_command@error C1 l12
      *brace_container
     {normal_text: }
     *normal_command@euro C1 l12
      *brace_container
     {normal_text: }
     *normal_command@exclamdown C1 l12
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l13
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{_00aa-_00ba-_00bf}
     *normal_command@ordf C1 l13
      *brace_container
     {normal_text: }
     *normal_command@ordm C1 l13
      *brace_container
     {normal_text: }
     *normal_command@questiondown C1 l13
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l14
    {menu_entry_leading_text:* }
    *menu_entry_node C6
    |EXTRA
    |node_content:A{0|5}
    |normalized:{a-b-_00e5}
     {normal_text:a}
     *normal_command@tie C1 l14
      *brace_container
     {normal_text:b }
     *normal_command@today C1 l14
      *brace_container
     {normal_text: }
     *normal_command@aa C1 l14
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l15
    {menu_entry_leading_text:* }
    *menu_entry_node C25
    |EXTRA
    |node_content:A{0|24}
    |normalized:{_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe}
     *normal_command@AA C1 l15
      *brace_container
     {normal_text: }
     *normal_command@ae C1 l15
      *brace_container
     {normal_text: }
     *normal_command@oe C1 l15
      *brace_container
     {normal_text: }
     *normal_command@AE C1 l15
      *brace_container
     {normal_text: }
     *normal_command@OE C1 l15
      *brace_container
     {normal_text: }
     *normal_command@o C1 l15
      *brace_container
     {normal_text: }
     *normal_command@O C1 l15
      *brace_container
     {normal_text: }
     *normal_command@ss C1 l15
      *brace_container
     {normal_text: }
     *normal_command@l C1 l15
      *brace_container
     {normal_text: }
     *normal_command@L C1 l15
      *brace_container
     {normal_text: }
     *normal_command@DH C1 l15
      *brace_container
     {normal_text: }
     *normal_command@dh C1 l15
      *brace_container
     {normal_text: }
     *normal_command@th C1 l15
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l16
    {menu_entry_leading_text:* }
    *menu_entry_node C21
    |EXTRA
    |node_content:A{0|20}
    |normalized:{_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}
     *normal_command@" C1 l16
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@~ C1 l16
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@^ C1 l16
      *brace_container C1
       *normal_command@dotless C1 l16
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *normal_command@^ C1 l16
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@` C1 l16
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@\' C1 l16
      *following_arg C1
       {normal_text:e}
     {normal_text: }
     *normal_command@, C1 l16
      *brace_container C1
       {normal_text:c}
     {normal_text: }
     *normal_command@= C1 l16
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ringaccent C1 l16
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@H C1 l16
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ogonek C1 l16
      *brace_container C1
       {normal_text:e}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l17
    {menu_entry_leading_text:* }
    *menu_entry_node C13
    |EXTRA
    |node_content:A{0|12}
    |normalized:{_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}
     *normal_command@dotaccent C1 l17
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@u C1 l17
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ubaraccent C1 l17
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@udotaccent C1 l17
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@v C1 l17
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@dotless C1 l17
      *brace_container C1
       {normal_text:j}
     {normal_text: }
     *normal_command@tieaccent C1 l17
      *brace_container C1
       {normal_text:ee}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l18
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{_0131-_1e14-_1e08}
     *normal_command@dotless C1 l18
      *brace_container C1
       {normal_text:i}
     {normal_text: }
     *normal_command@` C1 l18
      *brace_container C1
       *normal_command@= C1 l18
        *following_arg C1
         {normal_text:E}
     {normal_text: }
     *normal_command@, C1 l18
      *brace_container C1
       *normal_command@\' C1 l18
        *following_arg C1
         {normal_text:C}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l19
    {menu_entry_leading_text:* }
    *menu_entry_node C11
    |EXTRA
    |node_content:A{0|10}
    |normalized:{_201c-_201d-_2018-_2019-_201e-_201a}
     *normal_command@quotedblleft C1 l19
      *brace_container
     {normal_text: }
     *normal_command@quotedblright C1 l19
      *brace_container
     {normal_text: }
     *normal_command@quoteleft C1 l19
      *brace_container
     {normal_text: }
     *normal_command@quoteright C1 l19
      *brace_container
     {normal_text: }
     *normal_command@quotedblbase C1 l19
      *brace_container
     {normal_text: }
     *normal_command@quotesinglbase C1 l19
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l20
    {menu_entry_leading_text:* }
    *menu_entry_node C11
    |EXTRA
    |node_content:A{0|10}
    |normalized:{_00ab-_00bb-_00ab-_00bb-_2039-_203a}
     *normal_command@guillemetleft C1 l20
      *brace_container
     {normal_text: }
     *normal_command@guillemetright C1 l20
      *brace_container
     {normal_text: }
     *normal_command@guillemotleft C1 l20
      *brace_container
     {normal_text: }
     *normal_command@guillemotright C1 l20
      *brace_container
     {normal_text: }
     *normal_command@guilsinglleft C1 l20
      *brace_container
     {normal_text: }
     *normal_command@guilsinglright C1 l20
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l21
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}
     {normal_text:`` \'\' --- -- ` \'}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l22
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{AAA-AAA-BBB}
     *normal_command@acronym C2 l22
      *brace_arg C1
       {normal_text:AAA}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:fff}
     {normal_text: }
     *normal_command@acronym C1 l22
      *brace_arg C1
       {normal_text:AAA}
     {normal_text: }
     *normal_command@acronym C1 l22
      *brace_arg C1
       {normal_text:BBB}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l23
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{CCC-CCC-DDD}
     *normal_command@abbr C2 l23
      *brace_arg C1
       {normal_text:CCC}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:rrr}
     {normal_text: }
     *normal_command@abbr C1 l23
      *brace_arg C1
       {normal_text:CCC}
     {normal_text: }
     *normal_command@abbr C1 l23
      *brace_arg C1
       {normal_text:DDD}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l24
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{someone_0040somewher-no_005fexplain_0040there}
     *normal_command@email C2 l24
      *brace_arg C3
       {normal_text:someone}
       *normal_command@@
       {normal_text:somewher}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:the someone}
     {normal_text: }
     *normal_command@email C1 l24
      *brace_arg C3
       {normal_text:no_explain}
       *normal_command@@
       {normal_text:there}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l25
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{f_002d_002dile1-f_002d_002dile}
     *normal_command@image C1 l25
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:f--ile1}
     {normal_text:  }
     *normal_command@image C5 l25
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:f--ile}
      *brace_arg C1
       {normal_text:aze}
      *brace_arg C1
       {normal_text:az}
      *brace_arg C1
       {normal_text:alt}
      *brace_arg C1
       {normal_text:e--xt}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l26
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{-_0040-_007b_007d-_002e-}
     *normal_command@verb C1 l26
      *brace_container C3
       {verb_delimiter:.}
       {raw: @ {} . }
       {verb_delimiter:.}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l27
    {menu_entry_leading_text:* }
    *menu_entry_node C17
    |EXTRA
    |node_content:A{0|16}
    |normalized:{cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}
     *normal_command@cite C1 l27
      *brace_container C2
       {normal_text:cite }
       *normal_command@asis C1 l27
        *brace_container C1
         {normal_text:asis}
     {normal_text: }
     *normal_command@w C1 l27
      *brace_container C4
       {normal_text:in }
       *normal_command@@
       {normal_text:w }
       *normal_command@b C1 l27
        *brace_container C1
         {normal_text:b}
     {normal_text: }
     *normal_command@r C1 l27
      *brace_container C1
       {normal_text:in r}
     {normal_text: }
     *normal_command@sc C1 l27
      *brace_container C1
       {normal_text:sc}
     {normal_text: }
     *normal_command@strong C1 l27
      *brace_container C1
       {normal_text:str}
     {normal_text: }
     *normal_command@t C1 l27
      *brace_container C1
       {normal_text:t}
     {normal_text: }
     *normal_command@var C1 l27
      *brace_container C1
       {normal_text:var}
     {normal_text: }
     *normal_command@dfn C1 l27
      *brace_container C1
       {normal_text:dfn}
     {normal_text: }
     *normal_command@i C1 l27
      *brace_container C1
       {normal_text:i}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l28
    {menu_entry_leading_text:* }
    *menu_entry_node C13
    |EXTRA
    |node_content:A{0|12}
    |normalized:{env-code-option-samp-command-file-C_002dx-ESC}
     *normal_command@env C1 l28
      *brace_container C1
       {normal_text:env}
     {normal_text: }
     *normal_command@code C1 l28
      *brace_container C1
       {normal_text:code}
     {normal_text: }
     *normal_command@option C1 l28
      *brace_container C1
       {normal_text:option}
     {normal_text: }
     *normal_command@samp C1 l28
      *brace_container C1
       {normal_text:samp}
     {normal_text: }
     *normal_command@command C1 l28
      *brace_container C1
       {normal_text:command}
     {normal_text: }
     *normal_command@file C1 l28
      *brace_container C1
       {normal_text:file}
     {normal_text: }
     *normal_command@kbd C1 l28
      *brace_container C2
       {normal_text:C-x }
       *normal_command@key C1 l28
        *brace_container C1
         {normal_text:ESC}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l29
    {menu_entry_leading_text:* }
    *menu_entry_node C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{8_002e27in}
     {normal_text:8.27}
     *normal_command@dmn C1 l29
      *brace_container C1
       {normal_text:in}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l30
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{sansserif-slanted}
     *normal_command@sansserif C1 l30
      *brace_container C1
       {normal_text:sansserif}
     {normal_text: }
     *normal_command@slanted C1 l30
      *brace_container C1
       {normal_text:slanted}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l31
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{indicateurl}
     *normal_command@indicateurl C1 l31
      *brace_container C1
       {normal_text:indicateurl}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l32
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{gH-3rd}
     *normal_command@sub C1 l32
      *brace_container C1
       {normal_text:g}
     {normal_text:H 3}
     *normal_command@sup C1 l32
      *brace_container C1
       {normal_text:rd}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l33
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}
     *normal_command@url C1 l33
      *brace_arg C1
       {normal_text:http://somewhere_aaa}
     {normal_text: }
     *normal_command@url C2 l33
      *brace_arg C1
       {normal_text:url}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:text}
     {normal_text: }
     *normal_command@uref C3 l33
      *brace_arg C1
       {normal_text:/man.cgi/1/ls}
      *brace_arg
      *brace_arg C1
       {normal_text:ls}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l34
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l36 {@- @{ @}}
 |EXTRA
 |identifier:{-_007b-_007d}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@-
    {normal_text: }
    *normal_command@{
    {normal_text: }
    *normal_command@}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l37 {@- @{ @}}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@-
    {normal_text: }
    *normal_command@{
    {normal_text: }
    *normal_command@}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l39 {@  @	 @! @* @. @: .@: @? @@}
 |EXTRA
 |identifier:{-_0021-_002e-_002e-_003f-_0040}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C19
    {spaces_before_argument: }
    *normal_command@ 
    {normal_text: }
    *normal_command@\\t
    {normal_text: }
    *normal_command@!
    {normal_text: }
    *normal_command@*
    {normal_text: }
    *normal_command@.
    {normal_text: }
    *normal_command@:
    {normal_text: .}
    *normal_command@:
    {normal_text: }
    *normal_command@?
    {normal_text: }
    *normal_command@@
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l40 {@  @	 @! @* @. @: .@: @? @@}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C19
    {spaces_before_argument: }
    *normal_command@ 
    {normal_text: }
    *normal_command@\\t
    {normal_text: }
    *normal_command@!
    {normal_text: }
    *normal_command@*
    {normal_text: }
    *normal_command@.
    {normal_text: }
    *normal_command@:
    {normal_text: .}
    *normal_command@:
    {normal_text: }
    *normal_command@?
    {normal_text: }
    *normal_command@@
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l42 {@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}}
 |EXTRA
 |identifier:{_0040-_007b-_007d-_005c-_0023}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@atchar C1 l42
     *brace_container
    {normal_text: }
    *normal_command@lbracechar C1 l42
     *brace_container
    {normal_text: }
    *normal_command@rbracechar C1 l42
     *brace_container
    {normal_text: }
    *normal_command@backslashchar C1 l42
     *brace_container
    {normal_text: }
    *normal_command@hashchar C1 l42
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l43 {@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}}
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@atchar C1 l43
     *brace_container
    {normal_text: }
    *normal_command@lbracechar C1 l43
     *brace_container
    {normal_text: }
    *normal_command@rbracechar C1 l43
     *brace_container
    {normal_text: }
    *normal_command@backslashchar C1 l43
     *brace_container
    {normal_text: }
    *normal_command@hashchar C1 l43
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l45 {@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}}
 |EXTRA
 |identifier:{LaTeX-TeX-_002c-_2026-_002e_002e_002e}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@LaTeX C1 l45
     *brace_container
    {normal_text: }
    *normal_command@TeX C1 l45
     *brace_container
    {normal_text: }
    *normal_command@comma C1 l45
     *brace_container
    {normal_text: }
    *normal_command@dots C1 l45
     *brace_container
    {normal_text: }
    *normal_command@enddots C1 l45
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l46 {@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}}
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@LaTeX C1 l46
     *brace_container
    {normal_text: }
    *normal_command@TeX C1 l46
     *brace_container
    {normal_text: }
    *normal_command@comma C1 l46
     *brace_container
    {normal_text: }
    *normal_command@dots C1 l46
     *brace_container
    {normal_text: }
    *normal_command@enddots C1 l46
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l48 {@error{} @euro{} @exclamdown{}}
 |EXTRA
 |identifier:{error_002d_002d_003e-_20ac-_00a1}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@error C1 l48
     *brace_container
    {normal_text: }
    *normal_command@euro C1 l48
     *brace_container
    {normal_text: }
    *normal_command@exclamdown C1 l48
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l49 {@error{} @euro{} @exclamdown{}}
 |EXTRA
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@error C1 l49
     *brace_container
    {normal_text: }
    *normal_command@euro C1 l49
     *brace_container
    {normal_text: }
    *normal_command@exclamdown C1 l49
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l51 {@ordf{} @ordm{} @questiondown{}}
 |EXTRA
 |identifier:{_00aa-_00ba-_00bf}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@ordf C1 l51
     *brace_container
    {normal_text: }
    *normal_command@ordm C1 l51
     *brace_container
    {normal_text: }
    *normal_command@questiondown C1 l51
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l52 {@ordf{} @ordm{} @questiondown{}}
 |EXTRA
 |section_heading_number:{6}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@ordf C1 l52
     *brace_container
    {normal_text: }
    *normal_command@ordm C1 l52
     *brace_container
    {normal_text: }
    *normal_command@questiondown C1 l52
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l54 {a@tie{}b @today{} @aa{}}
 |EXTRA
 |identifier:{a-b-_00e5}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C8
    {spaces_before_argument: }
    {normal_text:a}
    *normal_command@tie C1 l54
     *brace_container
    {normal_text:b }
    *normal_command@today C1 l54
     *brace_container
    {normal_text: }
    *normal_command@aa C1 l54
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l55 {a@tie{}b @today{} @aa{}}
 |EXTRA
 |section_heading_number:{7}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C8
    {spaces_before_argument: }
    {normal_text:a}
    *normal_command@tie C1 l55
     *brace_container
    {normal_text:b }
    *normal_command@today C1 l55
     *brace_container
    {normal_text: }
    *normal_command@aa C1 l55
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l57 {@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}}
 |EXTRA
 |identifier:{_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe}
 |is_target:{1}
 |node_number:{9}
  *arguments_line C1
   *line_arg C27
    {spaces_before_argument: }
    *normal_command@AA C1 l57
     *brace_container
    {normal_text: }
    *normal_command@ae C1 l57
     *brace_container
    {normal_text: }
    *normal_command@oe C1 l57
     *brace_container
    {normal_text: }
    *normal_command@AE C1 l57
     *brace_container
    {normal_text: }
    *normal_command@OE C1 l57
     *brace_container
    {normal_text: }
    *normal_command@o C1 l57
     *brace_container
    {normal_text: }
    *normal_command@O C1 l57
     *brace_container
    {normal_text: }
    *normal_command@ss C1 l57
     *brace_container
    {normal_text: }
    *normal_command@l C1 l57
     *brace_container
    {normal_text: }
    *normal_command@L C1 l57
     *brace_container
    {normal_text: }
    *normal_command@DH C1 l57
     *brace_container
    {normal_text: }
    *normal_command@dh C1 l57
     *brace_container
    {normal_text: }
    *normal_command@th C1 l57
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l58 {@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}}
 |EXTRA
 |section_heading_number:{8}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C27
    {spaces_before_argument: }
    *normal_command@AA C1 l58
     *brace_container
    {normal_text: }
    *normal_command@ae C1 l58
     *brace_container
    {normal_text: }
    *normal_command@oe C1 l58
     *brace_container
    {normal_text: }
    *normal_command@AE C1 l58
     *brace_container
    {normal_text: }
    *normal_command@OE C1 l58
     *brace_container
    {normal_text: }
    *normal_command@o C1 l58
     *brace_container
    {normal_text: }
    *normal_command@O C1 l58
     *brace_container
    {normal_text: }
    *normal_command@ss C1 l58
     *brace_container
    {normal_text: }
    *normal_command@l C1 l58
     *brace_container
    {normal_text: }
    *normal_command@L C1 l58
     *brace_container
    {normal_text: }
    *normal_command@DH C1 l58
     *brace_container
    {normal_text: }
    *normal_command@dh C1 l58
     *brace_container
    {normal_text: }
    *normal_command@th C1 l58
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l60 {@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}}
 |EXTRA
 |identifier:{_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}
 |is_target:{1}
 |node_number:{10}
  *arguments_line C1
   *line_arg C23
    {spaces_before_argument: }
    *normal_command@" C1 l60
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@~ C1 l60
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@^ C1 l60
     *brace_container C1
      *normal_command@dotless C1 l60
       *brace_container C1
        {normal_text:i}
    {normal_text: }
    *normal_command@^ C1 l60
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@` C1 l60
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@\' C1 l60
     *following_arg C1
      {normal_text:e}
    {normal_text: }
    *normal_command@, C1 l60
     *brace_container C1
      {normal_text:c}
    {normal_text: }
    *normal_command@= C1 l60
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ringaccent C1 l60
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@H C1 l60
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ogonek C1 l60
     *brace_container C1
      {normal_text:e}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l61 {@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}}
 |EXTRA
 |section_heading_number:{9}
 |section_level:{1}
 |section_number:{10}
  *arguments_line C1
   *line_arg C23
    {spaces_before_argument:  }
    *normal_command@" C1 l61
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@~ C1 l61
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@^ C1 l61
     *brace_container C1
      *normal_command@dotless C1 l61
       *brace_container C1
        {normal_text:i}
    {normal_text: }
    *normal_command@^ C1 l61
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@` C1 l61
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@\' C1 l61
     *following_arg C1
      {normal_text:e}
    {normal_text: }
    *normal_command@, C1 l61
     *brace_container C1
      {normal_text:c}
    {normal_text: }
    *normal_command@= C1 l61
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ringaccent C1 l61
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@H C1 l61
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ogonek C1 l61
     *brace_container C1
      {normal_text:e}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l63 {@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}}
 |EXTRA
 |identifier:{_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}
 |is_target:{1}
 |node_number:{11}
  *arguments_line C1
   *line_arg C15
    {spaces_before_argument: }
    *normal_command@dotaccent C1 l63
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@u C1 l63
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ubaraccent C1 l63
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@udotaccent C1 l63
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@v C1 l63
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@dotless C1 l63
     *brace_container C1
      {normal_text:j}
    {normal_text: }
    *normal_command@tieaccent C1 l63
     *brace_container C1
      {normal_text:ee}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l64 {@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}}
 |EXTRA
 |section_heading_number:{10}
 |section_level:{1}
 |section_number:{11}
  *arguments_line C1
   *line_arg C15
    {spaces_before_argument: }
    *normal_command@dotaccent C1 l64
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@u C1 l64
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ubaraccent C1 l64
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@udotaccent C1 l64
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@v C1 l64
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@dotless C1 l64
     *brace_container C1
      {normal_text:j}
    {normal_text: }
    *normal_command@tieaccent C1 l64
     *brace_container C1
      {normal_text:ee}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l66 {@dotless{i} @`{@=E} @,{@\'C}}
 |EXTRA
 |identifier:{_0131-_1e14-_1e08}
 |is_target:{1}
 |node_number:{12}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@dotless C1 l66
     *brace_container C1
      {normal_text:i}
    {normal_text: }
    *normal_command@` C1 l66
     *brace_container C1
      *normal_command@= C1 l66
       *following_arg C1
        {normal_text:E}
    {normal_text: }
    *normal_command@, C1 l66
     *brace_container C1
      *normal_command@\' C1 l66
       *following_arg C1
        {normal_text:C}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l67 {@dotless{i} @`{@=E} @,{@\'C}}
 |EXTRA
 |section_heading_number:{11}
 |section_level:{1}
 |section_number:{12}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@dotless C1 l67
     *brace_container C1
      {normal_text:i}
    {normal_text: }
    *normal_command@` C1 l67
     *brace_container C1
      *normal_command@= C1 l67
       *following_arg C1
        {normal_text:E}
    {normal_text: }
    *normal_command@, C1 l67
     *brace_container C1
      *normal_command@\' C1 l67
       *following_arg C1
        {normal_text:C}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l69 {@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}}
 |EXTRA
 |identifier:{_201c-_201d-_2018-_2019-_201e-_201a}
 |is_target:{1}
 |node_number:{13}
  *arguments_line C1
   *line_arg C13
    {spaces_before_argument: }
    *normal_command@quotedblleft C1 l69
     *brace_container
    {normal_text: }
    *normal_command@quotedblright C1 l69
     *brace_container
    {normal_text: }
    *normal_command@quoteleft C1 l69
     *brace_container
    {normal_text: }
    *normal_command@quoteright C1 l69
     *brace_container
    {normal_text: }
    *normal_command@quotedblbase C1 l69
     *brace_container
    {normal_text: }
    *normal_command@quotesinglbase C1 l69
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l70 {@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}}
 |EXTRA
 |section_heading_number:{12}
 |section_level:{1}
 |section_number:{13}
  *arguments_line C1
   *line_arg C13
    {spaces_before_argument: }
    *normal_command@quotedblleft C1 l70
     *brace_container
    {normal_text: }
    *normal_command@quotedblright C1 l70
     *brace_container
    {normal_text: }
    *normal_command@quoteleft C1 l70
     *brace_container
    {normal_text: }
    *normal_command@quoteright C1 l70
     *brace_container
    {normal_text: }
    *normal_command@quotedblbase C1 l70
     *brace_container
    {normal_text: }
    *normal_command@quotesinglbase C1 l70
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l72 {@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}}
 |EXTRA
 |identifier:{_00ab-_00bb-_00ab-_00bb-_2039-_203a}
 |is_target:{1}
 |node_number:{14}
  *arguments_line C1
   *line_arg C13
    {spaces_before_argument: }
    *normal_command@guillemetleft C1 l72
     *brace_container
    {normal_text: }
    *normal_command@guillemetright C1 l72
     *brace_container
    {normal_text: }
    *normal_command@guillemotleft C1 l72
     *brace_container
    {normal_text: }
    *normal_command@guillemotright C1 l72
     *brace_container
    {normal_text: }
    *normal_command@guilsinglleft C1 l72
     *brace_container
    {normal_text: }
    *normal_command@guilsinglright C1 l72
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l73 {@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}}
 |EXTRA
 |section_heading_number:{13}
 |section_level:{1}
 |section_number:{14}
  *arguments_line C1
   *line_arg C13
    {spaces_before_argument: }
    *normal_command@guillemetleft C1 l73
     *brace_container
    {normal_text: }
    *normal_command@guillemetright C1 l73
     *brace_container
    {normal_text: }
    *normal_command@guillemotleft C1 l73
     *brace_container
    {normal_text: }
    *normal_command@guillemotright C1 l73
     *brace_container
    {normal_text: }
    *normal_command@guilsinglleft C1 l73
     *brace_container
    {normal_text: }
    *normal_command@guilsinglright C1 l73
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l75 {`` \'\' --- -- ` \'}
 |EXTRA
 |identifier:{_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}
 |is_target:{1}
 |node_number:{15}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:`` \'\' --- -- ` \'}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l76 {`` \'\' --- -- ` \'}
 |EXTRA
 |section_heading_number:{14}
 |section_level:{1}
 |section_number:{15}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:`` \'\' --- -- ` \'}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l78 {@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}}
 |EXTRA
 |identifier:{AAA-AAA-BBB}
 |is_target:{1}
 |node_number:{16}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@acronym C2 l78
     *brace_arg C1
      {normal_text:AAA}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:fff}
    {normal_text: }
    *normal_command@acronym C1 l78
     *brace_arg C1
      {normal_text:AAA}
    {normal_text: }
    *normal_command@acronym C1 l78
     *brace_arg C1
      {normal_text:BBB}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l79 {@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}}
 |EXTRA
 |section_heading_number:{15}
 |section_level:{1}
 |section_number:{16}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@acronym C2 l79
     *brace_arg C1
      {normal_text:AAA}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:fff}
    {normal_text: }
    *normal_command@acronym C1 l79
     *brace_arg C1
      {normal_text:AAA}
    {normal_text: }
    *normal_command@acronym C1 l79
     *brace_arg C1
      {normal_text:BBB}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l81 {@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}}
 |EXTRA
 |identifier:{CCC-CCC-DDD}
 |is_target:{1}
 |node_number:{17}
  *arguments_line C1
   *line_arg C7
   >SOURCEMARKS
   >expanded_conditional_command<start;1>
    >*normal_command@ifnottex C1 l82
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
    {spaces_before_argument: }
    *normal_command@abbr C2 l81
     *brace_arg C1
      {normal_text:CCC}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:rrr}
    {normal_text: }
    *normal_command@abbr C1 l81
     *brace_arg C1
      {normal_text:CCC}
    {normal_text: }
    *normal_command@abbr C1 l81
     *brace_arg C1
      {normal_text:DDD}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l83 {@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}}
 |EXTRA
 |section_heading_number:{16}
 |section_level:{1}
 |section_number:{17}
  *arguments_line C1
   *line_arg C7
   >SOURCEMARKS
   >expanded_conditional_command<end;1>
    >*normal_command@end C1 l84
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
    {spaces_before_argument: }
    *normal_command@abbr C2 l83
     *brace_arg C1
      {normal_text:CCC}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:rrr}
    {normal_text: }
    *normal_command@abbr C1 l83
     *brace_arg C1
      {normal_text:CCC}
    {normal_text: }
    *normal_command@abbr C1 l83
     *brace_arg C1
      {normal_text:DDD}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l86 {@email{someone@@somewher, the someone} @email{no_explain@@there}}
 |EXTRA
 |identifier:{someone_0040somewher-no_005fexplain_0040there}
 |is_target:{1}
 |node_number:{18}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@email C2 l86
     *brace_arg C3
      {normal_text:someone}
      *normal_command@@
      {normal_text:somewher}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:the someone}
    {normal_text: }
    *normal_command@email C1 l86
     *brace_arg C3
      {normal_text:no_explain}
      *normal_command@@
      {normal_text:there}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l87 {@email{someone@@somewher, the someone} @email{no_explain@@there}}
 |EXTRA
 |section_heading_number:{17}
 |section_level:{1}
 |section_number:{18}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@email C2 l87
     *brace_arg C3
      {normal_text:someone}
      *normal_command@@
      {normal_text:somewher}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:the someone}
    {normal_text: }
    *normal_command@email C1 l87
     *brace_arg C3
      {normal_text:no_explain}
      *normal_command@@
      {normal_text:there}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l89 {@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}}
 |EXTRA
 |identifier:{f_002d_002dile1-f_002d_002dile}
 |is_target:{1}
 |node_number:{19}
  *arguments_line C1
   *line_arg C5
   >SOURCEMARKS
   >expanded_conditional_command<start;2>
    >*normal_command@ifnottex C1 l90
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
    {spaces_before_argument: }
    *normal_command@image C1 l89
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile1}
    {normal_text:  }
    *normal_command@image C5 l89
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile}
     *brace_arg C1
      {normal_text:aze}
     *brace_arg C1
      {normal_text:az}
     *brace_arg C1
      {normal_text:alt}
     *brace_arg C1
      {normal_text:e--xt}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l91 {@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}}
 |EXTRA
 |section_heading_number:{18}
 |section_level:{1}
 |section_number:{19}
  *arguments_line C1
   *line_arg C5
   >SOURCEMARKS
   >expanded_conditional_command<end;2>
    >*normal_command@end C1 l92
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
    {spaces_before_argument: }
    *normal_command@image C1 l91
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile1}
    {normal_text:  }
    *normal_command@image C5 l91
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile}
     *brace_arg C1
      {normal_text:aze}
     *brace_arg C1
      {normal_text:az}
     *brace_arg C1
      {normal_text:alt}
     *brace_arg C1
      {normal_text:e--xt}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l94 {@verb{. @ {} . .}}
 |EXTRA
 |identifier:{-_0040-_007b_007d-_002e-}
 |is_target:{1}
 |node_number:{20}
  *arguments_line C1
   *line_arg C3
   >SOURCEMARKS
   >expanded_conditional_command<start;3>
    >*normal_command@ifnottex C1 l95
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
    {spaces_before_argument: }
    *normal_command@verb C1 l94
     *brace_container C3
      {verb_delimiter:.}
      {raw: @ {} . }
      {verb_delimiter:.}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l96 {@verb{. @ {} . .}}
 |EXTRA
 |section_heading_number:{19}
 |section_level:{1}
 |section_number:{20}
  *arguments_line C1
   *line_arg C3
   >SOURCEMARKS
   >expanded_conditional_command<end;3>
    >*normal_command@end C1 l97
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
    {spaces_before_argument: }
    *normal_command@verb C1 l96
     *brace_container C3
      {verb_delimiter:.}
      {raw: @ {} . }
      {verb_delimiter:.}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l99 {@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}}
 |EXTRA
 |identifier:{cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}
 |is_target:{1}
 |node_number:{21}
  *arguments_line C1
   *line_arg C19
    {spaces_before_argument: }
    *normal_command@cite C1 l99
     *brace_container C2
      {normal_text:cite }
      *normal_command@asis C1 l99
       *brace_container C1
        {normal_text:asis}
    {normal_text: }
    *normal_command@w C1 l99
     *brace_container C4
      {normal_text:in }
      *normal_command@@
      {normal_text:w }
      *normal_command@b C1 l99
       *brace_container C1
        {normal_text:b}
    {normal_text: }
    *normal_command@r C1 l99
     *brace_container C1
      {normal_text:in r}
    {normal_text: }
    *normal_command@sc C1 l99
     *brace_container C1
      {normal_text:sc}
    {normal_text: }
    *normal_command@strong C1 l99
     *brace_container C1
      {normal_text:str}
    {normal_text: }
    *normal_command@t C1 l99
     *brace_container C1
      {normal_text:t}
    {normal_text: }
    *normal_command@var C1 l99
     *brace_container C1
      {normal_text:var}
    {normal_text: }
    *normal_command@dfn C1 l99
     *brace_container C1
      {normal_text:dfn}
    {normal_text: }
    *normal_command@i C1 l99
     *brace_container C1
      {normal_text:i}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l100 {@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}}
 |EXTRA
 |section_heading_number:{20}
 |section_level:{1}
 |section_number:{21}
  *arguments_line C1
   *line_arg C19
    {spaces_before_argument: }
    *normal_command@cite C1 l100
     *brace_container C2
      {normal_text:cite }
      *normal_command@asis C1 l100
       *brace_container C1
        {normal_text:asis}
    {normal_text: }
    *normal_command@w C1 l100
     *brace_container C4
      {normal_text:in }
      *normal_command@@
      {normal_text:w }
      *normal_command@b C1 l100
       *brace_container C1
        {normal_text:b}
    {normal_text: }
    *normal_command@r C1 l100
     *brace_container C1
      {normal_text:in r}
    {normal_text: }
    *normal_command@sc C1 l100
     *brace_container C1
      {normal_text:sc}
    {normal_text: }
    *normal_command@strong C1 l100
     *brace_container C1
      {normal_text:str}
    {normal_text: }
    *normal_command@t C1 l100
     *brace_container C1
      {normal_text:t}
    {normal_text: }
    *normal_command@var C1 l100
     *brace_container C1
      {normal_text:var}
    {normal_text: }
    *normal_command@dfn C1 l100
     *brace_container C1
      {normal_text:dfn}
    {normal_text: }
    *normal_command@i C1 l100
     *brace_container C1
      {normal_text:i}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l102 {@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}}
 |EXTRA
 |identifier:{env-code-option-samp-command-file-C_002dx-ESC}
 |is_target:{1}
 |node_number:{22}
  *arguments_line C1
   *line_arg C15
    {spaces_before_argument: }
    *normal_command@env C1 l102
     *brace_container C1
      {normal_text:env}
    {normal_text: }
    *normal_command@code C1 l102
     *brace_container C1
      {normal_text:code}
    {normal_text: }
    *normal_command@option C1 l102
     *brace_container C1
      {normal_text:option}
    {normal_text: }
    *normal_command@samp C1 l102
     *brace_container C1
      {normal_text:samp}
    {normal_text: }
    *normal_command@command C1 l102
     *brace_container C1
      {normal_text:command}
    {normal_text: }
    *normal_command@file C1 l102
     *brace_container C1
      {normal_text:file}
    {normal_text: }
    *normal_command@kbd C1 l102
     *brace_container C2
      {normal_text:C-x }
      *normal_command@key C1 l102
       *brace_container C1
        {normal_text:ESC}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l103 {@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}}
 |EXTRA
 |section_heading_number:{21}
 |section_level:{1}
 |section_number:{22}
  *arguments_line C1
   *line_arg C15
    {spaces_before_argument: }
    *normal_command@env C1 l103
     *brace_container C1
      {normal_text:env}
    {normal_text: }
    *normal_command@code C1 l103
     *brace_container C1
      {normal_text:code}
    {normal_text: }
    *normal_command@option C1 l103
     *brace_container C1
      {normal_text:option}
    {normal_text: }
    *normal_command@samp C1 l103
     *brace_container C1
      {normal_text:samp}
    {normal_text: }
    *normal_command@command C1 l103
     *brace_container C1
      {normal_text:command}
    {normal_text: }
    *normal_command@file C1 l103
     *brace_container C1
      {normal_text:file}
    {normal_text: }
    *normal_command@kbd C1 l103
     *brace_container C2
      {normal_text:C-x }
      *normal_command@key C1 l103
       *brace_container C1
        {normal_text:ESC}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l105 {8.27@dmn{in}}
 |EXTRA
 |identifier:{8_002e27in}
 |is_target:{1}
 |node_number:{23}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:8.27}
    *normal_command@dmn C1 l105
     *brace_container C1
      {normal_text:in}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l106 {8.27@dmn{in}}
 |EXTRA
 |section_heading_number:{22}
 |section_level:{1}
 |section_number:{23}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:8.27}
    *normal_command@dmn C1 l106
     *brace_container C1
      {normal_text:in}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l108 {@sansserif{sansserif} @slanted{slanted}}
 |EXTRA
 |identifier:{sansserif-slanted}
 |is_target:{1}
 |node_number:{24}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@sansserif C1 l108
     *brace_container C1
      {normal_text:sansserif}
    {normal_text: }
    *normal_command@slanted C1 l108
     *brace_container C1
      {normal_text:slanted}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l109 {@sansserif{sansserif} @slanted{slanted}}
 |EXTRA
 |section_heading_number:{23}
 |section_level:{1}
 |section_number:{24}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@sansserif C1 l109
     *brace_container C1
      {normal_text:sansserif}
    {normal_text: }
    *normal_command@slanted C1 l109
     *brace_container C1
      {normal_text:slanted}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l111 {@indicateurl{indicateurl}}
 |EXTRA
 |identifier:{indicateurl}
 |is_target:{1}
 |node_number:{25}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@indicateurl C1 l111
     *brace_container C1
      {normal_text:indicateurl}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l112 {@indicateurl{indicateurl}}
 |EXTRA
 |section_heading_number:{24}
 |section_level:{1}
 |section_number:{25}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@indicateurl C1 l112
     *brace_container C1
      {normal_text:indicateurl}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l114 {@sub{g}H 3@sup{rd}}
 |EXTRA
 |identifier:{gH-3rd}
 |is_target:{1}
 |node_number:{26}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@sub C1 l114
     *brace_container C1
      {normal_text:g}
    {normal_text:H 3}
    *normal_command@sup C1 l114
     *brace_container C1
      {normal_text:rd}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l115 {@sub{g}H 3@sup{rd}}
 |EXTRA
 |section_heading_number:{25}
 |section_level:{1}
 |section_number:{26}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@sub C1 l115
     *brace_container C1
      {normal_text:g}
    {normal_text:H 3}
    *normal_command@sup C1 l115
     *brace_container C1
      {normal_text:rd}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l117 {@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}}
 |EXTRA
 |identifier:{http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}
 |is_target:{1}
 |node_number:{27}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@url C1 l117
     *brace_arg C1
      {normal_text:http://somewhere_aaa}
    {normal_text: }
    *normal_command@url C2 l117
     *brace_arg C1
      {normal_text:url}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:text}
    {normal_text: }
    *normal_command@uref C3 l117
     *brace_arg C1
      {normal_text:/man.cgi/1/ls}
     *brace_arg
     *brace_arg C1
      {normal_text:ls}
    {spaces_after_argument:\\n}
 *normal_command@chapter C54 l118 {@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}}
 |EXTRA
 |section_heading_number:{26}
 |section_level:{1}
 |section_number:{27}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@url C1 l118
     *brace_arg C1
      {normal_text:http://somewhere_aaa}
    {normal_text: }
    *normal_command@url C2 l118
     *brace_arg C1
      {normal_text:url}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:text}
    {normal_text: }
    *normal_command@uref C3 l118
     *brace_arg C1
      {normal_text:/man.cgi/1/ls}
     *brace_arg
     *brace_arg C1
      {normal_text:ls}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l120
    *brace_arg C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{-_007b-_007d}
     *normal_command@-
     {normal_text: }
     *normal_command@{
     {normal_text: }
     *normal_command@}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l122
    *brace_arg C17
    |EXTRA
    |node_content:A{0|16}
    |normalized:{-_0021-_002e-_002e-_003f-_0040}
     *normal_command@ 
     {normal_text: }
     *normal_command@\\t
     {normal_text: }
     *normal_command@!
     {normal_text: }
     *normal_command@*
     {normal_text: }
     *normal_command@.
     {normal_text: }
     *normal_command@:
     {normal_text: .}
     *normal_command@:
     {normal_text: }
     *normal_command@?
     {normal_text: }
     *normal_command@@
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l124
    *brace_arg C9
    |EXTRA
    |node_content:A{0|8}
    |normalized:{_0040-_007b-_007d-_005c-_0023}
     *normal_command@atchar C1 l124
      *brace_container
     {normal_text: }
     *normal_command@lbracechar C1 l124
      *brace_container
     {normal_text: }
     *normal_command@rbracechar C1 l124
      *brace_container
     {normal_text: }
     *normal_command@backslashchar C1 l124
      *brace_container
     {normal_text: }
     *normal_command@hashchar C1 l124
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l126
    *brace_arg C9
    |EXTRA
    |node_content:A{0|8}
    |normalized:{LaTeX-TeX-_002c-_2026-_002e_002e_002e}
     *normal_command@LaTeX C1 l126
      *brace_container
     {normal_text: }
     *normal_command@TeX C1 l126
      *brace_container
     {normal_text: }
     *normal_command@comma C1 l126
      *brace_container
     {normal_text: }
     *normal_command@dots C1 l126
      *brace_container
     {normal_text: }
     *normal_command@enddots C1 l126
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l128
    *brace_arg C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{error_002d_002d_003e-_20ac-_00a1}
     *normal_command@error C1 l128
      *brace_container
     {normal_text: }
     *normal_command@euro C1 l128
      *brace_container
     {normal_text: }
     *normal_command@exclamdown C1 l128
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l130
    *brace_arg C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{_00aa-_00ba-_00bf}
     *normal_command@ordf C1 l130
      *brace_container
     {normal_text: }
     *normal_command@ordm C1 l130
      *brace_container
     {normal_text: }
     *normal_command@questiondown C1 l130
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l132
    *brace_arg C6
    |EXTRA
    |node_content:A{0|5}
    |normalized:{a-b-_00e5}
     {normal_text:a}
     *normal_command@tie C1 l132
      *brace_container
     {normal_text:b }
     *normal_command@today C1 l132
      *brace_container
     {normal_text: }
     *normal_command@aa C1 l132
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l134
    *brace_arg C25
    |EXTRA
    |node_content:A{0|24}
    |normalized:{_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe}
     *normal_command@AA C1 l134
      *brace_container
     {normal_text: }
     *normal_command@ae C1 l134
      *brace_container
     {normal_text: }
     *normal_command@oe C1 l134
      *brace_container
     {normal_text: }
     *normal_command@AE C1 l134
      *brace_container
     {normal_text: }
     *normal_command@OE C1 l134
      *brace_container
     {normal_text: }
     *normal_command@o C1 l134
      *brace_container
     {normal_text: }
     *normal_command@O C1 l134
      *brace_container
     {normal_text: }
     *normal_command@ss C1 l134
      *brace_container
     {normal_text: }
     *normal_command@l C1 l134
      *brace_container
     {normal_text: }
     *normal_command@L C1 l134
      *brace_container
     {normal_text: }
     *normal_command@DH C1 l134
      *brace_container
     {normal_text: }
     *normal_command@dh C1 l134
      *brace_container
     {normal_text: }
     *normal_command@th C1 l134
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l136
    *brace_arg C21
    |EXTRA
    |node_content:A{0|20}
    |normalized:{_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}
     *normal_command@" C1 l136
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@~ C1 l136
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@^ C1 l136
      *brace_container C1
       *normal_command@dotless C1 l136
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *normal_command@^ C1 l136
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@` C1 l136
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@\' C1 l136
      *following_arg C1
       {normal_text:e}
     {normal_text: }
     *normal_command@, C1 l136
      *brace_container C1
       {normal_text:c}
     {normal_text: }
     *normal_command@= C1 l136
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ringaccent C1 l136
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@H C1 l136
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ogonek C1 l136
      *brace_container C1
       {normal_text:e}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l138
    *brace_arg C13
    |EXTRA
    |node_content:A{0|12}
    |normalized:{_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}
     *normal_command@dotaccent C1 l138
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@u C1 l138
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ubaraccent C1 l138
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@udotaccent C1 l138
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@v C1 l138
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@dotless C1 l138
      *brace_container C1
       {normal_text:j}
     {normal_text: }
     *normal_command@tieaccent C1 l138
      *brace_container C1
       {normal_text:ee}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l140
    *brace_arg C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{_0131-_1e14-_1e08}
     *normal_command@dotless C1 l140
      *brace_container C1
       {normal_text:i}
     {normal_text: }
     *normal_command@` C1 l140
      *brace_container C1
       *normal_command@= C1 l140
        *following_arg C1
         {normal_text:E}
     {normal_text: }
     *normal_command@, C1 l140
      *brace_container C1
       *normal_command@\' C1 l140
        *following_arg C1
         {normal_text:C}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l142
    *brace_arg C11
    |EXTRA
    |node_content:A{0|10}
    |normalized:{_201c-_201d-_2018-_2019-_201e-_201a}
     *normal_command@quotedblleft C1 l142
      *brace_container
     {normal_text: }
     *normal_command@quotedblright C1 l142
      *brace_container
     {normal_text: }
     *normal_command@quoteleft C1 l142
      *brace_container
     {normal_text: }
     *normal_command@quoteright C1 l142
      *brace_container
     {normal_text: }
     *normal_command@quotedblbase C1 l142
      *brace_container
     {normal_text: }
     *normal_command@quotesinglbase C1 l142
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l144
    *brace_arg C11
    |EXTRA
    |node_content:A{0|10}
    |normalized:{_00ab-_00bb-_00ab-_00bb-_2039-_203a}
     *normal_command@guillemetleft C1 l144
      *brace_container
     {normal_text: }
     *normal_command@guillemetright C1 l144
      *brace_container
     {normal_text: }
     *normal_command@guillemotleft C1 l144
      *brace_container
     {normal_text: }
     *normal_command@guillemotright C1 l144
      *brace_container
     {normal_text: }
     *normal_command@guilsinglleft C1 l144
      *brace_container
     {normal_text: }
     *normal_command@guilsinglright C1 l144
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l146
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}
     {normal_text:`` \'\' --- -- ` \'}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l148
    *brace_arg C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{AAA-AAA-BBB}
     *normal_command@acronym C2 l148
      *brace_arg C1
       {normal_text:AAA}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:fff}
     {normal_text: }
     *normal_command@acronym C1 l148
      *brace_arg C1
       {normal_text:AAA}
     {normal_text: }
     *normal_command@acronym C1 l148
      *brace_arg C1
       {normal_text:BBB}
   {normal_text:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;4><p:1>
   >*normal_command@ifnottex C1 l150
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *paragraph C2
   *normal_command@ref C1 l151
    *brace_arg C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{CCC-CCC-DDD}
     *normal_command@abbr C2 l151
      *brace_arg C1
       {normal_text:CCC}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:rrr}
     {normal_text: }
     *normal_command@abbr C1 l151
      *brace_arg C1
       {normal_text:CCC}
     {normal_text: }
     *normal_command@abbr C1 l151
      *brace_arg C1
       {normal_text:DDD}
   {normal_text:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;4><p:1>
    >*normal_command@end C1 l152
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l154
    *brace_arg C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{someone_0040somewher-no_005fexplain_0040there}
     *normal_command@email C2 l154
      *brace_arg C3
       {normal_text:someone}
       *normal_command@@
       {normal_text:somewher}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:the someone}
     {normal_text: }
     *normal_command@email C1 l154
      *brace_arg C3
       {normal_text:no_explain}
       *normal_command@@
       {normal_text:there}
   {normal_text:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;5><p:1>
   >*normal_command@ifnottex C1 l156
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *paragraph C2
   *normal_command@ref C1 l157
    *brace_arg C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{f_002d_002dile1-f_002d_002dile}
     *normal_command@image C1 l157
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:f--ile1}
     {normal_text:  }
     *normal_command@image C5 l157
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:f--ile}
      *brace_arg C1
       {normal_text:aze}
      *brace_arg C1
       {normal_text:az}
      *brace_arg C1
       {normal_text:alt}
      *brace_arg C1
       {normal_text:e--xt}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l159
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{-_0040-_007b_007d-_002e-}
     *normal_command@verb C1 l159
      *brace_container C3
       {verb_delimiter:.}
       {raw: @ {} . }
       {verb_delimiter:.}
   {normal_text:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;5><p:1>
    >*normal_command@end C1 l160
    >|EXTRA
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l162
    *brace_arg C17
    |EXTRA
    |node_content:A{0|16}
    |normalized:{cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}
     *normal_command@cite C1 l162
      *brace_container C2
       {normal_text:cite }
       *normal_command@asis C1 l162
        *brace_container C1
         {normal_text:asis}
     {normal_text: }
     *normal_command@w C1 l162
      *brace_container C4
       {normal_text:in }
       *normal_command@@
       {normal_text:w }
       *normal_command@b C1 l162
        *brace_container C1
         {normal_text:b}
     {normal_text: }
     *normal_command@r C1 l162
      *brace_container C1
       {normal_text:in r}
     {normal_text: }
     *normal_command@sc C1 l162
      *brace_container C1
       {normal_text:sc}
     {normal_text: }
     *normal_command@strong C1 l162
      *brace_container C1
       {normal_text:str}
     {normal_text: }
     *normal_command@t C1 l162
      *brace_container C1
       {normal_text:t}
     {normal_text: }
     *normal_command@var C1 l162
      *brace_container C1
       {normal_text:var}
     {normal_text: }
     *normal_command@dfn C1 l162
      *brace_container C1
       {normal_text:dfn}
     {normal_text: }
     *normal_command@i C1 l162
      *brace_container C1
       {normal_text:i}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l164
    *brace_arg C13
    |EXTRA
    |node_content:A{0|12}
    |normalized:{env-code-option-samp-command-file-C_002dx-ESC}
     *normal_command@env C1 l164
      *brace_container C1
       {normal_text:env}
     {normal_text: }
     *normal_command@code C1 l164
      *brace_container C1
       {normal_text:code}
     {normal_text: }
     *normal_command@option C1 l164
      *brace_container C1
       {normal_text:option}
     {normal_text: }
     *normal_command@samp C1 l164
      *brace_container C1
       {normal_text:samp}
     {normal_text: }
     *normal_command@command C1 l164
      *brace_container C1
       {normal_text:command}
     {normal_text: }
     *normal_command@file C1 l164
      *brace_container C1
       {normal_text:file}
     {normal_text: }
     *normal_command@kbd C1 l164
      *brace_container C2
       {normal_text:C-x }
       *normal_command@key C1 l164
        *brace_container C1
         {normal_text:ESC}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l166
    *brace_arg C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{8_002e27in}
     {normal_text:8.27}
     *normal_command@dmn C1 l166
      *brace_container C1
       {normal_text:in}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l168
    *brace_arg C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{sansserif-slanted}
     *normal_command@sansserif C1 l168
      *brace_container C1
       {normal_text:sansserif}
     {normal_text: }
     *normal_command@slanted C1 l168
      *brace_container C1
       {normal_text:slanted}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l170
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{indicateurl}
     *normal_command@indicateurl C1 l170
      *brace_container C1
       {normal_text:indicateurl}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l172
    *brace_arg C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{gH-3rd}
     *normal_command@sub C1 l172
      *brace_container C1
       {normal_text:g}
     {normal_text:H 3}
     *normal_command@sup C1 l172
      *brace_container C1
       {normal_text:rd}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l174
    *brace_arg C5
    |EXTRA
    |node_content:A{0|4}
    |normalized:{http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}
     *normal_command@url C1 l174
      *brace_arg C1
       {normal_text:http://somewhere_aaa}
     {normal_text: }
     *normal_command@url C2 l174
      *brace_arg C1
       {normal_text:url}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:text}
     {normal_text: }
     *normal_command@uref C3 l174
      *brace_arg C1
       {normal_text:/man.cgi/1/ls}
      *brace_arg
      *brace_arg C1
       {normal_text:ls}
   {normal_text:\\n}
  {empty_line:\\n}
';


$result_texis{'at_commands_in_refs_utf8'} = '@setfilename at_commands_in_refs_utf8.info
@documentencoding utf-8

@node Top
@top Top

@menu
* @- @{ @}::
* @  @	 @! @* @. @: .@: @? @@::
* @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}::
* @LaTeX{} @TeX{} @comma{} @dots{} @enddots{}::
* @error{} @euro{} @exclamdown{}::
* @ordf{} @ordm{} @questiondown{}::
* a@tie{}b @today{} @aa{}::
* @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}::
* @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}::
* @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}::
* @dotless{i} @`{@=E} @,{@\'C}::
* @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}::
* @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}::
* `` \'\' --- -- ` \'::
* @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}::
* @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}::
* @email{someone@@somewher, the someone} @email{no_explain@@there}::
* @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}::
* @verb{. @ {} . .}::
* @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}::
* @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}::
* 8.27@dmn{in}::
* @sansserif{sansserif} @slanted{slanted}::
* @indicateurl{indicateurl}::
* @sub{g}H 3@sup{rd}::
* @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}::
@end menu

@node @- @{ @}
@chapter @- @{ @}

@node @  @	 @! @* @. @: .@: @? @@
@chapter @  @	 @! @* @. @: .@: @? @@

@node @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
@chapter @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}

@node @LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
@chapter @LaTeX{} @TeX{} @comma{} @dots{} @enddots{}

@node @error{} @euro{} @exclamdown{}
@chapter @error{} @euro{} @exclamdown{}

@node @ordf{} @ordm{} @questiondown{}
@chapter @ordf{} @ordm{} @questiondown{}

@node a@tie{}b @today{} @aa{}
@chapter a@tie{}b @today{} @aa{}

@node @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
@chapter @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}

@node @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
@chapter  @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}

@node @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
@chapter @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}

@node @dotless{i} @`{@=E} @,{@\'C}
@chapter @dotless{i} @`{@=E} @,{@\'C}

@node @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
@chapter @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}

@node @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
@chapter @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}

@node `` \'\' --- -- ` \'
@chapter `` \'\' --- -- ` \'

@node @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
@chapter @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}

@node @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
@chapter @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}

@node @email{someone@@somewher, the someone} @email{no_explain@@there}
@chapter @email{someone@@somewher, the someone} @email{no_explain@@there}

@node @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
@chapter @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}

@node @verb{. @ {} . .}
@chapter @verb{. @ {} . .}

@node @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
@chapter @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}

@node @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
@chapter @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}

@node 8.27@dmn{in}
@chapter 8.27@dmn{in}

@node @sansserif{sansserif} @slanted{slanted}
@chapter @sansserif{sansserif} @slanted{slanted}

@node @indicateurl{indicateurl}
@chapter @indicateurl{indicateurl}

@node @sub{g}H 3@sup{rd}
@chapter @sub{g}H 3@sup{rd}

@node @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
@chapter @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}

@ref{@- @{ @}}

@ref{@  @	 @! @* @. @: .@: @? @@}

@ref{@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}}

@ref{@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}}

@ref{@error{} @euro{} @exclamdown{}}

@ref{@ordf{} @ordm{} @questiondown{}}

@ref{a@tie{}b @today{} @aa{}}

@ref{@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}}

@ref{@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}}

@ref{@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}}

@ref{@dotless{i} @`{@=E} @,{@\'C}}

@ref{@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}}

@ref{@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}}

@ref{`` \'\' --- -- ` \'}

@ref{@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}}

@ref{@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}}

@ref{@email{someone@@somewher, the someone} @email{no_explain@@there}}

@ref{@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}}

@ref{@verb{. @ {} . .}}

@ref{@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}}

@ref{@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}}

@ref{8.27@dmn{in}}

@ref{@sansserif{sansserif} @slanted{slanted}}

@ref{@indicateurl{indicateurl}}

@ref{@sub{g}H 3@sup{rd}}

@ref{@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}}

';


$result_texts{'at_commands_in_refs_utf8'} = '
Top
***

*  { }::
*     ! 
 .  . ? @::
* @ { } \\ #::
* LaTeX TeX , ... ...::
* error-> Euro !::
* a o ?::
* a b a sunny day aa::
* AA ae oe AE OE /o /O ss /l /L D d th::
* a" e~ i^ a^ a` e\' c, e= e* e\'\' e;::
* e. e( e_ .e e< j ee[::
* i E=` C\',::
* " " ` \' ,, ,::
* << >> << >> < >::
* `` \'\' --- -- ` \'::
* AAA (fff) AAA BBB::
* CCC (rrr) CCC DDD::
* the someone no_explain@there::
* f--ile1  f--ile::
*  @ {} . ::
* cite asis in @w b in r SC str t var dfn i::
* env code option samp command file C-x ESC::
* 8.27in::
* sansserif slanted::
* indicateurl::
* gH 3rd::
* http://somewhere_aaa url (text) ls::

1  { }
******

2     ! 
 .  . ? @
*****************

3 @ { } \\ #
***********

4 LaTeX TeX , ... ...
*********************

5 error-> Euro !
****************

6 a o ?
*******

7 a b a sunny day aa
********************

8 AA ae oe AE OE /o /O ss /l /L D d th
**************************************

9 a" e~ i^ a^ a` e\' c, e= e* e\'\' e;
***********************************

10 e. e( e_ .e e< j ee[
***********************

11 i E=` C\',
************

12 " " ` \' ,, ,
***************

13 << >> << >> < >
******************

14 " " -- - ` \'
***************

15 AAA (fff) AAA BBB
********************

16 CCC (rrr) CCC DDD
********************

17 the someone no_explain@there
*******************************

18 f--ile1  f--ile
******************

19  @ {} . 
***********

20 cite asis in @w b in r SC str t var dfn i
********************************************

21 env code option samp command file C-x ESC
********************************************

22 8.27in
*********

23 sansserif slanted
********************

24 indicateurl
**************

25 gH 3rd
*********

26 http://somewhere_aaa url (text) ls
*************************************

 { }

    ! 
 .  . ? @

@ { } \\ #

LaTeX TeX , ... ...

error-> Euro !

a o ?

a b a sunny day aa

AA ae oe AE OE /o /O ss /l /L D d th

a" e~ i^ a^ a` e\' c, e= e* e\'\' e;

e. e( e_ .e e< j ee[

i E=` C\',

" " ` \' ,, ,

<< >> << >> < >

" " -- - ` \'

AAA (fff) AAA BBB

CCC (rrr) CCC DDD

the someone no_explain@there

f--ile1  f--ile

 @ {} . 

cite asis in @w b in r SC str t var dfn i

env code option samp command file C-x ESC

8.27in

sansserif slanted

indicateurl

gH 3rd

http://somewhere_aaa url (text) ls

';

$result_errors{'at_commands_in_refs_utf8'} = '* W l94|@verb should not appear on @node line
 warning: @verb should not appear on @node line

* W l96|@verb should not appear on @chapter line
 warning: @verb should not appear on @chapter line

* W l159|@verb should not appear anywhere inside @ref
 warning: @verb should not appear anywhere inside @ref

';

$result_nodes_list{'at_commands_in_refs_utf8'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  @- @{ @}
  @  @	 @! @* @. @: .@: @? @@
  @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  @LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
  @error{} @euro{} @exclamdown{}
  @ordf{} @ordm{} @questiondown{}
  a@tie{}b @today{} @aa{}
  @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
  @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  @dotless{i} @`{@=E} @,{@\'C}
  @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  `` \'\' --- -- ` \'
  @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  @email{someone@@somewher, the someone} @email{no_explain@@there}
  @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  @verb{. @ {} . .}
  @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  8.27@dmn{in}
  @sansserif{sansserif} @slanted{slanted}
  @indicateurl{indicateurl}
  @sub{g}H 3@sup{rd}
  @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 node_directions:
  next->@- @{ @}
2|@- @{ @}
 associated_section: 1 @- @{ @}
 associated_title_command: 1 @- @{ @}
 node_directions:
  next->@  @	 @! @* @. @: .@: @? @@
  prev->Top
  up->Top
3|@  @	 @! @* @. @: .@: @? @@
 associated_section: 2 @  @	 @! @* @. @: .@: @? @@
 associated_title_command: 2 @  @	 @! @* @. @: .@: @? @@
 node_directions:
  next->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  prev->@- @{ @}
  up->Top
4|@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 associated_section: 3 @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 associated_title_command: 3 @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 node_directions:
  next->@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
  prev->@  @	 @! @* @. @: .@: @? @@
  up->Top
5|@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
 associated_section: 4 @LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
 associated_title_command: 4 @LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
 node_directions:
  next->@error{} @euro{} @exclamdown{}
  prev->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  up->Top
6|@error{} @euro{} @exclamdown{}
 associated_section: 5 @error{} @euro{} @exclamdown{}
 associated_title_command: 5 @error{} @euro{} @exclamdown{}
 node_directions:
  next->@ordf{} @ordm{} @questiondown{}
  prev->@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
  up->Top
7|@ordf{} @ordm{} @questiondown{}
 associated_section: 6 @ordf{} @ordm{} @questiondown{}
 associated_title_command: 6 @ordf{} @ordm{} @questiondown{}
 node_directions:
  next->a@tie{}b @today{} @aa{}
  prev->@error{} @euro{} @exclamdown{}
  up->Top
8|a@tie{}b @today{} @aa{}
 associated_section: 7 a@tie{}b @today{} @aa{}
 associated_title_command: 7 a@tie{}b @today{} @aa{}
 node_directions:
  next->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
  prev->@ordf{} @ordm{} @questiondown{}
  up->Top
9|@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
 associated_section: 8 @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
 associated_title_command: 8 @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
 node_directions:
  next->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  prev->a@tie{}b @today{} @aa{}
  up->Top
10|@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 associated_section: 9 @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 associated_title_command: 9 @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 node_directions:
  next->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  prev->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
  up->Top
11|@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 associated_section: 10 @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 associated_title_command: 10 @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 node_directions:
  next->@dotless{i} @`{@=E} @,{@\'C}
  prev->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  up->Top
12|@dotless{i} @`{@=E} @,{@\'C}
 associated_section: 11 @dotless{i} @`{@=E} @,{@\'C}
 associated_title_command: 11 @dotless{i} @`{@=E} @,{@\'C}
 node_directions:
  next->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  prev->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  up->Top
13|@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 associated_section: 12 @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 associated_title_command: 12 @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 node_directions:
  next->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  prev->@dotless{i} @`{@=E} @,{@\'C}
  up->Top
14|@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 associated_section: 13 @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 associated_title_command: 13 @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 node_directions:
  next->`` \'\' --- -- ` \'
  prev->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  up->Top
15|`` \'\' --- -- ` \'
 associated_section: 14 `` \'\' --- -- ` \'
 associated_title_command: 14 `` \'\' --- -- ` \'
 node_directions:
  next->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  prev->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  up->Top
16|@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 associated_section: 15 @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 associated_title_command: 15 @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 node_directions:
  next->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  prev->`` \'\' --- -- ` \'
  up->Top
17|@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 associated_section: 16 @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 associated_title_command: 16 @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 node_directions:
  next->@email{someone@@somewher, the someone} @email{no_explain@@there}
  prev->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  up->Top
18|@email{someone@@somewher, the someone} @email{no_explain@@there}
 associated_section: 17 @email{someone@@somewher, the someone} @email{no_explain@@there}
 associated_title_command: 17 @email{someone@@somewher, the someone} @email{no_explain@@there}
 node_directions:
  next->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  prev->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  up->Top
19|@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 associated_section: 18 @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 associated_title_command: 18 @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 node_directions:
  next->@verb{. @ {} . .}
  prev->@email{someone@@somewher, the someone} @email{no_explain@@there}
  up->Top
20|@verb{. @ {} . .}
 associated_section: 19 @verb{. @ {} . .}
 associated_title_command: 19 @verb{. @ {} . .}
 node_directions:
  next->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  prev->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  up->Top
21|@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 associated_section: 20 @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 associated_title_command: 20 @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 node_directions:
  next->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  prev->@verb{. @ {} . .}
  up->Top
22|@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 associated_section: 21 @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 associated_title_command: 21 @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 node_directions:
  next->8.27@dmn{in}
  prev->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  up->Top
23|8.27@dmn{in}
 associated_section: 22 8.27@dmn{in}
 associated_title_command: 22 8.27@dmn{in}
 node_directions:
  next->@sansserif{sansserif} @slanted{slanted}
  prev->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  up->Top
24|@sansserif{sansserif} @slanted{slanted}
 associated_section: 23 @sansserif{sansserif} @slanted{slanted}
 associated_title_command: 23 @sansserif{sansserif} @slanted{slanted}
 node_directions:
  next->@indicateurl{indicateurl}
  prev->8.27@dmn{in}
  up->Top
25|@indicateurl{indicateurl}
 associated_section: 24 @indicateurl{indicateurl}
 associated_title_command: 24 @indicateurl{indicateurl}
 node_directions:
  next->@sub{g}H 3@sup{rd}
  prev->@sansserif{sansserif} @slanted{slanted}
  up->Top
26|@sub{g}H 3@sup{rd}
 associated_section: 25 @sub{g}H 3@sup{rd}
 associated_title_command: 25 @sub{g}H 3@sup{rd}
 node_directions:
  next->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
  prev->@indicateurl{indicateurl}
  up->Top
27|@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 associated_section: 26 @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 associated_title_command: 26 @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 node_directions:
  prev->@sub{g}H 3@sup{rd}
  up->Top
';

$result_sections_list{'at_commands_in_refs_utf8'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->@- @{ @}
 section_children:
  1|@- @{ @}
  2|@  @	 @! @* @. @: .@: @? @@
  3|@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  4|@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
  5|@error{} @euro{} @exclamdown{}
  6|@ordf{} @ordm{} @questiondown{}
  7|a@tie{}b @today{} @aa{}
  8|@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
  9|@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  10|@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  11|@dotless{i} @`{@=E} @,{@\'C}
  12|@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  13|@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  14|`` \'\' --- -- ` \'
  15|@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  16|@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  17|@email{someone@@somewher, the someone} @email{no_explain@@there}
  18|@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  19|@verb{. @ {} . .}
  20|@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  21|@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  22|8.27@dmn{in}
  23|@sansserif{sansserif} @slanted{slanted}
  24|@indicateurl{indicateurl}
  25|@sub{g}H 3@sup{rd}
  26|@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
2|@- @{ @}
 associated_anchor_command: @- @{ @}
 associated_node: @- @{ @}
 section_directions:
  next->@  @	 @! @* @. @: .@: @? @@
  up->Top
 toplevel_directions:
  next->@  @	 @! @* @. @: .@: @? @@
  prev->Top
  up->Top
3|@  @	 @! @* @. @: .@: @? @@
 associated_anchor_command: @  @	 @! @* @. @: .@: @? @@
 associated_node: @  @	 @! @* @. @: .@: @? @@
 section_directions:
  next->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  prev->@- @{ @}
  up->Top
 toplevel_directions:
  next->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  prev->@- @{ @}
  up->Top
4|@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 associated_anchor_command: @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 associated_node: @atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
 section_directions:
  next->@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
  prev->@  @	 @! @* @. @: .@: @? @@
  up->Top
 toplevel_directions:
  next->@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
  prev->@  @	 @! @* @. @: .@: @? @@
  up->Top
5|@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
 associated_anchor_command: @LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
 associated_node: @LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
 section_directions:
  next->@error{} @euro{} @exclamdown{}
  prev->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  up->Top
 toplevel_directions:
  next->@error{} @euro{} @exclamdown{}
  prev->@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}
  up->Top
6|@error{} @euro{} @exclamdown{}
 associated_anchor_command: @error{} @euro{} @exclamdown{}
 associated_node: @error{} @euro{} @exclamdown{}
 section_directions:
  next->@ordf{} @ordm{} @questiondown{}
  prev->@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
  up->Top
 toplevel_directions:
  next->@ordf{} @ordm{} @questiondown{}
  prev->@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}
  up->Top
7|@ordf{} @ordm{} @questiondown{}
 associated_anchor_command: @ordf{} @ordm{} @questiondown{}
 associated_node: @ordf{} @ordm{} @questiondown{}
 section_directions:
  next->a@tie{}b @today{} @aa{}
  prev->@error{} @euro{} @exclamdown{}
  up->Top
 toplevel_directions:
  next->a@tie{}b @today{} @aa{}
  prev->@error{} @euro{} @exclamdown{}
  up->Top
8|a@tie{}b @today{} @aa{}
 associated_anchor_command: a@tie{}b @today{} @aa{}
 associated_node: a@tie{}b @today{} @aa{}
 section_directions:
  next->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
  prev->@ordf{} @ordm{} @questiondown{}
  up->Top
 toplevel_directions:
  next->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
  prev->@ordf{} @ordm{} @questiondown{}
  up->Top
9|@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
 associated_anchor_command: @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
 associated_node: @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
 section_directions:
  next->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  prev->a@tie{}b @today{} @aa{}
  up->Top
 toplevel_directions:
  next->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  prev->a@tie{}b @today{} @aa{}
  up->Top
10|@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 associated_anchor_command: @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 associated_node: @"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
 section_directions:
  next->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  prev->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
  up->Top
 toplevel_directions:
  next->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  prev->@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}
  up->Top
11|@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 associated_anchor_command: @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 associated_node: @dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
 section_directions:
  next->@dotless{i} @`{@=E} @,{@\'C}
  prev->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  up->Top
 toplevel_directions:
  next->@dotless{i} @`{@=E} @,{@\'C}
  prev->@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}
  up->Top
12|@dotless{i} @`{@=E} @,{@\'C}
 associated_anchor_command: @dotless{i} @`{@=E} @,{@\'C}
 associated_node: @dotless{i} @`{@=E} @,{@\'C}
 section_directions:
  next->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  prev->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  up->Top
 toplevel_directions:
  next->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  prev->@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}
  up->Top
13|@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 associated_anchor_command: @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 associated_node: @quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
 section_directions:
  next->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  prev->@dotless{i} @`{@=E} @,{@\'C}
  up->Top
 toplevel_directions:
  next->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  prev->@dotless{i} @`{@=E} @,{@\'C}
  up->Top
14|@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 associated_anchor_command: @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 associated_node: @guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
 section_directions:
  next->`` \'\' --- -- ` \'
  prev->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  up->Top
 toplevel_directions:
  next->`` \'\' --- -- ` \'
  prev->@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}
  up->Top
15|`` \'\' --- -- ` \'
 associated_anchor_command: `` \'\' --- -- ` \'
 associated_node: `` \'\' --- -- ` \'
 section_directions:
  next->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  prev->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  up->Top
 toplevel_directions:
  next->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  prev->@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}
  up->Top
16|@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 associated_anchor_command: @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 associated_node: @acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
 section_directions:
  next->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  prev->`` \'\' --- -- ` \'
  up->Top
 toplevel_directions:
  next->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  prev->`` \'\' --- -- ` \'
  up->Top
17|@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 associated_anchor_command: @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 associated_node: @abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
 section_directions:
  next->@email{someone@@somewher, the someone} @email{no_explain@@there}
  prev->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  up->Top
 toplevel_directions:
  next->@email{someone@@somewher, the someone} @email{no_explain@@there}
  prev->@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}
  up->Top
18|@email{someone@@somewher, the someone} @email{no_explain@@there}
 associated_anchor_command: @email{someone@@somewher, the someone} @email{no_explain@@there}
 associated_node: @email{someone@@somewher, the someone} @email{no_explain@@there}
 section_directions:
  next->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  prev->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  up->Top
 toplevel_directions:
  next->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  prev->@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}
  up->Top
19|@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 associated_anchor_command: @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 associated_node: @image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
 section_directions:
  next->@verb{. @ {} . .}
  prev->@email{someone@@somewher, the someone} @email{no_explain@@there}
  up->Top
 toplevel_directions:
  next->@verb{. @ {} . .}
  prev->@email{someone@@somewher, the someone} @email{no_explain@@there}
  up->Top
20|@verb{. @ {} . .}
 associated_anchor_command: @verb{. @ {} . .}
 associated_node: @verb{. @ {} . .}
 section_directions:
  next->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  prev->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  up->Top
 toplevel_directions:
  next->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  prev->@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}
  up->Top
21|@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 associated_anchor_command: @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 associated_node: @cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
 section_directions:
  next->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  prev->@verb{. @ {} . .}
  up->Top
 toplevel_directions:
  next->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  prev->@verb{. @ {} . .}
  up->Top
22|@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 associated_anchor_command: @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 associated_node: @env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
 section_directions:
  next->8.27@dmn{in}
  prev->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  up->Top
 toplevel_directions:
  next->8.27@dmn{in}
  prev->@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}
  up->Top
23|8.27@dmn{in}
 associated_anchor_command: 8.27@dmn{in}
 associated_node: 8.27@dmn{in}
 section_directions:
  next->@sansserif{sansserif} @slanted{slanted}
  prev->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  up->Top
 toplevel_directions:
  next->@sansserif{sansserif} @slanted{slanted}
  prev->@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}
  up->Top
24|@sansserif{sansserif} @slanted{slanted}
 associated_anchor_command: @sansserif{sansserif} @slanted{slanted}
 associated_node: @sansserif{sansserif} @slanted{slanted}
 section_directions:
  next->@indicateurl{indicateurl}
  prev->8.27@dmn{in}
  up->Top
 toplevel_directions:
  next->@indicateurl{indicateurl}
  prev->8.27@dmn{in}
  up->Top
25|@indicateurl{indicateurl}
 associated_anchor_command: @indicateurl{indicateurl}
 associated_node: @indicateurl{indicateurl}
 section_directions:
  next->@sub{g}H 3@sup{rd}
  prev->@sansserif{sansserif} @slanted{slanted}
  up->Top
 toplevel_directions:
  next->@sub{g}H 3@sup{rd}
  prev->@sansserif{sansserif} @slanted{slanted}
  up->Top
26|@sub{g}H 3@sup{rd}
 associated_anchor_command: @sub{g}H 3@sup{rd}
 associated_node: @sub{g}H 3@sup{rd}
 section_directions:
  next->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
  prev->@indicateurl{indicateurl}
  up->Top
 toplevel_directions:
  next->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
  prev->@indicateurl{indicateurl}
  up->Top
27|@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 associated_anchor_command: @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 associated_node: @url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
 section_directions:
  prev->@sub{g}H 3@sup{rd}
  up->Top
 toplevel_directions:
  prev->@sub{g}H 3@sup{rd}
  up->Top
';

$result_sectioning_root{'at_commands_in_refs_utf8'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'at_commands_in_refs_utf8'} = '';

$result_converted_errors{'file_html'}->{'at_commands_in_refs_utf8'} = '* W l91|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l89|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l89|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l91|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l157|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

';

$result_converted_errors{'file_info'}->{'at_commands_in_refs_utf8'} = '* W l89|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l25|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l33|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

* W l45|node name should not contain `,\': LaTeX TeX , ... ...
 warning: node name should not contain `,\': LaTeX TeX , ... ...

* W l91|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l89|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l174|@ref node name should not contain `:\'
 warning: @ref node name should not contain `:\'

';

1;
