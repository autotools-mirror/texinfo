use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'setfilename_on_top_and_after_node'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@top C3 l2 {In top @setfilename very badly placed setfilename
}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C2
    {In top }
    *@setfilename C1 l2
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{very badly placed setfilename}
     *line_arg C1
     |INFO
     |spaces_after_argument:
      |{spaces_after_argument:\\n}
      {very badly placed setfilename}
  {empty_line:\\n}
  *@setfilename C1 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |text_arg:{a bit too late}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {a bit too late}
';


$result_texis{'setfilename_on_top_and_after_node'} = '@node Top
@top In top @setfilename very badly placed setfilename

@setfilename a bit too late
';


$result_texts{'setfilename_on_top_and_after_node'} = 'In top 
*******

';

$result_errors{'setfilename_on_top_and_after_node'} = '* W l2|@setfilename should only appear at the beginning of a line
 warning: @setfilename should only appear at the beginning of a line

* W l2|@setfilename should not appear on @top line
 warning: @setfilename should not appear on @top line

* W l2|@setfilename after the first element
 warning: @setfilename after the first element

* W l4|multiple @setfilename
 warning: multiple @setfilename

* W l4|@setfilename after the first element
 warning: @setfilename after the first element

';

$result_nodes_list{'setfilename_on_top_and_after_node'} = '1|Top
 associated_section: In top @setfilename very badly placed setfilename

 associated_title_command: In top @setfilename very badly placed setfilename

';

$result_sections_list{'setfilename_on_top_and_after_node'} = '1|In top @setfilename very badly placed setfilename

 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'setfilename_on_top_and_after_node'} = 'level: -1
list:
 1|In top @setfilename very badly placed setfilename

';

$result_headings_list{'setfilename_on_top_and_after_node'} = '';


$result_converted{'plaintext'}->{'setfilename_on_top_and_after_node'} = 'In top 
*******

';


$result_converted{'html'}->{'setfilename_on_top_and_after_node'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>In top </title>

<meta name="description" content="In top ">
<meta name="keywords" content="In top ">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body lang="">
<div class="top-level-extent" id="Top">
<h1 class="top" id="In-top-"><span>In top <a class="copiable-link" href="#In-top-"> &para;</a></span></h1>

</div>



</body>
</html>
';

1;
