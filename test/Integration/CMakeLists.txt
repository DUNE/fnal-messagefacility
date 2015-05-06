if (ALT_CMAKE) 
include(altCMakeLists.cmake)
else()
# ======================================================================
#
# Testing script
#
# ======================================================================

CONFIGURE_FILE (
  ${CMAKE_CURRENT_SOURCE_DIR}/MessageFacilityTest.cfg
  ${CMAKE_CURRENT_BINARY_DIR}/MessageFacility.cfg
  COPYONLY
  )
endif()
