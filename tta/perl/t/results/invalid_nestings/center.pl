use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'center'} = '*document_root C1
 *before_node_section C42
  *preamble_before_content
  *@center C1 l1
   *line_arg C8
    {spaces_before_argument: }
    *@indent l1
    {ignorable_spaces_after_command: }
    *@titlefont C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_container C1
      {normal_text:in titlefont}
    {normal_text: }
    *@anchor C1 l1
    |EXTRA
    |identifier:{in-anchor}
    |is_target:{1}
     *brace_arg C1
      {normal_text:in anchor}
    *@footnote C1 l1
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {normal_text:footnote}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@center C1 l3
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:center }
    *index_entry_command@cindex C1 l3
    |EXTRA
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cindex}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@center C1 l5
   *line_arg C2
    {spaces_before_argument: }
    *@quotation C1 l5
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
  *paragraph C1
   {normal_text:in quotation\\n}
  {empty_line:\\n}
  *@center C1 l9
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:center }
    *@center C1 l9
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:second center}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@center C1 l11
   *line_arg C2
    {spaces_before_argument: }
    *@code C1 l11
     *brace_container C1
      {normal_text:in code in center\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *@center C1 l15
   *line_arg C3
    {spaces_before_argument: }
    *@code C1 l15
     *brace_container C1
      {normal_text:in code in center }
    *@center C1 l15
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:center in code in center}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C1
   *@code C1 l19
    *brace_container
  *@center C1 l19
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:in center in code}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C3 l21
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@asis l21
     {spaces_after_argument:\\n}
   *before_item C1
    *@center C1 l22
     *line_arg C5
      {spaces_before_argument: }
      {normal_text:centered line with item }
      {ignorable_spaces_after_command: }
      {normal_text:first item on center line}
      {spaces_after_argument:\\n}
   *@end C1 l23
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C3 l25
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@emph l25
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *@item C1 l26
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:item}
       {spaces_after_argument:\\n}
    *table_definition C1
     *@center C1 l27
      *line_arg C5
       {spaces_before_argument: }
       {normal_text:centered line with item }
       {ignorable_spaces_after_command: }
       {normal_text:second item on center line}
       {spaces_after_argument:\\n}
   *@end C1 l28
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Empty double center:\\n}
  *@center C1 l31
   *line_arg C2
    {spaces_before_argument: }
    *@center C1 l31
     *line_arg C1
      {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@center C1 l33
   *line_arg C3
    {spaces_before_argument: }
    *@samp C1 l33
     *brace_container C1
      {normal_text:something }
    *@center C1 l33
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:end of samp}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@center C1 l35
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:after first center }
    *@samp C1 l35
     *brace_container
    *@center C1 l35
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:after second center}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:End of samp\\n}
  {empty_line:\\n}
  *@multitable C3 l39
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l39
      {normal_text:AAA}
     {normal_text:  }
     *bracketed_arg C1 l39
      {normal_text:BBB}
     {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l40
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:truc }
     *@tab C4 l40
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:bidule\\n}
      *@center C1 l41
       *line_arg C6
        {spaces_before_argument: }
        {spaces_before_argument: }
        {normal_text:ctruc }
        {ignorable_spaces_after_command: }
        {normal_text:cbidule}
        {spaces_after_argument:\\n}
      *@center C1 l42
       *line_arg C4
        {spaces_before_argument: }
        {spaces_before_argument: }
        {normal_text:cstruc}
        {spaces_after_argument:\\n}
   *@end C1 l43
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@center C1 l45
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:before the table }
    *@table C1 l45
     *arguments_line C1
      *block_line_arg C3
       {spaces_before_argument: }
       *@asis l45
       {spaces_after_argument:\\n}
  {ignorable_spaces_after_command: }
  *paragraph C2
   {normal_text:item in center\\n}
   {normal_text:Line in center\\n}
  {ignorable_spaces_after_command: }
  *paragraph C1
   {normal_text:second item\\n}
  {empty_line:\\n}
';


$result_texis{'center'} = '@center @indent @titlefont{in titlefont} @anchor{in anchor}@footnote{footnote}

@center center @cindex cindex

@center @quotation
in quotation

@center center @center second center

@center @code{in code in center
}


@center @code{in code in center }@center center in code in center



@code{}@center in center in code

@table @asis
@center centered line with item  first item on center line
@end table

@table @emph
@item item
@center centered line with item  second item on center line
@end table

Empty double center:
@center @center

@center @samp{something }@center end of samp

@center after first center @samp{}@center after second center

End of samp

@multitable {AAA}  {BBB}
@item truc @tab bidule
@center  ctruc  cbidule
@center  cstruc
@end multitable

@center before the table @table @asis
 item in center
Line in center
 second item

';


$result_texts{'center'} = 'in titlefont 

center 


in quotation

center second center

in code in center



in code in center center in code in center



in center in code

centered line with item first item on center line

item
centered line with item second item on center line

Empty double center:


something end of samp

after first center after second center

End of samp

truc bidule
ctruc cbidule
cstruc

before the table 
item in center
Line in center
second item

';

$result_errors{'center'} = '* W l1|@indent should not appear in @center
 warning: @indent should not appear in @center

* W l3|@cindex should only appear at the beginning of a line
 warning: @cindex should only appear at the beginning of a line

* W l3|@cindex should not appear in @center
 warning: @cindex should not appear in @center

* W l3|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W l5|@quotation should only appear at the beginning of a line
 warning: @quotation should only appear at the beginning of a line

* W l5|@quotation should not appear in @center
 warning: @quotation should not appear in @center

* E l5|no matching `@end quotation\'
 no matching `@end quotation\'

* E l7|unmatched `@end quotation\'
 unmatched `@end quotation\'

* W l9|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* W l9|@center should not appear in @center
 warning: @center should not appear in @center

* E l11|@code missing closing brace
 @code missing closing brace

* E l13|misplaced }
 misplaced }

* W l15|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* E l15|@code missing closing brace
 @code missing closing brace

* W l15|@center should not appear in @center
 warning: @center should not appear in @center

* E l17|misplaced }
 misplaced }

* W l19|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* E l19|@code missing closing brace
 @code missing closing brace

* E l19|misplaced }
 misplaced }

* W l22|@item should not appear in @center
 warning: @item should not appear in @center

* E l22|@item outside of table or list
 @item outside of table or list

* W l21|@table has text but no @item
 warning: @table has text but no @item

* W l27|@item should not appear in @center
 warning: @item should not appear in @center

* E l27|@item outside of table or list
 @item outside of table or list

* W l31|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* W l31|@center should not appear in @center
 warning: @center should not appear in @center

* W l31|@center missing argument
 warning: @center missing argument

* W l33|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* E l33|@samp missing closing brace
 @samp missing closing brace

* W l33|@center should not appear in @center
 warning: @center should not appear in @center

* E l33|misplaced }
 misplaced }

* W l35|@center should only appear at the beginning of a line
 warning: @center should only appear at the beginning of a line

* E l35|@samp missing closing brace
 @samp missing closing brace

* W l35|@center should not appear in @center
 warning: @center should not appear in @center

* E l37|misplaced }
 misplaced }

* W l41|@item should not appear in @center
 warning: @item should not appear in @center

* E l41|@item outside of table or list
 @item outside of table or list

* W l41|@tab should not appear in @center
 warning: @tab should not appear in @center

* E l41|ignoring @tab outside of multitable
 ignoring @tab outside of multitable

* W l42|@item should not appear in @center
 warning: @item should not appear in @center

* E l42|@item outside of table or list
 @item outside of table or list

* W l45|@table should only appear at the beginning of a line
 warning: @table should only appear at the beginning of a line

* W l45|@table should not appear in @center
 warning: @table should not appear in @center

* E l45|no matching `@end table\'
 no matching `@end table\'

* E l46|@item outside of table or list
 @item outside of table or list

* E l48|@item outside of table or list
 @item outside of table or list

* E l49|unmatched `@end table\'
 unmatched `@end table\'

';

$result_nodes_list{'center'} = '';

$result_sections_list{'center'} = '';

$result_sectioning_root{'center'} = '';

$result_headings_list{'center'} = '';

$result_indices_sort_strings{'center'} = 'cp:
 cindex
';

1;
