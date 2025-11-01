use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'section_on_multitable_line'} = '*document_root C4
 *before_node_section C1
  *@multitable C1 l1
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{0}
   *arguments_line C1
    *block_line_arg
 *@section C3 l1 {first}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{1}
 |section_level:{2}
 |section_number:{1}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {first}
  {empty_line:\\n}
  *@multitable C1 l3
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{0}
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     *@code C1 l3
      *brace_container C1
       {this}
 *@section C3 l3 {second}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{2}
 |section_level:{2}
 |section_number:{2}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {second}
  {empty_line:\\n}
  *@multitable C1 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
  |EXTRA
  |max_columns:{2}
   *arguments_line C1
    *block_line_arg C3
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
     *bracketed_arg C1 l5
      {aaa}
     { }
     *bracketed_arg C1 l5
      {bbb}
 *@section C1 l5 {third}
 |INFO
 |spaces_before_argument:
  |{spaces_before_argument: }
 |EXTRA
 |section_heading_number:{3}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C1
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {third}
';


$result_texis{'section_on_multitable_line'} = '@multitable @section first

@multitable @code{this} @section second

@multitable {aaa} {bbb} @section third
';


$result_texts{'section_on_multitable_line'} = '1 first
=======

2 second
========

3 third
=======
';

$result_errors{'section_on_multitable_line'} = '* W l1|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l1|@section should not appear on @multitable line
 warning: @section should not appear on @multitable line

* W l1|empty multitable
 warning: empty multitable

* E l1|@section seen before @end multitable
 @section seen before @end multitable

* W l3|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l3|@section should not appear on @multitable line
 warning: @section should not appear on @multitable line

* W l3|unexpected argument on @multitable line: @code{this}
 warning: unexpected argument on @multitable line: @code{this}

* W l3|empty multitable
 warning: empty multitable

* E l3|@section seen before @end multitable
 @section seen before @end multitable

* W l5|@section should only appear at the beginning of a line
 warning: @section should only appear at the beginning of a line

* W l5|@section should not appear on @multitable line
 warning: @section should not appear on @multitable line

* E l5|@section seen before @end multitable
 @section seen before @end multitable

';

$result_nodes_list{'section_on_multitable_line'} = '';

$result_sections_list{'section_on_multitable_line'} = '1|first
 section_directions:
  next->second
 toplevel_directions:
  next->second
2|second
 section_directions:
  next->third
  prev->first
 toplevel_directions:
  next->third
  prev->first
3|third
 section_directions:
  prev->second
 toplevel_directions:
  prev->second
';

$result_sectioning_root{'section_on_multitable_line'} = 'level: 1
list:
 1|first
 2|second
 3|third
';

$result_headings_list{'section_on_multitable_line'} = '';


$result_converted{'plaintext'}->{'section_on_multitable_line'} = '1 first
=======

2 second
========

3 third
=======

';


$result_converted{'xml'}->{'section_on_multitable_line'} = '<multitable spaces=" ">
</multitable>
<section spaces=" "><sectiontitle>first</sectiontitle>

<multitable spaces=" "><columnprototypes><code>this</code></columnprototypes> 
</multitable>
</section>
<section spaces=" "><sectiontitle>second</sectiontitle>

<multitable spaces=" "><columnprototypes><columnprototype bracketed="on">aaa</columnprototype> <columnprototype bracketed="on">bbb</columnprototype></columnprototypes> 
</multitable>
</section>
<section spaces=" "><sectiontitle>third</sectiontitle>
</section>
';

1;
