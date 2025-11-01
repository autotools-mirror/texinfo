use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'punctuation_in_command_end_line'} = '*document_root C1
 *before_node_section C1
  *paragraph C27
   {Text. Email }
   *@email C2 l1
    *brace_arg C1
     {.}
    *brace_arg C1
     {.}
   {\\n}
   {dmn }
   *@dmn C1 l2
    *brace_container C1
     {1.}
   {\\n}
   {and text. indicateurl }
   *@indicateurl C1 l3
    *brace_container C1
     {.}
   {\\n}
   {and then kbd }
   *@kbd C1 l4
    *brace_container C1
     {.}
   {\\n}
   {and math }
   *@math C1 l5
    *brace_command_context C1
     {.}
   {\\n}
   {and cite }
   *@cite C1 l6
    *brace_container C1
     {.}
   {\\n}
   {and emph }
   *@emph C1 l7
    *brace_container C1
     {.}
   {\\n}
   {text. asis in code }
   *@code C1 l8
    *brace_container C1
     *@asis C1 l8
      *brace_container C1
       {.}
   {\\n}
   {text. a dot before a emph open .}
   *@emph C1 l9
    *brace_container C2
     {\\n}
     {and in emph.}
   {\\n}
';


$result_texis{'punctuation_in_command_end_line'} = 'Text. Email @email{.,.}
dmn @dmn{1.}
and text. indicateurl @indicateurl{.}
and then kbd @kbd{.}
and math @math{.}
and cite @cite{.}
and emph @emph{.}
text. asis in code @code{@asis{.}}
text. a dot before a emph open .@emph{
and in emph.}
';


$result_texts{'punctuation_in_command_end_line'} = 'Text. Email .
dmn 1.
and text. indicateurl .
and then kbd .
and math .
and cite .
and emph .
text. asis in code .
text. a dot before a emph open .
and in emph.
';

$result_errors{'punctuation_in_command_end_line'} = '';

$result_nodes_list{'punctuation_in_command_end_line'} = '';

$result_sections_list{'punctuation_in_command_end_line'} = '';

$result_sectioning_root{'punctuation_in_command_end_line'} = '';

$result_headings_list{'punctuation_in_command_end_line'} = '';


$result_converted{'plaintext'}->{'punctuation_in_command_end_line'} = 'Text.  Email .  <.> dmn 1. and text.  indicateurl ‘.’ and then kbd ‘.’
and math . and cite ‘.’ and emph _._  text.  asis in code ‘.’ text.  a
dot before a emph open ._  and in emph._
';

1;
