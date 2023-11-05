cmake_minimum_required(VERSION 3.18.1)

project("libs")

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

# ########### TBB ##############
option(TBB_TEST OFF)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../oneTBB ${CMAKE_BINARY_DIR}/oneTBB)
# target_link_libraries(libs INTERFACE tbb)

# ############ Eigen ###########
option(BUILD_TESTING OFF)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../eigen ${CMAKE_BINARY_DIR}/eigen)