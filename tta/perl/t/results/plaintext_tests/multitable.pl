use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content
  *@multitable C3 l1
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l1
      {normal_text:truc}
     {normal_text:    }
     *bracketed_arg C1 l1
      {normal_text:bidule}
     {spaces_after_argument:\\n}
   *multitable_body C2
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:truc }
     *@tab C2 l2
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:bidule\\n}
    *row C2
    |EXTRA
    |row_number:{2}
     *@item C2 l3
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command:   }
      *paragraph C1
       {normal_text:truc2     }
     *@tab C2 l3
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:bidule2\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@multitable C4 l6
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l6
      {normal_text:t}
     {normal_text:    }
     *bracketed_arg C1 l6
      {normal_text:b}
     {spaces_after_argument:\\n}
   *multitable_body C13
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l7
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:AAAAAAAAAAAA }
     *@tab C2 l7
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:BBBBBBBBBBBBBBB\\n}
    *row C2
    |EXTRA
    |row_number:{2}
     *@item C2 l8
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:A }
     *@tab C2 l8
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:B\\n}
    *row C2
    |EXTRA
    |row_number:{3}
     *@item C2 l9
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:AA }
     *@tab C2 l9
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:BB\\n}
    *row C2
    |EXTRA
    |row_number:{4}
     *@item C2 l10
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:AAA }
     *@tab C2 l10
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:BBB\\n}
    *row C2
    |EXTRA
    |row_number:{5}
     *@item C2 l11
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:AAAA }
     *@tab C2 l11
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:BBBB\\n}
    *row C2
    |EXTRA
    |row_number:{6}
     *@item C2 l12
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:1 1 }
     *@tab C2 l12
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:1 2B\\n}
    *row C2
    |EXTRA
    |row_number:{7}
     *@item C2 l13
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:1 3BB }
     *@tab C2 l13
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:1 4BBB\\n}
    *row C2
    |EXTRA
    |row_number:{8}
     *@item C2 l14
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:2A 1 }
     *@tab C2 l14
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:AA AA\\n}
    *row C2
    |EXTRA
    |row_number:{9}
     *@item C2 l15
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:2A 3BB }
     *@tab C2 l15
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:2A 4BBB\\n}
    *row C2
    |EXTRA
    |row_number:{10}
     *@item C2 l16
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:3AA 1 }
     *@tab C2 l16
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:3AA 2B\\n}
    *row C2
    |EXTRA
    |row_number:{11}
     *@item C2 l17
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:3AA 3BB }
     *@tab C2 l17
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:3AA 4BBB\\n}
    *row C2
    |EXTRA
    |row_number:{12}
     *@item C2 l18
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:4AAA 1 }
     *@tab C2 l18
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:4AAA 2B\\n}
    *row C2
    |EXTRA
    |row_number:{13}
     *@item C2 l19
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:4AAA 3BB }
     *@tab C2 l19
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:4AAA 4BBB\\n}
   *multitable_head C1
    *row C2
    |EXTRA
    |row_number:{14}
     *@headitem C2 l20
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:he }
     *@tab C2 l20
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:th\\n}
   *@end C1 l21
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@multitable C3 l23
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l23
      {normal_text:AA}
     {normal_text: }
     *bracketed_arg C1 l23
      {normal_text:BB}
     {spaces_after_argument:\\n}
   *multitable_body C3
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l24
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:a b }
     *@tab C2 l24
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:AA BB\\n}
    *row C2
    |EXTRA
    |row_number:{2}
     *@item C2 l25
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:aa b }
     *@tab C2 l25
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:AA B\\n}
    *row C2
    |EXTRA
    |row_number:{3}
     *@item C2 l26
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:aaa b }
     *@tab C2 l26
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:A BB\\n}
   *@end C1 l27
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@multitable C3 l29
  |EXTRA
  |max_columns:{1}
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *bracketed_arg C1 l29
      {normal_text:A}
     {spaces_after_argument:\\n}
   *multitable_body C2
    *row C1
    |EXTRA
    |row_number:{1}
     *@item C2 l30
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:A\\n}
       {normal_text:B\\n}
    *row C1
    |EXTRA
    |row_number:{2}
     *@item C2 l32
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:a b\\n}
   *@end C1 l33
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@multitable C3 l35
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l35
      {normal_text:A}
     {normal_text: }
     *bracketed_arg C1 l35
      {normal_text:B}
     {spaces_after_argument:\\n}
   *multitable_body C2
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l36
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:U\\n}
       {normal_text:V\\n}
     *@tab C2 l38
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:u\\n}
       {normal_text:v\\n}
    *row C2
    |EXTRA
    |row_number:{2}
     *@item C2 l40
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:a b\\n}
     *@tab C2 l41
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:A B\\n}
   *@end C1 l42
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable'} = '@multitable {truc}    {bidule}
@item truc @tab bidule
@item   truc2     @tab bidule2
@end multitable

@multitable {t}    {b}
@item AAAAAAAAAAAA @tab BBBBBBBBBBBBBBB
@item A @tab B
@item AA @tab BB
@item AAA @tab BBB
@item AAAA @tab BBBB
@item 1 1 @tab 1 2B
@item 1 3BB @tab 1 4BBB
@item 2A 1 @tab AA AA
@item 2A 3BB @tab 2A 4BBB
@item 3AA 1 @tab 3AA 2B
@item 3AA 3BB @tab 3AA 4BBB
@item 4AAA 1 @tab 4AAA 2B
@item 4AAA 3BB @tab 4AAA 4BBB
@headitem he @tab th
@end multitable

@multitable {AA} {BB}
@item a b @tab AA BB
@item aa b @tab AA B
@item aaa b @tab A BB
@end multitable

@multitable {A}
@item A
B
@item a b
@end multitable

@multitable {A} {B}
@item U
V
@tab u
v
@item a b
@tab A B
@end multitable
';


$result_texts{'multitable'} = 'truc bidule
truc2     bidule2

AAAAAAAAAAAA BBBBBBBBBBBBBBB
A B
AA BB
AAA BBB
AAAA BBBB
1 1 1 2B
1 3BB 1 4BBB
2A 1 AA AA
2A 3BB 2A 4BBB
3AA 1 3AA 2B
3AA 3BB 3AA 4BBB
4AAA 1 4AAA 2B
4AAA 3BB 4AAA 4BBB
he th

a b AA BB
aa b AA B
aaa b A BB

A
B
a b

U
V
u
v
a b
A B
';

$result_errors{'multitable'} = '';

$result_nodes_list{'multitable'} = '';

$result_sections_list{'multitable'} = '';

$result_sectioning_root{'multitable'} = '';

$result_headings_list{'multitable'} = '';


$result_converted{'plaintext'}->{'multitable'} = 'truc   bidule
truc2  bidule2

AAAAAAAAAAAABBBBBBBBBBBBBBB
A   B
AA  BB
AAA BBB
AAAABBBB
1   1
1   2B
1   1
3BB 4BBB
2A  AA
1   AA
2A  2A
3BB 4BBB
3AA 3AA
1   2B
3AA 3AA
3BB 4BBB
4AAA4AAA
1   2B
4AAA4AAA
3BB 4BBB
he  th
--------

a    AA
b    BB
aa   AA
b    B
aaa  A
b    BB

A
B
a
b

U   u
V   v
a   A
b   B
';

1;
