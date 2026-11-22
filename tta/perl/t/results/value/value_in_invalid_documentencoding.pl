use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'value_in_invalid_documentencoding'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@set C1
   |EXTRA
   |misc_args:A{badvalue|bad}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:badvalue bad}
     {spaces_after_argument:\\n}
   *normal_command@documentencoding C1 l2
   |EXTRA
   |global_command_number:{1}
   |text_arg:{bad}
    *line_arg C3
     {spaces_before_argument: }
     >SOURCEMARKS
     >value_expansion<start;1><p:1>{bad}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:badvalue}
     {normal_text:bad}
     >SOURCEMARKS
     >value_expansion<end;1><p:3>
     {spaces_after_argument:\\n}
';


$result_texis{'value_in_invalid_documentencoding'} = '@set badvalue bad
@documentencoding bad
';


$result_texts{'value_in_invalid_documentencoding'} = '';

$result_errors{'value_in_invalid_documentencoding'} = '* W l2|encoding `bad\' is not a canonical texinfo encoding
 warning: encoding `bad\' is not a canonical texinfo encoding

* W l2|unhandled encoding name `bad\'
 warning: unhandled encoding name `bad\'

';

$result_nodes_list{'value_in_invalid_documentencoding'} = '';

$result_sections_list{'value_in_invalid_documentencoding'} = '';

$result_sectioning_root{'value_in_invalid_documentencoding'} = '';

$result_headings_list{'value_in_invalid_documentencoding'} = '';

1;
