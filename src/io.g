module io;

export import path;

File : struct {
  path : Path;
  size : uint;
};

;; @returns whether or not file at Path 'p' exists.
exists : bool(p : Path) {
  ;; TODO: Return whether or not file at path 'p' exists.
};

read : [byte](f : File.ref) {
  ;; TODO: Read file
};

write : bool(p : Path, data : [byte]) {
  ;; TODO: Ensure path validity.
  ;; TODO: Write data to file at path.
};

directoryEntries : sum{error:uint, value:[DirectoryEntry]}(p : Path) {
  ;; TODO: Ensure path validity.
  ;; TODO: Ensure path exists.
  ;; TODO: Ensure path refers to a directory.
  ;; TODO: Get directory entries (likely from external C++ library utilizing
  ;; std::filesystem).
  {};
};

;; @returns a byte read from the standard input file; likely a keycode for
;; a key the user has pressed on their keyboard.
in : byte() {
  ;; TODO: call getc, or something.
};
