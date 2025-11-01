use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'def_groupings_args'} = '*document_root C1
 *before_node_section C5
  *@deffn C2 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C3
      |{b}
      |*@code C1
       |*brace_container C1
        |{aa}
      |{c}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {a}
     {spaces: }
     *def_name C1
      *def_line_arg C3
       {b}
       *@code C1 l1
        *brace_container C1
         {aa}
       {c}
   *@end C1 l2
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
  {empty_line:\\n}
  *@deffn C2 l4
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l4
   |EXTRA
   |def_command:{deffn}
   |original_def_cmdname:{deffn}
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C2
       {a}
       *@samp C1 l4
        *brace_container C1
         {g1}
   *@end C1 l5
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
  {empty_line:\\n}
  *@deffn C2 l7
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l7
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*brace_arg C2
      |{br }
      |*@samp C1
       |*brace_container C1
        |{s}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C2
       *@var C1 l7
        *brace_container C1
         {var}
       {c}
     {spaces: }
     *def_name C1
      *bracketed_arg C2 l7
       {br }
       *@samp C1 l7
        *brace_container C1
         {s}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {c}
     *def_arg C1
      *def_line_arg C1
       *@code C1 l7
        *brace_container C1
         {arg}
     {delimiter:)}
   *@end C1 l8
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
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

1;
