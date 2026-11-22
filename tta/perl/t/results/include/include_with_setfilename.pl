use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'include_with_setfilename'} = '*document_root C1
 *before_node_section C2
  *preamble_before_setfilename C3
   {normal_text:}
   >SOURCEMARKS
   >include<start;1>
    >*normal_command@include C1 l1
    >|EXTRA
    >|text_arg:{included_file_with_setfilename.texi}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:included_file_with_setfilename.texi}
      >{spaces_after_argument: \\n}
   >setfilename<1>
    >*normal_command@setfilename C1 included_file_with_setfilename.texi:l1
    >|EXTRA
    >|text_arg:{included_file.info}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:included_file.info}
      >{spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:In included file.\\n}
    >SOURCEMARKS
    >include<end;1><p:18>
  *preamble_before_content C1
   *normal_command@setfilename C1 l2
   |EXTRA
   |text_arg:{include_with_setfilename.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:include_with_setfilename.info}
     {spaces_after_argument:\\n}
';


$result_texis{'include_with_setfilename'} = '
In included file.
@setfilename include_with_setfilename.info
';


$result_texts{'include_with_setfilename'} = '';

$result_errors{'include_with_setfilename'} = '';

$result_nodes_list{'include_with_setfilename'} = '';

$result_sections_list{'include_with_setfilename'} = '';

$result_sectioning_root{'include_with_setfilename'} = '';

$result_headings_list{'include_with_setfilename'} = '';


$result_converted{'info'}->{'include_with_setfilename'} = Encode::encode('utf-8', 'This is include_with_setfilename.info, produced from .


Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'include_with_setfilename'} = '* W |document without nodes
 warning: document without nodes

';

1;
