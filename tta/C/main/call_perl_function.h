/* call_perl_function.h - API to interact with perl from C code */
#ifndef CALL_PERL_FUNCTION_H
#define CALL_PERL_FUNCTION_H

/* for BYTES_STRING */
#include "document_types.h"

void call_eval_use_module (const char *module_name);

TEXT call_translations_translate_string (const char *string,
                                         const char *language_env,
                                         const char *translation_context);

#endif
