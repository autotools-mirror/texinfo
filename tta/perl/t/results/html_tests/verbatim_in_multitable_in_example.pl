use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'verbatim_in_multitable_in_example'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@example C3 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@multitable C3 l2
   |max_columns:{2}
    *arguments_line C1
     *block_line_arg C2
      {spaces_before_argument: }
      *normal_command@columnfractions C1 l2
      |misc_args:A{0.5|0.5}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:0.5 0.5}
        {spaces_after_argument:\\n}
    *multitable_body C2
     *row C2
     |row_number:{1}
      *normal_command@item C1 l3
      |cell_number:{1}
       *preformatted C2
        {ignorable_spaces_after_command: }
        {normal_text:in item\\n}
      *normal_command@tab C1 l4
      |cell_number:{2}
       *preformatted C2
        {ignorable_spaces_after_command: }
        {normal_text:in tab\\n}
     *row C2
     |row_number:{2}
      *normal_command@item C2 l5
      |cell_number:{1}
       *preformatted C1
        {ignorable_spaces_after_command:\\n}
       *normal_command@verbatim C3 l6
        *arguments_line C1
         *block_line_arg C1
          {spaces_before_argument:\\n}
        {raw:in first column, verbatim\\n}
        *normal_command@end C1 l8
        |text_arg:{verbatim}
         *line_arg C3
          {spaces_before_argument: }
          {normal_text:verbatim}
          {spaces_after_argument:\\n}
      *normal_command@tab C2 l9
      |cell_number:{2}
       *preformatted C1
        {ignorable_spaces_after_command:\\n}
       *normal_command@verbatiminclude C1 l10
       |input_encoding_name:{utf-8}
       |text_arg:{inc_file.texi}
        *line_arg C3
         {spaces_before_argument: }
         {normal_text:inc_file.texi}
         {spaces_after_argument:\\n}
    *normal_command@end C1 l11
    |text_arg:{multitable}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:multitable}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l12
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
';


$result_texis{'verbatim_in_multitable_in_example'} = '@example
@multitable @columnfractions 0.5 0.5
@item in item
@tab in tab
@item
@verbatim
in first column, verbatim
@end verbatim
@tab
@verbatiminclude inc_file.texi
@end multitable
@end example
';


$result_texts{'verbatim_in_multitable_in_example'} = 'in item
in tab
in first column, verbatim
';

$result_errors{'verbatim_in_multitable_in_example'} = '';

$result_nodes_list{'verbatim_in_multitable_in_example'} = '';

$result_sections_list{'verbatim_in_multitable_in_example'} = '';

$result_sectioning_root{'verbatim_in_multitable_in_example'} = '';

$result_headings_list{'verbatim_in_multitable_in_example'} = '';


$result_converted{'html'}->{'verbatim_in_multitable_in_example'} = '<!DOCTYPE html>
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

<body>
<div class="example">
<table class="multitable">
<tbody><tr><td width="50%"><pre class="example-preformatted">in item</pre></td><td width="50%"><pre class="example-preformatted">in tab</pre></td></tr>
<tr><td width="50%"><pre class="verbatim">in first column, verbatim
</pre></td><td width="50%"><pre class="verbatim">In included file.
</pre></td></tr>
</tbody>
</table>
</div>



</body>
</html>
';

$result_converted_errors{'html'}->{'verbatim_in_multitable_in_example'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
