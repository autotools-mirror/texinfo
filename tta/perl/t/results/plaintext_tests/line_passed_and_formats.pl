use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'line_passed_and_formats'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C53 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C4 l3
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {special}
     {spaces_after_argument:\\n}
   *paragraph C1
    {Quotation special.\\n}
   *@quotation C3 l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument: \\n}
    *paragraph C2
     {Nested quotation sdflkmsfdlkmfsdqmlkfsdq mlfdsqlkmfdsqmlkfdsq klm fsqdlkmfdsq\\n}
     {fdsfsdqmlkfsqd m lqlkmf qskmlfq sklm fqds\\n}
    *@end C1 l8
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {quotation}
      {spaces_after_argument:\\n}
   *@end C1 l9
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C4 l11
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {quotation  text\\n}
   *@example C3 l13
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {example in   quotation\\n}
    *@end C1 l15
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {example}
      {spaces_after_argument:\\n}
   *@end C1 l16
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@example C4 l18
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    { In  example.\\n}
   *@quotation C3 l20
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {   In quotation   in example\\n}
    *@end C1 l22
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {quotation}
      {spaces_after_argument:\\n}
   *@end C1 l23
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@example C3 l25
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {In 1 example\\n}
   *@end C1 l27
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
  *@example C3 l28
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {In 2 example\\n}
   *@end C1 l30
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C3 l32
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {In 1 quotation\\n}
   *@end C1 l34
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
  *@quotation C3 l35
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {In 2 quotation\\n}
   *@end C1 l37
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C5 l39
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument: \\n}
   *paragraph C1
    {Quotation\\n}
   *@quotation C3 l41
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument: \\n}
    *paragraph C1
     {Nested quotation\\n}
    *@end C1 l43
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {quotation}
      {spaces_after_argument:\\n}
   *paragraph C1
    {Quotation 2\\n}
   *@end C1 l45
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@example C5 l47
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {In  example.\\n}
   *@quotation C3 l49
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {In quotation   in example\\n}
    *@end C1 l51
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {quotation}
      {spaces_after_argument:\\n}
   *preformatted C1
    {In  example 2.\\n}
   *@end C1 l53
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C5 l55
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {quotation  text\\n}
   *@example C3 l57
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {example in   quotation\\n}
    *@end C1 l59
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {example}
      {spaces_after_argument:\\n}
   *paragraph C1
    {quotation  text 2\\n}
   *@end C1 l61
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Before quotation\\n}
  *@quotation C3 l64
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C1
    {quotation  text\\n}
   *@end C1 l66
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
  *paragraph C1
   {after end\\n}
  {empty_line:\\n}
  *paragraph C1
   {Before example\\n}
  *@example C3 l70
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {In example\\n}
   *@end C1 l72
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
  *paragraph C1
   {After example\\n}
  {empty_line:\\n}
  *paragraph C1
   {Before quotation and empty line\\n}
  *@quotation C5 l76
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {In quotation\\n}
   {empty_line:\\n}
   *@end C1 l80
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
  *paragraph C1
   {After quotation\\n}
  {empty_line:\\n}
  *paragraph C1
   {Before example and empty line\\n}
  *@example C3 l84
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C3
    {empty_line:\\n}
    {In example\\n}
    {empty_line:\\n}
   *@end C1 l88
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
  *paragraph C1
   {After example\\n}
  {empty_line:\\n}
  *paragraph C1
   {Nested and empty lines\\n}
  {empty_line:\\n}
  *paragraph C1
   {Quotation empty out, spaces inside\\n}
  *@quotation C5 l94
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *@quotation C5 l96
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    {empty_line:\\n}
    *paragraph C1
     {In nested\\n}
    {empty_line:\\n}
    *@end C1 l100
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {quotation}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@end C1 l102
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Quotation empty out, no spaces inside\\n}
  *@quotation C5 l105
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
   *@quotation C3 l107
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {In nested\\n}
    *@end C1 l109
    |EXTRA
    |text_arg:{quotation}
     *line_arg C3
      {spaces_before_argument: }
      {quotation}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@end C1 l111
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Example empty out, spaces inside\\n}
  *@example C5 l114
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *@example C3 l116
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C3
     {empty_line:\\n}
     {In nested\\n}
     {empty_line:\\n}
    *@end C1 l120
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {example}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *@end C1 l122
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {Example empty out, no spaces inside\\n}
  *@example C5 l125
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *@example C3 l127
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C1
     {In nested\\n}
    *@end C1 l129
    |EXTRA
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {example}
      {spaces_after_argument:\\n}
   *preformatted C1
    {empty_line:\\n}
   *@end C1 l131
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {menu\\n}
  *@menu C3 l134
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l135
    {menu_entry_leading_text:* }
    *menu_entry_node C4
    |EXTRA
    |manual_content:A{1|1}
    |node_content:A{3|3}
    |normalized:{node}
     {(}
     {manual}
     {)}
     {node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l136
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
  *paragraph C1
   {end menu\\n}
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
