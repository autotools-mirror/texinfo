use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'refs_formatting'} = '*document_root C3
 *before_node_section C1
  *preamble_before_content
 *@node C1 l1 {chapter}
 |EXTRA
 |identifier:{chapter}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter}
    {spaces_after_argument:\\n}
 *@chapter C7 l2 {chapter}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C56
   *@code C1 l4
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,cross ref name}
     *@}
   { }
   *@ref C2 l4
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
    |normalized:{chapter}
     {chapter}
    *brace_arg C1
     {cross ref name}
   {\\n}
   *@code C1 l5
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,,title}
     *@}
   { }
   *@ref C3 l5
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
    |normalized:{chapter}
     {chapter}
    *brace_arg
    *brace_arg C1
     {title}
   {\\n}
   *@code C1 l6
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,,,file name}
     *@}
   { }
   *@ref C4 l6
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l7
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,,,,manual}
     *@}
   { }
   *@ref C5 l7
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l8
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,cross ref name,title,}
     *@}
   { }
   *@ref C4 l8
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
    |normalized:{chapter}
     {chapter}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg
   {\\n}
   *@code C1 l9
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,cross ref name,,file name}
     *@}
   { }
   *@ref C4 l9
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l10
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,cross ref name,,,manual}
     *@}
   { }
   *@ref C5 l10
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l11
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,cross ref name,title,file name}
     *@}
   { }
   *@ref C4 l11
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l12
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,cross ref name,title,,manual}
     *@}
   { }
   *@ref C5 l12
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l13
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,cross ref name,title, file name, manual}
     *@}
   { }
   *@ref C5 l13
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
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
   *@code C1 l14
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,,title,file name}
     *@}
   { }
   *@ref C4 l14
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l15
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,,title,,manual}
     *@}
   { }
   *@ref C5 l15
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l16
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,,title, file name, manual}
     *@}
   { }
   *@ref C5 l16
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
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
   *@code C1 l17
    *brace_container C5
     *@@
     {ref}
     *@{
     {chapter,,,file name,manual}
     *@}
   { }
   *@ref C5 l17
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
    *brace_arg C1
     {manual}
   {\\n}
  {empty_line:\\n}
  *paragraph C56
   *@code C1 l19
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,cross ref name}
     *@}
   { }
   *@ref C2 l19
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
    |normalized:{_0028pman_0029anode}
     {(pman)anode}
    *brace_arg C1
     {cross ref name}
   {\\n}
   *@code C1 l20
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,,title}
     *@}
   { }
   *@ref C3 l20
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
    |normalized:{_0028pman_0029anode}
     {(pman)anode}
    *brace_arg
    *brace_arg C1
     {title}
   {\\n}
   *@code C1 l21
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,,,file name}
     *@}
   { }
   *@ref C4 l21
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
     {(pman)anode}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l22
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,,,,manual}
     *@}
   { }
   *@ref C5 l22
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
     {(pman)anode}
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l23
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,cross ref name,title,}
     *@}
   { }
   *@ref C4 l23
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
    |normalized:{_0028pman_0029anode}
     {(pman)anode}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg
   {\\n}
   *@code C1 l24
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,cross ref name,,file name}
     *@}
   { }
   *@ref C4 l24
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
     {(pman)anode}
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l25
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,cross ref name,,,manual}
     *@}
   { }
   *@ref C5 l25
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
     {(pman)anode}
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l26
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,cross ref name,title,file name}
     *@}
   { }
   *@ref C4 l26
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
     {(pman)anode}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l27
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,cross ref name,title,,manual}
     *@}
   { }
   *@ref C5 l27
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
     {(pman)anode}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l28
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,cross ref name,title, file name, manual}
     *@}
   { }
   *@ref C5 l28
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
     {(pman)anode}
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
   *@code C1 l29
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,,title,file name}
     *@}
   { }
   *@ref C4 l29
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
     {(pman)anode}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l30
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,,title,,manual}
     *@}
   { }
   *@ref C5 l30
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
     {(pman)anode}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l31
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,,title, file name, manual}
     *@}
   { }
   *@ref C5 l31
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
     {(pman)anode}
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
   *@code C1 l32
    *brace_container C5
     *@@
     {ref}
     *@{
     {(pman)anode,,,file name,manual}
     *@}
   { }
   *@ref C5 l32
    *brace_arg C1
    |EXTRA
    |node_content:{(pman)anode}
     {(pman)anode}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
    *brace_arg C1
     {manual}
   {\\n}
  {empty_line:\\n}
  *paragraph C16
   *@code C1 l34
    *brace_container C5
     *@@
     {inforef}
     *@{
     {chapter, cross ref name, file name}
     *@}
   { }
   *@inforef C3 l34
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
    *brace_arg C2
     {spaces_before_argument: }
     {cross ref name}
    *brace_arg C2
     {spaces_before_argument: }
     {file name}
   {\\n}
   *@code C1 l35
    *brace_container C5
     *@@
     {inforef}
     *@{
     {chapter}
     *@}
   { }
   *@inforef C1 l35
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
    |normalized:{chapter}
     {chapter}
   {\\n}
   *@code C1 l36
    *brace_container C5
     *@@
     {inforef}
     *@{
     {chapter, cross ref name}
     *@}
   { }
   *@inforef C2 l36
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
    |normalized:{chapter}
     {chapter}
    *brace_arg C2
     {spaces_before_argument: }
     {cross ref name}
   {\\n}
   *@code C1 l37
    *brace_container C5
     *@@
     {inforef}
     *@{
     {chapter,,file name}
     *@}
   { }
   *@inforef C3 l37
    *brace_arg C1
    |EXTRA
    |node_content:{chapter}
     {chapter}
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
';


$result_texis{'refs_formatting'} = '@node chapter
@chapter chapter

@code{@@ref@{chapter,cross ref name@}} @ref{chapter,cross ref name}
@code{@@ref@{chapter,,title@}} @ref{chapter,,title}
@code{@@ref@{chapter,,,file name@}} @ref{chapter,,,file name}
@code{@@ref@{chapter,,,,manual@}} @ref{chapter,,,,manual}
@code{@@ref@{chapter,cross ref name,title,@}} @ref{chapter,cross ref name,title,}
@code{@@ref@{chapter,cross ref name,,file name@}} @ref{chapter,cross ref name,,file name}
@code{@@ref@{chapter,cross ref name,,,manual@}} @ref{chapter,cross ref name,,,manual}
@code{@@ref@{chapter,cross ref name,title,file name@}} @ref{chapter,cross ref name,title,file name}
@code{@@ref@{chapter,cross ref name,title,,manual@}} @ref{chapter,cross ref name,title,,manual}
@code{@@ref@{chapter,cross ref name,title, file name, manual@}} @ref{chapter,cross ref name,title, file name, manual}
@code{@@ref@{chapter,,title,file name@}} @ref{chapter,,title,file name}
@code{@@ref@{chapter,,title,,manual@}} @ref{chapter,,title,,manual}
@code{@@ref@{chapter,,title, file name, manual@}} @ref{chapter,,title, file name, manual}
@code{@@ref@{chapter,,,file name,manual@}} @ref{chapter,,,file name,manual}

@code{@@ref@{(pman)anode,cross ref name@}} @ref{(pman)anode,cross ref name}
@code{@@ref@{(pman)anode,,title@}} @ref{(pman)anode,,title}
@code{@@ref@{(pman)anode,,,file name@}} @ref{(pman)anode,,,file name}
@code{@@ref@{(pman)anode,,,,manual@}} @ref{(pman)anode,,,,manual}
@code{@@ref@{(pman)anode,cross ref name,title,@}} @ref{(pman)anode,cross ref name,title,}
@code{@@ref@{(pman)anode,cross ref name,,file name@}} @ref{(pman)anode,cross ref name,,file name}
@code{@@ref@{(pman)anode,cross ref name,,,manual@}} @ref{(pman)anode,cross ref name,,,manual}
@code{@@ref@{(pman)anode,cross ref name,title,file name@}} @ref{(pman)anode,cross ref name,title,file name}
@code{@@ref@{(pman)anode,cross ref name,title,,manual@}} @ref{(pman)anode,cross ref name,title,,manual}
@code{@@ref@{(pman)anode,cross ref name,title, file name, manual@}} @ref{(pman)anode,cross ref name,title, file name, manual}
@code{@@ref@{(pman)anode,,title,file name@}} @ref{(pman)anode,,title,file name}
@code{@@ref@{(pman)anode,,title,,manual@}} @ref{(pman)anode,,title,,manual}
@code{@@ref@{(pman)anode,,title, file name, manual@}} @ref{(pman)anode,,title, file name, manual}
@code{@@ref@{(pman)anode,,,file name,manual@}} @ref{(pman)anode,,,file name,manual}

@code{@@inforef@{chapter, cross ref name, file name@}} @inforef{chapter, cross ref name, file name}
@code{@@inforef@{chapter@}} @inforef{chapter}
@code{@@inforef@{chapter, cross ref name@}} @inforef{chapter, cross ref name}
@code{@@inforef@{chapter,,file name@}} @inforef{chapter,,file name}
';


$result_texts{'refs_formatting'} = '1 chapter
*********

@ref{chapter,cross ref name} chapter
@ref{chapter,,title} chapter
@ref{chapter,,,file name} chapter
@ref{chapter,,,,manual} chapter
@ref{chapter,cross ref name,title,} chapter
@ref{chapter,cross ref name,,file name} chapter
@ref{chapter,cross ref name,,,manual} chapter
@ref{chapter,cross ref name,title,file name} chapter
@ref{chapter,cross ref name,title,,manual} chapter
@ref{chapter,cross ref name,title, file name, manual} chapter
@ref{chapter,,title,file name} chapter
@ref{chapter,,title,,manual} chapter
@ref{chapter,,title, file name, manual} chapter
@ref{chapter,,,file name,manual} chapter

@ref{(pman)anode,cross ref name} (pman)anode
@ref{(pman)anode,,title} (pman)anode
@ref{(pman)anode,,,file name} (pman)anode
@ref{(pman)anode,,,,manual} (pman)anode
@ref{(pman)anode,cross ref name,title,} (pman)anode
@ref{(pman)anode,cross ref name,,file name} (pman)anode
@ref{(pman)anode,cross ref name,,,manual} (pman)anode
@ref{(pman)anode,cross ref name,title,file name} (pman)anode
@ref{(pman)anode,cross ref name,title,,manual} (pman)anode
@ref{(pman)anode,cross ref name,title, file name, manual} (pman)anode
@ref{(pman)anode,,title,file name} (pman)anode
@ref{(pman)anode,,title,,manual} (pman)anode
@ref{(pman)anode,,title, file name, manual} (pman)anode
@ref{(pman)anode,,,file name,manual} (pman)anode

@inforef{chapter, cross ref name, file name} chapter
@inforef{chapter} chapter
@inforef{chapter, cross ref name} chapter
@inforef{chapter,,file name} chapter
';

$result_errors{'refs_formatting'} = '* W l34|@inforef is obsolete
 warning: @inforef is obsolete

* W l35|@inforef is obsolete
 warning: @inforef is obsolete

* WC l35|further warnings for @inforef suppressed
 warning: further warnings for @inforef suppressed

* E l19|@ref reference to nonexistent node `(pman)anode\'
 @ref reference to nonexistent node `(pman)anode\'

* E l20|@ref reference to nonexistent node `(pman)anode\'
 @ref reference to nonexistent node `(pman)anode\'

* E l23|@ref reference to nonexistent node `(pman)anode\'
 @ref reference to nonexistent node `(pman)anode\'

';

$result_nodes_list{'refs_formatting'} = '1|chapter
 associated_section: 1 chapter
 associated_title_command: 1 chapter
';

$result_sections_list{'refs_formatting'} = '1|chapter
 associated_anchor_command: chapter
 associated_node: chapter
';

$result_sectioning_root{'refs_formatting'} = 'level: 0
list:
 1|chapter
';

$result_headings_list{'refs_formatting'} = '';


$result_converted{'plaintext'}->{'refs_formatting'} = '1 chapter
*********

‘@ref{chapter,cross ref name}’ cross ref name: chapter
‘@ref{chapter,,title}’ title: chapter ‘@ref{chapter,,,file name}’ (file
name)chapter ‘@ref{chapter,,,,manual}’ chapter in ‘manual’
‘@ref{chapter,cross ref name,title,}’ cross ref name: chapter
‘@ref{chapter,cross ref name,,file name}’ cross ref name: (file
name)chapter ‘@ref{chapter,cross ref name,,,manual}’ cross ref name:
chapter in ‘manual’ ‘@ref{chapter,cross ref name,title,file name}’ cross
ref name: (file name)chapter ‘@ref{chapter,cross ref
name,title,,manual}’ cross ref name: chapter in ‘manual’
‘@ref{chapter,cross ref name,title, file name, manual}’ cross ref name:
(file name)chapter ‘@ref{chapter,,title,file name}’ title: (file
name)chapter ‘@ref{chapter,,title,,manual}’ title: chapter in ‘manual’
‘@ref{chapter,,title, file name, manual}’ title: (file name)chapter
‘@ref{chapter,,,file name,manual}’ (file name)chapter

   ‘@ref{(pman)anode,cross ref name}’ cross ref name: (pman)anode
‘@ref{(pman)anode,,title}’ title: (pman)anode ‘@ref{(pman)anode,,,file
name}’ (file name)(pman)anode ‘@ref{(pman)anode,,,,manual}’ (pman)anode
in ‘manual’ ‘@ref{(pman)anode,cross ref name,title,}’ cross ref name:
(pman)anode ‘@ref{(pman)anode,cross ref name,,file name}’ cross ref
name: (file name)(pman)anode ‘@ref{(pman)anode,cross ref name,,,manual}’
cross ref name: (pman)anode in ‘manual’ ‘@ref{(pman)anode,cross ref
name,title,file name}’ cross ref name: (file name)(pman)anode
‘@ref{(pman)anode,cross ref name,title,,manual}’ cross ref name:
(pman)anode in ‘manual’ ‘@ref{(pman)anode,cross ref name,title, file
name, manual}’ cross ref name: (file name)(pman)anode
‘@ref{(pman)anode,,title,file name}’ title: (file name)(pman)anode
‘@ref{(pman)anode,,title,,manual}’ title: (pman)anode in ‘manual’
‘@ref{(pman)anode,,title, file name, manual}’ title: (file
name)(pman)anode ‘@ref{(pman)anode,,,file name,manual}’ (file
name)(pman)anode

   ‘@inforef{chapter, cross ref name, file name}’ See cross ref name:
(file name)chapter ‘@inforef{chapter}’ See chapter ‘@inforef{chapter,
cross ref name}’ See cross ref name: chapter ‘@inforef{chapter,,file
name}’ See (file name)chapter
';


$result_converted{'html_text'}->{'refs_formatting'} = '<div class="chapter-level-extent" id="chapter">
<h2 class="chapter" id="chapter-1"><span>1 chapter<a class="copiable-link" href="#chapter-1"> &para;</a></span></h2>

<p><code class="code">@ref{chapter,cross ref name}</code> <a class="ref" href="#chapter">cross ref name</a>
<code class="code">@ref{chapter,,title}</code> <a class="ref" href="#chapter">title</a>
<code class="code">@ref{chapter,,,file name}</code> <a data-manual="file name" href="file%20name.html#chapter">(file name)chapter</a>
<code class="code">@ref{chapter,,,,manual}</code> &lsquo;chapter&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{chapter,cross ref name,title,}</code> <a class="ref" href="#chapter">title</a>
<code class="code">@ref{chapter,cross ref name,,file name}</code> <a data-manual="file name" href="file%20name.html#chapter">cross ref name</a>
<code class="code">@ref{chapter,cross ref name,,,manual}</code> &lsquo;cross ref name&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{chapter,cross ref name,title,file name}</code> <a data-manual="file name" href="file%20name.html#chapter">title</a>
<code class="code">@ref{chapter,cross ref name,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{chapter,cross ref name,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#chapter">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{chapter,,title,file name}</code> <a data-manual="file name" href="file%20name.html#chapter">title</a>
<code class="code">@ref{chapter,,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{chapter,,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#chapter">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{chapter,,,file name,manual}</code> <a data-manual="file name" href="file%20name.html#chapter">chapter</a> in <cite class="cite">manual</cite>
</p>
<p><code class="code">@ref{(pman)anode,cross ref name}</code> &lsquo;cross ref name&rsquo;
<code class="code">@ref{(pman)anode,,title}</code> &lsquo;title&rsquo;
<code class="code">@ref{(pman)anode,,,file name}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029anode">(file name)(pman)anode</a>
<code class="code">@ref{(pman)anode,,,,manual}</code> &lsquo;(pman)anode&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)anode,cross ref name,title,}</code> &lsquo;title&rsquo;
<code class="code">@ref{(pman)anode,cross ref name,,file name}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029anode">cross ref name</a>
<code class="code">@ref{(pman)anode,cross ref name,,,manual}</code> &lsquo;cross ref name&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)anode,cross ref name,title,file name}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029anode">title</a>
<code class="code">@ref{(pman)anode,cross ref name,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)anode,cross ref name,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029anode">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)anode,,title,file name}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029anode">title</a>
<code class="code">@ref{(pman)anode,,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)anode,,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029anode">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{(pman)anode,,,file name,manual}</code> <a data-manual="file name" href="file%20name.html#g_t_0028pman_0029anode">(pman)anode</a> in <cite class="cite">manual</cite>
</p>
<p><code class="code">@inforef{chapter, cross ref name, file name}</code> See <a data-manual="file name" href="file%20name.html#chapter">cross ref name</a>
<code class="code">@inforef{chapter}</code> See &lsquo;chapter&rsquo;
<code class="code">@inforef{chapter, cross ref name}</code> See &lsquo;cross ref name&rsquo;
<code class="code">@inforef{chapter,,file name}</code> See <a data-manual="file name" href="file%20name.html#chapter">(file name)chapter</a>
</p></div>
';


$result_converted{'xml'}->{'refs_formatting'} = '<node identifier="chapter"><nodename> chapter</nodename></node>
<chapter><sectiontitle> chapter</sectiontitle>

<para><code>&arobase;ref&lbrace;chapter,cross ref name&rbrace;</code> <ref label="chapter"><xrefnodename>chapter</xrefnodename><xrefinfoname>cross ref name</xrefinfoname></ref>
<code>&arobase;ref&lbrace;chapter,,title&rbrace;</code> <ref label="chapter"><xrefnodename>chapter</xrefnodename><xrefprinteddesc>title</xrefprinteddesc></ref>
<code>&arobase;ref&lbrace;chapter,,,file name&rbrace;</code> <ref label="chapter" manual="file name"><xrefnodename>chapter</xrefnodename><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;chapter,,,,manual&rbrace;</code> <ref label="chapter"><xrefnodename>chapter</xrefnodename><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;chapter,cross ref name,title,&rbrace;</code> <ref label="chapter"><xrefnodename>chapter</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile></xrefinfofile></ref>
<code>&arobase;ref&lbrace;chapter,cross ref name,,file name&rbrace;</code> <ref label="chapter" manual="file name"><xrefnodename>chapter</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;chapter,cross ref name,,,manual&rbrace;</code> <ref label="chapter"><xrefnodename>chapter</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;chapter,cross ref name,title,file name&rbrace;</code> <ref label="chapter" manual="file name"><xrefnodename>chapter</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;chapter,cross ref name,title,,manual&rbrace;</code> <ref label="chapter"><xrefnodename>chapter</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;chapter,cross ref name,title, file name, manual&rbrace;</code> <ref label="chapter" manual="file name"><xrefnodename>chapter</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;chapter,,title,file name&rbrace;</code> <ref label="chapter" manual="file name"><xrefnodename>chapter</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;chapter,,title,,manual&rbrace;</code> <ref label="chapter"><xrefnodename>chapter</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;chapter,,title, file name, manual&rbrace;</code> <ref label="chapter" manual="file name"><xrefnodename>chapter</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;chapter,,,file name,manual&rbrace;</code> <ref label="chapter" manual="file name"><xrefnodename>chapter</xrefnodename><xrefinfofile>file name</xrefinfofile><xrefprintedname>manual</xrefprintedname></ref>
</para>
<para><code>&arobase;ref&lbrace;(pman)anode,cross ref name&rbrace;</code> <ref label="_0028pman_0029anode"><xrefnodename>(pman)anode</xrefnodename><xrefinfoname>cross ref name</xrefinfoname></ref>
<code>&arobase;ref&lbrace;(pman)anode,,title&rbrace;</code> <ref label="_0028pman_0029anode"><xrefnodename>(pman)anode</xrefnodename><xrefprinteddesc>title</xrefprinteddesc></ref>
<code>&arobase;ref&lbrace;(pman)anode,,,file name&rbrace;</code> <ref label="_0028pman_0029anode" manual="file name"><xrefnodename>(pman)anode</xrefnodename><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)anode,,,,manual&rbrace;</code> <ref label="_0028pman_0029anode"><xrefnodename>(pman)anode</xrefnodename><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)anode,cross ref name,title,&rbrace;</code> <ref label="_0028pman_0029anode"><xrefnodename>(pman)anode</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile></xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)anode,cross ref name,,file name&rbrace;</code> <ref label="_0028pman_0029anode" manual="file name"><xrefnodename>(pman)anode</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)anode,cross ref name,,,manual&rbrace;</code> <ref label="_0028pman_0029anode"><xrefnodename>(pman)anode</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)anode,cross ref name,title,file name&rbrace;</code> <ref label="_0028pman_0029anode" manual="file name"><xrefnodename>(pman)anode</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)anode,cross ref name,title,,manual&rbrace;</code> <ref label="_0028pman_0029anode"><xrefnodename>(pman)anode</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)anode,cross ref name,title, file name, manual&rbrace;</code> <ref label="_0028pman_0029anode" manual="file name"><xrefnodename>(pman)anode</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)anode,,title,file name&rbrace;</code> <ref label="_0028pman_0029anode" manual="file name"><xrefnodename>(pman)anode</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;(pman)anode,,title,,manual&rbrace;</code> <ref label="_0028pman_0029anode"><xrefnodename>(pman)anode</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)anode,,title, file name, manual&rbrace;</code> <ref label="_0028pman_0029anode" manual="file name"><xrefnodename>(pman)anode</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;(pman)anode,,,file name,manual&rbrace;</code> <ref label="_0028pman_0029anode" manual="file name"><xrefnodename>(pman)anode</xrefnodename><xrefinfofile>file name</xrefinfofile><xrefprintedname>manual</xrefprintedname></ref>
</para>
<para><code>&arobase;inforef&lbrace;chapter, cross ref name, file name&rbrace;</code> <inforef label="chapter" manual="file name"><inforefnodename>chapter</inforefnodename><inforefrefname> cross ref name</inforefrefname><inforefinfoname> file name</inforefinfoname></inforef>
<code>&arobase;inforef&lbrace;chapter&rbrace;</code> <inforef label="chapter"><inforefnodename>chapter</inforefnodename></inforef>
<code>&arobase;inforef&lbrace;chapter, cross ref name&rbrace;</code> <inforef label="chapter"><inforefnodename>chapter</inforefnodename><inforefrefname> cross ref name</inforefrefname></inforef>
<code>&arobase;inforef&lbrace;chapter,,file name&rbrace;</code> <inforef label="chapter" manual="file name"><inforefnodename>chapter</inforefnodename><inforefinfoname>file name</inforefinfoname></inforef>
</para></chapter>
';


$result_converted{'docbook'}->{'refs_formatting'} = '<chapter label="1" id="chapter">
<title>chapter</title>

<para><literal>@ref{chapter,cross ref name}</literal> <link linkend="chapter">cross ref name</link>
<literal>@ref{chapter,,title}</literal> <link linkend="chapter">title</link>
<literal>@ref{chapter,,,file name}</literal> &#8220;chapter&#8221; in <filename>file name</filename>
<literal>@ref{chapter,,,,manual}</literal> &#8220;chapter&#8221; in <citetitle>manual</citetitle>
<literal>@ref{chapter,cross ref name,title,}</literal> <link linkend="chapter">title</link>
<literal>@ref{chapter,cross ref name,,file name}</literal> section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@ref{chapter,cross ref name,,,manual}</literal> section &#8220;cross ref name&#8221; in <citetitle>manual</citetitle>
<literal>@ref{chapter,cross ref name,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{chapter,cross ref name,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{chapter,cross ref name,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{chapter,,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{chapter,,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{chapter,,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{chapter,,,file name,manual}</literal> &#8220;chapter&#8221; in <citetitle>manual</citetitle>
</para>
<para><literal>@ref{(pman)anode,cross ref name}</literal> <link linkend="_0028pman_0029anode">cross ref name</link>
<literal>@ref{(pman)anode,,title}</literal> <link linkend="_0028pman_0029anode">title</link>
<literal>@ref{(pman)anode,,,file name}</literal> &#8220;(pman)anode&#8221; in <filename>file name</filename>
<literal>@ref{(pman)anode,,,,manual}</literal> &#8220;(pman)anode&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)anode,cross ref name,title,}</literal> <link linkend="_0028pman_0029anode">title</link>
<literal>@ref{(pman)anode,cross ref name,,file name}</literal> section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@ref{(pman)anode,cross ref name,,,manual}</literal> section &#8220;cross ref name&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)anode,cross ref name,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{(pman)anode,cross ref name,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)anode,cross ref name,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)anode,,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{(pman)anode,,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)anode,,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{(pman)anode,,,file name,manual}</literal> &#8220;(pman)anode&#8221; in <citetitle>manual</citetitle>
</para>
<para><literal>@inforef{chapter, cross ref name, file name}</literal> See section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@inforef{chapter}</literal> 
<literal>@inforef{chapter, cross ref name}</literal> 
<literal>@inforef{chapter,,file name}</literal> See &#8220;chapter&#8221; in <filename>file name</filename>
</para></chapter>
';


$result_converted{'latex_text'}->{'refs_formatting'} = '\\begin{document}
\\Texinfochapter{{chapter}}
\\label{anchor:chapter}%

\\texttt{@ref\\{chapter,cross ref name\\}} \\hyperref[anchor:chapter]{\\chaptername~\\ref*{anchor:chapter} [chapter], page~\\pageref*{anchor:chapter}}
\\texttt{@ref\\{chapter{,}{,}title\\}} \\hyperref[anchor:chapter]{\\chaptername~\\ref*{anchor:chapter} [title], page~\\pageref*{anchor:chapter}}
\\texttt{@ref\\{chapter{,}{,},file name\\}} Section ``chapter\'\' in \\texttt{file name}
\\texttt{@ref\\{chapter{,}{,}{,}{,}manual\\}} Section ``chapter\'\' in \\textsl{manual}
\\texttt{@ref\\{chapter,cross ref name,title,\\}} \\hyperref[anchor:chapter]{\\chaptername~\\ref*{anchor:chapter} [title], page~\\pageref*{anchor:chapter}}
\\texttt{@ref\\{chapter,cross ref name{,}{,}file name\\}} Section ``chapter\'\' in \\texttt{file name}
\\texttt{@ref\\{chapter,cross ref name{,}{,},manual\\}} Section ``chapter\'\' in \\textsl{manual}
\\texttt{@ref\\{chapter,cross ref name,title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{chapter,cross ref name,title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{chapter,cross ref name,title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{chapter{,}{,}title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{chapter{,}{,}title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{chapter{,}{,}title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{chapter{,}{,},file name,manual\\}} Section ``chapter\'\' in \\textsl{manual}

\\texttt{@ref\\{(pman)anode,cross ref name\\}} (pman)anode
\\texttt{@ref\\{(pman)anode{,}{,}title\\}} title
\\texttt{@ref\\{(pman)anode{,}{,},file name\\}} Section ``(pman)anode\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)anode{,}{,}{,}{,}manual\\}} Section ``(pman)anode\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)anode,cross ref name,title,\\}} title
\\texttt{@ref\\{(pman)anode,cross ref name{,}{,}file name\\}} Section ``(pman)anode\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)anode,cross ref name{,}{,},manual\\}} Section ``(pman)anode\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)anode,cross ref name,title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)anode,cross ref name,title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)anode,cross ref name,title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)anode{,}{,}title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{(pman)anode{,}{,}title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)anode{,}{,}title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{(pman)anode{,}{,},file name,manual\\}} Section ``(pman)anode\'\' in \\textsl{manual}

\\texttt{@inforef\\{chapter,\\ cross ref name,\\ file name\\}} Section ``chapter\'\' in \\texttt{file name}
\\texttt{@inforef\\{chapter\\}} chapter
\\texttt{@inforef\\{chapter,\\ cross ref name\\}} chapter
\\texttt{@inforef\\{chapter{,}{,}file name\\}} Section ``chapter\'\' in \\texttt{file name}
';


$result_converted{'info'}->{'refs_formatting'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: chapter

1 chapter
*********

‘@ref{chapter,cross ref name}’ *note cross ref name: chapter.
‘@ref{chapter,,title}’ *note title: chapter. ‘@ref{chapter,,,file name}’
*note (file name)chapter:: ‘@ref{chapter,,,,manual}’ *note ()chapter::
‘@ref{chapter,cross ref name,title,}’ *note cross ref name: chapter.
‘@ref{chapter,cross ref name,,file name}’ *note cross ref name: (file
name)chapter. ‘@ref{chapter,cross ref name,,,manual}’ *note cross ref
name: ()chapter. ‘@ref{chapter,cross ref name,title,file name}’ *note
cross ref name: (file name)chapter. ‘@ref{chapter,cross ref
name,title,,manual}’ *note cross ref name: ()chapter.
‘@ref{chapter,cross ref name,title, file name, manual}’ *note cross ref
name: (file name)chapter. ‘@ref{chapter,,title,file name}’ *note title:
(file name)chapter. ‘@ref{chapter,,title,,manual}’ *note title:
()chapter. ‘@ref{chapter,,title, file name, manual}’ *note title: (file
name)chapter. ‘@ref{chapter,,,file name,manual}’ *note (file
name)chapter::

   ‘@ref{(pman)anode,cross ref name}’ *note cross ref name: (pman)anode.
‘@ref{(pman)anode,,title}’ *note title: (pman)anode.
‘@ref{(pman)anode,,,file name}’ *note (file name)(pman)anode::
‘@ref{(pman)anode,,,,manual}’ *note ()(pman)anode::
‘@ref{(pman)anode,cross ref name,title,}’ *note cross ref name:
(pman)anode. ‘@ref{(pman)anode,cross ref name,,file name}’ *note cross
ref name: (file name)(pman)anode. ‘@ref{(pman)anode,cross ref
name,,,manual}’ *note cross ref name: ()(pman)anode.
‘@ref{(pman)anode,cross ref name,title,file name}’ *note cross ref name:
(file name)(pman)anode. ‘@ref{(pman)anode,cross ref name,title,,manual}’
*note cross ref name: ()(pman)anode. ‘@ref{(pman)anode,cross ref
name,title, file name, manual}’ *note cross ref name: (file
name)(pman)anode. ‘@ref{(pman)anode,,title,file name}’ *note title:
(file name)(pman)anode. ‘@ref{(pman)anode,,title,,manual}’ *note title:
()(pman)anode. ‘@ref{(pman)anode,,title, file name, manual}’ *note
title: (file name)(pman)anode. ‘@ref{(pman)anode,,,file name,manual}’
*note (file name)(pman)anode::

   ‘@inforef{chapter, cross ref name, file name}’ *note cross ref name:
(file name)chapter. ‘@inforef{chapter}’ *note chapter::
‘@inforef{chapter, cross ref name}’ *note cross ref name: chapter.
‘@inforef{chapter,,file name}’ *note (file name)chapter::


Tag Table:
Node: chapter27

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'refs_formatting'} = '* W |document without Top node
 warning: document without Top node

';

1;
