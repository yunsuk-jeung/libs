@echo off
REM Set the paths
set CMAKE_PATH="C:\Program Files\CMake\bin\cmake.exe"
set SCRIPT_DIR=%~dp0
set PROJECT_DIR=%SCRIPT_DIR%\..\opencv3_4_20
set INSTALL_DIR=%PROJECT_DIR%\..\libs_win\opencv3_4_20
set VS_VERSION="Visual Studio 17 2022"

set BUILD_TYPE=%1
echo Received BUILD_TYPE: %BUILD_TYPE%

set "source_path=%SCRIPT_DIR%\OpenCVDetectTBB3.cmake"
set "destination_path=%PROJECT_DIR%\cmake\OpenCVDetectTBB.cmake"

copy "%source_path%" "%destination_path%"
if errorlevel 1 (
     echo failed to change cmake file. error code: %errorlevel%
) else (
    echo chaned cmake file.
)

REM Navigate to the project directory
cd %PROJECT_DIR%

REM Create a build directory if it doesn't exist
if not exist %PROJECT_DIR%\build mkdir %PROJECT_DIR%\build
cd %PROJECT_DIR%\build

IF EXIST CMakeCache.txt DEL /F CMakeCache.txt

REM Run CMake for the project with a custom install prefix
%CMAKE_PATH% -G %VS_VERSION% -DCMAKE_INSTALL_PREFIX=%INSTALL_DIR% -DCMAKE_BUILD_TYPE=%BUILD_TYPE% ^
-D CMAKE_PREFIX_PATH=%SCRIPT_DIR%\..\libs_win\tbb_2021_11_0_rc1\lib\cmake\TBB ^
-D BUILD_TBB=ON ^
-D WITH_TBB=ON ^
-D WITH_VTK=ON ^
-D BUILD_opencv_python=OFF ^
-D BUILD_opencv_python2=OFF ^
-D BUILD_opencv_python3=OFF ^
-D BUILD_JAVA=OFF ^
-D OPENCV_EXTRA_MODULES_PATH=%PROJECT_DIR%\..\opencv_contrib3_4_20\modules ^
-D BUILD_ANDROID_PROJECTS=OFF ^
-D BUILD_EXAMPLES=OFF ^
-D BUILD_PERF_TESTS=OFF ^
-D BUILD_TESTS=OFF ^
-D BUILD_PERF_TESTS=OFF ^
-D BUILD_SHARED_LIBS=OFF ^
-D BUILD_WITH_STATIC_CRT=OFF ^
-D BUILD_FAT_JAVA_LIB=OFF ^
-D OPENCV_ENABLE_NONFREE=ON ^
-D BUILD_opencv_apps=OFF ^
-D BUILD_opencv_world=ON ^
..

REM Optionally, build the project using CMake
%CMAKE_PATH% --build . --config %BUILD_TYPE%

REM Optionally, install the project to the specified install directory
%CMAKE_PATH% --install . --config %BUILD_TYPE%