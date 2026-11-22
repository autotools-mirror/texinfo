use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'flushleft_flushright'} = '*document_root C1
 *before_node_section C5
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *@flushleft C5 l2
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C3
    {normal_text:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc\\n}
    {normal_text:ldskf dsflj\\n}
    {normal_text:     lklsdlv l    lll. Bbb.\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:lhds\\n}
   *@end C1 l8
   |EXTRA
   |text_arg:{flushleft}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushleft}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@flushright C5 l10
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C3
    {normal_text:aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc\\n}
    {normal_text:ldskf dsflj\\n}
    {normal_text:     lklsdlv l    lll. Bbb.\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:lhds\\n}
   *@end C1 l16
   |EXTRA
   |text_arg:{flushright}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushright}
     {spaces_after_argument:\\n}
';


$result_texis{'flushleft_flushright'} = '
@flushleft
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.

lhds
@end flushleft

@flushright
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.

lhds
@end flushright
';


$result_texts{'flushleft_flushright'} = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.

lhds

aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.

lhds
';

$result_errors{'flushleft_flushright'} = '';

$result_nodes_list{'flushleft_flushright'} = '';

$result_sections_list{'flushleft_flushright'} = '';

$result_sectioning_root{'flushleft_flushright'} = '';

$result_headings_list{'flushleft_flushright'} = '';


$result_converted{'plaintext'}->{'flushleft_flushright'} = 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
lklsdlv l lll.  Bbb.

lhds

aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
                                                            ldskf dsflj
                                                   lklsdlv l lll.  Bbb.

                                                                   lhds
';


$result_converted{'html_text'}->{'flushleft_flushright'} = '<div class="flushleft"><p class="flushleft-paragraph">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.
</p>
<p class="flushleft-paragraph">lhds
</p></div>
<div class="flushright"><p class="flushright-paragraph">aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.
</p>
<p class="flushright-paragraph">lhds
</p></div>';


$result_converted{'xml'}->{'flushleft_flushright'} = '<preamblebeforebeginning>
</preamblebeforebeginning><flushleft endspaces=" ">
<para>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.
</para>
<para>lhds
</para></flushleft>

<flushright endspaces=" ">
<para>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.
</para>
<para>lhds
</para></flushright>
';


$result_converted{'latex_text'}->{'flushleft_flushright'} = '\\begin{document}
\\begin{flushleft}
\\begin{Texinfopreformatted}%
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.

lhds
\\end{Texinfopreformatted}
\\end{flushleft}

\\begin{flushright}
\\begin{Texinfopreformatted}%
aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.

lhds
\\end{Texinfopreformatted}
\\end{flushright}
';


$result_converted{'docbook'}->{'flushleft_flushright'} = '<para>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.
</para>
<para>lhds
</para>
<para>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb ccccccccccccccc
ldskf dsflj
     lklsdlv l    lll. Bbb.
</para>
<para>lhds
</para>';

1;
