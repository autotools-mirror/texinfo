use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'seeentry_no_braces'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C2 l2 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *@chapter C5 l5 {chap}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 l7
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l9
  |EXTRA
  |element_node:{chap}
  |index_entry:I{cp,1}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:aa}
    {spaces_at_end: }
    *@seeentry l9
';


$result_texis{'seeentry_no_braces'} = '@node Top
@top top

@node chap
@chapter chap

@printindex cp

@cindex aa @seeentry';


$result_texts{'seeentry_no_braces'} = 'top
***

1 chap
******


';

$result_errors{'seeentry_no_braces'} = '* E l9|@seeentry expected braces
 @seeentry expected braces

';

$result_nodes_list{'seeentry_no_braces'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'seeentry_no_braces'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'seeentry_no_braces'} = 'level: -1
list:
 1|top
';

$result_headings_list{'seeentry_no_braces'} = '';

$result_indices_sort_strings{'seeentry_no_braces'} = 'cp:
 aa
';


$result_converted{'plaintext'}->{'seeentry_no_braces'} = 'top
***

1 chap
******

* Menu:

* aa:                                    chap.                  (line 0)

';

$result_converted_sort_strings{'plaintext'}->{'seeentry_no_braces'} = 'cp:
 aa
';


$result_converted{'html_text'}->{'seeentry_no_braces'} = '<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<p class="nav-panel">
<span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="chap-1"><span>1 chap<a class="copiable-link" href="#chap-1"> &para;</a></span></h2>

<div class="printindex cp-printindex">
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chap_cp_letter-A">A</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-aa">aa</a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

<a class="index-entry-id" id="index-aa"></a>
</div>
</div>
';


$result_converted{'latex_text'}->{'seeentry_no_braces'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{chap}}
\\label{anchor:chap}%

\\printindex[cp]

\\index[cp]{aa@aa}%
';


$result_converted{'docbook'}->{'seeentry_no_braces'} = '<chapter label="1" id="chap">
<title>chap</title>

<index role="cp"></index>

<indexterm role="cp"><primary>aa</primary></indexterm></chapter>
';

1;
