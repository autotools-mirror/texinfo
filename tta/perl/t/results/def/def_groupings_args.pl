use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'def_groupings_args'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content
  *normal_command@deffn C2 l1
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
      *def_line_arg C3
       {normal_text:b}
       *normal_command@code C1 l1
        *brace_container C1
         {normal_text:aa}
       {normal_text:c}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l2
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C2 l4
   *def_line C1 l4
   |def_command:{deffn}
   |original_def_cmdname:{deffn}
    *block_line_arg C3
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C2
       {normal_text:a}
       *normal_command@samp C1 l4
        *brace_container C1
         {normal_text:g1}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l5
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C2 l7
   *def_line C1 l7
   |def_command:{deffn}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C2
       *normal_command@var C1 l7
        *brace_container C1
         {normal_text:var}
       {normal_text:c}
     {spaces: }
     *def_name C1
      *bracketed_arg C2 l7
       {normal_text:br }
       *normal_command@samp C1 l7
        *brace_container C1
         {normal_text:s}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:c}
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l7
        *brace_container C1
         {normal_text:arg}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *normal_command@end C1 l8
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'def_groupings_args'} = '@deffn a b@code{aa}c
@end deffn

@deffn a@samp{g1}
@end deffn

@deffn @var{var}c {br @samp{s}} c@code{arg})
@end deffn
';


$result_texts{'def_groupings_args'} = 'a: baac

ag1: 

varc: br s carg)
';

$result_errors{'def_groupings_args'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l4|missing name for @deffn
 warning: missing name for @deffn

* W l7|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'def_groupings_args'} = '';

$result_sections_list{'def_groupings_args'} = '';

$result_sectioning_root{'def_groupings_args'} = '';

$result_headings_list{'def_groupings_args'} = '';

$result_indices_sort_strings{'def_groupings_args'} = 'fn:
 baac
 br s
';


$result_converted{'plaintext'}->{'def_groupings_args'} = ' -- a: baac

 -- ag1:

 -- VARc: br s carg)
';

$result_converted_sort_strings{'plaintext'}->{'def_groupings_args'} = 'fn:
 baac
 br s
';

1;
