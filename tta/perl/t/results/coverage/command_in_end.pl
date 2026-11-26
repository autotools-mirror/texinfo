use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'command_in_end'} = '*document_root C1
 *before_node_section C2
  *preamble
  *normal_command@quotation C4 l1
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *paragraph C2
    {normal_text:In quotation\\n}
    *normal_command@end C1 l3
     *line_arg C3
      {spaces_before_argument: }
      *normal_command@code C1 l3
       *brace_container C1
        {normal_text:quotation}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@quotation C4 l5
    *arguments_line C1
     *block_line_arg C1
      {spaces_before_argument:\\n}
    *paragraph C2
     {normal_text:In quotation\\n}
     *normal_command@end C1 l7
     |text_arg:{q}
      *line_arg C4
       {spaces_before_argument: }
       {normal_text:q}
       *normal_command@code C1 l7
        *brace_container C1
         {normal_text:uotation}
       {spaces_after_argument:\\n}
    {empty_line:\\n}
    *normal_command@quotation C4 l9
     *arguments_line C1
      *block_line_arg C1
       {spaces_before_argument:\\n}
     *paragraph C2
      {normal_text:In quotation\\n}
      *normal_command@end C1 l11
      |text_arg:{qu}
       *line_arg C4
        {spaces_before_argument: }
        {normal_text:qu}
        *normal_command@code C1 l11
         *brace_container C1
          {normal_text:otation}
        {spaces_after_argument:\\n}
     {empty_line:\\n}
     *normal_command@quotation C10 l13
      *arguments_line C1
       *block_line_arg C1
        {spaces_before_argument:\\n}
      *paragraph C2
       {normal_text:In quotation\\n}
       *normal_command@end C1 l15
       |text_arg:{quotn}
        *line_arg C5
         {spaces_before_argument: }
         {normal_text:quot}
         *normal_command@asis C1 l15
          *brace_container C1
           {normal_text:atio}
         {normal_text:n}
         {spaces_after_argument:\\n}
      {empty_line:\\n}
      *normal_command@quotation C3 l17
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *paragraph C1
        {normal_text:In quotation\\n}
       *normal_command@end C1 l19
       |text_arg:{quotation}
        *line_arg C5
         {spaces_before_argument: }
         {normal_text:q}
         *normal_command@asis C1 l19
          *brace_container
         {normal_text:uotation}
         {spaces_after_argument:\\n}
      {empty_line:\\n}
      *normal_command@quotation C3 l21
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *paragraph C1
        {normal_text:In quotation\\n}
       *normal_command@end C1 l23
       |text_arg:{quotation}
        *line_arg C5
         {spaces_before_argument: }
         {normal_text:qu}
         *normal_command@asis C1 l23
          *brace_container
         {normal_text:otation}
         {spaces_after_argument:\\n}
      {empty_line:\\n}
      *normal_command@quotation C3 l25
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       *paragraph C1
        {normal_text:In quotation\\n}
       *normal_command@end C1 l27
       |text_arg:{quotation}
        *line_arg C5
         {spaces_before_argument: }
         {normal_text:quot}
         *normal_command@asis C1 l27
          *brace_container
         {normal_text:ation}
         {spaces_after_argument:\\n}
      {empty_line:\\n}
      *normal_command@verbatim C3 l29
       *arguments_line C1
        *block_line_arg C1
         {spaces_before_argument:\\n}
       {raw:In verbatim\\n}
       {raw:@end verb@code{a}tim\\n}
';


$result_texis{'command_in_end'} = '@quotation
In quotation
@end @code{quotation}

@quotation
In quotation
@end q@code{uotation}

@quotation
In quotation
@end qu@code{otation}

@quotation
In quotation
@end quot@asis{atio}n

@quotation
In quotation
@end q@asis{}uotation

@quotation
In quotation
@end qu@asis{}otation

@quotation
In quotation
@end quot@asis{}ation

@verbatim
In verbatim
@end verb@code{a}tim
';


$result_texts{'command_in_end'} = 'In quotation

In quotation

In quotation

In quotation

In quotation

In quotation

In quotation

In verbatim
@end verb@code{a}tim
';

$result_errors{'command_in_end'} = '* W l3|@code should not appear in @end
 warning: @code should not appear in @end

* E l3|bad argument to @end: @code{quotation}
 bad argument to @end: @code{quotation}

* W l7|@code should not appear in @end
 warning: @code should not appear in @end

* W l7|unknown @end q
 warning: unknown @end q

* E l7|bad argument to @end: q@code{uotation}
 bad argument to @end: q@code{uotation}

* W l11|@code should not appear in @end
 warning: @code should not appear in @end

* W l11|unknown @end qu
 warning: unknown @end qu

* E l11|bad argument to @end: qu@code{otation}
 bad argument to @end: qu@code{otation}

* W l15|@asis should not appear in @end
 warning: @asis should not appear in @end

* W l15|unknown @end quotn
 warning: unknown @end quotn

* E l15|bad argument to @end: quot@asis{atio}n
 bad argument to @end: quot@asis{atio}n

* W l19|@asis should not appear in @end
 warning: @asis should not appear in @end

* E l19|bad argument to @end: q@asis{}uotation
 bad argument to @end: q@asis{}uotation

* W l23|@asis should not appear in @end
 warning: @asis should not appear in @end

* E l23|bad argument to @end: qu@asis{}otation
 bad argument to @end: qu@asis{}otation

* W l27|@asis should not appear in @end
 warning: @asis should not appear in @end

* E l27|bad argument to @end: quot@asis{}ation
 bad argument to @end: quot@asis{}ation

* E l29|no matching `@end verbatim\'
 no matching `@end verbatim\'

* E l13|no matching `@end quotation\'
 no matching `@end quotation\'

* E l9|no matching `@end quotation\'
 no matching `@end quotation\'

* E l5|no matching `@end quotation\'
 no matching `@end quotation\'

* E l1|no matching `@end quotation\'
 no matching `@end quotation\'

';

$result_nodes_list{'command_in_end'} = '';

$result_sections_list{'command_in_end'} = '';

$result_sectioning_root{'command_in_end'} = '';

$result_headings_list{'command_in_end'} = '';

1;
