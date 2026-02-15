cmake_minimum_required(VERSION 3.16)

project(controller VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appcontroller
    main.cpp
)

qt_add_qml_module(appcontroller
    URI controller
    QML_FILES
        Main.qml
        RESOURCES
        RESOURCES assets/BrushedMetal.jpg assets/cool.svg assets/fan_fill.svg assets/fan_off.svg assets/fan_outline.svg assets/heat.svg
        QML_FILES
        QML_FILES Sidebar.qml
        QML_FILES
        RESOURCES fonts/Prisma.ttf fonts/RussoOne-Regular.ttf
        QML_FILES Home.qml
        QML_FILES Gpio.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appcontroller PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appcontroller
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appcontroller
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appcontroller
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
