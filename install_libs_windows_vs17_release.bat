@echo off
REM Set the paths
set CMAKE_PATH="C:\Program Files\CMake\bin\cmake.exe"
set SCRIPT_DIR=%~dp0
set PROJECT_DIR=%SCRIPT_DIR%
set INSTALL_DIR=%PROJECT_DIR%\libs_win
set BUILD_TYPE=Release

REM Navigate to the project directory
cd %PROJECT_DIR%

REM Create a build directory if it doesn't exist
if not exist build mkdir build
cd build

REM Run CMake for the project with a custom install prefix
%CMAKE_PATH% -G "Visual Studio 16 2019" -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -DCMAKE_INSTALL_LIBDIR=lib -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ../install_cmake

REM Optionally, build the project using CMake
%CMAKE_PATH% --build . --config %BUILD_TYPE%

REM Optionally, install the project to the specified install directory
%CMAKE_PATH% --install . --config %BUILD_TYPE%

echo Done!
pause
