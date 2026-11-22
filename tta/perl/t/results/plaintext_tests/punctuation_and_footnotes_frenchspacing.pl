use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'punctuation_and_footnotes_frenchspacing'} = '*document_root C1
 *before_node_section C8
  *preamble_before_content C2
   *@frenchspacing C1 l1
   |EXTRA
   |global_command_number:{1}
   |misc_args:A{on}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:on}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C8
   {normal_text:Text.}
   *@footnote C1 l3
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C1
     *paragraph C1
      {normal_text:after period}
   {normal_text: Sentence \\n}
   {normal_text:end.}
   *@footnote C1 l4
   |EXTRA
   |global_command_number:{2}
    *brace_command_context C1
     *paragraph C1
      {normal_text:after period double}
   {normal_text:  S2.}
   *@footnote C1 l4
   |EXTRA
   |global_command_number:{3}
    *brace_command_context C1
     *paragraph C1
      {normal_text:after period triple}
   {normal_text:   S3.\\n}
  {empty_line:\\n}
  *paragraph C8
   {normal_text:No PERIOD.}
   *@footnote C1 l6
   |EXTRA
   |global_command_number:{4}
    *brace_command_context C1
     *paragraph C1
      {normal_text:no period}
   {normal_text: worD.}
   *@footnote C1 l6
   |EXTRA
   |global_command_number:{5}
    *brace_command_context C1
     *paragraph C1
      {normal_text:no period double}
   {normal_text:  w2 \\n}
   {normal_text:wW.}
   *@footnote C1 l7
   |EXTRA
   |global_command_number:{6}
    *brace_command_context C1
     *paragraph C1
      {normal_text:no period triple}
   {normal_text:   S3.\\n}
  {empty_line:\\n}
  *paragraph C12
   {normal_text:Force PERIOD}
   *@.
   *@footnote C1 l9
   |EXTRA
   |global_command_number:{7}
    *brace_command_context C1
     *paragraph C1
      {normal_text:after forced period}
   {normal_text: Sentence \\n}
   {normal_text:W}
   *@.
   *@footnote C1 l10
   |EXTRA
   |global_command_number:{8}
    *brace_command_context C1
     *paragraph C1
      {normal_text:after forced period double}
   {normal_text:  S2 \\n}
   {normal_text:W}
   *@.
   *@footnote C1 l11
   |EXTRA
   |global_command_number:{9}
    *brace_command_context C1
     *paragraph C1
      {normal_text:after forced period triple}
   {normal_text:   S3.\\n}
  {empty_line:\\n}
  *paragraph C12
   {normal_text:Force no period.}
   *@:
   *@footnote C1 l13
   |EXTRA
   |global_command_number:{10}
    *brace_command_context C1
     *paragraph C1
      {normal_text:after forced no period}
   {normal_text: Sentence \\n}
   {normal_text:w.}
   *@:
   *@footnote C1 l14
   |EXTRA
   |global_command_number:{11}
    *brace_command_context C1
     *paragraph C1
      {normal_text:after forced no period double}
   {normal_text:  S2 \\n}
   {normal_text:w.}
   *@:
   *@footnote C1 l15
   |EXTRA
   |global_command_number:{12}
    *brace_command_context C1
     *paragraph C1
      {normal_text:after forced no period triple}
   {normal_text:   S3.\\n}
';


$result_texis{'punctuation_and_footnotes_frenchspacing'} = '@frenchspacing on

Text.@footnote{after period} Sentence 
end.@footnote{after period double}  S2.@footnote{after period triple}   S3.

No PERIOD.@footnote{no period} worD.@footnote{no period double}  w2 
wW.@footnote{no period triple}   S3.

Force PERIOD@.@footnote{after forced period} Sentence 
W@.@footnote{after forced period double}  S2 
W@.@footnote{after forced period triple}   S3.

Force no period.@:@footnote{after forced no period} Sentence 
w.@:@footnote{after forced no period double}  S2 
w.@:@footnote{after forced no period triple}   S3.
';


$result_texts{'punctuation_and_footnotes_frenchspacing'} = '
Text. Sentence 
end.  S2.   S3.

No PERIOD. worD.  w2 
wW.   S3.

Force PERIOD. Sentence 
W.  S2 
W.   S3.

Force no period. Sentence 
w.  S2 
w.   S3.
';

$result_errors{'punctuation_and_footnotes_frenchspacing'} = '';

$result_nodes_list{'punctuation_and_footnotes_frenchspacing'} = '';

$result_sections_list{'punctuation_and_footnotes_frenchspacing'} = '';

$result_sectioning_root{'punctuation_and_footnotes_frenchspacing'} = '';

$result_headings_list{'punctuation_and_footnotes_frenchspacing'} = '';


$result_converted{'plaintext'}->{'punctuation_and_footnotes_frenchspacing'} = 'Text.(1) Sentence end.(2) S2.(3) S3.

   No PERIOD.(4) worD.(5) w2 wW.(6) S3.

   Force PERIOD.(7) Sentence W.(8) S2 W.(9) S3.

   Force no period.(10) Sentence w.(11) S2 w.(12) S3.

   ---------- Footnotes ----------

   (1) after period

   (2) after period double

   (3) after period triple

   (4) no period

   (5) no period double

   (6) no period triple

   (7) after forced period

   (8) after forced period double

   (9) after forced period triple

   (10) after forced no period

   (11) after forced no period double

   (12) after forced no period triple

';

1;
