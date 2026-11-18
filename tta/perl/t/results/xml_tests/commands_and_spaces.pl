use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'commands_and_spaces'} = '*document_root C2
 *before_node_section C2
  *preamble_before_setfilename C2
   *@set C1
   |EXTRA
   |misc_args:A{foo|some @value}
    *line_arg C3
     {spaces_before_argument:  }
     {rawline_text:foo   some @value}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *preamble_before_content C4
   *@setfilename C1 l3
   |EXTRA
   |text_arg:{commands_and_spaces.info}
    *line_arg C3
     {spaces_before_argument:  }
     {commands_and_spaces.info}
     {spaces_after_argument:  \\n}
   {empty_line:\\n}
   *@unmacro C1
   |EXTRA
   |misc_args:A{ggg}
    *line_arg C3
     {spaces_before_argument:  }
     {rawline_text:ggg}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *@node C46 l7 {a}
 |EXTRA
 |identifier:{a}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C3
    {spaces_before_argument: }
    {a}
    {spaces_after_argument: }
   *line_arg C3
   |EXTRA
   |manual_content:A{1|1}
    {(}
    {b}
    {)}
   *line_arg C4
   |EXTRA
   |manual_content:A{1|1}
    {(}
    {c}
    {)}
    {spaces_after_argument: }
   *line_arg C5
   |EXTRA
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {(}
    {d}
    {)}
    {spaces_after_argument:   \\n}
  {empty_line:\\n}
  *@center C1 l9
   *line_arg C3
    {spaces_before_argument:  }
    {centered}
    {spaces_after_argument:  \\n}
  {empty_line:\\n}
  *@indent l11
  {ignorable_spaces_after_command:  }
  *paragraph C1
  |EXTRA
  |indent:{1}
   {after indent.\\n}
  {empty_line:\\n}
  *@indent l13
  {ignorable_spaces_after_command:\\n}
  *paragraph C1
  |EXTRA
  |indent:{1}
   {line after indent\\n}
  {empty_line:\\n}
  *@indent l16
  {ignorable_spaces_after_command:  \\n}
  *paragraph C1
  |EXTRA
  |indent:{1}
   {endof line with spaces line after indent\\n}
  {empty_line:\\n}
  *@image C5 l19
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C3
    {spaces_before_argument: }
    {a}
    {spaces_after_argument: }
   *brace_arg C1
    {b}
   *brace_arg C2
    {c}
    {spaces_after_argument: }
   *brace_arg C2
    {spaces_before_argument: }
    {d}
   *brace_arg C2
    {e}
    {spaces_after_argument: }
  {\\n}
  {empty_line:\\n}
  *@image C5 l21
  |EXTRA
  |input_encoding_name:{utf-8}
   *brace_arg C3
    {spaces_before_argument: }
    {a}
    {spaces_after_argument: }
   *brace_arg C2
    {b}
    {spaces_after_argument: \\n}
   *brace_arg C2
    {c}
    {spaces_after_argument: }
   *brace_arg C2
    {spaces_before_argument: }
    {d}
   *brace_arg C2
    {e}
    {spaces_after_argument: }
  {\\n}
  {empty_line:\\n}
  *@quotation C3 l24
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument:  }
     {Note}
     {spaces_after_argument:  \\n}
   *paragraph C1
    {Q\\n}
   *@end C1 l26
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@float C8 l28
  |EXTRA
  |float_number:{1}
  |float_type:{ff}
  |global_command_number:{1}
  |identifier:{b}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C3
     {spaces_before_argument:  }
     {ff}
     {spaces_after_argument: }
    *block_line_arg C3
     {spaces_before_argument: }
     {b}
     {spaces_after_argument:   \\n}
   *paragraph C1
    {f\\n}
   *@caption C1 l30
    *brace_command_context C2
     {spaces_before_argument: }
     *paragraph C1
      {In caption }
   *paragraph C1
    {j.\\n}
   *@shortcaption C1 l31
    *brace_command_context C1
     *paragraph C1
      {Short}
   {spaces_after_close_brace:  }
   *paragraph C1
    {g.\\n}
   *@end C1 l32
   |EXTRA
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@multitable C2 l34
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument:  }
     *@columnfractions C1 l34
     |EXTRA
     |misc_args:A{0.4|0.6}
      *line_arg C3
       {spaces_before_argument:  }
       {0.4  0.6}
       {spaces_after_argument:  \\n}
   *@end C1 l35
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@multitable C2 l37
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C8
     {spaces_before_argument:  }
     *bracketed_arg C1 l37
      {aa b}
     {  }
     *bracketed_arg C1 l37
      { r }
     {  }
     *@var C1 l37
      *brace_container C1
       {cmd}
     {gg hh j}
     {spaces_after_argument: \\n}
   *@end C1 l38
   |EXTRA
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@verbatim C3 l40
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:  \\n}
   {raw:in verbatim @g \\n}
   *@end C1 l42
   |EXTRA
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {verbatim}
     {spaces_after_argument: \\n}
  {empty_line:\\n}
  *@tex C3 l44
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:  \\n}
   *rawpreformatted C1
    {in tex\\n}
   *@end C1 l46
   |EXTRA
   |text_arg:{tex}
    *line_arg C3
     {spaces_before_argument:  }
     {tex}
     {spaces_after_argument:  \\n}
  {empty_line:\\n}
  *@example C3 l48
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:  \\n}
   *preformatted C1
    {in example\\n}
   *@end C1 l50
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument:  }
     {example}
     {spaces_after_argument:  \\n}
  {empty_line:\\n}
  *@table C3 l52
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument:  }
     *@strong l52
     {spaces_after_argument:  \\n}
   *table_entry C1
    *table_term C1
     *@item C1 l53
      *line_arg C3
       {spaces_before_argument:  }
       {in item}
       {spaces_after_argument: \\n}
   *@end C1 l54
   |EXTRA
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument:   }
     {table}
     {spaces_after_argument:   \\n}
  {empty_line:\\n}
  *paragraph C3
   {T}
   *@footnote C1 l56
   |EXTRA
   |global_command_number:{1}
    *brace_command_context C2
     {spaces_before_argument:  }
     *paragraph C1
      {a}
   {.\\n}
  {empty_line:\\n}
  *paragraph C3
   {Math }
   *@math C1 l58
    *brace_arg C4
     {spaces_before_argument: }
     {\\underline}
     *balanced_braces C1 l58
      {{ a, b}}
     {spaces_after_argument: }
   {.\\n}
  {empty_line:\\n}
  *paragraph C2
   *@indicateurl C1 l60
    *brace_container C1
     { http://ggg }
   {\\n}
  {empty_line:\\n}
  *@deffn C3 l62
   *def_line C1 l62
   |EXTRA
   |def_command:{deffn}
   |element_node:{a}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C3 l62
       {spaces_before_argument: }
       {truc}
       {spaces_after_argument: }
     {spaces: }
     *def_name C1
      *bracketed_arg C3 l62
       {spaces_before_argument: }
       {machin}
       {spaces_after_argument: }
     {spaces:  }
     *def_arg C1
      *bracketed_arg C3 l62
       {spaces_before_argument: }
       {bidule}
       {spaces_after_argument: }
     {spaces:  }
     *def_arg C1
      *bracketed_arg C3 l62
       {spaces_before_argument:  }
       {chose}
       {spaces_after_argument: }
     {spaces: }
     *def_arg C1
      *bracketed_arg C3 l62
       {spaces_before_argument:  }
       {arg}
       {spaces_after_argument: }
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {T\\n}
   *@end C1 l64
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'commands_and_spaces'} = '@set  foo   some @value

@setfilename  commands_and_spaces.info  

@unmacro  ggg

@node a ,(b),(c) , (d)   

@center  centered  

@indent  after indent.

@indent
line after indent

@indent  
endof line with spaces line after indent

@image{ a ,b,c , d,e }

@image{ a ,b 
,c , d,e }

@quotation  Note  
Q
@end quotation

@float  ff , b   
f
@caption{ In caption }j.
@shortcaption{Short}  g.
@end float

@multitable  @columnfractions  0.4  0.6  
@end multitable

@multitable  {aa b}  { r }  @var{cmd}gg hh j 
@end multitable

@verbatim  
in verbatim @g 
@end verbatim 

@tex  
in tex
@end  tex  

@example  
in example
@end  example  

@table  @strong  
@item  in item 
@end   table   

T@footnote{  a}.

Math @math{ \\underline{ a, b} }.

@indicateurl{ http://ggg }

@deffn { truc } { machin }  { bidule }  {  chose } {  arg }
T
@end deffn

';


$result_texts{'commands_and_spaces'} = '


centered

after indent.

line after indent

endof line with spaces line after indent

a

a

Note
Q

ff, b
f
j.
g.



in verbatim @g 

in tex

in example

in item

T.

Math \\underline{ a, b}.

 http://ggg 

truc: machin bidule  chose arg
T

';

$result_errors{'commands_and_spaces'} = '* W l37|unexpected argument on @multitable line: @var{cmd}
 warning: unexpected argument on @multitable line: @var{cmd}

';

$result_floats{'commands_and_spaces'} = 'ff: 1
 F1: {b}
  S: Short
  C: In caption 
';

$result_nodes_list{'commands_and_spaces'} = '1|a
 node_directions:
  next->(b)
  prev->(c) 
  up-> (d)   

';

$result_sections_list{'commands_and_spaces'} = '';

$result_sectioning_root{'commands_and_spaces'} = '';

$result_headings_list{'commands_and_spaces'} = '';

$result_indices_sort_strings{'commands_and_spaces'} = 'fn:
 machin
';


$result_converted{'xml'}->{'commands_and_spaces'} = '<set name="foo">  foo   some @value</set>

<setfilename file="commands_and_spaces.info">  commands_and_spaces.info  </setfilename>

<unmacro name="ggg">  ggg</unmacro>

<node identifier="a"><nodename> a</nodename><nodenext>(b)</nodenext><nodeprev>(c)</nodeprev><nodeup> (d)</nodeup></node>

<center>  centered  </center>

<indent></indent>  <para>after indent.
</para>
<indent></indent>
<para>line after indent
</para>
<indent></indent>  
<para>endof line with spaces line after indent
</para>
<image><imagefile> a </imagefile><imagewidth>b</imagewidth><imageheight>c </imageheight><alttext> d</alttext><imageextension>e </imageextension></image>

<image><imagefile> a </imagefile><imagewidth>b 
</imagewidth><imageheight>c </imageheight><alttext> d</alttext><imageextension>e </imageextension></image>

<quotation endspaces=" "><quotationtype>  Note  </quotationtype>
<para>Q
</para></quotation>

<float identifier="b" type="ff" number="1" endspaces=" "><floattype>  ff </floattype><floatname> b   </floatname>
<para>f
</para><caption> <para>In caption </para></caption><para>j.
</para><shortcaption><para>Short</para></shortcaption>  <para>g.
</para></float>

<multitable endspaces=" "><columnfractions line="  0.4  0.6  "><columnfraction value="0.4"></columnfraction><columnfraction value="0.6"></columnfraction></columnfractions>
</multitable>

<multitable endspaces=" "><columnprototypes>  <columnprototype bracketed="on">aa b</columnprototype>  <columnprototype bracketed="on"> r </columnprototype>  <var>cmd</var>gg hh j 
</columnprototypes>
</multitable>

<verbatim xml:space="preserve" endspaces=" ">  
in verbatim @g 
</verbatim> 

<tex endspaces="  ">  
in tex
</tex>  

<example endspaces="  ">  
<pre xml:space="preserve">in example
</pre></example>  

<table commandarg="strong" endspaces="   ">  
<tableentry><tableterm><item><itemformat command="strong">  in item </itemformat></item>
</tableterm></tableentry></table>   

<para>T<footnote>  <para>a</para></footnote>.
</para>
<para>Math <math> \\underline{ a, b} </math>.
</para>
<para><indicateurl> http://ggg </indicateurl>
</para>
<deffn endspaces=" "><definitionterm><indexterm index="fn" number="1"> machin </indexterm> <defcategory bracketed="on"> truc </defcategory> <deffunction bracketed="on"> machin </deffunction>  <defparam bracketed="on"> bidule </defparam>  <defparam bracketed="on">  chose </defparam> <defparam bracketed="on">  arg </defparam></definitionterm>
<definitionitem><para>T
</para></definitionitem></deffn>

';

1;
