use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'node_too_much_args'} = '*document_root C2
 *before_node_section
 *@node C1 l1 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{first}
  *arguments_line C4
   *line_arg C1
    {first}
   *line_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   *line_arg
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   *line_arg C3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument:  }
   |EXTRA
   |manual_content:{dir}
    {(}
    {dir}
    {)}
';


$result_texis{'node_too_much_args'} = '@node first, , ,  (dir)';


$result_texts{'node_too_much_args'} = '';

$result_errors{'node_too_much_args'} = '* W l1|superfluous arguments for node
 warning: superfluous arguments for node

';

$result_nodes_list{'node_too_much_args'} = '1|first
 node_directions:
  up->  (dir)
';

$result_sections_list{'node_too_much_args'} = '';

$result_sectioning_root{'node_too_much_args'} = '';

$result_headings_list{'node_too_much_args'} = '';

1;
