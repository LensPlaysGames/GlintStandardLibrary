module path;

;; Possibly just strong alias?
Path : struct {
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
