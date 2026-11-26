use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'brace_command_space_before_brace_in_node'} = '*document_root C23
 *before_node_section C1
  *preamble
 *normal_command@node C1 l1 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C2 l2 {top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l4 {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e}
 |identifier:{_0040-TeX-_00a1-_00c6-_1ebd-e_030a}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C15
    {spaces_before_argument: }
    *normal_command@atchar C2 l4
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@TeX C2 l4
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@exclamdown C2 l4
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@today C2 l4
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@AE C2 l4
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@~ C2 l4
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ringaccent C2 l4
     {spaces_after_cmd_before_arg: }
     *following_arg C1
      {normal_text:e}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l5 {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C15
    {spaces_before_argument: }
    *normal_command@atchar C2 l5
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@TeX C2 l5
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@exclamdown C2 l5
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@today C2 l5
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@AE C2 l5
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@~ C2 l5
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ringaccent C2 l5
     {spaces_after_cmd_before_arg: }
     *following_arg C1
      {normal_text:e}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l7 {s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e}
 |added:{1}
 |identifier:{s-_0040-TeX-_00a1-_00c6-_1ebd-e_030a}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C16
    {spaces_before_argument: }
    {normal_text:s }
    *normal_command@atchar C2
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@TeX C2
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@exclamdown C2
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@today C2
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@AE C2
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@~ C2
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ringaccent C2
     {spaces_after_cmd_before_arg: }
     *following_arg C1
      {normal_text:e}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l7 {s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e}
 |section_heading_number:{1.1}
 |section_level:{2}
 |section_number:{3}
  *arguments_line C1
   *line_arg C16
    {spaces_before_argument: }
    {normal_text:s }
    *normal_command@atchar C2 l7
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@TeX C2 l7
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@exclamdown C2 l7
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@today C2 l7
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@AE C2 l7
     {spaces_after_cmd_before_arg: }
     *brace_container
    {normal_text: }
    *normal_command@~ C2 l7
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:e}
    {normal_text: }
    *normal_command@ringaccent C2 l7
     {spaces_after_cmd_before_arg: }
     *following_arg C1
      {normal_text:e}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l9 {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 |identifier:{AAA-_0040-_007b_007d-_002e-code-r-8_002e27in}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@acronym C3 l9
     {spaces_after_cmd_before_arg: }
     *brace_arg C1
      {normal_text:AAA}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:fff}
    {normal_text: }
    *normal_command@verb C2 l9
     {spaces_after_cmd_before_arg: }
     *brace_container C3
      {verb_delimiter:.}
      {raw: @ {} . }
      {verb_delimiter:.}
    {normal_text: }
    *normal_command@code C2 l9
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:code}
    {normal_text: }
    *normal_command@r C2 l9
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:r}
    {normal_text: 8.27}
    *normal_command@dmn C2 l9
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:in}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l10 {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{4}
  *arguments_line C1
   *line_arg C11
    {spaces_before_argument: }
    *normal_command@acronym C3 l10
     {spaces_after_cmd_before_arg: }
     *brace_arg C1
      {normal_text:AAA}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:fff}
    {normal_text: }
    *normal_command@verb C2 l10
     {spaces_after_cmd_before_arg: }
     *brace_container C3
      {verb_delimiter:.}
      {raw: @ {} . }
      {verb_delimiter:.}
    {normal_text: }
    *normal_command@code C2 l10
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:code}
    {normal_text: }
    *normal_command@r C2 l10
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:r}
    {normal_text: 8.27}
    *normal_command@dmn C2 l10
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:in}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l12 {s @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8@asis{.}27@dmn {in}}
 |added:{1}
 |identifier:{s-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in}
 |is_target:{1}
 |node_number:{5}
  *arguments_line C1
   *line_arg C14
    {spaces_before_argument: }
    {normal_text:s }
    *normal_command@acronym C3
     {spaces_after_cmd_before_arg: }
     *brace_arg C1
      {normal_text:AAA}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:fff}
    {normal_text: }
    *normal_command@verb C2
     {spaces_after_cmd_before_arg: }
     *brace_container C3
      {verb_delimiter:.}
      {raw: @ {} . }
      {verb_delimiter:.}
    {normal_text: }
    *normal_command@code C2
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:code}
    {normal_text: }
    *normal_command@r C2
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:r}
    {normal_text: 8}
    *normal_command@asis C1
     *brace_container C1
      {normal_text:.}
    {normal_text:27}
    *normal_command@dmn C2
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:in}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l12 {s @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 |section_heading_number:{2.1}
 |section_level:{2}
 |section_number:{5}
  *arguments_line C1
   *line_arg C12
    {spaces_before_argument: }
    {normal_text:s }
    *normal_command@acronym C3 l12
     {spaces_after_cmd_before_arg: }
     *brace_arg C1
      {normal_text:AAA}
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:fff}
    {normal_text: }
    *normal_command@verb C2 l12
     {spaces_after_cmd_before_arg: }
     *brace_container C3
      {verb_delimiter:.}
      {raw: @ {} . }
      {verb_delimiter:.}
    {normal_text: }
    *normal_command@code C2 l12
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:code}
    {normal_text: }
    *normal_command@r C2 l12
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:r}
    {normal_text: 8.27}
    *normal_command@dmn C2 l12
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:in}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l14 {@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}}
 |identifier:{_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in}
 |is_target:{1}
 |node_number:{6}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@link C2 l14
     {spaces_after_cmd_before_arg: }
     *brace_arg C13
     |node_content:A{0|12}
     |normalized:{_0040-TeX-_00a1-_00c6-_1ebd-e_030a}
      *normal_command@atchar C2 l14
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@TeX C2 l14
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@exclamdown C2 l14
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@today C2 l14
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@AE C2 l14
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@~ C2 l14
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:e}
      {normal_text: }
      *normal_command@ringaccent C2 l14
       {spaces_after_cmd_before_arg: }
       *following_arg C1
        {normal_text:e}
    {normal_text: }
    *normal_command@ref C2 l14
     {spaces_after_cmd_before_arg: }
     *brace_arg C9
     |node_content:A{0|8}
     |normalized:{AAA-_0040-_007b_007d-_002e-code-r-8_002e27in}
      *normal_command@acronym C3 l14
       {spaces_after_cmd_before_arg: }
       *brace_arg C1
        {normal_text:AAA}
       *brace_arg C2
        {spaces_before_argument: }
        {normal_text:fff}
      {normal_text: }
      *normal_command@verb C2 l14
       {spaces_after_cmd_before_arg: }
       *brace_container C3
        {verb_delimiter:.}
        {raw: @ {} . }
        {verb_delimiter:.}
      {normal_text: }
      *normal_command@code C2 l14
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:code}
      {normal_text: }
      *normal_command@r C2 l14
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:r}
      {normal_text: 8.27}
      *normal_command@dmn C2 l14
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:in}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l15 {@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}}
 |section_heading_number:{3}
 |section_level:{1}
 |section_number:{6}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    *normal_command@link C2 l15
     {spaces_after_cmd_before_arg: }
     *brace_arg C13
     |node_content:A{0|12}
     |normalized:{_0040-TeX-_00a1-_00c6-_1ebd-e_030a}
      *normal_command@atchar C2 l15
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@TeX C2 l15
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@exclamdown C2 l15
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@today C2 l15
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@AE C2 l15
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@~ C2 l15
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:e}
      {normal_text: }
      *normal_command@ringaccent C2 l15
       {spaces_after_cmd_before_arg: }
       *following_arg C1
        {normal_text:e}
    {normal_text: }
    *normal_command@ref C2 l15
     {spaces_after_cmd_before_arg: }
     *brace_arg C9
     |node_content:A{0|8}
     |normalized:{AAA-_0040-_007b_007d-_002e-code-r-8_002e27in}
      *normal_command@acronym C3 l15
       {spaces_after_cmd_before_arg: }
       *brace_arg C1
        {normal_text:AAA}
       *brace_arg C2
        {spaces_before_argument: }
        {normal_text:fff}
      {normal_text: }
      *normal_command@verb C2 l15
       {spaces_after_cmd_before_arg: }
       *brace_container C3
        {verb_delimiter:.}
        {raw: @ {} . }
        {verb_delimiter:.}
      {normal_text: }
      *normal_command@code C2 l15
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:code}
      {normal_text: }
      *normal_command@r C2 l15
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:r}
      {normal_text: 8.27}
      *normal_command@dmn C2 l15
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:in}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l17 {s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8@asis{.}27@dmn {in}}
 |added:{1}
 |identifier:{s-_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in}
 |is_target:{1}
 |node_number:{7}
  *arguments_line C1
   *line_arg C6
    {spaces_before_argument: }
    {normal_text:s }
    *generic_container C13
     *normal_command@atchar C2
      {spaces_after_cmd_before_arg: }
      *brace_container
     {normal_text: }
     *normal_command@TeX C2
      {spaces_after_cmd_before_arg: }
      *brace_container
     {normal_text: }
     *normal_command@exclamdown C2
      {spaces_after_cmd_before_arg: }
      *brace_container
     {normal_text: }
     *normal_command@today C2
      {spaces_after_cmd_before_arg: }
      *brace_container
     {normal_text: }
     *normal_command@AE C2
      {spaces_after_cmd_before_arg: }
      *brace_container
     {normal_text: }
     *normal_command@~ C2
      {spaces_after_cmd_before_arg: }
      *brace_container C1
       {normal_text:e}
     {normal_text: }
     *normal_command@ringaccent C2
      {spaces_after_cmd_before_arg: }
      *following_arg C1
       {normal_text:e}
    {normal_text: }
    *generic_container C11
     *normal_command@acronym C3
      {spaces_after_cmd_before_arg: }
      *brace_arg C1
       {normal_text:AAA}
      *brace_arg C2
       {spaces_before_argument: }
       {normal_text:fff}
     {normal_text: }
     *normal_command@verb C2
      {spaces_after_cmd_before_arg: }
      *brace_container C3
       {verb_delimiter:.}
       {raw: @ {} . }
       {verb_delimiter:.}
     {normal_text: }
     *normal_command@code C2
      {spaces_after_cmd_before_arg: }
      *brace_container C1
       {normal_text:code}
     {normal_text: }
     *normal_command@r C2
      {spaces_after_cmd_before_arg: }
      *brace_container C1
       {normal_text:r}
     {normal_text: 8}
     *normal_command@asis C1
      *brace_container C1
       {normal_text:.}
     {normal_text:27}
     *normal_command@dmn C2
      {spaces_after_cmd_before_arg: }
      *brace_container C1
       {normal_text:in}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l17 {s @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}}
 |section_heading_number:{3.1}
 |section_level:{2}
 |section_number:{7}
  *arguments_line C1
   *line_arg C6
    {spaces_before_argument: }
    {normal_text:s }
    *normal_command@link C2 l17
     {spaces_after_cmd_before_arg: }
     *brace_arg C13
     |node_content:A{0|12}
     |normalized:{_0040-TeX-_00a1-_00c6-_1ebd-e_030a}
      *normal_command@atchar C2 l17
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@TeX C2 l17
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@exclamdown C2 l17
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@today C2 l17
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@AE C2 l17
       {spaces_after_cmd_before_arg: }
       *brace_container
      {normal_text: }
      *normal_command@~ C2 l17
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:e}
      {normal_text: }
      *normal_command@ringaccent C2 l17
       {spaces_after_cmd_before_arg: }
       *following_arg C1
        {normal_text:e}
    {normal_text: }
    *normal_command@ref C2 l17
     {spaces_after_cmd_before_arg: }
     *brace_arg C9
     |node_content:A{0|8}
     |normalized:{AAA-_0040-_007b_007d-_002e-code-r-8_002e27in}
      *normal_command@acronym C3 l17
       {spaces_after_cmd_before_arg: }
       *brace_arg C1
        {normal_text:AAA}
       *brace_arg C2
        {spaces_before_argument: }
        {normal_text:fff}
      {normal_text: }
      *normal_command@verb C2 l17
       {spaces_after_cmd_before_arg: }
       *brace_container C3
        {verb_delimiter:.}
        {raw: @ {} . }
        {verb_delimiter:.}
      {normal_text: }
      *normal_command@code C2 l17
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:code}
      {normal_text: }
      *normal_command@r C2 l17
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:r}
      {normal_text: 8.27}
      *normal_command@dmn C2 l17
       {spaces_after_cmd_before_arg: }
       *brace_container C1
        {normal_text:in}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l19 {@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}}
 |identifier:{external-This-lman}
 |is_target:{1}
 |node_number:{8}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@link C4 l19
     {spaces_after_cmd_before_arg: }
     *brace_arg C1
     |node_content:A{0|0}
      {normal_text:external}
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:manuuuu}
    {normal_text: }
    *normal_command@ref C6 l19
     {spaces_after_cmd_before_arg: }
     *brace_arg
     *brace_arg
     *brace_arg
     *brace_arg
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:This}
    {normal_text: }
    *normal_command@link C4 l19
     {spaces_after_cmd_before_arg: }
     *brace_arg
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:lman}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l20 {@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}}
 |section_heading_number:{4}
 |section_level:{1}
 |section_number:{8}
  *arguments_line C1
   *line_arg C7
    {spaces_before_argument: }
    *normal_command@link C4 l20
     {spaces_after_cmd_before_arg: }
     *brace_arg C1
     |node_content:A{0|0}
      {normal_text:external}
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:manuuuu}
    {normal_text: }
    *normal_command@ref C6 l20
     {spaces_after_cmd_before_arg: }
     *brace_arg
     *brace_arg
     *brace_arg
     *brace_arg
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:This}
    {normal_text: }
    *normal_command@link C4 l20
     {spaces_after_cmd_before_arg: }
     *brace_arg
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:lman}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l22 {s external This lman}
 |added:{1}
 |identifier:{s-external-This-lman}
 |is_target:{1}
 |node_number:{9}
  *arguments_line C1
   *line_arg C8
    {spaces_before_argument: }
    {normal_text:s }
    *generic_container C1
     {normal_text:external}
    {normal_text: }
    *generic_container C1
     {normal_text:This}
    {normal_text: }
    *generic_container C1
     {normal_text:lman}
    {spaces_after_argument:\\n}
 *normal_command@section C3 l22 {s @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}}
 |section_heading_number:{4.1}
 |section_level:{2}
 |section_number:{9}
  *arguments_line C1
   *line_arg C8
    {spaces_before_argument: }
    {normal_text:s }
    *normal_command@link C4 l22
     {spaces_after_cmd_before_arg: }
     *brace_arg C1
     |node_content:A{0|0}
      {normal_text:external}
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:manuuuu}
    {normal_text: }
    *normal_command@ref C6 l22
     {spaces_after_cmd_before_arg: }
     *brace_arg
     *brace_arg
     *brace_arg
     *brace_arg
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:This}
    {normal_text: }
    *normal_command@link C4 l22
     {spaces_after_cmd_before_arg: }
     *brace_arg
     *brace_arg C1
      {spaces_before_argument: }
     *brace_arg C2
      {spaces_before_argument: }
      {normal_text:lman}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@definfoenclose C1 l24
  |misc_args:A{phoo|;|:}
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:phoo,;,:}
    {spaces_after_argument:\\n}
 *normal_command@node C1 l25 {@phoo {aphb}}
 |identifier:{aphb}
 |is_target:{1}
 |node_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *definfoenclose_command@phoo C2 l25
    |begin:{;}
    |end:{:}
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:aphb}
    {spaces_after_argument:\\n}
 *normal_command@chapter C2 l26 {@phoo {aphb}}
 |section_heading_number:{5}
 |section_level:{1}
 |section_number:{10}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *definfoenclose_command@phoo C2 l26
    |begin:{;}
    |end:{:}
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:aphb}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 l28 {s @phoo {aphb}}
 |added:{1}
 |identifier:{s-aphb}
 |is_target:{1}
 |node_number:{11}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:s }
    *definfoenclose_command@phoo C2
    |begin:{;}
    |end:{:}
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:aphb}
    {spaces_after_argument:\\n}
 *normal_command@section C2 l28 {s @phoo {aphb}}
 |section_heading_number:{5.1}
 |section_level:{2}
 |section_number:{11}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:s }
    *definfoenclose_command@phoo C2 l28
    |begin:{;}
    |end:{:}
     {spaces_after_cmd_before_arg: }
     *brace_container C1
      {normal_text:aphb}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
';


$result_texis{'brace_command_space_before_brace_in_node'} = '@node Top
@top top

@node @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
@chapter @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e

@node s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
@section s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e

@node @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
@chapter @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}

@node s @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8@asis{.}27@dmn {in}
@section s @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}

@node @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
@chapter @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}

@node s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8@asis{.}27@dmn {in}
@section s @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}

@node @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
@chapter @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}

@node s external This lman
@section s @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}

@definfoenclose phoo,;,:
@node @phoo {aphb}
@chapter @phoo {aphb}

@node s @phoo {aphb}
@section s @phoo {aphb}

';


$result_texts{'brace_command_space_before_brace_in_node'} = 'top
***

1 @ TeX ! a sunny day AE e~ e*
******************************

1.1 s @ TeX ! a sunny day AE e~ e*
==================================

2 AAA (fff)  @ {} .  code r 8.27in
**********************************

2.1 s AAA (fff)  @ {} .  code r 8.27in
======================================

3 @ TeX ! a sunny day AE e~ e* AAA (fff)  @ {} .  code r 8.27in
***************************************************************

3.1 s @ TeX ! a sunny day AE e~ e* AAA (fff)  @ {} .  code r 8.27in
===================================================================

4 external  
************

4.1 s external  
================

5 aphb
******

5.1 s aphb
==========

';

$result_errors{'brace_command_space_before_brace_in_node'} = '* W l9|@verb should not appear on @node line
 warning: @verb should not appear on @node line

* W l10|@verb should not appear on @chapter line
 warning: @verb should not appear on @chapter line

* W l12|@verb should not appear on @section line
 warning: @verb should not appear on @section line

* W l14|@link should not appear on @node line
 warning: @link should not appear on @node line

* W l14|@ref should not appear on @node line
 warning: @ref should not appear on @node line

* W l14|@verb should not appear anywhere inside @ref
 warning: @verb should not appear anywhere inside @ref

* W l15|@verb should not appear anywhere inside @ref
 warning: @verb should not appear anywhere inside @ref

* W l17|@verb should not appear anywhere inside @ref
 warning: @verb should not appear anywhere inside @ref

* W l19|@link should not appear on @node line
 warning: @link should not appear on @node line

* W l19|@ref should not appear on @node line
 warning: @ref should not appear on @node line

* W l19|@link should not appear on @node line
 warning: @link should not appear on @node line

* W l24|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

* W l25|@phoo should not appear on @node line
 warning: @phoo should not appear on @node line

* W l26|@phoo should not appear on @chapter line
 warning: @phoo should not appear on @chapter line

* W l28|@phoo should not appear on @section line
 warning: @phoo should not appear on @section line

';

$result_nodes_list{'brace_command_space_before_brace_in_node'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
2|@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 associated_section: 1 @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 associated_title_command: 1 @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 node_directions:
  next->@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
  prev->Top
  up->Top
3|s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 associated_section: 1.1 s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 associated_title_command: 1.1 s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 node_directions:
  up->@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
4|@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
 associated_section: 2 @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
 associated_title_command: 2 @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
 node_directions:
  next->@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
  prev->@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
  up->Top
5|s @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8@asis{.}27@dmn {in}
 associated_section: 2.1 s @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
 associated_title_command: 2.1 s @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
 node_directions:
  up->@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
6|@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 associated_section: 3 @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 associated_title_command: 3 @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 node_directions:
  next->@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
  prev->@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
  up->Top
7|s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8@asis{.}27@dmn {in}
 associated_section: 3.1 s @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 associated_title_command: 3.1 s @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 node_directions:
  up->@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
8|@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
 associated_section: 4 @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
 associated_title_command: 4 @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
 node_directions:
  next->@phoo {aphb}
  prev->@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
  up->Top
9|s external This lman
 associated_section: 4.1 s @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
 associated_title_command: 4.1 s @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
 node_directions:
  up->@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
10|@phoo {aphb}
 associated_section: 5 @phoo {aphb}
 associated_title_command: 5 @phoo {aphb}
 node_directions:
  prev->@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
  up->Top
11|s @phoo {aphb}
 associated_section: 5.1 s @phoo {aphb}
 associated_title_command: 5.1 s @phoo {aphb}
 node_directions:
  up->@phoo {aphb}
';

$result_sections_list{'brace_command_space_before_brace_in_node'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 section_children:
  1|@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
  2|@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
  3|@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
  4|@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
  5|@phoo {aphb}
2|@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 associated_anchor_command: @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 associated_node: @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 section_directions:
  next->@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
  up->top
 toplevel_directions:
  next->@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
  prev->top
  up->top
 section_children:
  1|s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
3|s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 associated_anchor_command: s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 associated_node: s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
 section_directions:
  up->@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
4|@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
 associated_anchor_command: @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
 associated_node: @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
 section_directions:
  next->@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
  prev->@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
  up->top
 toplevel_directions:
  next->@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
  prev->@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e
  up->top
 section_children:
  1|s @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
5|s @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
 associated_anchor_command: s @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8@asis{.}27@dmn {in}
 associated_node: s @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8@asis{.}27@dmn {in}
 section_directions:
  up->@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
6|@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 associated_anchor_command: @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 associated_node: @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 section_directions:
  next->@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
  prev->@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
  up->top
 toplevel_directions:
  next->@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
  prev->@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}
  up->top
 section_children:
  1|s @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
7|s @link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
 associated_anchor_command: s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8@asis{.}27@dmn {in}
 associated_node: s @atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e @acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8@asis{.}27@dmn {in}
 section_directions:
  up->@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
8|@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
 associated_anchor_command: @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
 associated_node: @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
 section_directions:
  next->@phoo {aphb}
  prev->@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
  up->top
 toplevel_directions:
  next->@phoo {aphb}
  prev->@link {@atchar {} @TeX {} @exclamdown {} @today {} @AE {} @~ {e} @ringaccent e} @ref {@acronym {AAA, fff} @verb {. @ {} . .} @code {code} @r {r} 8.27@dmn {in}}
  up->top
 section_children:
  1|s @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
9|s @link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
 associated_anchor_command: s external This lman
 associated_node: s external This lman
 section_directions:
  up->@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
10|@phoo {aphb}
 associated_anchor_command: @phoo {aphb}
 associated_node: @phoo {aphb}
 section_directions:
  prev->@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
  up->top
 toplevel_directions:
  prev->@link {external, , manuuuu} @ref {,,,, This} @link {, , lman}
  up->top
 section_children:
  1|s @phoo {aphb}
11|s @phoo {aphb}
 associated_anchor_command: s @phoo {aphb}
 associated_node: s @phoo {aphb}
 section_directions:
  up->@phoo {aphb}
';

$result_sectioning_root{'brace_command_space_before_brace_in_node'} = 'level: -1
list:
 1|top
';

$result_headings_list{'brace_command_space_before_brace_in_node'} = '';


$result_converted{'info'}->{'brace_command_space_before_brace_in_node'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: @ TeX ¡ a sunny day Æ ẽ e̊,  Up: (dir)

top
***

* Menu:

* @ TeX ¡ a sunny day Æ ẽ e̊::
* AAA (fff)  @ {} .  code r 8.27in::
* @ TeX ¡ a sunny day Æ ẽ e̊ *note AAA (fff)  @ {} .  code r 8.27in::::
* external *note ()Top:: ::
* ;aphb:::

 -- The Detailed Node Listing --

@ TeX ¡ a sunny day Æ ẽ e̊

* s @ TeX ¡ a sunny day Æ ẽ e̊::

AAA (fff)  @ {} .  ‘code’ r 8.27in

* s AAA (fff)  @ {} .  code r 8.27in::

@ TeX ¡ a sunny day Æ ẽ e̊ *note AAA (fff)  @ {} .  code r 8.27in::

* s @ TeX ¡ a sunny day Æ ẽ e̊ AAA (fff)  @ {} .  code r 8.27in::

external *note ()Top::

* s external This lman::

;aphb:

* s ;aphb:::


File: ,  Node: @ TeX ¡ a sunny day Æ ẽ e̊,  Next: AAA (fff)  @ {} .  code r 8.27in,  Prev: Top,  Up: Top

1 @ TeX ¡ a sunny day Æ ẽ e̊
***************************

* Menu:

* s @ TeX ¡ a sunny day Æ ẽ e̊::


File: ,  Node: s @ TeX ¡ a sunny day Æ ẽ e̊,  Up: @ TeX ¡ a sunny day Æ ẽ e̊

1.1 s @ TeX ¡ a sunny day Æ ẽ e̊
===============================


File: ,  Node: AAA (fff)  @ {} .  code r 8.27in,  Next: @ TeX ¡ a sunny day Æ ẽ e̊ *note AAA (fff)  @ {} .  code r 8.27in::,  Prev: @ TeX ¡ a sunny day Æ ẽ e̊,  Up: Top

2 AAA (fff)  @ {} .  ‘code’ r 8.27in
************************************

* Menu:

* s AAA (fff)  @ {} .  code r 8.27in::


File: ,  Node: s AAA (fff)  @ {} .  code r 8.27in,  Up: AAA (fff)  @ {} .  code r 8.27in

2.1 s AAA (fff)  @ {} .  ‘code’ r 8.27in
========================================


File: ,  Node: @ TeX ¡ a sunny day Æ ẽ e̊ *note AAA (fff)  @ {} .  code r 8.27in::,  Next: external *note ()Top::,  Prev: AAA (fff)  @ {} .  code r 8.27in,  Up: Top

3 @ TeX ¡ a sunny day Æ ẽ e̊ *note AAA (fff)  @ {} .  code r 8.27in::
********************************************************************

* Menu:

* s @ TeX ¡ a sunny day Æ ẽ e̊ AAA (fff)  @ {} .  code r 8.27in::


File: ,  Node: s @ TeX ¡ a sunny day Æ ẽ e̊ AAA (fff)  @ {} .  ‘code’ r 8.27in,  Up: @ TeX ¡ a sunny day Æ ẽ e̊ *note AAA (fff)  @ {} .  code r 8.27in::

3.1 s @ TeX ¡ a sunny day Æ ẽ e̊ *note AAA (fff)  @ {} .  code r 8.27in::
========================================================================


File: ,  Node: external *note ()Top::,  Next: ;aphb:,  Prev: @ TeX ¡ a sunny day Æ ẽ e̊ *note AAA (fff)  @ {} .  code r 8.27in::,  Up: Top

4 external *note ()Top:: 
*************************

* Menu:

* s external This lman::


File: ,  Node: s external This lman,  Up: external *note ()Top::

4.1 s external *note ()Top:: 
=============================


File: ,  Node: ;aphb:,  Prev: external *note ()Top::,  Up: Top

5 ;aphb:
********

* Menu:

* s ;aphb:::


File: ,  Node: s ;aphb:,  Up: ;aphb:

5.1 s ;aphb:
============


Tag Table:
Node: Top27
Node: @ TeX ¡ a sunny day Æ ẽ e̊721
Node: s @ TeX ¡ a sunny day Æ ẽ e̊945
Node: AAA (fff)  @ {} .  code r 8.27in1106
Node: s AAA (fff)  @ {} .  code r 8.27in1416
Node: @ TeX ¡ a sunny day Æ ẽ e̊ *note AAA (fff)  @ {} .  code r 8.27in::1595
Node: s @ TeX ¡ a sunny day Æ ẽ e̊ AAA (fff)  @ {} .  ‘code’ r 8.27in1994
Node: external *note ()Top::2317
Node: s external This lman2552
Node: ;aphb:2681
Node: s ;aphb:2791

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'brace_command_space_before_brace_in_node'} = '* W l14|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

* W l19|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

* W l25|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

* W l28|menu entry node name should not contain `:\'
 warning: menu entry node name should not contain `:\'

';


$result_converted{'html'}->{'brace_command_space_before_brace_in_node'} = '<!DOCTYPE html>
<html>
<!-- Created by texinfo, https://www.gnu.org/software/texinfo/ -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>top</title>

<meta name="description" content="top">
<meta name="keywords" content="top">
<meta name="resource-type" content="document">
<meta name="distribution" content="global">
<meta name="viewport" content="width=device-width,initial-scale=1">

<link href="#Top" rel="start" title="Top">
<style type="text/css">
a.copiable-link {visibility: hidden; text-decoration: none; line-height: 0em}
span.r {font-family: initial; font-weight: normal; font-style: normal}
span:hover a.copiable-link {visibility: visible}
</style>


</head>

<body>
<div class="top-level-extent" id="Top">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a" accesskey="n" rel="next">@ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a" accesskey="1">@ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a></li>
<li><a href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in" accesskey="2"><abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a></li>
<li><a href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in" accesskey="3"><a class="link" href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a">@ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a> <a class="ref" href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in"><abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a></a></li>
<li><a href="#external-This-lman" accesskey="4"><a data-manual="manuuuu" href="manuuuu.html#external">(manuuuu)external</a> <cite class="cite">This</cite> <a data-manual="lman" href="lman.html#Top">(lman)</a></a></li>
<li><a href="#aphb" accesskey="5">;aphb:</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in" accesskey="n" rel="next"><abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#Top" accesskey="p" rel="prev">top</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a-1"><span>1 @ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;<a class="copiable-link" href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a-1"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#s-_0040-TeX-_00a1-_00c6-_1ebd-e_030a" accesskey="1">s @ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a></li>
</ul>
<hr>
<div class="section-level-extent" id="s-_0040-TeX-_00a1-_00c6-_1ebd-e_030a">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a" accesskey="u" rel="up">@ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="s-_0040-TeX-_00a1-_00c6-_1ebd-e_030a-1"><span>1.1 s @ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;<a class="copiable-link" href="#s-_0040-TeX-_00a1-_00c6-_1ebd-e_030a-1"> &para;</a></span></h3>

<hr>
</div>
</div>
<div class="chapter-level-extent" id="AAA-_0040-_007b_007d-_002e-code-r-8_002e27in">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in" accesskey="n" rel="next"><a class="link" href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a">@ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a> <a class="ref" href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in"><abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a" accesskey="p" rel="prev">@ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="AAA-_0040-_007b_007d-_002e-code-r-8_002e27in-1"><span>2 <abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span><a class="copiable-link" href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in-1"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#s-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in" accesskey="1">s <abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a></li>
</ul>
<hr>
<div class="section-level-extent" id="s-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in" accesskey="u" rel="up"><abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="s-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in-1"><span>2.1 s <abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span><a class="copiable-link" href="#s-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in-1"> &para;</a></span></h3>

<hr>
</div>
</div>
<div class="chapter-level-extent" id="g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#external-This-lman" accesskey="n" rel="next"><a data-manual="manuuuu" href="manuuuu.html#external">(manuuuu)external</a> <cite class="cite">This</cite> <a data-manual="lman" href="lman.html#Top">(lman)</a></a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in" accesskey="p" rel="prev"><abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in-1"><span>3 <a class="link" href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a">@ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a> <a class="ref" href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in"><abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a><a class="copiable-link" href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in-1"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#s-_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in" accesskey="1">s <a class="link" href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a">@ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a> <a class="ref" href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in"><abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a></a></li>
</ul>
<hr>
<div class="section-level-extent" id="s-_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in" accesskey="u" rel="up"><a class="link" href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a">@ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a> <a class="ref" href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in"><abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a></a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="s-_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in-1"><span>3.1 s <a class="link" href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a">@ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a> <a class="ref" href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in"><abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a><a class="copiable-link" href="#s-_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in-1"> &para;</a></span></h3>

<hr>
</div>
</div>
<div class="chapter-level-extent" id="external-This-lman">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Next: </span><span class="nav-link"><a href="#aphb" accesskey="n" rel="next">;aphb:</a></span></span>, <span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a-AAA-_0040-_007b_007d-_002e-code-r-8_002e27in" accesskey="p" rel="prev"><a class="link" href="#g_t_0040-TeX-_00a1-_00c6-_1ebd-e_030a">@ TeX &iexcl; a sunny day &AElig; &#7869; e&#778;</a> <a class="ref" href="#AAA-_0040-_007b_007d-_002e-code-r-8_002e27in"><abbr class="acronym" title="fff">AAA</abbr> (fff) <code class="verb">&nbsp;@&nbsp;{}&nbsp;.&nbsp;</code> <code class="code">code</code> <span class="r">r</span> 8.27<span class="dmn">in</span></a></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="external-This-lman-1"><span>4 <a data-manual="manuuuu" href="manuuuu.html#external">(manuuuu)external</a> <cite class="cite">This</cite> <a data-manual="lman" href="lman.html#Top">(lman)</a><a class="copiable-link" href="#external-This-lman-1"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#s-external-This-lman" accesskey="1">s <a data-manual="manuuuu" href="manuuuu.html#external">(manuuuu)external</a> <cite class="cite">This</cite> <a data-manual="lman" href="lman.html#Top">(lman)</a></a></li>
</ul>
<hr>
<div class="section-level-extent" id="s-external-This-lman">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#external-This-lman" accesskey="u" rel="up"><a data-manual="manuuuu" href="manuuuu.html#external">(manuuuu)external</a> <cite class="cite">This</cite> <a data-manual="lman" href="lman.html#Top">(lman)</a></a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="s-external-This-lman-1"><span>4.1 s <a data-manual="manuuuu" href="manuuuu.html#external">(manuuuu)external</a> <cite class="cite">This</cite> <a data-manual="lman" href="lman.html#Top">(lman)</a><a class="copiable-link" href="#s-external-This-lman-1"> &para;</a></span></h3>

<hr>
</div>
</div>
<div class="chapter-level-extent" id="aphb">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Previous: </span><span class="nav-link"><a href="#external-This-lman" accesskey="p" rel="prev"><a data-manual="manuuuu" href="manuuuu.html#external">(manuuuu)external</a> <cite class="cite">This</cite> <a data-manual="lman" href="lman.html#Top">(lman)</a></a></span></span>, <span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#Top" accesskey="u" rel="up">top</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h2 class="chapter" id="aphb-1"><span>5 ;aphb:<a class="copiable-link" href="#aphb-1"> &para;</a></span></h2>

<ul class="mini-toc">
<li><a href="#s-aphb" accesskey="1">s ;aphb:</a></li>
</ul>
<hr>
<div class="section-level-extent" id="s-aphb">
<p class="nav-panel">
<span class="nav-button"><span class="nav-label">Up: </span><span class="nav-link"><a href="#aphb" accesskey="u" rel="up">;aphb:</a></span></span><span class="nav-button"> &nbsp; </span></p>
<h3 class="section" id="s-aphb-1"><span>5.1 s ;aphb:<a class="copiable-link" href="#s-aphb-1"> &para;</a></span></h3>

</div>
</div>
</div>



</body>
</html>
';

1;
