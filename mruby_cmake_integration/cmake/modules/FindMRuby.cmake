# Try to find MRuby
# Released under MIT License by Kota Weaver
# Once done this will define
#  MRUBY_FOUND - System has MRuby
#  MRUBY_INCLUDE_DIRS - The MRuby include directories
#  MRUBY_LIBRARIES - The libraries needed to use MRuby
#  MRUBY_DEFINITIONS - Compiler switches required for MRuby

find_package(PkgConfig)
pkg_check_modules(PC_MRUBY QUIET mruby)
set(MRUBY_DEFINITIONS ${PC_MRUBY_CFLAGS_OTHER})
find_path(MRUBY_INCLUDE_DIR mruby.h
  HINTS ${PC_MRUBY_INCLUDE_DIR} ${PC_MRUBY_INCLUDE_DIRS})
find_library(MRUBY_LIBRARY NAMES mruby
  HINTS ${PC_MRUBY_LIBDIR} ${PC_MRUBY_LIBRARY_DIRS})
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MRUBY DEFAULT_MSG
  MRUBY_LIBRARY MRUBY_INCLUDE_DIR)
mark_as_advanced(MRUBY_INCLUDE_DIR MRUBY_LIBRARY)
set(MRUBY_LIBRARIES ${MRUBY_LIBRARY})
set(MRUBY_INCLUDE_DIRS ${MRUBY_INCLUDE_DIR})
