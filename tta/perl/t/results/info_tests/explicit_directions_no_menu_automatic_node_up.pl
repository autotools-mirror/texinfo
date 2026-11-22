use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'explicit_directions_no_menu_automatic_node_up'} = '*document_root C7
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l2 {The doc}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:The doc}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:This is the documentation.\\n}
  {empty_line:\\n}
 *normal_command@node C1 l6 {Introduction}
 |added:{1}
 |identifier:{Introduction}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Introduction}
    {spaces_after_argument:\\n}
 *normal_command@unnumbered C6 l6 {Introduction}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Introduction}
    {spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:A collection of tools\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l9
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Location}
     {normal_text:Location}
    {menu_entry_separator:::          }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:Where to find\\n}
   *normal_command@end C1 l11
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l14 {Location}
 |identifier:{Location}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:Location}
   *line_arg
   *line_arg C2
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C3
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@chapter C3 l15 {Where to get}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Where to get}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Here.\\n}
';


$result_texis{'explicit_directions_no_menu_automatic_node_up'} = '@node Top
@top The doc

This is the documentation.

@node Introduction
@unnumbered Introduction
A collection of tools

@menu
* Location::          Where to find
@end menu


@node Location,, Top, Top
@chapter Where to get

Here.
';


$result_texts{'explicit_directions_no_menu_automatic_node_up'} = 'The doc
*******

This is the documentation.

Introduction
************
A collection of tools

* Location::          Where to find


1 Where to get
**************

Here.
';

$result_errors{'explicit_directions_no_menu_automatic_node_up'} = '* W l6|modifying node relations of `Top\' to reference `Introduction\'
 warning: modifying node relations of `Top\' to reference `Introduction\'

* W l10|node up pointer for `Location\' is `Top\' but up is `Introduction\' in menu
 warning: node up pointer for `Location\' is `Top\' but up is `Introduction\' in menu

';

$result_nodes_list{'explicit_directions_no_menu_automatic_node_up'} = '1|Top
 associated_section: The doc
 associated_title_command: The doc
 node_directions:
  next->Introduction
2|Introduction
 associated_section: Introduction
 associated_title_command: Introduction
 menus:
  Location
 node_directions:
  next->Location
  prev->Top
  up->Top
3|Location
 associated_section: 1 Where to get
 associated_title_command: 1 Where to get
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'explicit_directions_no_menu_automatic_node_up'} = '1|The doc
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Introduction
 section_children:
  1|Introduction
  2|Where to get
2|Introduction
 associated_anchor_command: Introduction
 associated_node: Introduction
 section_directions:
  next->Where to get
  up->The doc
 toplevel_directions:
  next->Where to get
  prev->The doc
  up->The doc
3|Where to get
 associated_anchor_command: Location
 associated_node: Location
 section_directions:
  prev->Introduction
  up->The doc
 toplevel_directions:
  prev->Introduction
  up->The doc
';

$result_sectioning_root{'explicit_directions_no_menu_automatic_node_up'} = 'level: -1
list:
 1|The doc
';

$result_headings_list{'explicit_directions_no_menu_automatic_node_up'} = '';


$result_converted{'info'}->{'explicit_directions_no_menu_automatic_node_up'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: Introduction,  Up: (dir)

The doc
*******

This is the documentation.

* Menu:

* Introduction::
* Location::

 -- The Detailed Node Listing --

Introduction

* Location::          Where to find


File: ,  Node: Introduction,  Next: Location,  Prev: Top,  Up: Top

Introduction
************

A collection of tools

* Menu:

* Location::          Where to find


File: ,  Node: Location,  Prev: Top,  Up: Top

1 Where to get
**************

Here.


Tag Table:
Node: Top27
Node: Introduction252
Node: Location418

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
