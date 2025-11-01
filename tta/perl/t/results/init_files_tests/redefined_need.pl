use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'redefined_need'} = '*document_root C1
 *before_node_section C1
  *@need C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{0.1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {0.1}
';


$result_texis{'redefined_need'} = '@need 0.1
';


$result_texts{'redefined_need'} = '';

$result_errors{'redefined_need'} = '';

$result_nodes_list{'redefined_need'} = '';

$result_sections_list{'redefined_need'} = '';

$result_sectioning_root{'redefined_need'} = '';

$result_headings_list{'redefined_need'} = '';


$result_converted{'html'}->{'redefined_need'} = '<!DOCTYPE html>
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
<!-- need: 0.1 (|) -->



</body>
</html>
';

$result_converted_errors{'html'}->{'redefined_need'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  },
  {
    'error_line' => 'warning: need has the right arg: 0.1
',
    'line_nr' => 1,
    'text' => 'need has the right arg: 0.1',
    'type' => 'warning'
  }
];


1;
