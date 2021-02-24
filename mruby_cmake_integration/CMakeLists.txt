cmake_minimum_required(VERSION 3.10)
project("mruby_cmake_integration")

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules)

find_package(MRuby)

set(RB_BASENAME hello_world)
set(RB_OUTPUT_PATH ${CMAKE_CURRENT_BINARY_DIR}/generated)
set(RB_OUTPUT_FILE ${RB_OUTPUT_PATH}/${RB_BASENAME}.c)
set(RB_SOURCE_FILE ${CMAKE_CURRENT_SOURCE_DIR}/src/scripts/${RB_BASENAME}.rb)
file(MAKE_DIRECTORY ${RB_OUTPUT_PATH})

add_custom_command(OUTPUT ${RB_OUTPUT_FILE}
  COMMAND mrbc
  ARGS -Bsample -o${RB_OUTPUT_FILE} ${RB_SOURCE_FILE}
  DEPENDS ${RB_SOURCE_FILE}
  VERBATIM)

set_property(SOURCE src/main.cpp
  APPEND PROPERTY OBJECT_DEPENDS ${RB_OUTPUT_FILE})

add_executable(mruby_cmake_integration src/main.cpp)
include_directories(${MRUBY_INCLUDE_DIRS} ${RB_OUTPUT_PATH})
target_link_libraries(mruby_cmake_integration ${MRUBY_LIBRARIES})
