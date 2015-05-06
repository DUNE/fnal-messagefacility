if (ALT_CMAKE) 
include(altCMakeLists.cmake)
else()
include(CetMake)

add_subdirectory(MessageLogger)
add_subdirectory(MessageService)
add_subdirectory(Utilities)
endif()
