use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'commands_and_spaces'} = '*document_root C2
 *before_node_section C2
  *before_beginning C2
   *normal_command@set C1
   |misc_args:A{foo|some @value}
    *line_arg C3
     {spaces_before_argument:  }
     {rawline_text:foo   some @value}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *preamble C4
   *normal_command@setfilename C1 l3
   |text_arg:{commands_and_spaces.info}
    *line_arg C3
     {spaces_before_argument:  }
     {normal_text:commands_and_spaces.info}
     {spaces_after_argument:  \\n}
   {empty_line:\\n}
   *normal_command@unmacro C1
   |misc_args:A{ggg}
    *line_arg C3
     {spaces_before_argument:  }
     {rawline_text:ggg}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C46 l7 {a}
 |identifier:{a}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C4
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:a}
    {spaces_after_argument: }
   *line_arg C3
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:b}
    {normal_text:)}
   *line_arg C4
   |manual_content:A{1|1}
    {normal_text:(}
    {normal_text:c}
    {normal_text:)}
    {spaces_after_argument: }
   *line_arg C5
   |manual_content:A{2|2}
    {spaces_before_argument: }
    {normal_text:(}
    {normal_text:d}
    {normal_text:)}
    {spaces_after_argument:   \\n}
  {empty_line:\\n}
  *normal_command@center C1 l9
   *line_arg C3
    {spaces_before_argument:  }
    {normal_text:centered}
    {spaces_after_argument:  \\n}
  {empty_line:\\n}
  *normal_command@indent l11
  {ignorable_spaces_after_command:  }
  *paragraph C1
  |indent:{1}
   {normal_text:after indent.\\n}
  {empty_line:\\n}
  *normal_command@indent l13
  {ignorable_spaces_after_command:\\n}
  *paragraph C1
  |indent:{1}
   {normal_text:line after indent\\n}
  {empty_line:\\n}
  *normal_command@indent l16
  {ignorable_spaces_after_command:  \\n}
  *paragraph C1
  |indent:{1}
   {normal_text:endof line with spaces line after indent\\n}
  {empty_line:\\n}
  *normal_command@image C5 l19
  |input_encoding_name:{utf-8}
   *brace_arg C3
    {spaces_before_argument: }
    {normal_text:a}
    {spaces_after_argument: }
   *brace_arg C1
    {normal_text:b}
   *brace_arg C2
    {normal_text:c}
    {spaces_after_argument: }
   *brace_arg C2
    {spaces_before_argument: }
    {normal_text:d}
   *brace_arg C2
    {normal_text:e}
    {spaces_after_argument: }
  {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@image C5 l21
  |input_encoding_name:{utf-8}
   *brace_arg C3
    {spaces_before_argument: }
    {normal_text:a}
    {spaces_after_argument: }
   *brace_arg C2
    {normal_text:b}
    {spaces_after_argument: \\n}
   *brace_arg C2
    {normal_text:c}
    {spaces_after_argument: }
   *brace_arg C2
    {spaces_before_argument: }
    {normal_text:d}
   *brace_arg C2
    {normal_text:e}
    {spaces_after_argument: }
  {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l24
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument:  }
     {normal_text:Note}
     {spaces_after_argument:  \\n}
   *paragraph C1
    {normal_text:Q\\n}
   *normal_command@end C1 l26
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@float C8 l28
  |float_number:{1}
  |float_type:{ff}
  |global_command_number:{1}
  |identifier:{b}
  |is_target:{1}
   *arguments_line C2
    *block_line_arg C3
     {spaces_before_argument:  }
     {normal_text:ff}
     {spaces_after_argument: }
    *block_line_arg C3
     {spaces_before_argument: }
     {normal_text:b}
     {spaces_after_argument:   \\n}
   *paragraph C1
    {normal_text:f\\n}
   *normal_command@caption C1 l30
    *brace_command_context C2
     {spaces_before_argument: }
     *paragraph C1
      {normal_text:In caption }
   *paragraph C1
    {normal_text:j.\\n}
   *normal_command@shortcaption C1 l31
    *brace_command_context C1
     *paragraph C1
      {normal_text:Short}
   {spaces_after_close_brace:  }
   *paragraph C1
    {normal_text:g.\\n}
   *normal_command@end C1 l32
   |text_arg:{float}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:float}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@multitable C2 l34
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C2
     {spaces_before_argument:  }
     *normal_command@columnfractions C1 l34
     |misc_args:A{0.4|0.6}
      *line_arg C3
       {spaces_before_argument:  }
       {normal_text:0.4  0.6}
       {spaces_after_argument:  \\n}
   *normal_command@end C1 l35
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@multitable C2 l37
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C8
     {spaces_before_argument:  }
     *bracketed_arg C1 l37
      {normal_text:aa b}
     {normal_text:  }
     *bracketed_arg C1 l37
      {normal_text: r }
     {normal_text:  }
     *normal_command@var C1 l37
      *brace_container C1
       {normal_text:cmd}
     {normal_text:gg hh j}
     {spaces_after_argument: \\n}
   *normal_command@end C1 l38
   |text_arg:{multitable}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:multitable}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@verbatim C3 l40
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:  \\n}
   {raw:in verbatim @g \\n}
   *normal_command@end C1 l42
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:verbatim}
     {spaces_after_argument: \\n}
  {empty_line:\\n}
  *normal_command@tex C3 l44
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:  \\n}
   *rawpreformatted C1
    {normal_text:in tex\\n}
   *normal_command@end C1 l46
   |text_arg:{tex}
    *line_arg C3
     {spaces_before_argument:  }
     {normal_text:tex}
     {spaces_after_argument:  \\n}
  {empty_line:\\n}
  *normal_command@example C3 l48
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:  \\n}
   *preformatted C1
    {normal_text:in example\\n}
   *normal_command@end C1 l50
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument:  }
     {normal_text:example}
     {spaces_after_argument:  \\n}
  {empty_line:\\n}
  *normal_command@table C3 l52
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument:  }
     *normal_command@strong l52
     {spaces_after_argument:  \\n}
   *table_entry C1
    *table_term C1
     *normal_command@item C1 l53
      *line_arg C3
       {spaces_before_argument:  }
       {normal_text:in item}
       {spaces_after_argument: \\n}
   *normal_command@end C1 l54
   |text_arg:{table}
    *line_arg C3
     {spaces_before_argument:   }
     {normal_text:table}
     {spaces_after_argument:   \\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:T}
   *normal_command@footnote C1 l56
   |global_command_number:{1}
    *brace_command_context C2
     {spaces_before_argument:  }
     *paragraph C1
      {normal_text:a}
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:Math }
   *normal_command@math C1 l58
    *brace_arg C4
     {spaces_before_argument: }
     {normal_text:\\underline}
     *balanced_braces C1 l58
      {normal_text:{ a, b}}
     {spaces_after_argument: }
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@indicateurl C1 l60
    *brace_container C1
     {normal_text: http://ggg }
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l62
   *def_line C1 l62
   |def_command:{deffn}
   |element_node:{a}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C3 l62
       {spaces_before_argument: }
       {normal_text:truc}
       {spaces_after_argument: }
     {spaces: }
     *def_name C1
      *bracketed_arg C3 l62
       {spaces_before_argument: }
       {normal_text:machin}
       {spaces_after_argument: }
     {spaces:  }
     *def_arg C1
      *bracketed_arg C3 l62
       {spaces_before_argument: }
       {normal_text:bidule}
       {spaces_after_argument: }
     {spaces:  }
     *def_arg C1
      *bracketed_arg C3 l62
       {spaces_before_argument:  }
       {normal_text:chose}
       {spaces_after_argument: }
     {spaces: }
     *def_arg C1
      *bracketed_arg C3 l62
       {spaces_before_argument:  }
       {normal_text:arg}
       {spaces_after_argument: }
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:T\\n}
   *normal_command@end C1 l64
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
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


$result_converted{'xml'}->{'commands_and_spaces'} = '<preamblebeforebeginning><set name="foo">  foo   some @value</set>

</preamblebeforebeginning><setfilename file="commands_and_spaces.info">  commands_and_spaces.info  </setfilename>

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
