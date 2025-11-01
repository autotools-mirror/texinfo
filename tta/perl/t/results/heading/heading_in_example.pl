use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'heading_in_example'} = '*document_root C1
 *before_node_section C1
  *@example C3 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *@heading C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
   |heading_number:{1}
    *line_arg C4
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {in example }
     *@@
     { }
     *@emph C1 l2
      *brace_container C1
       {heading}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{example}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {example}
';


$result_texis{'heading_in_example'} = '@example
@heading in example @@ @emph{heading}
@end example
';


$result_texts{'heading_in_example'} = 'in example @ heading
====================
';

$result_errors{'heading_in_example'} = '';

$result_nodes_list{'heading_in_example'} = '';

$result_sections_list{'heading_in_example'} = '';

$result_sectioning_root{'heading_in_example'} = '';

$result_headings_list{'heading_in_example'} = '1|in example @@ @emph{heading}
';


$result_converted{'plaintext'}->{'heading_in_example'} = '     in example @ _heading_
     ======================

';


$result_converted{'html'}->{'heading_in_example'} = '<!DOCTYPE html>
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

<style type="text/css">
div.example {margin-left: 3.2em}
</style>


</head>

<body lang="">
<div class="example">
<strong class="heading" id="in-example-_0040-heading">in example @ <em class="emph">heading</em></strong>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'heading_in_example'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
