use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'uref_accented_letter_latin1'} = '*document_root C1
 *before_node_section C3
  *@documentencoding C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |input_encoding_name:{iso-8859-1}
  |text_arg:{ISO-8859-1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {ISO-8859-1}
  {empty_line:\\n}
  *paragraph C2
   *@uref C1 l3
    *brace_arg C3
     {http://example.com/acc_}
     *@" C1 l3
      *following_arg C1
       {a}
     *@ogonek C1 l3
      *brace_container C1
       {a}
   {\\n}
';


$result_texis{'uref_accented_letter_latin1'} = '@documentencoding ISO-8859-1

@uref{http://example.com/acc_@"a@ogonek{a}}
';


$result_texts{'uref_accented_letter_latin1'} = '
http://example.com/acc_a"a;
';

$result_errors{'uref_accented_letter_latin1'} = '';

$result_nodes_list{'uref_accented_letter_latin1'} = '';

$result_sections_list{'uref_accented_letter_latin1'} = '';

$result_sectioning_root{'uref_accented_letter_latin1'} = '';

$result_headings_list{'uref_accented_letter_latin1'} = '';


$result_converted{'html'}->{'uref_accented_letter_latin1'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">



</head>

<body lang="">

<p><a class="uref" href="http://example.com/acc_%c3%a4%c4%85">http://example.com/acc_&auml;&#261;</a>
</p>


</body>
</html>
';

$result_converted_errors{'html'}->{'uref_accented_letter_latin1'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
