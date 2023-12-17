# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ruannawe/projects/clang/cmake-project

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ruannawe/projects/clang/cmake-project/build

# Utility rule file for run_clang_sanitizers.

# Include any custom commands dependencies for this target.
include CMakeFiles/run_clang_sanitizers.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/run_clang_sanitizers.dir/progress.make

CMakeFiles/run_clang_sanitizers:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/ruannawe/projects/clang/cmake-project/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Running CLang sanitizers script as a separate target"
	../scripts/run_sanitizers.sh /home/ruannawe/projects/clang/cmake-project /home/ruannawe/projects/clang/cmake-project/build LeetcodeApp

run_clang_sanitizers: CMakeFiles/run_clang_sanitizers
run_clang_sanitizers: CMakeFiles/run_clang_sanitizers.dir/build.make
.PHONY : run_clang_sanitizers

# Rule to build all files generated by this target.
CMakeFiles/run_clang_sanitizers.dir/build: run_clang_sanitizers
.PHONY : CMakeFiles/run_clang_sanitizers.dir/build

CMakeFiles/run_clang_sanitizers.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/run_clang_sanitizers.dir/cmake_clean.cmake
.PHONY : CMakeFiles/run_clang_sanitizers.dir/clean

CMakeFiles/run_clang_sanitizers.dir/depend:
	cd /home/ruannawe/projects/clang/cmake-project/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ruannawe/projects/clang/cmake-project /home/ruannawe/projects/clang/cmake-project /home/ruannawe/projects/clang/cmake-project/build /home/ruannawe/projects/clang/cmake-project/build /home/ruannawe/projects/clang/cmake-project/build/CMakeFiles/run_clang_sanitizers.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/run_clang_sanitizers.dir/depend

