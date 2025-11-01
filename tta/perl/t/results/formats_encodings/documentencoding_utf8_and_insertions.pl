use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'documentencoding_utf8_and_insertions'} = '*document_root C1
 *before_node_section C5
  *@documentencoding C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |input_encoding_name:{utf-8}
  |text_arg:{utf-8}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {utf-8}
  {empty_line:\\n}
  *paragraph C5
   {-- --- \'\' `` ` \' }
   *@code C1 l3
    *brace_container C1
     {in code}
   {. }
   *@~ C1 l3
    *following_arg C1
     {e}
   {.\\n}
  {empty_line:\\n}
  *@example C3 l5
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *preformatted C5
    {-- --- \'\' `` ` \' }
    *@code C1 l6
     *brace_container C1
      {in code}
    {. }
    *@~ C1 l6
     *following_arg C1
      {e}
    {.\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
';


$result_texis{'documentencoding_utf8_and_insertions'} = '@documentencoding utf-8

-- --- \'\' `` ` \' @code{in code}. @~e.

@example
-- --- \'\' `` ` \' @code{in code}. @~e.
@end example
';


$result_texts{'documentencoding_utf8_and_insertions'} = '
- -- " " ` \' in code. e~.

-- --- \'\' `` ` \' in code. e~.
';

$result_errors{'documentencoding_utf8_and_insertions'} = '';

$result_nodes_list{'documentencoding_utf8_and_insertions'} = '';

$result_sections_list{'documentencoding_utf8_and_insertions'} = '';

$result_sectioning_root{'documentencoding_utf8_and_insertions'} = '';

$result_headings_list{'documentencoding_utf8_and_insertions'} = '';


$result_converted{'plaintext'}->{'documentencoding_utf8_and_insertions'} = '- -- " " \' \' ‘in code’.  ẽ.

     -- --- \'\' `` ` \' in code. ẽ.
';


$result_converted{'html_text'}->{'documentencoding_utf8_and_insertions'} = '
<p>&ndash; &mdash; &rdquo; &ldquo; &lsquo; &rsquo; <code class="code">in code</code>. &#7869;.
</p>
<div class="example">
<pre class="example-preformatted">-- --- \'\' `` ` \' <code class="code">in code</code>. &#7869;.
</pre></div>
';


$result_converted{'xml'}->{'documentencoding_utf8_and_insertions'} = '<documentencoding encoding="utf-8" spaces=" ">utf-8</documentencoding>

<para>&textndash; &textmdash; &textrdquo; &textldquo; &textlsquo; &textrsquo; <code>in code</code>. <accent type="tilde" bracketed="off">e</accent>.
</para>
<example endspaces=" ">
<pre xml:space="preserve">-- --- \'\' `` ` \' <code>in code</code>. <accent type="tilde" bracketed="off">e</accent>.
</pre></example>
';


$result_converted{'docbook'}->{'documentencoding_utf8_and_insertions'} = '
<para>&#8211; &#8212; &#8221; &#8220; &#8216; &#8217; <literal>in code</literal>. &#7869;.
</para>
<screen>-- --- \'\' `` ` \' <literal>in code</literal>. &#7869;.
</screen>';

1;
