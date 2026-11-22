use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'all_commands_printindex'} = '*document_root C3
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
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@node C65 l2 {chap}
 |EXTRA
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  *@xrefname C1 l3
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defvr C3 l5
   *def_line C1 l5
   |EXTRA
   |def_command:{defvr}
   |element_node:{chap}
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
   *@end C1 l7
   |EXTRA
   |text_arg:{defvr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defvr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deffn C3 l9
   *def_line C1 l9
   |EXTRA
   |def_command:{deffn}
   |element_node:{chap}
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
   *@end C1 l11
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deffn C3 l13
   *def_line C1 l13
   |EXTRA
   |def_command:{deffn}
   |element_node:{chap}
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
   *@end C1 l15
   |EXTRA
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C3 l17
   *def_line C1 l17
   |EXTRA
   |def_command:{deftypefn}
   |element_node:{chap}
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
   *@end C1 l19
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefn C3 l21
   *def_line C1 l21
   |EXTRA
   |def_command:{deftypefn}
   |element_node:{chap}
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
   *@end C1 l23
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C3 l25
   *def_line C1 l25
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
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
   *@end C1 l27
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeop C3 l29
   *def_line C1 l29
   |EXTRA
   |def_command:{deftypeop}
   |element_node:{chap}
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
   *@end C1 l31
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypevr C3 l33
   *def_line C1 l33
   |EXTRA
   |def_command:{deftypevr}
   |element_node:{chap}
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
   *@end C1 l35
   |EXTRA
   |text_arg:{deftypevr}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypevr}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defcv C3 l37
   *def_line C1 l37
   |EXTRA
   |def_command:{defcv}
   |element_node:{chap}
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
   *@end C1 l39
   |EXTRA
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defcv C3 l41
   *def_line C1 l41
   |EXTRA
   |def_command:{defcv}
   |element_node:{chap}
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
   *@end C1 l43
   |EXTRA
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypecv C3 l45
   *def_line C1 l45
   |EXTRA
   |def_command:{deftypecv}
   |element_node:{chap}
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
   *@end C1 l47
   |EXTRA
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypecv C3 l49
   *def_line C1 l49
   |EXTRA
   |def_command:{deftypecv}
   |element_node:{chap}
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
   *@end C1 l51
   |EXTRA
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defop C3 l53
   *def_line C1 l53
   |EXTRA
   |def_command:{defop}
   |element_node:{chap}
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
   *@end C1 l55
   |EXTRA
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defop C3 l57
   *def_line C1 l57
   |EXTRA
   |def_command:{defop}
   |element_node:{chap}
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
   *@end C1 l59
   |EXTRA
   |text_arg:{defop}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defop}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftp C3 l61
   *def_line C1 l61
   |EXTRA
   |def_command:{deftp}
   |element_node:{chap}
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
   *@end C1 l63
   |EXTRA
   |text_arg:{deftp}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftp}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defun C3 l65
   *def_line C1 l65
   |EXTRA
   |def_command:{defun}
   |element_node:{chap}
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
   *@end C1 l67
   |EXTRA
   |text_arg:{defun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defmac C3 l69
   *def_line C1 l69
   |EXTRA
   |def_command:{defmac}
   |element_node:{chap}
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
   *@end C1 l71
   |EXTRA
   |text_arg:{defmac}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defmac}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defspec C3 l73
   *def_line C1 l73
   |EXTRA
   |def_command:{defspec}
   |element_node:{chap}
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
   *@end C1 l75
   |EXTRA
   |text_arg:{defspec}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defspec}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defvar C3 l77
   *def_line C1 l77
   |EXTRA
   |def_command:{defvar}
   |element_node:{chap}
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
   *@end C1 l79
   |EXTRA
   |text_arg:{defvar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defvar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defvar C3 l81
   *def_line C1 l81
   |EXTRA
   |def_command:{defvar}
   |element_node:{chap}
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
   *@end C1 l83
   |EXTRA
   |text_arg:{defvar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defvar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defopt C3 l85
   *def_line C1 l85
   |EXTRA
   |def_command:{defopt}
   |element_node:{chap}
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
   *@end C1 l87
   |EXTRA
   |text_arg:{defopt}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defopt}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypefun C3 l89
   *def_line C1 l89
   |EXTRA
   |def_command:{deftypefun}
   |element_node:{chap}
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
   *@end C1 l91
   |EXTRA
   |text_arg:{deftypefun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypevar C3 l93
   *def_line C1 l93
   |EXTRA
   |def_command:{deftypevar}
   |element_node:{chap}
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
   *@end C1 l95
   |EXTRA
   |text_arg:{deftypevar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypevar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defivar C3 l97
   *def_line C1 l97
   |EXTRA
   |def_command:{defivar}
   |element_node:{chap}
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
   *@end C1 l99
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypeivar C3 l101
   *def_line C1 l101
   |EXTRA
   |def_command:{deftypeivar}
   |element_node:{chap}
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
   *@end C1 l103
   |EXTRA
   |text_arg:{deftypeivar}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypeivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defmethod C3 l105
   *def_line C1 l105
   |EXTRA
   |def_command:{defmethod}
   |element_node:{chap}
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
   *@end C1 l107
   |EXTRA
   |text_arg:{defmethod}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defmethod}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@deftypemethod C3 l109
   *def_line C1 l109
   |EXTRA
   |def_command:{deftypemethod}
   |element_node:{chap}
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
   *@end C1 l111
   |EXTRA
   |text_arg:{deftypemethod}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypemethod}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@heading C1 l113
  |EXTRA
  |global_command_number:{1}
  |heading_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Functions}
    {spaces_after_argument:\\n}
  *@printindex C1 l114
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:fn}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@heading C1 l116
  |EXTRA
  |global_command_number:{2}
  |heading_number:{3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Types}
    {spaces_after_argument:\\n}
  *@printindex C1 l117
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{tp}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:tp}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@heading C1 l119
  |EXTRA
  |global_command_number:{3}
  |heading_number:{4}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Variables}
    {spaces_after_argument:\\n}
  *@printindex C1 l120
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{vr}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:vr}
    {spaces_after_argument:\\n}
';


$result_texis{'all_commands_printindex'} = '@node Top
@node chap
@xrefname chap

@defvr c--ategory d--efvr_name
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

@heading Functions
@printindex fn

@heading Types
@printindex tp

@heading Variables
@printindex vr
';


$result_texts{'all_commands_printindex'} = '
c--ategory: d--efvr_name
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

Functions
=========

Types
=====

Variables
=========
';

$result_errors{'all_commands_printindex'} = '* W l2|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_nodes_list{'all_commands_printindex'} = '1|Top
 node_directions:
  next->chap
2|chap
 associated_title_command: @xrefname chap
 node_directions:
  prev->Top
';

$result_sections_list{'all_commands_printindex'} = '';

$result_sectioning_root{'all_commands_printindex'} = '';

$result_headings_list{'all_commands_printindex'} = '1|chap
 associated_anchor_command: chap
2|Functions
3|Types
4|Variables
';

$result_indices_sort_strings{'all_commands_printindex'} = 'fn:
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


$result_converted{'info'}->{'all_commands_printindex'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)


File: ,  Node: chap,  Prev: Top

 -- c-ategory: d--efvr_name
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

Functions
=========

 [index ]
* Menu:

* d--efmac_name:                         chap.                 (line 51)
* d--efmethod_name on c--lass:           chap.                 (line 78)
* d--efop_name on c--lass:               chap.                 (line 39)
* d--efop_name on c--lass <1>:           chap.                 (line 42)
* d--efspec_name:                        chap.                 (line 54)
* d--eftypefn_name:                      chap.                 (line 12)
* d--eftypefn_name <1>:                  chap.                 (line 15)
* d--eftypefun_name:                     chap.                 (line 66)
* d--eftypemethod_name on c--lass:       chap.                 (line 81)
* d--eftypeop_name on c--lass:           chap.                 (line 18)
* d--eftypeop_name on c--lass <1>:       chap.                 (line 21)
* d--efun_name:                          chap.                 (line 48)
* n--ame:                                chap.                 (line  6)
* n--ame <1>:                            chap.                 (line  9)

Types
=====

 [index ]
* Menu:

* d--eftp_name:                          chap.                 (line 45)

Variables
=========

 [index ]
* Menu:

* d--efcv_name of c--lass:               chap.                 (line 27)
* d--efcv_name of c--lass <1>:           chap.                 (line 30)
* d--efivar_name of c--lass:             chap.                 (line 72)
* d--efopt_name:                         chap.                 (line 63)
* d--eftypecv_name of c--lass:           chap.                 (line 33)
* d--eftypecv_name of c--lass <1>:       chap.                 (line 36)
* d--eftypeivar_name of c--lass:         chap.                 (line 75)
* d--eftypevar_name:                     chap.                 (line 69)
* d--eftypevr_name:                      chap.                 (line 24)
* d--efvar_name:                         chap.                 (line 57)
* d--efvar_name <1>:                     chap.                 (line 60)
* d--efvr_name:                          chap.                 (line  3)


Tag Table:
Node: Top27
Node: chap74
Ref: Index: fn1851
Ref: Index: tp2908
Ref: Index: vr3024

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_sort_strings{'info'}->{'all_commands_printindex'} = 'fn:
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


$result_converted{'html'}->{'all_commands_printindex'} = '<!DOCTYPE html>
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

<dl class="first-defvr def-block">
<dt class="defvr def-line" id="index-d_002d_002defvr_005fname"><span class="category-def">c&ndash;ategory: </span><span><strong class="def-name">d--efvr_name</strong><a class="copiable-link" href="#index-d_002d_002defvr_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;efvr
</p></dd></dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-n_002d_002dame"><span class="category-def">c&ndash;ategory: </span><span><strong class="def-name">n--ame</strong> <var class="def-var-arguments">a&ndash;rguments...</var><a class="copiable-link" href="#index-n_002d_002dame"> &para;</a></span></dt>
<dd><p>d&ndash;effn
</p></dd></dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-n_002d_002dame-1"><span class="category-def">c&ndash;ategory: </span><span><strong class="def-name">n--ame</strong><a class="copiable-link" href="#index-n_002d_002dame-1"> &para;</a></span></dt>
<dd><p>d&ndash;effn no arg
</p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-d_002d_002deftypefn_005fname"><span class="category-def">c&ndash;ategory: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypefn_name</strong> <code class="def-code-arguments">a--rguments...</code><a class="copiable-link" href="#index-d_002d_002deftypefn_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;eftypefn
</p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-d_002d_002deftypefn_005fname-1"><span class="category-def">c&ndash;ategory: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypefn_name</strong><a class="copiable-link" href="#index-d_002d_002deftypefn_005fname-1"> &para;</a></span></dt>
<dd><p>d&ndash;eftypefn no arg
</p></dd></dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-d_002d_002deftypeop_005fname-on-c_002d_002dlass"><span class="category-def">c&ndash;ategory on <code class="code">c--lass</code>: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypeop_name</strong> <code class="def-code-arguments">a--rguments...</code><a class="copiable-link" href="#index-d_002d_002deftypeop_005fname-on-c_002d_002dlass"> &para;</a></span></dt>
<dd><p>d&ndash;eftypeop
</p></dd></dl>

<dl class="first-deftypeop def-block">
<dt class="deftypeop def-line" id="index-d_002d_002deftypeop_005fname-on-c_002d_002dlass-1"><span class="category-def">c&ndash;ategory on <code class="code">c--lass</code>: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypeop_name</strong><a class="copiable-link" href="#index-d_002d_002deftypeop_005fname-on-c_002d_002dlass-1"> &para;</a></span></dt>
<dd><p>d&ndash;eftypeop no arg
</p></dd></dl>

<dl class="first-deftypevr def-block">
<dt class="deftypevr def-line" id="index-d_002d_002deftypevr_005fname"><span class="category-def">c&ndash;ategory: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypevr_name</strong><a class="copiable-link" href="#index-d_002d_002deftypevr_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;eftypevr
</p></dd></dl>

<dl class="first-defcv def-block">
<dt class="defcv def-line" id="index-d_002d_002defcv_005fname-of-c_002d_002dlass"><span class="category-def">c&ndash;ategory of <code class="code">c--lass</code>: </span><span><strong class="def-name">d--efcv_name</strong><a class="copiable-link" href="#index-d_002d_002defcv_005fname-of-c_002d_002dlass"> &para;</a></span></dt>
<dd><p>d&ndash;efcv
</p></dd></dl>

<dl class="first-defcv def-block">
<dt class="defcv def-line" id="index-d_002d_002defcv_005fname-of-c_002d_002dlass-1"><span class="category-def">c&ndash;ategory of <code class="code">c--lass</code>: </span><span><strong class="def-name">d--efcv_name</strong> <var class="def-var-arguments">a&ndash;rguments...</var><a class="copiable-link" href="#index-d_002d_002defcv_005fname-of-c_002d_002dlass-1"> &para;</a></span></dt>
<dd><p>d&ndash;efcv with arguments
</p></dd></dl>

<dl class="first-deftypecv def-block">
<dt class="deftypecv def-line" id="index-d_002d_002deftypecv_005fname-of-c_002d_002dlass"><span class="category-def">c&ndash;ategory of <code class="code">c--lass</code>: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypecv_name</strong><a class="copiable-link" href="#index-d_002d_002deftypecv_005fname-of-c_002d_002dlass"> &para;</a></span></dt>
<dd><p>d&ndash;eftypecv
</p></dd></dl>

<dl class="first-deftypecv def-block">
<dt class="deftypecv def-line" id="index-d_002d_002deftypecv_005fname-of-c_002d_002dlass-1"><span class="category-def">c&ndash;ategory of <code class="code">c--lass</code>: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypecv_name</strong> <code class="def-code-arguments">a--rguments...</code><a class="copiable-link" href="#index-d_002d_002deftypecv_005fname-of-c_002d_002dlass-1"> &para;</a></span></dt>
<dd><p>d&ndash;eftypecv with arguments
</p></dd></dl>

<dl class="first-defop def-block">
<dt class="defop def-line" id="index-d_002d_002defop_005fname-on-c_002d_002dlass"><span class="category-def">c&ndash;ategory on <code class="code">c--lass</code>: </span><span><strong class="def-name">d--efop_name</strong> <var class="def-var-arguments">a&ndash;rguments...</var><a class="copiable-link" href="#index-d_002d_002defop_005fname-on-c_002d_002dlass"> &para;</a></span></dt>
<dd><p>d&ndash;efop
</p></dd></dl>

<dl class="first-defop def-block">
<dt class="defop def-line" id="index-d_002d_002defop_005fname-on-c_002d_002dlass-1"><span class="category-def">c&ndash;ategory on <code class="code">c--lass</code>: </span><span><strong class="def-name">d--efop_name</strong><a class="copiable-link" href="#index-d_002d_002defop_005fname-on-c_002d_002dlass-1"> &para;</a></span></dt>
<dd><p>d&ndash;efop no arg
</p></dd></dl>

<dl class="first-deftp def-block">
<dt class="deftp def-line" id="index-d_002d_002deftp_005fname"><span class="category-def">c&ndash;ategory: </span><span><strong class="def-name">d--eftp_name</strong> <var class="def-var-arguments">a&ndash;ttributes...</var><a class="copiable-link" href="#index-d_002d_002deftp_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;eftp
</p></dd></dl>

<dl class="first-deffn first-defun-alias-first-deffn def-block">
<dt class="deffn defun-alias-deffn def-line" id="index-d_002d_002defun_005fname"><span class="category-def">Function: </span><span><strong class="def-name">d--efun_name</strong> <var class="def-var-arguments">a&ndash;rguments...</var><a class="copiable-link" href="#index-d_002d_002defun_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;efun
</p></dd></dl>

<dl class="first-deffn first-defmac-alias-first-deffn def-block">
<dt class="deffn defmac-alias-deffn def-line" id="index-d_002d_002defmac_005fname"><span class="category-def">Macro: </span><span><strong class="def-name">d--efmac_name</strong> <var class="def-var-arguments">a&ndash;rguments...</var><a class="copiable-link" href="#index-d_002d_002defmac_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;efmac
</p></dd></dl>

<dl class="first-deffn first-defspec-alias-first-deffn def-block">
<dt class="deffn defspec-alias-deffn def-line" id="index-d_002d_002defspec_005fname"><span class="category-def">Special Form: </span><span><strong class="def-name">d--efspec_name</strong> <var class="def-var-arguments">a&ndash;rguments...</var><a class="copiable-link" href="#index-d_002d_002defspec_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;efspec
</p></dd></dl>

<dl class="first-defvr first-defvar-alias-first-defvr def-block">
<dt class="defvr defvar-alias-defvr def-line" id="index-d_002d_002defvar_005fname"><span class="category-def">Variable: </span><span><strong class="def-name">d--efvar_name</strong><a class="copiable-link" href="#index-d_002d_002defvar_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;efvar
</p></dd></dl>

<dl class="first-defvr first-defvar-alias-first-defvr def-block">
<dt class="defvr defvar-alias-defvr def-line" id="index-d_002d_002defvar_005fname-1"><span class="category-def">Variable: </span><span><strong class="def-name">d--efvar_name</strong> <var class="def-var-arguments">arg&ndash;var arg&ndash;var1</var><a class="copiable-link" href="#index-d_002d_002defvar_005fname-1"> &para;</a></span></dt>
<dd><p>d&ndash;efvar with args
</p></dd></dl>

<dl class="first-defvr first-defopt-alias-first-defvr def-block">
<dt class="defvr defopt-alias-defvr def-line" id="index-d_002d_002defopt_005fname"><span class="category-def">User Option: </span><span><strong class="def-name">d--efopt_name</strong><a class="copiable-link" href="#index-d_002d_002defopt_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;efopt
</p></dd></dl>

<dl class="first-deftypefn first-deftypefun-alias-first-deftypefn def-block">
<dt class="deftypefn deftypefun-alias-deftypefn def-line" id="index-d_002d_002deftypefun_005fname"><span class="category-def">Function: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypefun_name</strong> <code class="def-code-arguments">a--rguments...</code><a class="copiable-link" href="#index-d_002d_002deftypefun_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;eftypefun
</p></dd></dl>

<dl class="first-deftypevr first-deftypevar-alias-first-deftypevr def-block">
<dt class="deftypevr deftypevar-alias-deftypevr def-line" id="index-d_002d_002deftypevar_005fname"><span class="category-def">Variable: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypevar_name</strong><a class="copiable-link" href="#index-d_002d_002deftypevar_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;eftypevar
</p></dd></dl>

<dl class="first-defcv first-defivar-alias-first-defcv def-block">
<dt class="defcv defivar-alias-defcv def-line" id="index-d_002d_002defivar_005fname-of-c_002d_002dlass"><span class="category-def">Instance Variable of <code class="code">c--lass</code>: </span><span><strong class="def-name">d--efivar_name</strong><a class="copiable-link" href="#index-d_002d_002defivar_005fname-of-c_002d_002dlass"> &para;</a></span></dt>
<dd><p>d&ndash;efivar
</p></dd></dl>

<dl class="first-deftypecv first-deftypeivar-alias-first-deftypecv def-block">
<dt class="deftypecv deftypeivar-alias-deftypecv def-line" id="index-d_002d_002deftypeivar_005fname-of-c_002d_002dlass"><span class="category-def">Instance Variable of <code class="code">c--lass</code>: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypeivar_name</strong><a class="copiable-link" href="#index-d_002d_002deftypeivar_005fname-of-c_002d_002dlass"> &para;</a></span></dt>
<dd><p>d&ndash;eftypeivar
</p></dd></dl>

<dl class="first-defop first-defmethod-alias-first-defop def-block">
<dt class="defop defmethod-alias-defop def-line" id="index-d_002d_002defmethod_005fname-on-c_002d_002dlass"><span class="category-def">Method on <code class="code">c--lass</code>: </span><span><strong class="def-name">d--efmethod_name</strong> <var class="def-var-arguments">a&ndash;rguments...</var><a class="copiable-link" href="#index-d_002d_002defmethod_005fname-on-c_002d_002dlass"> &para;</a></span></dt>
<dd><p>d&ndash;efmethod
</p></dd></dl>

<dl class="first-deftypeop first-deftypemethod-alias-first-deftypeop def-block">
<dt class="deftypeop deftypemethod-alias-deftypeop def-line" id="index-d_002d_002deftypemethod_005fname-on-c_002d_002dlass"><span class="category-def">Method on <code class="code">c--lass</code>: </span><span><code class="def-type">t--ype</code> <strong class="def-name">d--eftypemethod_name</strong> <code class="def-code-arguments">a--rguments...</code><a class="copiable-link" href="#index-d_002d_002deftypemethod_005fname-on-c_002d_002dlass"> &para;</a></span></dt>
<dd><p>d&ndash;eftypemethod
</p></dd></dl>

<h3 class="heading" id="Functions"><span>Functions<a class="copiable-link" href="#Functions"> &para;</a></span></h3>
<div class="printindex fn-printindex">
<table class="index-letters-header-printindex fn-letters-header-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_fn_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-N"><b>N</b></a>
 &nbsp; 
</td></tr></table>
<table class="index-entries-printindex fn-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-D">D</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defmac_005fname"><code>d--efmac_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defmethod_005fname-on-c_002d_002dlass"><code>d--efmethod_name on c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defop_005fname-on-c_002d_002dlass"><code>d--efop_name on c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defop_005fname-on-c_002d_002dlass-1"><code>d--efop_name on c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defspec_005fname"><code>d--efspec_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftypefn_005fname"><code>d--eftypefn_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftypefn_005fname-1"><code>d--eftypefn_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftypefun_005fname"><code>d--eftypefun_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftypemethod_005fname-on-c_002d_002dlass"><code>d--eftypemethod_name on c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftypeop_005fname-on-c_002d_002dlass"><code>d--eftypeop_name on c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftypeop_005fname-on-c_002d_002dlass-1"><code>d--eftypeop_name on c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defun_005fname"><code>d--efun_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex fn-letter-header-printindex" colspan="2" id="chap_fn_letter-N">N</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-n_002d_002dame"><code>n--ame</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-n_002d_002dame-1"><code>n--ame</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
<table class="index-letters-footer-printindex fn-letters-footer-printindex"><tr><th>Jump to: &nbsp; </th><td><a class="summary-letter-printindex" href="#chap_fn_letter-D"><b>D</b></a>
 &nbsp; 
<a class="summary-letter-printindex" href="#chap_fn_letter-N"><b>N</b></a>
 &nbsp; 
</td></tr></table>
</div>

<h3 class="heading" id="Types"><span>Types<a class="copiable-link" href="#Types"> &para;</a></span></h3>
<div class="printindex tp-printindex">
<table class="index-entries-printindex tp-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex tp-letter-header-printindex" colspan="2" id="chap_tp_letter-D">D</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftp_005fname"><code>d--eftp_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>

<h3 class="heading" id="Variables"><span>Variables<a class="copiable-link" href="#Variables"> &para;</a></span></h3>
<div class="printindex vr-printindex">
<table class="index-entries-printindex vr-entries-printindex">
<tr><td colspan="2"><hr></td></tr>
<tr><th class="index-letter-header-printindex vr-letter-header-printindex" colspan="2" id="chap_vr_letter-D">D</th></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defcv_005fname-of-c_002d_002dlass"><code>d--efcv_name of c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defcv_005fname-of-c_002d_002dlass-1"><code>d--efcv_name of c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defivar_005fname-of-c_002d_002dlass"><code>d--efivar_name of c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defopt_005fname"><code>d--efopt_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftypecv_005fname-of-c_002d_002dlass"><code>d--eftypecv_name of c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftypecv_005fname-of-c_002d_002dlass-1"><code>d--eftypecv_name of c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftypeivar_005fname-of-c_002d_002dlass"><code>d--eftypeivar_name of c--lass</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftypevar_005fname"><code>d--eftypevar_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002deftypevr_005fname"><code>d--eftypevr_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defvar_005fname"><code>d--efvar_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defvar_005fname-1"><code>d--efvar_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defvr_005fname"><code>d--efvr_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td colspan="2"><hr></td></tr>
</table>
</div>



</body>
</html>
';

$result_converted_sort_strings{'html'}->{'all_commands_printindex'} = 'fn:
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

$result_converted_errors{'html'}->{'all_commands_printindex'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

1;
