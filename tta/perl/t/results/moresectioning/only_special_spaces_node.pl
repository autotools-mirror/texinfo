use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'only_special_spaces_node'} = '*document_root C16
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 only_special_spaces_node.texi:l2 {Top}
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
 *@top C2 only_special_spaces_node.texi:l3 {top}
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
 *@node C1 only_special_spaces_node.texi:l5 {   }
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{_2002_2003_2002}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {   }
 *@chapter C2 only_special_spaces_node.texi:l6 {EN QUAD| | EM QUAD| | EN SPACE| |}
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
    {EN QUAD| | EM QUAD| | EN SPACE| |}
  {empty_line:\\n}
 *@node C1 only_special_spaces_node.texi:l8
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\t\\f\\n}
 *@chapter C2 only_special_spaces_node.texi:l9 {CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {CHARACTER TABULATION|\\t| FORM FEED|\\f| LINE TABULATION||}
  {empty_line:\\n}
 *@node C1 only_special_spaces_node.texi:l11
  *arguments_line C1
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: '."\r".'\\n}
 *@chapter C2 only_special_spaces_node.texi:l12 {CARRIAGE RETURN|'."\r".'|}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {CARRIAGE RETURN|'."\r".'|}
  {empty_line:\\n}
 *@node C1 only_special_spaces_node.texi:l14 {  }
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{_0085_00a0_1680}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {  }
 *@chapter C2 only_special_spaces_node.texi:l15 {NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |}
  {empty_line:\\n}
 *@node C1 only_special_spaces_node.texi:l17 {᠎ }
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{_180e_2003}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {᠎ }
 *@chapter C2 only_special_spaces_node.texi:l18 {MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |}
  {empty_line:\\n}
 *@node C1 only_special_spaces_node.texi:l20 {         　}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{_2004_2005_2006_2007_2008_2009_200a_202f_205f_3000}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {         　}
 *@chapter C6 only_special_spaces_node.texi:l21 {THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{6}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|}
  {empty_line:\\n}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:Perl and XS code give different width.}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:@node   }
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:@chapter LINE SEPARATOR| | PARAGRAPH SEPARATOR| |}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'only_special_spaces_node'} = '
@node Top
@top top

@node    
@chapter EN QUAD| | EM QUAD| | EN SPACE| |

@node 	
@chapter CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||

@node '."\r".'
@chapter CARRIAGE RETURN|'."\r".'|

@node   
@chapter NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |

@node ᠎ 
@chapter MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |

@node          　
@chapter THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|

@c Perl and XS code give different width.
@c @node   
@c @chapter LINE SEPARATOR| | PARAGRAPH SEPARATOR| |

@bye
';


$result_texts{'only_special_spaces_node'} = 'top
***

1 EN QUAD| | EM QUAD| | EN SPACE| |
***********************************

2 CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
******************************************************

3 CARRIAGE RETURN|'."\r".'|
*******************

4 NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
*********************************************************

5 MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
*****************************************

6 THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|
*************************************************************************************************************************************************************************************************************


';

$result_errors{'only_special_spaces_node'} = '* E only_special_spaces_node.texi:l8|empty argument in @node
 empty argument in @node

* E only_special_spaces_node.texi:l11|empty argument in @node
 empty argument in @node

';

$result_nodes_list{'only_special_spaces_node'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->   
2|   
 associated_section: 1 EN QUAD| | EM QUAD| | EN SPACE| |
 associated_title_command: 1 EN QUAD| | EM QUAD| | EN SPACE| |
 node_directions:
  prev->Top
  up->Top
3|  
 associated_section: 4 NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
 associated_title_command: 4 NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
 node_directions:
  next->᠎ 
  up->Top
4|᠎ 
 associated_section: 5 MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
 associated_title_command: 5 MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
 node_directions:
  next->         　
  prev->  
  up->Top
5|         　
 associated_section: 6 THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|
 associated_title_command: 6 THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|
 node_directions:
  prev->᠎ 
  up->Top
';

$result_sections_list{'only_special_spaces_node'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->EN QUAD| | EM QUAD| | EN SPACE| |
 section_children:
  1|EN QUAD| | EM QUAD| | EN SPACE| |
  2|CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
  3|CARRIAGE RETURN|'."\r".'|
  4|NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
  5|MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
  6|THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|
2|EN QUAD| | EM QUAD| | EN SPACE| |
 associated_anchor_command:    
 associated_node:    
 section_directions:
  next->CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
  up->top
 toplevel_directions:
  next->CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
  prev->top
  up->top
3|CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
 section_directions:
  next->CARRIAGE RETURN|'."\r".'|
  prev->EN QUAD| | EM QUAD| | EN SPACE| |
  up->top
 toplevel_directions:
  next->CARRIAGE RETURN|'."\r".'|
  prev->EN QUAD| | EM QUAD| | EN SPACE| |
  up->top
4|CARRIAGE RETURN|'."\r".'|
 section_directions:
  next->NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
  prev->CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
  up->top
 toplevel_directions:
  next->NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
  prev->CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
  up->top
5|NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
 associated_anchor_command:   
 associated_node:   
 section_directions:
  next->MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
  prev->CARRIAGE RETURN|'."\r".'|
  up->top
 toplevel_directions:
  next->MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
  prev->CARRIAGE RETURN|'."\r".'|
  up->top
6|MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
 associated_anchor_command: ᠎ 
 associated_node: ᠎ 
 section_directions:
  next->THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|
  prev->NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
  up->top
 toplevel_directions:
  next->THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|
  prev->NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
  up->top
7|THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|
 associated_anchor_command:          　
 associated_node:          　
 section_directions:
  prev->MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
  up->top
 toplevel_directions:
  prev->MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
  up->top
';

$result_sectioning_root{'only_special_spaces_node'} = 'level: -1
list:
 1|top
';

$result_headings_list{'only_special_spaces_node'} = '';


$result_converted{'info'}->{'only_special_spaces_node'} = 'This is , produced from only_special_spaces_node.texi.


File: ,  Node: Top,  Next:    ,  Up: (dir)

top
***

* Menu:

*    ::
*   ::
* ᠎ ::
*          　::


File: ,  Node:    ,  Prev: Top,  Up: Top

1 EN QUAD| | EM QUAD| | EN SPACE| |
***********************************

2 CHARACTER TABULATION| | FORM FEED| | LINE TABULATION| |
*********************************************************

3 CARRIAGE RETURN| |
********************


File: ,  Node:   ,  Next: ᠎ ,  Up: Top

4 NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
*********************************************************


File: ,  Node: ᠎ ,  Next:          　,  Prev:   ,  Up: Top

5 MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
*****************************************


File: ,  Node:          　,  Prev: ᠎ ,  Up: Top

6 THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|
*************************************************************************************************************************************************************************************************************


Tag Table:
Node: Top56
Node:    159
Node:   436
Node: ᠎ 597
Node:          　745

End Tag Table


Local Variables:
coding: utf-8
End:
';


$result_converted{'html'}->{'only_special_spaces_node'} = '<!DOCTYPE html>
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

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#g_t_2002_2003_2002" accesskey="n" rel="next">EN QUAD| | EM QUAD| | EN SPACE| |</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#g_t_2002_2003_2002" accesskey="1">EN QUAD| | EM QUAD| | EN SPACE| |</a></li>
<li><a href="#CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c-LINE-TABULATION_007c-_007c" accesskey="2">CHARACTER TABULATION|	| FORM FEED|&#12;| LINE TABULATION||</a></li>
<li><a href="#CARRIAGE-RETURN_007c-_007c" accesskey="3">CARRIAGE RETURN|'."\r".'|</a></li>
<li><a href="#g_t_0085_00a0_1680" accesskey="4">NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |</a></li>
<li><a href="#g_t_180e_2003" accesskey="5">MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |</a></li>
<li><a href="#g_t_2004_2005_2006_2007_2008_2009_200a_202f_205f_3000" accesskey="6">THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="g_t_2002_2003_2002">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">top</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="EN-QUAD_007c-_007c-EM-QUAD_007c-_007c-EN-SPACE_007c-_007c"><span>1 EN QUAD| | EM QUAD| | EN SPACE| |<a class="copiable-link" href="#EN-QUAD_007c-_007c-EM-QUAD_007c-_007c-EN-SPACE_007c-_007c"> &para;</a></span></h2>

</div>
<div class="chapter-level-extent" id="CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c-LINE-TABULATION_007c-_007c">
<h2 class="chapter"><span>2 CHARACTER TABULATION|	| FORM FEED|&#12;| LINE TABULATION||<a class="copiable-link" href="#CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c-LINE-TABULATION_007c-_007c"> &para;</a></span></h2>

</div>
<div class="chapter-level-extent" id="CARRIAGE-RETURN_007c-_007c">
<h2 class="chapter"><span>3 CARRIAGE RETURN|'."\r".'|<a class="copiable-link" href="#CARRIAGE-RETURN_007c-_007c"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_0085_00a0_1680">
<div class="nav-panel">
<p>
Next: <a href="#g_t_180e_2003" accesskey="n" rel="next">MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="NEXT-LINE-_0028NEL_0029_007c_007c-NO_002dBREAK-SPACE_007c-_007c-OGHAM-SPACE-MARK_007c-_007c"><span>4 NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |<a class="copiable-link" href="#NEXT-LINE-_0028NEL_0029_007c_007c-NO_002dBREAK-SPACE_007c-_007c-OGHAM-SPACE-MARK_007c-_007c"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_180e_2003">
<div class="nav-panel">
<p>
Next: <a href="#g_t_2004_2005_2006_2007_2008_2009_200a_202f_205f_3000" accesskey="n" rel="next">THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|</a>, Previous: <a href="#g_t_0085_00a0_1680" accesskey="p" rel="prev">NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="MONGOLIAN-VOWEL-SEPARATOR_007c_007c-EM-SPACE_007c-_007c"><span>5 MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |<a class="copiable-link" href="#MONGOLIAN-VOWEL-SEPARATOR_007c_007c-EM-SPACE_007c-_007c"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_2004_2005_2006_2007_2008_2009_200a_202f_205f_3000">
<div class="nav-panel">
<p>
Previous: <a href="#g_t_180e_2003" accesskey="p" rel="prev">MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |</a>, Up: <a href="#Top" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="THREE_002dPER_002dEM-SPACE_007c-_007c-FOUR_002dPER_002dEM-SPACE_007c-_007c-SIX_002dPER_002dEM-SPACE_007c-_007c-FIGURE-SPACE_007c-_007c-PUNCTUATION-SPACE_007c-_007c-THIN-SPACE_007c-_007c-HAIR-SPACE_007c-_007c-NARROW-NO_002dBREAK-SPACE_007c-_007c-MEDIUM-MATHEMATICAL-SPACE_007c_005b_003f_005d_007c-IDEOGRAPHIC-SPACE_007c-_007c"><span>6 THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|<a class="copiable-link" href="#THREE_002dPER_002dEM-SPACE_007c-_007c-FOUR_002dPER_002dEM-SPACE_007c-_007c-SIX_002dPER_002dEM-SPACE_007c-_007c-FIGURE-SPACE_007c-_007c-PUNCTUATION-SPACE_007c-_007c-THIN-SPACE_007c-_007c-HAIR-SPACE_007c-_007c-NARROW-NO_002dBREAK-SPACE_007c-_007c-MEDIUM-MATHEMATICAL-SPACE_007c_005b_003f_005d_007c-IDEOGRAPHIC-SPACE_007c-_007c"> &para;</a></span></h2>


</div>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'only_special_spaces_node'} = '<preamblebeforebeginning>
</preamblebeforebeginning><node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">   </nodenext></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

</top>
<node identifier="_2002_2003_2002" spaces=" "><nodename>   </nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>EN QUAD| | EM QUAD| | EN SPACE| |</sectiontitle>

</chapter>
<node identifier=""><nodename trailingspaces=" 	\\f\\v"></nodename></node>
<chapter spaces=" "><sectiontitle>CHARACTER TABULATION|	| FORM FEED|&formfeed;| LINE TABULATION|&verticaltab;|</sectiontitle>

</chapter>
<node identifier=""><nodename trailingspaces=" '."\r".'"></nodename></node>
<chapter spaces=" "><sectiontitle>CARRIAGE RETURN|'."\r".'|</sectiontitle>

</chapter>
<node identifier="_0085_00a0_1680" spaces=" "><nodename>  </nodename><nodenext automatic="on">᠎ </nodenext><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |</sectiontitle>

</chapter>
<node identifier="_180e_2003" spaces=" "><nodename>᠎ </nodename><nodenext automatic="on">         　</nodenext><nodeprev automatic="on">  </nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |</sectiontitle>

</chapter>
<node identifier="_2004_2005_2006_2007_2008_2009_200a_202f_205f_3000" spaces=" "><nodename>         　</nodename><nodeprev automatic="on">᠎ </nodeprev><nodeup automatic="on">Top</nodeup></node>
<chapter spaces=" "><sectiontitle>THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|</sectiontitle>

<!-- c Perl and XS code give different width. -->
<!-- c @node    -->
<!-- c @chapter LINE SEPARATOR| | PARAGRAPH SEPARATOR| | -->

</chapter>
<bye></bye>
';

1;
