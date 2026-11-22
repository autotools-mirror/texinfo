use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unknown_region'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@documentlanguage C1 l1
   |EXTRA
   |global_command_number:{1}
   |text_arg:{fr_NOWHERE}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fr_NOWHERE}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C3 l4 {chap}
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
  *normal_command@defivar C2 l6
   *def_line C1 l6
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{fr_NOWHERE}
   |element_node:{chap}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{fr_NOWHERE}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:AAA}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:BBB}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:CCC}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l7
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
';


$result_texis{'unknown_region'} = '@documentlanguage fr_NOWHERE

@node Top
@node chap

@defivar AAA BBB CCC
@end defivar
';


$result_texts{'unknown_region'} = '

Variable d\'instance de AAA: BBB CCC
';

$result_errors{'unknown_region'} = '* W l1|NOWHERE is not a valid region code
 warning: NOWHERE is not a valid region code

* W l4|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'unknown_region'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'unknown_region'} = '';

$result_sectioning_root{'unknown_region'} = '';

$result_headings_list{'unknown_region'} = '';

$result_indices_sort_strings{'unknown_region'} = 'vr:
 BBB de AAA
';


$result_converted{'plaintext'}->{'unknown_region'} = ' -- Variable d\'instance de AAA : BBB CCC
';

$result_converted_sort_strings{'plaintext'}->{'unknown_region'} = 'vr:
 BBB de AAA
';


$result_converted{'info'}->{'unknown_region'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

 -- Variable d\'instance de AAA : BBB CCC


Tag Table:
Node: Top27
Node: chap74

End Tag Table


Local Variables:
coding: utf-8
Info-documentlanguage: fr_NOWHERE
End:
');

$result_converted_sort_strings{'info'}->{'unknown_region'} = 'vr:
 BBB de AAA
';


$result_converted{'html'}->{'unknown_region'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Document sans titre</title>

<meta name="description" content="Document sans titre">
<meta name="keywords" content="Document sans titre">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
dt.def-line {font-size: 1rem}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold}
</style>


</head>

<body lang="fr-NOWHERE">

<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Suivant: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<a class="node-id" id="chap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Pr&eacute;c&eacute;dent: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chap<a class="copiable-link" href="#chap"> &para;</a></span></h4>

<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-BBB-of-AAA"><span class="category-def">Variable d&rsquo;instance de <code class="code">AAA</code>&nbsp;: </span><span><strong class="def-name">BBB</strong> <var class="def-var-arguments">CCC</var><a class="copiable-link" href="#index-BBB-of-AAA"> &para;</a></span></dt>
</dl>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'unknown_region'} = 'vr:
 BBB de AAA
';

$result_converted_errors{'html'}->{'unknown_region'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
