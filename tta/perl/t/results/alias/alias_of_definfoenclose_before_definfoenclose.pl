use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'alias_of_definfoenclose_before_definfoenclose'} = '*document_root C1
 *before_node_section C5
  *@alias C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{new|phoo}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {new = phoo}
  {empty_line:\\n}
  *@definfoenclose C1 l3
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
  {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phoo C1 l5
   |INFO
   |alias_of:{new}
   |EXTRA
   |begin:{;}
   |end:{:}
    *brace_container C1
     {aa}
   {\\n}
';


$result_texis{'alias_of_definfoenclose_before_definfoenclose'} = '@alias new = phoo

@definfoenclose phoo,;,:

@phoo{aa}
';


$result_texts{'alias_of_definfoenclose_before_definfoenclose'} = '

aa
';

$result_errors{'alias_of_definfoenclose_before_definfoenclose'} = '* W l3|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

';

$result_nodes_list{'alias_of_definfoenclose_before_definfoenclose'} = '';

$result_sections_list{'alias_of_definfoenclose_before_definfoenclose'} = '';

$result_sectioning_root{'alias_of_definfoenclose_before_definfoenclose'} = '';

$result_headings_list{'alias_of_definfoenclose_before_definfoenclose'} = '';


$result_converted{'plaintext'}->{'alias_of_definfoenclose_before_definfoenclose'} = ';aa:
';

1;
