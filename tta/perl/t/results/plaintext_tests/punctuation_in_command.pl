use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'punctuation_in_command'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *paragraph C18
   {Text. Email }
   *@email C2 l2
    *brace_arg C1
     {a. b}
    *brace_arg C1
     {a. b}
   { dmn }
   *@dmn C1 l2
    *brace_container C1
     {1. 2}
   { and text. indicateurl }
   *@indicateurl C1 l2
    *brace_container C1
     {i. u}
   { and then kbd }
   *@kbd C1 l2
    *brace_container C1
     {k. d}
   { and math }
   *@math C1 l2
    *brace_command_context C1
     {m. a}
   { and cite }
   *@cite C1 l2
    *brace_container C1
     {c. e}
   { and emph }
   *@emph C1 l2
    *brace_container C1
     {e. h}
   { text. \\n}
   {asis in code }
   *@code C1 l3
    *brace_container C1
     *@asis C1 l3
      *brace_container C1
       {a. c}
   {\\n}
';


$result_texis{'punctuation_in_command'} = '
Text. Email @email{a. b,a. b} dmn @dmn{1. 2} and text. indicateurl @indicateurl{i. u} and then kbd @kbd{k. d} and math @math{m. a} and cite @cite{c. e} and emph @emph{e. h} text. 
asis in code @code{@asis{a. c}}
';


$result_texts{'punctuation_in_command'} = '
Text. Email a. b dmn 1. 2 and text. indicateurl i. u and then kbd k. d and math m. a and cite c. e and emph e. h text. 
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
