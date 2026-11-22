use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentlanguagevariant_documentscript'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C3
   *normal_command@documentlanguagevariant C1 l1
   |global_command_number:{1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:1901}
     {spaces_after_argument:\\n}
   *normal_command@documentscript C1 l2
   |global_command_number:{1}
   |text_arg:{Latn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Latn}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *normal_command@error C1 l4
    *brace_container
   {normal_text:.\\n}
';


$result_texis{'documentlanguagevariant_documentscript'} = '@documentlanguagevariant 1901
@documentscript Latn

@error{}.
';


$result_texts{'documentlanguagevariant_documentscript'} = '
error->.
';

$result_errors{'documentlanguagevariant_documentscript'} = '';

$result_nodes_list{'documentlanguagevariant_documentscript'} = '';

$result_sections_list{'documentlanguagevariant_documentscript'} = '';

$result_sectioning_root{'documentlanguagevariant_documentscript'} = '';

$result_headings_list{'documentlanguagevariant_documentscript'} = '';


$result_converted{'plaintext'}->{'documentlanguagevariant_documentscript'} = 'error→.
';


$result_converted{'info'}->{'documentlanguagevariant_documentscript'} = Encode::encode('utf-8', 'This is , produced from .

error→.

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'documentlanguagevariant_documentscript'} = '* W |document without nodes
 warning: document without nodes

';


$result_converted{'html'}->{'documentlanguagevariant_documentscript'} = '<!DOCTYPE html>
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

<p>error<span class="arrow">&rarr;</span>.
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'documentlanguagevariant_documentscript'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
