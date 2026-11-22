use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'htmlxref_nodes'} = '*document_root C9
 *before_node_section C2
  *preamble_before_beginning C2
   {text_before_beginning:\\input texinfo @c -*-texinfo-*-\\n}
   {text_before_beginning:\\n}
  *preamble_before_content
 *@node C1 test_refs.texi:l3 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@top C41 test_refs.texi:l4 {Test refs}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Test refs}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C3 test_refs.texi:l6
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 test_refs.texi:l7
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{other-nodes}
     {normal_text:other nodes}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 test_refs.texi:l8
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@subheading C1 test_refs.texi:l10
  |EXTRA
  |global_command_number:{1}
  |heading_number:{1}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Testing distant nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C5
   *@verb C1 test_refs.texi:l12
    *brace_container C3
     {verb_delimiter::}
     {raw: a  node }
     {verb_delimiter::}
   {normal_text: }
   *@ref C4 test_refs.texi:l12
    *brace_arg C3
    |EXTRA
    |node_content:A{1|1}
     {spaces_before_argument: }
     {normal_text:a  node}
     {spaces_after_argument: }
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:manual}
   *@*
   {normal_text:\\n}
  *@example C3 test_refs.texi:l13
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    {normal_text:mono : manual.html#a-node\\n}
    {normal_text:split: ../manual/a-node.html#a-node\\n}
   *@end C1 test_refs.texi:l16
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@verb C1 test_refs.texi:l18
    *brace_container C3
     {verb_delimiter:;}
     {raw::}
     {verb_delimiter:;}
   {normal_text: }
   *@ref C4 test_refs.texi:l18
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     {normal_text::}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:manual}
   {normal_text:\\n}
  *@example C3 test_refs.texi:l19
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    {normal_text:mono : manual.html#_003a\\n}
    {normal_text:split: ../manual/_003a.html#_003a\\n}
   *@end C1 test_refs.texi:l22
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C5
   *@verb C1 test_refs.texi:l24
    *brace_container C3
     {verb_delimiter::}
     {raw:Top}
     {verb_delimiter::}
   {normal_text: }
   *@ref C4 test_refs.texi:l24
    *brace_arg C3
    |EXTRA
    |node_content:A{1|1}
     {spaces_before_argument: }
     {normal_text:top}
     {spaces_after_argument: }
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:manual}
   *@*
   {normal_text: \\n}
  *@example C3 test_refs.texi:l25
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    {normal_text:mono : manual.html#Top\\n}
    {normal_text:split: ../manual/index.html#Top\\n}
   *@end C1 test_refs.texi:l28
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@subheading C1 test_refs.texi:l30
  |EXTRA
  |global_command_number:{2}
  |heading_number:{2}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Testing manual name}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C5
   *@verb C1 test_refs.texi:l32
    *brace_container C3
     {verb_delimiter::}
     {raw:../manual/doc.texi}
     {verb_delimiter::}
   {normal_text: }
   *@ref C4 test_refs.texi:l32
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     {normal_text:node}
    *brace_arg
    *brace_arg
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:../manual/doc}
   *@*
   {normal_text:\\n}
  *@example C3 test_refs.texi:l33
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C2
    {normal_text:mono : doc.html#node\\n}
    {normal_text:split: ../doc/node.html#node\\n}
   *@end C1 test_refs.texi:l36
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@subheading C1 test_refs.texi:l38
  |EXTRA
  |global_command_number:{3}
  |heading_number:{3}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Testing local nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@verb C1 test_refs.texi:l40
    *brace_container C3
     {verb_delimiter::}
     {raw:!_"#$%&\'()*+-.}
     {verb_delimiter::}
   {normal_text: }
   *@ref C1 test_refs.texi:l40
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
     {normal_text:!_"#$%&\'()*+-.}
   {normal_text:\\n}
  *@example C3 test_refs.texi:l41
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:target: #_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e\\n}
   *@end C1 test_refs.texi:l43
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C5
   *@verb C1 test_refs.texi:l45
    *brace_container C3
     {verb_delimiter::}
     {raw:/;<=>?[\\]^_`|~}
     {verb_delimiter::}
   {normal_text: }
   *@ref C1 test_refs.texi:l45
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
     {normal_text:/;<=>?[\\]^_`|~}
   *@*
   {normal_text:\\n}
  *@example C3 test_refs.texi:l46
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:target: #_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e\\n}
   *@end C1 test_refs.texi:l48
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@verb C1 test_refs.texi:l50
    *brace_container C3
     {verb_delimiter::}
     {raw:Top}
     {verb_delimiter::}
   {normal_text: }
   *@ref C1 test_refs.texi:l50
    *brace_arg C2
    |EXTRA
    |node_content:A{1|1}
    |normalized:{Top}
     {spaces_before_argument: }
     {normal_text:Top}
   {normal_text:\\n}
  *@example C3 test_refs.texi:l51
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:target: #Top\\n}
   *@end C1 test_refs.texi:l53
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@verb C1 test_refs.texi:l55
    *brace_container C3
     {verb_delimiter::}
     {raw: local   node}
     {verb_delimiter::}
   {normal_text: }
   *@ref C1 test_refs.texi:l55
    *brace_arg C2
    |EXTRA
    |node_content:A{1|1}
    |normalized:{local-node}
     {spaces_before_argument:  }
     {normal_text:local   node}
   {normal_text:\\n}
  *@example C3 test_refs.texi:l56
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:target: #local-node\\n}
   *@end C1 test_refs.texi:l58
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:before 2026 was a reference to the mtexinfo external manual}
    {spaces_after_argument:\\n}
  *paragraph C4
   *@verb C1 test_refs.texi:l61
    *brace_container C3
     {verb_delimiter::}
     {raw:(mtexinfo)Cross References}
     {verb_delimiter::}
   {normal_text: }
   *@ref C1 test_refs.texi:l61
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0028mtexinfo_0029Cross-References}
     {normal_text:(mtexinfo)Cross References}
   {normal_text:\\n}
  *@example C3 test_refs.texi:l62
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:target: #_0028mtexinfo_0029Cross-References\\n}
   *@end C1 test_refs.texi:l64
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@anchor C1 test_refs.texi:l66
  |EXTRA
  |identifier:{_0028mtexinfo_0029Cross-References}
  |is_target:{1}
   *brace_arg C1
    {normal_text:(mtexinfo)Cross References}
  {spaces_after_close_brace:\\n}
  {empty_line:\\n}
 *@node C1 test_refs.texi:l68 {other nodes}
 |EXTRA
 |identifier:{other-nodes}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:other nodes}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
    {spaces_before_argument: }
    {normal_text:!_"#$%&\'()*+-.}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{Top}
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *@chapter C9 test_refs.texi:l69 {Chapter with nodes}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter with nodes}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@example C3 test_refs.texi:l71
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:id: other-nodes\\n}
   *@end C1 test_refs.texi:l73
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C4
   *@verb C1 test_refs.texi:l75
    *brace_container C3
     {verb_delimiter::}
     {raw:Top}
     {verb_delimiter::}
   {normal_text: }
   *@ref C1 test_refs.texi:l75
    *brace_arg C2
    |EXTRA
    |node_content:A{1|1}
    |normalized:{Top}
     {spaces_before_argument: }
     {normal_text:Top}
   {normal_text:\\n}
  *@example C3 test_refs.texi:l76
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:target: #Top\\n}
   *@end C1 test_refs.texi:l78
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 test_refs.texi:l80
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 test_refs.texi:l81
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
     {normal_text:!_"#$%&\'()*+-.}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 test_refs.texi:l82
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
     {normal_text:/;<=>?[\\]^_`|~}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 test_refs.texi:l83
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{local-node}
     {normal_text:local node}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 test_refs.texi:l84
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C3 test_refs.texi:l86 {!_"#$%&\'()*+-.}
 |EXTRA
 |identifier:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:!_"#$%&\'()*+-.}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
    {spaces_before_argument: }
    {normal_text:/;<=>?[\\]^_`|~}
   *line_arg C2
   |EXTRA
   |node_content:A{1|1}
   |normalized:{other-nodes}
    {spaces_before_argument: }
    {normal_text:other nodes}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{other-nodes}
    {spaces_before_argument: }
    {normal_text:other nodes}
    {spaces_after_argument:\\n}
  *@example C3 test_refs.texi:l87
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:id: _0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e\\n}
   *@end C1 test_refs.texi:l89
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C3 test_refs.texi:l91 {/;<=>?[\\]^_`|~}
 |EXTRA
 |identifier:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument: }
    {normal_text:/;<=>?[\\]^_`|~}
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{local-node}
    {normal_text:local   node}
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e}
    {normal_text:!_"#$%&\'()*+-.}
   *line_arg C3
   |EXTRA
   |node_content:A{1|1}
   |normalized:{other-nodes}
    {spaces_before_argument: }
    {normal_text:other nodes}
    {spaces_after_argument:\\n}
  *@example C3 test_refs.texi:l92
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:id: 002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e\\n}
   *@end C1 test_refs.texi:l94
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C3 test_refs.texi:l96 {local   node}
 |EXTRA
 |identifier:{local-node}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C4
   *line_arg C2
    {spaces_before_argument:  }
    {normal_text:local   node}
   *line_arg
   *line_arg C1
   |EXTRA
   |node_content:A{0|0}
   |normalized:{_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e}
    {normal_text:/;<=>?[\\]^_`|~}
   *line_arg C2
   |EXTRA
   |node_content:A{0|0}
   |normalized:{other-nodes}
    {normal_text:other nodes}
    {spaces_after_argument:\\n}
  *@example C3 test_refs.texi:l97
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C1
    {normal_text:id: local-node\\n}
   *@end C1 test_refs.texi:l99
   |EXTRA
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'htmlxref_nodes'} = '\\input texinfo @c -*-texinfo-*-

@node Top
@top Test refs

@menu
* other nodes::
@end menu

@subheading Testing distant nodes

@verb{: a  node :} @ref{ a  node ,,, manual}@*
@example
mono : manual.html#a-node
split: ../manual/a-node.html#a-node
@end example

@verb{;:;} @ref{:,,,manual}
@example
mono : manual.html#_003a
split: ../manual/_003a.html#_003a
@end example

@verb{:Top:} @ref{ top ,,, manual}@* 
@example
mono : manual.html#Top
split: ../manual/index.html#Top
@end example

@subheading Testing manual name

@verb{:../manual/doc.texi:} @ref{node,,, ../manual/doc}@*
@example
mono : doc.html#node
split: ../doc/node.html#node
@end example

@subheading Testing local nodes

@verb{:!_"#$%&\'()*+-.:} @ref{!_"#$%&\'()*+-.}
@example
target: #_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e
@end example

@verb{:/;<=>?[\\]^_`|~:} @ref{/;<=>?[\\]^_`|~}@*
@example
target: #_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e
@end example

@verb{:Top:} @ref{ Top}
@example
target: #Top
@end example

@verb{: local   node:} @ref{  local   node}
@example
target: #local-node
@end example

@c before 2026 was a reference to the mtexinfo external manual
@verb{:(mtexinfo)Cross References:} @ref{(mtexinfo)Cross References}
@example
target: #_0028mtexinfo_0029Cross-References
@end example

@anchor{(mtexinfo)Cross References}

@node other nodes, !_"#$%&\'()*+-., Top, Top
@chapter Chapter with nodes

@example
id: other-nodes
@end example

@verb{:Top:} @ref{ Top}
@example
target: #Top
@end example

@menu
* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::
@end menu

@node !_"#$%&\'()*+-., /;<=>?[\\]^_`|~, other nodes, other nodes
@example
id: _0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e
@end example

@node /;<=>?[\\]^_`|~,local   node,!_"#$%&\'()*+-., other nodes
@example
id: 002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e
@end example

@node  local   node,,/;<=>?[\\]^_`|~,other nodes
@example
id: local-node
@end example

@bye
';


$result_texts{'htmlxref_nodes'} = 'Test refs
*********

* other nodes::

Testing distant nodes
---------------------

 a  node  a  node

mono : manual.html#a-node
split: ../manual/a-node.html#a-node

: :
mono : manual.html#_003a
split: ../manual/_003a.html#_003a

Top top
 
mono : manual.html#Top
split: ../manual/index.html#Top

Testing manual name
-------------------

../manual/doc.texi node

mono : doc.html#node
split: ../doc/node.html#node

Testing local nodes
-------------------

!_"#$%&\'()*+-. !_"#$%&\'()*+-.
target: #_0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e

/;<=>?[\\]^_`|~ /;<=>?[\\]^_`|~

target: #_002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e

Top Top
target: #Top

 local   node local   node
target: #local-node

(mtexinfo)Cross References (mtexinfo)Cross References
target: #_0028mtexinfo_0029Cross-References


1 Chapter with nodes
********************

id: other-nodes

Top Top
target: #Top

* !_"#$%&\'()*+-.::
* /;<=>?[\\]^_`|~::
* local node::

id: _0021_005f_0022_0023_0024_0025_0026_0027_0028_0029_002a_002b_002d_002e

id: 002f_003b_003c_003d_003e_003f_005b_005c_005d_005e_005f_0060_007c_007e

id: local-node

';

$result_errors{'htmlxref_nodes'} = '* E test_refs.texi:l66|syntax for an external node used for `(mtexinfo)Cross References\'
 syntax for an external node used for `(mtexinfo)Cross References\'

';

$result_nodes_list{'htmlxref_nodes'} = '1|Top
 associated_section: Test refs
 associated_title_command: Test refs
 menus:
  other nodes
 node_directions:
  next->other nodes
2|other nodes
 associated_section: 1 Chapter with nodes
 associated_title_command: 1 Chapter with nodes
 menus:
  !_"#$%&\'()*+-.
  /;<=>?[\\]^_`|~
  local node
 node_directions:
  next->!_"#$%&\'()*+-.
  prev->Top
  up->Top
3|!_"#$%&\'()*+-.
 node_directions:
  next->/;<=>?[\\]^_`|~
  prev->other nodes
  up->other nodes
4|/;<=>?[\\]^_`|~
 node_directions:
  next->local   node
  prev->!_"#$%&\'()*+-.
  up->other nodes
5|local   node
 node_directions:
  prev->/;<=>?[\\]^_`|~
  up->other nodes
';

$result_sections_list{'htmlxref_nodes'} = '1|Test refs
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter with nodes
 section_children:
  1|Chapter with nodes
2|Chapter with nodes
 associated_anchor_command: other nodes
 associated_node: other nodes
 section_directions:
  up->Test refs
 toplevel_directions:
  prev->Test refs
  up->Test refs
';

$result_sectioning_root{'htmlxref_nodes'} = 'level: -1
list:
 1|Test refs
';

$result_headings_list{'htmlxref_nodes'} = '1|Testing distant nodes
2|Testing manual name
3|Testing local nodes
';

$result_converted_errors{'file_html'}->{'htmlxref_nodes'} = '* W htmlxref-test.cnf:l15|unrecognized type: foo
 warning: unrecognized type: foo

* W htmlxref-test.cnf:l16|missing type
 warning: missing type

';

1;
