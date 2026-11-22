use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'commands_in_math'} = '*document_root C1
 *before_node_section C9
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *@displaymath C15 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@strong C1 l3
    *brace_container C1
     {normal_text:``simple-double--three---four----\'\'}
   {normal_text: }
   *@w C1 l3
    *brace_container C1
     {normal_text:aa}
   {normal_text:\\n}
   {normal_text:`}
   *@w C1 l4
    *brace_container
   {normal_text:`simple-double-}
   *@w C1 l4
    *brace_container
   {normal_text:-three---four----\'}
   *@w C1 l4
    *brace_container
   {normal_text:\'}
   *@*
   {normal_text:\\n}
   *@end C1 l5
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:displaymath}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@displaymath C81 l7
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@" C1 l8
    *following_arg C1
     {normal_text:u}
   {normal_text: }
   *@" C1 l8
    *brace_container C1
     {normal_text:U}
   {normal_text: }
   *@~ C1 l8
    *following_arg C1
     {normal_text:n}
   {normal_text: }
   *@^ C1 l8
    *following_arg C1
     {normal_text:a}
   {normal_text: }
   *@\' C1 l8
    *following_arg C1
     {normal_text:e}
   {normal_text: }
   *@= C1 l8
    *following_arg C1
     {normal_text:o}
   {normal_text: }
   *@` C1 l8
    *following_arg C1
     {normal_text:i}
   {normal_text: }
   *@\' C1 l8
    *brace_container C1
     {normal_text:e}
   {normal_text: }
   *@dotless C1 l8
    *brace_container C1
     {normal_text:i}
   {normal_text: }
   *@dotless C1 l8
    *brace_container C1
     {normal_text:j}
   {normal_text: }
   *@` C1 l8
    *brace_container C1
     *@= C1 l8
      *following_arg C1
       {normal_text:E}
   {normal_text:\\n}
   *@l C1 l9
    *brace_container
   {normal_text: }
   *@, C1 l9
    *brace_container C1
     *@\' C1 l9
      *following_arg C1
       {normal_text:C}
   {normal_text: }
   *@, C1 l9
    *brace_container C1
     *@\' C1 l9
      *following_arg C1
       {normal_text:C}
   {normal_text: }
   *@, C1 l9
    *following_arg C1
     {normal_text:c}
   {normal_text: }
   *@H C1 l9
    *brace_container C1
     {normal_text:a}
   {normal_text: }
   *@dotaccent C1 l9
    *brace_container C1
     {normal_text:a}
   {normal_text: }
   *@ringaccent C1 l9
    *brace_container C1
     {normal_text:a}
   {normal_text: }
   *@tieaccent C1 l9
    *brace_container C1
     {normal_text:a}
   {normal_text:\\n}
   *@u C1 l10
    *brace_container C1
     {normal_text:a}
   {normal_text: }
   *@ubaraccent C1 l10
    *brace_container C1
     {normal_text:a}
   {normal_text: }
   *@udotaccent C1 l10
    *brace_container C1
     {normal_text:a}
   {normal_text: }
   *@v C1 l10
    *brace_container C1
     {normal_text:a}
   {normal_text: }
   *@ogonek C1 l10
    *brace_container C1
     {normal_text:a}
   {normal_text: a}
   *@sup C1 l10
    *brace_container C1
     {normal_text:h}
   *@sub C1 l10
    *brace_container C1
     {normal_text:l}
   {normal_text:\\n}
   *@*
   {normal_text: }
   *@ 
   *@ 
   {normal_text: }
   *@\\n
   *@-
   {normal_text: }
   *@|
   {normal_text: }
   *@:
   {normal_text: }
   *@!
   {normal_text: }
   *@?
   {normal_text: }
   *@.
   {normal_text: }
   *@@
   {normal_text: }
   *@}
   {normal_text: }
   *@{
   {normal_text: }
   *@/
   {normal_text:\\n}
   *@today C1 l13
    *brace_container
   {normal_text:\\n}
   *@end C1 l14
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:displaymath}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@displaymath C76 l16
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@click C1 l17
    *brace_container
   {normal_text:\\n}
   *@U C1 l18
    *brace_arg C1
     {normal_text:0075}
   {normal_text:\\n}
   *@TeX C1 l19
    *brace_container
   {normal_text: }
   *@LaTeX C1 l19
    *brace_container
   {normal_text: }
   *@bullet C1 l19
    *brace_container
   {normal_text: }
   *@copyright C1 l19
    *brace_container
   {normal_text: }
   *@dots C1 l19
    *brace_container
   {normal_text: }
   *@enddots C1 l19
    *brace_container
   {normal_text: }
   *@equiv C1 l19
    *brace_container
   {normal_text:\\n}
   *@error C1 l20
    *brace_container
   {normal_text: }
   *@expansion C1 l20
    *brace_container
   {normal_text: }
   *@minus C1 l20
    *brace_container
   {normal_text: }
   *@point C1 l20
    *brace_container
   {normal_text: }
   *@print C1 l20
    *brace_container
   {normal_text: }
   *@result C1 l20
    *brace_container
   {normal_text:\\n}
   *@aa C1 l21
    *brace_container
   {normal_text: }
   *@AA C1 l21
    *brace_container
   {normal_text: }
   *@ae C1 l21
    *brace_container
   {normal_text: }
   *@oe C1 l21
    *brace_container
   {normal_text: }
   *@AE C1 l21
    *brace_container
   {normal_text: }
   *@OE C1 l21
    *brace_container
   {normal_text: }
   *@o C1 l21
    *brace_container
   {normal_text: }
   *@O C1 l21
    *brace_container
   {normal_text: }
   *@ss C1 l21
    *brace_container
   {normal_text: }
   *@l C1 l21
    *brace_container
   {normal_text: }
   *@L C1 l21
    *brace_container
   {normal_text: }
   *@DH C1 l21
    *brace_container
   {normal_text:\\n}
   *@TH C1 l22
    *brace_container
   {normal_text: }
   *@dh C1 l22
    *brace_container
   {normal_text: }
   *@th C1 l22
    *brace_container
   {normal_text: }
   *@exclamdown C1 l22
    *brace_container
   {normal_text: }
   *@questiondown C1 l22
    *brace_container
   {normal_text: }
   *@pounds C1 l22
    *brace_container
   {normal_text:\\n}
   *@registeredsymbol C1 l23
    *brace_container
   {normal_text: }
   *@ordf C1 l23
    *brace_container
   {normal_text: }
   *@ordm C1 l23
    *brace_container
   {normal_text: }
   *@comma C1 l23
    *brace_container
   {normal_text: \\n}
   *@end C1 l24
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:displaymath}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@displaymath C36 l26
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *@quotedblleft C1 l27
    *brace_container
   {normal_text: }
   *@quotedblright C1 l27
    *brace_container
   {normal_text:\\n}
   *@quoteleft C1 l28
    *brace_container
   {normal_text: }
   *@quoteright C1 l28
    *brace_container
   {normal_text: }
   *@quotedblbase C1 l28
    *brace_container
   {normal_text: }
   *@quotesinglbase C1 l28
    *brace_container
   {normal_text: }
   *@guillemetleft C1 l28
    *brace_container
   {normal_text:\\n}
   *@guillemetright C1 l29
    *brace_container
   {normal_text: }
   *@guillemotleft C1 l29
    *brace_container
   {normal_text: }
   *@guillemotright C1 l29
    *brace_container
   {normal_text: }
   *@guilsinglleft C1 l29
    *brace_container
   {normal_text:\\n}
   *@guilsinglright C1 l30
    *brace_container
   {normal_text: }
   *@textdegree C1 l30
    *brace_container
   {normal_text: }
   *@euro C1 l30
    *brace_container
   {normal_text: }
   *@arrow C1 l30
    *brace_container
   {normal_text: }
   *@leq C1 l30
    *brace_container
   {normal_text: }
   *@geq C1 l30
    *brace_container
   {normal_text:\\n}
   *@end C1 l31
   |EXTRA
   |text_arg:{displaymath}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:displaymath}
     {spaces_after_argument:\\n}
';


$result_texis{'commands_in_math'} = '
@displaymath
@strong{``simple-double--three---four----\'\'} @w{aa}
`@w{}`simple-double-@w{}-three---four----\'@w{}\'@*
@end displaymath

@displaymath
@"u @"{U} @~n @^a @\'e @=o @`i @\'{e} @dotless{i} @dotless{j} @`{@=E}
@l{} @,{@\'C} @,{@\'C} @,c @H{a} @dotaccent{a} @ringaccent{a} @tieaccent{a}
@u{a} @ubaraccent{a} @udotaccent{a} @v{a} @ogonek{a} a@sup{h}@sub{l}
@* @ @  @
@- @| @: @! @? @. @@ @} @{ @/
@today{}
@end displaymath

@displaymath
@click{}
@U{0075}
@TeX{} @LaTeX{} @bullet{} @copyright{} @dots{} @enddots{} @equiv{}
@error{} @expansion{} @minus{} @point{} @print{} @result{}
@aa{} @AA{} @ae{} @oe{} @AE{} @OE{} @o{} @O{} @ss{} @l{} @L{} @DH{}
@TH{} @dh{} @th{} @exclamdown{} @questiondown{} @pounds{}
@registeredsymbol{} @ordf{} @ordm{} @comma{} 
@end displaymath

@displaymath
@quotedblleft{} @quotedblright{}
@quoteleft{} @quoteright{} @quotedblbase{} @quotesinglbase{} @guillemetleft{}
@guillemetright{} @guillemotleft{} @guillemotright{} @guilsinglleft{}
@guilsinglright{} @textdegree{} @euro{} @arrow{} @leq{} @geq{}
@end displaymath
';


$result_texts{'commands_in_math'} = '``simple-double--three---four----\'\' aa
``simple-double--three---four----\'\'


u" U" n~ a^ e\' o= i` e\' i j E=`
/l C\', C\', c, a\'\' a. a* a[
a( a_ .a a< a; ahl

        ! ? . @ } { 
a sunny day

->
U+0075
TeX LaTeX * (C) ... ... ==
error-> ==> - -!- -| =>
aa AA ae oe AE OE /o /O ss /l /L D
TH d th ! ? #
(R) a o , 

" "
` \' ,, , <<
>> << >> <
> o Euro -> <= >=
';

$result_errors{'commands_in_math'} = '* E l12|@| should only appear in heading or footing
 @| should only appear in heading or footing

';

$result_nodes_list{'commands_in_math'} = '';

$result_sections_list{'commands_in_math'} = '';

$result_sectioning_root{'commands_in_math'} = '';

$result_headings_list{'commands_in_math'} = '';


$result_converted{'plaintext'}->{'commands_in_math'} = '*``simple-double--three---four----\'\'* aa
``simple-double--three---four----\'\'

ü Ü ñ â é ō ì é ı ȷ Ḕ
ł Ḉ Ḉ ç a̋ ȧ å a͡
ă a̲ ạ ǎ ą a^{h}_{l}

        ! ? . @ } {
a sunny day

→
u
TeX LaTeX • © ... ... ≡
error→ ↦ − ⋆ ⊣ ⇒
å Å æ œ Æ Œ ø Ø ß ł Ł Ð
Þ ð þ ¡ ¿ £
® ª º ,

“ ”
‘ ’ „ ‚ «
» « » ‹
› ° € → ≤ ≥
';


$result_converted{'html_text'}->{'commands_in_math'} = '<pre class="displaymath"><strong class="strong">``simple-double--three---four----\'\'</strong> aa<!-- /@w -->
`<!-- /@w -->`simple-double-<!-- /@w -->-three---four----\'<!-- /@w -->\'

</pre>
<pre class="displaymath">&uuml; &Uuml; &ntilde; &acirc; &eacute; &#333; &igrave; &eacute; &inodot; &#567; &#274;&#768;
&#322; &#262;&#807; &#262;&#807; &ccedil; a&#779; &#551; &aring; a&#865;
&#259; a&#818; &#7841; &#462; &#261; a<sup class="sup">h</sup><sub class="sub">l</sub>

 &nbsp;&nbsp; &nbsp;   ! ? . @ } { 
a sunny day
</pre>
<pre class="displaymath">&rarr;
&#x0075;
TeX LaTeX &bull; &copy; ... ... &equiv;
error<span class="arrow">&rarr;</span> <span class="expansion">&rarr;</span> &minus; <span class="point">&lowast;</span> <span class="print">&#8867;</span> <span class="result">&rArr;</span>
&aring; &Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &#322; &#321; &ETH;
&THORN; &eth; &thorn; &iexcl; &iquest; &pound;
&reg; &ordf; &ordm; , 
</pre>
<pre class="displaymath">&ldquo; &rdquo;
&lsquo; &rsquo; &bdquo; &sbquo; &laquo;
&raquo; &laquo; &raquo; &lsaquo;
&rsaquo; &deg; &euro; <span class="arrow">&rarr;</span> &le; &ge;
</pre>';


$result_converted{'xml'}->{'commands_in_math'} = '<preamblebeforebeginning>
</preamblebeforebeginning><displaymath endspaces=" ">
<strong>``simple-double--three---four----\'\'</strong> <w>aa</w>
`<w></w>`simple-double-<w></w>-three---four----\'<w></w>\'&linebreak;
</displaymath>

<displaymath endspaces=" ">
<accent type="uml" bracketed="off">u</accent> <accent type="uml">U</accent> <accent type="tilde" bracketed="off">n</accent> <accent type="circ" bracketed="off">a</accent> <accent type="acute" bracketed="off">e</accent> <accent type="macr" bracketed="off">o</accent> <accent type="grave" bracketed="off">i</accent> <accent type="acute">e</accent> <dotless>i</dotless> <dotless>j</dotless> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent>
&lslash; <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent> <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent> <accent type="cedil" bracketed="off">c</accent> <accent type="dblac">a</accent> <accent type="dot">a</accent> <accent type="ring">a</accent> <accent type="tieaccent">a</accent>
<accent type="breve">a</accent> <accent type="ubaraccent">a</accent> <accent type="udotaccent">a</accent> <accent type="caron">a</accent> <accent type="ogon">a</accent> a<sup>h</sup><sub>l</sub>
&linebreak; <spacecmd type="spc"/><spacecmd type="spc"/> <spacecmd type="nl"/>&hyphenbreak; <divideheading/> &noeos; &eosexcl; &eosquest; &eosperiod; &arobase; &rbrace; &lbrace; &slashbreak;
<today/>
</displaymath>

<displaymath endspaces=" ">
&click;
<U>0075</U>
&tex; &latex; &bullet; &copyright; &dots; &enddots; &equiv;
&errorglyph; &expansion; &minus; &point; &printglyph; &result;
&aring; &Aring; &aelig; &oelig; &AElig; &OElig; &oslash; &Oslash; &szlig; &lslash; &Lslash; &ETH;
&THORN; &eth; &thorn; &iexcl; &iquest; &pound;
&registered; &ordf; &ordm; &comma; 
</displaymath>

<displaymath endspaces=" ">
&ldquo; &rdquo;
&lsquo; &rsquo; &bdquo; &sbquo; &laquo;
&raquo; &guillemotleft; &guillemotright; &lsaquo;
&rsaquo; &deg; &euro; &rarr; &le; &ge;
</displaymath>
';


$result_converted{'latex_text'}->{'commands_in_math'} = '\\begin{document}
\\[
\\mathbf{``simple-double--three---four----\'\'} \\hbox{aa}
`\\hbox{}`simple-double-\\hbox{}-three---four----\'\\hbox{}\'
\\]

\\[
\\ddot{u} \\ddot{U} \\tilde{n} \\hat{a} \\acute{e} \\bar{o} \\grave{i} \\acute{e} \\imath{} \\jmath{} \\grave{\\bar{E}}
\\mathord{\\text{\\l{}}} \\textsl{\\c{\\\'{C}}} \\textsl{\\c{\\\'{C}}} \\textsl{\\c{c}} \\textsl{\\H{a}} \\dot{a} \\mathring{a} \\textsl{\\t{a}}
\\breve{a} \\textsl{\\b{a}} \\textsl{\\d{a}} \\check{a} \\textsl{\\k{a}} a^{h}_{l}
 \\ {}\\ {} \\ {}\\-{}   ! ? . @ \\} \\{ 
\\today{}
\\]

\\[
\\rightarrow{}
u
TeX LaTeX \\bullet{} \\copyright{} \\dots{} \\dots{} \\equiv{}
\\fbox{error} \\mapsto{} - \\star{} \\dashv{} \\Rightarrow{}
\\mathord{\\text{\\aa{}}} \\mathord{\\text{\\AA{}}} \\mathord{\\text{\\ae{}}} \\mathord{\\text{\\oe{}}} \\mathord{\\text{\\AE{}}} \\mathord{\\text{\\OE{}}} \\mathord{\\text{\\o{}}} \\mathord{\\text{\\O{}}} \\mathord{\\text{\\ss{}}} \\mathord{\\text{\\l{}}} \\mathord{\\text{\\L{}}} \\mathord{\\text{\\DH{}}}
\\mathord{\\text{\\TH{}}} \\mathord{\\text{\\dh{}}} \\mathord{\\text{\\th{}}} \\mathord{\\text{\\textexclamdown{}}} \\mathord{\\text{\\textquestiondown{}}} \\mathsterling{}
\\circledR{} \\mathord{\\text{\\textordfeminine{}}} \\mathord{\\text{\\textordmasculine{}}} , 
\\]

\\[
\\mathord{\\text{\\textquotedblleft{}}} \\mathord{\\text{\\textquotedblright{}}}
\\mathord{\\text{\\textquoteleft{}}} \\mathord{\\text{\\textquoteright{}}} \\mathord{\\text{\\quotedblbase{}}} \\mathord{\\text{\\quotesinglbase{}}} \\mathord{\\text{\\guillemotleft{}}}
\\mathord{\\text{\\guillemotright{}}} \\mathord{\\text{\\guillemotleft{}}} \\mathord{\\text{\\guillemotright{}}} \\mathord{\\text{\\guilsinglleft{}}}
\\mathord{\\text{\\guilsinglright{}}} ^{\\circ{}} \\euro{} \\rightarrow{} \\leq{} \\geq{}
\\]
';


$result_converted{'docbook'}->{'commands_in_math'} = '<informalequation><mathphrase><emphasis role="bold">``simple-double--three---four----\'\'</emphasis> aa<!-- /@w -->
`<!-- /@w -->`simple-double-<!-- /@w -->-three---four----\'<!-- /@w -->\'

</mathphrase></informalequation>
<informalequation><mathphrase>&#252; &#220; &#241; &#226; &#233; &#333; &#236; &#233; &#305; &#567; &#274;&#768;
&#322; &#262;&#807; &#262;&#807; &#231; a&#779; &#551; &#229; a&#865;
&#259; a&#818; &#7841; &#462; &#261; a<superscript>h</superscript><subscript>l</subscript>

 &#160;&#160; &#160;   ! ? . @ } { 
a sunny day
</mathphrase></informalequation>
<informalequation><mathphrase>&#8594;
&#x0075;
&tex; &latex; &#8226; &#169; &#8230; ... &#8801;
error&#8594; &#8614; &#8722; &#8902; &#8867; &#8658;
&#229; &#197; &#230; &#339; &#198; &#338; &#248; &#216; &#223; &#322; &#321; &#208;
&#222; &#240; &#254; &#161; &#191; &#163;
&#174; &#170; &#186; &#44; 
</mathphrase></informalequation>
<informalequation><mathphrase>&#8220; &#8221;
&#8216; &#8217; &#8222; &#8218; &#171;
&#187; &#171; &#187; &#8249;
&#8250; &#176; &#8364; &#8594; &#8804; &#8805;
</mathphrase></informalequation>';

1;
