use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'submenu_in_example'} = '*document_root C2
 *before_node_section
 *@node C3 l1 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first}
  {empty_line:\\n}
  *@example C4 l3
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C3
    {empty_line:\\n}
    {in example\\n}
    {empty_line:\\n}
   *@menu C9 l7
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    *menu_comment C1
     *preformatted C2
      {in submenu\\n}
      {empty_line:\\n}
    *@menu C2 l10
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
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
    *menu_comment C1
     *preformatted C1
      {empty_line:\\n}
    *@menu C3 l13
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *menu_comment C1
      *preformatted C1
       {in submenu\\n}
     *@end C1 l15
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
    *menu_comment C1
     *preformatted C1
      {empty_line:\\n}
    *@menu C3 l17
     *arguments_line C1
      *block_line_arg
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
     *menu_comment C1
      *@quotation C3 l18
       *arguments_line C1
        *block_line_arg
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
       *preformatted C1
        {A quot---ation in submenu\\n}
       *@end C1 l20
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |text_arg:{quotation}
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {quotation}
     *@end C1 l21
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
    *menu_comment C5
     *preformatted C1
      {empty_line:\\n}
     *@subheading C1 l23
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |global_command_number:{1}
     |heading_number:{1}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {subheading in menu}
     *preformatted C1
      {empty_line:\\n}
     *@enumerate C3 l25
      *arguments_line C1
       *block_line_arg
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
      *@item C1 l26
      |EXTRA
      |item_number:{1}
       *preformatted C2
        {ignorable_spaces_after_command: }
        {e--numerate\\n}
      *@end C1 l27
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{enumerate}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {enumerate}
     *preformatted C1
      {empty_line:\\n}
    *@end C1 l29
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
   *@end C1 l30
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
';


$result_texis{'submenu_in_example'} = '@node first

@example

in example

@menu
in submenu

@menu
@end menu

@menu
in submenu
@end menu

@menu
@quotation
A quot---ation in submenu
@end quotation
@end menu

@subheading subheading in menu

@enumerate
@item e--numerate
@end enumerate

@end menu
@end example
';


$result_texts{'submenu_in_example'} = '

in example

in submenu


in submenu

A quot---ation in submenu

subheading in menu
------------------

1. e--numerate

';

$result_errors{'submenu_in_example'} = '* W l7|@menu in invalid context
 warning: @menu in invalid context

* W l10|@menu in invalid context
 warning: @menu in invalid context

* W l13|@menu in invalid context
 warning: @menu in invalid context

* W l17|@menu in invalid context
 warning: @menu in invalid context

';

$result_nodes_list{'submenu_in_example'} = '1|first
 associated_title_command: @subheading subheading in menu
';

$result_sections_list{'submenu_in_example'} = '';

$result_sectioning_root{'submenu_in_example'} = '';

$result_headings_list{'submenu_in_example'} = '1|subheading in menu
 associated_anchor_command: first
';


$result_converted{'plaintext'}->{'submenu_in_example'} = '
     in example

* Menu:

     in submenu

* Menu:


* Menu:

     in submenu

* Menu:

          A quot--ation in submenu

     subheading in menu
     ------------------


       1. e-numerate

';


$result_converted{'html'}->{'submenu_in_example'} = '<!DOCTYPE html>
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

<link href="#first" rel="start" title="first">
<style type="text/css">
div.example {margin-left: 3.2em}
pre.menu-comment-preformatted {font-family: serif}
</style>


</head>

<body lang="">
<a class="node" id="first"></a>
<div class="example">
<pre class="example-preformatted">

in example

</pre><table class="menu"><tr><td>
<pre class="menu-comment-preformatted">in submenu

</pre><pre class="menu-comment-preformatted">

</pre><table class="menu"><tr><td>
<pre class="menu-comment-preformatted">in submenu
</pre></td></tr></table>
<pre class="menu-comment-preformatted">

</pre><table class="menu"><tr><td>
<blockquote class="quotation">
<pre class="menu-comment-preformatted">A quot---ation in submenu
</pre></blockquote>
</td></tr></table>
<pre class="menu-comment-preformatted">

</pre><strong class="subheading" id="subheading-in-menu">subheading in menu</strong>
<pre class="menu-comment-preformatted">

</pre><ol class="enumerate">
<li> <pre class="menu-comment-preformatted">e--numerate
</pre></li></ol>
<pre class="menu-comment-preformatted">

</pre></td></tr></table>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'submenu_in_example'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'submenu_in_example'} = '<node identifier="first" spaces=" "><nodename>first</nodename></node>

<example endspaces=" ">
<pre xml:space="preserve">
in example

</pre><menu endspaces=" ">
<menucomment><pre xml:space="preserve">in submenu

</pre></menucomment><menu endspaces=" ">
</menu>
<menucomment><pre xml:space="preserve">
</pre></menucomment><menu endspaces=" ">
<menucomment><pre xml:space="preserve">in submenu
</pre></menucomment></menu>
<menucomment><pre xml:space="preserve">
</pre></menucomment><menu endspaces=" ">
<menucomment><quotation endspaces=" ">
<pre xml:space="preserve">A quot---ation in submenu
</pre></quotation>
</menucomment></menu>
<menucomment><pre xml:space="preserve">
</pre><subheading spaces=" ">subheading in menu</subheading>
<pre xml:space="preserve">
</pre><enumerate first="1" endspaces=" ">
<listitem><pre xml:space="preserve"> e--numerate
</pre></listitem></enumerate>
<pre xml:space="preserve">
</pre></menucomment></menu>
</example>
';

1;
