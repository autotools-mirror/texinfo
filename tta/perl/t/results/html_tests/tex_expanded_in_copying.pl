use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'tex_expanded_in_copying'} = '*document_root C1
 *before_node_section C1
  *preamble C1
   *normal_command@copying C3 l1
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@tex C3 l2
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *rawpreformatted C1
      {normal_text:aa\\n}
     *normal_command@end C1 l4
     |text_arg:{tex}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:tex}
       {spaces_after_argument:\\n}
    *normal_command@end C1 l5
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
';


$result_texis{'tex_expanded_in_copying'} = '@copying
@tex
aa
@end tex
@end copying
';


$result_texts{'tex_expanded_in_copying'} = '';

$result_errors{'tex_expanded_in_copying'} = '';

$result_nodes_list{'tex_expanded_in_copying'} = '';

$result_sections_list{'tex_expanded_in_copying'} = '';

$result_sectioning_root{'tex_expanded_in_copying'} = '';

$result_headings_list{'tex_expanded_in_copying'} = '';


$result_converted{'html'}->{'tex_expanded_in_copying'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- aa -->
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">



</head>

<body>



</body>
</html>
';

$result_converted_errors{'html'}->{'tex_expanded_in_copying'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
