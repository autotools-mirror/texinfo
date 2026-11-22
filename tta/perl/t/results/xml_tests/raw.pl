use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'raw'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@tex C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:in <tex>\\n}
    *normal_command@end C1 l3
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   {normal_text:Para\\n}
   *normal_command@xml C3 l6
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *rawpreformatted C1
     {normal_text:<in />\\n}
    *normal_command@end C1 l8
    |text_arg:{xml}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:xml}
      {spaces_after_argument:\\n}
';


$result_texis{'raw'} = '@tex
in <tex>
@end tex

Para
@xml
<in />
@end xml
';


$result_texts{'raw'} = 'in <tex>

Para
<in />
';

$result_errors{'raw'} = '* W l6|@xml is obsolete
 warning: @xml is obsolete

';

$result_nodes_list{'raw'} = '';

$result_sections_list{'raw'} = '';

$result_sectioning_root{'raw'} = '';

$result_headings_list{'raw'} = '';


$result_converted{'xml'}->{'raw'} = '<tex endspaces=" ">
in &lt;tex&gt;
</tex>

<para>Para
<in />
</para>';

1;
