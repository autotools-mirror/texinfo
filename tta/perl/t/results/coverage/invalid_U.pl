use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'invalid_U'} = '*document_root C1
 *before_node_section C1
  *paragraph C19
   *@U l1
   |INFO
   |spaces_after_cmd_before_arg:
    |{spaces_after_cmd_before_arg: }
   *@U C1 l1
    *brace_arg
   { }
   *@U C1 l1
    *brace_arg C1
     {z}
   { }
   *@U C1 l1
    *brace_arg C1
     {abc}
   { }
   *@U C1 l1
    *brace_arg C1
     {9999999999999}
   { }
   *@U C1 l1
    *brace_arg C1
     {110000}
   { }
   *@U C1 l1
    *brace_arg C1
     {10FFFF}
   {\\n}
   *@U C1 l2
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {0023}
   { }
   *@U C1 l2
    *brace_arg C1
     {FFFD}
   { }
   *@U C1 l2
    *brace_arg C1
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     {wxyz}
   {\\n}
';


$result_texis{'invalid_U'} = '@U @U{} @U{z} @U{abc} @U{9999999999999} @U{110000} @U{10FFFF}
@U{ 0023 } @U{FFFD} @U{ wxyz }
';


$result_texts{'invalid_U'} = ' z abc 9999999999999 110000 10FFFF
0023 FFFD wxyz
';

$result_errors{'invalid_U'} = '* E l1|@U expected braces
 @U expected braces

* W l1|no argument specified for @U
 warning: no argument specified for @U

* E l1|non-hex digits in argument for @U: z
 non-hex digits in argument for @U: z

* W l1|fewer than four hex digits in argument for @U: abc
 warning: fewer than four hex digits in argument for @U: abc

* E l1|argument for @U exceeds Unicode maximum 0x10FFFF: 9999999999999
 argument for @U exceeds Unicode maximum 0x10FFFF: 9999999999999

* E l1|argument for @U exceeds Unicode maximum 0x10FFFF: 110000
 argument for @U exceeds Unicode maximum 0x10FFFF: 110000

* E l2|non-hex digits in argument for @U: wxyz
 non-hex digits in argument for @U: wxyz

';

$result_nodes_list{'invalid_U'} = '';

$result_sections_list{'invalid_U'} = '';

$result_sectioning_root{'invalid_U'} = '';

$result_headings_list{'invalid_U'} = '';


$result_converted{'plaintext'}->{'invalid_U'} = 'U+z ઼ U+9999999999999 U+110000 U+10FFFF # � U+wxyz
';


$result_converted{'html_text'}->{'invalid_U'} = '<p> &#xz; &#xabc; &#x9999999999999; &#x110000; &#x10FFFF;
&#x0023; &#xFFFD; &#xwxyz;
</p>';


$result_converted{'xml'}->{'invalid_U'} = '<para><U></U> <U>z</U> <U>abc</U> <U>9999999999999</U> <U>110000</U> <U>10FFFF</U>
<U spaces=" ">0023 </U> <U>FFFD</U> <U spaces=" ">wxyz </U>
</para>';


$result_converted{'latex_text'}->{'invalid_U'} = ' U+z ઼ U+9999999999999 U+110000 U+10FFFF
\\# � U+wxyz
';


$result_converted{'docbook'}->{'invalid_U'} = '<para> &#xz; &#xabc; &#x9999999999999; &#x110000; &#x10FFFF;
&#x0023; &#xFFFD; &#xwxyz;
</para>';

1;
