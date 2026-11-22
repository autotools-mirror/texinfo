use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_element'} = '*document_root C1
 *before_node_section C17
  *preamble_before_content C4
   *normal_command@settitle C1 l1
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:no_element test}
     {spaces_after_argument:\\n}
   *normal_command@documentencoding C1 l2
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:ISO-8859-1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
  *normal_command@anchor C1 l5
  |identifier:{An-anchor}
  |is_target:{1}
   *brace_arg C1
    {normal_text:An anchor}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Ref to the anchor:\\n}
   *normal_command@ref C1 l8
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{An-anchor}
     {normal_text:An anchor}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Ref to the anchor in footnote:\\n}
   *normal_command@ref C1 l11
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{Anchor-in-footnote}
     {normal_text:Anchor in footnote}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@footnote C1 l13
   |global_command_number:{1}
    *brace_command_context C6
     *paragraph C1
      {normal_text:In footnote.\\n}
     {empty_line:\\n}
     *normal_command@anchor C1 l15
     |identifier:{Anchor-in-footnote}
     |is_target:{1}
      *brace_arg C1
       {normal_text:Anchor in footnote}
     {spaces_after_close_brace:\\n}
     {empty_line:\\n}
     *paragraph C3
      {normal_text:Ref to main text anchor\\n}
      *normal_command@ref C1 l18
       *brace_arg C1
       |node_content:A{0|0}
       |normalized:{An-anchor}
        {normal_text:An anchor}
      {normal_text:\\n}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@float C3 l21
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
   *normal_command@end C1 l23
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Ref to float\\n}
   *normal_command@ref C1 l26
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{float-anchor}
     {normal_text:float anchor}
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@menu C3 l28
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l29
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{An-anchor}
     {normal_text:An anchor}
    {menu_entry_separator:::                }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:menu entry pointing to the anchor.\\n}
   *normal_command@end C1 l30
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l32
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:index entry}
    {spaces_after_argument:\\n}
';


$result_texis{'no_element'} = '@settitle no_element test
@documentencoding ISO-8859-1


@anchor{An anchor}

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
';


$result_texts{'no_element'} = '


Ref to the anchor:
An anchor

Ref to the anchor in footnote:
Anchor in footnote.



float anchor
In float

Ref to float
float anchor.

* An anchor::                menu entry pointing to the anchor.

';

$result_errors{'no_element'} = '* W l32|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_floats{'no_element'} = ': 1
 F1: {float-anchor}
';

$result_nodes_list{'no_element'} = '';

$result_sections_list{'no_element'} = '';

$result_sectioning_root{'no_element'} = '';

$result_headings_list{'no_element'} = '';

$result_indices_sort_strings{'no_element'} = 'cp:
 index entry
';


$result_converted{'info'}->{'no_element'} = Encode::encode('utf-8', 'This is , produced from .

Ref to the anchor: *note An anchor::

   Ref to the anchor in footnote: *note Anchor in footnote::.

   (1)

In float

1
   Ref to float *note 1: float anchor.

* Menu:

* An anchor::                menu entry pointing to the anchor.

   ---------- Footnotes ----------

   (1) In footnote.

   Ref to main text anchor *note An anchor::


Tag Table:
Ref: An anchor27
Ref: float anchor136
Ref: Anchor in footnote319

End Tag Table


Local Variables:
coding: iso-8859-1
End:
');

$result_converted_sort_strings{'info'}->{'no_element'} = 'cp:
 index entry
';

$result_converted_errors{'info'}->{'no_element'} = '* W |document without nodes
 warning: document without nodes

* W l5|@anchor outside of any node
 warning: @anchor outside of any node

* W l13|@footnote outside of any node
 warning: @footnote outside of any node

* W l21|@float outside of any node
 warning: @float outside of any node

* W l15|@anchor outside of any node
 warning: @anchor outside of any node

';


$result_converted{'html'}->{'no_element'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>no_element test</title>

<meta name="description" content="no_element test">
<meta name="keywords" content="no_element test">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
h1.settitle {text-align:center}
</style>


</head>

<body>
<h1 class="settitle">no_element test</h1>
<hr>


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

<a class="index-entry-id" id="index-index-entry"></a>
<div class="footnotes-segment">
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



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'no_element'} = 'cp:
 index entry
';

1;
