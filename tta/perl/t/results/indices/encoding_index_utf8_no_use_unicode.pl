use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'encoding_index_utf8_no_use_unicode'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *@documentencoding C1 encoding_index_utf8.texi:l2
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:utf-8}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 encoding_index_utf8.texi:l4 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 encoding_index_utf8.texi:l5 {encoding index utf8}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:encoding index utf8}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C59 encoding_index_utf8.texi:l7 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l9
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:é é}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l10
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,2}
   *line_arg C7
    {spaces_before_argument: }
    *@" C1 encoding_index_utf8.texi:l10
     *brace_container C1
      {normal_text:i}
    {normal_text: }
    *@" C1 encoding_index_utf8.texi:l10
     *brace_container C1
      {normal_text:i}
    *@" C1 encoding_index_utf8.texi:l10
     *brace_container C1
      {normal_text:i}
    *@" C1 encoding_index_utf8.texi:l10
     *brace_container C1
      {normal_text:i}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l11
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,3}
   *line_arg C8
    {spaces_before_argument: }
    *@^ C1 encoding_index_utf8.texi:l11
     *following_arg C1
      {normal_text:i}
    {normal_text: }
    *@^ C1 encoding_index_utf8.texi:l11
     *following_arg C1
      {normal_text:i}
    *@^ C1 encoding_index_utf8.texi:l11
     *following_arg C1
      {normal_text:i}
    *@^ C1 encoding_index_utf8.texi:l11
     *following_arg C1
      {normal_text:i}
    *@^ C1 encoding_index_utf8.texi:l11
     *following_arg C1
      {normal_text:i}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l12
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l13
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,5}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:b}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l14
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,6}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:c}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l15
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,7}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:d}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l16
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,8}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:e}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l17
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,9}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:f}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l18
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,10}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:g}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l19
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,11}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:h}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l20
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,12}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:i}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l21
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,13}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:j}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l22
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,14}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:k}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l23
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,15}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:l}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l24
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,16}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:m}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l25
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,17}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:n}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l26
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,18}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:o}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l27
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,19}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:p}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l28
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,20}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:q}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l29
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,21}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:r}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l30
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,22}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:s}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l31
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,23}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:t}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l32
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,24}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:u}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l33
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,25}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:v}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l34
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,26}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:w}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l35
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,27}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:x}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l36
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,28}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:y}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l37
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,29}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:z}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l38
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,30}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l39
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,31}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:B}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l40
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,32}
   *line_arg C3
    {spaces_before_argument: }
    *@l C1 encoding_index_utf8.texi:l40
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l41
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,33}
   *line_arg C3
    {spaces_before_argument: }
    *@L C1 encoding_index_utf8.texi:l41
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l42
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,34}
   *line_arg C6
    {spaces_before_argument: }
    *@dotless C1 encoding_index_utf8.texi:l42
     *brace_container C1
      {normal_text:i}
    {normal_text: }
    *@dotless C1 encoding_index_utf8.texi:l42
     *brace_container C1
      {normal_text:i}
    {normal_text: (dotless)}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l43
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,35}
   *line_arg C6
    {spaces_before_argument: }
    *@^ C1 encoding_index_utf8.texi:l43
     *brace_container C1
      *@dotless C1 encoding_index_utf8.texi:l43
       *brace_container C1
        {normal_text:i}
    {normal_text: }
    *@^ C1 encoding_index_utf8.texi:l43
     *brace_container C1
      *@dotless C1 encoding_index_utf8.texi:l43
       *brace_container C1
        {normal_text:i}
    {normal_text: (dotless)}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l44
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,36}
   *line_arg C3
    {spaces_before_argument: }
    *@ss C1 encoding_index_utf8.texi:l44
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l45
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,37}
   *line_arg C3
    {spaces_before_argument: }
    *@euro C1 encoding_index_utf8.texi:l45
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l46
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,38}
   *line_arg C3
    {spaces_before_argument: }
    *@AE C1 encoding_index_utf8.texi:l46
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l47
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,39}
   *line_arg C3
    {spaces_before_argument: }
    *@exclamdown C1 encoding_index_utf8.texi:l47
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l48
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,40}
   *line_arg C3
    {spaces_before_argument: }
    *@TH C1 encoding_index_utf8.texi:l48
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l49
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,41}
   *line_arg C3
    {spaces_before_argument: }
    *@DH C1 encoding_index_utf8.texi:l49
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l50
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,42}
   *line_arg C3
    {spaces_before_argument: }
    *@textdegree C1 encoding_index_utf8.texi:l50
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l51
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,43}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:0}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l52
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,44}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:9}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l53
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,45}
   *line_arg C3
    {spaces_before_argument: }
    *@quotedblleft C1 encoding_index_utf8.texi:l53
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l54
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,46}
   *line_arg C3
    {spaces_before_argument: }
    *@geq C1 encoding_index_utf8.texi:l54
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l55
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,47}
   *line_arg C3
    {spaces_before_argument: }
    *@comma C1 encoding_index_utf8.texi:l55
     *brace_container
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l56
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,48}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:``}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l57
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,49}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:`}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l58
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,50}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:\'}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l59
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,51}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:\'\'}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l60
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,52}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:"}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l61
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,53}
   *line_arg C3
    {spaces_before_argument: }
    *@@
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l62
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,54}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:--}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 encoding_index_utf8.texi:l63
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,55}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:---}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 encoding_index_utf8.texi:l65
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'encoding_index_utf8_no_use_unicode'} = '
@documentencoding utf-8

@node Top
@top encoding index utf8

@node chap

@cindex é é
@cindex @"{i} @"{i}@"{i}@"{i}
@cindex @^i @^i@^i@^i@^i
@cindex a
@cindex b
@cindex c
@cindex d
@cindex e
@cindex f
@cindex g
@cindex h
@cindex i
@cindex j
@cindex k
@cindex l
@cindex m
@cindex n
@cindex o
@cindex p
@cindex q
@cindex r
@cindex s
@cindex t
@cindex u
@cindex v
@cindex w
@cindex x
@cindex y
@cindex z
@cindex A
@cindex B
@cindex @l{}
@cindex @L{}
@cindex @dotless{i} @dotless{i} (dotless)
@cindex @^{@dotless{i}} @^{@dotless{i}} (dotless)
@cindex @ss{}
@cindex @euro{}
@cindex @AE{}
@cindex @exclamdown{}
@cindex @TH{}
@cindex @DH{}
@cindex @textdegree{}
@cindex 0
@cindex 9
@cindex @quotedblleft{}
@cindex @geq{}
@cindex @comma{}
@cindex ``
@cindex `
@cindex \'
@cindex \'\'
@cindex "
@cindex @@
@cindex --
@cindex ---

@printindex cp
@bye
';


$result_texts{'encoding_index_utf8_no_use_unicode'} = '
encoding index utf8
*******************



';

$result_errors{'encoding_index_utf8_no_use_unicode'} = '* W encoding_index_utf8.texi:l7|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'encoding_index_utf8_no_use_unicode'} = '1|Top
 associated_section: encoding index utf8
 associated_title_command: encoding index utf8
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'encoding_index_utf8_no_use_unicode'} = '1|encoding index utf8
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'encoding_index_utf8_no_use_unicode'} = 'level: -1
list:
 1|encoding index utf8
';

$result_headings_list{'encoding_index_utf8_no_use_unicode'} = '';

$result_indices_sort_strings{'encoding_index_utf8_no_use_unicode'} = 'cp:
 "
 "
 "
 \'
 ,
 -
 --
 0
 9
 @
 `
 ¡
 °
 “
 €
 ≥
 A
 B
 a
 b
 c
 d
 e
 f
 g
 h
 i
 j
 k
 l
 m
 n
 o
 p
 q
 r
 s
 t
 u
 v
 w
 x
 y
 z
 Æ
 Ð
 Þ
 ß
 é é
 î î (dotless)
 î îîîî
 ï ïïï
 ı ı (dotless)
 Ł
 ł
';

$result_converted_sort_strings{'file_html'}->{'encoding_index_utf8_no_use_unicode'} = 'cp:
 "
 "
 "
 \'
 ,
 -
 --
 0
 9
 @
 `
 ¡
 °
 “
 €
 ≥
 A
 B
 a
 b
 c
 d
 e
 f
 g
 h
 i
 j
 k
 l
 m
 n
 o
 p
 q
 r
 s
 t
 u
 v
 w
 x
 y
 z
 Æ
 Ð
 Þ
 ß
 é é
 î î (dotless)
 î îîîî
 ï ïïï
 ı ı (dotless)
 Ł
 ł
';

$result_converted_sort_strings{'file_plaintext'}->{'encoding_index_utf8_no_use_unicode'} = 'cp:
 "
 "
 "
 \'
 ,
 -
 --
 0
 9
 @
 `
 ¡
 °
 “
 €
 ≥
 A
 B
 a
 b
 c
 d
 e
 f
 g
 h
 i
 j
 k
 l
 m
 n
 o
 p
 q
 r
 s
 t
 u
 v
 w
 x
 y
 z
 Æ
 Ð
 Þ
 ß
 é é
 î î (dotless)
 î îîîî
 ï ïïï
 ı ı (dotless)
 Ł
 ł
';

$result_converted_sort_strings{'file_info'}->{'encoding_index_utf8_no_use_unicode'} = 'cp:
 "
 "
 "
 \'
 ,
 -
 --
 0
 9
 @
 `
 ¡
 °
 “
 €
 ≥
 A
 B
 a
 b
 c
 d
 e
 f
 g
 h
 i
 j
 k
 l
 m
 n
 o
 p
 q
 r
 s
 t
 u
 v
 w
 x
 y
 z
 Æ
 Ð
 Þ
 ß
 é é
 î î (dotless)
 î îîîî
 ï ïïï
 ı ı (dotless)
 Ł
 ł
';

1;
