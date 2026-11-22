use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'star_at_command_formatting'} = '*document_root C1
 *before_node_section C9
  *preamble_before_content C2
   *@macro C14 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{mymacro}
    *arguments_line C1
     {macro_line: mymacro\\n}
    {raw:Some text @*\\n}
    {raw:more text. @\\n}
    {raw:Even more text. @* not at eol.\\n}
    {raw:\\n}
    {raw:Now followed by @@ : followed@*@ \\n}
    {raw:And now followed by a space and @@ : follow @* @ \\n}
    {raw:And now followed by a space and @@ and text: follow @* @ text\\n}
    {raw:Followed by empty asis and a space @asis{} \\n}
    {raw:Followed by asis with space and a space @asis{ } \\n}
    {raw:And now with * empty @@asis: @*@asis{} \\n}
    {raw:And now with * asis with space @@asis: @* @asis{ }\\n}
    {raw:And end para.\\n}
    *@end C1 l14
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C8
   {normal_text:Some text }
   >SOURCEMARKS
   >macro_expansion<start;1>
    >*macro_call@mymacro C1
     >*brace_arg
   *@*
   {normal_text:\\n}
   {normal_text:more text. }
   *@\\n
   {normal_text:Even more text. }
   *@*
   {normal_text: not at eol.\\n}
  {empty_line:\\n}
  *paragraph C40
   {normal_text:Now followed by }
   *@@
   {normal_text: : followed}
   *@*
   *@ 
   {normal_text:\\n}
   {normal_text:And now followed by a space and }
   *@@
   {normal_text: : follow }
   *@*
   {normal_text: }
   *@ 
   {normal_text:\\n}
   {normal_text:And now followed by a space and }
   *@@
   {normal_text: and text: follow }
   *@*
   {normal_text: }
   *@ 
   {normal_text:text\\n}
   {normal_text:Followed by empty asis and a space }
   *@asis C1 l16:@mymacro
    *brace_container
   {normal_text: \\n}
   {normal_text:Followed by asis with space and a space }
   *@asis C1 l16:@mymacro
    *brace_container C1
     {normal_text: }
   {normal_text: \\n}
   {normal_text:And now with * empty }
   *@@
   {normal_text:asis: }
   *@*
   *@asis C1 l16:@mymacro
    *brace_container
   {normal_text: \\n}
   {normal_text:And now with * asis with space }
   *@@
   {normal_text:asis: }
   *@*
   {normal_text: }
   *@asis C1 l16:@mymacro
    *brace_container C1
     {normal_text: }
   {normal_text:\\n}
   {normal_text:And end para.\\n}
   >SOURCEMARKS
   >macro_expansion<end;1><p:13>
  {empty_line:\\n}
  *@example C3 l18
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C50
    {normal_text:Example\\n}
    {normal_text:Some text }
    >SOURCEMARKS
    >macro_expansion<start;2>
     >*macro_call@mymacro C1
      >*brace_arg
    *@*
    {normal_text:\\n}
    {normal_text:more text. }
    *@\\n
    {normal_text:Even more text. }
    *@*
    {normal_text: not at eol.\\n}
    {empty_line:\\n}
    {normal_text:Now followed by }
    *@@
    {normal_text: : followed}
    *@*
    *@ 
    {normal_text:\\n}
    {normal_text:And now followed by a space and }
    *@@
    {normal_text: : follow }
    *@*
    {normal_text: }
    *@ 
    {normal_text:\\n}
    {normal_text:And now followed by a space and }
    *@@
    {normal_text: and text: follow }
    *@*
    {normal_text: }
    *@ 
    {normal_text:text\\n}
    {normal_text:Followed by empty asis and a space }
    *@asis C1 l20:@mymacro
     *brace_container
    {normal_text: \\n}
    {normal_text:Followed by asis with space and a space }
    *@asis C1 l20:@mymacro
     *brace_container C1
      {normal_text: }
    {normal_text: \\n}
    {normal_text:And now with * empty }
    *@@
    {normal_text:asis: }
    *@*
    *@asis C1 l20:@mymacro
     *brace_container
    {normal_text: \\n}
    {normal_text:And now with * asis with space }
    *@@
    {normal_text:asis: }
    *@*
    {normal_text: }
    *@asis C1 l20:@mymacro
     *brace_container C1
      {normal_text: }
    {normal_text:\\n}
    {normal_text:And end para.\\n}
    >SOURCEMARKS
    >macro_expansion<end;2><p:13>
   *@end C1 l21
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C5 l23
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C9
    {normal_text:Quotation\\n}
    {normal_text:Some text }
    >SOURCEMARKS
    >macro_expansion<start;3>
     >*macro_call@mymacro C1
      >*brace_arg
    *@*
    {normal_text:\\n}
    {normal_text:more text. }
    *@\\n
    {normal_text:Even more text. }
    *@*
    {normal_text: not at eol.\\n}
   {empty_line:\\n}
   *paragraph C40
    {normal_text:Now followed by }
    *@@
    {normal_text: : followed}
    *@*
    *@ 
    {normal_text:\\n}
    {normal_text:And now followed by a space and }
    *@@
    {normal_text: : follow }
    *@*
    {normal_text: }
    *@ 
    {normal_text:\\n}
    {normal_text:And now followed by a space and }
    *@@
    {normal_text: and text: follow }
    *@*
    {normal_text: }
    *@ 
    {normal_text:text\\n}
    {normal_text:Followed by empty asis and a space }
    *@asis C1 l25:@mymacro
     *brace_container
    {normal_text: \\n}
    {normal_text:Followed by asis with space and a space }
    *@asis C1 l25:@mymacro
     *brace_container C1
      {normal_text: }
    {normal_text: \\n}
    {normal_text:And now with * empty }
    *@@
    {normal_text:asis: }
    *@*
    *@asis C1 l25:@mymacro
     *brace_container
    {normal_text: \\n}
    {normal_text:And now with * asis with space }
    *@@
    {normal_text:asis: }
    *@*
    {normal_text: }
    *@asis C1 l25:@mymacro
     *brace_container C1
      {normal_text: }
    {normal_text:\\n}
    {normal_text:And end para.\\n}
    >SOURCEMARKS
    >macro_expansion<end;3><p:13>
   *@end C1 l26
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'star_at_command_formatting'} = '@macro mymacro
Some text @*
more text. @
Even more text. @* not at eol.

Now followed by @@ : followed@*@ 
And now followed by a space and @@ : follow @* @ 
And now followed by a space and @@ and text: follow @* @ text
Followed by empty asis and a space @asis{} 
Followed by asis with space and a space @asis{ } 
And now with * empty @@asis: @*@asis{} 
And now with * asis with space @@asis: @* @asis{ }
And end para.
@end macro

Some text @*
more text. @
Even more text. @* not at eol.

Now followed by @@ : followed@*@ 
And now followed by a space and @@ : follow @* @ 
And now followed by a space and @@ and text: follow @* @ text
Followed by empty asis and a space @asis{} 
Followed by asis with space and a space @asis{ } 
And now with * empty @@asis: @*@asis{} 
And now with * asis with space @@asis: @* @asis{ }
And end para.

@example
Example
Some text @*
more text. @
Even more text. @* not at eol.

Now followed by @@ : followed@*@ 
And now followed by a space and @@ : follow @* @ 
And now followed by a space and @@ and text: follow @* @ text
Followed by empty asis and a space @asis{} 
Followed by asis with space and a space @asis{ } 
And now with * empty @@asis: @*@asis{} 
And now with * asis with space @@asis: @* @asis{ }
And end para.
@end example

@quotation
Quotation
Some text @*
more text. @
Even more text. @* not at eol.

Now followed by @@ : followed@*@ 
And now followed by a space and @@ : follow @* @ 
And now followed by a space and @@ and text: follow @* @ text
Followed by empty asis and a space @asis{} 
Followed by asis with space and a space @asis{ } 
And now with * empty @@asis: @*@asis{} 
And now with * asis with space @@asis: @* @asis{ }
And end para.
@end quotation

';


$result_texts{'star_at_command_formatting'} = '
Some text 

more text.  Even more text. 
 not at eol.

Now followed by @ : followed
 
And now followed by a space and @ : follow 
  
And now followed by a space and @ and text: follow 
  text
Followed by empty asis and a space  
Followed by asis with space and a space   
And now with * empty @asis: 
 
And now with * asis with space @asis: 
  
And end para.

Example
Some text 

more text.  Even more text. 
 not at eol.

Now followed by @ : followed
 
And now followed by a space and @ : follow 
  
And now followed by a space and @ and text: follow 
  text
Followed by empty asis and a space  
Followed by asis with space and a space   
And now with * empty @asis: 
 
And now with * asis with space @asis: 
  
And end para.

Quotation
Some text 

more text.  Even more text. 
 not at eol.

Now followed by @ : followed
 
And now followed by a space and @ : follow 
  
And now followed by a space and @ and text: follow 
  text
Followed by empty asis and a space  
Followed by asis with space and a space   
And now with * empty @asis: 
 
And now with * asis with space @asis: 
  
And end para.

';

$result_errors{'star_at_command_formatting'} = '';

$result_nodes_list{'star_at_command_formatting'} = '';

$result_sections_list{'star_at_command_formatting'} = '';

$result_sectioning_root{'star_at_command_formatting'} = '';

$result_headings_list{'star_at_command_formatting'} = '';


$result_converted{'plaintext'}->{'star_at_command_formatting'} = 'Some text
more text.   Even more text.
not at eol.

   Now followed by @ : followed
  And now followed by a space and @ : follow
  And now followed by a space and @ and text: follow
 text Followed by empty asis and a space Followed by asis with space and
a space And now with * empty @asis:
And now with * asis with space @asis:
And end para.

     Example
     Some text

     more text.  Even more text.
      not at eol.

     Now followed by @ : followed
      
     And now followed by a space and @ : follow
       
     And now followed by a space and @ and text: follow
       text
     Followed by empty asis and a space
     Followed by asis with space and a space
     And now with * empty @asis:

     And now with * asis with space @asis:

     And end para.

     Quotation Some text
     more text.   Even more text.
     not at eol.

     Now followed by @ : followed
       And now followed by a space and @ : follow
       And now followed by a space and @ and text: follow
      text Followed by empty asis and a space Followed by asis with
     space and a space And now with * empty @asis:
     And now with * asis with space @asis:
     And end para.

';

1;
