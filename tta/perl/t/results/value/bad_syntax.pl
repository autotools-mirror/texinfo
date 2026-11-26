use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bad_syntax'} = '*document_root C1
 *before_node_section C6
  *before_beginning C1
   {empty_line:\\n}
  *preamble C11
   *normal_command@set C1
    *line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@set C1
    *line_arg C1
     {spaces_before_argument: \\n}
   *normal_command@set C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:?}
     {spaces_after_argument:\\n}
   *normal_command@set C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text::-/ hey!}
     {spaces_after_argument:\\n}
   *normal_command@set C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:a@b}
     {spaces_after_argument:\\n}
   *normal_command@set C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text::-" bad}
     {spaces_after_argument:\\n}
   *normal_command@set C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:} no}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@clear C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:aaa ggg}
     {spaces_after_argument:\\n}
   *normal_command@clear C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:and{other}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:gurgl\\n}
  {empty_line:\\n}
  *normal_command@value C1
   *brace_container C1
    {normal_text:unknown}
  {normal_text:\\n}
';


$result_texis{'bad_syntax'} = '
@set
@set 
@set ?
@set :-/ hey!
@set a@b
@set :-" bad
@set } no

@clear aaa ggg
@clear and{other

gurgl

@value{unknown}
';


$result_texts{'bad_syntax'} = '

gurgl

unknown
';

$result_errors{'bad_syntax'} = '* E l2|@set requires a name
 @set requires a name

* E l3|@set requires a name
 @set requires a name

* E l4|bad name for @set
 bad name for @set

* E l5|bad name for @set
 bad name for @set

* E l6|bad name for @set
 bad name for @set

* E l7|bad name for @set
 bad name for @set

* E l8|bad name for @set
 bad name for @set

* E l10|bad name for @clear
 bad name for @clear

* E l11|bad name for @clear
 bad name for @clear

* E l13|bad syntax for @value
 bad syntax for @value

* E l13|misplaced {
 misplaced {

* W l15|undefined flag: unknown
 warning: undefined flag: unknown

';

$result_nodes_list{'bad_syntax'} = '';

$result_sections_list{'bad_syntax'} = '';

$result_sectioning_root{'bad_syntax'} = '';

$result_headings_list{'bad_syntax'} = '';

1;
