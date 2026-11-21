use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'all_commands_delimiters'} = '*document_root C1
 *before_node_section C94
  *preamble_before_content
  *@deffn C2 l1
   *def_line C1 l1
   |EXTRA
   |def_command:{deffn}
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
       *@var C1 l1
        *brace_container C1
         {forward--char}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l1
        *brace_container C1
         {nchars}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l1
       {argument2}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l1
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
       *@var C1 l2
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l2
        *brace_container C1
         {in, b}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l2
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l2
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
   *@end C1 l3
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defvr C2 l5
   *def_line C1 l5
   |EXTRA
   |def_command:{defvr}
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
      *bracketed_arg C1 l5
       {argument1}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l5
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
   |text_arg:{defvr}
    *line_arg C3
     {spaces_before_argument: }
     {defvr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l9
   *def_line C1 l9
   |EXTRA
   |def_command:{deftypefn}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C18
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l9
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
       *@var C1 l9
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
       *@var C1 l9
        *brace_container C1
         {bar}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *@end C1 l10
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l12
   *def_line C1 l12
   |EXTRA
   |def_command:{deftypefn}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C48
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l12
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
       *@var C1 l12
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
       *@var C1 l12
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
      *bracketed_arg C1 l13
       {[something}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l13
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l13
        *brace_container C1
         {in, b}
     {spaces: }
     *def_typearg C1
      *bracketed_arg C1 l13
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l13
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
   |index_entry:I{fn,4}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C9
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
       {foobug}
     {spaces: }
     *def_typearg C1
      *bracketed_arg C1 l16
       {[something}
     {spaces_after_argument:\\n}
   *@end C1 l17
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l19
   *def_line C1 l19
   |EXTRA
   |def_command:{deftypefn}
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
       *@var C1 l19
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
       *@var C1 l20
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
   *@end C1 l21
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypevr C2 l23
   *def_line C1 l23
   |EXTRA
   |def_command:{deftypevr}
   |index_entry:I{vr,2}
   |original_def_cmdname:{deftypevr}
    *block_line_arg C34
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l23
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
       *@var C1 l24
        *brace_container C1
         {in v--ar}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@b C1 l24
        *brace_container C1
         {in, b}
     {spaces: }
     *def_arg C1
      *bracketed_arg C1 l24
       {, comma}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a}
     *def_arg C1
      *def_line_arg C1
       *@var C1 l24
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
   *@end C1 l25
   |EXTRA
   |text_arg:{deftypevr}
    *line_arg C3
     {spaces_before_argument: }
     {deftypevr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftp C2 l27
   *def_line C1 l27
   |EXTRA
   |def_command:{deftp}
   |index_entry:I{tp,1}
   |original_def_cmdname:{deftp}
    *block_line_arg C36
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l27
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
     *def_typearg C1
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
   *@end C1 l29
   |EXTRA
   |text_arg:{deftp}
    *line_arg C3
     {spaces_before_argument: }
     {deftp}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defcv C2 l31
   *def_line C1 l31
   |EXTRA
   |def_command:{defcv}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defcv}
    *block_line_arg C34
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l31
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
     *def_arg C1
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
   *@end C1 l33
   |EXTRA
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypecv C2 l35
   *def_line C1 l35
   |EXTRA
   |def_command:{deftypecv}
   |index_entry:I{vr,4}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C36
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l35
       {Class Option2}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l35
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
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defop C2 l39
   *def_line C1 l39
   |EXTRA
   |def_command:{defop}
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
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l43
   *def_line C1 l43
   |EXTRA
   |def_command:{deftypeop}
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
       *@code C1 l43
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
     *def_typearg C1
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
   *@end C1 l45
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l47
   *def_line C1 l47
   |EXTRA
   |def_command:{deftypeop}
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
       *@code C1 l47
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
   *@end C1 l48
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l50
   *def_line C1 l50
   |EXTRA
   |def_command:{deftypeop}
   |index_entry:I{fn,9}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation3}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l50
       {W,indow}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l50
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l50
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
   *@end C1 l51
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l53
   *def_line C1 l53
   |EXTRA
   |def_command:{deftypeop}
   |index_entry:I{fn,10}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation4}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l53
       {,Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l53
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l53
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
   *@end C1 l54
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l56
   *def_line C1 l56
   |EXTRA
   |def_command:{deftypeop}
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
       *@code C1 l56
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
   *@end C1 l57
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l59
   *def_line C1 l59
   |EXTRA
   |def_command:{deftypeop}
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
       *@code C1 l59
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
   *@end C1 l60
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l62
   *def_line C1 l62
   |EXTRA
   |def_command:{deftypeop}
   |index_entry:I{fn,13}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation13}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l62
       {W)indow}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l62
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l62
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
   *@end C1 l63
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l65
   *def_line C1 l65
   |EXTRA
   |def_command:{deftypeop}
   |index_entry:I{fn,14}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation14}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l65
       {)Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l65
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l65
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
   *@end C1 l66
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l68
   *def_line C1 l68
   |EXTRA
   |def_command:{deftypeop}
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
       *@code C1 l68
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
   *@end C1 l69
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l71
   *def_line C1 l71
   |EXTRA
   |def_command:{deftypeop}
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
       *@code C1 l71
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
   *@end C1 l72
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l74
   *def_line C1 l74
   |EXTRA
   |def_command:{deftypeop}
   |index_entry:I{fn,17}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation18}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l74
       {W;indow}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l74
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l74
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
   *@end C1 l75
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l77
   *def_line C1 l77
   |EXTRA
   |def_command:{deftypeop}
   |index_entry:I{fn,18}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {Operation19}
     {spaces: }
     *def_class C1
      *bracketed_arg C1 l77
       {;Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l77
        *brace_container C1
         {int}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l77
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
   *@end C1 l78
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l80
   *def_line C1 l80
   |EXTRA
   |def_command:{deftypeop}
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
       *@code C1 l80
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
   *@end C1 l81
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l83
   *def_line C1 l83
   |EXTRA
   |def_command:{deftypeop}
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
       *@code C1 l83
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
   *@end C1 l84
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l86
   *def_line C1 l86
   |EXTRA
   |def_command:{deftypeop}
   |index_entry:I{fn,21}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C2
       {Command}
       *@code C1 l86
        *brace_container C1
         {com}
     {spaces: }
     *def_class C1
      *bracketed_arg C2 l86
       {Window}
       *@code C1 l86
        *brace_container C1
         {int}
     {spaces: }
     *def_type C1
      *def_line_arg C2
       {expose}
       *@var C1 l86
        *brace_container C1
         {exp}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {name}
     {spaces_after_argument:\\n}
   *@end C1 l87
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defun C2 l89
   *def_line C1 l89
   |EXTRA
   |def_command:{defun}
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
   *@end C1 l90
   |EXTRA
   |text_arg:{defun}
    *line_arg C3
     {spaces_before_argument: }
     {defun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deffn C2 l92
   *def_line C1 l92
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,23}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l92
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l92
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l92
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l92
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l93
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deffn C2 l95
   *def_line C1 l95
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,24}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l95
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l95
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l95
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l95
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l96
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defvr C2 l98
   *def_line C1 l98
   |EXTRA
   |def_command:{defvr}
   |index_entry:I{vr,5}
   |original_def_cmdname:{defvr}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l98
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l98
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l98
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l98
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l99
   |EXTRA
   |text_arg:{defvr}
    *line_arg C3
     {spaces_before_argument: }
     {defvr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defvr C2 l101
   *def_line C1 l101
   |EXTRA
   |def_command:{defvr}
   |index_entry:I{vr,6}
   |original_def_cmdname:{defvr}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l101
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l101
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l101
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l101
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l102
   |EXTRA
   |text_arg:{defvr}
    *line_arg C3
     {spaces_before_argument: }
     {defvr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l104
   *def_line C1 l104
   |EXTRA
   |def_command:{deftypefn}
   |index_entry:I{fn,25}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l104
        *brace_container C1
         {A1}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@var C1 l104
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l104
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l104
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l104
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l105
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l107
   *def_line C1 l107
   |EXTRA
   |def_command:{deftypefn}
   |index_entry:I{fn,26}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l107
        *brace_container C1
         {A1}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l107
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l107
        *brace_container C1
         {A3}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l107
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l107
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l108
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypevr C2 l110
   *def_line C1 l110
   |EXTRA
   |def_command:{deftypevr}
   |index_entry:I{vr,7}
   |original_def_cmdname:{deftypevr}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l110
        *brace_container C1
         {A1}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@var C1 l110
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l110
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l110
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l110
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l111
   |EXTRA
   |text_arg:{deftypevr}
    *line_arg C3
     {spaces_before_argument: }
     {deftypevr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypevr C2 l113
   *def_line C1 l113
   |EXTRA
   |def_command:{deftypevr}
   |index_entry:I{vr,8}
   |original_def_cmdname:{deftypevr}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l113
        *brace_container C1
         {A1}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@t C1 l113
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l113
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l113
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l113
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l114
   |EXTRA
   |text_arg:{deftypevr}
    *line_arg C3
     {spaces_before_argument: }
     {deftypevr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftp C2 l116
   *def_line C1 l116
   |EXTRA
   |def_command:{deftp}
   |index_entry:I{tp,2}
   |original_def_cmdname:{deftp}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l116
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l116
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l116
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l116
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l117
   |EXTRA
   |text_arg:{deftp}
    *line_arg C3
     {spaces_before_argument: }
     {deftp}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftp C2 l119
   *def_line C1 l119
   |EXTRA
   |def_command:{deftp}
   |index_entry:I{tp,3}
   |original_def_cmdname:{deftp}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l119
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l119
        *brace_container C1
         {A2}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l119
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l119
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l120
   |EXTRA
   |text_arg:{deftp}
    *line_arg C3
     {spaces_before_argument: }
     {deftp}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defcv C2 l122
   *def_line C1 l122
   |EXTRA
   |def_command:{defcv}
   |index_entry:I{vr,9}
   |original_def_cmdname:{defcv}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l122
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@var C1 l122
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l122
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l122
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l122
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l123
   |EXTRA
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftp C2 l125
   *def_line C1 l125
   |EXTRA
   |def_command:{deftp}
   |index_entry:I{tp,4}
   |original_def_cmdname:{deftp}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l125
        *brace_container C1
         {A1}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l125
        *brace_container C1
         {A2}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l125
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l125
        *brace_container C1
         {A4}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l125
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l126
   |EXTRA
   |text_arg:{deftp}
    *line_arg C3
     {spaces_before_argument: }
     {deftp}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypecv C2 l128
   *def_line C1 l128
   |EXTRA
   |def_command:{deftypecv}
   |index_entry:I{vr,10}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l128
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@var C1 l128
        *brace_container C1
         {A2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@var C1 l128
        *brace_container C1
         {A3}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l128
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l128
        *brace_container C1
         {A5}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l128
        *brace_container C1
         {A6}
     {spaces_after_argument:\\n}
   *@end C1 l129
   |EXTRA
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypecv C2 l131
   *def_line C1 l131
   |EXTRA
   |def_command:{deftypecv}
   |index_entry:I{vr,11}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l131
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@code C1 l131
        *brace_container C1
         {A2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@option C1 l131
        *brace_container C1
         {A3}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l131
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l131
        *brace_container C1
         {A5}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l131
        *brace_container C1
         {A6}
     {spaces_after_argument:\\n}
   *@end C1 l132
   |EXTRA
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defop C2 l134
   *def_line C1 l134
   |EXTRA
   |def_command:{defop}
   |index_entry:I{fn,27}
   |original_def_cmdname:{defop}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l134
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@var C1 l134
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l134
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l134
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l134
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l135
   |EXTRA
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defop C2 l137
   *def_line C1 l137
   |EXTRA
   |def_command:{defop}
   |index_entry:I{fn,28}
   |original_def_cmdname:{defop}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l137
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@code C1 l137
        *brace_container C1
         {A2}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l137
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l137
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l137
        *brace_container C1
         {A5}
     {spaces_after_argument:\\n}
   *@end C1 l138
   |EXTRA
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l140
   *def_line C1 l140
   |EXTRA
   |def_command:{deftypeop}
   |index_entry:I{fn,29}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@var C1 l140
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@var C1 l140
        *brace_container C1
         {A2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@var C1 l140
        *brace_container C1
         {A3}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@var C1 l140
        *brace_container C1
         {A4}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l140
        *brace_container C1
         {A5}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l140
        *brace_container C1
         {A6}
     {spaces_after_argument:\\n}
   *@end C1 l141
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C2 l143
   *def_line C1 l143
   |EXTRA
   |def_command:{deftypeop}
   |index_entry:I{fn,30}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C13
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       *@code C1 l143
        *brace_container C1
         {A1}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       *@code C1 l143
        *brace_container C1
         {A2}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *@code C1 l143
        *brace_container C1
         {A3}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *@code C1 l143
        *brace_container C1
         {A4}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l143
        *brace_container C1
         {A5}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@code C1 l143
        *brace_container C1
         {A6}
     {spaces_after_argument:\\n}
   *@end C1 l144
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l146
   *def_line C1 l146
   |EXTRA
   |def_command:{deftypefn}
   |index_entry:I{fn,31}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C15
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l146
       {code then var}
     {spaces: }
     *def_type C1
      *bracketed_arg C1 l146
       {ret_type}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l146
       {fun_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l146
        *brace_container C1
         {A1}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l146
        *brace_container C1
         {A2}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l146
        *brace_container C1
         {A3}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l146
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l147
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C2 l149
   *def_line C1 l149
   |EXTRA
   |def_command:{deftypefn}
   |index_entry:I{fn,32}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C15
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l149
       {var then code}
     {spaces: }
     *def_type C1
      *bracketed_arg C1 l149
       {ret_type1}
     {spaces: }
     *def_name C1
      *bracketed_arg C1 l149
       {fun_name1}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l149
        *brace_container C1
         {A1}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l149
        *brace_container C1
         {A2}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *@var C1 l149
        *brace_container C1
         {A3}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       *@code C1 l149
        *brace_container C1
         {A4}
     {spaces_after_argument:\\n}
   *@end C1 l150
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {deftypefn}
     {spaces_after_argument:\\n}
';


$result_texis{'all_commands_delimiters'} = '@deffn Command @var{forward--char} @var{nchars} {argument2} {argument3}         (arg in brace, [something @var{in v--ar}, @b{in, b} {, comma} a@var{pref} p]) last
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
';


$result_texts{'all_commands_delimiters'} = 'Command: forward--char nchars argument2 argument3         (arg in brace, [something in v--ar, in, b , comma apref p]) last

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
';

$result_errors{'all_commands_delimiters'} = '* W l2|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l6|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l9|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l13|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l16|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l20|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l24|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l28|entry for index `tp\' outside of any node
 warning: entry for index `tp\' outside of any node

* W l32|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l36|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l40|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l44|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l47|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l50|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l53|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l56|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l59|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l62|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l65|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l68|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l71|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l74|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l77|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l80|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l83|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l86|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l89|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l92|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l95|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l98|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l101|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l104|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l107|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l110|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l113|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l116|entry for index `tp\' outside of any node
 warning: entry for index `tp\' outside of any node

* W l119|entry for index `tp\' outside of any node
 warning: entry for index `tp\' outside of any node

* W l122|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l125|entry for index `tp\' outside of any node
 warning: entry for index `tp\' outside of any node

* W l128|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l131|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l134|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l137|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l140|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l143|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l146|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l149|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'all_commands_delimiters'} = '';

$result_sections_list{'all_commands_delimiters'} = '';

$result_sectioning_root{'all_commands_delimiters'} = '';

$result_headings_list{'all_commands_delimiters'} = '';

$result_indices_sort_strings{'all_commands_delimiters'} = 'fn:
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


$result_converted{'plaintext'}->{'all_commands_delimiters'} = ' -- Command: FORWARD--CHAR NCHARS argument2 argument3 (arg in brace,
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
';

$result_converted_sort_strings{'plaintext'}->{'all_commands_delimiters'} = 'fn:
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

1;
