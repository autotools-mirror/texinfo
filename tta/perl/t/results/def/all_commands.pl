use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'all_commands'} = '*document_root C1
 *before_node_section C54
  *preamble_before_content
  *@defvr C3 l1
   *def_line C1 l1
   |EXTRA
   |def_command:{defvr}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defvr}
    *block_line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efvr_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efvr\\n}
   *@end C1 l3
   |EXTRA
   |text_arg:{defvr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defvr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deffn C3 l5
   *def_line C1 l5
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:n--ame}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--effn\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deffn C3 l9
   *def_line C1 l9
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:n--ame}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--effn no arg\\n}
   *@end C1 l11
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C3 l13
   *def_line C1 l13
   |EXTRA
   |def_command:{deftypefn}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypefn_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypefn\\n}
   *@end C1 l15
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C3 l17
   *def_line C1 l17
   |EXTRA
   |def_command:{deftypefn}
   |index_entry:I{fn,4}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypefn_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypefn no arg\\n}
   *@end C1 l19
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C3 l21
   *def_line C1 l21
   |EXTRA
   |def_command:{deftypeop}
   |index_entry:I{fn,5}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypeop_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypeop\\n}
   *@end C1 l23
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C3 l25
   *def_line C1 l25
   |EXTRA
   |def_command:{deftypeop}
   |index_entry:I{fn,6}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypeop_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypeop no arg\\n}
   *@end C1 l27
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypevr C3 l29
   *def_line C1 l29
   |EXTRA
   |def_command:{deftypevr}
   |index_entry:I{vr,2}
   |original_def_cmdname:{deftypevr}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypevr_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypevr\\n}
   *@end C1 l31
   |EXTRA
   |text_arg:{deftypevr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypevr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defcv C3 l33
   *def_line C1 l33
   |EXTRA
   |def_command:{defcv}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defcv}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efcv_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efcv\\n}
   *@end C1 l35
   |EXTRA
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defcv C3 l37
   *def_line C1 l37
   |EXTRA
   |def_command:{defcv}
   |index_entry:I{vr,4}
   |original_def_cmdname:{defcv}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efcv_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efcv with arguments\\n}
   *@end C1 l39
   |EXTRA
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypecv C3 l41
   *def_line C1 l41
   |EXTRA
   |def_command:{deftypecv}
   |index_entry:I{vr,5}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypecv_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypecv\\n}
   *@end C1 l43
   |EXTRA
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypecv C3 l45
   *def_line C1 l45
   |EXTRA
   |def_command:{deftypecv}
   |index_entry:I{vr,6}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C11
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypecv_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypecv with arguments\\n}
   *@end C1 l47
   |EXTRA
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defop C3 l49
   *def_line C1 l49
   |EXTRA
   |def_command:{defop}
   |index_entry:I{fn,7}
   |original_def_cmdname:{defop}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efop_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efop\\n}
   *@end C1 l51
   |EXTRA
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defop C3 l53
   *def_line C1 l53
   |EXTRA
   |def_command:{defop}
   |index_entry:I{fn,8}
   |original_def_cmdname:{defop}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efop_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efop no arg\\n}
   *@end C1 l55
   |EXTRA
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftp C3 l57
   *def_line C1 l57
   |EXTRA
   |def_command:{deftp}
   |index_entry:I{tp,1}
   |original_def_cmdname:{deftp}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:c--ategory}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftp_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:a--ttributes...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftp\\n}
   *@end C1 l59
   |EXTRA
   |text_arg:{deftp}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftp}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defun C3 l61
   *def_line C1 l61
   |EXTRA
   |def_command:{defun}
   |index_entry:I{fn,9}
   |original_def_cmdname:{defun}
    *block_line_arg C7
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efun_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efun\\n}
   *@end C1 l63
   |EXTRA
   |text_arg:{defun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defmac C3 l65
   *def_line C1 l65
   |EXTRA
   |def_command:{defmac}
   |index_entry:I{fn,10}
   |original_def_cmdname:{defmac}
    *block_line_arg C7
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Macro}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efmac_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efmac\\n}
   *@end C1 l67
   |EXTRA
   |text_arg:{defmac}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defmac}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defspec C3 l69
   *def_line C1 l69
   |EXTRA
   |def_command:{defspec}
   |index_entry:I{fn,11}
   |original_def_cmdname:{defspec}
    *block_line_arg C7
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efspec_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efspec\\n}
   *@end C1 l71
   |EXTRA
   |text_arg:{defspec}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defspec}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defvar C3 l73
   *def_line C1 l73
   |EXTRA
   |def_command:{defvar}
   |index_entry:I{vr,7}
   |original_def_cmdname:{defvar}
    *block_line_arg C5
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Variable}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efvar_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efvar\\n}
   *@end C1 l75
   |EXTRA
   |text_arg:{defvar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defvar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defvar C3 l77
   *def_line C1 l77
   |EXTRA
   |def_command:{defvar}
   |index_entry:I{vr,8}
   |original_def_cmdname:{defvar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Variable}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efvar_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:arg--var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:arg--var1}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efvar with args\\n}
   *@end C1 l79
   |EXTRA
   |text_arg:{defvar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defvar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defopt C3 l81
   *def_line C1 l81
   |EXTRA
   |def_command:{defopt}
   |index_entry:I{vr,9}
   |original_def_cmdname:{defopt}
    *block_line_arg C5
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:User Option}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efopt_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efopt\\n}
   *@end C1 l83
   |EXTRA
   |text_arg:{defopt}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defopt}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefun C3 l85
   *def_line C1 l85
   |EXTRA
   |def_command:{deftypefun}
   |index_entry:I{fn,12}
   |original_def_cmdname:{deftypefun}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypefun_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypefun\\n}
   *@end C1 l87
   |EXTRA
   |text_arg:{deftypefun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypevar C3 l89
   *def_line C1 l89
   |EXTRA
   |def_command:{deftypevar}
   |index_entry:I{vr,10}
   |original_def_cmdname:{deftypevar}
    *block_line_arg C7
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Variable}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypevar_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypevar\\n}
   *@end C1 l91
   |EXTRA
   |text_arg:{deftypevar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypevar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defivar C3 l93
   *def_line C1 l93
   |EXTRA
   |def_command:{defivar}
   |index_entry:I{vr,11}
   |original_def_cmdname:{defivar}
    *block_line_arg C7
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efivar_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efivar\\n}
   *@end C1 l95
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeivar C3 l97
   *def_line C1 l97
   |EXTRA
   |def_command:{deftypeivar}
   |index_entry:I{vr,12}
   |original_def_cmdname:{deftypeivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypeivar_name}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypeivar\\n}
   *@end C1 l99
   |EXTRA
   |text_arg:{deftypeivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defmethod C3 l101
   *def_line C1 l101
   |EXTRA
   |def_command:{defmethod}
   |index_entry:I{fn,13}
   |original_def_cmdname:{defmethod}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Method}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--efmethod_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--efmethod\\n}
   *@end C1 l103
   |EXTRA
   |text_arg:{defmethod}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defmethod}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypemethod C3 l105
   *def_line C1 l105
   |EXTRA
   |def_command:{deftypemethod}
   |index_entry:I{fn,14}
   |original_def_cmdname:{deftypemethod}
    *block_line_arg C11
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Method}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:d--eftypemethod_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:a--rguments...}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:d--eftypemethod\\n}
   *@end C1 l107
   |EXTRA
   |text_arg:{deftypemethod}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypemethod}
     {spaces_after_argument:\\n}
';


$result_texis{'all_commands'} = '@defvr c--ategory d--efvr_name
d--efvr
@end defvr

@deffn c--ategory n--ame a--rguments...
d--effn
@end deffn

@deffn c--ategory n--ame
d--effn no arg
@end deffn

@deftypefn c--ategory t--ype d--eftypefn_name a--rguments...
d--eftypefn
@end deftypefn

@deftypefn c--ategory t--ype d--eftypefn_name
d--eftypefn no arg
@end deftypefn

@deftypeop c--ategory c--lass t--ype d--eftypeop_name a--rguments...
d--eftypeop
@end deftypeop

@deftypeop c--ategory c--lass t--ype d--eftypeop_name
d--eftypeop no arg
@end deftypeop

@deftypevr c--ategory t--ype d--eftypevr_name
d--eftypevr
@end deftypevr

@defcv c--ategory c--lass d--efcv_name
d--efcv
@end defcv

@defcv c--ategory c--lass d--efcv_name a--rguments...
d--efcv with arguments
@end defcv

@deftypecv c--ategory c--lass t--ype d--eftypecv_name
d--eftypecv
@end deftypecv

@deftypecv c--ategory c--lass t--ype d--eftypecv_name a--rguments...
d--eftypecv with arguments
@end deftypecv

@defop c--ategory c--lass d--efop_name a--rguments...
d--efop
@end defop

@defop c--ategory c--lass d--efop_name
d--efop no arg
@end defop

@deftp c--ategory d--eftp_name a--ttributes...
d--eftp
@end deftp

@defun d--efun_name a--rguments...
d--efun
@end defun

@defmac d--efmac_name a--rguments...
d--efmac
@end defmac

@defspec d--efspec_name a--rguments...
d--efspec
@end defspec

@defvar d--efvar_name
d--efvar
@end defvar

@defvar d--efvar_name arg--var arg--var1
d--efvar with args
@end defvar

@defopt d--efopt_name
d--efopt
@end defopt

@deftypefun t--ype d--eftypefun_name a--rguments...
d--eftypefun
@end deftypefun

@deftypevar t--ype d--eftypevar_name
d--eftypevar
@end deftypevar

@defivar c--lass d--efivar_name
d--efivar
@end defivar

@deftypeivar c--lass t--ype d--eftypeivar_name
d--eftypeivar
@end deftypeivar

@defmethod c--lass d--efmethod_name a--rguments...
d--efmethod
@end defmethod

@deftypemethod c--lass t--ype d--eftypemethod_name a--rguments...
d--eftypemethod
@end deftypemethod
';


$result_texts{'all_commands'} = 'c--ategory: d--efvr_name
d-efvr

c--ategory: n--ame a--rguments...
d-effn

c--ategory: n--ame
d-effn no arg

c--ategory: t--ype d--eftypefn_name a--rguments...
d-eftypefn

c--ategory: t--ype d--eftypefn_name
d-eftypefn no arg

c--ategory on c--lass: t--ype d--eftypeop_name a--rguments...
d-eftypeop

c--ategory on c--lass: t--ype d--eftypeop_name
d-eftypeop no arg

c--ategory: t--ype d--eftypevr_name
d-eftypevr

c--ategory of c--lass: d--efcv_name
d-efcv

c--ategory of c--lass: d--efcv_name a--rguments...
d-efcv with arguments

c--ategory of c--lass: t--ype d--eftypecv_name
d-eftypecv

c--ategory of c--lass: t--ype d--eftypecv_name a--rguments...
d-eftypecv with arguments

c--ategory on c--lass: d--efop_name a--rguments...
d-efop

c--ategory on c--lass: d--efop_name
d-efop no arg

c--ategory: d--eftp_name a--ttributes...
d-eftp

Function: d--efun_name a--rguments...
d-efun

Macro: d--efmac_name a--rguments...
d-efmac

Special Form: d--efspec_name a--rguments...
d-efspec

Variable: d--efvar_name
d-efvar

Variable: d--efvar_name arg--var arg--var1
d-efvar with args

User Option: d--efopt_name
d-efopt

Function: t--ype d--eftypefun_name a--rguments...
d-eftypefun

Variable: t--ype d--eftypevar_name
d-eftypevar

Instance Variable of c--lass: d--efivar_name
d-efivar

Instance Variable of c--lass: t--ype d--eftypeivar_name
d-eftypeivar

Method on c--lass: d--efmethod_name a--rguments...
d-efmethod

Method on c--lass: t--ype d--eftypemethod_name a--rguments...
d-eftypemethod
';

$result_errors{'all_commands'} = '* W l1|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l5|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l9|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l13|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l17|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l21|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l25|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l29|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l33|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l37|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l41|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l45|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l49|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l53|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l57|entry for index `tp\' outside of any node
 warning: entry for index `tp\' outside of any node

* W l61|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l65|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l69|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l73|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l77|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l81|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l85|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l89|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l93|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l97|entry for index `vr\' outside of any node
 warning: entry for index `vr\' outside of any node

* W l101|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* W l105|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

';

$result_nodes_list{'all_commands'} = '';

$result_sections_list{'all_commands'} = '';

$result_sectioning_root{'all_commands'} = '';

$result_headings_list{'all_commands'} = '';

$result_indices_sort_strings{'all_commands'} = 'fn:
 d--efmac_name
 d--efmethod_name on c--lass
 d--efop_name on c--lass
 d--efop_name on c--lass
 d--efspec_name
 d--eftypefn_name
 d--eftypefn_name
 d--eftypefun_name
 d--eftypemethod_name on c--lass
 d--eftypeop_name on c--lass
 d--eftypeop_name on c--lass
 d--efun_name
 n--ame
 n--ame
tp:
 d--eftp_name
vr:
 d--efcv_name of c--lass
 d--efcv_name of c--lass
 d--efivar_name of c--lass
 d--efopt_name
 d--eftypecv_name of c--lass
 d--eftypecv_name of c--lass
 d--eftypeivar_name of c--lass
 d--eftypevar_name
 d--eftypevr_name
 d--efvar_name
 d--efvar_name
 d--efvr_name
';


$result_converted{'plaintext'}->{'all_commands'} = ' -- c-ategory: d--efvr_name
     d-efvr

 -- c-ategory: n--ame a--rguments...
     d-effn

 -- c-ategory: n--ame
     d-effn no arg

 -- c-ategory: t--ype d--eftypefn_name a--rguments...
     d-eftypefn

 -- c-ategory: t--ype d--eftypefn_name
     d-eftypefn no arg

 -- c-ategory on c--lass: t--ype d--eftypeop_name a--rguments...
     d-eftypeop

 -- c-ategory on c--lass: t--ype d--eftypeop_name
     d-eftypeop no arg

 -- c-ategory: t--ype d--eftypevr_name
     d-eftypevr

 -- c-ategory of c--lass: d--efcv_name
     d-efcv

 -- c-ategory of c--lass: d--efcv_name a--rguments...
     d-efcv with arguments

 -- c-ategory of c--lass: t--ype d--eftypecv_name
     d-eftypecv

 -- c-ategory of c--lass: t--ype d--eftypecv_name a--rguments...
     d-eftypecv with arguments

 -- c-ategory on c--lass: d--efop_name a--rguments...
     d-efop

 -- c-ategory on c--lass: d--efop_name
     d-efop no arg

 -- c-ategory: d--eftp_name a--ttributes...
     d-eftp

 -- Function: d--efun_name a--rguments...
     d-efun

 -- Macro: d--efmac_name a--rguments...
     d-efmac

 -- Special Form: d--efspec_name a--rguments...
     d-efspec

 -- Variable: d--efvar_name
     d-efvar

 -- Variable: d--efvar_name arg--var arg--var1
     d-efvar with args

 -- User Option: d--efopt_name
     d-efopt

 -- Function: t--ype d--eftypefun_name a--rguments...
     d-eftypefun

 -- Variable: t--ype d--eftypevar_name
     d-eftypevar

 -- Instance Variable of c--lass: d--efivar_name
     d-efivar

 -- Instance Variable of c--lass: t--ype d--eftypeivar_name
     d-eftypeivar

 -- Method on c--lass: d--efmethod_name a--rguments...
     d-efmethod

 -- Method on c--lass: t--ype d--eftypemethod_name a--rguments...
     d-eftypemethod
';

$result_converted_sort_strings{'plaintext'}->{'all_commands'} = 'fn:
 d--efmac_name
 d--efmethod_name on c--lass
 d--efop_name on c--lass
 d--efop_name on c--lass
 d--efspec_name
 d--eftypefn_name
 d--eftypefn_name
 d--eftypefun_name
 d--eftypemethod_name on c--lass
 d--eftypeop_name on c--lass
 d--eftypeop_name on c--lass
 d--efun_name
 n--ame
 n--ame
tp:
 d--eftp_name
vr:
 d--efcv_name of c--lass
 d--efcv_name of c--lass
 d--efivar_name of c--lass
 d--efopt_name
 d--eftypecv_name of c--lass
 d--eftypecv_name of c--lass
 d--eftypeivar_name of c--lass
 d--eftypevar_name
 d--eftypevr_name
 d--efvar_name
 d--efvar_name
 d--efvr_name
';

1;
