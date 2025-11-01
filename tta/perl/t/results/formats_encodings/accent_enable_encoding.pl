use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'accent_enable_encoding'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first}
 *@top C77 l2 {top}
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
  *paragraph C5
   {should be e`: }
   *@` C1 l4
    *brace_container C1
     {e}
   { }
   *@` C1 l4
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e\': }
   *@\' C1 l6
    *brace_container C1
     {e}
   { }
   *@\' C1 l6
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e^: }
   *@^ C1 l8
    *brace_container C1
     {e}
   { }
   *@^ C1 l8
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be u": }
   *@" C1 l10
    *brace_container C1
     {u}
   { }
   *@" C1 l10
    *following_arg C1
     {u}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be i`: }
   *@` C1 l12
    *brace_container C1
     {i}
   { }
   *@` C1 l12
    *following_arg C1
     {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be i\': }
   *@\' C1 l14
    *brace_container C1
     {i}
   { }
   *@\' C1 l14
    *following_arg C1
     {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be i^: }
   *@^ C1 l16
    *brace_container C1
     {i}
   { }
   *@^ C1 l16
    *following_arg C1
     {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be u": }
   *@" C1 l18
    *brace_container C1
     {u}
   { }
   *@" C1 l18
    *following_arg C1
     {u}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be c,: }
   *@, C1 l20
    *brace_container C1
     {c}
   { }
   *@, C1 l20
    *following_arg C1
     {c}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be n~: }
   *@~ C1 l22
    *brace_container C1
     {n}
   { }
   *@~ C1 l22
    *following_arg C1
     {n}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e=: }
   *@= C1 l24
    *brace_container C1
     {e}
   { }
   *@= C1 l24
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C7
   {should be e}
   *@w C1 l26
    *brace_container C1
     {\'}
   {\': }
   *@H C1 l26
    *brace_container C1
     {e}
   { }
   *@H C1 l26
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e.: }
   *@dotaccent C1 l28
    *brace_container C1
     {e}
   { }
   *@dotaccent C1 l28
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e*: }
   *@ringaccent C1 l30
    *brace_container C1
     {e}
   { }
   *@ringaccent C1 l30
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be ee[: }
   *@tieaccent C1 l32
    *brace_container C1
     {ee}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e(: }
   *@u C1 l34
    *brace_container C1
     {e}
   { }
   *@u C1 l34
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e_: }
   *@ubaraccent C1 l36
    *brace_container C1
     {e}
   { }
   *@ubaraccent C1 l36
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be .e: }
   *@udotaccent C1 l38
    *brace_container C1
     {e}
   { }
   *@udotaccent C1 l38
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e<: }
   *@v C1 l40
    *brace_container C1
     {e}
   { }
   *@v C1 l40
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be a; : }
   *@ogonek C1 l42
    *brace_container C1
     {a}
   { }
   *@ogonek C1 l42
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *following_arg C1
     {a}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e; : }
   *@ogonek C1 l44
    *brace_container C1
     {e}
   { }
   *@ogonek C1 l44
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {upside down: }
   *@questiondown C1 l46
    *brace_container
   { }
   *@exclamdown C1 l46
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {A-with-circle: }
   *@aa C1 l48
    *brace_container
   {,}
   *@AA C1 l48
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C9
   {AE, OE ligatures: }
   *@ae C1 l50
    *brace_container
   { }
   *@AE C1 l50
    *brace_container
   { }
   *@oe C1 l50
    *brace_container
   { }
   *@OE C1 l50
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {dotless i, j: }
   *@dotless C1 l52
    *brace_container C1
     {i}
   { }
   *@dotless C1 l52
    *brace_container C1
     {j}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {Polish suppressed-L: }
   *@l C1 l54
    *brace_container
   { }
   *@L C1 l54
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {O-with-slash: }
   *@o C1 l56
    *brace_container
   { }
   *@O C1 l56
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {es-zet or sharp S: }
   *@ss C1 l58
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {pounds sterling: }
   *@pounds C1 l60
    *brace_container
   {\\n}
  {empty_line:\\n}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:arg is command -- @dotless{i} is special-cased for HTML}
  *paragraph C3
   {should be dotless i`: }
   *@` C1 l63
    *brace_container C1
     *@dotless C1 l63
      *brace_container C1
       {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless i\': }
   *@\' C1 l65
    *brace_container C1
     *@dotless C1 l65
      *brace_container C1
       {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless i^: }
   *@^ C1 l67
    *brace_container C1
     *@dotless C1 l67
      *brace_container C1
       {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless i": }
   *@" C1 l69
    *brace_container C1
     *@dotless C1 l69
      *brace_container C1
       {i}
   {\\n}
  {empty_line:\\n}
  *@c C1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {rawline_text:arg is command -- @dotless{j}}
  *paragraph C3
   {should be dotless j`: }
   *@` C1 l72
    *brace_container C1
     *@dotless C1 l72
      *brace_container C1
       {j}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless j\': }
   *@\' C1 l74
    *brace_container C1
     *@dotless C1 l74
      *brace_container C1
       {j}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless j^: }
   *@^ C1 l76
    *brace_container C1
     *@dotless C1 l76
      *brace_container C1
       {j}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless j": }
   *@" C1 l78
    *brace_container C1
     *@dotless C1 l78
      *brace_container C1
       {j}
   {\\n}
';


$result_texis{'accent_enable_encoding'} = '@node first
@top top

should be e`: @`{e} @`e

should be e\': @\'{e} @\'e

should be e^: @^{e} @^e

should be u": @"{u} @"u

should be i`: @`{i} @`i

should be i\': @\'{i} @\'i

should be i^: @^{i} @^i

should be u": @"{u} @"u

should be c,: @,{c} @,c

should be n~: @~{n} @~n

should be e=: @={e} @=e

should be e@w{\'}\': @H{e} @H e

should be e.: @dotaccent{e} @dotaccent e

should be e*: @ringaccent{e} @ringaccent e

should be ee[: @tieaccent{ee}

should be e(: @u{e} @u e

should be e_: @ubaraccent{e} @ubaraccent e

should be .e: @udotaccent{e} @udotaccent e

should be e<: @v{e} @v e

should be a; : @ogonek{a} @ogonek a

should be e; : @ogonek{e} @ogonek e

upside down: @questiondown{} @exclamdown{}

A-with-circle: @aa{},@AA{}

AE, OE ligatures: @ae{} @AE{} @oe{} @OE{}

dotless i, j: @dotless{i} @dotless{j}

Polish suppressed-L: @l{} @L{}

O-with-slash: @o{} @O{}

es-zet or sharp S: @ss{}

pounds sterling: @pounds{}

@c arg is command -- @dotless{i} is special-cased for HTML
should be dotless i`: @`{@dotless{i}}

should be dotless i\': @\'{@dotless{i}}

should be dotless i^: @^{@dotless{i}}

should be dotless i": @"{@dotless{i}}

@c arg is command -- @dotless{j}
should be dotless j`: @`{@dotless{j}}

should be dotless j\': @\'{@dotless{j}}

should be dotless j^: @^{@dotless{j}}

should be dotless j": @"{@dotless{j}}
';


$result_texts{'accent_enable_encoding'} = 'top
***

should be e`: e` e`

should be e\': e\' e\'

should be e^: e^ e^

should be u": u" u"

should be i`: i` i`

should be i\': i\' i\'

should be i^: i^ i^

should be u": u" u"

should be c,: c, c,

should be n~: n~ n~

should be e=: e= e=

should be e\'\': e\'\' e\'\'

should be e.: e. e.

should be e*: e* e*

should be ee[: ee[

should be e(: e( e(

should be e_: e_ e_

should be .e: .e .e

should be e<: e< e<

should be a; : a; a;

should be e; : e; e;

upside down: ? !

A-with-circle: aa,AA

AE, OE ligatures: ae AE oe OE

dotless i, j: i j

Polish suppressed-L: /l /L

O-with-slash: /o /O

es-zet or sharp S: ss

pounds sterling: #

should be dotless i`: i`

should be dotless i\': i\'

should be dotless i^: i^

should be dotless i": i"

should be dotless j`: j`

should be dotless j\': j\'

should be dotless j^: j^

should be dotless j": j"
';

$result_errors{'accent_enable_encoding'} = '';

$result_nodes_list{'accent_enable_encoding'} = '1|first
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'accent_enable_encoding'} = '1|top
 associated_anchor_command: first
 associated_node: first
';

$result_sectioning_root{'accent_enable_encoding'} = 'level: -1
list:
 1|top
';

$result_headings_list{'accent_enable_encoding'} = '';


$result_converted{'plaintext'}->{'accent_enable_encoding'} = 'top
***

should be e\': è è

   should be e\': é é

   should be e^: ê ê

   should be u": ü ü

   should be i\': ì ì

   should be i\': í í

   should be i^: î î

   should be u": ü ü

   should be c,: ç ç

   should be n~: ñ ñ

   should be e=: ē ē

   should be e\'\': e̋ e̋

   should be e.: ė ė

   should be e*: e̊ e̊

   should be ee[: e͡e

   should be e(: ĕ ĕ

   should be e_: e̲ e̲

   should be .e: ẹ ẹ

   should be e<: ě ě

   should be a; : ą ą

   should be e; : ę ę

   upside down: ¿  ¡

   A-with-circle: å,Å

   AE, OE ligatures: æ Æ œ Œ

   dotless i, j: ı ȷ

   Polish suppressed-L: ł Ł

   O-with-slash: ø Ø

   es-zet or sharp S: ß

   pounds sterling: £

   should be dotless i\': ì

   should be dotless i\': í

   should be dotless i^: î

   should be dotless i": ï

   should be dotless j\': j̀

   should be dotless j\': j́

   should be dotless j^: ĵ

   should be dotless j": j̈
';


$result_converted{'html_text'}->{'accent_enable_encoding'} = '<div class="top-level-extent" id="first">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> ¶</a></span></h1>

<p>should be e‘: è è
</p>
<p>should be e’: é é
</p>
<p>should be e^: ê ê
</p>
<p>should be u&quot;: ü ü
</p>
<p>should be i‘: ì ì
</p>
<p>should be i’: í í
</p>
<p>should be i^: î î
</p>
<p>should be u&quot;: ü ü
</p>
<p>should be c,: ç ç
</p>
<p>should be n~: ñ ñ
</p>
<p>should be e=: ē ē
</p>
<p>should be e’<!-- /@w -->’: e̋ e̋
</p>
<p>should be e.: ė ė
</p>
<p>should be e*: e̊ e̊
</p>
<p>should be ee[: e͡e
</p>
<p>should be e(: ĕ ĕ
</p>
<p>should be e_: e̲ e̲
</p>
<p>should be .e: ẹ ẹ
</p>
<p>should be e&lt;: ě ě
</p>
<p>should be a; : ą ą
</p>
<p>should be e; : ę ę
</p>
<p>upside down: ¿ ¡
</p>
<p>A-with-circle: å,Å
</p>
<p>AE, OE ligatures: æ Æ œ Œ
</p>
<p>dotless i, j: ı ȷ
</p>
<p>Polish suppressed-L: ł Ł
</p>
<p>O-with-slash: ø Ø
</p>
<p>es-zet or sharp S: ß
</p>
<p>pounds sterling: £
</p>
<p>should be dotless i‘: ì
</p>
<p>should be dotless i’: í
</p>
<p>should be dotless i^: î
</p>
<p>should be dotless i&quot;: ï
</p>
<p>should be dotless j‘: j̀
</p>
<p>should be dotless j’: j́
</p>
<p>should be dotless j^: ĵ
</p>
<p>should be dotless j&quot;: j̈
</p></div>
';


$result_converted{'xml'}->{'accent_enable_encoding'} = '<node identifier="first" spaces=" "><nodename>first</nodename></node>
<top spaces=" "><sectiontitle>top</sectiontitle>

<para>should be e&textlsquo;: è è
</para>
<para>should be e&textrsquo;: é é
</para>
<para>should be e^: ê ê
</para>
<para>should be u&quot;: ü ü
</para>
<para>should be i&textlsquo;: ì ì
</para>
<para>should be i&textrsquo;: í í
</para>
<para>should be i^: î î
</para>
<para>should be u&quot;: ü ü
</para>
<para>should be c,: ç ç
</para>
<para>should be n~: ñ ñ
</para>
<para>should be e=: ē ē
</para>
<para>should be e<w>&textrsquo;</w>&textrsquo;: e̋ e̋
</para>
<para>should be e.: ė ė
</para>
<para>should be e*: e̊ e̊
</para>
<para>should be ee[: e͡e
</para>
<para>should be e(: ĕ ĕ
</para>
<para>should be e_: e̲ e̲
</para>
<para>should be .e: ẹ ẹ
</para>
<para>should be e&lt;: ě ě
</para>
<para>should be a; : ą ą
</para>
<para>should be e; : ę ę
</para>
<para>upside down: &iquest; &iexcl;
</para>
<para>A-with-circle: &aring;,&Aring;
</para>
<para>AE, OE ligatures: &aelig; &AElig; &oelig; &OElig;
</para>
<para>dotless i, j: <dotless>i</dotless> <dotless>j</dotless>
</para>
<para>Polish suppressed-L: &lslash; &Lslash;
</para>
<para>O-with-slash: &oslash; &Oslash;
</para>
<para>es-zet or sharp S: &szlig;
</para>
<para>pounds sterling: &pound;
</para>
<!-- c arg is command - @dotless{i} is special-cased for HTML -->
<para>should be dotless i&textlsquo;: ì
</para>
<para>should be dotless i&textrsquo;: í
</para>
<para>should be dotless i^: î
</para>
<para>should be dotless i&quot;: ï
</para>
<!-- c arg is command - @dotless{j} -->
<para>should be dotless j&textlsquo;: j̀
</para>
<para>should be dotless j&textrsquo;: j́
</para>
<para>should be dotless j^: ĵ
</para>
<para>should be dotless j&quot;: j̈
</para></top>
';


$result_converted{'docbook'}->{'accent_enable_encoding'} = '<chapter label="" id="first">
<title>top</title>

<para>should be e&#8216;: è è
</para>
<para>should be e&#8217;: é é
</para>
<para>should be e^: ê ê
</para>
<para>should be u&quot;: ü ü
</para>
<para>should be i&#8216;: ì ì
</para>
<para>should be i&#8217;: í í
</para>
<para>should be i^: î î
</para>
<para>should be u&quot;: ü ü
</para>
<para>should be c,: ç ç
</para>
<para>should be n~: ñ ñ
</para>
<para>should be e=: ē ē
</para>
<para>should be e&#8217;<!-- /@w -->&#8217;: e̋ e̋
</para>
<para>should be e.: ė ė
</para>
<para>should be e*: e̊ e̊
</para>
<para>should be ee[: e͡e
</para>
<para>should be e(: ĕ ĕ
</para>
<para>should be e_: e̲ e̲
</para>
<para>should be .e: ẹ ẹ
</para>
<para>should be e&lt;: ě ě
</para>
<para>should be a; : ą ą
</para>
<para>should be e; : ę ę
</para>
<para>upside down: &#191; &#161;
</para>
<para>A-with-circle: &#229;,&#197;
</para>
<para>AE, OE ligatures: &#230; &#198; &#339; &#338;
</para>
<para>dotless i, j: ı ȷ
</para>
<para>Polish suppressed-L: &#322; &#321;
</para>
<para>O-with-slash: &#248; &#216;
</para>
<para>es-zet or sharp S: &#223;
</para>
<para>pounds sterling: &#163;
</para>
<!-- arg is command - @dotless{i} is special-cased for HTML -->
<para>should be dotless i&#8216;: ì
</para>
<para>should be dotless i&#8217;: í
</para>
<para>should be dotless i^: î
</para>
<para>should be dotless i&quot;: ï
</para>
<!-- arg is command - @dotless{j} -->
<para>should be dotless j&#8216;: j̀
</para>
<para>should be dotless j&#8217;: j́
</para>
<para>should be dotless j^: ĵ
</para>
<para>should be dotless j&quot;: j̈
</para></chapter>
';


$result_converted{'latex_text'}->{'accent_enable_encoding'} = '\\begin{document}
\\part*{{top}}
\\label{anchor:first}%

should be e`: è è

should be e\': é é

should be e\\^{}: ê ê

should be u": ü ü

should be i`: ì ì

should be i\': í í

should be i\\^{}: î î

should be u": ü ü

should be c,: ç ç

should be n\\~{}: ñ ñ

should be e=: ē ē

should be e\\hbox{\'}\': e̋ e̋

should be e.: ė ė

should be e*: e̊ e̊

should be ee[: e͡e

should be e(: ĕ ĕ

should be e\\_: e̲ e̲

should be .e: ẹ ẹ

should be e<: ě ě

should be a; : ą ą

should be e; : ę ę

upside down: \\textquestiondown{} \\textexclamdown{}

A-with-circle: å,Å

AE, OE ligatures: æ Æ œ Œ

dotless i, j: ı ȷ

Polish suppressed-L: ł Ł

O-with-slash: ø Ø

es-zet or sharp S: ß

pounds sterling: \\textsterling{}

should be dotless i`: ì

should be dotless i\': í

should be dotless i\\^{}: î

should be dotless i": ï

should be dotless j`: j̀

should be dotless j\': j́

should be dotless j\\^{}: ĵ

should be dotless j": j̈
';

1;
