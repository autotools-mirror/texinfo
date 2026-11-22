use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'image_formatting'} = '*document_root C5
 *before_node_section C1
  *preamble_before_content
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
 *normal_command@node C1 l4 {chap}
 |identifier:{chap}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:chap}
    {spaces_after_argument:\\n}
 *normal_command@chapter C10 l5 {Chapter}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Chapter}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C40
   *normal_command@code C1 l7
    *brace_container C5
     *normal_command@@
     {normal_text:image}
     *normal_command@{
     {normal_text:f--ile}
     *normal_command@}
   {normal_text: }
   *normal_command@image C1 l7
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:f--ile}
   {normal_text:\\n}
   *normal_command@code C1 l8
    *brace_container C5
     *normal_command@@
     {normal_text:image}
     *normal_command@{
     {normal_text:f--ile,l--i}
     *normal_command@}
   {normal_text: }
   *normal_command@image C2 l8
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:f--ile}
    *brace_arg C1
     {normal_text:l--i}
   {normal_text:\\n}
   *normal_command@code C1 l9
    *brace_container C5
     *normal_command@@
     {normal_text:image}
     *normal_command@{
     {normal_text:f--ile,,l--e}
     *normal_command@}
   {normal_text: }
   *normal_command@image C3 l9
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:f--ile}
    *brace_arg
    *brace_arg C1
     {normal_text:l--e}
   {normal_text:\\n}
   *normal_command@code C1 l10
    *brace_container C5
     *normal_command@@
     {normal_text:image}
     *normal_command@{
     {normal_text:f--ile,,,alt}
     *normal_command@}
   {normal_text: }
   *normal_command@image C4 l10
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:f--ile}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:alt}
   {normal_text:\\n}
   *normal_command@code C1 l11
    *brace_container C5
     *normal_command@@
     {normal_text:image}
     *normal_command@{
     {normal_text:f--ile,,,,e-d-xt}
     *normal_command@}
   {normal_text: }
   *normal_command@image C5 l11
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:f--ile}
    *brace_arg
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:e--xt}
   {normal_text:\\n}
   *normal_command@code C1 l12
    *brace_container C5
     *normal_command@@
     {normal_text:image}
     *normal_command@{
     {normal_text:f--ile,aze,az,alt,e--xt}
     *normal_command@}
   {normal_text: }
   *normal_command@image C5 l12
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:f--ile}
    *brace_arg C1
     {normal_text:aze}
    *brace_arg C1
     {normal_text:az}
    *brace_arg C1
     {normal_text:alt}
    *brace_arg C1
     {normal_text:e--xt}
   {normal_text:\\n}
   *normal_command@code C1 l13
    *brace_container C4
     *normal_command@@
     {normal_text:image}
     *normal_command@{
     {normal_text:f--ile,aze,az,alt,}
   {normal_text: }
   *normal_command@image C5 l13
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:f--ile}
    *brace_arg C1
     {normal_text:aze}
    *brace_arg C1
     {normal_text:az}
    *brace_arg C1
     {normal_text:alt}
    *brace_arg
   {normal_text:\\n}
   *normal_command@code C1 l14
    *brace_container C5
     *normal_command@@
     {normal_text:image}
     *normal_command@{
     {normal_text:f-ile,aze,,a--lt}
     *normal_command@}
   {normal_text: }
   *normal_command@image C4 l14
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:f-ile}
    *brace_arg C1
     {normal_text:aze}
    *brace_arg
    *brace_arg C1
     {normal_text:a--lt}
   {normal_text:\\n}
   *normal_command@code C1 l15
    *brace_container C20
     *normal_command@@
     {normal_text:image}
     *normal_command@{
     *normal_command@@
     {normal_text:file}
     *normal_command@{
     {normal_text:f--ile}
     *normal_command@}
     *normal_command@@
     *normal_command@@
     *normal_command@@
     {normal_text:.,aze,az,alt,}
     *normal_command@@
     {normal_text:file}
     *normal_command@{
     {normal_text:file ext}
     *normal_command@}
     {normal_text: e--xt}
     *normal_command@@
     *normal_command@}
   {normal_text: }
   *normal_command@image C5 l15
   |input_encoding_name:{utf-8}
    *brace_arg C3
     *normal_command@file C1 l15
      *brace_container C1
       {normal_text:f--ile}
     *normal_command@@
     *normal_command@.
    *brace_arg C1
     {normal_text:aze}
    *brace_arg C1
     {normal_text:az}
    *brace_arg C1
     {normal_text:alt}
    *brace_arg C3
     *normal_command@file C1 l15
      *brace_container C1
       {normal_text:file ext}
     {normal_text: e--xt}
     *normal_command@}
   {normal_text:\\n}
   *normal_command@image C1 l16
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:image}
   {normal_text: }
   *normal_command@image C1 l16
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:image}
   {normal_text:\\n}
  {empty_line:\\n}
  *normal_command@example C3 l18
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *preformatted C36
    *normal_command@code C1 l19
     *brace_container C5
      *normal_command@@
      {normal_text:image}
      *normal_command@{
      {normal_text:f--ile}
      *normal_command@}
    {normal_text: }
    *normal_command@image C1 l19
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile}
    {normal_text:\\n}
    *normal_command@code C1 l20
     *brace_container C5
      *normal_command@@
      {normal_text:image}
      *normal_command@{
      {normal_text:f--ile,l--i}
      *normal_command@}
    {normal_text: }
    *normal_command@image C2 l20
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile}
     *brace_arg C1
      {normal_text:l--i}
    {normal_text:\\n}
    *normal_command@code C1 l21
     *brace_container C5
      *normal_command@@
      {normal_text:image}
      *normal_command@{
      {normal_text:f--ile,,l--e}
      *normal_command@}
    {normal_text: }
    *normal_command@image C3 l21
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile}
     *brace_arg
     *brace_arg C1
      {normal_text:l--e}
    {normal_text:\\n}
    *normal_command@code C1 l22
     *brace_container C5
      *normal_command@@
      {normal_text:image}
      *normal_command@{
      {normal_text:f--ile,,,alt}
      *normal_command@}
    {normal_text: }
    *normal_command@image C4 l22
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile}
     *brace_arg
     *brace_arg
     *brace_arg C1
      {normal_text:alt}
    {normal_text:\\n}
    *normal_command@code C1 l23
     *brace_container C5
      *normal_command@@
      {normal_text:image}
      *normal_command@{
      {normal_text:f--ile,,,,e-d-xt}
      *normal_command@}
    {normal_text: }
    *normal_command@image C5 l23
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile}
     *brace_arg
     *brace_arg
     *brace_arg
     *brace_arg C1
      {normal_text:e--xt}
    {normal_text:\\n}
    *normal_command@code C1 l24
     *brace_container C5
      *normal_command@@
      {normal_text:image}
      *normal_command@{
      {normal_text:f--ile,aze,az,alt,e--xt}
      *normal_command@}
    {normal_text: }
    *normal_command@image C5 l24
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f--ile}
     *brace_arg C1
      {normal_text:aze}
     *brace_arg C1
      {normal_text:az}
     *brace_arg C1
      {normal_text:alt}
     *brace_arg C1
      {normal_text:e--xt}
    {normal_text:\\n}
    *normal_command@code C1 l25
     *brace_container C5
      *normal_command@@
      {normal_text:image}
      *normal_command@{
      {normal_text:f-ile,aze,,a--lt}
      *normal_command@}
    {normal_text: }
    *normal_command@image C4 l25
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:f-ile}
     *brace_arg C1
      {normal_text:aze}
     *brace_arg
     *brace_arg C1
      {normal_text:a--lt}
    {normal_text:\\n}
    *normal_command@code C1 l26
     *brace_container C20
      *normal_command@@
      {normal_text:image}
      *normal_command@{
      *normal_command@@
      {normal_text:file}
      *normal_command@{
      {normal_text:f--ile}
      *normal_command@}
      *normal_command@@
      *normal_command@@
      *normal_command@@
      {normal_text:.,aze,az,alt,}
      *normal_command@@
      {normal_text:file}
      *normal_command@{
      {normal_text:file ext}
      *normal_command@}
      {normal_text: e--xt}
      *normal_command@@
      *normal_command@}
    {normal_text: }
    *normal_command@image C5 l26
    |input_encoding_name:{utf-8}
     *brace_arg C3
      *normal_command@file C1 l26
       *brace_container C1
        {normal_text:f--ile}
      *normal_command@@
      *normal_command@.
     *brace_arg C1
      {normal_text:aze}
     *brace_arg C1
      {normal_text:az}
     *brace_arg C1
      {normal_text:alt}
     *brace_arg C3
      *normal_command@file C1 l26
       *brace_container C1
        {normal_text:file ext}
      {normal_text: e--xt}
      *normal_command@}
    {normal_text:\\n}
    *normal_command@image C1 l27
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:image}
    {normal_text: }
    *normal_command@image C1 l27
    |input_encoding_name:{utf-8}
     *brace_arg C1
      {normal_text:image}
    {normal_text:\\n}
   *normal_command@end C1 l28
   |text_arg:{example}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:example}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@image C4 l30
  |input_encoding_name:{utf-8}
   *brace_arg C1
    {normal_text:f--ile}
   *brace_arg
   *brace_arg
   *brace_arg C1
    {normal_text:a very long alt argument that could span more than one line who knows}
  {normal_text:\\n}
  {empty_line:\\n}
  *paragraph C3
   {normal_text:in para\\n}
   *normal_command@image C4 l33
   |input_encoding_name:{utf-8}
    *brace_arg C1
     {normal_text:f--ile}
    *brace_arg
    *brace_arg
    *brace_arg C1
     {normal_text:a very long alt argument that could span more than one line who knows}
   {normal_text:.\\n}
';


$result_texis{'image_formatting'} = '@node Top
@top top

@node chap
@chapter Chapter

@code{@@image@{f--ile@}} @image{f--ile}
@code{@@image@{f--ile,l--i@}} @image{f--ile,l--i}
@code{@@image@{f--ile,,l--e@}} @image{f--ile,,l--e}
@code{@@image@{f--ile,,,alt@}} @image{f--ile,,,alt}
@code{@@image@{f--ile,,,,e-d-xt@}} @image{f--ile,,,,e--xt}
@code{@@image@{f--ile,aze,az,alt,e--xt@}} @image{f--ile,aze,az,alt,e--xt}
@code{@@image@{f--ile,aze,az,alt,} @image{f--ile,aze,az,alt,}
@code{@@image@{f-ile,aze,,a--lt@}} @image{f-ile,aze,,a--lt}
@code{@@image@{@@file@{f--ile@}@@@@@@.,aze,az,alt,@@file@{file ext@} e--xt@@@}} @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}}
@image{image} @image{image}

@example
@code{@@image@{f--ile@}} @image{f--ile}
@code{@@image@{f--ile,l--i@}} @image{f--ile,l--i}
@code{@@image@{f--ile,,l--e@}} @image{f--ile,,l--e}
@code{@@image@{f--ile,,,alt@}} @image{f--ile,,,alt}
@code{@@image@{f--ile,,,,e-d-xt@}} @image{f--ile,,,,e--xt}
@code{@@image@{f--ile,aze,az,alt,e--xt@}} @image{f--ile,aze,az,alt,e--xt}
@code{@@image@{f-ile,aze,,a--lt@}} @image{f-ile,aze,,a--lt}
@code{@@image@{@@file@{f--ile@}@@@@@@.,aze,az,alt,@@file@{file ext@} e--xt@@@}} @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}}
@image{image} @image{image}
@end example

@image{f--ile,,,a very long alt argument that could span more than one line who knows}

in para
@image{f--ile,,,a very long alt argument that could span more than one line who knows}.
';


$result_texts{'image_formatting'} = 'top
***

1 Chapter
*********

@image{f--ile} f--ile
@image{f--ile,l--i} f--ile
@image{f--ile,,l--e} f--ile
@image{f--ile,,,alt} f--ile
@image{f--ile,,,,e-d-xt} f--ile
@image{f--ile,aze,az,alt,e--xt} f--ile
@image{f--ile,aze,az,alt, f--ile
@image{f-ile,aze,,a--lt} f-ile
@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@} f--ile@.
image image

@image{f--ile} f--ile
@image{f--ile,l--i} f--ile
@image{f--ile,,l--e} f--ile
@image{f--ile,,,alt} f--ile
@image{f--ile,,,,e-d-xt} f--ile
@image{f--ile,aze,az,alt,e--xt} f--ile
@image{f-ile,aze,,a--lt} f-ile
@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@} f--ile@.
image image

f--ile

in para
f--ile.
';

$result_errors{'image_formatting'} = '';

$result_nodes_list{'image_formatting'} = '1|Top
 associated_section: top
 associated_title_command: top
 node_directions:
  next->chap
2|chap
 associated_section: 1 Chapter
 associated_title_command: 1 Chapter
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'image_formatting'} = '1|top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Chapter
 section_children:
  1|Chapter
2|Chapter
 associated_anchor_command: chap
 associated_node: chap
 section_directions:
  up->top
 toplevel_directions:
  prev->top
  up->top
';

$result_sectioning_root{'image_formatting'} = 'level: -1
list:
 1|top
';

$result_headings_list{'image_formatting'} = '';


$result_converted{'plaintext'}->{'image_formatting'} = 'top
***

1 Chapter
*********

‘@image{f--ile}’ Image description""\\. ‘@image{f--ile,l--i}’ Image description""\\. ‘@image{f--ile,,l--e}’ Image description""\\.
‘@image{f--ile,,,alt}’ Image description""\\. ‘@image{f--ile,,,,e-d-xt}’ Image description""\\.
‘@image{f--ile,aze,az,alt,e--xt}’ Image description""\\. ‘@image{f--ile,aze,az,alt,’ Image description""\\.
‘@image{f-ile,aze,,a--lt}’ [a-lt]
‘@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}’ [alt] aaa
bbb
ccc aaa
bbb
ccc

     @image{f--ile} Image description""\\.
     @image{f--ile,l--i} Image description""\\.
     @image{f--ile,,l--e} Image description""\\.
     @image{f--ile,,,alt} Image description""\\.
     @image{f--ile,,,,e-d-xt} Image description""\\.
     @image{f--ile,aze,az,alt,e--xt} Image description""\\.
     @image{f-ile,aze,,a--lt} [a-lt]
     @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@} [alt]
     aaa
bbb
ccc aaa
bbb
ccc

Image description""\\.

   in para Image description""\\..
';


$result_converted{'html_text'}->{'image_formatting'} = '<div class="top-level-extent" id="Top">
<h1 class="top" id="top"><span>top<a class="copiable-link" href="#top"> &para;</a></span></h1>

<ul class="mini-toc">
<li><a href="#chap">Chapter</a></li>
</ul>
<hr>
<div class="chapter-level-extent" id="chap">
<h2 class="chapter" id="Chapter"><span>1 Chapter<a class="copiable-link" href="#Chapter"> &para;</a></span></h2>

<p><code class="code">@image{f--ile}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,l--i}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,,l--e}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,,,alt}</code> <img class="image" src="f--ile.png" alt="alt">
<code class="code">@image{f--ile,,,,e-d-xt}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,aze,az,alt,e--xt}</code> <img class="image" src="f--ile.png" alt="alt">
<code class="code">@image{f--ile,aze,az,alt,</code> <img class="image" src="f--ile.png" alt="alt">
<code class="code">@image{f-ile,aze,,a--lt}</code> <img class="image" src="f-ile.jpg" alt="a&ndash;lt">
<code class="code">@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}</code> <img class="image" src="f--ile%40.file%20ext%20e--xt%7d" alt="alt">
<img class="image" src="image.jpg" alt="image"> <img class="image" src="image.jpg" alt="image">
</p>
<div class="example">
<pre class="example-preformatted"><code class="code">@image{f--ile}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,l--i}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,,l--e}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,,,alt}</code> <img class="image" src="f--ile.png" alt="alt">
<code class="code">@image{f--ile,,,,e-d-xt}</code> <img class="image" src="f--ile.png" alt="f--ile">
<code class="code">@image{f--ile,aze,az,alt,e--xt}</code> <img class="image" src="f--ile.png" alt="alt">
<code class="code">@image{f-ile,aze,,a--lt}</code> <img class="image" src="f-ile.jpg" alt="a&ndash;lt">
<code class="code">@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}</code> <img class="image" src="f--ile%40.file%20ext%20e--xt%7d" alt="alt">
<img class="image" src="image.jpg" alt="image"> <img class="image" src="image.jpg" alt="image">
</pre></div>

<img class="image" src="f--ile.png" alt="a very long alt argument that could span more than one line who knows">

<p>in para
<img class="image" src="f--ile.png" alt="a very long alt argument that could span more than one line who knows">.
</p></div>
</div>
';

$result_converted_errors{'html_text'}->{'image_formatting'} = '* W l14|@image file `f-ile\' (for HTML) not found, using `f-ile.jpg\'
 warning: @image file `f-ile\' (for HTML) not found, using `f-ile.jpg\'

* W l15|@image file `f--ile@.\' (for HTML) not found, using `f--ile@.file ext e--xt}\'
 warning: @image file `f--ile@.\' (for HTML) not found, using `f--ile@.file ext e--xt}\'

* W l16|@image file `image\' (for HTML) not found, using `image.jpg\'
 warning: @image file `image\' (for HTML) not found, using `image.jpg\'

* W l16|@image file `image\' (for HTML) not found, using `image.jpg\'
 warning: @image file `image\' (for HTML) not found, using `image.jpg\'

* W l25|@image file `f-ile\' (for HTML) not found, using `f-ile.jpg\'
 warning: @image file `f-ile\' (for HTML) not found, using `f-ile.jpg\'

* W l26|@image file `f--ile@.\' (for HTML) not found, using `f--ile@.file ext e--xt}\'
 warning: @image file `f--ile@.\' (for HTML) not found, using `f--ile@.file ext e--xt}\'

* W l27|@image file `image\' (for HTML) not found, using `image.jpg\'
 warning: @image file `image\' (for HTML) not found, using `image.jpg\'

* W l27|@image file `image\' (for HTML) not found, using `image.jpg\'
 warning: @image file `image\' (for HTML) not found, using `image.jpg\'

';


$result_converted{'xml'}->{'image_formatting'} = '<node identifier="Top"><nodename> Top</nodename><nodenext automatic="on"> chap</nodenext></node>
<top><sectiontitle> top</sectiontitle>

</top>
<node identifier="chap"><nodename> chap</nodename><nodeprev automatic="on"> Top</nodeprev><nodeup automatic="on"> Top</nodeup></node>
<chapter><sectiontitle> Chapter</sectiontitle>

<para><code>&arobase;image&lbrace;f--ile&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile></image>
<code>&arobase;image&lbrace;f--ile,l--i&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imagewidth>l--i</imagewidth></image>
<code>&arobase;image&lbrace;f--ile,,l--e&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imageheight>l--e</imageheight></image>
<code>&arobase;image&lbrace;f--ile,,,alt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><alttext>alt</alttext></image>
<code>&arobase;image&lbrace;f--ile,,,,e-d-xt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imageextension>e--xt</imageextension></image>
<code>&arobase;image&lbrace;f--ile,aze,az,alt,e--xt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image>
<code>&arobase;image&lbrace;f--ile,aze,az,alt,</code> <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension></imageextension></image>
<code>&arobase;image&lbrace;f-ile,aze,,a--lt&rbrace;</code> <image where="inline"><imagefile>f-ile</imagefile><imagewidth>aze</imagewidth><alttext>a&textndash;lt</alttext></image>
<code>&arobase;image&lbrace;&arobase;file&lbrace;f--ile&rbrace;&arobase;&arobase;&arobase;.,aze,az,alt,&arobase;file&lbrace;file ext&rbrace; e--xt&arobase;&rbrace;</code> <image where="inline"><imagefile><file>f--ile</file>&arobase;&eosperiod;</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension><file>file ext</file> e--xt&rbrace;</imageextension></image>
<image where="inline"><imagefile>image</imagefile></image> <image where="inline"><imagefile>image</imagefile></image>
</para>
<example endspaces=" ">
<pre xml:space="preserve"><code>&arobase;image&lbrace;f--ile&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile></image>
<code>&arobase;image&lbrace;f--ile,l--i&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imagewidth>l--i</imagewidth></image>
<code>&arobase;image&lbrace;f--ile,,l--e&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imageheight>l--e</imageheight></image>
<code>&arobase;image&lbrace;f--ile,,,alt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><alttext>alt</alttext></image>
<code>&arobase;image&lbrace;f--ile,,,,e-d-xt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imageextension>e--xt</imageextension></image>
<code>&arobase;image&lbrace;f--ile,aze,az,alt,e--xt&rbrace;</code> <image where="inline"><imagefile>f--ile</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension>e--xt</imageextension></image>
<code>&arobase;image&lbrace;f-ile,aze,,a--lt&rbrace;</code> <image where="inline"><imagefile>f-ile</imagefile><imagewidth>aze</imagewidth><alttext>a--lt</alttext></image>
<code>&arobase;image&lbrace;&arobase;file&lbrace;f--ile&rbrace;&arobase;&arobase;&arobase;.,aze,az,alt,&arobase;file&lbrace;file ext&rbrace; e--xt&arobase;&rbrace;</code> <image where="inline"><imagefile><file>f--ile</file>&arobase;&eosperiod;</imagefile><imagewidth>aze</imagewidth><imageheight>az</imageheight><alttext>alt</alttext><imageextension><file>file ext</file> e--xt&rbrace;</imageextension></image>
<image where="inline"><imagefile>image</imagefile></image> <image where="inline"><imagefile>image</imagefile></image>
</pre></example>

<image><imagefile>f--ile</imagefile><alttext>a very long alt argument that could span more than one line who knows</alttext></image>

<para>in para
<image where="inline"><imagefile>f--ile</imagefile><alttext>a very long alt argument that could span more than one line who knows</alttext></image>.
</para></chapter>
';


$result_converted{'docbook'}->{'image_formatting'} = '<chapter label="1" id="chap">
<title>Chapter</title>

<para><literal>@image{f--ile}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,l--i}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,l--e}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,,alt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,,,e-d-xt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,aze,az,alt,e--xt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,aze,az,alt,</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f-ile,aze,,a--lt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f-ile.jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>
<literal>@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile@..jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>
<inlinemediaobject><imageobject><imagedata fileref="image.jpg" format="JPG"></imagedata></imageobject><textobject><literallayout>aaa
bbb
ccc</literallayout></textobject></inlinemediaobject> <inlinemediaobject><imageobject><imagedata fileref="image.jpg" format="JPG"></imagedata></imageobject><textobject><literallayout>aaa
bbb
ccc</literallayout></textobject></inlinemediaobject>
</para>
<screen><literal>@image{f--ile}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,l--i}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,l--e}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,,alt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,,,,e-d-xt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f--ile,aze,az,alt,e--xt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>
<literal>@image{f-ile,aze,,a--lt}</literal> <inlinemediaobject><imageobject><imagedata fileref="f-ile.jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>
<literal>@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}</literal> <inlinemediaobject><imageobject><imagedata fileref="f--ile@..jpg" format="JPG"></imagedata></imageobject></inlinemediaobject>
<inlinemediaobject><imageobject><imagedata fileref="image.jpg" format="JPG"></imagedata></imageobject><textobject><literallayout>aaa
bbb
ccc</literallayout></textobject></inlinemediaobject> <inlinemediaobject><imageobject><imagedata fileref="image.jpg" format="JPG"></imagedata></imageobject><textobject><literallayout>aaa
bbb
ccc</literallayout></textobject></inlinemediaobject>
</screen>
<informalfigure><mediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></mediaobject></informalfigure>

<para>in para
<inlinemediaobject><imageobject><imagedata fileref="f--ile.png" format="PNG"></imagedata></imageobject><textobject><literallayout>Image description&quot;&quot;\\.</literallayout></textobject></inlinemediaobject>.
</para></chapter>
';

$result_converted_errors{'docbook'}->{'image_formatting'} = '* W l14|@image file `f-ile\' not found, using `f-ile.jpg\'
 warning: @image file `f-ile\' not found, using `f-ile.jpg\'

* W l15|@image file `f--ile@.\' not found, using `f--ile@..jpg\'
 warning: @image file `f--ile@.\' not found, using `f--ile@..jpg\'

* W l25|@image file `f-ile\' not found, using `f-ile.jpg\'
 warning: @image file `f-ile\' not found, using `f-ile.jpg\'

* W l26|@image file `f--ile@.\' not found, using `f--ile@..jpg\'
 warning: @image file `f--ile@.\' not found, using `f--ile@..jpg\'

';


$result_converted{'latex_text'}->{'image_formatting'} = '\\begin{document}
\\label{anchor:Top}%
\\Texinfochapter{{Chapter}}
\\label{anchor:chap}%

\\texttt{@image\\{f{-}{-}ile\\}} \\includegraphics{f--ile}
\\texttt{@image\\{f{-}{-}ile,l{-}{-}i\\}} \\includegraphics[width=l--i]{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,}l{-}{-}e\\}} \\includegraphics[height=l--e]{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,},alt\\}} \\includegraphics[alt={alt}]{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,}{,}{,}e-d-xt\\}} \\includegraphics{f--ile}
\\texttt{@image\\{f{-}{-}ile,aze,az,alt,e{-}{-}xt\\}} \\includegraphics[width=aze,height=az,alt={alt}]{f--ile}
\\texttt{@image\\{f{-}{-}ile,aze,az,alt,} \\includegraphics[width=aze,height=az,alt={alt}]{f--ile}
\\texttt{@image\\{f-ile,aze{,}{,}a{-}{-}lt\\}} \\includegraphics[width=aze,alt={a-lt}]{f-ile}
\\texttt{@image\\{@file\\{f{-}{-}ile\\}@@@.,aze,az,alt,@file\\{file ext\\}\\ e{-}{-}xt@\\}} \\includegraphics[width=aze,height=az,alt={alt}]{f--ile@.}
\\includegraphics{image} \\includegraphics{image}

\\begin{Texinfoindented}
\\begin{Texinfopreformatted}%
\\ttfamily \\texttt{@image\\{f{-}{-}ile\\}}\\ \\includegraphics{f--ile}
\\texttt{@image\\{f{-}{-}ile,l{-}{-}i\\}}\\ \\includegraphics[width=l--i]{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,}l{-}{-}e\\}}\\ \\includegraphics[height=l--e]{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,},alt\\}}\\ \\includegraphics[alt={alt}]{f--ile}
\\texttt{@image\\{f{-}{-}ile{,}{,}{,}{,}e-d-xt\\}}\\ \\includegraphics{f--ile}
\\texttt{@image\\{f{-}{-}ile,aze,az,alt,e{-}{-}xt\\}}\\ \\includegraphics[width=aze,height=az,alt={alt}]{f--ile}
\\texttt{@image\\{f-ile,aze{,}{,}a{-}{-}lt\\}}\\ \\includegraphics[width=aze,alt={a-lt}]{f-ile}
\\texttt{@image\\{@file\\{f{-}{-}ile\\}@@@.,aze,az,alt,@file\\{file ext\\}\\ e{-}{-}xt@\\}}\\ \\includegraphics[width=aze,height=az,alt={alt}]{f--ile@.}
\\includegraphics{image}\\ \\includegraphics{image}
\\end{Texinfopreformatted}
\\end{Texinfoindented}

\\includegraphics[alt={a very long alt argument that could span more than one line who knows}]{f--ile}

in para
\\includegraphics[alt={a very long alt argument that could span more than one line who knows}]{f--ile}.
';

$result_converted_errors{'latex_text'}->{'image_formatting'} = '* W l14|@image file `f-ile\' (for LaTeX) not found
 warning: @image file `f-ile\' (for LaTeX) not found

* W l15|@image file `f--ile@.\' (for LaTeX) not found
 warning: @image file `f--ile@.\' (for LaTeX) not found

* W l16|@image file `image\' (for LaTeX) not found
 warning: @image file `image\' (for LaTeX) not found

* W l16|@image file `image\' (for LaTeX) not found
 warning: @image file `image\' (for LaTeX) not found

* W l25|@image file `f-ile\' (for LaTeX) not found
 warning: @image file `f-ile\' (for LaTeX) not found

* W l26|@image file `f--ile@.\' (for LaTeX) not found
 warning: @image file `f--ile@.\' (for LaTeX) not found

* W l27|@image file `image\' (for LaTeX) not found
 warning: @image file `image\' (for LaTeX) not found

* W l27|@image file `image\' (for LaTeX) not found
 warning: @image file `image\' (for LaTeX) not found

';


$result_converted{'info'}->{'image_formatting'} = Encode::encode('utf-8', 'This is , produced from .


File: ,  Node: Top,  Next: chap,  Up: (dir)

top
***

* Menu:

* chap::


File: ,  Node: chap,  Prev: Top,  Up: Top

1 Chapter
*********

‘@image{f--ile}’  [image src="f--ile.png" text="Image description\\"\\"\\\\." ] ‘@image{f--ile,l--i}’  [image src="f--ile.png" text="Image description\\"\\"\\\\." ] ‘@image{f--ile,,l--e}’  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
‘@image{f--ile,,,alt}’  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ] ‘@image{f--ile,,,,e-d-xt}’  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
‘@image{f--ile,aze,az,alt,e--xt}’  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ] ‘@image{f--ile,aze,az,alt,’  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]
‘@image{f-ile,aze,,a--lt}’ [a-lt]
‘@image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@}’ [alt] aaa
bbb
ccc aaa
bbb
ccc

     @image{f--ile}  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
     @image{f--ile,l--i}  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
     @image{f--ile,,l--e}  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
     @image{f--ile,,,alt}  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]
     @image{f--ile,,,,e-d-xt}  [image src="f--ile.png" text="Image description\\"\\"\\\\." ]
     @image{f--ile,aze,az,alt,e--xt}  [image src="f--ile.png" alt="alt" text="Image description\\"\\"\\\\." ]
     @image{f-ile,aze,,a--lt} [a-lt]
     @image{@file{f--ile}@@@.,aze,az,alt,@file{file ext} e--xt@} [alt]
     aaa
bbb
ccc aaa
bbb
ccc

 [image src="f--ile.png" alt="a very long alt argument that could span more than one line who knows" text="Image description\\"\\"\\\\." ]

   in para  [image src="f--ile.png" alt="a very long alt argument that could span more than one line who knows" text="Image description\\"\\"\\\\." ].


Tag Table:
Node: Top27
Node: chap102

End Tag Table


Local Variables:
coding: utf-8
End:
');

1;
