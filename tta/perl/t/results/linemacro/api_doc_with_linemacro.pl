use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'api_doc_with_linemacro'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C7
   *normal_command@linemacro C3 l1
   |EXTRA
   |formal_args:A{param|type}
   |macro_name:{param}
    *arguments_line C1
     {macro_line: param {param, type}\\n}
    {raw:@defline Parameter @var{\\param\\} @code{ : \\type\\}\\n}
    *normal_command@end C1 l3
    |EXTRA
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   *normal_command@linemacro C3 l4
   |EXTRA
   |formal_args:A{param|type}
   |macro_name:{returns}
    *arguments_line C1
     {macro_line: returns {param, type}\\n}
    {raw:@defline {Return Value} @var{\\param\\} @code{ : \\type\\}\\n}
    *normal_command@end C1 l6
    |EXTRA
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   *normal_command@linemacro C3 l7
   |EXTRA
   |formal_args:A{exception}
   |macro_name:{raises}
    *arguments_line C1
     {macro_line: raises {exception}\\n}
    {raw:@defline {Exception} \\exception\\\\n}
    *normal_command@end C1 l9
    |EXTRA
    |text_arg:{linemacro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:linemacro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@set C1
   |EXTRA
   |misc_args:A{txidefnamenospace|}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:txidefnamenospace}
     {spaces_after_argument:\\n}
   *normal_command@clear C1
   |EXTRA
   |misc_args:A{txicodevaristt}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:txicodevaristt}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *normal_command@defblock C4 l14
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *normal_command@defline C1 l15
   |EXTRA
   |def_command:{defline}
   |omit_def_name_space:{1}
   |original_def_cmdname:{defline}
    *line_arg C21
     {spaces_before_argument: }
     *def_category C1
      *def_line_arg C1
       {normal_text:Function}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {normal_text:fft.fft}
     {spaces: }
     {delimiter:(}
     *def_arg C1
      *def_line_arg C1
       {normal_text:a}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:n=}
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l15
        *brace_container C1
         {normal_text:None}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:axis=}
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l15
        *brace_container C1
         {normal_text:-1}
     {delimiter:,}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {normal_text:norm=}
     *def_arg C1
      *def_line_arg C1
       *normal_command@code C1 l15
        *brace_container C1
         {normal_text:None}
     {delimiter:)}
     {spaces_after_argument:\\n}
   *def_item C4
    *paragraph C1
     {normal_text:Compute the one-dimensional discrete Fourier Transform.\\n}
    {empty_line:\\n}
    *normal_command@defblock C12 l18
     *arguments_line C1
      *block_line_arg C1
      >SOURCEMARKS
      >linemacro_expansion<start;1>
       >*linemacro_call@param C2
        >*linemacro_arg C2
         >{spaces_before_argument: }
         >{macro_call_arg_text:a}
        >*linemacro_arg C2
         >{spaces_before_argument: }
         >{macro_call_arg_text:array_like}
       {spaces_before_argument:\\n}
     *normal_command@defline C1 l19:@param
     |EXTRA
     |def_command:{defline}
     |omit_def_name_space:{1}
     |original_def_cmdname:{defline}
      *line_arg C7
       {spaces_before_argument: }
       *def_category C1
        *def_line_arg C1
         {normal_text:Parameter}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         *normal_command@var C1 l19:@param
          *brace_container C1
           {normal_text:a}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         *normal_command@code C1 l19:@param
         >SOURCEMARKS
         >linemacro_expansion<end;1>
          *brace_container C1
           {normal_text: : array_like}
       {spaces_after_argument:\\n}
     *def_item C2
      *paragraph C1
       {normal_text:Input array, can be complex.\\n}
      {empty_line:\\n}
      >SOURCEMARKS
      >linemacro_expansion<start;2><p:1>
       >*linemacro_call@param C2
        >*linemacro_arg C2
         >{spaces_before_argument: }
         >{macro_call_arg_text:n}
        >*linemacro_arg C2
         >{spaces_before_argument: }
         >{macro_call_arg_text:int, optional}
     *normal_command@defline C1 l22:@param
     |EXTRA
     |def_command:{defline}
     |omit_def_name_space:{1}
     |original_def_cmdname:{defline}
      *line_arg C7
       {spaces_before_argument: }
       *def_category C1
        *def_line_arg C1
         {normal_text:Parameter}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         *normal_command@var C1 l22:@param
          *brace_container C1
           {normal_text:n}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         *normal_command@code C1 l22:@param
         >SOURCEMARKS
         >linemacro_expansion<end;2>
          *brace_container C1
           {normal_text: : int, optional}
       {spaces_after_argument:\\n}
     *def_item C2
      *paragraph C4
       {normal_text:Length of the transformed axis of the output.\\n}
       {normal_text:If }
       *normal_command@var C1 l24
        *brace_container C1
         {normal_text:n}
       {normal_text: is smaller than the length of the input, the input is cropped.\\n}
      {empty_line:\\n}
      >SOURCEMARKS
      >linemacro_expansion<start;3><p:1>
       >*linemacro_call@param C2
        >*linemacro_arg C2
         >{spaces_before_argument: }
         >{macro_call_arg_text:axis}
        >*linemacro_arg C2
         >{spaces_before_argument: }
         >{macro_call_arg_text:int, optional}
     *normal_command@defline C1 l26:@param
     |EXTRA
     |def_command:{defline}
     |omit_def_name_space:{1}
     |original_def_cmdname:{defline}
      *line_arg C7
       {spaces_before_argument: }
       *def_category C1
        *def_line_arg C1
         {normal_text:Parameter}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         *normal_command@var C1 l26:@param
          *brace_container C1
           {normal_text:axis}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         *normal_command@code C1 l26:@param
         >SOURCEMARKS
         >linemacro_expansion<end;3>
          *brace_container C1
           {normal_text: : int, optional}
       {spaces_after_argument:\\n}
     *def_item C2
      *paragraph C1
       {normal_text:Axis over which to compute the FFT.\\n}
      {empty_line:\\n}
      >SOURCEMARKS
      >linemacro_expansion<start;4><p:1>
       >*linemacro_call@returns C2
        >*linemacro_arg C2
         >{spaces_before_argument: }
         >{macro_call_arg_text:out}
        >*linemacro_arg C2
         >{spaces_before_argument: }
         >{macro_call_arg_text:complex ndarray}
     *normal_command@defline C1 l29:@returns
     |EXTRA
     |def_command:{defline}
     |omit_def_name_space:{1}
     |original_def_cmdname:{defline}
      *line_arg C7
       {spaces_before_argument: }
       *def_category C1
        *bracketed_arg C1 l29:@returns
         {normal_text:Return Value}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         *normal_command@var C1 l29:@returns
          *brace_container C1
           {normal_text:out}
       {spaces: }
       *def_arg C1
        *def_line_arg C1
         *normal_command@code C1 l29:@returns
         >SOURCEMARKS
         >linemacro_expansion<end;4>
          *brace_container C1
           {normal_text: : complex ndarray}
       {spaces_after_argument:\\n}
     *def_item C2
      *paragraph C1
       {normal_text:The truncated or zero-padded input.\\n}
      {empty_line:\\n}
      >SOURCEMARKS
      >linemacro_expansion<start;5><p:1>
       >*linemacro_call@raises C1
        >*linemacro_arg C2
         >{spaces_before_argument: }
         >{macro_call_arg_text:IndexError}
     *normal_command@defline C1 l32:@raises
     |EXTRA
     |def_command:{defline}
     |omit_def_name_space:{1}
     |original_def_cmdname:{defline}
      *line_arg C5
       {spaces_before_argument: }
       *def_category C1
        *bracketed_arg C1 l32:@raises
         {normal_text:Exception}
       {spaces: }
       *def_name C1
        *def_line_arg C1
         {normal_text:IndexError}
         >SOURCEMARKS
         >linemacro_expansion<end;5><p:10>
       {spaces_after_argument:\\n}
     *def_item C2
      *paragraph C5
       {normal_text:If }
       *normal_command@var C1 l33
        *brace_container C1
         {normal_text:axis}
       {normal_text: is not a valid axis of }
       *normal_command@var C1 l33
        *brace_container C1
         {normal_text:a}
       {normal_text:.\\n}
      {empty_line:\\n}
     *normal_command@end C1 l35
     |EXTRA
     |text_arg:{defblock}
      *line_arg C3
       {spaces_before_argument: }
       {normal_text:defblock}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
   *normal_command@end C1 l37
   |EXTRA
   |text_arg:{defblock}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:defblock}
     {spaces_after_argument:\\n}
';


$result_texis{'api_doc_with_linemacro'} = '@linemacro param {param, type}
@defline Parameter @var{\\param\\} @code{ : \\type\\}
@end linemacro
@linemacro returns {param, type}
@defline {Return Value} @var{\\param\\} @code{ : \\type\\}
@end linemacro
@linemacro raises {exception}
@defline {Exception} \\exception\\
@end linemacro

@set txidefnamenospace
@clear txicodevaristt

@defblock
@defline Function fft.fft (a, n=@code{None}, axis=@code{-1}, norm=@code{None})
Compute the one-dimensional discrete Fourier Transform.

@defblock
@defline Parameter @var{a} @code{ : array_like}
Input array, can be complex.

@defline Parameter @var{n} @code{ : int, optional}
Length of the transformed axis of the output.
If @var{n} is smaller than the length of the input, the input is cropped.

@defline Parameter @var{axis} @code{ : int, optional}
Axis over which to compute the FFT.

@defline {Return Value} @var{out} @code{ : complex ndarray}
The truncated or zero-padded input.

@defline {Exception} IndexError
If @var{axis} is not a valid axis of @var{a}.

@end defblock

@end defblock
';


$result_texts{'api_doc_with_linemacro'} = '

Function: fft.fft (a, n=None, axis=-1, norm=None)
Compute the one-dimensional discrete Fourier Transform.

Parameter: a  : array_like
Input array, can be complex.

Parameter: n  : int, optional
Length of the transformed axis of the output.
If n is smaller than the length of the input, the input is cropped.

Parameter: axis  : int, optional
Axis over which to compute the FFT.

Return Value: out  : complex ndarray
The truncated or zero-padded input.

Exception: IndexError
If axis is not a valid axis of a.


';

$result_errors{'api_doc_with_linemacro'} = '';

$result_nodes_list{'api_doc_with_linemacro'} = '';

$result_sections_list{'api_doc_with_linemacro'} = '';

$result_sectioning_root{'api_doc_with_linemacro'} = '';

$result_headings_list{'api_doc_with_linemacro'} = '';

1;
