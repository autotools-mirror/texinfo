use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'ref_error_formatting'} = '*document_root C1
 *before_node_section C9
  *preamble_before_beginning C1
   {text_before_beginning:\\n}
  *preamble_before_content
  *paragraph C4
   *@code C1 l2
    *brace_container C5
     *@@
     {ref}
     *@{
     {node}
     *@}
   { }
   *@ref C1 l2
    *brace_arg C1
    |EXTRA
    |node_content:{node}
    |normalized:{node}
     {node}
   {\\n}
  {empty_line:\\n}
  *paragraph C112
   *@code C1 l4
    *brace_container C5
     *@@
     {ref}
     *@{
     {,cross ref name}
     *@}
   { }
   *@ref C2 l4
    *brace_arg
    *brace_arg C1
     {cross ref name}
   {\\n}
   *@code C1 l5
    *brace_container C5
     *@@
     {ref}
     *@{
     {,,title}
     *@}
   { }
   *@ref C3 l5
    *brace_arg
    *brace_arg
    *brace_arg C1
     {title}
   {\\n}
   *@code C1 l6
    *brace_container C5
     *@@
     {ref}
     *@{
     {,,,file name}
     *@}
   { }
   *@ref C4 l6
    *brace_arg
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
     {,,,,manual}
     *@}
   { }
   *@ref C5 l7
    *brace_arg
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
     {node,cross ref name}
     *@}
   { }
   *@ref C2 l8
    *brace_arg C1
    |EXTRA
    |node_content:{node}
    |normalized:{node}
     {node}
    *brace_arg C1
     {cross ref name}
   {\\n}
   *@code C1 l9
    *brace_container C5
     *@@
     {ref}
     *@{
     {node,,title}
     *@}
   { }
   *@ref C3 l9
    *brace_arg C1
    |EXTRA
    |node_content:{node}
    |normalized:{node}
     {node}
    *brace_arg
    *brace_arg C1
     {title}
   {\\n}
   *@code C1 l10
    *brace_container C5
     *@@
     {ref}
     *@{
     {node,,,file name}
     *@}
   { }
   *@ref C4 l10
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l11
    *brace_container C5
     *@@
     {ref}
     *@{
     {node,,,,manual}
     *@}
   { }
   *@ref C5 l11
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg
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
     {node,cross ref name,title,}
     *@}
   { }
   *@ref C4 l12
    *brace_arg C1
    |EXTRA
    |node_content:{node}
    |normalized:{node}
     {node}
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg
   {\\n}
   *@code C1 l13
    *brace_container C5
     *@@
     {ref}
     *@{
     {node,cross ref name,,file name}
     *@}
   { }
   *@ref C4 l13
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l14
    *brace_container C5
     *@@
     {ref}
     *@{
     {node,cross ref name,,,manual}
     *@}
   { }
   *@ref C5 l14
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l15
    *brace_container C5
     *@@
     {ref}
     *@{
     {node,cross ref name,title,file name}
     *@}
   { }
   *@ref C4 l15
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg C1
     {cross ref name}
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
     {node,cross ref name,title,,manual}
     *@}
   { }
   *@ref C5 l16
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg C1
     {cross ref name}
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
     {node,cross ref name,title, file name, manual}
     *@}
   { }
   *@ref C5 l17
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
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
   *@code C1 l18
    *brace_container C5
     *@@
     {ref}
     *@{
     {node,,title,file name}
     *@}
   { }
   *@ref C4 l18
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l19
    *brace_container C5
     *@@
     {ref}
     *@{
     {node,,title,,manual}
     *@}
   { }
   *@ref C5 l19
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l20
    *brace_container C5
     *@@
     {ref}
     *@{
     {node,,title, file name, manual}
     *@}
   { }
   *@ref C5 l20
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
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
   *@code C1 l21
    *brace_container C5
     *@@
     {ref}
     *@{
     {node,,,file name,manual}
     *@}
   { }
   *@ref C5 l21
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l22
    *brace_container C5
     *@@
     {ref}
     *@{
     {,cross ref name,title,}
     *@}
   { }
   *@ref C4 l22
    *brace_arg
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg
   {\\n}
   *@code C1 l23
    *brace_container C5
     *@@
     {ref}
     *@{
     {,cross ref name,,file name}
     *@}
   { }
   *@ref C4 l23
    *brace_arg
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l24
    *brace_container C5
     *@@
     {ref}
     *@{
     {,cross ref name,,,manual}
     *@}
   { }
   *@ref C5 l24
    *brace_arg
    *brace_arg C1
     {cross ref name}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l25
    *brace_container C5
     *@@
     {ref}
     *@{
     {,cross ref name,title,file name}
     *@}
   { }
   *@ref C4 l25
    *brace_arg
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l26
    *brace_container C5
     *@@
     {ref}
     *@{
     {,cross ref name,title,,manual}
     *@}
   { }
   *@ref C5 l26
    *brace_arg
    *brace_arg C1
     {cross ref name}
    *brace_arg C1
     {title}
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l27
    *brace_container C5
     *@@
     {ref}
     *@{
     {,cross ref name,title, file name, manual}
     *@}
   { }
   *@ref C5 l27
    *brace_arg
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
   *@code C1 l28
    *brace_container C5
     *@@
     {ref}
     *@{
     {,,title,file name}
     *@}
   { }
   *@ref C4 l28
    *brace_arg
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l29
    *brace_container C5
     *@@
     {ref}
     *@{
     {,,title,,manual}
     *@}
   { }
   *@ref C5 l29
    *brace_arg
    *brace_arg
    *brace_arg C1
     {title}
    *brace_arg
    *brace_arg C1
     {manual}
   {\\n}
   *@code C1 l30
    *brace_container C5
     *@@
     {ref}
     *@{
     {,,title, file name, manual}
     *@}
   { }
   *@ref C5 l30
    *brace_arg
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
   *@code C1 l31
    *brace_container C5
     *@@
     {ref}
     *@{
     {,,,file name,manual}
     *@}
   { }
   *@ref C5 l31
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
    *brace_arg C1
     {manual}
   {\\n}
  {empty_line:\\n}
  *paragraph C16
   *@code C1 l33
    *brace_container C5
     *@@
     {inforef}
     *@{
     {,cross ref name }
     *@}
   { }
   *@inforef C2 l33
    *brace_arg
    *brace_arg C2
     {cross ref name}
     {spaces_after_argument: }
   {\\n}
   *@code C1 l34
    *brace_container C5
     *@@
     {inforef}
     *@{
     {,,file name}
     *@}
   { }
   *@inforef C3 l34
    *brace_arg
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
   *@code C1 l35
    *brace_container C5
     *@@
     {inforef}
     *@{
     {,cross ref name, file name}
     *@}
   { }
   *@inforef C3 l35
    *brace_arg
    *brace_arg C1
     {cross ref name}
    *brace_arg C2
     {spaces_before_argument: }
     {file name}
   {\\n}
   *@code C1 l36
    *brace_container C4
     *@@
     {inforef}
     *@{
     *@}
   { }
   *@inforef C1 l36
    *brace_arg
   {\\n}
  {empty_line:\\n}
  *paragraph C16
   *@code C1 l38
    *brace_container C5
     *@@
     {inforef}
     *@{
     {node, cross ref name, file name}
     *@}
   { }
   *@inforef C3 l38
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg C2
     {spaces_before_argument: }
     {cross ref name}
    *brace_arg C2
     {spaces_before_argument: }
     {file name}
   {\\n}
   *@code C1 l39
    *brace_container C5
     *@@
     {inforef}
     *@{
     {node}
     *@}
   { }
   *@inforef C1 l39
    *brace_arg C1
    |EXTRA
    |node_content:{node}
    |normalized:{node}
     {node}
   {\\n}
   *@code C1 l40
    *brace_container C5
     *@@
     {inforef}
     *@{
     {node, cross ref name}
     *@}
   { }
   *@inforef C2 l40
    *brace_arg C1
    |EXTRA
    |node_content:{node}
    |normalized:{node}
     {node}
    *brace_arg C2
     {spaces_before_argument: }
     {cross ref name}
   {\\n}
   *@code C1 l41
    *brace_container C5
     *@@
     {inforef}
     *@{
     {node,,file name}
     *@}
   { }
   *@inforef C3 l41
    *brace_arg C1
    |EXTRA
    |node_content:{node}
     {node}
    *brace_arg
    *brace_arg C1
     {file name}
   {\\n}
';


$result_texis{'ref_error_formatting'} = '
@code{@@ref@{node@}} @ref{node}

@code{@@ref@{,cross ref name@}} @ref{,cross ref name}
@code{@@ref@{,,title@}} @ref{,,title}
@code{@@ref@{,,,file name@}} @ref{,,,file name}
@code{@@ref@{,,,,manual@}} @ref{,,,,manual}
@code{@@ref@{node,cross ref name@}} @ref{node,cross ref name}
@code{@@ref@{node,,title@}} @ref{node,,title}
@code{@@ref@{node,,,file name@}} @ref{node,,,file name}
@code{@@ref@{node,,,,manual@}} @ref{node,,,,manual}
@code{@@ref@{node,cross ref name,title,@}} @ref{node,cross ref name,title,}
@code{@@ref@{node,cross ref name,,file name@}} @ref{node,cross ref name,,file name}
@code{@@ref@{node,cross ref name,,,manual@}} @ref{node,cross ref name,,,manual}
@code{@@ref@{node,cross ref name,title,file name@}} @ref{node,cross ref name,title,file name}
@code{@@ref@{node,cross ref name,title,,manual@}} @ref{node,cross ref name,title,,manual}
@code{@@ref@{node,cross ref name,title, file name, manual@}} @ref{node,cross ref name,title, file name, manual}
@code{@@ref@{node,,title,file name@}} @ref{node,,title,file name}
@code{@@ref@{node,,title,,manual@}} @ref{node,,title,,manual}
@code{@@ref@{node,,title, file name, manual@}} @ref{node,,title, file name, manual}
@code{@@ref@{node,,,file name,manual@}} @ref{node,,,file name,manual}
@code{@@ref@{,cross ref name,title,@}} @ref{,cross ref name,title,}
@code{@@ref@{,cross ref name,,file name@}} @ref{,cross ref name,,file name}
@code{@@ref@{,cross ref name,,,manual@}} @ref{,cross ref name,,,manual}
@code{@@ref@{,cross ref name,title,file name@}} @ref{,cross ref name,title,file name}
@code{@@ref@{,cross ref name,title,,manual@}} @ref{,cross ref name,title,,manual}
@code{@@ref@{,cross ref name,title, file name, manual@}} @ref{,cross ref name,title, file name, manual}
@code{@@ref@{,,title,file name@}} @ref{,,title,file name}
@code{@@ref@{,,title,,manual@}} @ref{,,title,,manual}
@code{@@ref@{,,title, file name, manual@}} @ref{,,title, file name, manual}
@code{@@ref@{,,,file name,manual@}} @ref{,,,file name,manual}

@code{@@inforef@{,cross ref name @}} @inforef{,cross ref name }
@code{@@inforef@{,,file name@}} @inforef{,,file name}
@code{@@inforef@{,cross ref name, file name@}} @inforef{,cross ref name, file name}
@code{@@inforef@{@}} @inforef{}

@code{@@inforef@{node, cross ref name, file name@}} @inforef{node, cross ref name, file name}
@code{@@inforef@{node@}} @inforef{node}
@code{@@inforef@{node, cross ref name@}} @inforef{node, cross ref name}
@code{@@inforef@{node,,file name@}} @inforef{node,,file name}
';


$result_texts{'ref_error_formatting'} = '@ref{node} node

@ref{,cross ref name} 
@ref{,,title} 
@ref{,,,file name} 
@ref{,,,,manual} 
@ref{node,cross ref name} node
@ref{node,,title} node
@ref{node,,,file name} node
@ref{node,,,,manual} node
@ref{node,cross ref name,title,} node
@ref{node,cross ref name,,file name} node
@ref{node,cross ref name,,,manual} node
@ref{node,cross ref name,title,file name} node
@ref{node,cross ref name,title,,manual} node
@ref{node,cross ref name,title, file name, manual} node
@ref{node,,title,file name} node
@ref{node,,title,,manual} node
@ref{node,,title, file name, manual} node
@ref{node,,,file name,manual} node
@ref{,cross ref name,title,} 
@ref{,cross ref name,,file name} 
@ref{,cross ref name,,,manual} 
@ref{,cross ref name,title,file name} 
@ref{,cross ref name,title,,manual} 
@ref{,cross ref name,title, file name, manual} 
@ref{,,title,file name} 
@ref{,,title,,manual} 
@ref{,,title, file name, manual} 
@ref{,,,file name,manual} 

@inforef{,cross ref name } 
@inforef{,,file name} 
@inforef{,cross ref name, file name} 
@inforef{} 

@inforef{node, cross ref name, file name} node
@inforef{node} node
@inforef{node, cross ref name} node
@inforef{node,,file name} node
';

$result_errors{'ref_error_formatting'} = '* W l4|command @ref missing a node or external manual argument
 warning: command @ref missing a node or external manual argument

* W l5|command @ref missing a node or external manual argument
 warning: command @ref missing a node or external manual argument

* W l22|command @ref missing a node or external manual argument
 warning: command @ref missing a node or external manual argument

* W l33|@inforef is obsolete
 warning: @inforef is obsolete

* W l33|command @inforef missing a node or external manual argument
 warning: command @inforef missing a node or external manual argument

* W l34|@inforef is obsolete
 warning: @inforef is obsolete

* WC l34|further warnings for @inforef suppressed
 warning: further warnings for @inforef suppressed

* W l36|command @inforef missing a node or external manual argument
 warning: command @inforef missing a node or external manual argument

* E l2|@ref reference to nonexistent node `node\'
 @ref reference to nonexistent node `node\'

* E l8|@ref reference to nonexistent node `node\'
 @ref reference to nonexistent node `node\'

* E l9|@ref reference to nonexistent node `node\'
 @ref reference to nonexistent node `node\'

* E l12|@ref reference to nonexistent node `node\'
 @ref reference to nonexistent node `node\'

* E l39|@inforef reference to nonexistent node `node\'
 @inforef reference to nonexistent node `node\'

* E l40|@inforef reference to nonexistent node `node\'
 @inforef reference to nonexistent node `node\'

';

$result_nodes_list{'ref_error_formatting'} = '';

$result_sections_list{'ref_error_formatting'} = '';

$result_sectioning_root{'ref_error_formatting'} = '';

$result_headings_list{'ref_error_formatting'} = '';


$result_converted{'plaintext'}->{'ref_error_formatting'} = '‘@ref{node}’ node

   ‘@ref{,cross ref name}’ cross ref name ‘@ref{,,title}’ title
‘@ref{,,,file name}’ (file name) ‘@ref{,,,,manual}’ ‘manual’
‘@ref{node,cross ref name}’ cross ref name: node ‘@ref{node,,title}’
title: node ‘@ref{node,,,file name}’ (file name)node
‘@ref{node,,,,manual}’ node in ‘manual’ ‘@ref{node,cross ref
name,title,}’ cross ref name: node ‘@ref{node,cross ref name,,file
name}’ cross ref name: (file name)node ‘@ref{node,cross ref
name,,,manual}’ cross ref name: node in ‘manual’ ‘@ref{node,cross ref
name,title,file name}’ cross ref name: (file name)node ‘@ref{node,cross
ref name,title,,manual}’ cross ref name: node in ‘manual’
‘@ref{node,cross ref name,title, file name, manual}’ cross ref name:
(file name)node ‘@ref{node,,title,file name}’ title: (file name)node
‘@ref{node,,title,,manual}’ title: node in ‘manual’ ‘@ref{node,,title,
file name, manual}’ title: (file name)node ‘@ref{node,,,file
name,manual}’ (file name)node ‘@ref{,cross ref name,title,}’ cross ref
name ‘@ref{,cross ref name,,file name}’ cross ref name(file name)
‘@ref{,cross ref name,,,manual}’ cross ref name in ‘manual’ ‘@ref{,cross
ref name,title,file name}’ cross ref name(file name) ‘@ref{,cross ref
name,title,,manual}’ cross ref name in ‘manual’ ‘@ref{,cross ref
name,title, file name, manual}’ cross ref name(file name)
‘@ref{,,title,file name}’ title(file name) ‘@ref{,,title,,manual}’ title
in ‘manual’ ‘@ref{,,title, file name, manual}’ title(file name)
‘@ref{,,,file name,manual}’ (file name)

   ‘@inforef{,cross ref name }’ See cross ref name ‘@inforef{,,file
name}’ See (file name) ‘@inforef{,cross ref name, file name}’ See cross
ref name(file name) ‘@inforef{}’ See Top

   ‘@inforef{node, cross ref name, file name}’ See cross ref name: (file
name)node ‘@inforef{node}’ See node ‘@inforef{node, cross ref name}’ See
cross ref name: node ‘@inforef{node,,file name}’ See (file name)node
';


$result_converted{'html_text'}->{'ref_error_formatting'} = '<p><code class="code">@ref{node}</code> &lsquo;node&rsquo;
</p>
<p><code class="code">@ref{,cross ref name}</code> &lsquo;cross ref name&rsquo;
<code class="code">@ref{,,title}</code> &lsquo;title&rsquo;
<code class="code">@ref{,,,file name}</code> <a data-manual="file name" href="file%20name.html#Top">(file name)</a>
<code class="code">@ref{,,,,manual}</code> <cite class="cite">manual</cite>
<code class="code">@ref{node,cross ref name}</code> &lsquo;cross ref name&rsquo;
<code class="code">@ref{node,,title}</code> &lsquo;title&rsquo;
<code class="code">@ref{node,,,file name}</code> <a data-manual="file name" href="file%20name.html#node">(file name)node</a>
<code class="code">@ref{node,,,,manual}</code> &lsquo;node&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{node,cross ref name,title,}</code> &lsquo;title&rsquo;
<code class="code">@ref{node,cross ref name,,file name}</code> <a data-manual="file name" href="file%20name.html#node">cross ref name</a>
<code class="code">@ref{node,cross ref name,,,manual}</code> &lsquo;cross ref name&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{node,cross ref name,title,file name}</code> <a data-manual="file name" href="file%20name.html#node">title</a>
<code class="code">@ref{node,cross ref name,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{node,cross ref name,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#node">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{node,,title,file name}</code> <a data-manual="file name" href="file%20name.html#node">title</a>
<code class="code">@ref{node,,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{node,,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#node">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{node,,,file name,manual}</code> <a data-manual="file name" href="file%20name.html#node">node</a> in <cite class="cite">manual</cite>
<code class="code">@ref{,cross ref name,title,}</code> &lsquo;title&rsquo;
<code class="code">@ref{,cross ref name,,file name}</code> <a data-manual="file name" href="file%20name.html#Top">cross ref name</a>
<code class="code">@ref{,cross ref name,,,manual}</code> &lsquo;cross ref name&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{,cross ref name,title,file name}</code> <a data-manual="file name" href="file%20name.html#Top">title</a>
<code class="code">@ref{,cross ref name,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{,cross ref name,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{,,title,file name}</code> <a data-manual="file name" href="file%20name.html#Top">title</a>
<code class="code">@ref{,,title,,manual}</code> &lsquo;title&rsquo; in <cite class="cite">manual</cite>
<code class="code">@ref{,,title, file name, manual}</code> <a data-manual="file name" href="file%20name.html#Top">title</a> in <cite class="cite">manual</cite>
<code class="code">@ref{,,,file name,manual}</code> <cite class="cite"><a data-manual="file name" href="file%20name.html#Top">manual</a></cite>
</p>
<p><code class="code">@inforef{,cross ref name }</code> See &lsquo;cross ref name&rsquo;
<code class="code">@inforef{,,file name}</code> See <a data-manual="file name" href="file%20name.html#Top">(file name)</a>
<code class="code">@inforef{,cross ref name, file name}</code> See <a data-manual="file name" href="file%20name.html#Top">cross ref name</a>
<code class="code">@inforef{}</code> 
</p>
<p><code class="code">@inforef{node, cross ref name, file name}</code> See <a data-manual="file name" href="file%20name.html#node">cross ref name</a>
<code class="code">@inforef{node}</code> See &lsquo;node&rsquo;
<code class="code">@inforef{node, cross ref name}</code> See &lsquo;cross ref name&rsquo;
<code class="code">@inforef{node,,file name}</code> See <a data-manual="file name" href="file%20name.html#node">(file name)node</a>
</p>';


$result_converted{'xml'}->{'ref_error_formatting'} = '<preamblebeforebeginning>
</preamblebeforebeginning><para><code>&arobase;ref&lbrace;node&rbrace;</code> <ref label="node"><xrefnodename>node</xrefnodename></ref>
</para>
<para><code>&arobase;ref&lbrace;,cross ref name&rbrace;</code> <ref><xrefinfoname>cross ref name</xrefinfoname></ref>
<code>&arobase;ref&lbrace;,,title&rbrace;</code> <ref><xrefprinteddesc>title</xrefprinteddesc></ref>
<code>&arobase;ref&lbrace;,,,file name&rbrace;</code> <ref manual="file name"><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;,,,,manual&rbrace;</code> <ref><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;node,cross ref name&rbrace;</code> <ref label="node"><xrefnodename>node</xrefnodename><xrefinfoname>cross ref name</xrefinfoname></ref>
<code>&arobase;ref&lbrace;node,,title&rbrace;</code> <ref label="node"><xrefnodename>node</xrefnodename><xrefprinteddesc>title</xrefprinteddesc></ref>
<code>&arobase;ref&lbrace;node,,,file name&rbrace;</code> <ref label="node" manual="file name"><xrefnodename>node</xrefnodename><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;node,,,,manual&rbrace;</code> <ref label="node"><xrefnodename>node</xrefnodename><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;node,cross ref name,title,&rbrace;</code> <ref label="node"><xrefnodename>node</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile></xrefinfofile></ref>
<code>&arobase;ref&lbrace;node,cross ref name,,file name&rbrace;</code> <ref label="node" manual="file name"><xrefnodename>node</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;node,cross ref name,,,manual&rbrace;</code> <ref label="node"><xrefnodename>node</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;node,cross ref name,title,file name&rbrace;</code> <ref label="node" manual="file name"><xrefnodename>node</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;node,cross ref name,title,,manual&rbrace;</code> <ref label="node"><xrefnodename>node</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;node,cross ref name,title, file name, manual&rbrace;</code> <ref label="node" manual="file name"><xrefnodename>node</xrefnodename><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;node,,title,file name&rbrace;</code> <ref label="node" manual="file name"><xrefnodename>node</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;node,,title,,manual&rbrace;</code> <ref label="node"><xrefnodename>node</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;node,,title, file name, manual&rbrace;</code> <ref label="node" manual="file name"><xrefnodename>node</xrefnodename><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;node,,,file name,manual&rbrace;</code> <ref label="node" manual="file name"><xrefnodename>node</xrefnodename><xrefinfofile>file name</xrefinfofile><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;,cross ref name,title,&rbrace;</code> <ref><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile></xrefinfofile></ref>
<code>&arobase;ref&lbrace;,cross ref name,,file name&rbrace;</code> <ref manual="file name"><xrefinfoname>cross ref name</xrefinfoname><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;,cross ref name,,,manual&rbrace;</code> <ref><xrefinfoname>cross ref name</xrefinfoname><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;,cross ref name,title,file name&rbrace;</code> <ref manual="file name"><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;,cross ref name,title,,manual&rbrace;</code> <ref><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;,cross ref name,title, file name, manual&rbrace;</code> <ref manual="file name"><xrefinfoname>cross ref name</xrefinfoname><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;,,title,file name&rbrace;</code> <ref manual="file name"><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile>file name</xrefinfofile></ref>
<code>&arobase;ref&lbrace;,,title,,manual&rbrace;</code> <ref><xrefprinteddesc>title</xrefprinteddesc><xrefprintedname>manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;,,title, file name, manual&rbrace;</code> <ref manual="file name"><xrefprinteddesc>title</xrefprinteddesc><xrefinfofile> file name</xrefinfofile><xrefprintedname> manual</xrefprintedname></ref>
<code>&arobase;ref&lbrace;,,,file name,manual&rbrace;</code> <ref manual="file name"><xrefinfofile>file name</xrefinfofile><xrefprintedname>manual</xrefprintedname></ref>
</para>
<para><code>&arobase;inforef&lbrace;,cross ref name &rbrace;</code> <inforef><inforefrefname>cross ref name </inforefrefname></inforef>
<code>&arobase;inforef&lbrace;,,file name&rbrace;</code> <inforef manual="file name"><inforefinfoname>file name</inforefinfoname></inforef>
<code>&arobase;inforef&lbrace;,cross ref name, file name&rbrace;</code> <inforef manual="file name"><inforefrefname>cross ref name</inforefrefname><inforefinfoname> file name</inforefinfoname></inforef>
<code>&arobase;inforef&lbrace;&rbrace;</code> <inforef><inforefnodename></inforefnodename></inforef>
</para>
<para><code>&arobase;inforef&lbrace;node, cross ref name, file name&rbrace;</code> <inforef label="node" manual="file name"><inforefnodename>node</inforefnodename><inforefrefname> cross ref name</inforefrefname><inforefinfoname> file name</inforefinfoname></inforef>
<code>&arobase;inforef&lbrace;node&rbrace;</code> <inforef label="node"><inforefnodename>node</inforefnodename></inforef>
<code>&arobase;inforef&lbrace;node, cross ref name&rbrace;</code> <inforef label="node"><inforefnodename>node</inforefnodename><inforefrefname> cross ref name</inforefrefname></inforef>
<code>&arobase;inforef&lbrace;node,,file name&rbrace;</code> <inforef label="node" manual="file name"><inforefnodename>node</inforefnodename><inforefinfoname>file name</inforefinfoname></inforef>
</para>';


$result_converted{'docbook'}->{'ref_error_formatting'} = '<para><literal>@ref{node}</literal> <link linkend="node">node</link>
</para>
<para><literal>@ref{,cross ref name}</literal> <link>cross ref name</link>
<literal>@ref{,,title}</literal> <link>title</link>
<literal>@ref{,,,file name}</literal> <filename>file name</filename>
<literal>@ref{,,,,manual}</literal> <citetitle>manual</citetitle>
<literal>@ref{node,cross ref name}</literal> <link linkend="node">cross ref name</link>
<literal>@ref{node,,title}</literal> <link linkend="node">title</link>
<literal>@ref{node,,,file name}</literal> &#8220;node&#8221; in <filename>file name</filename>
<literal>@ref{node,,,,manual}</literal> &#8220;node&#8221; in <citetitle>manual</citetitle>
<literal>@ref{node,cross ref name,title,}</literal> <link linkend="node">title</link>
<literal>@ref{node,cross ref name,,file name}</literal> section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@ref{node,cross ref name,,,manual}</literal> section &#8220;cross ref name&#8221; in <citetitle>manual</citetitle>
<literal>@ref{node,cross ref name,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{node,cross ref name,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{node,cross ref name,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{node,,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{node,,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{node,,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{node,,,file name,manual}</literal> &#8220;node&#8221; in <citetitle>manual</citetitle>
<literal>@ref{,cross ref name,title,}</literal> <link>title</link>
<literal>@ref{,cross ref name,,file name}</literal> section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@ref{,cross ref name,,,manual}</literal> section &#8220;cross ref name&#8221; in <citetitle>manual</citetitle>
<literal>@ref{,cross ref name,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{,cross ref name,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{,cross ref name,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{,,title,file name}</literal> section &#8220;title&#8221; in <filename>file name</filename>
<literal>@ref{,,title,,manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{,,title, file name, manual}</literal> section &#8220;title&#8221; in <citetitle>manual</citetitle>
<literal>@ref{,,,file name,manual}</literal> <citetitle>manual</citetitle>
</para>
<para><literal>@inforef{,cross ref name }</literal> 
<literal>@inforef{,,file name}</literal> See <filename>file name</filename>
<literal>@inforef{,cross ref name, file name}</literal> See section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@inforef{}</literal> 
</para>
<para><literal>@inforef{node, cross ref name, file name}</literal> See section &#8220;cross ref name&#8221; in <filename>file name</filename>
<literal>@inforef{node}</literal> 
<literal>@inforef{node, cross ref name}</literal> 
<literal>@inforef{node,,file name}</literal> See &#8220;node&#8221; in <filename>file name</filename>
</para>';


$result_converted{'latex_text'}->{'ref_error_formatting'} = '\\begin{document}
\\texttt{@ref\\{node\\}} node

\\texttt{@ref\\{,cross ref name\\}} 
\\texttt{@ref\\{{,}{,}title\\}} title
\\texttt{@ref\\{{,}{,},file name\\}} \\texttt{file name}
\\texttt{@ref\\{{,}{,}{,}{,}manual\\}} \\textsl{manual}
\\texttt{@ref\\{node,cross ref name\\}} node
\\texttt{@ref\\{node{,}{,}title\\}} title
\\texttt{@ref\\{node{,}{,},file name\\}} Section ``node\'\' in \\texttt{file name}
\\texttt{@ref\\{node{,}{,}{,}{,}manual\\}} Section ``node\'\' in \\textsl{manual}
\\texttt{@ref\\{node,cross ref name,title,\\}} title
\\texttt{@ref\\{node,cross ref name{,}{,}file name\\}} Section ``node\'\' in \\texttt{file name}
\\texttt{@ref\\{node,cross ref name{,}{,},manual\\}} Section ``node\'\' in \\textsl{manual}
\\texttt{@ref\\{node,cross ref name,title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{node,cross ref name,title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{node,cross ref name,title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{node{,}{,}title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{node{,}{,}title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{node{,}{,}title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{node{,}{,},file name,manual\\}} Section ``node\'\' in \\textsl{manual}
\\texttt{@ref\\{,cross ref name,title,\\}} title
\\texttt{@ref\\{,cross ref name{,}{,}file name\\}} \\texttt{file name}
\\texttt{@ref\\{,cross ref name{,}{,},manual\\}} \\textsl{manual}
\\texttt{@ref\\{,cross ref name,title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{,cross ref name,title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{,cross ref name,title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{{,}{,}title,file name\\}} Section ``title\'\' in \\texttt{file name}
\\texttt{@ref\\{{,}{,}title{,}{,}manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{{,}{,}title,\\ file name,\\ manual\\}} Section ``title\'\' in \\textsl{manual}
\\texttt{@ref\\{{,}{,},file name,manual\\}} \\textsl{manual}

\\texttt{@inforef\\{,cross ref name \\}} 
\\texttt{@inforef\\{{,}{,}file name\\}} \\texttt{file name}
\\texttt{@inforef\\{,cross ref name,\\ file name\\}} \\texttt{file name}
\\texttt{@inforef\\{\\}} 

\\texttt{@inforef\\{node,\\ cross ref name,\\ file name\\}} Section ``node\'\' in \\texttt{file name}
\\texttt{@inforef\\{node\\}} node
\\texttt{@inforef\\{node,\\ cross ref name\\}} node
\\texttt{@inforef\\{node{,}{,}file name\\}} Section ``node\'\' in \\texttt{file name}
';


$result_converted{'info'}->{'ref_error_formatting'} = Encode::encode('utf-8', 'This is , produced from .

‘@ref{node}’ *note node::

   ‘@ref{,cross ref name}’ *note cross ref name: . ‘@ref{,,title}’ *note
title: . ‘@ref{,,,file name}’ *note (file name)Top:: ‘@ref{,,,,manual}’
*note ()Top:: ‘@ref{node,cross ref name}’ *note cross ref name: node.
‘@ref{node,,title}’ *note title: node. ‘@ref{node,,,file name}’ *note
(file name)node:: ‘@ref{node,,,,manual}’ *note ()node:: ‘@ref{node,cross
ref name,title,}’ *note cross ref name: node. ‘@ref{node,cross ref
name,,file name}’ *note cross ref name: (file name)node.
‘@ref{node,cross ref name,,,manual}’ *note cross ref name: ()node.
‘@ref{node,cross ref name,title,file name}’ *note cross ref name: (file
name)node. ‘@ref{node,cross ref name,title,,manual}’ *note cross ref
name: ()node. ‘@ref{node,cross ref name,title, file name, manual}’ *note
cross ref name: (file name)node. ‘@ref{node,,title,file name}’ *note
title: (file name)node. ‘@ref{node,,title,,manual}’ *note title: ()node.
‘@ref{node,,title, file name, manual}’ *note title: (file name)node.
‘@ref{node,,,file name,manual}’ *note (file name)node:: ‘@ref{,cross ref
name,title,}’ *note cross ref name: . ‘@ref{,cross ref name,,file name}’
*note cross ref name: (file name)Top. ‘@ref{,cross ref name,,,manual}’
*note cross ref name: ()Top. ‘@ref{,cross ref name,title,file name}’
*note cross ref name: (file name)Top. ‘@ref{,cross ref
name,title,,manual}’ *note cross ref name: ()Top. ‘@ref{,cross ref
name,title, file name, manual}’ *note cross ref name: (file name)Top.
‘@ref{,,title,file name}’ *note title: (file name)Top.
‘@ref{,,title,,manual}’ *note title: ()Top. ‘@ref{,,title, file name,
manual}’ *note title: (file name)Top. ‘@ref{,,,file name,manual}’ *note
(file name)Top::

   ‘@inforef{,cross ref name }’ *note cross ref name: . ‘@inforef{,,file
name}’ *note (file name)Top:: ‘@inforef{,cross ref name, file name}’
*note cross ref name: (file name)Top. ‘@inforef{}’ *note ::

   ‘@inforef{node, cross ref name, file name}’ *note cross ref name:
(file name)node. ‘@inforef{node}’ *note node:: ‘@inforef{node, cross ref
name}’ *note cross ref name: node. ‘@inforef{node,,file name}’ *note
(file name)node::

Tag Table:

End Tag Table


Local Variables:
coding: utf-8
End:
');

$result_converted_errors{'info'}->{'ref_error_formatting'} = '* W |document without nodes
 warning: document without nodes

';

1;
