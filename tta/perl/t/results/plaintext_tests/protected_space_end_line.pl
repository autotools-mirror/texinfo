use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'protected_space_end_line'} = '*document_root C1
 *before_node_section C8
  *preamble
  *paragraph C1
   {normal_text:First para\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:This is a very simple texi manual followed by tab a <>.\\n}
   {normal_text:followed by }
   *normal_command@ 
   *normal_command@ 
   {normal_text:newline.\\n}
  {empty_line:\\n}
  *paragraph C6
   {normal_text:This is a very simple texi manual followed by tab a <>.\\n}
   {normal_text:followed }
   *normal_command@ 
   *normal_command@ 
   *normal_command@ 
   {normal_text:newline.\\n}
  {empty_line:\\n}
  *paragraph C12
   {normal_text:This is a very simple texi manual followed by tab a <>. }
   *normal_command@ 
   *normal_command@ 
   *normal_command@ 
   *normal_command@ 
   *normal_command@ 
   *normal_command@ 
   *normal_command@ 
   *normal_command@ 
   *normal_command@ 
   *normal_command@\\n
   {normal_text:text.\\n}
';


$result_texis{'protected_space_end_line'} = 'First para

This is a very simple texi manual followed by tab a <>.
followed by @ @ newline.

This is a very simple texi manual followed by tab a <>.
followed @ @ @ newline.

This is a very simple texi manual followed by tab a <>. @ @ @ @ @ @ @ @ @ @
text.
';


$result_texts{'protected_space_end_line'} = 'First para

This is a very simple texi manual followed by tab a <>.
followed by   newline.

This is a very simple texi manual followed by tab a <>.
followed    newline.

This is a very simple texi manual followed by tab a <>.           text.
';

$result_errors{'protected_space_end_line'} = '';

$result_nodes_list{'protected_space_end_line'} = '';

$result_sections_list{'protected_space_end_line'} = '';

$result_sectioning_root{'protected_space_end_line'} = '';

$result_headings_list{'protected_space_end_line'} = '';


$result_converted{'plaintext'}->{'protected_space_end_line'} = 'First para

   This is a very simple texi manual followed by tab a <>.  followed by
  newline.

   This is a very simple texi manual followed by tab a <>.  followed
   newline.

   This is a very simple texi manual followed by tab a <>.
          text.
';

1;
