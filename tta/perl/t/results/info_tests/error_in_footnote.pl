use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'error_in_footnote'} = '*document_root C2
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble
 *normal_command@node C7 l2 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C7 l4
  |float_number:{1}
  |float_type:{Text}
  |global_command_number:{1}
  |identifier:{label}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:label}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:Float text1\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l8
    *brace_command_context C1
     *paragraph C8
      {normal_text:Caption. }
      *normal_command@TeX l8
      {normal_text:. \\n}
      {normal_text:In caption }
      *normal_command@strong C1 l9
       *brace_container C1
        {normal_text:note caption}
      {normal_text:.  \\n}
      {normal_text:Now footnote}
      *normal_command@footnote C1 l10
      |global_command_number:{1}
       *brace_command_context C1
        *paragraph C5
         *normal_command@LaTeX l10
         {normal_text:. \\n}
         {normal_text:and strong }
         *normal_command@strong C1 l11
          *brace_container C1
           {normal_text:Note footnote}
         {normal_text:.}
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l12
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l14
  |float_type:{Text}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Text}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l16
  |float_type:{Text}
  |global_command_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Text}
    {spaces_after_argument:\\n}
';


$result_texis{'error_in_footnote'} = '
@node Top

@float Text, label

Float text1

@caption{Caption. @TeX. 
In caption @strong{note caption}.  
Now footnote@footnote{@LaTeX. 
and strong @strong{Note footnote}.}}
@end float

@listoffloats Text

@listoffloats Text
';


$result_texts{'error_in_footnote'} = '
Text, label

Float text1



';

$result_errors{'error_in_footnote'} = '* E l8|@TeX expected braces
 @TeX expected braces

* E l10|@LaTeX expected braces
 @LaTeX expected braces

';

$result_floats{'error_in_footnote'} = 'Text: 1
 F1: {label}
  C: Caption. @TeX. 
   In caption @strong{note caption}.  
   Now footnote@footnote{@LaTeX. 
   and strong @strong{Note footnote}.}
';

$result_nodes_list{'error_in_footnote'} = '1|Top
';

$result_sections_list{'error_in_footnote'} = '';

$result_sectioning_root{'error_in_footnote'} = '';

$result_headings_list{'error_in_footnote'} = '';


$result_converted{'info'}->{'error_in_footnote'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

Float text1

Text 1: Caption.  TeX.  In caption *note caption*.  Now footnote(1)

* Menu:

* Text 1: label.                         Caption.  TeX.  In caption
                                         *note caption*.  Now
                                         footnote(1)

* Menu:

* Text 1: label.                         Caption.  TeX.  In caption
                                         *note caption*.  Now
                                         footnote(1)

   ---------- Footnotes ----------

   (1) LaTeX.  and strong *Note footnote*.


Tag Table:
Node: Top27
Ref: label61
Ref: Top-Footnote-1565

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'error_in_footnote'} = '* W l9|@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
 warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that

* W l9|@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
 warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that

* W l9|@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
 warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that

* W l11|@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
 warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that

';

1;
