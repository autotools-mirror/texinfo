use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'special_docbook_unnumbered'} = '*document_root C11
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C6 l2 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
  *paragraph C1
   {This is the top.\\n}
  {empty_line:\\n}
  *@menu C6 l6
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Dedication}
    |normalized:{Dedication}
     {Dedication}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l8
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{preface}
    |normalized:{preface}
     {preface}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{colophon}
    |normalized:{colophon}
     {colophon}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{acknowledgements}
    |normalized:{acknowledgements}
     {acknowledgements}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C1 l13 {Dedication}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{Dedication}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Dedication}
 *@unnumbered C4 l14 {a dedication}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a dedication}
  {empty_line:\\n}
  *paragraph C1
   {Dedicated\\n}
  {empty_line:\\n}
 *@node C1 l18 {preface}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{preface}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {preface}
 *@unnumbered C4 l19 {The Preface}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {The Preface}
  {empty_line:\\n}
  *paragraph C1
   {Preface.\\n}
  {empty_line:\\n}
 *@node C1 l23 {colophon}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{colophon}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {colophon}
 *@unnumbered C4 l24 {A colophon}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {A colophon}
  {empty_line:\\n}
  *paragraph C1
   {Glossary\\n}
  {empty_line:\\n}
 *@node C1 l28 {acknowledgements}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{acknowledgements}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {acknowledgements}
 *@chapter C3 l29 {A chapter Acnkowledgements}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {A chapter Acnkowledgements}
  {empty_line:\\n}
  *paragraph C1
   {Ack!\\n}
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
