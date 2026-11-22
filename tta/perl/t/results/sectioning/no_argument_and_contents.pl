use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_argument_and_contents'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@contents C1 l1
   |EXTRA
   |global_command_number:{1}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *normal_command@top C2 l3 {for example}
 |EXTRA
 |identifier:{for-example}
 |is_target:{1}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:for example}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@chapter C2 l5 {@asis{}}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *normal_command@asis C1 l5
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'no_argument_and_contents'} = '@contents

@top for example

@chapter @asis{}

';


$result_texts{'no_argument_and_contents'} = '
for example
***********

1 
**

';

$result_errors{'no_argument_and_contents'} = '';

$result_nodes_list{'no_argument_and_contents'} = '';

$result_sections_list{'no_argument_and_contents'} = '1|for example
 toplevel_directions:
  next->@asis{}
 section_children:
  1|@asis{}
2|@asis{}
 section_directions:
  up->for example
 toplevel_directions:
  prev->for example
  up->for example
';

$result_sectioning_root{'no_argument_and_contents'} = 'level: -1
list:
 1|for example
';

$result_headings_list{'no_argument_and_contents'} = '';


$result_converted{'plaintext'}->{'no_argument_and_contents'} = 'for example
1 

for example
***********

1 
**

';


$result_converted{'html'}->{'no_argument_and_contents'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>for example</title>

<meta name="description" content="for example">
<meta name="keywords" content="for example">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body>

<div class="top-level-extent" id="for-example">
<h1 class="top"><span>for example<a class="copiable-link" href="#for-example"> &para;</a></span></h1>

<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">

<ul class="toc-numbered-mark">
  <li>1 </li>
</ul>
</div>
</div>
<div class="chapter-level-extent">
<h2 class="chapter">1 </h2>

</div>
</div>



</body>
</html>
';

1;
