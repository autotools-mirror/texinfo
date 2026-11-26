use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'in_table'} = '*document_root C3
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble
 *normal_command@node C1 l2 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C11 l3 {chap}
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C2 l5
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@xref l5
     {spaces_after_argument:\\n}
   *normal_command@end C1 l6
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C6 l8
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@code l8
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l9
      *line_arg C9
       {spaces_before_argument: }
       *normal_command@indent l9
       {ignorable_spaces_after_command: }
       *normal_command@titlefont C1 l9
       |global_command_number:{1}
        *brace_container C1
         {normal_text:in titlefont}
       {normal_text: }
       *normal_command@anchor C1 l9
       |identifier:{in-anchor}
       |is_target:{1}
        *brace_arg C1
         {normal_text:in anchor}
       *normal_command@footnote C1 l9
       |global_command_number:{1}
        *brace_command_context C1
         *paragraph C1
          {normal_text:footnote}
       {normal_text: }
       *normal_command@exdent C1 l9
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:exdent}
         {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C3
      {normal_text:in item}
      *normal_command@footnote C1 l10
      |global_command_number:{2}
       *brace_command_context C1
        *paragraph C1
         {normal_text:footnote in item}
      {normal_text:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l11
      *line_arg C2
       {spaces_before_argument: }
       *normal_command@ref C3 l11
        *brace_arg C1
         {normal_text:Top}
        *brace_arg
        *brace_arg C1
         {normal_text: title\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:long title\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l13
      *line_arg C2
       {spaces_before_argument: }
       *normal_command@center C1 l13
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:centered text in item}
         {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l14
      *line_arg C2
       {spaces_before_argument: }
       *index_entry_command@cindex C1 l14
       |element_node:{chap}
       |index_entry:I{cp,1}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:index}
         {spaces_after_argument:\\n}
   *normal_command@end C1 l15
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@vtable C4 l17
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@asis l17
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l18
     |element_node:{chap}
     |index_entry:I{vr,1}
      *line_arg C2
       {spaces_before_argument: }
       *index_entry_command@cindex C1 l18
       |element_node:{chap}
       |index_entry:I{cp,2}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:index}
         {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C3
      *normal_command@option C1 l19
       *brace_container C1
        {normal_text:opt}
      {normal_text:\\n}
      {normal_text:More text\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l21
     |element_node:{chap}
     |index_entry:I{vr,2}
      *line_arg C2
       {spaces_before_argument: }
       *index_entry_command@cindex C1 l21
       |element_node:{chap}
       |index_entry:I{cp,3}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:2 index}
         {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C3
      *normal_command@option C1 l22
       *brace_container C1
        {normal_text:nopt}
      {normal_text:\\n}
      {normal_text:Even more\\n}
   *normal_command@end C1 l24
   |text_arg:{vtable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:vtable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l26
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@printindex C1 l28
  |global_command_number:{2}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
';


$result_texis{'in_table'} = '
@node Top
@node chap

@table @xref
@end table

@table @code
@item @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote} @exdent exdent
in item@footnote{footnote in item}
@item @ref{Top,, title
}long title
@item @center centered text in item
@item @cindex index
@end table

@vtable @asis
@item @cindex index
@option{opt}
More text
@item @cindex 2 index
@option{nopt}
Even more
@end vtable

@printindex fn

@printindex cp
';


$result_texts{'in_table'} = '

in titlefont  exdent
in item
Top
long title
centered text in item



opt
More text

nopt
Even more


';

$result_errors{'in_table'} = '* W l5|@xref should not appear on @table line
 warning: @xref should not appear on @table line

* W l9|@indent should not appear in @item
 warning: @indent should not appear in @item

* W l9|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

* W l9|@exdent should not appear in @item
 warning: @exdent should not appear in @item

* E l11|@ref missing closing brace
 @ref missing closing brace

* E l12|misplaced }
 misplaced }

* W l13|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* W l13|@center should not appear in @item
 warning: @center should not appear in @item

* W l14|@cindex should only appear at the beginning of a line
 warning: @cindex should only appear at the beginning of a line

* W l14|@cindex should not appear in @item
 warning: @cindex should not appear in @item

* W l18|@cindex should only appear at the beginning of a line
 warning: @cindex should only appear at the beginning of a line

* W l18|@cindex should not appear in @item
 warning: @cindex should not appear in @item

* W l21|@cindex should only appear at the beginning of a line
 warning: @cindex should only appear at the beginning of a line

* W l21|@cindex should not appear in @item
 warning: @cindex should not appear in @item

* W l3|node `chap\' not in menu
 warning: node `chap\' not in menu

* W l18|empty index key in @item
 warning: empty index key in @item

* W l21|empty index key in @item
 warning: empty index key in @item

';

$result_nodes_list{'in_table'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'in_table'} = '';

$result_sectioning_root{'in_table'} = '';

$result_headings_list{'in_table'} = '';

$result_indices_sort_strings{'in_table'} = 'cp:
 2 index
 index
 index
';

1;
