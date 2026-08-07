cmake_minimum_required(VERSION 3.22)
project(qtrade_strategy VERSION 0.1.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
endif()

include(GNUInstallDirs)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

add_compile_options(-fPIC -Wall -Wextra -Wpedantic -O2)

find_package(Threads REQUIRED)
find_package(spdlog 1.16.0 REQUIRED)
find_package(nlohmann_json 3.11.0 REQUIRED)
find_package(cpputils 0.1.0 REQUIRED CONFIG)
find_package(qtrade REQUIRED CONFIG)

set(QTRADE_STRATEGY_PLUGIN_OUTPUT_DIR ${CMAKE_BINARY_DIR}/lib/strategies)
set(QTRADE_STRATEGY_ROOT ${CMAKE_SOURCE_DIR}/strategies)

include(${CMAKE_SOURCE_DIR}/cmake/example_strategy.cmake)

# 新增策略时在此追加：
# include(${CMAKE_SOURCE_DIR}/cmake/your_strategy.cmake)
