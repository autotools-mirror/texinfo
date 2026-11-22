use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'section_on_def_line'} = '*document_root C2
 *before_node_section C2
  *preamble_before_content
  *normal_command@deffn C1 l1
   *def_line C1 l1
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:b}
     {spaces_after_argument: }
 *normal_command@section C4 l1 {s}
 |identifier:{s}
 |is_target:{1}
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:s}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Something\\n}
  {empty_line:\\n}
';


$result_texis{'section_on_def_line'} = '@deffn a b @section s

Something

';


$result_texts{'section_on_def_line'} = 'a: b
1 s
===

Something

';

$result_errors{'section_on_def_line'} = '* W l1|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l1|@section should not appear on @deffn line
 warning: @section should not appear on @deffn line

* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l1|@section seen before @end deffn
 @section seen before @end deffn

* E l5|unmatched `@end deffn\'
 unmatched `@end deffn\'

';

$result_nodes_list{'section_on_def_line'} = '';

$result_sections_list{'section_on_def_line'} = '1|s
';

$result_sectioning_root{'section_on_def_line'} = 'level: 1
list:
 1|s
';

$result_headings_list{'section_on_def_line'} = '';

$result_indices_sort_strings{'section_on_def_line'} = 'fn:
 b
';


$result_converted{'plaintext'}->{'section_on_def_line'} = ' -- a: b

1 s
===

Something

';

$result_converted_sort_strings{'plaintext'}->{'section_on_def_line'} = 'fn:
 b
';


$result_converted{'xml'}->{'section_on_def_line'} = '<deffn><definitionterm><indexterm index="fn" number="1">b</indexterm> <defcategory>a</defcategory> <deffunction>b</deffunction> </definitionterm>
</deffn>
<section><sectiontitle> s</sectiontitle>

<para>Something
</para>
</section>
';

1;
