use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'thischapter_in_footnote_in_evenfooting'} = '*document_root C1
 *before_node_section C2
  *before_beginning C1
   {empty_line:\\n}
  *preamble_before_content C1
   *normal_command@evenfooting C1 l2
    *line_arg C8
     {spaces_before_argument: }
     {normal_text:aa }
     *normal_command@strong C1 l2
      *brace_container C2
       {normal_text:GG}
       *normal_command@footnote C1 l2
       |global_command_number:{1}
        *brace_command_context C1
         *paragraph C2
          {normal_text:bb }
          *normal_command@thischapter
     {normal_text: }
     *normal_command@|
     {normal_text: }
     *normal_command@footnote C1 l2
     |global_command_number:{2}
      *brace_command_context C1
       *paragraph C2
        {normal_text:cc }
        *normal_command@thissection
     {spaces_after_argument:\\n}
';


$result_texis{'thischapter_in_footnote_in_evenfooting'} = '
@evenfooting aa @strong{GG@footnote{bb @thischapter}} @| @footnote{cc @thissection}
';


$result_texts{'thischapter_in_footnote_in_evenfooting'} = '';

$result_errors{'thischapter_in_footnote_in_evenfooting'} = '* W l2|@footnote should not appear on @evenfooting line
 warning: @footnote should not appear on @evenfooting line

* W l2|@footnote should not appear on @evenfooting line
 warning: @footnote should not appear on @evenfooting line

';

$result_nodes_list{'thischapter_in_footnote_in_evenfooting'} = '';

$result_sections_list{'thischapter_in_footnote_in_evenfooting'} = '';

$result_sectioning_root{'thischapter_in_footnote_in_evenfooting'} = '';

$result_headings_list{'thischapter_in_footnote_in_evenfooting'} = '';

1;
