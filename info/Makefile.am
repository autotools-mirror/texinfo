# Makefile.am for texinfo/info.
#
# Copyright 2002-2026 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

# no-dist-built-sources is actually in 1.16.4 upward
# could use no-dist-built-sources such that funs.h is not distributed even
# if in BUILT_SOURCES
#no-dist-built-sources
# However, in tests with automake 1.16.5 funs.h does not seems to be
# distributed even without no-dist-built-sources
AUTOMAKE_OPTIONS = 1.16

# Use `ginfo' for building to avoid confusion with the standard `info'
# target.  The value of $transfrom is a sed program which removes the
# `g' in the install rule before applying any user-specified name
# transformations.  Only build ginfo when a terminal library is available,
# and when not building tools for cross-compiling.
if !TOOLS_ONLY
if HAVE_TERMLIBS
bin_PROGRAMS = ginfo
else
# DOS/Windows don't need TERMLIBS to build Info
if HOST_IS_WINDOWS
bin_PROGRAMS = ginfo
endif
endif
endif
transform = s/ginfo/info/; $(program_transform_name)

AM_CPPFLAGS =                                   \
  -I$(top_srcdir)                               \
  -I$(top_srcdir)/gnulib/lib                    \
  -I$(top_builddir)/gnulib/lib                  \
  -DLOCALEDIR=\"$(datadir)/locale\"             \
  -DINFODIR=\"$(infodir)\"                      \
  -DINFODIR2=\"$(datadir)/info\"                \
  -DSYSCONFDIR=\"$(sysconfdir)\"                \
  -DPKGDATADIR=\"$(pkgdatadir)\"

LDADD = $(top_builddir)/gnulib/lib/libgnu.a

# for various gnulib modules
LDADD += $(LIBINTL) $(LIBICONV) $(LIBC32CONV) $(LIBUNISTRING) $(LIBTHREAD)

# for hard-locale gnulib module which is brought in indirectly
LDADD += $(HARD_LOCALE_LIB) $(SETLOCALE_NULL_LIB)

# for mbrtowc gnulib module which is brought in indirectly
LDADD += $(MBRTOWC_LIB)

ginfo_LDADD = $(LDADD) $(TERMLIBS)

# Needed if make has not run in the "gnulib" directory yet
../gnulib/lib/libgnu.a:
	cd ../gnulib/lib && $(MAKE) $(AM_MAKEFLAGS)

EXTRA_DIST = pcterm.c

ginfo_SOURCES = configfiles.c configfiles.h dir.c display.c display.h \
  doc.h dribble.c dribble.h echo-area.c echo-area.h \
  filesys.c filesys.h footnotes.c footnotes.h indices.c indices.h \
  info.c info.h infodoc.c infokey.c infomap.c infomap.h infopath.c \
  m-x.c man.c man.h nodemenu.c nodes.c nodes.h \
  run-external.c run-external.h scan.c scan.h \
  search.c search.h session.c session.h session-cmd.c signals.c signals.h \
  tag.c tag.h termdep.h terminal.c terminal.h tilde.c tilde.h \
  util.c util.h variables.c variables.h window.c window.h
nodist_ginfo_SOURCES = doc.c funs.h

# The files `doc.c' and `funs.h' are created by ./makedoc run over the
# source files which contain DECLARE_INFO_COMMAND.  `funs.h' is a header file
# listing the functions found.  `doc.c' is a structure containing pointers
# to those functions along with completable names and documentation strings.
#
generated_sources = doc.c funs.h

# We need a linear ordering to prevent race condition in parallel make.
# See the node ``(automake)Multiple Outputs'' for an explanation.
# Make sure this matches with order in which makedoc.c creates these
# files.
doc.c: funs.h

# These files are not distributed.
DISTCLEANFILES = $(generated_sources)

noinst_PROGRAMS = makedoc
makedoc_SOURCES = makedoc.c

# Files with Info commands defined that makedoc should read.
cmd_sources = $(srcdir)/session-cmd.c $(srcdir)/echo-area.c \
  $(srcdir)/infodoc.c $(srcdir)/m-x.c $(srcdir)/indices.c \
  $(srcdir)/nodemenu.c $(srcdir)/footnotes.c $(srcdir)/variables.c

# Make the target only funs.h even though we create all the
# $(generated_sources) so that parallel makes won't do the rm && makedoc
# more than once.
funs.h: makedoc$(EXEEXT) $(cmd_sources)
	rm -f $(generated_sources)
	$(top_builddir)/$(native_tools)/info/makedoc $(cmd_sources)

# The following hack is necessary to hint make before the automatic
# dependencies are built.
BUILT_SOURCES = funs.h

# Test suite

CLEANFILES =

info_tests_with_pseudotty = \
	t/adjust-anchors.sh \
	t/all-only.sh \
	t/anchor-positions.sh \
	t/body-start.sh \
	t/close-window-after-search.sh \
	t/c-u-m-x-scroll-forward.sh \
	t/dir-entry-to-subdir.sh \
	t/dir-merge.sh \
	t/echo-area-no-completions.sh \
	t/empty-infopath.sh \
	t/end-of-line.sh \
	t/follow-path.sh \
	t/follow-remain.sh \
	t/follow-remain-other-dir.sh \
	t/gc-split.sh \
	t/goal-column.sh \
	t/goto-quoted.sh \
	t/inc-sea-bs.sh \
	t/inc-sea-forward-nonregex.sh \
	t/inc-sea-forward.sh \
	t/inc-sea-history.sh \
	t/inc-sea-insensitive.sh \
	t/index-apropos.sh \
	t/index-completing.sh \
	t/index-long-nodeline.sh \
	t/index-search.sh \
	t/index.sh \
	t/last-node-not-top-level.sh \
	t/last-no-history.sh \
	t/malformed-split.sh \
	t/menu-sequence.sh \
	t/multiple-completions.sh \
	t/next-quoted.sh \
	t/no-index.sh \
	t/node-label-quoted-file.sh \
	t/quoted-label-and-target.sh \
	t/quoted-label-as-target.sh \
	t/quoted-manual-in-label.sh \
	t/quoted-manual-in-target.sh \
	t/quoted-target.sh \
	t/recode-C-locale.sh \
	t/relative-reference.sh \
	t/replace-viewed.sh \
	t/resize-in-completions.sh \
	t/search-after-tag.sh \
	t/search-empty.sh \
	t/search-skip-screen.sh \
	t/search-split-after-index.sh \
	t/split-file-menu.sh \
	t/split-footnotes.sh \
	t/split-index.sh \
	t/star-note-non-whitespace.sh \
	t/tab-argument.sh \
	t/tab-no-xref.sh \
	t/tab.sh \
	t/tab-skip-node.sh \
	t/window-split-dir.sh \
	t/xref-across-lines-2.sh \
	t/xref-across-lines.sh \
	t/xref-to-anchor.sh

info_tests = \
	t/file.sh \
	t/file-node.sh \
	t/file-nodes.sh \
	t/file-node-with-dot.sh \
	t/file-index.sh \
	t/file-index-colons.sh \
	t/file-file-with-dot.sh \
	t/no-file.sh \
	t/node-no-file.sh \
	t/split.sh \
	t/relative-path.sh \
	t/file-relative-path.sh \
	t/dir.sh \
	t/dir-file.sh \
	t/dir-file-sloppily.sh \
	t/dir-nondir.sh \
	t/dir-no-file.sh \
	t/dir-file-menu.sh \
	t/dir-file-no-menu.sh \
	t/dir-file-node.sh \
	t/dir-file-index.sh \
	t/dir-3-menus.sh \
	t/dir-menus-sloppily.sh \
	t/where-dir-file.sh \
	t/dir-dangling-entry.sh \
	t/spec-file-node.sh \
	t/spec-no-node.sh \
	t/spec-menu.sh \
	t/empty.sh \
	t/index-paren.sh \
	t/quoted-index-target.sh \
	t/quoted-index-label.sh \
	t/help.sh

TESTS = $(info_tests)

if PTYS_TESTS
check_PROGRAMS = pseudotty
pseudotty_SOURCES = pseudotty.c

TESTS += $(info_tests_with_pseudotty)
else
CLEANFILES += pseudotty
endif

EXTRA_DIST += $(info_tests) $(info_tests_with_pseudotty) $(XFAIL_TESTS) \
  t/README t/infodir \
  t/Init-test.inc \
  t/config/texinfo/infokey

dist_check_SCRIPTS = t/config/texinfo/info-hooks/manual-not-found

# for MS-Windows
dist_check_SCRIPTS += t/config/texinfo/info-hooks/manual-not-found.cmd

dist-hook:
	rm -rf `find $(distdir)/t/infodir -name '*~'`

hooksdir=$(datadir)/texinfo/info-hooks

EXTRA_DIST += info-hooks-default/manual-not-found.in
hooks_SCRIPTS = info-hooks-default/manual-not-found
if HOST_IS_WINDOWS
  hooks_SCRIPTS += info-hooks-default/manual-not-found.cmd
else
  EXTRA_DIST += info-hooks-default/manual-not-found.cmd
endif
CLEANFILES += info-hooks-default/manual-not-found

info-hooks-default/manual-not-found: info-hooks-default/manual-not-found.in
	$(MKDIR_P) info-hooks-default
	sed -e 's,[@]AWK[@],$(AWK),g' \
	    -e 's,# manual-not-found.in,# Automatically generated from manual-not-found.in,' \
	  <$(srcdir)/info-hooks-default/manual-not-found.in >$@
	chmod a+x $@

dist_hooks_DATA = \
  info-hooks-default/gnu-manuals-locations.dat \
  info-hooks-default/gnu-commands-manuals.dat \

if HOST_IS_WINDOWS
  dist_hooks_DATA += info-hooks-default/gnu-manuals.awk
else
  EXTRA_DIST += info-hooks-default/gnu-manuals.awk
endif
