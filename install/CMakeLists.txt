cmake_minimum_required(VERSION 3.18.1)

project("libs")

# ########### TBB ##############
option(TBB_TEST OFF)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../oneTBB ${CMAKE_BINARY_DIR}/oneTBB)
# target_link_libraries(libs INTERFACE tbb)

# ############ Eigen ###########