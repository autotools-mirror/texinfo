use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'definfoenclose_no_braces'} = '*document_root C1
 *before_node_section C2
  *@definfoenclose C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{phoo|;|:}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {phoo,;,:}
  *paragraph C1
   *definfoenclose_command@phoo l2
   |EXTRA
   |begin:{;}
   |end:{:}
';


$result_texis{'definfoenclose_no_braces'} = '@definfoenclose phoo,;,:
@phoo';


$result_texts{'definfoenclose_no_braces'} = '';

$result_errors{'definfoenclose_no_braces'} = '* W l1|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* E l2|@phoo expected braces
 @phoo expected braces

';

$result_nodes_list{'definfoenclose_no_braces'} = '';

$result_sections_list{'definfoenclose_no_braces'} = '';

$result_sectioning_root{'definfoenclose_no_braces'} = '';

$result_headings_list{'definfoenclose_no_braces'} = '';


$result_converted{'plaintext'}->{'definfoenclose_no_braces'} = ';:
';


$result_converted{'html_text'}->{'definfoenclose_no_braces'} = '<p>;:</p>';


$result_converted{'latex_text'}->{'definfoenclose_no_braces'} = '';


$result_converted{'docbook'}->{'definfoenclose_no_braces'} = '<para></para>';

1;
