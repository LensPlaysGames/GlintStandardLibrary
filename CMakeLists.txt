list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/lcc/cmake")

cmake_minimum_required(VERSION 3.14)
project(GlintStandardLibrary LANGUAGES C Glint)

add_library(
  gstd
  src/SimpleFile.g
)
