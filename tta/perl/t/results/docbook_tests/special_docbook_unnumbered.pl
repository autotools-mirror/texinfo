use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'special_docbook_unnumbered'} = '*document_root C11
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C6 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:This is the top.\\n}
  {empty_line:\\n}
  *@menu C6 l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{Dedication}
     {normal_text:Dedication}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{preface}
     {normal_text:preface}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{colophon}
     {normal_text:colophon}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{acknowledgements}
     {normal_text:acknowledgements}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l13 {Dedication}
 |EXTRA
 |identifier:{Dedication}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Dedication}
    {spaces_after_argument:\\n}
 *@unnumbered C4 l14 {a dedication}
 |EXTRA
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a dedication}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Dedicated\\n}
  {empty_line:\\n}
 *@node C1 l18 {preface}
 |EXTRA
 |identifier:{preface}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:preface}
    {spaces_after_argument:\\n}
 *@unnumbered C4 l19 {The Preface}
 |EXTRA
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:The Preface}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Preface.\\n}
  {empty_line:\\n}
 *@node C1 l23 {colophon}
 |EXTRA
 |identifier:{colophon}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:colophon}
    {spaces_after_argument:\\n}
 *@unnumbered C4 l24 {A colophon}
 |EXTRA
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A colophon}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Glossary\\n}
  {empty_line:\\n}
 *@node C1 l28 {acknowledgements}
 |EXTRA
 |identifier:{acknowledgements}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:acknowledgements}
    {spaces_after_argument:\\n}
 *@chapter C3 l29 {A chapter Acnkowledgements}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A chapter Acnkowledgements}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Ack!\\n}
';


$result_texis{'special_docbook_unnumbered'} = '@node Top
@top top

This is the top.

@menu
* Dedication::
* preface::
* colophon::
* acknowledgements::
@end menu

@node Dedication
@unnumbered a dedication

Dedicated

@node preface
@unnumbered The Preface

Preface.

@node colophon
@unnumbered A colophon

Glossary

@node acknowledgements
@chapter A chapter Acnkowledgements

Ack!
';


$result_texts{'special_docbook_unnumbered'} = 'top
***

This is the top.

* Dedication::
* preface::
* colophon::
* acknowledgements::

a dedication
************

Dedicated

The Preface
***********

Preface.

A colophon
**********

Glossary

1 A chapter Acnkowledgements
****************************

Ack!
';

$result_errors{'special_docbook_unnumbered'} = '';

$result_nodes_list{'special_docbook_unnumbered'} = '1|Top
 associated_section: top
 associated_title_command: top
 menus:
  Dedication
  preface
  colophon
  acknowledgements
 node_directions:
  next->Dedication
2|Dedication
 associated_section: a dedication
 associated_title_command: a dedication
 node_directions:
  next->preface
  prev->Top
  up->Top
3|preface
 associated_section: The Preface
 associated_title_command: The Preface
 node_directions:
  next->colophon
  prev->Dedication
  up->Top
4|colophon
 associated_section: A colophon
 associated_title_command: A colophon
 node_directions:
  next->acknowledgements
  prev->preface
  up->Top
5|acknowledgements
 associated_section: 1 A chapter Acnkowledgements
 associated_title_command: 1 A chapter Acnkowledgements
 node_directions:
  prev->colophon
  up->Top
';

$result_sections_list{'special_docbook_unnumbered'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->a dedication
 section_children:
  1|a dedication
  2|The Preface
  3|A colophon
  4|A chapter Acnkowledgements
2|a dedication
 associated_anchor_command: Dedication
 associated_node: Dedication
 section_directions:
  next->The Preface
  up->top
 toplevel_directions:
  next->The Preface
  prev->top
  up->top
3|The Preface
 associated_anchor_command: preface
 associated_node: preface
 section_directions:
  next->A colophon
  prev->a dedication
  up->top
 toplevel_directions:
  next->A colophon
  prev->a dedication
  up->top
4|A colophon
 associated_anchor_command: colophon
 associated_node: colophon
 section_directions:
  next->A chapter Acnkowledgements
  prev->The Preface
  up->top
 toplevel_directions:
  next->A chapter Acnkowledgements
  prev->The Preface
  up->top
5|A chapter Acnkowledgements
 associated_anchor_command: acknowledgements
 associated_node: acknowledgements
 section_directions:
  prev->A colophon
  up->top
 toplevel_directions:
  prev->A colophon
  up->top
';

$result_sectioning_root{'special_docbook_unnumbered'} = 'level: -1
list:
 1|top
';

$result_headings_list{'special_docbook_unnumbered'} = '';


$result_converted{'docbook'}->{'special_docbook_unnumbered'} = '<dedication id="Dedication">
<title>a dedication</title>

<para>Dedicated
</para>
</dedication>
<preface id="preface">
<title>The Preface</title>

<para>Preface.
</para>
</preface>
<colophon id="colophon">
<title>A colophon</title>

<para>Glossary
</para>
</colophon>
<chapter label="1" id="acknowledgements">
<title>A chapter Acnkowledgements</title>

<para>Ack!
</para></chapter>
';

1;
