cmake_minimum_required(VERSION 3.18.1)

project("libs")

option(LINK_WITH_EIGEN "link with eigen" ON)
option(LINK_WITH_TBB "link with TBB" ON)
option(LINK_WITH_SPDLOG "link with SPDLOG" ON)
option(LINK_WITH_JSON "link with JSON" ON)

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

if(LINK_WITH_SPDLOG)
  list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/cmake/spdlog)
  find_package(spdlog REQUIRED)
  target_link_libraries(${PROJECT_NAME} INTERFACE spdlog::spdlog)
endif()

if(LINK_WITH_JSON)
  list(APPEND CMAKE_PREFIX_PATH ${LIB_DIR}/../share/cmake/nlohmann_json)
  find_package(nlohmann_json REQUIRED)
  target_link_libraries(${PROJECT_NAME} INTERFACE nlohmann_json::nlohmann_json)
endif()
# if(LINK_WITH_SPDLOG)

# endif()