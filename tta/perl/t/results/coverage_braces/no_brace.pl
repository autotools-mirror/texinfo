use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'no_brace'} = '*document_root C1
 *before_node_section C1
  *paragraph C6
   *@TeX l1
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
   {and }
   *@code l1
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
   {code and }
   *@footnote l1
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
   {footnote }
';


$result_texis{'no_brace'} = '@TeX and @code code and @footnote footnote ';


$result_texts{'no_brace'} = 'TeXand code and footnote ';

$result_errors{'no_brace'} = '* E l1|@TeX expected braces
 @TeX expected braces

* E l1|@code expected braces
 @code expected braces

* E l1|@footnote expected braces
 @footnote expected braces

';

$result_nodes_list{'no_brace'} = '';

$result_sections_list{'no_brace'} = '';

$result_sectioning_root{'no_brace'} = '';

$result_headings_list{'no_brace'} = '';


$result_converted{'html_text'}->{'no_brace'} = '<p>TeXand code and footnote </p>';

1;
