list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/lcc/cmake")

cmake_minimum_required(VERSION 3.14)
project(GlintStandardLibrary LANGUAGES C CXX Glint)

add_library(
  gstd
  src/io.g
  src/path.g
  src/shellcmd.g
  src/std.c
  src/std.cc
)
