use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'itemize_arguments'} = '*document_root C1
 *before_node_section C71
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *@itemize C3 l2
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:---}
     {spaces_after_argument:\\n}
   *@item C2 l3
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item ---\\n}
   *@end C1 l4
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l6
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:a\'\'b\'c}
     {spaces_after_argument:\\n}
   *@item C2 l7
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item a\'\'b\'c\\n}
   *@end C1 l8
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l10
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@code C1 l10
      *brace_container C1
       {normal_text:a\'\'b\'c}
     {spaces_after_argument:\\n}
   *@item C2 l11
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item code }
     *@code C1 l11
      *brace_container C1
       {normal_text:a\'\'b\'c}
     {normal_text:\\n}
   *@end C1 l12
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l14
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:a``b`c}
     {spaces_after_argument:\\n}
   *@item C2 l15
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item a``b`c\\n}
   *@end C1 l16
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l18
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:a\'"}
     {spaces_after_argument:\\n}
   *@item C2 l19
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item a\'"\\n}
   *@end C1 l20
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l22
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:b\\<&}
     {spaces_after_argument:\\n}
   *@item C2 l23
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item b\\<&\\n}
   *@end C1 l24
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l26
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@today l26
     {spaces_after_argument:\\n}
   *@item C2 l27
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item today }
     *@today C1 l27
      *brace_container
     {normal_text:\\n}
   *@end C1 l28
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l30
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *@aa C1 l30
      *brace_container
     {normal_text: }
     *@sc C1 l30
      *brace_container C1
       *@aa C1 l30
        *brace_container
     {spaces_after_argument:\\n}
   *@item C2 l31
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C5
     {normal_text:item aa }
     *@aa C1 l31
      *brace_container
     {normal_text: }
     *@sc C1 l31
      *brace_container C1
       *@aa C1 l31
        *brace_container
     {normal_text:\\n}
   *@end C1 l32
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l34
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@tie C1 l34
      *brace_container
     {spaces_after_argument:\\n}
   *@item C2 l35
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item tie }
     *@tie C1 l35
      *brace_container
     {normal_text:\\n}
   *@end C1 l36
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l38
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@tie C1 l38
      *brace_container
     {normal_text: a}
     {spaces_after_argument:\\n}
   *@item C2 l39
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item tie }
     *@tie C1 l39
      *brace_container
     {normal_text: a\\n}
   *@end C1 l40
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l42
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@atchar l42
     {spaces_after_argument:\\n}
   *@item C2 l43
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:item atchar\\n}
   *@end C1 l44
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l46
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@atchar C1 l46
      *brace_container
     {normal_text: a}
     {spaces_after_argument:\\n}
   *@item C2 l47
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item atchar }
     *@atchar C1 l47
      *brace_container
     {normal_text: a\\n}
   *@end C1 l48
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l50
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@*
     {spaces_after_argument:\\n}
   *@item C2 l51
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item * }
     *@*
     {normal_text:\\n}
   *@end C1 l52
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l54
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@{
     {spaces_after_argument:\\n}
   *@item C2 l55
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item }
     *@{
     {normal_text:\\n}
   *@end C1 l56
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l58
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@&
     {spaces_after_argument:\\n}
   *@item C2 l59
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item }
     *@&
     {normal_text:\\n}
   *@end C1 l60
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l62
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@ampchar l62
     {spaces_after_argument:\\n}
   *@item C2 l63
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item }
     *@ampchar C1 l63
      *brace_container
     {normal_text:\\n}
   *@end C1 l64
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l66
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@&
     {normal_text: a}
     {spaces_after_argument:\\n}
   *@item C2 l67
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item }
     *@&
     {normal_text: a\\n}
   *@end C1 l68
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l70
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@ampchar C1 l70
      *brace_container
     {normal_text: a}
     {spaces_after_argument:\\n}
   *@item C2 l71
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item }
     *@ampchar C1 l71
      *brace_container
     {normal_text: a\\n}
   *@end C1 l72
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l74
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@registeredsymbol C1 l74
      *brace_container
     {spaces_after_argument:\\n}
   *@item C2 l75
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item registeredsymbol }
     *@registeredsymbol C1 l75
      *brace_container
     {normal_text:\\n}
   *@end C1 l76
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l78
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@registeredsymbol C1 l78
      *brace_container
     {normal_text: a}
     {spaces_after_argument:\\n}
   *@item C2 l79
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item registeredsymbol }
     *@registeredsymbol C1 l79
      *brace_container
     {normal_text: a\\n}
   *@end C1 l80
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l82
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@enddots C1 l82
      *brace_container
     {spaces_after_argument:\\n}
   *@item C2 l83
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item dots }
     *@enddots C1 l83
      *brace_container
     {normal_text:\\n}
   *@end C1 l84
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l86
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@enddots C1 l86
      *brace_container
     {normal_text: a}
     {spaces_after_argument:\\n}
   *@item C2 l87
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item dots }
     *@enddots C1 l87
      *brace_container
     {normal_text: a\\n}
   *@end C1 l88
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l90
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *@^ C1 l90
      *following_arg C1
       {normal_text:e}
     {normal_text: }
     *@sc C1 l90
      *brace_container C1
       *@^ C1 l90
        *following_arg C1
         {normal_text:e}
     {spaces_after_argument:\\n}
   *@item C2 l91
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C5
     {normal_text:item e }
     *@^ C1 l91
      *following_arg C1
       {normal_text:e}
     {normal_text: }
     *@sc C1 l91
      *brace_container C1
       *@^ C1 l91
        *following_arg C1
         {normal_text:e}
     {normal_text:\\n}
   *@end C1 l92
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l94
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *@^ C1 l94
      *following_arg C1
       {normal_text:E}
     {normal_text: }
     *@sc C1 l94
      *brace_container C1
       *@^ C1 l94
        *following_arg C1
         {normal_text:E}
     {spaces_after_argument:\\n}
   *@item C2 l95
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C5
     {normal_text:item E }
     *@^ C1 l95
      *following_arg C1
       {normal_text:E}
     {normal_text: }
     *@sc C1 l95
      *brace_container C1
       *@^ C1 l95
        *following_arg C1
         {normal_text:E}
     {normal_text:\\n}
   *@end C1 l96
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l98
   *arguments_line C1
    *block_line_arg C7
     {spaces_before_argument: }
     *@~ C1 l98
      *brace_container C1
       *@dotless C1 l98
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *@dotless C1 l98
      *brace_container C1
       {normal_text:i}
     {normal_text: }
     *@sc C1 l98
      *brace_container C3
       *@~ C1 l98
        *brace_container C1
         *@dotless C1 l98
          *brace_container C1
           {normal_text:i}
       {normal_text: }
       *@dotless C1 l98
        *brace_container C1
         {normal_text:i}
     {spaces_after_argument:\\n}
   *@item C2 l99
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C7
     {normal_text:item dotless }
     *@~ C1 l99
      *brace_container C1
       *@dotless C1 l99
        *brace_container C1
         {normal_text:i}
     {normal_text: }
     *@dotless C1 l99
      *brace_container C1
       {normal_text:i}
     {normal_text: }
     *@sc C1 l99
      *brace_container C3
       *@~ C1 l99
        *brace_container C1
         *@dotless C1 l99
          *brace_container C1
           {normal_text:i}
       {normal_text: }
       *@dotless C1 l99
        *brace_container C1
         {normal_text:i}
     {normal_text:\\n}
   *@end C1 l100
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l102
   *arguments_line C1
    *block_line_arg C7
     {spaces_before_argument: }
     *@udotaccent C1 l102
      *brace_container C1
       {normal_text:r}
     {normal_text: }
     *@v C1 l102
      *brace_container C1
       *@\' C1 l102
        *brace_container C1
         {normal_text:r}
     {normal_text: }
     *@sc C1 l102
      *brace_container C3
       *@udotaccent C1 l102
        *brace_container C1
         {normal_text:r}
       {normal_text: }
       *@v C1 l102
        *brace_container C1
         *@\' C1 l102
          *brace_container C1
           {normal_text:r}
     {spaces_after_argument:\\n}
   *@item C2 l103
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C7
     {normal_text:item complex a }
     *@udotaccent C1 l103
      *brace_container C1
       {normal_text:r}
     {normal_text: }
     *@v C1 l103
      *brace_container C1
       *@\' C1 l103
        *brace_container C1
         {normal_text:r}
     {normal_text: }
     *@sc C1 l103
      *brace_container C3
       *@udotaccent C1 l103
        *brace_container C1
         {normal_text:r}
       {normal_text: }
       *@v C1 l103
        *brace_container C1
         *@\' C1 l103
          *brace_container C1
           {normal_text:r}
     {normal_text:\\n}
   *@end C1 l104
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l106
   *arguments_line C1
    *block_line_arg C5
     {spaces_before_argument: }
     *@= C1 l106
      *brace_container C1
       *@, C1 l106
        *brace_container C1
         *@~ C1 l106
          *brace_container C1
           {normal_text:n}
     {normal_text: }
     *@sc C1 l106
      *brace_container C2
       {normal_text: }
       *@= C1 l106
        *brace_container C1
         *@, C1 l106
          *brace_container C1
           *@~ C1 l106
            *brace_container C1
             {normal_text:n}
     {spaces_after_argument:\\n}
   *@item C2 l107
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C5
     {normal_text:item complex n }
     *@= C1 l107
      *brace_container C1
       *@, C1 l107
        *brace_container C1
         *@~ C1 l107
          *brace_container C1
           {normal_text:n}
     {normal_text: }
     *@sc C1 l107
      *brace_container C2
       {normal_text: }
       *@= C1 l107
        *brace_container C1
         *@, C1 l107
          *brace_container C1
           *@~ C1 l107
            *brace_container C1
             {normal_text:n}
     {normal_text:\\n}
   *@end C1 l108
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l110
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@asis l110
     {spaces_after_argument:\\n}
   *@item C2 l111
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item asis }
     *@asis C1 l111
      *brace_container
     {normal_text:\\n}
   *@end C1 l112
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l114
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@click C1 l114
      *brace_container
     {spaces_after_argument:\\n}
   *@item C2 l115
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item click }
     *@click C1 l115
      *brace_container
     {normal_text:\\n}
   *@end C1 l116
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l118
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@click C1 l118
      *brace_container
     {normal_text: a}
     {spaces_after_argument:\\n}
   *@item C2 l119
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item click }
     *@click C1 l119
      *brace_container
     {normal_text: a\\n}
   *@end C1 l120
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l122
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@error C1 l122
      *brace_container
     {spaces_after_argument:\\n}
   *@item C2 l123
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item error }
     *@error C1 l123
      *brace_container
     {normal_text:\\n}
   *@end C1 l124
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l126
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@error C1 l126
      *brace_container
     {normal_text: a}
     {spaces_after_argument:\\n}
   *@item C2 l127
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item error }
     *@error C1 l127
      *brace_container
     {normal_text: a\\n}
   *@end C1 l128
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@documentlanguage C1 l130
  |EXTRA
  |global_command_number:{1}
  |text_arg:{fr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fr}
    {spaces_after_argument:\\n}
  *@itemize C3 l131
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *@error C1 l131
      *brace_container
     {spaces_after_argument:\\n}
   *@item C2 l132
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item fr error }
     *@error C1 l132
      *brace_container
     {normal_text:\\n}
   *@end C1 l133
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l135
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@error C1 l135
      *brace_container
     {normal_text: a}
     {spaces_after_argument:\\n}
   *@item C2 l136
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C3
     {normal_text:item fr error }
     *@error C1 l136
      *brace_container
     {normal_text: a\\n}
   *@end C1 l137
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'itemize_arguments'} = '
@itemize ---
@item item ---
@end itemize

@itemize a\'\'b\'c
@item item a\'\'b\'c
@end itemize

@itemize @code{a\'\'b\'c}
@item item code @code{a\'\'b\'c}
@end itemize

@itemize a``b`c
@item item a``b`c
@end itemize

@itemize a\'"
@item item a\'"
@end itemize

@itemize b\\<&
@item item b\\<&
@end itemize

@itemize @today
@item item today @today{}
@end itemize

@itemize @aa{} @sc{@aa{}}
@item item aa @aa{} @sc{@aa{}}
@end itemize

@itemize @tie{}
@item item tie @tie{}
@end itemize

@itemize @tie{} a
@item item tie @tie{} a
@end itemize

@itemize @atchar
@item item atchar
@end itemize

@itemize @atchar{} a
@item item atchar @atchar{} a
@end itemize

@itemize @*
@item item * @*
@end itemize

@itemize @{
@item item @{
@end itemize

@itemize @&
@item item @&
@end itemize

@itemize @ampchar
@item item @ampchar{}
@end itemize

@itemize @& a
@item item @& a
@end itemize

@itemize @ampchar{} a
@item item @ampchar{} a
@end itemize

@itemize @registeredsymbol{}
@item item registeredsymbol @registeredsymbol{}
@end itemize

@itemize @registeredsymbol{} a
@item item registeredsymbol @registeredsymbol{} a
@end itemize

@itemize @enddots{}
@item item dots @enddots{}
@end itemize

@itemize @enddots{} a
@item item dots @enddots{} a
@end itemize

@itemize @^e @sc{@^e}
@item item e @^e @sc{@^e}
@end itemize

@itemize @^E @sc{@^E}
@item item E @^E @sc{@^E}
@end itemize

@itemize @~{@dotless{i}} @dotless{i} @sc{@~{@dotless{i}} @dotless{i}}
@item item dotless @~{@dotless{i}} @dotless{i} @sc{@~{@dotless{i}} @dotless{i}}
@end itemize

@itemize @udotaccent{r} @v{@\'{r}} @sc{@udotaccent{r} @v{@\'{r}}}
@item item complex a @udotaccent{r} @v{@\'{r}} @sc{@udotaccent{r} @v{@\'{r}}}
@end itemize

@itemize @={@,{@~{n}}} @sc{ @={@,{@~{n}}}}
@item item complex n @={@,{@~{n}}} @sc{ @={@,{@~{n}}}}
@end itemize

@itemize @asis
@item item asis @asis{}
@end itemize

@itemize @click{}
@item item click @click{}
@end itemize

@itemize @click{} a
@item item click @click{} a
@end itemize

@itemize @error{}
@item item error @error{}
@end itemize

@itemize @error{} a
@item item error @error{} a
@end itemize

@documentlanguage fr
@itemize @error{}
@item item fr error @error{}
@end itemize

@itemize @error{} a
@item item fr error @error{} a
@end itemize

';


$result_texts{'itemize_arguments'} = 'item --

item a"b\'c

item code a\'\'b\'c

item a"b`c

item a\'"

item b\\<&

item today a sunny day

item aa aa AA

item tie  

item tie   a

item atchar

item atchar @ a

item * 


item {

item &

item &

item & a

item & a

item registeredsymbol (R)

item registeredsymbol (R) a

item dots ...

item dots ... a

item e e^ E^

item E E^ E^

item dotless i~ i I~ I

item complex a .r r\'< .R R\'<

item complex n n~,=  N~,=

item asis 

item click ->

item click -> a

item error error->

item error error-> a

item fr error error->

item fr error error-> a

';

$result_errors{'itemize_arguments'} = '* W l110|@asis expected braces
 warning: @asis expected braces

';

$result_nodes_list{'itemize_arguments'} = '';

$result_sections_list{'itemize_arguments'} = '';

$result_sectioning_root{'itemize_arguments'} = '';

$result_headings_list{'itemize_arguments'} = '';

$result_converted_errors{'file_html'}->{'itemize_arguments'} = '* W itemize_arguments.texi|must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
