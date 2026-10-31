use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'also_not_line'} = '*document_root C1
 *before_node_section C23
  *preamble_before_beginning C2
   {text_before_beginning:\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C1
   {page }
  *@page C1
   *line_arg C1
    {spaces_before_argument: \\n}
  *paragraph C6
   {noindent }
   *@noindent l4
   {ignorable_spaces_after_command: }
   {refill }
   *@refill
   { something\\n}
  {empty_line:\\n}
  *@noindent l6
  {ignorable_spaces_after_command:     }
  *paragraph C8
  |EXTRA
  |noindent:{1}
   {noindent at beginning of line\\n}
   *@noindent l7
   {ignorable_spaces_after_command:  \\n}
   {noindent on the preceding line\\n}
   {  }
   *@noindent l9
   {ignorable_spaces_after_command:    }
   {noindent after space at beginning of line\\n}
  *@page C1
   *line_arg C3
    {spaces_before_argument:         }
    {rawline_text:page at beginning of line}
    {spaces_after_argument:\\n}
  *@page C1
   *line_arg C1
    {spaces_before_argument:\\n}
  *paragraph C1
   {After page on its own line.\\n}
  {empty_line:\\n}
  *paragraph C1
   {page }
  *@page C1
   *line_arg C1
    {spaces_before_argument:   \\n}
  *paragraph C8
   {noindent }
   *@noindent l15
   {ignorable_spaces_after_command:    }
   {refill }
   *@refill
   { \\n}
   {novalidate }
   *@novalidate C1 l16
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:something}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@subheading C1 l18
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {special}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C3
   {Only valid between iftex:\\n}
   {vskip }
   *@vskip C1
    *line_arg C1
     {spaces_before_argument: \\n}
  {empty_line:\\n}
  *paragraph C1
   {exdent }
  *@exdent C1 l23
   *line_arg C3
    {spaces_before_argument: }
    {line after exdent}
    {spaces_after_argument:\\n}
';


$result_texis{'also_not_line'} = '

page @page 
noindent @noindent refill @refill something

@noindent     noindent at beginning of line
@noindent  
noindent on the preceding line
  @noindent    noindent after space at beginning of line
@page         page at beginning of line
@page
After page on its own line.

page @page   
noindent @noindent    refill @refill 
novalidate @novalidate something

@subheading special

Only valid between iftex:
vskip @vskip 

exdent @exdent line after exdent
';


$result_texts{'also_not_line'} = 'page 
noindent refill  something

noindent at beginning of line
noindent on the preceding line
  noindent after space at beginning of line


After page on its own line.

page 
noindent refill  
novalidate 
special
-------

Only valid between iftex:
vskip 
exdent line after exdent
';

$result_errors{'also_not_line'} = '* W l3|@page should only appear at the beginning of a line
 warning: @page should only appear at the beginning of a line

* W l4|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph

* W l4|@refill is obsolete
 warning: @refill is obsolete

* W l7|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph

* W l9|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph

* W l10|remaining argument on @page line: page at beginning of line
 warning: remaining argument on @page line: page at beginning of line

* W l14|@page should only appear at the beginning of a line
 warning: @page should only appear at the beginning of a line

* W l15|@noindent is useless inside of a paragraph
 warning: @noindent is useless inside of a paragraph

* W l15|@refill is obsolete
 warning: @refill is obsolete

* WC l15|further warnings for @refill suppressed
 warning: further warnings for @refill suppressed

* W l16|@novalidate should only appear at the beginning of a line
 warning: @novalidate should only appear at the beginning of a line

* W l16|remaining argument on @novalidate line: something
 warning: remaining argument on @novalidate line: something

* W l21|@vskip should only appear at the beginning of a line
 warning: @vskip should only appear at the beginning of a line

* W l23|@exdent should only appear at the beginning of a line
 warning: @exdent should only appear at the beginning of a line

';

$result_nodes_list{'also_not_line'} = '';

$result_sections_list{'also_not_line'} = '';

$result_sectioning_root{'also_not_line'} = '';

$result_headings_list{'also_not_line'} = '1|special
';

1;
