use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'symbol_after_block'} = '*document_root C1
 *before_node_section C36
  *preamble_before_content C4
   *normal_command@html C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:In html\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{html. On the line.}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html. On the line.}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@html C3 l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:In html\\n}
    *normal_command@end C1 l7
    |EXTRA
    |text_arg:{html@ On the line.}
     *line_arg C5
      {spaces_before_argument: }
      {normal_text:html}
      *normal_command@@
      {normal_text: On the line.}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:Verbatim:\\n}
  {empty_line:\\n}
  *normal_command@verbatim C3 l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:In verbatim\\n}
   *normal_command@end C1 l13
   |EXTRA
   |text_arg:{verbatim;}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim;}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@verbatim C3 l15
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:In verbatim\\n}
   *normal_command@end C1 l17
   |EXTRA
   |text_arg:{verbatim@}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:verbatim}
     *normal_command@@
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Table:\\n}
  {empty_line:\\n}
  *normal_command@table C3 l21
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@emph l21
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l22
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:a}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine\\n}
   *normal_command@end C1 l24
   |EXTRA
   |text_arg:{table+}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table+}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C3 l26
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@emph l26
     {spaces_after_argument:\\n}
   *table_entry C2
    *table_term C1
     *normal_command@item C1 l27
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:a}
       {spaces_after_argument:\\n}
    *table_definition C1
     *paragraph C1
      {normal_text:l--ine\\n}
   *normal_command@end C1 l29
   |EXTRA
   |text_arg:{table@}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:table}
     *normal_command@@
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Itemize:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l33
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@bullet l33
     {spaces_after_argument:\\n}
   *normal_command@item C2 l34
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:e--mph item\\n}
   *normal_command@end C1 l35
   |EXTRA
   |text_arg:{itemize\'\'}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize\'\'}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l37
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@bullet l37
     {spaces_after_argument:\\n}
   *normal_command@item C2 l38
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:e--mph item\\n}
   *normal_command@end C1 l39
   |EXTRA
   |text_arg:{itemize@}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:itemize}
     *normal_command@@
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Multitable:\\n}
  {empty_line:\\n}
  *normal_command@multitable C4 l43
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l43
     |EXTRA
     |misc_args:A{6|7}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:6 7}
       {spaces_after_argument:\\n}
   *multitable_head C1
    *row C2
    |EXTRA
    |row_number:{1}
     *normal_command@headitem C2 l44
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:mu--ltitable headitem }
     *normal_command@tab C2 l44
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:another tab\\n}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{2}
     *normal_command@item C2 l45
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:mu--ltitable item }
     *normal_command@tab C2 l45
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:multitable tab\\n}
   *normal_command@end C1 l46
   |EXTRA
   |text_arg:{multitable^}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable^}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@multitable C4 l48
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l48
     |EXTRA
     |misc_args:A{6|7}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:6 7}
       {spaces_after_argument:\\n}
   *multitable_head C1
    *row C2
    |EXTRA
    |row_number:{1}
     *normal_command@headitem C2 l49
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:mu--ltitable headitem }
     *normal_command@tab C2 l49
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:another tab\\n}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{2}
     *normal_command@item C2 l50
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:mu--ltitable item }
     *normal_command@tab C2 l50
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:multitable tab\\n}
   *normal_command@end C1 l51
   |EXTRA
   |text_arg:{multitable{}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:multitable}
     *normal_command@{
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Flushleft:\\n}
  {empty_line:\\n}
  *normal_command@flushleft C3 l55
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:flushleft\\n}
   *normal_command@end C1 l57
   |EXTRA
   |text_arg:{flushleft!}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushleft!}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@flushleft C3 l59
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:flushleft\\n}
   *normal_command@end C1 l61
   |EXTRA
   |text_arg:{flushleft@}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:flushleft}
     *normal_command@@
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Copying:\\n}
  {empty_line:\\n}
  *normal_command@copying C3 l65
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:Copying\\n}
   *normal_command@end C1 l67
   |EXTRA
   |text_arg:{copying*}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:copying*}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@copying C3 l69
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:Copying\\n}
   *normal_command@end C1 l71
   |EXTRA
   |text_arg:{copying@}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:copying}
     *normal_command@@
     {spaces_after_argument:\\n}
';


$result_texis{'symbol_after_block'} = '@html
In html
@end html. On the line.

@html
In html
@end html@@ On the line.

Verbatim:

@verbatim
In verbatim
@end verbatim;

@verbatim
In verbatim
@end verbatim@@

Table:

@table @emph
@item a
l--ine
@end table+

@table @emph
@item a
l--ine
@end table@@

Itemize:

@itemize @bullet
@item e--mph item
@end itemize\'\'

@itemize @bullet
@item e--mph item
@end itemize@@

Multitable:

@multitable @columnfractions 6 7
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@end multitable^

@multitable @columnfractions 6 7
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@end multitable@{

Flushleft:

@flushleft
flushleft
@end flushleft!

@flushleft
flushleft
@end flushleft@@

Copying:

@copying
Copying
@end copying*

@copying
Copying
@end copying@@
';


$result_texts{'symbol_after_block'} = 'In html

In html

Verbatim:

In verbatim

In verbatim

Table:

a
l-ine

a
l-ine

Itemize:

e-mph item

e-mph item

Multitable:

mu-ltitable headitem another tab
mu-ltitable item multitable tab

mu-ltitable headitem another tab
mu-ltitable item multitable tab

Flushleft:

flushleft

flushleft

Copying:


';

$result_errors{'symbol_after_block'} = '* E l3|bad argument to @end: html. On the line.
 bad argument to @end: html. On the line.

* E l7|bad argument to @end: html@@ On the line.
 bad argument to @end: html@@ On the line.

* E l13|bad argument to @end: verbatim;
 bad argument to @end: verbatim;

* E l17|bad argument to @end: verbatim@@
 bad argument to @end: verbatim@@

* E l24|bad argument to @end: table+
 bad argument to @end: table+

* E l29|bad argument to @end: table@@
 bad argument to @end: table@@

* E l35|bad argument to @end: itemize\'\'
 bad argument to @end: itemize\'\'

* E l39|bad argument to @end: itemize@@
 bad argument to @end: itemize@@

* E l46|bad argument to @end: multitable^
 bad argument to @end: multitable^

* E l51|bad argument to @end: multitable@{
 bad argument to @end: multitable@{

* E l57|bad argument to @end: flushleft!
 bad argument to @end: flushleft!

* E l61|bad argument to @end: flushleft@@
 bad argument to @end: flushleft@@

* E l67|bad argument to @end: copying*
 bad argument to @end: copying*

* W l69|multiple @copying
 warning: multiple @copying

* E l71|bad argument to @end: copying@@
 bad argument to @end: copying@@

';

$result_nodes_list{'symbol_after_block'} = '';

$result_sections_list{'symbol_after_block'} = '';

$result_sectioning_root{'symbol_after_block'} = '';

$result_headings_list{'symbol_after_block'} = '';

1;
