# Find path to the library file
FILE(GLOB_RECURSE FREERTOS_MAIN_FPATH_LIST os_task.hpp)
LIST(LENGTH FREERTOS_MAIN_FPATH_LIST FREERTOS_MAIN_FPATH_LIST_LEN)
IF(FREERTOS_MAIN_FPATH_LIST_LEN EQUAL 0)
	MESSAGE(FATAL_ERROR "FreeRTOS path not found")

set(LIB_COMPONENTS
    os_flag  os_lockguard  os_queue  os_task
    )

foreach(comp ${JunglesOsStructs_FIND_COMPONENTS})
    if(not "${comp}" IN_LIST LIB_COMPONENTS)
        if(JunglesOsStructs_FIND_REQUIRED_${comp} OR JunglesOsStructs_FIND_REQUIRED)
            message(FATAL_ERROR "Could not find component ${comp} in JunglesOsStructs")
        endif()
    else()
        if(${comp}.c IN_LIST LIB_SOURCES)
            list(APPEND SOURCES ${SOURCES_PATH}/${comp}.c)
        elseif(${comp}.cpp IN_LIST LIB_SOURCES)
            list(APPEND SOURCES ${SOURCES_PATH}/${comp}.cpp)
        endif()
    endif()
endforeach(comp)
