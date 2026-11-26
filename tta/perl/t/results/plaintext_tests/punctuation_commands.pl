use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'punctuation_commands'} = '*document_root C1
 *before_node_section C15
  *before_beginning C1
   {empty_line:\\n}
  *preamble
  *paragraph C13
   {normal_text:Dot}
   *normal_command@.
   {normal_text: Exclam}
   *normal_command@!
   {normal_text: Question}
   *normal_command@?
   {normal_text: Dot}
   *normal_command@.
   {normal_text:  Exclam}
   *normal_command@!
   {normal_text:  Question}
   *normal_command@?
   {normal_text:  GAAA.\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:Enddots}
   *normal_command@enddots C1 l4
    *brace_container
   {normal_text: Enddots}
   *normal_command@enddots C1 l4
    *brace_container
   {normal_text:  GBBB.\\n}
  {empty_line:\\n}
  *paragraph C13
   {normal_text:End of lines Dot}
   *normal_command@.
   {normal_text:\\n}
   {normal_text:Exclam}
   *normal_command@!
   {normal_text:\\n}
   {normal_text:Question}
   *normal_command@?
   {normal_text:\\n}
   {normal_text:Enddots}
   *normal_command@enddots C1 l9
    *brace_container
   {normal_text:\\n}
   {normal_text:End.\\n}
  {empty_line:\\n}
  *paragraph C14
   {normal_text:End of lines and spaces\\n}
   {normal_text:Dot}
   *normal_command@.
   {normal_text:\\n}
   {normal_text:Exclam}
   *normal_command@!
   {normal_text:\\n}
   {normal_text:Question}
   *normal_command@?
   {normal_text:\\n}
   {normal_text:Enddots}
   *normal_command@enddots C1 l16
    *brace_container
   {normal_text:\\n}
   {normal_text:End.\\n}
  {empty_line:\\n}
  *paragraph C9
   {normal_text:With paren}
   *normal_command@.
   {normal_text:) paren}
   *normal_command@.
   {normal_text:)  Symb}
   *normal_command@.
   {normal_text:)"\'] Symb}
   *normal_command@.
   {normal_text:)"\']  End.\\n}
  {empty_line:\\n}
  *paragraph C7
   {normal_text:End of lines paren}
   *normal_command@.
   {normal_text:)\\n}
   {normal_text:Symb}
   *normal_command@.
   {normal_text:)"\']\\n}
   {normal_text:End.\\n}
  {empty_line:\\n}
  *paragraph C7
   {normal_text:End of lines and spaces paren}
   *normal_command@.
   {normal_text:)\\n}
   {normal_text:Symb}
   *normal_command@.
   {normal_text:)"\']\\n}
   {normal_text:End.\\n}
';


$result_texis{'punctuation_commands'} = '
Dot@. Exclam@! Question@? Dot@.  Exclam@!  Question@?  GAAA.

Enddots@enddots{} Enddots@enddots{}  GBBB.

End of lines Dot@.
Exclam@!
Question@?
Enddots@enddots{}
End.

End of lines and spaces
Dot@.
Exclam@!
Question@?
Enddots@enddots{}
End.

With paren@.) paren@.)  Symb@.)"\'] Symb@.)"\']  End.

End of lines paren@.)
Symb@.)"\']
End.

End of lines and spaces paren@.)
Symb@.)"\']
End.
';


$result_texts{'punctuation_commands'} = 'Dot. Exclam! Question? Dot.  Exclam!  Question?  GAAA.

Enddots... Enddots...  GBBB.

End of lines Dot.
Exclam!
Question?
Enddots...
End.

End of lines and spaces
Dot.
Exclam!
Question?
Enddots...
End.

With paren.) paren.)  Symb.)"\'] Symb.)"\']  End.

End of lines paren.)
Symb.)"\']
End.

End of lines and spaces paren.)
Symb.)"\']
End.
';

$result_errors{'punctuation_commands'} = '';

$result_nodes_list{'punctuation_commands'} = '';

$result_sections_list{'punctuation_commands'} = '';

$result_sectioning_root{'punctuation_commands'} = '';

$result_headings_list{'punctuation_commands'} = '';


$result_converted{'plaintext'}->{'punctuation_commands'} = 'Dot.  Exclam!  Question?  Dot.  Exclam!  Question?  GAAA.

   Enddots...  Enddots...  GBBB.

   End of lines Dot.  Exclam!  Question?  Enddots...  End.

   End of lines and spaces Dot.  Exclam!  Question?  Enddots...  End.

   With paren.)  paren.)  Symb.)"\']  Symb.)"\']  End.

   End of lines paren.)  Symb.)"\']  End.

   End of lines and spaces paren.)  Symb.)"\']  End.
';

1;
