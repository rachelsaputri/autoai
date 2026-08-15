cmake_minimum_required(VERSION 3.10)
project(cpp_config_drift_auditor VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/src)

# Source files
set(SOURCES
    src/main.cpp
    src/drift_detector.cpp
    src/compliance_engine.cpp
    src/policy_parser.cpp
    src/drift_registry.cpp
    src/report_generator.cpp
)

# Executable
add_executable(cpp_config_drift_auditor ${SOURCES})

# Link standard libraries
find_package(Threads REQUIRED)
target_link_libraries(cpp_config_drift_auditor PRIVATE Threads::Threads)

# Install targets
install(TARGETS cpp_config_drift_auditor DESTINATION bin)
