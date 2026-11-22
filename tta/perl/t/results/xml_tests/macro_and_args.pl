use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'macro_and_args'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C3
   *@macro C2 l1
   |EXTRA
   |formal_args:A{aaa|2b-bb}
   |macro_name:{good}
    *arguments_line C1
     {macro_line: good { aaa, 2b-bb}\\n}
    *@end C1 l2
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@macro C2 l4
   |EXTRA
   |formal_args:A{ggg"@@^_ ff|nnn_b|ccc v}
   |invalid_syntax:{1}
   |macro_name:{bad}
    *arguments_line C1
     {macro_line: bad { ggg"@@^_ ff, nnn_b, ccc v}\\n}
    *@end C1 l5
    |EXTRA
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
';


$result_texis{'macro_and_args'} = '@macro good { aaa, 2b-bb}
@end macro

@macro bad { ggg"@@^_ ff, nnn_b, ccc v}
@end macro
';


$result_texts{'macro_and_args'} = '
';

$result_errors{'macro_and_args'} = '* E l4|bad or empty @macro formal argument: ggg"@@^_ ff
 bad or empty @macro formal argument: ggg"@@^_ ff

* E l4|bad or empty @macro formal argument: ccc v
 bad or empty @macro formal argument: ccc v

';

$result_nodes_list{'macro_and_args'} = '';

$result_sections_list{'macro_and_args'} = '';

$result_sectioning_root{'macro_and_args'} = '';

$result_headings_list{'macro_and_args'} = '';


$result_converted{'xml'}->{'macro_and_args'} = '<macro name="good" line=" good { aaa, 2b-bb}" endspaces=" "><formalarg>aaa</formalarg><formalarg>2b-bb</formalarg>
</macro>

<macro name="bad" line=" bad { ggg&quot;@@^_ ff, nnn_b, ccc v}" endspaces=" "><formalarg>ggg&quot;@@^_ ff</formalarg><formalarg>nnn_b</formalarg><formalarg>ccc v</formalarg>
</macro>
';

1;
