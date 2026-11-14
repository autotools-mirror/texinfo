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

/* This code should only be called for the t/z_misc/paragraph.t tests
   and when there is XS but no Texinfo libraries, which should only happen
   with specific configure settings or non-functioning iconv.
 */

#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include <stdio.h>
#include <string.h>

#include "text.h"
#include "plaintext_paragraph.h"

MODULE = Texinfo::Convert::Paragraph PACKAGE = Texinfo::Convert::Paragraph PREFIX = para_

PROTOTYPES: ENABLE

void
para_set_state (int state)

# Return an identifier for the paragraph container.  In Perl the paragraph
# container hash reference itself is returned.
# Optional CONF parameter.
# NOTE the order of setting configuration variables is not fixed,
# in contrast with pure C or pure Perl codes, which means non-reproducible
# order for debugging messages.  It could be fixed by having
# PARA_CONF_VARIABLES_LIST order based on C and Perl order, and
# changing the code to hv_fetch the variables in that order.
SV *
para_new (...)
    PREINIT:
        HV *conf = 0;
        int id;
#define para_SET_CONF(variable)  \
                else if (!strcmp (var_name, #variable)) \
                  { \
                    if (SvOK (value_sv)) \
                      {para_set_conf_##variable (SvIV (value_sv));} \
                  }
    CODE:
        if (items > 0)
          {
            if (SvROK(ST(0)) && SvTYPE(SvRV(ST(0))) == SVt_PVHV)
              conf = (HV *) SvRV(ST(0));
          }
        id = para_new ();

        if (conf)
          {
            I32 hv_number;
            I32 i;

            /* do debug first to see the list of all the conf variables */
            char *var_name = "debug";
            SV **debug_sv = hv_fetch (conf, var_name, strlen (var_name), 0);
            if (debug_sv && SvOK (*debug_sv))
              para_set_conf_debug (SvIV (*debug_sv));

            hv_number = hv_iterinit (conf);

            for (i = 0; i < hv_number; i++)
              {
                I32 retlen;
                char *var_name;
                SV *value_sv = hv_iternextsv (conf, &var_name, &retlen);

                if (!strcmp(var_name, "debug"))
                  {}
     /* PARA_CONF_VARIABLES_LIST is replaced by para_SET_CONF(variable)
        for each of the configuration variables, which starts with else if */
                PARA_CONF_VARIABLES_LIST
                else
                  {
                    fprintf (stderr,
                             "bug: unrecognized paragraph conf var %s\n",
                             var_name);
                  }
              }
          }

        /* Create an integer, which the other functions
           need as their first argument. */
        RETVAL = newSViv (id);
    OUTPUT:
        RETVAL
    CLEANUP:
#undef para_SET_CONF


void
para_add_to_counter (int paragraph, int n)
    CODE:
        para_set_state (paragraph);
        para_add_to_counter (n);

int
para_counter (int paragraph)
    CODE:
        para_set_state (paragraph);
        RETVAL = para_counter ();
    OUTPUT:
        RETVAL

void
para_end_line (int paragraph)
    PREINIT:
        TEXT_AND_LINE_COUNT end_line;
        SV *text_sv;
        SV *count_sv;
    PPCODE:
        para_set_state (paragraph);
        end_line = para_end_line ();

        text_sv = newSVpv (end_line.text.text, end_line.text.end);
        SvUTF8_on (text_sv);
        count_sv = newSViv (end_line.line_count);

        EXTEND(SP, 2);
        PUSHs(sv_2mortal(text_sv));
        PUSHs(sv_2mortal(count_sv));

# ... is for add_spaces
SV *
para_add_pending_word (int paragraph, ...)
    PREINIT:
        int add_spaces = 0;
        TEXT retval;
    CODE:
        items -= 1;
        if (items > 0)
          {
            if (SvOK(ST(1)))
              {
                add_spaces = (int)SvIV(ST(1));;
              }
          }
        para_set_state (paragraph);
        retval = para_add_pending_word (add_spaces);

        RETVAL = newSVpv (retval.text, retval.end);
        SvUTF8_on (RETVAL);
    OUTPUT:
        RETVAL

void
para_end (int paragraph)
    PREINIT:
        TEXT_AND_LINE_COUNT retval;
        SV *text_sv;
        SV *count_sv;
    PPCODE:
        para_set_state (paragraph);
        retval = para_end ();

        text_sv = newSVpv (retval.text.text, retval.text.end);
        SvUTF8_on (text_sv);
        count_sv = newSViv (retval.line_count);

        EXTEND(SP, 2);
        PUSHs(sv_2mortal(text_sv));
        PUSHs(sv_2mortal(count_sv));

void
para_destroy (int paragraph)
      CODE:
        para_set_state (paragraph);
        para_destroy ();

void
para_add_text (int paragraph, SV *text_in, SV *do_upper_case_in=0)
    PREINIT:
        char *text;
        STRLEN text_len;
        int do_upper_case = 0;
        TEXT_AND_LINE_COUNT retval;
        SV *text_sv;
        SV *count_sv;
    PPCODE:
        text = SvPVutf8 (text_in, text_len);
        if (do_upper_case_in && SvOK (do_upper_case_in))
          do_upper_case = SvIV (do_upper_case_in);

        para_set_state (paragraph);
        retval = para_add_text (text, text_len, do_upper_case);

        text_sv = newSVpv (retval.text.text ? retval.text.text : "",
                           retval.text.end);
        SvUTF8_on (text_sv);
        count_sv = newSViv (retval.line_count);

        EXTEND(SP, 2);
        PUSHs(sv_2mortal(text_sv));
        PUSHs(sv_2mortal(count_sv));

void
para_add_next (int paragraph, SV *text_in, SV *transparent_in=0)
    PREINIT:
        char *text;
        STRLEN text_len;
        int transparent = 0;
        TEXT_AND_LINE_COUNT retval;
        SV *text_sv;
        SV *count_sv;
    PPCODE:
        if (transparent_in && SvOK(transparent_in))
          transparent = (int)SvIV(transparent_in);

        text = SvPVutf8 (text_in, text_len);

        para_set_state (paragraph);
        retval = para_add_next (text, text_len, transparent);

        text_sv = newSVpv (retval.text.text ? retval.text.text : "",
                           retval.text.end);
        SvUTF8_on (text_sv);
        count_sv = newSViv (retval.line_count);

        EXTEND(SP, 2);
        PUSHs(sv_2mortal(text_sv));
        PUSHs(sv_2mortal(count_sv));

void
para_remove_end_sentence (int paragraph)
    CODE:
        para_set_state (paragraph);
        para_remove_end_sentence ();

void
para_add_end_sentence (int paragraph)
    CODE:
        para_set_state (paragraph);
        para_add_end_sentence ();

void
para_allow_end_sentence (int paragraph)
    CODE:
        para_set_state (paragraph);
        para_allow_end_sentence ();

void
para_set_frenchspacing (int paragraph, int val)
    CODE:
        para_set_state (paragraph);
        para_set_conf_frenchspacing (val);

void
para_set_double_width_no_break (int paragraph, int val)
    CODE:
        para_set_state (paragraph);
        para_set_conf_double_width_no_break (val);

void
para_set_space_protection (int paragraph, space_protection_in)
        SV * space_protection_in
    PREINIT:
        int space_protection = -1;
    CODE:
        if (SvOK(space_protection_in))
          space_protection = (int)SvIV(space_protection_in);

        para_set_state (paragraph);
        para_set_space_protection (space_protection);

