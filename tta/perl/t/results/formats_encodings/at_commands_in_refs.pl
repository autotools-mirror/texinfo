use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'at_commands_in_refs'} = '*document_root C63
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l2 {Top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C28 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C5
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
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C17
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
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C9
    |node_content:A{0|8}
    |normalized:{_0040-_007b-_007d-_005c-_0023}
     *normal_command@atchar C1 l7
      *brace_container
     {normal_text: }
     *normal_command@lbracechar C1 l7
      *brace_container
     {normal_text: }
     *normal_command@rbracechar C1 l7
      *brace_container
     {normal_text: }
     *normal_command@backslashchar C1 l7
      *brace_container
     {normal_text: }
     *normal_command@hashchar C1 l7
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C9
    |node_content:A{0|8}
    |normalized:{LaTeX-TeX-_002c-_2026-_002e_002e_002e}
     *normal_command@LaTeX C1 l8
      *brace_container
     {normal_text: }
     *normal_command@TeX C1 l8
      *brace_container
     {normal_text: }
     *normal_command@comma C1 l8
      *brace_container
     {normal_text: }
     *normal_command@dots C1 l8
      *brace_container
     {normal_text: }
     *normal_command@enddots C1 l8
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |node_content:A{0|4}
    |normalized:{error_002d_002d_003e-_20ac-_00a1}
     *normal_command@error C1 l9
      *brace_container
     {normal_text: }
     *normal_command@euro C1 l9
      *brace_container
     {normal_text: }
     *normal_command@exclamdown C1 l9
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |node_content:A{0|4}
    |normalized:{_00aa-_00ba-_00bf}
     *normal_command@ordf C1 l10
      *brace_container
     {normal_text: }
     *normal_command@ordm C1 l10
      *brace_container
     {normal_text: }
     *normal_command@questiondown C1 l10
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l11
    {menu_entry_leading_text:* }
    *menu_entry_node C6
    |node_content:A{0|5}
    |normalized:{a-b-_00e5}
     {normal_text:a}
     *normal_command@tie C1 l11
      *brace_container
     {normal_text:b }
     *normal_command@today C1 l11
      *brace_container
     {normal_text: }
     *normal_command@aa C1 l11
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l12
    {menu_entry_leading_text:* }
    *menu_entry_node C25
    |node_content:A{0|24}
    |normalized:{_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe}
     *normal_command@AA C1 l12
      *brace_container
     {normal_text: }
     *normal_command@ae C1 l12
      *brace_container
     {normal_text: }
     *normal_command@oe C1 l12
      *brace_container
     {normal_text: }
     *normal_command@AE C1 l12
      *brace_container
     {normal_text: }
     *normal_command@OE C1 l12
      *brace_container
     {normal_text: }
     *normal_command@o C1 l12
      *brace_container
     {normal_text: }
     *normal_command@O C1 l12
      *brace_container
     {normal_text: }
     *normal_command@ss C1 l12
      *brace_container
     {normal_text: }
     *normal_command@l C1 l12
      *brace_container
     {normal_text: }
     *normal_command@L C1 l12
      *brace_container
     {normal_text: }
     *normal_command@DH C1 l12
      *brace_container
     {normal_text: }
     *normal_command@dh C1 l12
      *brace_container
     {normal_text: }
     *normal_command@th C1 l12
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l13
    {menu_entry_leading_text:* }
    *menu_entry_node C21
    |node_content:A{0|20}
    |normalized:{_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}
     *normal_command@" C1 l13
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@~ C1 l13
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@^ C1 l13
      *brace_container C1
       *normal_command@dotless C1 l13
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *normal_command@^ C1 l13
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@` C1 l13
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@\' C1 l13
      *following_arg C1
       {normal_text:e}
     {normal_text: }
     *normal_command@, C1 l13
      *brace_container C1
       {normal_text:c}
     {normal_text: }
     *normal_command@= C1 l13
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ringaccent C1 l13
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@H C1 l13
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ogonek C1 l13
      *brace_container C1
       {normal_text:e}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l14
    {menu_entry_leading_text:* }
    *menu_entry_node C13
    |node_content:A{0|12}
    |normalized:{_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}
     *normal_command@dotaccent C1 l14
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@u C1 l14
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ubaraccent C1 l14
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@udotaccent C1 l14
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@v C1 l14
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@dotless C1 l14
      *brace_container C1
       {normal_text:j}
     {normal_text: }
     *normal_command@tieaccent C1 l14
      *brace_container C1
       {normal_text:ee}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l15
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |node_content:A{0|4}
    |normalized:{_0131-_1e14-_1e08}
     *normal_command@dotless C1 l15
      *brace_container C1
       {normal_text:i}
     {normal_text: }
     *normal_command@` C1 l15
      *brace_container C1
       *normal_command@= C1 l15
        *following_arg C1
         {normal_text:E}
     {normal_text: }
     *normal_command@, C1 l15
      *brace_container C1
       *normal_command@\' C1 l15
        *following_arg C1
         {normal_text:C}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l16
    {menu_entry_leading_text:* }
    *menu_entry_node C11
    |node_content:A{0|10}
    |normalized:{_201c-_201d-_2018-_2019-_201e-_201a}
     *normal_command@quotedblleft C1 l16
      *brace_container
     {normal_text: }
     *normal_command@quotedblright C1 l16
      *brace_container
     {normal_text: }
     *normal_command@quoteleft C1 l16
      *brace_container
     {normal_text: }
     *normal_command@quoteright C1 l16
      *brace_container
     {normal_text: }
     *normal_command@quotedblbase C1 l16
      *brace_container
     {normal_text: }
     *normal_command@quotesinglbase C1 l16
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l17
    {menu_entry_leading_text:* }
    *menu_entry_node C11
    |node_content:A{0|10}
    |normalized:{_00ab-_00bb-_00ab-_00bb-_2039-_203a}
     *normal_command@guillemetleft C1 l17
      *brace_container
     {normal_text: }
     *normal_command@guillemetright C1 l17
      *brace_container
     {normal_text: }
     *normal_command@guillemotleft C1 l17
      *brace_container
     {normal_text: }
     *normal_command@guillemotright C1 l17
      *brace_container
     {normal_text: }
     *normal_command@guilsinglleft C1 l17
      *brace_container
     {normal_text: }
     *normal_command@guilsinglright C1 l17
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l18
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}
     {normal_text:`` \'\' --- -- ` \'}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l19
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |node_content:A{0|4}
    |normalized:{AAA-AAA-BBB}
     *normal_command@acronym C2 l19
      *brace_arg C1
       {normal_text:AAA}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:fff}
     {normal_text: }
     *normal_command@acronym C1 l19
      *brace_arg C1
       {normal_text:AAA}
     {normal_text: }
     *normal_command@acronym C1 l19
      *brace_arg C1
       {normal_text:BBB}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l20
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |node_content:A{0|4}
    |normalized:{CCC-CCC-DDD}
     *normal_command@abbr C2 l20
      *brace_arg C1
       {normal_text:CCC}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:rrr}
     {normal_text: }
     *normal_command@abbr C1 l20
      *brace_arg C1
       {normal_text:CCC}
     {normal_text: }
     *normal_command@abbr C1 l20
      *brace_arg C1
       {normal_text:DDD}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l21
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |node_content:A{0|2}
    |normalized:{someone_0040somewher-no_005fexplain_0040there}
     *normal_command@email C2 l21
      *brace_arg C3
       {normal_text:someone}
       *normal_command@@
       {normal_text:somewher}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:the someone}
     {normal_text: }
     *normal_command@email C1 l21
      *brace_arg C3
       {normal_text:no_explain}
       *normal_command@@
       {normal_text:there}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l22
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |node_content:A{0|2}
    |normalized:{f_002d_002dile1-f_002d_002dile}
     *normal_command@image C1 l22
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:f--ile1}
     {normal_text:  }
     *normal_command@image C5 l22
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
   *menu_entry C4 l23
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{-_0040-_007b_007d-_002e-}
     *normal_command@verb C1 l23
      *brace_container C3
       {verb_delimiter:.}
       {raw: @ {} . }
       {verb_delimiter:.}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l24
    {menu_entry_leading_text:* }
    *menu_entry_node C17
    |node_content:A{0|16}
    |normalized:{cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}
     *normal_command@cite C1 l24
      *brace_container C2
       {normal_text:cite }
       *normal_command@asis C1 l24
        *brace_container C1
         {normal_text:asis}
     {normal_text: }
     *normal_command@w C1 l24
      *brace_container C4
       {normal_text:in }
       *normal_command@@
       {normal_text:w }
       *normal_command@b C1 l24
        *brace_container C1
         {normal_text:b}
     {normal_text: }
     *normal_command@r C1 l24
      *brace_container C1
       {normal_text:in r}
     {normal_text: }
     *normal_command@sc C1 l24
      *brace_container C1
       {normal_text:sc}
     {normal_text: }
     *normal_command@strong C1 l24
      *brace_container C1
       {normal_text:str}
     {normal_text: }
     *normal_command@t C1 l24
      *brace_container C1
       {normal_text:t}
     {normal_text: }
     *normal_command@var C1 l24
      *brace_container C1
       {normal_text:var}
     {normal_text: }
     *normal_command@dfn C1 l24
      *brace_container C1
       {normal_text:dfn}
     {normal_text: }
     *normal_command@i C1 l24
      *brace_container C1
       {normal_text:i}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l25
    {menu_entry_leading_text:* }
    *menu_entry_node C13
    |node_content:A{0|12}
    |normalized:{env-code-option-samp-command-file-C_002dx-ESC}
     *normal_command@env C1 l25
      *brace_container C1
       {normal_text:env}
     {normal_text: }
     *normal_command@code C1 l25
      *brace_container C1
       {normal_text:code}
     {normal_text: }
     *normal_command@option C1 l25
      *brace_container C1
       {normal_text:option}
     {normal_text: }
     *normal_command@samp C1 l25
      *brace_container C1
       {normal_text:samp}
     {normal_text: }
     *normal_command@command C1 l25
      *brace_container C1
       {normal_text:command}
     {normal_text: }
     *normal_command@file C1 l25
      *brace_container C1
       {normal_text:file}
     {normal_text: }
     *normal_command@kbd C1 l25
      *brace_container C2
       {normal_text:C-x }
       *normal_command@key C1 l25
        *brace_container C1
         {normal_text:ESC}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l26
    {menu_entry_leading_text:* }
    *menu_entry_node C2
    |node_content:A{0|1}
    |normalized:{8_002e27in}
     {normal_text:8.27}
     *normal_command@dmn C1 l26
      *brace_container C1
       {normal_text:in}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l27
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |node_content:A{0|2}
    |normalized:{sansserif-slanted}
     *normal_command@sansserif C1 l27
      *brace_container C1
       {normal_text:sansserif}
     {normal_text: }
     *normal_command@slanted C1 l27
      *brace_container C1
       {normal_text:slanted}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l28
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{indicateurl}
     *normal_command@indicateurl C1 l28
      *brace_container C1
       {normal_text:indicateurl}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l29
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |node_content:A{0|2}
    |normalized:{gH-3rd}
     *normal_command@sub C1 l29
      *brace_container C1
       {normal_text:g}
     {normal_text:H 3}
     *normal_command@sup C1 l29
      *brace_container C1
       {normal_text:rd}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l30
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |node_content:A{0|4}
    |normalized:{http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}
     *normal_command@url C1 l30
      *brace_arg C1
       {normal_text:http://somewhere_aaa}
     {normal_text: }
     *normal_command@url C2 l30
      *brace_arg C1
       {normal_text:url}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:text}
     {normal_text: }
     *normal_command@uref C3 l30
      *brace_arg C1
       {normal_text:/man.cgi/1/ls}
      *brace_arg
      *brace_arg C1
       {normal_text:ls}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l31
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l33 {@- @{ @}}
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
 *normal_command@chapter C2 l34 {@- @{ @}}
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
 *normal_command@node C1 l36 {@  @	 @! @* @. @: .@: @? @@}
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
 *normal_command@chapter C2 l37 {@  @	 @! @* @. @: .@: @? @@}
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
 *normal_command@node C1 l39 {@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}}
 |identifier:{_0040-_007b-_007d-_005c-_0023}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@atchar C1 l39
     *brace_container
    {normal_text: }
    *normal_command@lbracechar C1 l39
     *brace_container
    {normal_text: }
    *normal_command@rbracechar C1 l39
     *brace_container
    {normal_text: }
    *normal_command@backslashchar C1 l39
     *brace_container
    {normal_text: }
    *normal_command@hashchar C1 l39
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l40 {@atchar{} @lbracechar{} @rbracechar{} @backslashchar{} @hashchar{}}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@atchar C1 l40
     *brace_container
    {normal_text: }
    *normal_command@lbracechar C1 l40
     *brace_container
    {normal_text: }
    *normal_command@rbracechar C1 l40
     *brace_container
    {normal_text: }
    *normal_command@backslashchar C1 l40
     *brace_container
    {normal_text: }
    *normal_command@hashchar C1 l40
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l42 {@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}}
 |identifier:{LaTeX-TeX-_002c-_2026-_002e_002e_002e}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@LaTeX C1 l42
     *brace_container
    {normal_text: }
    *normal_command@TeX C1 l42
     *brace_container
    {normal_text: }
    *normal_command@comma C1 l42
     *brace_container
    {normal_text: }
    *normal_command@dots C1 l42
     *brace_container
    {normal_text: }
    *normal_command@enddots C1 l42
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l43 {@LaTeX{} @TeX{} @comma{} @dots{} @enddots{}}
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@LaTeX C1 l43
     *brace_container
    {normal_text: }
    *normal_command@TeX C1 l43
     *brace_container
    {normal_text: }
    *normal_command@comma C1 l43
     *brace_container
    {normal_text: }
    *normal_command@dots C1 l43
     *brace_container
    {normal_text: }
    *normal_command@enddots C1 l43
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l45 {@error{} @euro{} @exclamdown{}}
 |identifier:{error_002d_002d_003e-_20ac-_00a1}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@error C1 l45
     *brace_container
    {normal_text: }
    *normal_command@euro C1 l45
     *brace_container
    {normal_text: }
    *normal_command@exclamdown C1 l45
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l46 {@error{} @euro{} @exclamdown{}}
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@error C1 l46
     *brace_container
    {normal_text: }
    *normal_command@euro C1 l46
     *brace_container
    {normal_text: }
    *normal_command@exclamdown C1 l46
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l48 {@ordf{} @ordm{} @questiondown{}}
 |identifier:{_00aa-_00ba-_00bf}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@ordf C1 l48
     *brace_container
    {normal_text: }
    *normal_command@ordm C1 l48
     *brace_container
    {normal_text: }
    *normal_command@questiondown C1 l48
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l49 {@ordf{} @ordm{} @questiondown{}}
 |section_heading_number:{6}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@ordf C1 l49
     *brace_container
    {normal_text: }
    *normal_command@ordm C1 l49
     *brace_container
    {normal_text: }
    *normal_command@questiondown C1 l49
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l51 {a@tie{}b @today{} @aa{}}
 |identifier:{a-b-_00e5}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C8
    {spaces_before_argument: }
    {normal_text:a}
    *normal_command@tie C1 l51
     *brace_container
    {normal_text:b }
    *normal_command@today C1 l51
     *brace_container
    {normal_text: }
    *normal_command@aa C1 l51
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l52 {a@tie{}b @today{} @aa{}}
 |section_heading_number:{7}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C8
    {spaces_before_argument: }
    {normal_text:a}
    *normal_command@tie C1 l52
     *brace_container
    {normal_text:b }
    *normal_command@today C1 l52
     *brace_container
    {normal_text: }
    *normal_command@aa C1 l52
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l54 {@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}}
 |identifier:{_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe}
 |is_target:{1}
 |node_number:{9}
  *arguments_line C1
   *line_arg C27
    {spaces_before_argument: }
    *normal_command@AA C1 l54
     *brace_container
    {normal_text: }
    *normal_command@ae C1 l54
     *brace_container
    {normal_text: }
    *normal_command@oe C1 l54
     *brace_container
    {normal_text: }
    *normal_command@AE C1 l54
     *brace_container
    {normal_text: }
    *normal_command@OE C1 l54
     *brace_container
    {normal_text: }
    *normal_command@o C1 l54
     *brace_container
    {normal_text: }
    *normal_command@O C1 l54
     *brace_container
    {normal_text: }
    *normal_command@ss C1 l54
     *brace_container
    {normal_text: }
    *normal_command@l C1 l54
     *brace_container
    {normal_text: }
    *normal_command@L C1 l54
     *brace_container
    {normal_text: }
    *normal_command@DH C1 l54
     *brace_container
    {normal_text: }
    *normal_command@dh C1 l54
     *brace_container
    {normal_text: }
    *normal_command@th C1 l54
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l55 {@AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{} @dh{} @th{}}
 |section_heading_number:{8}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C27
    {spaces_before_argument: }
    *normal_command@AA C1 l55
     *brace_container
    {normal_text: }
    *normal_command@ae C1 l55
     *brace_container
    {normal_text: }
    *normal_command@oe C1 l55
     *brace_container
    {normal_text: }
    *normal_command@AE C1 l55
     *brace_container
    {normal_text: }
    *normal_command@OE C1 l55
     *brace_container
    {normal_text: }
    *normal_command@o C1 l55
     *brace_container
    {normal_text: }
    *normal_command@O C1 l55
     *brace_container
    {normal_text: }
    *normal_command@ss C1 l55
     *brace_container
    {normal_text: }
    *normal_command@l C1 l55
     *brace_container
    {normal_text: }
    *normal_command@L C1 l55
     *brace_container
    {normal_text: }
    *normal_command@DH C1 l55
     *brace_container
    {normal_text: }
    *normal_command@dh C1 l55
     *brace_container
    {normal_text: }
    *normal_command@th C1 l55
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l57 {@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}}
 |identifier:{_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}
 |is_target:{1}
 |node_number:{10}
  *arguments_line C1
   *line_arg C23
    {spaces_before_argument: }
    *normal_command@" C1 l57
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@~ C1 l57
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@^ C1 l57
     *brace_container C1
      *normal_command@dotless C1 l57
       *brace_container C1
        {normal_text:i}
    {normal_text: }
    *normal_command@^ C1 l57
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@` C1 l57
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@\' C1 l57
     *following_arg C1
      {normal_text:e}
    {normal_text: }
    *normal_command@, C1 l57
     *brace_container C1
      {normal_text:c}
    {normal_text: }
    *normal_command@= C1 l57
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ringaccent C1 l57
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@H C1 l57
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ogonek C1 l57
     *brace_container C1
      {normal_text:e}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l58 {@"{a} @~{e} @^{@dotless{i}} @^{a} @`{a} @\'e @,{c} @={e} @ringaccent{e} @H{e} @ogonek{e}}
 |section_heading_number:{9}
 |section_level:{1}
 |section_number:{10}
  *arguments_line C1
   *line_arg C23
    {spaces_before_argument:  }
    *normal_command@" C1 l58
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@~ C1 l58
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@^ C1 l58
     *brace_container C1
      *normal_command@dotless C1 l58
       *brace_container C1
        {normal_text:i}
    {normal_text: }
    *normal_command@^ C1 l58
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@` C1 l58
     *brace_container C1
      {normal_text:a}
    {normal_text: }
    *normal_command@\' C1 l58
     *following_arg C1
      {normal_text:e}
    {normal_text: }
    *normal_command@, C1 l58
     *brace_container C1
      {normal_text:c}
    {normal_text: }
    *normal_command@= C1 l58
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ringaccent C1 l58
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@H C1 l58
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ogonek C1 l58
     *brace_container C1
      {normal_text:e}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l60 {@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}}
 |identifier:{_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}
 |is_target:{1}
 |node_number:{11}
  *arguments_line C1
   *line_arg C15
    {spaces_before_argument: }
    *normal_command@dotaccent C1 l60
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@u C1 l60
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ubaraccent C1 l60
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@udotaccent C1 l60
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@v C1 l60
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@dotless C1 l60
     *brace_container C1
      {normal_text:j}
    {normal_text: }
    *normal_command@tieaccent C1 l60
     *brace_container C1
      {normal_text:ee}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l61 {@dotaccent{e} @u{e} @ubaraccent{e} @udotaccent{e} @v{e} @dotless{j} @tieaccent{ee}}
 |section_heading_number:{10}
 |section_level:{1}
 |section_number:{11}
  *arguments_line C1
   *line_arg C15
    {spaces_before_argument: }
    *normal_command@dotaccent C1 l61
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@u C1 l61
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ubaraccent C1 l61
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@udotaccent C1 l61
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@v C1 l61
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@dotless C1 l61
     *brace_container C1
      {normal_text:j}
    {normal_text: }
    *normal_command@tieaccent C1 l61
     *brace_container C1
      {normal_text:ee}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l63 {@dotless{i} @`{@=E} @,{@\'C}}
 |identifier:{_0131-_1e14-_1e08}
 |is_target:{1}
 |node_number:{12}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@dotless C1 l63
     *brace_container C1
      {normal_text:i}
    {normal_text: }
    *normal_command@` C1 l63
     *brace_container C1
      *normal_command@= C1 l63
       *following_arg C1
        {normal_text:E}
    {normal_text: }
    *normal_command@, C1 l63
     *brace_container C1
      *normal_command@\' C1 l63
       *following_arg C1
        {normal_text:C}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l64 {@dotless{i} @`{@=E} @,{@\'C}}
 |section_heading_number:{11}
 |section_level:{1}
 |section_number:{12}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@dotless C1 l64
     *brace_container C1
      {normal_text:i}
    {normal_text: }
    *normal_command@` C1 l64
     *brace_container C1
      *normal_command@= C1 l64
       *following_arg C1
        {normal_text:E}
    {normal_text: }
    *normal_command@, C1 l64
     *brace_container C1
      *normal_command@\' C1 l64
       *following_arg C1
        {normal_text:C}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l66 {@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}}
 |identifier:{_201c-_201d-_2018-_2019-_201e-_201a}
 |is_target:{1}
 |node_number:{13}
  *arguments_line C1
   *line_arg C13
    {spaces_before_argument: }
    *normal_command@quotedblleft C1 l66
     *brace_container
    {normal_text: }
    *normal_command@quotedblright C1 l66
     *brace_container
    {normal_text: }
    *normal_command@quoteleft C1 l66
     *brace_container
    {normal_text: }
    *normal_command@quoteright C1 l66
     *brace_container
    {normal_text: }
    *normal_command@quotedblbase C1 l66
     *brace_container
    {normal_text: }
    *normal_command@quotesinglbase C1 l66
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l67 {@quotedblleft{} @quotedblright{} @quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{}}
 |section_heading_number:{12}
 |section_level:{1}
 |section_number:{13}
  *arguments_line C1
   *line_arg C13
    {spaces_before_argument: }
    *normal_command@quotedblleft C1 l67
     *brace_container
    {normal_text: }
    *normal_command@quotedblright C1 l67
     *brace_container
    {normal_text: }
    *normal_command@quoteleft C1 l67
     *brace_container
    {normal_text: }
    *normal_command@quoteright C1 l67
     *brace_container
    {normal_text: }
    *normal_command@quotedblbase C1 l67
     *brace_container
    {normal_text: }
    *normal_command@quotesinglbase C1 l67
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l69 {@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}}
 |identifier:{_00ab-_00bb-_00ab-_00bb-_2039-_203a}
 |is_target:{1}
 |node_number:{14}
  *arguments_line C1
   *line_arg C13
    {spaces_before_argument: }
    *normal_command@guillemetleft C1 l69
     *brace_container
    {normal_text: }
    *normal_command@guillemetright C1 l69
     *brace_container
    {normal_text: }
    *normal_command@guillemotleft C1 l69
     *brace_container
    {normal_text: }
    *normal_command@guillemotright C1 l69
     *brace_container
    {normal_text: }
    *normal_command@guilsinglleft C1 l69
     *brace_container
    {normal_text: }
    *normal_command@guilsinglright C1 l69
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l70 {@guillemetleft{} @guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{} @guilsinglright{}}
 |section_heading_number:{13}
 |section_level:{1}
 |section_number:{14}
  *arguments_line C1
   *line_arg C13
    {spaces_before_argument: }
    *normal_command@guillemetleft C1 l70
     *brace_container
    {normal_text: }
    *normal_command@guillemetright C1 l70
     *brace_container
    {normal_text: }
    *normal_command@guillemotleft C1 l70
     *brace_container
    {normal_text: }
    *normal_command@guillemotright C1 l70
     *brace_container
    {normal_text: }
    *normal_command@guilsinglleft C1 l70
     *brace_container
    {normal_text: }
    *normal_command@guilsinglright C1 l70
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l72 {`` \'\' --- -- ` \'}
 |identifier:{_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}
 |is_target:{1}
 |node_number:{15}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:`` \'\' --- -- ` \'}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l73 {`` \'\' --- -- ` \'}
 |section_heading_number:{14}
 |section_level:{1}
 |section_number:{15}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:`` \'\' --- -- ` \'}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l75 {@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}}
 |identifier:{AAA-AAA-BBB}
 |is_target:{1}
 |node_number:{16}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@acronym C2 l75
     *brace_arg C1
      {normal_text:AAA}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:fff}
    {normal_text: }
    *normal_command@acronym C1 l75
     *brace_arg C1
      {normal_text:AAA}
    {normal_text: }
    *normal_command@acronym C1 l75
     *brace_arg C1
      {normal_text:BBB}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l76 {@acronym{AAA, fff} @acronym{AAA} @acronym{BBB}}
 |section_heading_number:{15}
 |section_level:{1}
 |section_number:{16}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@acronym C2 l76
     *brace_arg C1
      {normal_text:AAA}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:fff}
    {normal_text: }
    *normal_command@acronym C1 l76
     *brace_arg C1
      {normal_text:AAA}
    {normal_text: }
    *normal_command@acronym C1 l76
     *brace_arg C1
      {normal_text:BBB}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l78 {@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}}
 |identifier:{CCC-CCC-DDD}
 |is_target:{1}
 |node_number:{17}
  *arguments_line C1
   *line_arg C7
   >SOURCEMARKS
   >expanded_conditional_command<start;1>
    >*normal_command@ifnottex C1 l79
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
    {spaces_before_argument: }
    *normal_command@abbr C2 l78
     *brace_arg C1
      {normal_text:CCC}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:rrr}
    {normal_text: }
    *normal_command@abbr C1 l78
     *brace_arg C1
      {normal_text:CCC}
    {normal_text: }
    *normal_command@abbr C1 l78
     *brace_arg C1
      {normal_text:DDD}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l80 {@abbr{CCC, rrr} @abbr{CCC} @abbr{DDD}}
 |section_heading_number:{16}
 |section_level:{1}
 |section_number:{17}
  *arguments_line C1
   *line_arg C7
   >SOURCEMARKS
   >expanded_conditional_command<end;1>
    >*normal_command@end C1 l81
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
    {spaces_before_argument: }
    *normal_command@abbr C2 l80
     *brace_arg C1
      {normal_text:CCC}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:rrr}
    {normal_text: }
    *normal_command@abbr C1 l80
     *brace_arg C1
      {normal_text:CCC}
    {normal_text: }
    *normal_command@abbr C1 l80
     *brace_arg C1
      {normal_text:DDD}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l83 {@email{someone@@somewher, the someone} @email{no_explain@@there}}
 |identifier:{someone_0040somewher-no_005fexplain_0040there}
 |is_target:{1}
 |node_number:{18}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@email C2 l83
     *brace_arg C3
      {normal_text:someone}
      *normal_command@@
      {normal_text:somewher}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:the someone}
    {normal_text: }
    *normal_command@email C1 l83
     *brace_arg C3
      {normal_text:no_explain}
      *normal_command@@
      {normal_text:there}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l84 {@email{someone@@somewher, the someone} @email{no_explain@@there}}
 |section_heading_number:{17}
 |section_level:{1}
 |section_number:{18}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@email C2 l84
     *brace_arg C3
      {normal_text:someone}
      *normal_command@@
      {normal_text:somewher}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:the someone}
    {normal_text: }
    *normal_command@email C1 l84
     *brace_arg C3
      {normal_text:no_explain}
      *normal_command@@
      {normal_text:there}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l86 {@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}}
 |identifier:{f_002d_002dile1-f_002d_002dile}
 |is_target:{1}
 |node_number:{19}
  *arguments_line C1
   *line_arg C5
   >SOURCEMARKS
   >expanded_conditional_command<start;2>
    >*normal_command@ifnottex C1 l87
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
    {spaces_before_argument: }
    *normal_command@image C1 l86
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile1}
    {normal_text:  }
    *normal_command@image C5 l86
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
 *normal_command@chapter C2 l88 {@image{f--ile1}  @image{f--ile,aze,az,alt,e--xt}}
 |section_heading_number:{18}
 |section_level:{1}
 |section_number:{19}
  *arguments_line C1
   *line_arg C5
   >SOURCEMARKS
   >expanded_conditional_command<end;2>
    >*normal_command@end C1 l89
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
    {spaces_before_argument: }
    *normal_command@image C1 l88
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile1}
    {normal_text:  }
    *normal_command@image C5 l88
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
 *normal_command@node C1 l91 {@verb{. @ {} . .}}
 |identifier:{-_0040-_007b_007d-_002e-}
 |is_target:{1}
 |node_number:{20}
  *arguments_line C1
   *line_arg C3
   >SOURCEMARKS
   >expanded_conditional_command<start;3>
    >*normal_command@ifnottex C1 l92
     >*arguments_line C1
      >*block_line_arg C1
       >{spaces_before_argument:\\n}
    {spaces_before_argument: }
    *normal_command@verb C1 l91
     *brace_container C3
      {verb_delimiter:.}
      {raw: @ {} . }
      {verb_delimiter:.}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l93 {@verb{. @ {} . .}}
 |section_heading_number:{19}
 |section_level:{1}
 |section_number:{20}
  *arguments_line C1
   *line_arg C3
   >SOURCEMARKS
   >expanded_conditional_command<end;3>
    >*normal_command@end C1 l94
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
    {spaces_before_argument: }
    *normal_command@verb C1 l93
     *brace_container C3
      {verb_delimiter:.}
      {raw: @ {} . }
      {verb_delimiter:.}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l96 {@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}}
 |identifier:{cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}
 |is_target:{1}
 |node_number:{21}
  *arguments_line C1
   *line_arg C19
    {spaces_before_argument: }
    *normal_command@cite C1 l96
     *brace_container C2
      {normal_text:cite }
      *normal_command@asis C1 l96
       *brace_container C1
        {normal_text:asis}
    {normal_text: }
    *normal_command@w C1 l96
     *brace_container C4
      {normal_text:in }
      *normal_command@@
      {normal_text:w }
      *normal_command@b C1 l96
       *brace_container C1
        {normal_text:b}
    {normal_text: }
    *normal_command@r C1 l96
     *brace_container C1
      {normal_text:in r}
    {normal_text: }
    *normal_command@sc C1 l96
     *brace_container C1
      {normal_text:sc}
    {normal_text: }
    *normal_command@strong C1 l96
     *brace_container C1
      {normal_text:str}
    {normal_text: }
    *normal_command@t C1 l96
     *brace_container C1
      {normal_text:t}
    {normal_text: }
    *normal_command@var C1 l96
     *brace_container C1
      {normal_text:var}
    {normal_text: }
    *normal_command@dfn C1 l96
     *brace_container C1
      {normal_text:dfn}
    {normal_text: }
    *normal_command@i C1 l96
     *brace_container C1
      {normal_text:i}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l97 {@cite{cite @asis{asis}} @w{in @@w @b{b}} @r{in r} @sc{sc} @strong{str} @t{t} @var{var} @dfn{dfn} @i{i}}
 |section_heading_number:{20}
 |section_level:{1}
 |section_number:{21}
  *arguments_line C1
   *line_arg C19
    {spaces_before_argument: }
    *normal_command@cite C1 l97
     *brace_container C2
      {normal_text:cite }
      *normal_command@asis C1 l97
       *brace_container C1
        {normal_text:asis}
    {normal_text: }
    *normal_command@w C1 l97
     *brace_container C4
      {normal_text:in }
      *normal_command@@
      {normal_text:w }
      *normal_command@b C1 l97
       *brace_container C1
        {normal_text:b}
    {normal_text: }
    *normal_command@r C1 l97
     *brace_container C1
      {normal_text:in r}
    {normal_text: }
    *normal_command@sc C1 l97
     *brace_container C1
      {normal_text:sc}
    {normal_text: }
    *normal_command@strong C1 l97
     *brace_container C1
      {normal_text:str}
    {normal_text: }
    *normal_command@t C1 l97
     *brace_container C1
      {normal_text:t}
    {normal_text: }
    *normal_command@var C1 l97
     *brace_container C1
      {normal_text:var}
    {normal_text: }
    *normal_command@dfn C1 l97
     *brace_container C1
      {normal_text:dfn}
    {normal_text: }
    *normal_command@i C1 l97
     *brace_container C1
      {normal_text:i}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l99 {@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}}
 |identifier:{env-code-option-samp-command-file-C_002dx-ESC}
 |is_target:{1}
 |node_number:{22}
  *arguments_line C1
   *line_arg C15
    {spaces_before_argument: }
    *normal_command@env C1 l99
     *brace_container C1
      {normal_text:env}
    {normal_text: }
    *normal_command@code C1 l99
     *brace_container C1
      {normal_text:code}
    {normal_text: }
    *normal_command@option C1 l99
     *brace_container C1
      {normal_text:option}
    {normal_text: }
    *normal_command@samp C1 l99
     *brace_container C1
      {normal_text:samp}
    {normal_text: }
    *normal_command@command C1 l99
     *brace_container C1
      {normal_text:command}
    {normal_text: }
    *normal_command@file C1 l99
     *brace_container C1
      {normal_text:file}
    {normal_text: }
    *normal_command@kbd C1 l99
     *brace_container C2
      {normal_text:C-x }
      *normal_command@key C1 l99
       *brace_container C1
        {normal_text:ESC}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l100 {@env{env} @code{code} @option{option} @samp{samp} @command{command} @file{file} @kbd{C-x @key{ESC}}}
 |section_heading_number:{21}
 |section_level:{1}
 |section_number:{22}
  *arguments_line C1
   *line_arg C15
    {spaces_before_argument: }
    *normal_command@env C1 l100
     *brace_container C1
      {normal_text:env}
    {normal_text: }
    *normal_command@code C1 l100
     *brace_container C1
      {normal_text:code}
    {normal_text: }
    *normal_command@option C1 l100
     *brace_container C1
      {normal_text:option}
    {normal_text: }
    *normal_command@samp C1 l100
     *brace_container C1
      {normal_text:samp}
    {normal_text: }
    *normal_command@command C1 l100
     *brace_container C1
      {normal_text:command}
    {normal_text: }
    *normal_command@file C1 l100
     *brace_container C1
      {normal_text:file}
    {normal_text: }
    *normal_command@kbd C1 l100
     *brace_container C2
      {normal_text:C-x }
      *normal_command@key C1 l100
       *brace_container C1
        {normal_text:ESC}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l102 {8.27@dmn{in}}
 |identifier:{8_002e27in}
 |is_target:{1}
 |node_number:{23}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:8.27}
    *normal_command@dmn C1 l102
     *brace_container C1
      {normal_text:in}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l103 {8.27@dmn{in}}
 |section_heading_number:{22}
 |section_level:{1}
 |section_number:{23}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:8.27}
    *normal_command@dmn C1 l103
     *brace_container C1
      {normal_text:in}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l105 {@sansserif{sansserif} @slanted{slanted}}
 |identifier:{sansserif-slanted}
 |is_target:{1}
 |node_number:{24}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@sansserif C1 l105
     *brace_container C1
      {normal_text:sansserif}
    {normal_text: }
    *normal_command@slanted C1 l105
     *brace_container C1
      {normal_text:slanted}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l106 {@sansserif{sansserif} @slanted{slanted}}
 |section_heading_number:{23}
 |section_level:{1}
 |section_number:{24}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@sansserif C1 l106
     *brace_container C1
      {normal_text:sansserif}
    {normal_text: }
    *normal_command@slanted C1 l106
     *brace_container C1
      {normal_text:slanted}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l108 {@indicateurl{indicateurl}}
 |identifier:{indicateurl}
 |is_target:{1}
 |node_number:{25}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@indicateurl C1 l108
     *brace_container C1
      {normal_text:indicateurl}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l109 {@indicateurl{indicateurl}}
 |section_heading_number:{24}
 |section_level:{1}
 |section_number:{25}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@indicateurl C1 l109
     *brace_container C1
      {normal_text:indicateurl}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l111 {@sub{g}H 3@sup{rd}}
 |identifier:{gH-3rd}
 |is_target:{1}
 |node_number:{26}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@sub C1 l111
     *brace_container C1
      {normal_text:g}
    {normal_text:H 3}
    *normal_command@sup C1 l111
     *brace_container C1
      {normal_text:rd}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l112 {@sub{g}H 3@sup{rd}}
 |section_heading_number:{25}
 |section_level:{1}
 |section_number:{26}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@sub C1 l112
     *brace_container C1
      {normal_text:g}
    {normal_text:H 3}
    *normal_command@sup C1 l112
     *brace_container C1
      {normal_text:rd}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l114 {@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}}
 |identifier:{http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}
 |is_target:{1}
 |node_number:{27}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@url C1 l114
     *brace_arg C1
      {normal_text:http://somewhere_aaa}
    {normal_text: }
    *normal_command@url C2 l114
     *brace_arg C1
      {normal_text:url}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:text}
    {normal_text: }
    *normal_command@uref C3 l114
     *brace_arg C1
      {normal_text:/man.cgi/1/ls}
     *brace_arg
     *brace_arg C1
      {normal_text:ls}
    {spaces_after_argument:\\n}
 *normal_command@chapter C65 l115 {@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}}
 |section_heading_number:{26}
 |section_level:{1}
 |section_number:{27}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@url C1 l115
     *brace_arg C1
      {normal_text:http://somewhere_aaa}
    {normal_text: }
    *normal_command@url C2 l115
     *brace_arg C1
      {normal_text:url}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:text}
    {normal_text: }
    *normal_command@uref C3 l115
     *brace_arg C1
      {normal_text:/man.cgi/1/ls}
     *brace_arg
     *brace_arg C1
      {normal_text:ls}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l117
    *brace_arg C5
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
   *normal_command@ref C1 l119
    *brace_arg C17
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
   *normal_command@ref C1 l121
    *brace_arg C9
    |node_content:A{0|8}
    |normalized:{_0040-_007b-_007d-_005c-_0023}
     *normal_command@atchar C1 l121
      *brace_container
     {normal_text: }
     *normal_command@lbracechar C1 l121
      *brace_container
     {normal_text: }
     *normal_command@rbracechar C1 l121
      *brace_container
     {normal_text: }
     *normal_command@backslashchar C1 l121
      *brace_container
     {normal_text: }
     *normal_command@hashchar C1 l121
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l123
    *brace_arg C9
    |node_content:A{0|8}
    |normalized:{LaTeX-TeX-_002c-_2026-_002e_002e_002e}
     *normal_command@LaTeX C1 l123
      *brace_container
     {normal_text: }
     *normal_command@TeX C1 l123
      *brace_container
     {normal_text: }
     *normal_command@comma C1 l123
      *brace_container
     {normal_text: }
     *normal_command@dots C1 l123
      *brace_container
     {normal_text: }
     *normal_command@enddots C1 l123
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l125
    *brace_arg C5
    |node_content:A{0|4}
    |normalized:{error_002d_002d_003e-_20ac-_00a1}
     *normal_command@error C1 l125
      *brace_container
     {normal_text: }
     *normal_command@euro C1 l125
      *brace_container
     {normal_text: }
     *normal_command@exclamdown C1 l125
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l127
    *brace_arg C5
    |node_content:A{0|4}
    |normalized:{_00aa-_00ba-_00bf}
     *normal_command@ordf C1 l127
      *brace_container
     {normal_text: }
     *normal_command@ordm C1 l127
      *brace_container
     {normal_text: }
     *normal_command@questiondown C1 l127
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l129
    *brace_arg C6
    |node_content:A{0|5}
    |normalized:{a-b-_00e5}
     {normal_text:a}
     *normal_command@tie C1 l129
      *brace_container
     {normal_text:b }
     *normal_command@today C1 l129
      *brace_container
     {normal_text: }
     *normal_command@aa C1 l129
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l131
    *brace_arg C25
    |node_content:A{0|24}
    |normalized:{_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe}
     *normal_command@AA C1 l131
      *brace_container
     {normal_text: }
     *normal_command@ae C1 l131
      *brace_container
     {normal_text: }
     *normal_command@oe C1 l131
      *brace_container
     {normal_text: }
     *normal_command@AE C1 l131
      *brace_container
     {normal_text: }
     *normal_command@OE C1 l131
      *brace_container
     {normal_text: }
     *normal_command@o C1 l131
      *brace_container
     {normal_text: }
     *normal_command@O C1 l131
      *brace_container
     {normal_text: }
     *normal_command@ss C1 l131
      *brace_container
     {normal_text: }
     *normal_command@l C1 l131
      *brace_container
     {normal_text: }
     *normal_command@L C1 l131
      *brace_container
     {normal_text: }
     *normal_command@DH C1 l131
      *brace_container
     {normal_text: }
     *normal_command@dh C1 l131
      *brace_container
     {normal_text: }
     *normal_command@th C1 l131
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l133
    *brace_arg C21
    |node_content:A{0|20}
    |normalized:{_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}
     *normal_command@" C1 l133
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@~ C1 l133
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@^ C1 l133
      *brace_container C1
       *normal_command@dotless C1 l133
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *normal_command@^ C1 l133
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@` C1 l133
      *brace_container C1
       {normal_text:a}
     {normal_text: }
     *normal_command@\' C1 l133
      *following_arg C1
       {normal_text:e}
     {normal_text: }
     *normal_command@, C1 l133
      *brace_container C1
       {normal_text:c}
     {normal_text: }
     *normal_command@= C1 l133
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ringaccent C1 l133
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@H C1 l133
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ogonek C1 l133
      *brace_container C1
       {normal_text:e}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l135
    *brace_arg C13
    |node_content:A{0|12}
    |normalized:{_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}
     *normal_command@dotaccent C1 l135
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@u C1 l135
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ubaraccent C1 l135
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@udotaccent C1 l135
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@v C1 l135
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@dotless C1 l135
      *brace_container C1
       {normal_text:j}
     {normal_text: }
     *normal_command@tieaccent C1 l135
      *brace_container C1
       {normal_text:ee}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l137
    *brace_arg C5
    |node_content:A{0|4}
    |normalized:{_0131-_1e14-_1e08}
     *normal_command@dotless C1 l137
      *brace_container C1
       {normal_text:i}
     {normal_text: }
     *normal_command@` C1 l137
      *brace_container C1
       *normal_command@= C1 l137
        *following_arg C1
         {normal_text:E}
     {normal_text: }
     *normal_command@, C1 l137
      *brace_container C1
       *normal_command@\' C1 l137
        *following_arg C1
         {normal_text:C}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l139
    *brace_arg C11
    |node_content:A{0|10}
    |normalized:{_201c-_201d-_2018-_2019-_201e-_201a}
     *normal_command@quotedblleft C1 l139
      *brace_container
     {normal_text: }
     *normal_command@quotedblright C1 l139
      *brace_container
     {normal_text: }
     *normal_command@quoteleft C1 l139
      *brace_container
     {normal_text: }
     *normal_command@quoteright C1 l139
      *brace_container
     {normal_text: }
     *normal_command@quotedblbase C1 l139
      *brace_container
     {normal_text: }
     *normal_command@quotesinglbase C1 l139
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l141
    *brace_arg C11
    |node_content:A{0|10}
    |normalized:{_00ab-_00bb-_00ab-_00bb-_2039-_203a}
     *normal_command@guillemetleft C1 l141
      *brace_container
     {normal_text: }
     *normal_command@guillemetright C1 l141
      *brace_container
     {normal_text: }
     *normal_command@guillemotleft C1 l141
      *brace_container
     {normal_text: }
     *normal_command@guillemotright C1 l141
      *brace_container
     {normal_text: }
     *normal_command@guilsinglleft C1 l141
      *brace_container
     {normal_text: }
     *normal_command@guilsinglright C1 l141
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l143
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}
     {normal_text:`` \'\' --- -- ` \'}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l145
    *brace_arg C5
    |node_content:A{0|4}
    |normalized:{AAA-AAA-BBB}
     *normal_command@acronym C2 l145
      *brace_arg C1
       {normal_text:AAA}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:fff}
     {normal_text: }
     *normal_command@acronym C1 l145
      *brace_arg C1
       {normal_text:AAA}
     {normal_text: }
     *normal_command@acronym C1 l145
      *brace_arg C1
       {normal_text:BBB}
   {normal_text:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;4><p:1>
   >*normal_command@ifnottex C1 l147
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *paragraph C2
   *normal_command@ref C1 l148
    *brace_arg C5
    |node_content:A{0|4}
    |normalized:{CCC-CCC-DDD}
     *normal_command@abbr C2 l148
      *brace_arg C1
       {normal_text:CCC}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:rrr}
     {normal_text: }
     *normal_command@abbr C1 l148
      *brace_arg C1
       {normal_text:CCC}
     {normal_text: }
     *normal_command@abbr C1 l148
      *brace_arg C1
       {normal_text:DDD}
   {normal_text:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;4><p:1>
    >*normal_command@end C1 l149
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l151
    *brace_arg C3
    |node_content:A{0|2}
    |normalized:{someone_0040somewher-no_005fexplain_0040there}
     *normal_command@email C2 l151
      *brace_arg C3
       {normal_text:someone}
       *normal_command@@
       {normal_text:somewher}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:the someone}
     {normal_text: }
     *normal_command@email C1 l151
      *brace_arg C3
       {normal_text:no_explain}
       *normal_command@@
       {normal_text:there}
   {normal_text:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >expanded_conditional_command<start;5><p:1>
   >*normal_command@ifnottex C1 l153
    >*arguments_line C1
     >*block_line_arg C1
      >{spaces_before_argument:\\n}
  *paragraph C2
   *normal_command@ref C1 l154
    *brace_arg C3
    |node_content:A{0|2}
    |normalized:{f_002d_002dile1-f_002d_002dile}
     *normal_command@image C1 l154
     |input_encoding_name:{utf-8}
      *brace_arg C1
       {normal_text:f--ile1}
     {normal_text:  }
     *normal_command@image C5 l154
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
   *normal_command@ref C1 l156
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{-_0040-_007b_007d-_002e-}
     *normal_command@verb C1 l156
      *brace_container C3
       {verb_delimiter:.}
       {raw: @ {} . }
       {verb_delimiter:.}
   {normal_text:\\n}
   >SOURCEMARKS
   >expanded_conditional_command<end;5><p:1>
    >*normal_command@end C1 l157
    >|text_arg:{ifnottex}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifnottex}
      >{spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l159
    *brace_arg C17
    |node_content:A{0|16}
    |normalized:{cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}
     *normal_command@cite C1 l159
      *brace_container C2
       {normal_text:cite }
       *normal_command@asis C1 l159
        *brace_container C1
         {normal_text:asis}
     {normal_text: }
     *normal_command@w C1 l159
      *brace_container C4
       {normal_text:in }
       *normal_command@@
       {normal_text:w }
       *normal_command@b C1 l159
        *brace_container C1
         {normal_text:b}
     {normal_text: }
     *normal_command@r C1 l159
      *brace_container C1
       {normal_text:in r}
     {normal_text: }
     *normal_command@sc C1 l159
      *brace_container C1
       {normal_text:sc}
     {normal_text: }
     *normal_command@strong C1 l159
      *brace_container C1
       {normal_text:str}
     {normal_text: }
     *normal_command@t C1 l159
      *brace_container C1
       {normal_text:t}
     {normal_text: }
     *normal_command@var C1 l159
      *brace_container C1
       {normal_text:var}
     {normal_text: }
     *normal_command@dfn C1 l159
      *brace_container C1
       {normal_text:dfn}
     {normal_text: }
     *normal_command@i C1 l159
      *brace_container C1
       {normal_text:i}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l161
    *brace_arg C13
    |node_content:A{0|12}
    |normalized:{env-code-option-samp-command-file-C_002dx-ESC}
     *normal_command@env C1 l161
      *brace_container C1
       {normal_text:env}
     {normal_text: }
     *normal_command@code C1 l161
      *brace_container C1
       {normal_text:code}
     {normal_text: }
     *normal_command@option C1 l161
      *brace_container C1
       {normal_text:option}
     {normal_text: }
     *normal_command@samp C1 l161
      *brace_container C1
       {normal_text:samp}
     {normal_text: }
     *normal_command@command C1 l161
      *brace_container C1
       {normal_text:command}
     {normal_text: }
     *normal_command@file C1 l161
      *brace_container C1
       {normal_text:file}
     {normal_text: }
     *normal_command@kbd C1 l161
      *brace_container C2
       {normal_text:C-x }
       *normal_command@key C1 l161
        *brace_container C1
         {normal_text:ESC}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l163
    *brace_arg C2
    |node_content:A{0|1}
    |normalized:{8_002e27in}
     {normal_text:8.27}
     *normal_command@dmn C1 l163
      *brace_container C1
       {normal_text:in}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l165
    *brace_arg C3
    |node_content:A{0|2}
    |normalized:{sansserif-slanted}
     *normal_command@sansserif C1 l165
      *brace_container C1
       {normal_text:sansserif}
     {normal_text: }
     *normal_command@slanted C1 l165
      *brace_container C1
       {normal_text:slanted}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l167
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{indicateurl}
     *normal_command@indicateurl C1 l167
      *brace_container C1
       {normal_text:indicateurl}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l169
    *brace_arg C3
    |node_content:A{0|2}
    |normalized:{gH-3rd}
     *normal_command@sub C1 l169
      *brace_container C1
       {normal_text:g}
     {normal_text:H 3}
     *normal_command@sup C1 l169
      *brace_container C1
       {normal_text:rd}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l171
    *brace_arg C5
    |node_content:A{0|4}
    |normalized:{http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}
     *normal_command@url C1 l171
      *brace_arg C1
       {normal_text:http://somewhere_aaa}
     {normal_text: }
     *normal_command@url C2 l171
      *brace_arg C1
       {normal_text:url}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:text}
     {normal_text: }
     *normal_command@uref C3 l171
      *brace_arg C1
       {normal_text:/man.cgi/1/ls}
      *brace_arg
      *brace_arg C1
       {normal_text:ls}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l173
    *brace_arg C5
    |node_content:A{0|4}
    |normalized:{_2022-_00a9-_2261}
     *normal_command@bullet C1 l173
      *brace_container
     {normal_text: }
     *normal_command@copyright C1 l173
      *brace_container
     {normal_text: }
     *normal_command@equiv C1 l173
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l175
    *brace_arg C9
    |node_content:A{0|8}
    |normalized:{_2265-_2264-_2192-_21a6-_2212}
     *normal_command@geq C1 l175
      *brace_container
     {normal_text: }
     *normal_command@leq C1 l175
      *brace_container
     {normal_text: }
     *normal_command@arrow C1 l175
      *brace_container
     {normal_text: }
     *normal_command@expansion C1 l175
      *brace_container
     {normal_text: }
     *normal_command@minus C1 l175
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l177
    *brace_arg C9
    |node_content:A{0|8}
    |normalized:{_22c6-_00a3-_22a3-_00ae-_21d2}
     *normal_command@point C1 l177
      *brace_container
     {normal_text: }
     *normal_command@pounds C1 l177
      *brace_container
     {normal_text: }
     *normal_command@print C1 l177
      *brace_container
     {normal_text: }
     *normal_command@registeredsymbol C1 l177
      *brace_container
     {normal_text: }
     *normal_command@result C1 l177
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l179
    *brace_arg C3
    |node_content:A{0|2}
    |normalized:{_00b0-_00de}
     *normal_command@textdegree C1 l179
      *brace_container
     {normal_text: }
     *normal_command@TH C1 l179
      *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *normal_command@menu C6 l182
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l183
    {menu_entry_leading_text:* }
    *menu_entry_node C5
    |node_content:A{0|4}
    |normalized:{_2022-_00a9-_2261}
     *normal_command@bullet C1 l183
      *brace_container
     {normal_text: }
     *normal_command@copyright C1 l183
      *brace_container
     {normal_text: }
     *normal_command@equiv C1 l183
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l184
    {menu_entry_leading_text:* }
    *menu_entry_node C9
    |node_content:A{0|8}
    |normalized:{_2265-_2264-_2192-_21a6-_2212}
     *normal_command@geq C1 l184
      *brace_container
     {normal_text: }
     *normal_command@leq C1 l184
      *brace_container
     {normal_text: }
     *normal_command@arrow C1 l184
      *brace_container
     {normal_text: }
     *normal_command@expansion C1 l184
      *brace_container
     {normal_text: }
     *normal_command@minus C1 l184
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l185
    {menu_entry_leading_text:* }
    *menu_entry_node C9
    |node_content:A{0|8}
    |normalized:{_22c6-_00a3-_22a3-_00ae-_21d2}
     *normal_command@point C1 l185
      *brace_container
     {normal_text: }
     *normal_command@pounds C1 l185
      *brace_container
     {normal_text: }
     *normal_command@print C1 l185
      *brace_container
     {normal_text: }
     *normal_command@registeredsymbol C1 l185
      *brace_container
     {normal_text: }
     *normal_command@result C1 l185
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l186
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |node_content:A{0|2}
    |normalized:{_00b0-_00de}
     *normal_command@textdegree C1 l186
      *brace_container
     {normal_text: }
     *normal_command@TH C1 l186
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l187
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l189 {@bullet{} @copyright{} @equiv{}}
 |identifier:{_2022-_00a9-_2261}
 |is_target:{1}
 |node_number:{28}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@bullet C1 l189
     *brace_container
    {normal_text: }
    *normal_command@copyright C1 l189
     *brace_container
    {normal_text: }
    *normal_command@equiv C1 l189
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@section C2 l190 {@bullet{} @copyright{} @equiv{}}
 |section_heading_number:{26.1}
 |section_level:{2}
 |section_number:{28}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@bullet C1 l190
     *brace_container
    {normal_text: }
    *normal_command@copyright C1 l190
     *brace_container
    {normal_text: }
    *normal_command@equiv C1 l190
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l192 {@geq{} @leq{} @arrow{} @expansion{} @minus{}}
 |identifier:{_2265-_2264-_2192-_21a6-_2212}
 |is_target:{1}
 |node_number:{29}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@geq C1 l192
     *brace_container
    {normal_text: }
    *normal_command@leq C1 l192
     *brace_container
    {normal_text: }
    *normal_command@arrow C1 l192
     *brace_container
    {normal_text: }
    *normal_command@expansion C1 l192
     *brace_container
    {normal_text: }
    *normal_command@minus C1 l192
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@section C2 l193 {@geq{} @leq{} @arrow{} @expansion{} @minus{}}
 |section_heading_number:{26.2}
 |section_level:{2}
 |section_number:{29}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@geq C1 l193
     *brace_container
    {normal_text: }
    *normal_command@leq C1 l193
     *brace_container
    {normal_text: }
    *normal_command@arrow C1 l193
     *brace_container
    {normal_text: }
    *normal_command@expansion C1 l193
     *brace_container
    {normal_text: }
    *normal_command@minus C1 l193
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l195 {@point{} @pounds{} @print{} @registeredsymbol{} @result{}}
 |identifier:{_22c6-_00a3-_22a3-_00ae-_21d2}
 |is_target:{1}
 |node_number:{30}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@point C1 l195
     *brace_container
    {normal_text: }
    *normal_command@pounds C1 l195
     *brace_container
    {normal_text: }
    *normal_command@print C1 l195
     *brace_container
    {normal_text: }
    *normal_command@registeredsymbol C1 l195
     *brace_container
    {normal_text: }
    *normal_command@result C1 l195
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@section C2 l196 {@point{} @pounds{} @print{} @registeredsymbol{} @result{}}
 |section_heading_number:{26.3}
 |section_level:{2}
 |section_number:{30}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@point C1 l196
     *brace_container
    {normal_text: }
    *normal_command@pounds C1 l196
     *brace_container
    {normal_text: }
    *normal_command@print C1 l196
     *brace_container
    {normal_text: }
    *normal_command@registeredsymbol C1 l196
     *brace_container
    {normal_text: }
    *normal_command@result C1 l196
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l198 {@textdegree{} @TH{}}
 |identifier:{_00b0-_00de}
 |is_target:{1}
 |node_number:{31}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@textdegree C1 l198
     *brace_container
    {normal_text: }
    *normal_command@TH C1 l198
     *brace_container
    {spaces_after_argument:\\n}
 *normal_command@section C2 l199 {@textdegree{} @TH{}}
 |section_heading_number:{26.4}
 |section_level:{2}
 |section_number:{31}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@textdegree C1 l199
     *brace_container
    {normal_text: }
    *normal_command@TH C1 l199
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'at_commands_in_refs'} = '@node Top
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

@ref{@bullet{} @copyright{} @equiv{}}

@ref{@geq{} @leq{} @arrow{} @expansion{} @minus{}}

@ref{@point{} @pounds{} @print{} @registeredsymbol{} @result{}}

@ref{@textdegree{} @TH{}}


@menu
* @bullet{} @copyright{} @equiv{}::
* @geq{} @leq{} @arrow{} @expansion{} @minus{}::
* @point{} @pounds{} @print{} @registeredsymbol{} @result{}::
* @textdegree{} @TH{}::
@end menu

@node @bullet{} @copyright{} @equiv{}
@section @bullet{} @copyright{} @equiv{}

@node @geq{} @leq{} @arrow{} @expansion{} @minus{}
@section @geq{} @leq{} @arrow{} @expansion{} @minus{}

@node @point{} @pounds{} @print{} @registeredsymbol{} @result{}
@section @point{} @pounds{} @print{} @registeredsymbol{} @result{}

@node @textdegree{} @TH{}
@section @textdegree{} @TH{}

';


$result_texts{'at_commands_in_refs'} = 'Top
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

* (C) ==

>= <= -> ==> -

-!- # -| (R) =>

o TH


* * (C) ==::
* >= <= -> ==> -::
* -!- # -| (R) =>::
* o TH::

26.1 * (C) ==
=============

26.2 >= <= -> ==> -
===================

26.3 -!- # -| (R) =>
====================

26.4 o TH
=========

';

$result_errors{'at_commands_in_refs'} = '* W l91|@verb should not appear on @node line
 warning: @verb should not appear on @node line

* W l93|@verb should not appear on @chapter line
 warning: @verb should not appear on @chapter line

* W l156|@verb should not appear anywhere inside @ref
 warning: @verb should not appear anywhere inside @ref

';

$result_nodes_list{'at_commands_in_refs'} = '1|Top
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
 menus:
  @bullet{} @copyright{} @equiv{}
  @geq{} @leq{} @arrow{} @expansion{} @minus{}
  @point{} @pounds{} @print{} @registeredsymbol{} @result{}
  @textdegree{} @TH{}
 node_directions:
  prev->@sub{g}H 3@sup{rd}
  up->Top
28|@bullet{} @copyright{} @equiv{}
 associated_section: 26.1 @bullet{} @copyright{} @equiv{}
 associated_title_command: 26.1 @bullet{} @copyright{} @equiv{}
 node_directions:
  next->@geq{} @leq{} @arrow{} @expansion{} @minus{}
  up->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
29|@geq{} @leq{} @arrow{} @expansion{} @minus{}
 associated_section: 26.2 @geq{} @leq{} @arrow{} @expansion{} @minus{}
 associated_title_command: 26.2 @geq{} @leq{} @arrow{} @expansion{} @minus{}
 node_directions:
  next->@point{} @pounds{} @print{} @registeredsymbol{} @result{}
  prev->@bullet{} @copyright{} @equiv{}
  up->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
30|@point{} @pounds{} @print{} @registeredsymbol{} @result{}
 associated_section: 26.3 @point{} @pounds{} @print{} @registeredsymbol{} @result{}
 associated_title_command: 26.3 @point{} @pounds{} @print{} @registeredsymbol{} @result{}
 node_directions:
  next->@textdegree{} @TH{}
  prev->@geq{} @leq{} @arrow{} @expansion{} @minus{}
  up->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
31|@textdegree{} @TH{}
 associated_section: 26.4 @textdegree{} @TH{}
 associated_title_command: 26.4 @textdegree{} @TH{}
 node_directions:
  prev->@point{} @pounds{} @print{} @registeredsymbol{} @result{}
  up->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
';

$result_sections_list{'at_commands_in_refs'} = '1|Top
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
 section_children:
  1|@bullet{} @copyright{} @equiv{}
  2|@geq{} @leq{} @arrow{} @expansion{} @minus{}
  3|@point{} @pounds{} @print{} @registeredsymbol{} @result{}
  4|@textdegree{} @TH{}
28|@bullet{} @copyright{} @equiv{}
 associated_anchor_command: @bullet{} @copyright{} @equiv{}
 associated_node: @bullet{} @copyright{} @equiv{}
 section_directions:
  next->@geq{} @leq{} @arrow{} @expansion{} @minus{}
  up->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
29|@geq{} @leq{} @arrow{} @expansion{} @minus{}
 associated_anchor_command: @geq{} @leq{} @arrow{} @expansion{} @minus{}
 associated_node: @geq{} @leq{} @arrow{} @expansion{} @minus{}
 section_directions:
  next->@point{} @pounds{} @print{} @registeredsymbol{} @result{}
  prev->@bullet{} @copyright{} @equiv{}
  up->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
30|@point{} @pounds{} @print{} @registeredsymbol{} @result{}
 associated_anchor_command: @point{} @pounds{} @print{} @registeredsymbol{} @result{}
 associated_node: @point{} @pounds{} @print{} @registeredsymbol{} @result{}
 section_directions:
  next->@textdegree{} @TH{}
  prev->@geq{} @leq{} @arrow{} @expansion{} @minus{}
  up->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
31|@textdegree{} @TH{}
 associated_anchor_command: @textdegree{} @TH{}
 associated_node: @textdegree{} @TH{}
 section_directions:
  prev->@point{} @pounds{} @print{} @registeredsymbol{} @result{}
  up->@url{http://somewhere_aaa} @url{url, text} @uref{/man.cgi/1/ls,,ls}
';

$result_sectioning_root{'at_commands_in_refs'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'at_commands_in_refs'} = '';


$result_converted{'plaintext'}->{'at_commands_in_refs'} = 'Top
***

1 { }
*****

2     !
. . ? @
*******

3 @ { } \\ #
***********

4 LaTeX TeX , ... ...
*********************

5 error→ € ¡
************

6 ª º ¿
*******

7 a b a sunny day å
*******************

8 Å æ œ Æ Œ ø Ø ß ł Ł Ð ð þ
***************************

9 ä ẽ î â à é ç ē e̊ e̋ ę
***********************

10 ė ĕ e̲ ẹ ě ȷ e͡e
*****************

11 ı Ḕ Ḉ
********

12 “ ” ‘ ’ „ ‚
**************

13 « » « » ‹ ›
**************

14 " " -- - \' \'
***************

15 AAA (fff) AAA BBB
********************

16 CCC (rrr) CCC DDD
********************

17 the someone <someone@somewher> <no_explain@there>
****************************************************

18 [f--ile1] Image description""\\.
**********

19  @ {} . 
***********

20 ‘cite asis’ in @w b in r SC *str* t VAR “dfn” i
**************************************************

21 ‘env’ ‘code’ ‘option’ ‘samp’ ‘command’ ‘file’ ‘C-x <ESC>’
************************************************************

22 8.27in
*********

23 sansserif slanted
********************

24 ‘indicateurl’
****************

25 _{g}H 3^{rd}
***************

26 <http://somewhere_aaa> text (url) ls
***************************************

{ }

       !
. . ? @

   @ { } \\ #

   LaTeX TeX , ... ...

   error→ € ¡

   ª º ¿

   a b a sunny day å

   Å æ œ Æ Œ ø Ø ß ł Ł Ð ð þ

   ä ẽ î â à é ç ē e̊ e̋ ę

   ė ĕ e̲ ẹ ě ȷ e͡e

   ı Ḕ Ḉ

   “ ” ‘ ’ „ ‚

   « » « » ‹ ›

   `` \'\' --- -- ` \'

   AAA (fff) AAA BBB

   CCC (rrr) CCC DDD

   the someone <someone@somewher> <no_explain@there>

   [f--ile1] Image description""\\.

    @ {} . 

   cite asis in @w b in r SC *str* t VAR dfn i

   env code option samp command file C-x <ESC>

   8.27in

   sansserif slanted

   indicateurl

   _{g}H 3^{rd}

   <http://somewhere_aaa> text (url) ls

   • © ≡

   ≥ ≤ → ↦ −

   ⋆ £ ⊣ ® ⇒

   ° Þ

26.1 • © ≡
==========

26.2 ≥ ≤ → ↦ −
==============

26.3 ⋆ £ ⊣ ® ⇒
==============

26.4 ° Þ
========

';

$result_converted_errors{'plaintext'}->{'at_commands_in_refs'} = '* W l88|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l86|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

';


$result_converted{'html'}->{'at_commands_in_refs'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Top</title>

<meta name="description" content="Top">
<meta name="keywords" content="Top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
kbd.kbd {font-style: oblique}
kbd.key {font-style: normal}
span.r {font-family: initial; font-weight: normal; font-style: normal}
span.sansserif {font-family: sans-serif; font-weight: normal}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#-_007b-_007d" accesskey="n" rel="next"> { }</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="Top-1"><span>Top<a class="copiable-link" href="#Top-1"> &para;</a></span></h1>


<ul class="mini-toc">
<li><a href="#-_007b-_007d" accesskey="1"> { }</a></li>
<li><a href="#-_0021-_002e-_002e-_003f-_0040" accesskey="2">&nbsp; &nbsp; ! <br> .  . ? @</a></li>
<li><a href="#g_t_0040-_007b-_007d-_005c-_0023" accesskey="3">@ { } \\ #</a></li>
<li><a href="#LaTeX-TeX-_002c-_2026-_002e_002e_002e" accesskey="4">LaTeX TeX , &hellip; <small class="enddots">...</small></a></li>
<li><a href="#error_002d_002d_003e-_20ac-_00a1" accesskey="5">error<span class="arrow">&rarr;</span> &euro; &iexcl;</a></li>
<li><a href="#g_t_00aa-_00ba-_00bf" accesskey="6">&ordf; &ordm; &iquest;</a></li>
<li><a href="#a-b-_00e5" accesskey="7">a&nbsp;b a sunny day &aring;</a></li>
<li><a href="#g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe" accesskey="8">&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &#322; &#321; &ETH; &eth; &thorn;</a></li>
<li><a href="#g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119" accesskey="9">&auml; &#7869; &icirc; &acirc; &agrave; &eacute; &ccedil; &#275; e&#778; e&#779; &#281;</a></li>
<li><a href="#g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e">&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</a></li>
<li><a href="#g_t_0131-_1e14-_1e08">&inodot; &#274;&#768; &#262;&#807;</a></li>
<li><a href="#g_t_201c-_201d-_2018-_2019-_201e-_201a">&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</a></li>
<li><a href="#g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a">&laquo; &raquo; &laquo; &raquo; &lsaquo; &rsaquo;</a></li>
<li><a href="#g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027">&ldquo; &rdquo; &mdash; &ndash; &lsquo; &rsquo;</a></li>
<li><a href="#AAA-AAA-BBB"><abbr class="acronym" title="fff">AAA</abbr> (fff) <abbr class="acronym" title="fff">AAA</abbr> <abbr class="acronym">BBB</abbr></a></li>
<li><a href="#CCC-CCC-DDD"><abbr class="abbr" title="rrr">CCC</abbr> (rrr) <abbr class="abbr" title="rrr">CCC</abbr> <abbr class="abbr">DDD</abbr></a></li>
<li><a href="#someone_0040somewher-no_005fexplain_0040there"><a class="email" href="mailto:someone@somewher">the someone</a> <a class="email" href="mailto:no_explain@there">no_explain@there</a></a></li>
<li><a href="#f_002d_002dile1-f_002d_002dile"><img class="image" src="f--ile1.jpg" alt="f--ile1">  <img class="image" src="f--ile.png" alt="alt"></a></li>
<li><a href="#-_0040-_007b_007d-_002e-"><code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code></a></li>
<li><a href="#cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i"><cite class="cite">cite asis</cite> in&nbsp;@w&nbsp;<b class="b">b</b><!-- /@w --> <span class="r">in r</span> <small class="sc">SC</small> <strong class="strong">str</strong> <code class="t">t</code> <var class="var">var</var> <em class="dfn">dfn</em> <i class="i">i</i></a></li>
<li><a href="#env-code-option-samp-command-file-C_002dx-ESC"><code class="env">env</code> <code class="code">code</code> <samp class="option">option</samp> &lsquo;<samp class="samp">samp</samp>&rsquo; <code class="command">command</code> <samp class="file">file</samp> <kbd class="kbd">C-x <kbd class="key">ESC</kbd></kbd></a></li>
<li><a href="#g_t8_002e27in">8.27<span class="dmn">in</span></a></li>
<li><a href="#sansserif-slanted"><span class="sansserif">sansserif</span> <i class="slanted">slanted</i></a></li>
<li><a href="#indicateurl">&lsquo;<code class="indicateurl">indicateurl</code>&rsquo;</a></li>
<li><a href="#gH-3rd"><sub class="sub">g</sub>H 3<sup class="sup">rd</sup></a></li>
<li><a href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls"><a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a></a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="-_007b-_007d">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#-_0021-_002e-_002e-_003f-_0040" accesskey="n" rel="next">&nbsp; &nbsp; ! <br> .  . ? @</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="-_007b-_007d-1"><span>1  { }<a class="copiable-link" href="#-_007b-_007d-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="-_0021-_002e-_002e-_003f-_0040">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0040-_007b-_007d-_005c-_0023" accesskey="n" rel="next">@ { } \\ #</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#-_007b-_007d" accesskey="p" rel="prev"> { }</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="-_0021-_002e-_002e-_003f-_0040-1"><span>2 &nbsp; &nbsp; ! <br> .  . ? @<a class="copiable-link" href="#-_0021-_002e-_002e-_003f-_0040-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_0040-_007b-_007d-_005c-_0023">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#LaTeX-TeX-_002c-_2026-_002e_002e_002e" accesskey="n" rel="next">LaTeX TeX , &hellip; <small class="enddots">...</small></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#-_0021-_002e-_002e-_003f-_0040" accesskey="p" rel="prev">&nbsp; &nbsp; ! <br> .  . ? @</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_0040-_007b-_007d-_005c-_0023-1"><span>3 @ { } \\ #<a class="copiable-link" href="#g_t_0040-_007b-_007d-_005c-_0023-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="LaTeX-TeX-_002c-_2026-_002e_002e_002e">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#error_002d_002d_003e-_20ac-_00a1" accesskey="n" rel="next">error<span class="arrow">&rarr;</span> &euro; &iexcl;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0040-_007b-_007d-_005c-_0023" accesskey="p" rel="prev">@ { } \\ #</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="LaTeX-TeX-_002c-_2026-_002e_002e_002e-1"><span>4 LaTeX TeX , &hellip; <small class="enddots">...</small><a class="copiable-link" href="#LaTeX-TeX-_002c-_2026-_002e_002e_002e-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="error_002d_002d_003e-_20ac-_00a1">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_00aa-_00ba-_00bf" accesskey="n" rel="next">&ordf; &ordm; &iquest;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#LaTeX-TeX-_002c-_2026-_002e_002e_002e" accesskey="p" rel="prev">LaTeX TeX , &hellip; <small class="enddots">...</small></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="error_002d_002d_003e-_20ac-_00a1-1"><span>5 error<span class="arrow">&rarr;</span> &euro; &iexcl;<a class="copiable-link" href="#error_002d_002d_003e-_20ac-_00a1-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_00aa-_00ba-_00bf">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#a-b-_00e5" accesskey="n" rel="next">a&nbsp;b a sunny day &aring;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#error_002d_002d_003e-_20ac-_00a1" accesskey="p" rel="prev">error<span class="arrow">&rarr;</span> &euro; &iexcl;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_00aa-_00ba-_00bf-1"><span>6 &ordf; &ordm; &iquest;<a class="copiable-link" href="#g_t_00aa-_00ba-_00bf-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="a-b-_00e5">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe" accesskey="n" rel="next">&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &#322; &#321; &ETH; &eth; &thorn;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_00aa-_00ba-_00bf" accesskey="p" rel="prev">&ordf; &ordm; &iquest;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="a-b-_00e5-1"><span>7 a&nbsp;b a sunny day &aring;<a class="copiable-link" href="#a-b-_00e5-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119" accesskey="n" rel="next">&auml; &#7869; &icirc; &acirc; &agrave; &eacute; &ccedil; &#275; e&#778; e&#779; &#281;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#a-b-_00e5" accesskey="p" rel="prev">a&nbsp;b a sunny day &aring;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe-1"><span>8 &Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &#322; &#321; &ETH; &eth; &thorn;<a class="copiable-link" href="#g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e" accesskey="n" rel="next">&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe" accesskey="p" rel="prev">&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &#322; &#321; &ETH; &eth; &thorn;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119-1"><span>9 &auml; &#7869; &icirc; &acirc; &agrave; &eacute; &ccedil; &#275; e&#778; e&#779; &#281;<a class="copiable-link" href="#g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0131-_1e14-_1e08" accesskey="n" rel="next">&inodot; &#274;&#768; &#262;&#807;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119" accesskey="p" rel="prev">&auml; &#7869; &icirc; &acirc; &agrave; &eacute; &ccedil; &#275; e&#778; e&#779; &#281;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e-1"><span>10 &#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e<a class="copiable-link" href="#g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_0131-_1e14-_1e08">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_201c-_201d-_2018-_2019-_201e-_201a" accesskey="n" rel="next">&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e" accesskey="p" rel="prev">&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_0131-_1e14-_1e08-1"><span>11 &inodot; &#274;&#768; &#262;&#807;<a class="copiable-link" href="#g_t_0131-_1e14-_1e08-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_201c-_201d-_2018-_2019-_201e-_201a">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a" accesskey="n" rel="next">&laquo; &raquo; &laquo; &raquo; &lsaquo; &rsaquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0131-_1e14-_1e08" accesskey="p" rel="prev">&inodot; &#274;&#768; &#262;&#807;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_201c-_201d-_2018-_2019-_201e-_201a-1"><span>12 &ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;<a class="copiable-link" href="#g_t_201c-_201d-_2018-_2019-_201e-_201a-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027" accesskey="n" rel="next">&ldquo; &rdquo; &mdash; &ndash; &lsquo; &rsquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_201c-_201d-_2018-_2019-_201e-_201a" accesskey="p" rel="prev">&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a-1"><span>13 &laquo; &raquo; &laquo; &raquo; &lsaquo; &rsaquo;<a class="copiable-link" href="#g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#AAA-AAA-BBB" accesskey="n" rel="next"><abbr class="acronym" title="fff">AAA</abbr> (fff) <abbr class="acronym" title="fff">AAA</abbr> <abbr class="acronym">BBB</abbr></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a" accesskey="p" rel="prev">&laquo; &raquo; &laquo; &raquo; &lsaquo; &rsaquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027-1"><span>14 &ldquo; &rdquo; &mdash; &ndash; &lsquo; &rsquo;<a class="copiable-link" href="#g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="AAA-AAA-BBB">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#CCC-CCC-DDD" accesskey="n" rel="next"><abbr class="abbr" title="rrr">CCC</abbr> (rrr) <abbr class="abbr" title="rrr">CCC</abbr> <abbr class="abbr">DDD</abbr></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027" accesskey="p" rel="prev">&ldquo; &rdquo; &mdash; &ndash; &lsquo; &rsquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="AAA-AAA-BBB-1"><span>15 <abbr class="acronym" title="fff">AAA</abbr> (fff) <abbr class="acronym" title="fff">AAA</abbr> <abbr class="acronym">BBB</abbr><a class="copiable-link" href="#AAA-AAA-BBB-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="CCC-CCC-DDD">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#someone_0040somewher-no_005fexplain_0040there" accesskey="n" rel="next"><a class="email" href="mailto:someone@somewher">the someone</a> <a class="email" href="mailto:no_explain@there">no_explain@there</a></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#AAA-AAA-BBB" accesskey="p" rel="prev"><abbr class="acronym" title="fff">AAA</abbr> (fff) <abbr class="acronym" title="fff">AAA</abbr> <abbr class="acronym">BBB</abbr></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="CCC-CCC-DDD-1"><span>16 <abbr class="abbr" title="rrr">CCC</abbr> (rrr) <abbr class="abbr" title="rrr">CCC</abbr> <abbr class="abbr">DDD</abbr><a class="copiable-link" href="#CCC-CCC-DDD-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="someone_0040somewher-no_005fexplain_0040there">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#f_002d_002dile1-f_002d_002dile" accesskey="n" rel="next"><img class="image" src="f--ile1.jpg" alt="f--ile1">  <img class="image" src="f--ile.png" alt="alt"></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#CCC-CCC-DDD" accesskey="p" rel="prev"><abbr class="abbr" title="rrr">CCC</abbr> (rrr) <abbr class="abbr" title="rrr">CCC</abbr> <abbr class="abbr">DDD</abbr></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="someone_0040somewher-no_005fexplain_0040there-1"><span>17 <a class="email" href="mailto:someone@somewher">the someone</a> <a class="email" href="mailto:no_explain@there">no_explain@there</a><a class="copiable-link" href="#someone_0040somewher-no_005fexplain_0040there-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="f_002d_002dile1-f_002d_002dile">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#-_0040-_007b_007d-_002e-" accesskey="n" rel="next"><code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#someone_0040somewher-no_005fexplain_0040there" accesskey="p" rel="prev"><a class="email" href="mailto:someone@somewher">the someone</a> <a class="email" href="mailto:no_explain@there">no_explain@there</a></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="f_002d_002dile1-f_002d_002dile-1"><span>18 <img class="image" src="f--ile1.jpg" alt="f--ile1">  <img class="image" src="f--ile.png" alt="alt"><a class="copiable-link" href="#f_002d_002dile1-f_002d_002dile-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="-_0040-_007b_007d-_002e-">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i" accesskey="n" rel="next"><cite class="cite">cite asis</cite> in&nbsp;@w&nbsp;<b class="b">b</b><!-- /@w --> <span class="r">in r</span> <small class="sc">SC</small> <strong class="strong">str</strong> <code class="t">t</code> <var class="var">var</var> <em class="dfn">dfn</em> <i class="i">i</i></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#f_002d_002dile1-f_002d_002dile" accesskey="p" rel="prev"><img class="image" src="f--ile1.jpg" alt="f--ile1">  <img class="image" src="f--ile.png" alt="alt"></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="-_0040-_007b_007d-_002e--1"><span>19 <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code><a class="copiable-link" href="#-_0040-_007b_007d-_002e--1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#env-code-option-samp-command-file-C_002dx-ESC" accesskey="n" rel="next"><code class="env">env</code> <code class="code">code</code> <samp class="option">option</samp> &lsquo;<samp class="samp">samp</samp>&rsquo; <code class="command">command</code> <samp class="file">file</samp> <kbd class="kbd">C-x <kbd class="key">ESC</kbd></kbd></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#-_0040-_007b_007d-_002e-" accesskey="p" rel="prev"><code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i-1"><span>20 <cite class="cite">cite asis</cite> in&nbsp;@w&nbsp;<b class="b">b</b><!-- /@w --> <span class="r">in r</span> <small class="sc">SC</small> <strong class="strong">str</strong> <code class="t">t</code> <var class="var">var</var> <em class="dfn">dfn</em> <i class="i">i</i><a class="copiable-link" href="#cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="env-code-option-samp-command-file-C_002dx-ESC">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t8_002e27in" accesskey="n" rel="next">8.27<span class="dmn">in</span></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i" accesskey="p" rel="prev"><cite class="cite">cite asis</cite> in&nbsp;@w&nbsp;<b class="b">b</b><!-- /@w --> <span class="r">in r</span> <small class="sc">SC</small> <strong class="strong">str</strong> <code class="t">t</code> <var class="var">var</var> <em class="dfn">dfn</em> <i class="i">i</i></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="env-code-option-samp-command-file-C_002dx-ESC-1"><span>21 <code class="env">env</code> <code class="code">code</code> <samp class="option">option</samp> &lsquo;<samp class="samp">samp</samp>&rsquo; <code class="command">command</code> <samp class="file">file</samp> <kbd class="kbd">C-x <kbd class="key">ESC</kbd></kbd><a class="copiable-link" href="#env-code-option-samp-command-file-C_002dx-ESC-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t8_002e27in">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#sansserif-slanted" accesskey="n" rel="next"><span class="sansserif">sansserif</span> <i class="slanted">slanted</i></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#env-code-option-samp-command-file-C_002dx-ESC" accesskey="p" rel="prev"><code class="env">env</code> <code class="code">code</code> <samp class="option">option</samp> &lsquo;<samp class="samp">samp</samp>&rsquo; <code class="command">command</code> <samp class="file">file</samp> <kbd class="kbd">C-x <kbd class="key">ESC</kbd></kbd></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t8_002e27in-1"><span>22 8.27<span class="dmn">in</span><a class="copiable-link" href="#g_t8_002e27in-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="sansserif-slanted">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#indicateurl" accesskey="n" rel="next">&lsquo;<code class="indicateurl">indicateurl</code>&rsquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t8_002e27in" accesskey="p" rel="prev">8.27<span class="dmn">in</span></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="sansserif-slanted-1"><span>23 <span class="sansserif">sansserif</span> <i class="slanted">slanted</i><a class="copiable-link" href="#sansserif-slanted-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="indicateurl">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#gH-3rd" accesskey="n" rel="next"><sub class="sub">g</sub>H 3<sup class="sup">rd</sup></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#sansserif-slanted" accesskey="p" rel="prev"><span class="sansserif">sansserif</span> <i class="slanted">slanted</i></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="indicateurl-1"><span>24 &lsquo;<code class="indicateurl">indicateurl</code>&rsquo;<a class="copiable-link" href="#indicateurl-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="gH-3rd">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls" accesskey="n" rel="next"><a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#indicateurl" accesskey="p" rel="prev">&lsquo;<code class="indicateurl">indicateurl</code>&rsquo;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="gH-3rd-1"><span>25 <sub class="sub">g</sub>H 3<sup class="sup">rd</sup><a class="copiable-link" href="#gH-3rd-1"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#gH-3rd" accesskey="p" rel="prev"><sub class="sub">g</sub>H 3<sup class="sup">rd</sup></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls-1"><span>26 <a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a><a class="copiable-link" href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls-1"> &para;</a></span></h2>

<p><a class="ref" href="#-_007b-_007d"> { }</a>
</p>
<p><a class="ref" href="#-_0021-_002e-_002e-_003f-_0040">&nbsp; &nbsp; ! <br> .  . ? @</a>
</p>
<p><a class="ref" href="#g_t_0040-_007b-_007d-_005c-_0023">@ { } \\ #</a>
</p>
<p><a class="ref" href="#LaTeX-TeX-_002c-_2026-_002e_002e_002e">LaTeX TeX , &hellip; <small class="enddots">...</small></a>
</p>
<p><a class="ref" href="#error_002d_002d_003e-_20ac-_00a1">error<span class="arrow">&rarr;</span> &euro; &iexcl;</a>
</p>
<p><a class="ref" href="#g_t_00aa-_00ba-_00bf">&ordf; &ordm; &iquest;</a>
</p>
<p><a class="ref" href="#a-b-_00e5">a&nbsp;b a sunny day &aring;</a>
</p>
<p><a class="ref" href="#g_t_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe">&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &#322; &#321; &ETH; &eth; &thorn;</a>
</p>
<p><a class="ref" href="#g_t_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119">&auml; &#7869; &icirc; &acirc; &agrave; &eacute; &ccedil; &#275; e&#778; e&#779; &#281;</a>
</p>
<p><a class="ref" href="#g_t_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e">&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</a>
</p>
<p><a class="ref" href="#g_t_0131-_1e14-_1e08">&inodot; &#274;&#768; &#262;&#807;</a>
</p>
<p><a class="ref" href="#g_t_201c-_201d-_2018-_2019-_201e-_201a">&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</a>
</p>
<p><a class="ref" href="#g_t_00ab-_00bb-_00ab-_00bb-_2039-_203a">&laquo; &raquo; &laquo; &raquo; &lsaquo; &rsaquo;</a>
</p>
<p><a class="ref" href="#g_t_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027">&ldquo; &rdquo; &mdash; &ndash; &lsquo; &rsquo;</a>
</p>
<p><a class="ref" href="#AAA-AAA-BBB"><abbr class="acronym" title="fff">AAA</abbr> (fff) <abbr class="acronym" title="fff">AAA</abbr> <abbr class="acronym">BBB</abbr></a>
</p>
<p><a class="ref" href="#CCC-CCC-DDD"><abbr class="abbr" title="rrr">CCC</abbr> (rrr) <abbr class="abbr" title="rrr">CCC</abbr> <abbr class="abbr">DDD</abbr></a>
</p>
<p><a class="ref" href="#someone_0040somewher-no_005fexplain_0040there"><a class="email" href="mailto:someone@somewher">the someone</a> <a class="email" href="mailto:no_explain@there">no_explain@there</a></a>
</p>
<p><a class="ref" href="#f_002d_002dile1-f_002d_002dile"><img class="image" src="f--ile1.jpg" alt="f--ile1">  <img class="image" src="f--ile.png" alt="alt"></a>
</p>
<p><a class="ref" href="#-_0040-_007b_007d-_002e-"><code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code></a>
</p>
<p><a class="ref" href="#cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i"><cite class="cite">cite asis</cite> in&nbsp;@w&nbsp;<b class="b">b</b><!-- /@w --> <span class="r">in r</span> <small class="sc">SC</small> <strong class="strong">str</strong> <code class="t">t</code> <var class="var">var</var> <em class="dfn">dfn</em> <i class="i">i</i></a>
</p>
<p><a class="ref" href="#env-code-option-samp-command-file-C_002dx-ESC"><code class="env">env</code> <code class="code">code</code> <samp class="option">option</samp> &lsquo;<samp class="samp">samp</samp>&rsquo; <code class="command">command</code> <samp class="file">file</samp> <kbd class="kbd">C-x <kbd class="key">ESC</kbd></kbd></a>
</p>
<p><a class="ref" href="#g_t8_002e27in">8.27<span class="dmn">in</span></a>
</p>
<p><a class="ref" href="#sansserif-slanted"><span class="sansserif">sansserif</span> <i class="slanted">slanted</i></a>
</p>
<p><a class="ref" href="#indicateurl">&lsquo;<code class="indicateurl">indicateurl</code>&rsquo;</a>
</p>
<p><a class="ref" href="#gH-3rd"><sub class="sub">g</sub>H 3<sup class="sup">rd</sup></a>
</p>
<p><a class="ref" href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls"><a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a></a>
</p>
<p><a class="ref" href="#g_t_2022-_00a9-_2261">&bull; &copy; &equiv;</a>
</p>
<p><a class="ref" href="#g_t_2265-_2264-_2192-_21a6-_2212">&ge; &le; <span class="arrow">&rarr;</span> <span class="expansion">&rarr;</span> &minus;</a>
</p>
<p><a class="ref" href="#g_t_22c6-_00a3-_22a3-_00ae-_21d2"><span class="point">&lowast;</span> &pound; <span class="print">&#8867;</span> &reg; <span class="result">&rArr;</span></a>
</p>
<p><a class="ref" href="#g_t_00b0-_00de">&deg; &THORN;</a>
</p>


<ul class="mini-toc">
<li><a href="#g_t_2022-_00a9-_2261" accesskey="1">&bull; &copy; &equiv;</a></li>
<li><a href="#g_t_2265-_2264-_2192-_21a6-_2212" accesskey="2">&ge; &le; <span class="arrow">&rarr;</span> <span class="expansion">&rarr;</span> &minus;</a></li>
<li><a href="#g_t_22c6-_00a3-_22a3-_00ae-_21d2" accesskey="3"><span class="point">&lowast;</span> &pound; <span class="print">&#8867;</span> &reg; <span class="result">&rArr;</span></a></li>
<li><a href="#g_t_00b0-_00de" accesskey="4">&deg; &THORN;</a></li>
</ul>
<hr>
<div class="section-level-extent" id="g_t_2022-_00a9-_2261">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_2265-_2264-_2192-_21a6-_2212" accesskey="n" rel="next">&ge; &le; <span class="arrow">&rarr;</span> <span class="expansion">&rarr;</span> &minus;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls" accesskey="u" rel="up"><a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a></a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="g_t_2022-_00a9-_2261-1"><span>26.1 &bull; &copy; &equiv;<a class="copiable-link" href="#g_t_2022-_00a9-_2261-1"> &para;</a></span></h3>

<hr>
</div>
<div class="section-level-extent" id="g_t_2265-_2264-_2192-_21a6-_2212">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_22c6-_00a3-_22a3-_00ae-_21d2" accesskey="n" rel="next"><span class="point">&lowast;</span> &pound; <span class="print">&#8867;</span> &reg; <span class="result">&rArr;</span></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_2022-_00a9-_2261" accesskey="p" rel="prev">&bull; &copy; &equiv;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls" accesskey="u" rel="up"><a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a></a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="g_t_2265-_2264-_2192-_21a6-_2212-1"><span>26.2 &ge; &le; <span class="arrow">&rarr;</span> <span class="expansion">&rarr;</span> &minus;<a class="copiable-link" href="#g_t_2265-_2264-_2192-_21a6-_2212-1"> &para;</a></span></h3>

<hr>
</div>
<div class="section-level-extent" id="g_t_22c6-_00a3-_22a3-_00ae-_21d2">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_00b0-_00de" accesskey="n" rel="next">&deg; &THORN;</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_2265-_2264-_2192-_21a6-_2212" accesskey="p" rel="prev">&ge; &le; <span class="arrow">&rarr;</span> <span class="expansion">&rarr;</span> &minus;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls" accesskey="u" rel="up"><a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a></a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="g_t_22c6-_00a3-_22a3-_00ae-_21d2-1"><span>26.3 <span class="point">&lowast;</span> &pound; <span class="print">&#8867;</span> &reg; <span class="result">&rArr;</span><a class="copiable-link" href="#g_t_22c6-_00a3-_22a3-_00ae-_21d2-1"> &para;</a></span></h3>

<hr>
</div>
<div class="section-level-extent" id="g_t_00b0-_00de">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_22c6-_00a3-_22a3-_00ae-_21d2" accesskey="p" rel="prev"><span class="point">&lowast;</span> &pound; <span class="print">&#8867;</span> &reg; <span class="result">&rArr;</span></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls" accesskey="u" rel="up"><a class="url" href="http://somewhere_aaa">http://somewhere_aaa</a> <a class="url" href="url">text</a> <a class="uref" href="/man.cgi/1/ls">ls</a></a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="g_t_00b0-_00de-1"><span>26.4 &deg; &THORN;<a class="copiable-link" href="#g_t_00b0-_00de-1"> &para;</a></span></h3>

</div>
</div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'at_commands_in_refs'} = '* W l88|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l86|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l86|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l88|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

* W l154|@image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' (for HTML) not found, using `f--ile1.jpg\'

';


$result_converted{'xml'}->{'at_commands_in_refs'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> &hyphenbreak; &lbrace; &rbrace;</nodenext></node>
<top><sectiontitle> Top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>&hyphenbreak; &lbrace; &rbrace;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&latex; &tex; &comma; &dots; &enddots;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&errorglyph; &euro; &iexcl;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&ordf; &ordm; &iquest;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>a&nbsp;b <today/> &aring;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &thorn;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>`` \'\' --- -- ` \'</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><acronym><acronymword>AAA</acronymword><acronymdesc> fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><abbr><abbrword>CCC</abbrword><abbrdesc> rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><email><emailaddress>someone&arobase;somewher</emailaddress><emailname> the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><verb delimiter="."> @ {} . </verb></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>8.27<dmn>in</dmn></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><sansserif>sansserif</sansserif> <slanted>slanted</slanted></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><indicateurl>indicateurl</indicateurl></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><sub>g</sub>H 3<sup>rd</sup></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc> text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="-_007b-_007d"><nodename> &hyphenbreak; &lbrace; &rbrace;</nodename><nodenext automatic="on"> <spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> &hyphenbreak; &lbrace; &rbrace;</sectiontitle>

</chapter>
<node identifier="-_0021-_002e-_002e-_003f-_0040"><nodename> <spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</nodename><nodenext automatic="on"> &atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</nodenext><nodeprev automatic="on"> &hyphenbreak; &lbrace; &rbrace;</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</sectiontitle>

</chapter>
<node identifier="_0040-_007b-_007d-_005c-_0023"><nodename> &atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</nodename><nodenext automatic="on"> &latex; &tex; &comma; &dots; &enddots;</nodenext><nodeprev automatic="on"> <spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> &atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</sectiontitle>

</chapter>
<node identifier="LaTeX-TeX-_002c-_2026-_002e_002e_002e"><nodename> &latex; &tex; &comma; &dots; &enddots;</nodename><nodenext automatic="on"> &errorglyph; &euro; &iexcl;</nodenext><nodeprev automatic="on"> &atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> &latex; &tex; &comma; &dots; &enddots;</sectiontitle>

</chapter>
<node identifier="error_002d_002d_003e-_20ac-_00a1"><nodename> &errorglyph; &euro; &iexcl;</nodename><nodenext automatic="on"> &ordf; &ordm; &iquest;</nodenext><nodeprev automatic="on"> &latex; &tex; &comma; &dots; &enddots;</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> &errorglyph; &euro; &iexcl;</sectiontitle>

</chapter>
<node identifier="_00aa-_00ba-_00bf"><nodename> &ordf; &ordm; &iquest;</nodename><nodenext automatic="on"> a&nbsp;b <today/> &aring;</nodenext><nodeprev automatic="on"> &errorglyph; &euro; &iexcl;</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> &ordf; &ordm; &iquest;</sectiontitle>

</chapter>
<node identifier="a-b-_00e5"><nodename> a&nbsp;b <today/> &aring;</nodename><nodenext automatic="on"> &Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &thorn;</nodenext><nodeprev automatic="on"> &ordf; &ordm; &iquest;</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> a&nbsp;b <today/> &aring;</sectiontitle>

</chapter>
<node identifier="_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe"><nodename> &Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &thorn;</nodename><nodenext automatic="on"> <accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></nodenext><nodeprev automatic="on"> a&nbsp;b <today/> &aring;</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> &Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &thorn;</sectiontitle>

</chapter>
<node identifier="_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119"><nodename> <accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></nodename><nodenext automatic="on"> <accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></nodenext><nodeprev automatic="on"> &Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &thorn;</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle>  <accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></sectiontitle>

</chapter>
<node identifier="_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e"><nodename> <accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></nodename><nodenext automatic="on"> <dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></nodenext><nodeprev automatic="on"> <accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></sectiontitle>

</chapter>
<node identifier="_0131-_1e14-_1e08"><nodename> <dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></nodename><nodenext automatic="on"> &ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</nodenext><nodeprev automatic="on"> <accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></sectiontitle>

</chapter>
<node identifier="_201c-_201d-_2018-_2019-_201e-_201a"><nodename> &ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</nodename><nodenext automatic="on"> &laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</nodenext><nodeprev automatic="on"> <dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> &ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</sectiontitle>

</chapter>
<node identifier="_00ab-_00bb-_00ab-_00bb-_2039-_203a"><nodename> &laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</nodename><nodenext automatic="on"> `` \'\' --- -- ` \'</nodenext><nodeprev automatic="on"> &ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> &laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</sectiontitle>

</chapter>
<node identifier="_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027"><nodename> `` \'\' --- -- ` \'</nodename><nodenext automatic="on"> <acronym><acronymword>AAA</acronymword><acronymdesc> fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></nodenext><nodeprev automatic="on"> &laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> &textldquo; &textrdquo; &textmdash; &textndash; &textlsquo; &textrsquo;</sectiontitle>

</chapter>
<node identifier="AAA-AAA-BBB"><nodename> <acronym><acronymword>AAA</acronymword><acronymdesc> fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></nodename><nodenext automatic="on"> <abbr><abbrword>CCC</abbrword><abbrdesc> rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></nodenext><nodeprev automatic="on"> `` \'\' --- -- ` \'</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <acronym><acronymword>AAA</acronymword><acronymdesc> fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></sectiontitle>

</chapter>
<node identifier="CCC-CCC-DDD"><nodename> <abbr><abbrword>CCC</abbrword><abbrdesc> rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></nodename><nodenext automatic="on"> <email><emailaddress>someone&arobase;somewher</emailaddress><emailname> the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></nodenext><nodeprev automatic="on"> <acronym><acronymword>AAA</acronymword><acronymdesc> fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <abbr><abbrword>CCC</abbrword><abbrdesc> rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></sectiontitle>

</chapter>
<node identifier="someone_0040somewher-no_005fexplain_0040there"><nodename> <email><emailaddress>someone&arobase;somewher</emailaddress><emailname> the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></nodename><nodenext automatic="on"> <image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></nodenext><nodeprev automatic="on"> <abbr><abbrword>CCC</abbrword><abbrdesc> rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <email><emailaddress>someone&arobase;somewher</emailaddress><emailname> the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></sectiontitle>

</chapter>
<node identifier="f_002d_002dile1-f_002d_002dile"><nodename> <image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></nodename><nodenext automatic="on"> <verb delimiter="."> @ {} . </verb></nodenext><nodeprev automatic="on"> <email><emailaddress>someone&arobase;somewher</emailaddress><emailname> the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></sectiontitle>

</chapter>
<node identifier="-_0040-_007b_007d-_002e-"><nodename> <verb delimiter="."> @ {} . </verb></nodename><nodenext automatic="on"> <cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></nodenext><nodeprev automatic="on"> <image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <verb delimiter="."> @ {} . </verb></sectiontitle>

</chapter>
<node identifier="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i"><nodename> <cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></nodename><nodenext automatic="on"> <env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></nodenext><nodeprev automatic="on"> <verb delimiter="."> @ {} . </verb></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></sectiontitle>

</chapter>
<node identifier="env-code-option-samp-command-file-C_002dx-ESC"><nodename> <env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></nodename><nodenext automatic="on"> 8.27<dmn>in</dmn></nodenext><nodeprev automatic="on"> <cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></sectiontitle>

</chapter>
<node identifier="8_002e27in"><nodename> 8.27<dmn>in</dmn></nodename><nodenext automatic="on"> <sansserif>sansserif</sansserif> <slanted>slanted</slanted></nodenext><nodeprev automatic="on"> <env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> 8.27<dmn>in</dmn></sectiontitle>

</chapter>
<node identifier="sansserif-slanted"><nodename> <sansserif>sansserif</sansserif> <slanted>slanted</slanted></nodename><nodenext automatic="on"> <indicateurl>indicateurl</indicateurl></nodenext><nodeprev automatic="on"> 8.27<dmn>in</dmn></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <sansserif>sansserif</sansserif> <slanted>slanted</slanted></sectiontitle>

</chapter>
<node identifier="indicateurl"><nodename> <indicateurl>indicateurl</indicateurl></nodename><nodenext automatic="on"> <sub>g</sub>H 3<sup>rd</sup></nodenext><nodeprev automatic="on"> <sansserif>sansserif</sansserif> <slanted>slanted</slanted></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <indicateurl>indicateurl</indicateurl></sectiontitle>

</chapter>
<node identifier="gH-3rd"><nodename> <sub>g</sub>H 3<sup>rd</sup></nodename><nodenext automatic="on"> <url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc> text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></nodenext><nodeprev automatic="on"> <indicateurl>indicateurl</indicateurl></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <sub>g</sub>H 3<sup>rd</sup></sectiontitle>

</chapter>
<node identifier="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls"><nodename> <url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc> text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></nodename><nodeprev automatic="on"> <sub>g</sub>H 3<sup>rd</sup></nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> <url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc> text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></sectiontitle>

<para><ref label="-_007b-_007d"><xrefnodename>&hyphenbreak; &lbrace; &rbrace;</xrefnodename></ref>
</para>
<para><ref label="-_0021-_002e-_002e-_003f-_0040"><xrefnodename><spacecmd type="spc"/> <spacecmd type="tab"/> &eosexcl; &linebreak; &eosperiod; &noeos; .&noeos; &eosquest; &arobase;</xrefnodename></ref>
</para>
<para><ref label="_0040-_007b-_007d-_005c-_0023"><xrefnodename>&atchar; &lbracechar; &rbracechar; &backslashchar; &hashchar;</xrefnodename></ref>
</para>
<para><ref label="LaTeX-TeX-_002c-_2026-_002e_002e_002e"><xrefnodename>&latex; &tex; &comma; &dots; &enddots;</xrefnodename></ref>
</para>
<para><ref label="error_002d_002d_003e-_20ac-_00a1"><xrefnodename>&errorglyph; &euro; &iexcl;</xrefnodename></ref>
</para>
<para><ref label="_00aa-_00ba-_00bf"><xrefnodename>&ordf; &ordm; &iquest;</xrefnodename></ref>
</para>
<para><ref label="a-b-_00e5"><xrefnodename>a&nbsp;b <today/> &aring;</xrefnodename></ref>
</para>
<para><ref label="_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe"><xrefnodename>&Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH; &eth; &thorn;</xrefnodename></ref>
</para>
<para><ref label="_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119"><xrefnodename><accent type="uml">a</accent> <accent type="tilde">e</accent> <accent type="circ"><dotless>i</dotless></accent> <accent type="circ">a</accent> <accent type="grave">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="cedil">c</accent> <accent type="macr">e</accent> <accent type="ring">e</accent> <accent type="dblac">e</accent> <accent type="ogon">e</accent></xrefnodename></ref>
</para>
<para><ref label="_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e"><xrefnodename><accent type="dot">e</accent> <accent type="breve">e</accent> <accent type="ubaraccent">e</accent> <accent type="udotaccent">e</accent> <accent type="caron">e</accent> <dotless>j</dotless> <accent type="tieaccent">ee</accent></xrefnodename></ref>
</para>
<para><ref label="_0131-_1e14-_1e08"><xrefnodename><dotless>i</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent></xrefnodename></ref>
</para>
<para><ref label="_201c-_201d-_2018-_2019-_201e-_201a"><xrefnodename>&ldquo; &rdquo; &lsquo; &rsquo; &bdquo; &sbquo;</xrefnodename></ref>
</para>
<para><ref label="_00ab-_00bb-_00ab-_00bb-_2039-_203a"><xrefnodename>&laquo; &raquo; &guillemotleft; &guillemotright; &lsaquo; &rsaquo;</xrefnodename></ref>
</para>
<para><ref label="_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027"><xrefnodename>`` \'\' --- -- ` \'</xrefnodename></ref>
</para>
<para><ref label="AAA-AAA-BBB"><xrefnodename><acronym><acronymword>AAA</acronymword><acronymdesc> fff</acronymdesc></acronym> <acronym><acronymword>AAA</acronymword></acronym> <acronym><acronymword>BBB</acronymword></acronym></xrefnodename></ref>
</para>
<para><ref label="CCC-CCC-DDD"><xrefnodename><abbr><abbrword>CCC</abbrword><abbrdesc> rrr</abbrdesc></abbr> <abbr><abbrword>CCC</abbrword></abbr> <abbr><abbrword>DDD</abbrword></abbr></xrefnodename></ref>
</para>
<para><ref label="someone_0040somewher-no_005fexplain_0040there"><xrefnodename><email><emailaddress>someone&arobase;somewher</emailaddress><emailname> the someone</emailname></email> <email><emailaddress>no_explain&arobase;there</emailaddress></email></xrefnodename></ref>
</para>
<para><ref label="f_002d_002dile1-f_002d_002dile"><xrefnodename><image where="inline"><imagefile>f--ile1</imagefile></image>  <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image></xrefnodename></ref>
</para>
<para><ref label="-_0040-_007b_007d-_002e-"><xrefnodename><verb delimiter="."> @ {} . </verb></xrefnodename></ref>
</para>
<para><ref label="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i"><xrefnodename><cite>cite <asis>asis</asis></cite> <w>in &arobase;w <b>b</b></w> <r>in r</r> <sc>sc</sc> <strong>str</strong> <t>t</t> <var>var</var> <dfn>dfn</dfn> <i>i</i></xrefnodename></ref>
</para>
<para><ref label="env-code-option-samp-command-file-C_002dx-ESC"><xrefnodename><env>env</env> <code>code</code> <option>option</option> <samp>samp</samp> <command>command</command> <file>file</file> <kbd>C-x <key>ESC</key></kbd></xrefnodename></ref>
</para>
<para><ref label="8_002e27in"><xrefnodename>8.27<dmn>in</dmn></xrefnodename></ref>
</para>
<para><ref label="sansserif-slanted"><xrefnodename><sansserif>sansserif</sansserif> <slanted>slanted</slanted></xrefnodename></ref>
</para>
<para><ref label="indicateurl"><xrefnodename><indicateurl>indicateurl</indicateurl></xrefnodename></ref>
</para>
<para><ref label="gH-3rd"><xrefnodename><sub>g</sub>H 3<sup>rd</sup></xrefnodename></ref>
</para>
<para><ref label="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls"><xrefnodename><url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc> text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></xrefnodename></ref>
</para>
<para><ref label="_2022-_00a9-_2261"><xrefnodename>&bullet; &copyright; &equiv;</xrefnodename></ref>
</para>
<para><ref label="_2265-_2264-_2192-_21a6-_2212"><xrefnodename>&ge; &le; &rarr; &expansion; &minus;</xrefnodename></ref>
</para>
<para><ref label="_22c6-_00a3-_22a3-_00ae-_21d2"><xrefnodename>&point; &pound; &printglyph; &registered; &result;</xrefnodename></ref>
</para>
<para><ref label="_00b0-_00de"><xrefnodename>&deg; &THORN;</xrefnodename></ref>
</para>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>&bullet; &copyright; &equiv;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&ge; &le; &rarr; &expansion; &minus;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&point; &pound; &printglyph; &registered; &result;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>&deg; &THORN;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="_2022-_00a9-_2261"><nodename> &bullet; &copyright; &equiv;</nodename><nodenext automatic="on"> &ge; &le; &rarr; &expansion; &minus;</nodenext><nodeup automatic="on"> <url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc> text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></nodeup></node>
<section><sectiontitle> &bullet; &copyright; &equiv;</sectiontitle>

</section>
<node identifier="_2265-_2264-_2192-_21a6-_2212"><nodename> &ge; &le; &rarr; &expansion; &minus;</nodename><nodenext automatic="on"> &point; &pound; &printglyph; &registered; &result;</nodenext><nodeprev automatic="on"> &bullet; &copyright; &equiv;</nodeprev><nodeup automatic="on"> <url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc> text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></nodeup></node>
<section><sectiontitle> &ge; &le; &rarr; &expansion; &minus;</sectiontitle>

</section>
<node identifier="_22c6-_00a3-_22a3-_00ae-_21d2"><nodename> &point; &pound; &printglyph; &registered; &result;</nodename><nodenext automatic="on"> &deg; &THORN;</nodenext><nodeprev automatic="on"> &ge; &le; &rarr; &expansion; &minus;</nodeprev><nodeup automatic="on"> <url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc> text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></nodeup></node>
<section><sectiontitle> &point; &pound; &printglyph; &registered; &result;</sectiontitle>

</section>
<node identifier="_00b0-_00de"><nodename> &deg; &THORN;</nodename><nodeprev automatic="on"> &point; &pound; &printglyph; &registered; &result;</nodeprev><nodeup automatic="on"> <url><urefurl>http://somewhere_aaa</urefurl></url> <url><urefurl>url</urefurl><urefdesc> text</urefdesc></url> <uref><urefurl>/man.cgi/1/ls</urefurl><urefreplacement>ls</urefreplacement></uref></nodeup></node>
<section><sectiontitle> &deg; &THORN;</sectiontitle>

</section>
</chapter>
';


$result_converted{'docbook'}->{'at_commands_in_refs'} = '<chapter label="1" id="-_007b-_007d">
<title> { }</title>

</chapter>
<chapter label="2" id="-_0021-_002e-_002e-_003f-_0040">
<title>&#160; &#160; ! 
 .  . ? @</title>

</chapter>
<chapter label="3" id="_0040-_007b-_007d-_005c-_0023">
<title>&#64; &#123; &#125; &#92; &#35;</title>

</chapter>
<chapter label="4" id="LaTeX-TeX-_002c-_2026-_002e_002e_002e">
<title>&latex; &tex; &#44; &#8230; ...</title>

</chapter>
<chapter label="5" id="error_002d_002d_003e-_20ac-_00a1">
<title>error&#8594; &#8364; &#161;</title>

</chapter>
<chapter label="6" id="_00aa-_00ba-_00bf">
<title>&#170; &#186; &#191;</title>

</chapter>
<chapter label="7" id="a-b-_00e5">
<title>a&#160;b a sunny day &#229;</title>

</chapter>
<chapter label="8" id="_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe">
<title>&#197; &#230; &#339; &#198; &#338; &#248; &#216; &#223; &#322; &#321; &#208; &#240; &#254;</title>

</chapter>
<chapter label="9" id="_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119">
<title>&#228; &#7869; &#238; &#226; &#224; &#233; &#231; &#275; e&#778; e&#779; &#281;</title>

</chapter>
<chapter label="10" id="_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e">
<title>&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</title>

</chapter>
<chapter label="11" id="_0131-_1e14-_1e08">
<title>&#305; &#274;&#768; &#262;&#807;</title>

</chapter>
<chapter label="12" id="_201c-_201d-_2018-_2019-_201e-_201a">
<title>&#8220; &#8221; &#8216; &#8217; &#8222; &#8218;</title>

</chapter>
<chapter label="13" id="_00ab-_00bb-_00ab-_00bb-_2039-_203a">
<title>&#171; &#187; &#171; &#187; &#8249; &#8250;</title>

</chapter>
<chapter label="14" id="_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027">
<title>&#8220; &#8221; &#8212; &#8211; &#8216; &#8217;</title>

</chapter>
<chapter label="15" id="AAA-AAA-BBB">
<title><acronym>AAA</acronym> (fff) <acronym>AAA</acronym> <acronym>BBB</acronym></title>

</chapter>
<chapter label="16" id="CCC-CCC-DDD">
<title><abbrev>CCC</abbrev> (rrr) <abbrev>CCC</abbrev> <abbrev>DDD</abbrev></title>

</chapter>
<chapter label="17" id="someone_0040somewher-no_005fexplain_0040there">
<title><ulink url="mailto:someone@somewher">the someone</ulink> <email>no_explain@there</email></title>

</chapter>
<chapter label="18" id="f_002d_002dile1-f_002d_002dile">
<title><inlinemediaobject><imageobject><imagedata fileref="f--ile1.jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>  <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject></title>

</chapter>
<chapter label="19" id="-_0040-_007b_007d-_002e-">
<title><literal> @ {} . </literal></title>

</chapter>
<chapter label="20" id="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i">
<title><citetitle>cite asis</citetitle> in&amp;#160;@w&amp;#160;<emphasis role="bold">b</emphasis><!-- /@w --> in r SC <emphasis role="bold">str</emphasis> <literal>t</literal> <replaceable>var</replaceable> <firstterm>dfn</firstterm> <emphasis>i</emphasis></title>

</chapter>
<chapter label="21" id="env-code-option-samp-command-file-C_002dx-ESC">
<title><envar>env</envar> <literal>code</literal> <option>option</option> &#8216;<literal>samp</literal>&#8217; <command>command</command> <filename>file</filename> <userinput>C-x <keycap>ESC</keycap></userinput></title>

</chapter>
<chapter label="22" id="8_002e27in">
<title>8.27in</title>

</chapter>
<chapter label="23" id="sansserif-slanted">
<title>sansserif slanted</title>

</chapter>
<chapter label="24" id="indicateurl">
<title><literal>indicateurl</literal></title>

</chapter>
<chapter label="25" id="gH-3rd">
<title><subscript>g</subscript>H 3<superscript>rd</superscript></title>

</chapter>
<chapter label="26" id="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls">
<title><ulink url="http://somewhere_aaa">http://somewhere_aaa</ulink> <ulink url="url">text</ulink> <ulink url="/man.cgi/1/ls">ls</ulink></title>

<para><link linkend="-_007b-_007d"> { }</link>
</para>
<para><link linkend="-_0021-_002e-_002e-_003f-_0040">&#160; &#160; ! 
 .  . ? @</link>
</para>
<para><link linkend="_0040-_007b-_007d-_005c-_0023">&#64; &#123; &#125; &#92; &#35;</link>
</para>
<para><link linkend="LaTeX-TeX-_002c-_2026-_002e_002e_002e">&latex; &tex; &#44; &#8230; ...</link>
</para>
<para><link linkend="error_002d_002d_003e-_20ac-_00a1">error&#8594; &#8364; &#161;</link>
</para>
<para><link linkend="_00aa-_00ba-_00bf">&#170; &#186; &#191;</link>
</para>
<para><link linkend="a-b-_00e5">a&#160;b a sunny day &#229;</link>
</para>
<para><link linkend="_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe">&#197; &#230; &#339; &#198; &#338; &#248; &#216; &#223; &#322; &#321; &#208; &#240; &#254;</link>
</para>
<para><link linkend="_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119">&#228; &#7869; &#238; &#226; &#224; &#233; &#231; &#275; e&#778; e&#779; &#281;</link>
</para>
<para><link linkend="_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e">&#279; &#277; e&#818; &#7865; &#283; &#567; e&#865;e</link>
</para>
<para><link linkend="_0131-_1e14-_1e08">&#305; &#274;&#768; &#262;&#807;</link>
</para>
<para><link linkend="_201c-_201d-_2018-_2019-_201e-_201a">&#8220; &#8221; &#8216; &#8217; &#8222; &#8218;</link>
</para>
<para><link linkend="_00ab-_00bb-_00ab-_00bb-_2039-_203a">&#171; &#187; &#171; &#187; &#8249; &#8250;</link>
</para>
<para><link linkend="_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027">&#8220; &#8221; &#8212; &#8211; &#8216; &#8217;</link>
</para>
<para><link linkend="AAA-AAA-BBB"><acronym>AAA</acronym> (fff) <acronym>AAA</acronym> <acronym>BBB</acronym></link>
</para>
<para><link linkend="CCC-CCC-DDD"><abbrev>CCC</abbrev> (rrr) <abbrev>CCC</abbrev> <abbrev>DDD</abbrev></link>
</para>
<para><link linkend="someone_0040somewher-no_005fexplain_0040there"><ulink url="mailto:someone@somewher">the someone</ulink> <email>no_explain@there</email></link>
</para>
<para><link linkend="f_002d_002dile1-f_002d_002dile"><inlinemediaobject><imageobject><imagedata fileref="f--ile1.jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>  <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject></link>
</para>
<para><link linkend="-_0040-_007b_007d-_002e-"><literal> @ {} . </literal></link>
</para>
<para><link linkend="cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i"><citetitle>cite asis</citetitle> in&amp;#160;@w&amp;#160;<emphasis role="bold">b</emphasis><!-- /@w --> in r SC <emphasis role="bold">str</emphasis> <literal>t</literal> <replaceable>var</replaceable> <firstterm>dfn</firstterm> <emphasis>i</emphasis></link>
</para>
<para><link linkend="env-code-option-samp-command-file-C_002dx-ESC"><envar>env</envar> <literal>code</literal> <option>option</option> &#8216;<literal>samp</literal>&#8217; <command>command</command> <filename>file</filename> <userinput>C-x <keycap>ESC</keycap></userinput></link>
</para>
<para><link linkend="8_002e27in">8.27in</link>
</para>
<para><link linkend="sansserif-slanted">sansserif slanted</link>
</para>
<para><link linkend="indicateurl"><literal>indicateurl</literal></link>
</para>
<para><link linkend="gH-3rd"><subscript>g</subscript>H 3<superscript>rd</superscript></link>
</para>
<para><link linkend="http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls"><ulink url="http://somewhere_aaa">http://somewhere_aaa</ulink> <ulink url="url">text</ulink> <ulink url="/man.cgi/1/ls">ls</ulink></link>
</para>
<para><link linkend="_2022-_00a9-_2261">&#8226; &#169; &#8801;</link>
</para>
<para><link linkend="_2265-_2264-_2192-_21a6-_2212">&#8805; &#8804; &#8594; &#8614; &#8722;</link>
</para>
<para><link linkend="_22c6-_00a3-_22a3-_00ae-_21d2">&#8902; &#163; &#8867; &#174; &#8658;</link>
</para>
<para><link linkend="_00b0-_00de">&#176; &#222;</link>
</para>


<sect1 label="26.1" id="_2022-_00a9-_2261">
<title>&#8226; &#169; &#8801;</title>

</sect1>
<sect1 label="26.2" id="_2265-_2264-_2192-_21a6-_2212">
<title>&#8805; &#8804; &#8594; &#8614; &#8722;</title>

</sect1>
<sect1 label="26.3" id="_22c6-_00a3-_22a3-_00ae-_21d2">
<title>&#8902; &#163; &#8867; &#174; &#8658;</title>

</sect1>
<sect1 label="26.4" id="_00b0-_00de">
<title>&#176; &#222;</title>

</sect1>
</chapter>
';

$result_converted_errors{'docbook'}->{'at_commands_in_refs'} = '* W l88|@image file `f--ile1\' not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' not found, using `f--ile1.jpg\'

* W l154|@image file `f--ile1\' not found, using `f--ile1.jpg\'
 warning: @image file `f--ile1\' not found, using `f--ile1.jpg\'

';


$result_converted{'latex_text'}->{'at_commands_in_refs'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{\\-{} \\{ \\}}}
\\label{anchor:-_007b-_007d}%

\\Texinfochapter{{\\ {} \\ {} \\@! \\texorpdfstring{\\ifinner\\unskip\\space\\ignorespaces\\else\\leavevmode{}\\\\\\fi}{ } \\@. \\@ .\\@ \\@? @}}
\\label{anchor:-_0021-_002e-_002e-_003f-_0040}%

\\Texinfochapter{{@ \\{ \\} \\textbackslash{} \\#}}
\\label{anchor:_0040-_007b-_007d-_005c-_0023}%

\\Texinfochapter{{\\LaTeX{} \\TeX{} , \\dots{}\\@ \\dots{}}}
\\label{anchor:LaTeX-TeX-_002c-_2026-_002e_002e_002e}%

\\Texinfochapter{{\\texorpdfstring{\\fbox{error}}{error} \\texorpdfstring{\\euro{}}{€} \\textexclamdown{}}}
\\label{anchor:error_002d_002d_003e-_20ac-_00a1}%

\\Texinfochapter{{\\textordfeminine{} \\textordmasculine{} \\textquestiondown{}}}
\\label{anchor:_00aa-_00ba-_00bf}%

\\Texinfochapter{{a~b \\today{} \\aa{}}}
\\label{anchor:a-b-_00e5}%

\\Texinfochapter{{\\AA{} \\ae{} \\oe{} \\AE{} \\OE{} \\o{} \\O{} \\ss{} \\l{} \\L{} \\DH{} \\dh{} \\th{}}}
\\label{anchor:_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe}%

\\Texinfochapter{{\\"{a} \\~{e} \\^{\\i{}} \\^{a} \\`{a} \\\'{e} \\c{c} \\={e} \\r{e} \\H{e} \\k{e}}}
\\label{anchor:_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}%

\\Texinfochapter{{\\.{e} \\u{e} \\b{e} \\d{e} \\v{e} \\j{} \\t{ee}}}
\\label{anchor:_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}%

\\Texinfochapter{{\\i{} \\`{\\={E}} \\c{\\\'{C}}}}
\\label{anchor:_0131-_1e14-_1e08}%

\\Texinfochapter{{\\textquotedblleft{} \\textquotedblright{} \\textquoteleft{} \\textquoteright{} \\quotedblbase{} \\quotesinglbase{}}}
\\label{anchor:_201c-_201d-_2018-_2019-_201e-_201a}%

\\Texinfochapter{{\\guillemotleft{} \\guillemotright{} \\guillemotleft{} \\guillemotright{} \\guilsinglleft{} \\guilsinglright{}}}
\\label{anchor:_00ab-_00bb-_00ab-_00bb-_2039-_203a}%

\\Texinfochapter{{`` \'\' --- -- ` \'}}
\\label{anchor:_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}%

\\Texinfochapter{{AAA (fff) AAA BBB}}
\\label{anchor:AAA-AAA-BBB}%

\\Texinfochapter{{CCC (rrr) CCC DDD}}
\\label{anchor:CCC-CCC-DDD}%

\\Texinfochapter{{\\href{mailto:someone@somewher}{the someone} \\href{mailto:no_explain@there}{\\nolinkurl{no_explain@there}}}}
\\label{anchor:someone_0040somewher-no_005fexplain_0040there}%

\\Texinfochapter{{\\includegraphics{f--ile1}  \\includegraphics[width=aze,height=az,alt={alt}]{f--ile}}}
\\label{anchor:f_002d_002dile1-f_002d_002dile}%

\\Texinfochapter{{\\verb| @ {} . |}}
\\label{anchor:-_0040-_007b_007d-_002e-}%

\\Texinfochapter{{\\Texinfocommandstyletextcite{cite asis} \\hbox{in @w \\textbf{b}} \\textnormal{in r} \\textsc{sc} \\textbf{str} \\texttt{t} \\Texinfocommandstyletextvar{var} \\textsl{dfn} \\textit{i}}}
\\label{anchor:cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}%

\\Texinfochapter{{\\texttt{env} \\texttt{code} \\texttt{option} `\\texttt{samp}\' \\texttt{command} \\texttt{file} \\Texinfocommandstyletextkbd{C-x \\texttt{ESC}}}}
\\label{anchor:env-code-option-samp-command-file-C_002dx-ESC}%

\\Texinfochapter{{8.27\\thinspace in}}
\\label{anchor:8_002e27in}%

\\Texinfochapter{{\\textsf{sansserif} \\textsl{slanted}}}
\\label{anchor:sansserif-slanted}%

\\Texinfochapter{{`\\texttt{indicateurl}\'}}
\\label{anchor:indicateurl}%

\\Texinfochapter{{\\textsubscript{g}H 3\\textsuperscript{rd}}}
\\label{anchor:gH-3rd}%

\\Texinfochapter{{\\url{http://somewhere_aaa} \\href{url}{text (\\nolinkurl{url})} ls}}
\\label{anchor:http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}%

\\hyperref[anchor:-_007b-_007d]{\\chaptername~\\ref*{anchor:-_007b-_007d} [\\-{} \\{ \\}], page~\\pageref*{anchor:-_007b-_007d}}

\\hyperref[anchor:-_0021-_002e-_002e-_003f-_0040]{\\chaptername~\\ref*{anchor:-_0021-_002e-_002e-_003f-_0040} [\\ {} \\ {} \\@! \\leavevmode{}\\\\ \\@. \\@ .\\@ \\@? @], page~\\pageref*{anchor:-_0021-_002e-_002e-_003f-_0040}}

\\hyperref[anchor:_0040-_007b-_007d-_005c-_0023]{\\chaptername~\\ref*{anchor:_0040-_007b-_007d-_005c-_0023} [@ \\{ \\} \\textbackslash{} \\#], page~\\pageref*{anchor:_0040-_007b-_007d-_005c-_0023}}

\\hyperref[anchor:LaTeX-TeX-_002c-_2026-_002e_002e_002e]{\\chaptername~\\ref*{anchor:LaTeX-TeX-_002c-_2026-_002e_002e_002e} [\\LaTeX{} \\TeX{} , \\dots{}\\@ \\dots{}], page~\\pageref*{anchor:LaTeX-TeX-_002c-_2026-_002e_002e_002e}}

\\hyperref[anchor:error_002d_002d_003e-_20ac-_00a1]{\\chaptername~\\ref*{anchor:error_002d_002d_003e-_20ac-_00a1} [\\fbox{error} \\euro{} \\textexclamdown{}], page~\\pageref*{anchor:error_002d_002d_003e-_20ac-_00a1}}

\\hyperref[anchor:_00aa-_00ba-_00bf]{\\chaptername~\\ref*{anchor:_00aa-_00ba-_00bf} [\\textordfeminine{} \\textordmasculine{} \\textquestiondown{}], page~\\pageref*{anchor:_00aa-_00ba-_00bf}}

\\hyperref[anchor:a-b-_00e5]{\\chaptername~\\ref*{anchor:a-b-_00e5} [a~b \\today{} \\aa{}], page~\\pageref*{anchor:a-b-_00e5}}

\\hyperref[anchor:_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe]{\\chaptername~\\ref*{anchor:_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe} [\\AA{} \\ae{} \\oe{} \\AE{} \\OE{} \\o{} \\O{} \\ss{} \\l{} \\L{} \\DH{} \\dh{} \\th{}], page~\\pageref*{anchor:_00c5-_00e6-_0153-_00c6-_0152-_00f8-_00d8-_00df-_0142-_0141-_00d0-_00f0-_00fe}}

\\hyperref[anchor:_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119]{\\chaptername~\\ref*{anchor:_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119} [\\"{a} \\~{e} \\^{\\i{}} \\^{a} \\`{a} \\\'{e} \\c{c} \\={e} \\r{e} \\H{e} \\k{e}], page~\\pageref*{anchor:_00e4-_1ebd-_00ee-_00e2-_00e0-_00e9-_00e7-_0113-e_030a-e_030b-_0119}}

\\hyperref[anchor:_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e]{\\chaptername~\\ref*{anchor:_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e} [\\.{e} \\u{e} \\b{e} \\d{e} \\v{e} \\j{} \\t{ee}], page~\\pageref*{anchor:_0117-_0115-e_0332-_1eb9-_011b-_0237-e_0361e}}

\\hyperref[anchor:_0131-_1e14-_1e08]{\\chaptername~\\ref*{anchor:_0131-_1e14-_1e08} [\\i{} \\`{\\={E}} \\c{\\\'{C}}], page~\\pageref*{anchor:_0131-_1e14-_1e08}}

\\hyperref[anchor:_201c-_201d-_2018-_2019-_201e-_201a]{\\chaptername~\\ref*{anchor:_201c-_201d-_2018-_2019-_201e-_201a} [\\textquotedblleft{} \\textquotedblright{} \\textquoteleft{} \\textquoteright{} \\quotedblbase{} \\quotesinglbase{}], page~\\pageref*{anchor:_201c-_201d-_2018-_2019-_201e-_201a}}

\\hyperref[anchor:_00ab-_00bb-_00ab-_00bb-_2039-_203a]{\\chaptername~\\ref*{anchor:_00ab-_00bb-_00ab-_00bb-_2039-_203a} [\\guillemotleft{} \\guillemotright{} \\guillemotleft{} \\guillemotright{} \\guilsinglleft{} \\guilsinglright{}], page~\\pageref*{anchor:_00ab-_00bb-_00ab-_00bb-_2039-_203a}}

\\hyperref[anchor:_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027]{\\chaptername~\\ref*{anchor:_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027} [`` \'\' --- -- ` \'], page~\\pageref*{anchor:_0060_0060-_0027_0027-_002d_002d_002d-_002d_002d-_0060-_0027}}

\\hyperref[anchor:AAA-AAA-BBB]{\\chaptername~\\ref*{anchor:AAA-AAA-BBB} [AAA (fff) AAA BBB], page~\\pageref*{anchor:AAA-AAA-BBB}}

\\hyperref[anchor:CCC-CCC-DDD]{\\chaptername~\\ref*{anchor:CCC-CCC-DDD} [CCC (rrr) CCC DDD], page~\\pageref*{anchor:CCC-CCC-DDD}}

\\hyperref[anchor:someone_0040somewher-no_005fexplain_0040there]{\\chaptername~\\ref*{anchor:someone_0040somewher-no_005fexplain_0040there} [\\href{mailto:someone@somewher}{the someone} \\href{mailto:no_explain@there}{\\nolinkurl{no_explain@there}}], page~\\pageref*{anchor:someone_0040somewher-no_005fexplain_0040there}}

\\hyperref[anchor:f_002d_002dile1-f_002d_002dile]{\\chaptername~\\ref*{anchor:f_002d_002dile1-f_002d_002dile} [\\includegraphics{f--ile1}  \\includegraphics[width=aze,height=az,alt={alt}]{f--ile}], page~\\pageref*{anchor:f_002d_002dile1-f_002d_002dile}}

\\hyperref[anchor:-_0040-_007b_007d-_002e-]{\\chaptername~\\ref*{anchor:-_0040-_007b_007d-_002e-} [\\verb| @ {} . |], page~\\pageref*{anchor:-_0040-_007b_007d-_002e-}}

\\hyperref[anchor:cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i]{\\chaptername~\\ref*{anchor:cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i} [\\Texinfocommandstyletextcite{cite asis} \\hbox{in @w \\textbf{b}} \\textnormal{in r} \\textsc{sc} \\textbf{str} \\texttt{t} \\Texinfocommandstyletextvar{var} \\textsl{dfn} \\textit{i}], page~\\pageref*{anchor:cite-asis-in-_0040w-b-in-r-sc-str-t-var-dfn-i}}

\\hyperref[anchor:env-code-option-samp-command-file-C_002dx-ESC]{\\chaptername~\\ref*{anchor:env-code-option-samp-command-file-C_002dx-ESC} [\\texttt{env} \\texttt{code} \\texttt{option} `\\texttt{samp}\' \\texttt{command} \\texttt{file} \\Texinfocommandstyletextkbd{C-x \\texttt{ESC}}], page~\\pageref*{anchor:env-code-option-samp-command-file-C_002dx-ESC}}

\\hyperref[anchor:8_002e27in]{\\chaptername~\\ref*{anchor:8_002e27in} [8.27\\thinspace in], page~\\pageref*{anchor:8_002e27in}}

\\hyperref[anchor:sansserif-slanted]{\\chaptername~\\ref*{anchor:sansserif-slanted} [\\textsf{sansserif} \\textsl{slanted}], page~\\pageref*{anchor:sansserif-slanted}}

\\hyperref[anchor:indicateurl]{\\chaptername~\\ref*{anchor:indicateurl} [`\\texttt{indicateurl}\'], page~\\pageref*{anchor:indicateurl}}

\\hyperref[anchor:gH-3rd]{\\chaptername~\\ref*{anchor:gH-3rd} [\\textsubscript{g}H 3\\textsuperscript{rd}], page~\\pageref*{anchor:gH-3rd}}

\\hyperref[anchor:http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls]{\\chaptername~\\ref*{anchor:http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls} [\\url{http://somewhere_aaa} \\href{url}{text (\\nolinkurl{url})} ls], page~\\pageref*{anchor:http_003a_002f_002fsomewhere_005faaa-url-_002fman_002ecgi_002f1_002fls}}

\\hyperref[anchor:_2022-_00a9-_2261]{Section~\\ref*{anchor:_2022-_00a9-_2261} [\\textbullet{} \\copyright{} $\\equiv{}$], page~\\pageref*{anchor:_2022-_00a9-_2261}}

\\hyperref[anchor:_2265-_2264-_2192-_21a6-_2212]{Section~\\ref*{anchor:_2265-_2264-_2192-_21a6-_2212} [$\\geq{}$ $\\leq{}$ $\\rightarrow{}$ $\\mapsto{}$ -], page~\\pageref*{anchor:_2265-_2264-_2192-_21a6-_2212}}

\\hyperref[anchor:_22c6-_00a3-_22a3-_00ae-_21d2]{Section~\\ref*{anchor:_22c6-_00a3-_22a3-_00ae-_21d2} [$\\star{}$ \\textsterling{} $\\dashv{}$ \\circledR{} $\\Rightarrow{}$], page~\\pageref*{anchor:_22c6-_00a3-_22a3-_00ae-_21d2}}

\\hyperref[anchor:_00b0-_00de]{Section~\\ref*{anchor:_00b0-_00de} [\\textdegree{} \\TH{}], page~\\pageref*{anchor:_00b0-_00de}}



\\section{{\\textbullet{} \\copyright{} \\texorpdfstring{$\\equiv{}$}{≡}}}
\\label{anchor:_2022-_00a9-_2261}%

\\section{{\\texorpdfstring{$\\geq{}$}{≥} \\texorpdfstring{$\\leq{}$}{≤} \\texorpdfstring{$\\rightarrow{}$}{→} \\texorpdfstring{$\\mapsto{}$}{↦} -}}
\\label{anchor:_2265-_2264-_2192-_21a6-_2212}%

\\section{{\\texorpdfstring{$\\star{}$}{⋆} \\textsterling{} \\texorpdfstring{$\\dashv{}$}{⊣} \\circledR{} \\texorpdfstring{$\\Rightarrow{}$}{⇒}}}
\\label{anchor:_22c6-_00a3-_22a3-_00ae-_21d2}%

\\section{{\\textdegree{} \\TH{}}}
\\label{anchor:_00b0-_00de}%

';

$result_converted_errors{'latex_text'}->{'at_commands_in_refs'} = '* W l88|@image file `f--ile1\' (for LaTeX) not found
 warning: @image file `f--ile1\' (for LaTeX) not found

* W l86|@image file `f--ile1\' (for LaTeX) not found
 warning: @image file `f--ile1\' (for LaTeX) not found

';


$result_converted{'info'}->{'at_commands_in_refs'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: { },  Up: (dir)

Top
***

* Menu:

*  { }::
*     !   .  . ? @::
* @ { } \\ #::
* LaTeX TeX , ... ...::
* error→ € ¡::
* ª º ¿::
* a b a sunny day å::
* Å æ œ Æ Œ ø Ø ß ł Ł Ð ð þ::
* ä ẽ î â à é ç ē e̊ e̋ ę::
* ė ĕ e̲ ẹ ě ȷ e͡e::
* ı Ḕ Ḉ::
* “ ” ‘ ’ „ ‚::
* « » « » ‹ ›::
* `` \'\' --- -- ` \'::
* AAA (fff) AAA BBB::
* CCC (rrr) CCC DDD::
* the someone <someone@somewher> <no_explain@there>::
* [f--ile1]   [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]::
*  @ {} . ::
* cite asis in @w b in r SC *str* t VAR dfn i::
* env code option samp command file C-x <ESC>::
* 8.27in::
* sansserif slanted::
* indicateurl::
* _{g}H 3^{rd}::
* <http://somewhere_aaa> text (url) ls::


File: ,  Node: { },  Next:     ! . . ? @,  Prev: Top,  Up: Top

1 { }
*****


File: ,  Node:     ! . . ? @,  Next: @ { } \\ #,  Prev: { },  Up: Top

2     !
. . ? @
*******


File: ,  Node: @ { } \\ #,  Next: LaTeX TeX , ... ...,  Prev:     ! . . ? @,  Up: Top

3 @ { } \\ #
***********


File: ,  Node: LaTeX TeX , ... ...,  Next: error→ € ¡,  Prev: @ { } \\ #,  Up: Top

4 LaTeX TeX , ... ...
*********************


File: ,  Node: error→ € ¡,  Next: ª º ¿,  Prev: LaTeX TeX , ... ...,  Up: Top

5 error→ € ¡
************


File: ,  Node: ª º ¿,  Next: a b a sunny day å,  Prev: error→ € ¡,  Up: Top

6 ª º ¿
*******


File: ,  Node: a b a sunny day å,  Next: Å æ œ Æ Œ ø Ø ß ł Ł Ð ð þ,  Prev: ª º ¿,  Up: Top

7 a b a sunny day å
*******************


File: ,  Node: Å æ œ Æ Œ ø Ø ß ł Ł Ð ð þ,  Next: ä ẽ î â à é ç ē e̊ e̋ ę,  Prev: a b a sunny day å,  Up: Top

8 Å æ œ Æ Œ ø Ø ß ł Ł Ð ð þ
***************************


File: ,  Node: ä ẽ î â à é ç ē e̊ e̋ ę,  Next: ė ĕ e̲ ẹ ě ȷ e͡e,  Prev: Å æ œ Æ Œ ø Ø ß ł Ł Ð ð þ,  Up: Top

9 ä ẽ î â à é ç ē e̊ e̋ ę
***********************


File: ,  Node: ė ĕ e̲ ẹ ě ȷ e͡e,  Next: ı Ḕ Ḉ,  Prev: ä ẽ î â à é ç ē e̊ e̋ ę,  Up: Top

10 ė ĕ e̲ ẹ ě ȷ e͡e
*****************


File: ,  Node: ı Ḕ Ḉ,  Next: “ ” ‘ ’ „ ‚,  Prev: ė ĕ e̲ ẹ ě ȷ e͡e,  Up: Top

11 ı Ḕ Ḉ
********


File: ,  Node: “ ” ‘ ’ „ ‚,  Next: « » « » ‹ ›,  Prev: ı Ḕ Ḉ,  Up: Top

12 “ ” ‘ ’ „ ‚
**************


File: ,  Node: « » « » ‹ ›,  Next: `` \'\' --- -- ` \',  Prev: “ ” ‘ ’ „ ‚,  Up: Top

13 « » « » ‹ ›
**************


File: ,  Node: `` \'\' --- -- ` \',  Next: AAA (fff) AAA BBB,  Prev: « » « » ‹ ›,  Up: Top

14 " " -- - \' \'
***************


File: ,  Node: AAA (fff) AAA BBB,  Next: CCC (rrr) CCC DDD,  Prev: `` \'\' --- -- ` \',  Up: Top

15 AAA (fff) AAA BBB
********************


File: ,  Node: CCC (rrr) CCC DDD,  Next: the someone <someone@somewher> <no_explain@there>,  Prev: AAA (fff) AAA BBB,  Up: Top

16 CCC (rrr) CCC DDD
********************


File: ,  Node: the someone <someone@somewher> <no_explain@there>,  Next: [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ],  Prev: CCC (rrr) CCC DDD,  Up: Top

17 the someone <someone@somewher> <no_explain@there>
****************************************************


File: ,  Node: [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ],  Next:  @ {} . ,  Prev: the someone <someone@somewher> <no_explain@there>,  Up: Top

18 [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]
**********


File: ,  Node:  @ {} . ,  Next: cite asis in @w b in r SC *str* t VAR dfn i,  Prev: [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ],  Up: Top

19  @ {} . 
***********


File: ,  Node: cite asis in @w b in r SC *str* t VAR dfn i,  Next: env code option samp command file C-x <ESC>,  Prev:  @ {} . ,  Up: Top

20 ‘cite asis’ in @w b in r SC *str* t VAR “dfn” i
**************************************************


File: ,  Node: env code option samp command file C-x <ESC>,  Next: 8.27in,  Prev: cite asis in @w b in r SC *str* t VAR dfn i,  Up: Top

21 ‘env’ ‘code’ ‘option’ ‘samp’ ‘command’ ‘file’ ‘C-x <ESC>’
************************************************************


File: ,  Node: 8.27in,  Next: sansserif slanted,  Prev: env code option samp command file C-x <ESC>,  Up: Top

22 8.27in
*********


File: ,  Node: sansserif slanted,  Next: indicateurl,  Prev: 8.27in,  Up: Top

23 sansserif slanted
********************


File: ,  Node: indicateurl,  Next: _{g}H 3^{rd},  Prev: sansserif slanted,  Up: Top

24 ‘indicateurl’
****************


File: ,  Node: _{g}H 3^{rd},  Next: <http://somewhere_aaa> text (url) ls,  Prev: indicateurl,  Up: Top

25 _{g}H 3^{rd}
***************


File: ,  Node: <http://somewhere_aaa> text (url) ls,  Prev: _{g}H 3^{rd},  Up: Top

26 <http://somewhere_aaa> text (url) ls
***************************************

*note { }::

   *note     !
. . ? @::

   *note @ { } \\ #::

   *note LaTeX TeX , ... ...::

   *note error→ € ¡::

   *note ª º ¿::

   *note a b a sunny day å::

   *note Å æ œ Æ Œ ø Ø ß ł Ł Ð ð þ::

   *note ä ẽ î â à é ç ē e̊ e̋ ę::

   *note ė ĕ e̲ ẹ ě ȷ e͡e::

   *note ı Ḕ Ḉ::

   *note “ ” ‘ ’ „ ‚::

   *note « » « » ‹ ›::

   *note `` \'\' --- -- ` \'::

   *note AAA (fff) AAA BBB::

   *note CCC (rrr) CCC DDD::

   *note the someone <someone@somewher> <no_explain@there>::

   *note [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]::

   *note  @ {} . ::

   *note cite asis in @w b in r SC *str* t VAR dfn i::

   *note env code option samp command file C-x <ESC>::

   *note 8.27in::

   *note sansserif slanted::

   *note indicateurl::

   *note _{g}H 3^{rd}::

   *note <http://somewhere_aaa> text (url) ls::

   *note • © ≡::

   *note ≥ ≤ → ↦ −::

   *note ⋆ £ ⊣ ® ⇒::

   *note ° Þ::

* Menu:

* • © ≡::
* ≥ ≤ → ↦ −::
* ⋆ £ ⊣ ® ⇒::
* ° Þ::


File: ,  Node: • © ≡,  Next: ≥ ≤ → ↦ −,  Up: <http://somewhere_aaa> text (url) ls

26.1 • © ≡
==========


File: ,  Node: ≥ ≤ → ↦ −,  Next: ⋆ £ ⊣ ® ⇒,  Prev: • © ≡,  Up: <http://somewhere_aaa> text (url) ls

26.2 ≥ ≤ → ↦ −
==============


File: ,  Node: ⋆ £ ⊣ ® ⇒,  Next: ° Þ,  Prev: ≥ ≤ → ↦ −,  Up: <http://somewhere_aaa> text (url) ls

26.3 ⋆ £ ⊣ ® ⇒
==============


File: ,  Node: ° Þ,  Prev: ⋆ £ ⊣ ® ⇒,  Up: <http://somewhere_aaa> text (url) ls

26.4 ° Þ
========


Tag Table:
Node: Top27
Node: { }818
Node:     ! . . ? @897
Node: @ { } \\ #994
Node: LaTeX TeX , ... ...1109
Node: error→ € ¡1246
Node: ª º ¿1369
Node: a b a sunny day å1477
Node: Å æ œ Æ Œ ø Ø ß ł Ł Ð ð þ1630
Node: ä ẽ î â à é ç ē e̊ e̋ ę1838
Node: ė ĕ e̲ ẹ ě ȷ e͡e2045
Node: ı Ḕ Ḉ2208
Node: “ ” ‘ ’ „ ‚2336
Node: « » « » ‹ ›2478
Node: `` \'\' --- -- ` \'2622
Node: AAA (fff) AAA BBB2754
Node: CCC (rrr) CCC DDD2894
Node: the someone <someone@somewher> <no_explain@there>3067
Node: [f--ile1]  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]3367
Node:  @ {} . 3647
Node: cite asis in @w b in r SC *str* t VAR dfn i3850
Node: env code option samp command file C-x <ESC>4102
Node: 8.27in4392
Node: sansserif slanted4526
Node: indicateurl4650
Node: _{g}H 3^{rd}4776
Node: <http://somewhere_aaa> text (url) ls4915
Node: • © ≡6192
Node: ≥ ≤ → ↦ −6320
Node: ⋆ £ ⊣ ® ⇒6487
Node: ° Þ6647

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'at_commands_in_refs'} = '* W l86|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l22|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l30|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

* W l42|node name should not contain `,\': LaTeX TeX , ... ...
 warning: node name should not contain `,\': LaTeX TeX , ... ...

* W l88|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l86|could not find @image file `f--ile1.txt\' nor alternate text
 warning: could not find @image file `f--ile1.txt\' nor alternate text

* W l171|@ref node name should not contain `:\'
 warning: @ref node name should not contain `:\'

';

1;
