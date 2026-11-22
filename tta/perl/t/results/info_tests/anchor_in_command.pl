use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'anchor_in_command'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C3 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@strong C1 l3
    *brace_container C8
     {normal_text:aaa }
     *@TeX C1 l3
      *brace_container
     {normal_text: }
     *@emph C1 l3
      *brace_container C1
       {normal_text:in emph}
     {normal_text: after \\n}
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:emph @emph{emph2 @anchor{anchor in emph} }}.}
       {spaces_after_argument:\\n}
     {normal_text:emph }
     *@emph C1 l5
      *brace_container C2
       {normal_text:emph2 }
       *@anchor C1 l5
       |EXTRA
       |identifier:{anchor-in-emph}
       |is_target:{1}
        *brace_arg C1
         {normal_text:anchor in emph}
   {normal_text:.\\n}
';


$result_texis{'anchor_in_command'} = '@node Top

@strong{aaa @TeX{} @emph{in emph} after 
@c emph @emph{emph2 @anchor{anchor in emph} }}.
emph @emph{emph2 @anchor{anchor in emph}}}.
';


$result_texts{'anchor_in_command'} = '
aaa TeX in emph after 
emph emph2 .
';

$result_errors{'anchor_in_command'} = '';

$result_nodes_list{'anchor_in_command'} = '1|Top
';

$result_sections_list{'anchor_in_command'} = '';

$result_sectioning_root{'anchor_in_command'} = '';

$result_headings_list{'anchor_in_command'} = '';


$result_converted{'info'}->{'anchor_in_command'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

*aaa TeX _in emph_ after emph _emph2 _*.


Tag Table:
Node: Top27
Ref: anchor in emph97

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
