use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'definition_commands'} = '*document_root C5
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top section}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top section}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {chapter}
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
 *normal_command@chapter C39 l5 {chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l7
   *def_line C1 l7
   |def_command:{deffn}
   |element_node:{chapter}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Func}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:fname}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a---rg1}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a--rg2}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C5
     {normal_text:deffn no var for }
     *normal_command@var C1 l8
      *brace_container C1
       {normal_text:a---rg1}
     {normal_text: and }
     *normal_command@var C1 l8
      *brace_container C1
       {normal_text:a--rg2}
     {normal_text:\\n}
   *normal_command@end C1 l9
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l11
   *def_line C1 l11
   |def_command:{deffn}
   |element_node:{chapter}
   |index_entry:I{fn,2}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Func}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:fname}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l11
        *brace_container C1
         {normal_text:a---rg1}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l11
        *brace_container C1
         {normal_text:a--rg2}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C5
     {normal_text:deffn explict var for }
     *normal_command@var C1 l12
      *brace_container C1
       {normal_text:a---rg1}
     {normal_text: and }
     *normal_command@var C1 l12
      *brace_container C1
       {normal_text:a--rg2}
     {normal_text:\\n}
   *normal_command@end C1 l13
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l15
   *def_line C1 l15
   |def_command:{deffn}
   |element_node:{chapter}
   |index_entry:I{fn,3}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Func}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:fname}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l15
        *brace_container C1
         *normal_command@slanted C1 l15
          *brace_container C1
           {normal_text:a---rg1}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l15
        *brace_container C1
         *normal_command@slanted C1 l15
          *brace_container C1
           {normal_text:a--rg2}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C5
     {normal_text:deffn r slanted for }
     *normal_command@var C1 l16
      *brace_container C1
       {normal_text:a---rg1}
     {normal_text: and }
     *normal_command@var C1 l16
      *brace_container C1
       {normal_text:a--rg2}
     {normal_text:\\n}
   *normal_command@end C1 l17
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defspec C17 l19
   *def_line C1 l19
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,4}
   |original_def_cmdname:{defspec}
    *block_line_arg C21
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     {delimiter:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     {delimiter:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     {delimiter:]}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:default}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l20
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,5}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l20
        *brace_container C1
         {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l20
        *brace_container C1
         {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l20
        *brace_container C1
         {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l21
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,6}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l21
        *brace_container C1
         {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l21
        *brace_container C1
         {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l21
        *brace_container C1
         {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l22
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,7}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@slanted C1 l22
        *brace_container C1
         {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@slanted C1 l22
        *brace_container C1
         {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@slanted C1 l22
        *brace_container C1
         {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:slanted}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l23
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,8}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l23
        *brace_container C1
         {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l23
        *brace_container C1
         {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l23
        *brace_container C1
         {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:code}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l24
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,9}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l24
        *brace_container C1
         {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l24
        *brace_container C1
         {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l24
        *brace_container C1
         {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:t}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l25
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,10}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l25
        *brace_container C1
         *normal_command@b C1 l25
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l25
        *brace_container C1
         *normal_command@b C1 l25
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l25
        *brace_container C1
         *normal_command@b C1 l25
          *brace_container C1
           {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:t:b}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l26
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,11}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l26
        *brace_container C1
         *normal_command@var C1 l26
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l26
        *brace_container C1
         *normal_command@var C1 l26
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l26
        *brace_container C1
         *normal_command@var C1 l26
          *brace_container C1
           {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r:var}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l27
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,12}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l27
        *brace_container C1
         *normal_command@slanted C1 l27
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l27
        *brace_container C1
         *normal_command@slanted C1 l27
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l27
        *brace_container C1
         *normal_command@slanted C1 l27
          *brace_container C1
           {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r:slanted}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l28
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,13}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l28
        *brace_container C1
         *normal_command@code C1 l28
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l28
        *brace_container C1
         *normal_command@code C1 l28
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l28
        *brace_container C1
         *normal_command@code C1 l28
          *brace_container C1
           {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r:code}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l29
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,14}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l29
        *brace_container C1
         *normal_command@t C1 l29
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l29
        *brace_container C1
         *normal_command@t C1 l29
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l29
        *brace_container C1
         *normal_command@t C1 l29
          *brace_container C1
           {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r:t}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l30
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,15}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l30
        *brace_container C1
         *normal_command@var C1 l30
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l30
        *brace_container C1
         *normal_command@var C1 l30
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l30
        *brace_container C1
         *normal_command@var C1 l30
          *brace_container C1
           {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:code:var}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l31
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,16}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l31
        *brace_container C1
         *normal_command@var C1 l31
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l31
        *brace_container C1
         *normal_command@var C1 l31
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l31
        *brace_container C1
         *normal_command@var C1 l31
          *brace_container C1
           {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:t:var}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l32
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,17}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l32
        *brace_container C1
         *normal_command@slanted C1 l32
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l32
        *brace_container C1
         *normal_command@slanted C1 l32
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l32
        *brace_container C1
         *normal_command@slanted C1 l32
          *brace_container C1
           {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:code:slanted}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l33
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,18}
   |original_def_cmdname:{defspecx}
    *line_arg C20
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l33
        *brace_container C1
         *normal_command@slanted C1 l33
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:from}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:to}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l33
        *brace_container C1
         *normal_command@slanted C1 l33
          *brace_container C1
           {normal_text:[}
     *def_arg C1
      *def_line_arg C1
       {normal_text:inc}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l33
        *brace_container C1
         *normal_command@slanted C1 l33
          *brace_container C1
           {normal_text:]]}
     {delimiter:)}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:t:slanted}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:separators\\n}
   *normal_command@end C1 l35
   |text_arg:{defspec}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defspec}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defspec C17 l37
   *def_line C1 l37
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,19}
   |original_def_cmdname:{defspec}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:default}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l38
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,20}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l38
        *brace_container C1
         {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l39
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,21}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l39
        *brace_container C1
         {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l40
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,22}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@slanted C1 l40
        *brace_container C1
         {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:slanted}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l41
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,23}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l41
        *brace_container C1
         {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:code}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l42
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,24}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l42
        *brace_container C1
         {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:t}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l43
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,25}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l43
        *brace_container C1
         *normal_command@b C1 l43
          *brace_container C1
           {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:t:b}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l44
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,26}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l44
        *brace_container C1
         *normal_command@var C1 l44
          *brace_container C1
           {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r:var}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l45
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,27}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l45
        *brace_container C1
         *normal_command@slanted C1 l45
          *brace_container C1
           {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r:slanted}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l46
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,28}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l46
        *brace_container C1
         *normal_command@code C1 l46
          *brace_container C1
           {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r:code}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l47
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,29}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l47
        *brace_container C1
         *normal_command@t C1 l47
          *brace_container C1
           {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:r:t}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l48
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,30}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l48
        *brace_container C1
         *normal_command@var C1 l48
          *brace_container C1
           {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:code:var}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l49
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,31}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l49
        *brace_container C1
         *normal_command@var C1 l49
          *brace_container C1
           {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:t:var}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l50
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,32}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l50
        *brace_container C1
         *normal_command@slanted C1 l50
          *brace_container C1
           {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:code:slanted}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l51
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,33}
   |original_def_cmdname:{defspecx}
    *line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l51
        *brace_container C1
         *normal_command@slanted C1 l51
          *brace_container C1
           {normal_text:va---riable}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:t:slanted}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:name\\n}
   *normal_command@end C1 l53
   |text_arg:{defspec}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defspec}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C7 l55
   *def_line C1 l55
   |def_command:{deffn}
   |element_node:{chapter}
   |index_entry:I{fn,34}
   |original_def_cmdname:{deffn}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Request}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *normal_command@t C1 l55
        *brace_container C1
         {normal_text:.ft}
     {spaces: }
     {delimiter:[}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l55
        *brace_container C1
         *normal_command@slanted C1 l55
          *brace_container C1
           {normal_text:font}
     {delimiter:]}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l56
   |def_command:{deffn}
   |element_node:{chapter}
   |index_entry:I{fn,35}
   |original_def_cmdname:{deffnx}
    *line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C3
       {normal_text:Escape}
       *normal_command@tie C1 l56
        *brace_container
       {normal_text:sequence}
     {spaces: }
     *def_name C1
      *def_line_arg C3
       *normal_command@t C1 l56
        *brace_container C1
         {normal_text:\\f}
       *normal_command@r C1 l56
        *brace_container C1
         *normal_command@slanted C1 l56
          *brace_container C1
           {normal_text:f}
       *normal_command@t C1 l56
        *brace_container
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l57
   |def_command:{deffn}
   |element_node:{chapter}
   |index_entry:I{fn,36}
   |original_def_cmdname:{deffnx}
    *line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C3
       {normal_text:Escape}
       *normal_command@tie C1 l57
        *brace_container
       {normal_text:sequence}
     {spaces: }
     *def_name C1
      *def_line_arg C3
       *normal_command@t C1 l57
        *brace_container C1
         {normal_text:\\f(}
       *normal_command@r C1 l57
        *brace_container C1
         *normal_command@slanted C1 l57
          *brace_container C1
           {normal_text:fn}
       *normal_command@t C1 l57
        *brace_container
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l58
   |def_command:{deffn}
   |element_node:{chapter}
   |index_entry:I{fn,37}
   |original_def_cmdname:{deffnx}
    *line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C3
       {normal_text:Escape}
       *normal_command@tie C1 l58
        *brace_container
       {normal_text:sequence}
     {spaces: }
     *def_name C1
      *def_line_arg C3
       *normal_command@t C1 l58
        *brace_container C1
         {normal_text:\\f[}
       *normal_command@r C1 l58
        *brace_container C1
         *normal_command@slanted C1 l58
          *brace_container C1
           {normal_text:font}
       *normal_command@t C1 l58
        *brace_container C1
         {normal_text:]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l58
        *brace_container C1
         {normal_text:\\f[}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l58
        *brace_container C1
         *normal_command@slanted C1 l58
          *brace_container C1
           {normal_text:font}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l58
        *brace_container C1
         {normal_text:]}
     {spaces_after_argument:\\n}
   *normal_command@deffnx C1 l59
   |def_command:{deffn}
   |element_node:{chapter}
   |index_entry:I{fn,38}
   |original_def_cmdname:{deffnx}
    *line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Register}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       *normal_command@t C1 l59
        *brace_container C1
         {normal_text:\\n[.sty]}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C13
     {normal_text:The }
     *normal_command@code C1 l60
      *brace_container C1
       {normal_text:ft}
     {normal_text: request and the }
     *normal_command@code C1 l60
      *brace_container C1
       {normal_text:\\f}
     {normal_text: escape change the current font\\n}
     {normal_text:to }
     *normal_command@var C1 l61
      *brace_container C1
       {normal_text:font}
     {normal_text: (one-character name}
     *normal_command@tie C1 l61
      *brace_container
     *normal_command@var C1 l61
      *brace_container C1
       {normal_text:f}
     {normal_text:, two-character name\\n}
     *normal_command@var C1 l62
      *brace_container C1
       {normal_text:fn}
     {normal_text:).\\n}
   *normal_command@end C1 l63
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defspec C4 l65
   *def_line C1 l65
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,39}
   |original_def_cmdname:{defspec}
    *block_line_arg C59
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:[}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         {normal_text:[}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@slanted C1 l65
        *brace_container C1
         {normal_text:[}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l65
        *brace_container C1
         {normal_text:[}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l65
        *brace_container C1
         {normal_text:[}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@slanted C1 l65
          *brace_container C1
           {normal_text:[}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@code C1 l65
          *brace_container C1
           {normal_text:[}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@code C1 l65
          *brace_container C1
           *normal_command@slanted C1 l65
            *brace_container C1
             {normal_text:[}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@t C1 l65
          *brace_container C1
           {normal_text:[}
     {spaces: }
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         {normal_text:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@slanted C1 l65
        *brace_container C1
         {normal_text:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l65
        *brace_container C1
         {normal_text:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l65
        *brace_container C1
         {normal_text:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@slanted C1 l65
          *brace_container C1
           {normal_text:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@code C1 l65
          *brace_container C1
           {normal_text:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@code C1 l65
          *brace_container C1
           *normal_command@slanted C1 l65
            *brace_container C1
             {normal_text:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@t C1 l65
          *brace_container C1
           {normal_text:,}
     {spaces: }
     {delimiter:]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         {normal_text:]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@slanted C1 l65
        *brace_container C1
         {normal_text:]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l65
        *brace_container C1
         {normal_text:]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l65
        *brace_container C1
         {normal_text:]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@slanted C1 l65
          *brace_container C1
           {normal_text:]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@code C1 l65
          *brace_container C1
           {normal_text:]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@code C1 l65
          *brace_container C1
           *normal_command@slanted C1 l65
            *brace_container C1
             {normal_text:]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l65
        *brace_container C1
         *normal_command@t C1 l65
          *brace_container C1
           {normal_text:]}
     {spaces_after_argument:\\n}
   *normal_command@defspecx C1 l66
   |def_command:{defspec}
   |element_node:{chapter}
   |index_entry:I{fn,40}
   |original_def_cmdname:{defspecx}
    *line_arg C22
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Special Form}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces: }
     {delimiter:[}
     {delimiter:]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l66
        *brace_container C1
         {normal_text:[]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@slanted C1 l66
        *brace_container C1
         {normal_text:[]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l66
        *brace_container C1
         {normal_text:[]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l66
        *brace_container C1
         {normal_text:[]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l66
        *brace_container C1
         *normal_command@slanted C1 l66
          *brace_container C1
           {normal_text:[]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l66
        *brace_container C1
         *normal_command@code C1 l66
          *brace_container C1
           {normal_text:[]}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l66
        *brace_container C1
         *normal_command@code C1 l66
          *brace_container C1
           *normal_command@slanted C1 l66
            *brace_container C1
             {normal_text:[]}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:test formatting of separators\\n}
   *normal_command@end C1 l68
   |text_arg:{defspec}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defspec}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefn C3 l70
   *def_line C1 l70
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,41}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C18
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l70
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l70
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l70
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C6
     *normal_command@dots C1 l71
      *brace_container
     {normal_text: with var for }
     *normal_command@var C1 l71
      *brace_container C1
       {normal_text:f---oo}
     {normal_text: and }
     *normal_command@var C1 l71
      *brace_container C1
       {normal_text:b--ar}
     {normal_text:\\n}
   *normal_command@end C1 l72
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefn C3 l74
   *def_line C1 l74
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,42}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C18
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l74
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l74
        *brace_container C1
         *normal_command@slanted C1 l74
          *brace_container C1
           {normal_text:f---oo}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l74
        *brace_container C1
         *normal_command@slanted C1 l74
          *brace_container C1
           {normal_text:b--ar}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C6
     *normal_command@dots C1 l75
      *brace_container
     {normal_text: with r slanted for }
     *normal_command@var C1 l75
      *brace_container C1
       {normal_text:f---oo}
     {normal_text: and }
     *normal_command@var C1 l75
      *brace_container C1
       {normal_text:b--ar}
     {normal_text:\\n}
   *normal_command@end C1 l76
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@noindent l78
  {ignorable_spaces_after_command: }
  *paragraph C1
  |noindent:{1}
   {normal_text:produces:\\n}
  *normal_command@defcv C3 l79
   *def_line C1 l79
   |def_command:{defcv}
   |element_node:{chapter}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defcv}
    *block_line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l79
       {normal_text:Class Option}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:Window}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:border-pattern}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C2
     *normal_command@dots C1 l80
      *brace_container
     {normal_text:\\n}
   *normal_command@end C1 l81
   |text_arg:{defcv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defcv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypecv C3 l83
   *def_line C1 l83
   |def_command:{deftypecv}
   |element_node:{chapter}
   |index_entry:I{vr,2}
   |original_def_cmdname:{deftypecv}
    *block_line_arg C9
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l83
       {normal_text:Class Option}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {normal_text:Window}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       *normal_command@code C1 l83
        *brace_container C1
         {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:border-pattern}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C2
     *normal_command@dots C1 l84
      *brace_container
     {normal_text:\\n}
   *normal_command@end C1 l85
   |text_arg:{deftypecv}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypecv}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@quotation C3 l87
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@deftypefn C3 l88
    *def_line C1 l88
    |def_command:{deftypefn}
    |element_node:{chapter}
    |index_entry:I{fn,43}
    |original_def_cmdname:{deftypefn}
     *block_line_arg C18
      {spaces_before_argument: }
      *def_category C1
       *bracketed_arg C1 l88
        {normal_text:Library Function}
      {spaces: }
      *def_type C1
       *def_line_arg C1
        {normal_text:int}
      {spaces: }
      *def_name C1
       *def_line_arg C1
        {normal_text:foobar}
      {spaces:  }
      {delimiter:(}
      *def_typearg C1
       *def_line_arg C1
        {normal_text:int}
      {spaces: }
      *def_arg C1
       *def_line_arg C1
        *normal_command@var C1 l88
         *brace_container C1
          {normal_text:foo}
      {delimiter:,}
      {spaces: }
      *def_typearg C1
       *def_line_arg C1
        {normal_text:float}
      {spaces: }
      *def_arg C1
       *def_line_arg C1
        *normal_command@var C1 l88
         *brace_container C1
          {normal_text:bar}
      {delimiter:)}
      {spaces_after_argument:\\n}
    *def_item C1
     *paragraph C6
      *normal_command@dots C1 l89
       *brace_container
      {normal_text: for }
      *normal_command@var C1 l89
       *brace_container C1
        {normal_text:foo}
      {normal_text: and }
      *normal_command@var C1 l89
       *brace_container C1
        {normal_text:bar}
      {normal_text:\\n}
    *normal_command@end C1 l90
    |text_arg:{deftypefn}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:deftypefn}
      {spaces_after_argument:\\n}
   *normal_command@end C1 l91
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:quotation}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defun C3 l93
   *def_line C1 l93
   |def_command:{defun}
   |element_node:{chapter}
   |index_entry:I{fn,44}
   |original_def_cmdname:{defun}
    *block_line_arg C11
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:apply}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:function}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:&rest}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:arguments}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C6
     *normal_command@code C1 l94
      *brace_container C1
       {normal_text:apply}
     {normal_text: calls no var }
     *normal_command@var C1 l94
      *brace_container C1
       {normal_text:function}
     {normal_text: with }
     *normal_command@var C1 l94
      *brace_container C1
       {normal_text:arguments}
     {normal_text:\\n}
   *normal_command@end C1 l95
   |text_arg:{defun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defun C3 l97
   *def_line C1 l97
   |def_command:{defun}
   |element_node:{chapter}
   |index_entry:I{fn,45}
   |original_def_cmdname:{defun}
    *block_line_arg C11
     (i){spaces_before_argument: }
     *def_category C1
     |inserted:{1}
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:apply}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:function}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l97
        *brace_container C1
         *normal_command@b C1 l97
          *brace_container C1
           {normal_text:&rest}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:argument}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C5
     {normal_text:explicit keyword marking, no var }
     *normal_command@var C1 l98
      *brace_container C1
       {normal_text:function}
     {normal_text: with }
     *normal_command@var C1 l98
      *brace_container C1
       {normal_text:arguments}
     {normal_text:\\n}
   *normal_command@end C1 l99
   |text_arg:{defun}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defun}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deffn C3 l101
   *def_line C1 l101
   |def_command:{deffn}
   |element_node:{chapter}
   |index_entry:I{fn,46}
   |original_def_cmdname:{deffn}
    *block_line_arg C33
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Category}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:name}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:argument}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l101
        *brace_container C1
         {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l101
        *brace_container C1
         {normal_text:a--b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l101
        *brace_container C1
         {normal_text:v--ar1}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:word}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l101
        *brace_container C1
         {normal_text:--}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l101
        *brace_container C1
         {normal_text:type o--ther}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l101
        *brace_container C1
         {normal_text:v---ar2}
     {spaces:  }
     >SOURCEMARKS
     >defline_continuation<1><p:1>
     {delimiter:[}
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l102
        *brace_container C1
         {normal_text:float}
     {spaces: }
     {delimiter:[}
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l102
        *brace_container C1
         {normal_text:var4}
     {delimiter:]}
     {delimiter:]}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:In deffn with code and var used\\n}
   *normal_command@end C1 l104
   |text_arg:{deffn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deffn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefn C17 l106
   *def_line C1 l106
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,47}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l106
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l106
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l106
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:default}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l107
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,48}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l107
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l107
        *brace_container C1
         {normal_text:f---oo}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l107
        *brace_container C1
         {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l107
        *brace_container C1
         {normal_text:b--ar}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l107
        *brace_container C1
         {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:r}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l108
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,49}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l108
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l108
        *brace_container C1
         {normal_text:f---oo}
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l108
        *brace_container C1
         {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l108
        *brace_container C1
         {normal_text:b--ar}
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l108
        *brace_container C1
         {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l109
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,50}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l109
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l109
        *brace_container C1
         {normal_text:f---oo}
     *def_arg C1
      *def_line_arg C1
       *normal_command@slanted C1 l109
        *brace_container C1
         {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l109
        *brace_container C1
         {normal_text:b--ar}
     *def_arg C1
      *def_line_arg C1
       *normal_command@slanted C1 l109
        *brace_container C1
         {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:slanted}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l110
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,51}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l110
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l110
        *brace_container C1
         {normal_text:f---oo}
     *def_typearg C1
      *def_line_arg C1
       *normal_command@code C1 l110
        *brace_container C1
         {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l110
        *brace_container C1
         {normal_text:b--ar}
     *def_typearg C1
      *def_line_arg C1
       *normal_command@code C1 l110
        *brace_container C1
         {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:code}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l111
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,52}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l111
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l111
        *brace_container C1
         {normal_text:f---oo}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l111
        *brace_container C1
         {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l111
        *brace_container C1
         {normal_text:b--ar}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l111
        *brace_container C1
         {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:t}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l112
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,53}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l112
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l112
        *brace_container C1
         {normal_text:f---oo}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l112
        *brace_container C1
         *normal_command@b C1 l112
          *brace_container C1
           {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l112
        *brace_container C1
         {normal_text:b--ar}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l112
        *brace_container C1
         *normal_command@b C1 l112
          *brace_container C1
           {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:t:b}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l113
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,54}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l113
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l113
        *brace_container C1
         {normal_text:f---oo}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l113
        *brace_container C1
         *normal_command@var C1 l113
          *brace_container C1
           {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l113
        *brace_container C1
         {normal_text:b--ar}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l113
        *brace_container C1
         *normal_command@var C1 l113
          *brace_container C1
           {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:r:var}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l114
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,55}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l114
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l114
        *brace_container C1
         {normal_text:f---oo}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l114
        *brace_container C1
         *normal_command@slanted C1 l114
          *brace_container C1
           {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l114
        *brace_container C1
         {normal_text:b--ar}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l114
        *brace_container C1
         *normal_command@slanted C1 l114
          *brace_container C1
           {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:r:slanted}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l115
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,56}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l115
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l115
        *brace_container C1
         {normal_text:f---oo}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l115
        *brace_container C1
         *normal_command@code C1 l115
          *brace_container C1
           {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l115
        *brace_container C1
         {normal_text:b--ar}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l115
        *brace_container C1
         *normal_command@code C1 l115
          *brace_container C1
           {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:r:code}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l116
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,57}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l116
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l116
        *brace_container C1
         {normal_text:f---oo}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l116
        *brace_container C1
         *normal_command@t C1 l116
          *brace_container C1
           {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l116
        *brace_container C1
         {normal_text:b--ar}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l116
        *brace_container C1
         *normal_command@t C1 l116
          *brace_container C1
           {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:r:t}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l117
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,58}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l117
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l117
        *brace_container C1
         {normal_text:f---oo}
     *def_typearg C1
      *def_line_arg C1
       *normal_command@code C1 l117
        *brace_container C1
         *normal_command@var C1 l117
          *brace_container C1
           {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l117
        *brace_container C1
         {normal_text:b--ar}
     *def_typearg C1
      *def_line_arg C1
       *normal_command@code C1 l117
        *brace_container C1
         *normal_command@var C1 l117
          *brace_container C1
           {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:code:var}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l118
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,59}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l118
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l118
        *brace_container C1
         {normal_text:f---oo}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l118
        *brace_container C1
         *normal_command@var C1 l118
          *brace_container C1
           {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l118
        *brace_container C1
         {normal_text:b--ar}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l118
        *brace_container C1
         *normal_command@var C1 l118
          *brace_container C1
           {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:t:var}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l119
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,60}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l119
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l119
        *brace_container C1
         {normal_text:f---oo}
     *def_typearg C1
      *def_line_arg C1
       *normal_command@code C1 l119
        *brace_container C1
         *normal_command@slanted C1 l119
          *brace_container C1
           {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l119
        *brace_container C1
         {normal_text:b--ar}
     *def_typearg C1
      *def_line_arg C1
       *normal_command@code C1 l119
        *brace_container C1
         *normal_command@slanted C1 l119
          *brace_container C1
           {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:code:slanted}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l120
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,61}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l120
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l120
        *brace_container C1
         {normal_text:f---oo}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l120
        *brace_container C1
         *normal_command@slanted C1 l120
          *brace_container C1
           {normal_text:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l120
        *brace_container C1
         {normal_text:b--ar}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l120
        *brace_container C1
         *normal_command@slanted C1 l120
          *brace_container C1
           {normal_text:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:t:slanted}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:separators\\n}
   *normal_command@end C1 l122
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@deftypefn C17 l124
   *def_line C1 l124
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,62}
   |original_def_cmdname:{deftypefn}
    *block_line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l124
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l124
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l124
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:default}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l125
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,63}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l125
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l125
        *brace_container C1
         {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l125
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l125
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:r}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l126
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,64}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l126
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l126
        *brace_container C1
         {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l126
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l126
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:var}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l127
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,65}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l127
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@slanted C1 l127
        *brace_container C1
         {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l127
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l127
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:slanted}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l128
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,66}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l128
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       *normal_command@code C1 l128
        *brace_container C1
         {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l128
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l128
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:code}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l129
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,67}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l129
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l129
        *brace_container C1
         {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l129
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l129
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:t}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l130
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,68}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l130
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l130
        *brace_container C1
         *normal_command@b C1 l130
          *brace_container C1
           {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l130
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l130
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:t:b}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l131
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,69}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l131
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l131
        *brace_container C1
         *normal_command@var C1 l131
          *brace_container C1
           {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l131
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l131
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:r:var}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l132
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,70}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l132
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l132
        *brace_container C1
         *normal_command@slanted C1 l132
          *brace_container C1
           {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l132
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l132
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:r:slanted}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l133
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,71}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l133
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l133
        *brace_container C1
         *normal_command@code C1 l133
          *brace_container C1
           {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l133
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l133
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:r:code}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l134
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,72}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l134
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@r C1 l134
        *brace_container C1
         *normal_command@t C1 l134
          *brace_container C1
           {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l134
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l134
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:r:t}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l135
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,73}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l135
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       *normal_command@code C1 l135
        *brace_container C1
         *normal_command@var C1 l135
          *brace_container C1
           {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l135
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l135
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:code:var}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l136
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,74}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l136
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l136
        *brace_container C1
         *normal_command@var C1 l136
          *brace_container C1
           {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l136
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l136
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:t:var}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l137
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,75}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l137
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_typearg C1
      *def_line_arg C1
       *normal_command@code C1 l137
        *brace_container C1
         *normal_command@slanted C1 l137
          *brace_container C1
           {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l137
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l137
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:code:slanted}
     {spaces_after_argument:\\n}
   *normal_command@deftypefnx C1 l138
   |def_command:{deftypefn}
   |element_node:{chapter}
   |index_entry:I{fn,76}
   |original_def_cmdname:{deftypefnx}
    *line_arg C22
     {spaces_before_argument: }
     *def_category C1
      *bracketed_arg C1 l138
       {normal_text:Library Function}
     {spaces: }
     *def_type C1
      *def_line_arg C1
       {normal_text:int}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foobar}
     {spaces:  }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       *normal_command@t C1 l138
        *brace_container C1
         *normal_command@slanted C1 l138
          *brace_container C1
           {normal_text:i--nt}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l138
        *brace_container C1
         {normal_text:f---oo}
     {delimiter:[}
     {delimiter:,}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:float}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       *normal_command@var C1 l138
        *brace_container C1
         {normal_text:b--ar}
     {delimiter:]}
     {delimiter:)}
     {spaces: }
     *def_typearg C1
      *def_line_arg C1
       {normal_text:t:slanted}
     {spaces_after_argument:\\n}
   *def_item C1
    *paragraph C1
     {normal_text:name\\n}
   *normal_command@end C1 l140
   |text_arg:{deftypefn}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:deftypefn}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'definition_commands'} = '@node Top
@top top section

@node chapter
@chapter chapter

@deffn Func fname a---rg1 a--rg2
deffn no var for @var{a---rg1} and @var{a--rg2}
@end deffn

@deffn Func fname @var{a---rg1} @var{a--rg2}
deffn explict var for @var{a---rg1} and @var{a--rg2}
@end deffn

@deffn Func fname @r{@slanted{a---rg1}} @r{@slanted{a--rg2}}
deffn r slanted for @var{a---rg1} and @var{a--rg2}
@end deffn

@defspec foobar (var [from to [inc]]) default
@defspecx foobar (var @r{[}from to @r{[}inc@r{]]}) r
@defspecx foobar (var @var{[}from to @var{[}inc@var{]]}) var
@defspecx foobar (var @slanted{[}from to @slanted{[}inc@slanted{]]}) slanted
@defspecx foobar (var @code{[}from to @code{[}inc@code{]]}) code
@defspecx foobar (var @t{[}from to @t{[}inc@t{]]}) t
@defspecx foobar (var @t{@b{[}}from to @t{@b{[}}inc@t{@b{]]}}) t:b
@defspecx foobar (var @r{@var{[}}from to @r{@var{[}}inc@r{@var{]]}}) r:var
@defspecx foobar (var @r{@slanted{[}}from to @r{@slanted{[}}inc@r{@slanted{]]}}) r:slanted
@defspecx foobar (var @r{@code{[}}from to @r{@code{[}}inc@r{@code{]]}}) r:code
@defspecx foobar (var @r{@t{[}}from to @r{@t{[}}inc@r{@t{]]}}) r:t
@defspecx foobar (var @code{@var{[}}from to @code{@var{[}}inc@code{@var{]]}}) code:var
@defspecx foobar (var @t{@var{[}}from to @t{@var{[}}inc@t{@var{]]}}) t:var
@defspecx foobar (var @code{@slanted{[}}from to @code{@slanted{[}}inc@code{@slanted{]]}}) code:slanted
@defspecx foobar (var @t{@slanted{[}}from to @t{@slanted{[}}inc@t{@slanted{]]}}) t:slanted
separators
@end defspec

@defspec foobar va---riable default
@defspecx foobar @var{va---riable} var
@defspecx foobar @r{va---riable} r
@defspecx foobar @slanted{va---riable} slanted
@defspecx foobar @code{va---riable} code
@defspecx foobar @t{va---riable} t
@defspecx foobar @t{@b{va---riable}} t:b
@defspecx foobar @r{@var{va---riable}} r:var
@defspecx foobar @r{@slanted{va---riable}} r:slanted
@defspecx foobar @r{@code{va---riable}} r:code
@defspecx foobar @r{@t{va---riable}} r:t
@defspecx foobar @code{@var{va---riable}} code:var
@defspecx foobar @t{@var{va---riable}} t:var
@defspecx foobar @code{@slanted{va---riable}} code:slanted
@defspecx foobar @t{@slanted{va---riable}} t:slanted
name
@end defspec

@deffn Request @t{.ft} [@r{@slanted{font}}]
@deffnx Escape@tie{}sequence @t{\\f}@r{@slanted{f}}@t{}
@deffnx Escape@tie{}sequence @t{\\f(}@r{@slanted{fn}}@t{}
@deffnx Escape@tie{}sequence @t{\\f[}@r{@slanted{font}}@t{]} @t{\\f[}@r{@slanted{font}}@t{]}
@deffnx Register @t{\\n[.sty]}
The @code{ft} request and the @code{\\f} escape change the current font
to @var{font} (one-character name@tie{}@var{f}, two-character name
@var{fn}).
@end deffn

@defspec foobar [ @r{[} @slanted{[} @code{[} @t{[} @r{@slanted{[}} @r{@code{[}} @r{@code{@slanted{[}}} @r{@t{[}} , @r{,} @slanted{,} @code{,} @t{,} @r{@slanted{,}} @r{@code{,}} @r{@code{@slanted{,}}} @r{@t{,}} ] @r{]} @slanted{]} @code{]} @t{]} @r{@slanted{]}} @r{@code{]}} @r{@code{@slanted{]}}} @r{@t{]}}
@defspecx foobar [] @r{[]} @slanted{[]} @code{[]} @t{[]} @r{@slanted{[]}} @r{@code{[]}} @r{@code{@slanted{[]}}}
test formatting of separators
@end defspec

@deftypefn {Library Function} int foobar  (int @var{f---oo}, float @var{b--ar})
@dots{} with var for @var{f---oo} and @var{b--ar}
@end deftypefn

@deftypefn {Library Function} int foobar  (int @r{@slanted{f---oo}}, float @r{@slanted{b--ar}})
@dots{} with r slanted for @var{f---oo} and @var{b--ar}
@end deftypefn

@noindent produces:
@defcv {Class Option} Window border-pattern
@dots{}
@end defcv

@deftypecv {Class Option} Window @code{int} border-pattern
@dots{}
@end deftypecv

@quotation
@deftypefn {Library Function} int foobar  (int @var{foo}, float @var{bar})
@dots{} for @var{foo} and @var{bar}
@end deftypefn
@end quotation

@defun apply function &rest arguments
@code{apply} calls no var @var{function} with @var{arguments}
@end defun

@defun apply function @r{@b{&rest}} argument
explicit keyword marking, no var @var{function} with @var{arguments}
@end defun

@deffn Category name argument @code{int} @code{a--b} @var{v--ar1}, word @code{--} (@code{type o--ther}, @var{v---ar2}  [@code{float} [@var{var4}]])
In deffn with code and var used
@end deffn

@deftypefn {Library Function} int foobar  (int @var{f---oo}[, float @var{b--ar}]) default
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@r{[}, float @var{b--ar}@r{]}) r
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@var{[}, float @var{b--ar}@var{]}) var
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@slanted{[}, float @var{b--ar}@slanted{]}) slanted
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@code{[}, float @var{b--ar}@code{]}) code
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@t{[}, float @var{b--ar}@t{]}) t
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@t{@b{[}}, float @var{b--ar}@t{@b{]}}) t:b
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@r{@var{[}}, float @var{b--ar}@r{@var{]}}) r:var
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@r{@slanted{[}}, float @var{b--ar}@r{@slanted{]}}) r:slanted
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@r{@code{[}}, float @var{b--ar}@r{@code{]}}) r:code
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@r{@t{[}}, float @var{b--ar}@r{@t{]}}) r:t
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@code{@var{[}}, float @var{b--ar}@code{@var{]}}) code:var
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@t{@var{[}}, float @var{b--ar}@t{@var{]}}) t:var
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@code{@slanted{[}}, float @var{b--ar}@code{@slanted{]}}) code:slanted
@deftypefnx {Library Function} int foobar  (int @var{f---oo}@t{@slanted{[}}, float @var{b--ar}@t{@slanted{]}}) t:slanted
separators
@end deftypefn

@deftypefn {Library Function} int foobar  (i--nt @var{f---oo}[, float @var{b--ar}]) default
@deftypefnx {Library Function} int foobar  (@r{i--nt} @var{f---oo}[, float @var{b--ar}]) r
@deftypefnx {Library Function} int foobar  (@var{i--nt} @var{f---oo}[, float @var{b--ar}]) var
@deftypefnx {Library Function} int foobar  (@slanted{i--nt} @var{f---oo}[, float @var{b--ar}]) slanted
@deftypefnx {Library Function} int foobar  (@code{i--nt} @var{f---oo}[, float @var{b--ar}]) code
@deftypefnx {Library Function} int foobar  (@t{i--nt} @var{f---oo}[, float @var{b--ar}]) t
@deftypefnx {Library Function} int foobar  (@t{@b{i--nt}} @var{f---oo}[, float @var{b--ar}]) t:b
@deftypefnx {Library Function} int foobar  (@r{@var{i--nt}} @var{f---oo}[, float @var{b--ar}]) r:var
@deftypefnx {Library Function} int foobar  (@r{@slanted{i--nt}} @var{f---oo}[, float @var{b--ar}]) r:slanted
@deftypefnx {Library Function} int foobar  (@r{@code{i--nt}} @var{f---oo}[, float @var{b--ar}]) r:code
@deftypefnx {Library Function} int foobar  (@r{@t{i--nt}} @var{f---oo}[, float @var{b--ar}]) r:t
@deftypefnx {Library Function} int foobar  (@code{@var{i--nt}} @var{f---oo}[, float @var{b--ar}]) code:var
@deftypefnx {Library Function} int foobar  (@t{@var{i--nt}} @var{f---oo}[, float @var{b--ar}]) t:var
@deftypefnx {Library Function} int foobar  (@code{@slanted{i--nt}} @var{f---oo}[, float @var{b--ar}]) code:slanted
@deftypefnx {Library Function} int foobar  (@t{@slanted{i--nt}} @var{f---oo}[, float @var{b--ar}]) t:slanted
name
@end deftypefn

';


$result_texts{'definition_commands'} = 'top section
***********

1 chapter
*********

Func: fname a---rg1 a--rg2
deffn no var for a--rg1 and a-rg2

Func: fname a---rg1 a--rg2
deffn explict var for a--rg1 and a-rg2

Func: fname a---rg1 a--rg2
deffn r slanted for a--rg1 and a-rg2

Special Form: foobar (var [from to [inc]]) default
Special Form: foobar (var [from to [inc]]) r
Special Form: foobar (var [from to [inc]]) var
Special Form: foobar (var [from to [inc]]) slanted
Special Form: foobar (var [from to [inc]]) code
Special Form: foobar (var [from to [inc]]) t
Special Form: foobar (var [from to [inc]]) t:b
Special Form: foobar (var [from to [inc]]) r:var
Special Form: foobar (var [from to [inc]]) r:slanted
Special Form: foobar (var [from to [inc]]) r:code
Special Form: foobar (var [from to [inc]]) r:t
Special Form: foobar (var [from to [inc]]) code:var
Special Form: foobar (var [from to [inc]]) t:var
Special Form: foobar (var [from to [inc]]) code:slanted
Special Form: foobar (var [from to [inc]]) t:slanted
separators

Special Form: foobar va---riable default
Special Form: foobar va---riable var
Special Form: foobar va---riable r
Special Form: foobar va---riable slanted
Special Form: foobar va---riable code
Special Form: foobar va---riable t
Special Form: foobar va---riable t:b
Special Form: foobar va---riable r:var
Special Form: foobar va---riable r:slanted
Special Form: foobar va---riable r:code
Special Form: foobar va---riable r:t
Special Form: foobar va---riable code:var
Special Form: foobar va---riable t:var
Special Form: foobar va---riable code:slanted
Special Form: foobar va---riable t:slanted
name

Request: .ft [font]
Escape sequence: \\ff
Escape sequence: \\f(fn
Escape sequence: \\f[font] \\f[font]
Register: \\n[.sty]
The ft request and the \\f escape change the current font
to font (one-character name f, two-character name
fn).

Special Form: foobar [ [ [ [ [ [ [ [ [ , , , , , , , , , ] ] ] ] ] ] ] ] ]
Special Form: foobar [] [] [] [] [] [] [] []
test formatting of separators

Library Function: int foobar (int f---oo, float b--ar)
... with var for f--oo and b-ar

Library Function: int foobar (int f---oo, float b--ar)
... with r slanted for f--oo and b-ar

produces:
Class Option of Window: border-pattern
...

Class Option of Window: int border-pattern
...

Library Function: int foobar (int foo, float bar)
... for foo and bar

Function: apply function &rest arguments
apply calls no var function with arguments

Function: apply function &rest argument
explicit keyword marking, no var function with arguments

Category: name argument int a--b v--ar1, word -- (type o--ther, v---ar2  [float [var4]])
In deffn with code and var used

Library Function: int foobar (int f---oo[, float b--ar]) default
Library Function: int foobar (int f---oo[, float b--ar]) r
Library Function: int foobar (int f---oo[, float b--ar]) var
Library Function: int foobar (int f---oo[, float b--ar]) slanted
Library Function: int foobar (int f---oo[, float b--ar]) code
Library Function: int foobar (int f---oo[, float b--ar]) t
Library Function: int foobar (int f---oo[, float b--ar]) t:b
Library Function: int foobar (int f---oo[, float b--ar]) r:var
Library Function: int foobar (int f---oo[, float b--ar]) r:slanted
Library Function: int foobar (int f---oo[, float b--ar]) r:code
Library Function: int foobar (int f---oo[, float b--ar]) r:t
Library Function: int foobar (int f---oo[, float b--ar]) code:var
Library Function: int foobar (int f---oo[, float b--ar]) t:var
Library Function: int foobar (int f---oo[, float b--ar]) code:slanted
Library Function: int foobar (int f---oo[, float b--ar]) t:slanted
separators

Library Function: int foobar (i--nt f---oo[, float b--ar]) default
Library Function: int foobar (i--nt f---oo[, float b--ar]) r
Library Function: int foobar (i--nt f---oo[, float b--ar]) var
Library Function: int foobar (i--nt f---oo[, float b--ar]) slanted
Library Function: int foobar (i--nt f---oo[, float b--ar]) code
Library Function: int foobar (i--nt f---oo[, float b--ar]) t
Library Function: int foobar (i--nt f---oo[, float b--ar]) t:b
Library Function: int foobar (i--nt f---oo[, float b--ar]) r:var
Library Function: int foobar (i--nt f---oo[, float b--ar]) r:slanted
Library Function: int foobar (i--nt f---oo[, float b--ar]) r:code
Library Function: int foobar (i--nt f---oo[, float b--ar]) r:t
Library Function: int foobar (i--nt f---oo[, float b--ar]) code:var
Library Function: int foobar (i--nt f---oo[, float b--ar]) t:var
Library Function: int foobar (i--nt f---oo[, float b--ar]) code:slanted
Library Function: int foobar (i--nt f---oo[, float b--ar]) t:slanted
name

';

$result_errors{'definition_commands'} = '';

$result_nodes_list{'definition_commands'} = '1|Top
 associated_section: top section
 associated_title_command: top section
 node_directions:
  next->chapter
2|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'definition_commands'} = '1|top section
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->chapter
 section_children:
  1|chapter
2|chapter
 associated_anchor_command: chapter
 associated_node: chapter
 section_directions:
  up->top section
 toplevel_directions:
  prev->top section
  up->top section
';

$result_sectioning_root{'definition_commands'} = 'level: -1
list:
 1|top section
';

$result_headings_list{'definition_commands'} = '';

$result_indices_sort_strings{'definition_commands'} = 'fn:
 .ft
 \\f(fn
 \\f[font]
 \\ff
 \\n[.sty]
 apply
 apply
 fname
 fname
 fname
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 name
vr:
 border-pattern of Window
 border-pattern of Window
';


$result_converted{'plaintext'}->{'definition_commands'} = 'top section
***********

1 chapter
*********

 -- Func: fname a---rg1 a--rg2
     deffn no var for A--RG1 and A-RG2

 -- Func: fname A---RG1 A--RG2
     deffn explict var for A--RG1 and A-RG2

 -- Func: fname a--rg1 a-rg2
     deffn r slanted for A--RG1 and A-RG2

 -- Special Form: foobar (var [from to [inc]]) default
 -- Special Form: foobar (var [from to [inc]]) r
 -- Special Form: foobar (var [from to [inc]]) var
 -- Special Form: foobar (var [from to [inc]]) slanted
 -- Special Form: foobar (var [from to [inc]]) code
 -- Special Form: foobar (var [from to [inc]]) t
 -- Special Form: foobar (var [from to [inc]]) t:b
 -- Special Form: foobar (var [from to [inc]]) r:var
 -- Special Form: foobar (var [from to [inc]]) r:slanted
 -- Special Form: foobar (var [from to [inc]]) r:code
 -- Special Form: foobar (var [from to [inc]]) r:t
 -- Special Form: foobar (var [from to [inc]]) code:var
 -- Special Form: foobar (var [from to [inc]]) t:var
 -- Special Form: foobar (var [from to [inc]]) code:slanted
 -- Special Form: foobar (var [from to [inc]]) t:slanted
     separators

 -- Special Form: foobar va---riable default
 -- Special Form: foobar VA---RIABLE var
 -- Special Form: foobar va--riable r
 -- Special Form: foobar va---riable slanted
 -- Special Form: foobar va---riable code
 -- Special Form: foobar va---riable t
 -- Special Form: foobar va---riable t:b
 -- Special Form: foobar VA--RIABLE r:var
 -- Special Form: foobar va--riable r:slanted
 -- Special Form: foobar va---riable r:code
 -- Special Form: foobar va---riable r:t
 -- Special Form: foobar VA---RIABLE code:var
 -- Special Form: foobar VA---RIABLE t:var
 -- Special Form: foobar va---riable code:slanted
 -- Special Form: foobar va---riable t:slanted
     name

 -- Request: .ft [font]
 -- Escape sequence: \\ff
 -- Escape sequence: \\f(fn
 -- Escape sequence: \\f[font] \\f[font]
 -- Register: \\n[.sty]
     The ‘ft’ request and the ‘\\f’ escape change the current font to
     FONT (one-character name F, two-character name FN).

 -- Special Form: foobar [ [ [ [ [ [ [ [ [ , , , , , , , , , ] ] ] ] ] ]
          ] ] ]
 -- Special Form: foobar [] [] [] [] [] [] [] []
     test formatting of separators

 -- Library Function: int foobar (int F---OO, float B--AR)
     ... with var for F--OO and B-AR

 -- Library Function: int foobar (int f--oo, float b-ar)
     ... with r slanted for F--OO and B-AR

produces:
 -- Class Option of Window: border-pattern
     ...

 -- Class Option of Window: int border-pattern
     ...

      -- Library Function: int foobar (int FOO, float BAR)
          ... for FOO and BAR

 -- Function: apply function &rest arguments
     ‘apply’ calls no var FUNCTION with ARGUMENTS

 -- Function: apply function &rest argument
     explicit keyword marking, no var FUNCTION with ARGUMENTS

 -- Category: name argument int a--b V--AR1, word -- (type o--ther,
          V---AR2 [float [VAR4]])
     In deffn with code and var used

 -- Library Function: int foobar (int F---OO[, float B--AR]) default
 -- Library Function: int foobar (int F---OO[, float B--AR]) r
 -- Library Function: int foobar (int F---OO[, float B--AR]) var
 -- Library Function: int foobar (int F---OO[, float B--AR]) slanted
 -- Library Function: int foobar (int F---OO[, float B--AR]) code
 -- Library Function: int foobar (int F---OO[, float B--AR]) t
 -- Library Function: int foobar (int F---OO[, float B--AR]) t:b
 -- Library Function: int foobar (int F---OO[, float B--AR]) r:var
 -- Library Function: int foobar (int F---OO[, float B--AR]) r:slanted
 -- Library Function: int foobar (int F---OO[, float B--AR]) r:code
 -- Library Function: int foobar (int F---OO[, float B--AR]) r:t
 -- Library Function: int foobar (int F---OO[, float B--AR]) code:var
 -- Library Function: int foobar (int F---OO[, float B--AR]) t:var
 -- Library Function: int foobar (int F---OO[, float B--AR])
          code:slanted
 -- Library Function: int foobar (int F---OO[, float B--AR]) t:slanted
     separators

 -- Library Function: int foobar (i--nt F---OO[, float B--AR]) default
 -- Library Function: int foobar (i-nt F---OO[, float B--AR]) r
 -- Library Function: int foobar (I--NT F---OO[, float B--AR]) var
 -- Library Function: int foobar (i--nt F---OO[, float B--AR]) slanted
 -- Library Function: int foobar (i--nt F---OO[, float B--AR]) code
 -- Library Function: int foobar (i--nt F---OO[, float B--AR]) t
 -- Library Function: int foobar (i--nt F---OO[, float B--AR]) t:b
 -- Library Function: int foobar (I-NT F---OO[, float B--AR]) r:var
 -- Library Function: int foobar (i-nt F---OO[, float B--AR]) r:slanted
 -- Library Function: int foobar (i--nt F---OO[, float B--AR]) r:code
 -- Library Function: int foobar (i--nt F---OO[, float B--AR]) r:t
 -- Library Function: int foobar (I--NT F---OO[, float B--AR]) code:var
 -- Library Function: int foobar (I--NT F---OO[, float B--AR]) t:var
 -- Library Function: int foobar (i--nt F---OO[, float B--AR])
          code:slanted
 -- Library Function: int foobar (i--nt F---OO[, float B--AR]) t:slanted
     name

';

$result_converted_sort_strings{'plaintext'}->{'definition_commands'} = 'fn:
 .ft
 \\f(fn
 \\f[font]
 \\ff
 \\n[.sty]
 apply
 apply
 fname
 fname
 fname
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 name
vr:
 border-pattern of Window
 border-pattern of Window
';


$result_converted{'html_text'}->{'definition_commands'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top-section"><span>top section<a class="copiable-link" href="#top-section"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chapter">chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chapter">
<h2 class="chapter" id="chapter-1"><span>1 chapter<a class="copiable-link" href="#chapter-1"> &para;</a></span></h2>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-fname"><span class="category-def">Func: </span><span><strong class="def-name">fname</strong> <var class="def-var-arguments">a&mdash;rg1 a&ndash;rg2</var><a class="copiable-link" href="#index-fname"> &para;</a></span></dt>
<dd><p>deffn no var for <var class="var">a&mdash;rg1</var> and <var class="var">a&ndash;rg2</var>
</p></dd></dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-fname-1"><span class="category-def">Func: </span><span><strong class="def-name">fname</strong> <var class="def-var-arguments"><var class="var">a&mdash;rg1</var> <var class="var">a&ndash;rg2</var></var><a class="copiable-link" href="#index-fname-1"> &para;</a></span></dt>
<dd><p>deffn explict var for <var class="var">a&mdash;rg1</var> and <var class="var">a&ndash;rg2</var>
</p></dd></dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-fname-2"><span class="category-def">Func: </span><span><strong class="def-name">fname</strong> <var class="def-var-arguments"><span class="r"><i class="slanted">a&mdash;rg1</i></span> <span class="r"><i class="slanted">a&ndash;rg2</i></span></var><a class="copiable-link" href="#index-fname-2"> &para;</a></span></dt>
<dd><p>deffn r slanted for <var class="var">a&mdash;rg1</var> and <var class="var">a&ndash;rg2</var>
</p></dd></dl>

<dl class="first-deffn first-defspec-alias-first-deffn def-block">
<dt class="deffn defspec-alias-deffn def-line" id="index-foobar"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var [from to [inc]]) default</var><a class="copiable-link" href="#index-foobar"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-1"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <span class="r">[</span>from to <span class="r">[</span>inc<span class="r">]]</span>) r</var><a class="copiable-link" href="#index-foobar-1"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-2"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <var class="var">[</var>from to <var class="var">[</var>inc<var class="var">]]</var>) var</var><a class="copiable-link" href="#index-foobar-2"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-3"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <i class="slanted">[</i>from to <i class="slanted">[</i>inc<i class="slanted">]]</i>) slanted</var><a class="copiable-link" href="#index-foobar-3"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-4"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <code class="code">[</code>from to <code class="code">[</code>inc<code class="code">]]</code>) code</var><a class="copiable-link" href="#index-foobar-4"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-5"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <code class="t">[</code>from to <code class="t">[</code>inc<code class="t">]]</code>) t</var><a class="copiable-link" href="#index-foobar-5"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-6"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <code class="t"><b class="b">[</b></code>from to <code class="t"><b class="b">[</b></code>inc<code class="t"><b class="b">]]</b></code>) t:b</var><a class="copiable-link" href="#index-foobar-6"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-7"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <span class="r"><var class="var">[</var></span>from to <span class="r"><var class="var">[</var></span>inc<span class="r"><var class="var">]]</var></span>) r:var</var><a class="copiable-link" href="#index-foobar-7"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-8"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <span class="r"><i class="slanted">[</i></span>from to <span class="r"><i class="slanted">[</i></span>inc<span class="r"><i class="slanted">]]</i></span>) r:slanted</var><a class="copiable-link" href="#index-foobar-8"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-9"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <span class="r"><code class="code">[</code></span>from to <span class="r"><code class="code">[</code></span>inc<span class="r"><code class="code">]]</code></span>) r:code</var><a class="copiable-link" href="#index-foobar-9"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-10"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <span class="r"><code class="t">[</code></span>from to <span class="r"><code class="t">[</code></span>inc<span class="r"><code class="t">]]</code></span>) r:t</var><a class="copiable-link" href="#index-foobar-10"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-11"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <code class="code"><var class="var">[</var></code>from to <code class="code"><var class="var">[</var></code>inc<code class="code"><var class="var">]]</var></code>) code:var</var><a class="copiable-link" href="#index-foobar-11"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-12"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <code class="t"><var class="var">[</var></code>from to <code class="t"><var class="var">[</var></code>inc<code class="t"><var class="var">]]</var></code>) t:var</var><a class="copiable-link" href="#index-foobar-12"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-13"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <code class="code"><i class="slanted">[</i></code>from to <code class="code"><i class="slanted">[</i></code>inc<code class="code"><i class="slanted">]]</i></code>) code:slanted</var><a class="copiable-link" href="#index-foobar-13"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-14"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">(var <code class="t"><i class="slanted">[</i></code>from to <code class="t"><i class="slanted">[</i></code>inc<code class="t"><i class="slanted">]]</i></code>) t:slanted</var><a class="copiable-link" href="#index-foobar-14"> &para;</a></span></dt>
<dd><p>separators
</p></dd></dl>

<dl class="first-deffn first-defspec-alias-first-deffn def-block">
<dt class="deffn defspec-alias-deffn def-line" id="index-foobar-15"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">va&mdash;riable default</var><a class="copiable-link" href="#index-foobar-15"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-16"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><var class="var">va&mdash;riable</var> var</var><a class="copiable-link" href="#index-foobar-16"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-17"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><span class="r">va&mdash;riable</span> r</var><a class="copiable-link" href="#index-foobar-17"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-18"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><i class="slanted">va&mdash;riable</i> slanted</var><a class="copiable-link" href="#index-foobar-18"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-19"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><code class="code">va---riable</code> code</var><a class="copiable-link" href="#index-foobar-19"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-20"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><code class="t">va---riable</code> t</var><a class="copiable-link" href="#index-foobar-20"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-21"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><code class="t"><b class="b">va---riable</b></code> t:b</var><a class="copiable-link" href="#index-foobar-21"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-22"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><span class="r"><var class="var">va&mdash;riable</var></span> r:var</var><a class="copiable-link" href="#index-foobar-22"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-23"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><span class="r"><i class="slanted">va&mdash;riable</i></span> r:slanted</var><a class="copiable-link" href="#index-foobar-23"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-24"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><span class="r"><code class="code">va---riable</code></span> r:code</var><a class="copiable-link" href="#index-foobar-24"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-25"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><span class="r"><code class="t">va---riable</code></span> r:t</var><a class="copiable-link" href="#index-foobar-25"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-26"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><code class="code"><var class="var">va---riable</var></code> code:var</var><a class="copiable-link" href="#index-foobar-26"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-27"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><code class="t"><var class="var">va---riable</var></code> t:var</var><a class="copiable-link" href="#index-foobar-27"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-28"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><code class="code"><i class="slanted">va---riable</i></code> code:slanted</var><a class="copiable-link" href="#index-foobar-28"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-29"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments"><code class="t"><i class="slanted">va---riable</i></code> t:slanted</var><a class="copiable-link" href="#index-foobar-29"> &para;</a></span></dt>
<dd><p>name
</p></dd></dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-_002eft"><span class="category-def">Request: </span><span><strong class="def-name"><code class="t">.ft</code></strong> <var class="def-var-arguments">[<span class="r"><i class="slanted">font</i></span>]</var><a class="copiable-link" href="#index-_002eft"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-_005cff"><span class="category-def">Escape&nbsp;sequence: </span><span><strong class="def-name"><code class="t">\\f</code><span class="r"><i class="slanted">f</i></span></strong><a class="copiable-link" href="#index-_005cff"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-_005cf_0028fn"><span class="category-def">Escape&nbsp;sequence: </span><span><strong class="def-name"><code class="t">\\f(</code><span class="r"><i class="slanted">fn</i></span></strong><a class="copiable-link" href="#index-_005cf_0028fn"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-_005cf_005bfont_005d"><span class="category-def">Escape&nbsp;sequence: </span><span><strong class="def-name"><code class="t">\\f[</code><span class="r"><i class="slanted">font</i></span><code class="t">]</code></strong> <var class="def-var-arguments"><code class="t">\\f[</code><span class="r"><i class="slanted">font</i></span><code class="t">]</code></var><a class="copiable-link" href="#index-_005cf_005bfont_005d"> &para;</a></span></dt>
<dt class="deffnx def-cmd-deffn def-line" id="index-_005cn_005b_002esty_005d"><span class="category-def">Register: </span><span><strong class="def-name"><code class="t">\\n[.sty]</code></strong><a class="copiable-link" href="#index-_005cn_005b_002esty_005d"> &para;</a></span></dt>
<dd><p>The <code class="code">ft</code> request and the <code class="code">\\f</code> escape change the current font
to <var class="var">font</var> (one-character name&nbsp;<var class="var">f</var>, two-character name
<var class="var">fn</var>).
</p></dd></dl>

<dl class="first-deffn first-defspec-alias-first-deffn def-block">
<dt class="deffn defspec-alias-deffn def-line" id="index-foobar-30"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">[ <span class="r">[</span> <i class="slanted">[</i> <code class="code">[</code> <code class="t">[</code> <span class="r"><i class="slanted">[</i></span> <span class="r"><code class="code">[</code></span> <span class="r"><code class="code"><i class="slanted">[</i></code></span> <span class="r"><code class="t">[</code></span> , <span class="r">,</span> <i class="slanted">,</i> <code class="code">,</code> <code class="t">,</code> <span class="r"><i class="slanted">,</i></span> <span class="r"><code class="code">,</code></span> <span class="r"><code class="code"><i class="slanted">,</i></code></span> <span class="r"><code class="t">,</code></span> ] <span class="r">]</span> <i class="slanted">]</i> <code class="code">]</code> <code class="t">]</code> <span class="r"><i class="slanted">]</i></span> <span class="r"><code class="code">]</code></span> <span class="r"><code class="code"><i class="slanted">]</i></code></span> <span class="r"><code class="t">]</code></span></var><a class="copiable-link" href="#index-foobar-30"> &para;</a></span></dt>
<dt class="deffnx defspecx-alias-deffnx def-cmd-deffn def-line" id="index-foobar-31"><span class="category-def">Special Form: </span><span><strong class="def-name">foobar</strong> <var class="def-var-arguments">[] <span class="r">[]</span> <i class="slanted">[]</i> <code class="code">[]</code> <code class="t">[]</code> <span class="r"><i class="slanted">[]</i></span> <span class="r"><code class="code">[]</code></span> <span class="r"><code class="code"><i class="slanted">[]</i></code></span></var><a class="copiable-link" href="#index-foobar-31"> &para;</a></span></dt>
<dd><p>test formatting of separators
</p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-foobar-32"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var>, float <var class="var">b--ar</var>)</code><a class="copiable-link" href="#index-foobar-32"> &para;</a></span></dt>
<dd><p>&hellip; with var for <var class="var">f&mdash;oo</var> and <var class="var">b&ndash;ar</var>
</p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-foobar-33"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <span class="r"><i class="slanted">f&mdash;oo</i></span>, float <span class="r"><i class="slanted">b&ndash;ar</i></span>)</code><a class="copiable-link" href="#index-foobar-33"> &para;</a></span></dt>
<dd><p>&hellip; with r slanted for <var class="var">f&mdash;oo</var> and <var class="var">b&ndash;ar</var>
</p></dd></dl>

<p>produces:
</p><dl class="first-defcv def-block">
<dt class="defcv def-line" id="index-border_002dpattern-of-Window"><span class="category-def">Class Option of <code class="code">Window</code>: </span><span><strong class="def-name">border-pattern</strong><a class="copiable-link" href="#index-border_002dpattern-of-Window"> &para;</a></span></dt>
<dd><p>&hellip;
</p></dd></dl>

<dl class="first-deftypecv def-block">
<dt class="deftypecv def-line" id="index-border_002dpattern-of-Window-1"><span class="category-def">Class Option of <code class="code">Window</code>: </span><span><code class="def-type"><code class="code">int</code></code> <strong class="def-name">border-pattern</strong><a class="copiable-link" href="#index-border_002dpattern-of-Window-1"> &para;</a></span></dt>
<dd><p>&hellip;
</p></dd></dl>

<blockquote class="quotation">
<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-foobar-34"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">foo</var>, float <var class="var">bar</var>)</code><a class="copiable-link" href="#index-foobar-34"> &para;</a></span></dt>
<dd><p>&hellip; for <var class="var">foo</var> and <var class="var">bar</var>
</p></dd></dl>
</blockquote>

<dl class="first-deffn first-defun-alias-first-deffn def-block">
<dt class="deffn defun-alias-deffn def-line" id="index-apply"><span class="category-def">Function: </span><span><strong class="def-name">apply</strong> <var class="def-var-arguments">function &amp;rest arguments</var><a class="copiable-link" href="#index-apply"> &para;</a></span></dt>
<dd><p><code class="code">apply</code> calls no var <var class="var">function</var> with <var class="var">arguments</var>
</p></dd></dl>

<dl class="first-deffn first-defun-alias-first-deffn def-block">
<dt class="deffn defun-alias-deffn def-line" id="index-apply-1"><span class="category-def">Function: </span><span><strong class="def-name">apply</strong> <var class="def-var-arguments">function <span class="r"><b class="b">&amp;rest</b></span> argument</var><a class="copiable-link" href="#index-apply-1"> &para;</a></span></dt>
<dd><p>explicit keyword marking, no var <var class="var">function</var> with <var class="var">arguments</var>
</p></dd></dl>

<dl class="first-deffn def-block">
<dt class="deffn def-line" id="index-name"><span class="category-def">Category: </span><span><strong class="def-name">name</strong> <var class="def-var-arguments">argument <code class="code">int</code> <code class="code">a--b</code> <var class="var">v&ndash;ar1</var>, word <code class="code">--</code> (<code class="code">type o--ther</code>, <var class="var">v&mdash;ar2</var>  [<code class="code">float</code> [<var class="var">var4</var>]])</var><a class="copiable-link" href="#index-name"> &para;</a></span></dt>
<dd><p>In deffn with code and var used
</p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-foobar-35"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) default</code><a class="copiable-link" href="#index-foobar-35"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-36"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><span class="r">[</span>, float <var class="var">b--ar</var><span class="r">]</span>) r</code><a class="copiable-link" href="#index-foobar-36"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-37"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><var class="var">[</var>, float <var class="var">b--ar</var><var class="var">]</var>) var</code><a class="copiable-link" href="#index-foobar-37"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-38"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><i class="slanted">[</i>, float <var class="var">b--ar</var><i class="slanted">]</i>) slanted</code><a class="copiable-link" href="#index-foobar-38"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-39"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><code class="code">[</code>, float <var class="var">b--ar</var><code class="code">]</code>) code</code><a class="copiable-link" href="#index-foobar-39"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-40"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><code class="t">[</code>, float <var class="var">b--ar</var><code class="t">]</code>) t</code><a class="copiable-link" href="#index-foobar-40"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-41"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><code class="t"><b class="b">[</b></code>, float <var class="var">b--ar</var><code class="t"><b class="b">]</b></code>) t:b</code><a class="copiable-link" href="#index-foobar-41"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-42"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><span class="r"><var class="var">[</var></span>, float <var class="var">b--ar</var><span class="r"><var class="var">]</var></span>) r:var</code><a class="copiable-link" href="#index-foobar-42"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-43"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><span class="r"><i class="slanted">[</i></span>, float <var class="var">b--ar</var><span class="r"><i class="slanted">]</i></span>) r:slanted</code><a class="copiable-link" href="#index-foobar-43"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-44"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><span class="r"><code class="code">[</code></span>, float <var class="var">b--ar</var><span class="r"><code class="code">]</code></span>) r:code</code><a class="copiable-link" href="#index-foobar-44"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-45"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><span class="r"><code class="t">[</code></span>, float <var class="var">b--ar</var><span class="r"><code class="t">]</code></span>) r:t</code><a class="copiable-link" href="#index-foobar-45"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-46"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><code class="code"><var class="var">[</var></code>, float <var class="var">b--ar</var><code class="code"><var class="var">]</var></code>) code:var</code><a class="copiable-link" href="#index-foobar-46"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-47"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><code class="t"><var class="var">[</var></code>, float <var class="var">b--ar</var><code class="t"><var class="var">]</var></code>) t:var</code><a class="copiable-link" href="#index-foobar-47"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-48"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><code class="code"><i class="slanted">[</i></code>, float <var class="var">b--ar</var><code class="code"><i class="slanted">]</i></code>) code:slanted</code><a class="copiable-link" href="#index-foobar-48"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-49"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(int <var class="var">f---oo</var><code class="t"><i class="slanted">[</i></code>, float <var class="var">b--ar</var><code class="t"><i class="slanted">]</i></code>) t:slanted</code><a class="copiable-link" href="#index-foobar-49"> &para;</a></span></dt>
<dd><p>separators
</p></dd></dl>

<dl class="first-deftypefn def-block">
<dt class="deftypefn def-line" id="index-foobar-50"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(i--nt <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) default</code><a class="copiable-link" href="#index-foobar-50"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-51"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<span class="r">i&ndash;nt</span> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) r</code><a class="copiable-link" href="#index-foobar-51"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-52"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<var class="var">i--nt</var> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) var</code><a class="copiable-link" href="#index-foobar-52"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-53"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<i class="slanted">i--nt</i> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) slanted</code><a class="copiable-link" href="#index-foobar-53"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-54"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<code class="code">i--nt</code> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) code</code><a class="copiable-link" href="#index-foobar-54"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-55"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<code class="t">i--nt</code> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) t</code><a class="copiable-link" href="#index-foobar-55"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-56"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<code class="t"><b class="b">i--nt</b></code> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) t:b</code><a class="copiable-link" href="#index-foobar-56"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-57"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<span class="r"><var class="var">i&ndash;nt</var></span> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) r:var</code><a class="copiable-link" href="#index-foobar-57"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-58"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<span class="r"><i class="slanted">i&ndash;nt</i></span> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) r:slanted</code><a class="copiable-link" href="#index-foobar-58"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-59"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<span class="r"><code class="code">i--nt</code></span> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) r:code</code><a class="copiable-link" href="#index-foobar-59"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-60"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<span class="r"><code class="t">i--nt</code></span> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) r:t</code><a class="copiable-link" href="#index-foobar-60"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-61"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<code class="code"><var class="var">i--nt</var></code> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) code:var</code><a class="copiable-link" href="#index-foobar-61"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-62"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<code class="t"><var class="var">i--nt</var></code> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) t:var</code><a class="copiable-link" href="#index-foobar-62"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-63"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<code class="code"><i class="slanted">i--nt</i></code> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) code:slanted</code><a class="copiable-link" href="#index-foobar-63"> &para;</a></span></dt>
<dt class="deftypefnx def-cmd-deftypefn def-line" id="index-foobar-64"><span class="category-def">Library Function: </span><span><code class="def-type">int</code> <strong class="def-name">foobar</strong> <code class="def-code-arguments">(<code class="t"><i class="slanted">i--nt</i></code> <var class="var">f---oo</var>[, float <var class="var">b--ar</var>]) t:slanted</code><a class="copiable-link" href="#index-foobar-64"> &para;</a></span></dt>
<dd><p>name
</p></dd></dl>

</div>
</div>
';

$result_converted_sort_strings{'file_html'}->{'definition_commands'} = 'fn:
 .ft
 \\f(fn
 \\f[font]
 \\ff
 \\n[.sty]
 apply
 apply
 fname
 fname
 fname
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 foobar
 name
vr:
 border-pattern of Window
 border-pattern of Window
';


$result_converted{'xml'}->{'definition_commands'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chapter</nodenext></node>
<top><sectiontitle> top section</sectiontitle>

</top>
<node identifier="chapter"><nodename> chapter</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> chapter</sectiontitle>

<deffn endspaces=" "><definitionterm><indexterm index="fn" number="1">fname</indexterm> <defcategory>Func</defcategory> <deffunction>fname</deffunction> <defparam>a---rg1</defparam> <defparam>a--rg2</defparam></definitionterm>
<definitionitem><para>deffn no var for <var>a&textmdash;rg1</var> and <var>a&textndash;rg2</var>
</para></definitionitem></deffn>

<deffn endspaces=" "><definitionterm><indexterm index="fn" number="2">fname</indexterm> <defcategory>Func</defcategory> <deffunction>fname</deffunction> <defparam><var>a---rg1</var></defparam> <defparam><var>a--rg2</var></defparam></definitionterm>
<definitionitem><para>deffn explict var for <var>a&textmdash;rg1</var> and <var>a&textndash;rg2</var>
</para></definitionitem></deffn>

<deffn endspaces=" "><definitionterm><indexterm index="fn" number="3">fname</indexterm> <defcategory>Func</defcategory> <deffunction>fname</deffunction> <defparam><r><slanted>a&textmdash;rg1</slanted></r></defparam> <defparam><r><slanted>a&textndash;rg2</slanted></r></defparam></definitionterm>
<definitionitem><para>deffn r slanted for <var>a&textmdash;rg1</var> and <var>a&textndash;rg2</var>
</para></definitionitem></deffn>

<defspec endspaces=" "><definitionterm><indexterm index="fn" number="4">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defdelimiter>[</defdelimiter><defparam>from</defparam> <defparam>to</defparam> <defdelimiter>[</defdelimiter><defparam>inc</defparam><defdelimiter>]</defdelimiter><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparam>default</defparam></definitionterm>
<defspecx><definitionterm><indexterm index="fn" number="5">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><r>[</r></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><r>[</r></defparam><defparam>inc</defparam><defparam><r>]]</r></defparam><defdelimiter>)</defdelimiter> <defparam>r</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="6">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><var>[</var></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><var>[</var></defparam><defparam>inc</defparam><defparam><var>]]</var></defparam><defdelimiter>)</defdelimiter> <defparam>var</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="7">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><slanted>[</slanted></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><slanted>[</slanted></defparam><defparam>inc</defparam><defparam><slanted>]]</slanted></defparam><defdelimiter>)</defdelimiter> <defparam>slanted</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="8">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><code>[</code></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><code>[</code></defparam><defparam>inc</defparam><defparam><code>]]</code></defparam><defdelimiter>)</defdelimiter> <defparam>code</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="9">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><t>[</t></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><t>[</t></defparam><defparam>inc</defparam><defparam><t>]]</t></defparam><defdelimiter>)</defdelimiter> <defparam>t</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="10">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><t><b>[</b></t></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><t><b>[</b></t></defparam><defparam>inc</defparam><defparam><t><b>]]</b></t></defparam><defdelimiter>)</defdelimiter> <defparam>t:b</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="11">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><r><var>[</var></r></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><r><var>[</var></r></defparam><defparam>inc</defparam><defparam><r><var>]]</var></r></defparam><defdelimiter>)</defdelimiter> <defparam>r:var</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="12">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><r><slanted>[</slanted></r></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><r><slanted>[</slanted></r></defparam><defparam>inc</defparam><defparam><r><slanted>]]</slanted></r></defparam><defdelimiter>)</defdelimiter> <defparam>r:slanted</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="13">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><r><code>[</code></r></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><r><code>[</code></r></defparam><defparam>inc</defparam><defparam><r><code>]]</code></r></defparam><defdelimiter>)</defdelimiter> <defparam>r:code</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="14">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><r><t>[</t></r></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><r><t>[</t></r></defparam><defparam>inc</defparam><defparam><r><t>]]</t></r></defparam><defdelimiter>)</defdelimiter> <defparam>r:t</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="15">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><code><var>[</var></code></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><code><var>[</var></code></defparam><defparam>inc</defparam><defparam><code><var>]]</var></code></defparam><defdelimiter>)</defdelimiter> <defparam>code:var</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="16">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><t><var>[</var></t></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><t><var>[</var></t></defparam><defparam>inc</defparam><defparam><t><var>]]</var></t></defparam><defdelimiter>)</defdelimiter> <defparam>t:var</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="17">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><code><slanted>[</slanted></code></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><code><slanted>[</slanted></code></defparam><defparam>inc</defparam><defparam><code><slanted>]]</slanted></code></defparam><defdelimiter>)</defdelimiter> <defparam>code:slanted</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="18">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>(</defdelimiter><defparam>var</defparam> <defparam><t><slanted>[</slanted></t></defparam><defparam>from</defparam> <defparam>to</defparam> <defparam><t><slanted>[</slanted></t></defparam><defparam>inc</defparam><defparam><t><slanted>]]</slanted></t></defparam><defdelimiter>)</defdelimiter> <defparam>t:slanted</defparam></definitionterm></defspecx>
<definitionitem><para>separators
</para></definitionitem></defspec>

<defspec endspaces=" "><definitionterm><indexterm index="fn" number="19">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam>va---riable</defparam> <defparam>default</defparam></definitionterm>
<defspecx><definitionterm><indexterm index="fn" number="20">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><var>va---riable</var></defparam> <defparam>var</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="21">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><r>va&textmdash;riable</r></defparam> <defparam>r</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="22">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><slanted>va---riable</slanted></defparam> <defparam>slanted</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="23">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><code>va---riable</code></defparam> <defparam>code</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="24">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><t>va---riable</t></defparam> <defparam>t</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="25">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><t><b>va---riable</b></t></defparam> <defparam>t:b</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="26">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><r><var>va&textmdash;riable</var></r></defparam> <defparam>r:var</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="27">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><r><slanted>va&textmdash;riable</slanted></r></defparam> <defparam>r:slanted</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="28">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><r><code>va---riable</code></r></defparam> <defparam>r:code</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="29">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><r><t>va---riable</t></r></defparam> <defparam>r:t</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="30">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><code><var>va---riable</var></code></defparam> <defparam>code:var</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="31">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><t><var>va---riable</var></t></defparam> <defparam>t:var</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="32">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><code><slanted>va---riable</slanted></code></defparam> <defparam>code:slanted</defparam></definitionterm></defspecx>
<defspecx><definitionterm><indexterm index="fn" number="33">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defparam><t><slanted>va---riable</slanted></t></defparam> <defparam>t:slanted</defparam></definitionterm></defspecx>
<definitionitem><para>name
</para></definitionitem></defspec>

<deffn endspaces=" "><definitionterm><indexterm index="fn" number="34"><t>.ft</t></indexterm> <defcategory>Request</defcategory> <deffunction><t>.ft</t></deffunction> <defdelimiter>[</defdelimiter><defparam><r><slanted>font</slanted></r></defparam><defdelimiter>]</defdelimiter></definitionterm>
<deffnx><definitionterm><indexterm index="fn" number="35"><t>\\f</t><r><slanted>f</slanted></r><t></t></indexterm> <defcategory>Escape&nbsp;sequence</defcategory> <deffunction><t>\\f</t><r><slanted>f</slanted></r><t></t></deffunction></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="36"><t>\\f(</t><r><slanted>fn</slanted></r><t></t></indexterm> <defcategory>Escape&nbsp;sequence</defcategory> <deffunction><t>\\f(</t><r><slanted>fn</slanted></r><t></t></deffunction></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="37"><t>\\f[</t><r><slanted>font</slanted></r><t>]</t></indexterm> <defcategory>Escape&nbsp;sequence</defcategory> <deffunction><t>\\f[</t><r><slanted>font</slanted></r><t>]</t></deffunction> <defparam><t>\\f[</t></defparam><defparam><r><slanted>font</slanted></r></defparam><defparam><t>]</t></defparam></definitionterm></deffnx>
<deffnx><definitionterm><indexterm index="fn" number="38"><t>\\n[.sty]</t></indexterm> <defcategory>Register</defcategory> <deffunction><t>\\n[.sty]</t></deffunction></definitionterm></deffnx>
<definitionitem><para>The <code>ft</code> request and the <code>\\f</code> escape change the current font
to <var>font</var> (one-character name&nbsp;<var>f</var>, two-character name
<var>fn</var>).
</para></definitionitem></deffn>

<defspec endspaces=" "><definitionterm><indexterm index="fn" number="39">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>[</defdelimiter> <defparam><r>[</r></defparam> <defparam><slanted>[</slanted></defparam> <defparam><code>[</code></defparam> <defparam><t>[</t></defparam> <defparam><r><slanted>[</slanted></r></defparam> <defparam><r><code>[</code></r></defparam> <defparam><r><code><slanted>[</slanted></code></r></defparam> <defparam><r><t>[</t></r></defparam> <defdelimiter>,</defdelimiter> <defparam><r>,</r></defparam> <defparam><slanted>,</slanted></defparam> <defparam><code>,</code></defparam> <defparam><t>,</t></defparam> <defparam><r><slanted>,</slanted></r></defparam> <defparam><r><code>,</code></r></defparam> <defparam><r><code><slanted>,</slanted></code></r></defparam> <defparam><r><t>,</t></r></defparam> <defdelimiter>]</defdelimiter> <defparam><r>]</r></defparam> <defparam><slanted>]</slanted></defparam> <defparam><code>]</code></defparam> <defparam><t>]</t></defparam> <defparam><r><slanted>]</slanted></r></defparam> <defparam><r><code>]</code></r></defparam> <defparam><r><code><slanted>]</slanted></code></r></defparam> <defparam><r><t>]</t></r></defparam></definitionterm>
<defspecx><definitionterm><indexterm index="fn" number="40">foobar</indexterm> <defcategory automatic="on">Special Form</defcategory> <deffunction>foobar</deffunction> <defdelimiter>[</defdelimiter><defdelimiter>]</defdelimiter> <defparam><r>[]</r></defparam> <defparam><slanted>[]</slanted></defparam> <defparam><code>[]</code></defparam> <defparam><t>[]</t></defparam> <defparam><r><slanted>[]</slanted></r></defparam> <defparam><r><code>[]</code></r></defparam> <defparam><r><code><slanted>[]</slanted></code></r></defparam></definitionterm></defspecx>
<definitionitem><para>test formatting of separators
</para></definitionitem></defspec>

<deftypefn endspaces=" "><definitionterm><indexterm index="fn" number="41">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>)</defdelimiter></definitionterm>
<definitionitem><para>&dots; with var for <var>f&textmdash;oo</var> and <var>b&textndash;ar</var>
</para></definitionitem></deftypefn>

<deftypefn endspaces=" "><definitionterm><indexterm index="fn" number="42">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><r><slanted>f&textmdash;oo</slanted></r></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><r><slanted>b&textndash;ar</slanted></r></defparam><defdelimiter>)</defdelimiter></definitionterm>
<definitionitem><para>&dots; with r slanted for <var>f&textmdash;oo</var> and <var>b&textndash;ar</var>
</para></definitionitem></deftypefn>

<noindent></noindent> <para>produces:
</para><defcv endspaces=" "><definitionterm><indexterm index="vr" number="1">border-pattern of Window</indexterm> <defcategory bracketed="on">Class Option</defcategory> <defclass>Window</defclass> <defclassvar>border-pattern</defclassvar></definitionterm>
<definitionitem><para>&dots;
</para></definitionitem></defcv>

<deftypecv endspaces=" "><definitionterm><indexterm index="vr" number="2">border-pattern of Window</indexterm> <defcategory bracketed="on">Class Option</defcategory> <defclass>Window</defclass> <deftype><code>int</code></deftype> <defclassvar>border-pattern</defclassvar></definitionterm>
<definitionitem><para>&dots;
</para></definitionitem></deftypecv>

<quotation endspaces=" ">
<deftypefn endspaces=" "><definitionterm><indexterm index="fn" number="43">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>foo</var></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>bar</var></defparam><defdelimiter>)</defdelimiter></definitionterm>
<definitionitem><para>&dots; for <var>foo</var> and <var>bar</var>
</para></definitionitem></deftypefn>
</quotation>

<defun endspaces=" "><definitionterm><indexterm index="fn" number="44">apply</indexterm> <defcategory automatic="on">Function</defcategory> <deffunction>apply</deffunction> <defparam>function</defparam> <defparam>&amp;rest</defparam> <defparam>arguments</defparam></definitionterm>
<definitionitem><para><code>apply</code> calls no var <var>function</var> with <var>arguments</var>
</para></definitionitem></defun>

<defun endspaces=" "><definitionterm><indexterm index="fn" number="45">apply</indexterm> <defcategory automatic="on">Function</defcategory> <deffunction>apply</deffunction> <defparam>function</defparam> <defparam><r><b>&amp;rest</b></r></defparam> <defparam>argument</defparam></definitionterm>
<definitionitem><para>explicit keyword marking, no var <var>function</var> with <var>arguments</var>
</para></definitionitem></defun>

<deffn endspaces=" "><definitionterm><indexterm index="fn" number="46">name</indexterm> <defcategory>Category</defcategory> <deffunction>name</deffunction> <defparam>argument</defparam> <defparam><code>int</code></defparam> <defparam><code>a--b</code></defparam> <defparam><var>v--ar1</var></defparam><defdelimiter>,</defdelimiter> <defparam>word</defparam> <defparam><code>--</code></defparam> <defdelimiter>(</defdelimiter><defparam><code>type o--ther</code></defparam><defdelimiter>,</defdelimiter> <defparam><var>v---ar2</var></defparam>  <defdelimiter>[</defdelimiter><defparam><code>float</code></defparam> <defdelimiter>[</defdelimiter><defparam><var>var4</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter></definitionterm>
<definitionitem><para>In deffn with code and var used
</para></definitionitem></deffn>

<deftypefn endspaces=" "><definitionterm><indexterm index="fn" number="47">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>default</defparamtype></definitionterm>
<deftypefnx><definitionterm><indexterm index="fn" number="48">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparam><r>[</r></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparam><r>]</r></defparam><defdelimiter>)</defdelimiter> <defparamtype>r</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="49">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparam><var>[</var></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparam><var>]</var></defparam><defdelimiter>)</defdelimiter> <defparamtype>var</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="50">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparam><slanted>[</slanted></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparam><slanted>]</slanted></defparam><defdelimiter>)</defdelimiter> <defparamtype>slanted</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="51">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparamtype><code>[</code></defparamtype><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparamtype><code>]</code></defparamtype><defdelimiter>)</defdelimiter> <defparamtype>code</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="52">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparam><t>[</t></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparam><t>]</t></defparam><defdelimiter>)</defdelimiter> <defparamtype>t</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="53">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparam><t><b>[</b></t></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparam><t><b>]</b></t></defparam><defdelimiter>)</defdelimiter> <defparamtype>t:b</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="54">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparam><r><var>[</var></r></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparam><r><var>]</var></r></defparam><defdelimiter>)</defdelimiter> <defparamtype>r:var</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="55">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparam><r><slanted>[</slanted></r></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparam><r><slanted>]</slanted></r></defparam><defdelimiter>)</defdelimiter> <defparamtype>r:slanted</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="56">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparam><r><code>[</code></r></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparam><r><code>]</code></r></defparam><defdelimiter>)</defdelimiter> <defparamtype>r:code</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="57">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparam><r><t>[</t></r></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparam><r><t>]</t></r></defparam><defdelimiter>)</defdelimiter> <defparamtype>r:t</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="58">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparamtype><code><var>[</var></code></defparamtype><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparamtype><code><var>]</var></code></defparamtype><defdelimiter>)</defdelimiter> <defparamtype>code:var</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="59">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparam><t><var>[</var></t></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparam><t><var>]</var></t></defparam><defdelimiter>)</defdelimiter> <defparamtype>t:var</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="60">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparamtype><code><slanted>[</slanted></code></defparamtype><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparamtype><code><slanted>]</slanted></code></defparamtype><defdelimiter>)</defdelimiter> <defparamtype>code:slanted</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="61">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>int</defparamtype> <defparam><var>f---oo</var></defparam><defparam><t><slanted>[</slanted></t></defparam><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defparam><t><slanted>]</slanted></t></defparam><defdelimiter>)</defdelimiter> <defparamtype>t:slanted</defparamtype></definitionterm></deftypefnx>
<definitionitem><para>separators
</para></definitionitem></deftypefn>

<deftypefn endspaces=" "><definitionterm><indexterm index="fn" number="62">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype>i--nt</defparamtype> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>default</defparamtype></definitionterm>
<deftypefnx><definitionterm><indexterm index="fn" number="63">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparam><r>i&textndash;nt</r></defparam> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>r</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="64">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparam><var>i--nt</var></defparam> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>var</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="65">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparam><slanted>i--nt</slanted></defparam> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>slanted</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="66">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype><code>i--nt</code></defparamtype> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>code</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="67">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparam><t>i--nt</t></defparam> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>t</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="68">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparam><t><b>i--nt</b></t></defparam> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>t:b</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="69">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparam><r><var>i&textndash;nt</var></r></defparam> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>r:var</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="70">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparam><r><slanted>i&textndash;nt</slanted></r></defparam> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>r:slanted</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="71">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparam><r><code>i--nt</code></r></defparam> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>r:code</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="72">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparam><r><t>i--nt</t></r></defparam> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>r:t</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="73">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype><code><var>i--nt</var></code></defparamtype> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>code:var</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="74">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparam><t><var>i--nt</var></t></defparam> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>t:var</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="75">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparamtype><code><slanted>i--nt</slanted></code></defparamtype> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>code:slanted</defparamtype></definitionterm></deftypefnx>
<deftypefnx><definitionterm><indexterm index="fn" number="76">foobar</indexterm> <defcategory bracketed="on">Library Function</defcategory> <deftype>int</deftype> <deffunction>foobar</deffunction>  <defdelimiter>(</defdelimiter><defparam><t><slanted>i--nt</slanted></t></defparam> <defparam><var>f---oo</var></defparam><defdelimiter>[</defdelimiter><defdelimiter>,</defdelimiter> <defparamtype>float</defparamtype> <defparam><var>b--ar</var></defparam><defdelimiter>]</defdelimiter><defdelimiter>)</defdelimiter> <defparamtype>t:slanted</defparamtype></definitionterm></deftypefnx>
<definitionitem><para>name
</para></definitionitem></deftypefn>

</chapter>
';


$result_converted{'docbook'}->{'definition_commands'} = '<chapter label="1" id="chapter">
<title>chapter</title>

<synopsis><indexterm role="fn"><primary>fname</primary></indexterm><phrase role="category"><emphasis role="bold">Func</emphasis>:</phrase> <function>fname</function> <emphasis role="arg">a---rg1</emphasis> <emphasis role="arg">a--rg2</emphasis></synopsis>
<blockquote><para>deffn no var for <replaceable>a&#8212;rg1</replaceable> and <replaceable>a&#8211;rg2</replaceable>
</para></blockquote>
<synopsis><indexterm role="fn"><primary>fname</primary></indexterm><phrase role="category"><emphasis role="bold">Func</emphasis>:</phrase> <function>fname</function> <emphasis role="arg"><replaceable>a---rg1</replaceable></emphasis> <emphasis role="arg"><replaceable>a--rg2</replaceable></emphasis></synopsis>
<blockquote><para>deffn explict var for <replaceable>a&#8212;rg1</replaceable> and <replaceable>a&#8211;rg2</replaceable>
</para></blockquote>
<synopsis><indexterm role="fn"><primary>fname</primary></indexterm><phrase role="category"><emphasis role="bold">Func</emphasis>:</phrase> <function>fname</function> <emphasis role="arg">a&#8212;rg1</emphasis> <emphasis role="arg">a&#8211;rg2</emphasis></synopsis>
<blockquote><para>deffn r slanted for <replaceable>a&#8212;rg1</replaceable> and <replaceable>a&#8211;rg2</replaceable>
</para></blockquote>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> [<emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> [<emphasis role="arg">inc</emphasis>]]) <emphasis role="arg">default</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg">]]</emphasis>) <emphasis role="arg">r</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg"><replaceable>[</replaceable></emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg"><replaceable>[</replaceable></emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg"><replaceable>]]</replaceable></emphasis>) <emphasis role="arg">var</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg">]]</emphasis>) <emphasis role="arg">slanted</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg">]]</emphasis>) <emphasis role="arg">code</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg">]]</emphasis>) <emphasis role="arg">t</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg"><emphasis role="bold">[</emphasis></emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg"><emphasis role="bold">[</emphasis></emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg"><emphasis role="bold">]]</emphasis></emphasis>) <emphasis role="arg">t:b</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg"><replaceable>[</replaceable></emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg"><replaceable>[</replaceable></emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg"><replaceable>]]</replaceable></emphasis>) <emphasis role="arg">r:var</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg">]]</emphasis>) <emphasis role="arg">r:slanted</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg">]]</emphasis>) <emphasis role="arg">r:code</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg">]]</emphasis>) <emphasis role="arg">r:t</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg"><replaceable>[</replaceable></emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg"><replaceable>[</replaceable></emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg"><replaceable>]]</replaceable></emphasis>) <emphasis role="arg">code:var</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg"><replaceable>[</replaceable></emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg"><replaceable>[</replaceable></emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg"><replaceable>]]</replaceable></emphasis>) <emphasis role="arg">t:var</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg">]]</emphasis>) <emphasis role="arg">code:slanted</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> (<emphasis role="arg">var</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">from</emphasis> <emphasis role="arg">to</emphasis> <emphasis role="arg">[</emphasis><emphasis role="arg">inc</emphasis><emphasis role="arg">]]</emphasis>) <emphasis role="arg">t:slanted</emphasis></synopsis>
<blockquote><para>separators
</para></blockquote>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg">va---riable</emphasis> <emphasis role="arg">default</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg"><replaceable>va---riable</replaceable></emphasis> <emphasis role="arg">var</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg">va&#8212;riable</emphasis> <emphasis role="arg">r</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg">va---riable</emphasis> <emphasis role="arg">slanted</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg">va---riable</emphasis> <emphasis role="arg">code</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg">va---riable</emphasis> <emphasis role="arg">t</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg"><emphasis role="bold">va---riable</emphasis></emphasis> <emphasis role="arg">t:b</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg"><replaceable>va&#8212;riable</replaceable></emphasis> <emphasis role="arg">r:var</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg">va&#8212;riable</emphasis> <emphasis role="arg">r:slanted</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg">va---riable</emphasis> <emphasis role="arg">r:code</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg">va---riable</emphasis> <emphasis role="arg">r:t</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg"><replaceable>va---riable</replaceable></emphasis> <emphasis role="arg">code:var</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg"><replaceable>va---riable</replaceable></emphasis> <emphasis role="arg">t:var</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg">va---riable</emphasis> <emphasis role="arg">code:slanted</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> <emphasis role="arg">va---riable</emphasis> <emphasis role="arg">t:slanted</emphasis></synopsis>
<blockquote><para>name
</para></blockquote>
<synopsis><indexterm role="fn"><primary><literal>.ft</literal></primary></indexterm><phrase role="category"><emphasis role="bold">Request</emphasis>:</phrase> <function>.ft</function> [<emphasis role="arg">font</emphasis>]</synopsis>
<synopsis><indexterm role="fn"><primary><literal>\\f</literal>f</primary></indexterm><phrase role="category"><emphasis role="bold">Escape&#160;sequence</emphasis>:</phrase> <function>\\ff</function></synopsis>
<synopsis><indexterm role="fn"><primary><literal>\\f(</literal>fn</primary></indexterm><phrase role="category"><emphasis role="bold">Escape&#160;sequence</emphasis>:</phrase> <function>\\f(fn</function></synopsis>
<synopsis><indexterm role="fn"><primary><literal>\\f[</literal>font<literal>]</literal></primary></indexterm><phrase role="category"><emphasis role="bold">Escape&#160;sequence</emphasis>:</phrase> <function>\\f[font]</function> <emphasis role="arg">\\f[</emphasis><emphasis role="arg">font</emphasis><emphasis role="arg">]</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary><literal>\\n[.sty]</literal></primary></indexterm><phrase role="category"><emphasis role="bold">Register</emphasis>:</phrase> <function>\\n[.sty]</function></synopsis>
<blockquote><para>The <literal>ft</literal> request and the <literal>\\f</literal> escape change the current font
to <replaceable>font</replaceable> (one-character name&#160;<replaceable>f</replaceable>, two-character name
<replaceable>fn</replaceable>).
</para></blockquote>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> [ <emphasis role="arg">[</emphasis> <emphasis role="arg">[</emphasis> <emphasis role="arg">[</emphasis> <emphasis role="arg">[</emphasis> <emphasis role="arg">[</emphasis> <emphasis role="arg">[</emphasis> <emphasis role="arg">[</emphasis> <emphasis role="arg">[</emphasis> , <emphasis role="arg">,</emphasis> <emphasis role="arg">,</emphasis> <emphasis role="arg">,</emphasis> <emphasis role="arg">,</emphasis> <emphasis role="arg">,</emphasis> <emphasis role="arg">,</emphasis> <emphasis role="arg">,</emphasis> <emphasis role="arg">,</emphasis> ] <emphasis role="arg">]</emphasis> <emphasis role="arg">]</emphasis> <emphasis role="arg">]</emphasis> <emphasis role="arg">]</emphasis> <emphasis role="arg">]</emphasis> <emphasis role="arg">]</emphasis> <emphasis role="arg">]</emphasis> <emphasis role="arg">]</emphasis></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Special Form</emphasis>:</phrase> <function>foobar</function> [] <emphasis role="arg">[]</emphasis> <emphasis role="arg">[]</emphasis> <emphasis role="arg">[]</emphasis> <emphasis role="arg">[]</emphasis> <emphasis role="arg">[]</emphasis> <emphasis role="arg">[]</emphasis> <emphasis role="arg">[]</emphasis></synopsis>
<blockquote><para>test formatting of separators
</para></blockquote>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>)</synopsis>
<blockquote><para>&#8230; with var for <replaceable>f&#8212;oo</replaceable> and <replaceable>b&#8211;ar</replaceable>
</para></blockquote>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg">f&#8212;oo</emphasis>, <type>float</type> <emphasis role="arg">b&#8211;ar</emphasis>)</synopsis>
<blockquote><para>&#8230; with r slanted for <replaceable>f&#8212;oo</replaceable> and <replaceable>b&#8211;ar</replaceable>
</para></blockquote>
<para>produces:
</para><synopsis><indexterm role="vr"><primary>border-pattern of Window</primary></indexterm><phrase role="category"><emphasis role="bold">Class Option</emphasis>:</phrase> <ooclass><classname>Window</classname></ooclass> <property>border-pattern</property></synopsis>
<blockquote><para>&#8230;
</para></blockquote>
<synopsis><indexterm role="vr"><primary>border-pattern of Window</primary></indexterm><phrase role="category"><emphasis role="bold">Class Option</emphasis>:</phrase> <ooclass><classname>Window</classname></ooclass> <returnvalue>int</returnvalue> <property>border-pattern</property></synopsis>
<blockquote><para>&#8230;
</para></blockquote>
<blockquote><synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>foo</replaceable></emphasis>, <type>float</type> <emphasis role="arg"><replaceable>bar</replaceable></emphasis>)</synopsis>
<blockquote><para>&#8230; for <replaceable>foo</replaceable> and <replaceable>bar</replaceable>
</para></blockquote></blockquote>
<synopsis><indexterm role="fn"><primary>apply</primary></indexterm><phrase role="category"><emphasis role="bold">Function</emphasis>:</phrase> <function>apply</function> <emphasis role="arg">function</emphasis> <emphasis role="arg">&amp;rest</emphasis> <emphasis role="arg">arguments</emphasis></synopsis>
<blockquote><para><literal>apply</literal> calls no var <replaceable>function</replaceable> with <replaceable>arguments</replaceable>
</para></blockquote>
<synopsis><indexterm role="fn"><primary>apply</primary></indexterm><phrase role="category"><emphasis role="bold">Function</emphasis>:</phrase> <function>apply</function> <emphasis role="arg">function</emphasis> <emphasis role="arg"><emphasis role="bold">&amp;rest</emphasis></emphasis> <emphasis role="arg">argument</emphasis></synopsis>
<blockquote><para>explicit keyword marking, no var <replaceable>function</replaceable> with <replaceable>arguments</replaceable>
</para></blockquote>
<synopsis><indexterm role="fn"><primary>name</primary></indexterm><phrase role="category"><emphasis role="bold">Category</emphasis>:</phrase> <function>name</function> <emphasis role="arg">argument</emphasis> <emphasis role="arg">int</emphasis> <emphasis role="arg">a--b</emphasis> <emphasis role="arg"><replaceable>v--ar1</replaceable></emphasis>, <emphasis role="arg">word</emphasis> <emphasis role="arg">--</emphasis> (<emphasis role="arg">type o--ther</emphasis>, <emphasis role="arg"><replaceable>v---ar2</replaceable></emphasis>  [<emphasis role="arg">float</emphasis> [<emphasis role="arg"><replaceable>var4</replaceable></emphasis>]])</synopsis>
<blockquote><para>In deffn with code and var used
</para></blockquote>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>default</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><emphasis role="arg">[</emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><emphasis role="arg">]</emphasis>) <type>r</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><emphasis role="arg"><replaceable>[</replaceable></emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><emphasis role="arg"><replaceable>]</replaceable></emphasis>) <type>var</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><emphasis role="arg">[</emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><emphasis role="arg">]</emphasis>) <type>slanted</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><type>[</type>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><type>]</type>) <type>code</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><emphasis role="arg">[</emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><emphasis role="arg">]</emphasis>) <type>t</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><emphasis role="arg"><emphasis role="bold">[</emphasis></emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><emphasis role="arg"><emphasis role="bold">]</emphasis></emphasis>) <type>t:b</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><emphasis role="arg"><replaceable>[</replaceable></emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><emphasis role="arg"><replaceable>]</replaceable></emphasis>) <type>r:var</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><emphasis role="arg">[</emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><emphasis role="arg">]</emphasis>) <type>r:slanted</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><emphasis role="arg">[</emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><emphasis role="arg">]</emphasis>) <type>r:code</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><emphasis role="arg">[</emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><emphasis role="arg">]</emphasis>) <type>r:t</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><type><replaceable>[</replaceable></type>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><type><replaceable>]</replaceable></type>) <type>code:var</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><emphasis role="arg"><replaceable>[</replaceable></emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><emphasis role="arg"><replaceable>]</replaceable></emphasis>) <type>t:var</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><type>[</type>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><type>]</type>) <type>code:slanted</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>int</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis><emphasis role="arg">[</emphasis>, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis><emphasis role="arg">]</emphasis>) <type>t:slanted</type></synopsis>
<blockquote><para>separators
</para></blockquote>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>i--nt</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>default</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<emphasis role="arg">i&#8211;nt</emphasis> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>r</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<emphasis role="arg"><replaceable>i--nt</replaceable></emphasis> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>var</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<emphasis role="arg">i--nt</emphasis> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>slanted</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>i--nt</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>code</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<emphasis role="arg">i--nt</emphasis> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>t</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<emphasis role="arg"><emphasis role="bold">i--nt</emphasis></emphasis> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>t:b</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<emphasis role="arg"><replaceable>i&#8211;nt</replaceable></emphasis> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>r:var</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<emphasis role="arg">i&#8211;nt</emphasis> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>r:slanted</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<emphasis role="arg">i--nt</emphasis> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>r:code</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<emphasis role="arg">i--nt</emphasis> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>r:t</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type><replaceable>i--nt</replaceable></type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>code:var</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<emphasis role="arg"><replaceable>i--nt</replaceable></emphasis> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>t:var</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<type>i--nt</type> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>code:slanted</type></synopsis>
<synopsis><indexterm role="fn"><primary>foobar</primary></indexterm><phrase role="category"><emphasis role="bold">Library Function</emphasis>:</phrase> <returnvalue>int</returnvalue> <function>foobar</function>  (<emphasis role="arg">i--nt</emphasis> <emphasis role="arg"><replaceable>f---oo</replaceable></emphasis>[, <type>float</type> <emphasis role="arg"><replaceable>b--ar</replaceable></emphasis>]) <type>t:slanted</type></synopsis>
<blockquote><para>name
</para></blockquote>
</chapter>
';

1;
