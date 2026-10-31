use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'top_in_ref'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C2 l1 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
 *@node C7 l3 {chap refs node}
 |EXTRA
 |identifier:{chap-refs-node}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chap refs node}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C56
   *@code C1 l5
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,cross ref name}
     *@}
   { }
   *@ref C2 l5
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
    |normalized:{Top}
     {Top}
    *brace_arg C1
     {cross ref name}
   {\\n}
   *@code C1 l6
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,,title}
     *@}
   { }
   *@ref C3 l6
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
    |normalized:{Top}
     {Top}
    *brace_arg
    *brace_arg C1
     {title}
   {\\n}
   *@code C1 l7
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,,,file name}
     *@}
   { }
   *@ref C4 l7
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l8
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,,,,manual}
     *@}
   { }
   *@ref C5 l8
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l9
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,cross ref name,title,}
     *@}
   { }
   *@ref C4 l9
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
    |normalized:{Top}
     {Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg
   {\\n}
   *@code C1 l10
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,cross ref name,,file name}
     *@}
   { }
   *@ref C4 l10
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l11
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,cross ref name,,,manual}
     *@}
   { }
   *@ref C5 l11
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l12
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,cross ref name,title,file name}
     *@}
   { }
   *@ref C4 l12
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l13
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,cross ref name,title,,manual}
     *@}
   { }
   *@ref C5 l13
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l14
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,cross ref name,title, file name, manual}
     *@}
   { }
   *@ref C5 l14
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg C2
     {spaces_before_argument: }
     {file name}
    *brace_arg C2
     {spaces_before_argument: }
     {manual}
   {\\n}
   *@code C1 l15
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,,title,file name}
     *@}
   { }
   *@ref C4 l15
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l16
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,,title,,manual}
     *@}
   { }
   *@ref C5 l16
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l17
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,,title, file name, manual}
     *@}
   { }
   *@ref C5 l17
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg C2
     {spaces_before_argument: }
     {file name}
    *brace_arg C2
     {spaces_before_argument: }
     {manual}
   {\\n}
   *@code C1 l18
    *brace_container C5
     *@@
     {ref}
     *@{
     {Top,,,file name,manual}
     *@}
   { }
   *@ref C5 l18
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
    *brace_arg C1
     {manual}
   {\\n}
  {empty_line:\\n}
  *paragraph C56
   *@code C1 l20
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,cross ref name}
     *@}
   { }
   *@ref C2 l20
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
    |normalized:{_0028pman_0029Top}
     {(pman)Top}
    *brace_arg C1
     {cross ref name}
   {\\n}
   *@code C1 l21
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,,title}
     *@}
   { }
   *@ref C3 l21
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
    |normalized:{_0028pman_0029Top}
     {(pman)Top}
    *brace_arg
    *brace_arg C1
     {title}
   {\\n}
   *@code C1 l22
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,,,file name}
     *@}
   { }
   *@ref C4 l22
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
     {(pman)Top}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l23
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,,,,manual}
     *@}
   { }
   *@ref C5 l23
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
     {(pman)Top}
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l24
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,cross ref name,title,}
     *@}
   { }
   *@ref C4 l24
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
    |normalized:{_0028pman_0029Top}
     {(pman)Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg
   {\\n}
   *@code C1 l25
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,cross ref name,,file name}
     *@}
   { }
   *@ref C4 l25
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
     {(pman)Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l26
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,cross ref name,,,manual}
     *@}
   { }
   *@ref C5 l26
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
     {(pman)Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l27
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,cross ref name,title,file name}
     *@}
   { }
   *@ref C4 l27
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
     {(pman)Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l28
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,cross ref name,title,,manual}
     *@}
   { }
   *@ref C5 l28
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
     {(pman)Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l29
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,cross ref name,title, file name, manual}
     *@}
   { }
   *@ref C5 l29
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
     {(pman)Top}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg C2
     {spaces_before_argument: }
     {file name}
    *brace_arg C2
     {spaces_before_argument: }
     {manual}
   {\\n}
   *@code C1 l30
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,,title,file name}
     *@}
   { }
   *@ref C4 l30
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
     {(pman)Top}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l31
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,,title,,manual}
     *@}
   { }
   *@ref C5 l31
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
     {(pman)Top}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l32
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,,title, file name, manual}
     *@}
   { }
   *@ref C5 l32
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
     {(pman)Top}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg C2
     {spaces_before_argument: }
     {file name}
    *brace_arg C2
     {spaces_before_argument: }
     {manual}
   {\\n}
   *@code C1 l33
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)Top,,,file name,manual}
     *@}
   { }
   *@ref C5 l33
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)Top}
     {(pman)Top}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
    *brace_arg C1
     {manual}
   {\\n}
  {empty_line:\\n}
  *paragraph C16
   *@code C1 l35
    *brace_container C5
     *@@
     {inforef}
     *@{
     {Top, cross ref name, file name}
     *@}
   { }
   *@inforef C3 l35
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg C2
     {spaces_before_argument: }
     {cross ref name}
    *brace_arg C2
     {spaces_before_argument: }
     {file name}
   {\\n}
   *@code C1 l36
    *brace_container C5
     *@@
     {inforef}
     *@{
     {Top}
     *@}
   { }
   *@inforef C1 l36
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
    |normalized:{Top}
     {Top}
   {\\n}
   *@code C1 l37
    *brace_container C5
     *@@
     {inforef}
     *@{
     {Top, cross ref name}
     *@}
   { }
   *@inforef C2 l37
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
    |normalized:{Top}
     {Top}
    *brace_arg C2
     {spaces_before_argument: }
     {cross ref name}
   {\\n}
   *@code C1 l38
    *brace_container C5
     *@@
     {inforef}
     *@{
     {Top,,file name}
     *@}
   { }
   *@inforef C3 l38
    *brace_arg C1
    |EXTRA
    |node_content:{Top}
     {Top}
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
';


$result_texis{'top_in_ref'} = '@node Top

@node chap refs node

@code{@@ref@{Top,cross ref name@}} @ref{Top,cross ref name}
@code{@@ref@{Top,,title@}} @ref{Top,,title}
@code{@@ref@{Top,,,file name@}} @ref{Top,,,file name}
@code{@@ref@{Top,,,,manual@}} @ref{Top,,,,manual}
@code{@@ref@{Top,cross ref name,title,@}} @ref{Top,cross ref name,title,}
@code{@@ref@{Top,cross ref name,,file name@}} @ref{Top,cross ref name,,file name}
@code{@@ref@{Top,cross ref name,,,manual@}} @ref{Top,cross ref name,,,manual}
@code{@@ref@{Top,cross ref name,title,file name@}} @ref{Top,cross ref name,title,file name}
@code{@@ref@{Top,cross ref name,title,,manual@}} @ref{Top,cross ref name,title,,manual}
@code{@@ref@{Top,cross ref name,title, file name, manual@}} @ref{Top,cross ref name,title, file name, manual}
@code{@@ref@{Top,,title,file name@}} @ref{Top,,title,file name}
@code{@@ref@{Top,,title,,manual@}} @ref{Top,,title,,manual}
@code{@@ref@{Top,,title, file name, manual@}} @ref{Top,,title, file name, manual}
@code{@@ref@{Top,,,file name,manual@}} @ref{Top,,,file name,manual}

@code{@@ref@{(pman)Top,cross ref name@}} @ref{(pman)Top,cross ref name}
@code{@@ref@{(pman)Top,,title@}} @ref{(pman)Top,,title}
@code{@@ref@{(pman)Top,,,file name@}} @ref{(pman)Top,,,file name}
@code{@@ref@{(pman)Top,,,,manual@}} @ref{(pman)Top,,,,manual}
@code{@@ref@{(pman)Top,cross ref name,title,@}} @ref{(pman)Top,cross ref name,title,}
@code{@@ref@{(pman)Top,cross ref name,,file name@}} @ref{(pman)Top,cross ref name,,file name}
@code{@@ref@{(pman)Top,cross ref name,,,manual@}} @ref{(pman)Top,cross ref name,,,manual}
@code{@@ref@{(pman)Top,cross ref name,title,file name@}} @ref{(pman)Top,cross ref name,title,file name}
@code{@@ref@{(pman)Top,cross ref name,title,,manual@}} @ref{(pman)Top,cross ref name,title,,manual}
@code{@@ref@{(pman)Top,cross ref name,title, file name, manual@}} @ref{(pman)Top,cross ref name,title, file name, manual}
@code{@@ref@{(pman)Top,,title,file name@}} @ref{(pman)Top,,title,file name}
@code{@@ref@{(pman)Top,,title,,manual@}} @ref{(pman)Top,,title,,manual}
@code{@@ref@{(pman)Top,,title, file name, manual@}} @ref{(pman)Top,,title, file name, manual}
@code{@@ref@{(pman)Top,,,file name,manual@}} @ref{(pman)Top,,,file name,manual}

@code{@@inforef@{Top, cross ref name, file name@}} @inforef{Top, cross ref name, file name}
@code{@@inforef@{Top@}} @inforef{Top}
@code{@@inforef@{Top, cross ref name@}} @inforef{Top, cross ref name}
@code{@@inforef@{Top,,file name@}} @inforef{Top,,file name}
';


$result_texts{'top_in_ref'} = '

@ref{Top,cross ref name} Top
@ref{Top,,title} Top
@ref{Top,,,file name} Top
@ref{Top,,,,manual} Top
@ref{Top,cross ref name,title,} Top
@ref{Top,cross ref name,,file name} Top
@ref{Top,cross ref name,,,manual} Top
@ref{Top,cross ref name,title,file name} Top
@ref{Top,cross ref name,title,,manual} Top
@ref{Top,cross ref name,title, file name, manual} Top
@ref{Top,,title,file name} Top
@ref{Top,,title,,manual} Top
@ref{Top,,title, file name, manual} Top
@ref{Top,,,file name,manual} Top

@ref{(pman)Top,cross ref name} (pman)Top
@ref{(pman)Top,,title} (pman)Top
@ref{(pman)Top,,,file name} (pman)Top
@ref{(pman)Top,,,,manual} (pman)Top
@ref{(pman)Top,cross ref name,title,} (pman)Top
@ref{(pman)Top,cross ref name,,file name} (pman)Top
@ref{(pman)Top,cross ref name,,,manual} (pman)Top
@ref{(pman)Top,cross ref name,title,file name} (pman)Top
@ref{(pman)Top,cross ref name,title,,manual} (pman)Top
@ref{(pman)Top,cross ref name,title, file name, manual} (pman)Top
@ref{(pman)Top,,title,file name} (pman)Top
@ref{(pman)Top,,title,,manual} (pman)Top
@ref{(pman)Top,,title, file name, manual} (pman)Top
@ref{(pman)Top,,,file name,manual} (pman)Top

@inforef{Top, cross ref name, file name} Top
@inforef{Top} Top
@inforef{Top, cross ref name} Top
@inforef{Top,,file name} Top
';

$result_errors{'top_in_ref'} = '* W l35|@inforef is obsolete
 warning: @inforef is obsolete

* W l36|@inforef is obsolete
 warning: @inforef is obsolete

* WC l36|further warnings for @inforef suppressed
 warning: further warnings for @inforef suppressed

* E l20|@ref reference to nonexistent node `(pman)Top\'
 @ref reference to nonexistent node `(pman)Top\'

* E l21|@ref reference to nonexistent node `(pman)Top\'
 @ref reference to nonexistent node `(pman)Top\'

* E l24|@ref reference to nonexistent node `(pman)Top\'
 @ref reference to nonexistent node `(pman)Top\'

* W l3|node `chap refs node\' not in menu
 warning: node `chap refs node\' not in menu

';

$result_nodes_list{'top_in_ref'} = '1|Top
 node_directions:
  next->chap refs node
2|chap refs node
 node_directions:
  prev->Top
';

$result_sections_list{'top_in_ref'} = '';

$result_sectioning_root{'top_in_ref'} = '';

$result_headings_list{'top_in_ref'} = '';


$result_converted{'plaintext'}->{'top_in_ref'} = '‘@ref{Top,cross ref name}’ cross ref name: Top ‘@ref{Top,,title}’ title:
Top ‘@ref{Top,,,file name}’ (file name)Top ‘@ref{Top,,,,manual}’ Top in
‘manual’ ‘@ref{Top,cross ref name,title,}’ cross ref name: Top
‘@ref{Top,cross ref name,,file name}’ cross ref name: (file name)Top
‘@ref{Top,cross ref name,,,manual}’ cross ref name: Top in ‘manual’
‘@ref{Top,cross ref name,title,file name}’ cross ref name: (file
name)Top ‘@ref{Top,cross ref name,title,,manual}’ cross ref name: Top in
‘manual’ ‘@ref{Top,cross ref name,title, file name, manual}’ cross ref
name: (file name)Top ‘@ref{Top,,title,file name}’ title: (file name)Top
‘@ref{Top,,title,,manual}’ title: Top in ‘manual’ ‘@ref{Top,,title, file
name, manual}’ title: (file name)Top ‘@ref{Top,,,file name,manual}’
(file name)Top

   ‘@ref{(pman)Top,cross ref name}’ cross ref name: (pman)Top
‘@ref{(pman)Top,,title}’ title: (pman)Top ‘@ref{(pman)Top,,,file name}’
(file name)(pman)Top ‘@ref{(pman)Top,,,,manual}’ (pman)Top in ‘manual’
‘@ref{(pman)Top,cross ref name,title,}’ cross ref name: (pman)Top
‘@ref{(pman)Top,cross ref name,,file name}’ cross ref name: (file
name)(pman)Top ‘@ref{(pman)Top,cross ref name,,,manual}’ cross ref name:
(pman)Top in ‘manual’ ‘@ref{(pman)Top,cross ref name,title,file name}’
cross ref name: (file name)(pman)Top ‘@ref{(pman)Top,cross ref
name,title,,manual}’ cross ref name: (pman)Top in ‘manual’
‘@ref{(pman)Top,cross ref name,title, file name, manual}’ cross ref
name: (file name)(pman)Top ‘@ref{(pman)Top,,title,file name}’ title:
(file name)(pman)Top ‘@ref{(pman)Top,,title,,manual}’ title: (pman)Top
in ‘manual’ ‘@ref{(pman)Top,,title, file name, manual}’ title: (file
name)(pman)Top ‘@ref{(pman)Top,,,file name,manual}’ (file name)(pman)Top

   ‘@inforef{Top, cross ref name, file name}’ See cross ref name: (file
name)Top ‘@inforef{Top}’ See Top ‘@inforef{Top, cross ref name}’ See
cross ref name: Top ‘@inforef{Top,,file name}’ See (file name)Top
';


$result_converted{'html_text'}->{'top_in_ref'} = '<h1 class="node" id="Top"><span>Top<a class="copiable-link" href="#Top"> &para;</a></span></h1>

<hr>
<h4 class="node" id="chap-refs-node"><span>chap refs node<a class="copiable-link" href="#chap-refs-node"> &para;</a></span></h4>

<p><code class="code">@ref{Top,cross ref name}</code> <a class="ref" href="#Top">cross ref name</a>
<code class="code">@ref{Top,,title}</code> <a class="ref" href="#Top">title</a>
<code class="code">@ref{Top,,,file name}</code> <a data-manual="file name" href="file%20name.html#Top">(file name)Top</a>
<code class="code">@ref{Top,,,,manual}</code> <cite class="cite">manual</cite>
<code class="code">@ref{Top,cross ref name,title,}</code> <a class="ref" href="#Top">title</a>
<code class="code">@ref{Top,cross ref name,,file name}</code> <a data-manual="file name" href="file%20name.html#Top">cross ref name</a>
<code class="code">@ref{Top,cross ref name,,,manual}</code> &lsquo;cross ref name&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{Top,cross ref name,title,file name}</code> <a data-manual="file name" href="file%20name.html#Top">title</a>
<code class="code">@ref{Top,cross ref name,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{Top,cross ref name,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{Top,,title,file name}</code> <a data-manual="file name" href="file%20name.html#Top">title</a>
<code class="code">@ref{Top,,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{Top,,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{Top,,,file name,manual}</code> <cite class="cite"><a data-manual="file name" href="file%20name.html#Top">manual</a></cite>
</p>
<p><code class="code">@ref{(pman)Top,cross ref name}</code> &lsquo;cross ref name&rsquo;
<code class="code">@ref{(pman)Top,,title}</code> &lsquo;title&rsquo;
<code class="code">@ref{(pman)Top,,,file name}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029Top">(file name)(pman)Top</a>
<code class="code">@ref{(pman)Top,,,,manual}</code> &lsquo;(pman)Top&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)Top,cross ref name,title,}</code> &lsquo;title&rsquo;
<code class="code">@ref{(pman)Top,cross ref name,,file name}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029Top">cross ref name</a>
<code class="code">@ref{(pman)Top,cross ref name,,,manual}</code> &lsquo;cross ref name&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)Top,cross ref name,title,file name}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029Top">title</a>
<code class="code">@ref{(pman)Top,cross ref name,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)Top,cross ref name,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)Top,,title,file name}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029Top">title</a>
<code class="code">@ref{(pman)Top,,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)Top,,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)Top,,,file name,manual}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029Top">(pman)Top</a> in <cite class="cite">manual</cite>
</p>
<p><code class="code">@inforef{Top, cross ref name, file name}</code> See <a data-manual="file name" href="file%20name.html#Top">cross ref name</a>
<code class="code">@inforef{Top}</code> 
<code class="code">@inforef{Top, cross ref name}</code> See &lsquo;cross ref name&rsquo;
<code class="code">@inforef{Top,,file name}</code> See <a data-manual="file name" href="file%20name.html#Top">(file name)Top</a>
</p>';


$result_converted{'xml'}->{'top_in_ref'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap refs node</nodenext></node>

<node identifier="chap-refs-node"><nodename> chap refs node</nodename><nodeprev automatic="on"> Top</nodeprev></node>

<para><code>&arobase;ref&lbrace;Top,cross ref name&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname></ref>
<code>&arobase;ref&lbrace;Top,,title&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc></ref>
<code>&arobase;ref&lbrace;Top,,,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;Top,,,,manual&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,title,&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile></xrefinfofile></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,,,manual&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,title,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,title,,manual&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,cross ref name,title, file name, manual&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,,title,file name&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;Top,,title,,manual&rbrace;</code> <ref label="Top"><xrefnodename>Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,,title, file name, manual&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;Top,,,file name,manual&rbrace;</code> <ref label="Top" manual="file name"><xrefnodename>Top</xrefnodename><xrefinfofile>file name</xrefinfofile><xrefprintedname>manual</xrefprintedname></ref>
</para>
<para><code>&arobase;ref&lbrace;(pman)Top,cross ref name&rbrace;</code> <ref label="_0028pman_0029Top"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname></ref>
<code>&arobase;ref&lbrace;(pman)Top,,title&rbrace;</code> <ref label="_0028pman_0029Top"><xrefnodename>(pman)Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc></ref>
<code>&arobase;ref&lbrace;(pman)Top,,,file name&rbrace;</code> <ref label="_0028pman_0029Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)Top,,,,manual&rbrace;</code> <ref label="_0028pman_0029Top"><xrefnodename>(pman)Top</xrefnodename><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,title,&rbrace;</code> <ref label="_0028pman_0029Top"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile></xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,,file name&rbrace;</code> <ref label="_0028pman_0029Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,,,manual&rbrace;</code> <ref label="_0028pman_0029Top"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,title,file name&rbrace;</code> <ref label="_0028pman_0029Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,title,,manual&rbrace;</code> <ref label="_0028pman_0029Top"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,cross ref name,title, file name, manual&rbrace;</code> <ref label="_0028pman_0029Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,,title,file name&rbrace;</code> <ref label="_0028pman_0029Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)Top,,title,,manual&rbrace;</code> <ref label="_0028pman_0029Top"><xrefnodename>(pman)Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,,title, file name, manual&rbrace;</code> <ref label="_0028pman_0029Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)Top,,,file name,manual&rbrace;</code> <ref label="_0028pman_0029Top" manual="file name"><xrefnodename>(pman)Top</xrefnodename><xrefinfofile>file name</xrefinfofile><xrefprintedname>manual</xrefprintedname></ref>
</para>
<para><code>&arobase;inforef&lbrace;Top, cross ref name, file name&rbrace;</code> <inforef label="Top" manual="file name"><inforefnodename>Top</inforefnodename><inforefrefname> cross ref name</inforefrefname><inforefinfoname> file name</inforefinfoname></inforef>
<code>&arobase;inforef&lbrace;Top&rbrace;</code> <inforef label="Top"><inforefnodename>Top</inforefnodename></inforef>
<code>&arobase;inforef&lbrace;Top, cross ref name&rbrace;</code> <inforef label="Top"><inforefnodename>Top</inforefnodename><inforefrefname> cross ref name</inforefrefname></inforef>
<code>&arobase;inforef&lbrace;Top,,file name&rbrace;</code> <inforef label="Top" manual="file name"><inforefnodename>Top</inforefnodename><inforefinfoname>file name</inforefinfoname></inforef>
</para>';


$result_converted{'docbook'}->{'top_in_ref'} = '<anchor id="chap-refs-node"/>

<para><literal>@ref{Top,cross ref name}</literal> <link linkend="Top">cross ref name</link>
<literal>@ref{Top,,title}</literal> <link linkend="Top">title</link>
<literal>@ref{Top,,,file name}</literal> <filename>file name</filename>
<literal>@ref{Top,,,,manual}</literal> <citetitle>manual</citetitle>
<literal>@ref{Top,cross ref name,title,}</literal> <link linkend="Top">title</link>
<literal>@ref{Top,cross ref name,,file name}</literal> section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@ref{Top,cross ref name,,,manual}</literal> section &#8220;cross ref name&#8221; in <citetitle>manual</citetitle>
<literal>@ref{Top,cross ref name,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{Top,cross ref name,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{Top,cross ref name,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{Top,,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{Top,,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{Top,,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{Top,,,file name,manual}</literal> <citetitle>manual</citetitle>
</para>
<para><literal>@ref{(pman)Top,cross ref name}</literal> <link linkend="_0028pman_0029Top">cross ref name</link>
<literal>@ref{(pman)Top,,title}</literal> <link linkend="_0028pman_0029Top">title</link>
<literal>@ref{(pman)Top,,,file name}</literal> &#8220;(pman)Top&#8221; in <filename>file name</filename>
<literal>@ref{(pman)Top,,,,manual}</literal> &#8220;(pman)Top&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,cross ref name,title,}</literal> <link linkend="_0028pman_0029Top">title</link>
<literal>@ref{(pman)Top,cross ref name,,file name}</literal> section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@ref{(pman)Top,cross ref name,,,manual}</literal> section &#8220;cross ref name&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,cross ref name,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{(pman)Top,cross ref name,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,cross ref name,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{(pman)Top,,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)Top,,,file name,manual}</literal> &#8220;(pman)Top&#8221; in <citetitle>manual</citetitle>
</para>
<para><literal>@inforef{Top, cross ref name, file name}</literal> See section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@inforef{Top}</literal> 
<literal>@inforef{Top, cross ref name}</literal> 
<literal>@inforef{Top,,file name}</literal> See <filename>file name</filename>
</para>';


$result_converted{'latex_text'}->{'top_in_ref'} = '\\begin{document}
\\label{anchor:Top}%
\\label{anchor:chap-refs-node}%

\\texttt{@ref\\{Top,cross ref name\\}} \\hyperref[anchor:Top]{[Top], page~\\pageref*{anchor:Top}}
\\texttt{@ref\\{Top{,}{,}title\\}} \\hyperref[anchor:Top]{[title], page~\\pageref*{anchor:Top}}
\\texttt{@ref\\{Top{,}{,},file name\\}} Section ``Top\'\' in \\texttt{file name}
\\texttt{@ref\\{Top{,}{,}{,}{,}manual\\}} Section ``Top\'\' in \\textsl{manual}
\\texttt{@ref\\{Top,cross ref name,title,\\}} \\hyperref[anchor:Top]{[title], page~\\pageref*{anchor:Top}}
\\texttt{@ref\\{Top,cross ref name{,}{,}file name\\}} Section ``Top\'\' in \\texttt{file name}
\\texttt{@ref\\{Top,cross ref name{,}{,},manual\\}} Section ``Top\'\' in \\textsl{manual}
\\texttt{@ref\\{Top,cross ref name,title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{Top,cross ref name,title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{Top,cross ref name,title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{Top{,}{,}title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{Top{,}{,}title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{Top{,}{,}title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{Top{,}{,},file name,manual\\}} Section ``Top\'\' in \\textsl{manual}

\\texttt{@ref\\{(pman)Top,cross ref name\\}} (pman)Top
\\texttt{@ref\\{(pman)Top{,}{,}title\\}} title
\\texttt{@ref\\{(pman)Top{,}{,},file name\\}} Section ``(pman)Top\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)Top{,}{,}{,}{,}manual\\}} Section ``(pman)Top\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top,cross ref name,title,\\}} title
\\texttt{@ref\\{(pman)Top,cross ref name{,}{,}file name\\}} Section ``(pman)Top\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)Top,cross ref name{,}{,},manual\\}} Section ``(pman)Top\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top,cross ref name,title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)Top,cross ref name,title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top,cross ref name,title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top{,}{,}title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)Top{,}{,}title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top{,}{,}title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)Top{,}{,},file name,manual\\}} Section ``(pman)Top\'\' in \\textsl{manual}

\\texttt{@inforef\\{Top,\\ cross ref name,\\ file name\\}} Section ``Top\'\' in \\texttt{file name}
\\texttt{@inforef\\{Top\\}} Top
\\texttt{@inforef\\{Top,\\ cross ref name\\}} Top
\\texttt{@inforef\\{Top{,}{,}file name\\}} Section ``Top\'\' in \\texttt{file name}
';


$result_converted{'info'}->{'top_in_ref'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap refs node,  Up: (dir)


File: ,  Node: chap refs node,  Prev: Top

‘@ref{Top,cross ref name}’ *note cross ref name: Top. ‘@ref{Top,,title}’
*note title: Top. ‘@ref{Top,,,file name}’ *note (file name)Top::
‘@ref{Top,,,,manual}’ *note ()Top:: ‘@ref{Top,cross ref name,title,}’
*note cross ref name: Top. ‘@ref{Top,cross ref name,,file name}’ *note
cross ref name: (file name)Top. ‘@ref{Top,cross ref name,,,manual}’
*note cross ref name: ()Top. ‘@ref{Top,cross ref name,title,file name}’
*note cross ref name: (file name)Top. ‘@ref{Top,cross ref
name,title,,manual}’ *note cross ref name: ()Top. ‘@ref{Top,cross ref
name,title, file name, manual}’ *note cross ref name: (file name)Top.
‘@ref{Top,,title,file name}’ *note title: (file name)Top.
‘@ref{Top,,title,,manual}’ *note title: ()Top. ‘@ref{Top,,title, file
name, manual}’ *note title: (file name)Top. ‘@ref{Top,,,file
name,manual}’ *note (file name)Top::

   ‘@ref{(pman)Top,cross ref name}’ *note cross ref name: (pman)Top.
‘@ref{(pman)Top,,title}’ *note title: (pman)Top. ‘@ref{(pman)Top,,,file
name}’ *note (file name)(pman)Top:: ‘@ref{(pman)Top,,,,manual}’ *note
()(pman)Top:: ‘@ref{(pman)Top,cross ref name,title,}’ *note cross ref
name: (pman)Top. ‘@ref{(pman)Top,cross ref name,,file name}’ *note cross
ref name: (file name)(pman)Top. ‘@ref{(pman)Top,cross ref
name,,,manual}’ *note cross ref name: ()(pman)Top. ‘@ref{(pman)Top,cross
ref name,title,file name}’ *note cross ref name: (file name)(pman)Top.
‘@ref{(pman)Top,cross ref name,title,,manual}’ *note cross ref name:
()(pman)Top. ‘@ref{(pman)Top,cross ref name,title, file name, manual}’
*note cross ref name: (file name)(pman)Top. ‘@ref{(pman)Top,,title,file
name}’ *note title: (file name)(pman)Top.
‘@ref{(pman)Top,,title,,manual}’ *note title: ()(pman)Top.
‘@ref{(pman)Top,,title, file name, manual}’ *note title: (file
name)(pman)Top. ‘@ref{(pman)Top,,,file name,manual}’ *note (file
name)(pman)Top::

   ‘@inforef{Top, cross ref name, file name}’ *note cross ref name:
(file name)Top. ‘@inforef{Top}’ *note Top:: ‘@inforef{Top, cross ref
name}’ *note cross ref name: Top. ‘@inforef{Top,,file name}’ *note (file
name)Top::


Tag Table:
Node: Top27
Node: chap refs node84

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
