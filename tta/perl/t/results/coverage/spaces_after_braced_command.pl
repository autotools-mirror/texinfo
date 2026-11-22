use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'spaces_after_braced_command'} = '*document_root C1
 *before_node_section C11
  *preamble_before_content
  *paragraph C2
   *normal_command@code C2 l1
    {spaces_after_cmd_before_arg: }
    *brace_container C1
     {normal_text:b}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@samp C2 l3
    {spaces_after_cmd_before_arg:\\n}
    *brace_container C1
     {normal_text:v}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@AA C2 l6
    {spaces_after_cmd_before_arg:\\n }
    *brace_container
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@email C3 l9
    {spaces_after_cmd_before_arg:\\n}
    *brace_arg C1
     {normal_text:a}
    *brace_arg C4
     {spaces_before_argument: }
     {normal_text:b}
     {spaces_after_argument: \\n}
     {spaces_after_argument: }
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@TeX C1 l13
    {spaces_after_cmd_before_arg:\\n}
   {normal_text:\\n}
  {empty_line:\\n}
';


$result_texis{'spaces_after_braced_command'} = '@code {b}

@samp
{v}

@AA
 {}

@email
{a, b 
 }

@TeX


';


$result_texts{'spaces_after_braced_command'} = 'b

v

AA

b

TeX

';

$result_errors{'spaces_after_braced_command'} = '* W l3|command `@samp\' must not be followed by new line
 warning: command `@samp\' must not be followed by new line

* W l6|command `@AA\' must not be followed by new line
 warning: command `@AA\' must not be followed by new line

* W l9|command `@email\' must not be followed by new line
 warning: command `@email\' must not be followed by new line

* W l13|command `@TeX\' must not be followed by new line
 warning: command `@TeX\' must not be followed by new line

* W l14|command `@TeX\' must not be followed by new line
 warning: command `@TeX\' must not be followed by new line

* E l14|@TeX expected braces
 @TeX expected braces

* E l15|misplaced {
 misplaced {

* E l15|misplaced }
 misplaced }

';

$result_nodes_list{'spaces_after_braced_command'} = '';

$result_sections_list{'spaces_after_braced_command'} = '';

$result_sectioning_root{'spaces_after_braced_command'} = '';

$result_headings_list{'spaces_after_braced_command'} = '';


$result_converted{'plaintext'}->{'spaces_after_braced_command'} = '‘b’

   ‘v’

   Å

   b <a>

   TeX

';


$result_converted{'html_text'}->{'spaces_after_braced_command'} = '<p><code class="code">b</code>
</p>
<p>&lsquo;<samp class="samp">v</samp>&rsquo;
</p>
<p>&Aring;
</p>
<p><a class="email" href="mailto:a">b</a>
</p>
<p>TeX
</p>
';


$result_converted{'xml'}->{'spaces_after_braced_command'} = '<para><code> </code>
</para>
<para><samp>
</samp>
</para>
<para>&Aring;
</para>
<para><email><emailaddress>
</emailaddress><emailname>a</emailname></email>
</para>
<para>&tex;
</para>
';


$result_converted{'latex_text'}->{'spaces_after_braced_command'} = '\\begin{document}
\\texttt{b}

`\\texttt{v}\'

\\AA{}

\\href{mailto:a}{b}

\\TeX{}

';


$result_converted{'docbook'}->{'spaces_after_braced_command'} = '<para><literal>b</literal>
</para>
<para>&#8216;<literal>v</literal>&#8217;
</para>
<para>&#197;
</para>
<para><ulink url="mailto:a">b</ulink>
</para>
<para>&tex;
</para>
';

1;
