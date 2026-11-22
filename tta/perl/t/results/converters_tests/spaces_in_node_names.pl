use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'spaces_in_node_names'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
 *normal_command@node C4 l1 {Top}
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
  *normal_command@menu C5 l3
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 l4
    {menu_entry_leading_text:* }
    *menu_entry_node C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{chap-}
     {normal_text:chap}
     *normal_command@ 
     *normal_command@ 
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 l5
    {menu_entry_leading_text:* }
    *menu_entry_node C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{b-}
     {normal_text:b}
     *normal_command@verb C1 l5
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
    *menu_entry_node C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{c-}
     {normal_text:c}
     *normal_command@ 
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *normal_command@end C1 l7
   |EXTRA
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l9 {chap@ @ }
 |EXTRA
 |identifier:{chap-}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C5
    {spaces_before_argument: }
    {normal_text:chap}
    *normal_command@ 
    *normal_command@ 
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C2 l11 {b@verb{:  :}}
 |EXTRA
 |identifier:{b-}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:b}
    *normal_command@verb C1 l11
     *brace_container C3
      {verb_delimiter::}
      {raw:  }
      {verb_delimiter::}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C7 l13 {c@w{  }}
 |EXTRA
 |identifier:{c-}
 |is_target:{1}
 |node_number:{4}
  *arguments_line C1
   *line_arg C4
    {spaces_before_argument: }
    {normal_text:c}
    *normal_command@w C1 l13
     *brace_container C1
      {normal_text:  }
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l15
    *brace_arg C3
    |EXTRA
    |node_content:A{0|2}
    |normalized:{chap-}
     {normal_text:chap}
     *normal_command@ 
     *normal_command@ 
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l17
    *brace_arg C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{b-}
     {normal_text:b}
     *normal_command@verb C1 l17
      *brace_container C3
       {verb_delimiter::}
       {raw:  }
       {verb_delimiter::}
   {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C2
   *normal_command@ref C1 l19
    *brace_arg C2
    |EXTRA
    |node_content:A{0|1}
    |normalized:{c-}
     {normal_text:c}
     *normal_command@w C1 l19
      *brace_container C1
       {normal_text:  }
   {normal_text:\\n}
';


$result_texis{'spaces_in_node_names'} = '@node Top

@menu
* chap@ @ ::
* b@verb{:  :}::
* c@ ::
@end menu

@node chap@ @ 

@node b@verb{:  :}

@node c@w{  }

@ref{chap@ @ }

@ref{b@verb{:  :}}

@ref{c@w{  }}
';


$result_texts{'spaces_in_node_names'} = '
* chap  ::
* b  ::
* c ::




chap  

b  

c  
';

$result_errors{'spaces_in_node_names'} = '* W l11|@verb should not appear on @node line
 warning: @verb should not appear on @node line

* W l17|@verb should not appear anywhere inside @ref
 warning: @verb should not appear anywhere inside @ref

* W l6|@menu entry node name `c@ \' different from node name `c@w{  }\'
 warning: @menu entry node name `c@ \' different from node name `c@w{  }\'

';

$result_nodes_list{'spaces_in_node_names'} = '1|Top
 menus:
  chap@ @ 
  b@verb{:  :}
  c@ 
 node_directions:
  next->chap@ @ 
2|chap@ @ 
 node_directions:
  next->b@verb{:  :}
  prev->Top
  up->Top
3|b@verb{:  :}
 node_directions:
  next->c@w{  }
  prev->chap@ @ 
  up->Top
4|c@w{  }
 node_directions:
  prev->b@verb{:  :}
  up->Top
';

$result_sections_list{'spaces_in_node_names'} = '';

$result_sectioning_root{'spaces_in_node_names'} = '';

$result_headings_list{'spaces_in_node_names'} = '';


$result_converted{'plaintext'}->{'spaces_in_node_names'} = 'chap  

   b  

   c 
';


$result_converted{'html_text'}->{'spaces_in_node_names'} = '<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>


<hr>
<h4 class="node" id="chap-"><span>chap&nbsp;&nbsp;<a class="copiable-link" href="#chap-"> &para;</a></span></h4>

<hr>
<h4 class="node" id="b-"><span>b<code class="verb">&nbsp;&nbsp;</code><a class="copiable-link" href="#b-"> &para;</a></span></h4>

<hr>
<h4 class="node" id="c-"><span>c&nbsp;<!-- /@w --><a class="copiable-link" href="#c-"> &para;</a></span></h4>

<p><a class="ref" href="#chap-">chap&nbsp;&nbsp;</a>
</p>
<p><a class="ref" href="#b-">b<code class="verb">&nbsp;&nbsp;</code></a>
</p>
<p><a class="ref" href="#c-">c&nbsp;<!-- /@w --></a>
</p>';


$result_converted{'xml'}->{'spaces_in_node_names'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap<spacecmd type="spc"/><spacecmd type="spc"/></nodenext></node>

<menu endspaces=" ">
<menuentry><menuleadingtext>* </menuleadingtext><menunode>chap<spacecmd type="spc"/><spacecmd type="spc"/></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>b<verb delimiter=":">  </verb></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry><menuentry><menuleadingtext>* </menuleadingtext><menunode>c<spacecmd type="spc"/></menunode><menuseparator>::</menuseparator><menudescription><pre xml:space="preserve">
</pre></menudescription></menuentry></menu>

<node identifier="chap-"><nodename> chap<spacecmd type="spc"/><spacecmd type="spc"/></nodename><nodenext automatic="on"> b<verb delimiter=":">  </verb></nodenext><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>

<node identifier="b-"><nodename> b<verb delimiter=":">  </verb></nodename><nodenext automatic="on"> c<w>  </w></nodenext><nodeprev automatic="on"> chap<spacecmd type="spc"/><spacecmd type="spc"/></nodeprev><nodeup automatic="on"> Top</nodeup></node>

<node identifier="c-"><nodename> c<w>  </w></nodename><nodeprev automatic="on"> b<verb delimiter=":">  </verb></nodeprev><nodeup automatic="on"> Top</nodeup></node>

<para><ref label="chap-"><xrefnodename>chap<spacecmd type="spc"/><spacecmd type="spc"/></xrefnodename></ref>
</para>
<para><ref label="b-"><xrefnodename>b<verb delimiter=":">  </verb></xrefnodename></ref>
</para>
<para><ref label="c-"><xrefnodename>c<w>  </w></xrefnodename></ref>
</para>';


$result_converted{'docbook'}->{'spaces_in_node_names'} = '<anchor id="chap-"/>

<anchor id="b-"/>

<anchor id="c-"/>

<para><link linkend="chap-">chap&#160;&#160;</link>
</para>
<para><link linkend="b-">b<literal>  </literal></link>
</para>
<para><link linkend="c-">c&amp;#160;<!-- /@w --></link>
</para>';


$result_converted{'latex_text'}->{'spaces_in_node_names'} = '\\begin{document}
\\label{anchor:Top}%
\\label{anchor:chap-}%

\\label{anchor:b-}%

\\label{anchor:c-}%

\\hyperref[anchor:chap-]{[chap\\ {}\\ {}], page~\\pageref*{anchor:chap-}}

\\hyperref[anchor:b-]{[b\\verb:  :], page~\\pageref*{anchor:b-}}

\\hyperref[anchor:c-]{[c\\hbox{  }], page~\\pageref*{anchor:c-}}
';


$result_converted{'info'}->{'spaces_in_node_names'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap  ,  Up: (dir)

* Menu:

* chap  ::
* b  ::
* c ::


File: ,  Node: chap  ,  Next: b  ,  Prev: Top,  Up: Top


File: ,  Node: b  ,  Next: c ,  Prev: chap  ,  Up: Top


File: ,  Node: c ,  Prev: b  ,  Up: Top

*note chap  ::

   *note b  ::

   *note c ::


Tag Table:
Node: Top27
Node: chap  112
Node: b  171
Node: c 229

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
