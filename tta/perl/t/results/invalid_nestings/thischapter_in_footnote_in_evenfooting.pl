use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'thischapter_in_footnote_in_evenfooting'} = '*document_root C1
 *before_node_section C2
  {empty_line:\\n}
  *@evenfooting C1 l2
  |INFO
  |spaces_before_argument:
   |{spaces_before_argument: }
   *line_arg C6
   |INFO
   |spaces_after_argument:
    |{spaces_after_argument:\\n}
    {aa }
    *@strong C1 l2
     *brace_container C2
      {GG}
      *@footnote C1 l2
      |EXTRA
      |global_command_number:{1}
       *brace_command_context C1
        *paragraph C2
         {bb }
         *@thischapter
    { }
    *@|
    { }
    *@footnote C1 l2
    |EXTRA
    |global_command_number:{2}
     *brace_command_context C1
      *paragraph C2
       {cc }
       *@thissection
';


$result_texis{'thischapter_in_footnote_in_evenfooting'} = '
@evenfooting aa @strong{GG@footnote{bb @thischapter}} @| @footnote{cc @thissection}
';


$result_texts{'thischapter_in_footnote_in_evenfooting'} = '
';

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
