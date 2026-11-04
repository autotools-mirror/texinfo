use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'all_spaces'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C2
   *@documentencoding C1 all_spaces.texi:l1
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C3
     {spaces_before_argument: }
     {utf-8}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 all_spaces.texi:l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@node C58 all_spaces.texi:l4 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {CHARACTER TABULATION: |\\t|\\n}
  {empty_line:\\n}
  *paragraph C2
   {LINE FEED (LF): |\\n}
   {|\\n}
  {empty_line:\\n}
  *paragraph C1
   {LINE TABULATION: ||\\n}
  {empty_line:\\n}
  *paragraph C1
   {FORM FEED (FF): |}
  {empty_line:\\f}
  *paragraph C1
   {|\\n}
  {empty_line:\\n}
  *paragraph C1
   {CARRIAGE RETURN (CR): |'."\r".'|\\n}
  {empty_line:\\n}
  *paragraph C1
   {SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {NEXT LINE (NEL): ||\\n}
  {empty_line:\\n}
  *paragraph C1
   {NO-BREAK SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {OGHAM SPACE MARK: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {MONGOLIAN VOWEL SEPARATOR: |᠎|\\n}
  {empty_line:\\n}
  *paragraph C1
   {EN QUAD: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {EM QUAD: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {EN SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {EM SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {THREE-PER-EM SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {FOUR-PER-EM SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {SIX-PER-EM SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {FIGURE SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {PUNCTUATION SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {THIN SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {HAIR SPACE: | |\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:Perl and C code give different width.}
    {spaces_after_argument:\\n}
  *paragraph C1
   {LINE SEPARATOR: | |\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:Perl and C code give different width.}
    {spaces_after_argument:\\n}
  *paragraph C1
   {PARAGRAPH SEPARATOR: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {NARROW NO-BREAK SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {MEDIUM MATHEMATICAL SPACE: | |\\n}
  {empty_line:\\n}
  *paragraph C1
   {IDEOGRAPHIC SPACE: |　|\\n}
  {empty_line:\\n}
';


$result_texis{'all_spaces'} = '@documentencoding utf-8

@node Top
@node chap

CHARACTER TABULATION: |	|

LINE FEED (LF): |
|

LINE TABULATION: ||

FORM FEED (FF): ||

CARRIAGE RETURN (CR): |'."\r".'|

SPACE: | |

NEXT LINE (NEL): ||

NO-BREAK SPACE: | |

OGHAM SPACE MARK: | |

MONGOLIAN VOWEL SEPARATOR: |᠎|

EN QUAD: | |

EM QUAD: | |

EN SPACE: | |

EM SPACE: | |

THREE-PER-EM SPACE: | |

FOUR-PER-EM SPACE: | |

SIX-PER-EM SPACE: | |

FIGURE SPACE: | |

PUNCTUATION SPACE: | |

THIN SPACE: | |

HAIR SPACE: | |

@c Perl and C code give different width.
LINE SEPARATOR: | |

@c Perl and C code give different width.
PARAGRAPH SEPARATOR: | |

NARROW NO-BREAK SPACE: | |

MEDIUM MATHEMATICAL SPACE: | |

IDEOGRAPHIC SPACE: |　|

';


$result_texts{'all_spaces'} = '

CHARACTER TABULATION: |	|

LINE FEED (LF): |
|

LINE TABULATION: ||

FORM FEED (FF): ||

CARRIAGE RETURN (CR): |'."\r".'|

SPACE: | |

NEXT LINE (NEL): ||

NO-BREAK SPACE: | |

OGHAM SPACE MARK: | |

MONGOLIAN VOWEL SEPARATOR: |᠎|

EN QUAD: | |

EM QUAD: | |

EN SPACE: | |

EM SPACE: | |

THREE-PER-EM SPACE: | |

FOUR-PER-EM SPACE: | |

SIX-PER-EM SPACE: | |

FIGURE SPACE: | |

PUNCTUATION SPACE: | |

THIN SPACE: | |

HAIR SPACE: | |

LINE SEPARATOR: | |

PARAGRAPH SEPARATOR: | |

NARROW NO-BREAK SPACE: | |

MEDIUM MATHEMATICAL SPACE: | |

IDEOGRAPHIC SPACE: |　|

';

$result_errors{'all_spaces'} = '* W all_spaces.texi:l4|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'all_spaces'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'all_spaces'} = '';

$result_sectioning_root{'all_spaces'} = '';

$result_headings_list{'all_spaces'} = '';

1;
