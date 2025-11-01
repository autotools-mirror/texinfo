use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'comment_first_on_enumerate_line'} = '*document_root C1
 *before_node_section C1
  *@enumerate C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg
    |INFO
    |comment_at_end:
     |*@c C1
     ||INFO
     ||spaces_before_argument:
      ||{spaces_before_argument: }
      |*line_arg C1
      ||INFO
      ||spaces_after_argument:
       ||{spaces_after_argument:\\n}
       |{rawline_text:comment on enumerate line}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {first\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {enumerate}
';


$result_texis{'comment_first_on_enumerate_line'} = '@enumerate @c comment on enumerate line
@item first
@end enumerate
';


$result_texts{'comment_first_on_enumerate_line'} = '1. first
';

$result_errors{'comment_first_on_enumerate_line'} = '';

$result_nodes_list{'comment_first_on_enumerate_line'} = '';

$result_sections_list{'comment_first_on_enumerate_line'} = '';

$result_sectioning_root{'comment_first_on_enumerate_line'} = '';

$result_headings_list{'comment_first_on_enumerate_line'} = '';


$result_converted{'plaintext'}->{'comment_first_on_enumerate_line'} = '  1. first
';


$result_converted{'html_text'}->{'comment_first_on_enumerate_line'} = '<ol class="enumerate">
<li> first
</li></ol>
';


$result_converted{'xml'}->{'comment_first_on_enumerate_line'} = '<enumerate first="1" spaces=" " endspaces=" "><!-- c comment on enumerate line -->
<listitem> <para>first
</para></listitem></enumerate>
';

1;
