cmake_minimum_required(VERSION 3.10.2 FATAL_ERROR)
project(gz-rendering-gradients_qml)

#------------------------------------------------------------------------
# Find gz-cmake
find_package(gz-cmake3 REQUIRED)
set(GZ_CMAKE_VER ${gz-cmake3_VERSION_MAJOR})

#------------------------------------------------------------------------
# Find gz-rendering
find_package(gz-rendering8)

#======================================
# Find Qt
find_package(Qt5 REQUIRED COMPONENTS
    Core
    Gui
    Qml
    Quick
    QuickControls2
    Widgets
)

include_directories(
    ${PROJECT_SOURCE_DIR}/include
    ${Qt5Core_INCLUDE_DIRS}
    ${Qt5Qml_INCLUDE_DIRS}
    ${Qt5Quick_INCLUDE_DIRS}
    ${Qt5QuickControls2_INCLUDE_DIRS}
    ${Qt5Widgets_INCLUDE_DIRS}
)

include_directories(SYSTEM
  ${PROJECT_BINARY_DIR}
)

find_package(GLUT REQUIRED)
include_directories(SYSTEM ${GLUT_INCLUDE_DIRS})
link_directories(${GLUT_LIBRARY_DIRS})

find_package(OpenGL REQUIRED)
include_directories(SYSTEM ${OpenGL_INCLUDE_DIRS})
link_directories(${OpenGL_LIBRARY_DIRS})

add_definitions(
    ${Qt5Widgets_DEFINITIONS}
    ${Qt5Qml_DEFINITIONS}
    ${${Qt5Quick_DEFINITIONS}}
)

#======================================
# Configure Qt

qt5_add_resources(QT_RESOURCES
    Main.qrc
)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}")
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

configure_file (example_config.hh.in ${PROJECT_BINARY_DIR}/example_config.hh)

#======================================
# Build

add_executable(gradients_qml
    Main.cc
    GzRenderer.hh
    GzRenderer.cc
    ThreadRenderer.h
    ThreadRenderer.cpp
    ${QT_RESOURCES}
)

target_include_directories(gradients_qml PUBLIC
    ${GZ-RENDERING_INCLUDE_DIRS}
    ${OGRE2_INCLUDE_DIRS}
    ${OpenGL_INCLUDE_DIRS}
)

target_link_libraries(gradients_qml PUBLIC
    ${GZ-RENDERING_LIBRARIES}
    ${OGRE2_LIBRARIES}
    ${OPENGL_LIBRARIES}
    ${GLUT_LIBRARIES}
    ${GLEW_LIBRARIES}
    Qt5::Core
    Qt5::Gui
    Qt5::Qml
    Qt5::Quick
)

set_target_properties(gradients_qml
    PROPERTIES
        QT_QML_MODULE_VERSION 1.0
        QT_QML_MODULE_URI GzRendering
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}
)

add_custom_command(TARGET gradients_qml POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E copy_directory
  ${CMAKE_SOURCE_DIR}/media
  $<TARGET_FILE_DIR:gradients_qml>/media)