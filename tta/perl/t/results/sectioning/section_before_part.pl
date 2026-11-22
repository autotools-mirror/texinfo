use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_before_part'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@section C2 l1 {section}
 |EXTRA
 |identifier:{section}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:section}
    {spaces_after_argument: \\n}
  {empty_line:\\n}
 *@part C3 l3 {part}
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:part}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@contents C1 l5
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
';


$result_texis{'section_before_part'} = '@section section 

@part part

@contents
';


$result_texts{'section_before_part'} = '1 section
=========

part
****

';

$result_errors{'section_before_part'} = '* W l3|no chapter-level command before @part
 warning: no chapter-level command before @part

* W l3|no sectioning command associated with @part
 warning: no sectioning command associated with @part

';

$result_nodes_list{'section_before_part'} = '';

$result_sections_list{'section_before_part'} = '1|section
2|part
';

$result_sectioning_root{'section_before_part'} = 'level: -1
list:
 1|section
 2|part
';

$result_headings_list{'section_before_part'} = '';


$result_converted{'plaintext'}->{'section_before_part'} = '1 section
=========

  1 section
part
';


$result_converted{'html'}->{'section_before_part'} = '<!DOCTYPE html>
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

<link href="#SEC_Contents" rel="contents" title="Table of Contents">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
ul.toc-numbered-mark {list-style: none}
</style>


</head>

<body>
<div class="section-level-extent" id="section">
<h3 class="section"><span>1 section<a class="copiable-link" href="#section"> &para;</a></span></h3>

</div>
<div class="part-level-extent" id="part">
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>

<div class="region-contents" id="SEC_Contents">
<h2 class="contents-heading">Table of Contents</h2>

<div class="contents">
<ul class="toc-numbered-mark">
    <li><a id="toc-section" href="#section">1 section</a></li>
<li><a id="toc-part" href="#part">part</a></li>

</ul>
</div>
</div>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'section_before_part'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'section_before_part'} = '<section><sectiontitle> section </sectiontitle>

</section>
<part><sectiontitle> part</sectiontitle>

<contents></contents>
</part>
';

1;
