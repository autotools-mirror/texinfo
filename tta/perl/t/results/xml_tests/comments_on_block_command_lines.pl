use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comments_on_block_command_lines'} = '*document_root C1
 *before_node_section C41
  *preamble_before_content
  *@itemize C3 l1
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *@item C2 l2
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:itemize it\\n}
   *@end C1 l3
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l5
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:x}
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *@item C2 l6
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:itemize xit\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l9
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@bullet l9
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *@item C2 l10
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:itemize bulletit\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@itemize C3 l13
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@bullet C1 l13
      *brace_container
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *@item C2 l14
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:itemize bullet with braces\\n}
   *@end C1 l15
   |EXTRA
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C3 l17
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *@item C2 l18
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:en\\n}
   *@end C1 l19
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@enumerate C3 l21
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:a}
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *@item C2 l22
   |EXTRA
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aen\\n}
   *@end C1 l23
   |EXTRA
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@table C3 l25
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *@asis l25
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:table}
       {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *@item C1 l26
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:it}
       {spaces_after_argument:\\n}
   *@end C1 l27
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C3 l29
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:quot no arg}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Quot no arg\\n}
   *@end C1 l31
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@quotation C3 l33
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:quotarg}
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:quot arg}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Quot arg\\n}
   *@end C1 l35
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@group C3 l37
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:in gr\\n}
   *@end C1 l39
   |EXTRA
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@example C3 l41
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:in ex\\n}
   *@end C1 l43
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@example C3 l45
   *arguments_line C2
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:in }
     *@code C1 l45
      *brace_container C1
       {normal_text:first}
     {normal_text: arg}
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:second arg}
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:in ex with arg\\n}
   *@end C1 l47
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@example C3 l49
   *arguments_line C3
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:first}
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:second}
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:third}
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:in ex 3 args\\n}
   *@end C1 l51
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@example C3 l53
   *arguments_line C4
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:first}
    *block_line_arg C1
     {normal_text:second}
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:third}
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:fourth}
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:in ex 4 args\\n}
   *@end C1 l55
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@display C3 l57
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:in display\\n}
   *@end C1 l59
   |EXTRA
   |text_arg:{display}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:display}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@multitable C3 l61
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@columnfractions C1 l61
     |EXTRA
     |misc_args:A{0.4|0.6}
      *line_arg C4
       {spaces_before_argument: }
       {normal_text:0.4 0.6}
       {spaces_after_argument: }
       *@c C1
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:comm}
         {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l62
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:a }
     *@tab C2 l62
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:b\\n}
   *@end C1 l63
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@multitable C3 l65
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C6
     {spaces_before_argument: }
     *bracketed_arg C1 l65
      {normal_text:aaa}
     {normal_text: }
     *bracketed_arg C1 l65
      {normal_text:bbb}
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:c}
       {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |EXTRA
    |row_number:{1}
     *@item C2 l66
     |EXTRA
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:aaa }
     *@tab C2 l66
     |EXTRA
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:bbb\\n}
   *@end C1 l67
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@float C3 l69
  |EXTRA
  |float_number:{1}
  |float_type:{f}
  |global_command_number:{1}
  |identifier:{g}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C2
     {spaces_before_argument: }
     {normal_text:f}
    *block_line_arg C3
     {normal_text:g}
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In f\\n}
   *@end C1 l71
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@flushright C3 l73
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:flushright\\n}
   *@end C1 l75
   |EXTRA
   |text_arg:{flushright}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushright}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@raggedright C3 l77
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:raggedright\\n}
   *@end C1 l79
   |EXTRA
   |text_arg:{raggedright}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:raggedright}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'comments_on_block_command_lines'} = '@itemize @c comm
@item itemize it
@end itemize

@itemize x @c comm
@item itemize xit
@end itemize

@itemize @bullet @c comm
@item itemize bulletit
@end itemize

@itemize @bullet{} @c comm
@item itemize bullet with braces
@end itemize

@enumerate @c comm
@item en
@end enumerate

@enumerate a @c comm
@item aen
@end enumerate

@table @asis @c table
@item it
@end table

@quotation @c quot no arg
Quot no arg
@end quotation

@quotation quotarg @c quot arg
Quot arg
@end quotation

@group @c comm
in gr
@end group

@example @c comm
in ex
@end example

@example in @code{first} arg, second arg @c comm
in ex with arg
@end example

@example first, second, third @c comm
in ex 3 args
@end example

@example first,second, third, fourth @c comm
in ex 4 args
@end example

@display @c comm
in display
@end display

@multitable @columnfractions 0.4 0.6 @c comm
@item a @tab b
@end multitable

@multitable {aaa} {bbb} @c c
@item aaa @tab bbb
@end multitable

@float f,g @c comm
In f
@end float

@flushright @c comm
flushright
@end flushright

@raggedright @c comm
raggedright
@end raggedright

';


$result_texts{'comments_on_block_command_lines'} = 'itemize it

itemize xit

itemize bulletit

itemize bullet with braces

1. en

a. aen

it

Quot no arg

quotarg
Quot arg

in gr

in ex

in ex with arg

in ex 3 args

in ex 4 args

in display

a b

aaa bbb

f, g
In f

flushright

raggedright

';

$result_errors{'comments_on_block_command_lines'} = '';

$result_floats{'comments_on_block_command_lines'} = 'f: 1
 F1: {g}
';

$result_nodes_list{'comments_on_block_command_lines'} = '';

$result_sections_list{'comments_on_block_command_lines'} = '';

$result_sectioning_root{'comments_on_block_command_lines'} = '';

$result_headings_list{'comments_on_block_command_lines'} = '';


$result_converted{'xml'}->{'comments_on_block_command_lines'} = '<itemize endspaces=" "> <!-- c comm -->
<listitem><prepend>&bullet;</prepend> <para>itemize it
</para></listitem></itemize>

<itemize endspaces=" "><itemprepend> x </itemprepend><!-- c comm -->
<listitem><prepend>x</prepend> <para>itemize xit
</para></listitem></itemize>

<itemize commandarg="bullet" endspaces=" "><itemprepend> <formattingcommand command="bullet"/> </itemprepend><!-- c comm -->
<listitem><prepend>&bullet;</prepend> <para>itemize bulletit
</para></listitem></itemize>

<itemize commandarg="bullet" endspaces=" "><itemprepend> &bullet; </itemprepend><!-- c comm -->
<listitem><prepend>&bullet;</prepend> <para>itemize bullet with braces
</para></listitem></itemize>

<enumerate first="1" endspaces=" "> <!-- c comm -->
<listitem> <para>en
</para></listitem></enumerate>

<enumerate first="a" endspaces=" "><enumeratefirst> a </enumeratefirst><!-- c comm -->
<listitem> <para>aen
</para></listitem></enumerate>

<table commandarg="asis" endspaces=" "> <!-- c table -->
<tableentry><tableterm><item><itemformat command="asis"> it</itemformat></item>
</tableterm></tableentry></table>

<quotation endspaces=" "> <!-- c quot no arg -->
<para>Quot no arg
</para></quotation>

<quotation endspaces=" "><quotationtype> quotarg </quotationtype><!-- c quot arg -->
<para>Quot arg
</para></quotation>

<group endspaces=" "> <!-- c comm -->
<para>in gr
</para></group>

<example endspaces=" "> <!-- c comm -->
<pre xml:space="preserve">in ex
</pre></example>

<example endspaces=" "><examplelanguage> in <code>first</code> arg</examplelanguage><examplearg> second arg </examplearg><!-- c comm -->
<pre xml:space="preserve">in ex with arg
</pre></example>

<example endspaces=" "><examplelanguage> first</examplelanguage><examplearg> second</examplearg><examplearg> third </examplearg><!-- c comm -->
<pre xml:space="preserve">in ex 3 args
</pre></example>

<example endspaces=" "><examplelanguage> first</examplelanguage><examplearg>second</examplearg><examplearg> third</examplearg><examplearg> fourth </examplearg><!-- c comm -->
<pre xml:space="preserve">in ex 4 args
</pre></example>

<display endspaces=" "> <!-- c comm -->
<pre xml:space="preserve">in display
</pre></display>

<multitable endspaces=" "><columnfractions line=" 0.4 0.6 @c comm"><columnfraction value="0.4"></columnfraction><columnfraction value="0.6"></columnfraction></columnfractions><!-- c comm -->
<tbody><row><entry command="item"> <para>a </para></entry><entry command="tab"> <para>b
</para></entry></row></tbody></multitable>

<multitable endspaces=" "><columnprototypes> <columnprototype bracketed="on">aaa</columnprototype> <columnprototype bracketed="on">bbb</columnprototype> <!-- c c -->
</columnprototypes><!-- c c -->
<tbody><row><entry command="item"> <para>aaa </para></entry><entry command="tab"> <para>bbb
</para></entry></row></tbody></multitable>

<float identifier="g" type="f" number="1" endspaces=" "><floattype> f</floattype><floatname>g </floatname><!-- c comm -->
<para>In f
</para></float>

<flushright endspaces=" "> <!-- c comm -->
<para>flushright
</para></flushright>

<raggedright endspaces=" "> <!-- c comm -->
<para>raggedright
</para></raggedright>

';

1;
