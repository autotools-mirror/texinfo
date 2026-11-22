use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_ref_arg'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C3 l1 {first}
 |EXTRA
 |identifier:{first}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:first}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C8
   *@ref C2 l3
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{first}
     {normal_text:first}
    *brace_arg C2
     {spaces_before_argument: }
     *@ 
   {normal_text:\\n}
   *@ref C3 l4
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{first}
     {normal_text:first}
    *brace_arg C1
     {spaces_before_argument: }
    *brace_arg C2
     {spaces_before_argument: }
     *@ 
   {normal_text:\\n}
   *@ref C3 l5
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{first}
     {normal_text:first}
    *brace_arg C2
     {spaces_before_argument: }
     *@ 
    *brace_arg C2
     {spaces_before_argument: }
     *@:
   {normal_text:\\n}
   *@ref C3 l6
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{first}
     {normal_text:first}
    *brace_arg C6
     {spaces_before_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:aaa}
       {spaces_after_argument:\\n}
     {spaces_before_argument: }
     *@ 
     {spaces_after_argument:\\n}
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:ggg}
       {spaces_after_argument:\\n}
    *brace_arg C3
     {spaces_before_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:fff}
       {spaces_after_argument:\\n}
     *@c C1
      *line_arg C2
       {rawline_text:}
       {spaces_after_argument:\\n}
   {normal_text:\\n}
';


$result_texis{'empty_ref_arg'} = '@node first

@ref{first, @ }
@ref{first, , @ }
@ref{first, @ , @:}
@ref{first, @c aaa
 @ 
@c ggg
, @c fff
@c
}
';


$result_texts{'empty_ref_arg'} = '
first
first
first
first
';

$result_errors{'empty_ref_arg'} = '* W l3|in @ref empty cross reference name after expansion `@ \'
 warning: in @ref empty cross reference name after expansion `@ \'

* W l4|in @ref empty cross reference title after expansion `@ \'
 warning: in @ref empty cross reference title after expansion `@ \'

* W l5|in @ref empty cross reference name after expansion `@ \'
 warning: in @ref empty cross reference name after expansion `@ \'

* W l5|in @ref empty cross reference title after expansion `@:\'
 warning: in @ref empty cross reference title after expansion `@:\'

* W l11|in @ref empty cross reference name after expansion `@ \'
 warning: in @ref empty cross reference name after expansion `@ \'

';

$result_nodes_list{'empty_ref_arg'} = '1|first
';

$result_sections_list{'empty_ref_arg'} = '';

$result_sectioning_root{'empty_ref_arg'} = '';

$result_headings_list{'empty_ref_arg'} = '';


$result_converted{'xml'}->{'empty_ref_arg'} = '<node identifier="first"><nodename> first</nodename></node>

<para><ref label="first"><xrefnodename>first</xrefnodename><xrefinfoname> <spacecmd type="spc"/></xrefinfoname></ref>
<ref label="first"><xrefnodename>first</xrefnodename><xrefinfoname> </xrefinfoname><xrefprinteddesc> <spacecmd type="spc"/></xrefprinteddesc></ref>
<ref label="first"><xrefnodename>first</xrefnodename><xrefinfoname> <spacecmd type="spc"/></xrefinfoname><xrefprinteddesc> &noeos;</xrefprinteddesc></ref>
<ref label="first"><xrefnodename>first</xrefnodename><xrefinfoname> <!-- c aaa -->
 <spacecmd type="spc"/>
<!-- c ggg -->
</xrefinfoname><xrefprinteddesc> <!-- c fff -->
<!-- c -->
</xrefprinteddesc></ref>
</para>';

1;
