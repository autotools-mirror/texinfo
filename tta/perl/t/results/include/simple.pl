use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'simple'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C1
   {normal_text:}
   >SOURCEMARKS
   >include<start;1>
    >*normal_command@include C1 l1
    >|text_arg:{inc_file.texi}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:inc_file.texi}
      >{spaces_after_argument:\\n}
  *paragraph C1
   {normal_text:In included file.\\n}
   >SOURCEMARKS
   >include<end;1><p:18>
';


$result_texis{'simple'} = 'In included file.
';


$result_texts{'simple'} = 'In included file.
';

$result_errors{'simple'} = '';

$result_nodes_list{'simple'} = '';

$result_sections_list{'simple'} = '';

$result_sectioning_root{'simple'} = '';

$result_headings_list{'simple'} = '';


$result_converted{'info'}->{'simple'} = Encode::encode('utf-8', 'This is , produced from .

In included file.

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'simple'} = '* W |document without nodes
 warning: document without nodes

';


$result_converted{'plaintext'}->{'simple'} = 'In included file.
';


$result_converted{'html'}->{'simple'} = '<!DOCTYPE html>
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
<p>In included file.
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'simple'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'simple'} = '<para>In included file.
</para>';


$result_converted{'docbook'}->{'simple'} = '<para>In included file.
</para>';


$result_converted{'latex_text'}->{'simple'} = '\\begin{document}
In included file.
';

1;
