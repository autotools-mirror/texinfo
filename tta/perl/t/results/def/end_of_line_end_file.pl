use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'end_of_line_end_file'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@deffn C1 l1
   *def_line C1 l1
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:category}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:deffn_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:arguments}
     {spaces_after_argument: }
     >SOURCEMARKS
     >defline_continuation<1><p:1>
';


$result_texis{'end_of_line_end_file'} = '@deffn category deffn_name arguments ';


$result_texts{'end_of_line_end_file'} = 'category: deffn_name arguments
';

$result_errors{'end_of_line_end_file'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l1|no matching `@end deffn\'
 no matching `@end deffn\'

';

$result_nodes_list{'end_of_line_end_file'} = '';

$result_sections_list{'end_of_line_end_file'} = '';

$result_sectioning_root{'end_of_line_end_file'} = '';

$result_headings_list{'end_of_line_end_file'} = '';

$result_indices_sort_strings{'end_of_line_end_file'} = 'fn:
 deffn_name
';


$result_converted{'xml'}->{'end_of_line_end_file'} = '<deffn><definitionterm><indexterm index="fn" number="1">deffn_name</indexterm> <defcategory>category</defcategory> <deffunction>deffn_name</deffunction> <defparam>arguments</defparam> </definitionterm>
</deffn>
';

1;
