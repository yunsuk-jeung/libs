cmake_minimum_required(VERSION 3.18.1)

project("libs")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# ########### TBB ##############
option(TBB_TEST "" OFF)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../oneTBB ${CMAKE_BINARY_DIR}/oneTBB)

# ############ Eigen ###########
option(BUILD_TESTING "" OFF)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../eigen ${CMAKE_BINARY_DIR}/eigen)

############ SPD LOG ##########
option(SPDLOG_BUILD_TESTS "" OFF)
option(SPDLOG_INSTALL "" ON)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../spdlog ${CMAKE_BINARY_DIR}/spdlog)

############ JSON ########
option(JSON_BuildTests "" OFF)
option(JSON_Install "" ON)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../json ${CMAKE_BINARY_DIR}/json)

