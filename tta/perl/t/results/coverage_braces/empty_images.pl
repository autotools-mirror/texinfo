use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_images'} = '*document_root C1
 *before_node_section C11
  *preamble_before_content
  *normal_command@image C1 l1
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg
  {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@image C5 l3
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {spaces_before_argument: }
   *brace_arg C1
    {normal_text:aa}
   *brace_arg C1
    {normal_text:bb}
   *brace_arg C2
    {normal_text:cc}
    {spaces_after_argument: }
   *brace_arg C1
    {normal_text:dd}
  {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@image C4 l5
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg
   *brace_arg
   *brace_arg
   *brace_arg C1
    *normal_command@ 
  {normal_text:\\n}
  *normal_command@image C4 l6
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg
   *brace_arg
   *brace_arg
   *brace_arg C1
    *normal_command@:
  {normal_text:\\n}
';


$result_texis{'empty_images'} = '@image{}

@image{ ,aa,bb,cc ,dd}

@image{,,,@ }
@image{,,,@:}
';


$result_texts{'empty_images'} = '





';

$result_errors{'empty_images'} = '* E l1|@image missing filename argument
 @image missing filename argument

* E l3|@image missing filename argument
 @image missing filename argument

* E l5|@image missing filename argument
 @image missing filename argument

* E l6|@image missing filename argument
 @image missing filename argument

';

$result_nodes_list{'empty_images'} = '';

$result_sections_list{'empty_images'} = '';

$result_sectioning_root{'empty_images'} = '';

$result_headings_list{'empty_images'} = '';

1;
