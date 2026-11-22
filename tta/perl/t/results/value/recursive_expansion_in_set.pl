use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'recursive_expansion_in_set'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C2
   *normal_command@set C1
   |EXTRA
   |misc_args:A{V|@value{V}}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:V @value{V}}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >value_expansion<start;1>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;2>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;3>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;4>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;5>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;6>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;7>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;8>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;9>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;10>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;11>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;12>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;13>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;14>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;15>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;16>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;17>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;18>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;19>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;20>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;21>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;22>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;23>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;24>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;25>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;26>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;27>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;28>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;29>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;30>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;31>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;32>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;33>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;34>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;35>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;36>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;37>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;38>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;39>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;40>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;41>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;42>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;43>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;44>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;45>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;46>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;47>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;48>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;49>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;50>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;51>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;52>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;53>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;54>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;55>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;56>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;57>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;58>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;59>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;60>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;61>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;62>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;63>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;64>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;65>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;66>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;67>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;68>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;69>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;70>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;71>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;72>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;73>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;74>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;75>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;76>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;77>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;78>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;79>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;80>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;81>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;82>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;83>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;84>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;85>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;86>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;87>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;88>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;89>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;90>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;91>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;92>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;93>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;94>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;95>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;96>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;97>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;98>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;99>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<start;100>{@value{V}}
    >*normal_command@value C1
     >*brace_container C1
      >{normal_text:V}
   >value_expansion<end;100>
   >value_expansion<end;99>
   >value_expansion<end;98>
   >value_expansion<end;97>
   >value_expansion<end;96>
   >value_expansion<end;95>
   >value_expansion<end;94>
   >value_expansion<end;93>
   >value_expansion<end;92>
   >value_expansion<end;91>
   >value_expansion<end;90>
   >value_expansion<end;89>
   >value_expansion<end;88>
   >value_expansion<end;87>
   >value_expansion<end;86>
   >value_expansion<end;85>
   >value_expansion<end;84>
   >value_expansion<end;83>
   >value_expansion<end;82>
   >value_expansion<end;81>
   >value_expansion<end;80>
   >value_expansion<end;79>
   >value_expansion<end;78>
   >value_expansion<end;77>
   >value_expansion<end;76>
   >value_expansion<end;75>
   >value_expansion<end;74>
   >value_expansion<end;73>
   >value_expansion<end;72>
   >value_expansion<end;71>
   >value_expansion<end;70>
   >value_expansion<end;69>
   >value_expansion<end;68>
   >value_expansion<end;67>
   >value_expansion<end;66>
   >value_expansion<end;65>
   >value_expansion<end;64>
   >value_expansion<end;63>
   >value_expansion<end;62>
   >value_expansion<end;61>
   >value_expansion<end;60>
   >value_expansion<end;59>
   >value_expansion<end;58>
   >value_expansion<end;57>
   >value_expansion<end;56>
   >value_expansion<end;55>
   >value_expansion<end;54>
   >value_expansion<end;53>
   >value_expansion<end;52>
   >value_expansion<end;51>
   >value_expansion<end;50>
   >value_expansion<end;49>
   >value_expansion<end;48>
   >value_expansion<end;47>
   >value_expansion<end;46>
   >value_expansion<end;45>
   >value_expansion<end;44>
   >value_expansion<end;43>
   >value_expansion<end;42>
   >value_expansion<end;41>
   >value_expansion<end;40>
   >value_expansion<end;39>
   >value_expansion<end;38>
   >value_expansion<end;37>
   >value_expansion<end;36>
   >value_expansion<end;35>
   >value_expansion<end;34>
   >value_expansion<end;33>
   >value_expansion<end;32>
   >value_expansion<end;31>
   >value_expansion<end;30>
   >value_expansion<end;29>
   >value_expansion<end;28>
   >value_expansion<end;27>
   >value_expansion<end;26>
   >value_expansion<end;25>
   >value_expansion<end;24>
   >value_expansion<end;23>
   >value_expansion<end;22>
   >value_expansion<end;21>
   >value_expansion<end;20>
   >value_expansion<end;19>
   >value_expansion<end;18>
   >value_expansion<end;17>
   >value_expansion<end;16>
   >value_expansion<end;15>
   >value_expansion<end;14>
   >value_expansion<end;13>
   >value_expansion<end;12>
   >value_expansion<end;11>
   >value_expansion<end;10>
   >value_expansion<end;9>
   >value_expansion<end;8>
   >value_expansion<end;7>
   >value_expansion<end;6>
   >value_expansion<end;5>
   >value_expansion<end;4>
   >value_expansion<end;3>
   >value_expansion<end;2>
   >value_expansion<end;1>
';


$result_texis{'recursive_expansion_in_set'} = '@set V @value{V}

';


$result_texts{'recursive_expansion_in_set'} = '
';

$result_errors{'recursive_expansion_in_set'} = '* W l2|value call nested too deeply (set MAX_MACRO_CALL_NESTING to override; current value 100)
 warning: value call nested too deeply (set MAX_MACRO_CALL_NESTING to override; current value 100)

';

$result_nodes_list{'recursive_expansion_in_set'} = '';

$result_sections_list{'recursive_expansion_in_set'} = '';

$result_sectioning_root{'recursive_expansion_in_set'} = '';

$result_headings_list{'recursive_expansion_in_set'} = '';

1;
