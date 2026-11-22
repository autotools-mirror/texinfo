use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'paragraph_command'} = '*document_root C1
 *before_node_section C16
  *preamble_before_content
  *paragraph C2
   *normal_command@@
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@b C1 l3
    *brace_container C1
     {normal_text:aaa}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@dotless C1 l5
    *brace_container C1
     {normal_text:i}
   {normal_text: also dotless i.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@U C1 l7
    *brace_arg C1
     {normal_text:0075}
   {normal_text: also U+0075.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@email C1 l9
    *brace_arg C1
     {normal_text:m1}
   {normal_text: email.\\n}
  {empty_line:\\n}
  *normal_command@definfoenclose C1 l11
  |EXTRA
  |misc_args:A{foo|\\|//}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:foo,\\,//}
    {spaces_after_argument:\\n}
  *paragraph C2
   *definfoenclose_command@foo C1 l12
   |EXTRA
   |begin:{\\}
   |end:{//}
    *brace_container C2
     *normal_command@@
     {normal_text:definfoenclose}
   {normal_text: should work at the beginning of a new paragraph.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@footnote C1 l14
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {normal_text:lone footnote}
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'paragraph_command'} = '@@

@b{aaa}.

@dotless{i} also dotless i.

@U{0075} also U+0075.

@email{m1} email.

@definfoenclose foo,\\,//
@foo{@@definfoenclose} should work at the beginning of a new paragraph.

@footnote{lone footnote}.

';


$result_texts{'paragraph_command'} = '@

aaa.

i also dotless i.

U+0075 also U+0075.

m1 email.

@definfoenclose should work at the beginning of a new paragraph.

.

';

$result_errors{'paragraph_command'} = '* W l11|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

';

$result_nodes_list{'paragraph_command'} = '';

$result_sections_list{'paragraph_command'} = '';

$result_sectioning_root{'paragraph_command'} = '';

$result_headings_list{'paragraph_command'} = '';


$result_converted{'plaintext'}->{'paragraph_command'} = '@

   aaa.

   ı also dotless i.

   u also U+0075.

   <m1> email.

   \\@definfoenclose// should work at the beginning of a new paragraph.

   (1).

   ---------- Footnotes ----------

   (1) lone footnote

';


$result_converted{'html_text'}->{'paragraph_command'} = '<p>@
</p>
<p><b class="b">aaa</b>.
</p>
<p>&inodot; also dotless i.
</p>
<p>&#x0075; also U+0075.
</p>
<p><a class="email" href="mailto:m1">m1</a> email.
</p>
<p>\\@definfoenclose// should work at the beginning of a new paragraph.
</p>
<p><a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>.
</p>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>lone footnote</p>
</div>
';

1;
