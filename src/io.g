module io;

export import path;

File :: struct {
  path : Path;
};

;; @returns whether or not file at Path 'p' exists.
exists : bool(p : Path) {
  ;; See C++ std.cc
  __c_exists p.string.data;
};

;; @returns contents of the given file.
read : [byte](p : Path.ref) {
  if not exists p,
    return !{};

  ;; TODO: If path does not point to a regular file...

  file-handle :: fopen p.string.data, "rb"[0];
  if not file-handle,
    return !{};

  ;; ftell
  fseek file-handle, 0, _c_seek_end;
  size :: ftell file-handle;
  fseek file-handle, 0, _c_seek_set;

  ;; fread
  contents : [byte size];
  bytes-read :: fread contents.data, 1, size, file-handle;
  if bytes-read != size,
    return !{};

  ;; fclose
  fclose file-handle;

  return contents;
};

read : [byte](f : File.ref)
  read f.path;

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
