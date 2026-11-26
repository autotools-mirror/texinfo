use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bad_documentlanguage'} = '*document_root C1
 *before_node_section C7
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content
  *paragraph C2
   {normal_text:documentlanguage }
   *normal_command@documentlanguage C1 l2
   |global_command_number:{1}
   |text_arg:{en}
    *line_arg C3
     {spaces_before_argument:  }
     {normal_text:en}
     {spaces_after_argument: \\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l4
  |global_command_number:{2}
  |text_arg:{en }
   *line_arg C3
    {spaces_before_argument:  }
    {normal_text:en }
    *normal_command@documentlanguage C1 l4
    |global_command_number:{3}
    |text_arg:{en}
     *line_arg C3
      {spaces_before_argument:  }
      {normal_text:en}
      {spaces_after_argument:  \\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l6
  |global_command_number:{4}
  |text_arg:{en  after documentlanguage}
   *line_arg C3
    {spaces_before_argument:  }
    {normal_text:en  after documentlanguage}
    {spaces_after_argument:\\n}
';


$result_texis{'bad_documentlanguage'} = '
documentlanguage @documentlanguage  en 

@documentlanguage  en @documentlanguage  en  

@documentlanguage  en  after documentlanguage
';


$result_texts{'bad_documentlanguage'} = 'documentlanguage 

';

$result_errors{'bad_documentlanguage'} = '* W l2|@documentlanguage should only appear at the beginning of a line
 warning: @documentlanguage should only appear at the beginning of a line

* W l4|@documentlanguage should only appear at the beginning of a line
 warning: @documentlanguage should only appear at the beginning of a line

* W l4|@documentlanguage should not appear in @documentlanguage
 warning: @documentlanguage should not appear in @documentlanguage

* E l4|bad argument to @documentlanguage: en @documentlanguage  en
 bad argument to @documentlanguage: en @documentlanguage  en

* W l6|en  after documentlanguage is not a valid language argument
 warning: en  after documentlanguage is not a valid language argument

';

$result_nodes_list{'bad_documentlanguage'} = '';

$result_sections_list{'bad_documentlanguage'} = '';

$result_sectioning_root{'bad_documentlanguage'} = '';

$result_headings_list{'bad_documentlanguage'} = '';

1;
