use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'no_punctuation_commands'} = '*document_root C1
 *before_node_section C13
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C13
   {normal_text:Dot.}
   *normal_command@:
   {normal_text: Exclam!}
   *normal_command@:
   {normal_text: Question?}
   *normal_command@:
   {normal_text: Dot.}
   *normal_command@:
   {normal_text:  Exclam!}
   *normal_command@:
   {normal_text:  Question?}
   *normal_command@:
   {normal_text:  GAAA.\\n}
  {empty_line:\\n}
  *paragraph C10
   {normal_text:End of lines Dot.}
   *normal_command@:
   {normal_text:\\n}
   {normal_text:Exclam!}
   *normal_command@:
   {normal_text:\\n}
   {normal_text:Question?}
   *normal_command@:
   {normal_text:\\n}
   {normal_text:End.\\n}
  {empty_line:\\n}
  *paragraph C11
   {normal_text:End of lines and spaces\\n}
   {normal_text:Dot.}
   *normal_command@:
   {normal_text:\\n}
   {normal_text:Exclam!}
   *normal_command@:
   {normal_text:\\n}
   {normal_text:Question?}
   *normal_command@:
   {normal_text:\\n}
   {normal_text:End.\\n}
  {empty_line:\\n}
  *paragraph C9
   {normal_text:With paren.}
   *normal_command@:
   {normal_text:) paren.}
   *normal_command@:
   {normal_text:)  Symb.}
   *normal_command@:
   {normal_text:)"\'] Symb.}
   *normal_command@:
   {normal_text:)"\']  End.\\n}
  {empty_line:\\n}
  *paragraph C7
   {normal_text:End of lines paren.}
   *normal_command@:
   {normal_text:)\\n}
   {normal_text:Symb.}
   *normal_command@:
   {normal_text:)"\']\\n}
   {normal_text:End.\\n}
  {empty_line:\\n}
  *paragraph C7
   {normal_text:End of lines and spaces paren.}
   *normal_command@:
   {normal_text:)\\n}
   {normal_text:Symb.}
   *normal_command@:
   {normal_text:)"\']\\n}
   {normal_text:End.\\n}
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


$result_texts{'no_punctuation_commands'} = 'Dot. Exclam! Question? Dot.  Exclam!  Question?  GAAA.

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
