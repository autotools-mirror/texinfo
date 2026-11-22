use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'index_table'} = '*document_root C12
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C1 index_table.texi:l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C3 index_table.texi:l4 {Test for indices}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Test for indices}
    {spaces_after_argument:\\n}
  *normal_command@menu C5 index_table.texi:l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 index_table.texi:l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node-with-ftable-and-vtable}
     {normal_text:node with ftable and vtable}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 index_table.texi:l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node-with-printindex}
     {normal_text:node with printindex}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 index_table.texi:l8
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{indices-refs}
     {normal_text:indices refs}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 index_table.texi:l9
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 index_table.texi:l11 {node with ftable and vtable}
 |EXTRA
 |identifier:{node-with-ftable-and-vtable}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node with ftable and vtable}
    {spaces_after_argument:\\n}
 *normal_command@chapter C13 index_table.texi:l12 {first node chapter, with ftable and vtable}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first node chapter, with ftable and vtable}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 index_table.texi:l14
  |EXTRA
  |element_node:{node-with-ftable-and-vtable}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:index entry in node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:Some text\\n}
   *index_entry_command@cindex C1 index_table.texi:l17
   |EXTRA
   |element_node:{node-with-ftable-and-vtable}
   |index_entry:I{cp,2}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:an second index entry in node}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *normal_command@vtable C3 index_table.texi:l21
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@bullet index_table.texi:l21
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C2
     *normal_command@item C1 index_table.texi:l22
     |EXTRA
     |element_node:{node-with-ftable-and-vtable}
     |index_entry:I{vr,1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:var1}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 index_table.texi:l23
     |EXTRA
     |element_node:{node-with-ftable-and-vtable}
     |index_entry:I{vr,2}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:var2}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:var1 et var2\\n}
   *normal_command@end C1 index_table.texi:l25
   |EXTRA
   |text_arg:{vtable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vtable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:an ftable \\n}
  *normal_command@ftable C4 index_table.texi:l28
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@bullet index_table.texi:l28
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C2
     *normal_command@item C1 index_table.texi:l29
     |EXTRA
     |element_node:{node-with-ftable-and-vtable}
     |index_entry:I{fn,1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:fun1}
       {spaces_after_argument:\\n}
     *normal_command@itemx C1 index_table.texi:l30
     |EXTRA
     |element_node:{node-with-ftable-and-vtable}
     |index_entry:I{fn,2}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:fun2}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:fun1 et fun2 \\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 index_table.texi:l32
     |EXTRA
     |element_node:{node-with-ftable-and-vtable}
     |index_entry:I{fn,3}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:more fun}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:and even more   \\n}
   *normal_command@end C1 index_table.texi:l34
   |EXTRA
   |text_arg:{ftable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ftable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 index_table.texi:l36 {node with printindex}
 |EXTRA
 |identifier:{node-with-printindex}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node with printindex}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 index_table.texi:l37 {node with printindex}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node with printindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 index_table.texi:l39
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  *normal_command@printindex C1 index_table.texi:l40
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{vr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:vr}
    {spaces_after_argument:\\n}
  *normal_command@printindex C1 index_table.texi:l41
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 index_table.texi:l43 {indices refs}
 |EXTRA
 |identifier:{indices-refs}
 |is_target:{1}
 |isindex:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:indices refs}
    {spaces_after_argument:\\n}
 *normal_command@chapter C135 index_table.texi:l44 {Indices refs}
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Indices refs}
    {spaces_after_argument:\\n}
  *normal_command@menu C3 index_table.texi:l45
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 index_table.texi:l46
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{node}
     {normal_text:node}
    {menu_entry_separator:::       }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:node \\n}
   *normal_command@end C1 index_table.texi:l47
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l48
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l49
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:aoncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l50
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:zoncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l51
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,6}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:eoncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l52
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,7}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:roncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l53
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,8}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:toncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l54
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,9}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:yoncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l55
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,10}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:uoncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l56
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,11}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ioncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l57
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,12}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ooncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l58
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,13}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:poncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l59
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,14}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:qoncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l60
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,15}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concep}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l61
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,16}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:rsconcept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l62
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,17}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:soncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l63
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,18}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:doncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l64
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,19}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:foncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l65
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,20}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:goncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l66
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,21}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:honcept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l67
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,22}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:joncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l68
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,23}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:koncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l69
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,24}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:loncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l70
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,25}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:moncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l71
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,26}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:roncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l72
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,27}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:woncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l73
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,28}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:xoncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l74
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,29}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:voncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l75
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,30}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:boncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l76
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,31}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:noncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l77
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,32}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:,oncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l78
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,33}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:?oncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l79
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,34}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:;oncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l80
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,35}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:/oncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l81
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,36}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:!oncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l82
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,37}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cancept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l83
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,38}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:czncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l84
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,39}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cencept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l85
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,40}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ctncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l86
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,41}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cyncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l87
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,42}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cuncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l88
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,43}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cincept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l89
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,44}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l90
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,45}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cpncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l91
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,46}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cqncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l92
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,47}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:csncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l93
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,48}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cdncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l94
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,49}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cfncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l95
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,50}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cgncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l96
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,51}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l97
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,52}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cjncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l98
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,53}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:ckncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l99
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,54}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:clncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l100
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,55}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cmncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l101
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,56}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:csdcept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l102
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,57}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cxncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l103
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,58}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cvncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l104
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,59}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cbncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l105
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,60}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cnncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l106
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,61}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c,ncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l107
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,62}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:crncept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l108
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,63}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l109
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,64}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l110
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,65}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l111
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,66}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l112
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,67}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l113
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,68}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l114
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,69}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l115
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,70}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l116
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,71}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l117
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,72}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l118
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,73}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l119
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,74}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l120
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,75}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l121
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,76}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l122
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,77}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l123
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,78}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l124
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,79}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l125
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,80}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l126
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,81}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l127
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,82}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l128
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,83}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l129
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,84}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l130
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,85}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l131
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,86}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l132
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,87}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l133
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,88}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l134
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,89}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l135
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,90}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l136
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,91}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l137
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,92}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l138
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,93}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l139
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,94}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l140
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,95}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l141
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,96}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l142
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,97}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l143
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,98}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l144
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,99}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l145
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,100}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l146
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,101}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l147
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,102}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l148
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,103}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l149
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,104}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l150
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,105}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l151
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,106}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l152
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,107}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l153
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,108}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l154
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,109}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l155
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,110}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l156
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,111}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l157
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,112}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l158
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,113}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l159
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,114}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l160
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,115}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l161
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,116}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l162
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,117}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l163
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,118}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l164
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,119}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l165
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,120}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l166
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,121}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l167
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,122}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l168
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,123}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l169
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,124}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l170
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,125}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l171
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,126}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l172
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,127}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l173
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,128}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l174
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,129}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 index_table.texi:l175
  |EXTRA
  |element_node:{indices-refs}
  |index_entry:I{cp,130}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:concept}
    {spaces_after_argument:\\n}
  *normal_command@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:@printindex fn}
    {spaces_after_argument:\\n}
  *normal_command@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:@printindex vr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 index_table.texi:l179
  |EXTRA
  |global_command_number:{4}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 index_table.texi:l181 {node}
 |EXTRA
 |identifier:{node}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:node}
   *line_arg
   *line_arg
   *line_arg C1
    {spaces_before_argument:\\n}
 *normal_command@section C5 index_table.texi:l182 {node}
 |EXTRA
 |section_heading_number:{3.1}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:A section following the indices.\\n}
  {empty_line:\\n}
  *normal_command@contents C1 index_table.texi:l186
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'index_table'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top Test for indices
@menu
* node with ftable and vtable::
* node with printindex::
* indices refs:: 
@end menu

@node node with ftable and vtable
@chapter first node chapter, with ftable and vtable

@cindex index entry in node

Some text
@cindex an second index entry in node



@vtable @bullet
@item var1
@itemx var2
var1 et var2
@end vtable

an ftable 
@ftable @bullet
@item fun1
@itemx fun2
fun1 et fun2 
@item more fun
and even more   
@end ftable

@node node with printindex
@chapter node with printindex

@printindex fn
@printindex vr
@printindex cp

@node indices refs
@chapter Indices refs
@menu
* node::       node 
@end menu
@cindex concept
@cindex aoncept
@cindex zoncept
@cindex eoncept
@cindex roncept
@cindex toncept
@cindex yoncept
@cindex uoncept
@cindex ioncept
@cindex ooncept
@cindex poncept
@cindex qoncept
@cindex concep
@cindex rsconcept
@cindex soncept
@cindex doncept
@cindex foncept
@cindex goncept
@cindex honcept
@cindex joncept
@cindex koncept
@cindex loncept
@cindex moncept
@cindex roncept
@cindex woncept
@cindex xoncept
@cindex voncept
@cindex boncept
@cindex noncept
@cindex ,oncept
@cindex ?oncept
@cindex ;oncept
@cindex /oncept
@cindex !oncept
@cindex cancept
@cindex czncept
@cindex cencept
@cindex ctncept
@cindex cyncept
@cindex cuncept
@cindex cincept
@cindex concept
@cindex cpncept
@cindex cqncept
@cindex csncept
@cindex cdncept
@cindex cfncept
@cindex cgncept
@cindex chncept
@cindex cjncept
@cindex ckncept
@cindex clncept
@cindex cmncept
@cindex csdcept
@cindex cxncept
@cindex cvncept
@cindex cbncept
@cindex cnncept
@cindex c,ncept
@cindex crncept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@cindex concept
@c @printindex fn
@c @printindex vr

@printindex cp

@node node,,,
@section node

A section following the indices.

@contents
@bye
';


$result_texts{'index_table'} = 'Test for indices
****************
* node with ftable and vtable::
* node with printindex::
* indices refs:: 

1 first node chapter, with ftable and vtable
********************************************


Some text



var1
var2
var1 et var2

an ftable 
fun1
fun2
fun1 et fun2 
more fun
and even more   

2 node with printindex
**********************


3 Indices refs
**************
* node::       node 


3.1 node
========

A section following the indices.

';

$result_errors{'index_table'} = '* E index_table.texi:l21|command @bullet not accepting argument in brace should not be on @vtable line
 command @bullet not accepting argument in brace should not be on @vtable line

* E index_table.texi:l28|command @bullet not accepting argument in brace should not be on @ftable line
 command @bullet not accepting argument in brace should not be on @ftable line

';

$result_nodes_list{'index_table'} = '1|Top
 associated_section: Test for indices
 associated_title_command: Test for indices
 menus:
  node with ftable and vtable
  node with printindex
  indices refs
 node_directions:
  next->node with ftable and vtable
2|node with ftable and vtable
 associated_section: 1 first node chapter, with ftable and vtable
 associated_title_command: 1 first node chapter, with ftable and vtable
 node_directions:
  next->node with printindex
  prev->Top
  up->Top
3|node with printindex
 associated_section: 2 node with printindex
 associated_title_command: 2 node with printindex
 node_directions:
  next->indices refs
  prev->node with ftable and vtable
  up->Top
4|indices refs
 associated_section: 3 Indices refs
 associated_title_command: 3 Indices refs
 menus:
  node
 node_directions:
  prev->node with printindex
  up->Top
5|node
 associated_section: 3.1 node
 associated_title_command: 3.1 node
';

$result_sections_list{'index_table'} = '1|Test for indices
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->first node chapter, with ftable and vtable
 section_children:
  1|first node chapter, with ftable and vtable
  2|node with printindex
  3|Indices refs
2|first node chapter, with ftable and vtable
 associated_anchor_command: node with ftable and vtable
 associated_node: node with ftable and vtable
 section_directions:
  next->node with printindex
  up->Test for indices
 toplevel_directions:
  next->node with printindex
  prev->Test for indices
  up->Test for indices
3|node with printindex
 associated_anchor_command: node with printindex
 associated_node: node with printindex
 section_directions:
  next->Indices refs
  prev->first node chapter, with ftable and vtable
  up->Test for indices
 toplevel_directions:
  next->Indices refs
  prev->first node chapter, with ftable and vtable
  up->Test for indices
4|Indices refs
 associated_anchor_command: indices refs
 associated_node: indices refs
 section_directions:
  prev->node with printindex
  up->Test for indices
 toplevel_directions:
  prev->node with printindex
  up->Test for indices
 section_children:
  1|node
5|node
 associated_anchor_command: node
 associated_node: node
 section_directions:
  up->Indices refs
';

$result_sectioning_root{'index_table'} = 'level: -1
list:
 1|Test for indices
';

$result_headings_list{'index_table'} = '';

$result_indices_sort_strings{'index_table'} = 'cp:
 ,oncept
 ;oncept
 !oncept
 ?oncept
 /oncept
 an second index entry in node
 aoncept
 boncept
 c,ncept
 cancept
 cbncept
 cdncept
 cencept
 cfncept
 cgncept
 chncept
 cincept
 cjncept
 ckncept
 clncept
 cmncept
 cnncept
 concep
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 cpncept
 cqncept
 crncept
 csdcept
 csncept
 ctncept
 cuncept
 cvncept
 cxncept
 cyncept
 czncept
 doncept
 eoncept
 foncept
 goncept
 honcept
 index entry in node
 ioncept
 joncept
 koncept
 loncept
 moncept
 noncept
 ooncept
 poncept
 qoncept
 roncept
 roncept
 rsconcept
 soncept
 toncept
 uoncept
 voncept
 woncept
 xoncept
 yoncept
 zoncept
fn:
 fun1
 fun2
 more fun
vr:
 var1
 var2
';

$result_converted_sort_strings{'file_info'}->{'index_table'} = 'cp:
 ,oncept
 ;oncept
 !oncept
 ?oncept
 /oncept
 an second index entry in node
 aoncept
 boncept
 c,ncept
 cancept
 cbncept
 cdncept
 cencept
 cfncept
 cgncept
 chncept
 cincept
 cjncept
 ckncept
 clncept
 cmncept
 cnncept
 concep
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 cpncept
 cqncept
 crncept
 csdcept
 csncept
 ctncept
 cuncept
 cvncept
 cxncept
 cyncept
 czncept
 doncept
 eoncept
 foncept
 goncept
 honcept
 index entry in node
 ioncept
 joncept
 koncept
 loncept
 moncept
 noncept
 ooncept
 poncept
 qoncept
 roncept
 roncept
 rsconcept
 soncept
 toncept
 uoncept
 voncept
 woncept
 xoncept
 yoncept
 zoncept
fn:
 fun1
 fun2
 more fun
vr:
 var1
 var2
';

$result_converted_sort_strings{'file_html'}->{'index_table'} = 'cp:
 ,oncept
 ;oncept
 !oncept
 ?oncept
 /oncept
 an second index entry in node
 aoncept
 boncept
 c,ncept
 cancept
 cbncept
 cdncept
 cencept
 cfncept
 cgncept
 chncept
 cincept
 cjncept
 ckncept
 clncept
 cmncept
 cnncept
 concep
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 cpncept
 cqncept
 crncept
 csdcept
 csncept
 ctncept
 cuncept
 cvncept
 cxncept
 cyncept
 czncept
 doncept
 eoncept
 foncept
 goncept
 honcept
 index entry in node
 ioncept
 joncept
 koncept
 loncept
 moncept
 noncept
 ooncept
 poncept
 qoncept
 roncept
 roncept
 rsconcept
 soncept
 toncept
 uoncept
 voncept
 woncept
 xoncept
 yoncept
 zoncept
fn:
 fun1
 fun2
 more fun
vr:
 var1
 var2
';

$result_converted_sort_strings{'file_plaintext'}->{'index_table'} = 'cp:
 ,oncept
 ;oncept
 !oncept
 ?oncept
 /oncept
 an second index entry in node
 aoncept
 boncept
 c,ncept
 cancept
 cbncept
 cdncept
 cencept
 cfncept
 cgncept
 chncept
 cincept
 cjncept
 ckncept
 clncept
 cmncept
 cnncept
 concep
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 concept
 cpncept
 cqncept
 crncept
 csdcept
 csncept
 ctncept
 cuncept
 cvncept
 cxncept
 cyncept
 czncept
 doncept
 eoncept
 foncept
 goncept
 honcept
 index entry in node
 ioncept
 joncept
 koncept
 loncept
 moncept
 noncept
 ooncept
 poncept
 qoncept
 roncept
 roncept
 rsconcept
 soncept
 toncept
 uoncept
 voncept
 woncept
 xoncept
 yoncept
 zoncept
fn:
 fun1
 fun2
 more fun
vr:
 var1
 var2
';

1;
