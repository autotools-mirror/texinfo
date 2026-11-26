use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'misc_raw_comments'} = '*document_root C1
 *before_node_section C3
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C4
   *normal_command@html C3 l2
    *arguments_line C1
     *block_line_arg C2
      {spaces_before_argument: }
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment space}
        {spaces_after_argument:\\n}
    *rawpreformatted C1
     {normal_text:in html }
    *normal_command@end C1 l3
    |text_arg:{html}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:html}
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment no space}
        {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@tex C2 l5
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      {normal_text:in tex}
      {spaces_after_argument:\\n}
    *normal_command@end C1 l6
    |text_arg:{tex}
     *line_arg C4
      {spaces_before_argument: }
      {normal_text:tex}
      {spaces_after_argument:    }
      *normal_command@c C1
       *line_arg C3
        {spaces_before_argument: }
        {rawline_text:comment after end tex}
        {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@verbatim C4 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   {raw:in verbatim @c in verbatim\\n}
   {raw:in verbatim2\\n}
   *normal_command@end C1 l11
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument:\\n}
';


$result_texis{'misc_raw_comments'} = '
@html @c comment space
in html @end html@c comment no space

@tex in tex
@end tex    @c comment after end tex

@verbatim
in verbatim @c in verbatim
in verbatim2
@end verbatim
';


$result_texts{'misc_raw_comments'} = 'in html 

in verbatim @c in verbatim
in verbatim2
';

$result_errors{'misc_raw_comments'} = '* W l3|@end should only appear at the beginning of a line
 warning: @end should only appear at the beginning of a line

* W l5|unexpected argument on @tex line: in tex
 warning: unexpected argument on @tex line: in tex

';

$result_nodes_list{'misc_raw_comments'} = '';

$result_sections_list{'misc_raw_comments'} = '';

$result_sectioning_root{'misc_raw_comments'} = '';

$result_headings_list{'misc_raw_comments'} = '';


$result_converted{'plaintext'}->{'misc_raw_comments'} = 'in verbatim @c in verbatim
in verbatim2
';


$result_converted{'xml'}->{'misc_raw_comments'} = '<preamblebeforebeginning>
</preamblebeforebeginning><html endspaces=" "> <!-- c comment space -->
in html </html><!-- c comment no space -->

<tex endspaces=" ">
</tex>    <!-- c comment after end tex -->

<verbatim xml:space="preserve" endspaces=" ">
in verbatim @c in verbatim
in verbatim2
</verbatim>
';

1;
