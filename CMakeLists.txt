cmake_minimum_required (VERSION 3.9.0)
project (rai)
if (POLICY CMP0077)
  cmake_policy(SET CMP0077 OLD)
endif ()
set (PCRE2_BUILD_PCRE2_32 ON)
add_subdirectory (pcre2)
add_subdirectory (libdecnumber)
add_subdirectory (raimd)
add_subdirectory (raikv)
add_subdirectory (sassrv)
add_subdirectory (capr)
add_subdirectory (natsmd)
add_subdirectory (lzf)
add_subdirectory (rdbparser)
add_subdirectory (linecook)
add_subdirectory (openpgm)
add_subdirectory (h3)
add_subdirectory (raids)
add_subdirectory (raims)

