use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'definfoenclose_space_before_brace'} = '*document_root C1
 *before_node_section C2
  *preamble C2
   *normal_command@definfoenclose C1 l1
   |misc_args:A{phoo|;|!}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:phoo,;,!}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phoo C2 l3
   |begin:{;}
   |end:{!}
    {spaces_after_cmd_before_arg: }
    *brace_container C1
     {normal_text:h}
   {normal_text:\\n}
';


$result_texis{'definfoenclose_space_before_brace'} = '@definfoenclose phoo,;,!

@phoo {h}
';


$result_texts{'definfoenclose_space_before_brace'} = '
h
';

$result_errors{'definfoenclose_space_before_brace'} = '* W l1|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

';

$result_nodes_list{'definfoenclose_space_before_brace'} = '';

$result_sections_list{'definfoenclose_space_before_brace'} = '';

$result_sectioning_root{'definfoenclose_space_before_brace'} = '';

$result_headings_list{'definfoenclose_space_before_brace'} = '';


$result_converted{'plaintext'}->{'definfoenclose_space_before_brace'} = ';h!
';


$result_converted{'html_text'}->{'definfoenclose_space_before_brace'} = '
<p>;h!
</p>';


$result_converted{'latex_text'}->{'definfoenclose_space_before_brace'} = '
\\begin{document}
h
';


$result_converted{'docbook'}->{'definfoenclose_space_before_brace'} = '
<para>h
</para>';

1;
