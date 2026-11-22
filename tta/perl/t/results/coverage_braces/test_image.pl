use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_image'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content C4
   *normal_command@macro C5 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{files-char}
    *arguments_line C1
     {macro_line: files-char\\n}
    {raw:@image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,,,,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}\\n}
    {raw:\\n}
    {raw:In text @image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,1in, 1cm, alt @b{@^{@dotless{i}}--le@/.@.}  a@*<"%@@@verb{:  < & @ % " :}  ,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}.\\n}
    *normal_command@end C1 l5
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@copying C5 l7
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C3
     {normal_text:Text in copying.\\n}
     >SOURCEMARKS
     >macro_expansion<start;1><p:17>
      >*macro_call@files-char C1
       >*brace_arg
     *normal_command@image C5 l9:@files-char
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C12
       {normal_text:f}
       *normal_command@@
       {normal_text:i--le}
       *normal_command@/
       {normal_text:.}
       *normal_command@.
       {normal_text:  a}
       *normal_command@@
       {normal_text:<"%}
       *normal_command@@
       *normal_command@verb C1 l9:@files-char
        *brace_container C3
         {verb_delimiter::}
         {raw:  < & @ % " }
         {verb_delimiter::}
       {spaces_after_argument: }
      *brace_arg
      *brace_arg
      *brace_arg
      *brace_arg C11
       {normal_text:.ext}
       *normal_command@@
       {normal_text:i--le}
       *normal_command@/
       {normal_text:.}
       *normal_command@.
       {normal_text:  a}
       *normal_command@@
       {normal_text:<"%}
       *normal_command@@
       *normal_command@verb C1 l9:@files-char
        *brace_container C3
         {verb_delimiter::}
         {raw:  < & @ % " }
         {verb_delimiter::}
     {normal_text:\\n}
    {empty_line:\\n}
    *paragraph C3
     {normal_text:In text }
     *normal_command@image C5 l9:@files-char
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C12
       {normal_text:f}
       *normal_command@@
       {normal_text:i--le}
       *normal_command@/
       {normal_text:.}
       *normal_command@.
       {normal_text:  a}
       *normal_command@@
       {normal_text:<"%}
       *normal_command@@
       *normal_command@verb C1 l9:@files-char
        *brace_container C3
         {verb_delimiter::}
         {raw:  < & @ % " }
         {verb_delimiter::}
       {spaces_after_argument: }
      *brace_arg C1
       {normal_text:1in}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:1cm}
      *brace_arg C9
       {spaces_before_argument: }
       {normal_text:alt }
       *normal_command@b C1 l9:@files-char
        *brace_container C5
         *normal_command@^ C1 l9:@files-char
          *brace_container C1
           *normal_command@dotless C1 l9:@files-char
            *brace_container C1
             {normal_text:i}
         {normal_text:--le}
         *normal_command@/
         {normal_text:.}
         *normal_command@.
       {normal_text:  a}
       *normal_command@*
       {normal_text:<"%}
       *normal_command@@
       *normal_command@verb C1 l9:@files-char
        *brace_container C3
         {verb_delimiter::}
         {raw:  < & @ % " }
         {verb_delimiter::}
       {spaces_after_argument:  }
      *brace_arg C11
       {normal_text:.ext}
       *normal_command@@
       {normal_text:i--le}
       *normal_command@/
       {normal_text:.}
       *normal_command@.
       {normal_text:  a}
       *normal_command@@
       {normal_text:<"%}
       *normal_command@@
       *normal_command@verb C1 l9:@files-char
        *brace_container C3
         {verb_delimiter::}
         {raw:  < & @ % " }
         {verb_delimiter::}
     {normal_text:.\\n}
     >SOURCEMARKS
     >macro_expansion<end;1><p:1>
    *normal_command@end C1 l10
    |EXTRA
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l12 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C16 l13 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;2><p:1>
   >*macro_call@files-char C1
    >*brace_arg
  *normal_command@image C5 l15:@files-char
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C12
    {normal_text:f}
    *normal_command@@
    {normal_text:i--le}
    *normal_command@/
    {normal_text:.}
    *normal_command@.
    {normal_text:  a}
    *normal_command@@
    {normal_text:<"%}
    *normal_command@@
    *normal_command@verb C1 l15:@files-char
     *brace_container C3
      {verb_delimiter::}
      {raw:  < & @ % " }
      {verb_delimiter::}
    {spaces_after_argument: }
   *brace_arg
   *brace_arg
   *brace_arg
   *brace_arg C11
    {normal_text:.ext}
    *normal_command@@
    {normal_text:i--le}
    *normal_command@/
    {normal_text:.}
    *normal_command@.
    {normal_text:  a}
    *normal_command@@
    {normal_text:<"%}
    *normal_command@@
    *normal_command@verb C1 l15:@files-char
     *brace_container C3
      {verb_delimiter::}
      {raw:  < & @ % " }
      {verb_delimiter::}
  {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:In text }
   *normal_command@image C5 l15:@files-char
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C12
     {normal_text:f}
     *normal_command@@
     {normal_text:i--le}
     *normal_command@/
     {normal_text:.}
     *normal_command@.
     {normal_text:  a}
     *normal_command@@
     {normal_text:<"%}
     *normal_command@@
     *normal_command@verb C1 l15:@files-char
      *brace_container C3
       {verb_delimiter::}
       {raw:  < & @ % " }
       {verb_delimiter::}
     {spaces_after_argument: }
    *brace_arg C1
     {normal_text:1in}
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:1cm}
    *brace_arg C9
     {spaces_before_argument: }
     {normal_text:alt }
     *normal_command@b C1 l15:@files-char
      *brace_container C5
       *normal_command@^ C1 l15:@files-char
        *brace_container C1
         *normal_command@dotless C1 l15:@files-char
          *brace_container C1
           {normal_text:i}
       {normal_text:--le}
       *normal_command@/
       {normal_text:.}
       *normal_command@.
     {normal_text:  a}
     *normal_command@*
     {normal_text:<"%}
     *normal_command@@
     *normal_command@verb C1 l15:@files-char
      *brace_container C3
       {verb_delimiter::}
       {raw:  < & @ % " }
       {verb_delimiter::}
     {spaces_after_argument:  }
    *brace_arg C11
     {normal_text:.ext}
     *normal_command@@
     {normal_text:i--le}
     *normal_command@/
     {normal_text:.}
     *normal_command@.
     {normal_text:  a}
     *normal_command@@
     {normal_text:<"%}
     *normal_command@@
     *normal_command@verb C1 l15:@files-char
      *brace_container C3
       {verb_delimiter::}
       {raw:  < & @ % " }
       {verb_delimiter::}
   {normal_text:.\\n}
   >SOURCEMARKS
   >macro_expansion<end;2><p:1>
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Insertcopying\\n}
  *normal_command@insertcopying C1 l18
  |EXTRA
  |global_command_number:{1}
   *line_arg C1
    {spaces_before_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l20
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C7
    {normal_text:}
    >SOURCEMARKS
    >macro_expansion<start;3>
     >*macro_call@files-char C1
      >*brace_arg
    *normal_command@image C5 l21:@files-char
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C12
      {normal_text:f}
      *normal_command@@
      {normal_text:i--le}
      *normal_command@/
      {normal_text:.}
      *normal_command@.
      {normal_text:  a}
      *normal_command@@
      {normal_text:<"%}
      *normal_command@@
      *normal_command@verb C1 l21:@files-char
       *brace_container C3
        {verb_delimiter::}
        {raw:  < & @ % " }
        {verb_delimiter::}
      {spaces_after_argument: }
     *brace_arg
     *brace_arg
     *brace_arg
     *brace_arg C11
      {normal_text:.ext}
      *normal_command@@
      {normal_text:i--le}
      *normal_command@/
      {normal_text:.}
      *normal_command@.
      {normal_text:  a}
      *normal_command@@
      {normal_text:<"%}
      *normal_command@@
      *normal_command@verb C1 l21:@files-char
       *brace_container C3
        {verb_delimiter::}
        {raw:  < & @ % " }
        {verb_delimiter::}
    {normal_text:\\n}
    {empty_line:\\n}
    {normal_text:In text }
    *normal_command@image C5 l21:@files-char
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C12
      {normal_text:f}
      *normal_command@@
      {normal_text:i--le}
      *normal_command@/
      {normal_text:.}
      *normal_command@.
      {normal_text:  a}
      *normal_command@@
      {normal_text:<"%}
      *normal_command@@
      *normal_command@verb C1 l21:@files-char
       *brace_container C3
        {verb_delimiter::}
        {raw:  < & @ % " }
        {verb_delimiter::}
      {spaces_after_argument: }
     *brace_arg C1
      {normal_text:1in}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:1cm}
     *brace_arg C9
      {spaces_before_argument: }
      {normal_text:alt }
      *normal_command@b C1 l21:@files-char
       *brace_container C5
        *normal_command@^ C1 l21:@files-char
         *brace_container C1
          *normal_command@dotless C1 l21:@files-char
           *brace_container C1
            {normal_text:i}
        {normal_text:--le}
        *normal_command@/
        {normal_text:.}
        *normal_command@.
      {normal_text:  a}
      *normal_command@*
      {normal_text:<"%}
      *normal_command@@
      *normal_command@verb C1 l21:@files-char
       *brace_container C3
        {verb_delimiter::}
        {raw:  < & @ % " }
        {verb_delimiter::}
      {spaces_after_argument:  }
     *brace_arg C11
      {normal_text:.ext}
      *normal_command@@
      {normal_text:i--le}
      *normal_command@/
      {normal_text:.}
      *normal_command@.
      {normal_text:  a}
      *normal_command@@
      {normal_text:<"%}
      *normal_command@@
      *normal_command@verb C1 l21:@files-char
       *brace_container C3
        {verb_delimiter::}
        {raw:  < & @ % " }
        {verb_delimiter::}
    {normal_text:.\\n}
    >SOURCEMARKS
    >macro_expansion<end;3><p:1>
   *normal_command@end C1 l22
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C9 l24
  |EXTRA
  |float_number:{1}
  |float_type:{Image}
  |global_command_number:{1}
  |identifier:{Image-with-commands}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:Image}
    *block_line_arg C3
    >SOURCEMARKS
    >macro_expansion<start;4>
     >*macro_call@files-char C1
      >*brace_arg
     {spaces_before_argument: }
     {normal_text:Image with commands}
     {spaces_after_argument:\\n}
   *normal_command@image C5 l25:@files-char
   |EXTRA
   |input_encoding_name:{utf-8}
    *brace_arg C12
     {normal_text:f}
     *normal_command@@
     {normal_text:i--le}
     *normal_command@/
     {normal_text:.}
     *normal_command@.
     {normal_text:  a}
     *normal_command@@
     {normal_text:<"%}
     *normal_command@@
     *normal_command@verb C1 l25:@files-char
      *brace_container C3
       {verb_delimiter::}
       {raw:  < & @ % " }
       {verb_delimiter::}
     {spaces_after_argument: }
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C11
     {normal_text:.ext}
     *normal_command@@
     {normal_text:i--le}
     *normal_command@/
     {normal_text:.}
     *normal_command@.
     {normal_text:  a}
     *normal_command@@
     {normal_text:<"%}
     *normal_command@@
     *normal_command@verb C1 l25:@files-char
      *brace_container C3
       {verb_delimiter::}
       {raw:  < & @ % " }
       {verb_delimiter::}
   {normal_text:\\n}
   {empty_line:\\n}
   *paragraph C3
    {normal_text:In text }
    *normal_command@image C5 l25:@files-char
    |EXTRA
    |input_encoding_name:{utf-8}
     *brace_arg C12
      {normal_text:f}
      *normal_command@@
      {normal_text:i--le}
      *normal_command@/
      {normal_text:.}
      *normal_command@.
      {normal_text:  a}
      *normal_command@@
      {normal_text:<"%}
      *normal_command@@
      *normal_command@verb C1 l25:@files-char
       *brace_container C3
        {verb_delimiter::}
        {raw:  < & @ % " }
        {verb_delimiter::}
      {spaces_after_argument: }
     *brace_arg C1
      {normal_text:1in}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:1cm}
     *brace_arg C9
      {spaces_before_argument: }
      {normal_text:alt }
      *normal_command@b C1 l25:@files-char
       *brace_container C5
        *normal_command@^ C1 l25:@files-char
         *brace_container C1
          *normal_command@dotless C1 l25:@files-char
           *brace_container C1
            {normal_text:i}
        {normal_text:--le}
        *normal_command@/
        {normal_text:.}
        *normal_command@.
      {normal_text:  a}
      *normal_command@*
      {normal_text:<"%}
      *normal_command@@
      *normal_command@verb C1 l25:@files-char
       *brace_container C3
        {verb_delimiter::}
        {raw:  < & @ % " }
        {verb_delimiter::}
      {spaces_after_argument:  }
     *brace_arg C11
      {normal_text:.ext}
      *normal_command@@
      {normal_text:i--le}
      *normal_command@/
      {normal_text:.}
      *normal_command@.
      {normal_text:  a}
      *normal_command@@
      {normal_text:<"%}
      *normal_command@@
      *normal_command@verb C1 l25:@files-char
       *brace_container C3
        {verb_delimiter::}
        {raw:  < & @ % " }
        {verb_delimiter::}
    {normal_text:.\\n}
    >SOURCEMARKS
    >macro_expansion<end;4><p:1>
   {empty_line:\\n}
   *normal_command@caption C1 l27
    *brace_command_context C5
     {normal_text:}
     >SOURCEMARKS
     >macro_expansion<start;5>
      >*macro_call@files-char C1
       >*brace_arg
     *normal_command@image C5 l27:@files-char
     |EXTRA
     |input_encoding_name:{utf-8}
      *brace_arg C12
       {normal_text:f}
       *normal_command@@
       {normal_text:i--le}
       *normal_command@/
       {normal_text:.}
       *normal_command@.
       {normal_text:  a}
       *normal_command@@
       {normal_text:<"%}
       *normal_command@@
       *normal_command@verb C1 l27:@files-char
        *brace_container C3
         {verb_delimiter::}
         {raw:  < & @ % " }
         {verb_delimiter::}
       {spaces_after_argument: }
      *brace_arg
      *brace_arg
      *brace_arg
      *brace_arg C11
       {normal_text:.ext}
       *normal_command@@
       {normal_text:i--le}
       *normal_command@/
       {normal_text:.}
       *normal_command@.
       {normal_text:  a}
       *normal_command@@
       {normal_text:<"%}
       *normal_command@@
       *normal_command@verb C1 l27:@files-char
        *brace_container C3
         {verb_delimiter::}
         {raw:  < & @ % " }
         {verb_delimiter::}
     {normal_text:\\n}
     {empty_line:\\n}
     *paragraph C3
      {normal_text:In text }
      *normal_command@image C5 l27:@files-char
      |EXTRA
      |input_encoding_name:{utf-8}
       *brace_arg C12
        {normal_text:f}
        *normal_command@@
        {normal_text:i--le}
        *normal_command@/
        {normal_text:.}
        *normal_command@.
        {normal_text:  a}
        *normal_command@@
        {normal_text:<"%}
        *normal_command@@
        *normal_command@verb C1 l27:@files-char
         *brace_container C3
          {verb_delimiter::}
          {raw:  < & @ % " }
          {verb_delimiter::}
        {spaces_after_argument: }
       *brace_arg C1
        {normal_text:1in}
       *brace_arg C2
        {spaces_before_argument: }
        {normal_text:1cm}
       *brace_arg C9
        {spaces_before_argument: }
        {normal_text:alt }
        *normal_command@b C1 l27:@files-char
         *brace_container C5
          *normal_command@^ C1 l27:@files-char
           *brace_container C1
            *normal_command@dotless C1 l27:@files-char
             *brace_container C1
              {normal_text:i}
          {normal_text:--le}
          *normal_command@/
          {normal_text:.}
          *normal_command@.
        {normal_text:  a}
        *normal_command@*
        {normal_text:<"%}
        *normal_command@@
        *normal_command@verb C1 l27:@files-char
         *brace_container C3
          {verb_delimiter::}
          {raw:  < & @ % " }
          {verb_delimiter::}
        {spaces_after_argument:  }
       *brace_arg C11
        {normal_text:.ext}
        *normal_command@@
        {normal_text:i--le}
        *normal_command@/
        {normal_text:.}
        *normal_command@.
        {normal_text:  a}
        *normal_command@@
        {normal_text:<"%}
        *normal_command@@
        *normal_command@verb C1 l27:@files-char
         *brace_container C3
          {verb_delimiter::}
          {raw:  < & @ % " }
          {verb_delimiter::}
      {normal_text:.}
      >SOURCEMARKS
      >macro_expansion<end;5><p:1>
   {spaces_after_close_brace:\\n}
   *normal_command@end C1 l28
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@listoffloats C1 l30
  |EXTRA
  |float_type:{Image}
  |global_command_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Image}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'test_image'} = '@macro files-char
@image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,,,,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}

In text @image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,1in, 1cm, alt @b{@^{@dotless{i}}--le@/.@.}  a@*<"%@@@verb{:  < & @ % " :}  ,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}.
@end macro

@copying
Text in copying.
@image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,,,,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}

In text @image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,1in, 1cm, alt @b{@^{@dotless{i}}--le@/.@.}  a@*<"%@@@verb{:  < & @ % " :}  ,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}.
@end copying

@node Top
@node chapter

@image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,,,,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}

In text @image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,1in, 1cm, alt @b{@^{@dotless{i}}--le@/.@.}  a@*<"%@@@verb{:  < & @ % " :}  ,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}.

Insertcopying
@insertcopying

@example
@image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,,,,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}

In text @image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,1in, 1cm, alt @b{@^{@dotless{i}}--le@/.@.}  a@*<"%@@@verb{:  < & @ % " :}  ,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}.
@end example

@float Image, Image with commands
@image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,,,,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}

In text @image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,1in, 1cm, alt @b{@^{@dotless{i}}--le@/.@.}  a@*<"%@@@verb{:  < & @ % " :}  ,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}.

@caption{@image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,,,,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}

In text @image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,1in, 1cm, alt @b{@^{@dotless{i}}--le@/.@.}  a@*<"%@@@verb{:  < & @ % " :}  ,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}.}
@end float

@listoffloats Image

';


$result_texts{'test_image'} = '


f@i--le..  a@<"%@  < & @ % " 

In text f@i--le..  a@<"%@  < & @ % " .

Insertcopying

f@i--le..  a@<"%@  < & @ % " 

In text f@i--le..  a@<"%@  < & @ % " .

Image, Image with commands
f@i--le..  a@<"%@  < & @ % " 

In text f@i--le..  a@<"%@  < & @ % " .



';

$result_errors{'test_image'} = '* W l9:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l9:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l9:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l9:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l9:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l15:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l15:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l15:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l15:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l15:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l21:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l21:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l21:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l21:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l21:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l25:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l25:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l25:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l25:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l25:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l27:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l27:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l27:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l27:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l27:@files-char|@verb should not appear anywhere inside @image
 warning: @verb should not appear anywhere inside @image (possibly involving @files-char)

* W l13|node `chapter\' not in menu
 warning: node `chapter\' not in menu

';

$result_floats{'test_image'} = 'Image: 1
 F1: {Image-with-commands}
  C: @image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,,,,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}
   
   In text @image{f@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :} ,1in, 1cm, alt @b{@^{@dotless{i}}--le@/.@.}  a@*<"%@@@verb{:  < & @ % " :}  ,.ext@@i--le@/.@.  a@@<"%@@@verb{:  < & @ % " :}}.
';

$result_nodes_list{'test_image'} = '1|Top
 node_directions:
  next->chapter
2|chapter
 node_directions:
  prev->Top
';

$result_sections_list{'test_image'} = '';

$result_sectioning_root{'test_image'} = '';

$result_headings_list{'test_image'} = '';


$result_converted{'html'}->{'test_image'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- Text in copying.
f@i-le..  a@<"%@  < & @ % " 

In text f@i-le..  a@<"%@  < & @ % " . -->
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
div.example {margin-left: 3.2em}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>


<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chapter" accesskey="n" rel="next">chapter</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<a class="node-id" id="chapter"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h4 class="node"><span>chapter<a class="copiable-link" href="#chapter"> &para;</a></span></h4>

<img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="f@i--le..  a@&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">

<p>In text <img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="alt &icirc;&ndash;le..  a
&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">.
</p>
<p>Insertcopying
</p><p>Text in copying.
<img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="f@i--le..  a@&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">
</p>
<p>In text <img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="alt &icirc;&ndash;le..  a
&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">.
</p>
<div class="example">
<pre class="example-preformatted"><img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="f@i--le..  a@&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">

In text <img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="alt &icirc;&ndash;le..  a
&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">.
</pre></div>

<div class="float" id="Image-with-commands">
<img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="f@i--le..  a@&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">

<p>In text <img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="alt &icirc;&ndash;le..  a
&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">.
</p>
<div class="caption"><img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="f@i--le..  a@&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">

<p><strong class="strong">Image 1: </strong>In text <img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="alt &icirc;&ndash;le..  a
&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">.</p></div></div>
<dl class="listoffloats">
<dt><a href="#Image-with-commands">Image 1</a></dt><dd class="caption-in-listoffloats"><img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="f@i--le..  a@&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">

<p>In text <img class="image" src="f%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20.ext%40i--le..%20%20a%40%3c%22%25%40%20%20%3c%20%26%20%40%20%25%20%22%20" alt="alt &icirc;&ndash;le..  a
&lt;&quot;%@&nbsp;&nbsp;&lt;&nbsp;&amp;&nbsp;@&nbsp;%&nbsp;&quot;&nbsp;">.</p></dd>
</dl>




</body>
</html>
';

$result_converted_errors{'html'}->{'test_image'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

* W l15:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

* W l15:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

* W l9:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

* W l9:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

* W l21:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

* W l21:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

* W l25:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

* W l25:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

* W l27:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

* W l27:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

* W l27:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

* W l27:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for HTML) not found, using `f@i--le..  a@<"%@  < & @ % " .ext@i--le..  a@<"%@  < & @ % " \' (possibly involving @files-char)

';


$result_converted{'plaintext'}->{'test_image'} = '[f@i--le..  a@<"%@  < & @ % " ]

In text [alt î-le..  a
<"%@  < & @ % " ].

   Insertcopying
   Text in copying.  [f@i--le..  a@<"%@  < & @ % " ]

   In text [alt î-le..  a
<"%@  < & @ % " ].

     [f@i--le..  a@<"%@  < & @ % " ]

     In text [alt î-le..  a
<"%@  < & @ % " ].

[f@i--le..  a@<"%@  < & @ % " ]

In text [alt î-le..  a
<"%@  < & @ % " ].

Image 1: [f@i--le..  a@<"%@  < & @ % " ]

In text [alt î-le..  a
<"%@  < & @ % " ].

* Menu:

* Image 1: Image with commands.          

';

$result_converted_errors{'plaintext'}->{'test_image'} = '* W l15:@files-char|could not find @image file `f@i--le..  a@<"%@  < & @ % " .txt\' nor alternate text
 warning: could not find @image file `f@i--le..  a@<"%@  < & @ % " .txt\' nor alternate text (possibly involving @files-char)

* W l9:@files-char|could not find @image file `f@i--le..  a@<"%@  < & @ % " .txt\' nor alternate text
 warning: could not find @image file `f@i--le..  a@<"%@  < & @ % " .txt\' nor alternate text (possibly involving @files-char)

* W l21:@files-char|could not find @image file `f@i--le..  a@<"%@  < & @ % " .txt\' nor alternate text
 warning: could not find @image file `f@i--le..  a@<"%@  < & @ % " .txt\' nor alternate text (possibly involving @files-char)

* W l25:@files-char|could not find @image file `f@i--le..  a@<"%@  < & @ % " .txt\' nor alternate text
 warning: could not find @image file `f@i--le..  a@<"%@  < & @ % " .txt\' nor alternate text (possibly involving @files-char)

* W l27:@files-char|could not find @image file `f@i--le..  a@<"%@  < & @ % " .txt\' nor alternate text
 warning: could not find @image file `f@i--le..  a@<"%@  < & @ % " .txt\' nor alternate text (possibly involving @files-char)

';


$result_converted{'latex_text'}->{'test_image'} = '

\\begin{document}
\\label{anchor:Top}%
\\label{anchor:chapter}%

\\includegraphics{f@i--le..  a@<"%@  < & @ % " }

In text \\includegraphics[width=1in,height=1cm,alt={alt î-le..  a
<"\\%@  < \\& @ \\% " }]{f@i--le..  a@<"%@  < & @ % " }.

Insertcopying
Text in copying.
\\includegraphics{f@i--le..  a@<"%@  < & @ % " }

In text \\includegraphics[width=1in,height=1cm,alt={alt î-le..  a
<"\\%@  < \\& @ \\% " }]{f@i--le..  a@<"%@  < & @ % " }.

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\includegraphics{f@i--le..  a@<"%@  < & @ % " }

In text \\includegraphics[width=1in,height=1cm,alt={alt î-le..  a
<"\\%@  < \\& @ \\% " }]{f@i--le..  a@<"%@  < & @ % " }.
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\begin{TexinfoFloatImage}
\\includegraphics{f@i--le..  a@<"%@  < & @ % " }

In text \\includegraphics[width=1in,height=1cm,alt={alt î-le..  a
<"\\%@  < \\& @ \\% " }]{f@i--le..  a@<"%@  < & @ % " }.

\\caption{\\includegraphics{f@i--le..  a@<"%@  < & @ % " }

In text \\includegraphics[width=1in,height=1cm,alt={alt î-le..  a
<"\\%@  < \\& @ \\% " }]{f@i--le..  a@<"%@  < & @ % " }.}
\\label{anchor:Image-with-commands}%
\\end{TexinfoFloatImage}

\\listof{TexinfoFloatImage}{}

';

$result_converted_errors{'latex_text'}->{'test_image'} = '* W l15:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found (possibly involving @files-char)

* W l15:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found (possibly involving @files-char)

* W l9:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found (possibly involving @files-char)

* W l9:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found (possibly involving @files-char)

* W l21:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found (possibly involving @files-char)

* W l21:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found (possibly involving @files-char)

* W l25:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found (possibly involving @files-char)

* W l25:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found (possibly involving @files-char)

* W l27:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found (possibly involving @files-char)

* W l27:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' (for LaTeX) not found (possibly involving @files-char)

';


$result_converted{'docbook'}->{'test_image'} = '<anchor id="chapter"/>

<informalfigure><mediaobject><imageobject><imagedata fileref="f@i--le..  a@&lt;&quot;%@  &lt; &amp; @ % &quot; .jpg" format="JPG"></imagedata></imageobject></mediaobject></informalfigure>

<para>In text <inlinemediaobject><imageobject><imagedata fileref="f@i--le..  a@&lt;&quot;%@  &lt; &amp; @ % &quot; .jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>.
</para>
<para>Insertcopying
</para><para>Text in copying.
<inlinemediaobject><imageobject><imagedata fileref="f@i--le..  a@&lt;&quot;%@  &lt; &amp; @ % &quot; .jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>
</para>
<para>In text <inlinemediaobject><imageobject><imagedata fileref="f@i--le..  a@&lt;&quot;%@  &lt; &amp; @ % &quot; .jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>.
</para>
<screen><inlinemediaobject><imageobject><imagedata fileref="f@i--le..  a@&lt;&quot;%@  &lt; &amp; @ % &quot; .jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>

In text <inlinemediaobject><imageobject><imagedata fileref="f@i--le..  a@&lt;&quot;%@  &lt; &amp; @ % &quot; .jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>.
</screen>
<anchor id="Image-with-commands"/>
<informalfigure><mediaobject><imageobject><imagedata fileref="f@i--le..  a@&lt;&quot;%@  &lt; &amp; @ % &quot; .jpg" format="JPG"></imagedata></imageobject></mediaobject></informalfigure>

<para>In text <inlinemediaobject><imageobject><imagedata fileref="f@i--le..  a@&lt;&quot;%@  &lt; &amp; @ % &quot; .jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>.
</para>


';

$result_converted_errors{'docbook'}->{'test_image'} = '* W l15:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\' (possibly involving @files-char)

* W l15:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\' (possibly involving @files-char)

* W l9:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\' (possibly involving @files-char)

* W l9:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\' (possibly involving @files-char)

* W l21:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\' (possibly involving @files-char)

* W l21:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\' (possibly involving @files-char)

* W l25:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\' (possibly involving @files-char)

* W l25:@files-char|@image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\'
 warning: @image file `f@i--le..  a@<"%@  < & @ % " \' not found, using `f@i--le..  a@<"%@  < & @ % " .jpg\' (possibly involving @files-char)

';

1;
