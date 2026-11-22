use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'shadow_links_to_sections'} = '*document_root C12
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
 *@top C2 l2 {Shadow}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Shadow}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {first}
 |EXTRA
 |identifier:{first}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
 *@chapter C4 l5 {First chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:First chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l7
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{two}
     {normal_text:two}
   {normal_text:. --- goes to one of the section named two\\n}
  {empty_line:\\n}
 *@chapter C4 l9 {foo}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:foo}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Aaaaaaaaaa.  }
   *@xref C1 l11
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{bar}
     {normal_text:bar}
   {normal_text:.\\n}
  {empty_line:\\n}
 *@chapter C4 l13 {bar}
 |EXTRA
 |identifier:{bar}
 |is_target:{1}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:bar}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Bbbbbbbbbbb.  }
   *@xref C1 l15
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{foo}
     {normal_text:foo}
   {normal_text:. -- goes to baz chapter.\\n}
  {empty_line:\\n}
 *@section C6 l17 {two}
 |EXTRA
 |identifier:{two}
 |is_target:{1}
 |section_heading_number:{3.1}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:two}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:CCCCCCC.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l21
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{baz}
     {normal_text:baz}
   {normal_text:. --- fails\\n}
  {empty_line:\\n}
 *@node C1 l23 {foo}
 |EXTRA
 |identifier:{foo}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:foo}
    {spaces_after_argument:\\n}
 *@chapter C4 l24 {baz}
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:baz}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:LLLLLLLLLLL.\\n}
  {empty_line:\\n}
 *@section C4 l28 {two}
 |EXTRA
 |section_heading_number:{4.1}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:two}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:DDDDDDDDD.\\n}
  {empty_line:\\n}
 *@section C5 l32 {with @ref{foo, b} after}
 |EXTRA
 |identifier:{with-foo-after}
 |is_target:{1}
 |section_heading_number:{4.2}
 |section_level:{2}
 |section_number:{8}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:with }
    *@ref C2 l32
     *brace_arg C1
     |EXTRA
     |node_content:A{0|0}
     |normalized:{foo}
      {normal_text:foo}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:b}
    {normal_text: after}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@xref C1 l34
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{with-foo-after}
     {normal_text:with foo after}
   {normal_text:. --- link to section with }
   *@@
   {normal_text:ref in name\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l36
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{two}
     {normal_text:two}
   {normal_text:. --- another link to a section named two.\\n}
';


$result_texis{'shadow_links_to_sections'} = '@node Top
@top Shadow

@node first
@chapter First chap

@xref{two}. --- goes to one of the section named two

@chapter foo

Aaaaaaaaaa.  @xref{bar}.

@chapter bar

Bbbbbbbbbbb.  @xref{foo}. -- goes to baz chapter.

@section two

CCCCCCC.

@xref{baz}. --- fails

@node foo
@chapter baz

LLLLLLLLLLL.

@section two

DDDDDDDDD.

@section with @ref{foo, b} after

@xref{with foo after}. --- link to section with @@ref in name

@xref{two}. --- another link to a section named two.
';


$result_texts{'shadow_links_to_sections'} = 'Shadow
******

1 First chap
************

two. -- goes to one of the section named two

2 foo
*****

Aaaaaaaaaa.  bar.

3 bar
*****

Bbbbbbbbbbb.  foo. - goes to baz chapter.

3.1 two
=======

CCCCCCC.

baz. -- fails

4 baz
*****

LLLLLLLLLLL.

4.1 two
=======

DDDDDDDDD.

4.2 with foo after
==================

with foo after. -- link to section with @ref in name

two. -- another link to a section named two.
';

$result_errors{'shadow_links_to_sections'} = '* W l28|@section `two\' already added target
 warning: @section `two\' already added target

* WC l17|added for @section
 warning: added for @section

* E l21|@xref reference to nonexistent node `baz\'
 @xref reference to nonexistent node `baz\'

* W l34|@xref to `with foo after\', different from section name `with @ref{foo, b} after\'
 warning: @xref to `with foo after\', different from section name `with @ref{foo, b} after\'

';

$result_nodes_list{'shadow_links_to_sections'} = '1|Top
 associated_section: Shadow
 associated_title_command: Shadow
 node_directions:
  next->first
2|first
 associated_section: 1 First chap
 associated_title_command: 1 First chap
 node_directions:
  prev->Top
  up->Top
3|foo
 associated_section: 4 baz
 associated_title_command: 4 baz
 node_directions:
  up->Top
';

$result_sections_list{'shadow_links_to_sections'} = '1|Shadow
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->First chap
 section_children:
  1|First chap
  2|foo
  3|bar
  4|baz
2|First chap
 associated_anchor_command: first
 associated_node: first
 section_directions:
  next->foo
  up->Shadow
 toplevel_directions:
  next->foo
  prev->Shadow
  up->Shadow
3|foo
 section_directions:
  next->bar
  prev->First chap
  up->Shadow
 toplevel_directions:
  next->bar
  prev->First chap
  up->Shadow
4|bar
 section_directions:
  next->baz
  prev->foo
  up->Shadow
 toplevel_directions:
  next->baz
  prev->foo
  up->Shadow
 section_children:
  1|two
5|two
 section_directions:
  up->bar
6|baz
 associated_anchor_command: foo
 associated_node: foo
 section_directions:
  prev->bar
  up->Shadow
 toplevel_directions:
  prev->bar
  up->Shadow
 section_children:
  1|two
  2|with @ref{foo, b} after
7|two
 section_directions:
  next->with @ref{foo, b} after
  up->baz
8|with @ref{foo, b} after
 section_directions:
  prev->two
  up->baz
';

$result_sectioning_root{'shadow_links_to_sections'} = 'level: -1
list:
 1|Shadow
';

$result_headings_list{'shadow_links_to_sections'} = '';

1;
