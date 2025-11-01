use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'things_before_setfilename_no_element'} = '*document_root C1
 *before_node_section C6
  *preamble_before_setfilename C26
   *preamble_before_beginning C2
    {text_before_beginning:\\input texinfo\\n}
    {text_before_beginning:\\n}
   *@anchor C1 things_before_setfilename_no_element.texi:l3
   |EXTRA
   |is_target:{1}
   |normalized:{An-anchor}
    *brace_arg C1
     {An anchor}
   {spaces_after_close_brace:\\n}
   {empty_line:\\n}
   *paragraph C3
    {Ref to the anchor:\\n}
    *@ref C1 things_before_setfilename_no_element.texi:l6
     *brace_arg C1
     |EXTRA
     |node_content:{An anchor}
     |normalized:{An-anchor}
      {An anchor}
    {\\n}
   {empty_line:\\n}
   *paragraph C3
    {Ref to the anchor in footnote:\\n}
    *@ref C1 things_before_setfilename_no_element.texi:l9
     *brace_arg C1
     |EXTRA
     |node_content:{Anchor in footnote}
     |normalized:{Anchor-in-footnote}
      {Anchor in footnote}
    {.\\n}
   {empty_line:\\n}
   *paragraph C2
    *@footnote C1 things_before_setfilename_no_element.texi:l11
    |EXTRA
    |global_command_number:{1}
     *brace_command_context C6
      *paragraph C1
       {In footnote.\\n}
      {empty_line:\\n}
      *@anchor C1 things_before_setfilename_no_element.texi:l13
      |EXTRA
      |is_target:{1}
      |normalized:{Anchor-in-footnote}
       *brace_arg C1
        {Anchor in footnote}
      {spaces_after_close_brace:\\n}
      {empty_line:\\n}
      *paragraph C3
       {Ref to main text anchor\\n}
       *@ref C1 things_before_setfilename_no_element.texi:l16
        *brace_arg C1
        |EXTRA
        |node_content:{An anchor}
        |normalized:{An-anchor}
         {An anchor}
       {\\n}
    {\\n}
   {empty_line:\\n}
   *@float C3 things_before_setfilename_no_element.texi:l19
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
    *@end C1 things_before_setfilename_no_element.texi:l21
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
    *@ref C1 things_before_setfilename_no_element.texi:l24
     *brace_arg C1
     |EXTRA
     |node_content:{float anchor}
     |normalized:{float-anchor}
      {float anchor}
    {.\\n}
   {empty_line:\\n}
   *@float C6 things_before_setfilename_no_element.texi:l26
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |float_number:{1}
   |float_type:{Text}
   |global_command_number:{2}
   |is_target:{1}
   |normalized:{ta}
    *arguments_line C2
     *block_line_arg C1
      {Text}
     *block_line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
     |spaces_before_argument:
      |{spaces_before_argument: }
      {ta}
    *paragraph C1
     {In float\\n}
    {empty_line:\\n}
    *@caption C1 things_before_setfilename_no_element.texi:l29
     *brace_command_context C1
      *paragraph C1
       {ta caption}
    {spaces_after_close_brace:\\n}
    *@end C1 things_before_setfilename_no_element.texi:l30
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
   *@contents C1 things_before_setfilename_no_element.texi:l32
   |EXTRA
   |global_command_number:{1}
    *line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
   *@menu C3 things_before_setfilename_no_element.texi:l34
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *menu_entry C4 things_before_setfilename_no_element.texi:l35
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
    *@end C1 things_before_setfilename_no_element.texi:l36
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
   *index_entry_command@cindex C1 things_before_setfilename_no_element.texi:l38
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
   {empty_line:\\n}
   *@printindex C1 things_before_setfilename_no_element.texi:l40
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |misc_args:A{cp}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cp}
   {empty_line:\\n}
   *@listoffloats C1 things_before_setfilename_no_element.texi:l42
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |float_type:{Text}
   |global_command_number:{1}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {Text}
   {empty_line:\\n}
  *preamble_before_content C2
   *@setfilename C1 things_before_setfilename_no_element.texi:l44
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{things_before_setfilename_no_element.info}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: \\n}
     {things_before_setfilename_no_element.info}
   {empty_line:\\n}
  *paragraph C3
   {Ref to anchor\\n}
   *@ref C1 things_before_setfilename_no_element.texi:l47
    *brace_arg C1
    |EXTRA
    |node_content:{An anchor}
    |normalized:{An-anchor}
     {An anchor}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {Ref to footnote anchor\\n}
   *@ref C1 things_before_setfilename_no_element.texi:l50
    *brace_arg C1
    |EXTRA
    |node_content:{Anchor in footnote}
    |normalized:{Anchor-in-footnote}
     {Anchor in footnote}
   {\\n}
  {empty_line:\\n}
';


$result_texis{'things_before_setfilename_no_element'} = '\\input texinfo

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

@float Text, ta
In float

@caption{ta caption}
@end float

@contents

@menu
* An anchor::                menu entry pointing to the anchor.
@end menu

@cindex index entry

@printindex cp

@listoffloats Text

@setfilename things_before_setfilename_no_element.info 

Ref to anchor
@ref{An anchor}

Ref to footnote anchor
@ref{Anchor in footnote}

';


$result_texts{'things_before_setfilename_no_element'} = '
Ref to anchor
An anchor

Ref to footnote anchor
Anchor in footnote

';

$result_errors{'things_before_setfilename_no_element'} = '* W things_before_setfilename_no_element.texi:l38|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

* W things_before_setfilename_no_element.texi:l40|printindex before document beginning: @printindex cp
 warning: printindex before document beginning: @printindex cp

';

$result_floats{'things_before_setfilename_no_element'} = ': 1
 F1: {float-anchor}
Text: 1
 F1: {ta}
  C: ta caption
';

$result_nodes_list{'things_before_setfilename_no_element'} = '';

$result_sections_list{'things_before_setfilename_no_element'} = '';

$result_sectioning_root{'things_before_setfilename_no_element'} = '';

$result_headings_list{'things_before_setfilename_no_element'} = '';

$result_indices_sort_strings{'things_before_setfilename_no_element'} = 'cp:
 index entry
';


$result_converted{'plaintext'}->{'things_before_setfilename_no_element'} = 'Ref to anchor An anchor

   Ref to footnote anchor Anchor in footnote

';


$result_converted{'html'}->{'things_before_setfilename_no_element'} = '<!DOCTYPE html>
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



</head>

<body lang="">

<p>Ref to anchor
<a class="ref" href="#An-anchor">An anchor</a>
</p>
<p>Ref to footnote anchor
<a class="ref" href="#Anchor-in-footnote">Anchor in footnote</a>
</p>



</body>
</html>
';

$result_converted_errors{'html'}->{'things_before_setfilename_no_element'} = '* W things_before_setfilename_no_element.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'things_before_setfilename_no_element'} = '<preamblebeforebeginning>\\input texinfo

</preamblebeforebeginning><anchor identifier="An-anchor">An anchor</anchor>

<para>Ref to the anchor:
<ref label="An-anchor"><xrefnodename>An anchor</xrefnodename></ref>
</para>
<para>Ref to the anchor in footnote:
<ref label="Anchor-in-footnote"><xrefnodename>Anchor in footnote</xrefnodename></ref>.
</para>
<para><footnote><para>In footnote.
</para>
<anchor identifier="Anchor-in-footnote">Anchor in footnote</anchor>

<para>Ref to main text anchor
<ref label="An-anchor"><xrefnodename>An anchor</xrefnodename></ref>
</para></footnote>
</para>
<float identifier="float-anchor" type="" number="1" spaces=" " endspaces=" "><floatname spaces=" ">float anchor</floatname>
<para>In float
</para></float>

<para>Ref to float
<ref label="float-anchor"><xrefnodename>float anchor</xrefnodename></ref>.
</para>
<float identifier="ta" type="Text" number="1" spaces=" " endspaces=" "><floattype>Text</floattype><floatname spaces=" ">ta</floatname>
<para>In float
</para>
<caption><para>ta caption</para></caption>
</float>

<contents></contents>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>An anchor</menunode><menuseparator>::                </menuseparator><menudescription><pre xml:space="preserve">menu entry pointing to the anchor.
</pre></menudescription></menuentry></menu>

<cindex index="cp" spaces=" "><indexterm index="cp" number="1">index entry</indexterm></cindex>

<printindex spaces=" " value="cp" line="cp"></printindex>

<listoffloats type="Text" spaces=" ">Text</listoffloats>

<setfilename file="things_before_setfilename_no_element.info" spaces=" ">things_before_setfilename_no_element.info </setfilename>

<para>Ref to anchor
<ref label="An-anchor"><xrefnodename>An anchor</xrefnodename></ref>
</para>
<para>Ref to footnote anchor
<ref label="Anchor-in-footnote"><xrefnodename>Anchor in footnote</xrefnodename></ref>
</para>
';


$result_converted{'docbook'}->{'things_before_setfilename_no_element'} = '
<para>Ref to anchor
<link linkend="An-anchor">An anchor</link>
</para>
<para>Ref to footnote anchor
<link linkend="Anchor-in-footnote">Anchor in footnote</link>
</para>
';


$result_converted{'latex_text'}->{'things_before_setfilename_no_element'} = '
\\begin{document}
Ref to anchor
\\hyperref[anchor:An-anchor]{[An anchor], page~\\pageref*{anchor:An-anchor}}

Ref to footnote anchor
\\hyperref[anchor:Anchor-in-footnote]{[Anchor in footnote], page~\\pageref*{anchor:Anchor-in-footnote}}

';


$result_converted{'info'}->{'things_before_setfilename_no_element'} = 'This is things_before_setfilename_no_element.info, produced from
things_before_setfilename_no_element.texi.

Ref to anchor *note An anchor::

   Ref to footnote anchor *note Anchor in footnote::


Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'things_before_setfilename_no_element'} = '* W things_before_setfilename_no_element.texi|document without nodes
 warning: document without nodes

';

1;
