use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'macro_defined_txiinternalvalue_in_translation'} = '*document_root C1
 *before_node_section C4
  *@sp C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {1}
  {empty_line:\\n}
  *@sp C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |misc_args:A{2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {2}
  {empty_line:\\n}
';


$result_texis{'macro_defined_txiinternalvalue_in_translation'} = '@sp 1

@sp 2

';


$result_texts{'macro_defined_txiinternalvalue_in_translation'} = '




';

$result_errors{'macro_defined_txiinternalvalue_in_translation'} = '';

$result_nodes_list{'macro_defined_txiinternalvalue_in_translation'} = '';

$result_sections_list{'macro_defined_txiinternalvalue_in_translation'} = '';

$result_sectioning_root{'macro_defined_txiinternalvalue_in_translation'} = '';

$result_headings_list{'macro_defined_txiinternalvalue_in_translation'} = '';


$result_converted{'html'}->{'macro_defined_txiinternalvalue_in_translation'} = '<!DOCTYPE html>
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
1 TeX
2 TeX



</body>
</html>
';

$result_converted_errors{'html'}->{'macro_defined_txiinternalvalue_in_translation'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
