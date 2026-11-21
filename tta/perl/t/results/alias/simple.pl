use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'simple'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content C4
   *@alias C1 l1
   |EXTRA
   |misc_args:A{myalias|code}
    *line_arg C3
     {spaces_before_argument: }
     {myalias = code}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *@alias C1 l3
   |EXTRA
   |misc_args:A{o-theralias|verb}
    *line_arg C4
     {spaces_before_argument: }
     {o-theralias=verb}
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:comment}
       {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C3
   {Should be code: }
   *@code C1 l5
   |INFO
   |alias_of:{myalias}
    *brace_container C1
     {code}
   {\\n}
  {empty_line:\\n}
  *paragraph C3
   {Should be verb: }
   *@verb C1 l7
   |INFO
   |alias_of:{o-theralias}
    *brace_container C3
     {verb_delimiter:!}
     {raw:verb}
     {verb_delimiter:!}
   {\\n}
';


$result_texis{'simple'} = '@alias myalias = code

@alias o-theralias=verb @c comment

Should be code: @code{code}

Should be verb: @verb{!verb!}
';


$result_texts{'simple'} = '

Should be code: code

Should be verb: verb
';

$result_errors{'simple'} = '';

$result_nodes_list{'simple'} = '';

$result_sections_list{'simple'} = '';

$result_sectioning_root{'simple'} = '';

$result_headings_list{'simple'} = '';

1;
