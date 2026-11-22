use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'center_flush'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content
  *normal_command@center C1 l1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:centered}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@flushleft C10 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C2
    {normal_text:left and\\n}
    {normal_text:left2\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:left3.\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   *paragraph C2
    {normal_text:left Last\\n}
    {normal_text:  with space.\\n}
   {empty_line:\\n}
   *paragraph C4
    {normal_text:Now anchor\\n}
    *normal_command@anchor C1 l14
    |identifier:{anchor-in-flushleft}
    |is_target:{1}
     *brace_arg C1
      {normal_text:anchor in flushleft}
    {spaces_after_close_brace:\\n}
    {normal_text:after anchor\\n}
   *normal_command@end C1 l16
   |text_arg:{flushleft}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushleft}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@flushright C10 l18
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C2
    {normal_text:right and\\n}
    {normal_text:right2\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:Right3\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   *paragraph C2
    {normal_text:Right last\\n}
    {normal_text:  with space.     \\n}
   {empty_line:\\n}
   *paragraph C8
    {normal_text:Now anchor\\n}
    *normal_command@anchor C1 l29
    |identifier:{anchor-in-flushright}
    |is_target:{1}
     *brace_arg C1
      {normal_text:anchor in flushright}
    {spaces_after_close_brace:\\n}
    {normal_text:after anchor\\n}
    {normal_text:Second anchor in text }
    *normal_command@anchor C1 l31
    |identifier:{second-anchor-in-flushright}
    |is_target:{1}
     *brace_arg C1
      {normal_text:second anchor in flushright}
    {spaces_after_close_brace: }
    {normal_text:after anchor.\\n}
   *normal_command@end C1 l32
   |text_arg:{flushright}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushright}
     {spaces_after_argument:\\n}
';


$result_texis{'center_flush'} = '@center centered

@flushleft
left and
left2

left3.


left Last
  with space.

Now anchor
@anchor{anchor in flushleft}
after anchor
@end flushleft

@flushright
right and
right2

Right3


Right last
  with space.     

Now anchor
@anchor{anchor in flushright}
after anchor
Second anchor in text @anchor{second anchor in flushright} after anchor.
@end flushright
';


$result_texts{'center_flush'} = 'centered

left and
left2

left3.


left Last
  with space.

Now anchor
after anchor

right and
right2

Right3


Right last
  with space.     

Now anchor
after anchor
Second anchor in text after anchor.
';

$result_errors{'center_flush'} = '';

$result_nodes_list{'center_flush'} = '';

$result_sections_list{'center_flush'} = '';

$result_sectioning_root{'center_flush'} = '';

$result_headings_list{'center_flush'} = '';


$result_converted{'info'}->{'center_flush'} = Encode::encode('utf-8', 'This is , produced from .

                               centered

left and
left2

left3.

left Last
with space.

Now anchor
after anchor

                                                              right and
                                                                 right2

                                                                 Right3

                                                             Right last
                                                            with space.

                                                             Now anchor
                                                           after anchor
                                    Second anchor in text after anchor.

Tag Table:
Ref: anchor in flushleft126
Ref: anchor in flushright574
Ref: second anchor in flushright704

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'center_flush'} = '* W |document without nodes
 warning: document without nodes

* W l14|@anchor outside of any node
 warning: @anchor outside of any node

* W l29|@anchor outside of any node
 warning: @anchor outside of any node

* W l31|@anchor outside of any node
 warning: @anchor outside of any node

';

1;
