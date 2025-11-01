use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'empty_ref'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *paragraph C9
   *@ref C1 l2
    *brace_arg
   { }
   *@xref C3 l2
    *brace_arg
    *brace_arg
    *brace_arg C1
     {something}
   {. }
   *@inforef C1 l2
    *brace_arg
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
   {\\n}
   { }
   *@inforef C2 l3
    *brace_arg
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
    *brace_arg C1
    |INFO
    |spaces_before_argument:
     |{spaces_before_argument: }
     {arg}
   {.\\n}
';


$result_texis{'empty_ref'} = '
@ref{} @xref{,,something}. @inforef{ }
 @inforef{ , arg}.
';


$result_texts{'empty_ref'} = '
 . 
 .
';

$result_errors{'empty_ref'} = '* W l2|command @ref missing a node or external manual argument
 warning: command @ref missing a node or external manual argument

* W l2|command @xref missing a node or external manual argument
 warning: command @xref missing a node or external manual argument

* W l2|@inforef is obsolete
 warning: @inforef is obsolete

* W l2|command @inforef missing a node or external manual argument
 warning: command @inforef missing a node or external manual argument

* W l3|@inforef is obsolete
 warning: @inforef is obsolete

* W l3|command @inforef missing a node or external manual argument
 warning: command @inforef missing a node or external manual argument

';

$result_nodes_list{'empty_ref'} = '';

$result_sections_list{'empty_ref'} = '';

$result_sectioning_root{'empty_ref'} = '';

$result_headings_list{'empty_ref'} = '';

1;
