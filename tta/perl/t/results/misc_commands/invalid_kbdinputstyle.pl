use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'invalid_kbdinputstyle'} = '*document_root C1
 *before_node_section C1
  *paragraph C2
   {kbdinputstyle }
   *@kbdinputstyle C1 l1
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |global_command_number:{1}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {wrong arg on line following kbdinputstyle}
';


$result_texis{'invalid_kbdinputstyle'} = 'kbdinputstyle @kbdinputstyle wrong arg on line following kbdinputstyle
';


$result_texts{'invalid_kbdinputstyle'} = 'kbdinputstyle ';

$result_errors{'invalid_kbdinputstyle'} = '* W l1|@kbdinputstyle should only appear at the beginning of a line
 warning: @kbdinputstyle should only appear at the beginning of a line

* E l1|@kbdinputstyle arg must be `code\'/`example\'/`distinct\', not `wrong arg on line following kbdinputstyle\'
 @kbdinputstyle arg must be `code\'/`example\'/`distinct\', not `wrong arg on line following kbdinputstyle\'

';

$result_nodes_list{'invalid_kbdinputstyle'} = '';

$result_sections_list{'invalid_kbdinputstyle'} = '';

$result_sectioning_root{'invalid_kbdinputstyle'} = '';

$result_headings_list{'invalid_kbdinputstyle'} = '';

1;
