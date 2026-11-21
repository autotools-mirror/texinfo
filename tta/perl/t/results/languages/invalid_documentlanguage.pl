use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'invalid_documentlanguage'} = '*document_root C3
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content C23
   *@documentlanguage C1 l2
   |EXTRA
   |global_command_number:{1}
   |text_arg:{%bm_AA}
    *line_arg C3
     {spaces_before_argument: }
     {%bm_AA}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l3
   |EXTRA
   |global_command_number:{2}
   |text_arg:{cu*_FR}
    *line_arg C3
     {spaces_before_argument: }
     {cu*_FR}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l4
   |EXTRA
   |global_command_number:{3}
   |text_arg:{_JP}
    *line_arg C3
     {spaces_before_argument: }
     {_JP}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l5
   |EXTRA
   |global_command_number:{4}
   |text_arg:{*_ZM}
    *line_arg C3
     {spaces_before_argument: }
     {*_ZM}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l6
   |EXTRA
   |global_command_number:{5}
   |text_arg:{tia_JJ}
    *line_arg C3
     {spaces_before_argument: }
     {tia_JJ}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l7
   |EXTRA
   |global_command_number:{6}
   |text_arg:{fr_}
    *line_arg C3
     {spaces_before_argument: }
     {fr_}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l8
   |EXTRA
   |global_command_number:{7}
   |text_arg:{be_}
    *line_arg C3
     {spaces_before_argument: }
     {be_}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l9
   |EXTRA
   |global_command_number:{8}
   |text_arg:{de_*}
    *line_arg C3
     {spaces_before_argument: }
     {de_*}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l10
   |EXTRA
   |global_command_number:{9}
   |text_arg:{it_G%}
    *line_arg C3
     {spaces_before_argument: }
     {it_G%}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l11
   |EXTRA
   |global_command_number:{10}
   |text_arg:{it_FR^}
    *line_arg C3
     {spaces_before_argument: }
     {it_FR^}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l12
   |EXTRA
   |global_command_number:{11}
   |text_arg:{en_US !}
    *line_arg C3
     {spaces_before_argument: }
     {en_US !}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l13
   |EXTRA
   |global_command_number:{12}
   |text_arg:{ab gh}
    *line_arg C3
     {spaces_before_argument: }
     {ab gh}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l14
   |EXTRA
   |global_command_number:{13}
   |text_arg:{es}
    *line_arg C3
     {spaces_before_argument:  }
     {es}
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:in comment}
       {spaces_after_argument:\\n}
   *@documentlanguage C1 l15
   |EXTRA
   |global_command_number:{14}
   |text_arg:{az}
    *line_arg C3
     {spaces_before_argument: }
     {az}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l16
   |EXTRA
   |global_command_number:{15}
   |text_arg:{bhé}
    *line_arg C3
     {spaces_before_argument: }
     {bhé}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l17
   |EXTRA
   |global_command_number:{16}
   |text_arg:{AB_FR}
    *line_arg C3
     {spaces_before_argument: }
     {AB_FR}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l18
   |EXTRA
   |global_command_number:{17}
   |text_arg:{aç_DC}
    *line_arg C3
     {spaces_before_argument: }
     {aç_DC}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l19
   |EXTRA
   |global_command_number:{18}
   |text_arg:{fr_ÂC}
    *line_arg C3
     {spaces_before_argument: }
     {fr_ÂC}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l20
   |EXTRA
   |global_command_number:{19}
   |text_arg:{c修_CH}
    *line_arg C3
     {spaces_before_argument: }
     {c修_CH}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l21
   |EXTRA
   |global_command_number:{20}
   |text_arg:{fr_M让}
    *line_arg C3
     {spaces_before_argument: }
     {fr_M让}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l22
   |EXTRA
   |global_command_number:{21}
   |text_arg:{ab_us}
    *line_arg C3
     {spaces_before_argument: }
     {ab_us}
     {spaces_after_argument:\\n}
   *@documentlanguage C1 l23
   |EXTRA
   |global_command_number:{22}
    *line_arg C1
     {spaces_before_argument:\\n}
   {empty_line:\\n}
 *@node C1 l25 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
 *@top C4 l26 {top}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@defivar C2 l28
   *def_line C1 l28
   |EXTRA
   |def_command:{defivar}
   |documentlanguage:{az}
   |element_node:{Top}
   |index_entry:I{vr,1}
   |original_def_cmdname:{defivar}
    *block_line_arg C9
     (i){spaces_before_argument: }
     *def_category C1
     |EXTRA
     |inserted:{1}
      *untranslated_def_line_arg C1
      |EXTRA
      |documentlanguage:{az}
      |translation_context:{category of instance variables in object-oriented programming for @defivar}
       {untranslated:Instance Variable}
     {spaces: }
     *def_class C1
      *def_line_arg C1
       {Which}
     {spaces: }
     *def_name C1
      *def_line_arg C1
       {Language}
     {spaces: }
     *def_arg C1
      *def_line_arg C1
       {Selected?}
     {spaces_after_argument:\\n}
   *@end C1 l29
   |EXTRA
   |text_arg:{defivar}
    *line_arg C3
     {spaces_before_argument: }
     {defivar}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'invalid_documentlanguage'} = '
@documentlanguage %bm_AA
@documentlanguage cu*_FR
@documentlanguage _JP
@documentlanguage *_ZM
@documentlanguage tia_JJ
@documentlanguage fr_
@documentlanguage be_
@documentlanguage de_*
@documentlanguage it_G%
@documentlanguage it_FR^
@documentlanguage en_US !
@documentlanguage ab gh
@documentlanguage  es@c in comment
@documentlanguage az
@documentlanguage bhé
@documentlanguage AB_FR
@documentlanguage aç_DC
@documentlanguage fr_ÂC
@documentlanguage c修_CH
@documentlanguage fr_M让
@documentlanguage ab_us
@documentlanguage

@node Top
@top top

@defivar Which Language Selected?
@end defivar

';


$result_texts{'invalid_documentlanguage'} = '
top
***

Instance Variable of Which: Language Selected?

';

$result_errors{'invalid_documentlanguage'} = '* W l2|%bm_AA is not a valid language argument
 warning: %bm_AA is not a valid language argument

* W l3|cu*_FR is not a valid language argument
 warning: cu*_FR is not a valid language argument

* W l4|_JP is not a valid language argument
 warning: _JP is not a valid language argument

* W l5|*_ZM is not a valid language argument
 warning: *_ZM is not a valid language argument

* W l6|JJ is not a valid region code
 warning: JJ is not a valid region code

* W l9|de_* is not a valid language argument
 warning: de_* is not a valid language argument

* W l10|it_G% is not a valid language argument
 warning: it_G% is not a valid language argument

* W l11|it_FR^ is not a valid language argument
 warning: it_FR^ is not a valid language argument

* W l12|en_US ! is not a valid language argument
 warning: en_US ! is not a valid language argument

* W l13|ab gh is not a valid language argument
 warning: ab gh is not a valid language argument

* W l16|bhé is not a valid language argument
 warning: bhé is not a valid language argument

* W l17|AB_FR is not a valid language argument
 warning: AB_FR is not a valid language argument

* W l18|aç_DC is not a valid language argument
 warning: aç_DC is not a valid language argument

* W l19|fr_ÂC is not a valid language argument
 warning: fr_ÂC is not a valid language argument

* W l20|c修_CH is not a valid language argument
 warning: c修_CH is not a valid language argument

* W l21|fr_M让 is not a valid language argument
 warning: fr_M让 is not a valid language argument

* W l22|ab_us is not a valid language argument
 warning: ab_us is not a valid language argument

* W l23|@documentlanguage missing argument
 warning: @documentlanguage missing argument

';

$result_nodes_list{'invalid_documentlanguage'} = '1|Top
 associated_section: top
 associated_title_command: top
';

$result_sections_list{'invalid_documentlanguage'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
';

$result_sectioning_root{'invalid_documentlanguage'} = 'level: -1
list:
 1|top
';

$result_headings_list{'invalid_documentlanguage'} = '';

$result_indices_sort_strings{'invalid_documentlanguage'} = 'vr:
 Language of Which
';


$result_converted{'plaintext'}->{'invalid_documentlanguage'} = 'top
***

 -- Instance Variable of Which: Language Selected?

';

$result_converted_sort_strings{'plaintext'}->{'invalid_documentlanguage'} = 'vr:
 Language of Which
';

1;
