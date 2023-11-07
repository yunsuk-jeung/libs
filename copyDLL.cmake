function(copy_tbb_dlls target TBB_BIN_DIR)
  if(WIN32)
    if(CMAKE_BUILD_TYPE STREQUAL "Debug")
      file(GLOB TBB_DLLS "${TBB_BIN_DIR}/tbb*_debug.dll")
    else()
      file(GLOB TBB_DLLS "${TBB_BIN_DIR}/tbb*.dll")
      list(FILTER TBB_DLLS EXCLUDE REGEX ".*_debug\\.dll$")
    endif()

    add_custom_command(TARGET ${target} POST_BUILD
      COMMAND ${CMAKE_COMMAND} -E copy
      ${TBB_DLLS}
      $<TARGET_FILE_DIR:${target}>)
  endif()
endfunction()
