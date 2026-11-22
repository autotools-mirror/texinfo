use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'paragraphindent_possibilities'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C42 l5 {chap}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:default first para\\n}
  {empty_line:\\n}
  {spaces_before_paragraph: }
  *paragraph C1
   {normal_text:default para\\n}
  {empty_line:\\n}
  *normal_command@paragraphindent C1 l11
  |global_command_number:{1}
  |misc_args:A{asis}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:asis}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph:       }
  *paragraph C1
   {normal_text:para asis (7)\\n}
  {empty_line:\\n}
  *normal_command@paragraphindent C1 l15
  |global_command_number:{2}
  |misc_args:A{none}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:none}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph:     }
  *paragraph C1
   {normal_text:para none\\n}
  {empty_line:\\n}
  *normal_command@paragraphindent C1 l19
  |global_command_number:{3}
  |misc_args:A{23}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:23}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph:    }
  *paragraph C1
   {normal_text:para 23\\n}
  {empty_line:\\n}
  *normal_command@paragraphindent C1 l23
  |global_command_number:{4}
  |misc_args:A{-2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:-2}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph:       }
  *paragraph C1
   {normal_text:para -2 (7)\\n}
  {empty_line:\\n}
  *normal_command@paragraphindent C1 l27
  |global_command_number:{5}
  |misc_args:A{0}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:0}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph:  }
  *paragraph C1
   {normal_text:para 0\\n}
  {empty_line:\\n}
  *normal_command@paragraphindent C1 l31
  |global_command_number:{6}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:-4}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph:  }
  *paragraph C1
   {normal_text:para incorrect -4\\n}
  {empty_line:\\n}
  *normal_command@paragraphindent C1 l35
  |global_command_number:{7}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:something}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  {spaces_before_paragraph:  }
  *paragraph C1
   {normal_text:para incorrect something\\n}
';


$result_texis{'paragraphindent_possibilities'} = '@node Top
@top top

@node chapter
@chapter chap

 default first para

 default para

@paragraphindent asis

       para asis (7)

@paragraphindent none

     para none

@paragraphindent 23

    para 23

@paragraphindent -2

       para -2 (7)

@paragraphindent 0

  para 0

@paragraphindent -4

  para incorrect -4

@paragraphindent something

  para incorrect something
';


$result_texts{'paragraphindent_possibilities'} = 'top
***

1 chap
******

default first para

default para


para asis (7)


para none


para 23


para -2 (7)


para 0


para incorrect -4


para incorrect something
';

$result_errors{'paragraphindent_possibilities'} = '* E l31|@paragraphindent arg must be numeric/`none\'/`asis\', not `-4\'
 @paragraphindent arg must be numeric/`none\'/`asis\', not `-4\'

* E l35|@paragraphindent arg must be numeric/`none\'/`asis\', not `something\'
 @paragraphindent arg must be numeric/`none\'/`asis\', not `something\'

';

$result_nodes_list{'paragraphindent_possibilities'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chap
 associated_title_command: 1 chap
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'paragraphindent_possibilities'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chap
 section_children:
  1|chap
2|chap
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'paragraphindent_possibilities'} = 'level: -1
list:
 1|top
';

$result_headings_list{'paragraphindent_possibilities'} = '';


$result_converted{'plaintext'}->{'paragraphindent_possibilities'} = 'top
***

1 chap
******

default first para

   default para

       para asis (7)

para none

                       para 23

       para -2 (7)

para 0

para incorrect -4

para incorrect something
';


$result_converted{'html_text'}->{'paragraphindent_possibilities'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter">chap</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter" id="chap"><span>1 chap<a class="copiable-link" href="#chap"> &para;</a></span></h2>

<p>default first para
</p>
<p>default para
</p>

<p>para asis (7)
</p>

<p>para none
</p>

<p>para 23
</p>

<p>para -2 (7)
</p>

<p>para 0
</p>

<p>para incorrect -4
</p>

<p>para incorrect something
</p></div>
</div>
';


$result_converted{'xml'}->{'paragraphindent_possibilities'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chap</sectiontitle>

 <para>default first para
</para>
 <para>default para
</para>
<paragraphindent value="asis" line=" asis"></paragraphindent>

       <para>para asis (7)
</para>
<paragraphindent value="none" line=" none"></paragraphindent>

     <para>para none
</para>
<paragraphindent value="23" line=" 23"></paragraphindent>

    <para>para 23
</para>
<paragraphindent value="-2" line=" -2"></paragraphindent>

       <para>para -2 (7)
</para>
<paragraphindent value="0" line=" 0"></paragraphindent>

  <para>para 0
</para>
<paragraphindent line=" -4"></paragraphindent>

  <para>para incorrect -4
</para>
<paragraphindent line=" something"></paragraphindent>

  <para>para incorrect something
</para></chapter>
';


$result_converted{'docbook'}->{'paragraphindent_possibilities'} = '<chapter label="1" id="chapter">
<title>chap</title>

<para>default first para
</para>
<para>default para
</para>

<para>para asis (7)
</para>

<para>para none
</para>

<para>para 23
</para>

<para>para -2 (7)
</para>

<para>para 0
</para>

<para>para incorrect -4
</para>

<para>para incorrect something
</para></chapter>
';


$result_converted{'latex_text'}->{'paragraphindent_possibilities'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{chap}}
\\label{anchor:chapter}%

 default first para

 default para


       para asis (7)

\\setlength{\\parindent}{0pt}

     para none

\\setlength{\\parindent}{23em}

    para 23


       para -2 (7)

\\setlength{\\parindent}{0pt}

  para 0


  para incorrect -4


  para incorrect something
';

1;
