use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'uref_accented_letter_ascii'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *@documentencoding C1 l1
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{us-ascii}
   |text_arg:{US-ASCII}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:US-ASCII}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *@uref C1 l3
    *brace_arg C3
     {normal_text:http://example.com/acc_}
     *@" C1 l3
      *following_arg C1
       {normal_text:a}
     *@ogonek C1 l3
      *brace_container C1
       {normal_text:a}
   {normal_text:\\n}
';


$result_texis{'uref_accented_letter_ascii'} = '@documentencoding US-ASCII

@uref{http://example.com/acc_@"a@ogonek{a}}
';


$result_texts{'uref_accented_letter_ascii'} = '
http://example.com/acc_a"a;
';

$result_errors{'uref_accented_letter_ascii'} = '';

$result_nodes_list{'uref_accented_letter_ascii'} = '';

$result_sections_list{'uref_accented_letter_ascii'} = '';

$result_sectioning_root{'uref_accented_letter_ascii'} = '';

$result_headings_list{'uref_accented_letter_ascii'} = '';


$result_converted{'html'}->{'uref_accented_letter_ascii'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=us-ascii">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">



</head>

<body>

<p><a class="uref" href="http://example.com/acc_%c3%a4%c4%85">http://example.com/acc_&auml;&#261;</a>
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'uref_accented_letter_ascii'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
