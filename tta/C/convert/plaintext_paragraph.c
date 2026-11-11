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

#ifdef HAVE_CONFIG_H
  #include <config.h>
#endif

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include <uniwidth.h>
#include <unictype.h>
#include <unistr.h>
#include "unicase.h"
#include <uchar.h>
/* PRIuLEAST32 */
#include <inttypes.h>

#include "text.h"
#include "base_utils.h"
#include "plaintext_paragraph.h"

static int debug = 0;

enum eos_status { eos_unset = -2, eos_present = 1,
                  eos_present_frenchspacing = -1 };
/* eos_unset                 - not at the end of a sentence (unset in Perl),
   eos_present               - at end of sentence
   eos_present_frenchspacing - at end of sentence but frenchspacing is on. */


typedef struct PARAGRAPH {
    TEXT space; /* Pending space, to be output before the pending word. */
    TEXT word;  /* Pending word.  If outputting this would have led to
                   the line to be too long, the line should have been cut before
                   saving it. */

    /* When word.end == 0, this indicates a word of length 0. */
    int invisible_pending_word;

    int word_counter;  /* Characters added so far in current word. */

    int end_line_count; /* Number of newlines so far in an output unit, i.e.
                           with add_text or add_next. */

    char32_t last_letter; /* Last letter in word, used to decide if we're
                            at the end of a sentence. */
    enum eos_status end_sentence; /* See comment at enum eos_status. */

    int in_use; /* used in paragraph state array */

    /* configuration variables - can be set directly via access functions. */
    /* Next can be set when creating a new paragraph */
    int counter;            /* Columns so far on this line. */
    int max;                /* Maximum length of line. */
    int indent_length;      /* Columns to indent this line. */
    int indent_length_next; /* Columns to indent the rest of the lines. */
    int unfilled;           /* No wrapping of lines and spaces are kept
                               as-is. */
    int no_final_newline;   /* Do not terminate with a final newline. */
    int add_final_space;    /* Terminate with any trailing space. */
    int keep_end_lines;     /* Don't cut line at right margin.
                               A newline in the input ends a line in the output.
                               Used by @flushleft, @flushright lines and
                               unfilled formatters. */
    int frenchspacing;      /* Only one space, not two, after a full stop. */
    int debug;              /* output debugging messages */

    /* Not set when creating a new paragraph */
    int double_width_no_break; /* No line break between double width chars. */

    /* Options set with set_space_protection. */
    int no_break;       /* Line break forbidden, as in @w. */

} PARAGRAPH;

static PARAGRAPH state;

#ifdef _WIN32

/* Avoid warnings due to redefinition of popen/pclose in Perl headers.  */
#ifdef popen
# undef popen
# define popen(c,m) _popen(c,m)
#endif
#ifdef pclose
# undef pclose
# define pclose(f)  _pclose(f)
#endif

#endif

/* for debug */
char *
para__print_escaped_spaces (const char *string, size_t len)
{
  static TEXT t;
  const char *p = string;
  text_reset (&t);
  while (p < string + len)
    {
      if (*p == ' ')
        text_append_n (&t, p, 1);
      else if (*p == '\n')
        text_append_n (&t, "\\n", 2);
      else if (*p == '\f')
        text_append_n (&t, "\\f", 2);
      else if (isascii_space (*p))
        {
          char protected_string[7];
          sprintf (protected_string, "\\x%04x", *p);
          text_append (&t, protected_string);
        }
      p++;
    }
  return t.text;
}

/* Array for storing paragraph states which aren't in use. */
static PARAGRAPH *state_array;
static int state_array_size;

/* The slot in state_array for saving the current state. */
static int current_state;

static void
para__switch_state (int id)
{
  if (current_state == id)
    return;
  if (current_state != -1)
    memcpy (&state_array[current_state], &state, sizeof (PARAGRAPH));

  memcpy (&state, &state_array[id], sizeof (PARAGRAPH));
  current_state = id;
}

int
para_new (void)
{
  int i;

  TEXT saved_space, saved_word;

  /* Find an unused slot in state_array */
  for (i = 0; i < state_array_size; i++)
    {
      if (!state_array[i].in_use)
        break;
    }
  if (i == state_array_size)
    {
      state_array = realloc (state_array,
                             (state_array_size += 10) * sizeof (PARAGRAPH));
      memset (state_array + i, 0, 10 * sizeof (PARAGRAPH));
    }

  state_array[i].in_use = 1;
  para__switch_state (i);

  /* Zero formatter, reusing storage. */
  saved_space = state.space;
  saved_word = state.word;
  memset (&state, 0, sizeof (state));
  state.space = saved_space;
  state.word = saved_word;
  state.space.end = state.word.end = 0;
  text_append (&state.word, "");
  state.in_use = 1;

  /* Default values. */
  state.max = 72;
  state.indent_length_next = -1; /* Special value meaning undefined. */
  state.end_sentence = eos_unset;
  state.last_letter = (char32_t) '\0';

  /* use manually set value.  Configuration function call can come later on */
  if (debug)
    state.debug = debug;

  /* The paragraph ID. */
  return i;
}

void
para_set_state (int paragraph)
{
  para__switch_state (paragraph);
}

/* set a function to set the state for each of the possible configuration
   variables */

#define para_SET_CONF(variable) \
void para_set_conf_##variable (int variable) { \
  state.variable = variable; \
  if (state.debug) \
    fprintf (stderr, "CONF %d " #variable ": %d\n", current_state, variable); \
}

PARA_CONF_VARIABLES_LIST

#undef para_SET_CONF

/************************************************************************/


/* Append a newline character to RESULT if the line is cut. */
void
para__cut_line (TEXT *result, int column_counts)
{
  if (column_counts > state.max)
    {
      para__end_line ();
      text_append_n (result, "\n", 1);
    }
}

int
para_end_line_count (void)
{
  return state.end_line_count;
}

void
para_add_to_counter (int n)
{
  state.counter += n;
}

int
para_counter (void)
{
  return state.counter;
}

/* End a line, throwing away a pending space.
 */
void
para__end_line (void)
{
  state.counter = 0;
  state.space.end = 0;
  /* do not reset in case it is an end of command and we want to keep
     the information about upper-case letter
  state.last_letter = (char32_t) '\0';
   */

  /* This will only be true for the first line of output. */
  if (state.indent_length_next != -1)
    {
      state.indent_length = state.indent_length_next;
      state.indent_length_next = -1;
    }

  state.end_line_count++;
  if (state.debug)
    fprintf (stderr, "END_LINE\n");
}

static const TEXT new_line_text = {"\n", 1, 1};
TEXT
para_end_line (void)
{
  state.end_line_count = 0;
  para__end_line ();
  return new_line_text;
}

/* Append to RESULT pending space followed by pending word, clearing them
   afterwards.  Assume we don't need to wrap a line.  Only add spaces without a
   word if ADD_SPACES. */
void
para__add_pending_word (TEXT *result, int add_spaces)
{
  if (state.word.end == 0 && !state.invisible_pending_word && !add_spaces)
    {
      if (state.debug)
        fprintf (stderr, "ADD_PENDING, nothing to add\n");
      return;
    }

  if (state.indent_length > state.counter)
    {
      int i;
      /* If we are not up to the left margin yet, output spaces to get there,
         and ignore 'state.space', the pending space string.  In this case
         state.counter is probably 0.  */

      for (i = 0; i < state.indent_length - state.counter; i++)
        text_append_n (result, " ", 1);
      state.counter = state.indent_length;

      if (state.debug)
        fprintf (stderr, "INDENT(%d+%d)\n", state.counter, state.word_counter);

      /* Do not output leading spaces after the indent, unless 'unfilled'
         is on.  */
      if (!state.unfilled)
        {
          state.space.end = 0;
        }
    }

  if (state.space.end > 0)
    {
      text_append_n (result, state.space.text, state.space.end);

      if (state.debug)
        fprintf (stderr, "ADD_SPACES(%d)+%zu `%s'\n", state.counter,
                                                     state.space.end,
                      para__print_escaped_spaces (state.space.text,
                                                  state.space.end));
      state.counter += state.space.end;

      state.space.end = 0;
    }

  if (state.word.end > 0 || state.invisible_pending_word)
    {
      text_append_n (result, state.word.text, state.word.end);
      state.counter += state.word_counter;

      if (state.debug)
        fprintf (stderr, "ADD_WORD[%s]+%d (%d)\n", state.word.text,
                 state.word_counter, state.counter);

      text_reset (&state.word);
      state.word_counter = 0;
      state.invisible_pending_word = 0;
    }
}

/* Function for users of this module. */
/* Since the return value is destroyed when this function is called again,
   the caller should make sure not to retain reference to it */
TEXT
para_add_pending_word (int add_spaces)
{
  static TEXT ret;

  text_reset (&ret);
  state.end_line_count = 0;
  para__add_pending_word (&ret, add_spaces);
  return ret;
}

/* End a paragraph. */
TEXT
para_end (void)
{
  static TEXT ret;

  text_reset (&ret);
  state.end_line_count = 0;

  if (state.debug)
    fprintf (stderr, "PARA END\n");

  /* cleaner if the paragraph is reused */
  state.last_letter = (char32_t) '\0';

  para__add_pending_word (&ret, state.add_final_space);
  if (!state.no_final_newline && state.counter != 0)
    {
      text_append_n (&ret, "\n", 1);
      state.end_line_count++;
    }

  return ret;
}

void
para_destroy (void)
{
  /* Now it's time to forget about the state. */
  if (state.debug)
    fprintf (stderr, "SET UNUSED %d\n", current_state);
  state_array[current_state].in_use = 0;
  state.in_use = 0;
}

static void
append_to_word (const char *text, size_t len, int do_upper_case)
{
  if (do_upper_case)
    {
      size_t length;
      uint8_t *u8_result = u8_toupper ((uint8_t *)text, len,
                                       NULL, NULL, NULL, &length);
      text_append_n (&state.word, (char *)u8_result, length);
      free (u8_result);
    }
  else
    {
      text_append_n (&state.word, text, len);
    }
}

/* check if a byte is in the printable ASCII range */
#define PRINTABLE_ASCII(c) (0x20 <= (c) && (c) <= 0x7E)

/* ignored after end sentence character to determine if
   at the end of a sentence */
/* DEL is also there even though it is not an end sentence character,
   such that it is ignored too, if there is a quoted node name in
   an @*ref before end sentence punctuation */
#define after_punctuation_characters "\"')]" "\x7F"
/* characters triggering an end of sentence */
#define end_sentence_characters ".?!"

/* Add WORD to paragraph, not refilling WORD.  If we go past the end
   of the line, fill RESULT and start a new one.  TRANSPARENT means that
   the letters in WORD are ignored for the purpose of deciding whether a
   full stop ends a sentence or not.  If COL_COUNT is non-negative, it is
   the number of screen columns taken up by the word; it is non-negative
   if called from add_text, if called from add_next, COL_COUNT is
   always negative.
   If called from add_text, with non-negative COL_COUNT, set end of sentence
   related states.
   If DO_UPPER_CASE is set, upper-case the text after having determined
   if an upper-case letter precedes end sentence punctuation.
 */
static void
para__add_next (TEXT *result, const char *word, int word_len,
                int transparent, int col_count, int do_upper_case)
{
  if (!word)
    return;

  if (!transparent && !state.unfilled)
    {
      /* Check for an end of sentence and go backwards before the
         end-sentence and 'after punctuation' characters.
         We can iterate backwards by bytes as all those characters are
         ASCII.
       */
      int end_sentence = 0;
      const char *p = word + word_len;

      while (p > word)
        {
          p--;
          if (strchr (end_sentence_characters, *p))
            end_sentence = 1;
          else if (strchr (after_punctuation_characters, *p))
            {
              /* These characters are ignored when checking for the end
                 of a sentence. */
            }
          else
            {/* another character, move p back to the position right after
                the character */
              p++;
              break;
            }
        }

      /* Save last non-punctuation character in WORD */
      if (p > word)
        {
          int len = 0;
          const char *q = p;
          /* Back one UTF-8 code point */
          do
            {
              q--;
              len++;
            }
          while ((*q & 0xC0) == 0x80 && q > word);

          char32_t wc;
          u8_mbtouc (&wc, (uint8_t *) q, len);
          state.last_letter = wc;
        }

      /* called from add_text */
      if (col_count >= 0)
        {
          /* Set/unset state.end_sentence. */
          /* Doesn't count if preceded by an upper-case letter. */
          if (end_sentence && !uc_is_upper (state.last_letter))
            {
              if (state.frenchspacing)
                state.end_sentence = eos_present_frenchspacing;
              else
                state.end_sentence = eos_present;
              if (state.debug)
                fprintf (stderr, "END_SENTENCE\n");
            }
          else if (p > word)
            {
              /* Not at the end of a sentence.  and not only
                 after_punctuation_characters */
              if (state.debug && state.end_sentence != eos_unset)
                fprintf (stderr, "delete END_SENTENCE(%d)\n",
                                  state.end_sentence);
              state.end_sentence = eos_unset;
            }
        }
    }

  if (word_len == 0)
    state.invisible_pending_word = 1;
  else
    append_to_word (word, word_len, do_upper_case);

  if (memchr (word, '\n', word_len))
    {
      /* If there was a newline in the word we just added, put the entire
         pending ouput in the results string, and start a new line. */
      para__add_pending_word (result, 0);
      para__end_line ();
    }
  else
    {
     if (col_count >= 0)
        state.word_counter += col_count;
      else
        {
          /* Calculate length of multibyte string in characters. */
          int len = 0;
          int left = word_len;
          char32_t w;
          const char *p = word;

          while (left > 0)
            {
              int columns;
              int char_len;

              if (PRINTABLE_ASCII(*p))
                {
                  len++; p++; left--;
                  continue;
                }

              char_len = u8_mbtouc (&w, (uint8_t *) p, left);
              if (w == 0xfffd) /* bug - invalid string */
                {
                  if (char_len <= 0)
                    char_len = 1; /* avoid an infinite loop */
                }
              left -= char_len;
              p += char_len;

              columns = uc_width (w, "UTF-8");
              if (columns > 0)
                len += columns;
            }
          state.word_counter += len;
       }


      if (state.counter != 0 && !state.keep_end_lines)
        {
          para__cut_line (result, state.counter + state.word_counter
                                  + (int)state.space.end);
        }
    }

  if (state.debug)
    {
      static TEXT printed_word;
      text_reset (&printed_word);
      text_append_n (&printed_word, word, word_len);
      fprintf (stderr, "WORD+ %s -> %s\n", printed_word.text,
               state.word.text);
    }
}

/* Like _add_next but zero end_line_count at beginning. */
/* Note that t.text can be NULL if the text added does not start
   a new line and accumulate in the paragraphe word. */
TEXT
para_add_next (const char *text, int text_len, int transparent)
{
  static TEXT t;

  text_reset (&t);
  state.end_line_count = 0;
  para__add_next (&t, text, text_len, transparent, -1, 0);

  return t;
}

void
para_remove_end_sentence (void)
{
  if (state.debug)
    fprintf (stderr, "REMOVE END SENTENCE\n");

  state.end_sentence = eos_unset;
}

void
para_add_end_sentence (void)
{
  state.end_sentence = eos_present;
}

void
para_allow_end_sentence (void)
{
  if (state.debug)
    fprintf (stderr, "ALLOW END SENTENCE\n");

  state.last_letter = (char32_t) 'a'; /* A lower-case letter. */
}

/* -1 in a parameter means leave that value as it is. */
void
para_set_space_protection (int no_break)
{
  if (no_break != -1)
    state.no_break = no_break;

 if (no_break != -1 && state.no_break && state.word.end == 0)
   {
     /* In _add_pending_word this meant that an "empty word" would
        be output.  This makes "a @w{} b" -> "a  b", not "a b", and
        "a @w{}" at end of paragraph -> "a ", not "a". */

     state.invisible_pending_word = 1;
   }

 return;
}

/*****************************************************************/

enum text_class { type_NULL, type_spaces, type_regular,
                 type_double_width, type_finished,
                 };

/* Return string to be added to paragraph contents, wrapping text.
   If DO_UPPER_CASE is set, upper-case the text after having determined
   if an upper-case letter precedes end sentence punctuation.
 */
/* The return value should not be modified and should be accessed before
   calling the function again */
TEXT
para_add_text (const char *text, int len, int do_upper_case)
{
  const char *p = text;
  char32_t next_wc = (char32_t) '0';
  char32_t wc;
  size_t next_len = 0;
  static TEXT result;
  enum text_class type = type_NULL, next_type = type_NULL;

  /* Column count of next type_regular block, either for type or
     next_type.  We do not have two type_regular blocks in a row so there
     is no chance of this being overwritten before it is used.  It is
     zeroed when the block is output. */
  /* Being non-negative in para__add_next call also triggers setting
     end of sentence related states */
  int regular_col_count = 0;

  text_reset (&result);

  state.end_line_count = 0;

  while (1)
    {
      /* p is now at the beginning of the text we have left to process.
         next_type is set to the type of the next block, or is type_NULL
         before the beginning, or is type_finished after the last block. */

      type = next_type;

      /* NOTE next_wc is only set/reset when the next type is a non-space
         character.
         Therefore wc is accurate only when previous next_type was a non-space
         character, ie when type is a non-space character.  wc should
         only be used in that case */
      wc = next_wc;

      /* at the end of the string */
      if (type == type_finished)
        break;

      const char *q = p;
      q += next_len; len -= next_len; /* Skip over the last character
                                         processed. */

      /* Set q to the end of the block.  Set next_len to the length of
         the following character, and next_type to the type of
         the block after. */
      while (1)
        {
          if (len <= 0)
            {
              next_type = type_finished;
            }
          else if (isascii_space (*q))
            {
              next_type = type_spaces;
              next_len = 1;
            }
          else
            {
              int width;
              next_len = u8_mbtouc (&next_wc, (uint8_t *) q, len);

              if (next_wc == 0xfffd) /* bug - invalid string */
                {
                  if (next_len <= 0)
                    next_len = 1; /* avoid an infinte loop */
                }

             /* Note: width == 0 includes accent characters. */
              width = uc_width (next_wc, "UTF-8");
              if (width == 1 || width == 0)
                {
                  regular_col_count += width;
                  next_type = type_regular;
                }
              else if (width == 2)
                {
                  next_type = type_double_width;
                }
              else
                {
          /* Not printable, possibly a tab, or a combining character.
             Add it to the pending word without increasing the column
             count. */
                  next_type = type_regular;
                }
            }

          /* ready to use debugging for this loop, commented out
             because there is no equivalent in Perl
            {
              uint8_t next_wc_u8[7];
              int next_wc_len
                = u8_uctomb (next_wc_u8, next_wc, 6);
              if (next_wc_len < 0)
                fatal ("u8_uctomb returns negative value");
              next_wc_u8[next_wc_len] = 0;

              fprintf (stderr, "type: %d next_t: %d next_wc: `%s'\n",
                       type, next_type, (char *)next_wc_u8);
            }
           */

          /* For type_regular and type_spaces we operate on blocks of
             multiple characters at once. */
          if ((type != type_regular && type != type_spaces)
              || next_type != type || next_type == type_finished)
            break;

          q += next_len; len -= next_len;
        }

      /* For the very start of the string. */
      if (type == type_NULL)
        continue;

      /* show the debugging information here, not when the first character
         type is determined to avoid presenting redundant information */
      if (state.debug)
        {
          uint8_t last_letter_u8[7];
          int last_letter_len
            = u8_uctomb (last_letter_u8, state.last_letter, 6);
          if (last_letter_len < 0)
            fatal ("u8_uctomb returns negative value");
          last_letter_u8[last_letter_len] = 0;

          fprintf(stderr, "p (%d+%d) s `%s', l `%s', eos %d, w%d `%s'\n",
                    state.counter, state.word_counter,
                    state.space.end == 0 ? ""
                      : para__print_escaped_spaces (state.space.text,
                                                      state.space.end),
                    (char *)last_letter_u8, state.end_sentence,
                    state.invisible_pending_word,
                    state.word.text);
        }

      /* Now type is the type of the block we are about to operate on, and
         next_type the one after it.  p is the beginning of the span and q
         is the end. */

      /*************** Whitespace character. *********************/
      if (type == type_spaces)
        {
          if (state.debug)
            {
              fprintf(stderr, "SPACES(%d) `%s'\n", state.counter,
                      para__print_escaped_spaces (p, q - p));
            }

          if (state.unfilled)
            {
              para__add_pending_word (&result, 0);
              if (memchr (p, '\n', q - p))
                {
                   para__end_line ();
                   text_append_n (&result, "\n", 1);
                }
              else
                {
                  text_append_n (&state.space, p, q - p);
                }
            }
          else
            {
              if (state.no_break)
                {
                  /* Append the spaces to the pending word. */
                  if (state.word.end == 0
                      || state.word.text[state.word.end - 1] != ' ')
                    {
                      if (state.end_sentence == eos_present
                          && !state.frenchspacing)
                        {
                          text_append_n (&state.word, "  ", 2);
                          state.word_counter += 2;
                        }
                      else
                        {
                          text_append_n (&state.word, " ", 1);
                          state.word_counter += 1;
                        }

                      if (state.counter != 0 && !state.keep_end_lines)
                        {
                          para__cut_line (&result, state.counter
                              + state.word_counter + (int)state.space.end);
                        }
                    }
                }
              else /* no_break off */
                {
                  int pending = state.invisible_pending_word;
                  para__add_pending_word (&result, 0);

                  if (state.counter != 0 || pending)
                    {
                      /* If we are at the end of a sentence where two spaces
                         are required. */
                      if (state.end_sentence == eos_present
                          && !state.frenchspacing)
                        {
                          state.space.end = 0;
                          text_append_n (&state.space, "  ", 2);
                        }
                      else /* Not at end of sentence. */
                        {
                          /* Only save the first space. */
                          if (state.space.end < 1)
                            {
                              text_append_n (&state.space, " ", 1);
                            }
                        }
                    }
                }

              if (!state.keep_end_lines)
                {
              /* If not enough space in the line for the pending space, start
                 a new line. */
                  para__cut_line (&result,
                                  state.counter + (int)state.space.end);
                }
              else if (memchr (p, '\n', q - p))
                {
                  para__end_line ();
                  text_append_n (&result, "\n", 1);
                }
              state.last_letter = (char32_t) ' ';
            }
        }

      /*************** Double width character. *********************/
      else if (type == type_double_width)
        {
          if (state.debug)
            fprintf (stderr, "FULLWIDTH\n");

          /* fullwidth latin letters can be upper case, so it is important to
             use the actual characters here. */
          state.last_letter = wc;

          append_to_word (p, q - p, do_upper_case);

          /* NOTE we assume that upper-case fullwidth character is also
             fullwidth */
          state.word_counter += 2;

          /* We allow a line break in between Chinese characters even if
             there was no space between them, unlike single-width
             characters. */

          if (state.counter != 0 && !state.keep_end_lines)
            {
              para__cut_line (&result, state.counter + state.word_counter);
            }
          /* Accumulate the characters so that they can be pushed
             onto the next line if necessary. */
          if (!state.no_break && !state.double_width_no_break)
            {
              para__add_pending_word (&result, 0);
            }
          state.end_sentence = eos_unset;
        }
      /*************** Word and other characters ************************/
      else if (type == type_regular)
        {
          para__add_next (&result, p, q - p, 0, regular_col_count,
                          do_upper_case);
          regular_col_count = 0;
        }

      p = q;
    }

  return result;
}

