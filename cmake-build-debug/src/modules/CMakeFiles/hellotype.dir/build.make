# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/klook/work/redis

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/klook/work/redis/cmake-build-debug

# Include any dependencies generated for this target.
include src/modules/CMakeFiles/hellotype.dir/depend.make

# Include the progress variables for this target.
include src/modules/CMakeFiles/hellotype.dir/progress.make

# Include the compile flags for this target's objects.
include src/modules/CMakeFiles/hellotype.dir/flags.make

src/modules/CMakeFiles/hellotype.dir/hellotype.c.o: src/modules/CMakeFiles/hellotype.dir/flags.make
src/modules/CMakeFiles/hellotype.dir/hellotype.c.o: ../src/modules/hellotype.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/klook/work/redis/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object src/modules/CMakeFiles/hellotype.dir/hellotype.c.o"
	cd /Users/klook/work/redis/cmake-build-debug/src/modules && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/hellotype.dir/hellotype.c.o   -c /Users/klook/work/redis/src/modules/hellotype.c

src/modules/CMakeFiles/hellotype.dir/hellotype.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/hellotype.dir/hellotype.c.i"
	cd /Users/klook/work/redis/cmake-build-debug/src/modules && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/klook/work/redis/src/modules/hellotype.c > CMakeFiles/hellotype.dir/hellotype.c.i

src/modules/CMakeFiles/hellotype.dir/hellotype.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/hellotype.dir/hellotype.c.s"
	cd /Users/klook/work/redis/cmake-build-debug/src/modules && /Library/Developer/CommandLineTools/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/klook/work/redis/src/modules/hellotype.c -o CMakeFiles/hellotype.dir/hellotype.c.s

# Object files for target hellotype
hellotype_OBJECTS = \
"CMakeFiles/hellotype.dir/hellotype.c.o"

# External object files for target hellotype
hellotype_EXTERNAL_OBJECTS =

src/modules/hellotype.so: src/modules/CMakeFiles/hellotype.dir/hellotype.c.o
src/modules/hellotype.so: src/modules/CMakeFiles/hellotype.dir/build.make
src/modules/hellotype.so: src/modules/CMakeFiles/hellotype.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/klook/work/redis/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library hellotype.so"
	cd /Users/klook/work/redis/cmake-build-debug/src/modules && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/hellotype.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/modules/CMakeFiles/hellotype.dir/build: src/modules/hellotype.so

.PHONY : src/modules/CMakeFiles/hellotype.dir/build

src/modules/CMakeFiles/hellotype.dir/clean:
	cd /Users/klook/work/redis/cmake-build-debug/src/modules && $(CMAKE_COMMAND) -P CMakeFiles/hellotype.dir/cmake_clean.cmake
.PHONY : src/modules/CMakeFiles/hellotype.dir/clean

src/modules/CMakeFiles/hellotype.dir/depend:
	cd /Users/klook/work/redis/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/klook/work/redis /Users/klook/work/redis/src/modules /Users/klook/work/redis/cmake-build-debug /Users/klook/work/redis/cmake-build-debug/src/modules /Users/klook/work/redis/cmake-build-debug/src/modules/CMakeFiles/hellotype.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/modules/CMakeFiles/hellotype.dir/depend

