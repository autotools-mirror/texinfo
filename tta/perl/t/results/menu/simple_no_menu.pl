use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'simple_no_menu'} = '*document_root C1
 *before_node_section C7
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C1
   {normal_text:Before menu.\\n}
  {empty_line:\\n}
  *normal_command@menu C9 l4
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C1
     {normal_text:comment\\n}
   *menu_entry C6 l6
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {normal_text:menu entry name }
    {menu_entry_separator:: }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node}
     {normal_text:node}
    {menu_entry_separator:.    }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:description\\n}
   *menu_entry C4 l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node-name}
     {normal_text:node name}
    {menu_entry_separator:::                }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:description new\\n}
   *menu_entry C6 l8
    {menu_entry_leading_text:* }
    *menu_entry_name C1
     {normal_text:other entry}
    {menu_entry_separator:: }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{node}
     {normal_text:node}
    {menu_entry_separator:,    }
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{last}
     {normal_text:last}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C3
      {normal_text:\\n}
      {normal_text:                 description next line\\n}
      {normal_text:                 still description\\n}
   *menu_comment C1
    *preformatted C2
     {after_menu_description_line:\\n}
     {normal_text:new comment\\n}
   *menu_entry C4 l14
    {menu_entry_leading_text:* }
    *menu_entry_node C2
    |node_content:A{0|1}
    |normalized:{last-node-entry}
     {normal_text:last node entry}
     {space_at_end_menu_node: }
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l15
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:After menu.\\n}
';


$result_texis{'simple_no_menu'} = '
Before menu.

@menu
comment
* menu entry name : node.    description
* node name::                description new
* other entry: node,    
* last::
                 description next line
                 still description

new comment
* last node entry ::
@end menu

After menu.
';


$result_texts{'simple_no_menu'} = 'Before menu.

comment
* menu entry name : node.    description
* node name::                description new
* other entry: node,    
* last::
                 description next line
                 still description

new comment
* last node entry::

After menu.
';

$result_errors{'simple_no_menu'} = '';

$result_nodes_list{'simple_no_menu'} = '';

$result_sections_list{'simple_no_menu'} = '';

$result_sectioning_root{'simple_no_menu'} = '';

$result_headings_list{'simple_no_menu'} = '';


$result_converted{'plaintext'}->{'simple_no_menu'} = 'Before menu.

   After menu.
';


$result_converted{'html'}->{'simple_no_menu'} = '<!DOCTYPE html>
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

<body>
<p>Before menu.
</p>

<p>After menu.
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'simple_no_menu'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'simple_no_menu'} = '<preamblebeforebeginning>
</preamblebeforebeginning><para>Before menu.
</para>
<menu endspaces=" ">
<menucomment><pre xml:space="preserve">comment
</pre></menucomment><menuentry><menuleadingtext>* </menuleadingtext><menutitle>menu entry name </menutitle><menuseparator>: </menuseparator><menunode>node</menunode><menuseparator>.    </menuseparator><menudescription><pre xml:space="preserve">description
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>node name</menunode><menuseparator>::                </menuseparator><menudescription><pre xml:space="preserve">description new
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menutitle>other entry</menutitle><menuseparator>: </menuseparator><menunode>node</menunode><menuseparator>,    </menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>last</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
                 description next line
                 still description
</pre></menudescription></menuentry><menucomment><pre xml:space="preserve">
new comment
</pre></menucomment><menuentry><menuleadingtext>* </menuleadingtext><menunode>last node entry </menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<para>After menu.
</para>';

1;
