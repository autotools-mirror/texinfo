use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'punctuation_and_upper_case_commands'} = '*document_root C1
 *before_node_section C5
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C18
   *@var C1 l2
    *brace_container C1
     {normal_text:aaa}
   {normal_text:. }
   *@var C1 l2
    *brace_container C1
     *@~ C1 l2
      *following_arg C1
       {normal_text:e}
   {normal_text:. }
   *@var C1 l2
    *brace_container C1
     *@aa C1 l2
      *brace_container
   {normal_text:.\\n}
   *@var C1 l3
    *brace_container C1
     {normal_text:AAA}
   {normal_text:. }
   *@var C1 l3
    *brace_container C1
     *@~ C1 l3
      *following_arg C1
       {normal_text:E}
   {normal_text:. }
   *@var C1 l3
    *brace_container C1
     *@AA C1 l3
      *brace_container
   {normal_text:.\\n}
   *@var C1 l4
    *brace_container C1
     {normal_text:double AAA}
   {normal_text:.  }
   *@var C1 l4
    *brace_container C2
     {normal_text:double }
     *@~ C1 l4
      *following_arg C1
       {normal_text:E}
   {normal_text:. }
   *@var C1 l4
    *brace_container C2
     {normal_text:double }
     *@AA C1 l4
      *brace_container
   {normal_text:.  End.\\n}
  {empty_line:\\n}
  *paragraph C18
   *@sc C1 l6
    *brace_container C1
     {normal_text:aaa}
   {normal_text:. }
   *@sc C1 l6
    *brace_container C1
     *@~ C1 l6
      *following_arg C1
       {normal_text:e}
   {normal_text:. }
   *@sc C1 l6
    *brace_container C1
     *@aa C1 l6
      *brace_container
   {normal_text:.\\n}
   *@sc C1 l7
    *brace_container C1
     {normal_text:AAA}
   {normal_text:. }
   *@sc C1 l7
    *brace_container C1
     *@~ C1 l7
      *following_arg C1
       {normal_text:E}
   {normal_text:. }
   *@sc C1 l7
    *brace_container C1
     *@AA C1 l7
      *brace_container
   {normal_text:.\\n}
   *@sc C1 l8
    *brace_container C1
     {normal_text:double AAA}
   {normal_text:.  }
   *@sc C1 l8
    *brace_container C2
     {normal_text:double }
     *@~ C1 l8
      *following_arg C1
       {normal_text:E}
   {normal_text:. }
   *@sc C1 l8
    *brace_container C2
     {normal_text:double }
     *@AA C1 l8
      *brace_container
   {normal_text:.  End.\\n}
';


$result_texis{'punctuation_and_upper_case_commands'} = '
@var{aaa}. @var{@~e}. @var{@aa{}}.
@var{AAA}. @var{@~E}. @var{@AA{}}.
@var{double AAA}.  @var{double @~E}. @var{double @AA{}}.  End.

@sc{aaa}. @sc{@~e}. @sc{@aa{}}.
@sc{AAA}. @sc{@~E}. @sc{@AA{}}.
@sc{double AAA}.  @sc{double @~E}. @sc{double @AA{}}.  End.
';


$result_texts{'punctuation_and_upper_case_commands'} = 'aaa. e~. aa.
AAA. E~. AA.
double AAA.  double E~. double AA.  End.

AAA. E~. AA.
AAA. E~. AA.
DOUBLE AAA.  DOUBLE E~. DOUBLE AA.  End.
';

$result_errors{'punctuation_and_upper_case_commands'} = '';

$result_nodes_list{'punctuation_and_upper_case_commands'} = '';

$result_sections_list{'punctuation_and_upper_case_commands'} = '';

$result_sectioning_root{'punctuation_and_upper_case_commands'} = '';

$result_headings_list{'punctuation_and_upper_case_commands'} = '';


$result_converted{'plaintext'}->{'punctuation_and_upper_case_commands'} = 'AAA.  Ẽ.  Å.  AAA.  Ẽ.  Å.  DOUBLE AAA.  DOUBLE Ẽ.  DOUBLE Å.  End.

   AAA.  Ẽ.  Å.  AAA. Ẽ. Å. DOUBLE AAA. DOUBLE Ẽ. DOUBLE Å. End.
';

1;
