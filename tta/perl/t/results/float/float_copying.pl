use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'float_copying'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content C2
   *@copying C4 l1
    *arguments_line C1
     *block_line_arg
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
    {empty_line:\\n}
    *@float C7 l3
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |float_number:{1}
    |float_type:{Copyright notice}
    |global_command_number:{1}
    |is_target:{1}
    |normalized:{public-domain}
     *arguments_line C2
      *block_line_arg C1
       {Copyright notice}
      *block_line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
      |spaces_before_argument:
       |{spaces_before_argument: }
       {public domain}
     {empty_line:\\n}
     *paragraph C2
      {Public domain is not really a licence, as it means than\\n}
      {the author abandon his copyright.\\n}
     {empty_line:\\n}
     *@caption C1 l8
      *brace_command_context C6
       *paragraph C3
        {The Public Domain notice}
        *@footnote C1 l8
        |INFO
        |spaces_before_argument:
         |{spaces_before_argument:\\n}
        |EXTRA
        |global_command_number:{1}
         *brace_command_context C7
          *paragraph C3
           {The caption copying footnote\\n}
           *@anchor C1 l10
           |EXTRA
           |is_target:{1}
           |normalized:{caption-copying-footnote-anchor}
            *brace_arg C1
            |EXTRA
            |element_region:{copying}
             {caption copying footnote anchor}
           {spaces_after_close_brace:\\n}
          {empty_line:\\n}
          *index_entry_command@cindex C1 l12
          |INFO
          |spaces_before_argument:
           |{spaces_before_argument: }
          |EXTRA
          |element_region:{copying}
          |index_entry:I{cp,1}
           *line_arg C1
           |INFO
           |spaces_after_argument:
            |{spaces_after_argument:\\n}
            {indexed caption copying footnote}
          *index_entry_command@findex C1 l13
          |INFO
          |spaces_before_argument:
           |{spaces_before_argument: }
          |EXTRA
          |element_region:{copying}
          |index_entry:I{fn,1}
           *line_arg C1
           |INFO
           |spaces_after_argument:
            |{spaces_after_argument:\\n}
            {public domain function}
          {empty_line:\\n}
          *paragraph C3
           {see }
           *@ref C1 l15
            *brace_arg C1
            |EXTRA
            |node_content:{Copying and floats}
            |normalized:{Copying-and-floats}
             {Copying and floats}
           {.\\n}
          {empty_line:\\n}
        {\\n}
       {empty_line:\\n}
       *@anchor C1 l19
       |EXTRA
       |is_target:{1}
       |normalized:{public-domain-anchor}
        *brace_arg C1
        |EXTRA
        |element_region:{copying}
         {public domain anchor}
       {spaces_after_close_brace:\\n}
       *index_entry_command@cindex C1 l20
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |element_region:{copying}
       |index_entry:I{cp,2}
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {indexed caption}
       *index_entry_command@findex C1 l21
       |INFO
       |spaces_before_argument:
        |{spaces_before_argument: }
       |EXTRA
       |element_region:{copying}
       |index_entry:I{fn,2}
        *line_arg C1
        |INFO
        |spaces_after_argument:
         |{spaces_after_argument:\\n}
         {indexed caption function}
     {spaces_after_close_brace:\\n}
     *@end C1 l23
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
     |EXTRA
     |text_arg:{float}
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {float}
    *@end C1 l24
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{copying}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {copying}
   {empty_line:\\n}
 *@node C1 l26 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C6 l27 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  {empty_line:\\n}
  *@insertcopying C1 l29
  |EXTRA
  |global_command_number:{1}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 l31
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *menu_entry C4 l32
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:{Copying and floats}
    |normalized:{Copying-and-floats}
     {Copying and floats}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {\\n}
   *@end C1 l33
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{menu}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {menu}
  {empty_line:\\n}
 *@node C1 l35 {Copying and floats}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
 |normalized:{Copying-and-floats}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Copying and floats}
 *@appendix C9 l36 {Copying and floats}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{A}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Copying and floats}
  {empty_line:\\n}
  *@insertcopying C1 l38
  |EXTRA
  |global_command_number:{2}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  *@insertcopying C1 l39
  |EXTRA
  |global_command_number:{3}
   *line_arg
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
  {empty_line:\\n}
  *@listoffloats C1 l41
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |float_type:{Copyright notice}
  |global_command_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Copyright notice}
  {empty_line:\\n}
  *@printindex C1 l43
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {cp}
  *@printindex C1 l44
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{fn}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fn}
';


$result_texis{'float_copying'} = '@copying

@float Copyright notice, public domain

Public domain is not really a licence, as it means than
the author abandon his copyright.

@caption{The Public Domain notice@footnote{
The caption copying footnote
@anchor{caption copying footnote anchor}

@cindex indexed caption copying footnote
@findex public domain function

see @ref{Copying and floats}.

}

@anchor{public domain anchor}
@cindex indexed caption
@findex indexed caption function
}
@end float
@end copying

@node Top
@top Top

@insertcopying

@menu
* Copying and floats::
@end menu

@node Copying and floats
@appendix Copying and floats

@insertcopying
@insertcopying

@listoffloats Copyright notice

@printindex cp
@printindex fn
';


$result_texts{'float_copying'} = '
Top
***


* Copying and floats::

Appendix A Copying and floats
*****************************



';

$result_errors{'float_copying'} = '';

$result_floats{'float_copying'} = 'Copyright notice: 1
 F1: {public-domain}
  C: The Public Domain notice@footnote{
   The caption copying footnote
   @anchor{caption copying footnote anchor}
   
   @cindex indexed caption copying footnote
   @findex public domain function
   
   see @ref{Copying and floats}.
   
   }
   
   @anchor{public domain anchor}
   @cindex indexed caption
   @findex indexed caption function
';

$result_nodes_list{'float_copying'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  Copying and floats
 node_directions:
  next->Copying and floats
2|Copying and floats
 associated_section: A Copying and floats
 associated_title_command: A Copying and floats
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'float_copying'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Copying and floats
 section_children:
  1|Copying and floats
2|Copying and floats
 associated_anchor_command: Copying and floats
 associated_node: Copying and floats
 section_directions:
  up->Top
 toplevel_directions:
  prev->Top
  up->Top
';

$result_sectioning_root{'float_copying'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'float_copying'} = '';

$result_indices_sort_strings{'float_copying'} = 'cp:
 indexed caption
 indexed caption copying footnote
fn:
 indexed caption function
 public domain function
';


$result_converted{'plaintext'}->{'float_copying'} = 'Top
***

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(1)

   ---------- Footnotes ----------

   (1) The caption copying footnote

   see Copying and floats.

Appendix A Copying and floats
*****************************

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(1)

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(2)

* Menu:

* Copyright notice 1: public domain.     The Public Domain notice(2)

* Menu:

* indexed caption:                       Copying and floats.   (line 27)
* indexed caption copying footnote:      Top.                  (line 12)

* Menu:

* indexed caption function:              Copying and floats.   (line 27)
* public domain function:                Top.                  (line 12)

   ---------- Footnotes ----------

   (1) The caption copying footnote

   see Copying and floats.

   (2) The caption copying footnote

   see Copying and floats.

';


$result_converted{'info'}->{'float_copying'} = 'This is , produced from .

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(1)

   ---------- Footnotes ----------

   (1) The caption copying footnote

   see *note Copying and floats::.


File: ,  Node: Top,  Next: Copying and floats,  Up: (dir)

Top
***

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(1)

* Menu:

* Copying and floats::

   ---------- Footnotes ----------

   (1) The caption copying footnote

   see *note Copying and floats::.


File: ,  Node: Copying and floats,  Prev: Top,  Up: Top

Appendix A Copying and floats
*****************************

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(1)

Public domain is not really a licence, as it means than the author
abandon his copyright.

Copyright notice 1: The Public Domain notice(2)

* Menu:

* Copyright notice 1: public domain.     The Public Domain notice(2)

 [index ]
* Menu:

* indexed caption:                       Copying and floats.   (line 16)
* indexed caption copying footnote:      Top.                  (line 19)

 [index ]
* Menu:

* indexed caption function:              Copying and floats.   (line 16)
* public domain function:                Top.                  (line 19)

   ---------- Footnotes ----------

   (1) The caption copying footnote

   see *note Copying and floats::.

   (2) The caption copying footnote

   see *note Copying and floats::.


Tag Table:
Node: Top276
Ref: public domain346
Ref: public domain anchor486
Ref: Top-Footnote-1555
Ref: caption copying footnote anchor590
Node: Copying and floats628
Ref: Copying and floats-Footnote-11479
Ref: Copying and floats-Footnote-21552

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'float_copying'} = '* E l3|@float output more than once: public domain
 @float output more than once: public domain

* E l19|@anchor output more than once: public domain anchor
 @anchor output more than once: public domain anchor

* E l3|@float output more than once: public domain
 @float output more than once: public domain

* E l19|@anchor output more than once: public domain anchor
 @anchor output more than once: public domain anchor

* E l10|@anchor output more than once: caption copying footnote anchor
 @anchor output more than once: caption copying footnote anchor

* E l10|@anchor output more than once: caption copying footnote anchor
 @anchor output more than once: caption copying footnote anchor

';


$result_converted{'html'}->{'float_copying'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 
Copyright notice, public domain

Public domain is not really a licence, as it means than
the author abandon his copyright.
 -->
<title>Top</title>

<meta name="description" content="Top">
<meta name="keywords" content="Top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<link href="#Copying-and-floats" rel="index" title="Copying and floats">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
a.summary-letter-printindex {text-decoration: none}
span:hover a.copiable-link {visibility: visible}
td.printindex-index-entry {vertical-align: top; padding-left: 1.5em}
td.printindex-index-section {vertical-align: top; padding-left: 1em}
th.index-letter-header-printindex {text-align: left}
</style>


</head>

<body lang="">

<div class="top-level-extent" id="Top">
<div class="nav-panel">
<p>
Next: <a href="#Copying-and-floats" accesskey="n" rel="next">Copying and floats</a> &nbsp; [<a href="#Copying-and-floats" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="top" id="Top-1"><span>Top<a class="copiable-link" href="#Top-1"> &para;</a></span></h1>


<div class="float" id="public-domain">

<p>Public domain is not really a licence, as it means than
the author abandon his copyright.
</p>
<div class="caption"><p><strong class="strong">Copyright notice 1: </strong>The Public Domain notice<a class="footnote" id="DOCF1" href="#FOOT1"><sup>1</sup></a>
</p>
<a class="anchor" id="public-domain-anchor"></a><a class="index-entry-id" id="index-copying-indexed-caption"></a>
<a class="index-entry-id" id="index-copying-indexed-caption-function"></a>
</div></div>

<ul class="mini-toc">
<li><a href="#Copying-and-floats" accesskey="1">Copying and floats</a></li>
</ul>
<hr>
<div class="appendix-level-extent" id="Copying-and-floats">
<div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">Top</a>, Up: <a href="#Top" accesskey="u" rel="up">Top</a> &nbsp; [<a href="#Copying-and-floats" title="Index" rel="index">Index</a>]</p>
</div>
<h2 class="appendix" id="Copying-and-floats-1"><span>Appendix A Copying and floats<a class="copiable-link" href="#Copying-and-floats-1"> &para;</a></span></h2>


<div class="float" id="public-domain">

<p>Public domain is not really a licence, as it means than
the author abandon his copyright.
</p>
<div class="caption"><p><strong class="strong">Copyright notice 1: </strong>The Public Domain notice<a class="footnote" id="DOCF1_2" href="#FOOT1_2"><sup>2</sup></a>
</p>
<a class="anchor" id="public-domain-anchor"></a><a class="index-entry-id" id="index-copying-indexed-caption"></a>
<a class="index-entry-id" id="index-copying-indexed-caption-function"></a>
</div></div>
<div class="float" id="public-domain">

<p>Public domain is not really a licence, as it means than
the author abandon his copyright.
</p>
<div class="caption"><p><strong class="strong">Copyright notice 1: </strong>The Public Domain notice<a class="footnote" id="DOCF1_3" href="#FOOT1_3"><sup>3</sup></a>
</p>
<a class="anchor" id="public-domain-anchor"></a><a class="index-entry-id" id="index-copying-indexed-caption"></a>
<a class="index-entry-id" id="index-copying-indexed-caption-function"></a>
</div></div>
<dl class="listoffloats">
<dt><a href="#public-domain">Copyright notice 1</a></dt><dd class="caption-in-listoffloats"><p>The Public Domain notice<a class="footnote" id="t_flistoffloats_DOCF1_4" href="#t_flistoffloats_FOOT1_4"><sup>4</sup></a>
</p>
</dd>
</dl>

<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="Copying-and-floats_cp_letter-I">I</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-copying-indexed-caption">indexed caption</a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-copying-indexed-caption-copying-footnote">indexed caption copying footnote</a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>
<div class="printindex fn-printindex">
<table class="index-letters-header-printindex fn-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Copying-and-floats_fn_letter-I"><b>I</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Copying-and-floats_fn_letter-P"><b>P</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex fn-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="Copying-and-floats_fn_letter-I">I</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-copying-indexed-caption-function"><code>indexed caption function</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="Copying-and-floats_fn_letter-P">P</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-copying-public-domain-function"><code>public domain function</code></a></td><td class="printindex-index-section"><a href="#Top">Top</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex fn-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#Copying-and-floats_fn_letter-I"><b>I</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#Copying-and-floats_fn_letter-P"><b>P</b></a>
 &nbsp; 
</td></tr></table>
</div>
</div>
</div>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(1)</a></h5>
<p>The caption copying footnote
<a class="anchor" id="caption-copying-footnote-anchor"></a></p>
<a class="index-entry-id" id="index-copying-indexed-caption-copying-footnote"></a>
<a class="index-entry-id" id="index-copying-public-domain-function"></a>

<p>see <a class="ref" href="#Copying-and-floats">Copying and floats</a>.
</p>
<h5 class="footnote-body-heading"><a id="FOOT1_2" href="#DOCF1_2">(2)</a></h5>
<p>The caption copying footnote
<a class="anchor" id="caption-copying-footnote-anchor"></a></p>
<a class="index-entry-id" id="index-copying-indexed-caption-copying-footnote"></a>
<a class="index-entry-id" id="index-copying-public-domain-function"></a>

<p>see <a class="ref" href="#Copying-and-floats">Copying and floats</a>.
</p>
<h5 class="footnote-body-heading"><a id="FOOT1_3" href="#DOCF1_3">(3)</a></h5>
<p>The caption copying footnote
<a class="anchor" id="caption-copying-footnote-anchor"></a></p>
<a class="index-entry-id" id="index-copying-indexed-caption-copying-footnote"></a>
<a class="index-entry-id" id="index-copying-public-domain-function"></a>

<p>see <a class="ref" href="#Copying-and-floats">Copying and floats</a>.
</p>
<h5 class="footnote-body-heading"><a id="t_flistoffloats_FOOT1_4" href="#t_flistoffloats_DOCF1_4">(4)</a></h5>
<p>The caption copying footnote
<a class="anchor" id="caption-copying-footnote-anchor"></a></p>
<a class="index-entry-id" id="index-copying-indexed-caption-copying-footnote"></a>
<a class="index-entry-id" id="index-copying-public-domain-function"></a>

<p>see <a class="ref" href="#Copying-and-floats">Copying and floats</a>.
</p>
</div>



</body>
</html>
';


$result_converted{'xml'}->{'float_copying'} = '<copying endspaces=" ">

<float identifier="public-domain" type="Copyright notice" number="1" spaces=" " endspaces=" "><floattype>Copyright notice</floattype><floatname spaces=" ">public domain</floatname>

<para>Public domain is not really a licence, as it means than
the author abandon his copyright.
</para>
<caption><para>The Public Domain notice<footnote spaces="\\n"><para>The caption copying footnote
<anchor identifier="caption-copying-footnote-anchor">caption copying footnote anchor</anchor>
</para>
<cindex index="cp" spaces=" "><indexterm index="cp" number="1">indexed caption copying footnote</indexterm></cindex>
<findex index="fn" spaces=" "><indexterm index="fn" number="1">public domain function</indexterm></findex>

<para>see <ref label="Copying-and-floats"><xrefnodename>Copying and floats</xrefnodename></ref>.
</para>
</footnote>
</para>
<anchor identifier="public-domain-anchor">public domain anchor</anchor>
<cindex index="cp" spaces=" "><indexterm index="cp" number="2">indexed caption</indexterm></cindex>
<findex index="fn" spaces=" "><indexterm index="fn" number="2">indexed caption function</indexterm></findex>
</caption>
</float>
</copying>

<node identifier="Top" spaces=" "><nodename>Top</nodename><nodenext automatic="on">Copying and floats</nodenext></node>
<top spaces=" "><sectiontitle>Top</sectiontitle>

<insertcopying></insertcopying>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>Copying and floats</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

</top>
<node identifier="Copying-and-floats" spaces=" "><nodename>Copying and floats</nodename><nodeprev automatic="on">Top</nodeprev><nodeup automatic="on">Top</nodeup></node>
<appendix spaces=" "><sectiontitle>Copying and floats</sectiontitle>

<insertcopying></insertcopying>
<insertcopying></insertcopying>

<listoffloats type="Copyright notice" spaces=" ">Copyright notice</listoffloats>

<printindex spaces=" " value="cp" line="cp"></printindex>
<printindex spaces=" " value="fn" line="fn"></printindex>
</appendix>
';


$result_converted{'latex'}->{'float_copying'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{imakeidx}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\makeatletter
\\newcommand{\\Texinfosettitle}{No Title}%

% new float for type `Copyright notice\'
\\newfloat{TexinfoFloatCopyrightnotice}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatCopyrightnotice}{}
% no index headers
\\indexsetup{level=\\relax,toclevel=section}%
\\makeindex[name=cp,title=]%
\\makeindex[name=fn,title=]%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\chaptername{} \\thechapter{} \\chaptertitle{}][][\\thepage]
                              {\\chaptername{} \\thechapter{} \\chaptertitle{}}{}{\\thepage}}

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
\\appendix
\\chapter{{Copying and floats}}
\\label{anchor:Copying-and-floats}%


\\begin{TexinfoFloatCopyrightnotice}

Public domain is not really a licence, as it means than
the author abandon his copyright.

\\caption{The Public Domain notice\\footnote{The caption copying footnote
\\label{anchor:caption-copying-footnote-anchor}%

\\index[cp]{indexed caption copying footnote@indexed caption copying footnote}%
\\index[fn]{public domain function@\\texttt{public domain function}}%

see \\hyperref[anchor:Copying-and-floats]{\\chaptername~\\ref*{anchor:Copying-and-floats} [Copying and floats], page~\\pageref*{anchor:Copying-and-floats}}.

}

\\label{anchor:public-domain-anchor}%
\\index[cp]{indexed caption@indexed caption}%
\\index[fn]{indexed caption function@\\texttt{indexed caption function}}%
}
\\label{anchor:public-domain}%
\\end{TexinfoFloatCopyrightnotice}

\\begin{TexinfoFloatCopyrightnotice}

Public domain is not really a licence, as it means than
the author abandon his copyright.

\\caption{The Public Domain notice\\footnote{The caption copying footnote
\\label{anchor:caption-copying-footnote-anchor}%

\\index[cp]{indexed caption copying footnote@indexed caption copying footnote}%
\\index[fn]{public domain function@\\texttt{public domain function}}%

see \\hyperref[anchor:Copying-and-floats]{\\chaptername~\\ref*{anchor:Copying-and-floats} [Copying and floats], page~\\pageref*{anchor:Copying-and-floats}}.

}

\\label{anchor:public-domain-anchor}%
\\index[cp]{indexed caption@indexed caption}%
\\index[fn]{indexed caption function@\\texttt{indexed caption function}}%
}
\\label{anchor:public-domain}%
\\end{TexinfoFloatCopyrightnotice}

\\listof{TexinfoFloatCopyrightnotice}{}

\\printindex[cp]
\\printindex[fn]
\\end{document}
';

1;
