module path;

Path :: struct {
  string : [byte];
};

concat : Path(a : Path, b : Path) {
  ;; TODO: a/b, basically.

  ;; a = "/foo", b = "bar" -> return "/foo/bar"
  ;; a = "foo", b = "bar" -> return "foo/bar"
};

normalizeLexically : Path(p : Path) {
  ;; TODO:
  ;; - remove "./" where possible
  ;;   "foo/./bar" -> "foo/bar"
  ;; - remove "../" where possible
  ;;   "/foo/bar/../qux" -> "/foo/qux"
  ;; - remove duplicate path separators
  ;;   "foo//bar" -> "foo/bar"
};

absolute : Path(p : Path) {
  ;; See C++ std.cc
  ;; TODO: Requires passing string from C++
  ;; __c_path_absolute p.string.data;
};
