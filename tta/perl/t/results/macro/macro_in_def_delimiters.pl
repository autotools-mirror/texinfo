use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_in_def_delimiters'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C2
   *@macro C3 l1
   |EXTRA
   |formal_args:A{}
   |macro_name:{string}
    *arguments_line C1
     {macro_line: string\\n}
    {raw:aa(b *c)\\n}
    *@end C1 l3
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
  *@deffn C1 l5
   *def_line C1 l5
   |EXTRA
   |def_command:{deffn}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C40
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Command}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:forward-word}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:count}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:argaa}
       >SOURCEMARKS
       >macro_expansion<start;1><p:3>
        >*macro_call@string C1
         >*brace_arg
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:*c}
     {delimiter:)}
     >SOURCEMARKS
     >macro_expansion<end;1><p:1>
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
     {spaces: }
     {delimiter:(}
     >SOURCEMARKS
     >macro_expansion<start;2><p:1>
      >*macro_call@string C1
       >*brace_arg
     *def_arg C1
      *def_line_arg C1
       {normal_text:aa}
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:*c}
     {delimiter:)}
     >SOURCEMARKS
     >macro_expansion<end;2><p:1>
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:bbaa}
       >SOURCEMARKS
       >macro_expansion<start;3><p:2>
        >*macro_call@string C1
         >*brace_arg
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:*c}
     {delimiter:)}
     >SOURCEMARKS
     >macro_expansion<end;3><p:1>
     {delimiter:]}
     >SOURCEMARKS
     >macro_expansion<start;4><p:1>
      >*macro_call@string C1
       >*brace_arg
     *def_arg C1
      *def_line_arg C1
       {normal_text:aa}
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:b}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:*c}
     {delimiter:)}
     >SOURCEMARKS
     >macro_expansion<end;4><p:1>
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
     {spaces_after_argument:\\n}
';


$result_texis{'macro_in_def_delimiters'} = '@macro string
aa(b *c)
@end macro

@deffn Command forward-word count argaa(b *c) a (aa(b *c)(bbaa(b *c)]aa(b *c) a
';


$result_texts{'macro_in_def_delimiters'} = '
Command: forward-word count argaa(b *c) a (aa(b *c)(bbaa(b *c)]aa(b *c) a
';

$result_errors{'macro_in_def_delimiters'} = '* W l5|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l5|no matching `@end deffn\'
 no matching `@end deffn\'

';

$result_nodes_list{'macro_in_def_delimiters'} = '';

$result_sections_list{'macro_in_def_delimiters'} = '';

$result_sectioning_root{'macro_in_def_delimiters'} = '';

$result_headings_list{'macro_in_def_delimiters'} = '';

$result_indices_sort_strings{'macro_in_def_delimiters'} = 'fn:
 forward-word
';

1;
