use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'accentenc_enable_encoding'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C2
   *@documentencoding C1 l1
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{iso-8859-1}
   |text_arg:{ISO-8859-1}
    *line_arg C3
     {spaces_before_argument: }
     {ISO-8859-1}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C1 l3 {first}
 |EXTRA
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {first}
    {spaces_after_argument:\\n}
 *@top C77 l4 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e`: }
   *@` C1 l6
    *brace_container C1
     {e}
   { }
   *@` C1 l6
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e\': }
   *@\' C1 l8
    *brace_container C1
     {e}
   { }
   *@\' C1 l8
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e^: }
   *@^ C1 l10
    *brace_container C1
     {e}
   { }
   *@^ C1 l10
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be u": }
   *@" C1 l12
    *brace_container C1
     {u}
   { }
   *@" C1 l12
    *following_arg C1
     {u}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be i`: }
   *@` C1 l14
    *brace_container C1
     {i}
   { }
   *@` C1 l14
    *following_arg C1
     {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be i\': }
   *@\' C1 l16
    *brace_container C1
     {i}
   { }
   *@\' C1 l16
    *following_arg C1
     {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be i^: }
   *@^ C1 l18
    *brace_container C1
     {i}
   { }
   *@^ C1 l18
    *following_arg C1
     {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be u": }
   *@" C1 l20
    *brace_container C1
     {u}
   { }
   *@" C1 l20
    *following_arg C1
     {u}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be c,: }
   *@, C1 l22
    *brace_container C1
     {c}
   { }
   *@, C1 l22
    *following_arg C1
     {c}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be n~: }
   *@~ C1 l24
    *brace_container C1
     {n}
   { }
   *@~ C1 l24
    *following_arg C1
     {n}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e=: }
   *@= C1 l26
    *brace_container C1
     {e}
   { }
   *@= C1 l26
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C7
   {should be e}
   *@w C1 l28
    *brace_container C1
     {\'}
   {\': }
   *@H C1 l28
    *brace_container C1
     {e}
   { }
   *@H C2 l28
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e.: }
   *@dotaccent C1 l30
    *brace_container C1
     {e}
   { }
   *@dotaccent C2 l30
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e*: }
   *@ringaccent C1 l32
    *brace_container C1
     {e}
   { }
   *@ringaccent C2 l32
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be ee[: }
   *@tieaccent C1 l34
    *brace_container C1
     {ee}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e(: }
   *@u C1 l36
    *brace_container C1
     {e}
   { }
   *@u C2 l36
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e_: }
   *@ubaraccent C1 l38
    *brace_container C1
     {e}
   { }
   *@ubaraccent C2 l38
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be .e: }
   *@udotaccent C1 l40
    *brace_container C1
     {e}
   { }
   *@udotaccent C2 l40
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e<: }
   *@v C1 l42
    *brace_container C1
     {e}
   { }
   *@v C2 l42
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be a; : }
   *@ogonek C1 l44
    *brace_container C1
     {a}
   { }
   *@ogonek C2 l44
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {a}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {should be e; : }
   *@ogonek C1 l46
    *brace_container C1
     {e}
   { }
   *@ogonek C2 l46
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {e}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {upside down: }
   *@questiondown C1 l48
    *brace_container
   { }
   *@exclamdown C1 l48
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {A-with-circle: }
   *@aa C1 l50
    *brace_container
   {,}
   *@AA C1 l50
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C9
   {AE, OE ligatures: }
   *@ae C1 l52
    *brace_container
   { }
   *@AE C1 l52
    *brace_container
   { }
   *@oe C1 l52
    *brace_container
   { }
   *@OE C1 l52
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {dotless i, j: }
   *@dotless C1 l54
    *brace_container C1
     {i}
   { }
   *@dotless C1 l54
    *brace_container C1
     {j}
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {Polish suppressed-L: }
   *@l C1 l56
    *brace_container
   { }
   *@L C1 l56
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C5
   {O-with-slash: }
   *@o C1 l58
    *brace_container
   { }
   *@O C1 l58
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {es-zet or sharp S: }
   *@ss C1 l60
    *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {pounds sterling: }
   *@pounds C1 l62
    *brace_container
   {\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:arg is command -- @dotless{i} is special-cased for HTML}
    {spaces_after_argument:\\n}
  *paragraph C3
   {should be dotless i`: }
   *@` C1 l65
    *brace_container C1
     *@dotless C1 l65
      *brace_container C1
       {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless i\': }
   *@\' C1 l67
    *brace_container C1
     *@dotless C1 l67
      *brace_container C1
       {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless i^: }
   *@^ C1 l69
    *brace_container C1
     *@dotless C1 l69
      *brace_container C1
       {i}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless i": }
   *@" C1 l71
    *brace_container C1
     *@dotless C1 l71
      *brace_container C1
       {i}
   {\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:arg is command -- @dotless{j}}
    {spaces_after_argument:\\n}
  *paragraph C3
   {should be dotless j`: }
   *@` C1 l74
    *brace_container C1
     *@dotless C1 l74
      *brace_container C1
       {j}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless j\': }
   *@\' C1 l76
    *brace_container C1
     *@dotless C1 l76
      *brace_container C1
       {j}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless j^: }
   *@^ C1 l78
    *brace_container C1
     *@dotless C1 l78
      *brace_container C1
       {j}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {should be dotless j": }
   *@" C1 l80
    *brace_container C1
     *@dotless C1 l80
      *brace_container C1
       {j}
   {\\n}
';


$result_texis{'accentenc_enable_encoding'} = '@documentencoding ISO-8859-1

@node first
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


$result_texts{'accentenc_enable_encoding'} = '
top
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

$result_errors{'accentenc_enable_encoding'} = '';

$result_nodes_list{'accentenc_enable_encoding'} = '1|first
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'accentenc_enable_encoding'} = '1|top
 associated_anchor_command: first
 associated_node: first
';

$result_sectioning_root{'accentenc_enable_encoding'} = 'level: -1
list:
 1|top
';

$result_headings_list{'accentenc_enable_encoding'} = '';


$result_converted{'html_text'}->{'accentenc_enable_encoding'} = '
<div class="top-level-extent" id="first">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> ¶</a></span></h1>

<p>should be e&lsquo;: è è
</p>
<p>should be e&rsquo;: é é
</p>
<p>should be e^: ê ê
</p>
<p>should be u&quot;: ü ü
</p>
<p>should be i&lsquo;: ì ì
</p>
<p>should be i&rsquo;: í í
</p>
<p>should be i^: î î
</p>
<p>should be u&quot;: ü ü
</p>
<p>should be c,: ç ç
</p>
<p>should be n~: ñ ñ
</p>
<p>should be e=: &#275; &#275;
</p>
<p>should be e&rsquo;<!-- /@w -->&rsquo;: e&#779; e&#779;
</p>
<p>should be e.: &#279; &#279;
</p>
<p>should be e*: e&#778; e&#778;
</p>
<p>should be ee[: e&#865;e
</p>
<p>should be e(: &#277; &#277;
</p>
<p>should be e_: e&#818; e&#818;
</p>
<p>should be .e: &#7865; &#7865;
</p>
<p>should be e&lt;: &#283; &#283;
</p>
<p>should be a; : &#261; &#261;
</p>
<p>should be e; : &#281; &#281;
</p>
<p>upside down: ¿ ¡
</p>
<p>A-with-circle: å,Å
</p>
<p>AE, OE ligatures: æ Æ &oelig; &OElig;
</p>
<p>dotless i, j: &inodot; &#567;
</p>
<p>Polish suppressed-L: &#322; &#321;
</p>
<p>O-with-slash: ø Ø
</p>
<p>es-zet or sharp S: ß
</p>
<p>pounds sterling: £
</p>
<p>should be dotless i&lsquo;: ì
</p>
<p>should be dotless i&rsquo;: í
</p>
<p>should be dotless i^: î
</p>
<p>should be dotless i&quot;: ï
</p>
<p>should be dotless j&lsquo;: j&#768;
</p>
<p>should be dotless j&rsquo;: j&#769;
</p>
<p>should be dotless j^: &#309;
</p>
<p>should be dotless j&quot;: j&#776;
</p></div>
';

1;
