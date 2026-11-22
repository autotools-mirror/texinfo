use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'simple'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *normal_command@set C1
   |EXTRA
   |misc_args:A{a-_5b|the value @b{b}}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:a-_5b the value @b{b} }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {normal_text:the value }
   >SOURCEMARKS
   >value_expansion<start;1>{the value @b{b}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:a-_5b}
   *normal_command@b C1 l3
   >SOURCEMARKS
   >value_expansion<end;1>
    *brace_container C1
     {normal_text:b}
   {normal_text: After value.\\n}
';


$result_texis{'simple'} = '@set a-_5b the value @b{b} @c comment

the value @b{b} After value.
';


$result_texts{'simple'} = '
the value b After value.
';

$result_errors{'simple'} = '';

$result_nodes_list{'simple'} = '';

$result_sections_list{'simple'} = '';

$result_sectioning_root{'simple'} = '';

$result_headings_list{'simple'} = '';

1;
