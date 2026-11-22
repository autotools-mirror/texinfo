use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'include_space_comment'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >include<start;1>
    >*normal_command@include C1 l1
    >|text_arg:{inc_file.texi}
     >*line_arg C4
      >{spaces_before_argument: }
      >{normal_text:inc_file.texi}
      >{spaces_after_argument: }
      >*normal_command@c C1
       >*line_arg C2
        >{spaces_before_argument: }
        >{rawline_text:comment}
  *paragraph C1
   {normal_text:In included file.\\n}
   >SOURCEMARKS
   >include<end;1><p:18>
';


$result_texis{'include_space_comment'} = 'In included file.
';


$result_texts{'include_space_comment'} = 'In included file.
';

$result_errors{'include_space_comment'} = '';

$result_nodes_list{'include_space_comment'} = '';

$result_sections_list{'include_space_comment'} = '';

$result_sectioning_root{'include_space_comment'} = '';

$result_headings_list{'include_space_comment'} = '';

1;
