# NOTE: COVERITY_PROJECT environment variable must be set.
# VERSION environment variable must be set before.

echo "*-*-*-*-*-* PREPARE RELEASE STARTED -*-*-*-*-*-"

mkdir ..\..\release
# mv MAX25621EvKitGUI\bin\Release\MAX25621EvKitGUI.exe release\MAX25621EvKitGUI_v${env:VERSION}.exe
#mv ..\..\Installer\Output\*.exe ..\..release\MAX25621EvKitGUI_v${env:VERSION}.exe
cp ..\..\Installer\Output\*.exe . # will be change to line above when env injection issue is resolved
mv *.exe ..\..\release\MAX25621EvKitGUI_v${env:VERSION}.exe

echo "*-*-*-*-*-* PREPARE RELEASE FINISHED -*-*-*-*-*-"