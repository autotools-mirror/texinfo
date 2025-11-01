use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'double_include'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  >SOURCEMARKS
  >include<start;2><p:1>
   >*@include C1 l2
   >|INFO
   >|spaces_before_argument:
    >|{spaces_before_argument: }
   >|EXTRA
   >|text_arg:{inc_file.texi}
    >*line_arg C1
    >|INFO
    >|spaces_after_argument:
     >|{spaces_after_argument: }
     >|>SOURCEMARKS
     >|>include<start;1><p:1>
      >|>*@include C1 l2
      >|>|INFO
      >|>|spaces_before_argument:
       >|>|{spaces_before_argument: }
      >|>|EXTRA
      >|>|text_arg:{inc_file.texi}
       >|>*line_arg C1
       >|>|INFO
       >|>|spaces_after_argument:
        >|>|{spaces_after_argument:\\n}
        >|>{inc_file.texi}
     >{inc_file.texi}
  *paragraph C2
   {In included file.\\n}
   >SOURCEMARKS
   >include<end;2><p:18>
   {In included file.\\n}
   >SOURCEMARKS
   >include<end;1><p:18>
';


$result_texis{'double_include'} = '
In included file.
In included file.
';


$result_texts{'double_include'} = '
In included file.
In included file.
';

$result_errors{'double_include'} = '* W l2|@include should only appear at the beginning of a line
 warning: @include should only appear at the beginning of a line

* W l2|@include should not appear in @include
 warning: @include should not appear in @include

';

$result_nodes_list{'double_include'} = '';

$result_sections_list{'double_include'} = '';

$result_sectioning_root{'double_include'} = '';

$result_headings_list{'double_include'} = '';

1;
