use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comment_on_set_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C5
   *normal_command@set C1
   |misc_args:A{x|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:x}
     *normal_command@c C1
      *line_arg C2
       {rawline_text:}
       {spaces_after_argument:\\n}
   *normal_command@set C1
   |misc_args:A{y|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:y }
     *normal_command@c C1
      *line_arg C2
       {rawline_text:}
       {spaces_after_argument:\\n}
   *normal_command@set C1
   |misc_args:A{z|g}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:z g}
     *normal_command@c C1
      *line_arg C2
       {rawline_text:}
       {spaces_after_argument:\\n}
   *normal_command@set C1
   |misc_args:A{t|a vv}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:t a vv }
     *normal_command@comment C1
      *line_arg C2
       {rawline_text:@ggg}
       {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:!!, !!, !g!, !a vv!\\n}
   >SOURCEMARKS
   >value_expansion<start;1><p:1>{}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:x}
   >value_expansion<end;1><p:1>
   >value_expansion<start;2><p:5>{}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:y}
   >value_expansion<end;2><p:5>
   >value_expansion<start;3><p:9>{g}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:z}
   >value_expansion<end;3><p:10>
   >value_expansion<start;4><p:14>{a vv}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:t}
   >value_expansion<end;4><p:18>
';


$result_texis{'comment_on_set_line'} = '@set x@c
@set y @c
@set z g@c
@set t a vv @comment@ggg

!!, !!, !g!, !a vv!
';


$result_texts{'comment_on_set_line'} = '
!!, !!, !g!, !a vv!
';

$result_errors{'comment_on_set_line'} = '';

$result_nodes_list{'comment_on_set_line'} = '';

$result_sections_list{'comment_on_set_line'} = '';

$result_sectioning_root{'comment_on_set_line'} = '';

$result_headings_list{'comment_on_set_line'} = '';

1;
