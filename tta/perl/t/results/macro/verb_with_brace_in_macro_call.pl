use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'verb_with_brace_in_macro_call'} = '*document_root C1
 *before_node_section C4
  {empty_line:\\n}
  *@macro C3 l2
  |EXTRA
  |macro_name:{mycommand}
  |misc_args:A{a|b|c}
   *arguments_line C1
    {macro_line: mycommand {a, b, c}\\n}
   {raw:\\a\\|\\b\\|\\c\\\\n}
   *@end C1 l4
   |INFO
   |spaces_before_argument:
    |{spaces_before_argument: }
   |EXTRA
   |text_arg:{macro}
    *line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     {macro}
  {empty_line:\\n}
  >SOURCEMARKS
  >macro_expansion<start;1><p:1>
   >*macro_call@mycommand C2
   >|INFO
   >|spaces_after_cmd_before_arg:
    >|{spaces_after_cmd_before_arg: }
    >*brace_arg C1
     >{macro_call_arg_text:@verb{: in }}
    >*brace_arg C1
    >|INFO
    >|spaces_before_argument:
     >|{spaces_before_argument: }
     >{macro_call_arg_text:verb :}
  *paragraph C1
   *@verb C1 l6:@mycommand
   |INFO
   |delimiter:{:}
    *brace_container C3
     {raw: in }|verb :|}
     >SOURCEMARKS
     >macro_expansion<end;1><p:13>
     {raw:, other, last}\\n}
     {raw:\\n}
';


$result_texis{'verb_with_brace_in_macro_call'} = '
@macro mycommand {a, b, c}
\\a\\|\\b\\|\\c\\
@end macro

@verb{: in }|verb :|, other, last}

:}';


$result_texts{'verb_with_brace_in_macro_call'} = '

 in }|verb :|, other, last}

';

$result_errors{'verb_with_brace_in_macro_call'} = '* E l6:@mycommand|@verb missing closing delimiter sequence: :}
 @verb missing closing delimiter sequence: :} (possibly involving @mycommand)

';

$result_nodes_list{'verb_with_brace_in_macro_call'} = '';

$result_sections_list{'verb_with_brace_in_macro_call'} = '';

$result_sectioning_root{'verb_with_brace_in_macro_call'} = '';

$result_headings_list{'verb_with_brace_in_macro_call'} = '';

1;
