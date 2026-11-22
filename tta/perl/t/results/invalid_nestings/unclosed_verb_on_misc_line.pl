use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'unclosed_verb_on_misc_line'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C1
   *normal_command@setfilename C1 l1
   |EXTRA
   |text_arg:{name }
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:name }
     *normal_command@verb C1 l1
      *brace_container C3
       {verb_delimiter:f}
       {raw:ile.texi}
       {verb_delimiter:f}
';


$result_texis{'unclosed_verb_on_misc_line'} = '@setfilename name @verb{file.texif}';


$result_texts{'unclosed_verb_on_misc_line'} = '';

$result_errors{'unclosed_verb_on_misc_line'} = '* W l1|@verb should not appear in @setfilename
 warning: @verb should not appear in @setfilename

* E l1|@verb missing closing delimiter sequence: f}
 @verb missing closing delimiter sequence: f}

* E l1|bad argument to @setfilename: name @verb{file.texif}
 bad argument to @setfilename: name @verb{file.texif}

';

$result_nodes_list{'unclosed_verb_on_misc_line'} = '';

$result_sections_list{'unclosed_verb_on_misc_line'} = '';

$result_sectioning_root{'unclosed_verb_on_misc_line'} = '';

$result_headings_list{'unclosed_verb_on_misc_line'} = '';

1;
