use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentlanguagevariant_arguments'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C7
   *@documentlanguagevariant C1 l1
   |EXTRA
   |global_command_number:{1}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:arg}
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C2 l2
   |EXTRA
   |global_command_number:{2}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:one}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:two}
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C2 l3
   |EXTRA
   |global_command_number:{3}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:before comma}
     {spaces_after_argument: }
    *line_arg C1
     {spaces_before_argument:\\n}
   *@documentlanguagevariant C1 l4
   |EXTRA
   |global_command_number:{4}
    *line_arg C1
     {spaces_before_argument:    \\n}
   *@documentlanguagevariant C5 l5
   |EXTRA
   |global_command_number:{5}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:first}
     {spaces_after_argument: }
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:second}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:third}
     {spaces_after_argument: }
    *line_arg C1
     {normal_text:fourth}
    *line_arg C1
     {spaces_before_argument:   \\n}
   *@documentlanguagevariant C1 l6
   |EXTRA
   |global_command_number:{6}
    *line_arg C1
     {spaces_before_argument:\\n}
   *@documentlanguagevariant C2 l7
   |EXTRA
   |global_command_number:{7}
    *line_arg C1
     {spaces_before_argument:   }
    *line_arg C1
     {spaces_before_argument:  \\n}
';


$result_texis{'documentlanguagevariant_arguments'} = '@documentlanguagevariant arg
@documentlanguagevariant one, two
@documentlanguagevariant before comma ,
@documentlanguagevariant    
@documentlanguagevariant first , second, third ,fourth,   
@documentlanguagevariant
@documentlanguagevariant   ,  
';


$result_texts{'documentlanguagevariant_arguments'} = '';

$result_errors{'documentlanguagevariant_arguments'} = '* W l1|unknown language variant: `arg\'
 warning: unknown language variant: `arg\'

* W l2|unknown language variant: `one\'
 warning: unknown language variant: `one\'

* W l2|unknown language variant: `two\'
 warning: unknown language variant: `two\'

* W l3|bad number 1 argument to @documentlanguagevariant
 warning: bad number 1 argument to @documentlanguagevariant

* W l5|unknown language variant: `first\'
 warning: unknown language variant: `first\'

* W l5|unknown language variant: `second\'
 warning: unknown language variant: `second\'

* W l5|unknown language variant: `third\'
 warning: unknown language variant: `third\'

* W l5|unknown language variant: `fourth\'
 warning: unknown language variant: `fourth\'

';

$result_nodes_list{'documentlanguagevariant_arguments'} = '';

$result_sections_list{'documentlanguagevariant_arguments'} = '';

$result_sectioning_root{'documentlanguagevariant_arguments'} = '';

$result_headings_list{'documentlanguagevariant_arguments'} = '';

1;
