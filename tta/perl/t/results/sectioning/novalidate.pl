use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'novalidate'} = '*document_root C2
 *before_node_section C3
  {empty_line:\\n}
  *@novalidate C1 l2
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C5 l4 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C2
   *line_arg C1
    {first}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |node_content:{unknown node}
   |normalized:{unknown-node}
    {unknown node}
  {empty_line:\\n}
  *@menu C3 l6
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{not a node}
    |normalized:{not-a-node}
     {not a node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l8
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
  *paragraph C2
   *@xref C1 l10
    *brace_arg C1
    |EXTRA
    |node_content:{unknown ref}
    |normalized:{unknown-ref}
     {unknown ref}
   {.\\n}
';


$result_texis{'novalidate'} = '
@novalidate

@node first, unknown node

@menu
* not a node::
@end menu

@xref{unknown ref}.
';


$result_texts{'novalidate'} = '


* not a node::

unknown ref.
';

$result_errors{'novalidate'} = '';

$result_nodes_list{'novalidate'} = '1|first
 menus:
  not a node
';

$result_sections_list{'novalidate'} = '';

$result_sectioning_root{'novalidate'} = '';

$result_headings_list{'novalidate'} = '';


$result_converted{'info'}->{'novalidate'} = 'This is , produced from .


File: ,  Node: first

* Menu:

* not a node::

*Note unknown ref::.


Tag Table:
Node: first27

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'novalidate'} = '* W |document without Top node
 warning: document without Top node

';


$result_converted{'html'}->{'novalidate'} = '<!DOCTYPE html>
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
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">


<h4 class="node" id="first"><span>first<a class="copiable-link" href="#first"> &para;</a></span></h4>


<p>See &lsquo;unknown ref&rsquo;.
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'novalidate'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
