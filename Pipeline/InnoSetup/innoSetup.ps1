# INNOSETUP
# Variables must be set appropriate for the project.



$ENV_INNO_PARTNUMBER="MAX25621"
$ENV_INNO_MAJOR_VERSION="${env:VERSION_MAJOR}"
$ENV_INNO_MINOR_VERSION="${env:VERSION_MINOR}"
$ENV_INNO_PATCH_VERSION="${env:BUILD_NUMBER}"
$ENV_INNO_OUTPUT_PATH="${env:WORKSPACE}\MAX25621EvKitGUI\bin\Release\net6.0-windows\publish\win-x86\"
$ENV_INNO_EXE_NAME="MAX25621EvKitGUI.exe"
$ENV_INNO_DOT_NET_SETUP_NAME="NDP472-KB4054531-Web.exe"
$ENV_INNO_DRIVER_PATH="${env:WORKSPACE}\Installer\drivers"
$ENV_INNO_WIN32_DRIVER_EXE_NAME="null"
$ENV_INNO_WIN64_DRIVER_EXE_NAME="null"



$TargetPath="${ENV_INNO_OUTPUT_PATH}\${ENV_INNO_EXE_NAME}"



& "C:\Signing\signtool.exe" sign /f "C:\Signing\maxim_integrated_products_inc.pfx" /p "goldeNcaTplayswcalicocat160RioRobles" /tr http://timestamp.digicert.com /fd sha256 /td sha256 /v "${TargetPath}"



& "C:\Program Files (x86)\Inno Setup 6\ISCC.exe" /DINNO_PARTNUMBER=${ENV_INNO_PARTNUMBER} /DINNO_MAJOR_VERSION=${ENV_INNO_MAJOR_VERSION} /DINNO_MINOR_VERSION=${ENV_INNO_MINOR_VERSION} /DINNO_PATCH_VERSION=${ENV_INNO_PATCH_VERSION} /DINNO_OUTPUT_PATH=${ENV_INNO_OUTPUT_PATH} /DINNO_EXE_NAME=${ENV_INNO_EXE_NAME} /DINNO_DOT_NET_SETUP_NAME=${ENV_INNO_DOT_NET_SETUP_NAME} /DINNO_DRIVER_PATH=${ENV_INNO_DRIVER_PATH} /DINNO_WIN32_DRIVER_EXE_NAME=${ENV_INNO_WIN32_DRIVER_EXE_NAME} /DINNO_WIN64_DRIVER_EXE_NAME=${ENV_INNO_WIN64_DRIVER_EXE_NAME} "/Ssigntool=C:\Signing\signtool.exe sign /f C:\Signing\maxim_integrated_products_inc.pfx /p goldeNcaTplayswcalicocat160RioRobles /tr http://timestamp.digicert.com /fd sha256 /td sha256 `$f" "${env:WORKSPACE}\Installer\installer.iss"