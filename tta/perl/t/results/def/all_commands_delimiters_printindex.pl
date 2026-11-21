use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'all_commands_delimiters_printindex'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@node C105 l2 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
  *@xrefname C1 l3
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deffn C2 l5
   *def_line C1 l5
   |EXTRA
   |def_command:{deffn}
   |element_node:{chap}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C38
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Command}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l5
        *brace_container C1
         {forward--char}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l5
        *brace_container C1
         {nchars}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l5
       {argument2}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l5
       {argument3}
     {spaces:         }
     >SOURCEMARKS
     >defline_continuation<1><p:1>
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {in}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {brace}
     {delimiter:,}
     {spaces: }
     {delimiter:[}
     *def_arg C1
      *def_line_arg C1
       {something}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l6
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l6
        *brace_container C1
         {in, b}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l6
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l6
        *brace_container C1
         {pref}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {p}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {last}
     {spaces_after_argument:\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defvr C2 l9
   *def_line C1 l9
   |EXTRA
   |def_command:{defvr}
   |element_node:{chap}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defvr}
    *block_line_arg C36
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Variable}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {fill-column}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l9
       {argument1}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l9
       {argument2}
     {spaces:         }
     >SOURCEMARKS
     >defline_continuation<2><p:1>
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {in}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {brace}
     {delimiter:,}
     {spaces: }
     {delimiter:[}
     *def_arg C1
      *def_line_arg C1
       {something}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l10
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l10
        *brace_container C1
         {in, b}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l10
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l10
        *brace_container C1
         {pref}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {p}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {last}
     {spaces_after_argument:\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{defvr}
    *line_arg C3
     {spaces_before_argument: }
     {defvr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l13
   *def_line C1 l13
   |EXTRA
   |def_command:{deftypefn}
   |element_node:{chap}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C18
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l13
       {Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foobar}
     {spaces: }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l13
        *brace_container C1
         {foo}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l13
        *brace_container C1
         {bar}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *@end C1 l14
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l16
   *def_line C1 l16
   |EXTRA
   |def_command:{deftypefn}
   |element_node:{chap}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C48
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l16
       {Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foobar}
     {spaces: }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l16
        *brace_container C1
         {foo}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l16
        *brace_container C1
         {bar}
     {delimiter:)}
     {spaces:         }
     >SOURCEMARKS
     >defline_continuation<3><p:1>
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {in}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {brace}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *bracketed_arg C1 l17
       {[something}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l17
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l17
        *brace_container C1
         {in, b}
     {spaces: }
     *def_typearg C1
      *bracketed_arg C1 l17
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l17
        *brace_container C1
         {pref}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {p}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {ct}
     *def_arg C1
      *def_line_arg C1
       *@*
     *def_arg C1
      *def_line_arg C1
       *@*
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {last}
     {spaces_after_argument:\\n}
   *@end C1 l18
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l20
   *def_line C1 l20
   |EXTRA
   |def_command:{deftypefn}
   |element_node:{chap}
   |index_entry:I{fn,4}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l20
       {Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {foobug}
     {spaces: }
     *def_typearg C1
      *bracketed_arg C1 l20
       {[something}
     {spaces_after_argument:\\n}
   *@end C1 l21
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l23
   *def_line C1 l23
   |EXTRA
   |def_command:{deftypefn}
   |element_node:{chap}
   |index_entry:I{fn,5}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C31
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {stacks}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {private}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {push}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l23
        *brace_container C1
         {s}
     *def_typearg C1
      *def_line_arg C1
       {:in}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {out}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {stack;}
     {spaces:                  }
     >SOURCEMARKS
     >defline_continuation<4><p:1>
     *def_arg C1
      *def_line_arg C1
       *@var C1 l24
        *brace_container C1
         {n}
     *def_typearg C1
      *def_line_arg C1
       {:in}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {integer}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {;}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {;barg}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {aarg;}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {;}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {end}
     {spaces_after_argument:\\n}
   *@end C1 l25
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypevr C2 l27
   *def_line C1 l27
   |EXTRA
   |def_command:{deftypevr}
   |element_node:{chap}
   |index_entry:I{vr,2}
   |original_def_cmdname:{deftypevr}
    *block_line_arg C34
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l27
       {Global Flag}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {enable}
     {spaces:         }
     >SOURCEMARKS
     >defline_continuation<5><p:1>
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {in}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {brace}
     {delimiter:,}
     {spaces: }
     {delimiter:[}
     *def_arg C1
      *def_line_arg C1
       {something}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l28
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l28
        *brace_container C1
         {in, b}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l28
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l28
        *brace_container C1
         {pref}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {p}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {last}
     {spaces_after_argument:\\n}
   *@end C1 l29
   |EXTRA
   |text_arg:{deftypevr}
    *line_arg C3
     {spaces_before_argument: }
     {deftypevr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftp C2 l31
   *def_line C1 l31
   |EXTRA
   |def_command:{deftp}
   |element_node:{chap}
   |index_entry:I{tp,1}
   |original_def_cmdname:{deftp}
    *block_line_arg C36
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l31
       {Data type}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {pair}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {car}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {cdr}
     {spaces:         }
     >SOURCEMARKS
     >defline_continuation<6><p:1>
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {in}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {brace}
     {delimiter:,}
     {spaces: }
     {delimiter:[}
     *def_typearg C1
      *def_line_arg C1
       {something}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l32
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l32
        *brace_container C1
         {in, b}
     {spaces: }
     *def_typearg C1
      *bracketed_arg C1 l32
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l32
        *brace_container C1
         {pref}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {p}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {last}
     {spaces_after_argument:\\n}
   *@end C1 l33
   |EXTRA
   |text_arg:{deftp}
    *line_arg C3
     {spaces_before_argument: }
     {deftp}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defcv C2 l35
   *def_line C1 l35
   |EXTRA
   |def_command:{defcv}
   |element_node:{chap}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defcv}
    *block_line_arg C34
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l35
       {Class Option}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {Window}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {border-pattern}
     {spaces:         }
     >SOURCEMARKS
     >defline_continuation<7><p:1>
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {in}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {brace}
     {delimiter:,}
     {spaces: }
     {delimiter:[}
     *def_arg C1
      *def_line_arg C1
       {something}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l36
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l36
        *brace_container C1
         {in, b}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l36
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l36
        *brace_container C1
         {pref}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {p}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {last}
     {spaces_after_argument:\\n}
   *@end C1 l37
   |EXTRA
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypecv C2 l39
   *def_line C1 l39
   |EXTRA
   |def_command:{deftypecv}
   |element_node:{chap}
   |index_entry:I{vr,4}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C36
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l39
       {Class Option2}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l39
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {border-pattern}
     {spaces:         }
     >SOURCEMARKS
     >defline_continuation<8><p:1>
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {in}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {brace}
     {delimiter:,}
     {spaces: }
     {delimiter:[}
     *def_arg C1
      *def_line_arg C1
       {something}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l40
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l40
        *brace_container C1
         {in, b}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l40
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l40
        *brace_container C1
         {pref}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {p}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {last}
     {spaces_after_argument:\\n}
   *@end C1 l41
   |EXTRA
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defop C2 l43
   *def_line C1 l43
   |EXTRA
   |def_command:{defop}
   |element_node:{chap}
   |index_entry:I{fn,6}
   |original_def_cmdname:{defop}
    *block_line_arg C34
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {windows}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {expose}
     {spaces:         }
     >SOURCEMARKS
     >defline_continuation<9><p:1>
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {in}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {brace}
     {delimiter:,}
     {spaces: }
     {delimiter:[}
     *def_arg C1
      *def_line_arg C1
       {something}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l44
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l44
        *brace_container C1
         {in, b}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l44
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l44
        *brace_container C1
         {pref}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {p}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {last}
     {spaces_after_argument:\\n}
   *@end C1 l45
   |EXTRA
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l47
   *def_line C1 l47
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,7}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C36
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation2}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {W,indow}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l47
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {expose}
     {spaces:         }
     >SOURCEMARKS
     >defline_continuation<10><p:1>
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {arg}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {in}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {brace}
     {delimiter:,}
     {spaces: }
     {delimiter:[}
     *def_typearg C1
      *def_line_arg C1
       {something}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l48
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l48
        *brace_container C1
         {in, b}
     {spaces: }
     *def_typearg C1
      *bracketed_arg C1 l48
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l48
        *brace_container C1
         {pref}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {p}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {last}
     {spaces_after_argument:\\n}
   *@end C1 l49
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l51
   *def_line C1 l51
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,8}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation5}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l51
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {expose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l52
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l54
   *def_line C1 l54
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,9}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation3}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l54
       {W,indow}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l54
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l54
       {e,xpose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l55
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l57
   *def_line C1 l57
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,10}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation4}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l57
       {,Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l57
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l57
       {,expose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l58
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l60
   *def_line C1 l60
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,11}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation6}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {W,indow}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l60
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {e,xpose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l61
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l63
   *def_line C1 l63
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,12}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation7}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {,Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l63
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {,expose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l64
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l66
   *def_line C1 l66
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,13}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation13}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l66
       {W)indow}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l66
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l66
       {e)xpose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l67
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l69
   *def_line C1 l69
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,14}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation14}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l69
       {)Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l69
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l69
       {)expose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l70
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l72
   *def_line C1 l72
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,15}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation16}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {W)indow}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l72
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {e)xpose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l73
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l75
   *def_line C1 l75
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,16}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation17}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {)Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l75
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {)expose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l76
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l78
   *def_line C1 l78
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,17}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation18}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l78
       {W;indow}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l78
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l78
       {e;xpose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l79
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l81
   *def_line C1 l81
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,18}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation19}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l81
       {;Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l81
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l81
       {;expose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l82
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l84
   *def_line C1 l84
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,19}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation20}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {W;indow}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l84
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {e;xpose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l85
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l87
   *def_line C1 l87
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,20}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation21}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {;Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l87
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {;expose}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {type}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg}
     {spaces_after_argument:\\n}
   *@end C1 l88
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l90
   *def_line C1 l90
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,21}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C2
       {Command}
       *@code C1 l90
        *brace_container C1
         {com}
     {spaces: }
     *def_class C1
      *bracketed_arg C2 l90
       {Window}
       *@code C1 l90
        *brace_container C1
         {int}
     {spaces: }
     *def_type C1
      *def_line_arg C2
       {expose}
       *@var C1 l90
        *brace_container C1
         {exp}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {name}
     {spaces_after_argument:\\n}
   *@end C1 l91
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defun C2 l93
   *def_line C1 l93
   |EXTRA
   |def_command:{defun}
   |element_node:{chap}
   |index_entry:I{fn,22}
   |original_def_cmdname:{defun}
    *block_line_arg C11
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {apply}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {function}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {&rest}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arguments}
     {spaces_after_argument:\\n}
   *@end C1 l94
   |EXTRA
   |text_arg:{defun}
    *line_arg C3
     {spaces_before_argument: }
     {defun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deffn C2 l96
   *def_line C1 l96
   |EXTRA
   |def_command:{deffn}
   |element_node:{chap}
   |index_entry:I{fn,23}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l96
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l96
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l96
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l96
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l97
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deffn C2 l99
   *def_line C1 l99
   |EXTRA
   |def_command:{deffn}
   |element_node:{chap}
   |index_entry:I{fn,24}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l99
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l99
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l99
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l99
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l100
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defvr C2 l102
   *def_line C1 l102
   |EXTRA
   |def_command:{defvr}
   |element_node:{chap}
   |index_entry:I{vr,5}
   |original_def_cmdname:{defvr}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l102
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l102
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l102
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l102
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l103
   |EXTRA
   |text_arg:{defvr}
    *line_arg C3
     {spaces_before_argument: }
     {defvr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defvr C2 l105
   *def_line C1 l105
   |EXTRA
   |def_command:{defvr}
   |element_node:{chap}
   |index_entry:I{vr,6}
   |original_def_cmdname:{defvr}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l105
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l105
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l105
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l105
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l106
   |EXTRA
   |text_arg:{defvr}
    *line_arg C3
     {spaces_before_argument: }
     {defvr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l108
   *def_line C1 l108
   |EXTRA
   |def_command:{deftypefn}
   |element_node:{chap}
   |index_entry:I{fn,25}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l108
        *brace_container C1
         {A1}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@var C1 l108
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l108
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l108
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l108
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l109
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l111
   *def_line C1 l111
   |EXTRA
   |def_command:{deftypefn}
   |element_node:{chap}
   |index_entry:I{fn,26}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l111
        *brace_container C1
         {A1}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l111
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l111
        *brace_container C1
         {A3}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l111
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l111
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l112
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypevr C2 l114
   *def_line C1 l114
   |EXTRA
   |def_command:{deftypevr}
   |element_node:{chap}
   |index_entry:I{vr,7}
   |original_def_cmdname:{deftypevr}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l114
        *brace_container C1
         {A1}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@var C1 l114
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l114
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l114
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l114
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l115
   |EXTRA
   |text_arg:{deftypevr}
    *line_arg C3
     {spaces_before_argument: }
     {deftypevr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypevr C2 l117
   *def_line C1 l117
   |EXTRA
   |def_command:{deftypevr}
   |element_node:{chap}
   |index_entry:I{vr,8}
   |original_def_cmdname:{deftypevr}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l117
        *brace_container C1
         {A1}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@t C1 l117
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l117
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l117
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l117
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l118
   |EXTRA
   |text_arg:{deftypevr}
    *line_arg C3
     {spaces_before_argument: }
     {deftypevr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftp C2 l120
   *def_line C1 l120
   |EXTRA
   |def_command:{deftp}
   |element_node:{chap}
   |index_entry:I{tp,2}
   |original_def_cmdname:{deftp}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l120
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l120
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l120
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l120
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l121
   |EXTRA
   |text_arg:{deftp}
    *line_arg C3
     {spaces_before_argument: }
     {deftp}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftp C2 l123
   *def_line C1 l123
   |EXTRA
   |def_command:{deftp}
   |element_node:{chap}
   |index_entry:I{tp,3}
   |original_def_cmdname:{deftp}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l123
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l123
        *brace_container C1
         {A2}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l123
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l123
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l124
   |EXTRA
   |text_arg:{deftp}
    *line_arg C3
     {spaces_before_argument: }
     {deftp}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defcv C2 l126
   *def_line C1 l126
   |EXTRA
   |def_command:{defcv}
   |element_node:{chap}
   |index_entry:I{vr,9}
   |original_def_cmdname:{defcv}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l126
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@var C1 l126
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l126
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l126
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l126
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l127
   |EXTRA
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftp C2 l129
   *def_line C1 l129
   |EXTRA
   |def_command:{deftp}
   |element_node:{chap}
   |index_entry:I{tp,4}
   |original_def_cmdname:{deftp}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l129
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l129
        *brace_container C1
         {A2}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l129
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l129
        *brace_container C1
         {A4}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l129
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l130
   |EXTRA
   |text_arg:{deftp}
    *line_arg C3
     {spaces_before_argument: }
     {deftp}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypecv C2 l132
   *def_line C1 l132
   |EXTRA
   |def_command:{deftypecv}
   |element_node:{chap}
   |index_entry:I{vr,10}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l132
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@var C1 l132
        *brace_container C1
         {A2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@var C1 l132
        *brace_container C1
         {A3}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l132
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l132
        *brace_container C1
         {A5}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l132
        *brace_container C1
         {A6}
     {spaces_after_argument:\\n}
   *@end C1 l133
   |EXTRA
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypecv C2 l135
   *def_line C1 l135
   |EXTRA
   |def_command:{deftypecv}
   |element_node:{chap}
   |index_entry:I{vr,11}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l135
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@code C1 l135
        *brace_container C1
         {A2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@option C1 l135
        *brace_container C1
         {A3}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l135
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l135
        *brace_container C1
         {A5}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l135
        *brace_container C1
         {A6}
     {spaces_after_argument:\\n}
   *@end C1 l136
   |EXTRA
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defop C2 l138
   *def_line C1 l138
   |EXTRA
   |def_command:{defop}
   |element_node:{chap}
   |index_entry:I{fn,27}
   |original_def_cmdname:{defop}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l138
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@var C1 l138
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l138
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l138
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l138
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l139
   |EXTRA
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defop C2 l141
   *def_line C1 l141
   |EXTRA
   |def_command:{defop}
   |element_node:{chap}
   |index_entry:I{fn,28}
   |original_def_cmdname:{defop}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l141
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@code C1 l141
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l141
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l141
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l141
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l142
   |EXTRA
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l144
   *def_line C1 l144
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,29}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l144
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@var C1 l144
        *brace_container C1
         {A2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@var C1 l144
        *brace_container C1
         {A3}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l144
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l144
        *brace_container C1
         {A5}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l144
        *brace_container C1
         {A6}
     {spaces_after_argument:\\n}
   *@end C1 l145
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l147
   *def_line C1 l147
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
   |index_entry:I{fn,30}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l147
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@code C1 l147
        *brace_container C1
         {A2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l147
        *brace_container C1
         {A3}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l147
        *brace_container C1
         {A4}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l147
        *brace_container C1
         {A5}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l147
        *brace_container C1
         {A6}
     {spaces_after_argument:\\n}
   *@end C1 l148
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l150
   *def_line C1 l150
   |EXTRA
   |def_command:{deftypefn}
   |element_node:{chap}
   |index_entry:I{fn,31}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C15
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l150
       {code then var}
     {spaces: }
     *def_type C1
      *bracketed_arg C1 l150
       {ret_type}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l150
       {fun_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l150
        *brace_container C1
         {A1}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l150
        *brace_container C1
         {A2}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l150
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l150
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l151
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l153
   *def_line C1 l153
   |EXTRA
   |def_command:{deftypefn}
   |element_node:{chap}
   |index_entry:I{fn,32}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C15
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l153
       {var then code}
     {spaces: }
     *def_type C1
      *bracketed_arg C1 l153
       {ret_type1}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l153
       {fun_name1}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l153
        *brace_container C1
         {A1}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l153
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l153
        *brace_container C1
         {A3}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l153
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l154
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@heading C1 l156
  |EXTRA
  |global_command_number:{1}
  |heading_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {Functions}
    {spaces_after_argument:\\n}
  *@printindex C1 l157
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@heading C1 l159
  |EXTRA
  |global_command_number:{2}
  |heading_number:{3}
   *line_arg C3
    {spaces_before_argument: }
    {Types}
    {spaces_after_argument:\\n}
  *@printindex C1 l160
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{tp}
   *line_arg C3
    {spaces_before_argument: }
    {tp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@heading C1 l162
  |EXTRA
  |global_command_number:{3}
  |heading_number:{4}
   *line_arg C3
    {spaces_before_argument: }
    {Variables}
    {spaces_after_argument:\\n}
  *@printindex C1 l163
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{vr}
   *line_arg C3
    {spaces_before_argument: }
    {vr}
    {spaces_after_argument:\\n}
';


$result_texis{'all_commands_delimiters_printindex'} = '@node Top
@node chap
@xrefname chap

@deffn Command @var{forward--char} @var{nchars} {argument2} {argument3}         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end deffn

@defvr Variable fill-column {argument1} {argument2}         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end defvr

@deftypefn {Library Function} int foobar (int @var{foo}, float @var{bar})
@end deftypefn

@deftypefn {Library Function} int foobar (int @var{foo}, float @var{bar})         (arg in brace, {[something} @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) ct@*@* last
@end deftypefn

@deftypefn {Library Function} int foobug {[something}
@end deftypefn

@deftypefn stacks private push (@var{s}:in out stack;                  @var{n}:in integer) ; ;barg aarg; ; end
@end deftypefn

@deftypevr {Global Flag} int enable         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end deftypevr

@deftp {Data type} pair car cdr         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end deftp

@defcv {Class Option} Window border-pattern         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end defcv

@deftypecv {Class Option2} Window @code{int} border-pattern         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end deftypecv

@defop Operation windows expose         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end defop

@deftypeop Operation2 W,indow @code{int} expose         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
@end deftypeop

@deftypeop Operation5 Window @code{int} expose type arg
@end deftypeop

@deftypeop Operation3 {W,indow} @code{int} {e,xpose} type arg
@end deftypeop

@deftypeop Operation4 {,Window} @code{int} {,expose} type arg
@end deftypeop

@deftypeop Operation6 W,indow @code{int} e,xpose type arg
@end deftypeop

@deftypeop Operation7 ,Window @code{int} ,expose type arg
@end deftypeop

@deftypeop Operation13 {W)indow} @code{int} {e)xpose} type arg
@end deftypeop

@deftypeop Operation14 {)Window} @code{int} {)expose} type arg
@end deftypeop

@deftypeop Operation16 W)indow @code{int} e)xpose type arg
@end deftypeop

@deftypeop Operation17 )Window @code{int} )expose type arg
@end deftypeop

@deftypeop Operation18 {W;indow} @code{int} {e;xpose} type arg
@end deftypeop

@deftypeop Operation19 {;Window} @code{int} {;expose} type arg
@end deftypeop

@deftypeop Operation20 W;indow @code{int} e;xpose type arg
@end deftypeop

@deftypeop Operation21 ;Window @code{int} ;expose type arg
@end deftypeop

@deftypeop Command@code{com} {Window@code{int}} expose@var{exp} name
@end deftypeop

@defun apply function &rest arguments
@end defun

@deffn @var{A1} @var{A2} @var{A3} @var{A4}
@end deffn

@deffn @code{A1} @code{A2} @code{A3} @code{A4}
@end deffn

@defvr @var{A1} @var{A2} @var{A3} @var{A4}
@end defvr

@defvr @code{A1} @code{A2} @code{A3} @code{A4}
@end defvr

@deftypefn @var{A1} @var{A2} @var{A3} @var{A4} @var{A5}
@end deftypefn

@deftypefn @code{A1} @code{A2} @code{A3} @code{A4} @code{A5}
@end deftypefn

@deftypevr @var{A1} @var{A2} @var{A3} @var{A4} @var{A5}
@end deftypevr

@deftypevr @code{A1} @t{A2} @code{A3} @code{A4} @code{A5}
@end deftypevr

@deftp @var{A1} @var{A2} @var{A3} @var{A4}
@end deftp

@deftp @code{A1} @code{A2} @code{A3} @code{A4}
@end deftp

@defcv @var{A1} @var{A2} @var{A3} @var{A4} @var{A5}
@end defcv

@deftp @code{A1} @code{A2} @code{A3} @code{A4} @code{A5}
@end deftp

@deftypecv @var{A1} @var{A2} @var{A3} @var{A4} @var{A5} @var{A6}
@end deftypecv

@deftypecv @code{A1} @code{A2} @option{A3} @code{A4} @code{A5} @code{A6}
@end deftypecv

@defop @var{A1} @var{A2} @var{A3} @var{A4} @var{A5}
@end defop

@defop @code{A1} @code{A2} @code{A3} @code{A4} @code{A5}
@end defop

@deftypeop @var{A1} @var{A2} @var{A3} @var{A4} @var{A5} @var{A6}
@end deftypeop

@deftypeop @code{A1} @code{A2} @code{A3} @code{A4} @code{A5} @code{A6}
@end deftypeop

@deftypefn {code then var} {ret_type} {fun_name} @code{A1} @var{A2} @code{A3} @var{A4}
@end deftypefn

@deftypefn {var then code} {ret_type1} {fun_name1} @var{A1} @code{A2} @var{A3} @code{A4}
@end deftypefn

@heading Functions
@printindex fn

@heading Types
@printindex tp

@heading Variables
@printindex vr
';


$result_texts{'all_commands_delimiters_printindex'} = '
Command: forward--char nchars argument2 argument3         (arg in brace, [something in v--ar, in, b , comma apref p]) last

Variable: fill-column argument1 argument2         (arg in brace, [something in v--ar, in, b , comma apref p]) last

Library Function: int foobar (int foo, float bar)

Library Function: int foobar (int foo, float bar)         (arg in brace, [something in v--ar, in, b , comma apref p]) ct

 last

Library Function: int foobug [something

stacks: private push (s:in out stack;                  n:in integer) ; ;barg aarg; ; end

Global Flag: int enable (arg in brace, [something in v--ar, in, b , comma apref p]) last

Data type: pair car cdr         (arg in brace, [something in v--ar, in, b , comma apref p]) last

Class Option of Window: border-pattern (arg in brace, [something in v--ar, in, b , comma apref p]) last

Class Option2 of Window: int border-pattern (arg in brace, [something in v--ar, in, b , comma apref p]) last

Operation on windows: expose (arg in brace, [something in v--ar, in, b , comma apref p]) last

Operation2 on W,indow: int expose (arg in brace, [something in v--ar, in, b , comma apref p]) last

Operation5 on Window: int expose type arg

Operation3 on W,indow: int e,xpose type arg

Operation4 on ,Window: int ,expose type arg

Operation6 on W,indow: int e,xpose type arg

Operation7 on ,Window: int ,expose type arg

Operation13 on W)indow: int e)xpose type arg

Operation14 on )Window: int )expose type arg

Operation16 on W)indow: int e)xpose type arg

Operation17 on )Window: int )expose type arg

Operation18 on W;indow: int e;xpose type arg

Operation19 on ;Window: int ;expose type arg

Operation20 on W;indow: int e;xpose type arg

Operation21 on ;Window: int ;expose type arg

Commandcom on Windowint: exposeexp name

Function: apply function &rest arguments

A1: A2 A3 A4

A1: A2 A3 A4

A1: A2 A3 A4

A1: A2 A3 A4

A1: A2 A3 A4 A5

A1: A2 A3 A4 A5

A1: A2 A3 A4 A5

A1: A2 A3 A4 A5

A1: A2 A3 A4

A1: A2 A3 A4

A1 of A2: A3 A4 A5

A1: A2 A3 A4 A5

A1 of A2: A3 A4 A5 A6

A1 of A2: A3 A4 A5 A6

A1 on A2: A3 A4 A5

A1 on A2: A3 A4 A5

A1 on A2: A3 A4 A5 A6

A1 on A2: A3 A4 A5 A6

code then var: ret_type fun_name A1 A2 A3 A4

var then code: ret_type1 fun_name1 A1 A2 A3 A4

Functions
=========

Types
=====

Variables
=========
';

$result_errors{'all_commands_delimiters_printindex'} = '* W l2|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'all_commands_delimiters_printindex'} = '1|Top
 node_directions:
  next->chap
2|chap
 associated_title_command: @xrefname chap
 node_directions:
  prev->Top
';

$result_sections_list{'all_commands_delimiters_printindex'} = '';

$result_sectioning_root{'all_commands_delimiters_printindex'} = '';

$result_headings_list{'all_commands_delimiters_printindex'} = '1|chap
 associated_anchor_command: chap
2|Functions
3|Types
4|Variables
';

$result_indices_sort_strings{'all_commands_delimiters_printindex'} = 'fn:
 ,expose on ,Window
 ,expose on ,Window
 ;expose on ;Window
 ;expose on ;Window
 )expose on )Window
 )expose on )Window
 A2
 A2
 A3
 A3
 A3 on A2
 A3 on A2
 A4 on A2
 A4 on A2
 apply
 e,xpose on W,indow
 e,xpose on W,indow
 e;xpose on W;indow
 e;xpose on W;indow
 e)xpose on W)indow
 e)xpose on W)indow
 expose on W,indow
 expose on Window
 expose on windows
 foobar
 foobar
 foobug
 forward--char
 fun_name
 fun_name1
 name on Windowint
 push
tp:
 A2
 A2
 A2
 pair
vr:
 A2
 A2
 A3
 A3
 A3 of A2
 A4 of A2
 A4 of A2
 border-pattern of Window
 border-pattern of Window
 enable
 fill-column
';


$result_converted{'info'}->{'all_commands_delimiters_printindex'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

 -- Command: FORWARD--CHAR NCHARS argument2 argument3 (arg in brace,
          [something IN V--AR, in, b , comma aPREF p]) last

 -- Variable: fill-column argument1 argument2 (arg in brace, [something
          IN V--AR, in, b , comma aPREF p]) last

 -- Library Function: int foobar (int FOO, float BAR)

 -- Library Function: int foobar (int FOO, float BAR) (arg in brace,
          [something IN V--AR, in, b , comma aPREF p]) ct

          last

 -- Library Function: int foobug [something

 -- stacks: private push (S:in out stack; N:in integer) ; ;barg aarg; ;
          end

 -- Global Flag: int enable (arg in brace, [something IN V--AR, in, b ,
          comma aPREF p]) last

 -- Data type: pair car cdr (arg in brace, [something IN V--AR, in, b ,
          comma aPREF p]) last

 -- Class Option of Window: border-pattern (arg in brace, [something IN
          V--AR, in, b , comma aPREF p]) last

 -- Class Option2 of Window: int border-pattern (arg in brace,
          [something IN V--AR, in, b , comma aPREF p]) last

 -- Operation on windows: expose (arg in brace, [something IN V--AR, in,
          b , comma aPREF p]) last

 -- Operation2 on W,indow: int expose (arg in brace, [something IN
          V--AR, in, b , comma aPREF p]) last

 -- Operation5 on Window: int expose type arg

 -- Operation3 on W,indow: int e,xpose type arg

 -- Operation4 on ,Window: int ,expose type arg

 -- Operation6 on W,indow: int e,xpose type arg

 -- Operation7 on ,Window: int ,expose type arg

 -- Operation13 on W)indow: int e)xpose type arg

 -- Operation14 on )Window: int )expose type arg

 -- Operation16 on W)indow: int e)xpose type arg

 -- Operation17 on )Window: int )expose type arg

 -- Operation18 on W;indow: int e;xpose type arg

 -- Operation19 on ;Window: int ;expose type arg

 -- Operation20 on W;indow: int e;xpose type arg

 -- Operation21 on ;Window: int ;expose type arg

 -- Commandcom on Windowint: exposeEXP name

 -- Function: apply function &rest arguments

 -- A1: A2 A3 A4

 -- A1: A2 A3 A4

 -- A1: A2 A3 A4

 -- A1: A2 A3 A4

 -- A1: A2 A3 A4 A5

 -- A1: A2 A3 A4 A5

 -- A1: A2 A3 A4 A5

 -- A1: A2 A3 A4 A5

 -- A1: A2 A3 A4

 -- A1: A2 A3 A4

 -- A1 of A2: A3 A4 A5

 -- A1: A2 A3 A4 A5

 -- A1 of A2: A3 A4 A5 A6

 -- A1 of A2: A3 A4 A5 A6

 -- A1 on A2: A3 A4 A5

 -- A1 on A2: A3 A4 A5

 -- A1 on A2: A3 A4 A5 A6

 -- A1 on A2: A3 A4 A5 A6

 -- code then var: ret_type fun_name A1 A2 A3 A4

 -- var then code: ret_type1 fun_name1 A1 A2 A3 A4

Functions
=========

 [index ]
* Menu:

* ,expose on ,Window:                    chap.                (line  43)
* ,expose on ,Window <1>:                chap.                (line  47)
* ;expose on ;Window:                    chap.                (line  59)
* ;expose on ;Window <1>:                chap.                (line  63)
* )expose on )Window:                    chap.                (line  51)
* )expose on )Window <1>:                chap.                (line  55)
* A2:                                    chap.                (line  69)
* A2 <1>:                                chap.                (line  71)
* A3:                                    chap.                (line  77)
* A3 <1>:                                chap.                (line  79)
* A3 on A2:                              chap.                (line  97)
* A3 on A2 <1>:                          chap.                (line  99)
* A4 on A2:                              chap.                (line 101)
* A4 on A2 <1>:                          chap.                (line 103)
* apply:                                 chap.                (line  67)
* e,xpose on W,indow:                    chap.                (line  41)
* e,xpose on W,indow <1>:                chap.                (line  45)
* e;xpose on W;indow:                    chap.                (line  57)
* e;xpose on W;indow <1>:                chap.                (line  61)
* e)xpose on W)indow:                    chap.                (line  49)
* e)xpose on W)indow <1>:                chap.                (line  53)
* expose on W,indow:                     chap.                (line  36)
* expose on Window:                      chap.                (line  39)
* expose on windows:                     chap.                (line  33)
* foobar:                                chap.                (line   9)
* foobar <1>:                            chap.                (line  11)
* foobug:                                chap.                (line  16)
* FORWARD--CHAR:                         chap.                (line   3)
* fun_name:                              chap.                (line 105)
* fun_name1:                             chap.                (line 107)
* name on Windowint:                     chap.                (line  65)
* push:                                  chap.                (line  18)

Types
=====

 [index ]
* Menu:

* A2:                                    chap.                 (line 85)
* A2 <1>:                                chap.                 (line 87)
* A2 <2>:                                chap.                 (line 91)
* pair:                                  chap.                 (line 24)

Variables
=========

 [index ]
* Menu:

* A2:                                    chap.                 (line 73)
* A2 <1>:                                chap.                 (line 75)
* A3:                                    chap.                 (line 81)
* A3 <1>:                                chap.                 (line 83)
* A3 of A2:                              chap.                 (line 89)
* A4 of A2:                              chap.                 (line 93)
* A4 of A2 <1>:                          chap.                 (line 95)
* border-pattern of Window:              chap.                 (line 27)
* border-pattern of Window <1>:          chap.                 (line 30)
* enable:                                chap.                 (line 21)
* fill-column:                           chap.                 (line  6)


Tag Table:
Node: Top27
Node: chap74
Ref: Index: fn2616
Ref: Index: tp4987
Ref: Index: vr5322

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_sort_strings{'info'}->{'all_commands_delimiters_printindex'} = 'fn:
 ,expose on ,Window
 ,expose on ,Window
 ;expose on ;Window
 ;expose on ;Window
 )expose on )Window
 )expose on )Window
 A2
 A2
 A3
 A3
 A3 on A2
 A3 on A2
 A4 on A2
 A4 on A2
 apply
 e,xpose on W,indow
 e,xpose on W,indow
 e;xpose on W;indow
 e;xpose on W;indow
 e)xpose on W)indow
 e)xpose on W)indow
 expose on W,indow
 expose on Window
 expose on windows
 foobar
 foobar
 foobug
 forward--char
 fun_name
 fun_name1
 name on Windowint
 push
tp:
 A2
 A2
 A2
 pair
vr:
 A2
 A2
 A3
 A3
 A3 of A2
 A4 of A2
 A4 of A2
 border-pattern of Window
 border-pattern of Window
 enable
 fill-column
';


$result_converted{'html'}->{'all_commands_delimiters_printindex'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Untitled Document</title>

<meta name="description" content="Untitled Document">
<meta name="keywords" content="Untitled Document">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<link href="#chap" rel="index" title="chap">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
a.summary-letter-printindex {text-decoration: none}
dt.def-line {font-size: 1rem}
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold}
td.printindex-index-entry {vertical-align: top; padding-left: 1.5em}
td.printindex-index-section {vertical-align: top; padding-left: 1em}
th.index-letter-header-printindex {text-align: left}
</style>


</head>

<body>
<a class="node-id" id="Top"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#chap" accesskey="n" rel="next">chap</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<a class="node" id="chap"></a><p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">Top</a></span></span><span class="nav-button"> &nbsp; </span><span class="nav-button">[<a href="#chap" title="Index" rel="index">Index</a>]</span></p>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-forward_002d_002dchar"><span class="category-def">Command: </span><span><strong class="def-name"><var class="var">forward--char</var></strong> <var class="def-var-arguments"><var class="var">nchars</var> argument2 argument3         (arg in brace, [something <var class="var">in v&ndash;ar</var>, <b class="b">in, b</b> , comma a<var class="var">pref</var> p]) last</var><a class="copiable-link" href="#index-forward_002d_002dchar"> &para;</a></span></dt>
</dl>

<dl class="first-defvr def-block">
<dt class="defvr def-line" id="index-fill_002dcolumn"><span class="category-def">Variable: </span><span><strong class="def-name">fill-column</strong> <var class="def-var-arguments">argument1 argument2         (arg in brace, [something <var class="var">in v&ndash;ar</var>, <b class="b">in, b</b> , comma a<var class="var">pref</var> p]) last</var><a class="copiable-link" href="#index-fill_002dcolumn"> &para;</a></span></dt>
</dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-foobar"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">foo</var>, float <var class="var">bar</var>)</code><a class="copiable-link" href="#index-foobar"> &para;</a></span></dt>
</dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-foobar-1"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">foo</var>, float <var class="var">bar</var>)         (arg in brace, [something <var class="var">in v--ar</var>, <b class="b">in, b</b> , comma a<var class="var">pref</var> p]) ct<br><br> last</code><a class="copiable-link" href="#index-foobar-1"> &para;</a></span></dt>
</dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-foobug"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobug</strong> <code class="def-code-arguments">[something</code><a class="copiable-link" href="#index-foobug"> &para;</a></span></dt>
</dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-push"><span class="category-def">stacks: </span><span><code class="def-type">private</code> <strong class="def-name">push</strong> <code class="def-code-arguments">(<var class="var">s</var>:in out stack;                  <var class="var">n</var>:in integer) ; ;barg aarg; ; end</code><a class="copiable-link" href="#index-push"> &para;</a></span></dt>
</dl>

<dl class="first-deftypevr def-block">
<dt class="deftypevr def-line" id="index-enable"><span class="category-def">Global Flag: </span><span><code class="def-type">int</code> <strong class="def-name">enable</strong> <code class="def-code-arguments">(arg in brace, [something <var class="var">in v--ar</var>, <b class="b">in, b</b> , comma a<var class="var">pref</var> p]) last</code><a class="copiable-link" href="#index-enable"> &para;</a></span></dt>
</dl>

<dl class="first-deftp def-block">
<dt class="deftp def-line" id="index-pair"><span class="category-def">Data type: </span><span><strong class="def-name">pair</strong> <var class="def-var-arguments">car cdr         (arg in brace, [something <var class="var">in v&ndash;ar</var>, <b class="b">in, b</b> , comma a<var class="var">pref</var> p]) last</var><a class="copiable-link" href="#index-pair"> &para;</a></span></dt>
</dl>

<dl class="first-defcv def-block">
<dt class="defcv def-line" id="index-border_002dpattern-of-Window"><span class="category-def">Class Option of <code class="code">Window</code>: </span><span><strong class="def-name">border-pattern</strong> <var class="def-var-arguments">(arg in brace, [something <var class="var">in v&ndash;ar</var>, <b class="b">in, b</b> , comma a<var class="var">pref</var> p]) last</var><a class="copiable-link" href="#index-border_002dpattern-of-Window"> &para;</a></span></dt>
</dl>

<dl class="first-deftypecv def-block">
<dt class="deftypecv def-line" id="index-border_002dpattern-of-Window-1"><span class="category-def">Class Option2 of <code class="code">Window</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">border-pattern</strong> <code class="def-code-arguments">(arg in brace, [something <var class="var">in v--ar</var>, <b class="b">in, b</b> , comma a<var class="var">pref</var> p]) last</code><a class="copiable-link" href="#index-border_002dpattern-of-Window-1"> &para;</a></span></dt>
</dl>

<dl class="first-defop def-block">
<dt class="defop def-line" id="index-expose-on-windows"><span class="category-def">Operation on <code class="code">windows</code>: </span><span><strong class="def-name">expose</strong> <var class="def-var-arguments">(arg in brace, [something <var class="var">in v&ndash;ar</var>, <b class="b">in, b</b> , comma a<var class="var">pref</var> p]) last</var><a class="copiable-link" href="#index-expose-on-windows"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-expose-on-W_002cindow"><span class="category-def">Operation2 on <code class="code">W,indow</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">expose</strong> <code class="def-code-arguments">(arg in brace, [something <var class="var">in v--ar</var>, <b class="b">in, b</b> , comma a<var class="var">pref</var> p]) last</code><a class="copiable-link" href="#index-expose-on-W_002cindow"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-expose-on-Window"><span class="category-def">Operation5 on <code class="code">Window</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">expose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-expose-on-Window"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-e_002cxpose-on-W_002cindow"><span class="category-def">Operation3 on <code class="code">W,indow</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">e,xpose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-e_002cxpose-on-W_002cindow"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-_002cexpose-on-_002cWindow"><span class="category-def">Operation4 on <code class="code">,Window</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">,expose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-_002cexpose-on-_002cWindow"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-e_002cxpose-on-W_002cindow-1"><span class="category-def">Operation6 on <code class="code">W,indow</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">e,xpose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-e_002cxpose-on-W_002cindow-1"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-_002cexpose-on-_002cWindow-1"><span class="category-def">Operation7 on <code class="code">,Window</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">,expose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-_002cexpose-on-_002cWindow-1"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-e_0029xpose-on-W_0029indow"><span class="category-def">Operation13 on <code class="code">W)indow</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">e)xpose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-e_0029xpose-on-W_0029indow"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-_0029expose-on-_0029Window"><span class="category-def">Operation14 on <code class="code">)Window</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">)expose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-_0029expose-on-_0029Window"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-e_0029xpose-on-W_0029indow-1"><span class="category-def">Operation16 on <code class="code">W)indow</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">e)xpose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-e_0029xpose-on-W_0029indow-1"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-_0029expose-on-_0029Window-1"><span class="category-def">Operation17 on <code class="code">)Window</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">)expose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-_0029expose-on-_0029Window-1"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-e_003bxpose-on-W_003bindow"><span class="category-def">Operation18 on <code class="code">W;indow</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">e;xpose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-e_003bxpose-on-W_003bindow"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-_003bexpose-on-_003bWindow"><span class="category-def">Operation19 on <code class="code">;Window</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">;expose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-_003bexpose-on-_003bWindow"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-e_003bxpose-on-W_003bindow-1"><span class="category-def">Operation20 on <code class="code">W;indow</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">e;xpose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-e_003bxpose-on-W_003bindow-1"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-_003bexpose-on-_003bWindow-1"><span class="category-def">Operation21 on <code class="code">;Window</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">;expose</strong> <code class="def-code-arguments">type arg</code><a class="copiable-link" href="#index-_003bexpose-on-_003bWindow-1"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-name-on-Windowint"><span class="category-def">Command<code class="code">com</code> on <code class="code">Window<code class="code">int</code></code>: </span><span><code class="def-type">expose<var class="var">exp</var></code> <strong class="def-name">name</strong><a class="copiable-link" href="#index-name-on-Windowint"> &para;</a></span></dt>
</dl>

<dl class="first-deffn first-defun-alias-first-deffn def-block">
<dt class="deffn defun-alias-deffn def-line" id="index-apply"><span class="category-def">Function: </span><span><strong class="def-name">apply</strong> <var class="def-var-arguments">function &amp;rest arguments</var><a class="copiable-link" href="#index-apply"> &para;</a></span></dt>
</dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-A2"><span class="category-def"><var class="var">A1</var>: </span><span><strong class="def-name"><var class="var">A2</var></strong> <var class="def-var-arguments"><var class="var">A3</var> <var class="var">A4</var></var><a class="copiable-link" href="#index-A2"> &para;</a></span></dt>
</dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-A2-1"><span class="category-def"><code class="code">A1</code>: </span><span><strong class="def-name"><code class="code">A2</code></strong> <var class="def-var-arguments"><code class="code">A3</code> <code class="code">A4</code></var><a class="copiable-link" href="#index-A2-1"> &para;</a></span></dt>
</dl>

<dl class="first-defvr def-block">
<dt class="defvr def-line" id="index-A2-5"><span class="category-def"><var class="var">A1</var>: </span><span><strong class="def-name"><var class="var">A2</var></strong> <var class="def-var-arguments"><var class="var">A3</var> <var class="var">A4</var></var><a class="copiable-link" href="#index-A2-5"> &para;</a></span></dt>
</dl>

<dl class="first-defvr def-block">
<dt class="defvr def-line" id="index-A2-6"><span class="category-def"><code class="code">A1</code>: </span><span><strong class="def-name"><code class="code">A2</code></strong> <var class="def-var-arguments"><code class="code">A3</code> <code class="code">A4</code></var><a class="copiable-link" href="#index-A2-6"> &para;</a></span></dt>
</dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-A3"><span class="category-def"><var class="var">A1</var>: </span><span><code class="def-type"><var class="var">A2</var></code> <strong class="def-name"><var class="var">A3</var></strong> <code class="def-code-arguments"><var class="var">A4</var> <var class="var">A5</var></code><a class="copiable-link" href="#index-A3"> &para;</a></span></dt>
</dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-A3-1"><span class="category-def"><code class="code">A1</code>: </span><span><code class="def-type"><code class="code">A2</code></code> <strong class="def-name"><code class="code">A3</code></strong> <code class="def-code-arguments"><code class="code">A4</code> <code class="code">A5</code></code><a class="copiable-link" href="#index-A3-1"> &para;</a></span></dt>
</dl>

<dl class="first-deftypevr def-block">
<dt class="deftypevr def-line" id="index-A3-2"><span class="category-def"><var class="var">A1</var>: </span><span><code class="def-type"><var class="var">A2</var></code> <strong class="def-name"><var class="var">A3</var></strong> <code class="def-code-arguments"><var class="var">A4</var> <var class="var">A5</var></code><a class="copiable-link" href="#index-A3-2"> &para;</a></span></dt>
</dl>

<dl class="first-deftypevr def-block">
<dt class="deftypevr def-line" id="index-A3-3"><span class="category-def"><code class="code">A1</code>: </span><span><code class="def-type"><code class="t">A2</code></code> <strong class="def-name"><code class="code">A3</code></strong> <code class="def-code-arguments"><code class="code">A4</code> <code class="code">A5</code></code><a class="copiable-link" href="#index-A3-3"> &para;</a></span></dt>
</dl>

<dl class="first-deftp def-block">
<dt class="deftp def-line" id="index-A2-2"><span class="category-def"><var class="var">A1</var>: </span><span><strong class="def-name"><var class="var">A2</var></strong> <var class="def-var-arguments"><var class="var">A3</var> <var class="var">A4</var></var><a class="copiable-link" href="#index-A2-2"> &para;</a></span></dt>
</dl>

<dl class="first-deftp def-block">
<dt class="deftp def-line" id="index-A2-3"><span class="category-def"><code class="code">A1</code>: </span><span><strong class="def-name"><code class="code">A2</code></strong> <var class="def-var-arguments"><code class="code">A3</code> <code class="code">A4</code></var><a class="copiable-link" href="#index-A2-3"> &para;</a></span></dt>
</dl>

<dl class="first-defcv def-block">
<dt class="defcv def-line" id="index-A3-of-A2"><span class="category-def"><var class="var">A1</var> of <code class="code"><var class="var">A2</var></code>: </span><span><strong class="def-name"><var class="var">A3</var></strong> <var class="def-var-arguments"><var class="var">A4</var> <var class="var">A5</var></var><a class="copiable-link" href="#index-A3-of-A2"> &para;</a></span></dt>
</dl>

<dl class="first-deftp def-block">
<dt class="deftp def-line" id="index-A2-4"><span class="category-def"><code class="code">A1</code>: </span><span><strong class="def-name"><code class="code">A2</code></strong> <var class="def-var-arguments"><code class="code">A3</code> <code class="code">A4</code> <code class="code">A5</code></var><a class="copiable-link" href="#index-A2-4"> &para;</a></span></dt>
</dl>

<dl class="first-deftypecv def-block">
<dt class="deftypecv def-line" id="index-A4-of-A2"><span class="category-def"><var class="var">A1</var> of <code class="code"><var class="var">A2</var></code>: </span><span><code class="def-type"><var class="var">A3</var></code> <strong class="def-name"><var class="var">A4</var></strong> <code class="def-code-arguments"><var class="var">A5</var> <var class="var">A6</var></code><a class="copiable-link" href="#index-A4-of-A2"> &para;</a></span></dt>
</dl>

<dl class="first-deftypecv def-block">
<dt class="deftypecv def-line" id="index-A4-of-A2-1"><span class="category-def"><code class="code">A1</code> of <code class="code"><code class="code">A2</code></code>: </span><span><code class="def-type"><samp class="option">A3</samp></code> <strong class="def-name"><code class="code">A4</code></strong> <code class="def-code-arguments"><code class="code">A5</code> <code class="code">A6</code></code><a class="copiable-link" href="#index-A4-of-A2-1"> &para;</a></span></dt>
</dl>

<dl class="first-defop def-block">
<dt class="defop def-line" id="index-A3-on-A2"><span class="category-def"><var class="var">A1</var> on <code class="code"><var class="var">A2</var></code>: </span><span><strong class="def-name"><var class="var">A3</var></strong> <var class="def-var-arguments"><var class="var">A4</var> <var class="var">A5</var></var><a class="copiable-link" href="#index-A3-on-A2"> &para;</a></span></dt>
</dl>

<dl class="first-defop def-block">
<dt class="defop def-line" id="index-A3-on-A2-1"><span class="category-def"><code class="code">A1</code> on <code class="code"><code class="code">A2</code></code>: </span><span><strong class="def-name"><code class="code">A3</code></strong> <var class="def-var-arguments"><code class="code">A4</code> <code class="code">A5</code></var><a class="copiable-link" href="#index-A3-on-A2-1"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-A4-on-A2"><span class="category-def"><var class="var">A1</var> on <code class="code"><var class="var">A2</var></code>: </span><span><code class="def-type"><var class="var">A3</var></code> <strong class="def-name"><var class="var">A4</var></strong> <code class="def-code-arguments"><var class="var">A5</var> <var class="var">A6</var></code><a class="copiable-link" href="#index-A4-on-A2"> &para;</a></span></dt>
</dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-A4-on-A2-1"><span class="category-def"><code class="code">A1</code> on <code class="code"><code class="code">A2</code></code>: </span><span><code class="def-type"><code class="code">A3</code></code> <strong class="def-name"><code class="code">A4</code></strong> <code class="def-code-arguments"><code class="code">A5</code> <code class="code">A6</code></code><a class="copiable-link" href="#index-A4-on-A2-1"> &para;</a></span></dt>
</dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-fun_005fname"><span class="category-def">code then var: </span><span><code class="def-type">ret_type</code> <strong class="def-name">fun_name</strong> <code class="def-code-arguments"><code class="code">A1</code> <var class="var">A2</var> <code class="code">A3</code> <var class="var">A4</var></code><a class="copiable-link" href="#index-fun_005fname"> &para;</a></span></dt>
</dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-fun_005fname1"><span class="category-def">var then code: </span><span><code class="def-type">ret_type1</code> <strong class="def-name">fun_name1</strong> <code class="def-code-arguments"><var class="var">A1</var> <code class="code">A2</code> <var class="var">A3</var> <code class="code">A4</code></code><a class="copiable-link" href="#index-fun_005fname1"> &para;</a></span></dt>
</dl>

<h3 class="heading" id="Functions"><span>Functions<a class="copiable-link" href="#Functions"> &para;</a></span></h3>
<div class="printindex fn-printindex">
<table class="index-letters-header-printindex fn-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_fn_symbol-1"><b>,</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_symbol-2"><b>;</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_symbol-3"><b>)</b></a>
 &nbsp; 
<br>
<a class="summary-letter-printindex" href="#chap_fn_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-E"><b>E</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-N"><b>N</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-P"><b>P</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex fn-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_symbol-1">,</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-_002cexpose-on-_002cWindow"><code>,expose on ,Window</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-_002cexpose-on-_002cWindow-1"><code>,expose on ,Window</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_symbol-2">;</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-_003bexpose-on-_003bWindow"><code>;expose on ;Window</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-_003bexpose-on-_003bWindow-1"><code>;expose on ;Window</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_symbol-3">)</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-_0029expose-on-_0029Window"><code>)expose on )Window</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-_0029expose-on-_0029Window-1"><code>)expose on )Window</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-A">A</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-A2"><code><var class="var">A2</var></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A2-1"><code><code class="code">A2</code></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A3"><code><var class="var">A3</var></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A3-1"><code><code class="code">A3</code></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A3-on-A2"><code><var class="var">A3</var> on <var class="var">A2</var></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A3-on-A2-1"><code><code class="code">A3</code> on <code class="code">A2</code></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A4-on-A2"><code><var class="var">A4</var> on <var class="var">A2</var></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A4-on-A2-1"><code><code class="code">A4</code> on <code class="code">A2</code></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-apply"><code>apply</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-E">E</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-e_002cxpose-on-W_002cindow"><code>e,xpose on W,indow</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-e_002cxpose-on-W_002cindow-1"><code>e,xpose on W,indow</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-e_003bxpose-on-W_003bindow"><code>e;xpose on W;indow</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-e_003bxpose-on-W_003bindow-1"><code>e;xpose on W;indow</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-e_0029xpose-on-W_0029indow"><code>e)xpose on W)indow</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-e_0029xpose-on-W_0029indow-1"><code>e)xpose on W)indow</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-expose-on-W_002cindow"><code>expose on W,indow</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-expose-on-Window"><code>expose on Window</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-expose-on-windows"><code>expose on windows</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-F">F</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-foobar"><code>foobar</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-foobar-1"><code>foobar</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-foobug"><code>foobug</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-forward_002d_002dchar"><code><var class="var">forward--char</var></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-fun_005fname"><code>fun_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-fun_005fname1"><code>fun_name1</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-N">N</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-name-on-Windowint"><code>name on Window<code class="code">int</code></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-P">P</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-push"><code>push</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex fn-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_fn_symbol-1"><b>,</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_symbol-2"><b>;</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_symbol-3"><b>)</b></a>
 &nbsp; 
<br>
<a class="summary-letter-printindex" href="#chap_fn_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-E"><b>E</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-F"><b>F</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-N"><b>N</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-P"><b>P</b></a>
 &nbsp; 
</td></tr></table>
</div>

<h3 class="heading" id="Types"><span>Types<a class="copiable-link" href="#Types"> &para;</a></span></h3>
<div class="printindex tp-printindex">
<table class="index-letters-header-printindex tp-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_tp_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_tp_letter-P"><b>P</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex tp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex tp-letter-header-printindex" colspan="2" id="chap_tp_letter-A">A</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-A2-2"><code><var class="var">A2</var></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A2-3"><code><code class="code">A2</code></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A2-4"><code><code class="code">A2</code></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex tp-letter-header-printindex" colspan="2" id="chap_tp_letter-P">P</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-pair"><code>pair</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex tp-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_tp_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_tp_letter-P"><b>P</b></a>
 &nbsp; 
</td></tr></table>
</div>

<h3 class="heading" id="Variables"><span>Variables<a class="copiable-link" href="#Variables"> &para;</a></span></h3>
<div class="printindex vr-printindex">
<table class="index-letters-header-printindex vr-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_vr_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_vr_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_vr_letter-E"><b>E</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_vr_letter-F"><b>F</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex vr-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="chap_vr_letter-A">A</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-A2-5"><code><var class="var">A2</var></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A2-6"><code><code class="code">A2</code></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A3-2"><code><var class="var">A3</var></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A3-3"><code><code class="code">A3</code></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A3-of-A2"><code><var class="var">A3</var> of <var class="var">A2</var></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A4-of-A2"><code><var class="var">A4</var> of <var class="var">A2</var></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-A4-of-A2-1"><code><code class="code">A4</code> of <code class="code">A2</code></code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="chap_vr_letter-B">B</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-border_002dpattern-of-Window"><code>border-pattern of Window</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-border_002dpattern-of-Window-1"><code>border-pattern of Window</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="chap_vr_letter-E">E</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-enable"><code>enable</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="chap_vr_letter-F">F</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-fill_002dcolumn"><code>fill-column</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex vr-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_vr_letter-A"><b>A</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_vr_letter-B"><b>B</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_vr_letter-E"><b>E</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_vr_letter-F"><b>F</b></a>
 &nbsp; 
</td></tr></table>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'all_commands_delimiters_printindex'} = 'fn:
 ,expose on ,Window
 ,expose on ,Window
 ;expose on ;Window
 ;expose on ;Window
 )expose on )Window
 )expose on )Window
 A2
 A2
 A3
 A3
 A3 on A2
 A3 on A2
 A4 on A2
 A4 on A2
 apply
 e,xpose on W,indow
 e,xpose on W,indow
 e;xpose on W;indow
 e;xpose on W;indow
 e)xpose on W)indow
 e)xpose on W)indow
 expose on W,indow
 expose on Window
 expose on windows
 foobar
 foobar
 foobug
 forward--char
 fun_name
 fun_name1
 name on Windowint
 push
tp:
 A2
 A2
 A2
 pair
vr:
 A2
 A2
 A3
 A3
 A3 of A2
 A4 of A2
 A4 of A2
 border-pattern of Window
 border-pattern of Window
 enable
 fill-column
';

$result_converted_errors{'html'}->{'all_commands_delimiters_printindex'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
