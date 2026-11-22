use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_is_an_anchor'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content C2
   *@setfilename C1 l1
   |EXTRA
   |text_arg:{top_is_an_anchor.info}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:top_is_an_anchor.info}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *@anchor C1 l3
  |EXTRA
  |identifier:{Top}
  |is_target:{1}
   *brace_arg C1
    {normal_text:Top}
  {spaces_after_close_brace:\\n}
';


$result_texis{'top_is_an_anchor'} = '@setfilename top_is_an_anchor.info

@anchor{Top}
';


$result_texts{'top_is_an_anchor'} = '
';

$result_errors{'top_is_an_anchor'} = '';

$result_nodes_list{'top_is_an_anchor'} = '';

$result_sections_list{'top_is_an_anchor'} = '';

$result_sectioning_root{'top_is_an_anchor'} = '';

$result_headings_list{'top_is_an_anchor'} = '';

$result_converted_errors{'file_html'}->{'top_is_an_anchor'} = '* W |must specify a title with a title command or @top
 warning: must specify a title with a title command or @top

';

$result_converted_errors{'file_info'}->{'top_is_an_anchor'} = '* W |document without nodes
 warning: document without nodes

* W l3|@anchor outside of any node
 warning: @anchor outside of any node

';

1;
