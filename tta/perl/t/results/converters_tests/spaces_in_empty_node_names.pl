use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'spaces_in_empty_node_names'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *@node C4 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *@menu C5 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{-}
     *@ 
     *@ 
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{-}
     *@verb C1 l5
      *brace_container C3
       {verb_delimiter::}
       {raw:  }
       {verb_delimiter::}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l6
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{-}
     *@ 
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *@end C1 l7
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C2 l9 {@ @ }
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    *@ 
    *@ 
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C2 l11 {@verb{:  :}}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *@verb C1 l11
     *brace_container C3
      {verb_delimiter::}
      {raw:  }
      {verb_delimiter::}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C7 l13 {@w{  }}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    *@w C1 l13
     *brace_container C1
      {normal_text:  }
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l15
    *brace_arg C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{-}
     *@ 
     *@ 
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l17
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{-}
     *@verb C1 l17
      *brace_container C3
       {verb_delimiter::}
       {raw:  }
       {verb_delimiter::}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *@ref C1 l19
    *brace_arg C1
    |EXTRA
    |node_content:A{0|0}
    |normalized:{-}
     *@w C1 l19
      *brace_container C1
       {normal_text:  }
   {normal_text:\\n}
';


$result_texis{'spaces_in_empty_node_names'} = '@node Top

@menu
* @ @ ::
* @verb{:  :}::
* @ ::
@end menu

@node @ @ 

@node @verb{:  :}

@node @w{  }

@ref{@ @ }

@ref{@verb{:  :}}

@ref{@w{  }}
';


$result_texts{'spaces_in_empty_node_names'} = '
*   ::
*   ::
*  ::




  

  

  
';

$result_errors{'spaces_in_empty_node_names'} = '* E l9|empty node name after expansion `@ @ \'
 empty node name after expansion `@ @ \'

* W l11|@verb should not appear on @node line
 warning: @verb should not appear on @node line

* E l11|empty node name after expansion `@verb{:  :}\'
 empty node name after expansion `@verb{:  :}\'

* E l13|empty node name after expansion `@w{  }\'
 empty node name after expansion `@w{  }\'

* W l17|@verb should not appear anywhere inside @ref
 warning: @verb should not appear anywhere inside @ref

* E l15|@ref reference to nonexistent node `@ @ \'
 @ref reference to nonexistent node `@ @ \'

* E l17|@ref reference to nonexistent node `@verb{:  :}\'
 @ref reference to nonexistent node `@verb{:  :}\'

* E l19|@ref reference to nonexistent node `@w{  }\'
 @ref reference to nonexistent node `@w{  }\'

* E l4|@menu reference to nonexistent node `@ @ \'
 @menu reference to nonexistent node `@ @ \'

* E l5|@menu reference to nonexistent node `@verb{:  :}\'
 @menu reference to nonexistent node `@verb{:  :}\'

* E l6|@menu reference to nonexistent node `@ \'
 @menu reference to nonexistent node `@ \'

';

$result_nodes_list{'spaces_in_empty_node_names'} = '1|Top
 menus:
  @ @ 
  @verb{:  :}
  @ 
';

$result_sections_list{'spaces_in_empty_node_names'} = '';

$result_sectioning_root{'spaces_in_empty_node_names'} = '';

$result_headings_list{'spaces_in_empty_node_names'} = '';


$result_converted{'plaintext'}->{'spaces_in_empty_node_names'} = '  

     

    
';


$result_converted{'html_text'}->{'spaces_in_empty_node_names'} = '<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>





<p>&lsquo;&nbsp;&nbsp;&rsquo;
</p>
<p>&lsquo;<code class="verb">&nbsp;&nbsp;</code>&rsquo;
</p>
<p>&lsquo;&nbsp;<!-- /@w -->&rsquo;
</p>';


$result_converted{'xml'}->{'spaces_in_empty_node_names'} = '<node identifier="Top"><nodename> Top</nodename></node>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode><spacecmd type="spc"/><spacecmd type="spc"/></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><verb delimiter=":">  </verb></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode><spacecmd type="spc"/></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier=""><nodename></nodename></node>

<node identifier=""><nodename></nodename></node>

<node identifier=""><nodename></nodename></node>

<para><ref label="-"><xrefnodename><spacecmd type="spc"/><spacecmd type="spc"/></xrefnodename></ref>
</para>
<para><ref label="-"><xrefnodename><verb delimiter=":">  </verb></xrefnodename></ref>
</para>
<para><ref label="-"><xrefnodename><w>  </w></xrefnodename></ref>
</para>';


$result_converted{'docbook'}->{'spaces_in_empty_node_names'} = '


<para><link linkend="-">&#160;&#160;</link>
</para>
<para><link linkend="-"><literal>  </literal></link>
</para>
<para><link linkend="-">&amp;#160;<!-- /@w --></link>
</para>';


$result_converted{'latex_text'}->{'spaces_in_empty_node_names'} = '\\begin{document}
\\label{anchor:Top}%
\\label{anchor:-}%

\\label{anchor:-}%

\\label{anchor:-}%

\\ {}\\ {}

\\verb:  :

\\hbox{  }
';


$result_converted{'info'}->{'spaces_in_empty_node_names'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Up: (dir)

* Menu:

*   ::
*   ::
*  ::

*note   ::

   *note   ::

   *note  ::


Tag Table:
Node: Top27

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
