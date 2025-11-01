use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'special_spaces_in_nodes'} = '*document_root C14
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 special_spaces_in_nodes.texi:l2 {Top }
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top_2002}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument: \\n}
    {Top }
 *@top C2 special_spaces_in_nodes.texi:l3 {top}
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
 *@node C1 special_spaces_in_nodes.texi:l5 {EN QUAD| | EM QUAD| | EN SPACE| |}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{2}
 |normalized:{EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {EN QUAD| | EM QUAD| | EN SPACE| |}
 *@chapter C5 special_spaces_in_nodes.texi:l6 {chap}
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
  {empty_line:\\n}
  *@menu C10 special_spaces_in_nodes.texi:l9
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 special_spaces_in_nodes.texi:l10
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{CHARACTER TABULATION|\\t| FORM FEED|\\f| LINE TABULATION||}
    |normalized:{CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c-LINE-TABULATION_007c-_007c}
     {CHARACTER TABULATION|\\t| FORM FEED|\\f| LINE TABULATION||}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 special_spaces_in_nodes.texi:l11
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{CARRIAGE RETURN|'."\r".'|}
    |normalized:{CARRIAGE-RETURN_007c-_007c}
     {CARRIAGE RETURN|'."\r".'|}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 special_spaces_in_nodes.texi:l12
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |}
    |normalized:{NEXT-LINE-_0028NEL_0029_007c_0085_007c-NO_002dBREAK-SPACE_007c_00a0_007c-OGHAM-SPACE-MARK_007c_1680_007c}
     {NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 special_spaces_in_nodes.texi:l13
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |}
    |normalized:{MONGOLIAN-VOWEL-SEPARATOR_007c_180e_007c-EM-SPACE_007c_2003_007c}
     {MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 special_spaces_in_nodes.texi:l14
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |}
    |normalized:{THREE_002dPER_002dEM-SPACE_007c_2004_007c-FOUR_002dPER_002dEM-SPACE_007c_2005_007c-SIX_002dPER_002dEM-SPACE_007c_2006_007c}
     {THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 special_spaces_in_nodes.texi:l15
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |}
    |normalized:{FIGURE-SPACE_007c_2007_007c-PUNCTUATION-SPACE_007c_2008_007c-THIN-SPACE_007c_2009_007c}
     {FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 special_spaces_in_nodes.texi:l16
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |}
    |normalized:{HAIR-SPACE_007c_200a_007c-LINE-SEPARATOR_007c_2028_007c-PARAGRAPH-SEPARATOR_007c_2029_007c}
     {HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *menu_entry C4 special_spaces_in_nodes.texi:l17
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|}
    |normalized:{NARROW-NO_002dBREAK-SPACE_007c_202f_007c-MEDIUM-MATHEMATICAL-SPACE_007c_205f_007c-IDEOGRAPHIC-SPACE_007c_3000_007c}
     {NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 special_spaces_in_nodes.texi:l18
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
  {empty_line:\\n}
 *@node C2 special_spaces_in_nodes.texi:l20 {CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{3}
 |normalized:{CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c-LINE-TABULATION_007c-_007c}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {CHARACTER TABULATION|\\t| FORM FEED|\\f| LINE TABULATION||}
  {empty_line:\\n}
 *@node C2 special_spaces_in_nodes.texi:l22 {CARRIAGE RETURN|'."\r".'|}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{4}
 |normalized:{CARRIAGE-RETURN_007c-_007c}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {CARRIAGE RETURN|'."\r".'|}
  {empty_line:\\n}
 *@node C2 special_spaces_in_nodes.texi:l24 {NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{5}
 |normalized:{NEXT-LINE-_0028NEL_0029_007c_0085_007c-NO_002dBREAK-SPACE_007c_00a0_007c-OGHAM-SPACE-MARK_007c_1680_007c}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |}
  {empty_line:\\n}
 *@node C2 special_spaces_in_nodes.texi:l26 {MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{6}
 |normalized:{MONGOLIAN-VOWEL-SEPARATOR_007c_180e_007c-EM-SPACE_007c_2003_007c}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |}
  {empty_line:\\n}
 *@node C2 special_spaces_in_nodes.texi:l28 {THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{7}
 |normalized:{THREE_002dPER_002dEM-SPACE_007c_2004_007c-FOUR_002dPER_002dEM-SPACE_007c_2005_007c-SIX_002dPER_002dEM-SPACE_007c_2006_007c}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |}
  {empty_line:\\n}
 *@node C2 special_spaces_in_nodes.texi:l30 {FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{8}
 |normalized:{FIGURE-SPACE_007c_2007_007c-PUNCTUATION-SPACE_007c_2008_007c-THIN-SPACE_007c_2009_007c}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |}
  {empty_line:\\n}
 *@node C2 special_spaces_in_nodes.texi:l32 {HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{9}
 |normalized:{HAIR-SPACE_007c_200a_007c-LINE-SEPARATOR_007c_2028_007c-PARAGRAPH-SEPARATOR_007c_2029_007c}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |}
  {empty_line:\\n}
 *@node C4 special_spaces_in_nodes.texi:l34 {NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{10}
 |normalized:{NARROW-NO_002dBREAK-SPACE_007c_202f_007c-MEDIUM-MATHEMATICAL-SPACE_007c_205f_007c-IDEOGRAPHIC-SPACE_007c_3000_007c}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 special_spaces_in_nodes.texi:l36
    *brace_arg C1
    |EXTRA
    |node_content:{NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |}
    |normalized:{NEXT-LINE-_0028NEL_0029_007c_0085_007c-NO_002dBREAK-SPACE_007c_00a0_007c-OGHAM-SPACE-MARK_007c_1680_007c}
     {NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |}
   {\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg
  |INFO
  |spaces_after_argument:
   |{spaces_after_argument:\\n}
';


$result_texis{'special_spaces_in_nodes'} = '
@node Top  
@top top

@node EN QUAD| | EM QUAD| | EN SPACE| |
@chapter chap


@menu
* CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||::
* CARRIAGE RETURN|'."\r".'|::
* NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |::
* MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |::
* THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |::
* FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |::
* HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |::
* NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|::
@end menu

@node CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||

@node CARRIAGE RETURN|'."\r".'|

@node NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |

@node MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |

@node THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |

@node FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |

@node HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |

@node NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|

@ref{NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |}

@bye
';


$result_texts{'special_spaces_in_nodes'} = 'top
***

1 chap
******


* CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||::
* CARRIAGE RETURN|'."\r".'|::
* NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |::
* MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |::
* THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |::
* FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |::
* HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |::
* NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|::









NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |

';

$result_errors{'special_spaces_in_nodes'} = '';

$result_nodes_list{'special_spaces_in_nodes'} = '1|Top 
 associated_section: top
 associated_title_command: top
 node_directions:
  next->EN QUAD| | EM QUAD| | EN SPACE| |
2|EN QUAD| | EM QUAD| | EN SPACE| |
 associated_section: 1 chap
 associated_title_command: 1 chap
 menus:
  CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
  CARRIAGE RETURN|'."\r".'|
  NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
  MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
  THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |
  FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |
  HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |
  NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|
 node_directions:
  up->Top 
3|CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
 node_directions:
  next->CARRIAGE RETURN|'."\r".'|
  up->EN QUAD| | EM QUAD| | EN SPACE| |
4|CARRIAGE RETURN|'."\r".'|
 node_directions:
  next->NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
  prev->CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||
  up->EN QUAD| | EM QUAD| | EN SPACE| |
5|NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
 node_directions:
  next->MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
  prev->CARRIAGE RETURN|'."\r".'|
  up->EN QUAD| | EM QUAD| | EN SPACE| |
6|MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
 node_directions:
  next->THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |
  prev->NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |
  up->EN QUAD| | EM QUAD| | EN SPACE| |
7|THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |
 node_directions:
  next->FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |
  prev->MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |
  up->EN QUAD| | EM QUAD| | EN SPACE| |
8|FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |
 node_directions:
  next->HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |
  prev->THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |
  up->EN QUAD| | EM QUAD| | EN SPACE| |
9|HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |
 node_directions:
  next->NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|
  prev->FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |
  up->EN QUAD| | EM QUAD| | EN SPACE| |
10|NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|
 node_directions:
  prev->HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |
  up->EN QUAD| | EM QUAD| | EN SPACE| |
';

$result_sections_list{'special_spaces_in_nodes'} = '1|top
 associated_anchor_command: Top 
 associated_node: Top 
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: EN QUAD| | EM QUAD| | EN SPACE| |
 associated_node: EN QUAD| | EM QUAD| | EN SPACE| |
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'special_spaces_in_nodes'} = 'level: -1
list:
 1|top
';

$result_headings_list{'special_spaces_in_nodes'} = '';


$result_converted{'info'}->{'special_spaces_in_nodes'} = 'This is , produced from special_spaces_in_nodes.texi.


File: ,  Node: Top ,  Next: EN QUAD| | EM QUAD| | EN SPACE| |

top
***

* Menu:

* EN QUAD| | EM QUAD| | EN SPACE| |::


File: ,  Node: EN QUAD| | EM QUAD| | EN SPACE| |,  Up: Top 

1 chap
******

* Menu:

* CHARACTER TABULATION|	| FORM FEED|| LINE TABULATION||::
* CARRIAGE RETURN|'."\r".'|::
* NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |::
* MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |::
* THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |::
* FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |::
* HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |::
* NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|::


File: ,  Node: CHARACTER TABULATION| | FORM FEED| | LINE TABULATION| |,  Next: CARRIAGE RETURN| |,  Up: EN QUAD| | EM QUAD| | EN SPACE| |


File: ,  Node: CARRIAGE RETURN| |,  Next: NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |,  Prev: CHARACTER TABULATION| | FORM FEED| | LINE TABULATION| |,  Up: EN QUAD| | EM QUAD| | EN SPACE| |


File: ,  Node: NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |,  Next: MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |,  Prev: CARRIAGE RETURN| |,  Up: EN QUAD| | EM QUAD| | EN SPACE| |


File: ,  Node: MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |,  Next: THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |,  Prev: NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |,  Up: EN QUAD| | EM QUAD| | EN SPACE| |


File: ,  Node: THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |,  Next: FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |,  Prev: MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |,  Up: EN QUAD| | EM QUAD| | EN SPACE| |


File: ,  Node: FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |,  Next: HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |,  Prev: THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |,  Up: EN QUAD| | EM QUAD| | EN SPACE| |


File: ,  Node: HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |,  Next: NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|,  Prev: FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |,  Up: EN QUAD| | EM QUAD| | EN SPACE| |


File: ,  Node: NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|,  Prev: HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |,  Up: EN QUAD| | EM QUAD| | EN SPACE| |

*note NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |::


Tag Table:
Node: Top 55
Node: EN QUAD| | EM QUAD| | EN SPACE| |177
Node: CHARACTER TABULATION| | FORM FEED| | LINE TABULATION| |714
Node: CARRIAGE RETURN| |855
Node: NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |1061
Node: MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |1252
Node: THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |1487
Node: FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |1716
Node: HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |1959
Node: NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|2214

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'special_spaces_in_nodes'} = [
  {
    'error_line' => 'warning: document without Top node
',
    'file_name' => 'special_spaces_in_nodes.texi',
    'text' => 'document without Top node',
    'type' => 'warning'
  }
];



$result_converted{'html'}->{'special_spaces_in_nodes'} = '<!DOCTYPE html>
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

<link href="#Top_2002" rel="start" title="Top ">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="Top_2002">
<div class="nav-panel">
<p>
Next: <a href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c" accesskey="n" rel="next">chap</a> &nbsp; </p>
</div>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c" accesskey="1">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c">
<div class="nav-panel">
<p>
Up: <a href="#Top_2002" accesskey="u" rel="up">top</a> &nbsp; </p>
</div>
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>



<hr>
<a class="node-id" id="CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c-LINE-TABULATION_007c-_007c"></a><div class="nav-panel">
<p>
Next: <a href="#CARRIAGE-RETURN_007c-_007c" accesskey="n" rel="next">CARRIAGE RETURN|'."\r".'|</a>, Up: <a href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c" accesskey="u" rel="up">chap</a> &nbsp; </p>
</div>
<h4 class="node"><span>CHARACTER TABULATION|	| FORM FEED|&#12;| LINE TABULATION||<a class="copiable-link" href="#CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c-LINE-TABULATION_007c-_007c"> &para;</a></span></h4>

<hr>
<a class="node-id" id="CARRIAGE-RETURN_007c-_007c"></a><div class="nav-panel">
<p>
Next: <a href="#NEXT-LINE-_0028NEL_0029_007c_0085_007c-NO_002dBREAK-SPACE_007c_00a0_007c-OGHAM-SPACE-MARK_007c_1680_007c" accesskey="n" rel="next">NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |</a>, Previous: <a href="#CHARACTER-TABULATION_007c-_007c-FORM-FEED_007c-_007c-LINE-TABULATION_007c-_007c" accesskey="p" rel="prev">CHARACTER TABULATION|	| FORM FEED|&#12;| LINE TABULATION||</a>, Up: <a href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c" accesskey="u" rel="up">chap</a> &nbsp; </p>
</div>
<h4 class="node"><span>CARRIAGE RETURN|'."\r".'|<a class="copiable-link" href="#CARRIAGE-RETURN_007c-_007c"> &para;</a></span></h4>

<hr>
<a class="node-id" id="NEXT-LINE-_0028NEL_0029_007c_0085_007c-NO_002dBREAK-SPACE_007c_00a0_007c-OGHAM-SPACE-MARK_007c_1680_007c"></a><div class="nav-panel">
<p>
Next: <a href="#MONGOLIAN-VOWEL-SEPARATOR_007c_180e_007c-EM-SPACE_007c_2003_007c" accesskey="n" rel="next">MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |</a>, Previous: <a href="#CARRIAGE-RETURN_007c-_007c" accesskey="p" rel="prev">CARRIAGE RETURN|'."\r".'|</a>, Up: <a href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c" accesskey="u" rel="up">chap</a> &nbsp; </p>
</div>
<h4 class="node"><span>NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |<a class="copiable-link" href="#NEXT-LINE-_0028NEL_0029_007c_0085_007c-NO_002dBREAK-SPACE_007c_00a0_007c-OGHAM-SPACE-MARK_007c_1680_007c"> &para;</a></span></h4>

<hr>
<a class="node-id" id="MONGOLIAN-VOWEL-SEPARATOR_007c_180e_007c-EM-SPACE_007c_2003_007c"></a><div class="nav-panel">
<p>
Next: <a href="#THREE_002dPER_002dEM-SPACE_007c_2004_007c-FOUR_002dPER_002dEM-SPACE_007c_2005_007c-SIX_002dPER_002dEM-SPACE_007c_2006_007c" accesskey="n" rel="next">THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |</a>, Previous: <a href="#NEXT-LINE-_0028NEL_0029_007c_0085_007c-NO_002dBREAK-SPACE_007c_00a0_007c-OGHAM-SPACE-MARK_007c_1680_007c" accesskey="p" rel="prev">NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |</a>, Up: <a href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c" accesskey="u" rel="up">chap</a> &nbsp; </p>
</div>
<h4 class="node"><span>MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |<a class="copiable-link" href="#MONGOLIAN-VOWEL-SEPARATOR_007c_180e_007c-EM-SPACE_007c_2003_007c"> &para;</a></span></h4>

<hr>
<a class="node-id" id="THREE_002dPER_002dEM-SPACE_007c_2004_007c-FOUR_002dPER_002dEM-SPACE_007c_2005_007c-SIX_002dPER_002dEM-SPACE_007c_2006_007c"></a><div class="nav-panel">
<p>
Next: <a href="#FIGURE-SPACE_007c_2007_007c-PUNCTUATION-SPACE_007c_2008_007c-THIN-SPACE_007c_2009_007c" accesskey="n" rel="next">FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |</a>, Previous: <a href="#MONGOLIAN-VOWEL-SEPARATOR_007c_180e_007c-EM-SPACE_007c_2003_007c" accesskey="p" rel="prev">MONGOLIAN VOWEL SEPARATOR|᠎| EM SPACE| |</a>, Up: <a href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c" accesskey="u" rel="up">chap</a> &nbsp; </p>
</div>
<h4 class="node"><span>THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |<a class="copiable-link" href="#THREE_002dPER_002dEM-SPACE_007c_2004_007c-FOUR_002dPER_002dEM-SPACE_007c_2005_007c-SIX_002dPER_002dEM-SPACE_007c_2006_007c"> &para;</a></span></h4>

<hr>
<a class="node-id" id="FIGURE-SPACE_007c_2007_007c-PUNCTUATION-SPACE_007c_2008_007c-THIN-SPACE_007c_2009_007c"></a><div class="nav-panel">
<p>
Next: <a href="#HAIR-SPACE_007c_200a_007c-LINE-SEPARATOR_007c_2028_007c-PARAGRAPH-SEPARATOR_007c_2029_007c" accesskey="n" rel="next">HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |</a>, Previous: <a href="#THREE_002dPER_002dEM-SPACE_007c_2004_007c-FOUR_002dPER_002dEM-SPACE_007c_2005_007c-SIX_002dPER_002dEM-SPACE_007c_2006_007c" accesskey="p" rel="prev">THREE-PER-EM SPACE| | FOUR-PER-EM SPACE| | SIX-PER-EM SPACE| |</a>, Up: <a href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c" accesskey="u" rel="up">chap</a> &nbsp; </p>
</div>
<h4 class="node"><span>FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |<a class="copiable-link" href="#FIGURE-SPACE_007c_2007_007c-PUNCTUATION-SPACE_007c_2008_007c-THIN-SPACE_007c_2009_007c"> &para;</a></span></h4>

<hr>
<a class="node-id" id="HAIR-SPACE_007c_200a_007c-LINE-SEPARATOR_007c_2028_007c-PARAGRAPH-SEPARATOR_007c_2029_007c"></a><div class="nav-panel">
<p>
Next: <a href="#NARROW-NO_002dBREAK-SPACE_007c_202f_007c-MEDIUM-MATHEMATICAL-SPACE_007c_205f_007c-IDEOGRAPHIC-SPACE_007c_3000_007c" accesskey="n" rel="next">NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|</a>, Previous: <a href="#FIGURE-SPACE_007c_2007_007c-PUNCTUATION-SPACE_007c_2008_007c-THIN-SPACE_007c_2009_007c" accesskey="p" rel="prev">FIGURE SPACE| | PUNCTUATION SPACE| | THIN SPACE| |</a>, Up: <a href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c" accesskey="u" rel="up">chap</a> &nbsp; </p>
</div>
<h4 class="node"><span>HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |<a class="copiable-link" href="#HAIR-SPACE_007c_200a_007c-LINE-SEPARATOR_007c_2028_007c-PARAGRAPH-SEPARATOR_007c_2029_007c"> &para;</a></span></h4>

<hr>
<a class="node-id" id="NARROW-NO_002dBREAK-SPACE_007c_202f_007c-MEDIUM-MATHEMATICAL-SPACE_007c_205f_007c-IDEOGRAPHIC-SPACE_007c_3000_007c"></a><div class="nav-panel">
<p>
Previous: <a href="#HAIR-SPACE_007c_200a_007c-LINE-SEPARATOR_007c_2028_007c-PARAGRAPH-SEPARATOR_007c_2029_007c" accesskey="p" rel="prev">HAIR SPACE| | LINE SEPARATOR| | PARAGRAPH SEPARATOR| |</a>, Up: <a href="#EN-QUAD_007c_2002_007c-EM-QUAD_007c_2003_007c-EN-SPACE_007c_2002_007c" accesskey="u" rel="up">chap</a> &nbsp; </p>
</div>
<h4 class="node"><span>NARROW NO-BREAK SPACE| | MEDIUM MATHEMATICAL SPACE| | IDEOGRAPHIC SPACE|　|<a class="copiable-link" href="#NARROW-NO_002dBREAK-SPACE_007c_202f_007c-MEDIUM-MATHEMATICAL-SPACE_007c_205f_007c-IDEOGRAPHIC-SPACE_007c_3000_007c"> &para;</a></span></h4>

<p><a class="ref" href="#NEXT-LINE-_0028NEL_0029_007c_0085_007c-NO_002dBREAK-SPACE_007c_00a0_007c-OGHAM-SPACE-MARK_007c_1680_007c">NEXT LINE (NEL)|| NO-BREAK SPACE| | OGHAM SPACE MARK| |</a>
</p>
</div>
</div>



</body>
</html>
';

1;
