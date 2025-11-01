use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'all_commands_printindex'} = '*document_root C3
 *before_node_section
 *@node C1 l1 {Top}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |node_number:{1}
 |normalized:{Top}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Top}
 *@node C65 l2 {chap}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
 |normalized:{chap}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  *@xrefname C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {chap}
  {empty_line:\\n}
  *@defvr C3 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l5
   |EXTRA
   |def_command:{defvr}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--efvr_name}
   |element_node:{chap}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defvr}
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efvr_name}
   *def_item C1
    *paragraph C1
     {d--efvr\\n}
   *@end C1 l7
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defvr}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defvr}
  {empty_line:\\n}
  *@deffn C3 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l9
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{n--ame}
   |element_node:{chap}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {n--ame}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--effn\\n}
   *@end C1 l11
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
  {empty_line:\\n}
  *@deffn C3 l13
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l13
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{n--ame}
   |element_node:{chap}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {n--ame}
   *def_item C1
    *paragraph C1
     {d--effn no arg\\n}
   *@end C1 l15
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deffn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deffn}
  {empty_line:\\n}
  *@deftypefn C3 l17
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l17
   |EXTRA
   |def_command:{deftypefn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--eftypefn_name}
   |element_node:{chap}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftypefn_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--eftypefn\\n}
   *@end C1 l19
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypefn}
  {empty_line:\\n}
  *@deftypefn C3 l21
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l21
   |EXTRA
   |def_command:{deftypefn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--eftypefn_name}
   |element_node:{chap}
   |index_entry:I{fn,4}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftypefn_name}
   *def_item C1
    *paragraph C1
     {d--eftypefn no arg\\n}
   *@end C1 l23
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypefn}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypefn}
  {empty_line:\\n}
  *@deftypeop C3 l25
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l25
   |EXTRA
   |def_command:{deftypeop}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypeop_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypeop_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |element_node:{chap}
   |index_entry:I{fn,5}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftypeop_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--eftypeop\\n}
   *@end C1 l27
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypeop}
  {empty_line:\\n}
  *@deftypeop C3 l29
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l29
   |EXTRA
   |def_command:{deftypeop}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypeop_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypeop_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |element_node:{chap}
   |index_entry:I{fn,6}
   |original_def_cmdname:{deftypeop}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftypeop_name}
   *def_item C1
    *paragraph C1
     {d--eftypeop no arg\\n}
   *@end C1 l31
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypeop}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypeop}
  {empty_line:\\n}
  *@deftypevr C3 l33
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l33
   |EXTRA
   |def_command:{deftypevr}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--eftypevr_name}
   |element_node:{chap}
   |index_entry:I{vr,2}
   |original_def_cmdname:{deftypevr}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftypevr_name}
   *def_item C1
    *paragraph C1
     {d--eftypevr\\n}
   *@end C1 l35
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypevr}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypevr}
  {empty_line:\\n}
  *@defcv C3 l37
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l37
   |EXTRA
   |def_command:{defcv}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--efcv_name}
   |element_node:{chap}
   |index_entry:I{vr,3}
   |original_def_cmdname:{defcv}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efcv_name}
   *def_item C1
    *paragraph C1
     {d--efcv\\n}
   *@end C1 l39
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defcv}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defcv}
  {empty_line:\\n}
  *@defcv C3 l41
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l41
   |EXTRA
   |def_command:{defcv}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--efcv_name}
   |element_node:{chap}
   |index_entry:I{vr,4}
   |original_def_cmdname:{defcv}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efcv_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--efcv with arguments\\n}
   *@end C1 l43
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defcv}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defcv}
  {empty_line:\\n}
  *@deftypecv C3 l45
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l45
   |EXTRA
   |def_command:{deftypecv}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypecv_name}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypecv_name}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |element_node:{chap}
   |index_entry:I{vr,5}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftypecv_name}
   *def_item C1
    *paragraph C1
     {d--eftypecv\\n}
   *@end C1 l47
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypecv}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypecv}
  {empty_line:\\n}
  *@deftypecv C3 l49
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l49
   |EXTRA
   |def_command:{deftypecv}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypecv_name}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypecv_name}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |element_node:{chap}
   |index_entry:I{vr,6}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftypecv_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--eftypecv with arguments\\n}
   *@end C1 l51
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypecv}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypecv}
  {empty_line:\\n}
  *@defop C3 l53
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l53
   |EXTRA
   |def_command:{defop}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--efop_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--efop_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |element_node:{chap}
   |index_entry:I{fn,7}
   |original_def_cmdname:{defop}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efop_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--efop\\n}
   *@end C1 l55
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defop}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defop}
  {empty_line:\\n}
  *@defop C3 l57
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l57
   |EXTRA
   |def_command:{defop}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--efop_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--efop_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |element_node:{chap}
   |index_entry:I{fn,8}
   |original_def_cmdname:{defop}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efop_name}
   *def_item C1
    *paragraph C1
     {d--efop no arg\\n}
   *@end C1 l59
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defop}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defop}
  {empty_line:\\n}
  *@deftp C3 l61
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l61
   |EXTRA
   |def_command:{deftp}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--eftp_name}
   |element_node:{chap}
   |index_entry:I{tp,1}
   |original_def_cmdname:{deftp}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *def_line_arg C1
       {c--ategory}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftp_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {a--ttributes...}
   *def_item C1
    *paragraph C1
     {d--eftp\\n}
   *@end C1 l63
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftp}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftp}
  {empty_line:\\n}
  *@defun C3 l65
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l65
   |EXTRA
   |def_command:{defun}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--efun_name}
   |element_node:{chap}
   |index_entry:I{fn,9}
   |original_def_cmdname:{defun}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Function}
     (i){spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efun_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--efun\\n}
   *@end C1 l67
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defun}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defun}
  {empty_line:\\n}
  *@defmac C3 l69
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l69
   |EXTRA
   |def_command:{defmac}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--efmac_name}
   |element_node:{chap}
   |index_entry:I{fn,10}
   |original_def_cmdname:{defmac}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Macro}
     (i){spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efmac_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--efmac\\n}
   *@end C1 l71
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defmac}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defmac}
  {empty_line:\\n}
  *@defspec C3 l73
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l73
   |EXTRA
   |def_command:{defspec}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--efspec_name}
   |element_node:{chap}
   |index_entry:I{fn,11}
   |original_def_cmdname:{defspec}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Special Form}
     (i){spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efspec_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--efspec\\n}
   *@end C1 l75
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defspec}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defspec}
  {empty_line:\\n}
  *@defvar C3 l77
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l77
   |EXTRA
   |def_command:{defvar}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--efvar_name}
   |element_node:{chap}
   |index_entry:I{vr,7}
   |original_def_cmdname:{defvar}
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Variable}
     (i){spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efvar_name}
   *def_item C1
    *paragraph C1
     {d--efvar\\n}
   *@end C1 l79
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defvar}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defvar}
  {empty_line:\\n}
  *@defvar C3 l81
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l81
   |EXTRA
   |def_command:{defvar}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--efvar_name}
   |element_node:{chap}
   |index_entry:I{vr,8}
   |original_def_cmdname:{defvar}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Variable}
     (i){spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efvar_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg--var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {arg--var1}
   *def_item C1
    *paragraph C1
     {d--efvar with args\\n}
   *@end C1 l83
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defvar}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defvar}
  {empty_line:\\n}
  *@defopt C3 l85
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l85
   |EXTRA
   |def_command:{defopt}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--efopt_name}
   |element_node:{chap}
   |index_entry:I{vr,9}
   |original_def_cmdname:{defopt}
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {User Option}
     (i){spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efopt_name}
   *def_item C1
    *paragraph C1
     {d--efopt\\n}
   *@end C1 l87
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defopt}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defopt}
  {empty_line:\\n}
  *@deftypefun C3 l89
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l89
   |EXTRA
   |def_command:{deftypefun}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--eftypefun_name}
   |element_node:{chap}
   |index_entry:I{fn,12}
   |original_def_cmdname:{deftypefun}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Function}
     (i){spaces: }
     *def_type C1
      *def_line_arg C1
       {t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftypefun_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--eftypefun\\n}
   *@end C1 l91
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypefun}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypefun}
  {empty_line:\\n}
  *@deftypevar C3 l93
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l93
   |EXTRA
   |def_command:{deftypevar}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{d--eftypevar_name}
   |element_node:{chap}
   |index_entry:I{vr,10}
   |original_def_cmdname:{deftypevar}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Variable}
     (i){spaces: }
     *def_type C1
      *def_line_arg C1
       {t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftypevar_name}
   *def_item C1
    *paragraph C1
     {d--eftypevar\\n}
   *@end C1 l95
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypevar}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypevar}
  {empty_line:\\n}
  *@defivar C3 l97
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l97
   |EXTRA
   |def_command:{defivar}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--efivar_name}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--efivar_name}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |element_node:{chap}
   |index_entry:I{vr,11}
   |original_def_cmdname:{defivar}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Instance Variable}
     (i){spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efivar_name}
   *def_item C1
    *paragraph C1
     {d--efivar\\n}
   *@end C1 l99
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defivar}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defivar}
  {empty_line:\\n}
  *@deftypeivar C3 l101
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l101
   |EXTRA
   |def_command:{deftypeivar}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypeivar_name}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypeivar_name}
     |{ of }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |element_node:{chap}
   |index_entry:I{vr,12}
   |original_def_cmdname:{deftypeivar}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Instance Variable}
     (i){spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftypeivar_name}
   *def_item C1
    *paragraph C1
     {d--eftypeivar\\n}
   *@end C1 l103
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypeivar}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypeivar}
  {empty_line:\\n}
  *@defmethod C3 l105
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l105
   |EXTRA
   |def_command:{defmethod}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--efmethod_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--efmethod_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |element_node:{chap}
   |index_entry:I{fn,13}
   |original_def_cmdname:{defmethod}
    *block_line_arg C7
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Method}
     (i){spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--efmethod_name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--efmethod\\n}
   *@end C1 l107
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{defmethod}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {defmethod}
  {empty_line:\\n}
  *@deftypemethod C3 l109
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l109
   |EXTRA
   |def_command:{deftypemethod}
   |def_index_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypemethod_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |def_index_ref_element:
    |* C3
     |* C1
      |*def_line_arg C1
       |{d--eftypemethod_name}
     |{ on }
     |* C1
      |*def_line_arg C1
       |{c--lass}
   |element_node:{chap}
   |index_entry:I{fn,14}
   |original_def_cmdname:{deftypemethod}
    *block_line_arg C9
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
     |INFO
     |inserted:{1}
      *def_line_arg C1
       {Method}
     (i){spaces: }
     *def_class C1
      *def_line_arg C1
       {c--lass}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {t--ype}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {d--eftypemethod_name}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {a--rguments...}
   *def_item C1
    *paragraph C1
     {d--eftypemethod\\n}
   *@end C1 l111
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{deftypemethod}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {deftypemethod}
  {empty_line:\\n}
  *@heading C1 l113
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |heading_number:{2}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Functions}
  *@printindex C1 l114
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{1}
  |misc_args:A{fn}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {fn}
  {empty_line:\\n}
  *@heading C1 l116
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |heading_number:{3}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Types}
  *@printindex C1 l117
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{2}
  |misc_args:A{tp}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {tp}
  {empty_line:\\n}
  *@heading C1 l119
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{3}
  |heading_number:{4}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {Variables}
  *@printindex C1 l120
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |global_command_number:{3}
  |misc_args:A{vr}
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {vr}
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
 d--efcv_name
 d--efcv_name
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


$result_converted{'info'}->{'all_commands_printindex'} = 'This is , produced from .


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

* d--efcv_name:                          chap.                 (line 27)
* d--efcv_name <1>:                      chap.                 (line 30)
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

End Tag Table


Local Variables:
coding: utf-8
End:
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
span:hover a.copiable-link {visibility: visible}
strong.def-name {font-family: monospace; font-weight: bold; font-size: larger}
td.printindex-index-entry {vertical-align: top; padding-left: 1.5em}
td.printindex-index-section {vertical-align: top; padding-left: 1em}
th.index-letter-header-printindex {text-align: left}
</style>


</head>

<body lang="">
<a class="node-id" id="Top"></a><div class="nav-panel">
<p>
Next: <a href="#chap" accesskey="n" rel="next">chap</a> &nbsp; [<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>
<h1 class="node"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>
<hr>
<a class="node" id="chap"></a><div class="nav-panel">
<p>
Previous: <a href="#Top" accesskey="p" rel="prev">Top</a> &nbsp; [<a href="#chap" title="Index" rel="index">Index</a>]</p>
</div>

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
<dt class="defcv def-line" id="index-d_002d_002defcv_005fname"><span class="category-def">c&ndash;ategory of <code class="code">c--lass</code>: </span><span><strong class="def-name">d--efcv_name</strong><a class="copiable-link" href="#index-d_002d_002defcv_005fname"> &para;</a></span></dt>
<dd><p>d&ndash;efcv
</p></dd></dl>

<dl class="first-defcv def-block">
<dt class="defcv def-line" id="index-d_002d_002defcv_005fname-1"><span class="category-def">c&ndash;ategory of <code class="code">c--lass</code>: </span><span><strong class="def-name">d--efcv_name</strong> <var class="def-var-arguments">a&ndash;rguments...</var><a class="copiable-link" href="#index-d_002d_002defcv_005fname-1"> &para;</a></span></dt>
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
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defcv_005fname"><code>d--efcv_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
<tr><td class="printindex-index-entry"><a href="#index-d_002d_002defcv_005fname-1"><code>d--efcv_name</code></a></td><td class="printindex-index-section"><a href="#chap">chap</a></td></tr>
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

$result_converted_errors{'html'}->{'all_commands_printindex'} = [
  {
    'error_line' => 'warning: must specify a title with a title command or @top
',
    'text' => 'must specify a title with a title command or @top',
    'type' => 'warning'
  }
];


1;
