use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_empty_center'} = '*document_root C2
 *before_node_section C1
  *preamble
 *normal_command@node C7 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@center C1 l3
   *line_arg C4
    {spaces_before_argument: }
    *normal_command@asis C1 l3
     *brace_container
    *normal_command@anchor C1 l3
    |identifier:{toto}
    |is_target:{1}
     *brace_arg C1
      {normal_text:toto}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:a\\n}
  {empty_line:\\n}
  *normal_command@center C1 l7
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@asis C1 l7
     *brace_container
    *normal_command@anchor C1 l7
    |identifier:{titi}
    |is_target:{1}
     *brace_arg C1
      {normal_text:titi}
    *normal_command@w C1 l7
     *brace_container
    {spaces_after_argument:\\n}
';


$result_texis{'anchor_in_empty_center'} = '@node Top

@center @asis{}@anchor{toto}

a

@center @asis{}@anchor{titi}@w{}
';


$result_texts{'anchor_in_empty_center'} = '


a


';

$result_errors{'anchor_in_empty_center'} = '';

$result_nodes_list{'anchor_in_empty_center'} = '1|Top
';

$result_sections_list{'anchor_in_empty_center'} = '';

$result_sectioning_root{'anchor_in_empty_center'} = '';

$result_headings_list{'anchor_in_empty_center'} = '';


$result_converted{'info'}->{'anchor_in_empty_center'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

   a


Tag Table:
Node: Top27
Ref: toto61
Ref: titi67

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
