# Makefile.am for texinfo/tta.
#
# Copyright 2011-2026 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

AUTOMAKE_OPTIONS = foreign

ACLOCAL_AMFLAGS = -I build-aux/m4 -I gnulib/m4 -I m4 -I ../m4

EXTRA_DIST =

######################## Gnulib ################################

SUBDIRS =

if BUILD_C_CODE
SUBDIRS += gnulib/lib
endif

EXTRA_DIST += gnulib/m4/gnulib-cache.m4

################### End Gnulib section #########################

# Generated list of document string locale files and associated rules.
include $(srcdir)/Makefile.docstr

# should be kept in sync with autogen.sh call
$(srcdir)/Makefile.docstr: maintain/regenerate_docstr.sh \
                           $(srcdir)/../po_document/LINGUAS
	cd $(srcdir) \
	&& $(SHELL) ./maintain/regenerate_docstr.sh Makefile.docstr


if USE_SHARED_TXI_LIBRARIES
SUBDIRS += C
endif

SUBDIRS += . perl tests

if SWIG_INTERFACES
if USE_SHARED_TXI_LIBRARIES
SUBDIRS += swig
endif
endif

DIST_SUBDIRS = gnulib/lib C perl tests swig

converterdatadir = $(datadir)/$(CONVERTER)

# used in Makefile.docstr, in particular in document_strings_mo_files
document_domain = $(PACKAGE)_document

# $(document_strings_mo_files) comes from the generated Makefile.docstr.
all-local: maintain/catalog.xml $(document_strings_mo_files)

maintenance_files = \
  maintain/all_tests.sh \
  maintain/change_perl_modules_version.sh \
  maintain/copy_change_file_name_encoding.pl \
  maintain/language-subtag-registry \
  maintain/generate_code_convert_data.pl \
  maintain/generate_code_commands_values.pl \
  maintain/generate_css_data.pl \
  maintain/generate_many_input_files_native_tests.sh \
  maintain/regenerate_cmd_tests.sh \
  maintain/regenerate_converters_documentation.sh \
  maintain/regenerate_docstr.sh \
  maintain/regenerate_documentlanguages-iana.pl \
  maintain/regenerate_documentlanguages-loc.pl \
  maintain/regenerate_file_lists.pl \
  maintain/regenerate_commands_perl_info.pl \
  maintain/regenerate_perl_options_info.pl \
  maintain/regenerate_tap_tests_lists.pl \
  maintain/regenerate_C_options_info.pl \
  maintain/setup_accent_tables.pl \
  maintain/catalog.xml.in

# data used to generate both C and Perl code
dist_noinst_DATA = \
 data/default_css_element_class_styles.csv \
 data/default_direction_strings.csv \
 data/default_special_unit_info.csv \
 data/html_style_commands_element.csv \
 data/command_data.txt \
 data/commands_values.txt \
 data/options_data.txt \
 data/converters_defaults.txt

# test_files_generated_list comes from the generated Makefile.tres
EXTRA_DIST += \
  texi2any.supp \
  $(maintenance_files) \
  maintain/lib

maintain/catalog.xml: maintain/catalog.xml.in Makefile
	$(MKDIR_P) maintain
	sed -e 's|[@]abs_top_srcdir[@]|$(abs_top_srcdir)|' \
	  $(srcdir)/maintain/catalog.xml.in >$@

libsrcdir = $(srcdir)/maintain/lib

install-data-local:
	if test $(USE_EXTERNAL_LIBINTL_PERL) != 'yes' ; then \
	  $(MKDIR_P) $(DESTDIR)$(converterdatadir)/lib/libintl-perl/lib/Locale/Recode \
	    $(DESTDIR)$(converterdatadir)/lib/libintl-perl/lib/Locale/RecodeData; \
	  $(INSTALL_DATA) $(libsrcdir)/libintl-perl/lib/Locale/*.pm \
	    $(DESTDIR)$(converterdatadir)/lib/libintl-perl/lib/Locale; \
	  $(INSTALL_DATA) $(libsrcdir)/libintl-perl/lib/Locale/Recode/*.pm \
	    $(DESTDIR)$(converterdatadir)/lib/libintl-perl/lib/Locale/Recode; \
	  $(INSTALL_DATA) $(libsrcdir)/libintl-perl/lib/Locale/RecodeData/*.pm \
	    $(DESTDIR)$(converterdatadir)/lib/libintl-perl/lib/Locale/RecodeData; \
	fi
	if test $(USE_EXTERNAL_EASTASIANWIDTH) != 'yes' ; then \
	  $(MKDIR_P) $(DESTDIR)$(converterdatadir)/lib/Unicode-EastAsianWidth/lib/Unicode; \
	  $(INSTALL_DATA) $(libsrcdir)/Unicode-EastAsianWidth/lib/Unicode/EastAsianWidth.pm \
	   $(DESTDIR)$(converterdatadir)/lib/Unicode-EastAsianWidth/lib/Unicode; \
	fi
	if test $(USE_EXTERNAL_UNIDECODE) != 'yes' ; then \
	  $(MKDIR_P) $(DESTDIR)$(converterdatadir)/lib/Text-Unidecode/lib/Text/Unidecode; \
	  $(INSTALL_DATA) $(libsrcdir)/Text-Unidecode/lib/Text/Unidecode.pm \
	    $(DESTDIR)$(converterdatadir)/lib/Text-Unidecode/lib/Text; \
	  $(INSTALL_DATA) $(libsrcdir)/Text-Unidecode/lib/Text/Unidecode/*.pm \
	    $(DESTDIR)$(converterdatadir)/lib/Text-Unidecode/lib/Text/Unidecode; \
	fi

dist-hook:
	rm -rf `find $(distdir)/maintain/lib -name .git -o -name gettext_xs.o`

uninstall-local:
	rm -rf $(DESTDIR)$(converterdatadir)/lib/

distclean-local:
	rm -rf LocaleData

DISTCLEANFILES = maintain/catalog.xml
