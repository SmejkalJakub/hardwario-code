#!/bin/bash

echo $SYSTEM

if [ "$SYSTEM" == "Windows" ]
then
    JLINK_LINK="https://www.segger.com/downloads/jlink/JLink_Windows_x86_64.exe"
    CMAKE_LINK="https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2-windows-x86_64.zip"
    GCC_LINK="https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-mingw-w64-i686-arm-none-eabi.zip"
    NINJA_LINK="https://github.com/ninja-build/ninja/releases/download/v1.11.1/ninja-win.zip"
    GIT_LINK="https://github.com/git-for-windows/git/releases/download/v2.39.1.windows.1/PortableGit-2.39.1-64-bit.7z.exe"

    curl -X POST -d "accept_license_agreement=accepted&non_emb_ctr=confirmed&submit=Download+software" -o ${SYSTEM}/data/tower/toolchain/jlink.exe --ssl-no-revoke -LO ${JLINK_LINK}
    mkdir ${SYSTEM}/data/tower/toolchain/SEGGER
    mkdir ${SYSTEM}/data/tower/toolchain/SEGGER/JLink
    7z x ${SYSTEM}/data/tower/toolchain/jlink.exe -o${SYSTEM}/data/tower/toolchain/SEGGER/JLink -r -y

    curl -o ${SYSTEM}/data/tower/toolchain/cmake.zip --ssl-no-revoke -LO ${CMAKE_LINK}
    7z x ${SYSTEM}/data/tower/toolchain/cmake.zip  -o${SYSTEM}/data/tower/toolchain/ -r -y

    curl -o ${SYSTEM}/data/tower/toolchain/gcc.zip --ssl-no-revoke -LO ${GCC_LINK}
    7z x ${SYSTEM}/data/tower/toolchain/gcc.zip -o${SYSTEM}/data/tower/toolchain/ -r -y

    mkdir ${SYSTEM}/data/tower/toolchain/ninja
    curl -o ${SYSTEM}/data/tower/toolchain/ninja.zip --ssl-no-revoke -LO ${NINJA_LINK}
    7z x ${SYSTEM}/data/tower/toolchain/ninja.zip -o${SYSTEM}/data/tower/toolchain/ninja -r -y

    mkdir ${SYSTEM}/data/tower/toolchain/git
    curl -o ${SYSTEM}/data/tower/toolchain/git.7z.exe --ssl-no-revoke -LO ${GIT_LINK}
    7z x ${SYSTEM}/data/tower/toolchain/git.7z.exe -o${SYSTEM}/data/tower/toolchain/git/ -r -y

    mv ${SYSTEM}/data/tower/toolchain/cmake-* ${SYSTEM}/data/tower/toolchain/cmake
    mv ${SYSTEM}/data/tower/toolchain/arm-* ${SYSTEM}/data/tower/toolchain/gcc

    find ${SYSTEM}/data/tower/toolchain/ -maxdepth 1 -type f -exec rm "{}" \;
fi

if [ "$SYSTEM" == "Linux" ]
then
    JLINK_LINK="https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.tgz"
    CMAKE_LINK="https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2-linux-x86_64.tar.gz"
    GCC_LINK="https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-arm-none-eabi.tar.xz"
    NINJA_LINK="https://github.com/ninja-build/ninja/releases/download/v1.11.1/ninja-linux.zip"

    curl -X POST -d "accept_license_agreement=accepted&non_emb_ctr=confirmed&submit=Download+software" -o ${SYSTEM}/data/tower/toolchain/jlink.tgz --ssl-no-revoke -LO ${JLINK_LINK}
    mkdir ${SYSTEM}/data/tower/toolchain/SEGGER
    tar -xvzf ${SYSTEM}/data/tower/toolchain/jlink.tgz -C ${SYSTEM}/data/tower/toolchain/SEGGER/

    curl -o ${SYSTEM}/data/tower/toolchain/cmake.tar.gz --ssl-no-revoke -LO ${CMAKE_LINK}
    tar -xvzf ${SYSTEM}/data/tower/toolchain/cmake.tar.gz -C ${SYSTEM}/data/tower/toolchain/

    curl -o ${SYSTEM}/data/tower/toolchain/gcc.tar.xz --ssl-no-revoke -LO ${GCC_LINK}
    tar -xf ${SYSTEM}/data/tower/toolchain/gcc.tar.xz -C ${SYSTEM}/data/tower/toolchain/

    mkdir ${SYSTEM}/data/tower/toolchain/ninja
    curl -o ${SYSTEM}/data/tower/toolchain/ninja.zip --ssl-no-revoke -LO ${NINJA_LINK}
    7z x ${SYSTEM}/data/tower/toolchain/ninja.zip -o${SYSTEM}/data/tower/toolchain/ninja -r -y

    mv ${SYSTEM}/data/tower/toolchain/SEGGER/JLink_* ${SYSTEM}/data/tower/toolchain/SEGGER/JLink
    mv ${SYSTEM}/data/tower/toolchain/cmake-* ${SYSTEM}/data/tower/toolchain/cmake
    mv ${SYSTEM}/data/tower/toolchain/arm-* ${SYSTEM}/data/tower/toolchain/gcc

    find ${SYSTEM}/data/tower/toolchain/ -maxdepth 1 -type f -exec rm "{}" \;
fi

if [ "$SYSTEM" == "macOS" ]
then
    JLINK_LINK="https://www.segger.com/downloads/jlink/JLink_Linux_x86_64.tgz"
    CMAKE_LINK="https://github.com/Kitware/CMake/releases/download/v3.25.2/cmake-3.25.2-macos-universal.tar.gz"
    GCC_LINK="https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-darwin-x86_64-arm-none-eabi.tar.xz"
    NINJA_LINK="https://github.com/ninja-build/ninja/releases/download/v1.11.1/ninja-mac.zip"

    curl -X POST -d "accept_license_agreement=accepted&non_emb_ctr=confirmed&submit=Download+software" -o ${SYSTEM}/code-portable-data/tower/toolchain/jlink.pkg --ssl-no-revoke -LO "https://www.segger.com/downloads/jlink/JLink_MacOSX_universal.pkg"
    ls ${SYSTEM}/code-portable-data/tower/toolchain/
    pkgutil --expand-full ${SYSTEM}/code-portable-data/tower/toolchain/jlink.pkg ${SYSTEM}/code-portable-data/tower/toolchain/SEGGER/

    ls ${SYSTEM}/code-portable-data/tower/toolchain/SEGGER

    curl -o ${SYSTEM}/code-portable-data/tower/toolchain/cmake.tar.gz --ssl-no-revoke -LO ${CMAKE_LINK}
    tar -xvzf ${SYSTEM}/code-portable-data/tower/toolchain/cmake.tar.gz -C ${SYSTEM}/code-portable-data/tower/toolchain/

    curl -o ${SYSTEM}/code-portable-data/tower/toolchain/gcc.tar.xz --ssl-no-revoke -LO ${GCC_LINK}
    tar -xf ${SYSTEM}/code-portable-data/tower/toolchain/gcc.tar.xz -C ${SYSTEM}/code-portable-data/tower/toolchain/

    mkdir ${SYSTEM}/code-portable-data/tower/toolchain/ninja
    curl -o ${SYSTEM}/code-portable-data/tower/toolchain/ninja.zip --ssl-no-revoke -LO ${NINJA_LINK}
    7z x ${SYSTEM}/code-portable-data/tower/toolchain/ninja.zip -o${SYSTEM}/code-portable-data/tower/toolchain/ninja -r -y

    #mv ${SYSTEM}/code-portable-data/tower/toolchain/SEGGER/JLink_* ${SYSTEM}/code-portable-data/tower/toolchain/SEGGER/JLink
    mv ${SYSTEM}/code-portable-data/tower/toolchain/cmake-* ${SYSTEM}/code-portable-data/tower/toolchain/cmake
    mv ${SYSTEM}/code-portable-data/tower/toolchain/arm-* ${SYSTEM}/code-portable-data/tower/toolchain/gcc

    find ${SYSTEM}/code-portable-data/tower/toolchain/ -maxdepth 1 -type f -exec rm "{}" \;
fi