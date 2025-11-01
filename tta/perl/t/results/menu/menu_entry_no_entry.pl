use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'menu_entry_no_entry'} = '*document_root C1
 *before_node_section C1
  *@menu C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_comment C1
    *preformatted C13
     {* a1:\\n}
     {* a2:  \\n}
     {* a1c:}
     *@c C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:c}
     {* a2c:  }
     *@c C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:c}
     {* a4}
     *@b C1 l6
      *brace_container C1
       {a}
     {: \\n}
     {* a5}
     *@b C1 l7
      *brace_container C1
       {b}
     {: }
     *@c C1
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {rawline_text:c}
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

<body lang="">
<table class="menu">
<tr><th class="menu-comment" colspan="2"><pre class="menu-comment-preformatted">* a1:
* a2:  
* a1c:* a2c:  * a4<b class="b">a</b>: 
* a5<b class="b">b</b>: </pre></th></tr></table>



</body>
</html>
';

$result_converted_errors{'html'}->{'menu_entry_no_entry'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];



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
