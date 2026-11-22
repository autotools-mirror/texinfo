use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'modified_translation'} = '*document_root C1
 *before_node_section C11
  *preamble_before_content
  *paragraph C2
   *normal_command@error C1 l1
    *brace_container
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l3
  |global_command_number:{1}
  |text_arg:{fr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:fr }
   *normal_command@error C1 l5
    *brace_container
   {normal_text:.\\n}
  {empty_line:\\n}
  *normal_command@documentlanguage C1 l7
  |global_command_number:{2}
  |text_arg:{pt}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:pt}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:pt }
   *normal_command@error C1 l9
    *brace_container
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'modified_translation'} = '@error{}.

@documentlanguage fr

fr @error{}.

@documentlanguage pt

pt @error{}.

';


$result_texts{'modified_translation'} = 'error->.


fr error->.


pt error->.

';

$result_errors{'modified_translation'} = '';

$result_nodes_list{'modified_translation'} = '';

$result_sections_list{'modified_translation'} = '';

$result_sectioning_root{'modified_translation'} = '';

$result_headings_list{'modified_translation'} = '';


$result_converted{'html'}->{'modified_translation'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">



</head>

<body>
<p>Special Form.
</p>

<p>fr Forme Sp@\'eciale.
</p>

<p>pt Formulário especial.
</p>



</body>
</html>
';

$result_converted_errors{'html'}->{'modified_translation'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
