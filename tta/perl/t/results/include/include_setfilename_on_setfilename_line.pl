use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'include_setfilename_on_setfilename_line'} = '*document_root C1
 *before_node_section C1
  *@setfilename C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |text_arg:{file }
   *line_arg C2
    {file }
    *@setfilename C1 l1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    |EXTRA
    |text_arg:{other file }
     *line_arg C2
      {other file }
      *@include C1 l1
      |INFO
      |spaces_before_argument:
       |{spaces_before_argument: }
      |EXTRA
      |text_arg:{are you joking!}
       *line_arg C1
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
        {are you joking!}
';


$result_texis{'include_setfilename_on_setfilename_line'} = '@setfilename file @setfilename other file @include are you joking!
';


$result_texts{'include_setfilename_on_setfilename_line'} = '';

$result_errors{'include_setfilename_on_setfilename_line'} = '* W l1|@setfilename should only appear at the beginning of a line
 warning: @setfilename should only appear at the beginning of a line

* W l1|@setfilename should not appear in @setfilename
 warning: @setfilename should not appear in @setfilename

* W l1|multiple @setfilename
 warning: multiple @setfilename

* W l1|@include should only appear at the beginning of a line
 warning: @include should only appear at the beginning of a line

* W l1|@include should not appear in @setfilename
 warning: @include should not appear in @setfilename

* E l1|@include: could not find are you joking!
 @include: could not find are you joking!

* E l1|bad argument to @setfilename: other file @include are you joking!
 bad argument to @setfilename: other file @include are you joking!

* E l1|bad argument to @setfilename: file @setfilename other file @include are you joking!
 bad argument to @setfilename: file @setfilename other file @include are you joking!

';

$result_nodes_list{'include_setfilename_on_setfilename_line'} = '';

$result_sections_list{'include_setfilename_on_setfilename_line'} = '';

$result_sectioning_root{'include_setfilename_on_setfilename_line'} = '';

$result_headings_list{'include_setfilename_on_setfilename_line'} = '';

1;
