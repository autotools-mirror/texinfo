use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comments_on_block_command_lines'} = '*document_root C1
 *before_node_section C41
  *preamble
  *normal_command@itemize C3 l1
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *normal_command@item C2 l2
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:itemize it\\n}
   *normal_command@end C1 l3
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l5
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:x}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *normal_command@item C2 l6
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:itemize xit\\n}
   *normal_command@end C1 l7
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l9
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *normal_command@bullet l9
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *normal_command@item C2 l10
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:itemize bulletit\\n}
   *normal_command@end C1 l11
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C3 l13
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *normal_command@bullet C1 l13
      *brace_container
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *normal_command@item C2 l14
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:itemize bullet with braces\\n}
   *normal_command@end C1 l15
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C3 l17
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *normal_command@item C2 l18
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:en\\n}
   *normal_command@end C1 l19
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@enumerate C3 l21
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:a}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *normal_command@item C2 l22
   |item_number:{1}
    {ignorable_spaces_after_command: }
    *paragraph C1
     {normal_text:aen\\n}
   *normal_command@end C1 l23
   |text_arg:{enumerate}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:enumerate}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@table C3 l25
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     *normal_command@asis l25
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:table}
       {spaces_after_argument:\\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l26
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:it}
       {spaces_after_argument:\\n}
   *normal_command@end C1 l27
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:table}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l29
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:quot no arg}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Quot no arg\\n}
   *normal_command@end C1 l31
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l33
   *arguments_line C1
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:quotarg}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:quot arg}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:Quot arg\\n}
   *normal_command@end C1 l35
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@group C3 l37
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:in gr\\n}
   *normal_command@end C1 l39
   |text_arg:{group}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:group}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l41
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:in ex\\n}
   *normal_command@end C1 l43
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l45
   *arguments_line C2
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:in }
     *normal_command@code C1 l45
      *brace_container C1
       {normal_text:first}
     {normal_text: arg}
    *block_line_arg C4
     {spaces_before_argument: }
     {normal_text:second arg}
     {spaces_after_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:in ex with arg\\n}
   *normal_command@end C1 l47
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l49
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
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:in ex 3 args\\n}
   *normal_command@end C1 l51
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l53
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
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:in ex 4 args\\n}
   *normal_command@end C1 l55
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@display C3 l57
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *preformatted C1
    {normal_text:in display\\n}
   *normal_command@end C1 l59
   |text_arg:{display}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:display}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@multitable C3 l61
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@columnfractions C1 l61
     |misc_args:A{0.4|0.6}
      *line_arg C4
       {spaces_before_argument: }
       {normal_text:0.4 0.6}
       {spaces_after_argument: }
       *normal_command@c C1
        *line_arg C3
         {spaces_before_argument: }
         {rawline_text:comm}
         {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |row_number:{1}
     *normal_command@item C2 l62
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:a }
     *normal_command@tab C2 l62
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:b\\n}
   *normal_command@end C1 l63
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@multitable C3 l65
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
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:c}
       {spaces_after_argument:\\n}
   *multitable_body C1
    *row C2
    |row_number:{1}
     *normal_command@item C2 l66
     |cell_number:{1}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:aaa }
     *normal_command@tab C2 l66
     |cell_number:{2}
      {ignorable_spaces_after_command: }
      *paragraph C1
       {normal_text:bbb\\n}
   *normal_command@end C1 l67
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C3 l69
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
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:In f\\n}
   *normal_command@end C1 l71
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@flushright C3 l73
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:flushright\\n}
   *normal_command@end C1 l75
   |text_arg:{flushright}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:flushright}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@raggedright C3 l77
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument: }
     *normal_command@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comm}
       {spaces_after_argument:\\n}
   *paragraph C1
    {normal_text:raggedright\\n}
   *normal_command@end C1 l79
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
