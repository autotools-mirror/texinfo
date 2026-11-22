use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'itemize_tieaccent'} = '*document_root C1
 *before_node_section C12
  *preamble_before_content
  *@itemize C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@tieaccent C1 l1
      *brace_container C1
       {normal_text:ab}
     {spaces_after_argument:\\n}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item }
     *@tieaccent C1 l2
      *brace_container C1
       {normal_text:ab}
     {normal_text:\\n}
   *@end C1 l3
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l5
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@tieaccent C1 l5
      *brace_container C2
       *@aa C1 l5
        *brace_container
       *@^ C1 l5
        *following_arg C1
         {normal_text:e}
     {spaces_after_argument:\\n}
   *@item C2 l6
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item }
     *@tieaccent C1 l6
      *brace_container C2
       *@aa C1 l6
        *brace_container
       *@^ C1 l6
        *following_arg C1
         {normal_text:e}
     {normal_text:\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l9
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@tieaccent C1 l9
      *brace_container C2
       *@aa C1 l9
        *brace_container
       {normal_text:d}
     {spaces_after_argument:\\n}
   *@item C2 l10
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item }
     *@tieaccent C1 l10
      *brace_container C2
       *@aa C1 l10
        *brace_container
       {normal_text:d}
     {normal_text:\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l13
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@tieaccent C1 l13
      *brace_container C2
       {normal_text:x}
       *@^ C1 l13
        *following_arg C1
         {normal_text:e}
     {spaces_after_argument:\\n}
   *@item C2 l14
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item }
     *@tieaccent C1 l14
      *brace_container C2
       {normal_text:x}
       *@^ C1 l14
        *following_arg C1
         {normal_text:e}
     {normal_text:\\n}
   *@end C1 l15
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l17
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@tieaccent C1 l17
      *brace_container C1
       {normal_text:g}
     {spaces_after_argument:\\n}
   *@item C2 l18
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item }
     *@tieaccent C1 l18
      *brace_container C1
       {normal_text:g}
     {normal_text:\\n}
   *@end C1 l19
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l21
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@tieaccent C1 l21
      *brace_container C1
       *@^ C1 l21
        *following_arg C1
         {normal_text:e}
     {spaces_after_argument:\\n}
   *@item C2 l22
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item }
     *@tieaccent C1 l22
      *brace_container C1
       *@^ C1 l22
        *following_arg C1
         {normal_text:e}
     {normal_text:\\n}
   *@end C1 l23
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
';


$result_texis{'itemize_tieaccent'} = '@itemize @tieaccent{ab}
@item item @tieaccent{ab}
@end itemize

@itemize @tieaccent{@aa{}@^e}
@item item @tieaccent{@aa{}@^e}
@end itemize

@itemize @tieaccent{@aa{}d}
@item item @tieaccent{@aa{}d}
@end itemize

@itemize @tieaccent{x@^e}
@item item @tieaccent{x@^e}
@end itemize

@itemize @tieaccent{g}
@item item @tieaccent{g}
@end itemize

@itemize @tieaccent{@^e}
@item item @tieaccent{@^e}
@end itemize
';


$result_texts{'itemize_tieaccent'} = 'item ab[

item aae^[

item aad[

item xe^[

item g[

item e^[
';

$result_errors{'itemize_tieaccent'} = '';

$result_nodes_list{'itemize_tieaccent'} = '';

$result_sections_list{'itemize_tieaccent'} = '';

$result_sectioning_root{'itemize_tieaccent'} = '';

$result_headings_list{'itemize_tieaccent'} = '';

$result_converted_errors{'file_html'}->{'itemize_tieaccent'} = '* W itemize_tieaccent.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
