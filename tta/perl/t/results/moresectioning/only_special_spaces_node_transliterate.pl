use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'only_special_spaces_node_transliterate'} = '*document_root C16
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 only_special_spaces_node.texi:l2 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C2 only_special_spaces_node.texi:l3 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 only_special_spaces_node.texi:l5 {   }
 |EXTRA
 |identifier:{_2002_2003_2002}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {   }
    {spaces_after_argument:\\n}
 *@chapter C2 only_special_spaces_node.texi:l6 {EN QUAD| | EM QUAD| | EN SPACE| |}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {EN QUAD| | EM QUAD| | EN SPACE| |}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 only_special_spaces_node.texi:l8
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument: \\t\\f\\n}
 *@chapter C2 only_special_spaces_node.texi:l9 {CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||}
 |EXTRA
 |identifier:{CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c-LINE-TABULATION_007c-_007c}
 |is_target:{1}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {CHARACTER TABULATION|\\t| FORM FEED|\\f| LINE TABULATION||}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 only_special_spaces_node.texi:l11
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument: '."\r".'\\n}
 *@chapter C2 only_special_spaces_node.texi:l12 {CARRIAGE RETURN|'."\r".'|}
 |EXTRA
 |identifier:{CARRIAGE-RETURN_007c-_007c}
 |is_target:{1}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {CARRIAGE RETURN|'."\r".'|}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 only_special_spaces_node.texi:l14 {  }
 |EXTRA
 |identifier:{_0085_00a0_1680}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {  }
    {spaces_after_argument:\\n}
 *@chapter C4 only_special_spaces_node.texi:l15 {NO-BREAK SPACE| |}
 |EXTRA
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {NO-BREAK SPACE| |}
    {spaces_after_argument:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:different transliteration in Perl and C}
    {spaces_after_argument:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:NEXT LINE (NEL)|| OGHAM SPACE MARK| |}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 only_special_spaces_node.texi:l19 {᠎ }
 |EXTRA
 |identifier:{_180e_2003}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {᠎ }
    {spaces_after_argument:\\n}
 *@chapter C4 only_special_spaces_node.texi:l20 {EM SPACE| |}
 |EXTRA
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {EM SPACE| |}
    {spaces_after_argument:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:different transliteration in Perl and C}
    {spaces_after_argument:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:MONGOLIAN VOWEL SEPARATOR|᠎| }
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 only_special_spaces_node.texi:l24 {         　}
 |EXTRA
 |identifier:{_2004_2005_2006_2007_2008_2009_200a_202f_205f_3000}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {         　}
    {spaces_after_argument:\\n}
 *@chapter C8 only_special_spaces_node.texi:l25 {THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|}
 |EXTRA
 |section_heading_number:{6}
 |section_level:{1}
 |section_number:{7}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|}
    {spaces_after_argument:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:different transliteration in Perl and C}
    {spaces_after_argument:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:FIGURE SPACE| | MEDIUM MATHEMATICAL SPACE| |}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:Perl and C code give different width.}
    {spaces_after_argument:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:@node   }
    {spaces_after_argument:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:@chapter LINE SEPARATOR| | PARAGRAPH SEPARATOR| |}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'only_special_spaces_node_transliterate'} = '
@node Top
@top top

@node    
@chapter EN QUAD| | EM QUAD| | EN SPACE| |

@node 	
@chapter CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||

@node '."\r".'
@chapter CARRIAGE RETURN|'."\r".'|

@node   
@chapter NO-BREAK SPACE| |
@c different transliteration in Perl and C
@c NEXT LINE (NEL)|| OGHAM SPACE MARK| |

@node ᠎ 
@chapter EM SPACE| |
@c different transliteration in Perl and C
@c MONGOLIAN VOWEL SEPARATOR|᠎| 

@node          　
@chapter THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|
@c different transliteration in Perl and C
@c FIGURE SPACE| | MEDIUM MATHEMATICAL SPACE| |

@c Perl and C code give different width.
@c @node   
@c @chapter LINE SEPARATOR| | PARAGRAPH SEPARATOR| |

@bye
';


$result_texts{'only_special_spaces_node_transliterate'} = 'top
***

1 EN QUAD| | EM QUAD| | EN SPACE| |
***********************************

2 CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
******************************************************

3 CARRIAGE RETURN|'."\r".'|
*******************

4 NO-BREAK SPACE| |
*******************

5 EM SPACE| |
*************

6 THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|
****************************************************************************************************************************************************************


';

$result_errors{'only_special_spaces_node_transliterate'} = '* E only_special_spaces_node.texi:l8|empty argument in @node
 empty argument in @node

* E only_special_spaces_node.texi:l11|empty argument in @node
 empty argument in @node

';

$result_nodes_list{'only_special_spaces_node_transliterate'} = '1|Top
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
 associated_section: 4 NO-BREAK SPACE| |
 associated_title_command: 4 NO-BREAK SPACE| |
 node_directions:
  next->᠎ 
  up->Top
4|᠎ 
 associated_section: 5 EM SPACE| |
 associated_title_command: 5 EM SPACE| |
 node_directions:
  next->         　
  prev->  
  up->Top
5|         　
 associated_section: 6 THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|
 associated_title_command: 6 THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|
 node_directions:
  prev->᠎ 
  up->Top
';

$result_sections_list{'only_special_spaces_node_transliterate'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->EN QUAD| | EM QUAD| | EN SPACE| |
 section_children:
  1|EN QUAD| | EM QUAD| | EN SPACE| |
  2|CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
  3|CARRIAGE RETURN|'."\r".'|
  4|NO-BREAK SPACE| |
  5|EM SPACE| |
  6|THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|
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
  next->NO-BREAK SPACE| |
  prev->CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
  up->top
 toplevel_directions:
  next->NO-BREAK SPACE| |
  prev->CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
  up->top
5|NO-BREAK SPACE| |
 associated_anchor_command:   
 associated_node:   
 section_directions:
  next->EM SPACE| |
  prev->CARRIAGE RETURN|'."\r".'|
  up->top
 toplevel_directions:
  next->EM SPACE| |
  prev->CARRIAGE RETURN|'."\r".'|
  up->top
6|EM SPACE| |
 associated_anchor_command: ᠎ 
 associated_node: ᠎ 
 section_directions:
  next->THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|
  prev->NO-BREAK SPACE| |
  up->top
 toplevel_directions:
  next->THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|
  prev->NO-BREAK SPACE| |
  up->top
7|THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|
 associated_anchor_command:          　
 associated_node:          　
 section_directions:
  prev->EM SPACE| |
  up->top
 toplevel_directions:
  prev->EM SPACE| |
  up->top
';

$result_sectioning_root{'only_special_spaces_node_transliterate'} = 'level: -1
list:
 1|top
';

$result_headings_list{'only_special_spaces_node_transliterate'} = '';


$result_converted{'info'}->{'only_special_spaces_node_transliterate'} = Encode::encode('utf-8', 'This is , produced from only_special_spaces_node.texi.


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

4 NO-BREAK SPACE| |
*******************


File: ,  Node: ᠎ ,  Next:          　,  Prev:   ,  Up: Top

5 EM SPACE| |
*************


File: ,  Node:          　,  Prev: ᠎ ,  Up: Top

6 THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|
****************************************************************************************************************************************************************


Tag Table:
Node: Top56
Node:    199
Ref: CHARACTER TABULATION| | FORM FEED| | LINE TABULATION| |328
Ref: CARRIAGE RETURN| |445
Node:   488
Node: ᠎ 581
Node:          　702

End Tag Table


Local Variables:
coding: utf-8
End:
');


$result_converted{'html'}->{'only_special_spaces_node_transliterate'} = '<!DOCTYPE html>
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

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_2002_2003_2002" accesskey="n" rel="next">EN QUAD| | EM QUAD| | EN SPACE| |</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#g_t_2002_2003_2002" accesskey="1">EN QUAD| | EM QUAD| | EN SPACE| |</a></li>
<li><a href="#CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c-LINE-TABULATION_007c-_007c" accesskey="2">CHARACTER TABULATION|	| FORM FEED|&#12;| LINE TABULATION||</a></li>
<li><a href="#CARRIAGE-RETURN_007c-_007c" accesskey="3">CARRIAGE RETURN|'."\r".'|</a></li>
<li><a href="#g_t_0085_00a0_1680" accesskey="4">NO-BREAK SPACE| |</a></li>
<li><a href="#g_t_180e_2003" accesskey="5">EM SPACE| |</a></li>
<li><a href="#g_t_2004_2005_2006_2007_2008_2009_200a_202f_205f_3000" accesskey="6">THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="g_t_2002_2003_2002">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
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
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_180e_2003" accesskey="n" rel="next">EM SPACE| |</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="NO_002dBREAK-SPACE_007c-_007c"><span>4 NO-BREAK SPACE| |<a class="copiable-link" href="#NO_002dBREAK-SPACE_007c-_007c"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_180e_2003">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_2004_2005_2006_2007_2008_2009_200a_202f_205f_3000" accesskey="n" rel="next">THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0085_00a0_1680" accesskey="p" rel="prev">NO-BREAK SPACE| |</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="EM-SPACE_007c-_007c"><span>5 EM SPACE| |<a class="copiable-link" href="#EM-SPACE_007c-_007c"> &para;</a></span></h2>

<hr>
</div>
<div class="chapter-level-extent" id="g_t_2004_2005_2006_2007_2008_2009_200a_202f_205f_3000">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_180e_2003" accesskey="p" rel="prev">EM SPACE| |</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="THREE_002dPER_002dEM-SPACE_007c-_007c-FOUR_002dPER_002dEM-SPACE_007c-_007c-SIX_002dPER_002dEM-SPACE_007c-_007c-PUNCTUATION-SPACE_007c-_007c-THIN-SPACE_007c-_007c-HAIR-SPACE_007c-_007c-NARROW-NO_002dBREAK-SPACE_007c-_007c-IDEOGRAPHIC-SPACE_007c-_007c"><span>6 THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| | PUNCTUATION SPACE| | THIN SPACE| | HAIR SPACE| | NARROW NO-BREAK SPACE| | IDEOGRAPHIC SPACE|　|<a class="copiable-link" href="#THREE_002dPER_002dEM-SPACE_007c-_007c-FOUR_002dPER_002dEM-SPACE_007c-_007c-SIX_002dPER_002dEM-SPACE_007c-_007c-PUNCTUATION-SPACE_007c-_007c-THIN-SPACE_007c-_007c-HAIR-SPACE_007c-_007c-NARROW-NO_002dBREAK-SPACE_007c-_007c-IDEOGRAPHIC-SPACE_007c-_007c"> &para;</a></span></h2>


</div>
</div>



</body>
</html>
';

1;
