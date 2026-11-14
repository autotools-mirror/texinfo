/* text.h - declarations for text.c */
#ifndef TEXT_H
#define TEXT_H
/* Copyright 2014-2026 Free Software Foundation, Inc.

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

#include <stddef.h>
#include <stdarg.h>

int xvasprintf (char **ptr, const char *format, va_list ap);

/* TEXT defined as macro in winnt.h on MSYS2. */
#ifdef TEXT
#undef TEXT
#endif

typedef struct TEXT {
    char *text;
    size_t space; /* Allocated bytes in 'text', including terminating null. */
    size_t end;
} TEXT;

/* not used in this file, but conveniently defined for all the code that includes
   the header file */
typedef struct TEXT_AND_LINE_COUNT {
    TEXT text;
    int line_count;
} TEXT_AND_LINE_COUNT;

void text_init (TEXT *t);
void text_append (TEXT *t, const char *s);
void text_append_n (TEXT *t, const char *s, size_t len);
void text_printf (TEXT *t, const char *format, ...);
void text_alloc (TEXT *t, size_t len);
void text_reset (TEXT *t);
void text_destroy (TEXT *t);
char *text_yield (TEXT *t);

#endif
