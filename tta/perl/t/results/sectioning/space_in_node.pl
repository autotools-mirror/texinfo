use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'space_in_node'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *normal_command@node C4 l2 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C5 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Chap-first-here}
     {normal_text:Chap    first here}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C6 l6
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {normal_text:Test    title   }
    {menu_entry_separator::}
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Test-title}
     {normal_text:Test   title}
    {menu_entry_separator:.}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:*   }
    *menu_entry_node C2
    |node_content:A{0|1}
    |normalized:{Last-with-spaces}
     {normal_text:Last with spaces}
     {space_at_end_menu_node:    }
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l8
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l10 {Chap first  here}
 |identifier:{Chap-first-here}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument:  }
    {normal_text:Chap first  here}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l12 {Test               title}
 |identifier:{Test-title}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Test               title}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l14 {Last with spaces}
 |identifier:{Last-with-spaces}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument:   }
    {normal_text:Last with spaces}
    {spaces_after_argument: \\n}
';


$result_texis{'space_in_node'} = '
@node Top

@menu
* Chap    first here::
* Test    title   :Test   title.
*   Last with spaces    ::
@end menu

@node  Chap first  here

@node Test               title

@node   Last with spaces 
';


$result_texts{'space_in_node'} = '
* Chap    first here::
* Test    title   :Test   title.
*   Last with spaces::



';

$result_errors{'space_in_node'} = '';

$result_nodes_list{'space_in_node'} = '1|Top
 menus:
  Chap    first here
  Test   title
  Last with spaces    
 node_directions:
  next->Chap first  here
2|Chap first  here
 node_directions:
  next->Test               title
  prev->Top
  up->Top
3|Test               title
 node_directions:
  next->Last with spaces
  prev->Chap first  here
  up->Top
4|Last with spaces
 node_directions:
  prev->Test               title
  up->Top
';

$result_sections_list{'space_in_node'} = '';

$result_sectioning_root{'space_in_node'} = '';

$result_headings_list{'space_in_node'} = '';


$result_converted{'info'}->{'space_in_node'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: Chap first here,  Up: (dir)

* Menu:

* Chap    first here::
* Test    title   :Test   title.
*   Last with spaces    ::


File: ,  Node: Chap first here,  Next: Test title,  Prev: Top,  Up: Top


File: ,  Node: Test title,  Next: Last with spaces,  Prev: Chap first here,  Up: Top


File: ,  Node: Last with spaces,  Prev: Test title,  Up: Top


Tag Table:
Node: Top27
Node: Chap first here178
Node: Test title253
Node: Last with spaces341

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'space_in_node'} = '<!DOCTYPE html>
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
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#Chap-first-here" accesskey="n" rel="next">Chap first  here</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>


<hr>
<a class="node-id" id="Chap-first-here"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#Test-title" accesskey="n" rel="next">Test               title</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>Chap first  here<a class="copiable-link" href="#Chap-first-here"> &para;</a></span></h4>

<hr>
<a class="node-id" id="Test-title"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#Last-with-spaces" accesskey="n" rel="next">Last with spaces</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Chap-first-here" accesskey="p" rel="prev">Chap first  here</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>Test               title<a class="copiable-link" href="#Test-title"> &para;</a></span></h4>

<hr>
<a class="node-id" id="Last-with-spaces"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Test-title" accesskey="p" rel="prev">Test               title</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>Last with spaces<a class="copiable-link" href="#Last-with-spaces"> &para;</a></span></h4>



</body>
</html>
';

$result_converted_errors{'html'}->{'space_in_node'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'space_in_node'} = '<preamblebeforebeginning>
</preamblebeforebeginning><node identifier="Top"><nodename> Top</nodename><nodenext automatic="on">  Chap first  here</nodenext></node>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>Chap    first here</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>Test    title   </menutitle><menuseparator>:</menuseparator><menunode>Test   title</menunode><menuseparator>.</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>*   </menuleadingtext><menunode>Last with spaces    </menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="Chap-first-here"><nodename>  Chap first  here</nodename><nodenext automatic="on"> Test               title</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>

<node identifier="Test-title"><nodename> Test               title</nodename><nodenext automatic="on">   Last with spaces</nodenext><nodeprev automatic="on">  Chap first  here</nodeprev><nodeup automatic="on"> Top</nodeup></node>

<node identifier="Last-with-spaces"><nodename>   Last with spaces</nodename><nodeprev automatic="on"> Test               title</nodeprev><nodeup automatic="on"> Top</nodeup></node>
';

1;
