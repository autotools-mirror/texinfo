use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'no_punctuation_commands'} = '*document_root C1
 *before_node_section C12
  {empty_line:\\n}
  *paragraph C13
   {Dot.}
   *@:
   { Exclam!}
   *@:
   { Question?}
   *@:
   { Dot.}
   *@:
   {  Exclam!}
   *@:
   {  Question?}
   *@:
   {  GAAA.\\n}
  {empty_line:\\n}
  *paragraph C10
   {End of lines Dot.}
   *@:
   {\\n}
   {Exclam!}
   *@:
   {\\n}
   {Question?}
   *@:
   {\\n}
   {End.\\n}
  {empty_line:\\n}
  *paragraph C11
   {End of lines and spaces\\n}
   {Dot.}
   *@:
   {\\n}
   {Exclam!}
   *@:
   {\\n}
   {Question?}
   *@:
   {\\n}
   {End.\\n}
  {empty_line:\\n}
  *paragraph C9
   {With paren.}
   *@:
   {) paren.}
   *@:
   {)  Symb.}
   *@:
   {)"\'] Symb.}
   *@:
   {)"\']  End.\\n}
  {empty_line:\\n}
  *paragraph C7
   {End of lines paren.}
   *@:
   {)\\n}
   {Symb.}
   *@:
   {)"\']\\n}
   {End.\\n}
  {empty_line:\\n}
  *paragraph C7
   {End of lines and spaces paren.}
   *@:
   {)\\n}
   {Symb.}
   *@:
   {)"\']\\n}
   {End.\\n}
';


$result_texis{'no_punctuation_commands'} = '
Dot.@: Exclam!@: Question?@: Dot.@:  Exclam!@:  Question?@:  GAAA.

End of lines Dot.@:
Exclam!@:
Question?@:
End.

End of lines and spaces
Dot.@:
Exclam!@:
Question?@:
End.

With paren.@:) paren.@:)  Symb.@:)"\'] Symb.@:)"\']  End.

End of lines paren.@:)
Symb.@:)"\']
End.

End of lines and spaces paren.@:)
Symb.@:)"\']
End.
';


$result_texts{'no_punctuation_commands'} = '
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

$result_errors{'no_punctuation_commands'} = '';

$result_nodes_list{'no_punctuation_commands'} = '';

$result_sections_list{'no_punctuation_commands'} = '';

$result_sectioning_root{'no_punctuation_commands'} = '';

$result_headings_list{'no_punctuation_commands'} = '';


$result_converted{'plaintext'}->{'no_punctuation_commands'} = 'Dot. Exclam! Question? Dot. Exclam! Question? GAAA.

   End of lines Dot. Exclam! Question? End.

   End of lines and spaces Dot. Exclam! Question? End.

   With paren.) paren.) Symb.)"\'] Symb.)"\'] End.

   End of lines paren.) Symb.)"\'] End.

   End of lines and spaces paren.) Symb.)"\'] End.
';

1;
