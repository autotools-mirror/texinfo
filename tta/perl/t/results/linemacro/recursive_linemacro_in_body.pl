use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'recursive_linemacro_in_body'} = '*document_root C1
 *before_node_section C3
  *@linemacro C3 l1
  |EXTRA
  |macro_name:{anorecurse}
  |misc_args:A{arg|other}
   *arguments_line C1
    {macro_line: anorecurse {arg, other}\\n}
   {raw:@anorecurse {\\arg\\} d \\other\\\\n}
   *@end C1 l3
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{linemacro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {linemacro}
  {empty_line:\\n}
  {empty_line:\\n}
  >SOURCEMARKS
  >linemacro_expansion<start;1>
   >*linemacro_call@anorecurse C2
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*linemacro_arg C1
     >{bracketed_linemacro_arg:aa}
    >*linemacro_arg C1
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >{macro_call_arg_text:b c}
  >linemacro_expansion<2>
   >*linemacro_call@anorecurse C2
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
    >*linemacro_arg C1
     >{bracketed_linemacro_arg:aa}
    >*linemacro_arg C1
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >{macro_call_arg_text:d b c}
     >>SOURCEMARKS
     >>linemacro_expansion<end;1><p:5>
';


$result_texis{'recursive_linemacro_in_body'} = '@linemacro anorecurse {arg, other}
@anorecurse {\\arg\\} d \\other\\
@end linemacro


';


$result_texts{'recursive_linemacro_in_body'} = '

';

$result_errors{'recursive_linemacro_in_body'} = '* E l5:@anorecurse|recursive call of macro anorecurse is not allowed; use @rmacro if needed
 recursive call of macro anorecurse is not allowed; use @rmacro if needed (possibly involving @anorecurse)

';

$result_nodes_list{'recursive_linemacro_in_body'} = '';

$result_sections_list{'recursive_linemacro_in_body'} = '';

$result_sectioning_root{'recursive_linemacro_in_body'} = '';

$result_headings_list{'recursive_linemacro_in_body'} = '';

1;
