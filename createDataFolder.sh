#!/bin/bash

echo $SYSTEM

if [ "$SYSTEM" == "Windows" ]
then
    gdown --folder 1ghFE4mj3SH7IeimRbtV-ThPadB-HMaxI
    mv Windows/JLink_Windows_* Windows/data/tower/toolchain/jlink.exe
    mkdir Windows/data/tower/toolchain/SEGGER
    mkdir Windows/data/tower/toolchain/SEGGER/JLink
    7z x Windows/data/tower/toolchain/jlink.exe -oWindows/data/tower/toolchain/SEGGER/JLink -r

    curl -o Windows/data/tower/toolchain/cmake.zip --ssl-no-revoke -LO "https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2-windows-x86_64.zip" 
    unzip -o Windows/data/tower/toolchain/cmake.zip -d Windows/data/tower/toolchain/

    curl -o Windows/data/tower/toolchain/gcc.zip --ssl-no-revoke -LO "https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi.zip" 
    7z x Windows/data/tower/toolchain/gcc.zip -oWindows/data/tower/toolchain/ -r

    mkdir Windows/data/tower/toolchain/ninja
    curl -o Windows/data/tower/toolchain/ninja.zip --ssl-no-revoke -LO "https://github.com/ninja-build/ninja/releases/download/v1.11.1/ninja-win.zip" 
    7z x Windows/data/tower/toolchain/ninja.zip -oWindows/data/tower/toolchain/ -r

    mkdir Windows/data/tower/toolchain/git
    curl -o Windows/data/tower/toolchain/git.7z.exe --ssl-no-revoke -LO "https://github.com/git-for-windows/git/releases/download/v2.39.1.windows.1/PortableGit-2.39.1-64-bit.7z.exe" 
    7z x Windows/data/tower/toolchain/git.7z.exe -oWindows/data/tower/toolchain/git/ -r

    mv Windows/data/tower/toolchain/cmake-* Windows/data/tower/toolchain/cmake
    mv Windows/data/tower/toolchain/arm-* Windows/data/tower/toolchain/gcc
    mv Windows/data/tower/toolchain/ninja.exe Windows/data/tower/toolchain/ninja/ninja.exe
fi