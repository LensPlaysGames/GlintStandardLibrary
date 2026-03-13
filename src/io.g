module io;

export import path;

;; C Library File Handle
FILE :: struct {};

external
fopen : FILE.ptr(p : byte.ptr, m : byte.ptr);
external
fclose : cint(handle : FILE.ptr) discardable;
external
fseek : cint(handle : FILE.ptr, offset : cint, mode : cint) discardable;
external
ftell : clong(handle : FILE.ptr);
external
fread : cusize(buffer : byte.ptr, size : cusize, count : cusize, handle : FILE.ptr);
external
fwrite : cusize(buffer : byte.ptr, size : cusize, count : cusize, handle : FILE.ptr);

;; See std.c
external _c_seek_cur : cint;
external _c_seek_end : cint;
external _c_seek_set : cint;

;; See std.cc
external
__c_exists : bool(p : byte.ptr);

;; @returns whether or not file at Path 'p' exists.
export
exists : bool(p : Path.ref) {
  ;; See C++ std.cc
  __c_exists p.string.data;
};

;; ;; @returns contents of the given file.
read : [byte](p : Path.ref) {
  ;; if not (exists p),
  ;;   return [byte] !{};

  ;; TODO: If path does not point to a regular file...

  file-handle :: fopen p.string.data, "rb"[0];
  ;; if not file-handle,
  ;;   return [byte] !{};

  ;; ftell
  fseek file-handle, 0, _c_seek_end;
  size :: ftell file-handle;
  fseek file-handle, 0, _c_seek_set;

  ;; fread
  contents : [byte size];
  bytes-read :: fread contents.data, 1, size, file-handle;
  ;; if bytes-read != size,
  ;;   return [byte] !{};

  ;; fclose
  fclose file-handle;

  return contents;
};
