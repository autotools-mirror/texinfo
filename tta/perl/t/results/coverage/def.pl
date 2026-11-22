use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'def'} = '*document_root C1
 *before_node_section C7
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *normal_command@deffn C3 l2
   *def_line C1 l2
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l2
       {normal_text:c--ategory}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--effn_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--effn\\n}
   *normal_command@end C1 l4
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l6
   *def_line C1 l6
   |def_command:{deffn}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C19
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:cate--gory}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:de--ffn_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:ar--guments}
     {spaces:    }
     >SOURCEMARKS
     >defline_continuation<1><p:1>
     *def_arg C1
      *def_line_arg C1
       {normal_text:more}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:args}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@*
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:even}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:more}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:so}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:def--fn\\n}
   *normal_command@end C1 l9
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C17 l11
   *def_line C1 l11
   |def_command:{deffn}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:fset}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *normal_command@var C1 l11
        *brace_container C1
         {normal_text:i}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:g}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l12
   |def_command:{deffn}
   |index_entry:I{fn,4}
   |original_def_cmdname:{deffnx}
    *line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l12
       {normal_text:cmde}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces: }
     *def_arg C1
      *bracketed_arg l12
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l13
   |def_command:{deffn}
   |index_entry:I{fn,5}
   |original_def_cmdname:{deffnx}
    *line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Command}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l13
       {normal_text:log trap}
     {spaces: }
     *def_arg C1
      *bracketed_arg l13
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l14
   |def_command:{deffn}
   |index_entry:I{fn,6}
   |original_def_cmdname:{deffnx}
    *line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Command}
     {spaces: }
     *def_name C1
      *bracketed_arg C2 l14
       {spaces_before_argument: }
       {normal_text:log trap1}
     {spaces: }
     *def_arg C1
      *bracketed_arg l14
     {spaces_after_argument:  \\n}
   *normal_command@deffnx C1 l15
   |def_command:{deffn}
   |index_entry:I{fn,7}
   |original_def_cmdname:{deffnx}
    *line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Command}
     {spaces: }
     *def_name C1
      *bracketed_arg C2 l15
       {normal_text:log trap2}
       {spaces_after_argument: }
     {spaces: }
     *def_arg C1
      *bracketed_arg l15
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l16
   |def_command:{deffn}
   |index_entry:I{fn,8}
   |original_def_cmdname:{deffnx}
    *line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:cmde}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *normal_command@b C1 l16
        *brace_container C1
         {normal_text:id ule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l17
   |def_command:{deffn}
   |index_entry:I{fn,9}
   |original_def_cmdname:{deffnx}
    *line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:cmde2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *normal_command@b C1 l17
        *brace_container C3
         {normal_text:id }
         *normal_command@samp C1 l17
          *brace_container C1
           {normal_text:i}
         {normal_text: ule}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:truc}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l18
   |def_command:{deffn}
   |index_entry:I{fn,10}
   |original_def_cmdname:{deffnx}
    *line_arg C4
     *def_category C1
      *bracketed_arg l18
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l19
   |def_command:{deffn}
   |index_entry:I{fn,11}
   |original_def_cmdname:{deffnx}
    *line_arg C4
     *def_category C1
      *bracketed_arg l19
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l19
       {normal_text:bidule machin}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l20
   |def_command:{deffn}
   |index_entry:I{fn,12}
   |original_def_cmdname:{deffnx}
    *line_arg C4
     *def_category C1
      *bracketed_arg C1 l20
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:machin}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l21
   |def_command:{deffn}
   |index_entry:I{fn,13}
   |original_def_cmdname:{deffnx}
    *line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l21
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:followed}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:by}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:comment}
     {spaces_after_argument:\\n}
   *inter_def_item C1
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l23
   |def_command:{deffn}
   |index_entry:I{fn,14}
   |original_def_cmdname:{deffnx}
    *line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l23
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:after}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:deff}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:item}
     {spaces_after_argument:\\n}
   *inter_def_item C1
    *normal_command@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:comment}
      {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l25
   |def_command:{deffn}
   |index_entry:I{fn,15}
   |original_def_cmdname:{deffnx}
    *line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l25
       {normal_text:truc}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:deffnx}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:before}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:end}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:deffn}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:Various deff lines\\n}
   *normal_command@end C1 l27
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
';


$result_texis{'def'} = '
@deffn {c--ategory} d--effn_name a--rguments...
d--effn
@end deffn

@deffn cate--gory de--ffn_name ar--guments    more args @* even more so
def--fn
@end deffn

@deffn fset @var{i} a g
@deffnx {cmde} truc {}
@deffnx Command {log trap} {}
@deffnx Command { log trap1} {}  
@deffnx Command {log trap2 } {}
@deffnx cmde @b{id ule} truc
@deffnx cmde2 @b{id @samp{i} ule} truc
@deffnx{} machin
@deffnx{} {bidule machin}
@deffnx{truc} machin
@deffnx {truc} followed by a comment
@c comment
@deffnx {truc} after a deff item
@c comment
@deffnx {truc} deffnx before end deffn
Various deff lines
@end deffn
';


$result_texts{'def'} = 'c--ategory: d--effn_name a--rguments...
d-effn

cate--gory: de--ffn_name ar--guments    more args 
 even more so
def-fn

fset: i a g
cmde: truc 
Command: log trap 
Command: log trap1 
Command: log trap2 
cmde: id ule truc
cmde2: id i ule truc
: machin
: bidule machin
truc: machin
truc: followed by a comment
truc: after a deff item
truc: deffnx before end deffn
Various deff lines
';

$result_errors{'def'} = '* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l7|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l11|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l12|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l13|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l14|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l15|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l16|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l17|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l18|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l19|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l20|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l21|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l23|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l25|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'def'} = '';

$result_sections_list{'def'} = '';

$result_sectioning_root{'def'} = '';

$result_headings_list{'def'} = '';

$result_indices_sort_strings{'def'} = 'fn:
 after
 bidule machin
 d--effn_name
 de--ffn_name
 deffnx
 followed
 i
 id i ule
 id ule
 log trap
 log trap1
 log trap2
 machin
 machin
 truc
';


$result_converted{'plaintext'}->{'def'} = ' -- c-ategory: d--effn_name a--rguments...
     d-effn

 -- cate-gory: de--ffn_name ar--guments more args
          even more so
     def-fn

 -- fset: I a g
 -- cmde: truc
 -- Command: log trap
 -- Command: log trap1
 -- Command: log trap2
 -- cmde: id ule truc
 -- cmde2: id i ule truc
 -- : machin
 -- : bidule machin
 -- truc: machin
 -- truc: followed by a comment
 -- truc: after a deff item
 -- truc: deffnx before end deffn
     Various deff lines
';

$result_converted_sort_strings{'plaintext'}->{'def'} = 'fn:
 after
 bidule machin
 d--effn_name
 de--ffn_name
 deffnx
 followed
 i
 id i ule
 id ule
 log trap
 log trap1
 log trap2
 machin
 machin
 truc
';


$result_converted{'html_text'}->{'def'} = '<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-d_002d_002deffn_005fname"><span class="category-def">c&ndash;ategory: </span><span><strong class="def-name">d--effn_name</strong> <var class="def-var-arguments">a&ndash;rguments...</var><a class="copiable-link" href="#index-d_002d_002deffn_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;effn
</p></dd></dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-de_002d_002dffn_005fname"><span class="category-def">cate&ndash;gory: </span><span><strong class="def-name">de--ffn_name</strong> <var class="def-var-arguments">ar&ndash;guments    more args <br> even more so</var><a class="copiable-link" href="#index-de_002d_002dffn_005fname"> &para;</a></span></dt>
<dd><p>def&ndash;fn
</p></dd></dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-i"><span class="category-def">fset: </span><span><strong class="def-name"><var class="var">i</var></strong> <var class="def-var-arguments">a g</var><a class="copiable-link" href="#index-i"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-truc"><span class="category-def">cmde: </span><span><strong class="def-name">truc</strong><a class="copiable-link" href="#index-truc"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-log-trap"><span class="category-def">Command: </span><span><strong class="def-name">log trap</strong><a class="copiable-link" href="#index-log-trap"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-log-trap1"><span class="category-def">Command: </span><span><strong class="def-name">log trap1</strong><a class="copiable-link" href="#index-log-trap1"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-log-trap2"><span class="category-def">Command: </span><span><strong class="def-name">log trap2</strong><a class="copiable-link" href="#index-log-trap2"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-id-ule"><span class="category-def">cmde: </span><span><strong class="def-name"><b class="b">id ule</b></strong> <var class="def-var-arguments">truc</var><a class="copiable-link" href="#index-id-ule"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-id-i-ule"><span class="category-def">cmde2: </span><span><strong class="def-name"><b class="b">id &lsquo;<samp class="samp">i</samp>&rsquo; ule</b></strong> <var class="def-var-arguments">truc</var><a class="copiable-link" href="#index-id-i-ule"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-machin"><span class="category-def">: </span><span><strong class="def-name">machin</strong><a class="copiable-link" href="#index-machin"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-bidule-machin"><span class="category-def">: </span><span><strong class="def-name">bidule machin</strong><a class="copiable-link" href="#index-bidule-machin"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-machin-1"><span class="category-def">truc: </span><span><strong class="def-name">machin</strong><a class="copiable-link" href="#index-machin-1"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-followed"><span class="category-def">truc: </span><span><strong class="def-name">followed</strong> <var class="def-var-arguments">by a comment</var><a class="copiable-link" href="#index-followed"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-after"><span class="category-def">truc: </span><span><strong class="def-name">after</strong> <var class="def-var-arguments">a deff item</var><a class="copiable-link" href="#index-after"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-deffnx"><span class="category-def">truc: </span><span><strong class="def-name">deffnx</strong> <var class="def-var-arguments">before end deffn</var><a class="copiable-link" href="#index-deffnx"> &para;</a></span></dt>
<dd><p>Various deff lines
</p></dd></dl>
';


$result_converted{'xml'}->{'def'} = '<preamblebeforebeginning>
</preamblebeforebeginning><deffn endspaces=" "><definitionterm><indexterm index="fn" number="1">d--effn_name</indexterm> <defcategory bracketed="on">c--ategory</defcategory> <deffunction>d--effn_name</deffunction> <defparam>a--rguments...</defparam></definitionterm>
<definitionitem><para>d&textndash;effn
</para></definitionitem></deffn>

<deffn endspaces=" "><definitionterm><indexterm index="fn" number="2">de--ffn_name</indexterm> <defcategory>cate--gory</defcategory> <deffunction>de--ffn_name</deffunction> <defparam>ar--guments</defparam>    <defparam>more</defparam> <defparam>args</defparam> <defparam>&linebreak;</defparam> <defparam>even</defparam> <defparam>more</defparam> <defparam>so</defparam></definitionterm>
<definitionitem><para>def&textndash;fn
</para></definitionitem></deffn>

<deffn endspaces=" "><definitionterm><indexterm index="fn" number="3"><var>i</var></indexterm> <defcategory>fset</defcategory> <deffunction><var>i</var></deffunction> <defparam>a</defparam> <defparam>g</defparam></definitionterm>
<deffnx><definitionterm><indexterm index="fn" number="4">truc</indexterm> <defcategory bracketed="on">cmde</defcategory> <deffunction>truc</deffunction> <defparam bracketed="on"></defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="5">log trap</indexterm> <defcategory>Command</defcategory> <deffunction bracketed="on">log trap</deffunction> <defparam bracketed="on"></defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="6"> log trap1</indexterm> <defcategory>Command</defcategory> <deffunction bracketed="on"> log trap1</deffunction> <defparam bracketed="on"></defparam>  </definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="7">log trap2 </indexterm> <defcategory>Command</defcategory> <deffunction bracketed="on">log trap2 </deffunction> <defparam bracketed="on"></defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="8"><b>id ule</b></indexterm> <defcategory>cmde</defcategory> <deffunction><b>id ule</b></deffunction> <defparam>truc</defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="9"><b>id <samp>i</samp> ule</b></indexterm> <defcategory>cmde2</defcategory> <deffunction><b>id <samp>i</samp> ule</b></deffunction> <defparam>truc</defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="10">machin</indexterm><defcategory bracketed="on"></defcategory> <deffunction>machin</deffunction></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="11">bidule machin</indexterm><defcategory bracketed="on"></defcategory> <deffunction bracketed="on">bidule machin</deffunction></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="12">machin</indexterm><defcategory bracketed="on">truc</defcategory> <deffunction>machin</deffunction></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="13">followed</indexterm> <defcategory bracketed="on">truc</defcategory> <deffunction>followed</deffunction> <defparam>by</defparam> <defparam>a</defparam> <defparam>comment</defparam></definitionterm></deffnx>
<!-- c comment -->
<deffnx><definitionterm><indexterm index="fn" number="14">after</indexterm> <defcategory bracketed="on">truc</defcategory> <deffunction>after</deffunction> <defparam>a</defparam> <defparam>deff</defparam> <defparam>item</defparam></definitionterm></deffnx>
<!-- c comment -->
<deffnx><definitionterm><indexterm index="fn" number="15">deffnx</indexterm> <defcategory bracketed="on">truc</defcategory> <deffunction>deffnx</deffunction> <defparam>before</defparam> <defparam>end</defparam> <defparam>deffn</defparam></definitionterm></deffnx>
<definitionitem><para>Various deff lines
</para></definitionitem></deffn>
';


$result_converted{'latex_text'}->{'def'} = '\\begin{document}

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{d{-}{-}effn\\_name \\EmbracOn{}\\textnormal{\\textsl{a--rguments...}}\\EmbracOff{}}& [c--ategory]
\\end{tabularx}

\\index[fn]{d--effn\\_name@\\texttt{d{-}{-}effn\\_name}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
d--effn
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{de{-}{-}ffn\\_name \\EmbracOn{}\\textnormal{\\textsl{ar--guments    more args   even more so}}\\EmbracOff{}}& [cate--gory]
\\end{tabularx}

\\index[fn]{de--ffn\\_name@\\texttt{de{-}{-}ffn\\_name}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
def--fn
\\end{Texinfoindented}


\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{\\Texinfocommandstyletextvar{i} \\EmbracOn{}\\textnormal{\\textsl{a g}}\\EmbracOff{}}& [fset]
\\end{tabularx}

\\index[fn]{i@\\texttt{\\Texinfocommandstyletextvar{i}}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{truc \\EmbracOn{}\\textnormal{\\textsl{}}\\EmbracOff{}}& [cmde]
\\end{tabularx}

\\index[fn]{truc@\\texttt{truc}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{log trap \\EmbracOn{}\\textnormal{\\textsl{}}\\EmbracOff{}}& [Command]
\\end{tabularx}

\\index[fn]{log trap@\\texttt{log trap}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{log trap1 \\EmbracOn{}\\textnormal{\\textsl{}}\\EmbracOff{}}& [Command]
\\end{tabularx}

\\index[fn]{log trap1@\\texttt{log trap1}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{log trap2 \\EmbracOn{}\\textnormal{\\textsl{}}\\EmbracOff{}}& [Command]
\\end{tabularx}

\\index[fn]{log trap2@\\texttt{log trap2}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{\\textbf{id ule} \\EmbracOn{}\\textnormal{\\textsl{truc}}\\EmbracOff{}}& [cmde]
\\end{tabularx}

\\index[fn]{id ule@\\texttt{\\textbf{id ule}}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{\\textbf{id `\\texttt{i}\'\\ ule} \\EmbracOn{}\\textnormal{\\textsl{truc}}\\EmbracOff{}}& [cmde2]
\\end{tabularx}

\\index[fn]{id i ule@\\texttt{\\textbf{id `\\texttt{i}\'\\ ule}}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{machin}& []
\\end{tabularx}

\\index[fn]{machin@\\texttt{machin}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{bidule machin}& []
\\end{tabularx}

\\index[fn]{bidule machin@\\texttt{bidule machin}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{machin}& [truc]
\\end{tabularx}

\\index[fn]{machin@\\texttt{machin}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{followed \\EmbracOn{}\\textnormal{\\textsl{by a comment}}\\EmbracOff{}}& [truc]
\\end{tabularx}

\\index[fn]{followed@\\texttt{followed}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{after \\EmbracOn{}\\textnormal{\\textsl{a deff item}}\\EmbracOff{}}& [truc]
\\end{tabularx}

\\index[fn]{after@\\texttt{after}}%

\\smallbreak
\\noindent\\begin{tabularx}{\\linewidth}{@{}Xr}
\\rightskip=5em plus 1 fill \\hangindent=2em \\hyphenpenalty=10000
\\texttt{deffnx \\EmbracOn{}\\textnormal{\\textsl{before end deffn}}\\EmbracOff{}}& [truc]
\\end{tabularx}

\\index[fn]{deffnx@\\texttt{deffnx}}%
\\begin{Texinfoindented}
\\unskip{\\parskip=0pt\\noindent}%
Various deff lines
\\end{Texinfoindented}
';


$result_converted{'docbook'}->{'def'} = '<synopsis><indexterm role="fn"><primary>d--effn_name</primary></indexterm><phrase role="category"><emphasis role="bold">c--ategory</emphasis>:</phrase> <function>d--effn_name</function> <emphasis role="arg">a--rguments...</emphasis></synopsis>
<blockquote><para>d&#8211;effn
</para></blockquote>
<synopsis><indexterm role="fn"><primary>de--ffn_name</primary></indexterm><phrase role="category"><emphasis role="bold">cate--gory</emphasis>:</phrase> <function>de--ffn_name</function> <emphasis role="arg">ar--guments</emphasis>    <emphasis role="arg">more</emphasis> <emphasis role="arg">args</emphasis> <emphasis role="arg">
</emphasis> <emphasis role="arg">even</emphasis> <emphasis role="arg">more</emphasis> <emphasis role="arg">so</emphasis></synopsis>
<blockquote><para>def&#8211;fn
</para></blockquote>
<synopsis><indexterm role="fn"><primary><replaceable>i</replaceable></primary></indexterm><phrase role="category"><emphasis role="bold">fset</emphasis>:</phrase> <function><replaceable>i</replaceable></function> <emphasis role="arg">a</emphasis> <emphasis role="arg">g</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>truc</primary></indexterm><phrase role="category"><emphasis role="bold">cmde</emphasis>:</phrase> <function>truc</function> <emphasis role="arg"></emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>log trap</primary></indexterm><phrase role="category"><emphasis role="bold">Command</emphasis>:</phrase> <function>log trap</function> <emphasis role="arg"></emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>log trap1</primary></indexterm><phrase role="category"><emphasis role="bold">Command</emphasis>:</phrase> <function>log trap1</function> <emphasis role="arg"></emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>log trap2</primary></indexterm><phrase role="category"><emphasis role="bold">Command</emphasis>:</phrase> <function>log trap2</function> <emphasis role="arg"></emphasis></synopsis>
<synopsis><indexterm role="fn"><primary><emphasis role="bold">id ule</emphasis></primary></indexterm><phrase role="category"><emphasis role="bold">cmde</emphasis>:</phrase> <function><emphasis role="bold">id ule</emphasis></function> <emphasis role="arg">truc</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary><emphasis role="bold">id &#8216;<literal>i</literal>&#8217; ule</emphasis></primary></indexterm><phrase role="category"><emphasis role="bold">cmde2</emphasis>:</phrase> <function><emphasis role="bold">id &#8216;i&#8217; ule</emphasis></function> <emphasis role="arg">truc</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>machin</primary></indexterm><phrase role="category"><emphasis role="bold"></emphasis>:</phrase> <function>machin</function></synopsis>
<synopsis><indexterm role="fn"><primary>bidule machin</primary></indexterm><phrase role="category"><emphasis role="bold"></emphasis>:</phrase> <function>bidule machin</function></synopsis>
<synopsis><indexterm role="fn"><primary>machin</primary></indexterm><phrase role="category"><emphasis role="bold">truc</emphasis>:</phrase> <function>machin</function></synopsis>
<synopsis><indexterm role="fn"><primary>followed</primary></indexterm><phrase role="category"><emphasis role="bold">truc</emphasis>:</phrase> <function>followed</function> <emphasis role="arg">by</emphasis> <emphasis role="arg">a</emphasis> <emphasis role="arg">comment</emphasis></synopsis>
<!-- comment -->
<synopsis><indexterm role="fn"><primary>after</primary></indexterm><phrase role="category"><emphasis role="bold">truc</emphasis>:</phrase> <function>after</function> <emphasis role="arg">a</emphasis> <emphasis role="arg">deff</emphasis> <emphasis role="arg">item</emphasis></synopsis>
<!-- comment -->
<synopsis><indexterm role="fn"><primary>deffnx</primary></indexterm><phrase role="category"><emphasis role="bold">truc</emphasis>:</phrase> <function>deffnx</function> <emphasis role="arg">before</emphasis> <emphasis role="arg">end</emphasis> <emphasis role="arg">deffn</emphasis></synopsis>
<blockquote><para>Various deff lines
</para></blockquote>';

1;
