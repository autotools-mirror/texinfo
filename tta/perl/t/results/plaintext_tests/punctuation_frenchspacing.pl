use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'punctuation_frenchspacing'} = '*document_root C1
 *before_node_section C12
  *preamble C2
   *normal_command@frenchspacing C1 l1
   |global_command_number:{1}
   |misc_args:A{on}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:on}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C1
   {normal_text:Dot. Exclam! Question? Dot.  Exclam!  Question?  GAAA.\\n}
  {empty_line:\\n}
  *paragraph C4
   {normal_text:End of lines Dot.\\n}
   {normal_text:Exclam!\\n}
   {normal_text:Question?\\n}
   {normal_text:End.\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:End of lines and spaces\\n}
   {normal_text:Dot.\\n}
   {normal_text:Exclam!\\n}
   {normal_text:Question?\\n}
   {normal_text:End.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:With paren.) paren.)  Symb.)"\'] Symb.)"\']  End.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:End of lines paren.)\\n}
   {normal_text:Symb.)"\']\\n}
   {normal_text:End.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:End of lines and spaces paren.)\\n}
   {normal_text:Symb.)"\']\\n}
   {normal_text:End.\\n}
';


$result_texis{'punctuation_frenchspacing'} = '@frenchspacing on

Dot. Exclam! Question? Dot.  Exclam!  Question?  GAAA.

End of lines Dot.
Exclam!
Question?
End.

End of lines and spaces
Dot.
Exclam!
Question?
End.

With paren.) paren.)  Symb.)"\'] Symb.)"\']  End.

End of lines paren.)
Symb.)"\']
End.

End of lines and spaces paren.)
Symb.)"\']
End.
';


$result_texts{'punctuation_frenchspacing'} = '
Dot. Exclam! Question? Dot.  Exclam!  Question?  GAAA.

End of lines Dot.
Exclam!
Question?
End.

End of lines and spaces
Dot.
Exclam!
Question?
End.

With paren.) paren.)  Symb.)"\'] Symb.)"\']  End.

End of lines paren.)
Symb.)"\']
End.

End of lines and spaces paren.)
Symb.)"\']
End.
';

$result_errors{'punctuation_frenchspacing'} = '';

$result_nodes_list{'punctuation_frenchspacing'} = '';

$result_sections_list{'punctuation_frenchspacing'} = '';

$result_sectioning_root{'punctuation_frenchspacing'} = '';

$result_headings_list{'punctuation_frenchspacing'} = '';


$result_converted{'plaintext'}->{'punctuation_frenchspacing'} = 'Dot. Exclam! Question? Dot. Exclam! Question? GAAA.

   End of lines Dot. Exclam! Question? End.

   End of lines and spaces Dot. Exclam! Question? End.

   With paren.) paren.) Symb.)"\'] Symb.)"\'] End.

   End of lines paren.) Symb.)"\'] End.

   End of lines and spaces paren.) Symb.)"\'] End.
';

1;
