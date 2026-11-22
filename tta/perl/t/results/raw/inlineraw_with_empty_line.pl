use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inlineraw_with_empty_line'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C5
   {normal_text:A }
   *normal_command@inlineraw C2 l1
   |EXTRA
   |expand_index:{1}
   |format:{plaintext}
    *brace_arg C1
     {normal_text:plaintext}
    *brace_arg C5
     {spaces_before_argument: }
     {normal_text:plaintext ``\\n}
     {empty_line:\\n}
     *normal_command@lbracechar C1 l3
      *brace_container
     {normal_text: }
   {normal_text: a.  Now html\\n}
   *normal_command@inlineraw C2 l4
   |EXTRA
   |expand_index:{1}
   |format:{html}
    *brace_arg C1
     {normal_text:html}
    *brace_arg C6
     {spaces_before_argument: }
     {normal_text:in \\n}
     {empty_line:\\n}
     {normal_text:<i>}
     *normal_command@acronym C1 l6
      *brace_arg C1
       {normal_text:HTML}
     {normal_text:</i>}
   {normal_text:.\\n}
';


$result_texis{'inlineraw_with_empty_line'} = 'A @inlineraw{plaintext, plaintext ``

@lbracechar{} } a.  Now html
@inlineraw{html, in 

<i>@acronym{HTML}</i>}.
';


$result_texts{'inlineraw_with_empty_line'} = 'A plaintext ``

{  a.  Now html
in 

<i>HTML</i>.
';

$result_errors{'inlineraw_with_empty_line'} = '';

$result_nodes_list{'inlineraw_with_empty_line'} = '';

$result_sections_list{'inlineraw_with_empty_line'} = '';

$result_sectioning_root{'inlineraw_with_empty_line'} = '';

$result_headings_list{'inlineraw_with_empty_line'} = '';

1;
