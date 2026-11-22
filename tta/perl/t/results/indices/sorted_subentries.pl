use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'sorted_subentries'} = '*document_root C7
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
 *@top C2 l2
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
 *@node C1 l4 {chapter one}
 |EXTRA
 |identifier:{chapter-one}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter one}
    {spaces_after_argument:\\n}
 *@chapter C15 l5 {one}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:one}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l7
  |EXTRA
  |element_node:{chapter-one}
  |index_entry:I{cp,1}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:aa}
    {spaces_after_argument: }
    *@subentry C1 l7
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:bb}
      {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l8
  |EXTRA
  |element_node:{chapter-one}
  |index_entry:I{cp,2}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:ab}
    {spaces_after_argument: }
    *@subentry C1 l8
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cc}
      {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l9
  |EXTRA
  |element_node:{chapter-one}
  |index_entry:I{cp,3}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:aa}
    {spaces_after_argument: }
    *@subentry C1 l9
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:dd}
      {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l10
  |EXTRA
  |element_node:{chapter-one}
  |index_entry:I{cp,4}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:bb}
    {spaces_after_argument: }
    *@subentry C1 l10
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:cc}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@cindex C1 l12
  |EXTRA
  |element_node:{chapter-one}
  |index_entry:I{cp,5}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:hhh}
    {spaces_after_argument: }
    *@subentry C1 l12
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:jjj}
      {spaces_after_argument: }
      *@subentry C1 l12
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:lll}
        {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l13
  |EXTRA
  |element_node:{chapter-one}
  |index_entry:I{cp,6}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:hhh}
    {spaces_after_argument: }
    *@subentry C1 l13
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:jjj}
      {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l14
  |EXTRA
  |element_node:{chapter-one}
  |index_entry:I{cp,7}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:hhh jjj}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l15
  |EXTRA
  |element_node:{chapter-one}
  |index_entry:I{cp,8}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:hhh}
    {spaces_after_argument: }
    *@subentry C1 l15
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:k}
      {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l16
  |EXTRA
  |element_node:{chapter-one}
  |index_entry:I{cp,9}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:hhh}
    {spaces_after_argument: }
    *@subentry C1 l16
     *line_arg C1
      {spaces_before_argument: \\n}
  *index_entry_command@cindex C1 l17
  |EXTRA
  |element_node:{chapter-one}
  |index_entry:I{cp,10}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:hhh}
    {spaces_after_argument: \\n}
  *index_entry_command@cindex C1 l18
  |EXTRA
  |element_node:{chapter-one}
  |index_entry:I{cp,11}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:hhh}
    {spaces_after_argument: }
    *@subentry C1 l18
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:jjj}
      {spaces_after_argument: }
      *@subentry C1 l18
       *line_arg C4
        {spaces_before_argument: }
        {normal_text:lll}
        {spaces_after_argument: }
        *@subentry C1 l18
         *line_arg C3
          {spaces_before_argument: }
          {normal_text:ppp}
          {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C1 l20 {chapter second}
 |EXTRA
 |identifier:{chapter-second}
 |is_target:{1}
 |isindex:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter second}
    {spaces_after_argument:\\n}
 *@chapter C11 l21 {second}
 |EXTRA
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:second}
    {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l22
  |EXTRA
  |element_node:{chapter-second}
  |index_entry:I{cp,12}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:hhh}
    {spaces_after_argument: }
    *@subentry C1 l22
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:jjj}
      {spaces_after_argument: }
      *@subentry C1 l22
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:lll}
        {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l23
  |EXTRA
  |element_node:{chapter-second}
  |index_entry:I{cp,13}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:hhh}
    {spaces_after_argument: \\n}
  *index_entry_command@cindex C1 l24
  |EXTRA
  |element_node:{chapter-second}
  |index_entry:I{cp,14}
   *line_arg C4
    {spaces_before_argument: }
    *@samp C1 l24
     *brace_container C1
      {normal_text:hhh}
    {spaces_after_argument: }
    *@subentry C1 l24
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:jjj}
      {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l25
  |EXTRA
  |element_node:{chapter-second}
  |index_entry:I{cp,15}
   *line_arg C4
    {spaces_before_argument: }
    *@kbd C1 l25
     *brace_container C1
      {normal_text:hhh}
    {spaces_after_argument: }
    *@subentry C1 l25
     *line_arg C4
      {spaces_before_argument: }
      *@sc C1 l25
       *brace_container C1
        {normal_text:jjj}
      {spaces_after_argument: }
      *@subentry C1 l25
       *line_arg C3
        {spaces_before_argument: }
        *@email C2 l25
         *brace_arg C1
          {normal_text:jjj}
         *brace_arg C1
          {normal_text:mymail}
        {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l26
  |EXTRA
  |element_node:{chapter-second}
  |index_entry:I{cp,16}
   *line_arg C2
    {spaces_before_argument: }
    *@subentry C1 l26
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:aa}
      {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l27
  |EXTRA
  |element_node:{chapter-second}
  |index_entry:I{cp,17}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:hhh}
    {spaces_after_argument: }
    *@subentry C1 l27
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:jjj}
      {spaces_after_argument: }
      *@subentry C1 l27
      |EXTRA
      |sortas:{A}
       *line_arg C5
        {spaces_before_argument: }
        {normal_text:lll}
        {spaces_at_end: }
        *@sortas C1 l27
         *brace_arg C1
          {normal_text:A}
        {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l28
  |EXTRA
  |element_node:{chapter-second}
  |index_entry:I{cp,18}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:hhh}
    {spaces_after_argument: }
    *@subentry C1 l28
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:k}
      {spaces_after_argument: }
      *@subentry C1 l28
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:nnn}
        {spaces_after_argument:\\n}
  *index_entry_command@cindex C1 l29
  |EXTRA
  |element_node:{chapter-second}
  |index_entry:I{cp,19}
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:hhh}
    {spaces_after_argument: }
    *@subentry C1 l29
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:l}
      {spaces_after_argument: }
      *@subentry C1 l29
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:third}
        {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@printindex C1 l31
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:cp}
    {spaces_after_argument:\\n}
';


$result_texis{'sorted_subentries'} = '@node Top
@top

@node chapter one
@chapter one

@cindex aa @subentry bb
@cindex ab @subentry cc
@cindex aa @subentry dd
@cindex bb @subentry cc

@cindex hhh @subentry jjj @subentry lll
@cindex hhh @subentry jjj
@cindex hhh jjj
@cindex hhh @subentry k
@cindex hhh @subentry 
@cindex hhh 
@cindex hhh @subentry jjj @subentry lll @subentry ppp

@node chapter second
@chapter second
@cindex hhh @subentry jjj @subentry lll
@cindex hhh 
@cindex @samp{hhh} @subentry jjj
@cindex @kbd{hhh} @subentry @sc{jjj} @subentry @email{jjj,mymail}
@cindex @subentry aa
@cindex hhh @subentry jjj @subentry lll @sortas{A}
@cindex hhh @subentry k @subentry nnn
@cindex hhh @subentry l @subentry third

@printindex cp
';


$result_texts{'sorted_subentries'} = '
1 one
*****



2 second
********

';

$result_errors{'sorted_subentries'} = '* W l16|@subentry missing argument
 warning: @subentry missing argument

* E l18|no more than two levels of index subentry are allowed
 no more than two levels of index subentry are allowed

* W l16|empty index sub entry 1 key in @cindex
 warning: empty index sub entry 1 key in @cindex

* W l26|empty index key in @cindex
 warning: empty index key in @cindex

';

$result_nodes_list{'sorted_subentries'} = '1|Top
 associated_section
 associated_title_command
 node_directions:
  next->chapter one
2|chapter one
 associated_section: 1 one
 associated_title_command: 1 one
 node_directions:
  next->chapter second
  prev->Top
  up->Top
3|chapter second
 associated_section: 2 second
 associated_title_command: 2 second
 node_directions:
  prev->chapter one
  up->Top
';

$result_sections_list{'sorted_subentries'} = '1
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->one
 section_children:
  1|one
  2|second
2|one
 associated_anchor_command: chapter one
 associated_node: chapter one
 section_directions:
  next->second
  up->
 toplevel_directions:
  next->second
  prev->
  up->
3|second
 associated_anchor_command: chapter second
 associated_node: chapter second
 section_directions:
  prev->one
  up->
 toplevel_directions:
  prev->one
  up->
';

$result_sectioning_root{'sorted_subentries'} = 'level: -1
list:
 1|
';

$result_headings_list{'sorted_subentries'} = '';

$result_indices_sort_strings{'sorted_subentries'} = 'cp:
 , aa
 aa, bb
 aa, dd
 ab, cc
 bb, cc
 hhh
 hhh
 hhh, 
 hhh, jjj
 hhh, jjj
 hhh, jjj, A
 hhh, jjj, lll
 hhh, jjj, lll
 hhh, jjj, lll, ppp
 hhh, JJJ, mymail
 hhh, k
 hhh, k, nnn
 hhh, l, third
 hhh jjj
';


$result_converted{'info'}->{'sorted_subentries'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chapter one,  Up: (dir)

* Menu:

* chapter one::
* chapter second::


File: ,  Node: chapter one,  Next: chapter second,  Prev: Top,  Up: Top

1 one
*****


File: ,  Node: chapter second,  Prev: chapter one,  Up: Top

2 second
********

 [index ]
* Menu:

* , aa:                                  chapter second.        (line 6)
* aa, bb:                                chapter one.           (line 5)
* aa, dd:                                chapter one.           (line 5)
* ab, cc:                                chapter one.           (line 5)
* bb, cc:                                chapter one.           (line 5)
* hhh:                                   chapter one.           (line 5)
* hhh <1>:                               chapter second.        (line 6)
* hhh, :                                 chapter one.           (line 5)
* hhh, jjj:                              chapter one.           (line 5)
* hhh, jjj <1>:                          chapter second.        (line 6)
* hhh, jjj, lll:                         chapter second.        (line 6)
* hhh, jjj, lll <1>:                     chapter one.           (line 5)
* hhh, jjj, lll <2>:                     chapter second.        (line 6)
* hhh, jjj, lll, ppp:                    chapter one.           (line 5)
* hhh, JJJ, mymail <jjj>:                chapter second.        (line 6)
* hhh, k:                                chapter one.           (line 5)
* hhh, k, nnn:                           chapter second.        (line 6)
* hhh, l, third:                         chapter second.        (line 6)
* hhh jjj:                               chapter one.           (line 5)


Tag Table:
Node: Top27
Node: chapter one126
Node: chapter second214
Ref: Index: cp296

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_sort_strings{'info'}->{'sorted_subentries'} = 'cp:
 , aa
 aa, bb
 aa, dd
 ab, cc
 bb, cc
 hhh
 hhh
 hhh, 
 hhh, jjj
 hhh, jjj
 hhh, jjj, A
 hhh, jjj, lll
 hhh, jjj, lll
 hhh, jjj, lll, ppp
 hhh, JJJ, mymail
 hhh, k
 hhh, k, nnn
 hhh, l, third
 hhh jjj
';

$result_converted_errors{'info'}->{'sorted_subentries'} = '* W l16|empty index sub entry 1 key in @cindex
 warning: empty index sub entry 1 key in @cindex

* W l26|empty index key in @cindex
 warning: empty index key in @cindex

';


$result_converted{'plaintext'}->{'sorted_subentries'} = '1 one
*****

2 second
********

* Menu:

* , aa:                                  chapter second.        (line 6)
* aa, bb:                                chapter one.           (line 2)
* aa, dd:                                chapter one.           (line 2)
* ab, cc:                                chapter one.           (line 2)
* bb, cc:                                chapter one.           (line 2)
* hhh:                                   chapter one.           (line 2)
* hhh <1>:                               chapter second.        (line 6)
* hhh, :                                 chapter one.           (line 2)
* hhh, jjj:                              chapter one.           (line 2)
* hhh, jjj <1>:                          chapter second.        (line 6)
* hhh, jjj, lll:                         chapter second.        (line 6)
* hhh, jjj, lll <1>:                     chapter one.           (line 2)
* hhh, jjj, lll <2>:                     chapter second.        (line 6)
* hhh, jjj, lll, ppp:                    chapter one.           (line 2)
* hhh, JJJ, mymail <jjj>:                chapter second.        (line 6)
* hhh, k:                                chapter one.           (line 2)
* hhh, k, nnn:                           chapter second.        (line 6)
* hhh, l, third:                         chapter second.        (line 6)
* hhh jjj:                               chapter one.           (line 2)

';

$result_converted_sort_strings{'plaintext'}->{'sorted_subentries'} = 'cp:
 , aa
 aa, bb
 aa, dd
 ab, cc
 bb, cc
 hhh
 hhh
 hhh, 
 hhh, jjj
 hhh, jjj
 hhh, jjj, A
 hhh, jjj, lll
 hhh, jjj, lll
 hhh, jjj, lll, ppp
 hhh, JJJ, mymail
 hhh, k
 hhh, k, nnn
 hhh, l, third
 hhh jjj
';

$result_converted_errors{'plaintext'}->{'sorted_subentries'} = '* W l16|empty index sub entry 1 key in @cindex
 warning: empty index sub entry 1 key in @cindex

* W l26|empty index key in @cindex
 warning: empty index key in @cindex

';


$result_converted{'html_text'}->{'sorted_subentries'} = '<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button">[<a href="#chapter-second" title="Index" rel="index">Index</a>]</span></p>
<a class="top" id="SEC_Top"></a>
<ul class="mini-toc">
<li><a href="#chapter-one">one</a></li>
<li><a href="#chapter-second">second</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter-one">
<p class="nav-panel">
<span class="nav-button">[<a href="#chapter-second" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="one"><span>1 one<a class="copiable-link" href="#one"> &para;</a></span></h2>

<a class="index-entry-id" id="index-aa-bb"></a>
<a class="index-entry-id" id="index-ab-cc"></a>
<a class="index-entry-id" id="index-aa-dd"></a>
<a class="index-entry-id" id="index-bb-cc"></a>

<a class="index-entry-id" id="index-hhh-jjj-lll"></a>
<a class="index-entry-id" id="index-hhh-jjj"></a>
<a class="index-entry-id" id="index-hhh-jjj-1"></a>
<a class="index-entry-id" id="index-hhh-k"></a>
<a class="index-entry-id" id="index-hhh-"></a>
<a class="index-entry-id" id="index-hhh"></a>
<a class="index-entry-id" id="index-hhh-jjj-lll-ppp"></a>

<hr>
</div>
<div class="chapter-level-extent" id="chapter-second">
<p class="nav-panel">
<span class="nav-button">[<a href="#chapter-second" title="Index" rel="index">Index</a>]</span></p>
<h2 class="chapter" id="second"><span>2 second<a class="copiable-link" href="#second"> &para;</a></span></h2>
<a class="index-entry-id" id="index-hhh-jjj-lll-1"></a>
<a class="index-entry-id" id="index-hhh-1"></a>
<a class="index-entry-id" id="index-hhh-jjj-2"></a>
<a class="index-entry-id" id="index-hhh-jjj-jjj"></a>
<a class="index-entry-id" id="index--aa"></a>
<a class="index-entry-id" id="index-hhh-jjj-lll-2"></a>
<a class="index-entry-id" id="index-hhh-k-nnn"></a>
<a class="index-entry-id" id="index-hhh-l-third"></a>

<div class="printindex cp-printindex">
<table class="index-letters-header-printindex cp-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chapter-second_cp_symbol-1"><b></b></a>
 &nbsp; 
<br>
<a class="summary-letter-printindex" href="#chapter-second_cp_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-second_cp_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-second_cp_letter-H"><b>H</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex cp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter-second_cp_symbol-1"></th></tr>
<tr><td class="printindex-index-entry"></td><td></td></tr>
<tr><td class="printindex-index-subentry-level-1"><a href="#index--aa">aa</a></td><td class="printindex-index-section"><a href="#chapter-second">chapter second</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter-second_cp_letter-A">A</th></tr>
<tr><td class="printindex-index-entry">aa</td><td></td></tr>
<tr><td class="printindex-index-subentry-level-1"><a href="#index-aa-bb">bb</a></td><td class="printindex-index-section"><a href="#chapter-one">chapter one</a></td></tr>
<tr><td class="printindex-index-subentry-level-1"><a href="#index-aa-dd">dd</a></td><td class="printindex-index-section"><a href="#chapter-one">chapter one</a></td></tr>
<tr><td class="printindex-index-entry">ab</td><td></td></tr>
<tr><td class="printindex-index-subentry-level-1"><a href="#index-ab-cc">cc</a></td><td class="printindex-index-section"><a href="#chapter-one">chapter one</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter-second_cp_letter-B">B</th></tr>
<tr><td class="printindex-index-entry">bb</td><td></td></tr>
<tr><td class="printindex-index-subentry-level-1"><a href="#index-bb-cc">cc</a></td><td class="printindex-index-section"><a href="#chapter-one">chapter one</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex cp-letter-header-printindex" colspan="2" id="chapter-second_cp_letter-H">H</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-hhh">hhh</a></td><td class="printindex-index-section"><a href="#chapter-one">chapter one</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-hhh-1">hhh</a></td><td class="printindex-index-section"><a href="#chapter-second">chapter second</a></td></tr>
<tr><td class="printindex-index-subentry-level-1"><a href="#index-hhh-"></a></td><td class="printindex-index-section"><a href="#chapter-one">chapter one</a></td></tr>
<tr><td class="printindex-index-subentry-level-1"><a href="#index-hhh-jjj">jjj</a></td><td class="printindex-index-section"><a href="#chapter-one">chapter one</a></td></tr>
<tr><td class="printindex-index-subentry-level-1"><a href="#index-hhh-jjj-2">jjj</a></td><td class="printindex-index-section"><a href="#chapter-second">chapter second</a></td></tr>
<tr><td class="printindex-index-subentry-level-2"><a href="#index-hhh-jjj-lll-2">lll</a></td><td class="printindex-index-section"><a href="#chapter-second">chapter second</a></td></tr>
<tr><td class="printindex-index-subentry-level-2"><a href="#index-hhh-jjj-lll">lll</a></td><td class="printindex-index-section"><a href="#chapter-one">chapter one</a></td></tr>
<tr><td class="printindex-index-subentry-level-2"><a href="#index-hhh-jjj-lll-1">lll</a></td><td class="printindex-index-section"><a href="#chapter-second">chapter second</a></td></tr>
<tr><td class="printindex-index-subentry-level-2"><a href="#index-hhh-jjj-lll-ppp">lll, ppp</a></td><td class="printindex-index-section"><a href="#chapter-one">chapter one</a></td></tr>
<tr><td class="printindex-index-subentry-level-2"><a href="#index-hhh-jjj-jjj"><a class="email" href="mailto:jjj">mymail</a></a></td><td class="printindex-index-section"><a href="#chapter-second">chapter second</a></td></tr>
<tr><td class="printindex-index-subentry-level-1"><a href="#index-hhh-k">k</a></td><td class="printindex-index-section"><a href="#chapter-one">chapter one</a></td></tr>
<tr><td class="printindex-index-subentry-level-2"><a href="#index-hhh-k-nnn">nnn</a></td><td class="printindex-index-section"><a href="#chapter-second">chapter second</a></td></tr>
<tr><td class="printindex-index-subentry-level-1">l</td><td></td></tr>
<tr><td class="printindex-index-subentry-level-2"><a href="#index-hhh-l-third">third</a></td><td class="printindex-index-section"><a href="#chapter-second">chapter second</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-hhh-jjj-1">hhh jjj</a></td><td class="printindex-index-section"><a href="#chapter-one">chapter one</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex cp-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chapter-second_cp_symbol-1"><b></b></a>
 &nbsp; 
<br>
<a class="summary-letter-printindex" href="#chapter-second_cp_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-second_cp_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chapter-second_cp_letter-H"><b>H</b></a>
 &nbsp; 
</td></tr></table>
</div>
</div>
</div>
';

$result_converted_errors{'html_text'}->{'sorted_subentries'} = '* W l16|empty index sub entry 1 key in @cindex
 warning: empty index sub entry 1 key in @cindex

* W l26|empty index key in @cindex
 warning: empty index key in @cindex

';


$result_converted{'xml'}->{'sorted_subentries'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter one</nodenext></node>
<top><sectiontitle></sectiontitle>

</top>
<node identifier="chapter-one"><nodename> chapter one</nodename><nodenext automatic="on"> chapter second</nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> one</sectiontitle>

<cindex index="cp"> <indexterm index="cp" number="1">aa <subentry> bb</subentry>
</indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="2">ab <subentry> cc</subentry>
</indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="3">aa <subentry> dd</subentry>
</indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="4">bb <subentry> cc</subentry>
</indexterm></cindex>
<cindex index="cp"> <indexterm index="cp" number="5">hhh <subentry> jjj <subentry> lll</subentry>
</subentry></indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="6">hhh <subentry> jjj</subentry>
</indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="7">hhh jjj</indexterm></cindex>
<cindex index="cp"> <indexterm index="cp" number="8">hhh <subentry> k</subentry>
</indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="9">hhh <subentry> </subentry>
</indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="10">hhh</indexterm></cindex>
<cindex index="cp"> <indexterm index="cp" number="11">hhh <subentry> jjj <subentry> lll <subentry> ppp</subentry>
</subentry></subentry></indexterm></cindex>
</chapter>
<node identifier="chapter-second"><nodename> chapter second</nodename><nodeprev automatic="on"> chapter one</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> second</sectiontitle>
<cindex index="cp"> <indexterm index="cp" number="12">hhh <subentry> jjj <subentry> lll</subentry>
</subentry></indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="13">hhh</indexterm></cindex>
<cindex index="cp"> <indexterm index="cp" number="14"><samp>hhh</samp> <subentry> jjj</subentry>
</indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="15"><kbd>hhh</kbd> <subentry> <sc>jjj</sc> <subentry> <email><emailaddress>jjj</emailaddress><emailname>mymail</emailname></email></subentry>
</subentry></indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="16"><subentry> aa</subentry>
</indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="17">hhh <subentry> jjj <subentry> lll <sortas>A</sortas></subentry>
</subentry></indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="18">hhh <subentry> k <subentry> nnn</subentry>
</subentry></indexterm></cindex><cindex index="cp"> <indexterm index="cp" number="19">hhh <subentry> l <subentry> third</subentry>
</subentry></indexterm></cindex>
<printindex value="cp" line=" cp"></printindex>
</chapter>
';

1;
