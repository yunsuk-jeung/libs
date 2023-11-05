cmake_minimum_required(VERSION 3.18.1)

project("libs")

option(LINK_WITH_EIGEN "link with eigen" ON)
option(LINK_WITH_TBB "link with TBB" ON)


if(WIN32)
  set(INCLUDE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs_win/include)
  set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs_win/lib)
elseif(ANDROID)
  set(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR}/libs/lib)
endif()

add_library(${PROJECT_NAME} INTERFACE)

if(LINK_WITH_EIGEN)
  add_library(eigen INTERFACE)
  target_include_directories(eigen INTERFACE ${INCLUDE_DIR}/eigen3)
  target_link_libraries(${PROJECT_NAME} INTERFACE eigen)
endif()

if(LINK_WITH_TBB)
  list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/cmake/TBB)
  find_package(TBB REQUIRED)
  target_link_libraries(${PROJECT_NAME} INTERFACE TBB::tbb)
endif()