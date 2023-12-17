cmake_minimum_required(VERSION 3.0)

set(CMAKE_C_COMPILER "/usr/bin/clang")
set(CMAKE_CXX_COMPILER "/usr/bin/clang++")

project(LeetcodeProject)

# Define a variable for the executable name
set(EXECUTABLE_NAME LeetcodeApp)

# Set C standard
set(CMAKE_C_STANDARD 11)

# Find the vcpkg path using a custom script
execute_process(
    COMMAND bash ../scripts/find_vcpkg_path.sh
    OUTPUT_VARIABLE VCPKG_ROOT
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

# Check if the script found vcpkg
if(NOT VCPKG_ROOT OR VCPKG_ROOT STREQUAL "vcpkg not found")
    message(FATAL_ERROR "vcpkg not found. Please install it or check your PATH.")
else()
    message(STATUS "Found vcpkg in ${VCPKG_ROOT}")
endif()

# Now set the CMAKE_TOOLCHAIN_FILE using the found path
set(CMAKE_TOOLCHAIN_FILE "${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake"
    CACHE STRING "Vcpkg toolchain file")

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable(${EXECUTABLE_NAME} main.c)

# Set the vcpkg include directory
set(VCPKG_INCLUDE_DIR "${VCPKG_ROOT}/installed/x64-linux/include")
message("-- VCPKG include directory: ${VCPKG_INCLUDE_DIR}")

target_include_directories(${EXECUTABLE_NAME} PRIVATE ${VCPKG_INCLUDE_DIR})

# Clang format and Tidy scripts
add_custom_target(run_clang_format
    COMMAND ../scripts/run_clang_format.sh ${CMAKE_SOURCE_DIR}
    COMMENT "Running clang-format script as a separate target"
)

add_custom_target(run_clang_tidy
    COMMAND ../scripts/run_clang_tidy.sh ${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR}
    COMMENT "Running clang-tidy script as a separate target"
)

add_dependencies(${EXECUTABLE_NAME} run_clang_format
                                    run_clang_tidy)


add_custom_target(run_clang_sanitizers
    COMMAND ../scripts/run_sanitizers.sh ${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR} ${EXECUTABLE_NAME}
    COMMENT "Running CLang sanitizers script as a separate target"
)

add_custom_command(TARGET ${EXECUTABLE_NAME} POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E echo "Running CLang sanitizers script as a part of post-build step"
    COMMAND bash ../scripts/run_sanitizers.sh ${CMAKE_SOURCE_DIR} ${CMAKE_BINARY_DIR} ${EXECUTABLE_NAME}
    COMMENT "Post-Build: Running CLang sanitizers"
)
