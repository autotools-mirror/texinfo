use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'spaces_info_lost'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *normal_command@display C3 l1
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument:  }
     {normal_text:text on display line}
     {spaces_after_argument: \\n}
   *preformatted C1
    {normal_text:in bad display\\n}
   *normal_command@end C1 l3
   |text_arg:{display}
    *line_arg C3
     {spaces_before_argument:  }
     {normal_text:display}
     {spaces_after_argument: \\n}
  {empty_line:\\n}
  *normal_command@verbatim C3 l5
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:  \\n}
   {raw:in verbatim @g \\n}
   *normal_command@end C1 l7
   |text_arg:{verbatim}
    *line_arg C3
     {spaces_before_argument:  }
     {normal_text:verbatim}
     {spaces_after_argument: \\n}
';


$result_texis{'spaces_info_lost'} = '@display  text on display line 
in bad display
@end  display 

@verbatim  
in verbatim @g 
@end  verbatim 
';


$result_texts{'spaces_info_lost'} = 'in bad display

in verbatim @g 
';

$result_errors{'spaces_info_lost'} = '* W l1|unexpected argument on @display line: text on display line
 warning: unexpected argument on @display line: text on display line

';

$result_nodes_list{'spaces_info_lost'} = '';

$result_sections_list{'spaces_info_lost'} = '';

$result_sectioning_root{'spaces_info_lost'} = '';

$result_headings_list{'spaces_info_lost'} = '';


$result_converted{'xml'}->{'spaces_info_lost'} = '<display endspaces="  "> 
<pre xml:space="preserve">in bad display
</pre></display> 

<verbatim xml:space="preserve" endspaces="  ">  
in verbatim @g 
</verbatim> 
';

1;
