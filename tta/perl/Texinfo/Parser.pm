# Copyright 2014-2026 Free Software Foundation, Inc.
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License,
# or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

package Texinfo::Parser;

use 5.006;
use strict;
use warnings;

use Texinfo::XSLoader;

# Not necessarily directly used, but a Texinfo::Document is returned by
# most Parser methods and loading the module here makes sure that the
# functions directly called on the returned object are found even if
# the caller does not load the module.
use Texinfo::Document;

our $VERSION = '7.3dev';

BEGIN {
  Texinfo::XSLoader::init (
      "Texinfo::Parser",
      "Texinfo::ParserNonXS",
      'ParserXS',
      "Texinfo::ParserXS",
      ['texinfo', 'texinfoxs'],
  );
}


# NB Don't add more functions down here, because this can cause an error
# with some versions of Perl, connected with any typeglob assignments done
# above.  ("Can't call mro_method_changed_in() on anonymous symbol table").
#
# See http://perl5.git.perl.org/perl.git/commitdiff/03d9f026ae253e9e69212a3cf6f1944437e9f070?hp=ac73ea1ec401df889d312b067f78b618f7ffecc3
#
# (change to Perl interpreter on 22 Oct 2011)


1;
__END__

=head1 NAME

Texinfo::Parser - Parse Texinfo code into a Perl tree

=head1 SYNOPSIS

  use Texinfo::Parser;

  my $parser = Texinfo::Parser::parser();
  my $document = $parser->parse_file("somefile.texi");

  my $errors = $document->parser_errors();
  foreach my $error_message (@$errors) {
    warn $error_message->{'error_line'};
  }

=head1 NOTES

The Texinfo Perl module main purpose is to be used in C<texi2any> to convert
Texinfo to other formats.  There is no promise of API stability.

=head1 DESCRIPTION

C<Texinfo::Parser> will parse Texinfo text into a Perl tree.  In one pass
it expands user-defined @-commands, conditionals (C<@ifset>, C<@ifinfo>...)
and C<@value> and constructs the tree.  Some extra information is gathered
while doing the tree: for example the number of columns in a multitable,
or the node associated with a section.

=head1 METHODS

No method is exported in the default case.  The module allows both
an object-oriented syntax, or traditional function, with the parser
as an opaque data structure given as an argument to every function.

=head2 Initialization

The following method is used to construct a new C<Texinfo::Parser> object:

=over

=item $parser = Texinfo::Parser::parser($options)
X<C<Texinfo::Parser::parser>>
X<Parser initialization>

This method creates a new parser.  The options may be provided as a hash
reference.  Most of those options correspond to Texinfo customization options
described in the Texinfo manual.

=over

=item CPP_LINE_DIRECTIVES

Handle cpp like synchronization lines if set. Set in the default case.

=item EXPANDED_FORMATS

An array reference of the output formats for which C<@ifI<FORMAT>>
conditional blocks should be expanded.  Default is empty.

=item FORMAT_MENU

Possible values are C<nomenu>, C<menu>, C<menu_no_detailmenu> and
C<sectiontoc>.  Only report menu-related errors for C<menu> and
C<menu_no_detailmenu>.

=item INCLUDE_DIRECTORIES

An array reference of directories in which C<@include> files should be
searched for.  Default contains the working directory, F<.>.

=item IGNORE_SPACE_AFTER_BRACED_COMMAND_NAME

If set, spaces after an @-command name that take braces are ignored.
Default on.

=item MAX_MACRO_CALL_NESTING

Maximal number of nested user-defined macro calls.  Default is 100000.

=item documentlanguage

A string corresponding to a document language set by C<@documentlanguage>.
It overrides the document C<@documentlanguage> information, if present.

=item values

A hash reference.  Keys are names, values are the corresponding values.
Same as values set by C<@set>.

=back

=back

=head2 Parsing Texinfo text

Different methods may be called to parse some Texinfo code:
C<parse_string> for a one-line string, C<parse_piece> for a fragment of
Texinfo, C<parse_text> for a string corresponding to a full document
and C<parse_file> for a file.  The first argument of these functions
is a parser.

When C<parse_string> is used, the resulting tree is rooted at
a C<root_line> type container.  Otherwise, the resulting tree should be
rooted at a C<document_root> type container.

=over

=item $tree = $parser->parse_string($text, $first_line_number)
X<C<parse_string>>

This function is used to parse a short fragment of Texinfo code.

I<$text> is the string containing the texinfo line.  I<$first_line_number> is
the line number of the line, if undef, it will be set to 1.

=item $document = $parser->parse_piece($text, $first_line_number)
X<C<parse_piece>>

This function is used to parse Texinfo fragments.

I<$text> is the string containing the texinfo text.  I<$first_line_number> is
the line number of the first text line, if undef, it will be set to 1.

=item $document = $parser->parse_text($text, $first_line_number)
X<C<parse_text>>

This function is used to parse a text as a whole document.

I<$text> is the string containing the texinfo text.  I<$first_line_number> is
the line number of the first text line, if undef, it will be set to 1.

=item $document = $parser->parse_file($file_name)
X<C<parse_file>>

The file with name I<$file_name> is considered to be a Texinfo file and
is parsed into a tree.  I<$file_name> should be a binary string.

=back

The errors collected during the tree parsing are available with
the resulting document C<parser_errors>.

=over

=item $error_warnings_list = $document->parser_errors()
X<C<parser_errors>>

This function returns the I<$error_warnings_list> as an array of hash
references one for each error, warning or error line continuation.  They are
described in detail in L<Texinfo::Report/DESCRIPTION>.

=back

=head1 TEXINFO TREE

X<Texinfo tree elements>

A Texinfo tree element (called element because node is overloaded in
the Texinfo world) is an hash reference.  There are three main categories
of tree element.  Tree elements associated with an @-command have a
C<cmdname> key holding the @-command name.  Tree elements corresponding
to text fragments have a C<text> key holding the corresponding text.
Finally, the last category is other elements.  Every tree element
have a C<type> key.

The C<contents> key holds an array reference for the children of @-command
tree elements and containers.  In particular for arguments of an @-command,
either in braces or on the rest of the line after the command, depending on
the type of command. Also for content appearing within a block @-command,
within a container, or within a C<@node> or sectioning @-command.  Text
fragments do not have children.

The C<extra> key is associated to a hash reference and hold information
gathered during the parsing.

=head2 Texinfo tree structure

=head3 Root and first level elements

A full Texinfo tree is rooted at a I<document_root> type element.
I<document_root> first element in C<contents> should be a
I<before_node_section> container for content appearing before the first node or
sectioning command.  I<before_node_section> first content is
I<before_beginning>.  If there is a C<@setfilename>,
I<before_beginning> holds everything before C<@setfilename> (It may
contains paragraphs and block commands elements before C<@setfilename>, if any,
although it is not recommended to have such content). If there is no
C<@setfilename>, it contains the C<\input texinfo.tex> line and following blank
lines.

The second container in I<before_node_section> is I<preamble_before_content>.
It contains everything appearing before the first formatted content such as
empty lines text elements,
elements corresponding to line commands such as C<@documentlanguage> or
C<@frenchspacing>, block commands such as C<@copying> that are not immediately
output but also raw output block commands such as C<@html>.  This container
corresponding to the I<preamble> in the Texinfo documentation.  The paragraphs
and other contents follow up in I<before_node_section> C<contents> until the
first node or section.

Nodes and sections @-commands elements follow.  The node
or sectioning command elements C<contents> hold all the elements corresponding
to Texinfo code before the next node or sectioning command element or C<@bye>.
If present in the Texinfo document, the C<@bye> element is next.  If there is
content after C<@bye>, it is last in the I<postamble_after_end> container
element.

The first element of a node or sectioning command C<contents>
is an I<arguments_line> container holding the command arguments
appearing on the @-command line.  The I<arguments_line> in turn contains
I<line_arg> containers for each of the node arguments separated by
commas, or the unique sectioning command argument.  The node or
sectioning command contents follow, including paragraphs, empty line
text elements, all kind of block commands and line commands such as
C<@center> or index commands such as C<@cindex> as well as C<@image>
command elements out of paragraphs.

=head3 Line command tree element

There are three main types of line commands, regular line commands,
I<lineraw> line commands and definition line commands.  All the line commands
hold I<line_arg> containers for their arguments.

=over

=item I<lineraw> line commands

I<lineraw> line commands arguments are not subject to the
usual macro expansion.  I<lineraw> line commands with
arguments are, for example, C<@set>, C<@unmacro>
and C<@comment>.  C<@raisesections>, C<@contents> and C<@novalidate>
are examples of I<lineraw> line commands without arguments.
They only have one I<line_arg> container, which should only contain
one I<rawline_text> text element.

=item regular line commands

Most line commands with arguments that are not node or sectioning commands are
regular line commands.  Regular line command C<contents> holds I<line_arg>
containers for each of the line arguments separated by commas.  I<line_arg>
containers contain in turn text elements, elements of @-commands without
arguments, with empty braces, such as C<@equiv> and with braces such as
C<@code> or C<@ref>.

=item definition line commands

Definition line commands elements are elements associated to commands like
C<@deffnx> or C<@defline>.  They contain a I<line_arg> container, which, in
turn contains the specific definition line containers such as I<def_category>,
I<def_arg> and some special text elements such as I<space>.

=back

=head3 Block command tree element

The first element of block command C<contents> is an I<arguments_line>
container holding the command arguments appearing on the @-command line,
similar to node and sectioning command elements.  The I<arguments_line> holds
I<block_line_arg> containers for each of the arguments separated by commas,
similar to line commands.  Definition block commands such as C<@deffn> do not
follow the same rule and do not have an I<arguments_line> container.
C<@defblock> command element, however, is like regular block commands, with an
I<arguments_line> container as first C<contents> element.

The remaining elements in C<contents> depend on the block command.  Block
commands like C<@float>, C<@quotation> or C<@flushleft> remaining C<contents>
are paragraphs, empty line text elements, line commands and nested block
commands, much like node and sectioning elements, appearing before the matching
C<@end> commmand element.

Block commands like C<@example> or C<@display> are similar except that they
contain I<preformatted> containers instead of paragraphs and so do
other block commands nested in those @-commands.

Other block commands contain specific containers depending on the block
command.  Block commands with C<@item> may contain a I<before_item> container
for contents before the first C<@item>.  C<@itemize> and C<@enumerate> block
commands following contents are C<@item> commands holding the Texinfo
code elements until the next C<@item> or C<@end>.  C<@table> and similar block
commands elements in C<contents> are I<table_entry> containers for each table
line, that contain themselves specific containers.  C<@multitable> contains
I<multitable_head> and I<multitable_body> containers.  C<@menu> C<contents>
hold I<menu_entry> and I<menu_comments> container elements.

The definition commands such as C<@deffn> contain a I<def_line> container
as first C<contents>, may contain an I<inter_def_item> container, also contains
C<@deffnx> line commands, and ends with a I<def_item> container for the main
contents of the definition command.  The C<@defblock> commands C<contents> may
hold a I<before_defline> element after the line arguments, also contains
line @-commands such as C<@defline> and a I<def_item> container.  The
I<def_line> container contains a I<block_line_arg> container,
which, in turn contains the specific definition line containers such as
I<def_category>, I<def_arg> and some special text elements such as I<space>.

Raw block commands such as C<@verbatim>, C<@ignore> or C<@macro>
contain directly I<raw> text elements.

Lastly, raw output commands such as C<@html> element in C<contents> after the
I<arguments_line> is either an I<elided_rawpreformatted> element container
containing I<raw> text elements if ignored, or a I<rawpreformatted> container
containing directly text and @-command elements if output.

The C<@end> command element is a regular line command element and is the last
element of all the block commands C<contents>.

=head3 Paragraphs and preformatted

I<paragraph> and I<preformatted> container C<contents> are
text elements, elements of @-commands without arguments, such as C<@}>, with
empty braces, such as C<@equiv> and with braces such as C<@code> or C<@ref>.
They may also contain elements corresponding to the few line commands that do
not stop a paragraph, such as index command elements.  I<preformatted>
container may contain empty line text elements, while I<paragraph> containers
do not.

=head3 Brace commands

The first content of brace commands can be a I<spaces_after_cmd_before_arg>
text element that holds the spaces between the @-command and the opening brace
or the accent command argument.

C<@footnote> and C<@caption> @-command elements that start a new context and
contain paragraphs and block commands contain a I<brace_command_context>
container.  The I<brace_command_context> container contains I<paragraph>,
line command and block command elements, much like node, sectioning and block
command elements.

For commands taking arguments surrounded by braces when the whole text in the
braces is in the argument, such as C<@u> or C<@code> the element in C<contents>
is a I<brace_container>.
Other brace commands, in particular brace commands with arguments separated
by commas contain I<brace_arg> containers, one for each of the arguments.
The I<brace_container> and I<brace_arg> containers contain directly text
elements some @-commands without arguments and other @-commands with braces,
similar to I<line_arg> or I<paragraph> containers.
C<@math> also contains a I<brace_arg> container, which contains directly
text and brace commands similar to the I<preformatted> container.

=head3 Texinfo line tree

When parsing Texinfo line fragments using C<parse_string>, a I<root_line>
type element is the root element.  It should typically contain elements
that appear in I<paragraph>, I<preformatted> or containers like I<line_arg>.

=head3 Showing the tree structure

You can see examples of the tree structure by running makeinfo like
this:

  makeinfo -c DUMP_TREE=1 -c TEXINFO_OUTPUT_FORMAT=parse document.texi

For a simpler, more regular representation of the tree structure, you
can do:

  makeinfo -c TEXINFO_OUTPUT_FORMAT=debugtree document.texi

=head2 Element keys

X<Texinfo tree element structure>

=over

=item cmdname

The command name of @-command and user-defined macro call elements.

=item text

The text fragment of text elements.

=item type

The type of element considered.  For built-in Texinfo @-commands
the type is I<normal_command>.  Otherwise, for elements that are not text
elements, the type is in general a container.  Frequent types encountered are
I<paragraph> for a paragraph container, I<brace_container> for the container
holding a brace @-commands content, I<line_arg> and I<block_line_arg> contain
the arguments appearing on the line of @-commands.  Text fragments may have a
type to give an information of the kind of text fragment, for example
I<spaces_before_paragraph> is associated to spaces appearing before a paragraph
beginning.

=item contents

An array reference holding the list of children of the element.

=item parent

The parent element.  Not set for text elements.

=item source_info

An hash reference corresponding to information on the location of the
element in the Texinfo input manual.  It should mainly be available for
@-command elements, and only for @-commands that are considered to be
complex enough that the location in the document is needed, for example
to prepare an error message.

The keys of the line number hash references are

=over

=item line_nr

The line number of the @-command.

=item file_name

The file name where @-command appeared.

=item macro

The user macro name the @-command is expanded from.

=back

=item extra

A hash reference holding information associated to the element.
Not present for text elements.
See L</Information available in the C<extra> key>.

=item inserted_text

Only for text elements.  Exists if the text is not in the Texinfo input code,
but is inserted as a default for @-command argument or as part of having a
definition command automatically inserted category (for example I<Function> for
C<@defun>).

=back

=head2 Element types

=head3 Types for command and user-defined macro call elements

Builtin @-commands have the I<normal_type> set.
Other types can be associated with @-commands, when the @-command name
can be user-defined.  The following are the possible values of C<type> for tree
elements for @-commands and user-defined macro call elements.

=over

=item definfoenclose_command

This type is set for an @-command that is redefined by C<@definfoenclose>.
The beginning is in C<< {'extra'}->{'begin'} >> and the end in
C<< {'extra'}->{'end'} >>.

=item index_entry_command

This is the type of index entry command like C<@cindex>, and, more
importantly user-defined index entry commands.  So for example if there
is:

 @defindex foo
  ...

 @fooindex index entry

the C<@fooindex> @-command element will have the I<index_entry_command>
type.

=item macro_call

=item macro_call_line

=item rmacro_call

=item rmacro_call_line

=item linemacro_call

Container holding the arguments of user-defined macro, linemacro
or rmacro.  It should not appear directly in the tree as the user defined
call is expanded.  The I<macro_call_line> or I<rmacro_call_line> elements
are used when there are no braces and the whole line is the argument.

=item normal_command

Type of the remaining @-command tree elements.

=back

=head3 Types for text elements

The text elements may have the following types:

=over

=item after_menu_description_line

=item space_at_end_menu_node

Space after a node in the menu entry, when there is no description,
and space appearing after the description line.

=item delimiter

=item spaces

Spaces on definition command line separating the definition command arguments.
Delimiters, such as comma, square brackets and parentheses appearing in
definition command line arguments at the end of the line, separated from
surrounding texts during the parsing phase.

=item empty_line

An empty line (possibly containing whitespace characters only).

=item ignorable_spaces_after_command

Spaces appearing after an @-command without braces that does not
take argument on the line, but which is followed by ignorable
spaces, such as C<@item> in C<@itemize> or C<@multitable>, or C<@noindent>.

=item bracketed_linemacro_arg

Text of the argument of a user defined linemacro call in bracket.  It does not
contain the braces.  It should not appear directly in the tree as the user
defined linemacro call is replaced by the linemacro body.

=item macro_call_arg_text

Macro call arguments texts.  Linemacro call arguments when the
arguments are not bracketed.  These elements should not
appear directly in the tree, as the macro calls are replaced by the
expansion of the macro bodies.

=item macro_line

Text appearing on a C<@macro>, C<@linemacro> or C<@rmacro> line after
the @-command, including the leading space and the newline.  In the
I<arguments_line> container @-command.

=item normal_text

The default type for text elements.  Used when a more specific type is not
needed.

=item spaces_after_close_brace

Spaces appearing after a closing brace, for some rare commands for which
this space should be ignorable (like C<@caption> or C<@sortas>).

=item spaces_after_argument text

Spaces after @-command arguments before a comma, a closing brace or at end of
line and spaces appearing before an @-command that are ignorable (spaces
appearing before a C<@subentry> on an index command line).

=item spaces_after_cmd_before_arg text

Spaces following an @-command before that argument (for accent commands)
or before the opening brace.

=item spaces_before_argument text

Spaces following the opening brace of some @-commands with braces and
bracketed content type, spaces following @-commands for line commands and block
command taking Texinfo as argument, and spaces following comma delimited
arguments.

=item spaces_before_paragraph

Space appearing before a paragraph beginning.

=item raw

Text in an environment where it should be kept as is (in C<@verbatim>,
C<@verb>, C<@macro> body).

=item rawline_text

Used for the text in arguments to some special line commands whose arguments
aren't subject to the usual macro expansion.  For example C<@set>,
C<@unmacro>, C<@comment>.

=item spaces_at_end

Space within an index @-command before an @-command interrupting the
index command, when there are only spaces after the interrupting
@-command.

=item text_after_end

Text appearing after @bye.

=item untranslated

English text added by the parser that may need to be translated
during conversion.  Happens for definition line @-commands aliases that
leads to prepending text such as ``Function''.

=item verb_delimiter

Delimiter character used to quote C<@verb> argument.

=back

=head3 Tree container elements

Some types of element are containers of portions of the tree,
either for the whole tree, or for contents appearing before C<@node>
and sectioning commands.

=over

=item before_node_section

Content before nodes and sectioning commands at the beginning of
C<document_root>.

=item document_root

=item root_line

C<root_line> is the type of the root tree when parsing Texinfo line
fragments using C<parse_string>.  C<document_root> is the document
root otherwise.

C<document_root> first content should be C<before_node_section>, then nodes and
sections @-commands elements, C<@bye> element and C<postamble_after_end>.

=item postamble_after_end

This container holds everything appearing after @bye.

=item before_beginning

This container holds everything appearing before the first content, including
the C<\input texinfo.tex> line and following blank lines.
If there is a C<@setfilename>, this container holds everything that appears
before C<@setfilename>.

=item preamble_before_content

This container holds everything appearing before the first formatted content,
corresponding to the I<preamble> in the Texinfo documentation.

=back

=head3 Types of container elements

The other types of element are containers with other elements appearing in
their C<contents>.  The C<paragraph> container holds normal text from the
Texinfo manual outside of any @-commands, and within @-commands with blocks of
text (C<@footnote>, C<@itemize> C<@item>, C<@quotation> for example).  The
C<preformatted> container holds the content appearing in @-commands like
C<@example> and the C<rawpreformatted> container holds the content appearing in
format commands such as C<@html>.  The other containers are more specific.
A generic container, C<generic_container>, that does not appear directly in
the Texinfo code parse tree is available for tree transformations or to hold,
often temporarily, other elements.

The types of container element are the following:

=over

=item balanced_braces

Special type containing balanced braces content (braces included)
in the context where they are valid, and where balanced braces need to
be collected to know when a top-level brace command is closed.  In C<@math>,
in raw output format brace commands and within brace @-commands in raw output
format block commands.

=item before_defline

A container for content before the first C<@defline> or C<@deftypeline>
in C<@defblock>.

=item before_item

A container for content before the first C<@item> of block @-commands
with items (C<@table>, C<@multitable>, C<@enumerate>...).

=item brace_container

=item brace_command_context

=item brace_arg

=item line_arg

=item block_line_arg

=item following_arg

Those containers occur within the C<contents> array of @-commands taking an
argument.  I<brace_container> is used for the argument to commands
taking arguments surrounded by braces when the whole text in the braces
is in the argument.  I<brace_arg> is used for the arguments to commands taking
arguments surrounded by braces when the leading and, in most cases, trailing
spaces are not part of the argument, and for arguments in braces separated by
commas.  I<brace_command_context> is used for @-commands with braces that start
a new context (C<@footnote>, C<@caption>).

I<line_arg> is used for commands that take the texinfo code on the rest of the
line as their argument, such as C<@settitle>, or for C<@node>, C<@section>
I<arguments_line> container.  I<block_line_arg> is similar but is used for
I<arguments_line> container of commands that start a new block (which is to be
ended with C<@end>).

I<following_arg> is used for the accent @-commands argument that did not use
braces but instead followed the @-command, possibly after a space, as

  @~n
  @ringaccent A

For example

 @code{in code}

leads to

 {'cmdname' => 'code',
  'contents' => [{'type' => 'brace_container',
                  'contents' => [{'text' => 'in code'}]}]}

=item bracketed_arg

Bracketed argument.  On definition command and on C<@multitable> line.

=item def_category

=item def_class

=item def_type

=item def_name

=item def_typearg

=item def_arg

Definition line arguments containers corresponding to the different parts of a
definition line command.  Contains one C<bracketed_arg>, C<def_line_arg> or
C<untranslated_def_line_arg> container.

=item def_line

=item def_item

=item inter_def_item

The I<def_line> type is associated with a container within a block definition
command.  It holds the definition line arguments in I<block_line_arg>.
A C<@def*> @-command line command such as C<@deffnx> or C<@defline>
also holds the definition line arguments, in I<line_arg>.
The type of each definition line arguments element describes the meaning of the
element.  It is one of I<def_category>, I<def_name>, I<def_class>, I<def_type>,
I<def_arg>, I<def_typearg>, I<spaces> or I<delimiter>, depending on the
definition.

The container with type I<def_item> holds the definition text content.
Content appearing before a definition command with a x form is in
an I<inter_def_item> container.

=item def_line_arg

=item untranslated_def_line_arg

the I<def_line_arg> contains one or several elements that together are a single
unit on a definition command line.  This container is very similar with a
I<bracketed_arg> on a definition line, except that there is no bracket.
Appears in definition line arguments containers such as I<def_category>,
I<def_arg> or similar.

The I<untranslated_def_line_arg> is similar, but only happens for automatically
added categories and contains only a text element.  For example, the C<deffun>
line I<def_category> container may contain an I<untranslated_def_line_arg> type
container containing itself a text element with ``Function'' as text, if the
document language demands a translation.  Note that the
I<untranslated_def_line_arg> is special, as, in general, it should not be
recursed into, as the text within is untranslated, but the untranslated text
should be gathered when converting the I<untranslated_def_line_arg> type
container.

=item generic_container

A container that does not appear directly when Texinfo code is parsed.
It is typically used to hold elements temporarily before a conversion,
or to replace specific containers after transformations that replace a command
by its argument, for instance.

=item menu_comment

The I<menu_comment> container holds what is between menu entries
in menus.  For example, in:

  @menu
  Menu title

  * entry::

  Between entries
  * other::
  @end menu

Both

  Menu title

and

  Between entries

will be in a I<menu_comment>.

=item menu_entry

=item menu_entry_leading_text

=item menu_entry_name

=item menu_entry_separator

=item menu_entry_node

=item menu_entry_description

A I<menu_entry> holds a full menu entry, like

  * node::    description.

The different elements of the menu entry are in the
I<menu_entry> C<contents> array reference.

I<menu_entry_leading_text> holds the star and following spaces.
I<menu_entry_name> is the menu entry name (if present), I<menu_entry_node>
corresponds to the node in the menu entry, I<menu_entry_separator> holds
the text after the node and before the description, in most cases
C<::   >.  Lastly, I<menu_entry_description> is for the description.

=item multitable_head

=item multitable_body

=item row

In C<@multitable>, a I<multitable_head> container contains all the rows
with C<@headitem>, while I<multitable_body> contains the rows associated
with C<@item>.  A I<row> container contains the C<@item> and C<@tab>
forming a row.

=item paragraph

A paragraph.  The C<contents> of a paragraph (like other container
elements for Texinfo content) are elements representing the contents of
the paragraph in the order they occur, such as text tree elements, or
@-command tree elements for commands appearing in the paragraph.

=item preformatted

Texinfo code within a format that is not filled.  Happens within some
block commands like C<@example>, but also in menu (in menu descriptions,
menu comments...).

=item rawpreformatted

Texinfo code within raw output format block commands such as C<@tex>
or C<@html>.

=item table_entry

=item table_term

=item table_definition

=item inter_item

Those containers appear in C<@table>, C<@ftable> and C<@vtable>.
A I<table_entry> container contains an entire row of the table.
It contains a I<table_term> container, which holds all the C<@item> and
C<@itemx> lines.  This is followed by a I<table_definition> container, which
holds the content that is to go into the second column of the table.

If there is any content before an C<@itemx> (normally only comments,
empty lines or maybe index entries are allowed), it will be in
a container with type I<inter_item> at the same level of C<@item>
and C<@itemx>, in a I<table_term>.

=back

=head2 Information available in the C<extra> key
X<Texinfo tree element extra key>

=head3 Extra keys available for more than one @-command

=over

=item input_encoding_name

Normalized argument of C<@documentencoding>.  For C<@documentencoding>
itself, and also for @-command arguments that name a file, which could make
use of the document encoding at the location they are defined.

=item inserted

Set if the element is not in the Texinfo input code, but is inserted
as a default for @-command argument or as a definition command automatically
inserted category (for example I<Function> for C<@defun>).

=item element_node

The node element identifier in the parsed tree containing the element.
Set for @-commands elements that have an associated index entry.

=item element_region

The region command (C<@copying>, C<@titlepage>) containing the element,
if it is in such an environement.  Set for @-commands elements that have an
associated index entry and for @anchor.

=item index_entry

The index entry information is associated to @-commands that have an associated
index entry.  The associated information should not be directly accessed,
instead L<C<Texinfo::Common::lookup_index_entry>|Texinfo::Common/($index_entry, $index_info) = lookup_index_entry($index_entry_info, $indices_information)>
should be called on the C<extra> I<index_entry> value:

   my ($index_entry, $index_info)
    = Texinfo::Common::lookup_index_entry(
                        $element->{'extra'}->{'index_entry'},
                        $indices_information);

The I<$indices_information> is the information on a Texinfo manual indices
obtained from
L<< C<Texinfo::Document::indices_information>|Texinfo::Document/$indices_information = $document->indices_information() >>.
The index entry information hash returned by
C<Texinfo::Common::lookup_index_entry> is described in
L<Texinfo::Document/index_entries>.

Currently, the I<index_entry> value is an array reference
with an index name as first element and the index entry number in that index
(1-based) as second element.

=item index_ignore_chars

A string containing the characters flagged as ignored in key sorting in the
document by setting flags such as I<txiindexbackslashignore>.  Set, if
not empty, for @-commands elements that have an associated index entry.

=item misc_args

An array holding strings, the arguments of @-commands taking simple
textual arguments as arguments, like C<@everyheadingmarks>,
C<@frenchspacing>, C<@alias>, C<@synindex>, C<@columnfractions>.

=item text_arg

The string correspond to the line after the @-command for @-commands
that have an argument interpreted as simple text, like C<@setfilename>,
C<@end> or C<@documentencoding>.

=back

=head3 Extra keys specific of certain @-commands or containers

=over

=item C<@abbr>

=item C<@acronym>

The first argument normalized is in I<normalized>.

=item C<@anchor>

=item C<@float>

@-commands that are targets for cross-references have an I<identifier> key for
the normalized label, built as specified in the Texinfo documentation in the
I<HTML Xref> node.  There is also a I<node_content> key with the indices of the
beginning and end of the node name elements in the label contents.

=item C<def_line>

=item line definition command

I<def_command> holds the line definition command name, without x if the line
definition command is an x form of a block definition command.  For a
C<def_line> container, I<def_command> holds the command name associated
with the C<def_line>.  I<original_def_cmdname> is the original def command
name.

If the element is a definition line command and is an x form of a block
definition command, it has I<not_after_command> set if not appearing
after the block definition command without x.

If the definition command is object-oriented, the language
information is in general needed for the formatting of the
index entry corresponding to the definition command.  If C<@documentlanguage>
and and other language related @-commands (C<@documentscript>, C<@documentvariant>)
are defined where the element is located, I<documentlanguage> holds the
documentlanguage value, with similar extra information
for other language related @-commands.

The I<omit_def_name_space> key value is set and true if the Texinfo variable
C<txidefnamenospace> was set, signaling that the space between function
definition name and arguments should be omitted.

=item C<@definfoenclose> defined commands

I<begin> holds the string beginning the C<@definfoenclose>,
I<end> holds the string ending the C<@definfoenclose>.

=item C<@float>

=item C<@listoffloats>

If C<@float> has a first argument, and for C<@listoffloats> argument there
is a I<float_type> key with the normalized float type.

=item index entry @-command

=item C<@subentry>

If an index entry @-command, such as C<@cindex>, or a C<@subentry> contains
a C<@sortas> command, I<sortas> holds the C<@sortas> command content
formatted as plain text.

=item C<@inlinefmt>

=item C<@inlineraw>

=item C<@inlinefmtifelse>

=item C<@inlineifclear>

=item C<@inlineifset>

The first argument is in I<format>.  If an argument has been determined
as being expanded by the Parser, the index of this argument is in
I<expand_index>.  Index numbering begins at 0, but the first argument is
always the format or flag name, so, if set, it should be 1 or 2 for
C<@inlinefmtifelse>, and 1 for other commands.

=item C<@item> in C<@enumerate> or C<@itemize>

The I<item_number> C<extra> key holds the number of this item.

=item C<@item> and C<@tab> in C<@multitable>

The I<cell_number> index key holds the index of the column of
the cell.

=item C<@table>

=item C<@vtable>

=item C<@ftable>

If the command in argument for C<@table>, C<@vtable> or C<@ftable>
is C<@kbd> and the context and C<@kbdinputstyle> is such that C<@kbd>
should be formatted as code, the I<command_as_argument_kbd_code>
C<extra> key is set to 1.

=item C<@kbd>

I<code> is set depending on the context and C<@kbdinputstyle>.

=item C<@macro>

=item C<@linemacro>

I<macro_name> holds the macro name.
I<invalid_syntax> is set if there was an error on the C<@macro>
line.  I<formal_args> is an array containing the name of the formal
arguments.

=item C<menu_entry_node>

Extra keys with information about the node entry label same as those
appearing in the C<@node> I<line_arg> explicit directions arguments
C<extra> hash labels information.

=item C<@multitable>

The key I<max_columns> holds the maximal number of columns.

=item C<@node>

Node name and explicit directions labels information are available
as I<line_arg> tree element arguments of the C<@node> line.
Each I<line_arg> argument element C<extra> hash I<node_content> key value is an
array holding the indices of the beginning and end of the contents
corresponding to the node name.  The node name argument has an I<identifier>
key for the node identifier.  Node directions arguments also have a
I<manual_content> key if there is an associated external manual name holding
the indices of the beginning and end of the contents corresponding to the
manual name, excluding the parentheses, and a I<normalized> key for the
normalized label, built as specified in the I<HTML Xref> Texinfo documentation
node.

=begin comment

TODO documentation: relations are separate.

If you called L<Texinfo::Structuring::construct_nodes_tree|Texinfo::Structuring/construct_nodes_tree($document)>,
the I<node_directions> hash in the nodes relations associates I<up>,
I<next> and I<prev> keys to the node relations corresponding to the node line
directions.

An I<associated_section> key holds the sectioning command relations
object that follows the node.  An I<node_preceding_part>
key holds the relations of the C<@part> that precedes the node,
if there is no sectioning command between the C<@part> and the node.
A I<node_description> key holds the first C<@nodedescription> associated
to the node.

A node containing a menu have a I<menus> key which refers to an array of
references to menu elements occuring in the node.

=end comment

A node containing a C<@printindex> @-command has the I<isindex>
key set.

=item C<paragraph>

The I<indent> or I<noindent> key value is set if the corresponding
@-commands are associated with that paragraph.

=begin comment

TODO documentation: relations are separate.

=item C<@part>

The next sectioning command section relations is in I<part_associated_section>.
The following node relations is in I<part_following_node> if there is
no sectioning command between the C<@part> and the node.

=end comment

=item C<@ref>

=item C<@xref>

=item C<@pxref>

=item C<@inforef>

The I<brace_arg> corresponding to the node argument holds information on
the label, with the same information in the C<extra> hash as for the
C<@node> I<line_arg> explicit directions arguments.

=item C<row>

The I<row_number> index key holds the index of the row in
the C<@multitable>.

=item sectioning command

If the level of the document was modified by C<@raisections>
or C<@lowersections>, the differential level is in I<level_modifier>.

The section level, taking into account C<@raisections> and
C<@lowersections> is in I<section_level>.  Level 0 corresponds to C<@top>
or C<@part> and level 1 to C<@chapter>.
The sectioning command formatted number is in I<section_heading_number>.
This information is only present if the sectioning structure has been
determined by L<< C<Texinfo::Structuring::sectioning_structure>|Texinfo::Structuring/sectioning_structure($document) >>.

=begin comment

TODO documentation: relations are separate.

The node preceding the command is in I<associated_node>.
The part preceding the command is in I<associated_part>.

=end comment

=item C<untranslated_def_line_arg>

I<documentlanguage> holds the C<@documentlanguage> value.
If there is a translation context, it should be in I<translation_context>.

=back

=head1 SEE ALSO

L<Texinfo manual|https://www.gnu.org/software/texinfo/manual/texinfo/>.

=head1 AUTHOR

Patrice Dumas, E<lt>bug-texinfo@gnu.orgE<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2010- Free Software Foundation, Inc.  See the source file for
all copyright years.

This library is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or (at
your option) any later version.

=cut
