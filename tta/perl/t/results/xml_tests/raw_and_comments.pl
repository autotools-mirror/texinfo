use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'raw_and_comments'} = '*document_root C1
 *before_node_section C2
  *preamble C2
   *normal_command@tex C3 l1
    *arguments_line C1
     *block_line_arg C2
      {spaces_before_argument:  }
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment}
        {spaces_after_argument:\\n}
    *rawpreformatted C1
     {normal_text:in <tex>\\n}
    *normal_command@end C1 l3
    |text_arg:{tex}
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:  }
      *normal_command@comment C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:other comment}
        {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   {normal_text:Para\\n}
   *normal_command@xml C3 l6
    *arguments_line C1
     *block_line_arg C2
      {spaces_before_argument: }
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:in xml comment}
        {spaces_after_argument:\\n}
    *rawpreformatted C1
     {normal_text:<in />\\n}
    *normal_command@end C1 l8
    |text_arg:{xml}
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:xml}
      {spaces_after_argument:  }
      *normal_command@comment C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:end xml comment}
        {spaces_after_argument:\\n}
';


$result_texis{'raw_and_comments'} = '@tex  @c comment
in <tex>
@end tex  @comment other comment

Para
@xml @c in xml comment
<in />
@end xml  @comment end xml comment
';


$result_texts{'raw_and_comments'} = 'in <tex>

Para
<in />
';

$result_errors{'raw_and_comments'} = '* W l6|@xml is obsolete
 warning: @xml is obsolete

';

$result_nodes_list{'raw_and_comments'} = '';

$result_sections_list{'raw_and_comments'} = '';

$result_sectioning_root{'raw_and_comments'} = '';

$result_headings_list{'raw_and_comments'} = '';


$result_converted{'xml'}->{'raw_and_comments'} = '<tex endspaces=" ">  <!-- c comment -->
in &lt;tex&gt;
</tex>  <!-- comment other comment -->

<para>Para
<in />
</para>';

1;
