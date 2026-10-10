/* Copyright 2010-2026 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>. */

/* Avoid namespace conflicts. */
#define context perl_context

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#undef context

#include <stddef.h>
#include <string.h>

/* for BYTES_STRING */
#include "document_types.h"
/*
#include "tree_types.h"
#include "converter_types.h"
 */
/* non_perl_* has_perl_interpreter */
#include "xs_utils.h"
#include "call_perl_function.h"

 /* See the NOTE in build_perl_info.c on use of functions related to
    memory allocation */

/* Used to create a "Perl-internal" string that represents a sequence
   of Unicode codepoints with no specific encoding. */
SV *
newSVpv_utf8 (const char *str, STRLEN len)
{
  SV *sv;
  dTHX;

  sv = newSVpv (str, len);
  SvUTF8_on (sv);
  return sv;
}

/* Used to create a string considered as bytes by perl */
SV *
newSVpv_byte (const char *str, STRLEN len)
{
  SV *sv;
  dTHX;

  sv = newSVpv (str, len);
  SvUTF8_off (sv);
  return sv;
}

/* load a module */
void
call_eval_use_module (const char *module_name)
{
  SV *sv_str;
  char *str;

  dTHX;

  sv_str = newSVpvf("use %s;", module_name);
  str = SvPV_nolen(sv_str);

  eval_pv (str, TRUE);
}

TEXT
call_translations_translate_string (const char *string,
                                    const char *language_env,
                                    const char *translation_context)
{
  int count;
  TEXT result;
  const char *result_ret;
  STRLEN len;
  SV *result_sv;

  dTHX;

  text_init (&result);
  /* this happens if USE_LIBINTL_PERL_IN_XS is set while there is no
     Perl interpreter */
  if (!has_perl_interpreter ())
    return result;

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 3);

  PUSHs(sv_2mortal (newSVpv_utf8 (string, 0)));
  PUSHs(sv_2mortal (newSVpv_byte (language_env, 0)));
  PUSHs(sv_2mortal (newSVpv_utf8 (translation_context, 0)));
  PUTBACK;

  count = call_pv (
    "Texinfo::Translations::translate_string",
    G_SCALAR);

  SPAGAIN;

  if (count != 1)
    croak ("translate_string should return 1 item\n");

  result_sv = POPs;
  result_ret = SvPVutf8 (result_sv, len);
  text_append_n (&result, result_ret, len);

  PUTBACK;

  FREETMPS;
  LEAVE;

  return result;
}



/* Used to load the Texinfo modules similar to texi2any.pl or
   load_txi_modules.pl, but trimmed down and from C.
 */
/* Currently unused */
static void
call_modulepath_init (int updirs, const char *perl_modules_dir,
                      const char *converter_libdir,
                      const char *datadir)
{
  int count;

  dTHX;

  dSP;

  ENTER;
  SAVETMPS;

  PUSHMARK(SP);
  EXTEND(SP, 5);

  /* call to Modulepath init for the in-build case */
  if (updirs >= 0)
    {
      PUSHs(newSV (0));
      PUSHs(newSV (0));
      PUSHs(newSV (0));
      PUSHs(sv_2mortal (newSVpv ("updirs", 0)));
      PUSHs(sv_2mortal (newSViv (updirs)));
    }
  else
    {
      /* call to Modulepath init for the installed modules case */
      PUSHs(sv_2mortal (newSVpv_byte (perl_modules_dir, 0)));
      PUSHs(sv_2mortal (newSVpv_byte (converter_libdir, 0)));
      PUSHs(sv_2mortal (newSVpv_byte (datadir, 0)));
      PUSHs(sv_2mortal (newSVpv ("installed", 0)));
      PUSHs(sv_2mortal (newSViv (1)));
    }
  PUTBACK;

  count = call_pv ("Texinfo::ModulePath::init",
                   G_DISCARD|G_SCALAR);

  SPAGAIN;

  if (count != 0)
    croak ("ModulePath init should return 0 item\n");

  PUTBACK;

  FREETMPS;
  LEAVE;
}

/* Initializations similar to those in texi2any.pl or load_txi_modules.pl
   but simplified, as we want to initialize only the modules called from
   libtexinfo. */
/* return -1 (or croak/die) if something unexpected happened.
   return 0 in case of regular errors.
   return 1 for success.
 */
/* Currently unused */
int
call_eval_load_texinfo_modules (int texinfo_uninstalled,
          const char *t2a_builddir, int updirs, const char *modules_dir,
          const char *converter_libdir, const char *datadir)
{
  SV *sv_inc_str;
  char *str;
  AV *INC;

  dTHX;

  INC = get_av ("INC", 0);

  if (!INC)
    return -1;

  av_unshift (INC, 1);

  if (texinfo_uninstalled)
    sv_inc_str = newSVpvf("%s/perl", t2a_builddir);
  else
    sv_inc_str = newSVpv_byte(modules_dir, 0);
  av_store (INC, 0, sv_inc_str);

  str = "require Texinfo::ModulePath;\n";

  eval_pv (str, TRUE);

  if (texinfo_uninstalled)
    call_modulepath_init (updirs, 0, 0, 0);
  else
    call_modulepath_init (-1, modules_dir, converter_libdir,
                          datadir);

  str = "use Texinfo::XSLoader;\n"
        "Texinfo::XSLoader::set_XS_mandatory();\n";
  eval_pv (str, TRUE);

  /* Since XS modules are mandatory, XSLoader dies if they are not
     properly loaded.  This means that DocumentXS init should be
     called if the function returns.
   */
  str = "use Texinfo::Document;\n"
        "use Texinfo::Translations;\n"
        "use Texinfo::Convert::NodeNameNormalization;\n"
        "use Texinfo::Indices;\n";
  eval_pv (str, TRUE);

  /* Could add more from load_txi_modules.pl when some Perl code becomes
     needed.
     For example loading messages for error messages translation and
     loading translated strings from LocaleData.
   */

  return 1;
}


/* assume that there is already a Perl interpreter loaded, but the
   texi2any Perl modules are not loaded and load some modules.
   Currently unused */
int
txi_use_interpreter_load_modules (int texinfo_uninstalled, const char *datadir,
                              const char *converter_datadir,
                              const char *converter_libdir,
                              const char *t2a_builddir,
                              const char *t2a_srcdir, int updirs)
{
  int loaded
     = call_eval_load_texinfo_modules (texinfo_uninstalled, t2a_builddir,
                                      updirs, converter_datadir,
                                      converter_libdir, datadir);

  /* In general, loaded <= 0 cannot happen, because failure to call Perl
     if embedded or to load modules should lead to dying/croaking
     earlier, notably in XSLoader */

  if (loaded < 0)
    {
    /* Unexpected failure loading Perl modules, consider that there is no
       Perl interpreter
     */
      return 1;
    }
  else
    {
      set_use_perl_interpreter (1);
      return 0;
    }
}

