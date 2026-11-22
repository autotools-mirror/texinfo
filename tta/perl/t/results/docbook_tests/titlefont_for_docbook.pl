use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'titlefont_for_docbook'} = '*document_root C1
 *before_node_section C3
  *preamble_before_content
  *normal_command@titlefont C1 l1
  |EXTRA
  |global_command_number:{1}
   *brace_container C1
    {normal_text:Reference Manual}
  {normal_text:\\n}
';


$result_texis{'titlefont_for_docbook'} = '@titlefont{Reference Manual}
';


$result_texts{'titlefont_for_docbook'} = 'Reference Manual
';

$result_errors{'titlefont_for_docbook'} = '';

$result_nodes_list{'titlefont_for_docbook'} = '';

$result_sections_list{'titlefont_for_docbook'} = '';

$result_sectioning_root{'titlefont_for_docbook'} = '';

$result_headings_list{'titlefont_for_docbook'} = '';


$result_converted{'docbook_doc'}->{'titlefont_for_docbook'} = '<?xml version="1.0"?>
<!DOCTYPE book PUBLIC "-//OASIS//DTD DocBook XML V4.5//EN" "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd" [
  <!ENTITY tex "TeX">
  <!ENTITY latex "LaTeX">
]>
<book>
<title>Reference Manual</title>
<bookinfo><title>Reference Manual</title>
</bookinfo>
Reference Manual
</book>
';

1;
