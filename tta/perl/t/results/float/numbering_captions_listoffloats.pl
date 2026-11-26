use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'numbering_captions_listoffloats'} = '*document_root C21
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C22 l2 {Test floats}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Test floats}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C7 l4
  |float_number:{1}
  |float_type:{Text}
  |global_command_number:{1}
  |identifier:{text-with-a-lot-of-features}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:text with a lot of features}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l6
    *brace_command_context C2
     {spaces_before_argument: }
     *paragraph C2
      {normal_text:An example of float caption}
      *normal_command@enddots C1 l6
       *brace_container
   {spaces_after_close_brace:\\n}
   *normal_command@shortcaption C1 l7
    *brace_command_context C1
     *paragraph C2
      *normal_command@TeX C1 l7
       *brace_container
      {normal_text: and someething}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l8
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C8 l10
  |float_type:{Text}
  |global_command_number:{2}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Text}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:No label but caption and shortcaption.\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l13
    *brace_command_context C1
     *paragraph C1
      {normal_text:C No label}
   {spaces_after_close_brace:\\n}
   *normal_command@shortcaption C1 l14
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC No label}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l15
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C8 l17
  |float_number:{1}
  |float_type:{}
  |global_command_number:{3}
  |identifier:{label-but-no-type}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C2
     {normal_text:label but no type}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:No type but caption and shortcaption.\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l20
    *brace_command_context C1
     *paragraph C1
      {normal_text:C No type}
   {spaces_after_close_brace:\\n}
   *normal_command@shortcaption C1 l21
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC No type}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l22
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *normal_command@float C4 l25
  |float_number:{2}
  |float_type:{}
  |global_command_number:{4}
  |identifier:{label-but-no-type-and-no-caption}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C2
     {normal_text:label but no type and no caption}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:No type but label and no caption nor shortcaption.\\n}
   {empty_line:\\n}
   *normal_command@end C1 l28
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *normal_command@float C4 l31
  |float_type:{}
  |global_command_number:{5}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:No label, no type, no caption no shortcaption.\\n}
   {empty_line:\\n}
   *normal_command@end C1 l34
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C7 l36
  |float_type:{}
  |global_command_number:{6}
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:No label, no type, but caption and shortcaption.\\n}
   *normal_command@caption C1 l38
    *brace_command_context C1
     *paragraph C1
      {normal_text:C No label, no type, but caption and shortcaption.}
   {spaces_after_close_brace:\\n}
   *normal_command@shortcaption C1 l39
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC No label, no type, but caption and shortcaption.}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l40
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C8 l42
  |float_number:{3}
  |float_type:{}
  |global_command_number:{7}
  |identifier:{label-but-no-type-2}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C2
     {normal_text:label but no type 2}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Second float with no type.\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l45
    *brace_command_context C1
     *paragraph C1
      {normal_text:C No type 2}
   {spaces_after_close_brace:\\n}
   *normal_command@shortcaption C1 l46
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC No type 2}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l47
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C8 l49
  |float_number:{1}
  |float_type:{Warning}
  |global_command_number:{8}
  |identifier:{warning-in-top}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Warning}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:warning in top}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:A warning\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l52
    *brace_command_context C1
     *paragraph C1
      {normal_text:C A warning}
   {spaces_after_close_brace:\\n}
   *normal_command@shortcaption C1 l53
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC A warning}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l54
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C7 l56
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l57
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l58
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Unnumbered}
     {normal_text:Unnumbered}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l59
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Chapter-with-unnumbsubsec}
     {normal_text:Chapter with unnumbsubsec}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l60
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Appendix-for-float}
     {normal_text:Appendix for float}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l61
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{list-of-floats}
     {normal_text:list of floats}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l62
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l64 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C14 l65 {A chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C6 l67
  |float_number:{1.1}
  |float_type:{Text}
  |global_command_number:{9}
  |identifier:{text-in-chapter}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:text in chapter}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Text in chapter\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l70
    *brace_command_context C1
     *paragraph C1
      {normal_text:C Text in chapter}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l71
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C4 l73
  |float_number:{1.2}
  |float_type:{Text}
  |global_command_number:{10}
  |identifier:{float-with-a-lot-of-features-and-no-shortcaption}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:float with a lot of features and no shortcaption}
     {spaces_after_argument:\\n}
   *normal_command@caption C1 l74
    *brace_command_context C2
     {spaces_before_argument: }
     *paragraph C2
      {normal_text:An example of float caption, no shortcaption}
      *normal_command@enddots C1 l74
       *brace_container
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l75
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C6 l77
  |float_number:{1.1}
  |float_type:{théorème}
  |global_command_number:{11}
  |identifier:{theoreme}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C6
     {spaces_before_argument: }
     {normal_text:th}
     *normal_command@\' C1 l77
      *following_arg C1
       {normal_text:e}
     {normal_text:or}
     *normal_command@` C1 l77
      *following_arg C1
       {normal_text:e}
     {normal_text:me}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:theoreme}
     {spaces_after_argument:\\n}
   *paragraph C5
    {normal_text:A th}
    *normal_command@\' C1 l78
     *following_arg C1
      {normal_text:e}
    {normal_text:or}
    *normal_command@` C1 l78
     *following_arg C1
      {normal_text:e}
    {normal_text:me\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l80
    *brace_command_context C1
     *paragraph C5
      {normal_text:C A th}
      *normal_command@\' C1 l80
       *following_arg C1
        {normal_text:e}
      {normal_text:or}
      *normal_command@` C1 l80
       *following_arg C1
        {normal_text:e}
      {normal_text:me}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l81
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C8 l83
  |float_number:{1.1}
  |float_type:{}
  |global_command_number:{12}
  |identifier:{label-but-no-type-in-chapter}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C2
     {normal_text:label but no type in chapter}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:float with no type.\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l86
    *brace_command_context C1
     *paragraph C1
      {normal_text:C No type in chapter}
   {spaces_after_close_brace:\\n}
   *normal_command@shortcaption C1 l87
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC No type in chapter}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l88
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C8 l90
  |float_number:{1.1}
  |float_type:{Warning}
  |global_command_number:{13}
  |identifier:{warning-in-chapter}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Warning}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:warning in chapter}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:A warning\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l93
    *brace_command_context C1
     *paragraph C1
      {normal_text:C A warning in chapter}
   {spaces_after_close_brace:\\n}
   *normal_command@shortcaption C1 l94
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC A warning in chapter}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l95
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l97
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l98
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{section}
     {normal_text:section}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l99
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l101 {section}
 |identifier:{section}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
 *normal_command@section C4 l102 {A section}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C5 l104
  |float_number:{1.3}
  |float_type:{Text}
  |global_command_number:{14}
  |identifier:{text-in-section}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:text in section}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:A text in float no caption a label a type.\\n}
   {empty_line:\\n}
   *normal_command@end C1 l108
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l110 {Unnumbered}
 |identifier:{Unnumbered}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Unnumbered}
    {spaces_after_argument:\\n}
 *normal_command@unnumbered C7 l111 {Unnumbered}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Unnumbered}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l113
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l114
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Section-within-unnumbered}
     {normal_text:Section within unnumbered}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l115
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  *normal_command@float C7 l116
  |float_number:{5}
  |float_type:{Text}
  |global_command_number:{15}
  |identifier:{unnumbered-float}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:unnumbered float}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:unnum\\n}
   *normal_command@shortcaption C1 l118
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC unnumbered float}
   {spaces_after_close_brace:\\n}
   *normal_command@caption C1 l119
    *brace_command_context C1
     *paragraph C1
      {normal_text:C unnumbered float}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l120
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  *normal_command@float C8 l121
  |float_number:{5}
  |float_type:{}
  |global_command_number:{16}
  |identifier:{label-but-no-type-in-unnumbered}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C2
     {normal_text:label but no type in unnumbered}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:float with no type.\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l124
    *brace_command_context C1
     *paragraph C1
      {normal_text:C No type in unnumbered}
   {spaces_after_close_brace:\\n}
   *normal_command@shortcaption C1 l125
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC No type in unnumbered}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l126
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l129 {Section within unnumbered}
 |identifier:{Section-within-unnumbered}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section within unnumbered}
    {spaces_after_argument:\\n}
 *normal_command@section C5 l130 {Section within unnumbered}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Section within unnumbered}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *normal_command@float C7 l133
  |float_number:{6}
  |float_type:{Text}
  |global_command_number:{17}
  |identifier:{Section-within-unnumbered-float}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Section within unnumbered float}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Section within unnumbered\\n}
   *normal_command@shortcaption C1 l135
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC Section within unnumbered}
   {spaces_after_close_brace:\\n}
   *normal_command@caption C1 l136
    *brace_command_context C1
     *paragraph C1
      {normal_text:C Section within unnumbered}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l137
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l139 {Chapter with unnumbsubsec}
 |identifier:{Chapter-with-unnumbsubsec}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter with unnumbsubsec}
    {spaces_after_argument:\\n}
 *normal_command@chapter C5 l140 {Chapter with unnumbsubsec}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter with unnumbsubsec}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l142
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l143
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{unnumbered-sec}
     {normal_text:unnumbered sec}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l144
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  *normal_command@float C7 l145
  |float_number:{2.1}
  |float_type:{Text}
  |global_command_number:{18}
  |identifier:{Chapter-with-subsec-float}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:Chapter with subsec float}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Chap\\n}
   *normal_command@shortcaption C1 l147
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC Chapter with subsec}
   {spaces_after_close_brace:\\n}
   *normal_command@caption C1 l148
    *brace_command_context C1
     *paragraph C1
      {normal_text:C Chapter with subsec}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l149
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l151 {unnumbered sec}
 |identifier:{unnumbered-sec}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered sec}
    {spaces_after_argument:\\n}
 *normal_command@unnumberedsec C6 l152 {unnumbered sec}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:unnumbered sec}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C7 l154
  |float_number:{2.2}
  |float_type:{Text}
  |global_command_number:{19}
  |identifier:{unnumbered-sec-float}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:unnumbered sec float}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Chap\\n}
   *normal_command@shortcaption C1 l156
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC unnumbered sec float}
   {spaces_after_close_brace:\\n}
   *normal_command@caption C1 l157
    *brace_command_context C1
     *paragraph C1
      {normal_text:C unnumbered sec float}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l158
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C8 l160
  |float_number:{2.1}
  |float_type:{}
  |global_command_number:{20}
  |identifier:{label-but-no-type-in-unnumbered-subsec-in-chapter}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C2
     {normal_text:label but no type in unnumbered subsec in chapter}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:float with no type.\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l163
    *brace_command_context C1
     *paragraph C1
      {normal_text:C No type in unnumbered subsec in chapter}
   {spaces_after_close_brace:\\n}
   *normal_command@shortcaption C1 l164
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC No type in unnumbered subsec in chapter}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l165
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l167 {Appendix for float}
 |identifier:{Appendix-for-float}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Appendix for float}
    {spaces_after_argument:\\n}
 *normal_command@appendix C4 l168 {Appendix for float}
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Appendix for float}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C8 l170
  |float_number:{A.1}
  |float_type:{Text}
  |global_command_number:{21}
  |identifier:{appendix-sec-float}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:appendix sec float}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:Appendix\\n}
   *normal_command@shortcaption C1 l173
    *brace_command_context C1
     *paragraph C1
      {normal_text:SC appendix sec float}
   {spaces_after_close_brace:\\n}
   *normal_command@caption C1 l174
    *brace_command_context C1
     *paragraph C1
      {normal_text:C appendix sec float}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l175
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l177 {list of floats}
 |identifier:{list-of-floats}
 |is_target:{1}
 |node_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:list of floats}
    {spaces_after_argument:\\n}
 *normal_command@unnumbered C15 l178 {list of floats}
 |section_level:{1}
 |section_number:{9}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:list of floats}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C8
   {normal_text:See }
   *normal_command@ref C1 l180
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{text-in-section}
     {normal_text:text in section}
   {normal_text:.\\n}
   {normal_text:And (}
   *normal_command@pxref C1 l181
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{text-in-chapter}
     {normal_text:text in chapter}
   {normal_text:).\\n}
   *normal_command@xref C1 l182
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{text-with-a-lot-of-features}
     {normal_text:text with a lot of features}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:And now a ref (without manual or printed manual)\\n}
   *normal_command@ref C3 l185
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{text-with-a-lot-of-features}
     {normal_text:text with a lot of features}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:cross ref}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:title}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:And now a ref (with manual without printed manual)\\n}
   *normal_command@ref C4 l188
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:text with a lot of features}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:cross ref}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:title}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:manual}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:And now a ref (without manual with a printed manual)\\n}
   *normal_command@ref C5 l191
    *brace_arg C1
    |node_content:A{0|0}
     {normal_text:text with a lot of features}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:cross ref}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:title}
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:printed manual title}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:A ref to float without type }
   *normal_command@ref C1 l193
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{label-but-no-type}
     {normal_text:label but no type}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l195
  |float_type:{Text}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Text}
    {spaces_after_argument:\\n}
  *normal_command@listoffloats C1 l196
  |float_type:{théorème}
  |global_command_number:{2}
   *line_arg C7
    {spaces_before_argument: }
    {normal_text:th}
    *normal_command@\' C1 l196
     *following_arg C1
      {normal_text:e}
    {normal_text:or}
    *normal_command@` C1 l196
     *following_arg C1
      {normal_text:e}
    {normal_text:me}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
 *after_end C2
  {raw:\\n}
  {raw:\\n}
';


$result_texis{'numbering_captions_listoffloats'} = '@node Top
@top Test floats

@float Text, text with a lot of features

@caption{ An example of float caption@enddots{}}
@shortcaption{@TeX{} and someething}
@end float

@float Text
No label but caption and shortcaption.

@caption{C No label}
@shortcaption{SC No label}
@end float

@float ,label but no type
No type but caption and shortcaption.

@caption{C No type}
@shortcaption{SC No type}
@end float


@float ,label but no type and no caption
No type but label and no caption nor shortcaption.

@end float


@float
No label, no type, no caption no shortcaption.

@end float

@float
No label, no type, but caption and shortcaption.
@caption{C No label, no type, but caption and shortcaption.}
@shortcaption{SC No label, no type, but caption and shortcaption.}
@end float

@float ,label but no type 2
Second float with no type.

@caption{C No type 2}
@shortcaption{SC No type 2}
@end float

@float Warning, warning in top
A warning

@caption{C A warning}
@shortcaption{SC A warning}
@end float

@menu
* chapter::
* Unnumbered::
* Chapter with unnumbsubsec::
* Appendix for float::
* list of floats::
@end menu

@node chapter
@chapter A chapter

@float Text, text in chapter
Text in chapter

@caption{C Text in chapter}
@end float

@float Text, float with a lot of features and no shortcaption
@caption{ An example of float caption, no shortcaption@enddots{}}
@end float

@float th@\'eor@`eme, theoreme
A th@\'eor@`eme

@caption{C A th@\'eor@`eme}
@end float

@float ,label but no type in chapter
float with no type.

@caption{C No type in chapter}
@shortcaption{SC No type in chapter}
@end float

@float Warning, warning in chapter
A warning

@caption{C A warning in chapter}
@shortcaption{SC A warning in chapter}
@end float

@menu
* section::
@end menu

@node section
@section A section

@float Text, text in section

A text in float no caption a label a type.

@end float

@node Unnumbered
@unnumbered Unnumbered

@menu
* Section within unnumbered::
@end menu
@float Text, unnumbered float
unnum
@shortcaption{SC unnumbered float}
@caption{C unnumbered float}
@end float
@float ,label but no type in unnumbered
float with no type.

@caption{C No type in unnumbered}
@shortcaption{SC No type in unnumbered}
@end float


@node Section within unnumbered
@section Section within unnumbered


@float Text, Section within unnumbered float
Section within unnumbered
@shortcaption{SC Section within unnumbered}
@caption{C Section within unnumbered}
@end float

@node Chapter with unnumbsubsec
@chapter Chapter with unnumbsubsec

@menu
* unnumbered sec::
@end menu
@float Text, Chapter with subsec float
Chap
@shortcaption{SC Chapter with subsec}
@caption{C Chapter with subsec}
@end float

@node unnumbered sec
@unnumberedsec unnumbered sec

@float Text, unnumbered sec float
Chap
@shortcaption{SC unnumbered sec float}
@caption{C unnumbered sec float}
@end float

@float ,label but no type in unnumbered subsec in chapter
float with no type.

@caption{C No type in unnumbered subsec in chapter}
@shortcaption{SC No type in unnumbered subsec in chapter}
@end float

@node Appendix for float
@appendix Appendix for float

@float Text, appendix sec float

Appendix
@shortcaption{SC appendix sec float}
@caption{C appendix sec float}
@end float

@node list of floats
@unnumbered list of floats

See @ref{text in section}.
And (@pxref{text in chapter}).
@xref{text with a lot of features}.

And now a ref (without manual or printed manual)
@ref{text with a lot of features, cross ref, title}.

And now a ref (with manual without printed manual)
@ref{text with a lot of features, cross ref, title, manual}.

And now a ref (without manual with a printed manual)
@ref{text with a lot of features, cross ref, title,, printed manual title}.

A ref to float without type @ref{label but no type}.

@listoffloats Text
@listoffloats th@\'eor@`eme

@bye


';


$result_texts{'numbering_captions_listoffloats'} = 'Test floats
***********

Text, text with a lot of features


Text
No label but caption and shortcaption.


label but no type
No type but caption and shortcaption.



label but no type and no caption
No type but label and no caption nor shortcaption.



No label, no type, no caption no shortcaption.


No label, no type, but caption and shortcaption.

label but no type 2
Second float with no type.


Warning, warning in top
A warning


* chapter::
* Unnumbered::
* Chapter with unnumbsubsec::
* Appendix for float::
* list of floats::

1 A chapter
***********

Text, text in chapter
Text in chapter


Text, float with a lot of features and no shortcaption

the\'ore`me, theoreme
A the\'ore`me


label but no type in chapter
float with no type.


Warning, warning in chapter
A warning


* section::

1.1 A section
=============

Text, text in section

A text in float no caption a label a type.


Unnumbered
**********

* Section within unnumbered::
Text, unnumbered float
unnum
label but no type in unnumbered
float with no type.



Section within unnumbered
=========================


Text, Section within unnumbered float
Section within unnumbered

2 Chapter with unnumbsubsec
***************************

* unnumbered sec::
Text, Chapter with subsec float
Chap

unnumbered sec
==============

Text, unnumbered sec float
Chap

label but no type in unnumbered subsec in chapter
float with no type.


Appendix A Appendix for float
*****************************

Text, appendix sec float

Appendix

list of floats
**************

See text in section.
And (text in chapter).
text with a lot of features.

And now a ref (without manual or printed manual)
text with a lot of features.

And now a ref (with manual without printed manual)
text with a lot of features.

And now a ref (without manual with a printed manual)
text with a lot of features.

A ref to float without type label but no type.


';

$result_errors{'numbering_captions_listoffloats'} = '';

$result_floats{'numbering_captions_listoffloats'} = ': 8
 F1: {label-but-no-type}
  S: SC No type
  C: C No type
 F2: {label-but-no-type-and-no-caption}
 F
 F
  S: SC No label, no type, but caption and shortcaption.
  C: C No label, no type, but caption and shortcaption.
 F3: {label-but-no-type-2}
  S: SC No type 2
  C: C No type 2
 F1.1: {label-but-no-type-in-chapter}
  S: SC No type in chapter
  C: C No type in chapter
 F5: {label-but-no-type-in-unnumbered}
  S: SC No type in unnumbered
  C: C No type in unnumbered
 F2.1: {label-but-no-type-in-unnumbered-subsec-in-chapter}
  S: SC No type in unnumbered subsec in chapter
  C: C No type in unnumbered subsec in chapter
Text: 10
 F1: {text-with-a-lot-of-features}
  S: @TeX{} and someething
  C: An example of float caption@enddots{}
 F
  S: SC No label
  C: C No label
 F1.1: {text-in-chapter}
  C: C Text in chapter
 F1.2: {float-with-a-lot-of-features-and-no-shortcaption}
  C: An example of float caption, no shortcaption@enddots{}
 F1.3: {text-in-section}
 F5: {unnumbered-float}
  S: SC unnumbered float
  C: C unnumbered float
 F6: {Section-within-unnumbered-float}
  S: SC Section within unnumbered
  C: C Section within unnumbered
 F2.1: {Chapter-with-subsec-float}
  S: SC Chapter with subsec
  C: C Chapter with subsec
 F2.2: {unnumbered-sec-float}
  S: SC unnumbered sec float
  C: C unnumbered sec float
 FA.1: {appendix-sec-float}
  S: SC appendix sec float
  C: C appendix sec float
Warning: 2
 F1: {warning-in-top}
  S: SC A warning
  C: C A warning
 F1.1: {warning-in-chapter}
  S: SC A warning in chapter
  C: C A warning in chapter
théorème: 1
 F1.1: {theoreme}
  C: C A th@\'eor@`eme
';

$result_nodes_list{'numbering_captions_listoffloats'} = '1|Top
 associated_section: Test floats
 associated_title_command: Test floats
 menus:
  chapter
  Unnumbered
  Chapter with unnumbsubsec
  Appendix for float
  list of floats
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 A chapter
 associated_title_command: 1 A chapter
 menus:
  section
 node_directions:
  next->Unnumbered
  prev->Top
  up->Top
3|section
 associated_section: 1.1 A section
 associated_title_command: 1.1 A section
 node_directions:
  up->chapter
4|Unnumbered
 associated_section: Unnumbered
 associated_title_command: Unnumbered
 menus:
  Section within unnumbered
 node_directions:
  next->Chapter with unnumbsubsec
  prev->chapter
  up->Top
5|Section within unnumbered
 associated_section: Section within unnumbered
 associated_title_command: Section within unnumbered
 node_directions:
  up->Unnumbered
6|Chapter with unnumbsubsec
 associated_section: 2 Chapter with unnumbsubsec
 associated_title_command: 2 Chapter with unnumbsubsec
 menus:
  unnumbered sec
 node_directions:
  next->Appendix for float
  prev->Unnumbered
  up->Top
7|unnumbered sec
 associated_section: unnumbered sec
 associated_title_command: unnumbered sec
 node_directions:
  up->Chapter with unnumbsubsec
8|Appendix for float
 associated_section: A Appendix for float
 associated_title_command: A Appendix for float
 node_directions:
  next->list of floats
  prev->Chapter with unnumbsubsec
  up->Top
9|list of floats
 associated_section: list of floats
 associated_title_command: list of floats
 node_directions:
  prev->Appendix for float
  up->Top
';

$result_sections_list{'numbering_captions_listoffloats'} = '1|Test floats
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->A chapter
 section_children:
  1|A chapter
  2|Unnumbered
  3|Chapter with unnumbsubsec
  4|Appendix for float
  5|list of floats
2|A chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->Unnumbered
  up->Test floats
 toplevel_directions:
  next->Unnumbered
  prev->Test floats
  up->Test floats
 section_children:
  1|A section
3|A section
 associated_anchor_command: section
 associated_node: section
 section_directions:
  up->A chapter
4|Unnumbered
 associated_anchor_command: Unnumbered
 associated_node: Unnumbered
 section_directions:
  next->Chapter with unnumbsubsec
  prev->A chapter
  up->Test floats
 toplevel_directions:
  next->Chapter with unnumbsubsec
  prev->A chapter
  up->Test floats
 section_children:
  1|Section within unnumbered
5|Section within unnumbered
 associated_anchor_command: Section within unnumbered
 associated_node: Section within unnumbered
 section_directions:
  up->Unnumbered
6|Chapter with unnumbsubsec
 associated_anchor_command: Chapter with unnumbsubsec
 associated_node: Chapter with unnumbsubsec
 section_directions:
  next->Appendix for float
  prev->Unnumbered
  up->Test floats
 toplevel_directions:
  next->Appendix for float
  prev->Unnumbered
  up->Test floats
 section_children:
  1|unnumbered sec
7|unnumbered sec
 associated_anchor_command: unnumbered sec
 associated_node: unnumbered sec
 section_directions:
  up->Chapter with unnumbsubsec
8|Appendix for float
 associated_anchor_command: Appendix for float
 associated_node: Appendix for float
 section_directions:
  next->list of floats
  prev->Chapter with unnumbsubsec
  up->Test floats
 toplevel_directions:
  next->list of floats
  prev->Chapter with unnumbsubsec
  up->Test floats
9|list of floats
 associated_anchor_command: list of floats
 associated_node: list of floats
 section_directions:
  prev->Appendix for float
  up->Test floats
 toplevel_directions:
  prev->Appendix for float
  up->Test floats
';

$result_sectioning_root{'numbering_captions_listoffloats'} = 'level: -1
list:
 1|Test floats
';

$result_headings_list{'numbering_captions_listoffloats'} = '';


$result_converted{'plaintext'}->{'numbering_captions_listoffloats'} = 'Test floats
***********

Text 1: An example of float caption...

No label but caption and shortcaption.

Text: C No label

No type but caption and shortcaption.

1: C No type

No type but label and no caption nor shortcaption.

2

No label, no type, no caption no shortcaption.

No label, no type, but caption and shortcaption.

C No label, no type, but caption and shortcaption.

Second float with no type.

3: C No type 2

A warning

Warning 1: C A warning

1 A chapter
***********

Text in chapter

Text 1.1: C Text in chapter

Text 1.2: An example of float caption, no shortcaption...

A théorème

théorème 1.1: C A théorème

float with no type.

1.1: C No type in chapter

A warning

Warning 1.1: C A warning in chapter

1.1 A section
=============

A text in float no caption a label a type.

Text 1.3
Unnumbered
**********

unnum

Text 5: C unnumbered float

float with no type.

5: C No type in unnumbered

Section within unnumbered
=========================

Section within unnumbered

Text 6: C Section within unnumbered

2 Chapter with unnumbsubsec
***************************

Chap

Text 2.1: C Chapter with subsec

unnumbered sec
==============

Chap

Text 2.2: C unnumbered sec float

float with no type.

2.1: C No type in unnumbered subsec in chapter

Appendix A Appendix for float
*****************************

Appendix

Text A.1: C appendix sec float

list of floats
**************

See Text 1.3: text in section.  And (see Text 1.1: text in chapter).
See Text 1: text with a lot of features.

   And now a ref (without manual or printed manual) cross ref: text with
a lot of features.

   And now a ref (with manual without printed manual) cross ref:
(manual)text with a lot of features.

   And now a ref (without manual with a printed manual) cross ref: text
with a lot of features in ‘printed manual title’.

   A ref to float without type 1: label but no type.

* Menu:

* Text 1: text with a lot of features.   TeX and someething
* Text 1.1: text in chapter.             C Text in chapter
* Text 1.2: float with a lot of features and no shortcaption.
                                         An example of float caption, no
                                         shortcaption...
* Text 1.3: text in section.             
* Text 5: unnumbered float.              SC unnumbered float
* Text 6: Section within unnumbered float.
                                         SC Section within unnumbered
* Text 2.1: Chapter with subsec float.   SC Chapter with subsec
* Text 2.2: unnumbered sec float.        SC unnumbered sec float
* Text A.1: appendix sec float.          SC appendix sec float

* Menu:

* théorème 1.1: theoreme.                C A théorème

';


$result_converted{'html'}->{'numbering_captions_listoffloats'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Test floats</title>

<meta name="description" content="Test floats">
<meta name="keywords" content="Test floats">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">A chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="Test-floats"><span>Test floats<a class="copiable-link" href="#Test-floats"> &para;</a></span></h1>

<div class="float" id="text-with-a-lot-of-features">

<div class="caption"><p><strong class="strong">Text 1: </strong>An example of float caption<small class="enddots">...</small></p></div></div>
<div class="float">
<p>No label but caption and shortcaption.
</p>
<div class="caption"><p><strong class="strong">Text: </strong>C No label</p></div></div>
<div class="float" id="label-but-no-type">
<p>No type but caption and shortcaption.
</p>
<div class="caption"><p><strong class="strong">1: </strong>C No type</p></div></div>

<div class="float" id="label-but-no-type-and-no-caption">
<p>No type but label and no caption nor shortcaption.
</p>
<div class="type-number-float"><p><strong class="strong">2</strong></p></div></div>

<div class="float">
<p>No label, no type, no caption no shortcaption.
</p>
</div>
<div class="float">
<p>No label, no type, but caption and shortcaption.
</p><div class="caption"><p>C No label, no type, but caption and shortcaption.</p></div></div>
<div class="float" id="label-but-no-type-2">
<p>Second float with no type.
</p>
<div class="caption"><p><strong class="strong">3: </strong>C No type 2</p></div></div>
<div class="float" id="warning-in-top">
<p>A warning
</p>
<div class="caption"><p><strong class="strong">Warning 1: </strong>C A warning</p></div></div>

<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">A chapter</a></li>
<li><a href="#Unnumbered" accesskey="2">Unnumbered</a></li>
<li><a href="#Chapter-with-unnumbsubsec" accesskey="3">Chapter with unnumbsubsec</a></li>
<li><a href="#Appendix-for-float" accesskey="4">Appendix for float</a></li>
<li><a href="#list-of-floats" accesskey="5">list of floats</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#Unnumbered" accesskey="n" rel="next">Unnumbered</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Test floats</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Test floats</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="A-chapter"><span>1 A chapter<a class="copiable-link" href="#A-chapter"> &para;</a></span></h2>

<div class="float" id="text-in-chapter">
<p>Text in chapter
</p>
<div class="caption"><p><strong class="strong">Text 1.1: </strong>C Text in chapter</p></div></div>
<div class="float" id="float-with-a-lot-of-features-and-no-shortcaption">
<div class="caption"><p><strong class="strong">Text 1.2: </strong>An example of float caption, no shortcaption<small class="enddots">...</small></p></div></div>
<div class="float" id="theoreme">
<p>A th&eacute;or&egrave;me
</p>
<div class="caption"><p><strong class="strong">th&eacute;or&egrave;me 1.1: </strong>C A th&eacute;or&egrave;me</p></div></div>
<div class="float" id="label-but-no-type-in-chapter">
<p>float with no type.
</p>
<div class="caption"><p><strong class="strong">1.1: </strong>C No type in chapter</p></div></div>
<div class="float" id="warning-in-chapter">
<p>A warning
</p>
<div class="caption"><p><strong class="strong">Warning 1.1: </strong>C A warning in chapter</p></div></div>

<ul class="mini-toc">
<li><a href="#section" accesskey="1">A section</a></li>
</ul>
<hr>
<div class="section-level-extent" id="section">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#chapter" accesskey="u" rel="up">A chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="A-section"><span>1.1 A section<a class="copiable-link" href="#A-section"> &para;</a></span></h3>

<div class="float" id="text-in-section">

<p>A text in float no caption a label a type.
</p>
<div class="type-number-float"><p><strong class="strong">Text 1.3</strong></p></div></div>
<hr>
</div>
</div>
<div class="unnumbered-level-extent" id="Unnumbered">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#Chapter-with-unnumbsubsec" accesskey="n" rel="next">Chapter with unnumbsubsec</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#chapter" accesskey="p" rel="prev">A chapter</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Test floats</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="unnumbered" id="Unnumbered-1"><span>Unnumbered<a class="copiable-link" href="#Unnumbered-1"> &para;</a></span></h2>

<div class="float" id="unnumbered-float">
<p>unnum
</p><div class="caption"><p><strong class="strong">Text 5: </strong>C unnumbered float</p></div></div><div class="float" id="label-but-no-type-in-unnumbered">
<p>float with no type.
</p>
<div class="caption"><p><strong class="strong">5: </strong>C No type in unnumbered</p></div></div>

<ul class="mini-toc">
<li><a href="#Section-within-unnumbered" accesskey="1">Section within unnumbered</a></li>
</ul>
<hr>
<div class="section-level-extent" id="Section-within-unnumbered">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Unnumbered" accesskey="u" rel="up">Unnumbered</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="Section-within-unnumbered-1"><span>Section within unnumbered<a class="copiable-link" href="#Section-within-unnumbered-1"> &para;</a></span></h3>


<div class="float" id="Section-within-unnumbered-float">
<p>Section within unnumbered
</p><div class="caption"><p><strong class="strong">Text 6: </strong>C Section within unnumbered</p></div></div>
<hr>
</div>
</div>
<div class="chapter-level-extent" id="Chapter-with-unnumbsubsec">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#Appendix-for-float" accesskey="n" rel="next">Appendix for float</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Unnumbered" accesskey="p" rel="prev">Unnumbered</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Test floats</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="Chapter-with-unnumbsubsec-1"><span>2 Chapter with unnumbsubsec<a class="copiable-link" href="#Chapter-with-unnumbsubsec-1"> &para;</a></span></h2>

<div class="float" id="Chapter-with-subsec-float">
<p>Chap
</p><div class="caption"><p><strong class="strong">Text 2.1: </strong>C Chapter with subsec</p></div></div>
<ul class="mini-toc">
<li><a href="#unnumbered-sec" accesskey="1">unnumbered sec</a></li>
</ul>
<hr>
<div class="unnumberedsec-level-extent" id="unnumbered-sec">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Chapter-with-unnumbsubsec" accesskey="u" rel="up">Chapter with unnumbsubsec</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="unnumberedsec" id="unnumbered-sec-1"><span>unnumbered sec<a class="copiable-link" href="#unnumbered-sec-1"> &para;</a></span></h3>

<div class="float" id="unnumbered-sec-float">
<p>Chap
</p><div class="caption"><p><strong class="strong">Text 2.2: </strong>C unnumbered sec float</p></div></div>
<div class="float" id="label-but-no-type-in-unnumbered-subsec-in-chapter">
<p>float with no type.
</p>
<div class="caption"><p><strong class="strong">2.1: </strong>C No type in unnumbered subsec in chapter</p></div></div>
<hr>
</div>
</div>
<div class="appendix-level-extent" id="Appendix-for-float">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#list-of-floats" accesskey="n" rel="next">list of floats</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Chapter-with-unnumbsubsec" accesskey="p" rel="prev">Chapter with unnumbsubsec</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Test floats</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="appendix" id="Appendix-for-float-1"><span>Appendix A Appendix for float<a class="copiable-link" href="#Appendix-for-float-1"> &para;</a></span></h2>

<div class="float" id="appendix-sec-float">

<p>Appendix
</p><div class="caption"><p><strong class="strong">Text A.1: </strong>C appendix sec float</p></div></div>
<hr>
</div>
<div class="unnumbered-level-extent" id="list-of-floats">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Appendix-for-float" accesskey="p" rel="prev">Appendix for float</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Test floats</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="unnumbered" id="list-of-floats-1"><span>list of floats<a class="copiable-link" href="#list-of-floats-1"> &para;</a></span></h2>

<p>See <a class="ref" href="#text-in-section">Text 1.3</a>.
And (see <a class="pxref" href="#text-in-chapter">Text 1.1</a>).
See <a class="xref" href="#text-with-a-lot-of-features">Text 1</a>.
</p>
<p>And now a ref (without manual or printed manual)
<a class="ref" href="#text-with-a-lot-of-features">title</a>.
</p>
<p>And now a ref (with manual without printed manual)
<a data-manual="manual" href="manual.html#text-with-a-lot-of-features">title</a>.
</p>
<p>And now a ref (without manual with a printed manual)
&lsquo;title&rsquo; in <cite class="cite">printed manual title</cite>.
</p>
<p>A ref to float without type <a class="ref" href="#label-but-no-type">1</a>.
</p>
<dl class="listoffloats">
<dt><a href="#text-with-a-lot-of-features">Text 1</a></dt><dd class="shortcaption-in-listoffloats"><p>TeX and someething</p></dd>
<dt><a href="#text-in-chapter">Text 1.1</a></dt><dd class="caption-in-listoffloats"><p>C Text in chapter</p></dd>
<dt><a href="#float-with-a-lot-of-features-and-no-shortcaption">Text 1.2</a></dt><dd class="caption-in-listoffloats"><p>An example of float caption, no shortcaption<small class="enddots">...</small></p></dd>
<dt><a href="#text-in-section">Text 1.3</a></dt><dd></dd>
<dt><a href="#unnumbered-float">Text 5</a></dt><dd class="shortcaption-in-listoffloats"><p>SC unnumbered float</p></dd>
<dt><a href="#Section-within-unnumbered-float">Text 6</a></dt><dd class="shortcaption-in-listoffloats"><p>SC Section within unnumbered</p></dd>
<dt><a href="#Chapter-with-subsec-float">Text 2.1</a></dt><dd class="shortcaption-in-listoffloats"><p>SC Chapter with subsec</p></dd>
<dt><a href="#unnumbered-sec-float">Text 2.2</a></dt><dd class="shortcaption-in-listoffloats"><p>SC unnumbered sec float</p></dd>
<dt><a href="#appendix-sec-float">Text A.1</a></dt><dd class="shortcaption-in-listoffloats"><p>SC appendix sec float</p></dd>
</dl>
<dl class="listoffloats">
<dt><a href="#theoreme">th&eacute;or&egrave;me 1.1</a></dt><dd class="caption-in-listoffloats"><p>C A th&eacute;or&egrave;me</p></dd>
</dl>

</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'numbering_captions_listoffloats'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> Test floats</sectiontitle>

<float identifier="text-with-a-lot-of-features" type="Text" number="1" endspaces=" "><floattype> Text</floattype><floatname> text with a lot of features</floatname>

<caption> <para>An example of float caption&enddots;</para></caption>
<shortcaption><para>&tex; and someething</para></shortcaption>
</float>

<float type="Text" endspaces=" "><floattype> Text</floattype>
<para>No label but caption and shortcaption.
</para>
<caption><para>C No label</para></caption>
<shortcaption><para>SC No label</para></shortcaption>
</float>

<float identifier="label-but-no-type" type="" number="1" endspaces=" "><floattype> </floattype><floatname>label but no type</floatname>
<para>No type but caption and shortcaption.
</para>
<caption><para>C No type</para></caption>
<shortcaption><para>SC No type</para></shortcaption>
</float>


<float identifier="label-but-no-type-and-no-caption" type="" number="2" endspaces=" "><floattype> </floattype><floatname>label but no type and no caption</floatname>
<para>No type but label and no caption nor shortcaption.
</para>
</float>


<float type="" endspaces=" ">
<para>No label, no type, no caption no shortcaption.
</para>
</float>

<float type="" endspaces=" ">
<para>No label, no type, but caption and shortcaption.
</para><caption><para>C No label, no type, but caption and shortcaption.</para></caption>
<shortcaption><para>SC No label, no type, but caption and shortcaption.</para></shortcaption>
</float>

<float identifier="label-but-no-type-2" type="" number="3" endspaces=" "><floattype> </floattype><floatname>label but no type 2</floatname>
<para>Second float with no type.
</para>
<caption><para>C No type 2</para></caption>
<shortcaption><para>SC No type 2</para></shortcaption>
</float>

<float identifier="warning-in-top" type="Warning" number="1" endspaces=" "><floattype> Warning</floattype><floatname> warning in top</floatname>
<para>A warning
</para>
<caption><para>C A warning</para></caption>
<shortcaption><para>SC A warning</para></shortcaption>
</float>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>Unnumbered</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>Chapter with unnumbsubsec</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>Appendix for float</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>list of floats</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodenext automatic="on"> Unnumbered</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> A chapter</sectiontitle>

<float identifier="text-in-chapter" type="Text" number="1.1" endspaces=" "><floattype> Text</floattype><floatname> text in chapter</floatname>
<para>Text in chapter
</para>
<caption><para>C Text in chapter</para></caption>
</float>

<float identifier="float-with-a-lot-of-features-and-no-shortcaption" type="Text" number="1.2" endspaces=" "><floattype> Text</floattype><floatname> float with a lot of features and no shortcaption</floatname>
<caption> <para>An example of float caption, no shortcaption&enddots;</para></caption>
</float>

<float identifier="theoreme" type="théorème" number="1.1" endspaces=" "><floattype> th<accent type="acute" bracketed="off">e</accent>or<accent type="grave" bracketed="off">e</accent>me</floattype><floatname> theoreme</floatname>
<para>A th<accent type="acute" bracketed="off">e</accent>or<accent type="grave" bracketed="off">e</accent>me
</para>
<caption><para>C A th<accent type="acute" bracketed="off">e</accent>or<accent type="grave" bracketed="off">e</accent>me</para></caption>
</float>

<float identifier="label-but-no-type-in-chapter" type="" number="1.1" endspaces=" "><floattype> </floattype><floatname>label but no type in chapter</floatname>
<para>float with no type.
</para>
<caption><para>C No type in chapter</para></caption>
<shortcaption><para>SC No type in chapter</para></shortcaption>
</float>

<float identifier="warning-in-chapter" type="Warning" number="1.1" endspaces=" "><floattype> Warning</floattype><floatname> warning in chapter</floatname>
<para>A warning
</para>
<caption><para>C A warning in chapter</para></caption>
<shortcaption><para>SC A warning in chapter</para></shortcaption>
</float>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>section</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="section"><nodename> section</nodename><nodeup automatic="on"> chapter</nodeup></node>
<section><sectiontitle> A section</sectiontitle>

<float identifier="text-in-section" type="Text" number="1.3" endspaces=" "><floattype> Text</floattype><floatname> text in section</floatname>

<para>A text in float no caption a label a type.
</para>
</float>

</section>
</chapter>
<node identifier="Unnumbered"><nodename> Unnumbered</nodename><nodenext automatic="on"> Chapter with unnumbsubsec</nodenext><nodeprev automatic="on"> chapter</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<unnumbered><sectiontitle> Unnumbered</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>Section within unnumbered</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>
<float identifier="unnumbered-float" type="Text" number="5" endspaces=" "><floattype> Text</floattype><floatname> unnumbered float</floatname>
<para>unnum
</para><shortcaption><para>SC unnumbered float</para></shortcaption>
<caption><para>C unnumbered float</para></caption>
</float>
<float identifier="label-but-no-type-in-unnumbered" type="" number="5" endspaces=" "><floattype> </floattype><floatname>label but no type in unnumbered</floatname>
<para>float with no type.
</para>
<caption><para>C No type in unnumbered</para></caption>
<shortcaption><para>SC No type in unnumbered</para></shortcaption>
</float>


<node identifier="Section-within-unnumbered"><nodename> Section within unnumbered</nodename><nodeup automatic="on"> Unnumbered</nodeup></node>
<section><sectiontitle> Section within unnumbered</sectiontitle>


<float identifier="Section-within-unnumbered-float" type="Text" number="6" endspaces=" "><floattype> Text</floattype><floatname> Section within unnumbered float</floatname>
<para>Section within unnumbered
</para><shortcaption><para>SC Section within unnumbered</para></shortcaption>
<caption><para>C Section within unnumbered</para></caption>
</float>

</section>
</unnumbered>
<node identifier="Chapter-with-unnumbsubsec"><nodename> Chapter with unnumbsubsec</nodename><nodenext automatic="on"> Appendix for float</nodenext><nodeprev automatic="on"> Unnumbered</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chapter with unnumbsubsec</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>unnumbered sec</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>
<float identifier="Chapter-with-subsec-float" type="Text" number="2.1" endspaces=" "><floattype> Text</floattype><floatname> Chapter with subsec float</floatname>
<para>Chap
</para><shortcaption><para>SC Chapter with subsec</para></shortcaption>
<caption><para>C Chapter with subsec</para></caption>
</float>

<node identifier="unnumbered-sec"><nodename> unnumbered sec</nodename><nodeup automatic="on"> Chapter with unnumbsubsec</nodeup></node>
<unnumberedsec><sectiontitle> unnumbered sec</sectiontitle>

<float identifier="unnumbered-sec-float" type="Text" number="2.2" endspaces=" "><floattype> Text</floattype><floatname> unnumbered sec float</floatname>
<para>Chap
</para><shortcaption><para>SC unnumbered sec float</para></shortcaption>
<caption><para>C unnumbered sec float</para></caption>
</float>

<float identifier="label-but-no-type-in-unnumbered-subsec-in-chapter" type="" number="2.1" endspaces=" "><floattype> </floattype><floatname>label but no type in unnumbered subsec in chapter</floatname>
<para>float with no type.
</para>
<caption><para>C No type in unnumbered subsec in chapter</para></caption>
<shortcaption><para>SC No type in unnumbered subsec in chapter</para></shortcaption>
</float>

</unnumberedsec>
</chapter>
<node identifier="Appendix-for-float"><nodename> Appendix for float</nodename><nodenext automatic="on"> list of floats</nodenext><nodeprev automatic="on"> Chapter with unnumbsubsec</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<appendix><sectiontitle> Appendix for float</sectiontitle>

<float identifier="appendix-sec-float" type="Text" number="A.1" endspaces=" "><floattype> Text</floattype><floatname> appendix sec float</floatname>

<para>Appendix
</para><shortcaption><para>SC appendix sec float</para></shortcaption>
<caption><para>C appendix sec float</para></caption>
</float>

</appendix>
<node identifier="list-of-floats"><nodename> list of floats</nodename><nodeprev automatic="on"> Appendix for float</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<unnumbered><sectiontitle> list of floats</sectiontitle>

<para>See <ref label="text-in-section"><xrefnodename>text in section</xrefnodename></ref>.
And (<pxref label="text-in-chapter"><xrefnodename>text in chapter</xrefnodename></pxref>).
<xref label="text-with-a-lot-of-features"><xrefnodename>text with a lot of features</xrefnodename></xref>.
</para>
<para>And now a ref (without manual or printed manual)
<ref label="text-with-a-lot-of-features"><xrefnodename>text with a lot of features</xrefnodename><xrefinfoname> cross ref</xrefinfoname><xrefprinteddesc> title</xrefprinteddesc></ref>.
</para>
<para>And now a ref (with manual without printed manual)
<ref label="text-with-a-lot-of-features" manual="manual"><xrefnodename>text with a lot of features</xrefnodename><xrefinfoname> cross ref</xrefinfoname><xrefprinteddesc> title</xrefprinteddesc><xrefinfofile> manual</xrefinfofile></ref>.
</para>
<para>And now a ref (without manual with a printed manual)
<ref label="text-with-a-lot-of-features"><xrefnodename>text with a lot of features</xrefnodename><xrefinfoname> cross ref</xrefinfoname><xrefprinteddesc> title</xrefprinteddesc><xrefprintedname> printed manual title</xrefprintedname></ref>.
</para>
<para>A ref to float without type <ref label="label-but-no-type"><xrefnodename>label but no type</xrefnodename></ref>.
</para>
<listoffloats type="Text"> Text</listoffloats>
<listoffloats type="théorème"> th<accent type="acute" bracketed="off">e</accent>or<accent type="grave" bracketed="off">e</accent>me</listoffloats>

</unnumbered>
<bye></bye>
<postambleafterend>

</postambleafterend>';


$result_converted{'latex'}->{'numbering_captions_listoffloats'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
% This is used to provide a default no-operation \'keyval\' definition
% of the "alt" key in the "Gin" ("Graphics Inclusion") family used
% by graphicx.  This prevents an "alt" attribute generating an error in
% older versions of graphicx.
\\makeatletter
\\providecommand\\KV@Gin@alt{}
\\makeatother
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\hypersetup{pdftitle={Test floats}}

\\makeatletter
\\newcommand{\\Texinfothechapterheading}{}
\\newtitlemark{\\Texinfothechapterheading}%
\\newcommand{\\Texinfoheadingchaptername}{\\chaptername}
\\newtitlemark{\\Texinfoheadingchaptername}%
\\newcommand{\\Texinfosettitle}{No Title}%

\\newcommand{\\Texinfounnumberedchapter}[1]{\\chapter*{#1}
\\addcontentsline{toc}{chapter}{\\protect\\textbf{#1}}%
\\renewcommand{\\Texinfothechapterheading}{}%
\\chaptermark{#1}%
}%

\\newcommand{\\Texinfounnumberedpart}[1]{\\part*{#1}
\\addcontentsline{toc}{part}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsection}[1]{\\section*{#1}
\\addcontentsline{toc}{section}{\\protect\\textbf{#1}}%
\\sectionmark{#1}%
}%

\\newcommand{\\Texinfounnumberedsubsection}[1]{\\subsection*{#1}
\\addcontentsline{toc}{subsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsubsubsection}[1]{\\subsubsection*{#1}
\\addcontentsline{toc}{subsubsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfochapter}[1]{\\chapter{#1}
\\renewcommand{\\Texinfothechapterheading}{\\Texinfoheadingchaptername{} \\thechapter{} }%
}%

% new float for type `\'
\\newfloat{TexinfoFloat}{htb}{tfl}[chapter]
\\floatname{TexinfoFloat}{}
% new float for type `Text\'
\\newfloat{TexinfoFloatText}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatText}{Text}
% new float for type `Warning\'
\\newfloat{TexinfoFloatWarning}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatWarning}{Warning}
% new float for type `théorème\'
\\newfloat{TexinfoFloattheoreme}{htb}{tfl}[chapter]
\\floatname{TexinfoFloattheoreme}{th\\\'{e}or\\`{e}me}
% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\Texinfothechapterheading{}\\chaptertitle{}][][\\thepage]
                              {\\Texinfothechapterheading{}\\chaptertitle{}}{}{\\thepage}}

% allow line breaking at underscore
\\let\\Texinfounderscore\\_
\\renewcommand{\\_}{\\Texinfounderscore\\discretionary{}{}{}}
\\renewcommand{\\includegraphics}[1]{\\fbox{FIG \\detokenize{#1}}}

\\makeatother
% set default for @setchapternewpage
\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%

\\begin{document}
\\label{anchor:Top}%
\\label{anchor:text-with-a-lot-of-features}%
\\label{anchor:label-but-no-type}%
\\label{anchor:label-but-no-type-and-no-caption}%
\\label{anchor:label-but-no-type-2}%
\\label{anchor:warning-in-top}%
\\Texinfochapter{{A chapter}}
\\label{anchor:chapter}%

\\begin{TexinfoFloatText}
Text in chapter

\\caption{C Text in chapter}
\\label{anchor:text-in-chapter}%
\\end{TexinfoFloatText}

\\begin{TexinfoFloatText}
\\caption{An example of float caption, no shortcaption\\dots{}}
\\label{anchor:float-with-a-lot-of-features-and-no-shortcaption}%
\\end{TexinfoFloatText}

\\begin{TexinfoFloattheoreme}
A th\\\'{e}or\\`{e}me

\\caption{C A th\\\'{e}or\\`{e}me}
\\label{anchor:theoreme}%
\\end{TexinfoFloattheoreme}

\\begin{TexinfoFloat}
float with no type.

\\caption[SC No type in chapter]{C No type in chapter}
\\label{anchor:label-but-no-type-in-chapter}%
\\end{TexinfoFloat}

\\begin{TexinfoFloatWarning}
A warning

\\caption[SC A warning in chapter]{C A warning in chapter}
\\label{anchor:warning-in-chapter}%
\\end{TexinfoFloatWarning}


\\section{{A section}}
\\label{anchor:section}%

\\begin{TexinfoFloatText}

A text in float no caption a label a type.

\\label{anchor:text-in-section}%
\\end{TexinfoFloatText}

\\Texinfounnumberedchapter{{Unnumbered}}
\\label{anchor:Unnumbered}%

\\begin{TexinfoFloatText}
unnum
\\caption[SC unnumbered float]{C unnumbered float}
\\label{anchor:unnumbered-float}%
\\end{TexinfoFloatText}
\\begin{TexinfoFloat}
float with no type.

\\caption[SC No type in unnumbered]{C No type in unnumbered}
\\label{anchor:label-but-no-type-in-unnumbered}%
\\end{TexinfoFloat}


\\section{{Section within unnumbered}}
\\label{anchor:Section-within-unnumbered}%


\\begin{TexinfoFloatText}
Section within unnumbered
\\caption[SC Section within unnumbered]{C Section within unnumbered}
\\label{anchor:Section-within-unnumbered-float}%
\\end{TexinfoFloatText}

\\Texinfochapter{{Chapter with unnumbsubsec}}
\\label{anchor:Chapter-with-unnumbsubsec}%

\\begin{TexinfoFloatText}
Chap
\\caption[SC Chapter with subsec]{C Chapter with subsec}
\\label{anchor:Chapter-with-subsec-float}%
\\end{TexinfoFloatText}

\\Texinfounnumberedsection{{unnumbered sec}}
\\label{anchor:unnumbered-sec}%

\\begin{TexinfoFloatText}
Chap
\\caption[SC unnumbered sec float]{C unnumbered sec float}
\\label{anchor:unnumbered-sec-float}%
\\end{TexinfoFloatText}

\\begin{TexinfoFloat}
float with no type.

\\caption[SC No type in unnumbered subsec in chapter]{C No type in unnumbered subsec in chapter}
\\label{anchor:label-but-no-type-in-unnumbered-subsec-in-chapter}%
\\end{TexinfoFloat}

\\appendix
\\renewcommand{\\Texinfoheadingchaptername}{\\appendixname}
\\Texinfochapter{{Appendix for float}}
\\label{anchor:Appendix-for-float}%

\\begin{TexinfoFloatText}

Appendix
\\caption[SC appendix sec float]{C appendix sec float}
\\label{anchor:appendix-sec-float}%
\\end{TexinfoFloatText}

\\Texinfounnumberedchapter{{list of floats}}
\\label{anchor:list-of-floats}%

See \\hyperref[anchor:text-in-section]{Text~\\ref*{anchor:text-in-section}}.
And (see \\hyperref[anchor:text-in-chapter]{Text~\\ref*{anchor:text-in-chapter}}).
See \\hyperref[anchor:text-with-a-lot-of-features]{Text~\\ref*{anchor:text-with-a-lot-of-features}}.

And now a ref (without manual or printed manual)
\\hyperref[anchor:text-with-a-lot-of-features]{title}.

And now a ref (with manual without printed manual)
Section ``title\'\' in \\texttt{manual}.

And now a ref (without manual with a printed manual)
Section ``title\'\' in \\textsl{printed manual title}.

A ref to float without type \\hyperref[anchor:label-but-no-type]{\\ref*{anchor:label-but-no-type}}.

\\listof{TexinfoFloatText}{}
\\listof{TexinfoFloattheoreme}{}

\\end{document}
';

1;
