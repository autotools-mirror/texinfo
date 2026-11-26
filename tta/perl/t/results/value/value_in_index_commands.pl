use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'value_in_index_commands'} = '*document_root C3
 *before_node_section C11
  *preamble C9
   *normal_command@set C1
   |misc_args:A{cp|cp}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:cp cp}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |misc_args:A{fn|fn}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:fn fn}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |misc_args:A{syncodeindex_command|@syncodeindex}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:syncodeindex_command @syncodeindex}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@syncodeindex C1 l5
   |misc_args:A{cp|fn}
   >SOURCEMARKS
   >value_expansion<start;3>{@syncodeindex}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:syncodeindex_command}
    *line_arg C3
     {spaces_before_argument: }
     >SOURCEMARKS
     >value_expansion<start;1><p:1>{cp}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:cp}
     {normal_text:cp fn}
     >SOURCEMARKS
     >value_expansion<end;1><p:2>
     >value_expansion<start;2><p:3>{fn}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:fn}
     >value_expansion<end;2><p:5>
     {spaces_after_argument:\\n}
   *normal_command@syncodeindex C1 l6
   |misc_args:A{cp|fn}
    *line_arg C3
     {spaces_before_argument: }
     >SOURCEMARKS
     >value_expansion<end;3>
     {normal_text:cp fn}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@set C1
   |misc_args:A{truc|truc}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:truc truc}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {normal_text:definedx truc\\n}
   *normal_command@defindex C1 l11
   |misc_args:A{truc}
    *line_arg C3
     {spaces_before_argument: }
     >SOURCEMARKS
     >value_expansion<start;4><p:1>{truc}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:truc}
     {normal_text:truc}
     >SOURCEMARKS
     >value_expansion<end;4><p:4>
     {spaces_after_argument:\\n}
   {normal_text:after\\n}
  {empty_line:\\n}
  *normal_command@set C1
  |misc_args:A{trucindex_command|@trucindex}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:trucindex_command @trucindex}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@set C1
  |misc_args:A{codeidx|codeidx}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:codeidx codeidx}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@defcodeindex C1 l18
  |misc_args:A{codeidx}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;5><p:1>{codeidx}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:codeidx}
    {normal_text:codeidx}
    >SOURCEMARKS
    >value_expansion<end;5><p:7>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@set C1
  |misc_args:A{defcodeindex_entry|a @var{index entry} t@\'e @^{@dotless{i}}}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:defcodeindex_entry a @var{index entry} t@\'e @^{@dotless{i}}}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l22 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@node C14 l23 {chap}
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
  >value_expansion<start;6><p:1>{@trucindex}
   >*normal_command@value C1
    >*brace_container C1
     >{normal_text:trucindex_command}
  *index_entry_command@trucindex C1 l25
  |element_node:{chap}
  |index_entry:I{truc,1}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<end;6>
    {normal_text:index truc}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@codeidxindex C1 l27
  |element_node:{chap}
  |index_entry:I{codeidx,1}
   *line_arg C8
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;7><p:1>{a @var{index entry} t@\'e @^{@dotless{i}}}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:defcodeindex_entry}
    {normal_text:a }
    *normal_command@var C1 l27
     *brace_container C1
      {normal_text:index entry}
    {normal_text: t}
    *normal_command@\' C1 l27
     *following_arg C1
      {normal_text:e}
    {normal_text: }
    *normal_command@^ C1 l27
    >SOURCEMARKS
    >value_expansion<end;7>
     *brace_container C1
      *normal_command@dotless C1 l27
       *brace_container C1
        {normal_text:i}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *index_entry_command@kindex C1 l29
  |element_node:{chap}
  |index_entry:I{ky,1}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;8><p:1>{truc}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:truc}
    {normal_text:truc kindex}
    >SOURCEMARKS
    >value_expansion<end;8><p:4>
    {spaces_after_argument:\\n}
  *index_entry_command@pindex C1 l30
  |element_node:{chap}
  |index_entry:I{pg,1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:pindex codeidx}
    >SOURCEMARKS
    >value_expansion<start;9><p:7>{codeidx}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:codeidx}
    >value_expansion<end;9><p:14>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:value truc\\n}
  *normal_command@printindex C1 l33
  |global_command_number:{1}
  |misc_args:A{truc}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;10><p:1>{truc}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:truc}
    {normal_text:truc}
    >SOURCEMARKS
    >value_expansion<end;10><p:4>
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:value cp\\n}
  *normal_command@printindex C1 l36
  |global_command_number:{2}
  |misc_args:A{cp}
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >value_expansion<start;11><p:1>{cp}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:cp}
    {normal_text:cp}
    >SOURCEMARKS
    >value_expansion<end;11><p:2>
    {spaces_after_argument:\\n}
';


$result_texis{'value_in_index_commands'} = '@set cp cp
@set fn fn
@set syncodeindex_command @syncodeindex

@syncodeindex cp fn
@syncodeindex cp fn

@set truc truc

definedx truc
@defindex truc
after

@set trucindex_command @trucindex

@set codeidx codeidx

@defcodeindex codeidx

@set defcodeindex_entry a @var{index entry} t@\'e @^{@dotless{i}}

@node Top
@node chap

@trucindex index truc

@codeidxindex a @var{index entry} t@\'e @^{@dotless{i}}

@kindex truc kindex
@pindex pindex codeidx

value truc
@printindex truc

value cp
@printindex cp
';


$result_texts{'value_in_index_commands'} = '


definedx truc
after









value truc

value cp
';

$result_errors{'value_in_index_commands'} = '* W l36|printing an index `cp\' merged in another one, `fn\'
 warning: printing an index `cp\' merged in another one, `fn\'

* W l23|node `chap\' not in menu
 warning: node `chap\' not in menu

';

$result_indices{'value_in_index_commands'} = 'codeidx C
cp C ->fn
fn C
ky C
pg C
tp C
truc
vr C
';

$result_nodes_list{'value_in_index_commands'} = '1|Top
 node_directions:
  next->chap
2|chap
 node_directions:
  prev->Top
';

$result_sections_list{'value_in_index_commands'} = '';

$result_sectioning_root{'value_in_index_commands'} = '';

$result_headings_list{'value_in_index_commands'} = '';

$result_indices_sort_strings{'value_in_index_commands'} = 'codeidx:
 a index entry té î
ky:
 truc kindex
pg:
 pindex codeidx
truc:
 index truc
';

1;
