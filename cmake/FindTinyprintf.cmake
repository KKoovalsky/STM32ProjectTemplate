set(Tinyprintf_MAIN_HEADER printf.h)

file(GLOB_RECURSE Tinyprintf_SRC_PATH ${Tinyprintf_MAIN_HEADER})
if(Tinyprintf_SRC_PATH)
    get_filename_component(Tinyprintf_INCLUDE_DIR ${Tinyprintf_SRC_PATH} DIRECTORY)
elseif(Tinyprintf_FIND_REQUIRED)
    message(FATAL_ERROR "Could not find Tinyprintf")
endif()

set(Tinyprintf_INCLUDE_DIRS
    ${Tinyprintf_INCLUDE_DIR}
)
set(Tinyprintf_SOURCES
    ${Tinyprintf_INCLUDE_DIR}/printf.c
)

INCLUDE(FindPackageHandleStandardArgs)

FIND_PACKAGE_HANDLE_STANDARD_ARGS(Tinyprintf DEFAULT_MSG Tinyprintf_INCLUDE_DIRS Tinyprintf_SOURCES)
