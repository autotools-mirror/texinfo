use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_indices_sort_strings);

use utf8;

$result_tree_text{'abbr_acronym'} = '*document_root C1
 *before_node_section C3
  *paragraph C6
   *@acronym C2 l1
    *brace_arg C1
     {--a}
    *brace_arg C1
     {an accronym}
   {\\n}
   *@acronym C1 l2
    *brace_arg C1
     {--a}
   {\\n}
   *@acronym C2 l3
    *brace_arg C1
     {--a}
    *brace_arg C4
     {an accronym }
     *@comma C1 l3
      *brace_container
     { }
     *@enddots C1 l3
      *brace_container
   {\\n}
  {empty_line:\\n}
  *paragraph C4
   *@abbr C2 l5
    *brace_arg C4
     *@\' C1 l5
      *following_arg C1
       {E}
     {--a. }
     *@comma C1 l5
      *brace_container
     {A.}
    *brace_arg C5
    |INFO
    |spaces_after_argument:
     |{spaces_after_argument: }
    |spaces_before_argument:
     |{spaces_before_argument: }
     *@\' C1 l5
      *following_arg C1
       {E}
     {tude--}
     *@comma C1 l5
      *brace_container
     { }
     *@b C1 l5
      *brace_container C1
       {Autonome}
   {\\n}
   *@abbr C1 l6
    *brace_arg C4
     *@\' C1 l6
      *following_arg C1
       {E}
     {--a. }
     *@comma C1 l6
      *brace_container
     {A.}
   {\\n}
';


$result_texis{'abbr_acronym'} = '@acronym{--a,an accronym}
@acronym{--a}
@acronym{--a,an accronym @comma{} @enddots{}}

@abbr{@\'E--a. @comma{}A., @\'Etude--@comma{} @b{Autonome} }
@abbr{@\'E--a. @comma{}A.}
';


$result_texts{'abbr_acronym'} = '-a (an accronym)
-a
-a (an accronym , ...)

E\'-a. ,A. (E\'tude-, Autonome)
E\'-a. ,A.
';

$result_errors{'abbr_acronym'} = '';

$result_nodes_list{'abbr_acronym'} = '';

$result_sections_list{'abbr_acronym'} = '';

$result_sectioning_root{'abbr_acronym'} = '';

$result_headings_list{'abbr_acronym'} = '';


$result_converted{'plaintext'}->{'abbr_acronym'} = '-a (an accronym) -a -a (an accronym , ...)

   É-a. ,A. (Étude-, Autonome) É-a. ,A.
';


$result_converted{'html_text'}->{'abbr_acronym'} = '<p><abbr class="acronym" title="an accronym">&ndash;a</abbr> (an accronym)
<abbr class="acronym" title="an accronym">&ndash;a</abbr>
<abbr class="acronym" title="an accronym , ...">&ndash;a</abbr> (an accronym , <small class="enddots">...</small>)
</p>
<p><abbr class="abbr" title="&Eacute;tude&ndash;, Autonome">&Eacute;&ndash;a. ,A.</abbr> (&Eacute;tude&ndash;, <b class="b">Autonome</b>)
<abbr class="abbr" title="&Eacute;tude&ndash;, Autonome">&Eacute;&ndash;a. ,A.</abbr>
</p>';


$result_converted{'latex_text'}->{'abbr_acronym'} = '--a (an accronym)
--a
--a (an accronym , \\dots{})

\\\'{E}--a.\\@ ,A.\\@ (\\\'{E}tude--, \\textbf{Autonome})
\\\'{E}--a.\\@ ,A.\\@
';


$result_converted{'docbook'}->{'abbr_acronym'} = '<para><acronym>&#8211;a</acronym> (an accronym)
<acronym>&#8211;a</acronym>
<acronym>&#8211;a</acronym> (an accronym &#44; ...)
</para>
<para><abbrev>&#201;&#8211;a. &#44;A.</abbrev> (&#201;tude&#8211;&#44; <emphasis role="bold">Autonome</emphasis>)
<abbrev>&#201;&#8211;a. &#44;A.</abbrev>
</para>';

1;
