use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_titlefont'} = '*document_root C1
 *before_node_section C3
  {empty_line:\\n}
  *@titlefont C1 l2
  |EXTRA
  |global_command_number:{1}
   *brace_container
  {\\n}
';


$result_texis{'empty_titlefont'} = '
@titlefont{}
';


$result_texts{'empty_titlefont'} = '

';

$result_errors{'empty_titlefont'} = '';

$result_nodes_list{'empty_titlefont'} = '';

$result_sections_list{'empty_titlefont'} = '';

$result_sectioning_root{'empty_titlefont'} = '';

$result_headings_list{'empty_titlefont'} = '';


$result_converted{'html'}->{'empty_titlefont'} = '<!DOCTYPE html>
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

<body lang="">





</body>
</html>
';

$result_converted_errors{'html'}->{'empty_titlefont'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
