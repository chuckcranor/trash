cmake_minimum_required(VERSION 3.1)
project (mpitry C CXX)
set (CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)

find_package (MPI MODULE REQUIRED)
add_executable (mpitry mpitry.c)

# Note that the mpich on ub14 gives a leading space that we need to trim off.
string (REPLACE " " ";" mpic_flags "${MPI_C_COMPILE_FLAGS}")
foreach (lcv ${mpic_flags})
    if (NOT ${lcv} STREQUAL "")
        target_compile_options (mpitry PUBLIC
                                $<BUILD_INTERFACE:${lcv}>)
    endif ()
endforeach ()

foreach (lcv ${MPI_C_INCLUDE_PATH})
    target_include_directories (mpitry PUBLIC
                                $<BUILD_INTERFACE:${lcv}>)
endforeach ()

foreach (lcv ${MPI_C_LIBRARIES})
    target_link_libraries(mpitry $<BUILD_INTERFACE:${lcv}>)
endforeach ()

set_property (TARGET mpitry APPEND PROPERTY LINK_FLAGS
              ${MPI_C_LINK_FLAGS})
get_property (link_flags TARGET mpitry PROPERTY LINK_FLAGS)

#
# "make install" rule
#
install (TARGETS mpitry RUNTIME DESTINATION bin)

foreach(var MPI_FOUND MPI_C_FOUND MPI_CXX_FOUND MPI_C_COMPILER
  MPI_CXX_COMPILER MPI_C_COMPILE_OPTIONS MPI_CXX_COMPILE_OPTIONS
  MPI_C_COMPILE_FLAGS MPI_CXX_COMPILE_FLAGS
  MPI_C_COMPILE_DEFINITIONS MPI_CXX_COMPILE_DEFINITIONS
  MPI_C_INCLUDE_DIRS MPI_C_INCLUDE_PATH
  MPI_CXX_INCLUDE_DIRS MPI_CXX_INCLUDE_PATH
  MPI_C_LINK_FLAGS MPI_CXX_LINK_FLAGS 
  MPI_C_LIBRARIES MPI_CXX_LIBRARIES)

  message("${var} is ${${var}}")

endforeach()
