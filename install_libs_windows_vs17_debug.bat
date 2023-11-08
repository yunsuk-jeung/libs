@echo off

set CURR_DIR=%~dp0
set BUILD_TYPE=Debug

@REM cd %CURR_DIR%
@REM call win_scripts\install_eigen3_3_7.bat %BUILD_TYPE%
@REM echo Eigen Done!

@REM cd %CURR_DIR%
@REM call win_scripts\intsall_tbb_2021_11_0_rc1.bat %BUILD_TYPE%
@REM echo spdlog Done!

@REM cd %CURR_DIR%
@REM call win_scripts\intsall_spdlog1_12_0.bat %BUILD_TYPE%
@REM echo intsall_spdlog1_12_0 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\intsall_json3_11_2.bat %BUILD_TYPE%
@REM echo intsall_json3_11_2 Done!

@REM cd %CURR_DIR%
@REM call win_scripts\intsall_opencv3_4_20.bat %BUILD_TYPE%
@REM echo intsall_opencv3_4_20 Done!

cd %CURR_DIR%
call win_scripts\install_boost_1_78_0.bat %BUILD_TYPE%
echo install_boost_1_78_0 Done!

pause
