use vars qw(%result_texis %result_texts %result_tree_text %result_errors
   %result_indices %result_floats %result_nodes_list %result_sections_list
   %result_sectioning_root %result_headings_list
   %result_converted %result_converted_errors %result_converted_sort_strings
   %result_indices_sort_strings);

use utf8;

use Encode;

$result_tree_text{'bib_example'} = '*document_root C9
 *before_node_section C2
  *before_beginning C1
   {text_before_beginning:\\input texinfo   @c -*-texinfo-*-\\n}
  *preamble_before_content C218
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% Copyright (C) 2004  Aaron S. Hawley}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% Author: Aaron S. Hawley <ashawley@gnu.uvm.edu>}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% Keywords: docs, texinfo, extensions, bib}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% This file is free software; you can redistribute it and/or modify}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% it under the terms of the GNU General Public License as published by}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% the Free Software Foundation; either version 2, or (at your option)}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% any later version.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% This file is distributed in the hope that it will be useful,}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% but WITHOUT ANY WARRANTY; without even the implied warranty of}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% GNU General Public License for more details.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% You should have received a copy of the GNU General Public License}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% along with texi2html; see the file COPYING.  If not, write to}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% the Free Software Foundation, Inc., 59 Temple Place - Suite 330,}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% Boston, MA 02111-1307, USA.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@comment C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%**start of header}
     {spaces_after_argument:\\n}
   *normal_command@settitle C1 bib-example.texi:l23
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:Texinfo with a Bibliography and References}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   >SOURCEMARKS
   >include<start;1><p:1>
    >*normal_command@include C1 bib-example.texi:l25
    >|text_arg:{my-bib-macros.texi}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:my-bib-macros.texi}
      >{spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:\\input texinfo   @c -*-texinfo-*-}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% my-bib-macros.texi --- Texinfo macros providing a crude}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% bibliography and citation capability.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% Copyright (C) 2004  Aaron S. Hawley}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% Author: Aaron S. Hawley <ashawley@gnu.uvm.edu>}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% Keywords: docs, texinfo, extensions, bib}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% This file is free software; you can redistribute it and/or modify}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% it under the terms of the GNU General Public License as published by}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% the Free Software Foundation; either version 2, or (at your option)}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% any later version.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% This file is distributed in the hope that it will be useful,}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% but WITHOUT ANY WARRANTY; without even the implied warranty of}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% GNU General Public License for more details.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% You should have received a copy of the GNU General Public License}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% along with texi2html; see the file COPYING.  If not, write to}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% the Free Software Foundation, Inc., 59 Temple Place - Suite 330,}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% Boston, MA 02111-1307, USA.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% Commentary:}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%% Introduction}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% Creates references to a ``Bibliography\'\' or ``References\'\'}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% section of a Texinfo document, using Texinfo\'s}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% macro system.  Although not as terse a way to cite systems as is}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% found in document systems like TeX, the format is simpler and}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% the rendering  is easier for non-academic readers.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%% Usage}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% References to cited works can be put in any section of a document.}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% The cited works must be put in either a Texinfo table (for}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% instance with ``@table @asis ... @end table\'\') or within a}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% Texinfo list (something like ``@enumerate ... @end enumerate\'\'}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% or ``@itemize @bullet ... @end itemize\'\').  They are created}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% with the command ``@mybibitem{REF-NAME}\'\'.  To cite a reference}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% with a @mybibitem use ``@mybibcite{REF-NAME}\'\'.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% The beginning of a document must include (using the @include}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% command) the file my-bib-macros.texi, which should be made}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% available in the current directory of the parent file.  A single}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% call should be made to choose to use a list or a table.  The}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% command to chose is called @mybibuselist{NODE}, where NODE is}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% the node containing the location where the references are listed.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%% Example}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% \\input texinfo   @c -*-texinfo-*-}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @comment %**start of header}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @setfilename my-file-with-bib.info}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @settitle Texinfo with a Bibliography and References}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @include my-bib-macros.texi}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @mybibuselist{References}}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @comment %**end of header}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @node Top}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @top Top}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @menu}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% * Introduction::}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% * @mybibnode{}::}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @end menu}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @node Introduction}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @chapter Introduction}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% The ability of a documentation format to make cross references to a}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% bibliography, a feature of LaTeX @mybibcite{LaTeX2e}, isn\'t}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% currently supported in Texinfo.}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @node @mybibnode{}}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @chapter References}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @itemize @asis}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @mybibitem{LaTeX2e} Leslie Lamport, LaTeX User\'s Guide and}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% Reference Manual, 2nd edition, Addison-Wesley, Reading,}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% Massachusetts, 1994.}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @end itemize}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @bye}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% This example produces (in Info):}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       1 Introduction}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       **************}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       The ability of a documentation format to make cross}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       references to a bibliography, a feature of LaTeX (See item}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       [LaTeX2e] in *Note LaTeX2e: References.), is not currently}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       supported in Texinfo.}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       2 References}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       ************}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       [LaTeX2e] Leslie Lamport, LaTeX User\'s Guide and Reference}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       Manual, 2nd edition, Addison-Wesley, Reading,}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       Massachusetts, 1994.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% and (in printed output):}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       1 Introduction}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       **************}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       The ability of a documentation format to make cross}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       references to a bibliography, a feature of LaTeX (See item}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       [LaTeX2e] in Chapter 2 [References], page 3.), is not}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       currently supported in Texinfo.}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       2 References}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       ************}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       [LaTeX2e] Leslie Lamport, LaTeX User\'s Guide and Reference}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       Manual, 2nd edition, Addison-Wesley, Reading,}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%       Massachusetts, 1994.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%%% Notes}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% The pointers to references will be functional in hypertext}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% documentation (info, HTML, XML and others) and properly rendered}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% in print documents, because they are implemented with Texinfo\'s}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% cross referencing capabilities (using @anchor and @ref).  Failures}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% by an author to make proper references with ``my-bib-macros\'\' in}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% their document will give cross referencing errors by Texinfo}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% conversion tools.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% Only one ``Reference\'\' section is allowed per document.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% An improvement of this system would create cross references}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% (with @xref) at each cited work to all the originating cross}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% refererences.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% Code:}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:% Configuration Options}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @mybibsetrefnode : Defines the name of the node to contain}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% references.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 my-bib-macros.texi:l162
   |formal_args:A{node}
   |macro_name:{mybibsetrefnode}
    *arguments_line C1
     {macro_line: mybibsetrefnode{node}\\n}
    {raw:@set mybibrefnode \\node\\\\n}
    *normal_command@end C1 my-bib-macros.texi:l164
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @mybibnode{} : Macro to be placed at node containing references}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% and calls to @mybibcite{}}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 my-bib-macros.texi:l169
   |formal_args:A{}
   |macro_name:{mybibnode}
    *arguments_line C1
     {macro_line: mybibnode{}\\n}
    {raw:@value{mybibrefnode}\\n}
    *normal_command@end C1 my-bib-macros.texi:l171
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @mybibusetable : Whether each @mybibitem will be put in a}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% table.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C7 my-bib-macros.texi:l176
   |formal_args:A{node}
   |macro_name:{mybibusetable}
    *arguments_line C1
     {macro_line: mybibusetable{node}\\n}
    {raw:@set mybibtable true\\n}
    {raw:@ifset mybiblist\\n}
    {raw:@clear mybiblist\\n}
    {raw:@end ifset\\n}
    {raw:@mybibsetrefnode{\\node\\}\\n}
    *normal_command@end C1 my-bib-macros.texi:l182
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @mybibuselist : Whether each @mybibitem will be put in a}
     {spaces_after_argument:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% list.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C7 my-bib-macros.texi:l187
   |formal_args:A{node}
   |macro_name:{mybibuselist}
    *arguments_line C1
     {macro_line: mybibuselist{node}\\n}
    {raw:@set mybiblist true\\n}
    {raw:@ifset mybibtable\\n}
    {raw:@clear mybibtable\\n}
    {raw:@end ifset\\n}
    {raw:@mybibsetrefnode{\\node\\}\\n}
    *normal_command@end C1 my-bib-macros.texi:l193
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @mybibcite{REF} : Cites the cross reference REF.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C10 my-bib-macros.texi:l198
   |formal_args:A{ref}
   |macro_name:{mybibcite}
    *arguments_line C1
     {macro_line: mybibcite{ref}\\n}
    {raw:@ifclear mybibrefnode\\n}
    {raw:@mybibmakeref{mybibsetrefnode was not used, \\ref\\}\\n}
    {raw:@end ifclear\\n}
    {raw:@c %**else if\\n}
    {raw:@ifset mybibrefnode\\n}
    {raw:@mybibmakeref{@mybibnode{}, \\ref\\}\\n}
    {raw:@end ifset\\n}
    {raw:\\n}
    *normal_command@end C1 my-bib-macros.texi:l207
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C3 my-bib-macros.texi:l209
   |formal_args:A{node|ref}
   |macro_name:{mybibmakeref}
    *arguments_line C1
     {macro_line: mybibmakeref{node, ref}\\n}
    {raw:(See item [\\ref\\] in @ref{\\node\\, \\ref\\}.)\\n}
    *normal_command@end C1 my-bib-macros.texi:l211
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% @mybibcite{REF} : Creates a cross referenced citation REF.}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@macro C16 my-bib-macros.texi:l215
   |formal_args:A{ref}
   |macro_name:{mybibitem}
    *arguments_line C1
     {macro_line: mybibitem{ref}\\n}
    {raw:@ifclear mybiblist\\n}
    {raw:@ifclear mybibtable\\n}
    {raw:@set mybiblist true\\n}
    {raw:@end ifclear\\n}
    {raw:@end ifclear\\n}
    {raw:@ifset mybiblist\\n}
    {raw:@item\\n}
    {raw:@anchor{\\ref\\}[\\ref\\]\\n}
    {raw:@end ifset\\n}
    {raw:@c %**else if\\n}
    {raw:@ifset mybibtable\\n}
    {raw:@item @anchor{\\ref\\}[\\ref\\]\\n}
    {raw:@end ifset\\n}
    {raw:\\n}
    *normal_command@end C1 my-bib-macros.texi:l230
    |text_arg:{macro}
     *line_arg C3
      {spaces_before_argument: }
      {normal_text:macro}
      {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@c C1
   >SOURCEMARKS
   >include<end;1>
   >macro_expansion<start;1>
    >*macro_call@mybibuselist C1
     >*brace_arg C1
      >{macro_call_arg_text:References}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%% my-bib-macros.texi ends here}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |misc_args:A{mybiblist|true}
   >SOURCEMARKS
   >ignored_conditional_block<1>
    >*normal_command@ifset C3 bib-example.texi:l26:@mybibuselist
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:mybibtable}
       >{spaces_after_argument:\\n}
     >{raw:@clear mybibtable\\n}
     >*normal_command@end C1 bib-example.texi:l26:@mybibuselist
     >|text_arg:{ifset}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifset}
       >{spaces_after_argument:\\n}
   >macro_expansion<start;2>
    >*macro_call@mybibsetrefnode C1
     >*brace_arg C1
      >{macro_call_arg_text:References}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:mybiblist true}
     {spaces_after_argument:\\n}
   *normal_command@set C1
   |misc_args:A{mybibrefnode|References}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:mybibrefnode References}
     >SOURCEMARKS
     >macro_expansion<end;2><p:23>
     >macro_expansion<end;1><p:23>
     {spaces_after_argument:\\n}
   {empty_line:\\n}
   *normal_command@comment C1
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%**end of header}
     {spaces_after_argument:\\n}
   {empty_line:\\n}
 *normal_command@node C1 bib-example.texi:l30 {Top}
 |identifier:{Top}
 |is_target:{1}
 |node_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
 *normal_command@top C4 bib-example.texi:l31 {Top}
 |section_level:{0}
 |section_number:{1}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Top}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@menu C5 bib-example.texi:l33
   *arguments_line C1
    *block_line_arg C1
     {spaces_before_argument:\\n}
   *menu_entry C4 bib-example.texi:l34
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{Introduction}
     {normal_text:Introduction}
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_entry C4 bib-example.texi:l35
    {menu_entry_leading_text:* }
    *menu_entry_node C1
    |node_content:A{0|0}
    |normalized:{References}
     {normal_text:References}
     >SOURCEMARKS
     >macro_expansion<start;3>
      >*macro_call@mybibnode C1
       >*brace_arg
     >value_expansion<start;1>{References}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:mybibrefnode}
     >value_expansion<end;1><p:10>
     >macro_expansion<end;3><p:10>
    {menu_entry_separator:::}
    *menu_entry_description C1
     *preformatted C1
      {normal_text:\\n}
   *menu_comment C1
    *preformatted C1
     {after_menu_description_line:\\n}
   *normal_command@end C1 bib-example.texi:l37
   |text_arg:{menu}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:menu}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@node C1 bib-example.texi:l39 {Introduction}
 |identifier:{Introduction}
 |is_target:{1}
 |node_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Introduction}
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 bib-example.texi:l40 {Introduction}
 |section_heading_number:{1}
 |section_level:{1}
 |section_number:{2}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:Introduction}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *paragraph C8
   {normal_text:The ability of a documentation format to make cross references to a\\n}
   {normal_text:bibliography, a feature of LaTeX }
   >SOURCEMARKS
   >macro_expansion<start;4><p:33>
    >*macro_call@mybibcite C1
     >*brace_arg C1
      >{macro_call_arg_text:LaTeX2e}
   >ignored_conditional_block<2><p:33>
    >*normal_command@ifclear C3 bib-example.texi:l43:@mybibcite
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:mybibrefnode}
       >{spaces_after_argument:\\n}
     >{raw:@mybibmakeref{mybibsetrefnode was not used, LaTeX2e}\\n}
     >*normal_command@end C1 bib-example.texi:l43:@mybibcite
     >|text_arg:{ifclear}
      >*line_arg C3
       >{spaces_before_argument: }
       >{normal_text:ifclear}
       >{spaces_after_argument:\\n}
   *normal_command@c C1
   >SOURCEMARKS
   >expanded_conditional_command<start;1>
    >*normal_command@ifset C1 bib-example.texi:l43:@mybibcite
     >*arguments_line C1
      >*block_line_arg C3
       >{spaces_before_argument: }
       >{normal_text:mybibrefnode}
       >{spaces_after_argument:\\n}
    *line_arg C3
     {spaces_before_argument: }
     {rawline_text:%**else if}
     {spaces_after_argument:\\n}
   {normal_text:(See item [LaTeX2e] in }
   >SOURCEMARKS
   >macro_expansion<start;5>
    >*macro_call@mybibmakeref C2
     >*brace_arg C1
      >{macro_call_arg_text:@mybibnode{}}
     >*brace_arg C2
      >{spaces_before_argument: }
      >{macro_call_arg_text:LaTeX2e}
   *normal_command@ref C2 bib-example.texi:l43:@mybibmakeref
    *brace_arg C1
    |node_content:A{0|0}
    |normalized:{References}
     {normal_text:References}
     >SOURCEMARKS
     >macro_expansion<start;6>
      >*macro_call@mybibnode C1
       >*brace_arg
     >value_expansion<start;2>{References}
      >*normal_command@value C1
       >*brace_container C1
        >{normal_text:mybibrefnode}
     >value_expansion<end;2><p:10>
     >macro_expansion<end;6><p:10>
    *brace_arg C2
     {spaces_before_argument: }
     {normal_text:LaTeX2e}
   {normal_text:.)\\n}
   >SOURCEMARKS
   >macro_expansion<end;5><p:2>
   >expanded_conditional_command<end;1><p:3>
    >*normal_command@end C1 bib-example.texi:l43:@mybibcite
    >|text_arg:{ifset}
     >*line_arg C3
      >{spaces_before_argument: }
      >{normal_text:ifset}
      >{spaces_after_argument:\\n}
   >macro_expansion<end;4><p:3>
   {normal_text:, isn\'t\\n}
   {normal_text:currently supported in Texinfo.\\n}
  {empty_line:\\n}
 *normal_command@node C1 bib-example.texi:l46 {References}
 |identifier:{References}
 |is_target:{1}
 |node_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    >SOURCEMARKS
    >macro_expansion<start;7><p:1>
     >*macro_call@mybibnode C1
      >*brace_arg
    >value_expansion<start;3><p:1>{References}
     >*normal_command@value C1
      >*brace_container C1
       >{normal_text:mybibrefnode}
    {normal_text:References}
    >SOURCEMARKS
    >value_expansion<end;3><p:10>
    >macro_expansion<end;7><p:10>
    {spaces_after_argument:\\n}
 *normal_command@chapter C4 bib-example.texi:l47 {References}
 |section_heading_number:{2}
 |section_level:{1}
 |section_number:{3}
  *arguments_line C1
   *line_arg C3
    {spaces_before_argument: }
    {normal_text:References}
    {spaces_after_argument:\\n}
  {empty_line:\\n}
  *normal_command@itemize C4 bib-example.texi:l49
   *arguments_line C1
    *block_line_arg C3
     {spaces_before_argument: }
     *normal_command@w C1 bib-example.texi:l49
      *brace_container
     {spaces_after_argument:\\n}
   *before_item C1
    {empty_line:\\n}
    >SOURCEMARKS
    >macro_expansion<start;8><p:1>
     >*macro_call@mybibitem C1
      >*brace_arg C1
       >{macro_call_arg_text:LaTeX2e}
    >ignored_conditional_block<3><p:1>
     >*normal_command@ifclear C5 bib-example.texi:l51:@mybibitem
      >*arguments_line C1
       >*block_line_arg C3
        >{spaces_before_argument: }
        >{normal_text:mybiblist}
        >{spaces_after_argument:\\n}
      >{raw:@ifclear mybibtable\\n}
      >{raw:@set mybiblist true\\n}
      >{raw:@end ifclear\\n}
      >*normal_command@end C1 bib-example.texi:l51:@mybibitem
      >|text_arg:{ifclear}
       >*line_arg C3
        >{spaces_before_argument: }
        >{normal_text:ifclear}
        >{spaces_after_argument:\\n}
    >expanded_conditional_command<start;2><p:1>
     >*normal_command@ifset C1 bib-example.texi:l51:@mybibitem
      >*arguments_line C1
       >*block_line_arg C3
        >{spaces_before_argument: }
        >{normal_text:mybiblist}
        >{spaces_after_argument:\\n}
   *normal_command@item C4 bib-example.texi:l51:@mybibitem
   |item_number:{1}
    {ignorable_spaces_after_command:\\n}
    *normal_command@anchor C1 bib-example.texi:l51:@mybibitem
    |identifier:{LaTeX2e}
    |is_target:{1}
     *brace_arg C1
      {normal_text:LaTeX2e}
    *paragraph C5
     {normal_text:[LaTeX2e]\\n}
     >SOURCEMARKS
     >expanded_conditional_command<end;2><p:10>
      >*normal_command@end C1 bib-example.texi:l51:@mybibitem
      >|text_arg:{ifset}
       >*line_arg C3
        >{spaces_before_argument: }
        >{normal_text:ifset}
        >{spaces_after_argument:\\n}
     *normal_command@c C1
     >SOURCEMARKS
     >ignored_conditional_block<4>
      >*normal_command@ifset C3 bib-example.texi:l51:@mybibitem
       >*arguments_line C1
        >*block_line_arg C3
         >{spaces_before_argument: }
         >{normal_text:mybibtable}
         >{spaces_after_argument:\\n}
       >{raw:@item @anchor{LaTeX2e}[LaTeX2e]\\n}
       >*normal_command@end C1 bib-example.texi:l51:@mybibitem
       >|text_arg:{ifset}
        >*line_arg C3
         >{spaces_before_argument: }
         >{normal_text:ifset}
         >{spaces_after_argument:\\n}
     >macro_expansion<end;8>
      *line_arg C3
       {spaces_before_argument: }
       {rawline_text:%**else if}
       {spaces_after_argument:\\n}
     {normal_text: Leslie Lamport, LaTeX User\'s Guide and\\n}
     {normal_text:Reference Manual, 2nd edition, Addison-Wesley, Reading,\\n}
     {normal_text:Massachusetts, 1994.\\n}
    {empty_line:\\n}
   *normal_command@end C1 bib-example.texi:l55
   |text_arg:{itemize}
    *line_arg C3
     {spaces_before_argument: }
     {normal_text:itemize}
     {spaces_after_argument:\\n}
  {empty_line:\\n}
 *normal_command@bye C1
  *line_arg C1
   {spaces_before_argument:\\n}
 *postamble_after_end C1
  {text_after_end:\\n}
';


$result_texis{'bib_example'} = '\\input texinfo   @c -*-texinfo-*-
@c % Copyright (C) 2004  Aaron S. Hawley

@c % Author: Aaron S. Hawley <ashawley@gnu.uvm.edu>
@c % Keywords: docs, texinfo, extensions, bib

@c % This file is free software; you can redistribute it and/or modify
@c % it under the terms of the GNU General Public License as published by
@c % the Free Software Foundation; either version 2, or (at your option)
@c % any later version.

@c % This file is distributed in the hope that it will be useful,
@c % but WITHOUT ANY WARRANTY; without even the implied warranty of
@c % MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
@c % GNU General Public License for more details.

@c % You should have received a copy of the GNU General Public License
@c % along with texi2html; see the file COPYING.  If not, write to
@c % the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
@c % Boston, MA 02111-1307, USA.

@comment %**start of header
@settitle Texinfo with a Bibliography and References

@c \\input texinfo   @c -*-texinfo-*-
@c %% my-bib-macros.texi --- Texinfo macros providing a crude
@c %% bibliography and citation capability.

@c % Copyright (C) 2004  Aaron S. Hawley

@c % Author: Aaron S. Hawley <ashawley@gnu.uvm.edu>
@c % Keywords: docs, texinfo, extensions, bib

@c % This file is free software; you can redistribute it and/or modify
@c % it under the terms of the GNU General Public License as published by
@c % the Free Software Foundation; either version 2, or (at your option)
@c % any later version.

@c % This file is distributed in the hope that it will be useful,
@c % but WITHOUT ANY WARRANTY; without even the implied warranty of
@c % MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
@c % GNU General Public License for more details.

@c % You should have received a copy of the GNU General Public License
@c % along with texi2html; see the file COPYING.  If not, write to
@c % the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
@c % Boston, MA 02111-1307, USA.

@c %% Commentary:

@c %%% Introduction

@c %% Creates references to a ``Bibliography\'\' or ``References\'\'
@c %% section of a Texinfo document, using Texinfo\'s
@c %% macro system.  Although not as terse a way to cite systems as is
@c %% found in document systems like TeX, the format is simpler and
@c %% the rendering  is easier for non-academic readers.

@c %

@c %%% Usage

@c %% References to cited works can be put in any section of a document.
@c %% The cited works must be put in either a Texinfo table (for
@c %% instance with ``@table @asis ... @end table\'\') or within a
@c %% Texinfo list (something like ``@enumerate ... @end enumerate\'\'
@c %% or ``@itemize @bullet ... @end itemize\'\').  They are created
@c %% with the command ``@mybibitem{REF-NAME}\'\'.  To cite a reference
@c %% with a @mybibitem use ``@mybibcite{REF-NAME}\'\'.

@c %% The beginning of a document must include (using the @include
@c %% command) the file my-bib-macros.texi, which should be made
@c %% available in the current directory of the parent file.  A single
@c %% call should be made to choose to use a list or a table.  The
@c %% command to chose is called @mybibuselist{NODE}, where NODE is
@c %% the node containing the location where the references are listed.

@c %

@c %%% Example

@c %% \\input texinfo   @c -*-texinfo-*-
@c %% @comment %**start of header
@c %% @setfilename my-file-with-bib.info
@c %% @settitle Texinfo with a Bibliography and References
@c %%
@c %% @include my-bib-macros.texi
@c %% @mybibuselist{References}
@c %%
@c %% @comment %**end of header
@c %%
@c %% @node Top
@c %% @top Top
@c %%
@c %% @menu
@c %% * Introduction::
@c %% * @mybibnode{}::
@c %%
@c %% @end menu
@c %%
@c %% @node Introduction
@c %% @chapter Introduction
@c %%
@c %% The ability of a documentation format to make cross references to a
@c %% bibliography, a feature of LaTeX @mybibcite{LaTeX2e}, isn\'t
@c %% currently supported in Texinfo.
@c %%
@c %% @node @mybibnode{}
@c %% @chapter References
@c %%
@c %% @itemize @asis
@c %%
@c %% @mybibitem{LaTeX2e} Leslie Lamport, LaTeX User\'s Guide and
@c %% Reference Manual, 2nd edition, Addison-Wesley, Reading,
@c %% Massachusetts, 1994.
@c %%
@c %% @end itemize
@c %%
@c %% @bye

@c %%

@c %% This example produces (in Info):

@c %%       1 Introduction
@c %%       **************
@c %%
@c %%       The ability of a documentation format to make cross
@c %%       references to a bibliography, a feature of LaTeX (See item
@c %%       [LaTeX2e] in *Note LaTeX2e: References.), is not currently
@c %%       supported in Texinfo.
@c %%
@c %%
@c %%       2 References
@c %%       ************
@c %%
@c %%       [LaTeX2e] Leslie Lamport, LaTeX User\'s Guide and Reference
@c %%       Manual, 2nd edition, Addison-Wesley, Reading,
@c %%       Massachusetts, 1994.

@c %% and (in printed output):

@c %%       1 Introduction
@c %%       **************
@c %%
@c %%       The ability of a documentation format to make cross
@c %%       references to a bibliography, a feature of LaTeX (See item
@c %%       [LaTeX2e] in Chapter 2 [References], page 3.), is not
@c %%       currently supported in Texinfo.
@c %%
@c %%
@c %%       2 References
@c %%       ************
@c %%
@c %%       [LaTeX2e] Leslie Lamport, LaTeX User\'s Guide and Reference
@c %%       Manual, 2nd edition, Addison-Wesley, Reading,
@c %%       Massachusetts, 1994.

@c %

@c %%% Notes

@c %% The pointers to references will be functional in hypertext
@c %% documentation (info, HTML, XML and others) and properly rendered
@c %% in print documents, because they are implemented with Texinfo\'s
@c %% cross referencing capabilities (using @anchor and @ref).  Failures
@c %% by an author to make proper references with ``my-bib-macros\'\' in
@c %% their document will give cross referencing errors by Texinfo
@c %% conversion tools.

@c %% Only one ``Reference\'\' section is allowed per document.

@c %% An improvement of this system would create cross references
@c %% (with @xref) at each cited work to all the originating cross
@c %% refererences.

@c %

@c %% Code:

@c % Configuration Options

@c %% @mybibsetrefnode : Defines the name of the node to contain
@c %% references.

@macro mybibsetrefnode{node}
@set mybibrefnode \\node\\
@end macro

@c %% @mybibnode{} : Macro to be placed at node containing references
@c %% and calls to @mybibcite{}

@macro mybibnode{}
@value{mybibrefnode}
@end macro

@c %% @mybibusetable : Whether each @mybibitem will be put in a
@c %% table.

@macro mybibusetable{node}
@set mybibtable true
@ifset mybiblist
@clear mybiblist
@end ifset
@mybibsetrefnode{\\node\\}
@end macro

@c %% @mybibuselist : Whether each @mybibitem will be put in a
@c %% list.

@macro mybibuselist{node}
@set mybiblist true
@ifset mybibtable
@clear mybibtable
@end ifset
@mybibsetrefnode{\\node\\}
@end macro


@c %% @mybibcite{REF} : Cites the cross reference REF.

@macro mybibcite{ref}
@ifclear mybibrefnode
@mybibmakeref{mybibsetrefnode was not used, \\ref\\}
@end ifclear
@c %**else if
@ifset mybibrefnode
@mybibmakeref{@mybibnode{}, \\ref\\}
@end ifset

@end macro

@macro mybibmakeref{node, ref}
(See item [\\ref\\] in @ref{\\node\\, \\ref\\}.)
@end macro

@c %% @mybibcite{REF} : Creates a cross referenced citation REF.

@macro mybibitem{ref}
@ifclear mybiblist
@ifclear mybibtable
@set mybiblist true
@end ifclear
@end ifclear
@ifset mybiblist
@item
@anchor{\\ref\\}[\\ref\\]
@end ifset
@c %**else if
@ifset mybibtable
@item @anchor{\\ref\\}[\\ref\\]
@end ifset

@end macro

@c %% my-bib-macros.texi ends here
@set mybiblist true
@set mybibrefnode References

@comment %**end of header

@node Top
@top Top

@menu
* Introduction::
* References::

@end menu

@node Introduction
@chapter Introduction

The ability of a documentation format to make cross references to a
bibliography, a feature of LaTeX @c %**else if
(See item [LaTeX2e] in @ref{References, LaTeX2e}.)
, isn\'t
currently supported in Texinfo.

@node References
@chapter References

@itemize @w{}

@item
@anchor{LaTeX2e}[LaTeX2e]
@c %**else if
 Leslie Lamport, LaTeX User\'s Guide and
Reference Manual, 2nd edition, Addison-Wesley, Reading,
Massachusetts, 1994.

@end itemize

@bye

';


$result_texts{'bib_example'} = '


















































Top
***

* Introduction::
* References::


1 Introduction
**************

The ability of a documentation format to make cross references to a
bibliography, a feature of LaTeX (See item [LaTeX2e] in References.)
, isn\'t
currently supported in Texinfo.

2 References
************


[LaTeX2e]
 Leslie Lamport, LaTeX User\'s Guide and
Reference Manual, 2nd edition, Addison-Wesley, Reading,
Massachusetts, 1994.


';

$result_errors{'bib_example'} = '* W bib-example.texi:l43:@mybibcite|@ifclear should only appear at the beginning of a line
 warning: @ifclear should only appear at the beginning of a line (possibly involving @mybibcite)

';

$result_nodes_list{'bib_example'} = '1|Top
 associated_section: Top
 associated_title_command: Top
 menus:
  Introduction
  References
 node_directions:
  next->Introduction
2|Introduction
 associated_section: 1 Introduction
 associated_title_command: 1 Introduction
 node_directions:
  next->References
  prev->Top
  up->Top
3|References
 associated_section: 2 References
 associated_title_command: 2 References
 node_directions:
  prev->Introduction
  up->Top
';

$result_sections_list{'bib_example'} = '1|Top
 associated_anchor_command: Top
 associated_node: Top
 toplevel_directions:
  next->Introduction
 section_children:
  1|Introduction
  2|References
2|Introduction
 associated_anchor_command: Introduction
 associated_node: Introduction
 section_directions:
  next->References
  up->Top
 toplevel_directions:
  next->References
  prev->Top
  up->Top
3|References
 associated_anchor_command: References
 associated_node: References
 section_directions:
  prev->Introduction
  up->Top
 toplevel_directions:
  prev->Introduction
  up->Top
';

$result_sectioning_root{'bib_example'} = 'level: -1
list:
 1|Top
';

$result_headings_list{'bib_example'} = '';

1;
