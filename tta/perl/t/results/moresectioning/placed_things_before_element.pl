use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'placed_things_before_element'} = '*document_root C2
 *before_node_section C18
  *preamble_before_content
  *normal_command@anchor C1 l1
  |identifier:{An-anchor}
  |is_target:{1}
   *brace_arg C1
    {normal_text:An anchor}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Ref to the anchor:\\n}
   *normal_command@ref C1 l4
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{An-anchor}
     {normal_text:An anchor}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Ref to the anchor in footnote:\\n}
   *normal_command@ref C1 l7
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Anchor-in-footnote}
     {normal_text:Anchor in footnote}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@footnote C1 l9
   |global_command_number:{1}
    *brace_command_context C6
     *paragraph C1
      {normal_text:In footnote.\\n}
     {empty_line:\\n}
     *normal_command@anchor C1 l11
     |identifier:{Anchor-in-footnote}
     |is_target:{1}
      *brace_arg C1
       {normal_text:Anchor in footnote}
     {spaces_after_close_brace:\\n}
     {empty_line:\\n}
     *paragraph C3
      {normal_text:Ref to main text anchor\\n}
      *normal_command@ref C1 l14
       *brace_arg C1
       |node_content:A{0|0}
       |normalized:{An-anchor}
        {normal_text:An anchor}
      {normal_text:\\n}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@float C3 l17
  |float_number:{1}
  |float_type:{}
  |global_command_number:{1}
  |identifier:{float-anchor}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C1
     {spaces_before_argument: }
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:float anchor}
     {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In float\\n}
   *normal_command@end C1 l19
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Ref to float\\n}
   *normal_command@ref C1 l22
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{float-anchor}
     {normal_text:float anchor}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l24
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l25
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{An-anchor}
     {normal_text:An anchor}
    {menu_entry_separator:::                }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:menu entry pointing to the anchor.\\n}
   *normal_command@end C1 l26
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l28
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:index entry}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@section C5 l30 {section}
 |identifier:{section}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Ref to anchor\\n}
   *normal_command@ref C1 l33
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{An-anchor}
     {normal_text:An anchor}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Ref to footnote anchor\\n}
   *normal_command@ref C1 l36
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Anchor-in-footnote}
     {normal_text:Anchor in footnote}
   {normal_text:\\n}
';


$result_texis{'placed_things_before_element'} = '@anchor{An anchor}

Ref to the anchor:
@ref{An anchor}

Ref to the anchor in footnote:
@ref{Anchor in footnote}.

@footnote{In footnote.

@anchor{Anchor in footnote}

Ref to main text anchor
@ref{An anchor}
}

@float , float anchor
In float
@end float

Ref to float
@ref{float anchor}.

@menu
* An anchor::                menu entry pointing to the anchor.
@end menu

@cindex index entry

@section section

Ref to anchor
@ref{An anchor}

Ref to footnote anchor
@ref{Anchor in footnote}
';


$result_texts{'placed_things_before_element'} = '
Ref to the anchor:
An anchor

Ref to the anchor in footnote:
Anchor in footnote.



float anchor
In float

Ref to float
float anchor.

* An anchor::                menu entry pointing to the anchor.


1 section
=========

Ref to anchor
An anchor

Ref to footnote anchor
Anchor in footnote
';

$result_errors{'placed_things_before_element'} = '* W l28|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_floats{'placed_things_before_element'} = ': 1
 F1: {float-anchor}
';

$result_nodes_list{'placed_things_before_element'} = '';

$result_sections_list{'placed_things_before_element'} = '1|section
';

$result_sectioning_root{'placed_things_before_element'} = 'level: 1
list:
 1|section
';

$result_headings_list{'placed_things_before_element'} = '';

$result_indices_sort_strings{'placed_things_before_element'} = 'cp:
 index entry
';


$result_converted{'info'}->{'placed_things_before_element'} = Encode::encode('utf-8', 'This is , produced from .

Ref to the anchor: *note An anchor::

   Ref to the anchor in footnote: *note Anchor in footnote::.

   (1)

In float

1
   Ref to float *note 1: float anchor.

* Menu:

* An anchor::                menu entry pointing to the anchor.

1 section
=========

Ref to anchor *note An anchor::

   Ref to footnote anchor *note Anchor in footnote::

   ---------- Footnotes ----------

   (1) In footnote.

   Ref to main text anchor *note An anchor::


Tag Table:
Ref: An anchor27
Ref: float anchor136
Ref: section262
Ref: Anchor in footnote427

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_sort_strings{'info'}->{'placed_things_before_element'} = 'cp:
 index entry
';

$result_converted_errors{'info'}->{'placed_things_before_element'} = '* W |document without nodes
 warning: document without nodes

* W l1|@anchor outside of any node
 warning: @anchor outside of any node

* W l9|@footnote outside of any node
 warning: @footnote outside of any node

* W l17|@float outside of any node
 warning: @float outside of any node

* W l30|@section outside of any node
 warning: @section outside of any node

* W l11|@anchor outside of any node
 warning: @anchor outside of any node

';


$result_converted{'html'}->{'placed_things_before_element'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
</style>


</head>

<body>
<a class="anchor" id="An-anchor"></a>
<p>Ref to the anchor:
<a class="ref" href="#An-anchor">An anchor</a>
</p>
<p>Ref to the anchor in footnote:
<a class="ref" href="#Anchor-in-footnote">Anchor in footnote</a>.
</p>
<p><a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>
</p>
<div class="float" id="float-anchor">
<p>In float
</p><div class="type-number-float"><p><strong class="strong">1</strong></p></div></div>
<p>Ref to float
<a class="ref" href="#float-anchor">1</a>.
</p>
<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="#An-anchor" accesskey="1">An anchor</a>:</td><td class="menu-entry-description">menu entry pointing to the anchor.
</td></tr>
</table>

<a class="index-entry-id" id="index-index-entry"></a>

<div class="section-level-extent" id="section">
<h3 class="section"><span>1 section<a class="copiable-link" href="#section"> &para;</a></span></h3>

<p>Ref to anchor
<a class="ref" href="#An-anchor">An anchor</a>
</p>
<p>Ref to footnote anchor
<a class="ref" href="#Anchor-in-footnote">Anchor in footnote</a>
</p><div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>In footnote.
</p>
<a class="anchor" id="Anchor-in-footnote"></a>
<p>Ref to main text anchor
<a class="ref" href="#An-anchor">An anchor</a>
</p>
</div>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'placed_things_before_element'} = 'cp:
 index entry
';

$result_converted_errors{'html'}->{'placed_things_before_element'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
