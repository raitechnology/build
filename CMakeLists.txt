cmake_minimum_required (VERSION 3.9.0)
project (rai)
set (PCRE2_BUILD_PCRE2_32 ON)
add_subdirectory (pcre2)
add_subdirectory (libdecnumber)
add_subdirectory (raimd)
add_subdirectory (raikv)
add_subdirectory (sassrv)

