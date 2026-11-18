use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'menu'} = '*document_root C3
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 l2 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C3 l3
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *@menu C10 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:A{1|1}
     {(}
     {ggg}
     {)}
    {menu_entry_separator::: }
    *menu_entry_description C3
     *preformatted C1
      {description\\n}
     *@itemize C3 l7
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *@item C1 l8
      |EXTRA
      |item_number:{1}
       *preformatted C2
        {ignorable_spaces_after_command: }
        {idescr\\n}
      *@end C1 l9
      |EXTRA
      |text_arg:{itemize}
       *line_arg C3
        {spaces_before_argument: }
        {itemize}
        {spaces_after_argument:\\n}
     *preformatted C2
      *@html C3 l10
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *rawpreformatted C1
        {in html\\n}
       *@end C1 l12
       |EXTRA
       |text_arg:{html}
        *line_arg C3
         {spaces_before_argument: }
         {html}
         {spaces_after_argument:\\n}
      {AAA\\n}
   *menu_comment C4
    *preformatted C3
     {after_menu_description_line:\\n}
     {CCC\\n}
     {empty_line:\\n}
    *@itemize C3 l17
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *@item C1 l18
     |EXTRA
     |item_number:{1}
      *preformatted C2
       {ignorable_spaces_after_command: }
       {iaa\\n}
     *@end C1 l19
     |EXTRA
     |text_arg:{itemize}
      *line_arg C3
       {spaces_before_argument: }
       {itemize}
       {spaces_after_argument:\\n}
    *preformatted C5
     {empty_line:\\n}
     *@html C3 l21
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *rawpreformatted C1
       {in html title\\n}
      *@end C1 l23
      |EXTRA
      |text_arg:{html}
       *line_arg C3
        {spaces_before_argument: }
        {html}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
     {BBB\\n}
     {empty_line:\\n}
    *@itemize C3 l27
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *@item C1 l28
     |EXTRA
     |item_number:{1}
      *preformatted C2
       {ignorable_spaces_after_command: }
       {ibb\\n}
     *@end C1 l29
     |EXTRA
     |text_arg:{itemize}
      *line_arg C3
       {spaces_before_argument: }
       {itemize}
       {spaces_after_argument:\\n}
   *menu_entry C4 l30
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:A{1|1}
     {(}
     {manual}
     {)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_comment C1
    *preformatted C3
     {after_menu_description_line:\\n}
     {comment\\n}
     {empty_line:\\n}
   *menu_entry C4 l34
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:A{1|1}
     {(}
     {after_comment}
     {)}
    {menu_entry_separator::: }
    *menu_entry_description C1
     *preformatted C2
      {description\\n}
      {in description\\n}
   *menu_entry C4 l36
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |manual_content:A{1|1}
     {(}
     {after_description}
     {)}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *@detailmenu C9 l38
   |EXTRA
   |global_command_number:{1}
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *menu_entry C4 l39
     {menu_entry_leading_text:* }
     *menu_entry_node C3
     |EXTRA
     |manual_content:A{1|1}
      {(}
      {detailggg}
      {)}
     {menu_entry_separator::: }
     *menu_entry_description C3
      *preformatted C1
       {detaildescription\\n}
      *@itemize C3 l40
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *@item C1 l41
       |EXTRA
       |item_number:{1}
        *preformatted C2
         {ignorable_spaces_after_command: }
         {idetaildescr\\n}
       *@end C1 l42
       |EXTRA
       |text_arg:{itemize}
        *line_arg C3
         {spaces_before_argument: }
         {itemize}
         {spaces_after_argument:\\n}
      *preformatted C2
       *@html C3 l43
        *arguments_line C1
         *block_line_arg C1
          {spaces_before_argument:\\n}
        *rawpreformatted C1
         {detailin detailhtml\\n}
        *@end C1 l45
        |EXTRA
        |text_arg:{html}
         *line_arg C3
          {spaces_before_argument: }
          {html}
          {spaces_after_argument:\\n}
       {detailAAA\\n}
    *menu_comment C4
     *preformatted C3
      {after_menu_description_line:\\n}
      {detailCCC\\n}
      {empty_line:\\n}
     *@itemize C3 l50
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *@item C1 l51
      |EXTRA
      |item_number:{1}
       *preformatted C2
        {ignorable_spaces_after_command: }
        {detailiaa\\n}
      *@end C1 l52
      |EXTRA
      |text_arg:{itemize}
       *line_arg C3
        {spaces_before_argument: }
        {itemize}
        {spaces_after_argument:\\n}
     *preformatted C5
      {empty_line:\\n}
      *@html C3 l54
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *rawpreformatted C1
        {detailin html detailtitle\\n}
       *@end C1 l56
       |EXTRA
       |text_arg:{html}
        *line_arg C3
         {spaces_before_argument: }
         {html}
         {spaces_after_argument:\\n}
      {empty_line:\\n}
      {detailBBB\\n}
      {empty_line:\\n}
     *@itemize C3 l60
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *@item C1 l61
      |EXTRA
      |item_number:{1}
       *preformatted C2
        {ignorable_spaces_after_command: }
        {detailibb\\n}
      *@end C1 l62
      |EXTRA
      |text_arg:{itemize}
       *line_arg C3
        {spaces_before_argument: }
        {itemize}
        {spaces_after_argument:\\n}
    *menu_entry C4 l63
     {menu_entry_leading_text:* }
     *menu_entry_node C3
     |EXTRA
     |manual_content:A{1|1}
      {(}
      {detailmanual}
      {)}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {\\n}
    *menu_comment C1
     *preformatted C3
      {after_menu_description_line:\\n}
      {detailcomment\\n}
      {empty_line:\\n}
    *menu_entry C4 l67
     {menu_entry_leading_text:* }
     *menu_entry_node C3
     |EXTRA
     |manual_content:A{1|1}
      {(}
      {detailafter_comment}
      {)}
     {menu_entry_separator::: }
     *menu_entry_description C1
      *preformatted C2
       {detaildescription\\n}
       {in detaildescription\\n}
    *menu_entry C4 l69
     {menu_entry_leading_text:* }
     *menu_entry_node C3
     |EXTRA
     |manual_content:A{1|1}
      {(}
      {detailafter_description}
      {)}
     {menu_entry_separator:::}
     *menu_entry_description C1
      *preformatted C1
       {\\n}
    *menu_comment C1
     *preformatted C1
      {after_menu_description_line:\\n}
    *@end C1 l71
    |EXTRA
    |text_arg:{detailmenu}
     *line_arg C3
      {spaces_before_argument: }
      {detailmenu}
      {spaces_after_argument:\\n}
   *@end C1 l72
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {menu}
     {spaces_after_argument:\\n}
';


$result_texis{'menu'} = '
@node Top
@top

@menu
* (ggg):: description
@itemize
@item idescr
@end itemize
@html
in html
@end html
AAA

CCC

@itemize
@item iaa
@end itemize

@html
in html title
@end html

BBB

@itemize
@item ibb
@end itemize
* (manual)::

comment

* (after_comment):: description
in description
* (after_description)::

@detailmenu
* (detailggg):: detaildescription
@itemize
@item idetaildescr
@end itemize
@html
detailin detailhtml
@end html
detailAAA

detailCCC

@itemize
@item detailiaa
@end itemize

@html
detailin html detailtitle
@end html

detailBBB

@itemize
@item detailibb
@end itemize
* (detailmanual)::

detailcomment

* (detailafter_comment):: detaildescription
in detaildescription
* (detailafter_description)::

@end detailmenu
@end menu
';


$result_texts{'menu'} = '
* (ggg):: description
idescr
in html
AAA

CCC

iaa

in html title

BBB

ibb
* (manual)::

comment

* (after_comment):: description
in description
* (after_description)::

* (detailggg):: detaildescription
idetaildescr
detailin detailhtml
detailAAA

detailCCC

detailiaa

detailin html detailtitle

detailBBB

detailibb
* (detailmanual)::

detailcomment

* (detailafter_comment):: detaildescription
in detaildescription
* (detailafter_description)::

';

$result_errors{'menu'} = '';

$result_nodes_list{'menu'} = '1|Top
 associated_section
 associated_title_command
 menus:
  (ggg)
  (manual)
  (after_comment)
  (after_description)
 node_directions:
  next->(ggg)
';

$result_sections_list{'menu'} = '1
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'menu'} = 'level: -1
list:
 1|
';

$result_headings_list{'menu'} = '';


$result_converted{'info'}->{'menu'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: (ggg),  Up: (dir)

* Menu:

* (ggg):: description
   • idescr
AAA

CCC

   • iaa


BBB

   • ibb
* (manual)::

comment

* (after_comment):: description
in description
* (after_description)::

* (detailggg):: detaildescription
   • idetaildescr
detailAAA

detailCCC

   • detailiaa


detailBBB

   • detailibb
* (detailmanual)::

detailcomment

* (detailafter_comment):: detaildescription
in detaildescription
* (detailafter_description)::


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'menu'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="Top">
<style type="text/css">
pre.menu-comment-preformatted {font-family: serif}
pre.menu-preformatted {font-family: serif}
td.menu-entry-description {vertical-align: top; padding-left: 1em}
td.menu-entry-destination {vertical-align: top}
th.menu-comment {text-align:left}
ul.mark-bullet {list-style-type: disc}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<a class="top" id="SEC_Top"></a>
<table class="menu">
<tr><td class="menu-entry-destination">&bull; <a href="ggg.html#Top" accesskey="1">(ggg)</a>:</td><td class="menu-entry-description">description
<ul class="itemize mark-bullet">
<li><pre class="menu-preformatted">idescr
</pre></li></ul>
in html
AAA
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

CCC

</pre><ul class="itemize mark-bullet">
<li><pre class="menu-comment-preformatted">iaa
</pre></li></ul>
<pre class="menu-comment-preformatted">

in html title

BBB

</pre><ul class="itemize mark-bullet">
<li><pre class="menu-comment-preformatted">ibb
</pre></li></ul>
</th></tr><tr><td class="menu-entry-destination">&bull; <a href="manual.html#Top" accesskey="2">(manual)</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

comment

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="after_comment.html#Top" accesskey="3">(after_comment)</a>:</td><td class="menu-entry-description">description
in description
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="after_description.html#Top" accesskey="4">(after_description)</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="detailggg.html#Top" accesskey="5">(detailggg)</a>:</td><td class="menu-entry-description">detaildescription
<ul class="itemize mark-bullet">
<li><pre class="menu-preformatted">idetaildescr
</pre></li></ul>
detailin detailhtml
detailAAA
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

detailCCC

</pre><ul class="itemize mark-bullet">
<li><pre class="menu-comment-preformatted">detailiaa
</pre></li></ul>
<pre class="menu-comment-preformatted">

detailin html detailtitle

detailBBB

</pre><ul class="itemize mark-bullet">
<li><pre class="menu-comment-preformatted">detailibb
</pre></li></ul>
</th></tr><tr><td class="menu-entry-destination">&bull; <a href="detailmanual.html#Top" accesskey="6">(detailmanual)</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

detailcomment

</pre></th></tr><tr><td class="menu-entry-destination">&bull; <a href="detailafter_comment.html#Top" accesskey="7">(detailafter_comment)</a>:</td><td class="menu-entry-description">detaildescription
in detaildescription
</td></tr>
<tr><td class="menu-entry-destination">&bull; <a href="detailafter_description.html#Top" accesskey="8">(detailafter_description)</a>:</td><td class="menu-entry-description">
</td></tr>
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">

</pre></th></tr></table>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'menu'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
