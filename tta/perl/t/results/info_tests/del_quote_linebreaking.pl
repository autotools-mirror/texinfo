use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'del_quote_linebreaking'} = '*document_root C1
 *before_node_section C16
  *paragraph C1
   {first para\\n}
  {empty_line:\\n}
  *paragraph C3
   {xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
   *@xref C5 l3
    *brace_arg C1
    |EXTRA
    |node_content:{noxde}
     {noxde}
    *brace_arg
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {manual}
    *brace_arg C1
     {Manual}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
   *@xref C5 l5
    *brace_arg C1
    |EXTRA
    |node_content:{noxde}
     {noxde}
    *brace_arg
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {manual}
    *brace_arg C1
     {Manual}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
   *@xref C5 l7
    *brace_arg C1
    |EXTRA
    |node_content:{noxde}
     {noxde}
    *brace_arg
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {manual}
    *brace_arg C1
     {Manual}
   {\\n}
  {empty_line:\\n}
  *paragraph C1
   {%\\n}
  {empty_line:\\n}
  *paragraph C3
   {xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
   *@xref C5 l11
    *brace_arg C1
    |EXTRA
    |node_content:{no:de}
     {no:de}
    *brace_arg
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {manual}
    *brace_arg C1
     {Manual}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
   *@xref C5 l13
    *brace_arg C1
    |EXTRA
    |node_content:{no:de}
     {no:de}
    *brace_arg
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {manual}
    *brace_arg C1
     {Manual}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
   *@xref C5 l15
    *brace_arg C1
    |EXTRA
    |node_content:{no:de}
     {no:de}
    *brace_arg
    *brace_arg
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {manual}
    *brace_arg C1
     {Manual}
   {\\n}
  {empty_line:\\n}
';


$result_texis{'del_quote_linebreaking'} = 'first para

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx @xref{noxde,,, manual,Manual}

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx @xref{noxde,,, manual,Manual}

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx @xref{noxde,,, manual,Manual}

%

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx @xref{no:de,,, manual,Manual}

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx @xref{no:de,,, manual,Manual}

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx @xref{no:de,,, manual,Manual}

';


$result_texts{'del_quote_linebreaking'} = 'first para

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx noxde

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx noxde

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx noxde

%

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx no:de

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx no:de

xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx no:de

';

$result_errors{'del_quote_linebreaking'} = '';

$result_nodes_list{'del_quote_linebreaking'} = '';

$result_sections_list{'del_quote_linebreaking'} = '';

$result_sectioning_root{'del_quote_linebreaking'} = '';

$result_headings_list{'del_quote_linebreaking'} = '';


$result_converted{'info'}->{'del_quote_linebreaking'} = 'This is , produced from .

first para

   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx *Note
(manual)noxde::

   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx *Note
(manual)noxde::

   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx *Note (manual)noxde::

   %

   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx *Note
(manual)no:de::

   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx *Note
(manual)no:de::

   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx *Note (manual)no:de::


Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
';

$result_converted_errors{'info'}->{'del_quote_linebreaking'} = '* W |document without nodes
 warning: document without nodes

';

1;
