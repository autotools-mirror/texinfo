use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'space_in_setfilename'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@setfilename C1 l1
    *line_arg C5
     {spaces_before_argument: }
     *normal_command@ 
     *normal_command@verb C1 l1
      *brace_container C3
       {verb_delimiter::}
       {raw: name }
       {verb_delimiter::}
     *normal_command@ 
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
';


$result_texis{'space_in_setfilename'} = '@setfilename @ @verb{: name :}@ 

@node Top
';


$result_texts{'space_in_setfilename'} = '
';

$result_errors{'space_in_setfilename'} = '* W l1|@verb should not appear in @setfilename
 warning: @verb should not appear in @setfilename

* E l1|bad argument to @setfilename: @ @verb{: name :}@
 bad argument to @setfilename: @ @verb{: name :}@

';

$result_nodes_list{'space_in_setfilename'} = '1|Top
';

$result_sections_list{'space_in_setfilename'} = '';

$result_sectioning_root{'space_in_setfilename'} = '';

$result_headings_list{'space_in_setfilename'} = '';


$result_converted{'info'}->{'space_in_setfilename'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
