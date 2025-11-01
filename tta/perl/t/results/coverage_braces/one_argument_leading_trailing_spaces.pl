use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'one_argument_leading_trailing_spaces'} = '*document_root C1
 *before_node_section C1
  *paragraph C30
   *@code C1 l1
    *brace_container C1
     { in code }
   { }
   *@slanted C1 l1
    *brace_container C1
     { in slanted }
   { }
   *@var C1 l1
    *brace_container C1
     { var }
   { }
   *@sub C1 l1
    *brace_container C1
     { sub }
   {\\n}
   *@hyphenation C1 l2
   |EXTRA
   |global_command_number:{1}
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {a-b c-d}
   {spaces_after_close_brace:\\n}
   *@indicateurl C1 l3
    *brace_container C1
     { http://example.com }
   { }
   *@U C1 l3
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {1234}
   { }
   *@w C1 l3
    *brace_container C1
     { w }
   { }
   *@verb C1 l3
   |INFO
   |delimiter:{:}
    *brace_container C1
     {raw: verb }
   {.\\n}
   *@^ C1 l4
    *brace_container C1
     { e }
   { }
   *@ringaccent C1 l4
    *brace_container C1
     { a }
   { }
   *@dotless C1 l4
    *brace_container C1
     { i }
   { }
   *@tieaccent C1 l4
    *brace_container C1
     { bb }
   {\\n}
   *@aa C1 l5
    *brace_container C1
     { i }
   { }
   *@enddots C1 l5
    *brace_container C1
     { ei }
   {\\n}
';


$result_texis{'one_argument_leading_trailing_spaces'} = '@code{ in code } @slanted{ in slanted } @var{ var } @sub{ sub }
@hyphenation{ a-b c-d }
@indicateurl{ http://example.com } @U{ 1234 } @w{ w } @verb{: verb :}.
@^{ e } @ringaccent{ a } @dotless{ i } @tieaccent{ bb }
@aa{ i } @enddots{ ei }
';


$result_texts{'one_argument_leading_trailing_spaces'} = ' in code   in slanted   var   sub 
 http://example.com  1234  w   verb .
 e ^  a *  i   bb [
aa ...
';

$result_errors{'one_argument_leading_trailing_spaces'} = '* E l4|@dotless expects `i\' or `j\' as argument, not ` i \'
 @dotless expects `i\' or `j\' as argument, not ` i \'

* W l5|command @aa does not accept arguments
 warning: command @aa does not accept arguments

* W l5|command @enddots does not accept arguments
 warning: command @enddots does not accept arguments

';

$result_nodes_list{'one_argument_leading_trailing_spaces'} = '';

$result_sections_list{'one_argument_leading_trailing_spaces'} = '';

$result_sectioning_root{'one_argument_leading_trailing_spaces'} = '';

$result_headings_list{'one_argument_leading_trailing_spaces'} = '';


$result_converted{'plaintext'}->{'one_argument_leading_trailing_spaces'} = '‘ in code ’ in slanted VAR _{ sub } ‘ http://example.com ’ ሴ  w   verb .
e ̂ a ̊ i bb ͡ å ...
';


$result_converted{'html_text'}->{'one_argument_leading_trailing_spaces'} = '<p><code class="code"> in code </code> <i class="slanted"> in slanted </i> <var class="var"> var </var> <sub class="sub"> sub </sub>
&lsquo;<code class="indicateurl"> http://example.com </code>&rsquo; &#x1234; &nbsp;w&nbsp;<!-- /@w --> <code class="verb">&nbsp;verb&nbsp;</code>.
 e &#770;  a &#778;  i   bb &#865;
&aring; <small class="enddots">...</small>
</p>';


$result_converted{'latex_text'}->{'one_argument_leading_trailing_spaces'} = '\\texttt{\\ in code } \\textsl{ in slanted } \\Texinfocommandstyletextvar{ var } \\textsubscript{ sub }
\\hyphenation{a-b c-d}`\\texttt{\\ http://example.com }\' ሴ \\hbox{ w } \\verb: verb :.
\\^{ e } \\r{ a }  i  \\t{ bb }
\\aa{} \\dots{}
';


$result_converted{'docbook'}->{'one_argument_leading_trailing_spaces'} = '<para><literal> in code </literal>  in slanted  <replaceable> var </replaceable> <subscript> sub </subscript>
<literal> http://example.com </literal> &#x1234; &amp;#160;w&amp;#160;<!-- /@w --> <literal> verb </literal>.
 e &#770;  a &#778;  i   bb &#865;
&#229; ...
</para>';

1;
