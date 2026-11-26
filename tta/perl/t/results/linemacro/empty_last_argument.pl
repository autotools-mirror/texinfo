use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'empty_last_argument'} = '*document_root C1
 *before_node_section C2
  *preamble C3
   *normal_command@defcodeindex C1 l1
   |misc_args:A{BI}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:BI}
     {spaces_after_argument:\\n}
   *normal_command@linemacro C4 l2
   |formal_args:A{symbol|rest}
   |macro_name:{defbuiltin}
    *arguments_line C1
     {macro_line: defbuiltin {symbol, rest}\\n}
    {raw:@BIindex \\symbol\\\\n}
    {raw:@defline Builtin \\symbol\\ \\rest\\\\n}
    *normal_command@end C1 l5
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@defblock C8 l7
   *arguments_line C1
    *block_line_arg C1
    >SOURCEMARKS
    >linemacro_expansion<start;1>
     >*linemacro_call@defbuiltin C2
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:foo}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{bracketed_linemacro_arg:}
     {spaces_before_argument:\\n}
   *before_defline C1
    *index_entry_command@BIindex C1 l8:@defbuiltin
    |index_entry:I{BI,1}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:foo}
      {spaces_after_argument:\\n}
   *normal_command@defline C1 l8:@defbuiltin
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Builtin}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foo}
     {spaces_after_argument: \\n}
     >SOURCEMARKS
     >linemacro_expansion<end;1><p:1>
   *def_item C2
    {empty_line:\\n}
    >SOURCEMARKS
    >linemacro_expansion<start;2><p:1>
     >*linemacro_call@defbuiltin C1
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:foo}
    *index_entry_command@BIindex C1 l10:@defbuiltin
    |index_entry:I{BI,2}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:foo}
      {spaces_after_argument:\\n}
   *normal_command@defline C1 l10:@defbuiltin
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C5
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Builtin}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foo}
     {spaces_after_argument: \\n}
     >SOURCEMARKS
     >linemacro_expansion<end;2><p:1>
   *def_item C2
    {empty_line:\\n}
    >SOURCEMARKS
    >linemacro_expansion<start;3><p:1>
     >*linemacro_call@defbuiltin C2
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{macro_call_arg_text:foo}
      >*linemacro_arg C2
       >{spaces_before_argument: }
       >{bracketed_linemacro_arg:{}}
    *index_entry_command@BIindex C1 l12:@defbuiltin
    |index_entry:I{BI,3}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:foo}
      {spaces_after_argument:\\n}
   *normal_command@defline C1 l12:@defbuiltin
   |def_command:{defline}
   |original_def_cmdname:{defline}
    *line_arg C7
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Builtin}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:foo}
     {spaces: }
     *def_arg C1
      *bracketed_arg l12:@defbuiltin
      >SOURCEMARKS
      >linemacro_expansion<end;3>
     {spaces_after_argument:\\n}
   *normal_command@end C1 l13
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
';


$result_texis{'empty_last_argument'} = '@defcodeindex BI
@linemacro defbuiltin {symbol, rest}
@BIindex \\symbol\\
@defline Builtin \\symbol\\ \\rest\\
@end linemacro

@defblock
@BIindex foo
@defline Builtin foo 

@BIindex foo
@defline Builtin foo 

@BIindex foo
@defline Builtin foo {}
@end defblock
';


$result_texts{'empty_last_argument'} = '
Builtin: foo

Builtin: foo

Builtin: foo 
';

$result_errors{'empty_last_argument'} = '* W l8:@defbuiltin|entry for index `BI\' outside of any node
 warning: entry for index `BI\' outside of any node (possibly involving @defbuiltin)

* W l10:@defbuiltin|entry for index `BI\' outside of any node
 warning: entry for index `BI\' outside of any node (possibly involving @defbuiltin)

* W l12:@defbuiltin|entry for index `BI\' outside of any node
 warning: entry for index `BI\' outside of any node (possibly involving @defbuiltin)

';

$result_indices{'empty_last_argument'} = 'BI C
cp
fn C
ky C
pg C
tp C
vr C
';

$result_nodes_list{'empty_last_argument'} = '';

$result_sections_list{'empty_last_argument'} = '';

$result_sectioning_root{'empty_last_argument'} = '';

$result_headings_list{'empty_last_argument'} = '';

$result_indices_sort_strings{'empty_last_argument'} = 'BI:
 foo
 foo
 foo
';

1;
