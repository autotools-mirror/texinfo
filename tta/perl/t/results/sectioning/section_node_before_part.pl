use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_node_before_part'} = '*document_root C4
 *before_node_section C1
  {empty_line:\\n}
 *@node C1 l2 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@section C2 l3 {section}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
    {section}
  {empty_line:\\n}
 *@part C1 l5 {part}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |global_command_number:{1}
 |section_level:{0}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {part}
';


$result_texis{'section_node_before_part'} = '
@node Top
@section section 

@part part
';


$result_texts{'section_node_before_part'} = '
1 section
=========

part
****
';

$result_errors{'section_node_before_part'} = '* W l5|no chapter-level command before @part
 warning: no chapter-level command before @part

* W l5|no sectioning command associated with @part
 warning: no sectioning command associated with @part

';

$result_nodes_list{'section_node_before_part'} = '1|Top
 associated_section: 1 section
 associated_title_command: 1 section
';

$result_sections_list{'section_node_before_part'} = '1|section
 associated_anchor_command: Top
 associated_node: Top
2|part
';

$result_sectioning_root{'section_node_before_part'} = 'level: -1
list:
 1|section
 2|part
';

$result_headings_list{'section_node_before_part'} = '';


$result_converted{'info'}->{'section_node_before_part'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

1 section
=========


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'section_node_before_part'} = '<!DOCTYPE html>
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

<body lang="">

<div class="section-level-extent" id="Top">
<h3 class="section" id="section"><span>1 section<a class="copiable-link" href="#section"> &para;</a></span></h3>

</div>
<div class="part-level-extent" id="part">
<h1 class="part"><span>part<a class="copiable-link" href="#part"> &para;</a></span></h1>
<hr>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'section_node_before_part'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'section_node_before_part'} = '
<node identifier="Top" spaces=" "><nodename>Top</nodename></node>
<section spaces=" "><sectiontitle>section </sectiontitle>

</section>
<part spaces=" "><sectiontitle>part</sectiontitle>
</part>
';

1;
