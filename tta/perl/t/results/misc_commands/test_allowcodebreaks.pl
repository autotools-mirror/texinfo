use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_allowcodebreaks'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C23 l2 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C8 l4
  |EXTRA
  |formal_args:A{nr}
  |macro_name:{testallowcodebreakspara}
   *arguments_line C1
    {macro_line: testallowcodebreakspara {nr}\\n}
   {raw:Out of code --- out-of-code.\\n}
   {raw:@code{1aaa} @code{2aaa-} @code{-3bbb} @code{4aaa-bbb} \\n}
   {raw:@code{ 5aaa-bb} @code{6aaa-bb } @code{ccc 7aaa-bbb} @code{ccc 8aaa-bbb ddd}\\n}
   {raw:@code{9aaa-bbb rrr_vv}\\n}
   {raw:@samp{fff-- --- minus@minus{}b aa-tt@\'eff_gg aa@r{r-oman} \\n}
   {raw:anc-hor@anchor{A node\\nr\\}}\\n}
   *normal_command@end C1 l11
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C6 l13
  |EXTRA
  |formal_args:A{}
  |macro_name:{testallowcodebreaksexample}
   *arguments_line C1
    {macro_line: testallowcodebreaksexample{}\\n}
   {raw:\\n}
   {raw:@example\\n}
   {raw:@code{in-example}\\n}
   {raw:@end example\\n}
   *normal_command@end C1 l18
   |EXTRA
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C22
   {normal_text:Before first allowcodebreaks\\n}
   {normal_text:Out of code --- out-of-code.\\n}
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@testallowcodebreakspara C1
     >*brace_arg C1
      >{macro_call_arg_text:0}
   *normal_command@code C1 l21:@testallowcodebreakspara
    *brace_container C1
     {normal_text:1aaa}
   {normal_text: }
   *normal_command@code C1 l21:@testallowcodebreakspara
    *brace_container C1
     {normal_text:2aaa-}
   {normal_text: }
   *normal_command@code C1 l21:@testallowcodebreakspara
    *brace_container C1
     {normal_text:-3bbb}
   {normal_text: }
   *normal_command@code C1 l21:@testallowcodebreakspara
    *brace_container C1
     {normal_text:4aaa-bbb}
   {normal_text: \\n}
   *normal_command@code C1 l21:@testallowcodebreakspara
    *brace_container C1
     {normal_text: 5aaa-bb}
   {normal_text: }
   *normal_command@code C1 l21:@testallowcodebreakspara
    *brace_container C1
     {normal_text:6aaa-bb }
   {normal_text: }
   *normal_command@code C1 l21:@testallowcodebreakspara
    *brace_container C1
     {normal_text:ccc 7aaa-bbb}
   {normal_text: }
   *normal_command@code C1 l21:@testallowcodebreakspara
    *brace_container C1
     {normal_text:ccc 8aaa-bbb ddd}
   {normal_text:\\n}
   *normal_command@code C1 l21:@testallowcodebreakspara
    *brace_container C1
     {normal_text:9aaa-bbb rrr_vv}
   {normal_text:\\n}
   *normal_command@samp C1 l21:@testallowcodebreakspara
   >SOURCEMARKS
   >macro_expansion<end;1>
    *brace_container C9
     {normal_text:fff-- --- minus}
     *normal_command@minus C1 l21:@testallowcodebreakspara
      *brace_container
     {normal_text:b aa-tt}
     *normal_command@\' C1 l21:@testallowcodebreakspara
      *following_arg C1
       {normal_text:e}
     {normal_text:ff_gg aa}
     *normal_command@r C1 l21:@testallowcodebreakspara
      *brace_container C1
       {normal_text:r-oman}
     {normal_text: \\n}
     {normal_text:anc-hor}
     *normal_command@anchor C1 l21:@testallowcodebreakspara
     |EXTRA
     |identifier:{A-node0}
     |is_target:{1}
      *brace_arg C1
       {normal_text:A node0}
   {normal_text:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;2>
   >*macro_call@testallowcodebreaksexample C1
    >*brace_arg
  *normal_command@example C3 l22:@testallowcodebreaksexample
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    *normal_command@code C1 l22:@testallowcodebreaksexample
     *brace_container C1
      {normal_text:in-example}
    {normal_text:\\n}
   *normal_command@end C1 l22:@testallowcodebreaksexample
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     >SOURCEMARKS
     >macro_expansion<end;2><p:7>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@allowcodebreaks C1 l24
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{false}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:false}
    {spaces_after_argument:\\n}
  *paragraph C22
   {normal_text:After false\\n}
   {normal_text:Out of code --- out-of-code.\\n}
   >SOURCEMARKS
   >macro_expansion<start;3>
    >*macro_call@testallowcodebreakspara C1
     >*brace_arg C1
      >{macro_call_arg_text:1}
   *normal_command@code C1 l26:@testallowcodebreakspara
    *brace_container C1
     {normal_text:1aaa}
   {normal_text: }
   *normal_command@code C1 l26:@testallowcodebreakspara
    *brace_container C1
     {normal_text:2aaa-}
   {normal_text: }
   *normal_command@code C1 l26:@testallowcodebreakspara
    *brace_container C1
     {normal_text:-3bbb}
   {normal_text: }
   *normal_command@code C1 l26:@testallowcodebreakspara
    *brace_container C1
     {normal_text:4aaa-bbb}
   {normal_text: \\n}
   *normal_command@code C1 l26:@testallowcodebreakspara
    *brace_container C1
     {normal_text: 5aaa-bb}
   {normal_text: }
   *normal_command@code C1 l26:@testallowcodebreakspara
    *brace_container C1
     {normal_text:6aaa-bb }
   {normal_text: }
   *normal_command@code C1 l26:@testallowcodebreakspara
    *brace_container C1
     {normal_text:ccc 7aaa-bbb}
   {normal_text: }
   *normal_command@code C1 l26:@testallowcodebreakspara
    *brace_container C1
     {normal_text:ccc 8aaa-bbb ddd}
   {normal_text:\\n}
   *normal_command@code C1 l26:@testallowcodebreakspara
    *brace_container C1
     {normal_text:9aaa-bbb rrr_vv}
   {normal_text:\\n}
   *normal_command@samp C1 l26:@testallowcodebreakspara
   >SOURCEMARKS
   >macro_expansion<end;3>
    *brace_container C9
     {normal_text:fff-- --- minus}
     *normal_command@minus C1 l26:@testallowcodebreakspara
      *brace_container
     {normal_text:b aa-tt}
     *normal_command@\' C1 l26:@testallowcodebreakspara
      *following_arg C1
       {normal_text:e}
     {normal_text:ff_gg aa}
     *normal_command@r C1 l26:@testallowcodebreakspara
      *brace_container C1
       {normal_text:r-oman}
     {normal_text: \\n}
     {normal_text:anc-hor}
     *normal_command@anchor C1 l26:@testallowcodebreakspara
     |EXTRA
     |identifier:{A-node1}
     |is_target:{1}
      *brace_arg C1
       {normal_text:A node1}
   {normal_text:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;4>
   >*macro_call@testallowcodebreaksexample C1
    >*brace_arg
  *normal_command@example C3 l27:@testallowcodebreaksexample
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    *normal_command@code C1 l27:@testallowcodebreaksexample
     *brace_container C1
      {normal_text:in-example}
    {normal_text:\\n}
   *normal_command@end C1 l27:@testallowcodebreaksexample
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     >SOURCEMARKS
     >macro_expansion<end;4><p:7>
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:In w:\\n}
   *normal_command@w C1 l30
    *brace_container C21
     {normal_text:Out of code --- out-of-code.\\n}
     >SOURCEMARKS
     >macro_expansion<start;5>
      >*macro_call@testallowcodebreakspara C1
       >*brace_arg C1
        >{macro_call_arg_text:w}
     *normal_command@code C1 l30:@testallowcodebreakspara
      *brace_container C1
       {normal_text:1aaa}
     {normal_text: }
     *normal_command@code C1 l30:@testallowcodebreakspara
      *brace_container C1
       {normal_text:2aaa-}
     {normal_text: }
     *normal_command@code C1 l30:@testallowcodebreakspara
      *brace_container C1
       {normal_text:-3bbb}
     {normal_text: }
     *normal_command@code C1 l30:@testallowcodebreakspara
      *brace_container C1
       {normal_text:4aaa-bbb}
     {normal_text: \\n}
     *normal_command@code C1 l30:@testallowcodebreakspara
      *brace_container C1
       {normal_text: 5aaa-bb}
     {normal_text: }
     *normal_command@code C1 l30:@testallowcodebreakspara
      *brace_container C1
       {normal_text:6aaa-bb }
     {normal_text: }
     *normal_command@code C1 l30:@testallowcodebreakspara
      *brace_container C1
       {normal_text:ccc 7aaa-bbb}
     {normal_text: }
     *normal_command@code C1 l30:@testallowcodebreakspara
      *brace_container C1
       {normal_text:ccc 8aaa-bbb ddd}
     {normal_text:\\n}
     *normal_command@code C1 l30:@testallowcodebreakspara
      *brace_container C1
       {normal_text:9aaa-bbb rrr_vv}
     {normal_text:\\n}
     *normal_command@samp C1 l30:@testallowcodebreakspara
     >SOURCEMARKS
     >macro_expansion<end;5>
      *brace_container C9
       {normal_text:fff-- --- minus}
       *normal_command@minus C1 l30:@testallowcodebreakspara
        *brace_container
       {normal_text:b aa-tt}
       *normal_command@\' C1 l30:@testallowcodebreakspara
        *following_arg C1
         {normal_text:e}
       {normal_text:ff_gg aa}
       *normal_command@r C1 l30:@testallowcodebreakspara
        *brace_container C1
         {normal_text:r-oman}
       {normal_text: \\n}
       {normal_text:anc-hor}
       *normal_command@anchor C1 l30:@testallowcodebreakspara
       |EXTRA
       |identifier:{A-nodew}
       |is_target:{1}
        *brace_arg C1
         {normal_text:A nodew}
     {normal_text:\\n}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l33
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    *normal_command@w C1 l34
     *brace_container C1
      *normal_command@code C1 l34
       *brace_container C1
        {normal_text:in-example}
    {normal_text:\\n}
   *normal_command@end C1 l35
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@allowcodebreaks C1 l37
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{true}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:true}
    {spaces_after_argument:\\n}
  *paragraph C22
   {normal_text:After true\\n}
   {normal_text:Out of code --- out-of-code.\\n}
   >SOURCEMARKS
   >macro_expansion<start;6>
    >*macro_call@testallowcodebreakspara C1
     >*brace_arg C1
      >{macro_call_arg_text:2}
   *normal_command@code C1 l39:@testallowcodebreakspara
    *brace_container C1
     {normal_text:1aaa}
   {normal_text: }
   *normal_command@code C1 l39:@testallowcodebreakspara
    *brace_container C1
     {normal_text:2aaa-}
   {normal_text: }
   *normal_command@code C1 l39:@testallowcodebreakspara
    *brace_container C1
     {normal_text:-3bbb}
   {normal_text: }
   *normal_command@code C1 l39:@testallowcodebreakspara
    *brace_container C1
     {normal_text:4aaa-bbb}
   {normal_text: \\n}
   *normal_command@code C1 l39:@testallowcodebreakspara
    *brace_container C1
     {normal_text: 5aaa-bb}
   {normal_text: }
   *normal_command@code C1 l39:@testallowcodebreakspara
    *brace_container C1
     {normal_text:6aaa-bb }
   {normal_text: }
   *normal_command@code C1 l39:@testallowcodebreakspara
    *brace_container C1
     {normal_text:ccc 7aaa-bbb}
   {normal_text: }
   *normal_command@code C1 l39:@testallowcodebreakspara
    *brace_container C1
     {normal_text:ccc 8aaa-bbb ddd}
   {normal_text:\\n}
   *normal_command@code C1 l39:@testallowcodebreakspara
    *brace_container C1
     {normal_text:9aaa-bbb rrr_vv}
   {normal_text:\\n}
   *normal_command@samp C1 l39:@testallowcodebreakspara
   >SOURCEMARKS
   >macro_expansion<end;6>
    *brace_container C9
     {normal_text:fff-- --- minus}
     *normal_command@minus C1 l39:@testallowcodebreakspara
      *brace_container
     {normal_text:b aa-tt}
     *normal_command@\' C1 l39:@testallowcodebreakspara
      *following_arg C1
       {normal_text:e}
     {normal_text:ff_gg aa}
     *normal_command@r C1 l39:@testallowcodebreakspara
      *brace_container C1
       {normal_text:r-oman}
     {normal_text: \\n}
     {normal_text:anc-hor}
     *normal_command@anchor C1 l39:@testallowcodebreakspara
     |EXTRA
     |identifier:{A-node2}
     |is_target:{1}
      *brace_arg C1
       {normal_text:A node2}
   {normal_text:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;7>
   >*macro_call@testallowcodebreaksexample C1
    >*brace_arg
  *normal_command@example C3 l40:@testallowcodebreaksexample
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    *normal_command@code C1 l40:@testallowcodebreaksexample
     *brace_container C1
      {normal_text:in-example}
    {normal_text:\\n}
   *normal_command@end C1 l40:@testallowcodebreaksexample
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     >SOURCEMARKS
     >macro_expansion<end;7><p:7>
     {spaces_after_argument:\\n}
';


$result_texis{'test_allowcodebreaks'} = '@node Top
@node chap

@macro testallowcodebreakspara {nr}
Out of code --- out-of-code.
@code{1aaa} @code{2aaa-} @code{-3bbb} @code{4aaa-bbb} 
@code{ 5aaa-bb} @code{6aaa-bb } @code{ccc 7aaa-bbb} @code{ccc 8aaa-bbb ddd}
@code{9aaa-bbb rrr_vv}
@samp{fff-- --- minus@minus{}b aa-tt@\'eff_gg aa@r{r-oman} 
anc-hor@anchor{A node\\nr\\}}
@end macro

@macro testallowcodebreaksexample{}

@example
@code{in-example}
@end example
@end macro

Before first allowcodebreaks
Out of code --- out-of-code.
@code{1aaa} @code{2aaa-} @code{-3bbb} @code{4aaa-bbb} 
@code{ 5aaa-bb} @code{6aaa-bb } @code{ccc 7aaa-bbb} @code{ccc 8aaa-bbb ddd}
@code{9aaa-bbb rrr_vv}
@samp{fff-- --- minus@minus{}b aa-tt@\'eff_gg aa@r{r-oman} 
anc-hor@anchor{A node0}}

@example
@code{in-example}
@end example

@allowcodebreaks false
After false
Out of code --- out-of-code.
@code{1aaa} @code{2aaa-} @code{-3bbb} @code{4aaa-bbb} 
@code{ 5aaa-bb} @code{6aaa-bb } @code{ccc 7aaa-bbb} @code{ccc 8aaa-bbb ddd}
@code{9aaa-bbb rrr_vv}
@samp{fff-- --- minus@minus{}b aa-tt@\'eff_gg aa@r{r-oman} 
anc-hor@anchor{A node1}}

@example
@code{in-example}
@end example

In w:
@w{Out of code --- out-of-code.
@code{1aaa} @code{2aaa-} @code{-3bbb} @code{4aaa-bbb} 
@code{ 5aaa-bb} @code{6aaa-bb } @code{ccc 7aaa-bbb} @code{ccc 8aaa-bbb ddd}
@code{9aaa-bbb rrr_vv}
@samp{fff-- --- minus@minus{}b aa-tt@\'eff_gg aa@r{r-oman} 
anc-hor@anchor{A nodew}}
}

@example
@w{@code{in-example}}
@end example

@allowcodebreaks true
After true
Out of code --- out-of-code.
@code{1aaa} @code{2aaa-} @code{-3bbb} @code{4aaa-bbb} 
@code{ 5aaa-bb} @code{6aaa-bb } @code{ccc 7aaa-bbb} @code{ccc 8aaa-bbb ddd}
@code{9aaa-bbb rrr_vv}
@samp{fff-- --- minus@minus{}b aa-tt@\'eff_gg aa@r{r-oman} 
anc-hor@anchor{A node2}}

@example
@code{in-example}
@end example
';


$result_texts{'test_allowcodebreaks'} = '


Before first allowcodebreaks
Out of code -- out-of-code.
1aaa 2aaa- -3bbb 4aaa-bbb 
 5aaa-bb 6aaa-bb  ccc 7aaa-bbb ccc 8aaa-bbb ddd
9aaa-bbb rrr_vv
fff-- --- minus-b aa-tte\'ff_gg aar-oman 
anc-hor

in-example

After false
Out of code -- out-of-code.
1aaa 2aaa- -3bbb 4aaa-bbb 
 5aaa-bb 6aaa-bb  ccc 7aaa-bbb ccc 8aaa-bbb ddd
9aaa-bbb rrr_vv
fff-- --- minus-b aa-tte\'ff_gg aar-oman 
anc-hor

in-example

In w:
Out of code -- out-of-code.
1aaa 2aaa- -3bbb 4aaa-bbb 
 5aaa-bb 6aaa-bb  ccc 7aaa-bbb ccc 8aaa-bbb ddd
9aaa-bbb rrr_vv
fff-- --- minus-b aa-tte\'ff_gg aar-oman 
anc-hor


in-example

After true
Out of code -- out-of-code.
1aaa 2aaa- -3bbb 4aaa-bbb 
 5aaa-bb 6aaa-bb  ccc 7aaa-bbb ccc 8aaa-bbb ddd
9aaa-bbb rrr_vv
fff-- --- minus-b aa-tte\'ff_gg aar-oman 
anc-hor

in-example
';

$result_errors{'test_allowcodebreaks'} = '* W l30:@testallowcodebreakspara|@anchor should not appear anywhere inside @w
 warning: @anchor should not appear anywhere inside @w (possibly involving @testallowcodebreakspara)

* W l2|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'test_allowcodebreaks'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'test_allowcodebreaks'} = '';

$result_sectioning_root{'test_allowcodebreaks'} = '';

$result_headings_list{'test_allowcodebreaks'} = '';


$result_converted{'plaintext'}->{'test_allowcodebreaks'} = 'Before first allowcodebreaks Out of code -- out-of-code.  ‘1aaa’ ‘2aaa-’
‘-3bbb’ ‘4aaa-bbb’ ‘ 5aaa-bb’ ‘6aaa-bb ’ ‘ccc 7aaa-bbb’ ‘ccc 8aaa-bbb
ddd’ ‘9aaa-bbb rrr_vv’ ‘fff-- --- minus−b aa-ttéff_gg aar-oman anc-hor’

     in-example

   After false Out of code -- out-of-code.  ‘1aaa’ ‘2aaa-’ ‘-3bbb’
‘4aaa-bbb’ ‘ 5aaa-bb’ ‘6aaa-bb ’ ‘ccc 7aaa-bbb’ ‘ccc 8aaa-bbb ddd’
‘9aaa-bbb rrr_vv’ ‘fff-- --- minus−b aa-ttéff_gg aar-oman anc-hor’

     in-example

   In w:
Out of code -- out-of-code.  ‘1aaa’ ‘2aaa-’ ‘-3bbb’ ‘4aaa-bbb’ ‘ 5aaa-bb’ ‘6aaa-bb ’ ‘ccc 7aaa-bbb’ ‘ccc 8aaa-bbb ddd’ ‘9aaa-bbb rrr_vv’ ‘fff-- --- minus−b aa-ttéff_gg aar-oman anc-hor
’ 

     in-example

   After true Out of code -- out-of-code.  ‘1aaa’ ‘2aaa-’ ‘-3bbb’
‘4aaa-bbb’ ‘ 5aaa-bb’ ‘6aaa-bb ’ ‘ccc 7aaa-bbb’ ‘ccc 8aaa-bbb ddd’
‘9aaa-bbb rrr_vv’ ‘fff-- --- minus−b aa-ttéff_gg aar-oman anc-hor’

     in-example
';


$result_converted{'html_text'}->{'test_allowcodebreaks'} = '<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<h4 class="node" id="chap"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>



<p>Before first allowcodebreaks
Out of code &mdash; out-of-code.
<code class="code">1aaa</code> <code class="code">2aaa-</code> <code class="code">-3bbb</code> <code class="code">4aaa-bbb</code> 
<code class="code"> 5aaa-bb</code> <code class="code">6aaa-bb </code> <code class="code">ccc 7aaa-bbb</code> <code class="code">ccc 8aaa-bbb ddd</code>
<code class="code">9aaa-bbb rrr_vv</code>
&lsquo;<samp class="samp">fff-- --- minus&minus;b aa-tt&eacute;ff_gg aa<span class="r">r-oman</span> 
anc-hor<a class="anchor" id="A-node0"></a></samp>&rsquo;
</p>
<div class="example">
<pre class="example-preformatted"><code class="code">in-example</code>
</pre></div>

<p>After false
Out of code &mdash; out-of-code.
<code class="code">1aaa</code> <code class="code">2aaa-</code> <code class="code">-3bbb</code> <code class="code">4aaa-bbb</code> 
<code class="code"> 5aaa-bb</code> <code class="code">6aaa-bb </code> <code class="code">ccc 7aaa-bbb</code> <code class="code">ccc 8aaa-bbb ddd</code>
<code class="code">9aaa-bbb rrr_vv</code>
&lsquo;<samp class="samp">fff-- --- minus&minus;b aa-tt&eacute;ff_gg aa<span class="r">r-oman</span> 
anc-hor<a class="anchor" id="A-node1"></a></samp>&rsquo;
</p>
<div class="example">
<pre class="example-preformatted"><code class="code">in-example</code>
</pre></div>

<p>In w:
Out&nbsp;of&nbsp;code&nbsp;&mdash;&nbsp;out-of-code.&nbsp;<code class="code">1aaa</code>&nbsp;<code class="code">2aaa-</code>&nbsp;<code class="code">-3bbb</code>&nbsp;<code class="code">4aaa-bbb</code>&nbsp;<code class="code">&nbsp;5aaa-bb</code>&nbsp;<code class="code">6aaa-bb&nbsp;</code>&nbsp;<code class="code">ccc&nbsp;7aaa-bbb</code>&nbsp;<code class="code">ccc&nbsp;8aaa-bbb&nbsp;ddd</code>&nbsp;<code class="code">9aaa-bbb&nbsp;rrr_vv</code>&nbsp;&lsquo;<samp class="samp">fff--&nbsp;---&nbsp;minus&minus;b&nbsp;aa-tt&eacute;ff_gg&nbsp;aa<span class="r">r-oman</span>&nbsp;anc-hor<a class="anchor" id="A-nodew"></a></samp>&rsquo;&nbsp;<!-- /@w -->
</p>
<div class="example">
<pre class="example-preformatted"><code class="code">in-example</code><!-- /@w -->
</pre></div>

<p>After true
Out of code &mdash; out-of-code.
<code class="code">1aaa</code> <code class="code">2aaa-</code> <code class="code">-3bbb</code> <code class="code">4aaa-bbb</code> 
<code class="code"> 5aaa-bb</code> <code class="code">6aaa-bb </code> <code class="code">ccc 7aaa-bbb</code> <code class="code">ccc 8aaa-bbb ddd</code>
<code class="code">9aaa-bbb rrr_vv</code>
&lsquo;<samp class="samp">fff-- --- minus&minus;b aa-tt&eacute;ff_gg aa<span class="r">r-oman</span> 
anc-hor<a class="anchor" id="A-node2"></a></samp>&rsquo;
</p>
<div class="example">
<pre class="example-preformatted"><code class="code">in-example</code>
</pre></div>
';


$result_converted{'latex'}->{'test_allowcodebreaks'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
% This is used to provide a default no-operation \'keyval\' definition
% of the "alt" key in the "Gin" ("Graphics Inclusion") family used
% by graphicx.  This prevents an "alt" attribute generating an error in
% older versions of graphicx.
\\makeatletter
\\providecommand\\KV@Gin@alt{}
\\makeatother
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfothechapterheading}{}
\\newtitlemark{\\Texinfothechapterheading}%
\\newcommand{\\Texinfoheadingchaptername}{\\chaptername}
\\newtitlemark{\\Texinfoheadingchaptername}%
\\newcommand{\\Texinfosettitle}{No Title}%

\\newcommand{\\Texinfounnumberedchapter}[1]{\\chapter*{#1}
\\addcontentsline{toc}{chapter}{\\protect\\textbf{#1}}%
\\renewcommand{\\Texinfothechapterheading}{}%
\\chaptermark{#1}%
}%

\\newcommand{\\Texinfounnumberedpart}[1]{\\part*{#1}
\\addcontentsline{toc}{part}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsection}[1]{\\section*{#1}
\\addcontentsline{toc}{section}{\\protect\\textbf{#1}}%
\\sectionmark{#1}%
}%

\\newcommand{\\Texinfounnumberedsubsection}[1]{\\subsection*{#1}
\\addcontentsline{toc}{subsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsubsubsection}[1]{\\subsubsection*{#1}
\\addcontentsline{toc}{subsubsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfochapter}[1]{\\chapter{#1}
\\renewcommand{\\Texinfothechapterheading}{\\Texinfoheadingchaptername{} \\thechapter{} }%
}%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}


% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\Texinfothechapterheading{}\\chaptertitle{}][][\\thepage]
                              {\\Texinfothechapterheading{}\\chaptertitle{}}{}{\\thepage}}

% allow line breaking at underscore
\\let\\Texinfounderscore\\_
\\renewcommand{\\_}{\\Texinfounderscore\\discretionary{}{}{}}
\\renewcommand{\\includegraphics}[1]{\\fbox{FIG \\detokenize{#1}}}

\\makeatother
% set default for @setchapternewpage
\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%

\\begin{document}
\\label{anchor:Top}%
\\label{anchor:chap}%



Before first allowcodebreaks
Out of code --- out-of-code.
\\texttt{1aaa} \\texttt{2aaa-} \\texttt{-3bbb} \\texttt{4aaa-bbb} 
\\texttt{\\ 5aaa-bb} \\texttt{6aaa-bb } \\texttt{ccc 7aaa-bbb} \\texttt{ccc 8aaa-bbb ddd}
\\texttt{9aaa-bbb rrr\\_vv}
`\\texttt{fff{-}{-} {-}{-}{-} minus-b aa-tt\\\'{e}ff\\_gg aa\\textnormal{r-oman}\\ 
anc-hor\\label{anchor:A-node0}%
}\'

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\texttt{in-example}
\\end{Texinfopreformatted}
\\end{Texinfoindented}

After false
Out of code --- out-of-code.
\\texttt{1aaa} \\texttt{2aaa-} \\texttt{-3bbb} \\texttt{4aaa-bbb} 
\\texttt{\\ 5aaa-bb} \\texttt{6aaa-bb } \\texttt{ccc 7aaa-bbb} \\texttt{ccc 8aaa-bbb ddd}
\\texttt{9aaa-bbb rrr\\_vv}
`\\texttt{fff{-}{-} {-}{-}{-} minus-b aa-tt\\\'{e}ff\\_gg aa\\textnormal{r-oman}\\ 
anc-hor\\label{anchor:A-node1}%
}\'

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\texttt{in-example}
\\end{Texinfopreformatted}
\\end{Texinfoindented}

In w:
\\hbox{Out of code --- out-of-code.
\\texttt{1aaa} \\texttt{2aaa-} \\texttt{-3bbb} \\texttt{4aaa-bbb} 
\\texttt{\\ 5aaa-bb} \\texttt{6aaa-bb } \\texttt{ccc 7aaa-bbb} \\texttt{ccc 8aaa-bbb ddd}
\\texttt{9aaa-bbb rrr\\_vv}
`\\texttt{fff{-}{-} {-}{-}{-} minus-b aa-tt\\\'{e}ff\\_gg aa\\textnormal{r-oman}\\ 
anc-hor\\label{anchor:A-nodew}%
}\'
}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\hbox{\\texttt{in-example}}
\\end{Texinfopreformatted}
\\end{Texinfoindented}

After true
Out of code --- out-of-code.
\\texttt{1aaa} \\texttt{2aaa-} \\texttt{-3bbb} \\texttt{4aaa-bbb} 
\\texttt{\\ 5aaa-bb} \\texttt{6aaa-bb } \\texttt{ccc 7aaa-bbb} \\texttt{ccc 8aaa-bbb ddd}
\\texttt{9aaa-bbb rrr\\_vv}
`\\texttt{fff{-}{-} {-}{-}{-} minus-b aa-tt\\\'{e}ff\\_gg aa\\textnormal{r-oman}\\ 
anc-hor\\label{anchor:A-node2}%
}\'

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\texttt{in-example}
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\end{document}
';

1;
