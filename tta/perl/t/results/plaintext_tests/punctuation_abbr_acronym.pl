use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'punctuation_abbr_acronym'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C16
   *normal_command@abbr C1 l1
    *brace_arg C1
     {normal_text:AAA}
   {normal_text:. }
   *normal_command@acronym C1 l1
    *brace_arg C1
     {normal_text:BBB}
   {normal_text:. }
   *normal_command@abbr C1 l1
    *brace_arg C1
     {normal_text:aaa}
   {normal_text:. }
   *normal_command@acronym C1 l1
    *brace_arg C1
     {normal_text:bbb}
   {normal_text:. Next.\\n}
   *normal_command@abbr C2 l2
    *brace_arg C1
     {normal_text:AAA}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:expL}
   {normal_text:. }
   *normal_command@acronym C2 l2
    *brace_arg C1
     {normal_text:BBB}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:explA}
   {normal_text:. }
   *normal_command@abbr C2 l2
    *brace_arg C1
     {normal_text:aaa}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:expl}
   {normal_text:. \\n}
   *normal_command@acronym C2 l3
    *brace_arg C1
     {normal_text:bbb}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:expla}
   {normal_text:. Last.\\n}
';


$result_texis{'punctuation_abbr_acronym'} = '@abbr{AAA}. @acronym{BBB}. @abbr{aaa}. @acronym{bbb}. Next.
@abbr{AAA, expL}. @acronym{BBB, explA}. @abbr{aaa, expl}. 
@acronym{bbb, expla}. Last.
';


$result_texts{'punctuation_abbr_acronym'} = 'AAA. BBB. aaa. bbb. Next.
AAA (expL). BBB (explA). aaa (expl). 
bbb (expla). Last.
';

$result_errors{'punctuation_abbr_acronym'} = '';

$result_nodes_list{'punctuation_abbr_acronym'} = '';

$result_sections_list{'punctuation_abbr_acronym'} = '';

$result_sectioning_root{'punctuation_abbr_acronym'} = '';

$result_headings_list{'punctuation_abbr_acronym'} = '';


$result_converted{'plaintext'}->{'punctuation_abbr_acronym'} = 'AAA.  BBB.  aaa.  bbb.  Next.  AAA (expL). BBB (explA). aaa (expl).  bbb
(expla).  Last.
';

1;
