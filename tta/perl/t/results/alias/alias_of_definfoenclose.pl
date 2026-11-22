use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'alias_of_definfoenclose'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@definfoenclose C1 l1
   |misc_args:A{phoo|;|:}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:phoo,;,:}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@alias C1 l3
   |misc_args:A{new|phoo}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:new = phoo}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *definfoenclose_command@phoo C1 l5
   |alias_of:{new}
   |begin:{;}
   |end:{:}
    *brace_container C1
     {normal_text:aa}
   {normal_text:\\n}
';


$result_texis{'alias_of_definfoenclose'} = '@definfoenclose phoo,;,:

@alias new = phoo

@phoo{aa}
';


$result_texts{'alias_of_definfoenclose'} = '

aa
';

$result_errors{'alias_of_definfoenclose'} = '* W l1|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

';

$result_nodes_list{'alias_of_definfoenclose'} = '';

$result_sections_list{'alias_of_definfoenclose'} = '';

$result_sectioning_root{'alias_of_definfoenclose'} = '';

$result_headings_list{'alias_of_definfoenclose'} = '';


$result_converted{'plaintext'}->{'alias_of_definfoenclose'} = ';aa:
';

1;
