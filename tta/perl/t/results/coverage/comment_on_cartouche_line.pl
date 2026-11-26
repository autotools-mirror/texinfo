use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_on_cartouche_line'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@cartouche C3 l1
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:in cartouche.\\n}
   *normal_command@end C1 l3
   |text_arg:{cartouche}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:cartouche}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@cartouche C3 l5
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *normal_command@emph C1 l5
      *brace_container C1
       {normal_text:Title of box}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Out of main text\\n}
   *normal_command@end C1 l7
   |text_arg:{cartouche}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:cartouche}
     {spaces_after_argument:\\n}
';


$result_texis{'comment_on_cartouche_line'} = '@cartouche @c comment
in cartouche.
@end cartouche

@cartouche @emph{Title of box} @c comment
Out of main text
@end cartouche
';


$result_texts{'comment_on_cartouche_line'} = 'in cartouche.

Title of box
Out of main text
';

$result_errors{'comment_on_cartouche_line'} = '';

$result_nodes_list{'comment_on_cartouche_line'} = '';

$result_sections_list{'comment_on_cartouche_line'} = '';

$result_sectioning_root{'comment_on_cartouche_line'} = '';

$result_headings_list{'comment_on_cartouche_line'} = '';


$result_converted{'plaintext'}->{'comment_on_cartouche_line'} = 'in cartouche.

                            _Title of box_
   Out of main text
';


$result_converted{'html_text'}->{'comment_on_cartouche_line'} = '<table class="cartouche"><tr><td>
<p>in cartouche.
</p></td></tr></table>

<table class="cartouche"><tr><th>
<em class="emph">Title of box</em></th></tr><tr><td>
<p>Out of main text
</p></td></tr></table>
';


$result_converted{'xml'}->{'comment_on_cartouche_line'} = '<cartouche endspaces=" "> <!-- c comment -->
<para>in cartouche.
</para></cartouche>

<cartouche endspaces=" "><cartouchetitle> <emph>Title of box</emph> </cartouchetitle><!-- c comment -->
<para>Out of main text
</para></cartouche>
';


$result_converted{'latex_text'}->{'comment_on_cartouche_line'} = '\\begin{document}
\\begin{Texinfocartouche}
in cartouche.
\\end{Texinfocartouche}

\\begin{Texinfocartouche}[title={\\emph{Title of box}}]
Out of main text
\\end{Texinfocartouche}
';


$result_converted{'docbook'}->{'comment_on_cartouche_line'} = '<sidebar><para>in cartouche.
</para></sidebar>
<sidebar><title><emphasis>Title of box</emphasis><!-- comment -->
</title>
<para>Out of main text
</para></sidebar>';

1;
