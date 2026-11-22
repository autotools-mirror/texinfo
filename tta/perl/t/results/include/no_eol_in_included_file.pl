use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_eol_in_included_file'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C3
   {normal_text:Some thing.\\n}
   >SOURCEMARKS
   >include<start;1><p:12>
    >*normal_command@include C1 l2
    >|EXTRA
    >|text_arg:{include_noeol.texi}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:include_noeol.texi}
      >{spaces_after_argument:\\n}
   {normal_text:AA\\n}
   >SOURCEMARKS
   >include<end;1><p:3>
   {normal_text:Following\\n}
';


$result_texis{'no_eol_in_included_file'} = 'Some thing.
AA
Following
';


$result_texts{'no_eol_in_included_file'} = 'Some thing.
AA
Following
';

$result_errors{'no_eol_in_included_file'} = '';

$result_nodes_list{'no_eol_in_included_file'} = '';

$result_sections_list{'no_eol_in_included_file'} = '';

$result_sectioning_root{'no_eol_in_included_file'} = '';

$result_headings_list{'no_eol_in_included_file'} = '';

1;
