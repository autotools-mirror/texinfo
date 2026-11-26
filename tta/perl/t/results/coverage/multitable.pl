use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'multitable'} = '*document_root C1
 *before_node_section C5
  *before_beginning C1
   {empty_line:\\n}
  *preamble
  *normal_command@multitable C4 l2
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l2
     |misc_args:A{0.6|0.4}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:0.6 0.4}
       {spaces_after_argument:\\n}
   *multitable_head C1
    *row C2
    |row_number:{1}
     *normal_command@headitem C2 l3
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:mu--ltitable headitem }
     *normal_command@tab C2 l3
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:another tab\\n}
   *multitable_body C3
    *row C2
    |row_number:{2}
     *normal_command@item C2 l4
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:mu--ltitable item }
     *normal_command@tab C2 l4
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:multitable tab\\n}
       *normal_command@c C1
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:comment in multitable}
         {spaces_after_argument:\\n}
    *row C2
    |row_number:{3}
     *normal_command@item C2 l6
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:mu--ltitable item 2 }
     *normal_command@tab C2 l6
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C2
       {normal_text:multitable tab 2\\n}
       *index_entry_command@cindex C1 l7
       |index_entry:I{cp,1}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:index entry within multitable}
         {spaces_after_argument:\\n}
    *row C1
    |row_number:{4}
     *normal_command@item C2 l8
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:lone mu--ltitable item\\n}
   *normal_command@end C1 l9
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@multitable C3 l11
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *bracketed_arg C1 l11
      {normal_text:truc}
     {normal_text: }
     *bracketed_arg C1 l11
      {normal_text:bidule}
     {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |row_number:{1}
     *normal_command@item C2 l12
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:truc }
     *normal_command@tab C2 l12
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:bidule\\n}
   *normal_command@end C1 l13
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'multitable'} = '
@multitable @columnfractions 0.6 0.4
@headitem mu--ltitable headitem @tab another tab
@item mu--ltitable item @tab multitable tab
@c comment in multitable
@item mu--ltitable item 2 @tab multitable tab 2
@cindex index entry within multitable
@item lone mu--ltitable item
@end multitable

@multitable {truc} {bidule}
@item truc @tab bidule
@end multitable
';


$result_texts{'multitable'} = 'mu-ltitable headitem another tab
mu-ltitable item multitable tab
mu-ltitable item 2 multitable tab 2
lone mu-ltitable item

truc bidule
';

$result_errors{'multitable'} = '* W l7|entry for index `cp\' outside of any node
 warning: entry for index `cp\' outside of any node

';

$result_nodes_list{'multitable'} = '';

$result_sections_list{'multitable'} = '';

$result_sectioning_root{'multitable'} = '';

$result_headings_list{'multitable'} = '';

$result_indices_sort_strings{'multitable'} = 'cp:
 index entry within multitable
';


$result_converted{'plaintext'}->{'multitable'} = 'mu-ltitable headitem                        another tab
--------------------------------------------------------------------------
mu-ltitable item                            multitable tab
mu-ltitable item 2                          multitable tab 2
lone mu-ltitable item

truc   bidule
';

$result_converted_sort_strings{'plaintext'}->{'multitable'} = 'cp:
 index entry within multitable
';


$result_converted{'html_text'}->{'multitable'} = '<table class="multitable">
<thead><tr><th width="60%">mu&ndash;ltitable headitem</th><th width="40%">another tab</th></tr></thead>
<tbody><tr><td width="60%">mu&ndash;ltitable item</td><td width="40%">multitable tab</td></tr>
<tr><td width="60%">mu&ndash;ltitable item 2</td><td width="40%">multitable tab 2
<a class="index-entry-id" id="index-index-entry-within-multitable"></a></td></tr>
<tr><td width="60%">lone mu&ndash;ltitable item</td></tr>
</tbody>
</table>

<table class="multitable">
<tbody><tr><td>truc</td><td>bidule</td></tr>
</tbody>
</table>
';


$result_converted{'xml'}->{'multitable'} = '<preamblebeforebeginning>
</preamblebeforebeginning><multitable endspaces=" "><columnfractions line=" 0.6 0.4"><columnfraction value="0.6"></columnfraction><columnfraction value="0.4"></columnfraction></columnfractions>
<thead><row><entry command="headitem"> <para>mu&textndash;ltitable headitem </para></entry><entry command="tab"> <para>another tab
</para></entry></row></thead><tbody><row><entry command="item"> <para>mu&textndash;ltitable item </para></entry><entry command="tab"> <para>multitable tab
<!-- c comment in multitable -->
</para></entry></row><row><entry command="item"> <para>mu&textndash;ltitable item 2 </para></entry><entry command="tab"> <para>multitable tab 2
<cindex index="cp"> <indexterm index="cp" number="1">index entry within multitable</indexterm></cindex>
</para></entry></row><row><entry command="item"> <para>lone mu&textndash;ltitable item
</para></entry></row></tbody></multitable>

<multitable endspaces=" "><columnprototypes> <columnprototype bracketed="on">truc</columnprototype> <columnprototype bracketed="on">bidule</columnprototype>
</columnprototypes>
<tbody><row><entry command="item"> <para>truc </para></entry><entry command="tab"> <para>bidule
</para></entry></row></tbody></multitable>
';


$result_converted{'latex_text'}->{'multitable'} = '\\begin{document}
\\begin{tabular}{m{0.6\\textwidth} m{0.4\\textwidth}}%
mu--ltitable headitem &another tab\\\\
mu--ltitable item &multitable tab\\\\
mu--ltitable item 2 &multitable tab 2
\\index[cp]{index entry within multitable@index entry within multitable}%
\\\\
lone mu--ltitable item&\\\\
\\end{tabular}%

\\begin{tabular}{m{0.4\\textwidth} m{0.6\\textwidth}}%
truc &bidule\\\\
\\end{tabular}%
';


$result_converted{'docbook'}->{'multitable'} = '<informaltable><tgroup cols="2"><colspec colwidth="60*"></colspec><colspec colwidth="40*"></colspec><thead><row><entry><para>mu&#8211;ltitable headitem </para></entry><entry><para>another tab
</para></entry></row></thead><tbody><row><entry><para>mu&#8211;ltitable item </para></entry><entry><para>multitable tab
<!-- comment in multitable -->
</para></entry></row><row><entry><para>mu&#8211;ltitable item 2 </para></entry><entry><para>multitable tab 2
<indexterm role="cp"><primary>index entry within multitable</primary></indexterm>
</para></entry></row><row><entry><para>lone mu&#8211;ltitable item
</para></entry></row></tbody></tgroup></informaltable>
<informaltable><tgroup cols="2"><colspec colwidth="4*"></colspec><colspec colwidth="6*"></colspec><tbody><row><entry><para>truc </para></entry><entry><para>bidule
</para></entry></row></tbody></tgroup></informaltable>';

1;
