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
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* implement api to Perl and calls to Perl function that are called from
   pure C code */

#include <config.h>

#include <stdlib.h>
#include <string.h>
#include <stdio.h>

#include "tree.h"
#include "document_types.h"
#include "api_to_perl.h"
#include "call_perl_function.h"

/* api_to_perl.h */
int
get_refcount (void *sv)
{
  return -100;
}

void
unregister_perl_data (void *sv)
{
}

void
register_perl_data (void *sv)
{
}

char *
call_close_perl_io (void *io)
{
  return strdup ("BUG: no Perl but call_close_perl_io");
}

void
call_switch_to_global_locale (void)
{
}

void
call_sync_locale (void)
{
}

void
show_sv_hv (const void *sv, const char *msg)
{
  fprintf (stderr, "show_sv_hv: %s: NO PERL\n", msg);
}

void *
get_sv_hv (const void *sv)
{
  if (sv)
    fprintf (stderr, "get_sv_hv: %p: NO PERL\n", sv);
  return 0;
}

/* call_perl_function.h */
void
call_eval_use_module (const char *module_name)
{
}

/* it is up to the caller to do something useful if NULL text is returned */
TEXT
call_translations_translate_string (const char *string,
                                    const char *language_env,
                                    const char *translation_context)
{
  TEXT result;
  text_init (&result);
  return result;
}

int
call_eval_load_texinfo_modules (int texinfo_uninstalled,
          const char *t2a_builddir, int updirs, const char *modules_dir,
          const char *converter_libdir, const char *datadir)
{
  return 0;
}

/* call_document_perl_functions.h */
void
call_document_remove_document_references (DOCUMENT *document,
                                          int remove_references)
{
}

