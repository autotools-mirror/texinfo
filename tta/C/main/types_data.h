/* types_data.h - declarations for types_data.c */
#ifndef TYPES_DATA_H
#define TYPES_DATA_H
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

typedef struct types_struct {
  char *name;
  unsigned long flags;
} TYPE_DATA;

extern const TYPE_DATA type_data[];

/* update swig_element_types.h TXI_TY_FLAGS_LIST if needed */
#define TF_text               0x0001
#define TF_with_command       0x0002
#define TF_c_only             0x0004
#define TF_leading_space      0x0008
#define TF_trailing_space     0x0010
#define TF_ignorable_text     0x0020

#endif
