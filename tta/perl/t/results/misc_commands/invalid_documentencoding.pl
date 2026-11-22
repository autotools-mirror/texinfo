use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'invalid_documentencoding'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content C5
   *@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:this one is valid}
     {spaces_after_argument:\\n}
   *@documentencoding C1 l2
   |EXTRA
   |global_command_number:{1}
   |text_arg:{us-ascii}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:us-ascii}
     *@asis C1 l2
      *brace_container
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@documentencoding C1 l4
   |EXTRA
   |global_command_number:{2}
   |text_arg:{latin1}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:latin1}
     *@asis C1 l4
      *brace_container C1
       {normal_text:a}
     {spaces_after_argument:\\n}
   *@documentencoding C1 l5
   |EXTRA
   |global_command_number:{3}
   |text_arg:{YS-ASCII}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:YS-ASCII}
     {spaces_after_argument:\\n}
  *paragraph C8
   *@@
   {normal_text:documentencoding }
   *@documentencoding C1 l6
   |EXTRA
   |global_command_number:{4}
   |text_arg:{bad encoding name}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:bad encoding name}
     {spaces_after_argument:\\n}
   *@documentencoding C1 l7
   |EXTRA
   |global_command_number:{5}
   |text_arg:{1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:1}
     {spaces_after_argument:\\n}
   *@documentencoding C1 l8
   |EXTRA
   |global_command_number:{6}
   |text_arg:{%}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:%}
     {spaces_after_argument:\\n}
   *@documentencoding C1 l9
   |EXTRA
   |global_command_number:{7}
   |text_arg:{@}
    *line_arg C3
     {spaces_before_argument: }
     *@@
     {spaces_after_argument:\\n}
   *@documentencoding C1 l10
   |EXTRA
   |global_command_number:{8}
   |text_arg:{AAA}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:AAA}
     *@TeX C1 l10
      *brace_container
     {spaces_after_argument:\\n}
   *@documentencoding C1 l11
   |EXTRA
   |global_command_number:{9}
   |text_arg:{BBB}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:BBB}
     *@\' C1 l11
      *following_arg C1
       {normal_text:e}
     {spaces_after_argument:\\n}
';


$result_texis{'invalid_documentencoding'} = '@c this one is valid
@documentencoding us-ascii@asis{}

@documentencoding latin1@asis{a}
@documentencoding YS-ASCII
@@documentencoding @documentencoding bad encoding name
@documentencoding 1
@documentencoding %
@documentencoding @@
@documentencoding AAA@TeX{}
@documentencoding BBB@\'e
';


$result_texts{'invalid_documentencoding'} = '
@documentencoding ';

$result_errors{'invalid_documentencoding'} = '* W l2|@asis should not appear in @documentencoding
 warning: @asis should not appear in @documentencoding

* E l2|bad argument to @documentencoding: us-ascii@asis{}
 bad argument to @documentencoding: us-ascii@asis{}

* W l4|@asis should not appear in @documentencoding
 warning: @asis should not appear in @documentencoding

* E l4|bad argument to @documentencoding: latin1@asis{a}
 bad argument to @documentencoding: latin1@asis{a}

* W l5|encoding `YS-ASCII\' is not a canonical texinfo encoding
 warning: encoding `YS-ASCII\' is not a canonical texinfo encoding

* W l5|unhandled encoding name `YS-ASCII\'
 warning: unhandled encoding name `YS-ASCII\'

* W l6|@documentencoding should only appear at the beginning of a line
 warning: @documentencoding should only appear at the beginning of a line

* W l6|encoding `bad encoding name\' is not a canonical texinfo encoding
 warning: encoding `bad encoding name\' is not a canonical texinfo encoding

* W l6|unhandled encoding name `bad encoding name\'
 warning: unhandled encoding name `bad encoding name\'

* W l7|encoding `1\' is not a canonical texinfo encoding
 warning: encoding `1\' is not a canonical texinfo encoding

* W l7|unhandled encoding name `1\'
 warning: unhandled encoding name `1\'

* W l8|bad encoding name `%\'
 warning: bad encoding name `%\'

* W l9|bad encoding name `@\'
 warning: bad encoding name `@\'

* E l10|bad argument to @documentencoding: AAA@TeX{}
 bad argument to @documentencoding: AAA@TeX{}

* E l11|bad argument to @documentencoding: BBB@\'e
 bad argument to @documentencoding: BBB@\'e

';

$result_nodes_list{'invalid_documentencoding'} = '';

$result_sections_list{'invalid_documentencoding'} = '';

$result_sectioning_root{'invalid_documentencoding'} = '';

$result_headings_list{'invalid_documentencoding'} = '';

1;
