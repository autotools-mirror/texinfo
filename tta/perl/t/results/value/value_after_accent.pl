use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'value_after_accent'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C1
   *@set C1
   |EXTRA
   |misc_args:A{a_letter|a}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:a_letter a}
     {spaces_after_argument:\\n}
  *paragraph C3
   *@ringaccent C2 l2
   >SOURCEMARKS
   >value_expansion<end;1>
    {spaces_after_cmd_before_arg: }
    >SOURCEMARKS
    >value_expansion<start;1><p:1>{a}
     >*@value C1
      >*brace_container C1
       >{normal_text:a_letter}
    *following_arg C1
     {normal_text:a}
   {normal_text:\\n}
   *@~ C2 l3
   >SOURCEMARKS
   >value_expansion<end;2>
    {spaces_after_cmd_before_arg:}
    >SOURCEMARKS
    >value_expansion<start;2>{a}
     >*@value C1
      >*brace_container C1
       >{normal_text:a_letter}
    *following_arg C1
     {normal_text:a}
';


$result_texis{'value_after_accent'} = '@set a_letter a
@ringaccent a
@~a';


$result_texts{'value_after_accent'} = 'a*
a~';

$result_errors{'value_after_accent'} = '';

$result_nodes_list{'value_after_accent'} = '';

$result_sections_list{'value_after_accent'} = '';

$result_sectioning_root{'value_after_accent'} = '';

$result_headings_list{'value_after_accent'} = '';

1;
