if (ALT_CMAKE) 
include(altCMakeLists.cmake)
else()
INSTALL (FILES
    LinuxPPC.cmake
    DESTINATION ${product}/${version}/source/xcompile
    )
endif()
