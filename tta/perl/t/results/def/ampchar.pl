use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ampchar'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *normal_command@defop C2 l1
   *def_line C1 l1
   |def_command:{defop}
   |index_entry:I{fn,1}
   |original_def_cmdname:{defop}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l1
       {normal_text:Constructor}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:b}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l1
        *brace_container C2
         {normal_text:const std::vector<int>}
         *normal_command@&
     {delimiter:)}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defop}
     {spaces_after_argument:\\n}
  *paragraph C11
   {normal_text:& }
   *normal_command@&
   {normal_text: }
   *normal_command@ampchar C1 l3
    *brace_container
   {normal_text: }
   *normal_command@{
   {normal_text: }
   *normal_command@}
   {normal_text: }
   *normal_command@@
   {normal_text:\\n}
';


$result_texis{'ampchar'} = '@defop {Constructor} a b (@code{const std::vector<int>@&})
@end defop
& @& @ampchar{} @{ @} @@
';


$result_texts{'ampchar'} = 'Constructor on a: b (const std::vector<int>&)
& & & { } @
';

$result_errors{'ampchar'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'ampchar'} = '';

$result_sections_list{'ampchar'} = '';

$result_sectioning_root{'ampchar'} = '';

$result_headings_list{'ampchar'} = '';

$result_indices_sort_strings{'ampchar'} = 'fn:
 b on a
';


$result_converted{'plaintext'}->{'ampchar'} = ' -- Constructor on a: b (const std::vector<int>&)
   & & & { } @
';

$result_converted_sort_strings{'plaintext'}->{'ampchar'} = 'fn:
 b on a
';


$result_converted{'html'}->{'ampchar'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
dt.def-line {font-size: 1rem}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold}
</style>


</head>

<body>
<dl class="first-defop def-block">
<dt class="defop def-line" id="index-b-on-a"><span class="category-def">Constructor on <code class="code">a</code>: </span><span><strong class="def-name">b</strong> <var class="def-var-arguments">(<code class="code">const std::vector&lt;int&gt;&amp;</code>)</var><a class="copiable-link" href="#index-b-on-a"> &para;</a></span></dt>
</dl>
<p>&amp; &amp; &amp; { } @
</p>


</body>
</html>
';

$result_converted_sort_strings{'html'}->{'ampchar'} = 'fn:
 b on a
';

$result_converted_errors{'html'}->{'ampchar'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'ampchar'} = '<defop endspaces=" "><definitionterm><indexterm index="fn" number="1">b on a</indexterm> <defcategory bracketed="on">Constructor</defcategory> <defclass>a</defclass> <defoperation>b</defoperation> <defdelimiter>(</defdelimiter><defparam><code>const std::vector&lt;int&gt;&ampsymbol;</code></defparam><defdelimiter>)</defdelimiter></definitionterm>
</defop>
<para>&amp; &ampsymbol; &ampchar; &lbrace; &rbrace; &arobase;
</para>';


$result_converted{'docbook'}->{'ampchar'} = '<synopsis><indexterm role="fn"><primary>b on a</primary></indexterm><phrase role="category"><emphasis role="bold">Constructor</emphasis>:</phrase> <ooclass><classname>a</classname></ooclass> <methodname>b</methodname> (<emphasis role="arg">const std::vector&lt;int&gt;&amp;</emphasis>)</synopsis>
<para>&amp; &amp; &#38; { } @
</para>';

1;
