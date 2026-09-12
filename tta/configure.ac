# configure.ac for XS modules
#
# Copyright 2015-2026 Free Software Foundation, Inc.
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

AC_INIT([GNU Texinfo], [7.3dev])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE
AC_CONFIG_MACRO_DIRS([build-aux/m4 gnulib/m4 m4 ../m4])
AC_REQUIRE_AUX_FILE([tap-driver.sh])

AC_CONFIG_HEADERS([config.h])

CONVERTER=texi2any
AC_SUBST([CONVERTER])

AC_PATH_PROG([PERL], [perl])

AM_MISSING_PROG([GAWK], [gawk])

USE_EXTERNAL_EASTASIANWIDTH=no
AC_ARG_WITH([external-Unicode-EastAsianWidth],
   AS_HELP_STRING([--with-external-Unicode-EastAsianWidth],[use external Unicode-EastAsianWidth (default: no)]),
   [if test $withval = 'yes'; then
      USE_EXTERNAL_EASTASIANWIDTH=yes
   fi]
)

AC_SUBST([USE_EXTERNAL_EASTASIANWIDTH])

USE_EXTERNAL_UNIDECODE=no
AC_ARG_WITH([external-Text-Unidecode],
    AS_HELP_STRING([--with-external-Text-Unidecode],[use external Text::Unidecode (default: no)]),
   [if test $withval = 'yes'; then
      USE_EXTERNAL_UNIDECODE=yes
   fi]
)

AC_SUBST([USE_EXTERNAL_UNIDECODE])

USE_EXTERNAL_LIBINTL_PERL=no
AC_ARG_WITH([external-libintl-perl],
   AS_HELP_STRING([--with-external-libintl-perl],[use external libintl-perl (default: no)]),
   [if test $withval = 'yes'; then
      USE_EXTERNAL_LIBINTL_PERL=yes
   fi]
)

AC_SUBST([USE_EXTERNAL_LIBINTL_PERL])

AC_ARG_ENABLE([additional-checks],
    AS_HELP_STRING([--enable-additional-checks], [run tests on non-distributed components]),
    [ enable_additional_tests=$enableval],
    [ enable_additional_tests=no])

AM_CONDITIONAL([DISABLE_ADDITIONAL_CHECKS], [test "z$enable_additional_tests" = zno])

dnl does not seems to be used directly, but it is used by gettext
AC_PROG_INSTALL
AC_PROG_MAKE_SET

AC_PROG_LN_S
AC_PROG_MKDIR_P

AC_CANONICAL_HOST

txi_DIFF_OPTIONS

# Perl tests requirements
t2a_tests='no'
AC_ARG_ENABLE([t2a-tests],
    AS_HELP_STRING([--enable-t2a-tests],[run the parser and converters testsuite (default: detected)]),
    [if test $enableval = 'no'; then
       t2a_tests='no'
     else
       t2a_tests='yes'
     fi],
    [
     if $PERL -e "use 5.008_001; use Encode; use Test::More; use File::Compare qw(compare); use Storable qw(dclone);" > /dev/null 2>&AS_MESSAGE_LOG_FD;
     then
       t2a_tests='yes'
     else
       t2a_tests='no'
     fi
    ])

AC_MSG_CHECKING([parser tests requirements])
AC_MSG_RESULT([$t2a_tests])
AM_CONDITIONAL([T2A_TESTS], [test "z$t2a_tests" = 'zyes'])

if $PERL -e "use Devel::Refcount;" > /dev/null 2>&AS_MESSAGE_LOG_FD; then
  refcount_checks='yes'
else
  refcount_checks='no'
fi

AC_MSG_CHECKING([requirements for refcount checks])
AC_MSG_RESULT([$refcount_checks])
DEFAULT_TEST_LEVEL=1
if test "z$refcount_checks" = 'zyes' ; then
  DEFAULT_TEST_LEVEL=2
fi
AC_SUBST([DEFAULT_TEST_LEVEL])

dnl NOTE we mandate Unicode::Collate now in toplevel configure.ac,
dnl so this should always be yes.
AC_MSG_CHECKING([Perl version for tests requiring unicode collation])
if $PERL -e "use 5.018_001; use Unicode::Collate" >/dev/null 2>&1; then
  perl_unicode_collation_requirement='yes'
else
  perl_unicode_collation_requirement='no'
fi
AC_MSG_RESULT($perl_unicode_collation_requirement)
PERL_UNICODE_COLLATE_OK=$perl_unicode_collation_requirement
AC_SUBST([PERL_UNICODE_COLLATE_OK])

host_is_windows=no
case "$host" in
   *-mingw32 | *-mingw64 )  host_is_windows=yes ;;
esac
AM_CONDITIONAL([HOST_IS_WINDOWS], [test "x$host_is_windows" = "xyes"])
HOST_IS_WINDOWS_VARIABLE=
if test "x$host_is_windows" = "xyes" ; then
  HOST_IS_WINDOWS_VARIABLE=yes
fi
AC_SUBST([HOST_IS_WINDOWS_VARIABLE])


# Look up perl configuration values and set variables:
# perl_conf_LIB_CFLAGS, perl_conf_CPPFLAGS, perl_conf_LDFLAGS,
# perl_conf_LIB_LDFLAGS,
# platform_PERL_LIBADD, perl_conf_LIBS, perl_conf_CFLAGS,
# perl_conf_EMBED_LIB_CFLAGS, platform_LDFLAGS, XSUBPP,
# XSUBPPARGS and XS_VERSION.  Defined in m4/txi_perl_conf.m4.
txi_PERL_CONF

AC_MSG_CHECKING([ExtUtils::Embed])
if $PERL -e "use 5.008_001; use ExtUtils::Embed;" >/dev/null 2>&1; then
  extutils_embed='yes'
else
  extutils_embed='no'
fi
AC_MSG_RESULT($extutils_embed)

# Not used for now, similar flags are reconstituted based on Perl configuration
# information
#PERL_EXTUTILS_EMBED_ccopts=
#PERL_EXTUTILS_EMBED_ldopts=
#if test "z$extutils_embed" = 'zyes' ; then
  # the backslashes are replaced by forward slashes for mingw where those
  # file separators may be emited and then cause Bash to produce nonsensical
  # file names.
  # It is unlikely to have backslashes on other platforms in Perl paths,
  # if it is reported, the replacement of backslashes could be done
  # conditionally.
  # Error messages on stderr are removed such that they do not interact with
  # configure.
#  PERL_EXTUTILS_EMBED_ccopts=`${PERL} -MExtUtils::Embed -e ccopts 2> /dev/null | sed -e 's,\\\\,/,g'`
#  PERL_EXTUTILS_EMBED_ldopts=`${PERL} -MExtUtils::Embed -e ldopts 2> /dev/null | sed -e 's,\\\\,/,g'`
#fi

dnl AC_SUBST([PERL_EXTUTILS_EMBED_ccopts], [$PERL_EXTUTILS_EMBED_ccopts])
dnl AC_SUBST([PERL_EXTUTILS_EMBED_ldopts], [$PERL_EXTUTILS_EMBED_ldopts])

# Before Perl 5.38.0 getenv/setenv and similar cannot be reliably used in
# XS and could lead to memory corruption, depending on the platform.
usable_getenv_in_XS=no
AC_MSG_CHECKING([Perl XS with usable getenv])
if $PERL -e "use 5.038" >/dev/null 2>&1; then
  usable_getenv_in_XS=yes
fi
AC_MSG_RESULT($usable_getenv_in_XS)

AC_ARG_ENABLE([perl-xs],
    AS_HELP_STRING([--enable-perl-xs],[build Perl XS modules for speed (default: check)]),
    [ enable_xs=$enableval],
    [ enable_xs=check])

# Set xs_srcdir to the path from XS builddir to source directory containing
# Texinfo/XSLoader.pm and CheckXS/TestXS.pm
case $srcdir in
  .)  # We are building in place.
    xs_srcdir=.. ;;
  [[\\/]]* | ?:[[\\/]]* )  # Absolute name.
    xs_srcdir=$srcdir/perl ;;
  *) # Relative name.
    xs_srcdir=../../$srcdir/perl ;;
esac

# Pass on all the options we were given to the subsidiary configure
# script.
# Don't use AC_CONFIG_SUBDIRS for this because it isn't done right away,
# and we need it for the check that follows.
# We use the _AC_OUTPUT_SUBDIRS internal autoconf macro
# (in /usr/share/autoconf/autoconf/status.m4) for this in order to
# pass on the configure command line correctly; for example, adjusting
# paths.  It is done in a subshell to be resilient against failure of the
# subsidiary configure script, which happens if the C compiler is found
# not to work.
#
if test $enable_xs = check ; then
  save_subdirs=$subdirs
  subdirs=perl/CheckXS
  ( _AC_OUTPUT_SUBDIRS ) || enable_xs=no
  AC_MSG_NOTICE([finished configuring $subdirs])
  subdirs=$save_subdirs
fi

if test $enable_xs = no; then
  AC_MSG_NOTICE([building Perl extension (XS) modules will be disabled])
fi

if test $enable_xs = check; then
  AC_MSG_CHECKING([whether we can build Perl extension (XS) modules])
  AC_MSG_RESULT([])
  enable_xs=no
  (cd perl/CheckXS \
   && make clean \
   && make TestXS.la \
   && TEXINFO_XS=debug ; export TEXINFO_XS \
   && ${PERL} -I . \
              -I ${xs_srcdir} \
              -e 'require CheckXS::TestXS;' \
      | grep 'message from XS module') 2>_txi_msg_$$.txt \
  && enable_xs=yes
  cat _txi_msg_$$.txt >&AS_MESSAGE_LOG_FD
  cat _txi_msg_$$.txt 1>&2
  rm -f _txi_msg_$$.txt
  AC_MSG_CHECKING([whether we can build Perl extension (XS) modules])
  AC_MSG_RESULT([$enable_xs])
fi

AC_SUBST([enable_xs])

AM_CONDITIONAL([DISABLE_XS], [test "z$enable_xs" = zno])

# PERL_EXT_var are user variables for a Perl XS extension, allowing
# configuring at the top-level with e.g.
#     "./configure CFLAGS='-g -O0' PERL_EXT_CFLAGS='-g'".
# May be useful if the Perl interpreter was compiled with a
# different compiler.  Also in top-level configure.ac.

AC_ARG_VAR([PERL_EXT_CFLAGS], [Compiler flags for a Perl extension])
AC_ARG_VAR([PERL_EXT_CPPFLAGS], [C preprocessor flags for a Perl extension])
AC_ARG_VAR([PERL_EXT_LDFLAGS], [Linker flags for a Perl extension])
AC_ARG_VAR([PERL_EXT_CC], [Compiler for a Perl extension])

# Override these variables set by configure at the top level, because
# the compiler used in this subdirectory might be different.
# Change these now if C Perl is used in build so they are used in
# the checks that follow so that we are using the same flags for the
# checks as for the build.
if test x$enable_xs != xno; then
  if test -n "$PERL_EXT_CC" ; then
    CC=$PERL_EXT_CC
  else
    # It's essential that we use the same compiler that was used to build
    # Perl.  Otherwise Perl's "config.h" will be incorrect.  This overrides
    # the check in AC_PROG_CC below.
    CC=$PERL_CONF_cc
  fi

  # The usual configure checks use the Autoconf/Gnulib includes, but
  # are used for code never compiled with the Perl headers.  Therefore
  # we do not set the Perl CPPFLAGS, but still use the user-defined
  # PERL_EXT_var variables used as defaults for all the compilations.
  CPPFLAGS=$PERL_EXT_CPPFLAGS

  # For compilation of code not compiled against Perl we use the Perl CFLAGS,
  # since they are often link against Perl even if they do not compile against
  # Perl, such that link and compilation flags match.  Since we use the Perl
  # CFLAGS, we also always use the Perl LDFLAGS to have matching 
  # compilation and linking.
  # We use the same flags in configure checks.
  CFLAGS="$PERL_EXT_CFLAGS $perl_conf_CFLAGS"
  LDFLAGS="$PERL_EXT_LDFLAGS $perl_conf_LDFLAGS"
  # NOTE Specific checks against Perl should not have the Autoconf/Gnulib
  # includes set but could set the following:
  #CPPFLAGS="$PERL_EXT_CPPFLAGS $perl_conf_CPPFLAGS"
else
  # unset perl flags, such that it is still possible to build C-only
  # libraries and executable.  All the features needing Perl will be
  # lacking.
  perl_conf_CPPFLAGS=
  perl_conf_CFLAGS=
  perl_conf_LIB_CFLAGS=
  perl_conf_LIB_LDFLAGS=$platform_LDFLAGS
  platform_PERL_LIBADD=
  perl_conf_LIBS=
fi

# Wipe cache values in case -C was given at the top level
ac_cv_prog_CC= ; unset ac_cv_prog_CC
ac_cv_prog_ac_ct_CC= ; unset ac_cv_prog_ac_ct_CC

AC_PROG_CC

# Test for linking against libperl.  Used to set LIBPERL_LINK conditional
# which is used for SWIG interface in swig/Makefile.am.
# Having XS enabled and the Perl headers does not ensure that it is
# possible to link against libperl as the .so/.a may not be present.
# Linking against libperl is not needed to load XS extensions on some
# platforms, the Perl executable probably providing the needed symbols,
# but it is needed when linking with non-undefined, and when there is
# no Perl executable involved.

libperl_link=no
if test x$enable_xs != xno ; then
  txi_LIBPERL_LINK
fi
AM_CONDITIONAL([LIBPERL_LINK], [test "z$libperl_link" = 'zyes'])

# it is unlikely to be very useful, as
# * in general, on such platforms libperl is always available,
# * this is a warning, not an error.
# It could still help diagnose linking errors happening during build.
if test x$enable_xs != xno -a "z$libperl_link" != 'zyes' ; then
  # this should match the corresponding case in txi_perl_conf.m4
  case "$host" in *-mingw32 | *-mingw64 | *-cygwin )
    AC_MSG_WARN([no link with libperl for a platform needing it: $host])
  ;;
  esac
fi

gl_EARLY

dnl do not put after AM_GNU_GETTEXT, otherwise LTLIBINTL may not be defined
gl_INIT

# i18n support.  We need to use the same GNU gettext version as the main
# configure.ac file since the version of the gettext.m4 and related files
# must be in sync with the Makefile.in.in in the shared po/ directory.
# See the README-hacking file at top level for how to upgrade gettext.
#
AM_GNU_GETTEXT_VERSION([0.26])
AM_GNU_GETTEXT([external])

LT_INIT([disable-static dlopen])

# for tests
txi_ICONV_CONVERTS_EUC_CN

AC_CHECK_FUNCS(newlocale strxfrm_l)

# This is useful on platforms where gettext functions are present, but
# setting the locale through LANGUAGE is not implemented.  In 2024 this is
# the case of the musl libc libintl implementation, for example.
# Setting locale through LANGUAGE is not automatically detected, but it
# is possible to manually set --enable-xs-perl-libintl to use libintl-perl
# to always get the correct output.
AC_ARG_ENABLE([xs-perl-libintl],
    AS_HELP_STRING([--enable-xs-perl-libintl],
              [prefer Perl libintl-perl gettext in XS modules]),
    [if test $enableval = 'yes'; then
       use_libintl_perl_in_xs=yes
     else
       use_libintl_perl_in_xs=no
     fi],
     [
      if test $usable_getenv_in_XS = yes ; then
        use_libintl_perl_in_xs=no
        # TODO add a check of working C libintl gettext for the locale
        # switching using LANGUAGE and translated output string retrieval
      else
        use_libintl_perl_in_xs=yes
      fi
     ])

if test $use_libintl_perl_in_xs = yes ; then
  AC_DEFINE([USE_LIBINTL_PERL_IN_XS], [1],
            [Define to 1 if Perl libintl-perl should be called from XS])
fi
AC_SUBST([use_libintl_perl_in_xs])


# Check if it is possible to embed a Perl interpreter.  Set PERL_EMBEDDED
# conditional, used in C/Makefile.am and swig/python/Makefile.am.  This
# is only used for the ctexi2any implementation of texi2any and for the SWIG
# interface.

# This check is necessary because having XS enabled, the Perl headers
# corresponding to libperl and ExtUtils::Embed installed does not ensure
# that the Perl library .so/.a file needed for linking against libperl to
# embed a Perl interpreter is present.  In Debian, for instance, it is in
# the libperl-dev package that contains only the static library and the .so
# symlink.

embedded_perl=no
# Note that we do not actually use ExtUtils::Embed anywhere.
if test x$enable_xs != xno -a $extutils_embed = yes ; then
  txi_EMBEDDED_PERL
fi
AM_CONDITIONAL([PERL_EMBEDDED], [test "z$embedded_perl" = 'zyes'])

if test x$enable_xs != xno; then
  # Do not include Perl configuration values nor other flags when outputting
  # these variables, as advised in the automake manual for CFLAGS and LDFLAGS,
  # which could be reset by the user.  Here PERL_EXT_CFLAGS and
  # PERL_EXT_LDFLAGS play the same role as CFLAGS and LDFLAGS when Perl C
  # is used in the build.  The Perl configuration values are then readded in
  # Makefile.am when needed, for codes built against the Perl headers.
  # For CPPFLAGS we do not follow the same rule because we want to keep the
  # flags added by gnulib macros, as for libunistring there is no separate
  # CPPFLAGS-like variable, the main CPPFLAGS is modified.
  CFLAGS=$PERL_EXT_CFLAGS
  LDFLAGS=$PERL_EXT_LDFLAGS
fi

# Output these with the _CONFIG suffix as we use the originals as names
# of customization variables.
AC_DEFINE_UNQUOTED([PACKAGE_CONFIG], ["$PACKAGE"],
                   [autoconf PACKAGE value])
AC_DEFINE_UNQUOTED([PACKAGE_NAME_CONFIG], ["$PACKAGE_NAME"],
                   [autoconf PACKAGE_NAME value])
AC_DEFINE_UNQUOTED([PACKAGE_URL_CONFIG], ["$PACKAGE_URL"],
                   [autoconf PACKAGE_URL value])
AC_DEFINE_UNQUOTED([PACKAGE_VERSION_CONFIG], ["$PACKAGE_VERSION"],
                   [autoconf PACKAGE_VERSION value])

# Output with the _CONFIG suffix as the original is a type name
AC_DEFINE_UNQUOTED([CONVERTER_CONFIG], ["$CONVERTER"],
                   [configure CONVERTER value])



# SWIG interfaces

AC_ARG_WITH([swig],
   AS_HELP_STRING([--with-swig], [build SWIG interfaces (default: detected)]),
   [with_swig=$withval],
   [with_swig=detected])

if test $with_swig != 'no' ; then
  # Find swig executable
  # http://www.gnu.org/software/autoconf-archive/ax_pkg_swig.html
  AX_PKG_SWIG([], [ with_swig='yes' ],
  [if test $with_swig = 'yes' ; then
     AC_MSG_ERROR([SWIG not found'])
   fi
   with_swig=no
  ])
fi

AC_MSG_CHECKING([SWIG interfaces])
AC_MSG_RESULT([$with_swig])

AM_CONDITIONAL([SWIG_INTERFACES], [test "x$with_swig" = "xyes"])

with_swig_python=no
if test $with_swig = 'yes' ; then
  # python executable and installation paths
  AM_PATH_PYTHON(,, [:])

  if test "$PYTHON" != : ; then
    # Get CPPFLAGS, etc., for Python module compilation
    # http://www.gnu.org/software/autoconf-archive/ax_python_devel.html
    AX_PYTHON_DEVEL([], [true])

    if test z$ax_python_devel_found = 'zyes' ; then
      # Get SWIGFLAGS, CPPFLAGS, etc., for Python generation by swig
      # http://www.gnu.org/software/autoconf-archive/ax_swig_python.html
      AX_SWIG_PYTHON
      with_swig_python=yes
    fi
  fi
fi

AM_CONDITIONAL([SWIG_PYTHON_INTERFACE], [test "x$with_swig_python" = "xyes"])

# The following can be set by the user on the configure command line:
#
# perl_install_mode       Perl SWIG interface install mode site/vendor/custom
#                         (default: site)
# perl_installsitearch    Perl installsitearch directory (default: Perl
#                         default)
# perl_installsitelib     Perl installsitelib directory (default: Perl
#                         default)
# perl_installvendorarch  Perl installvendorarch directory (default: Perl
#                         default)
# perl_installvendorlib   Perl installvendorlib directory (default: Perl
#                         default)
dnl TODO consider using AC_ARG_VAR for the above variables if with_swig default
dnl becomes detected.

if test "z$perl_install_mode" != zsite \
    -a "z$perl_install_mode" != zvendor \
    -a "z$perl_install_mode" != zcustom ; then
  perl_install_mode=site
fi

swig_perl_tests=no
if test x$enable_xs != xno ; then
  if $PERL -e "use Test::More; use Data::Compare; use Test::Deep;" > /dev/null 2>&AS_MESSAGE_LOG_FD;
  then
    swig_perl_tests=yes
  fi

  if test $perl_install_mode = custom ; then
    perlarchdir='${libdir}/perl5'
    perllibdir='${libdir}/perl5'
  else
    # We replace $PERL_CONF_siteprefix by ${prefix} to obey user prefix
    # as specified in the GNU Standards and to have make distcheck work.
    if test $perl_install_mode = site ; then
      txi_LOOKUP_PERL_CONF([siteprefix])

      if test "z$perl_installsitearch" = z ; then
        txi_LOOKUP_PERL_CONF([installsitearch])
        perl_installsitearch=`echo "$PERL_CONF_installsitearch" | sed "s,$PERL_CONF_siteprefix,\\\${prefix},"`
      fi
      perlarchdir=$perl_installsitearch

      if test "z$perl_installsitelib" = z ; then
        txi_LOOKUP_PERL_CONF([installsitelib])
        perl_installsitelib=`echo "$PERL_CONF_installsitelib" | sed "s,$PERL_CONF_siteprefix,\\\${prefix},"`
      fi
      perllibdir=$perl_installsitelib

    elif test $perl_install_mode = vendor ; then
      txi_LOOKUP_PERL_CONF([vendorprefix])

      if test "z$perl_installvendorarch" = z ; then
        txi_LOOKUP_PERL_CONF([installvendorarch])
        perl_installvendorarch=`echo "$PERL_CONF_installvendorarch" | sed "s,$PERL_CONF_vendorprefix,\\\${prefix},"`
      fi
      perlarchdir=$perl_installvendorarch

      if test "z$perl_installvendorlib" = z ; then
        txi_LOOKUP_PERL_CONF([installvendorlib])
        perl_installvendorlib=`echo "$PERL_CONF_installvendorlib" | sed "s,$PERL_CONF_vendorprefix,\\\${prefix},"`
      fi
      perllibdir=$perl_installvendorlib
    fi
  fi
fi

AM_CONDITIONAL([SWIG_PERL_TESTS], [test "z$swig_perl_tests" = 'zyes'])

use_shared_txi_libraries=no
if test "x$am_func_iconv" = "xyes"; then
  test "z$enable_xs" = zyes && use_shared_txi_libraries=yes
  test "z$enable_additional_tests" = zyes && use_shared_txi_libraries=yes
  test "z$with_swig" = zyes && use_shared_txi_libraries=yes
fi

AM_CONDITIONAL([USE_SHARED_TXI_LIBRARIES],
               [test "z$use_shared_txi_libraries" = zyes])
AC_SUBST([use_shared_txi_libraries])

AC_ARG_ENABLE([using-c-texi2any],
    AS_HELP_STRING([--enable-using-c-texi2any],[Install texi2any program implemented in C if built]),
    [ prefer_c_t2a=$enableval],
    [ prefer_c_t2a=no])

if test "z$embedded_perl" != 'zyes' -o "x$use_shared_txi_libraries" != "xyes" ; then
  prefer_c_t2a=no
fi

AM_CONDITIONAL([PREFER_C_TEXI2ANY], [test "z$prefer_c_t2a" = 'zyes'])

AC_SUBST([TESTS_MAIN_COMMAND])

build_C_code=no
test "z$enable_xs" = zyes && build_C_code=yes
test "z$use_shared_txi_libraries" = zyes && build_C_code=yes

AM_CONDITIONAL([BUILD_C_CODE], [test "z$build_C_code" = zyes])
dnl AC_SUBST([build_C_code])

AC_SUBST([perlarchdir])
AC_SUBST([perllibdir])


AC_CONFIG_FILES([
  Makefile
  tests/Makefile
  tests/many_input_files/Makefile
  tests/formatting/Makefile
  tests/encoded/Makefile
  tests/coverage/Makefile
  tests/customization/Makefile
  tests/nested_formats/Makefile
  tests/layout/Makefile
  tests/tex_html/Makefile
  tests/other/Makefile
  tests/info_tex/Makefile
  defs
  C/Makefile
  perl/Makefile
  perl/XSTexinfo/Makefile
  swig/Makefile
  swig/python/Makefile
  swig/perl/Makefile
  gnulib/lib/Makefile
])

AC_OUTPUT

