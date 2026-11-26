use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'line_passed_and_formats'} = '*document_root C2
 *before_node_section C1
  *preamble
 *normal_command@node C53 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l3
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:special}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Quotation special.\\n}
   *normal_command@quotation C3 l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument: \\n}
    *paragraph C2
     {normal_text:Nested quotation sdflkmsfdlkmfsdqmlkfsdq mlfdsqlkmfdsqmlkfdsq klm fsqdlkmfdsq\\n}
     {normal_text:fdsfsdqmlkfsqd m lqlkmf qskmlfq sklm fqds\\n}
    *normal_command@end C1 l8
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l9
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C4 l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:quotation  text\\n}
   *normal_command@example C3 l13
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:example in   quotation\\n}
    *normal_command@end C1 l15
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l16
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C4 l18
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text: In  example.\\n}
   *normal_command@quotation C3 l20
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:   In quotation   in example\\n}
    *normal_command@end C1 l22
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l23
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l25
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:In 1 example\\n}
   *normal_command@end C1 l27
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  *normal_command@example C3 l28
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:In 2 example\\n}
   *normal_command@end C1 l30
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l32
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:In 1 quotation\\n}
   *normal_command@end C1 l34
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  *normal_command@quotation C3 l35
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:In 2 quotation\\n}
   *normal_command@end C1 l37
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C5 l39
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *paragraph C1
    {normal_text:Quotation\\n}
   *normal_command@quotation C3 l41
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument: \\n}
    *paragraph C1
     {normal_text:Nested quotation\\n}
    *normal_command@end C1 l43
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Quotation 2\\n}
   *normal_command@end C1 l45
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C5 l47
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:In  example.\\n}
   *normal_command@quotation C3 l49
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:In quotation   in example\\n}
    *normal_command@end C1 l51
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:In  example 2.\\n}
   *normal_command@end C1 l53
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C5 l55
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:quotation  text\\n}
   *normal_command@example C3 l57
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:example in   quotation\\n}
    *normal_command@end C1 l59
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:quotation  text 2\\n}
   *normal_command@end C1 l61
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Before quotation\\n}
  *normal_command@quotation C3 l64
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {normal_text:quotation  text\\n}
   *normal_command@end C1 l66
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:after end\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Before example\\n}
  *normal_command@example C3 l70
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:In example\\n}
   *normal_command@end C1 l72
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:After example\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Before quotation and empty line\\n}
  *normal_command@quotation C5 l76
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:In quotation\\n}
   {empty_line:\\n}
   *normal_command@end C1 l80
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:After quotation\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Before example and empty line\\n}
  *normal_command@example C3 l84
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C3
    {empty_line:\\n}
    {normal_text:In example\\n}
    {empty_line:\\n}
   *normal_command@end C1 l88
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:After example\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Nested and empty lines\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Quotation empty out, spaces inside\\n}
  *normal_command@quotation C5 l94
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *normal_command@quotation C5 l96
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *paragraph C1
     {normal_text:In nested\\n}
    {empty_line:\\n}
    *normal_command@end C1 l100
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@end C1 l102
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Quotation empty out, no spaces inside\\n}
  *normal_command@quotation C5 l105
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *normal_command@quotation C3 l107
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:In nested\\n}
    *normal_command@end C1 l109
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:quotation}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@end C1 l111
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Example empty out, spaces inside\\n}
  *normal_command@example C5 l114
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *normal_command@example C3 l116
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C3
     {empty_line:\\n}
     {normal_text:In nested\\n}
     {empty_line:\\n}
    *normal_command@end C1 l120
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *normal_command@end C1 l122
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Example empty out, no spaces inside\\n}
  *normal_command@example C5 l125
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *normal_command@example C3 l127
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {normal_text:In nested\\n}
    *normal_command@end C1 l129
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *normal_command@end C1 l131
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:menu\\n}
  *normal_command@menu C3 l134
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l135
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{node}
     {normal_text:(}
     {normal_text:manual}
     {normal_text:)}
     {normal_text:node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l136
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:end menu\\n}
';


$result_texis{'line_passed_and_formats'} = '@node Top

@quotation special
Quotation special.
@quotation 
Nested quotation sdflkmsfdlkmfsdqmlkfsdq mlfdsqlkmfdsqmlkfdsq klm fsqdlkmfdsq
fdsfsdqmlkfsqd m lqlkmf qskmlfq sklm fqds
@end quotation
@end quotation

@quotation
quotation  text
@example
example in   quotation
@end example
@end quotation

@example
 In  example.
@quotation
   In quotation   in example
@end quotation
@end example

@example
In 1 example
@end example
@example
In 2 example
@end example

@quotation
In 1 quotation
@end quotation
@quotation
In 2 quotation
@end quotation

@quotation 
Quotation
@quotation 
Nested quotation
@end quotation
Quotation 2
@end quotation

@example
In  example.
@quotation
In quotation   in example
@end quotation
In  example 2.
@end example

@quotation
quotation  text
@example
example in   quotation
@end example
quotation  text 2
@end quotation

Before quotation
@quotation
quotation  text
@end quotation
after end

Before example
@example
In example
@end example
After example

Before quotation and empty line
@quotation

In quotation

@end quotation
After quotation

Before example and empty line
@example

In example

@end example
After example

Nested and empty lines

Quotation empty out, spaces inside
@quotation

@quotation

In nested

@end quotation

@end quotation

Quotation empty out, no spaces inside
@quotation

@quotation
In nested
@end quotation

@end quotation

Example empty out, spaces inside
@example

@example

In nested

@end example

@end example

Example empty out, no spaces inside
@example

@example
In nested
@end example

@end example

menu
@menu
* (manual)node::
@end menu
end menu
';


$result_texts{'line_passed_and_formats'} = '
special
Quotation special.
Nested quotation sdflkmsfdlkmfsdqmlkfsdq mlfdsqlkmfdsqmlkfdsq klm fsqdlkmfdsq
fdsfsdqmlkfsqd m lqlkmf qskmlfq sklm fqds

quotation  text
example in   quotation

 In  example.
   In quotation   in example

In 1 example
In 2 example

In 1 quotation
In 2 quotation

Quotation
Nested quotation
Quotation 2

In  example.
In quotation   in example
In  example 2.

quotation  text
example in   quotation
quotation  text 2

Before quotation
quotation  text
after end

Before example
In example
After example

Before quotation and empty line

In quotation

After quotation

Before example and empty line

In example

After example

Nested and empty lines

Quotation empty out, spaces inside


In nested



Quotation empty out, no spaces inside

In nested


Example empty out, spaces inside


In nested



Example empty out, no spaces inside

In nested


menu
* (manual)node::
end menu
';

$result_errors{'line_passed_and_formats'} = '';

$result_nodes_list{'line_passed_and_formats'} = '1|Top
 menus:
  (manual)node
 node_directions:
  next->(manual)node
';

$result_sections_list{'line_passed_and_formats'} = '';

$result_sectioning_root{'line_passed_and_formats'} = '';

$result_headings_list{'line_passed_and_formats'} = '';


$result_converted{'plaintext'}->{'line_passed_and_formats'} = '     special: Quotation special.
          Nested quotation sdflkmsfdlkmfsdqmlkfsdq mlfdsqlkmfdsqmlkfdsq
          klm fsqdlkmfdsq fdsfsdqmlkfsqd m lqlkmf qskmlfq sklm fqds

     quotation text
          example in   quotation

      In  example.
             In quotation   in example

     In 1 example
     In 2 example

     In 1 quotation
     In 2 quotation

     Quotation
          Nested quotation
     Quotation 2

     In  example.
          In quotation   in example
     In  example 2.

     quotation text
          example in   quotation
     quotation text 2

   Before quotation
     quotation text
   after end

   Before example
     In example
   After example

   Before quotation and empty line

     In quotation

   After quotation

   Before example and empty line

     In example

   After example

   Nested and empty lines

   Quotation empty out, spaces inside

          In nested

   Quotation empty out, no spaces inside

          In nested

   Example empty out, spaces inside


          In nested


   Example empty out, no spaces inside

          In nested

   menu
   end menu
';

1;
