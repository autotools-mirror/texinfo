use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inlineifsetifclearspaces'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content
  *paragraph C2
   *@inlineifclear C3 l1
   |EXTRA
   |expand_index:{1}
   |format:{aaa}
    {spaces_after_cmd_before_arg:\\n}
    *brace_arg C3
     {spaces_before_argument: }
     {aaa}
     {spaces_after_argument: }
    *brace_arg C2
     {spaces_before_argument: }
     {iclear first }
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlineifset C3 l4
   |EXTRA
   |format:{aaa}
    {spaces_after_cmd_before_arg:\\n}
    *brace_arg C3
     {spaces_before_argument: }
     {aaa}
     {spaces_after_argument: }
    *elided_brace_command_arg C1
     {raw: ifset first }
   {.\\n}
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
   *@inlineifclear C3 l9
   |EXTRA
   |format:{aaa}
    {spaces_after_cmd_before_arg: }
    *brace_arg C3
     {spaces_before_argument: }
     {aaa}
     {spaces_after_argument: }
    *elided_brace_command_arg C1
     {raw: ifclear second }
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inlineifset C3 l11
   |EXTRA
   |expand_index:{1}
   |format:{aaa}
    {spaces_after_cmd_before_arg: }
    *brace_arg C3
     {spaces_before_argument: }
     {aaa}
     {spaces_after_argument: }
    *brace_arg C2
     {spaces_before_argument: }
     {ifset second }
   {.\\n}
';


$result_texis{'inlineifsetifclearspaces'} = '@inlineifclear
{ aaa , iclear first }.

@inlineifset
{ aaa , ifset first }.

@set aaa

@inlineifclear { aaa , ifclear second }.

@inlineifset { aaa , ifset second }.
';


$result_texts{'inlineifsetifclearspaces'} = 'iclear first .

.


.

ifset second .
';

$result_errors{'inlineifsetifclearspaces'} = '* W l1|command `@inlineifclear\' must not be followed by new line
 warning: command `@inlineifclear\' must not be followed by new line

* W l4|command `@inlineifset\' must not be followed by new line
 warning: command `@inlineifset\' must not be followed by new line

';

$result_nodes_list{'inlineifsetifclearspaces'} = '';

$result_sections_list{'inlineifsetifclearspaces'} = '';

$result_sectioning_root{'inlineifsetifclearspaces'} = '';

$result_headings_list{'inlineifsetifclearspaces'} = '';


$result_converted{'plaintext'}->{'inlineifsetifclearspaces'} = 'iclear first .

   .

   .

   ifset second .
';


$result_converted{'html_text'}->{'inlineifsetifclearspaces'} = '<p>iclear first .
</p>
<p>.
</p>

<p>.
</p>
<p>ifset second .
</p>';


$result_converted{'xml'}->{'inlineifsetifclearspaces'} = '<para><inlineifclear><inlineifclearformat>
</inlineifclearformat><inlineifclearcontent> aaa </inlineifclearcontent></inlineifclear>.
</para>
<para><inlineifset><inlineifsetformat>
</inlineifsetformat><inlineifsetcontent> aaa </inlineifsetcontent></inlineifset>.
</para>
<set name="aaa"> aaa</set>

<para><inlineifclear><inlineifclearformat> </inlineifclearformat><inlineifclearcontent> aaa </inlineifclearcontent></inlineifclear>.
</para>
<para><inlineifset><inlineifsetformat> </inlineifsetformat><inlineifsetcontent> aaa </inlineifsetcontent></inlineifset>.
</para>';


$result_converted{'docbook'}->{'inlineifsetifclearspaces'} = '<para>iclear first .
</para>
<para>.
</para>

<para>.
</para>
<para>ifset second .
</para>';


$result_converted{'latex_text'}->{'inlineifsetifclearspaces'} = '\\begin{document}
iclear first .

.


.

ifset second .
';

1;
