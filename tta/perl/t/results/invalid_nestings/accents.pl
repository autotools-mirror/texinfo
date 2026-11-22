use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'accents'} = '*document_root C1
 *before_node_section C4
  *preamble_before_content
  *paragraph C5
   {normal_text:Valid\\n}
   *@~ C1 l2
    *brace_container C1
     *@TeX C1 l2
      *brace_container
   {normal_text:. }
   *@~ C1 l2
    *brace_container C1
     *@@
   {normal_text:.\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:Invalid\\n}
   *@~ C1 l5
    *brace_container C1
     *@code C1 l5
      *brace_container C1
       {normal_text:a}
   {normal_text:.  }
   *@^ C1 l5
    *brace_container C1
     *@anchor C1 l5
     |EXTRA
     |identifier:{truc}
     |is_target:{1}
      *brace_arg C1
       {normal_text:truc}
   {normal_text:.\\n}
';


$result_texis{'accents'} = 'Valid
@~{@TeX{}}. @~{@@}.

Invalid
@~{@code{a}}.  @^{@anchor{truc}}.
';


$result_texts{'accents'} = 'Valid
TeX~. @~.

Invalid
a~.  ^.
';

$result_errors{'accents'} = '* W l5|@code should not appear in @~
 warning: @code should not appear in @~

* W l5|@anchor should not appear in @^
 warning: @anchor should not appear in @^

';

$result_nodes_list{'accents'} = '';

$result_sections_list{'accents'} = '';

$result_sectioning_root{'accents'} = '';

$result_headings_list{'accents'} = '';

1;
