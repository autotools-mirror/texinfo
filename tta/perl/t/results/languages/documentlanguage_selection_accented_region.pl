use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentlanguage_selection_accented_region'} = '*document_root C3
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C2
   *normal_command@documentlanguage C1 l2
   |global_command_number:{1}
   |text_arg:{fr_ÂD}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:fr_ÂD}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l4 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 l5 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defivar C2 l7
   *def_line C1 l7
   |def_command:{defivar}
   |element_node:{Top}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:Which}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:Language}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:Selected?}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l8
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'documentlanguage_selection_accented_region'} = '
@documentlanguage fr_ÂD

@node Top
@top top

@defivar Which Language Selected?
@end defivar

';


$result_texts{'documentlanguage_selection_accented_region'} = '
top
***

Instance Variable of Which: Language Selected?

';

$result_errors{'documentlanguage_selection_accented_region'} = '* W l2|fr_ÂD is not a valid language argument
 warning: fr_ÂD is not a valid language argument

';

$result_nodes_list{'documentlanguage_selection_accented_region'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'documentlanguage_selection_accented_region'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'documentlanguage_selection_accented_region'} = 'level: -1
list:
 1|top
';

$result_headings_list{'documentlanguage_selection_accented_region'} = '';

$result_indices_sort_strings{'documentlanguage_selection_accented_region'} = 'vr:
 Language of Which
';


$result_converted{'plaintext'}->{'documentlanguage_selection_accented_region'} = 'top
***

 -- Instance Variable of Which: Language Selected?

';

$result_converted_sort_strings{'plaintext'}->{'documentlanguage_selection_accented_region'} = 'vr:
 Language of Which
';

1;
