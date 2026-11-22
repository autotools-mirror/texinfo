use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'simple_documentlanguage'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@documentlanguage C1 l1
   |EXTRA
   |global_command_number:{1}
   |text_arg:{fr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fr}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C3 l4 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defivar C2 l6
   *def_line C1 l6
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{fr}
   |element_node:{chap}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{fr}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:AAA}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:BBB}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:CCC}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l7
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
';


$result_texis{'simple_documentlanguage'} = '@documentlanguage fr

@node Top
@node chap

@defivar AAA BBB CCC
@end defivar
';


$result_texts{'simple_documentlanguage'} = '

Variable d\'instance de AAA: BBB CCC
';

$result_errors{'simple_documentlanguage'} = '* W l4|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'simple_documentlanguage'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'simple_documentlanguage'} = '';

$result_sectioning_root{'simple_documentlanguage'} = '';

$result_headings_list{'simple_documentlanguage'} = '';

$result_indices_sort_strings{'simple_documentlanguage'} = 'vr:
 BBB de AAA
';


$result_converted{'plaintext'}->{'simple_documentlanguage'} = ' -- Variable d\'instance de AAA : BBB CCC
';

$result_converted_sort_strings{'plaintext'}->{'simple_documentlanguage'} = 'vr:
 BBB de AAA
';

1;
