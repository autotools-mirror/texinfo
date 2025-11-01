use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'note_in_strong'} = '*document_root C2
 *before_node_section
 *@node C15 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
  {empty_line:\\n}
  *paragraph C3
   {3 One }
   *@strong C1 l3
    *brace_container C1
     {Note}
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   {5 }
   *@strong C1 l5
    *brace_container C1
     {Note a}
   {.\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  {empty_line:\\n}
  *paragraph C3
   {9 }
   *@strong C1 l9
    *brace_container C1
     {note}
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   {11 }
   *@strong C1 l11
    *brace_container C1
     {note b}
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   {13 }
   *@strong C1 l13
    *brace_container C1
     { note}
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   {15 }
   *@strong C1 l15
    *brace_container C1
     {note-bbb}
   {.\\n}
';


$result_texis{'note_in_strong'} = '@node Top

3 One @strong{Note}.

5 @strong{Note a}.



9 @strong{note}.

11 @strong{note b}.

13 @strong{ note}.

15 @strong{note-bbb}.
';


$result_texts{'note_in_strong'} = '
3 One Note.

5 Note a.



9 note.

11 note b.

13  note.

15 note-bbb.
';

$result_errors{'note_in_strong'} = '';

$result_nodes_list{'note_in_strong'} = '1|Top
';

$result_sections_list{'note_in_strong'} = '';

$result_sectioning_root{'note_in_strong'} = '';

$result_headings_list{'note_in_strong'} = '';


$result_converted{'info'}->{'note_in_strong'} = 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

3 One *Note*.

   5 *Note a*.

   9 *note*.

   11 *note b*.

   13 * note*.

   15 *note-bbb*.


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'note_in_strong'} = '* W l5|@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
 warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that

* W l11|@strong{Note...} produces a spurious cross-reference in Info; reword to avoid that
 warning: @strong{Note...} produces a spurious cross-reference in Info; reword to avoid that

';

1;
