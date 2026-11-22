use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comments_on_raw_block_line'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C3
   *normal_command@html C3 l1
    *arguments_line C1
     *block_line_arg C1
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:Hcomment}
        {spaces_after_argument:\\n}
    *elided_rawpreformatted C1
     {raw:In HTML\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:Hafter end}
        {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@tex C3 l5
    *arguments_line C1
     *block_line_arg C1
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:Tcomment}
        {spaces_after_argument:\\n}
    *rawpreformatted C1
     {normal_text:In TeX\\n}
    *normal_command@end C1 l7
    |EXTRA
    |text_arg:{tex}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:tex}
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:Tafter end}
        {spaces_after_argument:\\n}
';


$result_texis{'comments_on_raw_block_line'} = '@html@c Hcomment
In HTML
@end html@c Hafter end

@tex@c Tcomment
In TeX
@end tex@c Tafter end
';


$result_texts{'comments_on_raw_block_line'} = '
In TeX
';

$result_errors{'comments_on_raw_block_line'} = '';

$result_nodes_list{'comments_on_raw_block_line'} = '';

$result_sections_list{'comments_on_raw_block_line'} = '';

$result_sectioning_root{'comments_on_raw_block_line'} = '';

$result_headings_list{'comments_on_raw_block_line'} = '';


$result_converted{'plaintext'}->{'comments_on_raw_block_line'} = '';


$result_converted{'xml'}->{'comments_on_raw_block_line'} = '<html endspaces=" "><!-- c Hcomment -->
In HTML
</html><!-- c Hafter end -->

<tex endspaces=" "><!-- c Tcomment -->
In TeX
</tex><!-- c Tafter end -->
';

1;
