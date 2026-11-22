use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'set_form_feed'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C4
   *normal_command@set C1
   |EXTRA
   |misc_args:A{gg|a\\a\\f\\\\}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:gg \\f a\\a\\f\\\\}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |EXTRA
   |misc_args:A{hh|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:hh\\f}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |EXTRA
   |misc_args:A{ll|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:ll \\f}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *normal_command@code C1 l5
    *brace_container C1
     {normal_text:a\\a\\f\\\\. . }
     >SOURCEMARKS
     >value_expansion<start;1>{a\\a\\f\\\\}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:gg}
     >value_expansion<end;1><p:7>
     >value_expansion<start;2><p:9>{}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:hh}
     >value_expansion<end;2><p:9>
     >value_expansion<start;3><p:11>{}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:ll}
     >value_expansion<end;3><p:11>
   {normal_text:.\\n}
';


$result_texis{'set_form_feed'} = '@set gg  a\\a\\f\\\\
@set hh
@set ll 

@code{a\\a\\f\\\\. . }.
';


$result_texts{'set_form_feed'} = '
a\\a\\f\\\\. . .
';

$result_errors{'set_form_feed'} = '';

$result_nodes_list{'set_form_feed'} = '';

$result_sections_list{'set_form_feed'} = '';

$result_sectioning_root{'set_form_feed'} = '';

$result_headings_list{'set_form_feed'} = '';


$result_converted{'xml'}->{'set_form_feed'} = '<set name="gg"> gg &formfeed; a\\a\\f\\\\</set>
<set name="hh"> hh&formfeed;</set>
<set name="ll"> ll &formfeed;</set>

<para><code>a\\a\\f\\\\. . </code>.
</para>';

1;
