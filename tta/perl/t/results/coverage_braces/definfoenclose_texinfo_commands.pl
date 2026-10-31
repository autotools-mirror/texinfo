use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'definfoenclose_texinfo_commands'} = '*document_root C1
 *before_node_section C6
  *preamble_before_content C5
   *@definfoenclose C1 l1
   |EXTRA
   |misc_args:A{verb|;;|!!}
    *line_arg C3
     {spaces_before_argument: }
     {verb,;;,!!}
     {spaces_after_argument:\\n}
   *@definfoenclose C1 l2
   |EXTRA
   |misc_args:A{TeX|aa|bb}
    *line_arg C3
     {spaces_before_argument: }
     {TeX,aa,bb}
     {spaces_after_argument:\\n}
   *@definfoenclose C1 l3
   |EXTRA
   |misc_args:A{strong|(|)}
    *line_arg C3
     {spaces_before_argument: }
     {strong,(,)}
     {spaces_after_argument:\\n}
   *@definfoenclose C1 l4
   |EXTRA
   |misc_args:A{quotation|q|e}
    *line_arg C3
     {spaces_before_argument: }
     {quotation,q,e}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
  *paragraph C2
   *@verb C1 l6
   |INFO
   |delimiter:{*}
    *brace_container C1
     {raw:aaa}
   {.\\n}
  {empty_line:\\n}
  *paragraph C4
   *@TeX C1 l8
    *brace_container
   {. }
   *definfoenclose_command@strong C1 l8
   |EXTRA
   |begin:{(}
   |end:{)}
    *brace_container C1
     {in strong}
   {.\\n}
  {empty_line:\\n}
  *@quotation C3 l10
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     {important}
     {spaces_after_argument:\\n}
   *paragraph C1
    {in quotation\\n}
   *@end C1 l12
   |EXTRA
   |text_arg:{quotation}
    *line_arg C3
     {spaces_before_argument: }
     {quotation}
     {spaces_after_argument:\\n}
';


$result_texis{'definfoenclose_texinfo_commands'} = '@definfoenclose verb,;;,!!
@definfoenclose TeX,aa,bb
@definfoenclose strong,(,)
@definfoenclose quotation,q,e

@verb{*aaa*}.

@TeX{}. @strong{in strong}.

@quotation important
in quotation
@end quotation
';


$result_texts{'definfoenclose_texinfo_commands'} = '
aaa.

TeX. in strong.

important
in quotation
';

$result_errors{'definfoenclose_texinfo_commands'} = '* W l1|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* E l1|cannot redefine with @definfoenclose: verb
 cannot redefine with @definfoenclose: verb

* W l2|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* WC l2|further warnings for @definfoenclose suppressed
 warning: further warnings for @definfoenclose suppressed

* E l2|cannot redefine with @definfoenclose: TeX
 cannot redefine with @definfoenclose: TeX

* E l4|cannot redefine with @definfoenclose: quotation
 cannot redefine with @definfoenclose: quotation

';

$result_nodes_list{'definfoenclose_texinfo_commands'} = '';

$result_sections_list{'definfoenclose_texinfo_commands'} = '';

$result_sectioning_root{'definfoenclose_texinfo_commands'} = '';

$result_headings_list{'definfoenclose_texinfo_commands'} = '';


$result_converted{'plaintext'}->{'definfoenclose_texinfo_commands'} = 'aaa.

   TeX.  (in strong).

     important: in quotation
';


$result_converted{'html_text'}->{'definfoenclose_texinfo_commands'} = '
<p><code class="verb">aaa</code>.
</p>
<p>TeX. (in strong).
</p>
<blockquote class="quotation">
<p><b class="b">important:</b> in quotation
</p></blockquote>
';


$result_converted{'latex_text'}->{'definfoenclose_texinfo_commands'} = '
\\begin{document}
\\verb*aaa*.

\\TeX{}. \\textbf{in strong}.

\\begin{quote}
\\textbf{important:} in quotation
\\end{quote}
';


$result_converted{'docbook'}->{'definfoenclose_texinfo_commands'} = '
<para><literal>aaa</literal>.
</para>
<para>&tex;. in strong.
</para>
<important><para>in quotation
</para></important>';

1;
