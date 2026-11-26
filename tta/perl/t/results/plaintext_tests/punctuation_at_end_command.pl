use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'punctuation_at_end_command'} = '*document_root C1
 *before_node_section C3
  *before_beginning C1
   {empty_line:\\n}
  *preamble
  *paragraph C21
   {normal_text:Text. Email }
   *normal_command@email C2 l2
    *brace_arg C1
     {normal_text:.}
    *brace_arg C1
     {normal_text:.}
   {normal_text: dmn }
   *normal_command@dmn C1 l2
    *brace_container C1
     {normal_text:1.}
   {normal_text: and text. indicateurl }
   *normal_command@indicateurl C1 l2
    *brace_container C1
     {normal_text:.}
   {normal_text: and \\n}
   {normal_text:then kbd }
   *normal_command@kbd C1 l3
    *brace_container C1
     {normal_text:.}
   {normal_text: and math }
   *normal_command@math C1 l3
    *brace_arg C1
     {normal_text:.}
   {normal_text: and cite }
   *normal_command@cite C1 l3
    *brace_container C1
     {normal_text:.}
   {normal_text: and emph }
   *normal_command@emph C1 l3
    *brace_container C1
     {normal_text:.}
   {normal_text: text. \\n}
   {normal_text:asis in code }
   *normal_command@code C1 l4
    *brace_container C1
     *normal_command@asis C1 l4
      *brace_container C1
       {normal_text:.}
   {normal_text: text. a dot before a emph open .}
   *normal_command@emph C1 l4
    *brace_container C1
     {normal_text: and in emph.}
   {normal_text:\\n}
';


$result_texis{'punctuation_at_end_command'} = '
Text. Email @email{.,.} dmn @dmn{1.} and text. indicateurl @indicateurl{.} and 
then kbd @kbd{.} and math @math{.} and cite @cite{.} and emph @emph{.} text. 
asis in code @code{@asis{.}} text. a dot before a emph open .@emph{ and in emph.}
';


$result_texts{'punctuation_at_end_command'} = 'Text. Email . dmn 1. and text. indicateurl . and 
then kbd . and math . and cite . and emph . text. 
asis in code . text. a dot before a emph open . and in emph.
';

$result_errors{'punctuation_at_end_command'} = '';

$result_nodes_list{'punctuation_at_end_command'} = '';

$result_sections_list{'punctuation_at_end_command'} = '';

$result_sectioning_root{'punctuation_at_end_command'} = '';

$result_headings_list{'punctuation_at_end_command'} = '';


$result_converted{'plaintext'}->{'punctuation_at_end_command'} = 'Text.  Email .  <.> dmn 1. and text.  indicateurl ‘.’ and then kbd ‘.’
and math . and cite ‘.’ and emph _._  text.  asis in code ‘.’ text.  a
dot before a emph open ._  and in emph._
';

1;
