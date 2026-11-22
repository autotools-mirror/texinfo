use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'shorttitlepage'} = '*document_root C3
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@shorttitlepage C1 l2
    *line_arg C7
     {spaces_before_argument: }
     *normal_command@@
     {normal_text:title }
     *normal_command@sc C1 l2
      *brace_container C1
       {normal_text:html}
     {normal_text: }
     *normal_command@code C1 l2
      *brace_container C1
       {normal_text:test}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C5 l5 {Top of @@title @sc{html} @code{test}}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C8
    {spaces_before_argument: }
    {normal_text:Top of }
    *normal_command@@
    {normal_text:title }
    *normal_command@sc C1 l5
     *brace_container C1
      {normal_text:html}
    {normal_text: }
    *normal_command@code C1 l5
     *brace_container C1
      {normal_text:test}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Top.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Second paragraph.\\n}
';


$result_texis{'shorttitlepage'} = '
@shorttitlepage @@title @sc{html} @code{test}

@node Top
@top Top of @@title @sc{html} @code{test}

Top.

Second paragraph.
';


$result_texts{'shorttitlepage'} = '
Top of @title HTML test
***********************

Top.

Second paragraph.
';

$result_errors{'shorttitlepage'} = '';

$result_nodes_list{'shorttitlepage'} = '1|Top
 associated_section: Top of @@title @sc{html} @code{test}
 associated_title_command: Top of @@title @sc{html} @code{test}
';

$result_sections_list{'shorttitlepage'} = '1|Top of @@title @sc{html} @code{test}
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'shorttitlepage'} = 'level: -1
list:
 1|Top of @@title @sc{html} @code{test}
';

$result_headings_list{'shorttitlepage'} = '';


$result_converted{'html'}->{'shorttitlepage'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>@title HTML test</title>

<meta name="description" content="@title HTML test">
<meta name="keywords" content="@title HTML test">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
h1.shorttitlepage {text-align:center}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<h1 class="shorttitlepage">@title <small class="sc">HTML</small> <code class="code">test</code></h1>
<hr>

<div class="top-level-extent" id="Top">
<h1 class="top" id="Top-of-_0040title-html-test"><span>Top of @title <small class="sc">HTML</small> <code class="code">test</code><a class="copiable-link" href="#Top-of-_0040title-html-test"> &para;</a></span></h1>

<p>Top.
</p>
<p>Second paragraph.
</p></div>



</body>
</html>
';

1;
