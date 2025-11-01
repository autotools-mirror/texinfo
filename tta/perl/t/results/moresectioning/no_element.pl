use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'no_element'} = '*document_root C1
 *before_node_section C20
  *@settitle C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {no_element test}
  *@documentencoding C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |input_encoding_name:{iso-8859-1}
  |text_arg:{ISO-8859-1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ISO-8859-1}
  {empty_line:\\n}
  {empty_line:\\n}
  *@anchor C1 l5
  |EXTRA
  |is_target:{1}
  |normalized:{An-anchor}
   *brace_arg C1
    {An anchor}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
  *paragraph C3
   {Ref to the anchor:\\n}
   *@ref C1 l8
    *brace_arg C1
    |EXTRA
    |node_content:{An anchor}
    |normalized:{An-anchor}
     {An anchor}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {Ref to the anchor in footnote:\\n}
   *@ref C1 l11
    *brace_arg C1
    |EXTRA
    |node_content:{Anchor in footnote}
    |normalized:{Anchor-in-footnote}
     {Anchor in footnote}
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@footnote C1 l13
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C6
     *paragraph C1
      {In footnote.\\n}
     {empty_line:\\n}
     *@anchor C1 l15
     |EXTRA
     |is_target:{1}
     |normalized:{Anchor-in-footnote}
      *brace_arg C1
       {Anchor in footnote}
     {spaces_after_close_brace:\\n}
     {empty_line:\\n}
     *paragraph C3
      {Ref to main text anchor\\n}
      *@ref C1 l18
       *brace_arg C1
       |EXTRA
       |node_content:{An anchor}
       |normalized:{An-anchor}
        {An anchor}
      {\\n}
   {\\n}
  {empty_line:\\n}
  *@float C3 l21
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_number:{1}
  |float_type:{}
  |global_command_number:{1}
  |is_target:{1}
  |normalized:{float-anchor}
   *arguments_line C2
    *block_line_arg
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
    |spaces_before_argument:
     |{spaces_before_argument: }
     {float anchor}
   *paragraph C1
    {In float\\n}
   *@end C1 l23
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{float}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {float}
  {empty_line:\\n}
  *paragraph C3
   {Ref to float\\n}
   *@ref C1 l26
    *brace_arg C1
    |EXTRA
    |node_content:{float anchor}
    |normalized:{float-anchor}
     {float anchor}
   {.\\n}
  {empty_line:\\n}
  *@menu C3 l28
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l29
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{An anchor}
    |normalized:{An-anchor}
     {An anchor}
    {menu_entry_separator:::                }
    *menu_entry_description C1
     *preformatted C1
      {menu entry pointing to the anchor.\\n}
   *@end C1 l30
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
  *index_entry_command@cindex C1 l32
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {index entry}
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


$result_converted{'info'}->{'no_element'} = 'This is , produced from .

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
Ref: An anchor0
Ref: float anchor109
Ref: Anchor in footnote292

End Tag Table


Local Variables:
coding: iso-8859-1
End:
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

<body lang="">
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

1;
