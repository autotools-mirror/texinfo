use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'documentlanguagevariant_validity'} = '*document_root C1
 *before_node_section C1
  *preamble_before_content C9
   *@documentlanguagevariant C2 l1
   |EXTRA
   |global_command_number:{1}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:a%v}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:1606nict}
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C1 l2
   |EXTRA
   |global_command_number:{2}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:1901}
     *@code C1 l2
      *brace_container C1
       {normal_text:something}
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C1 l3
   |EXTRA
   |global_command_number:{3}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:1959acad}
     *@^ C1 l3
      *following_arg C1
       {normal_text:e}
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C1 l4
   |EXTRA
   |global_command_number:{4}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:unknown}
     *@TeX C1 l4
      *brace_container
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C2 l5
   |EXTRA
   |global_command_number:{5}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:1694acad}
     {spaces_after_argument: }
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:a b}
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C2 l6
   |EXTRA
   |global_command_number:{6}
    *line_arg C2
     {spaces_before_argument: }
     {normal_text:abl1943 s}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:!l}
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C1 l7
   |EXTRA
   |global_command_number:{7}
    *line_arg C3
     {spaces_before_argument: }
     *@TeX C1 l7
      *brace_container
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C1 l8
   |EXTRA
   |global_command_number:{8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:aùbc}
     {spaces_after_argument:\\n}
   *@documentlanguagevariant C1 l9
   |EXTRA
   |global_command_number:{9}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:M让}
     {spaces_after_argument:\\n}
';


$result_texis{'documentlanguagevariant_validity'} = '@documentlanguagevariant a%v, 1606nict
@documentlanguagevariant 1901@code{something}
@documentlanguagevariant 1959acad@^e
@documentlanguagevariant unknown@TeX{}
@documentlanguagevariant 1694acad , a b
@documentlanguagevariant abl1943 s, !l
@documentlanguagevariant @TeX{}
@documentlanguagevariant aùbc
@documentlanguagevariant M让
';


$result_texts{'documentlanguagevariant_validity'} = '';

$result_errors{'documentlanguagevariant_validity'} = '* W l1|bad number 1 argument to @documentlanguagevariant
 warning: bad number 1 argument to @documentlanguagevariant

* W l2|@code should not appear in @documentlanguagevariant
 warning: @code should not appear in @documentlanguagevariant

* W l2|superfluous content in number 1 argument to @documentlanguagevariant
 warning: superfluous content in number 1 argument to @documentlanguagevariant

* W l3|superfluous content in number 1 argument to @documentlanguagevariant
 warning: superfluous content in number 1 argument to @documentlanguagevariant

* W l4|superfluous content in number 1 argument to @documentlanguagevariant
 warning: superfluous content in number 1 argument to @documentlanguagevariant

* W l4|unknown language variant: `unknown\'
 warning: unknown language variant: `unknown\'

* W l5|bad number 2 argument to @documentlanguagevariant
 warning: bad number 2 argument to @documentlanguagevariant

* W l6|bad number 1 argument to @documentlanguagevariant
 warning: bad number 1 argument to @documentlanguagevariant

* W l6|bad number 2 argument to @documentlanguagevariant
 warning: bad number 2 argument to @documentlanguagevariant

* W l7|superfluous content in number 1 argument to @documentlanguagevariant
 warning: superfluous content in number 1 argument to @documentlanguagevariant

* W l8|bad number 1 argument to @documentlanguagevariant
 warning: bad number 1 argument to @documentlanguagevariant

* W l9|bad number 1 argument to @documentlanguagevariant
 warning: bad number 1 argument to @documentlanguagevariant

';

$result_nodes_list{'documentlanguagevariant_validity'} = '';

$result_sections_list{'documentlanguagevariant_validity'} = '';

$result_sectioning_root{'documentlanguagevariant_validity'} = '';

$result_headings_list{'documentlanguagevariant_validity'} = '';

1;
