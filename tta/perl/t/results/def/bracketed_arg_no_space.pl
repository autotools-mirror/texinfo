use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'bracketed_arg_no_space'} = '*document_root C1
 *before_node_section C1
  *@deffn C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C2
      |*bracketed_arg C1
       |{e g}
      |{h}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C2
       *bracketed_arg C1 l1
        {a b}
       *bracketed_arg C1 l1
        {c d}
     {spaces: }
     *def_name C1
      *def_line_arg C2
       *bracketed_arg C1 l1
        {e g}
       {h}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {m}
     *def_arg C1
      *bracketed_arg C1 l1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument: }
       {ll}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l1
       {rest}
     *def_arg C1
      *bracketed_arg C1 l1
       {and more}
   *@end C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
';


$result_texis{'bracketed_arg_no_space'} = '@deffn {a b}{c d} {e g}h m{ll } {rest}{and more}
@end deffn
';


$result_texts{'bracketed_arg_no_space'} = 'a bc d: e gh mll restand more
';

$result_errors{'bracketed_arg_no_space'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'bracketed_arg_no_space'} = '';

$result_sections_list{'bracketed_arg_no_space'} = '';

$result_sectioning_root{'bracketed_arg_no_space'} = '';

$result_headings_list{'bracketed_arg_no_space'} = '';

$result_indices_sort_strings{'bracketed_arg_no_space'} = 'fn:
 e gh
';


$result_converted{'info'}->{'bracketed_arg_no_space'} = 'This is , produced from .

 -- a bc d: e gh mll restand more

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'bracketed_arg_no_space'} = '* W |document without nodes
 warning: document without nodes

';


$result_converted{'html'}->{'bracketed_arg_no_space'} = '<!DOCTYPE html>
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
strong.def-name {font-family: monospace; font-weight: bold; font-size: larger}
</style>


</head>

<body lang="">
<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-e-gh"><span class="category-def">a bc d: </span><span><strong class="def-name">e gh</strong> <var class="def-var-arguments">mll restand more</var><a class="copiable-link" href="#index-e-gh"> &para;</a></span></dt>
</dl>



</body>
</html>
';

$result_converted_errors{'html'}->{'bracketed_arg_no_space'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';


$result_converted{'xml'}->{'bracketed_arg_no_space'} = '<deffn spaces=" " endspaces=" "><definitionterm><indexterm index="fn" number="1"><defbracketed bracketed="on">e g</defbracketed>h</indexterm><defcategory><defbracketed bracketed="on">a b</defbracketed><defbracketed bracketed="on">c d</defbracketed></defcategory> <deffunction><defbracketed bracketed="on">e g</defbracketed>h</deffunction> <defparam>m</defparam><defparam bracketed="on" trailingspaces=" ">ll</defparam> <defparam bracketed="on">rest</defparam><defparam bracketed="on">and more</defparam></definitionterm>
</deffn>
';

1;
