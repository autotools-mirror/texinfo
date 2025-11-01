use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'end_of_line_protect_at_end'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *@deffn C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l2
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{deffn_name2}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     *def_category C1
      *def_line_arg C1
       {category2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {deffn_name2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arguments2}
';


$result_texis{'end_of_line_protect_at_end'} = '
@deffn category2 deffn_name2 arguments2 ';


$result_texts{'end_of_line_protect_at_end'} = '
category2: deffn_name2 arguments2
';

$result_errors{'end_of_line_protect_at_end'} = '* E l2|unexpected @
 unexpected @

* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l2|no matching `@end deffn\'
 no matching `@end deffn\'

';

$result_nodes_list{'end_of_line_protect_at_end'} = '';

$result_sections_list{'end_of_line_protect_at_end'} = '';

$result_sectioning_root{'end_of_line_protect_at_end'} = '';

$result_headings_list{'end_of_line_protect_at_end'} = '';

$result_indices_sort_strings{'end_of_line_protect_at_end'} = 'fn:
 deffn_name2
';


$result_converted{'xml'}->{'end_of_line_protect_at_end'} = '
<deffn spaces=" "><definitionterm><indexterm index="fn" number="1">deffn_name2</indexterm><defcategory>category2</defcategory> <deffunction>deffn_name2</deffunction> <defparam>arguments2</defparam> </definitionterm>
</deffn>
';

1;
