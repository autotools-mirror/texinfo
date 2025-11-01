use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'code_in_def'} = '*document_root C1
 *before_node_section C1
  *@deftypefn C3 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l1
   |EXTRA
   |def_command:{deftypefn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{foo}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C11
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foo}
     {spaces: }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l1
        *brace_container C2
         {const std::vector<int>}
         *@&
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {bar}
     {delimiter:)}
   *def_item C1
    *paragraph C3
     {Documentation of }
     *@code C1 l2
      *brace_container C1
       {foo}
     {.\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypefn}
';


$result_texis{'code_in_def'} = '@deftypefn Function int foo (@code{const std::vector<int>@&} bar)
Documentation of @code{foo}.
@end deftypefn
';


$result_texts{'code_in_def'} = 'Function: int foo (const std::vector<int>& bar)
Documentation of foo.
';

$result_errors{'code_in_def'} = '* W l1|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'code_in_def'} = '';

$result_sections_list{'code_in_def'} = '';

$result_sectioning_root{'code_in_def'} = '';

$result_headings_list{'code_in_def'} = '';

$result_indices_sort_strings{'code_in_def'} = 'fn:
 foo
';


$result_converted{'plaintext'}->{'code_in_def'} = ' -- Function: int foo (const std::vector<int>& bar)
     Documentation of ‘foo’.
';

1;
