use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'lettered_accent_and_spaces'} = '*document_root C1
 *before_node_section C17
  *preamble_before_content
  *paragraph C2
   *@ringaccent C2 l1
    {spaces_after_cmd_before_arg:    }
    *following_arg C1
     {normal_text:a}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ringaccent C2 l3
    {spaces_after_cmd_before_arg:\\n}
    *brace_container C1
     {normal_text:a}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ringaccent C2 l6
    {spaces_after_cmd_before_arg:\\n}
    *following_arg C1
     {normal_text:a}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ringaccent C2 l9
    {spaces_after_cmd_before_arg:\\n  }
    *following_arg C1
     {normal_text:a}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@^ C2 l12
    {spaces_after_cmd_before_arg: }
    *following_arg C1
     {normal_text:a}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@^ C2 l14
    {spaces_after_cmd_before_arg:\\n}
    *following_arg C1
     {normal_text:a}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@^ C2 l17
    {spaces_after_cmd_before_arg:\\n }
    *following_arg C1
     {normal_text:a}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@^ C2 l20
    {spaces_after_cmd_before_arg: }
    *brace_container C1
     {normal_text:a\\n}
   {normal_text:\\n}
  {empty_line:\\n}
';


$result_texis{'lettered_accent_and_spaces'} = '@ringaccent    a

@ringaccent
{a}

@ringaccent
a

@ringaccent
  a

@^ a

@^
a

@^
 a

@^ {a
}

';


$result_texts{'lettered_accent_and_spaces'} = 'a*

a*

a*

a*

a^

a^

a^

a
^

';

$result_errors{'lettered_accent_and_spaces'} = '* W l3|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

* W l6|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

* W l9|command `@ringaccent\' must not be followed by new line
 warning: command `@ringaccent\' must not be followed by new line

* W l14|command `@^\' must not be followed by new line
 warning: command `@^\' must not be followed by new line

* W l17|command `@^\' must not be followed by new line
 warning: command `@^\' must not be followed by new line

';

$result_nodes_list{'lettered_accent_and_spaces'} = '';

$result_sections_list{'lettered_accent_and_spaces'} = '';

$result_sectioning_root{'lettered_accent_and_spaces'} = '';

$result_headings_list{'lettered_accent_and_spaces'} = '';


$result_converted{'plaintext'}->{'lettered_accent_and_spaces'} = 'å

   å

   å

   å

   â

   â

   â

   a ̂

';


$result_converted{'html_text'}->{'lettered_accent_and_spaces'} = '<p>&aring;
</p>
<p>&aring;
</p>
<p>&aring;
</p>
<p>&aring;
</p>
<p>&acirc;
</p>
<p>&acirc;
</p>
<p>&acirc;
</p>
<p>a
&#770;
</p>
';


$result_converted{'xml'}->{'lettered_accent_and_spaces'} = '<para><accent type="ring" bracketed="off">    </accent>
</para>
<para><accent type="ring" bracketed="off">
</accent>
</para>
<para><accent type="ring" bracketed="off">
</accent>
</para>
<para><accent type="ring" bracketed="off">
  </accent>
</para>
<para><accent type="circ" bracketed="off"> </accent>
</para>
<para><accent type="circ" bracketed="off">
</accent>
</para>
<para><accent type="circ" bracketed="off">
 </accent>
</para>
<para><accent type="circ" bracketed="off"> </accent>
</para>
';


$result_converted{'latex_text'}->{'lettered_accent_and_spaces'} = '\\begin{document}
\\r{a}

\\r{a}

\\r{a}

\\r{a}

\\^{a}

\\^{a}

\\^{a}

\\^{a
}

';


$result_converted{'docbook'}->{'lettered_accent_and_spaces'} = '<para>&#229;
</para>
<para>&#229;
</para>
<para>&#229;
</para>
<para>&#229;
</para>
<para>&#226;
</para>
<para>&#226;
</para>
<para>&#226;
</para>
<para>a
&#770;
</para>
';

1;
