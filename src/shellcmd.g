module shellcmd;

export
run-command-simple : cint(command : byte.ptr)
  _c_system command;

;; TODO: run-command which returns struct with return status, stdout, and
;; stderr.
