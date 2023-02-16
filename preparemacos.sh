#!/bin/bash

mkdir hardwario-code
curl -o macOS/hardwario-code-macos.zip --ssl-no-revoke -LO "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal" 
unzip macOS/hardwario-code-macos.zip

chmod +x createDataFolder.sh
export SYSTEM=macOS
./createDataFolder.sh
mv macOS/code-portable-data hardwario-code/ 

xattr -dr com.apple.quarantine Visual\ Studio\ Code.app
mv Visual\ Studio\ Code.app hardwario-code/Visual\ Studio\ Code.app
chmod -R 777 hardwario-code/
ls hardwario-code

./hardwario-code/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension cschlosser.doxdocgen
./hardwario-code/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension marus25.cortex-debug
./hardwario-code/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension ms-vscode.cpptools
./hardwario-code/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension ms-vscode.cpptools-themes
./hardwario-code/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension twxs.cmake
./hardwario-code/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code --install-extension HARDWARIO.hardwario-tower
rm -rf hardwario-code/code-portable-data/.init-default-profile-extensions
rm -rf hardwario-code/code-portable-data/extensions.json