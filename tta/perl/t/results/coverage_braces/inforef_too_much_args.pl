use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'inforef_too_much_args'} = '*document_root C2
 *before_node_section C1
  *preamble_before_content
 *@node C3 l1 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@inforef C3 l3
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
     {chapter}
    *brace_arg C2
     {spaces_before_argument: }
     {cross ref name}
    *brace_arg C2
     {spaces_before_argument: }
     {file name, spurious arg}
   {\\n}
';


$result_texis{'inforef_too_much_args'} = '@node chapter

@inforef{chapter, cross ref name, file name, spurious arg}
';


$result_texts{'inforef_too_much_args'} = '
chapter
';

$result_errors{'inforef_too_much_args'} = '* W l3|@inforef is obsolete
 warning: @inforef is obsolete

';

$result_nodes_list{'inforef_too_much_args'} = '1|chapter
';

$result_sections_list{'inforef_too_much_args'} = '';

$result_sectioning_root{'inforef_too_much_args'} = '';

$result_headings_list{'inforef_too_much_args'} = '';


$result_converted{'plaintext'}->{'inforef_too_much_args'} = 'See cross ref name: (file name, spurious arg)chapter
';


$result_converted{'html_text'}->{'inforef_too_much_args'} = '<h4 class="node" id="chapter"><span>chapter<a class="copiable-link" href="#chapter"> &para;</a></span></h4>

<p>See <a data-manual="file name, spurious arg" href="file%20name%2c%20spurious%20arg.html#chapter">cross ref name</a>
</p>';


$result_converted{'latex_text'}->{'inforef_too_much_args'} = '\\begin{document}
\\label{anchor:chapter}%

Section ``chapter\'\' in \\texttt{file name,\\ spurious arg}
';


$result_converted{'docbook'}->{'inforef_too_much_args'} = '<anchor id="chapter"/>

<para>See section &#8220;cross ref name&#8221; in <filename>file name, spurious arg</filename>
</para>';

1;
