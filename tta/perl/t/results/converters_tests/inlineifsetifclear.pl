use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inlineifsetifclear'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content
  *paragraph C2
   *@inlineifclear C2 l1
   |EXTRA
   |expand_index:{1}
   |format:{aaa}
    *brace_arg C1
     {normal_text:aaa}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:iclear first }
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlineifset C2 l3
   |EXTRA
   |format:{aaa}
    *brace_arg C1
     {normal_text:aaa}
    *elided_brace_command_arg C1
     {raw: ifset first }
   {normal_text:.\\n}
  {empty_line:\\n}
  *@set C1
  |EXTRA
  |misc_args:A{aaa|}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:aaa}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlineifclear C2 l7
   |EXTRA
   |format:{aaa}
    *brace_arg C1
     {normal_text:aaa}
    *elided_brace_command_arg C1
     {raw: ifclear second }
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlineifset C2 l9
   |EXTRA
   |expand_index:{1}
   |format:{aaa}
    *brace_arg C1
     {normal_text:aaa}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:ifset second }
   {normal_text:.\\n}
';


$result_texis{'inlineifsetifclear'} = '@inlineifclear{aaa, iclear first }.

@inlineifset{aaa, ifset first }.

@set aaa

@inlineifclear{aaa, ifclear second }.

@inlineifset{aaa, ifset second }.
';


$result_texts{'inlineifsetifclear'} = 'iclear first .

.


.

ifset second .
';

$result_errors{'inlineifsetifclear'} = '';

$result_nodes_list{'inlineifsetifclear'} = '';

$result_sections_list{'inlineifsetifclear'} = '';

$result_sectioning_root{'inlineifsetifclear'} = '';

$result_headings_list{'inlineifsetifclear'} = '';


$result_converted{'plaintext'}->{'inlineifsetifclear'} = 'iclear first .

   .

   .

   ifset second .
';


$result_converted{'html_text'}->{'inlineifsetifclear'} = '<p>iclear first .
</p>
<p>.
</p>

<p>.
</p>
<p>ifset second .
</p>';


$result_converted{'xml'}->{'inlineifsetifclear'} = '<para><inlineifclear><inlineifclearformat>aaa</inlineifclearformat><inlineifclearcontent> iclear first </inlineifclearcontent></inlineifclear>.
</para>
<para><inlineifset><inlineifsetformat>aaa</inlineifsetformat><inlineifsetcontent> ifset first </inlineifsetcontent></inlineifset>.
</para>
<set name="aaa"> aaa</set>

<para><inlineifclear><inlineifclearformat>aaa</inlineifclearformat><inlineifclearcontent> ifclear second </inlineifclearcontent></inlineifclear>.
</para>
<para><inlineifset><inlineifsetformat>aaa</inlineifsetformat><inlineifsetcontent> ifset second </inlineifsetcontent></inlineifset>.
</para>';


$result_converted{'docbook'}->{'inlineifsetifclear'} = '<para>iclear first .
</para>
<para>.
</para>

<para>.
</para>
<para>ifset second .
</para>';


$result_converted{'latex_text'}->{'inlineifsetifclear'} = '\\begin{document}
iclear first .

.


.

ifset second .
';

1;
