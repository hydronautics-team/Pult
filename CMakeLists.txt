cmake_minimum_required(VERSION 3.16)

project(Pult VERSION 0.1 LANGUAGES CXX)

set(TARGET_NAME_PROG Pult)

#set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 17)
#set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_INCLUDE_CURRENT_DIR ON)

#find or include gstreamer
find_package(PkgConfig)

pkg_check_modules(GST REQUIRED
    gstreamer-1.0>=1.14
    gstreamer-video-1.0>=1.14
    gstreamer-gl-1.0>=1.14
)

message("START ////////////\\\\\\\\\\\\")
message(STATUS "${GST_INCLUDE_DIRS}")

find_package(Qt6 ${QT_VERSION} REQUIRED COMPONENTS Qml Quick Gui Multimedia Widgets)

macro (propagate_to_parent)
    set (HEADERS ${HEADERS} PARENT_SCOPE)
    set (SOURCES ${SOURCES} PARENT_SCOPE)
    set (QML ${QML} PARENT_SCOPE)
    set (SVG ${SVG} PARENT_SCOPE)
    set (IMAGE ${IMAGE} PARENT_SCOPE)
endmacro()

macro (add_headers)
    file (RELATIVE_PATH _relPath "${PROJECT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}")
    foreach (_src ${ARGN})
        if (_relPath)
            list (APPEND HEADERS "${_relPath}/${_src}")
        else()
            list (APPEND HEADERS "${_src}")
        endif()
    endforeach()
endmacro()

macro (add_sources)
    file (RELATIVE_PATH _relPath "${PROJECT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}")
    foreach (_src ${ARGN})
        if (_relPath)
            list (APPEND SOURCES "${_relPath}/${_src}")
        else()
            list (APPEND SOURCES "${_src}")
        endif()
    endforeach()
endmacro()

macro (add_qml)
    file (RELATIVE_PATH _relPath "${PROJECT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}")
    foreach (_src ${ARGN})
        if (_relPath)
            list (APPEND QML "${_relPath}/${_src}")
        else()
            list (APPEND QML "${_src}")
        endif()
    endforeach()
endmacro()

macro (add_svg)
    file (RELATIVE_PATH _relPath "${PROJECT_SOURCE_DIR}" "${CMAKE_CURRENT_SOURCE_DIR}")
    foreach (_src ${ARGN})
        if (_relPath)
            list (APPEND SVG "${_relPath}/${_src}")
        else()
            list (APPEND SVG "${_src}")
        endif()
    endforeach()
endmacro()


macro (add_image) #макрос производит поиск и подгрузку изображений из указанной папки
    foreach (_src ${ARGN})
        file(GLOB_RECURSE image_files LIST_DIRECTORIES false RELATIVE "${PROJECT_SOURCE_DIR}" ${CMAKE_CURRENT_SOURCE_DIR}/${_src}/*.svg ${CMAKE_CURRENT_SOURCE_DIR}/${_src}/*.png)
        list (APPEND IMAGE "${image_files}")
    endforeach()
endmacro()

#add_subdirectory(back)
add_subdirectory(front)

add_headers(

)

add_sources(
    main.cpp
)

add_qml(
    main.qml
)

# qt_add_executable(${TARGET_NAME_PROG}
    # ${HEADERS}
    # ${SOURCES}
# )

add_executable(${TARGET_NAME_PROG} ${HEADERS} ${SOURCES})

qt_add_qml_module(${TARGET_NAME_PROG}
    URI ${PROJECT_NAME}
    VERSION 1.0
    QML_FILES ${QML}
    RESOURCES ${SVG} ${IMAGE}
    DESIGNER_SUPPORTED
)

target_link_libraries(${TARGET_NAME_PROG}
    PRIVATE Qt6::Gui Qt6::Quick Qt6::Qml Qt6::Multimedia Qt6::Widgets ${GST_LINK_LIBRARIES})

#message(STATUS ">---------------" ${PROJECT_NAME})
#message(STATUS ">---------------" ${TARGET_NAME_PROG})
#message(STATUS ">---------------" ${SVG})
#message(STATUS ">---------------" ${IMAGE})

target_include_directories(${TARGET_NAME_PROG} PUBLIC ${GST_INCLUDE_DIRS})

target_compile_definitions(${TARGET_NAME_PROG}
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)


