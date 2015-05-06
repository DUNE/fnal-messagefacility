# - Provide dummy passthroughs for any uneeded cetbuildtools functions
#

function(cet_enable_asserts)
endfunction()

function(cet_make_library)
endfunction()

function(cet_make_exec)
endfunction()

function(basic_plugin)
endfunction()

function(cet_script default)
  cmake_parse_arguments(CS "DEPENDENCIES" "GENERATED;NO_INSTALL;REMOVE_EXTENSIONS" ${ARGN})

  if(CS_GENERATED)
    set(CS_SOURCE_DIR ${CMAKE_CURRENT_BINARY_DIR})
  else()
    set(CS_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR})
  endif()

  foreach(target_name ${default})
    if(CS_REMOVE_EXTENSIONS)
      get_filename_component(target ${target_name} NAME_WE)
    else()
      set(target ${target_name})
    endif()
    add_executable(${target} IMPORTED GLOBAL)
    set_target_properties(${target}
      PROPERTIES IMPORTED_LOCATION "${CS_SOURCE_DIR}/${target_name}"
      )
  endforeach()
endfunction()
