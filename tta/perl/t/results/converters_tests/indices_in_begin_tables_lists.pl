use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'indices_in_begin_tables_lists'} = '*document_root C8
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo.tex\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 indices_in_begin_tables_lists.texi:l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 indices_in_begin_tables_lists.texi:l4 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 indices_in_begin_tables_lists.texi:l6 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *@chapter C44 indices_in_begin_tables_lists.texi:l7 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C4 indices_in_begin_tables_lists.texi:l9
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@minus indices_in_begin_tables_lists.texi:l9
     {spaces_after_argument:\\n}
   *before_item C2
    *@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment in itemize}
      {spaces_after_argument:\\n}
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l11
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:also a cindex in itemize}
      {spaces_after_argument:\\n}
   *@item C2 indices_in_begin_tables_lists.texi:l12
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:e--mph item\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l13
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C5 indices_in_begin_tables_lists.texi:l15
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@bullet indices_in_begin_tables_lists.texi:l15
     {spaces_after_argument:\\n}
   *before_item C1
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l16
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,2}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:index entry within itemize}
      {spaces_after_argument:\\n}
   *@item C2 indices_in_begin_tables_lists.texi:l17
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:i--tem 1\\n}
   *@item C3 indices_in_begin_tables_lists.texi:l18
   |EXTRA
   |item_number:{2}
    {ignorable_spaces_after_command: }
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l18
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,3}
     *line_arg C5
      {spaces_before_argument: }
      {normal_text:index entry right after }
      *@@
      {normal_text:item}
      {spaces_after_argument:\\n}
    *paragraph C1
     {normal_text:i--tem 2\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l20
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C4 indices_in_begin_tables_lists.texi:l22
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C2
    *@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment in itemize}
      {spaces_after_argument:\\n}
    *paragraph C2
     {normal_text:T--ext before items.\\n}
     *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l25
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{cp,4}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:also a cindex in itemize}
       {spaces_after_argument:\\n}
   *@item C2 indices_in_begin_tables_lists.texi:l26
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:bullet item\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l27
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 indices_in_begin_tables_lists.texi:l29
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C2
    {empty_line:\\n}
    *@comment C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment before first item in enumerate}
      {spaces_after_argument:\\n}
   *@item C2 indices_in_begin_tables_lists.texi:l32
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:e--numerate\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l33
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 indices_in_begin_tables_lists.texi:l35
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C3
    {empty_line:\\n}
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l37
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,5}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:index inter in enumerate between lines}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
   *@item C2 indices_in_begin_tables_lists.texi:l39
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:enumerate item\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l40
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 indices_in_begin_tables_lists.texi:l42
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C2
    {empty_line:\\n}
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l44
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,6}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:index inter in enumerate after line}
      {spaces_after_argument:\\n}
   *@item C2 indices_in_begin_tables_lists.texi:l45
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:enumerate item\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l46
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 indices_in_begin_tables_lists.texi:l48
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C2
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l49
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,7}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:index inter in enumerate before line}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
   *@item C2 indices_in_begin_tables_lists.texi:l51
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:enumerate item\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l52
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 indices_in_begin_tables_lists.texi:l54
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C1
    *paragraph C2
     {normal_text:Title\\n}
     *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l56
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{cp,8}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cindex}
       {spaces_after_argument:\\n}
   *@item C2 indices_in_begin_tables_lists.texi:l57
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:enum\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l58
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C4 indices_in_begin_tables_lists.texi:l60
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *before_item C4
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l61
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,9}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:first idx}
      {spaces_after_argument:\\n}
    *@comment C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l63
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,10}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:sedond idx}
      {spaces_after_argument:\\n}
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l64
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,11}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:another}
      {spaces_after_argument:\\n}
   *@item C2 indices_in_begin_tables_lists.texi:l65
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:enum\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l66
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@example C3 indices_in_begin_tables_lists.texi:l68
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@itemize C12 indices_in_begin_tables_lists.texi:l69
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *before_item C1
     *preformatted C3
      {empty_line:\\n}
      *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l71
      |EXTRA
      |element_node:{chapter}
      |index_entry:I{cp,12}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:in example itemize before line}
        {spaces_after_argument:\\n}
      {empty_line:\\n}
    *@item C1 indices_in_begin_tables_lists.texi:l73
    |EXTRA
    |item_number:{1}
     *preformatted C6
      {ignorable_spaces_after_command: }
      {normal_text:first item\\n}
      {empty_line:\\n}
      {normal_text:Something\\n}
      *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l76
      |EXTRA
      |element_node:{chapter}
      |index_entry:I{cp,13}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:in example itemize before item 1}
        {spaces_after_argument:\\n}
      *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l77
      |EXTRA
      |element_node:{chapter}
      |index_entry:I{cp,14}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:in example itemize before item 2}
        {spaces_after_argument:\\n}
    *@item C1 indices_in_begin_tables_lists.texi:l78
    |EXTRA
    |item_number:{2}
     *preformatted C4
      {ignorable_spaces_after_command: }
      {normal_text:second item\\n}
      {empty_line:\\n}
      *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l80
      |EXTRA
      |element_node:{chapter}
      |index_entry:I{cp,15}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:in example itemize alone before item}
        {spaces_after_argument:\\n}
    *@item C1 indices_in_begin_tables_lists.texi:l81
    |EXTRA
    |item_number:{3}
     *preformatted C5
      {ignorable_spaces_after_command:\\n}
      {empty_line:\\n}
      *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l83
      |EXTRA
      |element_node:{chapter}
      |index_entry:I{cp,16}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:in example itemize before comment}
        {spaces_after_argument:\\n}
      *@comment C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:in comment}
        {spaces_after_argument:\\n}
      *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l85
      |EXTRA
      |element_node:{chapter}
      |index_entry:I{cp,17}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:in example itemize after comment}
        {spaces_after_argument:\\n}
    *@item C1 indices_in_begin_tables_lists.texi:l86
    |EXTRA
    |item_number:{4}
     *preformatted C5
      {ignorable_spaces_after_command: }
      {normal_text:item after entry and comment\\n}
      {empty_line:\\n}
      *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l88
      |EXTRA
      |element_node:{chapter}
      |index_entry:I{cp,18}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:before comment}
        {spaces_after_argument:\\n}
      *@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment after index entry}
        {spaces_after_argument:\\n}
    *@item C1 indices_in_begin_tables_lists.texi:l90
    |EXTRA
    |item_number:{5}
     *preformatted C5
      {ignorable_spaces_after_command: }
      {normal_text:comment and entry\\n}
      {empty_line:\\n}
      *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l92
      |EXTRA
      |element_node:{chapter}
      |index_entry:I{cp,19}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:before text}
        {spaces_after_argument:\\n}
      {normal_text:Some thing in pre\\n}
    *@item C1 indices_in_begin_tables_lists.texi:l94
    |EXTRA
    |item_number:{6}
     *preformatted C6
      {ignorable_spaces_after_command: }
      {normal_text:more item\\n}
      {empty_line:\\n}
      *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l96
      |EXTRA
      |element_node:{chapter}
      |index_entry:I{cp,20}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:before text and comment}
        {spaces_after_argument:\\n}
      {normal_text:Some content\\n}
      *@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:in c}
        {spaces_after_argument:\\n}
    *@item C1 indices_in_begin_tables_lists.texi:l99
    |EXTRA
    |item_number:{7}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:another one item\\n}
    *@item C1 indices_in_begin_tables_lists.texi:l100
    |EXTRA
    |item_number:{8}
     *preformatted C2
      {ignorable_spaces_after_command: }
      *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l100
      |EXTRA
      |element_node:{chapter}
      |index_entry:I{cp,21}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:direct in item in preformatted}
        {spaces_after_argument:\\n}
    *@item C1 indices_in_begin_tables_lists.texi:l101
    |EXTRA
    |item_number:{9}
     *preformatted C2
      {ignorable_spaces_after_command: }
      {normal_text:last item\\n}
    *@end C1 indices_in_begin_tables_lists.texi:l102
    |EXTRA
    |text_arg:{itemize}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemize}
      {spaces_after_argument:\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l103
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@vtable C3 indices_in_begin_tables_lists.texi:l105
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@code indices_in_begin_tables_lists.texi:l105
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C2
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment in table}
       {spaces_after_argument:\\n}
     *@item C1 indices_in_begin_tables_lists.texi:l107
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{vr,1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:acode--b}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l109
   |EXTRA
   |text_arg:{vtable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vtable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@vtable C3 indices_in_begin_tables_lists.texi:l111
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@asis indices_in_begin_tables_lists.texi:l111
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C3
     *@item C1 indices_in_begin_tables_lists.texi:l112
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{vr,2}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:aasis--b}
       {spaces_after_argument:\\n}
     *inter_item C1
      *@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment between item and itemx}
        {spaces_after_argument:\\n}
     *@itemx C1 indices_in_begin_tables_lists.texi:l114
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{vr,3}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:b}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l116
   |EXTRA
   |text_arg:{vtable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vtable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@ftable C4 indices_in_begin_tables_lists.texi:l118
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@var indices_in_begin_tables_lists.texi:l118
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C3
     *@item C1 indices_in_begin_tables_lists.texi:l119
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{fn,1}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:avar--b}
       {spaces_after_argument:\\n}
     *inter_item C3
      *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l120
      |EXTRA
      |element_node:{chapter}
      |index_entry:I{cp,22}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:index entry between item and itemx}
        {spaces_after_argument:\\n}
      *@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:and a comment}
        {spaces_after_argument:\\n}
      *@comment C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:and another comment}
        {spaces_after_argument:\\n}
     *@itemx C1 indices_in_begin_tables_lists.texi:l123
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{fn,2}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:b}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine\\n}
   *table_entry C2
    *table_term C3
     *@item C1 indices_in_begin_tables_lists.texi:l125
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{fn,3}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:c}
       {spaces_after_argument:\\n}
     *inter_item C3
      {empty_line:\\n}
      *@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment between lines}
        {spaces_after_argument:\\n}
      {empty_line:\\n}
     *@itemx C1 indices_in_begin_tables_lists.texi:l129
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{fn,4}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:d}
       {spaces_after_argument:\\n}
    *table_definition C2
     {empty_line:\\n}
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment at end}
       {spaces_after_argument:\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l132
   |EXTRA
   |text_arg:{ftable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ftable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C3 indices_in_begin_tables_lists.texi:l134
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@code indices_in_begin_tables_lists.texi:l134
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C3
     *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l135
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{cp,23}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cindex in table}
       {spaces_after_argument: \\n}
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment in table}
       {spaces_after_argument:\\n}
     *@item C1 indices_in_begin_tables_lists.texi:l137
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:abb}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l139
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C4 indices_in_begin_tables_lists.texi:l141
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@code indices_in_begin_tables_lists.texi:l141
     {spaces_after_argument:\\n}
   *before_item C2
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l142
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,24}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cindex in table}
      {spaces_after_argument: \\n}
    *paragraph C1
     {normal_text:Texte before first item.\\n}
   *table_entry C1
    *table_term C1
     *@item C1 indices_in_begin_tables_lists.texi:l144
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:abb}
       {spaces_after_argument:\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l145
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C3 indices_in_begin_tables_lists.texi:l147
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@samp indices_in_begin_tables_lists.texi:l147
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C3
     *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l148
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{cp,25}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:samp cindex in table}
       {spaces_after_argument: \\n}
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:samp comment in table}
       {spaces_after_argument:\\n}
     *@item C1 indices_in_begin_tables_lists.texi:l150
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine samp\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l152
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C4 indices_in_begin_tables_lists.texi:l154
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@samp indices_in_begin_tables_lists.texi:l154
     {spaces_after_argument:\\n}
   *before_item C2
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l155
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,26}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:samp cindex in table}
      {spaces_after_argument: \\n}
    *paragraph C1
     {normal_text:Texte before first item samp.\\n}
   *table_entry C1
    *table_term C1
     *@item C1 indices_in_begin_tables_lists.texi:l157
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb}
       {spaces_after_argument:\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l158
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C4 indices_in_begin_tables_lists.texi:l160
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@samp indices_in_begin_tables_lists.texi:l160
     {spaces_after_argument:\\n}
   *before_item C3
    {empty_line:\\n}
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l162
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,27}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cindex between lines}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 indices_in_begin_tables_lists.texi:l164
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb1}
       {spaces_after_argument:\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l165
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C4 indices_in_begin_tables_lists.texi:l167
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@samp indices_in_begin_tables_lists.texi:l167
     {spaces_after_argument:\\n}
   *before_item C2
    *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l168
    |EXTRA
    |element_node:{chapter}
    |index_entry:I{cp,28}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cindex before line}
      {spaces_after_argument:\\n}
    {empty_line:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 indices_in_begin_tables_lists.texi:l170
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb2}
       {spaces_after_argument:\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l171
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C4 indices_in_begin_tables_lists.texi:l173
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@samp indices_in_begin_tables_lists.texi:l173
     {spaces_after_argument:\\n}
   *before_item C1
    {empty_line:\\n}
   *table_entry C1
    *table_term C2
     *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l175
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{cp,29}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cindex after line}
       {spaces_after_argument:\\n}
     *@item C1 indices_in_begin_tables_lists.texi:l176
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb2}
       {spaces_after_argument:\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l177
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C3 indices_in_begin_tables_lists.texi:l179
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@samp indices_in_begin_tables_lists.texi:l179
     {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C5
     *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l180
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{cp,30}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:cindex first}
       {spaces_after_argument:\\n}
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:commant}
       {spaces_after_argument:\\n}
     *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l182
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{cp,31}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:second}
       {spaces_after_argument:\\n}
     *index_entry_command@cindex C1 indices_in_begin_tables_lists.texi:l183
     |EXTRA
     |element_node:{chapter}
     |index_entry:I{cp,32}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:third}
       {spaces_after_argument:\\n}
     *@item C1 indices_in_begin_tables_lists.texi:l184
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:asamp--bb2}
       {spaces_after_argument:\\n}
   *@end C1 indices_in_begin_tables_lists.texi:l185
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 indices_in_begin_tables_lists.texi:l187 {printindex}
 |EXTRA
 |identifier:{printindex}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:printindex}
    {spaces_after_argument:\\n}
 *@chapter C8 indices_in_begin_tables_lists.texi:l188 {printindex}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:printindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 indices_in_begin_tables_lists.texi:l190
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 indices_in_begin_tables_lists.texi:l192
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{vr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:vr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 indices_in_begin_tables_lists.texi:l194
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'indices_in_begin_tables_lists'} = '\\input texinfo.tex

@node Top
@top top

@node chapter
@chapter chap

@itemize @minus
@c comment in itemize
@cindex also a cindex in itemize
@item e--mph item
@end itemize

@itemize @bullet
@cindex index entry within itemize
@item i--tem 1
@item @cindex index entry right after @@item
i--tem 2
@end itemize

@itemize
@c comment in itemize
T--ext before items.
@cindex also a cindex in itemize
@item bullet item
@end itemize

@enumerate

@comment comment before first item in enumerate
@item e--numerate
@end enumerate

@enumerate

@cindex index inter in enumerate between lines

@item enumerate item
@end enumerate

@enumerate

@cindex index inter in enumerate after line
@item enumerate item
@end enumerate

@enumerate
@cindex index inter in enumerate before line

@item enumerate item
@end enumerate

@enumerate
Title
@cindex cindex
@item enum
@end enumerate

@enumerate
@cindex first idx
@comment comment
@cindex sedond idx
@cindex another
@item enum
@end enumerate

@example
@itemize

@cindex in example itemize before line

@item first item

Something
@cindex in example itemize before item 1
@cindex in example itemize before item 2
@item second item

@cindex in example itemize alone before item
@item

@cindex in example itemize before comment
@comment in comment
@cindex in example itemize after comment
@item item after entry and comment

@cindex before comment
@c comment after index entry
@item comment and entry

@cindex before text
Some thing in pre
@item more item

@cindex before text and comment
Some content
@c in c
@item another one item
@item @cindex direct in item in preformatted
@item last item
@end itemize
@end example

@vtable @code
@c comment in table
@item acode--b
l--ine
@end vtable

@vtable @asis
@item aasis--b
@c comment between item and itemx
@itemx b
l--ine
@end vtable

@ftable @var
@item avar--b
@cindex index entry between item and itemx
@c and a comment
@comment and another comment
@itemx b
l--ine
@item c

@c comment between lines

@itemx d

@c comment at end
@end ftable

@table @code
@cindex cindex in table 
@c comment in table
@item abb
l--ine
@end table

@table @code
@cindex cindex in table 
Texte before first item.
@item abb
@end table

@table @samp
@cindex samp cindex in table 
@c samp comment in table
@item asamp--bb
l--ine samp
@end table

@table @samp
@cindex samp cindex in table 
Texte before first item samp.
@item asamp--bb
@end table

@table @samp

@cindex cindex between lines

@item asamp--bb1
@end table

@table @samp
@cindex cindex before line

@item asamp--bb2
@end table

@table @samp

@cindex cindex after line
@item asamp--bb2
@end table

@table @samp
@cindex cindex first
@c commant
@cindex second
@cindex third
@item asamp--bb2
@end table

@node printindex
@chapter printindex

@printindex cp

@printindex vr

@printindex fn

@bye
';


$result_texts{'indices_in_begin_tables_lists'} = 'top
***

1 chap
******

e-mph item

i-tem 1
i-tem 2

T-ext before items.
bullet item


1. e-numerate



1. enumerate item


1. enumerate item


1. enumerate item

Title
1. enum

1. enum



first item

Something
second item


item after entry and comment

comment and entry

Some thing in pre
more item

Some content
another one item
last item

acode-b
l-ine

aasis-b
b
l-ine

avar-b
b
l-ine
c


d


abb
l-ine

Texte before first item.
abb

asamp-bb
l-ine samp

Texte before first item samp.
asamp-bb



asamp-bb1


asamp-bb2


asamp-bb2

asamp-bb2

2 printindex
************




';

$result_errors{'indices_in_begin_tables_lists'} = '* W indices_in_begin_tables_lists.texi:l18|@cindex should only appear at the beginning of a line
 warning: @cindex should only appear at the beginning of a line

* W indices_in_begin_tables_lists.texi:l100|@cindex should only appear at the beginning of a line
 warning: @cindex should only appear at the beginning of a line

';

$result_nodes_list{'indices_in_begin_tables_lists'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  next->printindex
  prev->Top
  up->Top
3|printindex
 associated_section: 2 printindex
 associated_title_command: 2 printindex
 node_directions:
  prev->chapter
  up->Top
';

$result_sections_list{'indices_in_begin_tables_lists'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
  2|printindex
2|chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  next->printindex
  up->top
 toplevel_directions:
  next->printindex
  prev->top
  up->top
3|printindex
 associated_anchor_command: printindex
 associated_node: printindex
 section_directions:
  prev->chap
  up->top
 toplevel_directions:
  prev->chap
  up->top
';

$result_sectioning_root{'indices_in_begin_tables_lists'} = 'level: -1
list:
 1|top
';

$result_headings_list{'indices_in_begin_tables_lists'} = '';

$result_indices_sort_strings{'indices_in_begin_tables_lists'} = 'cp:
 also a cindex in itemize
 also a cindex in itemize
 another
 before comment
 before text
 before text and comment
 cindex
 cindex after line
 cindex before line
 cindex between lines
 cindex first
 cindex in table
 cindex in table
 direct in item in preformatted
 first idx
 in example itemize after comment
 in example itemize alone before item
 in example itemize before comment
 in example itemize before item 1
 in example itemize before item 2
 in example itemize before line
 index entry between item and itemx
 index entry right after @item
 index entry within itemize
 index inter in enumerate after line
 index inter in enumerate before line
 index inter in enumerate between lines
 samp cindex in table
 samp cindex in table
 second
 sedond idx
 third
fn:
 avar--b
 b
 c
 d
vr:
 aasis--b
 acode--b
 b
';

$result_converted_sort_strings{'file_html'}->{'indices_in_begin_tables_lists'} = 'cp:
 also a cindex in itemize
 also a cindex in itemize
 another
 before comment
 before text
 before text and comment
 cindex
 cindex after line
 cindex before line
 cindex between lines
 cindex first
 cindex in table
 cindex in table
 direct in item in preformatted
 first idx
 in example itemize after comment
 in example itemize alone before item
 in example itemize before comment
 in example itemize before item 1
 in example itemize before item 2
 in example itemize before line
 index entry between item and itemx
 index entry right after @item
 index entry within itemize
 index inter in enumerate after line
 index inter in enumerate before line
 index inter in enumerate between lines
 samp cindex in table
 samp cindex in table
 second
 sedond idx
 third
fn:
 avar--b
 b
 c
 d
vr:
 aasis--b
 acode--b
 b
';

$result_converted_sort_strings{'file_info'}->{'indices_in_begin_tables_lists'} = 'cp:
 also a cindex in itemize
 also a cindex in itemize
 another
 before comment
 before text
 before text and comment
 cindex
 cindex after line
 cindex before line
 cindex between lines
 cindex first
 cindex in table
 cindex in table
 direct in item in preformatted
 first idx
 in example itemize after comment
 in example itemize alone before item
 in example itemize before comment
 in example itemize before item 1
 in example itemize before item 2
 in example itemize before line
 index entry between item and itemx
 index entry right after @item
 index entry within itemize
 index inter in enumerate after line
 index inter in enumerate before line
 index inter in enumerate between lines
 samp cindex in table
 samp cindex in table
 second
 sedond idx
 third
fn:
 avar--b
 b
 c
 d
vr:
 aasis--b
 acode--b
 b
';

$result_converted_sort_strings{'file_plaintext'}->{'indices_in_begin_tables_lists'} = 'cp:
 also a cindex in itemize
 also a cindex in itemize
 another
 before comment
 before text
 before text and comment
 cindex
 cindex after line
 cindex before line
 cindex between lines
 cindex first
 cindex in table
 cindex in table
 direct in item in preformatted
 first idx
 in example itemize after comment
 in example itemize alone before item
 in example itemize before comment
 in example itemize before item 1
 in example itemize before item 2
 in example itemize before line
 index entry between item and itemx
 index entry right after @item
 index entry within itemize
 index inter in enumerate after line
 index inter in enumerate before line
 index inter in enumerate between lines
 samp cindex in table
 samp cindex in table
 second
 sedond idx
 third
fn:
 avar--b
 b
 c
 d
vr:
 aasis--b
 acode--b
 b
';

1;
