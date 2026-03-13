#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>

// The standard C library uses preprocessor macros, because it's uber
// super duper annoying.
void* _c_null = NULL;

FILE* _c_stdin = NULL;
FILE* _c_stdout = NULL;
FILE* _c_stderr = NULL;

int _c_seek_cur = 0;
int _c_seek_end = 0;
int _c_seek_set = 0;

void __c_init() {
  _c_stdin = stdin;
  _c_stdout = stdout;
  _c_stderr = stderr;

  _c_seek_cur = SEEK_CUR;
  _c_seek_end = SEEK_END;
  _c_seek_set = SEEK_SET;
}

int _c_system(const char* command) {
  int rc = system(command);
#ifdef __unix__
  return WEXITSTATUS(rc);
#else
  return rc;
#endif
}
