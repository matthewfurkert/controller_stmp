# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appcontroller_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appcontroller_autogen.dir\\ParseCache.txt"
  "appcontroller_autogen"
  )
endif()
