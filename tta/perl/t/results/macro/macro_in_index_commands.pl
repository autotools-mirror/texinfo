use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_index_commands'} = '*document_root C3
 *before_node_section C11
  *preamble_before_content C9
   *normal_command@macro C3 l1
   |formal_args:A{}
   |macro_name:{cp}
    *arguments_line C1
     {macro_line: cp\\n}
    {raw:cp\\n}
    *normal_command@end C1 l3
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   *normal_command@macro C3 l4
   |formal_args:A{}
   |macro_name:{fn}
    *arguments_line C1
     {macro_line: fn \\n}
    {raw:fn\\n}
    *normal_command@end C1 l6
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   *normal_command@macro C3 l7
   |formal_args:A{}
   |macro_name:{syncodeindexcommand}
    *arguments_line C1
     {macro_line: syncodeindexcommand \\n}
    {raw:@syncodeindex\\n}
    *normal_command@end C1 l9
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@syncodeindex C1 l11
   |misc_args:A{cp|fn}
   >SOURCEMARKS
   >macro_expansion<start;3>
    >*macro_call@syncodeindexcommand C1
     >*brace_arg
    *line_arg C3
     {spaces_before_argument: }
     >SOURCEMARKS
     >macro_expansion<start;1><p:1>
      >*macro_call@cp C1
       >*brace_arg
     {normal_text:cp fn}
     >SOURCEMARKS
     >macro_expansion<end;1><p:2>
     >macro_expansion<start;2><p:3>
      >*macro_call@fn C1
       >*brace_arg
     >macro_expansion<end;2><p:5>
     {spaces_after_argument:\\n}
   *normal_command@syncodeindex C1 l12:@syncodeindexcommand
   |misc_args:A{cp|fn}
    *line_arg C3
     {spaces_before_argument: }
     >SOURCEMARKS
     >macro_expansion<end;3>
     {normal_text:cp fn}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 l14
   |formal_args:A{}
   |macro_name:{truc}
    *arguments_line C1
     {macro_line: truc \\n}
    {raw:truc\\n}
    *normal_command@end C1 l16
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {normal_text:definedx truc\\n}
   *normal_command@defindex C1 l19
   |misc_args:A{truc}
    *line_arg C3
     {spaces_before_argument: }
     >SOURCEMARKS
     >macro_expansion<start;4><p:1>
      >*macro_call@truc C1
       >*brace_arg
     {normal_text:truc}
     >SOURCEMARKS
     >macro_expansion<end;4><p:4>
     {spaces_after_argument:\\n}
   {normal_text:after\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l22
  |formal_args:A{}
  |macro_name:{trucindexcommand}
   *arguments_line C1
    {macro_line: trucindexcommand \\n}
   {raw:@trucindex\\n}
   *normal_command@end C1 l24
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l26
  |formal_args:A{}
  |macro_name:{codeidx}
   *arguments_line C1
    {macro_line: codeidx \\n}
   {raw:codeidx\\n}
   *normal_command@end C1 l28
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defcodeindex C1 l30
  |misc_args:A{codeidx}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;5><p:1>
     >*macro_call@codeidx C1
      >*brace_arg
    {normal_text:codeidx}
    >SOURCEMARKS
    >macro_expansion<end;5><p:7>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@macro C3 l32
  |formal_args:A{}
  |macro_name:{defcodeindexentry}
   *arguments_line C1
    {macro_line: defcodeindexentry \\n}
   {raw:a @var{index entry} t@\'e @^{@dotless{i}}\\n}
   *normal_command@end C1 l34
   |text_arg:{macro}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:macro}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l36 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C15 l37 {chap}
 |identifier:{chap}
 |is_target:{1}
 |isindex:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;6><p:1>
   >*macro_call@trucindexcommand C1
    >*brace_arg
  *index_entry_command@trucindex C1 l39:@trucindexcommand
  |element_node:{chap}
  |index_entry:I{truc,1}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<end;6>
    {normal_text:index truc}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@codeidxindex C1 l41
  |element_node:{chap}
  |index_entry:I{codeidx,1}
   *line_arg C8
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;7><p:1>
     >*macro_call@defcodeindexentry C1
      >*brace_arg
    {normal_text:a }
    *normal_command@var C1 l41:@defcodeindexentry
     *brace_container C1
      {normal_text:index entry}
    {normal_text: t}
    *normal_command@\' C1 l41:@defcodeindexentry
     *following_arg C1
      {normal_text:e}
    {normal_text: }
    *normal_command@^ C1 l41:@defcodeindexentry
    >SOURCEMARKS
    >macro_expansion<end;7>
     *brace_container C1
      *normal_command@dotless C1 l41:@defcodeindexentry
       *brace_container C1
        {normal_text:i}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@kindex C1 l43
  |element_node:{chap}
  |index_entry:I{ky,1}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;8><p:1>
     >*macro_call@truc C1
      >*brace_arg
    {normal_text:truc kindex}
    >SOURCEMARKS
    >macro_expansion<end;8><p:4>
    {spaces_after_argument:\\n}
  *index_entry_command@pindex C1 l44
  |element_node:{chap}
  |index_entry:I{pg,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:pindex codeidx}
    >SOURCEMARKS
    >macro_expansion<start;9><p:7>
     >*macro_call@codeidx C1
      >*brace_arg
    >macro_expansion<end;9><p:14>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:macro truc\\n}
  *normal_command@printindex C1 l47
  |global_command_number:{1}
  |misc_args:A{truc}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;10><p:1>
     >*macro_call@truc C1
      >*brace_arg
    {normal_text:truc}
    >SOURCEMARKS
    >macro_expansion<end;10><p:4>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:macro cp\\n}
  *normal_command@printindex C1 l50
  |global_command_number:{2}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;11><p:1>
     >*macro_call@cp C1
      >*brace_arg
    {normal_text:cp}
    >SOURCEMARKS
    >macro_expansion<end;11><p:2>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'macro_in_index_commands'} = '@macro cp
cp
@end macro
@macro fn 
fn
@end macro
@macro syncodeindexcommand 
@syncodeindex
@end macro

@syncodeindex cp fn
@syncodeindex cp fn

@macro truc 
truc
@end macro

definedx truc
@defindex truc
after

@macro trucindexcommand 
@trucindex
@end macro

@macro codeidx 
codeidx
@end macro

@defcodeindex codeidx

@macro defcodeindexentry 
a @var{index entry} t@\'e @^{@dotless{i}}
@end macro

@node Top
@node chap

@trucindex index truc

@codeidxindex a @var{index entry} t@\'e @^{@dotless{i}}

@kindex truc kindex
@pindex pindex codeidx

macro truc
@printindex truc

macro cp
@printindex cp

';


$result_texts{'macro_in_index_commands'} = '


definedx truc
after









macro truc

macro cp

';

$result_errors{'macro_in_index_commands'} = '* W l50|printing an index `cp\' merged in another one, `fn\'
 warning: printing an index `cp\' merged in another one, `fn\'

* W l37|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_indices{'macro_in_index_commands'} = 'codeidx C
cp C ->fn
fn C
ky C
pg C
tp C
truc
vr C
';

$result_nodes_list{'macro_in_index_commands'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'macro_in_index_commands'} = '';

$result_sectioning_root{'macro_in_index_commands'} = '';

$result_headings_list{'macro_in_index_commands'} = '';

$result_indices_sort_strings{'macro_in_index_commands'} = 'codeidx:
 a index entry té î
ky:
 truc kindex
pg:
 pindex codeidx
truc:
 index truc
';

1;
