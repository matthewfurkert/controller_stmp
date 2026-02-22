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
        QML_FILES Sidebar.qml
        QML_FILES home/Home.qml
        QML_FILES gpio/Gpio.qml
        RESOURCES go_fonts/Go-Bold-Italic.ttf go_fonts/Go-Bold.ttf go_fonts/Go-Italic.ttf go_fonts/Go-Medium-Italic.ttf go_fonts/Go-Medium.ttf go_fonts/Go-Regular.ttf go_fonts/README
        RESOURCES assets/BrushedMetal.jpg assets/cool.svg assets/fan_fill.svg assets/fan_off.svg assets/fan_outline.svg assets/heat.svg
        QML_FILES can/Can.qml
        SOURCES gpio/gpiofactory.h gpio/gpiofactory.cpp
        SOURCES gpio/igpiopin.h
        SOURCES gpio/mockgpiopin.h gpio/mockgpiopin.cpp
        SOURCES gpio/realgpiopin.h gpio/realgpiopin.cpp
        SOURCES gpio/lightshow.h gpio/lightshow.cpp
)

option(USE_REAL_GPIO "Use real libgpiod (requires libgpiod-dev on target/desktop)" OFF)

if(USE_REAL_GPIO)
    find_package(PkgConfig REQUIRED)
    pkg_check_modules(LIBGPIOD REQUIRED libgpiod)
    target_link_libraries(appcontroller PRIVATE ${LIBGPIOD_LIBRARIES})
    target_include_directories(appcontroller PRIVATE ${LIBGPIOD_INCLUDE_DIRS})
    target_compile_definitions(appcontroller PRIVATE USE_REAL_GPIO)
    message(STATUS "Building with REAL GPIO (libgpiod)")
else()
    message(STATUS "Building with MOCK GPIO (perfect for Windows/WSL desktop)")
endif()

target_link_libraries(appcontroller
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS appcontroller
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
