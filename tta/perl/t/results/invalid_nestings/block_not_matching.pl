use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'block_not_matching'} = '*document_root C1
 *before_node_section C15
  *@quotation C2 l1
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {A quotation\\n}
  {empty_line:\\n}
  *@deffn C2 l5
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *def_line C1 l5
   |EXTRA
   |def_command:{deffn}
   |def_index_element:
    |* C1
     |*def_line_arg C1
      |{print_navigation}
   |index_entry:I{fn,1}
   |original_def_cmdname:{deffn}
    *block_line_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *def_category C1
      *bracketed_arg C1 l5
       {Function Reference}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {print_navigation}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {$filehandle}
   *def_item C1
    *paragraph C1
     {Text\\n}
  {empty_line:\\n}
  *@table C2 l9
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@asis l9
   *table_entry C2
    *table_term C1
     *@item C1 l10
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {item}
    *table_definition C1
     *paragraph C1
      {line\\n}
  {empty_line:\\n}
  *@table C2 l14
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *arguments_line C1
    *block_line_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
     *@emph l14
   *table_entry C2
    *table_term C1
     *@item C1 l15
     |INFO
     |spaces_before_argument:
      |{spaces_before_argument: }
      *line_arg C1
      |INFO
      |spaces_after_argument:
       |{spaces_after_argument:\\n}
       {ref}
    *table_definition C1
     *@example C2 l16
      *arguments_line C1
       *block_line_arg
       |INFO
       |spaces_after_argument:
        |{spaces_after_argument:\\n}
      *preformatted C1
       {example\\n}
  {empty_line:\\n}
  *@group C2 l21
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {in group\\n}
  {empty_line:\\n}
  *@group C2 l25
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {in group 2\\n}
  {empty_line:\\n}
  *@cartouche C2 l29
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {cartouche\\n}
  {empty_line:\\n}
  *@cartouche C2 l33
   *arguments_line C1
    *block_line_arg
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument:\\n}
   *paragraph C1
    {carouche\\n}
';


$result_texis{'block_not_matching'} = '@quotation
A quotation

@deffn {Function Reference} print_navigation $filehandle
Text

@table @asis
@item item
line

@table @emph
@item ref
@example
example

@group
in group

@group
in group 2

@cartouche
cartouche

@cartouche
carouche
';


$result_texts{'block_not_matching'} = 'A quotation

Function Reference: print_navigation $filehandle
Text

item
line

ref
example

in group

in group 2

cartouche

carouche
';

$result_errors{'block_not_matching'} = '* E l3|`@end\' expected `quotation\', but saw `cartouche\'
 `@end\' expected `quotation\', but saw `cartouche\'

* E l3|unmatched `@end cartouche\'
 unmatched `@end cartouche\'

* W l5|entry for index `fn\' outside of any node
 warning: entry for index `fn\' outside of any node

* E l7|`@end\' expected `deffn\', but saw `deftypefun\'
 `@end\' expected `deffn\', but saw `deftypefun\'

* E l7|unmatched `@end deftypefun\'
 unmatched `@end deftypefun\'

* E l12|`@end\' expected `table\', but saw `vtable\'
 `@end\' expected `table\', but saw `vtable\'

* E l12|unmatched `@end vtable\'
 unmatched `@end vtable\'

* E l18|`@end\' expected `example\', but saw `display\'
 `@end\' expected `example\', but saw `display\'

* E l18|`@end\' expected `table\', but saw `display\'
 `@end\' expected `table\', but saw `display\'

* E l18|unmatched `@end display\'
 unmatched `@end display\'

* E l19|unmatched `@end table\'
 unmatched `@end table\'

* E l23|`@end\' expected `group\', but saw `table\'
 `@end\' expected `group\', but saw `table\'

* E l23|unmatched `@end table\'
 unmatched `@end table\'

* E l27|`@end\' expected `group\', but saw `cartouche\'
 `@end\' expected `group\', but saw `cartouche\'

* E l27|unmatched `@end cartouche\'
 unmatched `@end cartouche\'

* E l31|`@end\' expected `cartouche\', but saw `group\'
 `@end\' expected `cartouche\', but saw `group\'

* E l31|unmatched `@end group\'
 unmatched `@end group\'

* E l35|`@end\' expected `cartouche\', but saw `float\'
 `@end\' expected `cartouche\', but saw `float\'

* E l35|unmatched `@end float\'
 unmatched `@end float\'

';

$result_nodes_list{'block_not_matching'} = '';

$result_sections_list{'block_not_matching'} = '';

$result_sectioning_root{'block_not_matching'} = '';

$result_headings_list{'block_not_matching'} = '';

$result_indices_sort_strings{'block_not_matching'} = 'fn:
 print_navigation
';

1;
