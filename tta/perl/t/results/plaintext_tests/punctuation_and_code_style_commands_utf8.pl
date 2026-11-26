use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'punctuation_and_code_style_commands_utf8'} = '*document_root C1
 *before_node_section C2
  *preamble C1
   *normal_command@documentencoding C1 l1
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:utf-8}
     {spaces_after_argument:\\n}
  *paragraph C18
   *normal_command@command C1 l2
    *brace_container C1
     {normal_text:aaa}
   {normal_text:. }
   *normal_command@code C1 l2
    *brace_container C1
     *normal_command@~ C1 l2
      *following_arg C1
       {normal_text:e}
   {normal_text:. }
   *normal_command@samp C1 l2
    *brace_container C1
     *normal_command@aa C1 l2
      *brace_container
   {normal_text:.\\n}
   *normal_command@command C1 l3
    *brace_container C1
     {normal_text:AAA}
   {normal_text:. }
   *normal_command@code C1 l3
    *brace_container C1
     *normal_command@~ C1 l3
      *following_arg C1
       {normal_text:E}
   {normal_text:. }
   *normal_command@samp C1 l3
    *brace_container C1
     *normal_command@AA C1 l3
      *brace_container
   {normal_text:.\\n}
   *normal_command@command C1 l4
    *brace_container C1
     {normal_text:double AAA}
   {normal_text:.  }
   *normal_command@code C1 l4
    *brace_container C2
     {normal_text:double }
     *normal_command@~ C1 l4
      *following_arg C1
       {normal_text:E}
   {normal_text:. }
   *normal_command@samp C1 l4
    *brace_container C2
     {normal_text:double }
     *normal_command@AA C1 l4
      *brace_container
   {normal_text:.  End.\\n}
';


$result_texis{'punctuation_and_code_style_commands_utf8'} = '@documentencoding utf-8
@command{aaa}. @code{@~e}. @samp{@aa{}}.
@command{AAA}. @code{@~E}. @samp{@AA{}}.
@command{double AAA}.  @code{double @~E}. @samp{double @AA{}}.  End.
';


$result_texts{'punctuation_and_code_style_commands_utf8'} = 'aaa. e~. aa.
AAA. E~. AA.
double AAA.  double E~. double AA.  End.
';

$result_errors{'punctuation_and_code_style_commands_utf8'} = '';

$result_nodes_list{'punctuation_and_code_style_commands_utf8'} = '';

$result_sections_list{'punctuation_and_code_style_commands_utf8'} = '';

$result_sectioning_root{'punctuation_and_code_style_commands_utf8'} = '';

$result_headings_list{'punctuation_and_code_style_commands_utf8'} = '';


$result_converted{'plaintext'}->{'punctuation_and_code_style_commands_utf8'} = '‘aaa’.  ‘ẽ’.  ‘å’.  ‘AAA’.  ‘Ẽ’.  ‘Å’.  ‘double AAA’.  ‘double Ẽ’.
‘double Å’.  End.
';

1;
