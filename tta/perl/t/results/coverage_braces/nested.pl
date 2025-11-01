use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'nested'} = '*document_root C1
 *before_node_section C1
  *paragraph C3
   {type the characters }
   *@kbd C1 l1
    *brace_container C2
     {l o g o u t }
     *@key C1 l1
      *brace_container C1
       {RET}
   {.}
';


$result_texis{'nested'} = 'type the characters @kbd{l o g o u t @key{RET}}.';


$result_texts{'nested'} = 'type the characters l o g o u t RET.';

$result_errors{'nested'} = '';

$result_nodes_list{'nested'} = '';

$result_sections_list{'nested'} = '';

$result_sectioning_root{'nested'} = '';

$result_headings_list{'nested'} = '';


$result_converted{'plaintext'}->{'nested'} = 'type the characters ‘l o g o u t <RET>’.
';


$result_converted{'html_text'}->{'nested'} = '<p>type the characters <kbd class="kbd">l o g o u t <kbd class="key">RET</kbd></kbd>.</p>';


$result_converted{'latex_text'}->{'nested'} = 'type the characters \\Texinfocommandstyletextkbd{l o g o u t \\texttt{RET}}.';


$result_converted{'docbook'}->{'nested'} = '<para>type the characters <userinput>l o g o u t <keycap>RET</keycap></userinput>.</para>';

1;
