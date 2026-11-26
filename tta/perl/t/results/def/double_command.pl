use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'double_command'} = '*document_root C1
 *before_node_section C4
  *preamble
  *normal_command@deffn C3 l1
   *def_line C1 l1
   |def_command:{deffn}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C19
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:func}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:plot}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:b}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:c}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:...}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@deffnx C1 l1
       |def_command:{deffn}
       |index_entry:I{fn,1}
       |not_after_command:{1}
       |original_def_cmdname:{deffnx}
        *line_arg C21
         {spaces_before_argument: }
         *def_category C1
          *def_line_arg C1
           {normal_text:func}
         {spaces: }
         *def_name C1
          *def_line_arg C1
           {normal_text:plot2}
         {spaces: }
         {delimiter:(}
         *def_arg C1
          *def_line_arg C1
           {normal_text:a}
         {delimiter:,}
         {spaces: }
         *def_arg C1
          *def_line_arg C1
           {normal_text:b}
         {delimiter:,}
         {spaces: }
         *def_arg C1
          *def_line_arg C1
           {normal_text:c}
         {delimiter:,}
         {spaces: }
         *def_arg C1
          *def_line_arg C1
           {normal_text:...}
         {delimiter:,}
         {spaces: }
         *def_arg C1
          *def_line_arg C1
           {normal_text:d}
         {delimiter:)}
         {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:aaa\\n}
   *normal_command@end C1 l3
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l5
   *def_line C1 l5
   |def_command:{deffn}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deffn}
    *block_line_arg C8
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:func}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:aaaa}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:args}
     {spaces:  }
     *def_arg C1
      *def_line_arg C1
       *normal_command@defvr C1 l5
        *def_line C1 l5
        |def_command:{defvr}
        |index_entry:I{vr,1}
        |original_def_cmdname:{defvr}
         *block_line_arg C5
          {spaces_before_argument: }
          *def_category C1
           *def_line_arg C1
            {normal_text:c--ategory}
          {spaces: }
          *def_name C1
           *def_line_arg C1
            {normal_text:d--efvr_name}
          {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:bbb\\n}
   *normal_command@end C1 l7
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'double_command'} = '@deffn func plot (a, b, c, ...) @deffnx func plot2 (a, b, c, ..., d)
aaa
@end deffn

@deffn func aaaa args  @defvr c--ategory d--efvr_name
bbb
@end deffn
';


$result_texts{'double_command'} = 'func: plot (a, b, c, ...) func: plot2 (a, b, c, ..., d)

aaa

func: aaaa args  c--ategory: d--efvr_name

bbb
';

$result_errors{'double_command'} = '* W l1|@deffnx should only appear at the beginning of a line
 warning: @deffnx should only appear at the beginning of a line

* W l1|@deffnx should not appear on @deffn line
 warning: @deffnx should not appear on @deffn line

* E l1|must be after `@deffn\' to use `@deffnx\'
 must be after `@deffn\' to use `@deffnx\'

* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l5|@defvr should only appear at the beginning of a line
 warning: @defvr should only appear at the beginning of a line

* W l5|@defvr should not appear on @deffn line
 warning: @defvr should not appear on @deffn line

* W l5|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* E l5|no matching `@end defvr\'
 no matching `@end defvr\'

* W l5|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'double_command'} = '';

$result_sections_list{'double_command'} = '';

$result_sectioning_root{'double_command'} = '';

$result_headings_list{'double_command'} = '';

$result_indices_sort_strings{'double_command'} = 'fn:
 aaaa
 plot
 plot2
vr:
 d--efvr_name
';

1;
