use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'accent_with_text'} = '*document_root C1
 *before_node_section C2
  *preamble_before_content
  *paragraph C10
   *normal_command@u C1 l1
    *brace_container C1
     {normal_text:--a}
   {normal_text: }
   *normal_command@dotless C1 l1
    *brace_container C1
     {normal_text:--b}
   {normal_text: }
   *normal_command@^ C1 l1
    *brace_container C2
     {normal_text:--}
     *normal_command@dotless C1 l1
      *brace_container C1
       {normal_text:i}
   {normal_text: }
   *normal_command@^ C1 l1
    *brace_container C2
     {normal_text:--}
     *normal_command@dotless C1 l1
      *brace_container C1
       {normal_text:j}
   {normal_text: }
   *normal_command@^ C1 l1
    *brace_container C1
     {normal_text:--a}
   {normal_text:\\n}
';


$result_texis{'accent_with_text'} = '@u{--a} @dotless{--b} @^{--@dotless{i}} @^{--@dotless{j}} @^{--a}
';


$result_texts{'accent_with_text'} = '-a( -b i^ j^ -a^
';

$result_errors{'accent_with_text'} = '* E l1|@dotless expects `i\' or `j\' as argument, not `--b\'
 @dotless expects `i\' or `j\' as argument, not `--b\'

';

$result_nodes_list{'accent_with_text'} = '';

$result_sections_list{'accent_with_text'} = '';

$result_sectioning_root{'accent_with_text'} = '';

$result_headings_list{'accent_with_text'} = '';


$result_converted{'plaintext'}->{'accent_with_text'} = '-ă -b î ĵ -â
';


$result_converted{'html_text'}->{'accent_with_text'} = '<p>&ndash;a&#774; &ndash;b &icirc; &#309; &ndash;a&#770;
</p>';


$result_converted{'xml'}->{'accent_with_text'} = '<para><accent type="breve">&textndash;a</accent> <dotless>&textndash;b</dotless> <accent type="circ">&textndash;<dotless>i</dotless></accent> <accent type="circ">&textndash;<dotless>j</dotless></accent> <accent type="circ">&textndash;a</accent>
</para>';


$result_converted{'docbook'}->{'accent_with_text'} = '<para>&#8211;a&#774; &#8211;b &#238; &#309; &#8211;a&#770;
</para>';


$result_converted{'latex_text'}->{'accent_with_text'} = '\\begin{document}
\\u{--a} --b \\^{--\\i{}} \\^{--\\j{}} \\^{--a}
';

1;
