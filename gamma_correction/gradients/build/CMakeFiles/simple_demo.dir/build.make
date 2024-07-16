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
CMAKE_SOURCE_DIR = /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/build

# Include any dependencies generated for this target.
include CMakeFiles/simple_demo.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/simple_demo.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/simple_demo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/simple_demo.dir/flags.make

CMakeFiles/simple_demo.dir/Main.cc.o: CMakeFiles/simple_demo.dir/flags.make
CMakeFiles/simple_demo.dir/Main.cc.o: ../Main.cc
CMakeFiles/simple_demo.dir/Main.cc.o: CMakeFiles/simple_demo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/simple_demo.dir/Main.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/simple_demo.dir/Main.cc.o -MF CMakeFiles/simple_demo.dir/Main.cc.o.d -o CMakeFiles/simple_demo.dir/Main.cc.o -c /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/Main.cc

CMakeFiles/simple_demo.dir/Main.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/simple_demo.dir/Main.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/Main.cc > CMakeFiles/simple_demo.dir/Main.cc.i

CMakeFiles/simple_demo.dir/Main.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/simple_demo.dir/Main.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/Main.cc -o CMakeFiles/simple_demo.dir/Main.cc.s

CMakeFiles/simple_demo.dir/GlutWindow.cc.o: CMakeFiles/simple_demo.dir/flags.make
CMakeFiles/simple_demo.dir/GlutWindow.cc.o: ../GlutWindow.cc
CMakeFiles/simple_demo.dir/GlutWindow.cc.o: CMakeFiles/simple_demo.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/simple_demo.dir/GlutWindow.cc.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/simple_demo.dir/GlutWindow.cc.o -MF CMakeFiles/simple_demo.dir/GlutWindow.cc.o.d -o CMakeFiles/simple_demo.dir/GlutWindow.cc.o -c /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/GlutWindow.cc

CMakeFiles/simple_demo.dir/GlutWindow.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/simple_demo.dir/GlutWindow.cc.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/GlutWindow.cc > CMakeFiles/simple_demo.dir/GlutWindow.cc.i

CMakeFiles/simple_demo.dir/GlutWindow.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/simple_demo.dir/GlutWindow.cc.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/GlutWindow.cc -o CMakeFiles/simple_demo.dir/GlutWindow.cc.s

# Object files for target simple_demo
simple_demo_OBJECTS = \
"CMakeFiles/simple_demo.dir/Main.cc.o" \
"CMakeFiles/simple_demo.dir/GlutWindow.cc.o"

# External object files for target simple_demo
simple_demo_EXTERNAL_OBJECTS =

simple_demo: CMakeFiles/simple_demo.dir/Main.cc.o
simple_demo: CMakeFiles/simple_demo.dir/GlutWindow.cc.o
simple_demo: CMakeFiles/simple_demo.dir/build.make
simple_demo: /usr/lib/x86_64-linux-gnu/libglut.so
simple_demo: /usr/lib/x86_64-linux-gnu/libXmu.so
simple_demo: /usr/lib/x86_64-linux-gnu/libXi.so
simple_demo: /usr/lib/x86_64-linux-gnu/libOpenGL.so
simple_demo: /usr/lib/x86_64-linux-gnu/libGLX.so
simple_demo: /usr/lib/x86_64-linux-gnu/libGLU.so
simple_demo: /usr/lib/x86_64-linux-gnu/libGLEW.so
simple_demo: /home/athenaz/workspace/install/lib/libgz-rendering8.so.8.2.0
simple_demo: /home/athenaz/workspace/install/lib/libgz-common5-events.so.5.6.0
simple_demo: /home/athenaz/workspace/install/lib/libgz-common5-geospatial.so.5.6.0
simple_demo: /home/athenaz/workspace/install/lib/libgz-common5-graphics.so.5.6.0
simple_demo: /home/athenaz/workspace/install/lib/libgz-common5.so.5.6.0
simple_demo: /usr/lib/x86_64-linux-gnu/libuuid.so
simple_demo: /usr/lib/x86_64-linux-gnu/libuuid.so
simple_demo: /home/athenaz/workspace/install/lib/libgz-math7.so.7.5.0
simple_demo: /home/athenaz/workspace/install/lib/libgz-utils2.so.2.2.0
simple_demo: CMakeFiles/simple_demo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX executable simple_demo"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/simple_demo.dir/link.txt --verbose=$(VERBOSE)
	/usr/bin/cmake -E copy_directory /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/media /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/build/media

# Rule to build all files generated by this target.
CMakeFiles/simple_demo.dir/build: simple_demo
.PHONY : CMakeFiles/simple_demo.dir/build

CMakeFiles/simple_demo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/simple_demo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/simple_demo.dir/clean

CMakeFiles/simple_demo.dir/depend:
	cd /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/build /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/build /home/athenaz/Documents/gz-rendering-benchmark/gamma_correction/gradients/build/CMakeFiles/simple_demo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/simple_demo.dir/depend

