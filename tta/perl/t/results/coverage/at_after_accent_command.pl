use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'at_after_accent_command'} = '*document_root C1
 *before_node_section C2
  *preamble
  *paragraph C6
   *normal_command@ringaccent C1 l1
    {spaces_after_cmd_before_arg: }
   *normal_command@@
   {normal_text:. }
   *normal_command@^ l1
   *normal_command@@
   {normal_text:.\\n}
';


$result_texis{'at_after_accent_command'} = '@ringaccent @@. @^@@.
';


$result_texts{'at_after_accent_command'} = '*@. ^@.
';

$result_errors{'at_after_accent_command'} = '* E l1|@ringaccent expected braces
 @ringaccent expected braces

* E l1|@^ expected braces
 @^ expected braces

';

$result_nodes_list{'at_after_accent_command'} = '';

$result_sections_list{'at_after_accent_command'} = '';

$result_sectioning_root{'at_after_accent_command'} = '';

$result_headings_list{'at_after_accent_command'} = '';


$result_converted{'plaintext'}->{'at_after_accent_command'} = '̊@.  ̂@.
';


$result_converted{'html_text'}->{'at_after_accent_command'} = '<p>&#778;@. &#770;@.
</p>';


$result_converted{'xml'}->{'at_after_accent_command'} = '<para><accent type="ring" bracketed="off"> </accent>&arobase;. <accent type="circ"></accent>&arobase;.
</para>';


$result_converted{'latex_text'}->{'at_after_accent_command'} = '\\begin{document}
\\r{}@. \\^{}@.
';


$result_converted{'docbook'}->{'at_after_accent_command'} = '<para>&#778;@. &#770;@.
</para>';

1;
