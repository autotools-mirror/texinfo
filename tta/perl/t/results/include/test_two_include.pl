use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'test_two_include'} = '*document_root C1
 *before_node_section C10
  *preamble_before_content
  *paragraph C5
   {normal_text:Include version\\n}
   >SOURCEMARKS
   >include<start;1><p:16>
    >*normal_command@include C1 l2
    >|EXTRA
    >|text_arg:{version.texi}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:version.texi}
      >{spaces_after_argument:\\n}
   *normal_command@set C1
   |EXTRA
   |misc_args:A{UPDATED|28 March 2002}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:UPDATED 28 March 2002}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |EXTRA
   |misc_args:A{UPDATED-MONTH|March 2002}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:UPDATED-MONTH March 2002}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |EXTRA
   |misc_args:A{EDITION|4.2}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:EDITION 4.2}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |EXTRA
   |misc_args:A{VERSION|4.2}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:VERSION 4.2}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@set C1
  |EXTRA
  |misc_args:A{VERSION_DATE|October 2002}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:VERSION_DATE October 2002}
    {spaces_after_argument:\\n}
  *normal_command@set C1
  |EXTRA
  |misc_args:A{SHORT_VERSION|2-0}
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:SHORT_VERSION 2-0}
    {spaces_after_argument:\\n}
  *normal_command@set C1
  |EXTRA
  |misc_args:A{RPM_VERSION|2.0.4}
  >SOURCEMARKS
  >include<end;1>
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:RPM_VERSION 2.0.4}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:include inc_file\\n}
   >SOURCEMARKS
   >include<start;2><p:17>
    >*normal_command@include C1 l5
    >|EXTRA
    >|text_arg:{inc_file.texi}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:inc_file.texi}
      >{spaces_after_argument:\\n}
   {normal_text:In included file.\\n}
   >SOURCEMARKS
   >include<end;2><p:18>
  {empty_line:\\n}
  *paragraph C1
   {normal_text:After inclusion.\\n}
';


$result_texis{'test_two_include'} = 'Include version
@set UPDATED 28 March 2002
@set UPDATED-MONTH March 2002
@set EDITION 4.2
@set VERSION 4.2

@set VERSION_DATE October 2002
@set SHORT_VERSION 2-0
@set RPM_VERSION 2.0.4

include inc_file
In included file.

After inclusion.
';


$result_texts{'test_two_include'} = 'Include version


include inc_file
In included file.

After inclusion.
';

$result_errors{'test_two_include'} = '';

$result_nodes_list{'test_two_include'} = '';

$result_sections_list{'test_two_include'} = '';

$result_sectioning_root{'test_two_include'} = '';

$result_headings_list{'test_two_include'} = '';

1;
