use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'menu_entry_no_entry'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *normal_command@menu C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_comment C1
    *preformatted C13
     {normal_text:* a1:\\n}
     {normal_text:* a2:  \\n}
     {normal_text:* a1c:}
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:c}
       {spaces_after_argument:\\n}
     {normal_text:* a2c:  }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:c}
       {spaces_after_argument:\\n}
     {normal_text:* a4}
     *normal_command@b C1 l6
      *brace_container C1
       {normal_text:a}
     {normal_text:: \\n}
     {normal_text:* a5}
     *normal_command@b C1 l7
      *brace_container C1
       {normal_text:b}
     {normal_text:: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:c}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l8
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
';


$result_texis{'menu_entry_no_entry'} = '@menu
* a1:
* a2:  
* a1c:@c c
* a2c:  @c c
* a4@b{a}: 
* a5@b{b}: @c c
@end menu
';


$result_texts{'menu_entry_no_entry'} = '* a1:
* a2:  
* a1c:* a2c:  * a4a: 
* a5b: ';

$result_errors{'menu_entry_no_entry'} = '';

$result_nodes_list{'menu_entry_no_entry'} = '';

$result_sections_list{'menu_entry_no_entry'} = '';

$result_sectioning_root{'menu_entry_no_entry'} = '';

$result_headings_list{'menu_entry_no_entry'} = '';


$result_converted{'plaintext'}->{'menu_entry_no_entry'} = '* Menu:

* a1:
* a2:
* a1c:* a2c:  * a4a:
* a5b:
';


$result_converted{'html'}->{'menu_entry_no_entry'} = '<!DOCTYPE html>
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
pre.menu-comment-preformatted {font-family: serif}
th.menu-comment {text-align:left}
</style>


</head>

<body>
<table class="menu">
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">* a1:
* a2:  
* a1c:* a2c:  * a4<b class="b">a</b>: 
* a5<b class="b">b</b>: </pre></th></tr></table>



</body>
</html>
';

$result_converted_errors{'html'}->{'menu_entry_no_entry'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'menu_entry_no_entry'} = '<menu endspaces=" ">
<menucomment><pre xml:space="preserve">* a1:
* a2:  
* a1c:<!-- c c -->
* a2c:  <!-- c c -->
* a4<b>a</b>: 
* a5<b>b</b>: <!-- c c -->
</pre></menucomment></menu>
';

1;
