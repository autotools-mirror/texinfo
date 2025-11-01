use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'include_at_end_line'} = '*document_root C1
 *before_node_section C3
  *@include C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |text_arg:{inc_file.texi}
   *line_arg C2
    {inc_file.texi}
    *@\\n
  {empty_line:\\n}
  *paragraph C1
   {After.}
';


$result_texis{'include_at_end_line'} = '@include inc_file.texi@

After.';


$result_texts{'include_at_end_line'} = '
After.';

$result_errors{'include_at_end_line'} = '* W l1|@ should not occur at end of argument to line command
 warning: @ should not occur at end of argument to line command

* E l1|bad argument to @include: inc_file.texi@
 bad argument to @include: inc_file.texi@

';

$result_nodes_list{'include_at_end_line'} = '';

$result_sections_list{'include_at_end_line'} = '';

$result_sectioning_root{'include_at_end_line'} = '';

$result_headings_list{'include_at_end_line'} = '';

1;
