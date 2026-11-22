use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'fractions_rounding'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *@multitable C3 l1
  |EXTRA
  |max_columns:{4}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l1
     |EXTRA
     |misc_args:A{.19|.30|.29|.22}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:.19 .30 .29 .22}
       {spaces_after_argument:\\n}
   *multitable_body C2
    *row C4
    |EXTRA
    |row_number:{1}
     *@item C2 l2
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:In contents            }
     *@tab C2 l2
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:In contents                  }
     *@tab C2 l2
     |EXTRA
     |cell_number:{3}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:In contents           }
     *@tab C2 l2
     |EXTRA
     |cell_number:{4}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:Not in contents\\n}
    *row C4
    |EXTRA
    |row_number:{2}
     *@item C2 l3
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C2
       *@code C1 l3
        *brace_container C2
         *@@
         {normal_text:chapter}
       {normal_text:       }
     *@tab C2 l3
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C2
       *@code C1 l3
        *brace_container C2
         *@@
         {normal_text:unnumbered}
       {normal_text:          }
     *@tab C2 l3
     |EXTRA
     |cell_number:{3}
      {ignorable_spaces_after_command: }
      *paragraph C2
       *@code C1 l3
        *brace_container C2
         *@@
         {normal_text:appendix}
       {normal_text: }
     *@tab C2 l3
     |EXTRA
     |cell_number:{4}
      {ignorable_spaces_after_command: }
      *paragraph C2
       *@code C1 l3
        *brace_container C2
         *@@
         {normal_text:chapheading}
       {normal_text:\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
';


$result_texis{'fractions_rounding'} = '@multitable @columnfractions .19 .30 .29 .22
@item In contents            @tab In contents                  @tab In contents           @tab Not in contents
@item @code{@@chapter}       @tab @code{@@unnumbered}          @tab @code{@@appendix} @tab @code{@@chapheading}
@end multitable
';


$result_texts{'fractions_rounding'} = 'In contents            In contents                  In contents           Not in contents
@chapter       @unnumbered          @appendix @chapheading
';

$result_errors{'fractions_rounding'} = '';

$result_nodes_list{'fractions_rounding'} = '';

$result_sections_list{'fractions_rounding'} = '';

$result_sectioning_root{'fractions_rounding'} = '';

$result_headings_list{'fractions_rounding'} = '';


$result_converted{'html'}->{'fractions_rounding'} = '<!DOCTYPE html>
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
<table class="multitable">
<tbody><tr><td width="19%">In contents</td><td width="30%">In contents</td><td width="29%">In contents</td><td width="22%">Not in contents</td></tr>
<tr><td width="19%"><code class="code">@chapter</code></td><td width="30%"><code class="code">@unnumbered</code></td><td width="29%"><code class="code">@appendix</code></td><td width="22%"><code class="code">@chapheading</code></td></tr>
</tbody>
</table>



</body>
</html>
';

$result_converted_errors{'html'}->{'fractions_rounding'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
