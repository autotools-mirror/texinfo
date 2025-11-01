use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'cartouche'} = '*document_root C1
 *before_node_section C3
  *@cartouche C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {in cartouche.\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cartouche}
  {empty_line:\\n}
  *@cartouche C3 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph C1 l5
      *brace_container C1
       {Title of box}
   *paragraph C1
    {Out of main text\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{cartouche}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {cartouche}
';


$result_texis{'cartouche'} = '@cartouche
in cartouche.
@end cartouche

@cartouche @emph{Title of box}
Out of main text
@end cartouche
';


$result_texts{'cartouche'} = 'in cartouche.

Title of box
Out of main text
';

$result_errors{'cartouche'} = '';

$result_nodes_list{'cartouche'} = '';

$result_sections_list{'cartouche'} = '';

$result_sectioning_root{'cartouche'} = '';

$result_headings_list{'cartouche'} = '';


$result_converted{'plaintext'}->{'cartouche'} = 'in cartouche.

                            _Title of box_
   Out of main text
';


$result_converted{'html_text'}->{'cartouche'} = '<table class="cartouche"><tr><td>
<p>in cartouche.
</p></td></tr></table>

<table class="cartouche"><tr><th>
<em class="emph">Title of box</em></th></tr><tr><td>
<p>Out of main text
</p></td></tr></table>
';


$result_converted{'xml'}->{'cartouche'} = '<cartouche endspaces=" ">
<para>in cartouche.
</para></cartouche>

<cartouche spaces=" " endspaces=" "><cartouchetitle><emph>Title of box</emph></cartouchetitle>
<para>Out of main text
</para></cartouche>
';


$result_converted{'latex_text'}->{'cartouche'} = '\\begin{mdframed}[style=Texinfocartouche]
in cartouche.
\\end{mdframed}

\\begin{mdframed}[style=Texinfocartouche, frametitle={\\emph{Title of box}}]
Out of main text
\\end{mdframed}
';


$result_converted{'docbook'}->{'cartouche'} = '<sidebar><para>in cartouche.
</para></sidebar>
<sidebar><title><emphasis>Title of box</emphasis></title>
<para>Out of main text
</para></sidebar>';

1;
