use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'comments_on_misc_command_line'} = '*document_root C1
 *before_node_section C9
  *preamble_before_content C4
   *@setfilename C1 l1
   |EXTRA
   |text_arg:{comments_on_misc_command_line.info}
    *line_arg C4
     {spaces_before_argument:  }
     {normal_text:comments_on_misc_command_line.info}
     {spaces_after_argument:  }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:setfilename (text)}
       {spaces_after_argument:\\n}
   *@definfoenclose C1 l2
   |EXTRA
   |misc_args:A{phoo|;|:}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:phoo,;,:}
     {spaces_after_argument:  }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:definfoenclose (number)}
       {spaces_after_argument:\\n}
   *@firstparagraphindent C1 l3
   |EXTRA
   |global_command_number:{1}
   |misc_args:A{none}
    *line_arg C4
     {spaces_before_argument: }
     {normal_text:none}
     {spaces_after_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:c (number)}
       {spaces_after_argument:\\n}
   *@raisesections C1
    *line_arg C2
     {spaces_before_argument: }
     *@c C1
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:raisesections (skipline)}
       {spaces_after_argument:\\n}
  *@insertcopying C1 l5
  |EXTRA
  |global_command_number:{1}
   *line_arg C2
    {spaces_before_argument:  }
    *@comment C1
     *line_arg C3
      {spaces_before_argument:  }
      {rawline_text:(noarg)}
      {spaces_after_argument:\\n}
  *@pagesizes C1 l6
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:200mm}
    {spaces_after_argument: }
    *@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:pagesizes  (line)}
      {spaces_after_argument:\\n}
  *@everyheading C1 l7
   *line_arg C7
    {spaces_before_argument: }
    *@thispage
    {normal_text: }
    *@|
    {normal_text: aaa}
    {spaces_after_argument: }
    *@c C1
     *line_arg C3
      {spaces_before_argument: }
      {rawline_text:everyheading (lineraw)}
      {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@indent l9
  {ignorable_spaces_after_command: }
  *@c C1
   *line_arg C3
    {spaces_before_argument: }
    {rawline_text:indent (skipspace)}
    {spaces_after_argument:\\n}
  *paragraph C1
  |EXTRA
  |indent:{1}
   {normal_text:Para.\\n}
';


$result_texis{'comments_on_misc_command_line'} = '@setfilename  comments_on_misc_command_line.info  @c setfilename (text)
@definfoenclose phoo,;,:  @c definfoenclose (number)
@firstparagraphindent none @c c (number)
@raisesections @c raisesections (skipline)
@insertcopying  @comment  (noarg)
@pagesizes 200mm @c pagesizes  (line)
@everyheading @thispage @| aaa @c everyheading (lineraw)

@indent @c indent (skipspace)
Para.
';


$result_texts{'comments_on_misc_command_line'} = '
Para.
';

$result_errors{'comments_on_misc_command_line'} = '* W l2|@definfoenclose is obsolete
 warning: @definfoenclose is obsolete

';

$result_nodes_list{'comments_on_misc_command_line'} = '';

$result_sections_list{'comments_on_misc_command_line'} = '';

$result_sectioning_root{'comments_on_misc_command_line'} = '';

$result_headings_list{'comments_on_misc_command_line'} = '';


$result_converted{'xml'}->{'comments_on_misc_command_line'} = '<setfilename file="comments_on_misc_command_line.info">  comments_on_misc_command_line.info  </setfilename><!-- c setfilename (text) -->
<definfoenclose command="phoo" open=";" close=":" line=" phoo,;,:  @c definfoenclose (number)"></definfoenclose><!-- c definfoenclose (number) -->
<firstparagraphindent value="none" line=" none @c c (number)"></firstparagraphindent><!-- c c (number) -->
<raisesections> </raisesections><!-- c raisesections (skipline) -->
<insertcopying>  </insertcopying><!-- comment  (noarg) -->
<pagesizes> 200mm </pagesizes><!-- c pagesizes  (line) -->
<everyheading> <thispage></thispage> <divideheading/> aaa </everyheading><!-- c everyheading (lineraw) -->

<indent></indent> <!-- c indent (skipspace) -->
<para>Para.
</para>';

1;
