use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'heading_in_quotation'} = '*document_root C1
 *before_node_section C1
  *@quotation C5 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   {empty_line:\\n}
   *@heading C1 l3
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
     {in quotation }
     *@@
     { }
     *@emph C1 l3
      *brace_container C1
       {heading}
   {empty_line:\\n}
   *@end C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{quotation}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {quotation}
';


$result_texis{'heading_in_quotation'} = '@quotation

@heading in quotation @@ @emph{heading}

@end quotation
';


$result_texts{'heading_in_quotation'} = '
in quotation @ heading
======================

';

$result_errors{'heading_in_quotation'} = '';

$result_nodes_list{'heading_in_quotation'} = '';

$result_sections_list{'heading_in_quotation'} = '';

$result_sectioning_root{'heading_in_quotation'} = '';

$result_headings_list{'heading_in_quotation'} = '1|in quotation @@ @emph{heading}
';


$result_converted{'plaintext'}->{'heading_in_quotation'} = '     in quotation @ _heading_
     ========================

';


$result_converted{'html'}->{'heading_in_quotation'} = '<!DOCTYPE html>
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
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<blockquote class="quotation">

<h3 class="heading" id="in-quotation-_0040-heading"><span>in quotation @ <em class="emph">heading</em><a class="copiable-link" href="#in-quotation-_0040-heading"> &para;</a></span></h3>

</blockquote>



</body>
</html>
';

$result_converted_errors{'html'}->{'heading_in_quotation'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
