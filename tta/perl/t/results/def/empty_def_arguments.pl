use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_def_arguments'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@deffn C10 l1
   *def_line C1 l1
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:fset}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *normal_command@var C1 l1
        *brace_container C1
         {normal_text:i}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:g}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l2
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C3
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *normal_command@b C1 l2
        *brace_container C3
         {normal_text:id }
         *normal_command@samp C1 l2
          *brace_container C1
           {normal_text:i}
         {normal_text: ule}
     {spaces_after_argument:    \\n}
   *normal_command@deffnx C1 l3
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C1
     {spaces_before_argument: \\n}
   *normal_command@deffnx C1 l4
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C3
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:aaa}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l5
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg l5
     {spaces: }
     *def_name C1
      *bracketed_arg l5
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l6
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C2
     *def_category C1
      *bracketed_arg l6
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l7
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C4
     *def_category C1
      *bracketed_arg C1 l7
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l7
       {spaces_before_argument: }
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l8
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C2
     *def_category C1
      *bracketed_arg C1 l8
       {normal_text:truc}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l9
   |def_command:{deffn}
   |original_def_cmdname:{deffnx}
    *line_arg C4
     *def_category C1
      *bracketed_arg l9
     {spaces: }
     *def_name C1
      *bracketed_arg l9
     {spaces_after_argument:\\n}
   *normal_command@end C1 l10
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_def_arguments'} = '@deffn fset @var{i} a g
@deffnx @b{id @samp{i} ule}    
@deffnx 
@deffnx aaa
@deffnx {} {}
@deffnx{}
@deffnx{truc} { }
@deffnx{truc}
@deffnx{} {}
@end deffn
';


$result_texts{'empty_def_arguments'} = 'fset: i a g
id i ule: 
aaa: 
: 
: 
truc: 
truc: 
: 
';

$result_errors{'empty_def_arguments'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l2|missing name for @deffnx
 warning: missing name for @deffnx

* W l3|missing category for @deffnx
 warning: missing category for @deffnx

* W l4|missing name for @deffnx
 warning: missing name for @deffnx

* W l5|missing name for @deffnx
 warning: missing name for @deffnx

* W l6|missing name for @deffnx
 warning: missing name for @deffnx

* W l7|missing name for @deffnx
 warning: missing name for @deffnx

* W l8|missing name for @deffnx
 warning: missing name for @deffnx

* W l9|missing name for @deffnx
 warning: missing name for @deffnx

';

$result_nodes_list{'empty_def_arguments'} = '';

$result_sections_list{'empty_def_arguments'} = '';

$result_sectioning_root{'empty_def_arguments'} = '';

$result_headings_list{'empty_def_arguments'} = '';

$result_indices_sort_strings{'empty_def_arguments'} = 'fn:
 i
';

1;
