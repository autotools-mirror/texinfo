use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'some_at_commands_in_ref_nodes'} = '*document_root C5
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 l2 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C4 l3 {Top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C14
    |EXTRA
    |node_content:A{0|13}
    |normalized:{A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1}
     {normal_text:A }
     *@sc C1 l6
      *brace_container C6
       {normal_text:sc }
       *@~ C1 l6
        *following_arg C1
         {normal_text:n}
       {normal_text: }
       *@aa C1 l6
        *brace_container
       {normal_text: }
       *@TeX C1 l6
        *brace_container
     {normal_text: node }
     *@" C1 l6
      *following_arg C1
       {normal_text:i}
     {normal_text: }
     *@" C1 l6
      *brace_container C1
       *@dotless C1 l6
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *@` C1 l6
      *brace_container C1
       *@= C1 l6
        *following_arg C1
         {normal_text:E}
     {normal_text: }
     *@l C1 l6
      *brace_container
     {normal_text: }
     *@, C1 l6
      *brace_container C1
       *@\' C1 l6
        *following_arg C1
         {normal_text:C}
     {normal_text: }
     *@exclamdown C1 l6
      *brace_container
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l9 {A @sc{sc @~n @aa{} @TeX{}} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}}
 |EXTRA
 |identifier:{A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C16
    {spaces_before_argument: }
    {normal_text:A }
    *@sc C1 l9
     *brace_container C6
      {normal_text:sc }
      *@~ C1 l9
       *following_arg C1
        {normal_text:n}
      {normal_text: }
      *@aa C1 l9
       *brace_container
      {normal_text: }
      *@TeX C1 l9
       *brace_container
    {normal_text: node }
    *@" C1 l9
     *following_arg C1
      {normal_text:i}
    {normal_text: }
    *@" C1 l9
     *brace_container C1
      *@dotless C1 l9
       *brace_container C1
        {normal_text:i}
    {normal_text: }
    *@` C1 l9
     *brace_container C1
      *@= C1 l9
       *following_arg C1
        {normal_text:E}
    {normal_text: }
    *@l C1 l9
     *brace_container
    {normal_text: }
    *@, C1 l9
     *brace_container C1
      *@\' C1 l9
       *following_arg C1
        {normal_text:C}
    {normal_text: }
    *@exclamdown C1 l9
     *brace_container
    {spaces_after_argument:\\n}
 *@chapter C5 l10 {A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C16
    {spaces_before_argument:  }
    {normal_text:A }
    *@sc C1 l10
     *brace_container C1
      {normal_text:sc}
    {normal_text: node }
    *@" C1 l10
     *following_arg C1
      {normal_text:i}
    {normal_text: }
    *@" C1 l10
     *brace_container C1
      *@dotless C1 l10
       *brace_container C1
        {normal_text:i}
    {normal_text: }
    *@` C1 l10
     *brace_container C1
      *@= C1 l10
       *following_arg C1
        {normal_text:E}
    {normal_text: }
    *@l C1 l10
     *brace_container
    {normal_text: }
    *@, C1 l10
     *brace_container C1
      *@\' C1 l10
       *following_arg C1
        {normal_text:C}
    {normal_text: }
    *@exclamdown C1 l10
     *brace_container
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:see }
   *@ref C4 l12
    *brace_arg C14
    |EXTRA
    |node_content:A{0|13}
     {normal_text:a }
     *@strong C1 l12
      *brace_container C1
       {normal_text:strong}
     {normal_text: ref with }
     *@sc C1 l12
      *brace_container C1
       {normal_text:sc}
     *@comma C1 l12
      *brace_container
     {normal_text: a i trema }
     *@" C1 l12
      *following_arg C1
       {normal_text:i}
     *@comma C1 l12
      *brace_container
     {normal_text: a dotless i trema }
     *@" C1 l12
      *brace_container C1
       *@dotless C1 l12
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *@` C1 l12
      *brace_container C1
       *@= C1 l12
        *following_arg C1
         {normal_text:E}
     {normal_text: and exclamdown }
     *@exclamdown C1 l12
      *brace_container
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:manual}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@xref C1 l14
    *brace_arg C14
    |EXTRA
    |node_content:A{0|13}
    |normalized:{A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1}
     {normal_text:A }
     *@sc C1 l14
      *brace_container C6
       {normal_text:sc }
       *@~ C1 l14
        *following_arg C1
         {normal_text:n}
       {normal_text: }
       *@aa C1 l14
        *brace_container
       {normal_text: }
       *@TeX C1 l14
        *brace_container
     {normal_text: node }
     *@" C1 l14
      *following_arg C1
       {normal_text:i}
     {normal_text: }
     *@" C1 l14
      *brace_container C1
       *@dotless C1 l14
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *@` C1 l14
      *brace_container C1
       *@= C1 l14
        *following_arg C1
         {normal_text:E}
     {normal_text: }
     *@l C1 l14
      *brace_container
     {normal_text: }
     *@, C1 l14
      *brace_container C1
       *@\' C1 l14
        *following_arg C1
         {normal_text:C}
     {normal_text: }
     *@exclamdown C1 l14
      *brace_container
   {normal_text:.\\n}
';


$result_texis{'some_at_commands_in_ref_nodes'} = '
@node Top
@top Top

@menu
* A @sc{sc @~n @aa{} @TeX{}} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}::
@end menu

@node A @sc{sc @~n @aa{} @TeX{}} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
@chapter  A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}

see @ref{a @strong{strong} ref with @sc{sc}@comma{} a i trema @"i@comma{} a dotless i trema @"{@dotless{i}} @`{@=E} and exclamdown @exclamdown{},,,manual}.

@xref{A @sc{sc @~n @aa{} @TeX{}} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}}.
';


$result_texts{'some_at_commands_in_ref_nodes'} = 'Top
***

* A SC N~ AA TeX node i" i" E=` /l C\', !::

1 A SC node i" i" E=` /l C\', !
******************************

see a strong ref with SC, a i trema i", a dotless i trema i" E=` and exclamdown !.

A SC N~ AA TeX node i" i" E=` /l C\', !.
';

$result_errors{'some_at_commands_in_ref_nodes'} = '';

$result_nodes_list{'some_at_commands_in_ref_nodes'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  A @sc{sc @~n @aa{} @TeX{}} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
 node_directions:
  next->A @sc{sc @~n @aa{} @TeX{}} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
2|A @sc{sc @~n @aa{} @TeX{}} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
 associated_section: 1 A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
 associated_title_command: 1 A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'some_at_commands_in_ref_nodes'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
 section_children:
  1|A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
2|A @sc{sc} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
 associated_anchor_command: A @sc{sc @~n @aa{} @TeX{}} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
 associated_node: A @sc{sc @~n @aa{} @TeX{}} node @"i @"{@dotless{i}} @`{@=E} @l{} @,{@\'C} @exclamdown{}
 section_directions:
  up->Top
 toplevel_directions:
  prev->Top
  up->Top
';

$result_sectioning_root{'some_at_commands_in_ref_nodes'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'some_at_commands_in_ref_nodes'} = '';


$result_converted{'plaintext'}->{'some_at_commands_in_ref_nodes'} = 'Top
***

1 A SC node ï ï Ḕ ł Ḉ ¡
***********************

see (manual)a *strong* ref with SC, a i trema ï, a dotless i trema ï Ḕ
and exclamdown ¡.

   See A SC Ñ Å TeX node ï ï Ḕ ł Ḉ ¡.
';


$result_converted{'html_text'}->{'some_at_commands_in_ref_nodes'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="Top-1"><span>Top<a class="copiable-link" href="#Top-1"> &para;</a></span></h1>


<ul class="mini-toc">
<li><a href="#A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1">A <small class="sc">SC</small> node &iuml; &iuml; &#274;&#768; &#322; &#262;&#807; &iexcl;</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1">
<h2 class="chapter" id="A-sc-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1"><span>1 A <small class="sc">SC</small> node &iuml; &iuml; &#274;&#768; &#322; &#262;&#807; &iexcl;<a class="copiable-link" href="#A-sc-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1"> &para;</a></span></h2>

<p>see <a data-manual="manual" href="manual.html#a-strong-ref-with-sc_002c-a-i-trema-_00ef_002c-a-dotless-i-trema-_00ef-_1e14-and-exclamdown-_00a1">(manual)a <strong class="strong">strong</strong> ref with <small class="sc">SC</small>, a i trema &iuml;, a dotless i trema &iuml; &#274;&#768; and exclamdown &iexcl;</a>.
</p>
<p>See <a class="xref" href="#A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1">A <small class="sc">SC</small> node &iuml; &iuml; &#274;&#768; &#322; &#262;&#807; &iexcl;</a>.
</p></div>
</div>
';


$result_converted{'xml'}->{'some_at_commands_in_ref_nodes'} = '<preamblebeforebeginning>
</preamblebeforebeginning><node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> A <sc>sc <accent type="tilde" bracketed="off">n</accent> &aring; &tex;</sc> node <accent type="uml" bracketed="off">i</accent> <accent type="uml"><dotless>i</dotless></accent> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> &lslash; <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent> &iexcl;</nodenext></node>
<top><sectiontitle> Top</sectiontitle>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>A <sc>sc <accent type="tilde" bracketed="off">n</accent> &aring; &tex;</sc> node <accent type="uml" bracketed="off">i</accent> <accent type="uml"><dotless>i</dotless></accent> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> &lslash; <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent> &iexcl;</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1"><nodename> A <sc>sc <accent type="tilde" bracketed="off">n</accent> &aring; &tex;</sc> node <accent type="uml" bracketed="off">i</accent> <accent type="uml"><dotless>i</dotless></accent> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> &lslash; <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent> &iexcl;</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle>  A <sc>sc</sc> node <accent type="uml" bracketed="off">i</accent> <accent type="uml"><dotless>i</dotless></accent> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> &lslash; <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent> &iexcl;</sectiontitle>

<para>see <ref label="a-strong-ref-with-sc_002c-a-i-trema-_00ef_002c-a-dotless-i-trema-_00ef-_1e14-and-exclamdown-_00a1" manual="manual"><xrefnodename>a <strong>strong</strong> ref with <sc>sc</sc>&comma; a i trema <accent type="uml" bracketed="off">i</accent>&comma; a dotless i trema <accent type="uml"><dotless>i</dotless></accent> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> and exclamdown &iexcl;</xrefnodename><xrefinfofile>manual</xrefinfofile></ref>.
</para>
<para><xref label="A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1"><xrefnodename>A <sc>sc <accent type="tilde" bracketed="off">n</accent> &aring; &tex;</sc> node <accent type="uml" bracketed="off">i</accent> <accent type="uml"><dotless>i</dotless></accent> <accent type="grave"><accent type="macr" bracketed="off">E</accent></accent> &lslash; <accent type="cedil"><accent type="acute" bracketed="off">C</accent></accent> &iexcl;</xrefnodename></xref>.
</para></chapter>
';


$result_converted{'docbook'}->{'some_at_commands_in_ref_nodes'} = '<chapter label="1" id="A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1">
<title>A SC node &#239; &#239; &#274;&#768; &#322; &#262;&#807; &#161;</title>

<para>see &#8220;a <emphasis role="bold">strong</emphasis> ref with SC&#44; a i trema &#239;&#44; a dotless i trema &#239; &#274;&#768; and exclamdown &#161;&#8221; in <filename>manual</filename>.
</para>
<para>See <link linkend="A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1">A SC &#209; &#197; &tex; node &#239; &#239; &#274;&#768; &#322; &#262;&#807; &#161;</link>.
</para></chapter>
';


$result_converted{'latex_text'}->{'some_at_commands_in_ref_nodes'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{A \\textsc{sc} node \\"{i} \\"{\\i{}} \\`{\\={E}} \\l{} \\c{\\\'{C}} \\textexclamdown{}}}
\\label{anchor:A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1}%

see Section ``a \\textbf{strong} ref with \\textsc{sc}, a i trema \\"{i}, a dotless i trema \\"{\\i{}} \\`{\\={E}} and exclamdown \\textexclamdown{}\'\' in \\texttt{manual}.

See \\hyperref[anchor:A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1]{\\chaptername~\\ref*{anchor:A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1} [A \\textsc{sc \\~{n} \\aa{} \\TeX{}} node \\"{i} \\"{\\i{}} \\`{\\={E}} \\l{} \\c{\\\'{C}} \\textexclamdown{}], page~\\pageref*{anchor:A-sc-_00f1-_00e5-TeX-node-_00ef-_00ef-_1e14-_0142-_1e08-_00a1}}.
';


$result_converted{'info'}->{'some_at_commands_in_ref_nodes'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: A SC Ñ Å TeX node ï ï Ḕ ł Ḉ ¡,  Up: (dir)

Top
***

* Menu:

* A SC Ñ Å TeX node ï ï Ḕ ł Ḉ ¡::


File: ,  Node: A SC Ñ Å TeX node ï ï Ḕ ł Ḉ ¡,  Prev: Top,  Up: Top

1 A SC node ï ï Ḕ ł Ḉ ¡
***********************

see *note (manual)a *strong* ref with SC, a i trema ï, a dotless i trema
ï Ḕ and exclamdown ¡::.

   *Note A SC Ñ Å TeX node ï ï Ḕ ł Ḉ ¡::.


Tag Table:
Node: Top27
Node: A SC Ñ Å TeX node ï ï Ḕ ł Ḉ ¡172

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
