use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'index_below'} = 'U0 unit{S:top}
unit_directions:D[next->[U1]]
UNIT_DIRECTIONS
This: [U0]
Forward: [U1]
FastForward: [U1]
 *before_node_section
 *@top C2 l1 {top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {top}
  {empty_line:\\n}
U1 unit{S:1 chap}
unit_directions:D[next->[U2]|prev->[U0]]
UNIT_DIRECTIONS
This: [U1]
Forward: [U2]
Back: [U0]
FastBack: [U0]
Up: [U0]
 *@chapter C2 l3 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
U2 unit{S:1.1 sec}
unit_directions:D[prev->[U1]]
UNIT_DIRECTIONS
This: [U2]
Back: [U1]
FastBack: [U1]
Up: [U1]
 *@section C4 l5 {sec}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {sec}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |index_entry:I{cp,1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {entry}
  *@printindex C1 l8
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
';


$result_texis{'index_below'} = '@top top

@chapter chap

@section sec

@cindex entry
@printindex cp
';


$result_texts{'index_below'} = 'top
***

1 chap
******

1.1 sec
=======

';

$result_errors{'index_below'} = '';

$result_nodes_list{'index_below'} = '';

$result_sections_list{'index_below'} = '1|top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
 section_children:
  1|sec
3|sec
 section_directions:
  up->chap
';

$result_sectioning_root{'index_below'} = 'level: -1
list:
 1|top
';

$result_headings_list{'index_below'} = '';

$result_indices_sort_strings{'index_below'} = 'cp:
 entry
';


$result_converted{'html'}->{'index_below'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#top" rel="start" title="top">
<link href="#chap" rel="index" title="1 chap">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
a.summary-letter-printindex {text-decoration: none}
span:hover a.copiable-link {visibility: visible}
td.printindex-index-entry {vertical-align: top; padding-left: 1.5em}
td.printindex-index-section {vertical-align: top; padding-left: 1em}
th.index-letter-header-printindex {text-align: left}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="top">
<div class="nav-panel">
<p>
[<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap" accesskey="1">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<div class="nav-panel">
<p>
 Up : <a href="#top" accesskey="u" rel="up">top</a> &nbsp; [<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="chapter"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#sec" accesskey="1">sec</a></li>
</ul>
<hr>
<div class="section-level-extent" id="sec">
<div class="nav-panel">
<p>
 Up : <a href="#chap" accesskey="u" rel="up">chap</a> &nbsp; [<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<h3 class="section"><span>1.1 sec<a class="copiable-link" href="#sec"> &para;</a></span></h3>

<a class="index-entry-id" id="index-entry"></a>
<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="sec_cp_letter-E">E</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-entry">entry</a></td><td class="printindex-index-section"><a href="#sec">1.1 sec</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>
</div>
</div>
</div>



</body>
</html>
';

1;
