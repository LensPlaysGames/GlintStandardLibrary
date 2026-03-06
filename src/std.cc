#include <filesystem>

extern "C" bool  __c_exists(const char* path) {
    // Technically, we don't have to worry about Glint's dynamic array
    // pointers being null...
    // if (not path) return false;
    return std::filesystem::exists(path);
}
