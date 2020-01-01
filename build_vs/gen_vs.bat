@echo off

set BUILD_DIR=build_vs2013x64

set CMAKE_FLAGS=Visual Studio 12 2013 Win64

if not exist %BUILD_DIR% md %BUILD_DIR%

cd %BUILD_DIR%

cmake -G "%CMAKE_FLAGS%" ../..

cd ..

pause