module path;

export
Path :: struct {
  string : [byte];
};

export
concat : Path(a : Path.ref, b : Path.ref) {
  ;; TODO: a/b, basically.

  ;; a = "/foo", b = "bar" -> return "/foo/bar"
  ;; a = "foo", b = "bar" -> return "foo/bar"
};

export
normalize : Path(p : Path.ref) {
  ;; TODO:
  ;; - remove "./" where possible
  ;;   "foo/./bar" -> "foo/bar"
  ;; - remove "../" where possible
  ;;   "/foo/bar/../qux" -> "/foo/qux"
  ;; - remove duplicate path separators
  ;;   "foo//bar" -> "foo/bar"
};

export
absolute : Path(p : Path.ref) {
  ;; See C++ std.cc
  ;; TODO: Requires passing string from C++
  ;; __c_path_absolute p.string.data;
};
