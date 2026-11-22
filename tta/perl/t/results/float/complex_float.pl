use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'complex_float'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C10 l2 {Test floats}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Test floats}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:A list of floats at the beginning.\\n}
  *normal_command@listoffloats C1 l5
  |float_type:{Text}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Text}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:After the listoffloats.\\n}
  *normal_command@menu C3 l8
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l9
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{chapter}
     {normal_text:chapter}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l10
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C24 l12
  |float_number:{1}
  |float_type:{Text}
  |global_command_number:{1}
  |identifier:{text-with-a-lot-of-features}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:text with a lot of features}
     {spaces_after_argument:\\n}
   *paragraph C3
    {normal_text:An example of float }
    *normal_command@enddots C1 l13
     *brace_container
    {normal_text:\\n}
   {empty_line:\\n}
   *normal_command@c C1
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@ifset C12 l16
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:texi2html}
       >{spaces_after_argument:\\n}
     >{raw:An example.\\n}
     >{raw:@example \\n}
     >{raw:example\\n}
     >{raw:@end example\\n}
     >{raw:\\n}
     >{raw:A multitable.\\n}
     >{raw:@multitable {truc} {bidule}\\n}
     >{raw:@item truc @tab bidule\\n}
     >{raw:@item truc @tab bidule\\n}
     >{raw:@end multitable\\n}
     >*normal_command@end C1 l27
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:makeinfo --docbook segfaults}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C2
    {normal_text:An index entry\\n}
    *index_entry_command@cindex C1 l30
    |element_node:{Top}
    |index_entry:I{cp,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:float example}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:A table.\\n}
   *normal_command@table C3 l33
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *normal_command@emph l33
      {spaces_after_argument:\\n}
    *table_entry C2
     *table_term C1
      *normal_command@item C1 l34
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:truc}
        {spaces_after_argument: \\n}
     *table_definition C1
      *paragraph C1
       {normal_text:line\\n}
    *normal_command@end C1 l36
    |text_arg:{table}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:table}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:An itemize.\\n}
   *normal_command@itemize C3 l39
    *arguments_line C1
     *block_line_arg C3
      {spaces_before_argument: }
      *normal_command@minus l39
      {spaces_after_argument:\\n}
    *normal_command@item C2 l40
    |item_number:{1}
     {ignorable_spaces_after_command: }
     *paragraph C2
      {normal_text:truc \\n}
      {normal_text:line\\n}
    *normal_command@end C1 l42
    |text_arg:{itemize}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:itemize}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C6
    {normal_text:A ref.\\n}
    *normal_command@xref C2 l45
     *brace_arg C1
     |node_content:A{0|0}
     |normalized:{Top}
      {normal_text:Top}
     *brace_arg C1
      {normal_text:xref Text with features}
    {normal_text:.\\n}
    {normal_text:A footnote.\\n}
    *normal_command@footnote C1 l47
    |global_command_number:{1}
     *brace_command_context C1
      *paragraph C1
       {normal_text:footnote Text with features}
    {normal_text:.\\n}
   {empty_line:\\n}
   *paragraph C17
    *normal_command@TeX C1 l49
     *brace_container
    {normal_text: and }
    *normal_command@emph C1 l49
     *brace_container C2
      *normal_command@b C1 l49
       *brace_container C3
        {normal_text:t}
        *normal_command@\' C1 l49
         *following_arg C1
          {normal_text:e}
        *normal_command@^ C1 l49
         *brace_container C1
          *normal_command@dotless C1 l49
           *brace_container C1
            {normal_text:i}
      *normal_command@url C1 l49
       *brace_arg C1
        {normal_text:an_url}
    {normal_text: }
    *normal_command@sc C1 l49
     *brace_container C1
      {normal_text:and}
    {normal_text: }
    *normal_command@verb C1 l49
     *brace_container C3
      {verb_delimiter:!}
      {raw:it is @verb}
      {verb_delimiter:!}
    {normal_text: }
    *normal_command@ 
    {normal_text:a wo}
    *normal_command@-
    {normal_text:rd }
    *normal_command@!
    *normal_command@@
    {normal_text: }
    *normal_command@AE C1 l49
     *brace_container
    {normal_text:.\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l51
    *brace_command_context C20
     {spaces_before_argument: }
     *paragraph C4
      {normal_text:An example of float caption}
      *normal_command@enddots C1 l51
       *brace_container
      {normal_text:\\n}
      {normal_text:An example.\\n}
     *normal_command@example C3 l53
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument: \\n}
      *preformatted C1
       {normal_text:example\\n}
      *normal_command@end C1 l55
      |text_arg:{example}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:example}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
     *normal_command@anchor C1 l57
     |identifier:{Anchor-in-caption}
     |is_target:{1}
      *brace_arg C1
       {normal_text:Anchor in caption}
     {spaces_after_close_brace:\\n}
     {empty_line:\\n}
     *paragraph C1
      {normal_text:A table.\\n}
     *normal_command@table C3 l60
      *arguments_line C1
       *block_line_arg C3
        {spaces_before_argument: }
        *normal_command@emph l60
        {spaces_after_argument:\\n}
      *table_entry C2
       *table_term C1
        *normal_command@item C1 l61
         *line_arg C3
          {spaces_before_argument: }
          {normal_text:truc}
          {spaces_after_argument: \\n}
       *table_definition C1
        *paragraph C1
         {normal_text:line\\n}
      *normal_command@end C1 l63
      |text_arg:{table}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:table}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
     *paragraph C1
      {normal_text:A multitable.\\n}
     *normal_command@multitable C3 l66
     |max_columns:{2}
      *arguments_line C1
       *block_line_arg C5
        {spaces_before_argument: }
        *bracketed_arg C1 l66
         {normal_text:truc}
        {normal_text: }
        *bracketed_arg C1 l66
         {normal_text:bidule}
        {spaces_after_argument:\\n}
      *multitable_body C2
       *row C2
       |row_number:{1}
        *normal_command@item C2 l67
        |cell_number:{1}
         {ignorable_spaces_after_command: }
         *paragraph C1
          {normal_text:truc }
        *normal_command@tab C2 l67
        |cell_number:{2}
         {ignorable_spaces_after_command: }
         *paragraph C1
          {normal_text:bidule\\n}
       *row C2
       |row_number:{2}
        *normal_command@item C2 l68
        |cell_number:{1}
         {ignorable_spaces_after_command: }
         *paragraph C1
          {normal_text:truc }
        *normal_command@tab C2 l68
        |cell_number:{2}
         {ignorable_spaces_after_command: }
         *paragraph C1
          {normal_text:bidule\\n}
      *normal_command@end C1 l69
      |text_arg:{multitable}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:multitable}
        {spaces_after_argument:\\n}
     *paragraph C2
      {normal_text:An index entry\\n}
      *index_entry_command@cindex C1 l71
      |element_node:{Top}
      |index_entry:I{cp,2}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:float example in caption}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
     *paragraph C1
      {normal_text:An itemize.\\n}
     *normal_command@itemize C3 l74
      *arguments_line C1
       *block_line_arg C3
        {spaces_before_argument: }
        *normal_command@minus l74
        {spaces_after_argument:\\n}
      *normal_command@item C2 l75
      |item_number:{1}
       {ignorable_spaces_after_command: }
       *paragraph C2
        {normal_text:truc \\n}
        {normal_text:line\\n}
      *normal_command@end C1 l77
      |text_arg:{itemize}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:itemize}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
     *paragraph C6
      {normal_text:A ref.\\n}
      *normal_command@xref C2 l80
       *brace_arg C1
       |node_content:A{0|0}
       |normalized:{Top}
        {normal_text:Top}
       *brace_arg C1
        {normal_text:xref Text with features caption}
      {normal_text:.\\n}
      {normal_text:A footnote.\\n}
      *normal_command@footnote C1 l82
      |global_command_number:{2}
       *brace_command_context C1
        *paragraph C1
         {normal_text:footnote Text with features caption}
      {normal_text:.\\n}
     {empty_line:\\n}
     *paragraph C17
      *normal_command@TeX C1 l84
       *brace_container
      {normal_text: and }
      *normal_command@emph C1 l84
       *brace_container C2
        *normal_command@b C1 l84
         *brace_container C3
          {normal_text:t}
          *normal_command@\' C1 l84
           *following_arg C1
            {normal_text:e}
          *normal_command@^ C1 l84
           *brace_container C1
            *normal_command@dotless C1 l84
             *brace_container C1
              {normal_text:i}
        *normal_command@url C1 l84
         *brace_arg C1
          {normal_text:an_url}
      {normal_text: }
      *normal_command@sc C1 l84
       *brace_container C1
        {normal_text:and}
      {normal_text: }
      *normal_command@verb C1 l84
       *brace_container C3
        {verb_delimiter:!}
        {raw:it is @verb}
        {verb_delimiter:!}
      {normal_text: }
      *normal_command@ 
      {normal_text:a wo}
      *normal_command@-
      {normal_text:rd }
      *normal_command@!
      *normal_command@@
      {normal_text: }
      *normal_command@AE C1 l84
       *brace_container
      {normal_text:.\\n}
   {spaces_after_close_brace:\\n}
   {empty_line:\\n}
   *normal_command@shortcaption C1 l87
    *brace_command_context C1
     *paragraph C17
      *normal_command@TeX C1 l87
       *brace_container
      {normal_text: and }
      *normal_command@emph C1 l87
       *brace_container C2
        *normal_command@b C1 l87
         *brace_container C3
          {normal_text:t}
          *normal_command@\' C1 l87
           *following_arg C1
            {normal_text:e}
          *normal_command@^ C1 l87
           *brace_container C1
            *normal_command@dotless C1 l87
             *brace_container C1
              {normal_text:i}
        *normal_command@url C1 l87
         *brace_arg C1
          {normal_text:an_url}
      {normal_text: }
      *normal_command@sc C1 l87
       *brace_container C1
        {normal_text:and}
      {normal_text: }
      *normal_command@verb C1 l87
       *brace_container C3
        {verb_delimiter:!}
        {raw:it is @verb}
        {verb_delimiter:!}
      {normal_text: }
      *normal_command@ 
      {normal_text:a wo}
      *normal_command@-
      {normal_text:rd }
      *normal_command@!
      *normal_command@@
      {normal_text: }
      *normal_command@AE C1 l87
       *brace_container
      {normal_text:.}
   {spaces_after_close_brace:\\n}
   {empty_line:\\n}
   *normal_command@end C1 l89
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l91 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C6 l92 {A chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:A chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C8 l94
  |float_number:{1.1}
  |float_type:{Text}
  |global_command_number:{2}
  |identifier:{float-with-a-lot-of-features-and-no-shortcaption}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Text}
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:float with a lot of features and no shortcaption}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *paragraph C1
    {normal_text:Float text of a float with a lot of features.\\n}
   {empty_line:\\n}
   *normal_command@caption C1 l98
    *brace_command_context C20
     {spaces_before_argument: }
     *paragraph C4
      {normal_text:An example of float caption}
      *normal_command@enddots C1 l98
       *brace_container
      {normal_text: 2\\n}
      {normal_text:An example 2.\\n}
     *normal_command@example C3 l100
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument: \\n}
      *preformatted C1
       {normal_text:example 2\\n}
      *normal_command@end C1 l102
      |text_arg:{example}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:example}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
     *paragraph C1
      {normal_text:A table 2.\\n}
     *normal_command@table C3 l105
      *arguments_line C1
       *block_line_arg C3
        {spaces_before_argument: }
        *normal_command@emph l105
        {spaces_after_argument:\\n}
      *table_entry C2
       *table_term C1
        *normal_command@item C1 l106
         *line_arg C3
          {spaces_before_argument: }
          {normal_text:truc 2}
          {spaces_after_argument: \\n}
       *table_definition C1
        *paragraph C1
         {normal_text:line 2\\n}
      *normal_command@end C1 l108
      |text_arg:{table}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:table}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
     *paragraph C1
      {normal_text:A multitable 2.\\n}
     *normal_command@multitable C3 l111
     |max_columns:{2}
      *arguments_line C1
       *block_line_arg C5
        {spaces_before_argument: }
        *bracketed_arg C1 l111
         {normal_text:truc}
        {normal_text: }
        *bracketed_arg C1 l111
         {normal_text:bidule}
        {spaces_after_argument:\\n}
      *multitable_body C2
       *row C2
       |row_number:{1}
        *normal_command@item C2 l112
        |cell_number:{1}
         {ignorable_spaces_after_command: }
         *paragraph C1
          {normal_text:truc 2 }
        *normal_command@tab C2 l112
        |cell_number:{2}
         {ignorable_spaces_after_command: }
         *paragraph C1
          {normal_text:bidule\\n}
       *row C2
       |row_number:{2}
        *normal_command@item C2 l113
        |cell_number:{1}
         {ignorable_spaces_after_command: }
         *paragraph C1
          {normal_text:truc 2 }
        *normal_command@tab C2 l113
        |cell_number:{2}
         {ignorable_spaces_after_command: }
         *paragraph C1
          {normal_text:bidule\\n}
      *normal_command@end C1 l114
      |text_arg:{multitable}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:multitable}
        {spaces_after_argument:\\n}
     *paragraph C2
      {normal_text:An index entry 2\\n}
      *index_entry_command@cindex C1 l116
      |element_node:{chapter}
      |index_entry:I{cp,3}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:float example in caption 2}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
     *paragraph C1
      {normal_text:An itemize 2.\\n}
     *normal_command@itemize C3 l119
      *arguments_line C1
       *block_line_arg C3
        {spaces_before_argument: }
        *normal_command@minus l119
        {spaces_after_argument:\\n}
      *normal_command@item C2 l120
      |item_number:{1}
       {ignorable_spaces_after_command: }
       *paragraph C2
        {normal_text:truc 2\\n}
        {normal_text:line\\n}
      *normal_command@end C1 l122
      |text_arg:{itemize}
       *line_arg C3
        {spaces_before_argument: }
        {normal_text:itemize}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
     *normal_command@anchor C1 l124
     |identifier:{Anchor-in-caption-2}
     |is_target:{1}
      *brace_arg C1
       {normal_text:Anchor in caption 2}
     {spaces_after_close_brace:\\n}
     {empty_line:\\n}
     *paragraph C6
      {normal_text:A ref 2.\\n}
      *normal_command@xref C2 l127
       *brace_arg C1
       |node_content:A{0|0}
       |normalized:{Top}
        {normal_text:Top}
       *brace_arg C1
        {normal_text:xref Text with features caption}
      {normal_text:.\\n}
      {normal_text:A footnote 2.\\n}
      *normal_command@footnote C1 l129
      |global_command_number:{3}
       *brace_command_context C1
        *paragraph C1
         {normal_text:footnote Text with features caption 2}
      {normal_text:.\\n}
     {empty_line:\\n}
     *paragraph C17
      *normal_command@TeX C1 l131
       *brace_container
      {normal_text: and }
      *normal_command@emph C1 l131
       *brace_container C2
        *normal_command@b C1 l131
         *brace_container C3
          {normal_text:t}
          *normal_command@\' C1 l131
           *following_arg C1
            {normal_text:e}
          *normal_command@^ C1 l131
           *brace_container C1
            *normal_command@dotless C1 l131
             *brace_container C1
              {normal_text:i}
        *normal_command@url C1 l131
         *brace_arg C1
          {normal_text:an_url}
      {normal_text: }
      *normal_command@sc C1 l131
       *brace_container C1
        {normal_text:and}
      {normal_text: }
      *normal_command@verb C1 l131
       *brace_container C3
        {verb_delimiter:!}
        {raw:it is @verb}
        {verb_delimiter:!}
      {normal_text: }
      *normal_command@ 
      {normal_text:a wo}
      *normal_command@-
      {normal_text:rd }
      *normal_command@!
      *normal_command@@
      {normal_text: }
      *normal_command@AE C1 l131
       *brace_container
      {normal_text:.\\n}
   {spaces_after_close_brace:\\n}
   {empty_line:\\n}
   *normal_command@end C1 l134
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@xref C1 l136
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{text-with-a-lot-of-features}
     {normal_text:text with a lot of features}
   {normal_text:.\\n}
  {empty_line:\\n}
';


$result_texis{'complex_float'} = '@node Top
@top Test floats

A list of floats at the beginning.
@listoffloats Text

After the listoffloats.
@menu
* chapter::
@end menu

@float Text, text with a lot of features
An example of float @enddots{}

@c makeinfo --docbook segfaults

An index entry
@cindex float example

A table.
@table @emph
@item truc 
line
@end table

An itemize.
@itemize @minus
@item truc 
line
@end itemize

A ref.
@xref{Top,xref Text with features}.
A footnote.
@footnote{footnote Text with features}.

@TeX{} and @emph{@b{t@\'e@^{@dotless{i}}}@url{an_url}} @sc{and} @verb{!it is @verb!} @ a wo@-rd @!@@ @AE{}.

@caption{ An example of float caption@enddots{}
An example.
@example 
example
@end example

@anchor{Anchor in caption}

A table.
@table @emph
@item truc 
line
@end table

A multitable.
@multitable {truc} {bidule}
@item truc @tab bidule
@item truc @tab bidule
@end multitable
An index entry
@cindex float example in caption

An itemize.
@itemize @minus
@item truc 
line
@end itemize

A ref.
@xref{Top,xref Text with features caption}.
A footnote.
@footnote{footnote Text with features caption}.

@TeX{} and @emph{@b{t@\'e@^{@dotless{i}}}@url{an_url}} @sc{and} @verb{!it is @verb!} @ a wo@-rd @!@@ @AE{}.
}

@shortcaption{@TeX{} and @emph{@b{t@\'e@^{@dotless{i}}}@url{an_url}} @sc{and} @verb{!it is @verb!} @ a wo@-rd @!@@ @AE{}.}

@end float

@node chapter
@chapter A chapter

@float Text, float with a lot of features and no shortcaption

Float text of a float with a lot of features.

@caption{ An example of float caption@enddots{} 2
An example 2.
@example 
example 2
@end example

A table 2.
@table @emph
@item truc 2 
line 2
@end table

A multitable 2.
@multitable {truc} {bidule}
@item truc 2 @tab bidule
@item truc 2 @tab bidule
@end multitable
An index entry 2
@cindex float example in caption 2

An itemize 2.
@itemize @minus
@item truc 2
line
@end itemize

@anchor{Anchor in caption 2}

A ref 2.
@xref{Top,xref Text with features caption}.
A footnote 2.
@footnote{footnote Text with features caption 2}.

@TeX{} and @emph{@b{t@\'e@^{@dotless{i}}}@url{an_url}} @sc{and} @verb{!it is @verb!} @ a wo@-rd @!@@ @AE{}.
}

@end float

@xref{text with a lot of features}.

';


$result_texts{'complex_float'} = 'Test floats
***********

A list of floats at the beginning.

After the listoffloats.
* chapter::

Text, text with a lot of features
An example of float ...


An index entry

A table.
truc
line

An itemize.
truc 
line

A ref.
Top.
A footnote.
.

TeX and te\'i^an_url AND it is @verb  a word !@ AE.




1 A chapter
***********

Text, float with a lot of features and no shortcaption

Float text of a float with a lot of features.



text with a lot of features.

';

$result_errors{'complex_float'} = '* W l87|@verb should not appear anywhere inside @shortcaption
 warning: @verb should not appear anywhere inside @shortcaption

';

$result_floats{'complex_float'} = 'Text: 2
 F1: {text-with-a-lot-of-features}
  S: @TeX{} and @emph{@b{t@\'e@^{@dotless{i}}}@url{an_url}} @sc{and} @verb{!it is @verb!} @ a wo@-rd @!@@ @AE{}.
  C: An example of float caption@enddots{}
   An example.
   @example 
   example
   @end example
   
   @anchor{Anchor in caption}
   
   A table.
   @table @emph
   @item truc 
   line
   @end table
   
   A multitable.
   @multitable {truc} {bidule}
   @item truc @tab bidule
   @item truc @tab bidule
   @end multitable
   An index entry
   @cindex float example in caption
   
   An itemize.
   @itemize @minus
   @item truc 
   line
   @end itemize
   
   A ref.
   @xref{Top,xref Text with features caption}.
   A footnote.
   @footnote{footnote Text with features caption}.
   
   @TeX{} and @emph{@b{t@\'e@^{@dotless{i}}}@url{an_url}} @sc{and} @verb{!it is @verb!} @ a wo@-rd @!@@ @AE{}.
 F1.1: {float-with-a-lot-of-features-and-no-shortcaption}
  C: An example of float caption@enddots{} 2
   An example 2.
   @example 
   example 2
   @end example
   
   A table 2.
   @table @emph
   @item truc 2 
   line 2
   @end table
   
   A multitable 2.
   @multitable {truc} {bidule}
   @item truc 2 @tab bidule
   @item truc 2 @tab bidule
   @end multitable
   An index entry 2
   @cindex float example in caption 2
   
   An itemize 2.
   @itemize @minus
   @item truc 2
   line
   @end itemize
   
   @anchor{Anchor in caption 2}
   
   A ref 2.
   @xref{Top,xref Text with features caption}.
   A footnote 2.
   @footnote{footnote Text with features caption 2}.
   
   @TeX{} and @emph{@b{t@\'e@^{@dotless{i}}}@url{an_url}} @sc{and} @verb{!it is @verb!} @ a wo@-rd @!@@ @AE{}.
';

$result_nodes_list{'complex_float'} = '1|Top
 associated_section: Test floats
 associated_title_command: Test floats
 menus:
  chapter
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 A chapter
 associated_title_command: 1 A chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'complex_float'} = '1|Test floats
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->A chapter
 section_children:
  1|A chapter
2|A chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->Test floats
 toplevel_directions:
  prev->Test floats
  up->Test floats
';

$result_sectioning_root{'complex_float'} = 'level: -1
list:
 1|Test floats
';

$result_headings_list{'complex_float'} = '';

$result_indices_sort_strings{'complex_float'} = 'cp:
 float example
 float example in caption
 float example in caption 2
';


$result_converted{'plaintext'}->{'complex_float'} = 'Test floats
***********

A list of floats at the beginning.

* Menu:

* Text 1: text with a lot of features.   TeX and _téî<an_url>_ AND
                                         it is @verb  a word !@ Æ.
* Text 1.1: float with a lot of features and no shortcaption.
                                         An example of float caption...
                                         2 An example 2.

   After the listoffloats.

An example of float ...

An index entry

A table.
_truc_
     line

An itemize.
   − truc line

A ref.  See xref Text with features: Top.  A footnote.  (1).

TeX and _téî<an_url>_ AND it is @verb  a word !@ Æ.

Text 1: An example of float caption...  An example.
     example

A table.
_truc_
     line

A multitable.
truc   bidule
truc   bidule
An index entry

An itemize.
   − truc line

A ref.  See xref Text with features caption: Top.  A footnote.  (2).

TeX and _téî<an_url>_ AND it is @verb  a word !@ Æ.

   ---------- Footnotes ----------

   (1) footnote Text with features

   (2) footnote Text with features caption

1 A chapter
***********

Float text of a float with a lot of features.

Text 1.1: An example of float caption...  2 An example 2.
     example 2

A table 2.
_truc 2_
     line 2

A multitable 2.
truc   bidule
2
truc   bidule
2
An index entry 2

An itemize 2.
   − truc 2 line

A ref 2.  See xref Text with features caption: Top.  A footnote 2.  (1).

TeX and _téî<an_url>_ AND it is @verb  a word !@ Æ.

See Text 1: text with a lot of features.

   ---------- Footnotes ----------

   (1) footnote Text with features caption 2

';

$result_converted_sort_strings{'plaintext'}->{'complex_float'} = 'cp:
 float example
 float example in caption
 float example in caption 2
';


$result_converted{'html'}->{'complex_float'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Test floats</title>

<meta name="description" content="Test floats">
<meta name="keywords" content="Test floats">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
div.example {margin-left: 3.2em}
span:hover a.copiable-link {visibility: visible}
ul.mark-minus {list-style-type: "\\2212"}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">A chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="Test-floats"><span>Test floats<a class="copiable-link" href="#Test-floats"> &para;</a></span></h1>

<p>A list of floats at the beginning.
</p><dl class="listoffloats">
<dt><a href="#text-with-a-lot-of-features">Text 1</a></dt><dd class="shortcaption-in-listoffloats"><p>TeX and <em class="emph"><b class="b">t&eacute;&icirc;</b><a class="url" href="an_url">an_url</a></em> <small class="sc">AND</small> <code class="verb">it&nbsp;is&nbsp;@verb</code> &nbsp;a word !@ &AElig;.</p></dd>
<dt><a href="#float-with-a-lot-of-features-and-no-shortcaption">Text 1.1</a></dt><dd class="caption-in-listoffloats"><p>An example of float caption<small class="enddots">...</small> 2
An example 2.
</p><div class="example">
<pre class="example-preformatted">example 2
</pre></div>

<p>A table 2.
</p><dl class="table">
<dt><em class="emph">truc 2</em></dt>
<dd><p>line 2
</p></dd>
</dl>

<p>A multitable 2.
</p><table class="multitable">
<tbody><tr><td>truc 2</td><td>bidule</td></tr>
<tr><td>truc 2</td><td>bidule</td></tr>
</tbody>
</table>
<p>An index entry 2
</p>
<p>An itemize 2.
</p><ul class="itemize mark-minus">
<li>truc 2
line
</li></ul>


<p>A ref 2.
See <a class="xref" href="#Top">xref Text with features caption</a>.
A footnote 2.
<a class="footnote" id="t_flistoffloats_DOCF3_1" href="#t_flistoffloats_FOOT3_1"><sup>1</sup></a>.
</p>
<p>TeX and <em class="emph"><b class="b">t&eacute;&icirc;</b><a class="url" href="an_url">an_url</a></em> <small class="sc">AND</small> <code class="verb">it&nbsp;is&nbsp;@verb</code> &nbsp;a word !@ &AElig;.
</p></dd>
</dl>

<p>After the listoffloats.
</p>
<div class="float" id="text-with-a-lot-of-features">
<p>An example of float <small class="enddots">...</small>
</p>

<p>An index entry
<a class="index-entry-id" id="index-float-example"></a>
</p>
<p>A table.
</p><dl class="table">
<dt><em class="emph">truc</em></dt>
<dd><p>line
</p></dd>
</dl>

<p>An itemize.
</p><ul class="itemize mark-minus">
<li>truc 
line
</li></ul>

<p>A ref.
See <a class="xref" href="#Top">xref Text with features</a>.
A footnote.
<a class="footnote" id="DOCF1" href="#FOOT1"><sup>2</sup></a>.
</p>
<p>TeX and <em class="emph"><b class="b">t&eacute;&icirc;</b><a class="url" href="an_url">an_url</a></em> <small class="sc">AND</small> <code class="verb">it&nbsp;is&nbsp;@verb</code> &nbsp;a word !@ &AElig;.
</p>


<div class="caption"><p><strong class="strong">Text 1: </strong>An example of float caption<small class="enddots">...</small>
An example.
</p><div class="example">
<pre class="example-preformatted">example
</pre></div>

<a class="anchor" id="Anchor-in-caption"></a>
<p>A table.
</p><dl class="table">
<dt><em class="emph">truc</em></dt>
<dd><p>line
</p></dd>
</dl>

<p>A multitable.
</p><table class="multitable">
<tbody><tr><td>truc</td><td>bidule</td></tr>
<tr><td>truc</td><td>bidule</td></tr>
</tbody>
</table>
<p>An index entry
<a class="index-entry-id" id="index-float-example-in-caption"></a>
</p>
<p>An itemize.
</p><ul class="itemize mark-minus">
<li>truc 
line
</li></ul>

<p>A ref.
See <a class="xref" href="#Top">xref Text with features caption</a>.
A footnote.
<a class="footnote" id="DOCF2" href="#FOOT2"><sup>3</sup></a>.
</p>
<p>TeX and <em class="emph"><b class="b">t&eacute;&icirc;</b><a class="url" href="an_url">an_url</a></em> <small class="sc">AND</small> <code class="verb">it&nbsp;is&nbsp;@verb</code> &nbsp;a word !@ &AElig;.
</p></div></div>
<ul class="mini-toc">
<li><a href="#chapter" accesskey="1">A chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Test floats</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">Test floats</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="A-chapter"><span>1 A chapter<a class="copiable-link" href="#A-chapter"> &para;</a></span></h2>

<div class="float" id="float-with-a-lot-of-features-and-no-shortcaption">

<p>Float text of a float with a lot of features.
</p>

<div class="caption"><p><strong class="strong">Text 1.1: </strong>An example of float caption<small class="enddots">...</small> 2
An example 2.
</p><div class="example">
<pre class="example-preformatted">example 2
</pre></div>

<p>A table 2.
</p><dl class="table">
<dt><em class="emph">truc 2</em></dt>
<dd><p>line 2
</p></dd>
</dl>

<p>A multitable 2.
</p><table class="multitable">
<tbody><tr><td>truc 2</td><td>bidule</td></tr>
<tr><td>truc 2</td><td>bidule</td></tr>
</tbody>
</table>
<p>An index entry 2
<a class="index-entry-id" id="index-float-example-in-caption-2"></a>
</p>
<p>An itemize 2.
</p><ul class="itemize mark-minus">
<li>truc 2
line
</li></ul>

<a class="anchor" id="Anchor-in-caption-2"></a>
<p>A ref 2.
See <a class="xref" href="#Top">xref Text with features caption</a>.
A footnote 2.
<a class="footnote" id="DOCF3" href="#FOOT3"><sup>4</sup></a>.
</p>
<p>TeX and <em class="emph"><b class="b">t&eacute;&icirc;</b><a class="url" href="an_url">an_url</a></em> <small class="sc">AND</small> <code class="verb">it&nbsp;is&nbsp;@verb</code> &nbsp;a word !@ &AElig;.
</p></div></div>
<p>See <a class="xref" href="#text-with-a-lot-of-features">Text 1</a>.
</p>
</div>
</div>
<div class="footnotes-segment">
<hr>
<h4 class="footnotes-heading">Footnotes</h4>

<h5 class="footnote-body-heading"><a id="t_flistoffloats_FOOT3_1" href="#t_flistoffloats_DOCF3_1">(1)</a></h5>
<p>footnote Text with features caption 2</p>
<h5 class="footnote-body-heading"><a id="FOOT1" href="#DOCF1">(2)</a></h5>
<p>footnote Text with features</p>
<h5 class="footnote-body-heading"><a id="FOOT2" href="#DOCF2">(3)</a></h5>
<p>footnote Text with features caption</p>
<h5 class="footnote-body-heading"><a id="FOOT3" href="#DOCF3">(4)</a></h5>
<p>footnote Text with features caption 2</p>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'complex_float'} = 'cp:
 float example
 float example in caption
 float example in caption 2
';


$result_converted{'xml'}->{'complex_float'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> Test floats</sectiontitle>

<para>A list of floats at the beginning.
</para><listoffloats type="Text"> Text</listoffloats>

<para>After the listoffloats.
</para><menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chapter</menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<float identifier="text-with-a-lot-of-features" type="Text" number="1" endspaces=" "><floattype> Text</floattype><floatname> text with a lot of features</floatname>
<para>An example of float &enddots;
</para>
<!-- c makeinfo -docbook segfaults -->

<para>An index entry
<cindex index="cp"> <indexterm index="cp" number="1">float example</indexterm></cindex>
</para>
<para>A table.
</para><table commandarg="emph" endspaces=" ">
<tableentry><tableterm><item><itemformat command="emph"> truc </itemformat></item>
</tableterm><tableitem><para>line
</para></tableitem></tableentry></table>

<para>An itemize.
</para><itemize commandarg="minus" endspaces=" "><itemprepend> <formattingcommand command="minus"/></itemprepend>
<listitem><prepend>&minus;</prepend> <para>truc 
line
</para></listitem></itemize>

<para>A ref.
<xref label="Top"><xrefnodename>Top</xrefnodename><xrefinfoname>xref Text with features</xrefinfoname></xref>.
A footnote.
<footnote><para>footnote Text with features</para></footnote>.
</para>
<para>&tex; and <emph><b>t<accent type="acute" bracketed="off">e</accent><accent type="circ"><dotless>i</dotless></accent></b><url><urefurl>an_url</urefurl></url></emph> <sc>and</sc> <verb delimiter="!">it is @verb</verb> <spacecmd type="spc"/>a wo&hyphenbreak;rd &eosexcl;&arobase; &AElig;.
</para>
<caption> <para>An example of float caption&enddots;
An example.
</para><example endspaces=" "> 
<pre xml:space="preserve">example
</pre></example>

<anchor identifier="Anchor-in-caption">Anchor in caption</anchor>

<para>A table.
</para><table commandarg="emph" endspaces=" ">
<tableentry><tableterm><item><itemformat command="emph"> truc </itemformat></item>
</tableterm><tableitem><para>line
</para></tableitem></tableentry></table>

<para>A multitable.
</para><multitable endspaces=" "><columnprototypes> <columnprototype bracketed="on">truc</columnprototype> <columnprototype bracketed="on">bidule</columnprototype>
</columnprototypes>
<tbody><row><entry command="item"> <para>truc </para></entry><entry command="tab"> <para>bidule
</para></entry></row><row><entry command="item"> <para>truc </para></entry><entry command="tab"> <para>bidule
</para></entry></row></tbody></multitable>
<para>An index entry
<cindex index="cp"> <indexterm index="cp" number="2">float example in caption</indexterm></cindex>
</para>
<para>An itemize.
</para><itemize commandarg="minus" endspaces=" "><itemprepend> <formattingcommand command="minus"/></itemprepend>
<listitem><prepend>&minus;</prepend> <para>truc 
line
</para></listitem></itemize>

<para>A ref.
<xref label="Top"><xrefnodename>Top</xrefnodename><xrefinfoname>xref Text with features caption</xrefinfoname></xref>.
A footnote.
<footnote><para>footnote Text with features caption</para></footnote>.
</para>
<para>&tex; and <emph><b>t<accent type="acute" bracketed="off">e</accent><accent type="circ"><dotless>i</dotless></accent></b><url><urefurl>an_url</urefurl></url></emph> <sc>and</sc> <verb delimiter="!">it is @verb</verb> <spacecmd type="spc"/>a wo&hyphenbreak;rd &eosexcl;&arobase; &AElig;.
</para></caption>

<shortcaption><para>&tex; and <emph><b>t<accent type="acute" bracketed="off">e</accent><accent type="circ"><dotless>i</dotless></accent></b><url><urefurl>an_url</urefurl></url></emph> <sc>and</sc> <verb delimiter="!">it is @verb</verb> <spacecmd type="spc"/>a wo&hyphenbreak;rd &eosexcl;&arobase; &AElig;.</para></shortcaption>

</float>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> A chapter</sectiontitle>

<float identifier="float-with-a-lot-of-features-and-no-shortcaption" type="Text" number="1.1" endspaces=" "><floattype> Text</floattype><floatname> float with a lot of features and no shortcaption</floatname>

<para>Float text of a float with a lot of features.
</para>
<caption> <para>An example of float caption&enddots; 2
An example 2.
</para><example endspaces=" "> 
<pre xml:space="preserve">example 2
</pre></example>

<para>A table 2.
</para><table commandarg="emph" endspaces=" ">
<tableentry><tableterm><item><itemformat command="emph"> truc 2 </itemformat></item>
</tableterm><tableitem><para>line 2
</para></tableitem></tableentry></table>

<para>A multitable 2.
</para><multitable endspaces=" "><columnprototypes> <columnprototype bracketed="on">truc</columnprototype> <columnprototype bracketed="on">bidule</columnprototype>
</columnprototypes>
<tbody><row><entry command="item"> <para>truc 2 </para></entry><entry command="tab"> <para>bidule
</para></entry></row><row><entry command="item"> <para>truc 2 </para></entry><entry command="tab"> <para>bidule
</para></entry></row></tbody></multitable>
<para>An index entry 2
<cindex index="cp"> <indexterm index="cp" number="3">float example in caption 2</indexterm></cindex>
</para>
<para>An itemize 2.
</para><itemize commandarg="minus" endspaces=" "><itemprepend> <formattingcommand command="minus"/></itemprepend>
<listitem><prepend>&minus;</prepend> <para>truc 2
line
</para></listitem></itemize>

<anchor identifier="Anchor-in-caption-2">Anchor in caption 2</anchor>

<para>A ref 2.
<xref label="Top"><xrefnodename>Top</xrefnodename><xrefinfoname>xref Text with features caption</xrefinfoname></xref>.
A footnote 2.
<footnote><para>footnote Text with features caption 2</para></footnote>.
</para>
<para>&tex; and <emph><b>t<accent type="acute" bracketed="off">e</accent><accent type="circ"><dotless>i</dotless></accent></b><url><urefurl>an_url</urefurl></url></emph> <sc>and</sc> <verb delimiter="!">it is @verb</verb> <spacecmd type="spc"/>a wo&hyphenbreak;rd &eosexcl;&arobase; &AElig;.
</para></caption>

</float>

<para><xref label="text-with-a-lot-of-features"><xrefnodename>text with a lot of features</xrefnodename></xref>.
</para>
</chapter>
';


$result_converted{'latex'}->{'complex_float'} = '\\documentclass{book}
\\usepackage{amsfonts}
\\usepackage{amsmath}
\\usepackage[gen]{eurosym}
\\usepackage{textcomp}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
% This is used to provide a default no-operation \'keyval\' definition
% of the "alt" key in the "Gin" ("Graphics Inclusion") family used
% by graphicx.  This prevents an "alt" attribute generating an error in
% older versions of graphicx.
\\makeatletter
\\providecommand\\KV@Gin@alt{}
\\makeatother
\\usepackage{graphicx}
\\usepackage{etoolbox}
\\usepackage{titleps}
\\usepackage{imakeidx}
\\usepackage{array}
\\usepackage{enumitem}
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\hypersetup{pdftitle={Test floats}}

\\makeatletter
\\newcommand{\\Texinfothechapterheading}{}
\\newtitlemark{\\Texinfothechapterheading}%
\\newcommand{\\Texinfoheadingchaptername}{\\chaptername}
\\newtitlemark{\\Texinfoheadingchaptername}%
\\newcommand{\\Texinfosettitle}{No Title}%

\\newcommand{\\Texinfounnumberedchapter}[1]{\\chapter*{#1}
\\addcontentsline{toc}{chapter}{\\protect\\textbf{#1}}%
\\renewcommand{\\Texinfothechapterheading}{}%
\\chaptermark{#1}%
}%

\\newcommand{\\Texinfounnumberedpart}[1]{\\part*{#1}
\\addcontentsline{toc}{part}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsection}[1]{\\section*{#1}
\\addcontentsline{toc}{section}{\\protect\\textbf{#1}}%
\\sectionmark{#1}%
}%

\\newcommand{\\Texinfounnumberedsubsection}[1]{\\subsection*{#1}
\\addcontentsline{toc}{subsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfounnumberedsubsubsection}[1]{\\subsubsection*{#1}
\\addcontentsline{toc}{subsubsection}{\\protect\\textbf{#1}}%
}%

\\newcommand{\\Texinfochapter}[1]{\\chapter{#1}
\\renewcommand{\\Texinfothechapterheading}{\\Texinfoheadingchaptername{} \\thechapter{} }%
}%

% new float for type `Text\'
\\newfloat{TexinfoFloatText}{htb}{tfl}[chapter]
\\floatname{TexinfoFloatText}{Text}
% no index headers
\\indexsetup{level=\\relax,toclevel=section}%
\\makeindex[name=cp,title=]%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}


% set defaults for lists that match Texinfo TeX formatting
\\setlist[description]{style=nextline, font=\\normalfont}
\\setlist[itemize]{label=\\textbullet}

% used for substitutions in commands
\\newcommand{\\Texinfoplaceholder}[1]{}

\\newpagestyle{single}{\\sethead[\\Texinfothechapterheading{}\\chaptertitle{}][][\\thepage]
                              {\\Texinfothechapterheading{}\\chaptertitle{}}{}{\\thepage}}

% allow line breaking at underscore
\\let\\Texinfounderscore\\_
\\renewcommand{\\_}{\\Texinfounderscore\\discretionary{}{}{}}
\\renewcommand{\\includegraphics}[1]{\\fbox{FIG \\detokenize{#1}}}

\\makeatother
% set default for @setchapternewpage
\\makeatletter
\\patchcmd{\\chapter}{\\if@openright\\cleardoublepage\\else\\clearpage\\fi}{\\Texinfoplaceholder{setchapternewpage placeholder}\\clearpage}{}{}
\\makeatother
\\pagestyle{single}%

\\begin{document}
\\label{anchor:Top}%
\\label{anchor:text-with-a-lot-of-features}%
\\Texinfochapter{{A chapter}}
\\label{anchor:chapter}%

\\begin{TexinfoFloatText}

Float text of a float with a lot of features.

\\caption{An example of float caption\\dots{} 2
An example 2.
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily example 2
\\end{Texinfopreformatted}
\\end{Texinfoindented}

A table 2.
\\begin{description}
\\item[{\\parbox[b]{\\linewidth}{%
\\emph{truc 2}}}]
line 2
\\end{description}

A multitable 2.
\\begin{tabular}{m{0.4\\textwidth} m{0.6\\textwidth}}%
truc 2 &bidule\\\\
truc 2 &bidule\\\\
\\end{tabular}%
An index entry 2
\\index[cp]{float example in caption 2@float example in caption 2}%

An itemize 2.
\\begin{itemize}[label=-]
\\item truc 2
line
\\end{itemize}

\\label{anchor:Anchor-in-caption-2}%

A ref 2.
See \\hyperref[anchor:Top]{\\chaptername~\\ref*{anchor:Top} [Top], page~\\pageref*{anchor:Top}}.
A footnote 2.
\\footnote{footnote Text with features caption 2}.

\\TeX{} and \\emph{\\textbf{t\\\'{e}\\^{\\i{}}}\\url{an_url}} \\textsc{and} \\verb!it is @verb! \\ {}a wo\\-{}rd \\@!@ \\AE{}.
}

\\label{anchor:float-with-a-lot-of-features-and-no-shortcaption}%
\\end{TexinfoFloatText}

See \\hyperref[anchor:text-with-a-lot-of-features]{Text~\\ref*{anchor:text-with-a-lot-of-features}}.

\\end{document}
';

1;
