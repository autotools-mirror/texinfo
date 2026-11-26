use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'codequoteundirected_codequotebacktick'} = '*document_root C5
 *before_node_section C1
  *preamble C8
   *normal_command@macro C8 l1
   |formal_args:A{}
   |macro_name:{quotes}
    *arguments_line C1
     {macro_line: quotes\\n}
    {raw:``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*\\n}
    {raw:code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*\\n}
    {raw:asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*\\n}
    {raw:strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*\\n}
    {raw:kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*\\n}
    {raw:samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*\\n}
    *normal_command@end C1 l8
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C19 l10
   |formal_args:A{}
   |macro_name:{allquotes}
    *arguments_line C1
     {macro_line: allquotes\\n}
    {raw:@quotes{}\\n}
    {raw:\\n}
    {raw:@example\\n}
    {raw:@@codequoteundirected on\\n}
    {raw:@@codequotebacktick on\\n}
    {raw:@end example\\n}
    {raw:@codequoteundirected\\n}
    {raw:@codequotebacktick\\n}
    {raw:@quotes{}\\n}
    {raw:\\n}
    {raw:@example\\n}
    {raw:@@codequoteundirected off\\n}
    {raw:@@codequotebacktick off\\n}
    {raw:@end example\\n}
    {raw:@codequoteundirected off\\n}
    {raw:@codequotebacktick off\\n}
    {raw:@quotes{}\\n}
    *normal_command@end C1 l28
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@copying C13 l30
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C30
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     >SOURCEMARKS
     >macro_expansion<start;1>
      >*macro_call@allquotes C1
       >*brace_arg
     >macro_expansion<start;2>
      >*macro_call@quotes C1
       >*brace_arg
     *normal_command@quotedblleft C1 l31:@quotes
      *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:code: }
     *normal_command@code C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:asis: }
     *normal_command@asis C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:strong: }
     *normal_command@strong C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:kbd: }
     *normal_command@kbd C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:samp: }
     *normal_command@samp C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     >SOURCEMARKS
     >macro_expansion<end;2>
     {normal_text:\\n}
    {empty_line:\\n}
    *normal_command@example C3 l31:@allquotes
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *preformatted C4
      *normal_command@@
      {normal_text:codequoteundirected on\\n}
      *normal_command@@
      {normal_text:codequotebacktick on\\n}
     *normal_command@end C1 l31:@allquotes
     |text_arg:{example}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:example}
       {spaces_after_argument:\\n}
    *normal_command@codequoteundirected C1 l31:@allquotes
    |global_command_number:{1}
     *line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@codequotebacktick C1 l31:@allquotes
    |global_command_number:{1}
     *line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C30
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     >SOURCEMARKS
     >macro_expansion<start;3>
      >*macro_call@quotes C1
       >*brace_arg
     *normal_command@quotedblleft C1 l31:@quotes
      *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:code: }
     *normal_command@code C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:asis: }
     *normal_command@asis C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:strong: }
     *normal_command@strong C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:kbd: }
     *normal_command@kbd C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:samp: }
     *normal_command@samp C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     >SOURCEMARKS
     >macro_expansion<end;3>
     {normal_text:\\n}
    {empty_line:\\n}
    *normal_command@example C3 l31:@allquotes
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *preformatted C4
      *normal_command@@
      {normal_text:codequoteundirected off\\n}
      *normal_command@@
      {normal_text:codequotebacktick off\\n}
     *normal_command@end C1 l31:@allquotes
     |text_arg:{example}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:example}
       {spaces_after_argument:\\n}
    *normal_command@codequoteundirected C1 l31:@allquotes
    |global_command_number:{2}
    |misc_args:A{off}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:off}
      {spaces_after_argument:\\n}
    *normal_command@codequotebacktick C1 l31:@allquotes
    |global_command_number:{2}
    |misc_args:A{off}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:off}
      {spaces_after_argument:\\n}
    *paragraph C30
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     >SOURCEMARKS
     >macro_expansion<start;4>
      >*macro_call@quotes C1
       >*brace_arg
     *normal_command@quotedblleft C1 l31:@quotes
      *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:code: }
     *normal_command@code C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:asis: }
     *normal_command@asis C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:strong: }
     *normal_command@strong C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:kbd: }
     *normal_command@kbd C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     {normal_text:\\n}
     {normal_text:samp: }
     *normal_command@samp C1 l31:@quotes
      *brace_container C2
       {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
       *normal_command@quotedblleft C1 l31:@quotes
        *brace_container
     {normal_text: }
     *normal_command@*
     >SOURCEMARKS
     >macro_expansion<end;4>
     >macro_expansion<end;1>
     {normal_text:\\n}
    *normal_command@end C1 l32
    |text_arg:{copying}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:copying}
      {spaces_after_argument:\\n}
   *normal_command@titlepage C4 l33
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C1
     {normal_text:Titlepage\\n}
    *normal_command@insertcopying C1 l35
    |global_command_number:{1}
     *line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@end C1 l36
    |text_arg:{titlepage}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:titlepage}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
 *normal_command@node C1 l39 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument: \\n}
 *normal_command@top C2 l40 {test quotes}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:test quotes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l42 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C16 l43 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C30
   {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
   >SOURCEMARKS
   >macro_expansion<start;5>
    >*macro_call@allquotes C1
     >*brace_arg
   >macro_expansion<start;6>
    >*macro_call@quotes C1
     >*brace_arg
   *normal_command@quotedblleft C1 l45:@quotes
    *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:code: }
   *normal_command@code C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:asis: }
   *normal_command@asis C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:strong: }
   *normal_command@strong C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:kbd: }
   *normal_command@kbd C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:samp: }
   *normal_command@samp C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   >SOURCEMARKS
   >macro_expansion<end;6>
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l45:@allquotes
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C4
    *normal_command@@
    {normal_text:codequoteundirected on\\n}
    *normal_command@@
    {normal_text:codequotebacktick on\\n}
   *normal_command@end C1 l45:@allquotes
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  *normal_command@codequoteundirected C1 l45:@allquotes
  |global_command_number:{3}
   *line_arg C1
    {spaces_before_argument:\\n}
  *normal_command@codequotebacktick C1 l45:@allquotes
  |global_command_number:{3}
   *line_arg C1
    {spaces_before_argument:\\n}
  *paragraph C30
   {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
   >SOURCEMARKS
   >macro_expansion<start;7>
    >*macro_call@quotes C1
     >*brace_arg
   *normal_command@quotedblleft C1 l45:@quotes
    *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:code: }
   *normal_command@code C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:asis: }
   *normal_command@asis C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:strong: }
   *normal_command@strong C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:kbd: }
   *normal_command@kbd C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:samp: }
   *normal_command@samp C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   >SOURCEMARKS
   >macro_expansion<end;7>
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l45:@allquotes
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C4
    *normal_command@@
    {normal_text:codequoteundirected off\\n}
    *normal_command@@
    {normal_text:codequotebacktick off\\n}
   *normal_command@end C1 l45:@allquotes
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  *normal_command@codequoteundirected C1 l45:@allquotes
  |global_command_number:{4}
  |misc_args:A{off}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:off}
    {spaces_after_argument:\\n}
  *normal_command@codequotebacktick C1 l45:@allquotes
  |global_command_number:{4}
  |misc_args:A{off}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:off}
    {spaces_after_argument:\\n}
  *paragraph C30
   {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
   >SOURCEMARKS
   >macro_expansion<start;8>
    >*macro_call@quotes C1
     >*brace_arg
   *normal_command@quotedblleft C1 l45:@quotes
    *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:code: }
   *normal_command@code C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:asis: }
   *normal_command@asis C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:strong: }
   *normal_command@strong C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:kbd: }
   *normal_command@kbd C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   {normal_text:\\n}
   {normal_text:samp: }
   *normal_command@samp C1 l45:@quotes
    *brace_container C2
     {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
     *normal_command@quotedblleft C1 l45:@quotes
      *brace_container
   {normal_text: }
   *normal_command@*
   >SOURCEMARKS
   >macro_expansion<end;8>
   >macro_expansion<end;5>
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@example C7 l47
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C31
    {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
    >SOURCEMARKS
    >macro_expansion<start;9>
     >*macro_call@allquotes C1
      >*brace_arg
    >macro_expansion<start;10>
     >*macro_call@quotes C1
      >*brace_arg
    *normal_command@quotedblleft C1 l48:@quotes
     *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:code: }
    *normal_command@code C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:asis: }
    *normal_command@asis C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:strong: }
    *normal_command@strong C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:kbd: }
    *normal_command@kbd C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:samp: }
    *normal_command@samp C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    >SOURCEMARKS
    >macro_expansion<end;10>
    {normal_text:\\n}
    {empty_line:\\n}
   *normal_command@example C3 l48:@allquotes
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C4
     *normal_command@@
     {normal_text:codequoteundirected on\\n}
     *normal_command@@
     {normal_text:codequotebacktick on\\n}
    *normal_command@end C1 l48:@allquotes
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *preformatted C33
    *normal_command@codequoteundirected C1 l48:@allquotes
    |global_command_number:{5}
     *line_arg C1
      {spaces_before_argument:\\n}
    *normal_command@codequotebacktick C1 l48:@allquotes
    |global_command_number:{5}
     *line_arg C1
      {spaces_before_argument:\\n}
    {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
    >SOURCEMARKS
    >macro_expansion<start;11>
     >*macro_call@quotes C1
      >*brace_arg
    *normal_command@quotedblleft C1 l48:@quotes
     *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:code: }
    *normal_command@code C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:asis: }
    *normal_command@asis C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:strong: }
    *normal_command@strong C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:kbd: }
    *normal_command@kbd C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:samp: }
    *normal_command@samp C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    >SOURCEMARKS
    >macro_expansion<end;11>
    {normal_text:\\n}
    {empty_line:\\n}
   *normal_command@example C3 l48:@allquotes
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *preformatted C4
     *normal_command@@
     {normal_text:codequoteundirected off\\n}
     *normal_command@@
     {normal_text:codequotebacktick off\\n}
    *normal_command@end C1 l48:@allquotes
    |text_arg:{example}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:example}
      {spaces_after_argument:\\n}
   *preformatted C32
    *normal_command@codequoteundirected C1 l48:@allquotes
    |global_command_number:{6}
    |misc_args:A{off}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:off}
      {spaces_after_argument:\\n}
    *normal_command@codequotebacktick C1 l48:@allquotes
    |global_command_number:{6}
    |misc_args:A{off}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:off}
      {spaces_after_argument:\\n}
    {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
    >SOURCEMARKS
    >macro_expansion<start;12>
     >*macro_call@quotes C1
      >*brace_arg
    *normal_command@quotedblleft C1 l48:@quotes
     *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:code: }
    *normal_command@code C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:asis: }
    *normal_command@asis C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:strong: }
    *normal_command@strong C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:kbd: }
    *normal_command@kbd C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    {normal_text:\\n}
    {normal_text:samp: }
    *normal_command@samp C1 l48:@quotes
     *brace_container C2
      {normal_text:``simple-double--three---four----\'\' `simple\' quotedblleft: }
      *normal_command@quotedblleft C1 l48:@quotes
       *brace_container
    {normal_text: }
    *normal_command@*
    >SOURCEMARKS
    >macro_expansion<end;12>
    >macro_expansion<end;9>
    {normal_text:\\n}
   *normal_command@end C1 l49
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'codequoteundirected_codequotebacktick'} = '@macro quotes
``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*
code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
@end macro

@macro allquotes
@quotes{}

@example
@@codequoteundirected on
@@codequotebacktick on
@end example
@codequoteundirected
@codequotebacktick
@quotes{}

@example
@@codequoteundirected off
@@codequotebacktick off
@end example
@codequoteundirected off
@codequotebacktick off
@quotes{}
@end macro

@copying
``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*
code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*

@example
@@codequoteundirected on
@@codequotebacktick on
@end example
@codequoteundirected
@codequotebacktick
``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*
code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*

@example
@@codequoteundirected off
@@codequotebacktick off
@end example
@codequoteundirected off
@codequotebacktick off
``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*
code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
@end copying
@titlepage
Titlepage
@insertcopying
@end titlepage


@node Top 
@top test quotes

@node chap
@chapter Chapter

``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*
code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*

@example
@@codequoteundirected on
@@codequotebacktick on
@end example
@codequoteundirected
@codequotebacktick
``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*
code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*

@example
@@codequoteundirected off
@@codequotebacktick off
@end example
@codequoteundirected off
@codequotebacktick off
``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*
code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*

@example
``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*
code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*

@example
@@codequoteundirected on
@@codequotebacktick on
@end example
@codequoteundirected
@codequotebacktick
``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*
code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*

@example
@@codequoteundirected off
@@codequotebacktick off
@end example
@codequoteundirected off
@codequotebacktick off
``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*
code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
@end example

';


$result_texts{'codequoteundirected_codequotebacktick'} = '



test quotes
***********

1 Chapter
*********

"simple-double-three--four---" `simple\' quotedblleft: " 

code: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

asis: "simple-double-three--four---" `simple\' quotedblleft: " 

strong: "simple-double-three--four---" `simple\' quotedblleft: " 

kbd: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

samp: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 


@codequoteundirected on
@codequotebacktick on
"simple-double-three--four---" `simple\' quotedblleft: " 

code: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

asis: "simple-double-three--four---" `simple\' quotedblleft: " 

strong: "simple-double-three--four---" `simple\' quotedblleft: " 

kbd: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

samp: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 


@codequoteundirected off
@codequotebacktick off
"simple-double-three--four---" `simple\' quotedblleft: " 

code: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

asis: "simple-double-three--four---" `simple\' quotedblleft: " 

strong: "simple-double-three--four---" `simple\' quotedblleft: " 

kbd: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

samp: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 


``simple-double--three---four----\'\' `simple\' quotedblleft: " 

code: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

strong: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

kbd: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

samp: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 


@codequoteundirected on
@codequotebacktick on
``simple-double--three---four----\'\' `simple\' quotedblleft: " 

code: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

strong: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

kbd: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

samp: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 


@codequoteundirected off
@codequotebacktick off
``simple-double--three---four----\'\' `simple\' quotedblleft: " 

code: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

strong: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

kbd: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 

samp: ``simple-double--three---four----\'\' `simple\' quotedblleft: " 


';

$result_errors{'codequoteundirected_codequotebacktick'} = '* E l31:@allquotes|@codequoteundirected missing argument
 @codequoteundirected missing argument (possibly involving @allquotes)

* E l31:@allquotes|@codequotebacktick missing argument
 @codequotebacktick missing argument (possibly involving @allquotes)

* E l45:@allquotes|@codequoteundirected missing argument
 @codequoteundirected missing argument (possibly involving @allquotes)

* E l45:@allquotes|@codequotebacktick missing argument
 @codequotebacktick missing argument (possibly involving @allquotes)

* E l48:@allquotes|@codequoteundirected missing argument
 @codequoteundirected missing argument (possibly involving @allquotes)

* E l48:@allquotes|@codequotebacktick missing argument
 @codequotebacktick missing argument (possibly involving @allquotes)

';

$result_nodes_list{'codequoteundirected_codequotebacktick'} = '1|Top
 associated_section: test quotes
 associated_title_command: test quotes
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'codequoteundirected_codequotebacktick'} = '1|test quotes
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->test quotes
 toplevel_directions:
  prev->test quotes
  up->test quotes
';

$result_sectioning_root{'codequoteundirected_codequotebacktick'} = 'level: -1
list:
 1|test quotes
';

$result_headings_list{'codequoteundirected_codequotebacktick'} = '';


$result_converted{'plaintext'}->{'codequoteundirected_codequotebacktick'} = 'test quotes
***********

1 Chapter
*********

"simple-double-three--four---" \'simple\' quotedblleft: “
code: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’
asis: "simple-double-three--four---" \'simple\' quotedblleft: “
strong: *"simple-double-three--four---" \'simple\' quotedblleft: “*
kbd: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’
samp: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’

     @codequoteundirected on
     @codequotebacktick on
   "simple-double-three--four---" \'simple\' quotedblleft: “
code: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’
asis: "simple-double-three--four---" \'simple\' quotedblleft: “
strong: *"simple-double-three--four---" \'simple\' quotedblleft: “*
kbd: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’
samp: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’

     @codequoteundirected off
     @codequotebacktick off
   "simple-double-three--four---" \'simple\' quotedblleft: “
code: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’
asis: "simple-double-three--four---" \'simple\' quotedblleft: “
strong: *"simple-double-three--four---" \'simple\' quotedblleft: “*
kbd: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’
samp: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’

     ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     code: ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     strong: *``simple-double--three---four----\'\' `simple\' quotedblleft: “*

     kbd: ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     samp: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’


          @codequoteundirected on
          @codequotebacktick on
     ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     code: ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     strong: *``simple-double--three---four----\'\' `simple\' quotedblleft: “*

     kbd: ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     samp: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’


          @codequoteundirected off
          @codequotebacktick off
     ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     code: ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     strong: *``simple-double--three---four----\'\' `simple\' quotedblleft: “*

     kbd: ``simple-double--three---four----\'\' `simple\' quotedblleft: “

     samp: ‘``simple-double--three---four----\'\' `simple\' quotedblleft: “’

';


$result_converted{'html_text'}->{'codequoteundirected_codequotebacktick'} = '



<div class="top-level-extent" id="Top">
<h1 class="top" id="test-quotes"><span>test quotes<a class="copiable-link" href="#test-quotes"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p>&ldquo;simple-double&ndash;three&mdash;four&mdash;-&rdquo; &lsquo;simple&rsquo; quotedblleft: &ldquo; <br>
code: <code class="code">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> <br>
asis: &ldquo;simple-double&ndash;three&mdash;four&mdash;-&rdquo; &lsquo;simple&rsquo; quotedblleft: &ldquo; <br>
strong: <strong class="strong">&ldquo;simple-double&ndash;three&mdash;four&mdash;-&rdquo; &lsquo;simple&rsquo; quotedblleft: &ldquo;</strong> <br>
kbd: <kbd class="kbd">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> <br>
samp: &lsquo;<samp class="samp">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp>&rsquo; <br>
</p>
<div class="example">
<pre class="example-preformatted">@codequoteundirected on
@codequotebacktick on
</pre></div>
<p>&ldquo;simple-double&ndash;three&mdash;four&mdash;-&rdquo; &lsquo;simple&rsquo; quotedblleft: &ldquo; <br>
code: <code class="code">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> <br>
asis: &ldquo;simple-double&ndash;three&mdash;four&mdash;-&rdquo; &lsquo;simple&rsquo; quotedblleft: &ldquo; <br>
strong: <strong class="strong">&ldquo;simple-double&ndash;three&mdash;four&mdash;-&rdquo; &lsquo;simple&rsquo; quotedblleft: &ldquo;</strong> <br>
kbd: <kbd class="kbd">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> <br>
samp: &lsquo;<samp class="samp">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp>&rsquo; <br>
</p>
<div class="example">
<pre class="example-preformatted">@codequoteundirected off
@codequotebacktick off
</pre></div>
<p>&ldquo;simple-double&ndash;three&mdash;four&mdash;-&rdquo; &lsquo;simple&rsquo; quotedblleft: &ldquo; <br>
code: <code class="code">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> <br>
asis: &ldquo;simple-double&ndash;three&mdash;four&mdash;-&rdquo; &lsquo;simple&rsquo; quotedblleft: &ldquo; <br>
strong: <strong class="strong">&ldquo;simple-double&ndash;three&mdash;four&mdash;-&rdquo; &lsquo;simple&rsquo; quotedblleft: &ldquo;</strong> <br>
kbd: <kbd class="kbd">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> <br>
samp: &lsquo;<samp class="samp">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp>&rsquo; <br>
</p>
<div class="example">
<pre class="example-preformatted">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo; 

code: <code class="code">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> 

asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo; 

strong: <strong class="strong">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</strong> 

kbd: <kbd class="kbd">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> 

samp: &lsquo;<samp class="samp">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp>&rsquo; 


</pre><div class="example">
<pre class="example-preformatted">@codequoteundirected on
@codequotebacktick on
</pre></div>
<pre class="example-preformatted">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo; 

code: <code class="code">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> 

asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo; 

strong: <strong class="strong">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</strong> 

kbd: <kbd class="kbd">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> 

samp: &lsquo;<samp class="samp">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp>&rsquo; 


</pre><div class="example">
<pre class="example-preformatted">@codequoteundirected off
@codequotebacktick off
</pre></div>
<pre class="example-preformatted">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo; 

code: <code class="code">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> 

asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo; 

strong: <strong class="strong">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</strong> 

kbd: <kbd class="kbd">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> 

samp: &lsquo;<samp class="samp">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp>&rsquo; 

</pre></div>

</div>
</div>
';


$result_converted{'latex'}->{'codequoteundirected_codequotebacktick'} = '\\documentclass{book}
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
\\usepackage{float}
% use hidelinks to remove boxes around links to be similar to Texinfo TeX
\\usepackage[hidelinks]{hyperref}

\\hypersetup{pdftitle={test quotes}}

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

% style command for kbd in \'cmd_text\' formatting context
\\newcommand\\Texinfocommandstyletextkbd[1]{{\\ttfamily\\textsl{#1}}}%

% redefine the \\mainmatter command such that it does not clear page
% as if in double page
\\renewcommand\\mainmatter{\\clearpage\\@mainmattertrue\\pagenumbering{arabic}}
\\newenvironment{Texinfopreformatted}{%
  \\par\\GNUTobeylines\\obeyspaces\\frenchspacing\\parskip=\\z@\\parindent=\\z@}{}
{\\catcode`\\^^M=13 \\gdef\\GNUTobeylines{\\catcode`\\^^M=13 \\def^^M{\\null\\par}}}
\\newenvironment{Texinfoindented}{\\begin{list}{}{}\\item\\relax}{\\end{list}}


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

\\frontmatter
\\pagestyle{empty}%
\\begin{titlepage}
\\begingroup
\\newskip\\titlepagetopglue \\titlepagetopglue = 1.5in
\\newskip\\titlepagebottomglue \\titlepagebottomglue = 2pc
\\setlength{\\parindent}{0pt}
% Leave some space at the very top of the page.
    \\vglue\\titlepagetopglue
Titlepage
``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
code: \\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
strong: \\textbf{``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{}} \\leavevmode{}\\\\
kbd: \\Texinfocommandstyletextkbd{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
samp: `\\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\' \\leavevmode{}\\\\

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily @codequoteundirected on
@codequotebacktick on
\\end{Texinfopreformatted}
\\end{Texinfoindented}
``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
code: \\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
strong: \\textbf{``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{}} \\leavevmode{}\\\\
kbd: \\Texinfocommandstyletextkbd{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
samp: `\\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\' \\leavevmode{}\\\\

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily @codequoteundirected off
@codequotebacktick off
\\end{Texinfopreformatted}
\\end{Texinfoindented}
``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
code: \\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
strong: \\textbf{``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{}} \\leavevmode{}\\\\
kbd: \\Texinfocommandstyletextkbd{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
samp: `\\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\' \\leavevmode{}\\\\
\\endgroup
\\end{titlepage}
\\mainmatter
\\pagestyle{single}%
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chap}%

``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
code: \\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
strong: \\textbf{``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{}} \\leavevmode{}\\\\
kbd: \\Texinfocommandstyletextkbd{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
samp: `\\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\' \\leavevmode{}\\\\

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily @codequoteundirected on
@codequotebacktick on
\\end{Texinfopreformatted}
\\end{Texinfoindented}
``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
code: \\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
strong: \\textbf{``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{}} \\leavevmode{}\\\\
kbd: \\Texinfocommandstyletextkbd{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
samp: `\\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\' \\leavevmode{}\\\\

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily @codequoteundirected off
@codequotebacktick off
\\end{Texinfopreformatted}
\\end{Texinfoindented}
``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
code: \\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{} \\leavevmode{}\\\\
strong: \\textbf{``simple-double--three---four----\'\' `simple\' quotedblleft: \\textquotedblleft{}} \\leavevmode{}\\\\
kbd: \\Texinfocommandstyletextkbd{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}} \\leavevmode{}\\\\
samp: `\\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\' \\leavevmode{}\\\\

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily {`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}\\ \\leavevmode{}\\\\
code:\\ \\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\\ \\leavevmode{}\\\\
asis:\\ {`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}\\ \\leavevmode{}\\\\
strong:\\ \\textbf{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\\ \\leavevmode{}\\\\
kbd:\\ \\Texinfocommandstyletextkbd{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\\ \\leavevmode{}\\\\
samp:\\ `\\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\'\\ \\leavevmode{}\\\\

\\end{Texinfopreformatted}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily @codequoteundirected on
@codequotebacktick on
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily {`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}\\ \\leavevmode{}\\\\
code:\\ \\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\\ \\leavevmode{}\\\\
asis:\\ {`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}\\ \\leavevmode{}\\\\
strong:\\ \\textbf{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\\ \\leavevmode{}\\\\
kbd:\\ \\Texinfocommandstyletextkbd{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\\ \\leavevmode{}\\\\
samp:\\ `\\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\'\\ \\leavevmode{}\\\\

\\end{Texinfopreformatted}
\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily @codequoteundirected off
@codequotebacktick off
\\end{Texinfopreformatted}
\\end{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily {`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}\\ \\leavevmode{}\\\\
code:\\ \\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\\ \\leavevmode{}\\\\
asis:\\ {`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}\\ \\leavevmode{}\\\\
strong:\\ \\textbf{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\\ \\leavevmode{}\\\\
kbd:\\ \\Texinfocommandstyletextkbd{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\\ \\leavevmode{}\\\\
samp:\\ `\\texttt{{`}{`}simple-double{-}{-}three{-}{-}{-}four{-}{-}{-}-{\'}{\'} `simple\' quotedblleft:\\ \\textquotedblleft{}}\'\\ \\leavevmode{}\\\\
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\end{document}
';


$result_converted{'docbook_doc'}->{'codequoteundirected_codequotebacktick'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book>
<title>test quotes</title>
<bookinfo><title>test quotes</title>
<legalnotice><para>&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

code: <literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal> 

asis: &#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

strong: <emphasis role="bold">&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220;</emphasis> 

kbd: <userinput>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</userinput> 

samp: &#8216;<literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal>&#8217; 

</para>
<screen>@codequoteundirected on
@codequotebacktick on
</screen><para>&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

code: <literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal> 

asis: &#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

strong: <emphasis role="bold">&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220;</emphasis> 

kbd: <userinput>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</userinput> 

samp: &#8216;<literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal>&#8217; 

</para>
<screen>@codequoteundirected off
@codequotebacktick off
</screen><para>&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

code: <literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal> 

asis: &#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

strong: <emphasis role="bold">&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220;</emphasis> 

kbd: <userinput>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</userinput> 

samp: &#8216;<literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal>&#8217; 

</para></legalnotice></bookinfo>
<chapter label="1" id="chap">
<title>Chapter</title>

<para>&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

code: <literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal> 

asis: &#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

strong: <emphasis role="bold">&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220;</emphasis> 

kbd: <userinput>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</userinput> 

samp: &#8216;<literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal>&#8217; 

</para>
<screen>@codequoteundirected on
@codequotebacktick on
</screen><para>&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

code: <literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal> 

asis: &#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

strong: <emphasis role="bold">&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220;</emphasis> 

kbd: <userinput>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</userinput> 

samp: &#8216;<literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal>&#8217; 

</para>
<screen>@codequoteundirected off
@codequotebacktick off
</screen><para>&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

code: <literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal> 

asis: &#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220; 

strong: <emphasis role="bold">&#8220;simple-double&#8211;three&#8212;four&#8212;-&#8221; &#8216;simple&#8217; quotedblleft: &#8220;</emphasis> 

kbd: <userinput>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</userinput> 

samp: &#8216;<literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal>&#8217; 

</para>
<screen>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220; 

code: <literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal> 

asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220; 

strong: <emphasis role="bold">``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</emphasis> 

kbd: <userinput>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</userinput> 

samp: &#8216;<literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal>&#8217; 


</screen><screen>@codequoteundirected on
@codequotebacktick on
</screen><screen>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220; 

code: <literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal> 

asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220; 

strong: <emphasis role="bold">``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</emphasis> 

kbd: <userinput>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</userinput> 

samp: &#8216;<literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal>&#8217; 


</screen><screen>@codequoteundirected off
@codequotebacktick off
</screen><screen>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220; 

code: <literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal> 

asis: ``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220; 

strong: <emphasis role="bold">``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</emphasis> 

kbd: <userinput>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</userinput> 

samp: &#8216;<literal>``simple-double--three---four----\'\' `simple\' quotedblleft: &#8220;</literal>&#8217; 

</screen>
</chapter>
</book>
';


$result_converted{'xml'}->{'codequoteundirected_codequotebacktick'} = '<macro name="quotes" line=" quotes" endspaces=" ">
``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{} @*
code: @code{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
asis: @asis{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
strong: @strong{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
kbd: @kbd{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
samp: @samp{``simple-double--three---four----\'\' `simple\' quotedblleft: @quotedblleft{}} @*
</macro>

<macro name="allquotes" line=" allquotes" endspaces=" ">
@quotes{}

@example
@@codequoteundirected on
@@codequotebacktick on
@end example
@codequoteundirected
@codequotebacktick
@quotes{}

@example
@@codequoteundirected off
@@codequotebacktick off
@end example
@codequoteundirected off
@codequotebacktick off
@quotes{}
</macro>

<copying endspaces=" ">
<para>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo; &linebreak;
code: <code>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> &linebreak;
asis: <asis>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</asis> &linebreak;
strong: <strong>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</strong> &linebreak;
kbd: <kbd>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> &linebreak;
samp: <samp>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp> &linebreak;
</para>
<example endspaces=" ">
<pre xml:space="preserve">&arobase;codequoteundirected on
&arobase;codequotebacktick on
</pre></example>
<codequoteundirected></codequoteundirected>
<codequotebacktick></codequotebacktick>
<para>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo; &linebreak;
code: <code>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> &linebreak;
asis: <asis>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</asis> &linebreak;
strong: <strong>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</strong> &linebreak;
kbd: <kbd>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> &linebreak;
samp: <samp>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp> &linebreak;
</para>
<example endspaces=" ">
<pre xml:space="preserve">&arobase;codequoteundirected off
&arobase;codequotebacktick off
</pre></example>
<codequoteundirected value="off" line=" off"></codequoteundirected>
<codequotebacktick value="off" line=" off"></codequotebacktick>
<para>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo; &linebreak;
code: <code>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> &linebreak;
asis: <asis>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</asis> &linebreak;
strong: <strong>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</strong> &linebreak;
kbd: <kbd>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> &linebreak;
samp: <samp>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp> &linebreak;
</para></copying>
<titlepage endspaces=" ">
<para>Titlepage
</para><insertcopying></insertcopying>
</titlepage>


<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> test quotes</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chapter</sectiontitle>

<para>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo; &linebreak;
code: <code>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> &linebreak;
asis: <asis>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</asis> &linebreak;
strong: <strong>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</strong> &linebreak;
kbd: <kbd>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> &linebreak;
samp: <samp>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp> &linebreak;
</para>
<example endspaces=" ">
<pre xml:space="preserve">&arobase;codequoteundirected on
&arobase;codequotebacktick on
</pre></example>
<codequoteundirected></codequoteundirected>
<codequotebacktick></codequotebacktick>
<para>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo; &linebreak;
code: <code>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> &linebreak;
asis: <asis>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</asis> &linebreak;
strong: <strong>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</strong> &linebreak;
kbd: <kbd>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> &linebreak;
samp: <samp>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp> &linebreak;
</para>
<example endspaces=" ">
<pre xml:space="preserve">&arobase;codequoteundirected off
&arobase;codequotebacktick off
</pre></example>
<codequoteundirected value="off" line=" off"></codequoteundirected>
<codequotebacktick value="off" line=" off"></codequotebacktick>
<para>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo; &linebreak;
code: <code>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> &linebreak;
asis: <asis>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</asis> &linebreak;
strong: <strong>&textldquo;simple-double&textndash;three&textmdash;four&textmdash;-&textrdquo; &textlsquo;simple&textrsquo; quotedblleft: &ldquo;</strong> &linebreak;
kbd: <kbd>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> &linebreak;
samp: <samp>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp> &linebreak;
</para>
<example endspaces=" ">
<pre xml:space="preserve">``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo; &linebreak;
code: <code>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> &linebreak;
asis: <asis>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</asis> &linebreak;
strong: <strong>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</strong> &linebreak;
kbd: <kbd>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> &linebreak;
samp: <samp>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp> &linebreak;

</pre><example endspaces=" ">
<pre xml:space="preserve">&arobase;codequoteundirected on
&arobase;codequotebacktick on
</pre></example>
<pre xml:space="preserve"><codequoteundirected></codequoteundirected>
<codequotebacktick></codequotebacktick>
``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo; &linebreak;
code: <code>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> &linebreak;
asis: <asis>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</asis> &linebreak;
strong: <strong>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</strong> &linebreak;
kbd: <kbd>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> &linebreak;
samp: <samp>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp> &linebreak;

</pre><example endspaces=" ">
<pre xml:space="preserve">&arobase;codequoteundirected off
&arobase;codequotebacktick off
</pre></example>
<pre xml:space="preserve"><codequoteundirected value="off" line=" off"></codequoteundirected>
<codequotebacktick value="off" line=" off"></codequotebacktick>
``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo; &linebreak;
code: <code>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</code> &linebreak;
asis: <asis>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</asis> &linebreak;
strong: <strong>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</strong> &linebreak;
kbd: <kbd>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</kbd> &linebreak;
samp: <samp>``simple-double--three---four----\'\' `simple\' quotedblleft: &ldquo;</samp> &linebreak;
</pre></example>

</chapter>
';

1;
