use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'chinese_mixed_with_en'} = '*document_root C6
 *before_node_section C2
  *preamble_before_beginning C1
   {text_before_beginning:\\input texinfo\\n}
  *preamble_before_content C3
   *normal_command@documentencoding C1 chinese_mixed_with_en.texi:l2
   |EXTRA
   |global_command_number:{1}
   |input_encoding_name:{utf-8}
   |text_arg:{utf-8}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:utf-8}
     {spaces_after_argument:\\n}
   *normal_command@settitle C1 chinese_mixed_with_en.texi:l3
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:chinese mixed with english}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 chinese_mixed_with_en.texi:l5 {Top}
 |EXTRA
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 chinese_mixed_with_en.texi:l6 {Mixed chinese and english}
 |EXTRA
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Mixed chinese and english}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:Example of english and chinese, chinese aligned or not.\\n}
  {empty_line:\\n}
 *normal_command@node C1 chinese_mixed_with_en.texi:l10 {Mixed english and chinese}
 |EXTRA
 |identifier:{Mixed-english-and-chinese}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Mixed english and chinese}
    {spaces_after_argument:\\n}
 *normal_command@chapter C19 chinese_mixed_with_en.texi:l11 {Mixed english and chinese}
 |EXTRA
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Mixed english and chinese}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:1. english only\\n}
  {empty_line:\\n}
  *paragraph C5
   {normal_text:The Emacs mode for programming in Ada 95 with GNAT helps the user\\n}
   {normal_text:in\\n}
   {normal_text:understanding existing code and facilitates writing new code.  It\\n}
   {normal_text:furthermore provides some utility functions for easier integration of\\n}
   {normal_text:standard Emacs features when programming in Ada.\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:2. chinese already aligned in source(this result)\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存读取\\n}
   {normal_text:变量的值，而不是作某些优化。（这些优化有可能导致程序不能获得正确的值）\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:3. chinese not aligned in source\\n}
  {empty_line:\\n}
  *paragraph C4
   {normal_text:这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存\\n}
   {normal_text:读取\\n}
   {normal_text:变量的值，而不是作某些优化。\\n}
   {normal_text:（这些优化有可能导致程序不能获得正确的值）\\n}
  {empty_line:\\n}
  *paragraph C1
   {normal_text:4. a mix of chinese and english\\n}
  {empty_line:\\n}
  *paragraph C2
   {normal_text:restrict 表示在当前 scope 内不允许其它变量指向它。用处，比如防止 memory\\n}
   {normal_text:overlap。\\n}
  {empty_line:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
';


$result_texis{'chinese_mixed_with_en'} = '\\input texinfo
@documentencoding utf-8
@settitle chinese mixed with english

@node Top
@top Mixed chinese and english

Example of english and chinese, chinese aligned or not.

@node Mixed english and chinese
@chapter Mixed english and chinese

1. english only

The Emacs mode for programming in Ada 95 with GNAT helps the user
in
understanding existing code and facilitates writing new code.  It
furthermore provides some utility functions for easier integration of
standard Emacs features when programming in Ada.

2. chinese already aligned in source(this result)

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存读取
变量的值，而不是作某些优化。（这些优化有可能导致程序不能获得正确的值）

3. chinese not aligned in source

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存
读取
变量的值，而不是作某些优化。
（这些优化有可能导致程序不能获得正确的值）

4. a mix of chinese and english

restrict 表示在当前 scope 内不允许其它变量指向它。用处，比如防止 memory
overlap。


@bye
';


$result_texts{'chinese_mixed_with_en'} = '
Mixed chinese and english
*************************

Example of english and chinese, chinese aligned or not.

1 Mixed english and chinese
***************************

1. english only

The Emacs mode for programming in Ada 95 with GNAT helps the user
in
understanding existing code and facilitates writing new code.  It
furthermore provides some utility functions for easier integration of
standard Emacs features when programming in Ada.

2. chinese already aligned in source(this result)

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存读取
变量的值，而不是作某些优化。（这些优化有可能导致程序不能获得正确的值）

3. chinese not aligned in source

这常用于修饰多个线程会访问或修改的全局变量，让编译器保证每次都从内存
读取
变量的值，而不是作某些优化。
（这些优化有可能导致程序不能获得正确的值）

4. a mix of chinese and english

restrict 表示在当前 scope 内不允许其它变量指向它。用处，比如防止 memory
overlap。


';

$result_errors{'chinese_mixed_with_en'} = '';

$result_nodes_list{'chinese_mixed_with_en'} = '1|Top
 associated_section: Mixed chinese and english
 associated_title_command: Mixed chinese and english
 node_directions:
  next->Mixed english and chinese
2|Mixed english and chinese
 associated_section: 1 Mixed english and chinese
 associated_title_command: 1 Mixed english and chinese
 node_directions:
  prev->Top
  up->Top
';

$result_sections_list{'chinese_mixed_with_en'} = '1|Mixed chinese and english
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Mixed english and chinese
 section_children:
  1|Mixed english and chinese
2|Mixed english and chinese
 associated_anchor_command: Mixed english and chinese
 associated_node: Mixed english and chinese
 section_directions:
  up->Mixed chinese and english
 toplevel_directions:
  prev->Mixed chinese and english
  up->Mixed chinese and english
';

$result_sectioning_root{'chinese_mixed_with_en'} = 'level: -1
list:
 1|Mixed chinese and english
';

$result_headings_list{'chinese_mixed_with_en'} = '';

1;
