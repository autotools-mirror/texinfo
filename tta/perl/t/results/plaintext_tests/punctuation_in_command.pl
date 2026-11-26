use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'punctuation_in_command'} = '*document_root C1
 *before_node_section C3
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content
  *paragraph C18
   {normal_text:Text. Email }
   *normal_command@email C2 l2
    *brace_arg C1
     {normal_text:a. b}
    *brace_arg C1
     {normal_text:a. b}
   {normal_text: dmn }
   *normal_command@dmn C1 l2
    *brace_container C1
     {normal_text:1. 2}
   {normal_text: and text. indicateurl }
   *normal_command@indicateurl C1 l2
    *brace_container C1
     {normal_text:i. u}
   {normal_text: and then kbd }
   *normal_command@kbd C1 l2
    *brace_container C1
     {normal_text:k. d}
   {normal_text: and math }
   *normal_command@math C1 l2
    *brace_arg C1
     {normal_text:m. a}
   {normal_text: and cite }
   *normal_command@cite C1 l2
    *brace_container C1
     {normal_text:c. e}
   {normal_text: and emph }
   *normal_command@emph C1 l2
    *brace_container C1
     {normal_text:e. h}
   {normal_text: text. \\n}
   {normal_text:asis in code }
   *normal_command@code C1 l3
    *brace_container C1
     *normal_command@asis C1 l3
      *brace_container C1
       {normal_text:a. c}
   {normal_text:\\n}
';


$result_texis{'punctuation_in_command'} = '
Text. Email @email{a. b,a. b} dmn @dmn{1. 2} and text. indicateurl @indicateurl{i. u} and then kbd @kbd{k. d} and math @math{m. a} and cite @cite{c. e} and emph @emph{e. h} text. 
asis in code @code{@asis{a. c}}
';


$result_texts{'punctuation_in_command'} = 'Text. Email a. b dmn 1. 2 and text. indicateurl i. u and then kbd k. d and math m. a and cite c. e and emph e. h text. 
asis in code a. c
';

$result_errors{'punctuation_in_command'} = '';

$result_nodes_list{'punctuation_in_command'} = '';

$result_sections_list{'punctuation_in_command'} = '';

$result_sectioning_root{'punctuation_in_command'} = '';

$result_headings_list{'punctuation_in_command'} = '';


$result_converted{'plaintext'}->{'punctuation_in_command'} = 'Text.  Email a.  b <a. b> dmn 1. 2 and text.  indicateurl ‘i. u’ and
then kbd ‘k. d’ and math m. a and cite ‘c. e’ and emph _e.  h_ text.
asis in code ‘a. c’
';

1;
